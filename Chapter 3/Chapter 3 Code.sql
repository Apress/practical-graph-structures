IF EXISTS (SELECT * FROM SYS.databases WHERE name = 'TestGraph')
	ALTER DATABASE TestGraph SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
GO

USE master;
GO

DROP DATABASE IF EXISTS TestGraph;
GO

CREATE DATABASE TestGraph;
GO

USE TestGraph;
GO

--Figure 1 before this

--start out creating a single node table and one edge

IF SCHEMA_ID('Network') IS NULL
    EXEC('CREATE SCHEMA Network');
GO

CREATE TABLE Network.Person
(
    PersonId  int           IDENTITY CONSTRAINT PKPerson PRIMARY KEY,
    FirstName nvarchar(100) NULL,
    LastName  nvarchar(100) NOT NULL,
    Name      AS (CONCAT(FirstName + ' ', LastName))PERSISTED,
    Value     int           NOT NULL CONSTRAINT DFLTPerson_Value DEFAULT(1),
    CONSTRAINT AKPerson UNIQUE(
        FirstName,
        LastName)
)AS NODE;
GO

CREATE TABLE Network.Follows
(
    Value int NOT NULL CONSTRAINT DFLTFollows_Value DEFAULT(1)
)AS EDGE;
GO

--listing nodes and edges
SELECT OBJECT_SCHEMA_NAME(tables.object_id) AS schema_name,
       tables.name AS table_name,
       tables.is_edge,
       tables.is_node
FROM   sys.tables
WHERE  tables.is_edge = 1
    OR tables.is_node = 1;
GO

--adding node rows is exactly like adding rows to any table
INSERT INTO Network.Person(FirstName, LastName)
VALUES('Fred', 'Rick'),
      ('Lou', 'Iss'),
      ('Val', 'Erry'),
      ('Lee', 'Roy'),
      ('Saa', 'Lee'),
      ('Joe', 'Seph'),
      ('Day', 'Vid');

--then select some data from the table:
SELECT *
FROM   Network.Person
WHERE  Person.FirstName = 'Fred'
    AND Person.LastName = 'Rick';
GO

/*
You will notice that the first column outputted looks like this

$node_id_3949CAAFE93D496C9A4CF1F33767B666                      
---------------------------------------------------------------
{"type":"node","schema":"Network","table":"Person","id":0}   


The rest of the table is what you expect it do be:
PersonId    FirstName    LastName       Name             Value         
----------- ------------ -------------- ---------------- -----------
1           Fred         Rick           Fred Rick        1         
*/

--#You can use the column name in a query (Npte: you will have to replace this value with the name of the column
--as it shows up in your results):

select [$node_id_C580185613BB42EF81F4A68F6FA539DC] 
from   Network.Person
where [$node_id_C580185613BB42EF81F4A68F6FA539DC]  = 
'{"type":"node","schema":"Network","table":"Person","id":0}'


/*
returns the same thing. Leave off the square brackets and you will get

Msg 126, Level 15, State 2, Line 69
Invalid pseudocolumn "$node_id_3949CAAFE93D496C9A4CF1F33767B666".
*/

--A pseudocolumn is a SQL Server construct that lets you use a value without knowing its exact name. There are others, particularly in partitioning. Here, you use $node_id instead of this value (which will change when you create this table on your maching in all probability)
SELECT Person.$node_id --not in square brackets, because this is not a column name
FROM   Network.Person
WHERE  Person.$node_id = '{"type":"node","schema":"Network","table":"Person","id":0}';

--briefly describe how that node id works.. Will show more examples later.

--for the edge we created, we have several more pseudocolumns to work with:
SELECT *
FROM   Network.Follows;

/*
$edge_id_3E64B3D47C09432595C25D1FB2146A35 
------------------------------------------

$from_id_AA09B7FBEA714F918B3C0D19A8B24A0A
-----------------------------------------

$to_id_4E49D534C24E4F4D8E0E0D207237A425
---------------------------------------

and a value column again for later usage.

These are all abbreviated as $edge_id, $from_id, $to_id. The latter two take as input a $node_id from a node. When doing the input of data, the basic pattern is something like this:

*/
INSERT INTO Network.Follows($from_id, $to_id)
SELECT (   SELECT Person.$node_id
           FROM   Network.Person
           WHERE  Person.FirstName = 'fred'
               AND Person.LastName = 'Rick') AS from_id, --just a name to make it easier to see when debugging
       (   SELECT Person.$node_id
           FROM   Network.Person
           WHERE  Person.FirstName = 'Joe'
               AND Person.LastName = 'Seph') AS to_id;
GO

--looking at that data, you can see:
SELECT *
FROM   Network.Follows;
GO

/*
--note your column names will almost certainly differ and or id values too.

$edge_id_3E64B3D47C09432595C25D1FB2146A35                  
-----------------------------------------------------------
{"type":"edge","schema":"Network","table":"Follows","id":0}

 $from_id_AA09B7FBEA714F918B3C0D19A8B24A0A                 
 ----------------------------------------------------------
 {"type":"node","schema":"Network","table":"Person","id":0}

 $to_id_4E49D534C24E4F4D8E0E0D207237A425                   
 ----------------------------------------------------------
 {"type":"node","schema":"Network","table":"Person","id":5}
 */
