/*
This file is used to generate random values for testing out the graph that is implemented in 0001 - Create Tables.sql (after executing 0002 - Load Interests.sql and 0003 - Load Accounts.sql.) It uses RAND() to generate random data, but aslo it includes a seed value that allows you to use the exact same dataset that I use.
*/

:SETVAR SeedValue 259906607

--Max 100000
:SETVAR AccountCount 100000
--Max 434
:SETVAR InterestCount 434

:SETVAR FollowsCount 300000

:SETVAR MaxInterestPerAccount 15


USE SocialGraph;
GO

TRUNCATE TABLE SocialGraph.Follows;
TRUNCATE TABLE SocialGraph.InterestedIn;
SET NOCOUNT ON;
DELETE FROM SocialGraph.Account;
DELETE FROM SocialGraph.Interest;

INSERT INTO SocialGraph.Account(AccountHandle)
SELECT AccountHandle
FROM   Staging.Account
WHERE  AccountId <= $(AccountCount);

INSERT INTO SocialGraph.Interest(InterestName)
SELECT InterestName
FROM   Staging.Interest
WHERE  InterestId <= $(InterestCount);



--NOTE: Some errors are acceptable. in the seed provided, there are a few random errors
--There will be 299993 follows, and 700902



DECLARE @seed INT, --set this to a specific number to get repeatable set
	    @msg nvarchar(1000)
SET @seed = $(SeedValue)
SET @seed = COALESCE(@seed,2147483647 * RAND())

DECLARE @InstantiateSeed INT = RAND(@seed)

SET @Msg = CONCAT('Current seed: ',@seed, '  Capture seed if set gives you what you desire')
SELECT @msg

DROP TABLE IF EXISTS #HoldAccount;

CREATE TABLE #HoldAccount(
SequenceNumber INT  IDENTITY PRIMARY KEY,
NodeId NVARCHAR(1000)
)
INSERT INTO #HoldAccount
(
    NodeId
)
SELECT $node_id
FROM   SocialGraph.Account
ORDER BY AccountHandle


DECLARE @RowsToInsert INT = $(FollowsCount), @CurrentCount INT = 0, 
		@RowsInAccount INT = (SELECT COUNT(*) FROM SocialGraph.Account)
WHILE 1=1
 BEGIN
	DECLARE @FromId NVARCHAR(1000), @ToId NVARCHAR(1000)

	DECLARE @GetValue1 INT = (@RowsInAccount * RAND()) + 1

	SELECT @FromId = NodeId
	FROM  #HoldAccount
	WHERE SequenceNumber = @GetValue1
		
	DECLARE @GetValue2 INT = (@RowsInAccount * RAND()) + 1

	IF @GetValue2 <> @GetValue1
	 BEGIN
		SELECT @ToId = NodeId
		FROM  #HoldAccount
		WHERE SequenceNumber = @GetValue2

		INSERT INTO SocialGraph.Follows($From_id, $To_id)
		SELECT @FromId, @ToId
		WHERE NOT EXISTS (SELECT *
						  FROM   SocialGraph.Follows
						  WHERE  $from_id = @FromId
						    AND  $to_id = @ToId)
    END
	
	SET @CurrentCount = @CurrentCount + 1;
	IF @CurrentCount = @RowsToInsert
	 BREAK

	IF @CurrentCount % 20000 = 0
		RAISERROR ('Another 20000 Follows Added',10,1) WITH NOWAIT;

 END

GO
SELECT COUNT(*) AS FollowsRowCount
FROM SocialGraph.Follows;
GO

PRINT 'Starting the load of interested'


DROP TABLE IF EXISTS #HoldInterest;
CREATE TABLE #HoldInterest(
SequenceNumber INT  IDENTITY PRIMARY KEY,
NodeId NVARCHAR(1000)
)
INSERT INTO #HoldInterest
(
    NodeId
)
SELECT $node_id
FROM   SocialGraph.Interest
ORDER BY Interest.InterestName

DECLARE @Cursor CURSOR, @FromId NVARCHAR(1000), @RandomInterestCount INT, 
		@MaxInterestCount INT = $(MaxInterestPerAccount), @RowLoopCounter INT, 
		@RowsInInterest INT = (SELECT COUNT(*) FROM SocialGraph.Interest),
		@GetId INT, @AccountLoopCounter INT = 0
		 

