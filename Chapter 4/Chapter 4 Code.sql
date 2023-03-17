----------------------------------------------------------------------------------------------------------
--********************************************************************************************************
--SQL Graph Table Extended Topics
--********************************************************************************************************
----------------------------------------------------------------------------------------------------------



--In this chapter I will be expanding on chapter 3 code, altering the database we created. 
--

----------------------------------------------------------------------------------------------------------
--********************************************************************************************************
--Advanced Data Creation Techniques
--********************************************************************************************************
----------------------------------------------------------------------------------------------------------


USE TestGraph
GO

--Making data entry more natural

--interface to make the view easier to view

----------------------------------------------------------------------------------------------------------
--INSERT
----------------------------------------------------------------------------------------------------------


IF SCHEMA_ID('Network_UI') IS NULL 
	EXEC ('CREATE SCHEMA Network_UI')
GO

CREATE OR ALTER VIEW Network_UI.Person_Follows_Person
AS
SELECT Person.PersonId AS PersonId,
		FollowedPerson.PersonId AS FollowsPersonId, 
       Follows.Value AS Value
FROM Network.Person,
     Network.Follows,
     Network.Person AS FollowedPerson
WHERE MATCH(Person-(Follows)->FollowedPerson);
GO
SELECT Person_Follows_Person.PersonId,
       Person_Follows_Person.FollowsPersonId,
       Person_Follows_Person.Value
FROM  Network_UI.Person_Follows_Person
GO

--now I am going to create an instead of trigger to make an object that looks like a tabl that uses "normal" columns, which will make it a lot easier later in the book to load lots of data into a table without dealing with all of the translation to graph key values.

--Some of the examples in this section don't look like we are saving anything (because I am going to have to lookup the regular key just like the graph values, but later when loading data from existing many-to-many relationships. It will turn out to be kind of remarkably fast, as I will demonstrate in the large network chapter (#?).

CREATE OR ALTER TRIGGER Network_UI.Person_FollowsPerson_$InsteadOfInsertTrigger
ON Network_UI.Person_Follows_Person
INSTEAD OF INSERT
AS
SET NOCOUNT ON;
 --If you add more code, you should add error handling code.
 BEGIN 
  INSERT INTO Network.Follows($from_id, $to_id, Value)
  SELECT Person.$node_id, FollowedPerson.$node_id, 
		inserted.Value
  FROM Inserted
       JOIN Network.Person
           ON Person.PersonId = Inserted.PersonId
       JOIN Network.Person AS FollowedPerson
           ON FollowedPerson.PersonId = Inserted.FollowsPersonId
 END;
GO

--now I can insert new data, and write quick queries using regular joins.

SELECT Person.Name, FollowedPerson.Name AS FollowedPerson
FROM   Network_UI.Person_Follows_Person as Follows
		JOIN Network.Person
			ON Person.PersonId = Follows.PersonId
		JOIN Network.Person AS FollowedPerson
			ON FollowedPerson.PersonId = Follows.FollowsPersonId
WHERE  Person.Name = 'Lou Iss'

--Take care becaus while this will be pretty fast on your small data set, there are a few extra hops involved in the interals of this query. Use the MATCH and the proper table as often as possible.

--Looking at the query plan too, you will notice a HASH JOIN operator. Later in the chapter we will look at adding indexes to your node and edge objects. While there is a lot different about the node and edge objects, there are a lot of similarities too, and you will need to take some control over performance tuning based on how you use your objects.

/*
While there is a lot different in how you work with node and edge objects, there are a lot of similarities too, and you will need to take some control over performance tuning based on how you use your objects. As noted, using this view ?isn't a big value for querying, but if I had a table of the id values to turn into a graph it would rock.
To demonstrate, I will insert a row using the surrogate key values found by running these queries:
*/
SELECT Person.PersonId  AS PersonId
 FROM Network.Person 
 WHERE Person.Name = 'Lou iss';
SELECT Person.PersonId  AS FollowsPersonId
FROM Network.Person 
WHERE Person.Name = 'Joe Seph';

/*
Take the values returned, and use them in the following query, for me, the values are 2 and 6. So we insert the new row using the following statement:
*/
INSERT INTO Network_UI.Person_Follows_Person
      (PersonId,FollowsPersonId,Value)
VALUES (2, 6, 10);  


SELECT Person.Name, FollowsPerson.Name AS FollowedPerson
FROM  Network.Person, Network.Follows,
	  Network.Person AS FollowsPerson
WHERE MATCH(Person-(Follows)->FollowsPerson)
 AND Person.Name = 'Lou Iss';
 
 

----------------------------------------------------------------------------------------------------------
--UPDATE
----------------------------------------------------------------------------------------------------------