--you also can do this (first clear the table, as we have not protected
--against duplication yet, which I will show later)

TRUNCATE TABLE Network.Follows;

--using truncate so the id values are
--reset, just for clarity in writing
--no need to do this in real use
INSERT INTO Network.Follows($from_id, $to_id)
VALUES('{"type":"node","schema":"Network","table":"Person","id":0}',
       '{"type":"node","schema":"Network","table":"Person","id":5}');

--note that these items are values you can directly enter, but they are not the actual values that are stored.

--later in this (or next, depending on how large this chapter is) chapter, I will show you how you can use this format to your advantage when loading data from an outside source.
--i will also demonstrate how things are implemented internally, which is really useful especially when dealing with errors

--then the rest of the rows
INSERT INTO Network.Follows($from_id, $to_id)
SELECT (   SELECT Person.$node_id
           FROM   Network.Person
           WHERE  Person.FirstName = 'fred'
               AND Person.LastName = 'Rick'),
       (   SELECT Person.$node_id
           FROM   Network.Person
           WHERE  Person.FirstName = 'Lou'
               AND Person.LastName = 'Iss')
UNION ALL
SELECT (   SELECT Person.$node_id
           FROM   Network.Person
           WHERE  Person.FirstName = 'Joe'
               AND Person.LastName = 'Seph'),
       (   SELECT Person.$node_id
           FROM   Network.Person
           WHERE  Person.FirstName = 'Saa'
               AND Person.LastName = 'Lee')
UNION ALL
SELECT (   SELECT Person.$node_id
           FROM   Network.Person
           WHERE  Person.FirstName = 'Saa'
               AND Person.LastName = 'Lee'),
       (   SELECT Person.$node_id
           FROM   Network.Person
           WHERE  Person.FirstName = 'Lee'
               AND Person.LastName = 'Roy')
UNION ALL
SELECT (   SELECT Person.$node_id
           FROM   Network.Person
           WHERE  Person.FirstName = 'Val'
               AND Person.LastName = 'Erry'),
       (   SELECT Person.$node_id
           FROM   Network.Person
           WHERE  Person.FirstName = 'Joe'
               AND Person.LastName = 'Seph')
UNION ALL
SELECT (   SELECT Person.$node_id
           FROM   Network.Person
           WHERE  Person.FirstName = 'Val'
               AND Person.LastName = 'Erry'),
       (   SELECT Person.$node_id
           FROM   Network.Person
           WHERE  Person.FirstName = 'Lee'
               AND Person.LastName = 'Roy')
UNION ALL
SELECT (   SELECT Person.$node_id
           FROM   Network.Person
           WHERE  Person.FirstName = 'Lou'
               AND Person.LastName = 'Iss'),
       (   SELECT Person.$node_id
           FROM   Network.Person
           WHERE  Person.FirstName = 'Saa'
               AND Person.LastName = 'Lee')

UNION ALL
SELECT (   SELECT Person.$node_id
           FROM   Network.Person
           WHERE  Person.FirstName = 'Lou'
               AND Person.LastName = 'Iss'),
       (   SELECT Person.$node_id
           FROM   Network.Person
           WHERE  Person.FirstName = 'Val'
               AND Person.LastName = 'Erry')
UNION ALL
SELECT (   SELECT Person.$node_id
           FROM   Network.Person
           WHERE  Person.FirstName = 'Saa'
               AND Person.LastName = 'Lee'),
       (   SELECT Person.$node_id
           FROM   Network.Person
           WHERE  Person.FirstName = 'Fred'
               AND Person.LastName = 'Rick')
UNION ALL
SELECT (   SELECT Person.$node_id
           FROM   Network.Person
           WHERE  Person.FirstName = 'Fred'
               AND Person.LastName = 'Rick'),
       (   SELECT Person.$node_id
           FROM   Network.Person
           WHERE  Person.FirstName = 'Val'
               AND Person.LastName = 'Erry')
UNION ALL
SELECT (   SELECT Person.$node_id
           FROM   Network.Person
           WHERE  Person.FirstName = 'Day'
               AND Person.LastName = 'Vid'),
       (   SELECT Person.$node_id
           FROM   Network.Person
           WHERE  Person.FirstName = 'Saa'
               AND Person.LastName = 'Lee');
GO
--the following query is something you rarely want to do (joining on the internal values directly). But this query is directly analagous to what our simplest graph query will do.
SELECT Person.Name AS PersonName,
       FollowedPerson.Name AS FollowedPersonName
FROM   Network.Person
       JOIN Network.Follows
           ON Person.$node_id = Follows.$from_id
       JOIN Network.Person AS FollowedPerson
           ON FollowedPerson.$node_id = Follows.$to_id;
