--run this all at once to get a new database as well as structures

ALTER DATABASE SocialGraph SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
GO
USE tempdb
GO
DROP DATABASE IF EXISTS SocialGraph
GO
CREATE DATABASE SocialGraph
GO


USE SocialGraph;
GO

DROP VIEW IF EXISTS SocialGraph.AllEdges;
DROP VIEW IF EXISTS SocialGraph.AllNodes;

DROP TABLE IF EXISTS  SocialGraph.AllEdgesTable

DROP PROCEDURE IF EXISTS SocialGraph.Account$Insert;
DROP PROCEDURE IF EXISTS SocialGraph.Account$InsertFollowers;

DROP TABLE IF EXISTS SocialGraph.Follows;
DROP TABLE IF EXISTS SocialGraph.InterestedIn;
DROP TABLE IF EXISTS SocialGraph.Account;
DROP TABLE IF EXISTS SocialGraph.Interest;



DROP SCHEMA IF EXISTS SocialGraph;
GO
CREATE SCHEMA SocialGraph;
GO

CREATE TABLE SocialGraph.Account (
   AccountHandle nvarchar(30) 
	CONSTRAINT AKAccount_Handle UNIQUE,
   --clusters on Node_id columns. Most fetches
   --will be on node_id, Handle usually only 
   --when getting first row(s)
   CONSTRAINT PKAccount PRIMARY KEY ($node_id)
) AS NODE;


CREATE TABLE SocialGraph.Follows (
   FollowTime datetime2(0) 
      CONSTRAINT DFLTFollows_FollowTime DEFAULT SYSDATETIME(),
	 --cannot add a PRIMARY KEY to the $from_id and $to_id columns
     --because they allow NULL values. SO the UNIQUE CLUSTERED index
      CONSTRAINT AKFollows_UniqueNodes UNIQUE CLUSTERED ( $to_id, $from_id),
	  --same columns, in reverse for when you are fetching by $to_id
	  --like for fetching follower, not who you follow
	  CONSTRAINT AKFollows_FromTO UNIQUE ( $from_id, $to_id),

	  --just allow connections from Account to Account
	  CONSTRAINT ECFollows_AccountToAccount 
	    CONNECTION (SocialGraph.Account 
		  TO SocialGraph.Account) ON DELETE NO Action
) AS EDGE;
GO

CREATE TRIGGER SocialGraph.Follows_IU_Trigger ON SocialGraph.Follows
AFTER INSERT, UPDATE
AS
BEGIN
	IF EXISTS (SELECT *
			   FROM   inserted
			   WHERE  $from_id = $to_id)
	   BEGIN
		ROLLBACK;
		THROW 50000,'Modified data introduces a self reference',1;
	   END;
END;
GO

CREATE TABLE SocialGraph.Interest (
    InterestName nvarchar(30) CONSTRAINT AKInterest_InterestName UNIQUE,
	CONSTRAINT PKInterest PRIMARY KEY ($node_id)
) AS NODE;

CREATE TABLE SocialGraph.InterestedIn 
(
	CONSTRAINT AKInterestedIn_UniqueNodes UNIQUE CLUSTERED ($from_id, $to_id),
	CONSTRAINT AKInterestedIn_ToFrom UNIQUE ($to_id, $from_id),
	CONSTRAINT ECInterestedIn_AccountToInterestBoth 
	     CONNECTION (SocialGraph.Account TO SocialGraph.Interest) ON DELETE NO ACTION
)
AS EDGE;

SELECT is_node, is_edge, name
FROM   sys.tables
WHERE  SCHEMA_NAME(tables.schema_id) = 'SocialGraph';

SELECT *
FROM   INFORMATION_SCHEMA.COLUMNS
WHERE  COLUMNS.TABLE_SCHEMA = 'SocialGraph'
ORDER BY COLUMNS.TABLE_NAME, ORDINAL_POSITION
GO

