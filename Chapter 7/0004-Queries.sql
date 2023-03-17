USE BillOfMaterialsExample;
GO

SELECT * 
FROM   PartsSystem_UI.Part_Includes_Part;
GO

----------------------------------------------------------------------------------------------------------
--********************************************************************************************************
--Determining if a part is used in a build. 
--********************************************************************************************************
----------------------------------------------------------------------------------------------------------


--This is easy to do using a SHORTEST_PATH query. Since all we are trying to do is see what parts are used, we only need them to show up once in the list. So we a

SELECT LAST_VALUE(IncludesPart.PartName) WITHIN GROUP (GRAPH PATH)
                                                AS ConnectedItem,
	   STRING_AGG(IncludesPart.PartName, '->') WITHIN GROUP 
                                            (GRAPH PATH) AS Path
FROM   PartsSystem.Part AS Part,
       PartsSystem.Includes FOR PATH AS Includes,
       PartsSystem.Part FOR PATH AS IncludesPart
WHERE  Part.PartName = 'Shelvii'
    AND MATCH(SHORTEST_PATH(Part(-(Includes)->IncludesPart)+))
ORDER BY ConnectedItem;
GO
/* I will include it in the output, but realistically, we don't really need the path in this output because what we wanted was the parts that made up the output. 

ConnectedItem       Path
------------------- ---------------------------------
Flat Shelf          Flat Shelf
Shelf Enchancer     Shelf Set->Shelf Enchancer
Shelf Set           Shelf Set
Shelvii Side        Shelvii Side
Small Screw         Small Screw Pack->Small Screw
Small Screw Pack    Small Screw Pack
Wooden Dowel        Wooden Dowel Pack->Wooden Dowel
Wooden Dowel Pack   Wooden Dowel Pack

One thing to note is that we have only sort of answered the question. This query has provided us with the entire list, including containers. So the Shelf Set for example is actually not a part itself so much as it is a set of parts. Whether this matters is based on your point of view. But we could rewrite this as:
*/
WITH BaseRows AS
(
SELECT LAST_VALUE(IncludesPart.PartName) WITHIN GROUP (GRAPH PATH)
                                                AS ConnectedItem,
	   STRING_AGG(IncludesPart.PartName, '->') WITHIN GROUP 
                                            (GRAPH PATH) AS Path,
	   LAST_VALUE(IncludesPart.$node_id) WITHIN GROUP (GRAPH PATH)
                                                AS ConnectedItemNodeId
FROM   PartsSystem.Part AS Part,
       PartsSystem.Includes FOR PATH AS Includes,
       PartsSystem.Part FOR PATH AS IncludesPart
WHERE  Part.PartName = 'Shelvii'
    AND MATCH(SHORTEST_PATH(Part(-(Includes)->IncludesPart)+))
)
--filter rows where the node is parent in the structure
SELECT ConnectedItem, Path
FROM BaseRows
WHERE NOT EXISTS (SELECT *
				  FROM   PartsSystem.Includes
				  where  $from_id = ConnectedItemNodeId)
ORDER BY ConnectedItem;
/*
This now returns:

ConnectedItem            Path
------------------------ --------------------------------------
Flat Shelf               Flat Shelf
Shelvii Shelf Enhancer   Shelf Set->Shelvii Shelf Enhancer
Shelvii Side             Shelvii Side
Small Screw              Small Screw Pack->Small Screw
Wooden Dowl              Small Wooden Dowl Pack->Wooden Dowl

Look back at figure 7-3 and you will seethat the leaf nodes, do in fact show up in this query. Start at the Shelf Set:
*/
WITH BaseRows AS
(
SELECT LAST_VALUE(IncludesPart.PartName) WITHIN GROUP (GRAPH PATH)
                                                AS ConnectedItem,
	   STRING_AGG(IncludesPart.PartName, '->') WITHIN GROUP 
                                            (GRAPH PATH) AS Path,
	   LAST_VALUE(IncludesPart.$node_id) WITHIN GROUP (GRAPH PATH)
                                                AS ConnectedItemNodeId
FROM   PartsSystem.Part AS Part,
       PartsSystem.Includes FOR PATH AS Includes,
       PartsSystem.Part FOR PATH AS IncludesPart
WHERE  Part.PartName = 'Shelf Set'
    AND MATCH(SHORTEST_PATH(Part(-(Includes)->IncludesPart)+))
)
--filter rows where the node is parent in the structure
SELECT ConnectedItem, Path
FROM BaseRows
WHERE NOT EXISTS (SELECT *
				  FROM   PartsSystem.Includes
				  where  $from_id = ConnectedItemNodeId)
ORDER BY ConnectedItem;
/*
Now you will see that it just has the three rows:

ConnectedItem       Path
------------------- ----------------------------------
Flat Shelf          Flat Shelf
Shelf Enchancer     Shelf Enchancer
Small Screw         Small Screw Pack->Small Screw

----------------------------------------------------------------------------------------------------------
--********************************************************************************************************
--Picking items for a build
--********************************************************************************************************
----------------------------------------------------------------------------------------------------------


Ok, so say you are the people assembling these packages. You would be given some number of packages to build, and somewhere there would be a picklist (which tells the user what to go pick from the shelves.

This is actually quite simple, because you need only go one level down the tree to get the data to output. So if you are grabbing the parts for a Shelvii, you just need to go fetch:
*/