/*
PersonName     FollowedPersonName
-------------- ----------------------
Fred Rick      Joe Seph
Fred Rick      Lou Iss
Joe Seph       Saa Lee
Saa Lee       Lee Roy
Val Erry       Joe Seph
Val Erry       Lee Roy
Lou Iss        Saa Lee
Lou Iss        Val Erry
Saa Lee       Fred Rick
Fred Rick      Val Erry
Day Vid        Saa Lee

This will match all the directed edge lines in Figure 1

--briefly explaing the basic MATCH operator, and how this query is the way it works

*/
SELECT      CAST(Person.Name AS nvarchar(20)) AS PersonName,
            FollowedPerson.Name AS FollowedPersonName
FROM        Network.Person,
            Network.Follows,
            Network.Person AS FollowedPerson
WHERE MATCH(Person-(Follows)->FollowedPerson);
GO

--same output, probably sorted differentl

--note too that you can't use ANY ANSI style joins in the query... Not even the equivalent CROSS JOIN for the commas.

SELECT      CAST(Person.Name AS nvarchar(20)) AS PersonName,
            FollowedPerson.Name AS FollowedPersonName
FROM        Network.Person
            CROSS JOIN Network.Follows
            CROSS JOIN Network.Person AS FollowedPerson
WHERE MATCH(Person-(Follows)->FollowedPerson);
GO

/*
Msg 13920, Level 16, State 1, Line 221
Identifier 'Follows' in a MATCH clause is used with a JOIN clause or APPLY operator. JOIN and APPLY are not supported with MATCH clauses.
Msg 13920, Level 16, State 1, Line 221
Identifier 'Person' in a MATCH clause is used with a JOIN clause or APPLY operator. JOIN and APPLY are not supported with MATCH clauses.
Msg 13920, Level 16, State 1, Line 221
Identifier 'FollowedPerson' in a MATCH clause is used with a JOIN clause or APPLY operator. JOIN and APPLY are not supported with MATCH clauses.
*/

--All joins to fetch extra information will need to be done like this
WITH GraphPart AS (

SELECT      Person.Name AS PersonName,
            FollowedPerson.Name AS FollowedPersonName,
			Person.FirstName
FROM        Network.Person,
            Network.Follows,
            Network.Person AS FollowedPerson
WHERE MATCH(Person-(Follows)->FollowedPerson))

SELECT GraphPart.PersonName, GraphPart.FollowedPersonName, 
		Colors.ColorName
FROM   GraphPart
        --This could also be a CTE or a real table
		JOIN (SELECT 'blue' AS ColorName
              UNION ALL
              SELECT 'red') AS Colors
		  ON CASE WHEN GraphPart.FirstName = 'Fred'
                            THEN 'blue'
                        ELSE 'red'
                   END = Colors.ColorName

SELECT      CAST(Person.Name AS nvarchar(20)) AS PersonName,
            FollowedPerson.Name AS FollowedPersonName,
            Colors.ColorName
FROM        Network.Person,
            Network.Follows,
            Network.Person AS FollowedPerson,
(   SELECT 'blue' AS ColorName
    UNION ALL
    SELECT 'red') AS Colors
WHERE MATCH(Person-(Follows)->FollowedPerson)
               AND CASE WHEN Person.FirstName = 'Fred'
                            THEN 'blue'
                        ELSE 'red'
                   END = Colors.ColorName;

--and there is no way to do an outer join, so you will need to take care to write your joins safely to not lose data accidentally

--you filter the output the same as in any query. Like to just see the people that Lou Iss follows:
SELECT CAST(Person.Name AS nvarchar(20)) AS PersonName,
       FollowedPerson.Name AS FollowedPersonName
FROM   Network.Person,
       Network.Follows,
       Network.Person AS FollowedPerson
WHERE  Person.FirstName = 'Lou'
    AND Person.LastName = 'Iss' 
    AND MATCH(Person-(Follows)->FollowedPerson);

/*
 PersonName           FollowedPersonName
 -------------------- ---------------------
 Lou Iss              Saa Lee
 Lou Iss              Val Erry
 */

--to find the parents of a row,  just reverse the arrow in the MATCH operator:
SELECT FollowedPerson.Name AS Person, Person.Name AS Follows
FROM   Network.Person,
       Network.Follows,
       Network.Person AS FollowedPerson
WHERE  Person.FirstName = 'Lou'
    AND Person.LastName = 'Iss'
    AND MATCH(Person<-(Follows)-FollowedPerson);

 /*
Person    Follows	  
--------- ---------- 
Fred Rick Lou Iss	  
*/
 --starting at any given point of the graph is something that will be used very frequently in the example code, particularly to find the child rows of a node, often to count or sum their data.



--you can do more than one match statement together. To make this easier, I am going to add a new node and edge to the graph for programming language like seen in Figure 2

--add figure 2

CREATE TABLE Network.ProgrammingLanguage
(
    Name nvarchar(30) NOT NULL
) AS NODE;

CREATE TABLE Network.ProgramsWith AS EDGE;

--load the nodes
INSERT INTO Network.ProgrammingLanguage(Name)
VALUES('C++'),
      ('T-SQL'),
      ('Fortran');