--this procedure can be used to simulate a user setting up an account
CREATE OR ALTER PROCEDURE SocialGraph.Account$Insert
(
    @AccountHandle			nvarchar(60),
    @InterestList			varchar(8000),
	@NonDirectionalLinkFlag bit = 1 --inserts both from and to for interest
	                                --relationship
)
AS
BEGIN
	--No error handling/transaction for simplicity of demo... 
	--You should have both when you do this for real

	--Insert the new row
    INSERT INTO SocialGraph.Account(AccountHandle)
    VALUES(@AccountHandle);

	--get the node id from the Account
	DECLARE @NodeId nvarchar(1000) 
	SET @NodeId = (SELECT $node_id FROM SocialGraph.Account WHERE AccountHandle = @AccountHandle)

	--create any new interests that don't currently exist
    INSERT INTO SocialGraph.Interest( InterestName)
    SELECT TRIM(value)
    FROM   STRING_SPLIT(@InterestList, ',') AS list
	WHERE  list.value <> ''
	  AND  list.value NOT IN (SELECT InterestName
						      FROM    SocialGraph.Interest)

	--create the interested in edges
	INSERT INTO SocialGraph.InterestedIn($from_id, $to_id)
	SELECT @NodeId,
			(SELECT $NODE_ID FROM SocialGraph.Interest WHERE Interest.InterestName = list.value)
	FROM   STRING_SPLIT(@InterestList, ',') AS list
	WHERE list.value <> ''

	IF @NonDirectionalLinkFlag = 1
	 BEGIN
		--create the interested in edges
        INSERT INTO SocialGraph.InterestedIn($from_id, $to_id)
        SELECT (SELECT $NODE_ID FROM SocialGraph.Interest WHERE Interest.InterestName = TRIM(list.value)),
			   @NodeId
        FROM   STRING_SPLIT(@InterestList, ',') AS list
        WHERE list.value <> ''

	 END


END
GO

--This is when a user is choosing who to follow later
CREATE OR ALTER PROCEDURE SocialGraph.Account$InsertFollowers
(
    @AccountHandle     nvarchar(60),
    @AccountHandleList varchar(8000) --limited to 8000 for demo, could be higher
)
AS
BEGIN
	--No error handling/transaction for simplicity of demo... 
	--You should have both when you do this for real

	--get the account's node_id value
	DECLARE @NodeId nvarchar(1000)
	SET @NodeId = (SELECT $NODE_ID FROM SocialGraph.Account WHERE AccountHandle = @AccountHandle)

	--insert accounts they follow
	INSERT INTO SocialGraph.Follows($from_id, $to_id)
	SELECT @NodeId,
			(SELECT $NODE_ID FROM SocialGraph.Account WHERE AccountHandle = TRIM(list.value))
	FROM   STRING_SPLIT(@AccountHandleList, ',') AS list
	WHERE  TRIM(list.value) <> ''

END;
GO


--EXEC SocialGraph.Account$Insert @AccountHandle = '@Joe',
--     @InterestList = 'Bowling,Craziness,Dogs,Lodge Membership,Pickup Trucks';
--EXEC SocialGraph.Account$Insert @AccountHandle = '@Sam', 
--     @InterestList = 'Bowling,Peace,Lodge Membership,Special Children';
--EXEC SocialGraph.Account$Insert @AccountHandle = '@Bertha', 
--     @InterestList = 'Computers';
--EXEC SocialGraph.Account$Insert @AccountHandle = '@Betty', 
--     @InterestList = 'Special Children';
--EXEC SocialGraph.Account$Insert @AccountHandle = '@Cameron', 
--     @InterestList = 'Lodge Membership,Pickup Trucks';
--EXEC SocialGraph.Account$Insert @AccountHandle = '@Charles', 
--     @InterestList = 'Lodge Membership,Bowling';
--EXEC SocialGraph.Account$Insert @AccountHandle = '@Merlin', 
--     @InterestList = 'Craziness,Magic';
--EXEC SocialGraph.Account$Insert @AccountHandle = '@Lewis', 
--     @InterestList = 'Bowling,Computers';
--EXEC SocialGraph.Account$Insert @AccountHandle = '@Cindy', 
--     @InterestList = 'Computers';
--EXEC SocialGraph.Account$Insert @AccountHandle = '@Thomas', 
--     @InterestList = 'Magic,Special Children';
--EXEC SocialGraph.Account$Insert @AccountHandle = '@Leonard', 
--     @InterestList = 'Bowling';
--EXEC SocialGraph.Account$Insert @AccountHandle = '@Fido', 
--     @InterestList = 'Dogs,Bones';