--
--As I should have said earlier, edge objects cannot have their $from_id or $to_id values updated. And this makes good sense. but let's say you want to update the value to be 1, to match all of our other data.


UPDATE Network_UI.Person_Follows_Person
SET Person_Follows_Person.Value = 1
WHERE PersonId = (SELECT Person.PersonId 
                  FROM Network.Person 
                  WHERE Person.Name = 'Lou iss')
and Person_Follows_Person.FollowsPersonId = 
                  (SELECT Person.PersonId 
				  FROM Network.Person 
				  WHERE Person.Name = 'Joe Seph')
GO

--this works great because you are only updating data from one table in your update. Any attempt to change the key values will fail as:
UPDATE Network_UI.Person_Follows_Person
set Person_Follows_Person.Value = 1,
    Person_Follows_Person.PersonId = 0

/*
Returns:

Msg 4405, Level 16, State 1, Line 85
View or function 'Network_UI.Person_Follows_Person' is not updatable because the modification affects multiple base tables.

*/

UPDATE Network_UI.Person_Follows_Person
SET Person_Follows_Person.PersonId = 0;


--If you desire to update the values, it is definitely doable in an instead of trigger (requiring a delete and an insert, which should definitely have more involved error handling), but I would not suggest it personally. 

----------------------------------------------------------------------------------------------------------
--DELETE
----------------------------------------------------------------------------------------------------------


--Deletes however, make perfect sense, but definitely need a trigger because it will appear as if you want to delete rows from multiple tables.

DELETE FROM Network_UI.Person_Follows_Person
WHERE PersonId = (SELECT Person.PersonId 
                  FROM Network.Person 
                  WHERE Person.Name = 'Lou iss')
AND Person_Follows_Person.FollowsPersonId = 
                 (SELECT Person.PersonId 
                  FROM Network.Person 
                  WHERE Person.Name = 'Joe Seph');

--Just as before, same error 4405.  So let's build a simple instead of delete trigger object. The weird question here is "what will deleted contain?". Let's see

CREATE OR ALTER TRIGGER Network_UI.Person_Follows_Person$InsteadOfDeleteTrigger
ON Network_UI.Person_Follows_Person
INSTEAD OF DELETE
AS
SET NOCOUNT ON;
 --If you add more code, you should add error handling code.
 BEGIN 
  SELECT *
  FROM   Deleted
 END;
GO

--Note, if this doesn't work for you, check the settings noted in this article: https://docs.microsoft.com/en-us/sql/database-engine/configure-windows/disallow-results-from-triggers-server-configuration-option?view=sql-server-ver16. Worst case you might have to let the trigger create a table with the results. It is clearly best to not have results from normal triggers, but it is very useful in a development case to be able to see what is being output.

--execute the following statement, and you will see that the deleted table contains the data from the view.

DELETE FROM Network_UI.Person_Follows_Person
WHERE PersonId = (   SELECT Person.PersonId
                     FROM   Network.Person
                     WHERE  Person.Name = 'Lou iss')
    AND Person_Follows_Person.FollowsPersonId = 
	             (   SELECT Person.PersonId
                     FROM   Network.Person
                     WHERE  Person.Name = 'Joe Seph');
/*
PersonId    FollowsPersonId Value
----------- --------------- -----------
2           6               1

So we can write the trigger just like this:
*/

CREATE OR ALTER TRIGGER Network_UI.Person_Follows_Person$InsteadOfDeleteTrigger
ON Network_UI.Person_Follows_Person
INSTEAD OF DELETE
AS
SET NOCOUNT ON;
 --If you add more code, you should add error handling code.
 BEGIN 
  DELETE FROM Network.Follows --<The real table
  FROM Network.Person, Network.Follows,
       Network.Person AS FollowedPerson,
	   deleted
  --MATCH, then join to deleted to reduce the set to
  --rows being deleted.
  WHERE MATCH(Person-(Follows)->FollowedPerson)
    and  deleted.PersonId = Person.PersonId
	and  deleted.FollowsPersonId = FollowedPerson.PersonId
 END;
GO

--Now you can delete the data in a straightforward manner (I will use the Id values we got from the query earlier)

DELETE FROM Network_UI.Person_Follows_Person
where Person_Follows_Person.PersonId = 2
and Person_Follows_Person.FollowsPersonId = 6;

--after deleting in the rows, you can see the row is gone. Be sure and test with creating and deleting multiple rows when you build triggers.

SELECT Person.Name AS PersonName,
		FollowedPerson.Name AS FollowsPersonName
FROM Network.Person,
     Network.Follows,
     Network.Person AS FollowedPerson