--then load some data

--just like before I will add rows like this:
INSERT INTO Network.ProgramsWith($from_id, $to_id)
SELECT (   SELECT Person.$node_id
           FROM   Network.Person
           WHERE  Person.FirstName = 'Lou'
               AND Person.LastName = 'Iss') AS from_id,
       (   SELECT ProgrammingLanguage.$node_id
           FROM   Network.ProgrammingLanguage
           WHERE  ProgrammingLanguage.Name = 'T-SQL') AS to_id;


--the rest is avaiable in the download
INSERT INTO Network.ProgramsWith($from_id, $to_id)
SELECT (   SELECT Person.$node_id
           FROM   Network.Person
           WHERE  Person.FirstName = 'Val'
               AND Person.LastName = 'Erry'),
       (   SELECT ProgrammingLanguage.$node_id
           FROM   Network.ProgrammingLanguage
           WHERE  ProgrammingLanguage.Name = 'T-SQL')
UNION ALL
SELECT (   SELECT Person.$node_id
           FROM   Network.Person
           WHERE  Person.FirstName = 'Val'
               AND Person.LastName = 'Erry'),
       (   SELECT ProgrammingLanguage.$node_id
           FROM   Network.ProgrammingLanguage
           WHERE  ProgrammingLanguage.Name = 'Fortran')
UNION ALL
SELECT (   SELECT Person.$node_id
           FROM   Network.Person
           WHERE  Person.FirstName = 'Lee'
               AND Person.LastName = 'Roy'),
       (   SELECT ProgrammingLanguage.$node_id
           FROM   Network.ProgrammingLanguage
           WHERE  ProgrammingLanguage.Name = 'T-SQL')
UNION ALL
SELECT (   SELECT Person.$node_id
           FROM   Network.Person
           WHERE  Person.FirstName = 'Lee'
               AND Person.LastName = 'Roy'),
       (   SELECT ProgrammingLanguage.$node_id
           FROM   Network.ProgrammingLanguage
           WHERE  ProgrammingLanguage.Name = 'Fortran')
UNION ALL
SELECT (   SELECT Person.$node_id
           FROM   Network.Person
           WHERE  Person.FirstName = 'Saa'
               AND Person.LastName = 'Lee'),
       (   SELECT ProgrammingLanguage.$node_id
           FROM   Network.ProgrammingLanguage
           WHERE  ProgrammingLanguage.Name = 'Fortran')
UNION ALL
SELECT (   SELECT Person.$node_id
           FROM   Network.Person
           WHERE  Person.FirstName = 'Joe'
               AND Person.LastName = 'Seph'),
       (   SELECT ProgrammingLanguage.$node_id
           FROM   Network.ProgrammingLanguage
           WHERE  ProgrammingLanguage.Name = 'C++')
UNION ALL
SELECT (   SELECT Person.$node_id
           FROM   Network.Person
           WHERE  Person.FirstName = 'Day'
               AND Person.LastName = 'Vid'),
       (   SELECT ProgrammingLanguage.$node_id
           FROM   Network.ProgrammingLanguage
           WHERE  ProgrammingLanguage.Name = 'T-SQL');
GO

--now, lets see people that program with a programming language

SELECT      Person.Name AS Person, 
            ProgrammingLanguage.Name AS ProgrammingLanguage
FROM        Network.Person AS Person,
            Network.ProgramsWith AS ProgramsWith,
            Network.ProgrammingLanguage AS ProgrammingLanguage
WHERE MATCH(Person-(ProgramsWith)->ProgrammingLanguage)
ORDER BY    Person.Name;

SELECT Person.Name AS PersonName, 
       NULL AS ProgrammingLanguage
FROM   Network.Person
WHERE $node_id NOT IN (SELECT $from_id
                       FROM   Network.ProgramsWith);
--now we can find the people who share a programming language ability by
--making 2 virtual copies of Person, and the edge (edges cannot be used more than one time in a query, but tables can depending on the meaning)

--in the following query we are looking for 2 different people sharing one language

SELECT      Person.Name AS Person,
            Person2.Name AS Person2,
            ProgrammingLanguage.Name AS ProgrammingLanguage
FROM        Network.Person AS Person,
            Network.Person AS Person2,
            Network.ProgramsWith AS ProgramsWith,
            Network.ProgrammingLanguage AS ProgrammingLanguage,
            Network.ProgramsWith AS ProgramsWith2
WHERE MATCH(Person-(ProgramsWith)->ProgrammingLanguage)
       AND MATCH(Person2-(ProgramsWith2)->ProgrammingLanguage)
	   --every person will match themselves
	   AND Person2.PersonId <> Person.PersonId
	   AND Person.Name = 'Lou Iss'
ORDER BY    Person.Name, Person2.Name;

--note that the person2 <> person line is due to the fact that person and Person2 are the same table, and we know that the same person has the same skill as themself.

--You can do multiple match statements like that, but most of the time you can tie things together using the ASCII art version of the query, like this:
SELECT      Person.Name AS Person,
            Person2.Name AS Person2,
            ProgrammingLanguage.Name