/*
--shows that trigger works
EXEC SocialGraph.Account$InsertFollowers @AccountHandle = '@Joe', 
     @AccountHandleList = '@Joe';
*/

--EXEC SocialGraph.Account$InsertFollowers @AccountHandle = '@Joe', 
--     @AccountHandleList = '@Sam,@Bertha,@Betty,@Charles,@Fido';
--EXEC SocialGraph.Account$InsertFollowers @AccountHandle = '@Sam', 
--     @AccountHandleList = '@Bertha,@Betty,@Joe';
--EXEC SocialGraph.Account$InsertFollowers @AccountHandle = '@Bertha', 
--     @AccountHandleList = '@Sam,@Joe,@Betty,@Lewis';
--EXEC SocialGraph.Account$InsertFollowers @AccountHandle = '@Betty', 
--     @AccountHandleList = '@Sam,@Bertha,@Joe';
--EXEC SocialGraph.Account$InsertFollowers @AccountHandle = '@Cameron', 
--     @AccountHandleList = '@Joe';
--EXEC SocialGraph.Account$InsertFollowers @AccountHandle = '@Charles', 
--     @AccountHandleList = '@Joe,@Sam';
--EXEC SocialGraph.Account$InsertFollowers @AccountHandle = '@Merlin', 
--     @AccountHandleList = '@Joe,@Sam';
--EXEC SocialGraph.Account$InsertFollowers @AccountHandle = '@Fido', 
--     @AccountHandleList = '@Joe';
--EXEC SocialGraph.Account$InsertFollowers @AccountHandle = '@Cindy', 
--     @AccountHandleList = '@Joe,@Sam,@Thomas,@Fido';
--EXEC SocialGraph.Account$InsertFollowers @AccountHandle = '@Thomas', 
--     @AccountHandleList = '@Sam,@Betty,@Cindy,@Lewis';
--EXEC SocialGraph.Account$InsertFollowers @AccountHandle = '@Leonard', 
--     @AccountHandleList = '@Joe';
--EXEC SocialGraph.Account$InsertFollowers @AccountHandle = '@Lewis', 
--     @AccountHandleList = '@Cameron';

GO

--used for 
CREATE OR ALTER VIEW SocialGraph.AllNodes AS 
	SELECT Account.AccountHandle AS Display, 'Account' AS NodeType, $node_id AS node_id
	FROM   SocialGraph.Account
	UNION ALL
	SELECT Interest.InterestName AS Display, 'Interest' AS NodeType, $node_id
	FROM   SocialGraph.Interest;
GO

CREATE OR ALTER VIEW SocialGraph.AllEdges AS 
	SELECT 'Follows' AS EdgeType, $from_id AS from_id, $to_id AS to_id
	FROM   SocialGraph.Follows
	UNION ALL
	SELECT 'InterestedIn' AS EdgeType, $from_id, $to_id
	FROM   SocialGraph.InterestedIn;
GO

--experimental
--CREATE TABLE SocialGraph.AllEdgesTable
--(
--	EdgeType nvarchar(100),
--) AS EDGE

--INSERT INTO SocialGraph.AllEdgesTable(EdgeType, $from_id, $to_id)
--SELECT EdgeType, from_id, to_id
--FROM   SocialGraph.AllEdges
--GO

GO
CREATE SCHEMA Staging;
GO
CREATE TABLE Staging.Interest (
	InterestId  INT IDENTITY CONSTRAINT AKInterest_InterestID PRIMARY KEY,
    InterestName nvarchar(30) CONSTRAINT AKInterest UNIQUE
);

CREATE TABLE Staging.Account (
   AccountId INT NOT NULL IDENTITY CONSTRAINT PKAccount PRIMARY KEY,
   AccountHandle nvarchar(30) CONSTRAINT AKAccount_Handle UNIQUE
); 