WHERE MATCH(Person-(Follows)->FollowedPerson)
  AND Person.Name = 'Lou Iss';


  ----------------------------------------------------------------------------------------------------------
  --*****
  --Loading data using composable JSON tags
  --*****
  ----------------------------------------------------------------------------------------------------------
--Note: This code is located in the Chapter 4 AdventureworksLT.sql file


----------------------------------------------------------------------------------------------------------
--********************************************************************************************************
--Heterogenous queries. 
--********************************************************************************************************
----------------------------------------------------------------------------------------------------------
--

--So far in the book, we have only kept the only pattern of usage for our designs to be one many to many relationship between just two nodes. Either the table was the same (Person Follows Person) or different (Person ProgramsWith ProgrammingLanguage). In this section I want to highlight the idea that you can have multiple relationships through one edge, and how you can query the nodes.

--As an example, I am going to add another set of nodes to the sample graph. Going to call it Location. Then I will create edge values in the Follows edge. (Not that this makes sense, which is part of the point).

--Figure 4 or whatever :)


CREATE TABLE Network.Location
(
    LocationId INT NOT NULL IDENTITY,
    Name NVARCHAR(20) NOT NULL
        CONSTRAINT AKLocation UNIQUE
) AS NODE;

INSERT INTO Network.Location(    Name)
VALUES ('Here'),('There');
GO
--Now I am going to associate the new rows with the items as shown on the diagram.

WITH Here
AS (SELECT Person.$node_id AS node_id
    FROM Network.Person
    WHERE Person.Name IN ( 'Fred Rick', 'Lou Iss', 'Joe Seph' ))

INSERT INTO Network.Follows
(  $from_id, $to_id, Value)
SELECT Here.node_id,
       Location.$node_id,
       1
FROM Here
    CROSS JOIN Network.Location
WHERE Location.Name = 'Here';

WITH There
AS (SELECT Person.$node_id AS node_id
    FROM Network.Person
    WHERE Person.Name IN ( 'Saa Lee', 'Lee Roy', 'Day Vid' ))

INSERT INTO Network.Follows
(  $from_id, $to_id, Value)
SELECT There.node_id,
       Location.$node_id,
       1
FROM There
    CROSS JOIN Network.Location
WHERE Location.Name = 'There';	

--Now you can see the rows we created like this:
SELECT Person.Name, Location.Name
FROM   Network.Person, Network.Follows, Network.Location
WHERE  Match(Person-(Follows)->Location);




--In the following query, we see the locations and people that Lou Iss is connected to through the Network.Follows edge.
SELECT Person.Name,
       Nodes.ObjectName,
       Nodes.Name
FROM Network.Person,
     Network.Follows,
(
    SELECT 'Location' AS ObjectName,
           Location.Name
    FROM Network.Location
    UNION ALL
    SELECT 'Person',
           Name
    FROM Network.Person
) AS Nodes
WHERE MATCH(Person-(Follows)->Nodes)
            AND Person.Name = 'Lou Iss';


--This returns 
/*
Name		ObjectName	Name
----------- ----------- ------------
Lou Iss	    Person	    Saa Lee
Lou Iss		Person		Val Erry
Lou Iss		Location	Here

What is interesting in this model is that the graph objects carry along their graph identifiers whether you put them out there or not, and will generally be available for uses in graph queries, but if you want them to be accessible in other uses (like to use in an IN expression.)

However, once you fetch the rows they go back to being strongly typed and shaped relational tables. And since the method we are discussing requires a derived table,CTE, or view object, you will need to shape the different sets of data to all be the same. 

For the most part, I see this as useful for either one table being linked to another through an edge table, or for cases where the tables that are being linked through the same edge are very much similar in meaning (and it hopefully follows, shape)

However, there are definitely uses for hetrogenous queries. For example, thinking of the Network schema as if it was a Customer Relationship Management (CRM) system, how could you see everything that they are connected to? Make a derived table of all the edges and all the nodes and match on that.
*/

SELECT OtherThing.ObjectType, OtherThing.Name,MoreDetailLink
FROM   Network.Person, 
        --the graph columns are exposed automatically, and no 
        --columns do we need, so just returning nothing
        --though this is clearly not a subquery about nothing
       (SELECT 1 AS nothing 
        FROM Network.Follows
        UNION ALL
        SELECT 1 
        FROM Network.ProgramsWith) as LinksTo,
     
       --this derived table is all things that someone can be
       --linked to
       (SELECT 'Person' as ObjectType, Name,
                CONCAT('https://getPerson/',PersonId) 
                                             AS MoreDetailLink 
        FROM Network.Person
        UNION ALL
        SELECT 'ProgrammingLanguage', ProgrammingLanguage.Name,
                 CONCAT('https://getProgramming/',
                      ProgrammingLanguage.Name) AS MoreDetailLink
        FROM Network.ProgrammingLanguage
        UNION ALL
        SELECT 'Location',
               Location.Name,
              CONCAT('https://mapLocation/',LocationId) 
                                                AS MoreDetailLink 
        FROM Network.Location) AS OtherThing