FROM        Network.Person AS Person,
            Network.Person AS Person2,
            Network.ProgramsWith AS ProgramsWith,
            Network.ProgrammingLanguage AS ProgrammingLanguage,
            Network.ProgramsWith AS ProgramsWith2
--change here
WHERE MATCH(Person-(ProgramsWith)->ProgrammingLanguage<-(ProgramsWith2)-Person2)
               AND Person2.PersonId <> Person.PersonId
AND Person.Name = 'Lou Iss'
ORDER BY    Person, Person2, Name;

--Now in the one MATCH expression, it expresses both sides of the equation.  Finally, since you may not be able to combine everything into one MATCH expression you can AND right in the MATCH expression:
SELECT      Person.Name AS Person,
            Person2.Name AS Person2,
            ProgrammingLanguage.Name
FROM        Network.Person AS Person,
            Network.Person AS Person2,
            Network.ProgramsWith AS ProgramsWith,
            Network.ProgrammingLanguage AS ProgrammingLanguage,
            Network.ProgramsWith AS ProgramsWith2
WHERE MATCH(Person-(ProgramsWith)->ProgrammingLanguage AND Person2-(ProgramsWith2)->ProgrammingLanguage)
               AND Person2.PersonId <> Person.PersonId
ORDER BY    1;

--In this next query, I will look for people who follow each other and share a programming language. These types of queries, with the generic many-to-many tables are part of the great power with the sql graph objects.

SELECT      Person.Name AS Person,
            Person2.Name AS Person2,
            ProgrammingLanguage.Name
FROM        Network.Person AS Person,
            Network.Person AS Person2,
            Network.ProgramsWith AS ProgramsWith,
            Network.ProgrammingLanguage AS ProgrammingLanguage,
            Network.ProgramsWith AS ProgramsWith2,
            Network.Follows AS Follows
WHERE MATCH(Person-(ProgramsWith)->ProgrammingLanguage)
               AND MATCH(Person2-(ProgramsWith2)->ProgrammingLanguage)
               AND MATCH(Person-(Follows)->Person2)
               AND Person2.PersonId <> Person.PersonId
			   AND Person.Name = 'Lou Iss'
ORDER BY    Person, Person2, Name;

/*
Person       Person2       Name
------------ ------------- ------------------------------
Lou Iss      Val Erry      T-SQL
Val Erry     Lee Roy       Fortran
Val Erry     Lee Roy       T-SQL
Saa Lee     Lee Roy       Fortran
*/

--traversing paths, using shortest path

--so far, most of what we have done can be done with simple joins (and some less simply hoops to jump through to intersect sets)
--now to move to finding paths between two nodes in a graph. 
--SQL Server implements a function SHORTEST_PATH which is used to find (not surprisingly) a path from two nodes that is the shortest possible. It is a random path because if there are multiple paths through the tree, it will pick just the one. 
--The syntax gets quite gnarly here, and some parts of this were not at all easy for me to learn! 

--In this next query, I will do a minimal query to get the shortest path between the Lou Iss node to any other nodes that connect.
SELECT Person.Name,
       LAST_VALUE(FollowedPerson.Name) WITHIN GROUP (GRAPH PATH) AS ConnectedPerson
FROM   Network.Person AS Person,
       Network.Follows FOR PATH AS Follows,
       Network.Person FOR PATH AS FollowedPerson
WHERE  Person.FirstName = 'Lou'
    AND Person.LastName = 'Iss'
    AND MATCH(SHORTEST_PATH(Person(-(Follows)->FollowedPerson)+));

 --let's break this down to the base parts as several things change
 --

  --showing how you can do LAST_VALUE to multiple columns
 select Person.Name as Person,
		CONCAT(
		LAST_VALUE(FollowedPerson.Firstname) WITHIN GROUP (GRAPH PATH),
		' ',
		LAST_VALUE(FollowedPerson.LastName) WITHIN GROUP (GRAPH PATH)) as Name
from   Network.Person as Person, Network.Follows for path as Follows, Network.Person for path as FollowedPerson 
where  Person.FirstName = 'Lou' and Person.LastName = 'Iss'
 and   MATCH(SHORTEST_PATH(Person(-(Follows)->FollowedPerson)+));

 --now lets add a bit to the output. You can do aggregates such as count. Count is the standard way to get the number of hops between nodes. For example:

SELECT Person.Name AS Person,
       LAST_VALUE(FollowedPerson.Name)  WITHIN GROUP (GRAPH PATH) as ConnectedPerson,
       COUNT(FollowedPerson.PersonId) WITHIN GROUP (GRAPH PATH) as Level
FROM   Network.Person AS Person,
       Network.Follows FOR PATH AS Follows,
       Network.Person FOR PATH AS FollowedPerson