SET @Cursor = CURSOR FOR SELECT $node_id AS NodeId FROM SocialGraph.Account ORDER BY AccountHandle
OPEN @Cursor
WHILE 1=1
 BEGIN
	SET @AccountLoopCounter = @AccountLoopCounter + 1;
	FETCH NEXT FROM @Cursor INTO @FromId
	IF @@FETCH_STATUS <> 0
	   BREAK;

	SET @RandomInterestCount = RAND() * @MaxInterestCount

	SET @RowLoopCounter = 0
	WHILE @RowLoopCounter < @RandomInterestCount
	 BEGIN
		SET @GetId = (@RowsInInterest * RAND()) + 1

		INSERT INTO SocialGraph.InterestedIn ($from_id, $to_id) 
		SELECT @FromID, NodeId
		FROM   #HoldInterest
		WHERE  SequenceNumber = @Getid
		 AND   NOT EXISTS (SELECT *
							FROM  SocialGraph.InterestedIn
							WHERE  $from_id = @FromId
							  AND  $to_id = #HoldInterest.NodeId);

		SET @RowLoopCounter = @RowLoopCounter + 1;
	 END;

	 	IF @AccountLoopCounter % 5000 = 0
		RAISERROR ('Another 5000 Account''s Interests Generated',10,1) WITH NOWAIT;
  END;
GO

ALTER INDEX ALL ON SocialGraph.Account REBUILD
ALTER INDEX ALL ON SocialGraph.InterestedIn REBUILD
ALTER INDEX ALL ON SocialGraph.Follows REBUILD
ALTER INDEX ALL ON SocialGraph.Interest REBUILD

GO

/*
Sample output included so you can compare the data in the table to what I had when I generated it. The #node_id and other graph column values don't matter, just the logical values.

*/


--USED TO find the more interesting rows
WITH BaseRows AS (
SELECT *, (SELECT COUNT(*) FROM SocialGraph.Follows WHERE  Account.$node_id = $from_id) AS Froms,
          (SELECT COUNT(*) FROM SocialGraph.Follows WHERE  Account.$node_id = $to_id) AS Tos
FROM    SocialGraph.Account
)
SELECT TOP 1000 *
FROM   BaseRows
ORDER BY BaseRows.Froms + BaseRows.Tos ASC, AccountHandle;


--@Adriana_Fernandez
--@Alana_Case
--@Alexander_Stewart
--@Alice_Beck
--@Alicia_Zhang
--@Alisa_Powell
--@Alissa_Galloway
--@Alissa_Rogers
--@Allan_Parker

--USED TO find the more interesting rows
WITH BaseRows AS (
SELECT *, (SELECT COUNT(*) FROM SocialGraph.Follows WHERE  Account.$node_id = $from_id) AS Froms,
          (SELECT COUNT(*) FROM SocialGraph.Follows WHERE  Account.$node_id = $to_id) AS Tos
FROM    SocialGraph.Account
)
SELECT TOP 10 *
FROM   BaseRows
ORDER BY BaseRows.Froms + BaseRows.Tos DESC, AccountHandle;

--@Bryant_Huber	9	11
--@Ramiro_Lee	9	11
--@Sheila_Sherman	8	11
--@Angelica_O'Neill	7	11
--@Chester_Miles	7	11
--@Stacy_Charles	12	6
--@Alfredo_Booker	5	12
--@Amber_Carter	7	10
--@Angela_Castro	10	7
--@Elena_Blevins	11	6


WITH BaseRows AS (
SELECT *, (SELECT COUNT(*) FROM SocialGraph.InterestedIn WHERE  Interest.$Node_Id = $to_id) AS Froms
FROM SocialGraph.Interest

)
SELECT TOP 10 *
FROM   BaseRows
ORDER BY BaseRows.Froms ASC;

--{"type":"node","schema":"SocialGraph","table":"Interest","id":521}	Coloring	1486
--{"type":"node","schema":"SocialGraph","table":"Interest","id":659}	Learning An Instrument	1510
--{"type":"node","schema":"SocialGraph","table":"Interest","id":546}	Disc golf	1519
--{"type":"node","schema":"SocialGraph","table":"Interest","id":866}	Ziplining	1520
--{"type":"node","schema":"SocialGraph","table":"Interest","id":615}	Horse riding	1521
--{"type":"node","schema":"SocialGraph","table":"Interest","id":606}	Handwriting Analysis	1521
--{"type":"node","schema":"SocialGraph","table":"Interest","id":481}	Body Building	1522
--{"type":"node","schema":"SocialGraph","table":"Interest","id":725}	Powerboking	1523
--{"type":"node","schema":"SocialGraph","table":"Interest","id":747}	Renting movies	1524
--{"type":"node","schema":"SocialGraph","table":"Interest","id":826}	Train Spotting	1524

WITH BaseRows AS (
SELECT *, (SELECT COUNT(*) FROM SocialGraph.InterestedIn WHERE  Interest.$Node_Id = $to_id) AS Froms
FROM SocialGraph.Interest

)
SELECT TOP 10 *
FROM   BaseRows
ORDER BY BaseRows.Froms DESC;

--{"type":"node","schema":"SocialGraph","table":"Interest","id":434}	3D printing	1720
--{"type":"node","schema":"SocialGraph","table":"Interest","id":715}	Pinochle	1711
--{"type":"node","schema":"SocialGraph","table":"Interest","id":644}	Kitesurfing	1699
--{"type":"node","schema":"SocialGraph","table":"Interest","id":701}	Orienteering	1698
--{"type":"node","schema":"SocialGraph","table":"Interest","id":496}	Cake Decorating	1698
--{"type":"node","schema":"SocialGraph","table":"Interest","id":700}	Nordic skating	1692
--{"type":"node","schema":"SocialGraph","table":"Interest","id":463}	Beach Volleyball	1688
--{"type":"node","schema":"SocialGraph","table":"Interest","id":485}	Boomerangs	1687
--{"type":"node","schema":"SocialGraph","table":"Interest","id":451}	Art	1684
--{"type":"node","schema":"SocialGraph","table":"Interest","id":436}	Aeromodeling	1680