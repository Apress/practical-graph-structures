--Load a copy of AdventureworksLT2019. I use the LT version because it has integer key values which make this process a lot easier. If I was loading data from a database with GUID key values, or even multi-part key values, I would create staging tables with an identity key value to map to temporarily.
GO

USE AdventureWorksLT2019
GO
--Ok, once I have that database, I will be creating a simple graph of Customer->Purchased->Product from the data. I will include a Label column for each node, and a purchase date on the edge. I won't put a uniqueness constraint on the edge because the goal is primarily to show the loading method. ** Note that I will reuse this data for other examples (though I am not sure whether I will or not yet, I expect to.) Hence, there definitely could be multiple rows for different customer to product relationships.

--For some kinds of analysis, it would be fine to aggregate the edge so that from and to are unique, but for now I just want to create the data in a straightforward manner.

CREATE SCHEMA SalesGraph; --I am buiding in the Adventure WOrks LT Database as an add on.
GO

--Note I do include a key back to the relational table, because it will be useful for fetching additional information after you have fetched a set of data. You can tune the amount of data you need in your graph tables to your needs if you are putting the graph in the same database with a relational copy of the data.

CREATE TABLE SalesGraph.Customer
(
	CustomerId INT NOT NULL
		CONSTRAINT PKCustomer PRIMARY KEY,
	Label NVARCHAR(100) NOT NULL 
		CONSTRAINT AKCustomer UNIQUE
) AS NODE;
CREATE TABLE SalesGraph.Product
(
	ProductId INT NOT NULL
		CONSTRAINT PKProduct PRIMARY KEY,
	Label NVARCHAR(100) NOT NULL 
		CONSTRAINT AKProduct UNIQUE
) AS NODE;
/*
Next the edge is created. In the edge, the key from the table in the database where it came from is included, along with the time the item was purchased, which can definitely be useful in your analysis.
*/

CREATE TABLE SalesGraph.Purchased
(
	SalesOrderDetailId int NOT NULL CONSTRAINT AKPurchased UNIQUE,
	PurchaseTime datetime2(0) NOT NULL
) AS EDGE;

--To load the SalesGraph.Customer node data, we could just use the following query:

--customerID added to label for uniqueness... why there
--is duplication is beyond this exercise's needs
INSERT INTO SalesGraph.Customer WITH (TABLOCKX)
(
    CustomerId, Label
)
SELECT CustomerID,
       CONCAT(FirstName, ' ', LastName, ' ', CustomerID) AS Label
FROM SalesLT.Customer
ORDER BY Label;


SELECT TOP 2
       $node_id,
       CustomerId
FROM SalesGraph.Customer;


/*
{"type":"node","schema":"SalesGraph","table":"Customer","id":1509}                                                                                                                                                                                               146
{"type":"node","schema":"SalesGraph","table":"Customer","id":1510}                                                                                                                                                                                               29580
*/

--There are two different ID values. This is typically ok, but when we start to load the edge, if we could predict the values we wouldn't need to look them up, letting us load data far faster.

--Luckily, you can compose the JSON yourself, and even better they have provided you the tools to do so as part of the functions provided. Assuming you are loading in copies of data (possibly for analysis, possibly for a first time load), and that you don't use values approaching max bigint (a very large number indeed), then you can save a lot of processing time.

--this is a techinique I use regularly for sample data because I can load a tree database using different processing styles very quickly.

TRUNCATE TABLE SalesGraph.Customer;

--The NODE_ID_FROM_PARTS function takes an object_id and an integer that will become the graph_id.  The following query shows you that the customerId now matches the graph id. The object_id that you pass in must match an object_id in the graph tables or the output will be null, so you cannot manufacture bad data using this method.

SELECT NODE_ID_FROM_PARTS(OBJECT_ID('SalesGraph.Customer'), 
                                                     CustomerID),
       CustomerID,
       CONCAT(FirstName, ' ', LastName, ' ', CustomerID) AS LABEL
FROM SalesLT.Customer;


--Look at the output and you will see that the data matches surrogate key to surrogate key. Now you can insert values into the $node_id.