WHERE  MATCH(Person-(LinksTo)->OtherThing)
  AND Person.Name = 'Lou Iss';


/*

Next I will make a few simple views to demonstrate how that works:
*/
CREATE VIEW Network.LinksTo
AS
  SELECT 1 AS nothing FROM network.Follows
  UNION ALL
  SELECT 1 AS nothing FROM network.ProgramsWith;
GO

CREATE VIEW Network.Anything
as 
  SELECT 'Person' as ObjectType,
          Person.Name,
           CONCAT('https://getPerson/',PersonId) 
                                         AS MoreDetailLink 
  FROM Network.Person
  UNION ALL
  SELECT 'ProgrammingLanguage',
	    ProgrammingLanguage.Name,     
          CONCAT('https://getProgramming/',
                      ProgrammingLanguage.Name) AS MoreDetailLink
 
  FROM    Network.ProgrammingLanguage
  UNION ALL
  SELECT 'Location',
	   Location.Name,
         CONCAT('https://mapLocation/',LocationId) 
                                                AS MoreDetailLink 
 
  FROM    Network.Location;

--Excute the query to get the same example as the one with derived tables.

SELECT AnyThing.ObjectType, AnyThing.Name, Anything.MoreDetailLink
FROM   Network.Person, Network.LinksTo, Network.Anything
WHERE  MATCH(Person-(LinksTo)->AnyThing)
  AND Person.Name = 'Lou Iss';


/* What is interesting though is what happens if you add ,* to the SELECT clause. This should return all the columns right? And since we were clearly able to join on the graph key values through the MATCH expression, you would expect to see the values, right?

Turns out not. When your objects are encapsulated into derived tables or view objects, you will only get access to the columns you output, even though the columns are in fact in use.

However, the graph identifiers may not be exposed in the same manner in all uses like this. For example:
*/
SELECT Person.Name, Nodes.ObjectName, Nodes.Name,
	 Nodes.$node_id
FROM   Network.Person, Network.Follows, 
       (SELECT 'Location' as ObjectName, Name, $node_id
	   FROM   Network.Person) as Nodes
WHERE MATCH(Person-(Follows)->Nodes)
  AND Person.Name = 'Lou Iss';

/*
Will throw this error:

Msg 207, Level 16, State 1, Line 243
Invalid column name '$node_id'.

If you want the graph id value to be part of the output, you have to name them and use the name:
*/
SELECT Nodes.ObjectName, Nodes.Name,
		Nodes.NodeId
FROM   Network.Person, Network.Follows, 
       (SELECT 'Location' AS ObjectName, Name, 
			   $node_id AS NodeId
	   FROM   Network.Person) AS Nodes
WHERE MATCH(Person-(Follows)->Nodes)
 AND Person.Name = 'Lou Iss';

 
/*
Lou Iss	Location	Will Iam	{"type":"node","schema":"Network","table":"Person","id":4}
Lou Iss	Location	Val Erry	{"type":"node","schema":"Network","table":"Person","id":2}

You will need to include the implementation columns you need in your view definition if you ned it for some reason.
*/

----------------------------------------------------------------------------------------------------------
--********************************************************************************************************
--Integrity Constraints and indexes 
--********************************************************************************************************
----------------------------------------------------------------------------------------------------------



--So far, we have been really careful with the data we have put into the edge tables, but as demonstrated in the past section, part of the value of edge tables are that they are very flexible. As any software developer knows though, flexiblity is a pro and a con, because sometimes as a designer you don't realize there is flexibility when there is.

--The classic integrity constraints you know already (foreign key, check, unique, primary key, default) all generally work with graph tables just like they do with normal relational tables. However, because an edge table can have more than one type of data in them, there needed to be a new type of constraint, this being the edge constraint.

----------------------------------------------------------------------------------------------------------
--*****
--Edge Constraing
--*****
----------------------------------------------------------------------------------------------------------

--The edge constraint limits what data can be put into an edge constraint by table. For example, when I built the relationship for the homogenous section of this chapter, I made the relationship Person->Follows->Location. It makes no sense semantically, so I want to change that to have its own edge: LivesAt. Person->LivesAt->Location.

--Along the way of moving the rows to this new edge, I can show the things that can happen with an edge object. 

--Ok, so let's add a constraint to the Network.Follows edge that will accept the data that is currently in the table to show how to do multiple tables. I are going to allow Network.Person to Network.Person and then the Network.Person to Network.Location (which I will work to remove).