WHERE  Person.FirstName = 'Lou'
    AND Person.LastName = 'Iss'
    AND MATCH(SHORTEST_PATH(Person(-(Follows)->FollowedPerson)+));
 /*
 In the output you can see that Val and Will are directly connected to Lou, so 1 hop
 Fred, Joe, and Lee are 2. And it is 3 hops to get back to Lou (showing the graph is cyclic back to Lou, something I will use when protecting against cyclic graphs later)

Person        ConnectedPerson   Level
------------- ----------------- -----------
Lou Iss       Val Erry          1
Lou Iss       Saa Lee          1
Lou Iss       Fred Rick         2
Lou Iss       Lee Roy           2
Lou Iss       Joe Seph          2
Lou Iss       Lou Iss           3

*/

--next I will add one of the most useful tools you have when debugging this code. The node labels of each node in the walk represented in the shortest path output.
--this is done using STRING_AGG, and it demonstrates in the clearest manner how this algorithm is recursive.

SELECT Person.Name,
       STRING_AGG(FollowedPerson.Name, '->') WITHIN GROUP(GRAPH PATH) AS Path
FROM   Network.Person AS Person,
       Network.Follows FOR PATH AS Follows,
       Network.Person FOR PATH AS FollowedPerson
WHERE  Person.FirstName = 'Lou'
    AND Person.LastName = 'Iss'
    AND MATCH(SHORTEST_PATH(Person(-(Follows)->FollowedPerson)+));

 /*
 added to the output from the rep
 Person        ConnectedPerson   Level   Path
 ------------- ----------------- ------- ---------------------------------------
 Lou Iss       Val Erry          1       Val Erry
 Lou Iss       Saa Lee          1       Saa Lee
 Lou Iss       Fred Rick         2       Saa Lee->Fred Rick
 Lou Iss       Lee Roy           2       Val Erry->Lee Roy
 Lou Iss       Joe Seph          2       Val Erry->Joe Seph
 Lou Iss       Lou Iss           3       Saa Lee->Fred Rick->Lou Iss

 --Note that the walk from Lou to Lee goes through Val only. On the diagram it also goes through Will. Later in in the chapter I will demonstrate how to include all walks in your output (it will not be nearly as neat and tidy as these queries!)
 --generally speaking it shouldn't make much difference to your output what nodes are included... unless you start doing aggregates on the nodes in the path... 

--When I created the graph, I included value columns on each edge and node to let us see how they compare to the count(*) output since each value is 1. 
*/

SELECT STRING_AGG(FollowedPerson.Name, '->')WITHIN GROUP(GRAPH PATH) AS Path,
       COUNT(FollowedPerson.PersonId) WITHIN GROUP (GRAPH PATH) as Level,
       SUM(FollowedPerson.Value) WITHIN GROUP (GRAPH PATH) as SumNodeValues,
	   SUM(Follows.Value) WITHIN GROUP (GRAPH PATH) as SumEdgeValues
FROM   Network.Person AS Person,
       Network.Follows FOR PATH AS Follows,
       Network.Person FOR PATH AS FollowedPerson
WHERE  Person.FirstName = 'Lou'
    AND Person.LastName = 'Iss'
    AND MATCH(SHORTEST_PATH(Person(-(Follows)->FollowedPerson)+));

--the output of this query has 2 new columns that the same value as the level.. You can see in the following output, where I added the extra values, that the sum doesn't include the base node:

  select Person.Name as Person,
		CONCAT(
		LAST_VALUE(FollowedPerson.Firstname) WITHIN GROUP (GRAPH PATH),' ',
		LAST_VALUE(FollowedPerson.LastName) WITHIN GROUP (GRAPH PATH)) as ConnectedPerson,
		COUNT(FollowedPerson.PersonId) WITHIN GROUP (GRAPH PATH) as Level,
		STRING_AGG(FollowedPerson.Name, '->') WITHIN GROUP (GRAPH PATH),
		SUM(FollowedPerson.Value) WITHIN GROUP (GRAPH PATH) as SumNodeValues,
		--NOTE: Figure out why this is equal. More are being included or not enoiugh
		SUM(Follows.Value) WITHIN GROUP (GRAPH PATH) as SumEdgeValues,
		STRING_AGG(CONCAT(FollowedPerson.Name, ' Node:',FollowedPerson.Value), '->') WITHIN GROUP (GRAPH PATH),
		STRING_AGG(CONCAT(FollowedPerson.Name, ' EdgeValue:',Follows.Value), '->') WITHIN GROUP (GRAPH PATH)
from   Network.Person as Person, Network.Follows for path as Follows, Network.Person for path as FollowedPerson 
where  Person.FirstName = 'Lou' and Person.LastName = 'Iss'
 and   MATCH(SHORTEST_PATH(Person(-(Follows)->FollowedPerson)+));

--So while you CAN sum the node and edge values, it is important to remember that you can only do shortest path, not the cheapest or most expensive path.
--So as seen in currently Figure 3, the direct path has the highest magnitude, but it is the only path we can actually choose. 
--later in the chapter I will include how to get get the longest path in a different manner.

