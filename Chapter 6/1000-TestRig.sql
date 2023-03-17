:SETVAR SchemaName SqlGraph
--:SETVAR SchemaName PathMethod
--:SETVAR SchemaName Helper


--change next value to -- to sent output to screen, blank to send to temp table
:setvar OutputToTempTable ""

SET NOCOUNT ON;

USE GraphDBTests
GO

DROP TABLE IF EXISTS #Company$ReturnHierarchy
DROP TABLE IF EXISTS #Company$CheckForChild
DROP TABLE IF EXISTS #Company$ReportSales


DROP TABLE IF EXISTS #holdTiming;
SELECT SYSDATETIME() AS CheckInTime, cast(CONCAT('_',(SELECT TestSetName FROM $(schemaName).DataSetStats),'_$(SchemaName)') as varchar(30)) AS StepName,'Starting' AS Location
INTO  #holdTiming;
GO

SELECT *
FROM   $(SchemaName).Datasetstats


if '$(SchemaName)' <> 'Helper'
 BEGIN

	INSERT INTO #holdTiming (CheckInTime, StepName, Location)
	VALUES (SYSDATETIME(),'Fetch All Children','Starting')

	DECLARE @Rootnode VARCHAR(20) = CASE (SELECT TestSetName FROM $(schemaName).DataSetStats) WHEN 'SmallSet' THEN 'Company HQ' ELSE 'node1' END

	SELECT 'Run1' AS Run, *
	$(OutputToTempTable)INTO #Company$ReturnHierarchy
	FROM $(SchemaName).Company$ReturnHierarchy (@RootNode)
	ORDER BY IdHierarchy;



	DECLARE @Case2 VARCHAR(20) = CASE (SELECT TestSetName FROM $(schemaName).DataSetStats) WHEN 'SmallSet' THEN 'Maine HQ' ELSE 'Node100' END

	$(OutputToTempTable)INSERT INTO #Company$ReturnHierarchy
	SELECT 'Run2',*
	FROM $(SchemaName).Company$ReturnHierarchy (@Case2)
	ORDER BY IdHierarchy;

	INSERT INTO #holdTiming (CheckInTime, StepName, Location)
	VALUES (SYSDATETIME(),'Fetch All Children','Ending')
 END

GO

GO
INSERT INTO #holdTiming (CheckInTime, StepName, Location)
VALUES (SYSDATETIME(),'Test Check For Child','Starting')

GO
DECLARE @Rootnode VARCHAR(20) = CASE (SELECT TestSetName FROM $(schemaName).DataSetStats) WHEN 'SmallSet' THEN 'Company HQ' ELSE 'Node1' END,
		@Case1 VARCHAR(20) = CASE (SELECT TestSetName FROM $(schemaName).DataSetStats) WHEN 'SmallSet' THEN 'Camden Branch' ELSE 'Node3032' END,
		@Case2 VARCHAR(20) = CASE (SELECT TestSetName FROM $(schemaName).DataSetStats) WHEN 'SmallSet' THEN 'Maine HQ' ELSE 'Node19' END,
		@Case3 VARCHAR(20) = CASE (SELECT TestSetName FROM $(schemaName).DataSetStats) WHEN 'SmallSet' THEN 'Tennessee HQ' ELSE 'Node10' END



SELECT (CASE $(SchemaName).Company$CheckForChild(@Case2,@RootNode) 
		WHEN 1 THEN 'Yes' ELSE 'No' END) AS Answer, 'Case2_to_RootNode' AS TestCase
$(OutputToTempTable)INTO #Company$CheckForChild

$(OutputToTempTable)INSERT INTO [#Company$CheckForChild] 
SELECT (CASE $(SchemaName).Company$CheckForChild(@Case1,@Case2) 
		WHEN 1 THEN 'Yes' ELSE 'No' END) AS Answer, 'Case1_to_Case2' AS TestCase
        
$(OutputToTempTable)INSERT INTO [#Company$CheckForChild] 
SELECT (CASE $(SchemaName).Company$CheckForChild(@Case1,@Case3) 
		WHEN 1 THEN 'Yes' ELSE 'No' END) AS Answer, 'Case1_to_Case3' AS TestCase
		
INSERT INTO #holdTiming (CheckInTime, StepName, Location)
VALUES (SYSDATETIME(),'Test Check For Child','Ending')
GO
INSERT INTO #holdTiming (CheckInTime, StepName, Location)
VALUES (SYSDATETIME(),'Aggregate Tree','Starting')

GO
DECLARE @Rootnode VARCHAR(20) = CASE (select TestSetName from $(schemaName).DataSetStats) WHEN 'SmallSet' THEN 'Company HQ' ELSE 'Node1' END,
		@Case1 VARCHAR(20) = CASE (select TestSetName from $(schemaName).DataSetStats) WHEN 'SmallSet' THEN 'Tennessee HQ' ELSE 'Node40' END

CREATE TABLE #Company$ReportSales(ParentCompanyId INT, Name VARCHAR(20), TotalSalesAmount DECIMAL(20,2), Hierarchy VARCHAR(max))

$(OutputToTempTable)INSERT INTO #Company$ReportSales ( ParentCompanyId, Name, TotalSalesAmount, Hierarchy)
EXEC $(SchemaName).Company$ReportSales @Case1

TRUNCATE TABLE #Company$ReportSales


$(OutputToTempTable)INSERT INTO #Company$ReportSales ( ParentCompanyId, Name, TotalSalesAmount, Hierarchy)
EXEC $(SchemaName).Company$ReportSales @RootNode

GO

INSERT INTO #holdTiming (CheckInTime, StepName, Location)
VALUES (SYSDATETIME(),'Aggregate Tree','Ending')


INSERT INTO #holdTiming (CheckInTime, StepName, Location)
SELECT sysdatetime(),concat('_',(select TestSetName from $(schemaName).DataSetStats),'_$(SchemaName)') AS StepName,'Ending' AS Location


SELECT StepName, CONCAT(DATEDIFF(millisecond,MIN(CheckInTime), MAX(CheckInTime)) / 1000.0,' Seconds')
FROM   #holdTiming
GROUP BY StepName


--SELECT * FROM #Company$ReturnHierarchy
--SELECT * FROM #Company$CheckForChild
--SELECT * FROM #Company$ReportSales
