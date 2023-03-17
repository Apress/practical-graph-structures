----------------------------------------------------------------------------------------------------------
--*****
--use to capture timing
--*****
----------------------------------------------------------------------------------------------------------
USE SocialGraph;
GO

----------------------------------------------------------------------------------------------------------
--*****
--Simple find all decendents using Follows
--*****
----------------------------------------------------------------------------------------------------------

-- In Figure 8.1, you can see that we have a couple of interesting relationships. @Cassandra_Villegas is connected directly to 3 other accounts, and the other through all of the other paths. In the following query, we can see this:

--1 In Test Rig (corresponds to query in the test rig file that 
--can be used to run all the queries using parameters you 
--want to try out
       --item that the searched for item is connted to
SELECT LAST_VALUE(Account2.AccountHandle) 
	           WITHIN GROUP (GRAPH PATH) AS ConnectedToAccountHandle,
	   --how far away in structure
	   COUNT(Account2.AccountHandle) 
	           WITHIN GROUP (GRAPH PATH) AS LEVEL,
       --what path was taken
       STRING_AGG(Account2.AccountHandle, '->') 
               WITHIN GROUP (GRAPH PATH) AS ConnectedPath
FROM   SocialGraph.Account AS Account1
                   ,SocialGraph.Account FOR PATH AS Account2
                   ,SocialGraph.Follows FOR PATH AS Follows
WHERE  MATCH(SHORTEST_PATH(Account1(-(Follows)->Account2)+))
  AND  Account1.AccountHandle = '@Cassandra_Villegas'
ORDER BY ConnectedPath
OPTION (MAXDOP 1); --larger datasets can cause queries using 
   --MATCH and especially SHORTEST_PATH to spin constantly
   --when parallellism occurs.
/*
As we have seen in many results in the book so far, @Lynn_Escobar only shows up once because SHORTEST_PATH only gives you one path. 

ConnectedToAccountHandle       LEVEL       ConnectedPath
------------------------------ ----------- ------------------------------------------
@Gerald_Scott                  1           @Gerald_Scott
@Tonia_Mueller                 1           @Tonia_Mueller
@Lynn_Escobar                  2           @Tonia_Mueller->@Lynn_Escobar
@Willie_Charles                1           @Willie_Charles


Later in the chapter I will demonstrate how to fetch all the paths. However, this will typically be useful more when you have 2 nodes you know connect, but want to see how they connect. For example, say @Cassandra_Villegas is trying to sell something to @Lynn_Escobar. If they don't want to go throught Tonia, looking at all the paths might be useful.

In the next query though, I want to explore that question of filtering your query to see if two nodes connect.
*/


----------------------------------------------------------------------------------------------------------
--*****
--Seeing if one node follows another
--*****
----------------------------------------------------------------------------------------------------------

/*
The most typical way is to use a CTE to represent all connectons to the account, then filter it in the CTE. Note that I have added OPTION (MAXDOP 1) to the query. This is one of the primary tuning tools you have when tunig queries using SQL Server graph queries. Even in SQL Server 2022 there can be issues with performance when SHORTEST_PATH queries access a lot of rows. Obviously in the first half of this chapter, the data sizes are small, but when you try queries that access larger numbers of rows (a script to load this schema with considerable amounts of data is included in the download), some queries can run for 24 hours and not make progress without MAXDOP 1. 
*/

--2 in test rig
WITH BaseRows AS (
SELECT Account1.AccountHandle + '->' + 
       STRING_AGG(Account2.AccountHandle, '->') 
          WITHIN GROUP (GRAPH PATH) AS ConnectedPath, 
       LAST_VALUE(Account2.AccountHandle) 
          WITHIN GROUP (GRAPH PATH) AS ConnectedToAccountHandle,
	   COUNT(Account2.AccountHandle) 
          WITHIN GROUP (GRAPH PATH) AS Level
FROM   SocialGraph.Account AS Account1
       ,SocialGraph.Account FOR PATH AS Account2
       ,SocialGraph.Follows FOR PATH AS Follows
WHERE  MATCH(SHORTEST_PATH(Account1(-(Follows)->Account2)+))
  --starting point
  AND  Account1.AccountHandle = '@Cassandra_Villegas'
)
SELECT *
FROM   BaseRows
       --is the starting point connected to:
WHERE  ConnectedToAccountHandle = '@Lynn_Escobar'
OPTION (MAXDOP 1);

/*
This returns:

ConnectedPath                                       
----------------------------------------------------
@Cassandra_Villegas->@Tonia_Mueller->@Lynn_Escobar  

In some cases, I have found taht filtering in the query itself can be troublesome. So it can be usefult to just save off the baserows into a temp table like this:
*/

----------------------------------------------------------------------------------------------------------
--*****
--Finding a specific decendent by saving off ALL decendents, then filtering in temp table
--*****
----------------------------------------------------------------------------------------------------------

DROP TABLE IF EXISTS #Hold

--3 in test rig
SELECT Account1.AccountHandle + '->' + 
       STRING_AGG(Account2.AccountHandle, '->') WITHIN GROUP (GRAPH PATH) AS ConnectedPath, 
       LAST_VALUE(Account2.AccountHandle) WITHIN GROUP (GRAPH PATH) AS ConnectedToAccountHandle,
	   COUNT(Account2.AccountHandle) WITHIN GROUP (GRAPH PATH) AS Level
INTO #hold
FROM   SocialGraph.Account AS Account1
                   ,SocialGraph.Account FOR PATH AS Account2
                   ,SocialGraph.Follows FOR PATH AS Follows
WHERE  MATCH(SHORTEST_PATH(Account1(-(Follows)->Account2)+))
  AND  Account1.AccountHandle = '@Cassandra_Villegas'
ORDER BY ConnectedPath
OPTION (MAXDOP 1);

SELECT *
FROM   #hold
WHERE  ConnectedToAccountHandle = '@Lynn_Escobar';

/*
This returns the same output as before. Both of these queries will show up in the test rig in the download that will run all the queries with a large data set.

Returning all paths between two nodes


While it is often useful just to know that you are connected to a person. It may also be interesting to know the multiple ways you are connected. There are a few ways of doing this. For example, for the first two levels, you can write two SELECT statements. One for the direct connections. The other for second level connections.
*/
--4 in test rig
SELECT  1 AS Level, '' AS ConnectedThrough, Account2.AccountHandle
FROM    SocialGraph.Account AS Account1,
        SocialGraph.Follows,
		SocialGraph.Account AS Account2
WHERE   MATCH(Account1-(Follows)->Account2)
  AND   Account1.AccountHandle = '@Cassandra_Villegas'
  AND   Account2.AccountHandle = '@Lynn_Escobar'
UNION ALL
SELECT  2 AS Level, Account2.AccountHandle AS ConnectedThrough, Account3.AccountHandle
FROM    SocialGraph.Account AS Account1,
        SocialGraph.Follows,
		SocialGraph.Account AS Account2,
        SocialGraph.Follows AS Follows2,
		SocialGraph.Account AS Account3
WHERE   MATCH(Account1-(Follows)->Account2-(Follows2)->Account3)
  AND   Account1.AccountHandle = '@Cassandra_Villegas'
  AND   Account3.AccountHandle = '@Lynn_Escobar'
ORDER BY AccountHandle
/*
This returns:

Level       ConnectedThrough               AccountHandle
----------- ------------------------------ ---------------
2           @Tonia_Mueller                 @Lynn_Escobar
2           @Willie_Charles                @Lynn_Escobar
2           @Gerald_Scott                  @Lynn_Escobar

On the one hand, this is kind of tedious to write, particularly if you need to do this many more levels. On the other hand, this probably will perform quite nicely because it is very similar to a couple of joins.

If you want to see ALL paths for all levels, once you get the hang of writing recursive CTEs, it is a lot easier to use the recursive version we have used in previous chapters, including the previous when we built the DAG implementation. The biggest difference is that in this cas, you will have to stop the recursion when you hit cycles in the output. Back in Figure 8.1, you can see that @Willie_Charles and @Lynn_Escobar follow each other.  This was also covered back in chapter 3, QUerying Data\Traversing Variable Length Paths\Finding all paths between nodes.

We can write the following query, filtering for the one account we want to see how they connect. I limited the output to 5 levels so you could see all of them:
*/

--Getting the same results as the last example
--5 in test rig

DECLARE @MaxLevel INT =5,
		@AccountHandle NVARCHAR(30) = '@Cassandra_Villegas',
		@DetermineHowConnected NVARCHAR(30) = 
                                             '@Lynn_Escobar';

WITH BaseRows
AS (
    --the CTE anchor is just the starting node
    SELECT Account.AccountHandle AS AccountHandle,
           Account.AccountHandle AS FollowsAccountHandle,

         --the path that contains the readable path we have 
         --built in all examples with the anchor included
           CAST('\' + Account.AccountHandle + '\' 
                                      AS NVARCHAR(4000)) AS Path, 
           0 AS level --the level
    FROM SocialGraph.Account
    WHERE Account.AccountHandle = @AccountHandle
    UNION ALL
    --pretty typical 1 level graph query:
    SELECT  Account.AccountHandle,
            FollowedAccount.AccountHandle 
                          AS FollowsAccountHandle,
            BaseRows.Path + FollowedAccount.AccountHandle + '\',
            BaseRows.level + 1
    FROM SocialGraph.Account,
            SocialGraph.Follows,
            SocialGraph.Account AS FollowedAccount,
            BaseRows
    WHERE MATCH(Account-(Follows)->FollowedAccount)
        --this joins the anchor to the recursive 
          --part of the query
        AND BaseRows.FollowsAccountHandle = 
                                    Account.AccountHandle
    --this is the part that stops recursion, treating the
        --string value like an array
        AND NOT BaseRows.Path LIKE CONCAT('%\', 
                            FollowedAccount.AccountHandle, '\%')
                AND BaseRows.level < @MaxLevel
    )

SELECT Path --for space reasons only
FROM BaseRows
WHERE FollowsAccountHandle = @DetermineHowConnected
ORDER BY Path;

/*
This returns:

Path
---------------------------------------------------------------------------------
\@Cassandra_Villegas\@Gerald_Scott\@Lynn_Escobar\
\@Cassandra_Villegas\@Gerald_Scott\@Willie_Charles\@Lynn_Escobar\
\@Cassandra_Villegas\@Tonia_Mueller\@Gerald_Scott\@Lynn_Escobar\
\@Cassandra_Villegas\@Tonia_Mueller\@Gerald_Scott\@Willie_Charles\@Lynn_Escobar\
\@Cassandra_Villegas\@Tonia_Mueller\@Lynn_Escobar\
\@Cassandra_Villegas\@Willie_Charles\@Lynn_Escobar\

From there You could filter\sort the output using the level, or the path. For example, change the previous query's where clause to include

AND Path like '_%\@Tonia_Mueller\%_' 

To get only paths that pass through @Tonia_Mueller.
*/

DECLARE @MaxLevel INT =5,
		@AccountHandle NVARCHAR(30) = '@Cassandra_Villegas',
		@DetermineHowConnected NVARCHAR(30) = 
                                             '@Lynn_Escobar';

WITH BaseRows
AS (
    --the CTE anchor is just the starting node
    SELECT Account.AccountHandle AS AccountHandle,
           Account.AccountHandle AS FollowsAccountHandle,

         --the path that contains the readable path we have 
         --built in all examples with the anchor included
           CAST('\' + Account.AccountHandle + '\' 
                                      AS NVARCHAR(4000)) AS Path, 
           0 AS level --the level
    FROM SocialGraph.Account
    WHERE Account.AccountHandle = @AccountHandle
    UNION ALL
    --pretty typical 1 level graph query:
    SELECT  Account.AccountHandle,
            FollowedAccount.AccountHandle 
                          AS FollowsAccountHandle,
            BaseRows.Path + FollowedAccount.AccountHandle + '\',
            BaseRows.level + 1
    FROM SocialGraph.Account,
            SocialGraph.Follows,
            SocialGraph.Account AS FollowedAccount,
            BaseRows
    WHERE MATCH(Account-(Follows)->FollowedAccount)
        --this joins the anchor to the recursive 
          --part of the query
        AND BaseRows.FollowsAccountHandle = 
                                    Account.AccountHandle
    --this is the part that stops recursion, treating the
        --string value like an array
        AND NOT BaseRows.Path LIKE CONCAT('%\', 
                            FollowedAccount.AccountHandle, '\%')
                AND BaseRows.level < @MaxLevel
    )

SELECT Path --for space reasons only
FROM BaseRows
WHERE FollowsAccountHandle = @DetermineHowConnected
AND Path like '_%\@Tonia_Mueller\%_' --<-- added just this, now we see only paths including @Tonia_Mueller
ORDER BY Path;


----------------------------------------------------------------------------------------------------------
--*****
--Finding all people that a user follows at any level, where they share a interest.
--*****
----------------------------------------------------------------------------------------------------------

/*
Where the graph syntax start to shine is finding even more connections. In this case, I want to find users connected to each other at any level that have an interest in Aircraft Spotting (Cassandra does not currently have this interest noted, but it doesn't matter if they did).  We are taking the last node in the chain, and then matching their nodes to their interests.
*/

--6 in test rig
----any level connection and connections have a specific interest
SELECT Account1.AccountHandle + '->' + 
       STRING_AGG(Account2.AccountHandle, '->') 
           WITHIN GROUP (GRAPH PATH) AS ConnectedPath, 
       LAST_VALUE(Account2.AccountHandle) 
           WITHIN GROUP (GRAPH PATH) AS ConnectedToAccountHandle,
       COUNT(Account2.AccountHandle) 
           WITHIN GROUP (GRAPH PATH) AS LEVEL,
       Interest.InterestName
FROM   SocialGraph.Account AS Account1
       ,SocialGraph.Account FOR PATH AS Account2
       ,SocialGraph.Follows FOR PATH AS Follows
       ,SocialGraph.InterestedIn
       ,SocialGraph.Interest
--This finds people that the searched for person follows
WHERE  MATCH(SHORTEST_PATH(Account1(-(Follows)->Account2)+) 
  --and this takes every matched node (the last node in the chain
  --and sees if they are connected to Interest
  AND LAST_NODE(Account2)-(InterestedIn)->Interest)
  --The next two lines filter the results;
  AND  Account1.AccountHandle = '@Cassandra_Villegas'
  AND  Interest.InterestName = 'Aircraft Spotting'
ORDER BY ConnectedPath
OPTION (MAXDOP 1);


/*
This returns (including only the path for space reasons):

ConnectedPath                                          ConnectedToAccountHandle       LEVEL       InterestName
------------------------------------------------------------------------------------- ----------- ------------------------------
@Cassandra_Villegas->@Tonia_Mueller                    @Tonia_Mueller                 1           Aircraft Spotting
@Cassandra_Villegas->@Tonia_Mueller->@Lynn_Escobar     @Lynn_Escobar                  2           Aircraft Spotting
@Cassandra_Villegas->@Willie_Charles                   @Willie_Charles                1           Aircraft Spotting



Trace the connections on Figure 8-2, and you will see These 3 people share an afinity for Aircraft Spotting and are all followed by @Cassandra_Villegas.

*/


----------------------------------------------------------------------------------------------------------
--*****
--Finding all people that a user follows at any level, where the follower has a specific interest. Filtered by
--temp table.
--*****
----------------------------------------------------------------------------------------------------------
/*
Like before, there can be performance reasons to filter some of the rows in a temporary table as you data needs grow. Sometimes it defies logic because you are actually fetching more rows, storing them off in a temp table. A lot will depend on your server size and data needs.
*/

--7 in test rig
--any level connection and shared specific interest
DROP TABLE IF EXISTS #BaseRows
SELECT Account1.AccountHandle + '->' + 
       STRING_AGG(Account2.AccountHandle, '->') WITHIN GROUP (GRAPH PATH) AS ConnectedPath, 
       LAST_VALUE(Account2.AccountHandle) WITHIN GROUP (GRAPH PATH) AS ConnectedToAccountHandle,
	   COUNT(Account2.AccountHandle) WITHIN GROUP (GRAPH PATH) AS LEVEL,
	   Interest.InterestName AS InterestName
INTO #BaseRows
FROM   SocialGraph.Account AS Account1
                   ,SocialGraph.Account FOR PATH AS Account2
                   ,SocialGraph.Follows FOR PATH AS Follows
				   ,SocialGraph.InterestedIn
				   ,SocialGraph.Interest
WHERE  MATCH(SHORTEST_PATH(Account1(-(Follows)->Account2)+) AND LAST_NODE(Account2)-(InterestedIn)->Interest)
  AND  Account1.AccountHandle = '@Cassandra_Villegas'
OPTION (MAXDOP 1);

SELECT *
FROM   #BaseRows
WHERE  InterestName = 'Aircraft Spotting'
ORDER BY ConnectedPath


----------------------------------------------------------------------------------------------------------
--*****
--Finding a specific user that a user follows at any level, where they share a specific interest. Filtered 
--in CTE
--*****
----------------------------------------------------------------------------------------------------------

--8 in test rig
--any level connection and shared common interest
WITH BaseRows AS (
SELECT Account1.AccountHandle + '->' + 
       STRING_AGG(Account2.AccountHandle, '->') 
           WITHIN GROUP (GRAPH PATH) AS ConnectedPath, 
       LAST_VALUE(Account2.AccountHandle) 
           WITHIN GROUP (GRAPH PATH) AS ConnectedToAccountHandle,
       COUNT(Account2.AccountHandle) 
           WITHIN GROUP (GRAPH PATH) AS LEVEL,
       Interest.InterestName AS InterestName
FROM   SocialGraph.Account AS Account1
       ,SocialGraph.Account FOR PATH AS Account2
       ,SocialGraph.Follows FOR PATH AS Follows
       ,SocialGraph.InterestedIn
       ,SocialGraph.InterestedIn AS InterestedIn2
       ,SocialGraph.Interest
WHERE  MATCH(SHORTEST_PATH(Account1(-(Follows)->Account2)+) 
  --Both Accounts interested in the same thing
  AND LAST_NODE(Account2)-(InterestedIn)->Interest
                       <-(InterestedIn2)-Account1)
  AND  Account1.AccountHandle = '@Cassandra_Villegas'
)
SELECT InterestName, ConnectedPath
FROM   BaseRows
WHERE  ConnectedToAccountHandle = '@Tonia_Mueller'
ORDER BY ConnectedPath
OPTION (MAXDOP 1);
/*
This returns:

InterestName  ConnectedPath
------------- ---------------------------------------------
Airsofting    @Cassandra_Villegas->@Tonia_Mueller

Which if you check the diagram in Figure 8-1, you can see that they do in fact share that interest.

*/

 WITH BaseRows AS (
SELECT Account1.AccountHandle + '->' + 
       STRING_AGG(Account2.AccountHandle, '->') 
           WITHIN GROUP (GRAPH PATH) AS ConnectedPath, 
       LAST_VALUE(Account2.AccountHandle) 
           WITHIN GROUP (GRAPH PATH) AS ConnectedToAccountHandle,
       COUNT(Account2.AccountHandle) 
           WITHIN GROUP (GRAPH PATH) AS LEVEL,
       Interest.InterestName AS InterestName
FROM   SocialGraph.Account AS Account1
       ,SocialGraph.Account FOR PATH AS Account2
       ,SocialGraph.Follows FOR PATH AS Follows
       ,SocialGraph.InterestedIn
       ,SocialGraph.InterestedIn AS InterestedIn2
       ,SocialGraph.Interest
WHERE  MATCH(SHORTEST_PATH(Account1(-(Follows)->Account2)+) 
  --Both Accounts interested in the same thing
  AND LAST_NODE(Account2)-(InterestedIn)->Interest
                       <-(InterestedIn2)-Account1)
  AND  Account1.AccountHandle = '@Cassandra_Villegas'
  ANd  Interest.InterestName =  'Airsofting'
)
SELECT InterestName, ConnectedPath
FROM   BaseRows
WHERE  ConnectedToAccountHandle = '@Tonia_Mueller'
ORDER BY ConnectedPath
OPTION (MAXDOP 1);



 ----------------------------------------------------------------------------------------------------------
 --
 ----------------------------------------------------------------------------------------------------------
 
--9 Query to get only 
SELECT Account1.AccountHandle + '->' + 
       STRING_AGG(Account2.AccountHandle, '->') WITHIN GROUP (GRAPH PATH) AS ConnectedPath, 
       LAST_VALUE(Account2.AccountHandle) WITHIN GROUP (GRAPH PATH) AS ConnectedToAccountHandle,
	   COUNT(Account2.AccountHandle) WITHIN GROUP (GRAPH PATH) AS LEVEL,
	   Interest.InterestName AS InterestName
FROM   SocialGraph.Account AS Account1
                   ,SocialGraph.Account FOR PATH AS Account2
                   ,SocialGraph.Follows FOR PATH AS Follows
				   ,SocialGraph.InterestedIn
				   ,SocialGraph.Interest
				   ,SocialGraph.InterestedIn AS InterestedIn2
WHERE  MATCH(SHORTEST_PATH(Account1(-(Follows)->Account2)+) 
  AND LAST_NODE(Account2)-(InterestedIn)->Interest<-(InterestedIn2)-Account1)
  AND  Account1.AccountHandle = '@Cassandra_Villegas'  
  ANd  Interest.InterestName =  'Airsofting'
 OPTION (MAXDOP 1);

 SELECT Account1.AccountHandle,
       Interest.InterestName,
       Account2.AccountHandle
FROM   SocialGraph.Account AS Account1
       ,SocialGraph.Account AS Account2
       ,SocialGraph.InterestedIn AS InterestedIn1
       ,SocialGraph.InterestedIn  AS InterestedIn2
       ,SocialGraph.Interest AS Interest
WHERE  MATCH(Account1-(InterestedIn1)->Interest
                                  <-(InterestedIn2)-Account2)
  AND  Account1.AccountHandle = '@Cassandra_Villegas'
  AND  Account1.AccountHandle <> Account2.AccountHandle 
  AND  Interest.InterestName = 'Airsofting'
OPTION (MAXDOP 1);


----------------------------------------------------------------------------------------------------------
--*****
--Finding users that a person is connected to directly through interest
--******
----------------------------------------------------------------------------------------------------------

/*In these last set of query examples, I am going to do one of the more interesting types of queries you will want to do with your graphs. Connecting people by alternative links. For example, in our graph, instead of following connections through Follows links, lets consider them connected when they share an interest. This first query is going to give us first level connections through Airsofting.
*/
--10
SELECT Account1.AccountHandle,
		Interest.InterestName,
		Account2.AccountHandle

FROM   SocialGraph.Account AS Account1
                   ,SocialGraph.Account AS Account2
				   ,SocialGraph.InterestedIn AS InterestedIn1
				   ,SocialGraph.InterestedIn  AS InterestedIn2
				   ,SocialGraph.Interest AS Interest
WHERE  MATCH(Account1-(InterestedIn1)->Interest<-(InterestedIn2)-Account2)
  AND  Account1.AccountHandle = '@Cassandra_Villegas'
  AND  Account1.AccountHandle <> Account2.AccountHandle 
  AND  Interest.InterestName = 'Airsofting'
OPTION (MAXDOP 1);

/*

This gives gives us the first level connections. 

AccountHandle                  InterestName                   AccountHandle
------------------------------ ------------------------------ ------------------------------
@Cassandra_Villegas            Airsofting                     @Tonia_Mueller
@Cassandra_Villegas            Airsofting                     @Willie_Charles

Casandra connects to Tonia and Willie through a shared interest in Airsofting. But now, what interests do Tonia and Willie share with others? Well, it turns out that you can do a shortest path over these larger MATCH expression as well. This also gives you a couple of more things you can filter on. Like if you want to specify the interest that people share in this chain. You can do this with attributes on the edge as well.

*/

--11 in test rig
SELECT Account1.AccountHandle 
+ '->' + 
       STRING_AGG(CONCAT('(',Interest.InterestName,')->', 
                               Account2.AccountHandle) , '->') 
          WITHIN GROUP (GRAPH PATH) AS ConnectedPath, 
       LAST_VALUE(Account2.AccountHandle) 
          WITHIN GROUP (GRAPH PATH) AS ConnectedToAccountHandle,
       COUNT(Account2.AccountHandle) 
          WITHIN GROUP (GRAPH PATH) AS Level
FROM   SocialGraph.Account AS Account1
       ,SocialGraph.Account FOR PATH AS Account2
       ,SocialGraph.InterestedIn FOR PATH AS InterestedIn1
       ,SocialGraph.InterestedIn FOR PATH AS InterestedIn2
       ,SocialGraph.Interest FOR PATH AS Interest
       --only fetching 2 levels for testing reasons. This 
       --is where tests can get bogged down, so keeping it to 
       --only what you want/need is important
WHERE  MATCH(SHORTEST_PATH(Account1(-(InterestedIn1)->Interest
                              <-(InterestedIn2)-Account2){1,2}))
  AND  Account1.AccountHandle = '@Cassandra_Villegas'
OPTION (MAXDOP 1);

/*
This returns the following paths:

ConnectedPath                                                                      
-----------------------------------------------------------------------------------
@Cassandra_Villegas->(Airsofting)->@Tonia_Mueller                                 
@Cassandra_Villegas->(Airsofting)->@Cassandra_Villegas                            
@Cassandra_Villegas->(Airsofting)->@Willie_Charles                                
@Cassandra_Villegas->(Airsofting)->@Tonia_Mueller->(3D printing)->@Gerald_Scott  
@Cassandra_Villegas->(Airsofting)->@Tonia_Mueller->(Air sports)->@Lynn_Escobar   

This type of solution doesn't make as much sense in a model like this, unless you have categories of interests. Where this can be useful is if you have a database like the IMDB database. If you want to see who worked with whom, you may have to go one or more edges that show that one person worked on a piece of work in some capacity. Then other people also worked on it as well. You don't have a direct connection, but you do have this indirect connection. 
From a performance standpoint, this kind of query can be quite costly. It may also benefit the most from the temporary table solutions.

While this is not nearly everything you will want to do with a graph, as there are many different uses you will have for a graph, but it is all I wiil cover in this edition of the book for graph queries. 

*/