SELECT IncludesPart.PartName, IncludesPart.PartName, Includes.IncludeCount
FROM   PartsSystem.Part AS Part,
       PartsSystem.Includes AS Includes,
       PartsSystem.Part AS IncludesPart
WHERE  Part.PartName = 'Shelvii'
    AND MATCH(Part-(Includes)->IncludesPart);
/*
This returns:

PartName                       PartName                       IncludeCount
------------------------------ ------------------------------ ------------
Shelf Set                      Shelf Set                      3
Flat Shelf                     Flat Shelf                     2
Small Wooden Dowel Pack        Small Wooden Dowel Pack        5
Shelvii Side                   Shelvii Side                   2
Small Screw Pack               Small Screw Pack               2

So you go grab the pieces you need, and put them in the packaging. The same had previously been done for the Small Screw Pack:
*/
SELECT IncludesPart.PartName, Includes.IncludeCount
FROM   PartsSystem.Part AS Part,
       PartsSystem.Includes AS Includes,
       PartsSystem.Part AS IncludesPart
WHERE  Part.PartName = 'Small Screw Pack'
    AND MATCH(Part-(Includes)->IncludesPart);



SELECT IncludesPart.PartName, Includes.IncludeCount
FROM   PartsSystem.Part AS Part,
       PartsSystem.Includes AS Includes,
       PartsSystem.Part AS IncludesPart
WHERE  Part.PartName = 'Small Screw Pack'
    AND MATCH(Part-(Includes)->IncludesPart);
/*
PartName               AssemblyPartName      IncludeCount
---------------------- --------------------- ------------
3.2R Screw             Small Screw           3

So the person went and fetched the list and packaged them up for all of the companies product uses of the generic 3.2R Small Screw Pack. Of course it would include a count and a bin number and plenty more detail, but the basics are there. 

----------------------------------------------------------------------------------------------------------
--********************************************************************************************************
--Printing out the parts list for a build
--********************************************************************************************************
----------------------------------------------------------------------------------------------------------

Here is where we get into trouble with the base syntax. SHORTEST_PATH fails us because it only gives us a single path from root (of the subgraph or graph) to the child. So if you wanted to print out the list of things you needed for the entire build, you are going to have to use a different method. As shown in Chapter 3, you can sum values in your SHORTEST_PATH queries, but you will lose item counts when there are 2 or more paths to the same node.
The solution is that we need to implement our own breadth-first search, basically taking the same approach as picking items for a build, but then using the output of one level to pick items for the next level. 
To do this we will use a recursive CTE.

*/

WITH BaseRows
AS (
	--the CTE anchor is just the starting node that you want to see
	--the breakdown
	SELECT Part.$node_id AS PartNodeId,
           Part.$node_id  AS RelatedToPartNodeId,
           Part.PartName, 
		   1 AS IncludeCount,
		   --the path that contains the readable path we have 
		   --built in all examples
           CAST('' AS NVARCHAR(4000)) AS Path, 
           0 AS level --the level
    FROM PartsSystem.Part
    WHERE Part.Partname = 'Shelvii'
    UNION ALL
	--pretty typical 1 level graph query:
    SELECT Part.$node_id AS ItemId,
           IncludesPart.$node_id AS RelatedToItemId,
           IncludesPart.PartName,
		   Includes.IncludeCount,
           BaseRows.Path + ' > ' + IncludesPart.PartName,
           BaseRows.level + 1
    FROM PartsSystem.Part,
         PartsSystem.Includes,
         PartsSystem.Part AS IncludesPart,
         BaseRows --this is what makes it recursive
    WHERE MATCH(Part-(Includes)->IncludesPart)
				--this joins the anchor to the recursive part of the query
                AND BaseRows.RelatedToPartNodeId = Part.$node_id
				)
