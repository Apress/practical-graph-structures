
--------------------
USE GraphDBTests
GO


------------------
SET NOCOUNT ON
GO

IF OBJECT_ID('SqlGraph.DataSetStats','U') is null
 CREATE TABLE SqlGraph.DataSetStats(
	TestSetName nvarchar(20) NOT NULL,
	CompanyCount Int
);
TRUNCATE TABLE SqlGraph.DataSetStats;


----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

DELETE FROM SQLGraph.ReportsTo
DELETE SqlGraph.Sale
DELETE SqlGraph.Company 
DBCC CHECKIDENT ('SqlGraph.Sale',RESEED,0)
DBCC CHECKIDENT ('SqlGraph.Company',RESEED,0)
ALTER SEQUENCE SqlGraph.CompanyDataGenerator_SEQUENCE RESTART
GO

DROP TABLE IF EXISTS #holdTiming;
SELECT GETDATE() AS CheckInTime
INTO  #holdTiming;

----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
EXEC SqlGraph.Company$Insert @Name = 'Company HQ', @ParentCompanyName = NULL;

EXEC SqlGraph.Company$Insert @Name = 'Maine HQ', @ParentCompanyName = 'Company HQ';

EXEC SqlGraph.Company$Insert @Name = 'Tennessee HQ', @ParentCompanyName = 'Company HQ';

EXEC SqlGraph.Company$Insert @Name = 'Nashville Branch', @ParentCompanyName = 'Tennessee HQ';
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'Nashville Branch';
GO
EXEC SqlGraph.Company$Insert @Name = 'Knoxville Branch', @ParentCompanyName = 'Tennessee HQ';

EXEC SqlGraph.Sale$InsertTestData @Name = 'Knoxville Branch';

EXEC SqlGraph.Company$Insert @Name = 'Memphis Branch', @ParentCompanyName = 'Tennessee HQ';

EXEC SqlGraph.Sale$InsertTestData @Name = 'Memphis Branch';

EXEC SqlGraph.Company$Insert @Name = 'Portland Branch', @ParentCompanyName = 'Maine HQ';

EXEC SqlGraph.Sale$InsertTestData @Name = 'Portland Branch';

EXEC SqlGraph.Company$Insert @Name = 'Camden Branch', @ParentCompanyName = 'Maine HQ';

EXEC SqlGraph.Sale$InsertTestData @Name = 'Camden Branch';
GO

INSERT INTO #holdTiming (CheckInTime)
SELECT GETDATE() AS CheckInTime
GO
SELECT CONCAT(DATEDIFF(millisecond,MIN(CheckInTime), MAX(CheckInTime)) / 1000.0,' Seconds')
from #holdTiming
GO
INSERT INTO SqlGraph.DataSetStats(TestSetName, CompanyCount)
SELECT 'SmallSet',COUNT(*)
FROM   SqlGraph.Company;
GO
SELECT *
from   SqlGraph.DataSetStats;