INSERT INTO SalesGraph.Customer
(
    $Node_id, CustomerId,Label
)
SELECT NODE_ID_FROM_PARTS(OBJECT_ID('SalesGraph.Customer'), 
                                                     CustomerID),
       CustomerID,
       CONCAT(FirstName, ' ', LastName, ' ', CustomerID) AS LABEL
FROM SalesLT.Customer;
GO

--and the same for product (same duplicate name concern as for customer)

INSERT INTO SalesGraph.Product
(
    $Node_id, ProductId, Label
)
SELECT NODE_ID_FROM_PARTS(OBJECT_ID('SalesGraph.Product'), 
                                                 ProductID),
       ProductID,
       CONCAT(Name, ' ', ProductID) AS LABEL
FROM SalesLT.Product;

--now we take this following query that you would use to get the customer and product that was purchased

SELECT SalesOrderDetail.SalesOrderDetailId,
		OrderDate as PurchaseTime,
		ProductId, CustomerId
from   SalesLT.SalesOrderHeader
		jOIN SalesLT.SalesOrderDetail
			on SalesOrderHeader.SalesORderId = 
				SalesOrderDetail.SalesORderId;

--Then pretty simply just create the data in the table with the composed json values:

INSERT INTO SalesGraph.Purchased
(
    SalesOrderDetailId, PurchaseTime,
	$from_id,$to_id
)
SELECT SalesOrderDetail.SalesOrderDetailID,
       OrderDate AS PurchaseTime,
       NODE_ID_FROM_PARTS(OBJECT_ID('SalesGraph.Customer'), 
                                                  CustomerID),
       NODE_ID_FROM_PARTS(OBJECT_ID('SalesGraph.Product'), 
                                                   ProductID)
FROM SalesLT.SalesOrderHeader
    JOIN SalesLT.SalesOrderDetail
        ON SalesOrderHeader.SalesOrderID = SalesOrderDetail.SalesOrderID;


--Now you can see all the data using the following query:
SELECT Customer.Label, Product.Label
FROM   SalesGraph.Customer, SalesGraph.Purchased, SalesGraph.Product
WHERE MATCH(Customer-(Purchased)->Product)

--One note, the graph queries we have created to insert data can be executed in any order. Missing parent data causes confusion. For example, clear out the Customer and Product objects

TRUNCATE TABLE SalesGraph.Customer;
TRUNCATE TABLE SalesGraph.Product;

--Then rerun the SELECT statement with the MATCH clause you just executed. You still get the same number of rows, but now all the label values are NULL. After initially loading the data with your own key values, it is highly suggested to add an edge constraint to clean up/prevent dangling references.

--if you truncate the data in the SalesGraph.Purchased object, things will be cleaned up. But note, you can run the INSERT statement that creates the edge rows only and it does not validate that the id values are valid, only the object you claim they are going to.

TRUNCATE TABLE SalesGraph.Purchased;

--As the final example, truncate all the purchased table again. Then go ahead and drop the customer and product tables.

DROP TABLE IF EXISTS SalesGraph.Customer, SalesGraph.Product;

--if you try to insert the data now:

INSERT INTO SalesGraph.Purchased(SalesOrderDetailId, PurchaseTime,
 $from_id, $to_id)
SELECT SalesOrderDetail.SalesOrderDetailId,
		OrderDate as PurchaseTime,
		NODE_ID_FROM_PARTS(OBJECT_ID('SalesGraph.Customer'), CustomerId),
		NODE_ID_FROM_PARTS(OBJECT_ID('SalesGraph.Product'), ProductId)
from   SalesLT.SalesOrderHeader
		jOIN SalesLT.SalesOrderDetail
			on SalesOrderHeader.SalesORderId = 
				SalesOrderDetail.SalesORderId

--You get the following error:
/*
Msg 515, Level 16, State 2, Line 125
Cannot insert the value NULL into column 'from_obj_id_75C28A838F1D4D618BB8C1957919208E', table 'AdventureWorksLT2019.SalesGraph.Purchased'; column does not allow nulls. INSERT fails.

Which the first time you do might be a little bit confusing. It just means it tried to insert the two values and the object_id provided was bad.
*/

SELECT OBJECT_ID('SalesLT.Customer'),
       NODE_ID_FROM_PARTS(OBJECT_ID('SalesLT.Customer'), 1)