SELECT PartName, IncludeCount as IncCt, BaseRows.Path
FROM BaseRows
WHERE BaseRows.PartName <> 'Shelvii'
ORDER BY Path
GO
/*
This returns the following, unaggregated results:

PartName                 IncCt Path
------------------------ ----- ---------------------------------------------
Flat Shelf               2      > Flat Shelf
Shelf Set                3      > Shelf Set
Flat Shelf               1      > Shelf Set > Flat Shelf
Shelvii Shelf Enhancer   2      > Shelf Set > Shelvii Shelf Enhancer
Small Screw Pack         3      > Shelf Set > Small Screw Pack
Small Screw              3      > Shelf Set > Small Screw Pack > Small Screw
Shelvii Side             2      > Shelvii Side
Small Screw Pack         2      > Small Screw Pack
Small Screw              3      > Small Screw Pack > Small Screw
Small Wooden Dowel Pack  5      > Small Wooden Dowel Pack
Wooden Dowel             3      > Small Wooden Dowel Pack > Wooden Dowel


Now we have a bit of a problem to solve. we want to filter the parent rows and just get to where we are listing raw materials. But while we DO have 3 3.2R Screws in a pack, the number we need is actually based on the parent rows. Consider the subgraph displayed in Figure 7-5. Shelvii has 3 shelf seets that use 2 Small Screw Packs with then in turn use 3 Small Screws. There is also the Shelvii system itself that needs 2 packs. We need to change the IncludeCount to be not just a count, but cumulative multiplication.

*/
WITH BaseRows
AS (
	--the CTE anchor is just the starting node that you want to see
	--the breakdown
	SELECT Part.$node_id AS PartNodeId,
           Part.$node_id  AS RelatedToPartNodeId,
           Part.PartName, 
		   1 as IncludeCount,
		   --the path that contains the readable path we have 
		   --built in all examples
           CAST('' AS NVARCHAR(4000)) AS Path, 
           0 AS level --the level
    FROM PartsSystem.Part
    WHERE Part.Partname = 'Shelvii'
    UNION ALL
	--pretty typical 1 level graph query:
    SELECT Part.$node_id AS ItemId,
           IncludesPart.$node_id AS RelatedToPartNodeId,
           IncludesPart.PartName,
		   --changed to multiplication
		   BaseRows.IncludeCount * Includes.IncludeCount,
           BaseRows.Path + ' > ' + IncludesPart.PartName,
           BaseRows.level + 1
    FROM PartsSystem.Part,
         PartsSystem.Includes,
         PartsSystem.Part AS IncludesPart,
         BaseRows --this is what makes it recursive
    WHERE MATCH(Part-(Includes)->IncludesPart)
				--this joins the anchor to the recursive part of the query
                AND BaseRows.RelatedToPartNodeId = Part.$node_id
				)
SELECT PartName, IncludeCount as IncCt, BaseRows.Path
FROM BaseRows
WHERE BaseRows.PartName <> 'Shelvii'
ORDER BY PartName
GO
/*
Now the output looks like this:

PartName                       IncCt       Path
------------------------------ ----------- ------------------------------------------------
Flat Shelf                     2            > Flat Shelf
Flat Shelf                     3            > Shelf Set > Flat Shelf
Shelf Set                      3            > Shelf Set
Shelvii Shelf Enhancer         6            > Shelf Set > Shelvii Shelf Enhancer
Shelvii Side                   2            > Shelvii Side
Small Screw                    6            > Small Screw Pack > Small Screw
Small Screw                    27           > Shelf Set > Small Screw Pack > Small Screw
Small Screw Pack               9            > Shelf Set > Small Screw Pack
Small Screw Pack               2            > Small Screw Pack
Small Wooden Dowel Pack        5            > Small Wooden Dowel Pack
Wooden Dowel                   15           > Small Wooden Dowel Pack > Wooden Dowel

Thinking of the sheves, we needed 2 for the top and bottom, 3 for the inside shelves. For the screws we needed. (3 * 3 * 3) and (3 * 2) which you can see is in fact 27 and 6. Finally, we aggregate and filter out the non-leaf nodes.

*/

WITH BaseRows
AS (
	--the CTE anchor is just the starting node that you want to see
	--the breakdown
	SELECT Part.$node_id AS PartNodeId,
           Part.$node_id  AS RelatedToPartNodeId,
           Part.PartName, 
		   1 as IncludeCount,
		   --the path that contains the readable path we have 
		   --built in all examples
           CAST('' AS NVARCHAR(4000)) AS Path, 
           0 AS level --the level
    FROM PartsSystem.Part
    WHERE Part.Partname = 'Shelvii'
    UNION ALL
	--pretty typical 1 level graph query:
    SELECT Part.$node_id AS ItemId,
           IncludesPart.$node_id AS RelatedToPartNodeId,
           IncludesPart.PartName,
		   BaseRows.IncludeCount * Includes.IncludeCount,
           BaseRows.Path + ' > ' + IncludesPart.PartName,
           BaseRows.level + 1
    FROM PartsSystem.Part,
         PartsSystem.Includes,
         PartsSystem.Part AS IncludesPart,
         BaseRows --this is what makes it recursive
    WHERE MATCH(Part-(Includes)->IncludesPart)
				--this joins the anchor to the recursive part of the query
                AND BaseRows.RelatedToPartNodeId = Part.$node_id
				)
SELECT PartName, SUM(IncludeCount) as IncludeCountTotal
FROM BaseRows
WHERE BaseRows.PartName <> 'Shelvii'
  and RelatedToPartNodeId not in (SELECT $from_id
								  FROM   PartsSystem.Includes)
GROUP BY PartName
ORDER BY PartName;
GO
/*
This returns:

PartName                       IncludeCountTotal
------------------------------ -----------------
Flat Shelf                     5
Shelvii Shelf Enhancer         6
Shelvii Side                   2
Small Screw                    33
Wooden Dowel                   15

Which if you refer back to Figure 7-3, you will be able to reconsile to the number of items you expected.
*/