--You control the number of levels to search (which can be really important with some very large networks, in the SHORTEST_PATH syntax.

--show everyone linked at any level, along with their path
SELECT STRING_AGG(FollowedPerson.Name, '->') WITHIN GROUP (GRAPH PATH),
		COUNT(FollowedPerson.PersonId) WITHIN GROUP (GRAPH PATH) as LEVEL
FROM   Network.Person AS Person,
       Network.Follows FOR PATH AS Follows,
       Network.Person FOR PATH AS FollowedPerson
WHERE  Person.FirstName = 'Lou'
    AND Person.LastName = 'Iss'
    AND MATCH(SHORTEST_PATH(Person(-(Follows)->FollowedPerson)+)); --highlight

 --The plus goes all the way to the end of the structure, but if you want to limit the level to 2, you can use this syntax

  --show everyone linked at level 1 or 2, along with their path
--show everyone linked at any level, along with their path
SELECT STRING_AGG(FollowedPerson.Name, '->') WITHIN GROUP (GRAPH PATH),
		COUNT(FollowedPerson.PersonId) WITHIN GROUP (GRAPH PATH) as Level
FROM   Network.Person AS Person,
       Network.Follows FOR PATH AS Follows,
       Network.Person FOR PATH AS FollowedPerson
WHERE  Person.FirstName = 'Lou'
    AND Person.LastName = 'Iss'
    AND MATCH(SHORTEST_PATH(Person(-(Follows)->FollowedPerson){1,2})); --here

 --note that you can't do: 2,3, or you get the following error
 /*
 Msg 13942, Level 15, State 2, Line 556
The initial recursive quantifier must be 1: {1, ... }.
*/

---if you want 2 or 3 you can't use a having clause, you have to use a CTE


WITH BaseRows AS (
SELECT STRING_AGG(FollowedPerson.Name, '->') WITHIN GROUP 
                                            (GRAPH PATH) AS Path,
       COUNT(FollowedPerson.PersonId) WITHIN GROUP (GRAPH PATH) 
                                                         AS LEVEL
FROM   Network.Person AS Person,
       Network.Follows FOR PATH AS Follows,
       Network.Person FOR PATH AS FollowedPerson
WHERE  Person.FirstName = 'Lou'
    AND Person.LastName = 'Iss'
    AND MATCH(
         SHORTEST_PATH(Person(-(Follows)->FollowedPerson){1,3}))
 ) 
SELECT *
FROM   BaseRows
WHERE  Level BETWEEN 2 AND 3;


 --several filters will need to be handled in a CTE Like if you just want to see links from Lou Iss to Lee Roy

WITH BaseRows AS (
SELECT LAST_VALUE(FollowedPerson.Name) WITHIN GROUP (GRAPH PATH)
                                                AS ConnectedPerson,
	   STRING_AGG(FollowedPerson.Name, '->') WITHIN GROUP 
                                            (GRAPH PATH) AS Path
FROM   Network.Person AS Person,
       Network.Follows FOR PATH AS Follows,
       Network.Person FOR PATH AS FollowedPerson
WHERE  Person.FirstName = 'Lou'
    AND Person.LastName = 'Iss'
    AND MATCH(
         SHORTEST_PATH(Person(-(Follows)->FollowedPerson){1,3}))
 ) 
SELECT Path
FROM   BaseRows
WHERE ConnectedPerson = 'Lee Roy'; --probably ought to use a surrogate or name parts
--here in production code
GO


--IF you want to do something more in depth like a weighted path cost, you will need to resort to doing a recursive query. This can be really costly for large graphs because unlike a shortest path, you have to consider every possible path between nodes (in fact you will need to process every single node that connectes to your starting point. Even the longest path in number of hops can actually be the cheapest path.

--Using our current graph, if you want to find all the paths between two nodes, you can use the following code.

--fetch the starting point
DECLARE @FirstName NVARCHAR(100) = N'Lou';
DECLARE @LastName NVARCHAR(100) = N'Iss';

--filter for the ending point
DECLARE @ToFirstName NVARCHAR(100) = N'Lee';
DECLARE @ToLastName NVARCHAR(100) = N'Roy';

--for larger graphs, this may be needt to stop excessive recursion
DECLARE @MaxLevel INT =10;

WITH BaseRows
AS (
	--the CTE anchor is just the starting node
	SELECT Person.PersonId,
           Person.PersonId AS FollowsPersonId,
           Person.Name, 
		   --the path that contains the readable path we have built in all examples
           CAST(Person.Name AS NVARCHAR(4000)) AS Path, 
		   --this path is use to stop loops. If the personId is found in the path
		   --already, then the recursion will stop
           CAST(CONCAT('\', Person.PersonId, '\') AS VARCHAR(8000)) AS IdPath,
           0 AS level --the level
    FROM Network.Person
    WHERE Person.FirstName = @FirstName
          AND Person.LastName = @LastName
    UNION ALL
	--pretty typical 1 level graph query:
    SELECT Person.PersonId AS PersonId,
           FollowedPerson.PersonId AS FollowsPersonId,
           FollowedPerson.Name,
           BaseRows.Path + '>' + FollowedPerson.Name,
           BaseRows.IdPath + CAST(FollowedPerson.PersonId AS VARCHAR(10)) + '\',
           BaseRows.level + 1
    FROM Network.Person,
         Network.Follows,
         Network.Person AS FollowedPerson,
         BaseRows
    WHERE MATCH(Person-(Follows)->FollowedPerson)
				--this joins the anchor to the recursive part of the query
                AND BaseRows.FollowsPersonId = Person.PersonId
				--this is the part that stops recursion
                AND NOT BaseRows.IdPath LIKE CONCAT('%\', FollowedPerson.PersonId, '\%')
                AND BaseRows.level <= @MaxLevel)
SELECT BaseRows.Path
FROM BaseRows
WHERE BaseRows.Name = 'Lee Roy';
GO

--Finally, this example shows adding sums for weighting as noted

DECLARE @FirstName NVARCHAR(100) = N'Lou';
DECLARE @LastName NVARCHAR(100) = N'Iss';

DECLARE @ToFirstName NVARCHAR(100) = N'Lee';
DECLARE @ToLastName NVARCHAR(100) = N'Roy';


DECLARE @MaxLevel INT = 4;

WITH BaseRows
AS (SELECT Person.PersonId,
           Person.PersonId AS FollowsPersonId,
           Person.Name,
           CAST(Person.Name AS nvarchar(4000)) AS Path,
           CAST(CONCAT('\', Person.PersonId, '\') AS varchar(8000)) AS IdPath,
           0 AS level,
           0 AS WeightedCost,      --edge sums
           Person.Value AS NodeSum --node sums
    FROM   Network.Person
    WHERE  Person.FirstName = @FirstName
        AND Person.LastName = @LastName
    UNION ALL
    SELECT      Person.PersonId AS PersonId,
                FollowedPerson.PersonId AS FollowsPersonId,
                FollowedPerson.Name,
                BaseRows.Path + '>' + FollowedPerson.Name,
                BaseRows.IdPath
                + CAST(FollowedPerson.PersonId AS varchar(10)) + '\',
                BaseRows.level + 1,

                --add the values in each iteration
                BaseRows.WeightedCost + Follows.Value,
                BaseRows.NodeSum + FollowedPerson.Value
    FROM        Network.Person,
                Network.Follows,
                Network.Person AS FollowedPerson,
                BaseRows
    WHERE MATCH(Person-(Follows)->FollowedPerson)
                   AND BaseRows.FollowsPersonId = Person.PersonId
                   AND NOT BaseRows.IdPath LIKE CONCAT(
                                                    '%\',
                                                    FollowedPerson.PersonId,
                                                    '\%')
                   AND BaseRows.level < 10)
SELECT BaseRows.Path,
       BaseRows.WeightedCost,
       BaseRows.NodeSum
FROM   BaseRows
WHERE  BaseRows.Name = 'Lee Roy';
GO


--Finally, this example shows adding sums for weighting as noted

DECLARE @FirstName NVARCHAR(100) = N'Lou';
DECLARE @LastName NVARCHAR(100) = N'Iss';

DECLARE @ToFirstName NVARCHAR(100) = N'Lee';
DECLARE @ToLastName NVARCHAR(100) = N'Roy';


DECLARE @MaxLevel INT = 4;

WITH BaseRows
AS (SELECT Person.PersonId,
           Person.PersonId AS FollowsPersonId,
           Person.Name,
           CAST(Person.Name AS nvarchar(4000)) AS Path,
           CAST(CONCAT('\', Person.PersonId, '\') AS varchar(8000)) AS IdPath,
           0 AS level,
           0 AS WeightedCost,      --edge sums
           Person.Value AS NodeSum --node sums
    FROM   Network.Person
    WHERE  Person.FirstName = @FirstName
        AND Person.LastName = @LastName
    UNION ALL
    SELECT      Person.PersonId AS PersonId,
                FollowedPerson.PersonId AS FollowsPersonId,
                FollowedPerson.Name,
                BaseRows.Path + '>' + FollowedPerson.Name,
                BaseRows.IdPath
                + CAST(FollowedPerson.PersonId AS varchar(10)) + '\',
                BaseRows.level + 1,

                --add the values in each iteration
                BaseRows.WeightedCost + Follows.Value,
                BaseRows.NodeSum + FollowedPerson.Value
    FROM        Network.Person,
                Network.Follows,
                Network.Person AS FollowedPerson,
                BaseRows
    WHERE MATCH(Person-(Follows)->FollowedPerson)
                   AND BaseRows.FollowsPersonId = Person.PersonId
                   AND NOT BaseRows.IdPath LIKE CONCAT(
                                                    '%\',
                                                    FollowedPerson.PersonId,
                                                    '\%')
                   AND BaseRows.level < 10)
SELECT TOP 1 WITH TIES BaseRows.Path,
       BaseRows.WeightedCost,
       BaseRows.NodeSum
FROM   BaseRows
WHERE  BaseRows.Name = 'Lee Roy'
ORDER BY BaseRows.WeightedCost ASC;