ALTER TABLE Network.Follows
ADD CONSTRAINT EC_Follows CONNECTION
     (Network.Person TO Network.Location,
       Network.Person TO Network.Person) ON DELETE NO ACTION;


--the NO ACTION on the DELETE Operation means you cannot delete a related node in either connected table without deleting all edges that are connected. If you use CASCADE instead of no action, a delete of a node in either table would cause the edge row to be removed.  (I won't demonstrate it, but you could easily construct an after trigger object that could do just one side if desired.)

--One of the stranger things about edge constraints is that while you can have more than one at a time, their conditions are ANDed together. So you can't add conditions with a new edge constraint. And the error message you get when you try will be interesting.

ALTER TABLE Network.Follows
  ADD CONSTRAINT EC_Follows2 CONNECTION
    (Network.Person TO Network.ProgrammingLanguage)
       ON DELETE NO ACTION;

--Returns this:
/*
Msg 547, Level 16, State 0, Line 383
The ALTER TABLE statement conflicted with the EDGE constraint "EC_Follows2". The conflict occurred in database "TestGraph", table "Network.Follows".

So we will need to drop the existing constraint before adding a new one. So I am going to delete the EC_Follows constraint.
*/
ALTER TABLE Network.Follows DROP EC_Follows

--Ok, now let's delete one of the location rows (not needed for our ultimate goal, but I am doing it here to show you what happens without a constraint.
DELETE Network.Location
where  Location.Name = 'Here'

--Looking at the data, something is odd now:

select Location.LocationId, Location.Name
from   Network.Location

--There is only the one location. If you look at the following query:

select Follows.$to_id, count(*)
from   Network.Follows
where  Follows.$to_id like '%location%'
group by Follows.$to_id

--You will see 2 rows (with 3 for the second column of both, most likely... since we haven't protected against duplicates yet, you might have done what I did and added extras).

--You can find the offending row using a bit more messy query, assuming you know the table you expect the issue to be from. If you have a bunch of tables it can be a challenge

SELECT DISTINCT OBJECT_SCHEMA_NAME(OBJECT_ID_FROM_NODE_ID(Follows.$to_id)),
       OBJECT_NAME(OBJECT_ID_FROM_NODE_ID(Follows.$to_id)),
       Follows.$to_id
FROM Network.Follows
WHERE Follows.$to_id NOT IN --check to see values that don’t 
                            --exist in the node tables
      (
          SELECT Person.$node_id
          FROM Network.Person
          UNION ALL
          SELECT ProgrammingLanguage.$node_id
          FROM Network.ProgrammingLanguage
          UNION ALL
          SELECT $node_id
          FROM Network.Location
      );


--This will tell you the object where the key values come from and the key value so you can delete the edges.

DELETE Network.Follows
WHERE  Follows.$to_id = '{"type":"node","schema":"Network","table":"Location","id":0}';

--Now lets put the edge constraint back on with the two tables, but this time with CASCADE.

ALTER TABLE Network.Follows
add constraint EC_Follows CONNECTION (Network.Person TO Network.Location, Network.Person TO Network.Person) ON DELETE CASCADE;

--now just delete the Locations rows and the rows will be gone from the edge

select OBJECT_SCHEMA_NAME(OBJECT_ID_FROM_NODE_ID(Follows.$to_id)),
        OBJECT_NAME(OBJECT_ID_FROM_NODE_ID(Follows.$to_id)),
		COUNT(*)
from   Network.Follows
GROUP BY OBJECT_SCHEMA_NAME(OBJECT_ID_FROM_NODE_ID(Follows.$to_id)),
        OBJECT_NAME(OBJECT_ID_FROM_NODE_ID(Follows.$to_id))

delete from Network.Location;

/*
the output of shows 1 row affected, but if you run the previous SELECT statement again, there are only 11 Network.Person rows in the Network. Follows table. So now we can change the constraint.
*/

ALTER TABLE Network.Follows drop constraint EC_Follows

ALTER TABLE Network.Follows
ADD CONSTRAINT EC_Follows CONNECTION
   (Network.Person TO Network.Person)
       ON DELETE CASCADE;

--I set it to NO ACTION because I typically would prefer to delete the rows manually rather than have them just automatically go away.

--Next I will create the new edge with a an edge constraint to prevent any data other than associating a person to a location.

CREATE TABLE Network.LivesAt
(
    CONSTRAINT EC_LivesAt CONNECTION
             (Network.Person TO Network.Location)
) AS EDGE;

INSERT INTO Network.Location
(
    NAME
)
VALUES
('Here'),
('There');


--Load the data back

WITH Here
AS (SELECT Person.$node_id AS node_id
    FROM Network.Person
    WHERE Person.NAME IN ( 'Fred Rick', 'Lou Iss', 'Joe Seph' ))
INSERT INTO Network.LivesAt
(
    $from_id,
    $to_id
)
SELECT Here.node_id,
       Location.$node_id
FROM Here
    CROSS JOIN Network.Location
WHERE Location.NAME = 'Here';

WITH Here
AS (SELECT Person.$node_id AS node_id
    FROM Network.Person
    WHERE Person.NAME IN ('Saa Lee', 'Lee Roy', 'Day Vid' ))

INSERT INTO Network.LivesAt
(
    $from_id,
    $to_id
)
SELECT Here.node_id,
       Location.$node_id
FROM Here
    CROSS JOIN Network.Location
WHERE Location.NAME = 'There';

----------------------------------------------------------------------------------------------------------
--*****
--Uniqueness Constraints
--*****
----------------------------------------------------------------------------------------------------------

--execute that second insert again. 


WITH Here
AS (SELECT Person.$node_id AS node_id
    FROM Network.Person
    WHERE Person.NAME IN ('Saa Lee', 'Lee Roy', 'Day Vid' ))

INSERT INTO Network.LivesAt
(
    $from_id,
    $to_id
)
SELECT Here.node_id,
       Location.$node_id
FROM Here
    CROSS JOIN Network.Location
WHERE Location.NAME = 'There';

--Note that now you have duplicated data:

SELECT Person.Name,
       Location.Name
FROM Network.Person,
     Network.LivesAt,
     Network.Location
WHERE MATCH(Person-(LivesAt)->Location)
            AND Location.NAME = 'There'
ORDER BY Person.Name;

--To prevent this, we can use simple unique constraints that reference the pseudocolumns. For example, after deleting the rows for There location
DELETE LivesAt
FROM Network.Person,Network.LivesAt,Network.Location
WHERE MATCH(Person-(LivesAt)->Location)
            AND Location.NAME = 'There';
			
--You can create the following key:
			       
ALTER TABLE Network.LivesAt
  ADD CONSTRAINT AKLivesAt_FromIdToId UNIQUE ($from_id, $to_id);


--this is a performance index that can be valuable as well in breadth-first algorithms anyhow.  Now try the insert repeatedly. On the second run you get:
WITH Here
AS (SELECT Person.$node_id AS node_id
    FROM Network.Person
    WHERE Person.NAME IN ('Saa Lee', 'Lee Roy', 'Day Vid' ))

INSERT INTO Network.LivesAt
(
    $from_id,
    $to_id
)
SELECT Here.node_id,
       Location.$node_id
FROM Here
    CROSS JOIN Network.Location
WHERE Location.NAME = 'There';
/*
Msg 2627, Level 14, State 1, Line 454
Violation of UNIQUE KEY constraint 'AKLivesAt_FromIdToId'. Cannot insert duplicate key in object 'Network.LivesAt'. The duplicate key value is (581577110, 3, 1205579333, 3).

What the heck are those numbers? They are the keys in the underlying graph objects. The key values of object_id and graph iternal id. For this, we can use the following tool function to look up the values:
*/
IF SCHEMA_ID('Tools') IS NULL
  EXEC ('CREATE SCHEMA Tools')
GO
CREATE OR ALTER PROCEDURE Tools.GraphDB$LookupItem
(
	@ObjectId int,
	@Id int 
)
AS
BEGIN
	SET NOCOUNT ON;
	DECLARE @SchemaName sysname = OBJECT_SCHEMA_NAME(@ObjectId),
		    @TableName sysname = OBJECT_NAME(@ObjectId),
	        @SQLStatement nvarchar(MAX)
	SET @SQLStatement = CONCAT('SELECT * FROM ', QUOTENAME(@SchemaName),'.',QUOTENAME(@TableName),
			' WHERE GRAPH_ID_FROM_NODE_ID($node_id)  = ',@Id)

	EXECUTE (@SQLStatement)
END;
GO

--Now you can look up the items pretty easily:

EXEC Tools.GraphDB$LookupItem 1221579390, 3
EXEC Tools.GraphDB$LookupItem 1397580017, 3

--While there are some indexes already on your object, for example on the LivesAt edge table we have created

SELECT indexes.name,
       indexes.type_desc
FROM sys.indexes
WHERE indexes.OBJECT_ID = OBJECT_ID('Network.LivesAt');


--you can see we have this GRAPH_UNIQUE_INDEX_AD2E365DF5144A62BEBC7C7260258E2A index that is on the internal graph columns, but there is not clustered index. So you could make to UNIQUE constraint clustered, or even make it the PRIMARY KEY. 

ALTER TABLE Network.LivesAt
  DROP CONSTRAINT AKLivesAt_FromIdToId;

ALTER TABLE Network.LivesAt
  ADD CONSTRAINT AKLivesAt_FromIdToId  UNIQUE CLUSTERED   
      ($from_id, $to_id);


--look at sys.indexes again and it is now clustered. This can be very helpful for certain types of workloads that mostly fetch data by the $from_id value, which we know to be two columns from the duplicate key error. You can see that in the system tables:

select indexes.name, indexes.type_desc,
		index_columns.key_ordinal,
		columns.name
from   sys.Index_columns
		 JOIN sys.indexes
			on indexes.object_id = index_columns.object_id
			  and indexes.index_id = index_columns.index_id
		 JOIN sys.columns
			on indexes.object_id = columns.object_id
			  and columns.column_id = index_columns.column_id
where indexes.object_id = object_id('Network.LivesAt')

----------------------------------------------------------------------------------------------------------
--*****
--Additional Constraints
--*****
----------------------------------------------------------------------------------------------------------

--Finally, a trigger that I sometimes add to my edge tables is to disallow self connections. For example, that Fred Rick follows Fred Rick:

INSERT INTO Network.Follows
(
    $from_id,
    $to_id,
    Value
)
SELECT (SELECT Person.$node_id FROM Network.Person WHERE Person.FirstName = 'Fred' AND Person.LastName = 'Rick'),
	   (SELECT Person.$node_id FROM Network.Person WHERE Person.FirstName = 'Fred' AND Person.LastName = 'Rick'),
	   1

--It is actually the only possible way to answer a question like this.
select Person.Name
from   Network.Person, Network.Follows
WHERE Match(Person-(Follows)->Person)

--Reusing an edge isnt allowed, but reusing a node is. However, when you reuse a node, it is exactly the same set of data filtered by itself. So the MATCH expression ends up just being:

WHERE Person.$node_id = Follows.$from_id
  AND Person.$node_id = Follows.$to_id

--Since the $node_id is not an array (we are still in a relational database) so not even could there be multiple rows returned. THe only row that could be returned is one where Fred follows Fred. 


--Finally, a trigger that I sometimes add to my edge tables is to disallow self connections. For example, that Fred Rick follows Fred Rick:

INSERT INTO Network.Follows
(
    $from_id,
    $to_id,
    Value
)
SELECT (SELECT Person.$node_id FROM Network.Person WHERE Person.FirstName = 'Fred' AND Person.LastName = 'Rick'),
	   (SELECT Person.$node_id FROM Network.Person WHERE Person.FirstName = 'Fred' AND Person.LastName = 'Rick'),
	   1

--It is actually the only possible way to answer a query like this.

select Person.Name
from   Network.Person, Network.Follows
WHERE Match(Person-(Follows)->Person)

--Reusing an edge isnt allowed, but reusing a node is. However, when you reuse a node, it is exactly the same set of data filtered by itself. So the MATCH expression ends up just being:

WHERE Person.$node_id = Follows.$from_id
  AND Person.$node_id = Follows.$to_id

--Since the $node_id is not an array (we are still in a relational database) so not even could there be multiple rows returned. THe only row that could be returned is one where Fred follows Fred. 

--You cannot do the following and add a check constraint, because that is not allowed.

ALTER TABLE Network.Follows 
	ADD CONSTRAINT CHKFollows_NoSelfReference CHECK (Follows.$to_id = Follows.$to_id)

/*
This returns:

Msg 13918, Level 16, State 1, Line 598
Adding constraint to column '$to_id' of a node or edge table is not allowed.

So we have to do it the hard way, using an after trigger. Note that in the previous example I used an instead of trigger on a view object, which is the best trigger for changing what is happening in an operation. But now we just want to check to see if things are correct after the insert. This trigger will be extended in later examples, because for some uses we will need to extend it to look for cycles beyond one node.

--For this I am going to use my full trigger template from my Database Design book because error handling from a trigger is better if you control how errors are raised and dealt with.
*/

CREATE TRIGGER Network.Follows$InsertUpdateTrigger
ON Network.Follows
AFTER INSERT,UPDATE AS --make 2 triggers if you need 
                       --them to do anything different
BEGIN
   SET NOCOUNT ON; --to avoid the rowcount messages
   SET ROWCOUNT 0; --in case the client has modified the rowcount


   DECLARE @msg varchar(2000), --used to hold the error message
           @rowsAffected int = (SELECT COUNT(*) FROM inserted);
       
   --no need to continue on if no rows affected
   IF @rowsAffected = 0 RETURN;

   BEGIN TRY
          --[validation section]
          IF EXISTS (SELECT * 
                     FROM Inserted 
                     WHERE $from_id = $to_id)
           BEGIN
                    SET @msg = '$from_id must not equal' + 
                              ' $to_id when modifying edge';
                    THROW 50000, @msg, 1;
           END;
          --[modification section]
   END TRY
   BEGIN CATCH
      IF @@trancount > 0
          ROLLBACK TRANSACTION;

      THROW; --will halt the batch or be caught 
             --by the caller's catch block
             --with the transaction aborted.
     END CATCH;
END;

GO
--The duplicate row can be removed by executing the following (when bulk loading data, you may turn off the trigger object to increase performance of the operation.):

DELETE 
FROM   Network.Follows
WHERE  Follows.$from_id = Follows.$to_id

--Now try to do the following insert:

INSERT INTO Network.Follows
(
    $from_id,
    $to_id,
    Value
)
SELECT (SELECT Person.$node_id FROM Network.Person 
        WHERE Person.FirstName = 'Fred' 
          AND Person.LastName = 'Rick'),
        (SELECT Person.$node_id FROM Network.Person 
         WHERE Person.FirstName = 'Fred' 
           AND Person.LastName = 'Rick'),
        1;

/*
Now you get this as a return:

Msg 50000, Level 16, State 1, Procedure Follows$InsertUpdateTrigger, Line 21 [Batch Start Line 649]
$from_id must not equal $to_id when modifying edge
*/

----------------------------------------------------------------------------------------------------------
--********************************************************************************************************
--Metadata Roundup
--********************************************************************************************************
----------------------------------------------------------------------------------------------------------


----------------------------------------------------------------------------------------------------------
--*****
--List graph objects in the database
--*****
----------------------------------------------------------------------------------------------------------

SELECT OBJECT_SCHEMA_NAME(tables.OBJECT_ID) AS SCHEMA_NAME,
       tables.Name,
       CASE
           WHEN tables.is_node = 1 THEN
               'Node'
           WHEN tables.is_edge = 1 THEN
               'Edge'
           ELSE
               'Bad code!'
       END
FROM sys.tables
WHERE tables.is_node = 1
      OR tables.is_edge = 1
ORDER BY schema_name, tables.name;


----------------------------------------------------------------------------------------------------------
--*****
--Types of graph columns
--*****
----------------------------------------------------------------------------------------------------------


--types of graph columns
 SELECT columns.name,
       columns.column_id,
       CASE
           WHEN columns.name LIKE '$%' THEN
               1
           ELSE
               0
       END AS has_pseudocolumn,
       columns.graph_type_desc
FROM sys.COLUMNS
WHERE OBJECT_ID('Network.Person') = COLUMNS.OBJECT_ID
      AND columns.graph_type_desc IS NOT NULL;

SELECT columns.name,
       columns.column_id,
       CASE
           WHEN columns.name LIKE '$%' THEN
               1
           ELSE
               0
       END AS has_pseudocolumn,
       columns.graph_type_desc
FROM sys.columns
WHERE OBJECT_ID('Network.Follows') = COLUMNS.OBJECT_ID
      AND columns.graph_type_desc IS NOT NULL;

----------------------------------------------------------------------------------------------------------
--*****
--Tools for fetching graph information
--*****
----------------------------------------------------------------------------------------------------------


SELECT OBJECT_ID_FROM_EDGE_ID(Follows.$edge_id) AS 
                                               FollowsObjectId,
       GRAPH_ID_FROM_EDGE_ID(Follows.$edge_id) AS FollowsEdgeId,
       OBJECT_ID_FROM_NODE_ID(Follows.$from_id) AS FromObjectId,
       OBJECT_SCHEMA_NAME(OBJECT_ID_FROM_NODE_ID
                    (Follows.$from_id)) AS FromObjectSchemaName,
       OBJECT_NAME(OBJECT_ID_FROM_NODE_ID(Follows.$from_id)) 
                                            AS FromObjectName,
       GRAPH_ID_FROM_NODE_ID(Follows.$from_id) AS FromGraphId,
       OBJECT_ID_FROM_NODE_ID(Follows.$to_id) AS ToObjectId,
       GRAPH_ID_FROM_NODE_ID(Follows.$to_id) AS ToGraphId,
       OBJECT_SCHEMA_NAME(OBJECT_ID_FROM_NODE_ID(Follows.$to_id))  
                                          AS ToObjectSchemaName,
       OBJECT_NAME(OBJECT_ID_FROM_NODE_ID(Follows.$from_id)) 
                                            AS ToObjectName
FROM Network.Follows;


--Then you can look at a row using the following (I just randomly picked out a row from the output, but often you have these values as I showed earlier in the error message)
SELECT Person.$node_id,
       Person.PersonId,
       Person.FirstName,
       Person.LastName,
       Person.NAME,
       Person.Value
FROM Network.Person
WHERE Person.$node_id = NODE_ID_FROM_PARTS(581577110, 5);
