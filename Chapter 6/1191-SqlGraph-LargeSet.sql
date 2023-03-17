
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
GO
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

DELETE FROM SQLGraph.ReportsTo
DELETE SqlGraph.Sale
DELETE SqlGraph.Company 
DBCC CHECKIDENT ('SqlGraph.Sale',RESEED,0)
DBCC CHECKIDENT ('SqlGraph.Company',RESEED,0)
ALTER SEQUENCE SqlGraph.CompanyDataGenerator_SEQUENCE RESTART
GO


------------------------------------------------------------------------------------------

DROP TABLE IF EXISTS #holdTiming;
SELECT GETDATE() AS CheckInTime
INTO  #holdTiming;


----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
EXEC SqlGraph.Company$Insert @Name = 'node1', @ParentCompanyName = NULL
GO
EXEC SqlGraph.Company$Insert @Name = 'node10', @ParentCompanyName = 'node1'
GO
EXEC SqlGraph.Company$Insert @Name = 'node100', @ParentCompanyName = 'node1'
GO
EXEC SqlGraph.Company$Insert @Name = 'node101', @ParentCompanyName = 'node1'
GO
EXEC SqlGraph.Company$Insert @Name = 'node11', @ParentCompanyName = 'node1'
GO
EXEC SqlGraph.Company$Insert @Name = 'node12', @ParentCompanyName = 'node1'
GO
EXEC SqlGraph.Company$Insert @Name = 'node13', @ParentCompanyName = 'node1'
GO
EXEC SqlGraph.Company$Insert @Name = 'node14', @ParentCompanyName = 'node1'
GO
EXEC SqlGraph.Company$Insert @Name = 'node15', @ParentCompanyName = 'node1'
GO
EXEC SqlGraph.Company$Insert @Name = 'node16', @ParentCompanyName = 'node1'
GO
EXEC SqlGraph.Company$Insert @Name = 'node17', @ParentCompanyName = 'node1'
GO
EXEC SqlGraph.Company$Insert @Name = 'node18', @ParentCompanyName = 'node1'
GO
EXEC SqlGraph.Company$Insert @Name = 'node19', @ParentCompanyName = 'node1'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2', @ParentCompanyName = 'node1'
GO
EXEC SqlGraph.Company$Insert @Name = 'node20', @ParentCompanyName = 'node1'
GO
EXEC SqlGraph.Company$Insert @Name = 'node21', @ParentCompanyName = 'node1'
GO
EXEC SqlGraph.Company$Insert @Name = 'node22', @ParentCompanyName = 'node1'
GO
EXEC SqlGraph.Company$Insert @Name = 'node23', @ParentCompanyName = 'node1'
GO
EXEC SqlGraph.Company$Insert @Name = 'node24', @ParentCompanyName = 'node1'
GO
EXEC SqlGraph.Company$Insert @Name = 'node25', @ParentCompanyName = 'node1'
GO
EXEC SqlGraph.Company$Insert @Name = 'node26', @ParentCompanyName = 'node1'
GO
EXEC SqlGraph.Company$Insert @Name = 'node27', @ParentCompanyName = 'node1'
GO
EXEC SqlGraph.Company$Insert @Name = 'node28', @ParentCompanyName = 'node1'
GO
EXEC SqlGraph.Company$Insert @Name = 'node29', @ParentCompanyName = 'node1'
GO
EXEC SqlGraph.Company$Insert @Name = 'node3', @ParentCompanyName = 'node1'
GO
EXEC SqlGraph.Company$Insert @Name = 'node30', @ParentCompanyName = 'node1'
GO
EXEC SqlGraph.Company$Insert @Name = 'node31', @ParentCompanyName = 'node1'
GO
EXEC SqlGraph.Company$Insert @Name = 'node32', @ParentCompanyName = 'node1'
GO
EXEC SqlGraph.Company$Insert @Name = 'node33', @ParentCompanyName = 'node1'
GO
EXEC SqlGraph.Company$Insert @Name = 'node34', @ParentCompanyName = 'node1'
GO
EXEC SqlGraph.Company$Insert @Name = 'node35', @ParentCompanyName = 'node1'
GO
EXEC SqlGraph.Company$Insert @Name = 'node36', @ParentCompanyName = 'node1'
GO
EXEC SqlGraph.Company$Insert @Name = 'node37', @ParentCompanyName = 'node1'
GO
EXEC SqlGraph.Company$Insert @Name = 'node38', @ParentCompanyName = 'node1'
GO
EXEC SqlGraph.Company$Insert @Name = 'node39', @ParentCompanyName = 'node1'
GO
EXEC SqlGraph.Company$Insert @Name = 'node4', @ParentCompanyName = 'node1'
GO
EXEC SqlGraph.Company$Insert @Name = 'node40', @ParentCompanyName = 'node1'
GO
EXEC SqlGraph.Company$Insert @Name = 'node41', @ParentCompanyName = 'node1'
GO
EXEC SqlGraph.Company$Insert @Name = 'node42', @ParentCompanyName = 'node1'
GO
EXEC SqlGraph.Company$Insert @Name = 'node43', @ParentCompanyName = 'node1'
GO
EXEC SqlGraph.Company$Insert @Name = 'node44', @ParentCompanyName = 'node1'
GO
EXEC SqlGraph.Company$Insert @Name = 'node45', @ParentCompanyName = 'node1'
GO
EXEC SqlGraph.Company$Insert @Name = 'node46', @ParentCompanyName = 'node1'
GO
EXEC SqlGraph.Company$Insert @Name = 'node47', @ParentCompanyName = 'node1'
GO
EXEC SqlGraph.Company$Insert @Name = 'node48', @ParentCompanyName = 'node1'
GO
EXEC SqlGraph.Company$Insert @Name = 'node49', @ParentCompanyName = 'node1'
GO
EXEC SqlGraph.Company$Insert @Name = 'node5', @ParentCompanyName = 'node1'
GO
EXEC SqlGraph.Company$Insert @Name = 'node50', @ParentCompanyName = 'node1'
GO
EXEC SqlGraph.Company$Insert @Name = 'node51', @ParentCompanyName = 'node1'
GO
EXEC SqlGraph.Company$Insert @Name = 'node52', @ParentCompanyName = 'node1'
GO
EXEC SqlGraph.Company$Insert @Name = 'node53', @ParentCompanyName = 'node1'
GO
EXEC SqlGraph.Company$Insert @Name = 'node54', @ParentCompanyName = 'node1'
GO
EXEC SqlGraph.Company$Insert @Name = 'node55', @ParentCompanyName = 'node1'
GO
EXEC SqlGraph.Company$Insert @Name = 'node56', @ParentCompanyName = 'node1'
GO
EXEC SqlGraph.Company$Insert @Name = 'node57', @ParentCompanyName = 'node1'
GO
EXEC SqlGraph.Company$Insert @Name = 'node58', @ParentCompanyName = 'node1'
GO
EXEC SqlGraph.Company$Insert @Name = 'node59', @ParentCompanyName = 'node1'
GO
EXEC SqlGraph.Company$Insert @Name = 'node6', @ParentCompanyName = 'node1'
GO
EXEC SqlGraph.Company$Insert @Name = 'node60', @ParentCompanyName = 'node1'
GO
EXEC SqlGraph.Company$Insert @Name = 'node61', @ParentCompanyName = 'node1'
GO
EXEC SqlGraph.Company$Insert @Name = 'node62', @ParentCompanyName = 'node1'
GO
EXEC SqlGraph.Company$Insert @Name = 'node63', @ParentCompanyName = 'node1'
GO
EXEC SqlGraph.Company$Insert @Name = 'node64', @ParentCompanyName = 'node1'
GO
EXEC SqlGraph.Company$Insert @Name = 'node65', @ParentCompanyName = 'node1'
GO
EXEC SqlGraph.Company$Insert @Name = 'node66', @ParentCompanyName = 'node1'
GO
EXEC SqlGraph.Company$Insert @Name = 'node67', @ParentCompanyName = 'node1'
GO
EXEC SqlGraph.Company$Insert @Name = 'node68', @ParentCompanyName = 'node1'
GO
EXEC SqlGraph.Company$Insert @Name = 'node69', @ParentCompanyName = 'node1'
GO
EXEC SqlGraph.Company$Insert @Name = 'node7', @ParentCompanyName = 'node1'
GO
EXEC SqlGraph.Company$Insert @Name = 'node70', @ParentCompanyName = 'node1'
GO
EXEC SqlGraph.Company$Insert @Name = 'node71', @ParentCompanyName = 'node1'
GO
EXEC SqlGraph.Company$Insert @Name = 'node72', @ParentCompanyName = 'node1'
GO
EXEC SqlGraph.Company$Insert @Name = 'node73', @ParentCompanyName = 'node1'
GO
EXEC SqlGraph.Company$Insert @Name = 'node74', @ParentCompanyName = 'node1'
GO
EXEC SqlGraph.Company$Insert @Name = 'node75', @ParentCompanyName = 'node1'
GO
EXEC SqlGraph.Company$Insert @Name = 'node76', @ParentCompanyName = 'node1'
GO
EXEC SqlGraph.Company$Insert @Name = 'node77', @ParentCompanyName = 'node1'
GO
EXEC SqlGraph.Company$Insert @Name = 'node78', @ParentCompanyName = 'node1'
GO
EXEC SqlGraph.Company$Insert @Name = 'node79', @ParentCompanyName = 'node1'
GO
EXEC SqlGraph.Company$Insert @Name = 'node8', @ParentCompanyName = 'node1'
GO
EXEC SqlGraph.Company$Insert @Name = 'node80', @ParentCompanyName = 'node1'
GO
EXEC SqlGraph.Company$Insert @Name = 'node81', @ParentCompanyName = 'node1'
GO
EXEC SqlGraph.Company$Insert @Name = 'node82', @ParentCompanyName = 'node1'
GO
EXEC SqlGraph.Company$Insert @Name = 'node83', @ParentCompanyName = 'node1'
GO
EXEC SqlGraph.Company$Insert @Name = 'node84', @ParentCompanyName = 'node1'
GO
EXEC SqlGraph.Company$Insert @Name = 'node85', @ParentCompanyName = 'node1'
GO
EXEC SqlGraph.Company$Insert @Name = 'node86', @ParentCompanyName = 'node1'
GO
EXEC SqlGraph.Company$Insert @Name = 'node87', @ParentCompanyName = 'node1'
GO
EXEC SqlGraph.Company$Insert @Name = 'node88', @ParentCompanyName = 'node1'
GO
EXEC SqlGraph.Company$Insert @Name = 'node89', @ParentCompanyName = 'node1'
GO
EXEC SqlGraph.Company$Insert @Name = 'node9', @ParentCompanyName = 'node1'
GO
EXEC SqlGraph.Company$Insert @Name = 'node90', @ParentCompanyName = 'node1'
GO
EXEC SqlGraph.Company$Insert @Name = 'node91', @ParentCompanyName = 'node1'
GO
EXEC SqlGraph.Company$Insert @Name = 'node92', @ParentCompanyName = 'node1'
GO
EXEC SqlGraph.Company$Insert @Name = 'node93', @ParentCompanyName = 'node1'
GO
EXEC SqlGraph.Company$Insert @Name = 'node94', @ParentCompanyName = 'node1'
GO
EXEC SqlGraph.Company$Insert @Name = 'node95', @ParentCompanyName = 'node1'
GO
EXEC SqlGraph.Company$Insert @Name = 'node96', @ParentCompanyName = 'node1'
GO
EXEC SqlGraph.Company$Insert @Name = 'node97', @ParentCompanyName = 'node1'
GO
EXEC SqlGraph.Company$Insert @Name = 'node98', @ParentCompanyName = 'node1'
GO
EXEC SqlGraph.Company$Insert @Name = 'node99', @ParentCompanyName = 'node1'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1034', @ParentCompanyName = 'node10'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1049', @ParentCompanyName = 'node10'
GO
EXEC SqlGraph.Company$Insert @Name = 'node197', @ParentCompanyName = 'node10'
GO
EXEC SqlGraph.Company$Insert @Name = 'node215', @ParentCompanyName = 'node10'
GO
EXEC SqlGraph.Company$Insert @Name = 'node279', @ParentCompanyName = 'node10'
GO
EXEC SqlGraph.Company$Insert @Name = 'node328', @ParentCompanyName = 'node10'
GO
EXEC SqlGraph.Company$Insert @Name = 'node367', @ParentCompanyName = 'node10'
GO
EXEC SqlGraph.Company$Insert @Name = 'node461', @ParentCompanyName = 'node10'
GO
EXEC SqlGraph.Company$Insert @Name = 'node469', @ParentCompanyName = 'node10'
GO
EXEC SqlGraph.Company$Insert @Name = 'node629', @ParentCompanyName = 'node10'
GO
EXEC SqlGraph.Company$Insert @Name = 'node683', @ParentCompanyName = 'node10'
GO
EXEC SqlGraph.Company$Insert @Name = 'node856', @ParentCompanyName = 'node10'
GO
EXEC SqlGraph.Company$Insert @Name = 'node875', @ParentCompanyName = 'node10'
GO
EXEC SqlGraph.Company$Insert @Name = 'node976', @ParentCompanyName = 'node10'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1001', @ParentCompanyName = 'node100'
GO
EXEC SqlGraph.Company$Insert @Name = 'node160', @ParentCompanyName = 'node100'
GO
EXEC SqlGraph.Company$Insert @Name = 'node309', @ParentCompanyName = 'node100'
GO
EXEC SqlGraph.Company$Insert @Name = 'node396', @ParentCompanyName = 'node100'
GO
EXEC SqlGraph.Company$Insert @Name = 'node501', @ParentCompanyName = 'node100'
GO
EXEC SqlGraph.Company$Insert @Name = 'node616', @ParentCompanyName = 'node100'
GO
EXEC SqlGraph.Company$Insert @Name = 'node994', @ParentCompanyName = 'node100'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node994'
GO
EXEC SqlGraph.Company$Insert @Name = 'node185', @ParentCompanyName = 'node101'
GO
EXEC SqlGraph.Company$Insert @Name = 'node227', @ParentCompanyName = 'node101'
GO
EXEC SqlGraph.Company$Insert @Name = 'node285', @ParentCompanyName = 'node101'
GO
EXEC SqlGraph.Company$Insert @Name = 'node333', @ParentCompanyName = 'node101'
GO
EXEC SqlGraph.Company$Insert @Name = 'node353', @ParentCompanyName = 'node101'
GO
EXEC SqlGraph.Company$Insert @Name = 'node459', @ParentCompanyName = 'node101'
GO
EXEC SqlGraph.Company$Insert @Name = 'node593', @ParentCompanyName = 'node101'
GO
EXEC SqlGraph.Company$Insert @Name = 'node599', @ParentCompanyName = 'node101'
GO
EXEC SqlGraph.Company$Insert @Name = 'node726', @ParentCompanyName = 'node101'
GO
EXEC SqlGraph.Company$Insert @Name = 'node855', @ParentCompanyName = 'node101'
GO
EXEC SqlGraph.Company$Insert @Name = 'node889', @ParentCompanyName = 'node101'
GO
EXEC SqlGraph.Company$Insert @Name = 'node912', @ParentCompanyName = 'node101'
GO
EXEC SqlGraph.Company$Insert @Name = 'node939', @ParentCompanyName = 'node101'
GO
EXEC SqlGraph.Company$Insert @Name = 'node967', @ParentCompanyName = 'node101'
GO
EXEC SqlGraph.Company$Insert @Name = 'node173', @ParentCompanyName = 'node11'
GO
EXEC SqlGraph.Company$Insert @Name = 'node204', @ParentCompanyName = 'node11'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node204'
GO
EXEC SqlGraph.Company$Insert @Name = 'node235', @ParentCompanyName = 'node11'
GO
EXEC SqlGraph.Company$Insert @Name = 'node248', @ParentCompanyName = 'node11'
GO
EXEC SqlGraph.Company$Insert @Name = 'node331', @ParentCompanyName = 'node11'
GO
EXEC SqlGraph.Company$Insert @Name = 'node350', @ParentCompanyName = 'node11'
GO
EXEC SqlGraph.Company$Insert @Name = 'node494', @ParentCompanyName = 'node11'
GO
EXEC SqlGraph.Company$Insert @Name = 'node531', @ParentCompanyName = 'node11'
GO
EXEC SqlGraph.Company$Insert @Name = 'node540', @ParentCompanyName = 'node11'
GO
EXEC SqlGraph.Company$Insert @Name = 'node631', @ParentCompanyName = 'node11'
GO
EXEC SqlGraph.Company$Insert @Name = 'node678', @ParentCompanyName = 'node11'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node678'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1008', @ParentCompanyName = 'node12'
GO
EXEC SqlGraph.Company$Insert @Name = 'node230', @ParentCompanyName = 'node12'
GO
EXEC SqlGraph.Company$Insert @Name = 'node370', @ParentCompanyName = 'node12'
GO
EXEC SqlGraph.Company$Insert @Name = 'node530', @ParentCompanyName = 'node12'
GO
EXEC SqlGraph.Company$Insert @Name = 'node572', @ParentCompanyName = 'node12'
GO
EXEC SqlGraph.Company$Insert @Name = 'node589', @ParentCompanyName = 'node12'
GO
EXEC SqlGraph.Company$Insert @Name = 'node594', @ParentCompanyName = 'node12'
GO
EXEC SqlGraph.Company$Insert @Name = 'node622', @ParentCompanyName = 'node12'
GO
EXEC SqlGraph.Company$Insert @Name = 'node651', @ParentCompanyName = 'node12'
GO
EXEC SqlGraph.Company$Insert @Name = 'node722', @ParentCompanyName = 'node12'
GO
EXEC SqlGraph.Company$Insert @Name = 'node728', @ParentCompanyName = 'node12'
GO
EXEC SqlGraph.Company$Insert @Name = 'node744', @ParentCompanyName = 'node12'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node744'
GO
EXEC SqlGraph.Company$Insert @Name = 'node833', @ParentCompanyName = 'node12'
GO
EXEC SqlGraph.Company$Insert @Name = 'node851', @ParentCompanyName = 'node12'
GO
EXEC SqlGraph.Company$Insert @Name = 'node883', @ParentCompanyName = 'node12'
GO
EXEC SqlGraph.Company$Insert @Name = 'node964', @ParentCompanyName = 'node12'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1061', @ParentCompanyName = 'node13'
GO
EXEC SqlGraph.Company$Insert @Name = 'node261', @ParentCompanyName = 'node13'
GO
EXEC SqlGraph.Company$Insert @Name = 'node413', @ParentCompanyName = 'node13'
GO
EXEC SqlGraph.Company$Insert @Name = 'node422', @ParentCompanyName = 'node13'
GO
EXEC SqlGraph.Company$Insert @Name = 'node465', @ParentCompanyName = 'node13'
GO
EXEC SqlGraph.Company$Insert @Name = 'node545', @ParentCompanyName = 'node13'
GO
EXEC SqlGraph.Company$Insert @Name = 'node565', @ParentCompanyName = 'node13'
GO
EXEC SqlGraph.Company$Insert @Name = 'node607', @ParentCompanyName = 'node13'
GO
EXEC SqlGraph.Company$Insert @Name = 'node700', @ParentCompanyName = 'node13'
GO
EXEC SqlGraph.Company$Insert @Name = 'node785', @ParentCompanyName = 'node13'
GO
EXEC SqlGraph.Company$Insert @Name = 'node791', @ParentCompanyName = 'node13'
GO
EXEC SqlGraph.Company$Insert @Name = 'node807', @ParentCompanyName = 'node13'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1014', @ParentCompanyName = 'node14'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1014'
GO
EXEC SqlGraph.Company$Insert @Name = 'node452', @ParentCompanyName = 'node14'
GO
EXEC SqlGraph.Company$Insert @Name = 'node552', @ParentCompanyName = 'node14'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node552'
GO
EXEC SqlGraph.Company$Insert @Name = 'node641', @ParentCompanyName = 'node14'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node641'
GO
EXEC SqlGraph.Company$Insert @Name = 'node957', @ParentCompanyName = 'node14'
GO
EXEC SqlGraph.Company$Insert @Name = 'node988', @ParentCompanyName = 'node14'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1051', @ParentCompanyName = 'node15'
GO
EXEC SqlGraph.Company$Insert @Name = 'node183', @ParentCompanyName = 'node15'
GO
EXEC SqlGraph.Company$Insert @Name = 'node263', @ParentCompanyName = 'node15'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node263'
GO
EXEC SqlGraph.Company$Insert @Name = 'node398', @ParentCompanyName = 'node15'
GO
EXEC SqlGraph.Company$Insert @Name = 'node670', @ParentCompanyName = 'node15'
GO
EXEC SqlGraph.Company$Insert @Name = 'node908', @ParentCompanyName = 'node15'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1003', @ParentCompanyName = 'node16'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1045', @ParentCompanyName = 'node16'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1090', @ParentCompanyName = 'node16'
GO
EXEC SqlGraph.Company$Insert @Name = 'node113', @ParentCompanyName = 'node16'
GO
EXEC SqlGraph.Company$Insert @Name = 'node241', @ParentCompanyName = 'node16'
GO
EXEC SqlGraph.Company$Insert @Name = 'node324', @ParentCompanyName = 'node16'
GO
EXEC SqlGraph.Company$Insert @Name = 'node412', @ParentCompanyName = 'node16'
GO
EXEC SqlGraph.Company$Insert @Name = 'node456', @ParentCompanyName = 'node16'
GO
EXEC SqlGraph.Company$Insert @Name = 'node556', @ParentCompanyName = 'node16'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1043', @ParentCompanyName = 'node17'
GO
EXEC SqlGraph.Company$Insert @Name = 'node149', @ParentCompanyName = 'node17'
GO
EXEC SqlGraph.Company$Insert @Name = 'node313', @ParentCompanyName = 'node17'
GO
EXEC SqlGraph.Company$Insert @Name = 'node818', @ParentCompanyName = 'node17'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node818'
GO
EXEC SqlGraph.Company$Insert @Name = 'node978', @ParentCompanyName = 'node17'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1038', @ParentCompanyName = 'node18'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1040', @ParentCompanyName = 'node18'
GO
EXEC SqlGraph.Company$Insert @Name = 'node507', @ParentCompanyName = 'node18'
GO
EXEC SqlGraph.Company$Insert @Name = 'node707', @ParentCompanyName = 'node18'
GO
EXEC SqlGraph.Company$Insert @Name = 'node801', @ParentCompanyName = 'node18'
GO
EXEC SqlGraph.Company$Insert @Name = 'node857', @ParentCompanyName = 'node18'
GO
EXEC SqlGraph.Company$Insert @Name = 'node863', @ParentCompanyName = 'node18'
GO
EXEC SqlGraph.Company$Insert @Name = 'node916', @ParentCompanyName = 'node18'
GO
EXEC SqlGraph.Company$Insert @Name = 'node986', @ParentCompanyName = 'node18'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1058', @ParentCompanyName = 'node19'
GO
EXEC SqlGraph.Company$Insert @Name = 'node491', @ParentCompanyName = 'node19'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node491'
GO
EXEC SqlGraph.Company$Insert @Name = 'node546', @ParentCompanyName = 'node19'
GO
EXEC SqlGraph.Company$Insert @Name = 'node644', @ParentCompanyName = 'node19'
GO
EXEC SqlGraph.Company$Insert @Name = 'node653', @ParentCompanyName = 'node19'
GO
EXEC SqlGraph.Company$Insert @Name = 'node723', @ParentCompanyName = 'node19'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1032', @ParentCompanyName = 'node2'
GO
EXEC SqlGraph.Company$Insert @Name = 'node108', @ParentCompanyName = 'node2'
GO
EXEC SqlGraph.Company$Insert @Name = 'node292', @ParentCompanyName = 'node2'
GO
EXEC SqlGraph.Company$Insert @Name = 'node382', @ParentCompanyName = 'node2'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node382'
GO
EXEC SqlGraph.Company$Insert @Name = 'node407', @ParentCompanyName = 'node2'
GO
EXEC SqlGraph.Company$Insert @Name = 'node421', @ParentCompanyName = 'node2'
GO
EXEC SqlGraph.Company$Insert @Name = 'node500', @ParentCompanyName = 'node2'
GO
EXEC SqlGraph.Company$Insert @Name = 'node541', @ParentCompanyName = 'node2'
GO
EXEC SqlGraph.Company$Insert @Name = 'node676', @ParentCompanyName = 'node2'
GO
EXEC SqlGraph.Company$Insert @Name = 'node815', @ParentCompanyName = 'node2'
GO
EXEC SqlGraph.Company$Insert @Name = 'node999', @ParentCompanyName = 'node2'
GO
EXEC SqlGraph.Company$Insert @Name = 'node153', @ParentCompanyName = 'node20'
GO
EXEC SqlGraph.Company$Insert @Name = 'node277', @ParentCompanyName = 'node20'
GO
EXEC SqlGraph.Company$Insert @Name = 'node557', @ParentCompanyName = 'node20'
GO
EXEC SqlGraph.Company$Insert @Name = 'node648', @ParentCompanyName = 'node20'
GO
EXEC SqlGraph.Company$Insert @Name = 'node934', @ParentCompanyName = 'node20'
GO
EXEC SqlGraph.Company$Insert @Name = 'node952', @ParentCompanyName = 'node20'
GO
EXEC SqlGraph.Company$Insert @Name = 'node137', @ParentCompanyName = 'node21'
GO
EXEC SqlGraph.Company$Insert @Name = 'node260', @ParentCompanyName = 'node21'
GO
EXEC SqlGraph.Company$Insert @Name = 'node335', @ParentCompanyName = 'node21'
GO
EXEC SqlGraph.Company$Insert @Name = 'node447', @ParentCompanyName = 'node21'
GO
EXEC SqlGraph.Company$Insert @Name = 'node544', @ParentCompanyName = 'node21'
GO
EXEC SqlGraph.Company$Insert @Name = 'node568', @ParentCompanyName = 'node21'
GO
EXEC SqlGraph.Company$Insert @Name = 'node662', @ParentCompanyName = 'node21'
GO
EXEC SqlGraph.Company$Insert @Name = 'node735', @ParentCompanyName = 'node21'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node735'
GO
EXEC SqlGraph.Company$Insert @Name = 'node811', @ParentCompanyName = 'node21'
GO
EXEC SqlGraph.Company$Insert @Name = 'node871', @ParentCompanyName = 'node21'
GO
EXEC SqlGraph.Company$Insert @Name = 'node896', @ParentCompanyName = 'node21'
GO
EXEC SqlGraph.Company$Insert @Name = 'node915', @ParentCompanyName = 'node21'
GO
EXEC SqlGraph.Company$Insert @Name = 'node921', @ParentCompanyName = 'node21'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node921'
GO
EXEC SqlGraph.Company$Insert @Name = 'node226', @ParentCompanyName = 'node22'
GO
EXEC SqlGraph.Company$Insert @Name = 'node246', @ParentCompanyName = 'node22'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node246'
GO
EXEC SqlGraph.Company$Insert @Name = 'node305', @ParentCompanyName = 'node22'
GO
EXEC SqlGraph.Company$Insert @Name = 'node320', @ParentCompanyName = 'node22'
GO
EXEC SqlGraph.Company$Insert @Name = 'node426', @ParentCompanyName = 'node22'
GO
EXEC SqlGraph.Company$Insert @Name = 'node505', @ParentCompanyName = 'node22'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node505'
GO
EXEC SqlGraph.Company$Insert @Name = 'node628', @ParentCompanyName = 'node22'
GO
EXEC SqlGraph.Company$Insert @Name = 'node661', @ParentCompanyName = 'node22'
GO
EXEC SqlGraph.Company$Insert @Name = 'node751', @ParentCompanyName = 'node22'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node751'
GO
EXEC SqlGraph.Company$Insert @Name = 'node760', @ParentCompanyName = 'node22'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1071', @ParentCompanyName = 'node23'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1095', @ParentCompanyName = 'node23'
GO
EXEC SqlGraph.Company$Insert @Name = 'node164', @ParentCompanyName = 'node23'
GO
EXEC SqlGraph.Company$Insert @Name = 'node196', @ParentCompanyName = 'node23'
GO
EXEC SqlGraph.Company$Insert @Name = 'node419', @ParentCompanyName = 'node23'
GO
EXEC SqlGraph.Company$Insert @Name = 'node433', @ParentCompanyName = 'node23'
GO
EXEC SqlGraph.Company$Insert @Name = 'node467', @ParentCompanyName = 'node23'
GO
EXEC SqlGraph.Company$Insert @Name = 'node506', @ParentCompanyName = 'node23'
GO
EXEC SqlGraph.Company$Insert @Name = 'node560', @ParentCompanyName = 'node23'
GO
EXEC SqlGraph.Company$Insert @Name = 'node619', @ParentCompanyName = 'node23'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node619'
GO
EXEC SqlGraph.Company$Insert @Name = 'node737', @ParentCompanyName = 'node23'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1050', @ParentCompanyName = 'node24'
GO
EXEC SqlGraph.Company$Insert @Name = 'node249', @ParentCompanyName = 'node24'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node249'
GO
EXEC SqlGraph.Company$Insert @Name = 'node310', @ParentCompanyName = 'node24'
GO
EXEC SqlGraph.Company$Insert @Name = 'node326', @ParentCompanyName = 'node24'
GO
EXEC SqlGraph.Company$Insert @Name = 'node414', @ParentCompanyName = 'node24'
GO
EXEC SqlGraph.Company$Insert @Name = 'node472', @ParentCompanyName = 'node24'
GO
EXEC SqlGraph.Company$Insert @Name = 'node547', @ParentCompanyName = 'node24'
GO
EXEC SqlGraph.Company$Insert @Name = 'node574', @ParentCompanyName = 'node24'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node574'
GO
EXEC SqlGraph.Company$Insert @Name = 'node613', @ParentCompanyName = 'node24'
GO
EXEC SqlGraph.Company$Insert @Name = 'node892', @ParentCompanyName = 'node24'
GO
EXEC SqlGraph.Company$Insert @Name = 'node909', @ParentCompanyName = 'node24'
GO
EXEC SqlGraph.Company$Insert @Name = 'node989', @ParentCompanyName = 'node24'
GO
EXEC SqlGraph.Company$Insert @Name = 'node996', @ParentCompanyName = 'node24'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node996'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1028', @ParentCompanyName = 'node25'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1055', @ParentCompanyName = 'node25'
GO
EXEC SqlGraph.Company$Insert @Name = 'node287', @ParentCompanyName = 'node25'
GO
EXEC SqlGraph.Company$Insert @Name = 'node485', @ParentCompanyName = 'node25'
GO
EXEC SqlGraph.Company$Insert @Name = 'node569', @ParentCompanyName = 'node25'
GO
EXEC SqlGraph.Company$Insert @Name = 'node647', @ParentCompanyName = 'node25'
GO
EXEC SqlGraph.Company$Insert @Name = 'node862', @ParentCompanyName = 'node25'
GO
EXEC SqlGraph.Company$Insert @Name = 'node166', @ParentCompanyName = 'node26'
GO
EXEC SqlGraph.Company$Insert @Name = 'node222', @ParentCompanyName = 'node26'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node222'
GO
EXEC SqlGraph.Company$Insert @Name = 'node425', @ParentCompanyName = 'node26'
GO
EXEC SqlGraph.Company$Insert @Name = 'node756', @ParentCompanyName = 'node26'
GO
EXEC SqlGraph.Company$Insert @Name = 'node768', @ParentCompanyName = 'node26'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node768'
GO
EXEC SqlGraph.Company$Insert @Name = 'node940', @ParentCompanyName = 'node26'
GO
EXEC SqlGraph.Company$Insert @Name = 'node234', @ParentCompanyName = 'node27'
GO
EXEC SqlGraph.Company$Insert @Name = 'node270', @ParentCompanyName = 'node27'
GO
EXEC SqlGraph.Company$Insert @Name = 'node363', @ParentCompanyName = 'node27'
GO
EXEC SqlGraph.Company$Insert @Name = 'node424', @ParentCompanyName = 'node27'
GO
EXEC SqlGraph.Company$Insert @Name = 'node854', @ParentCompanyName = 'node27'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1097', @ParentCompanyName = 'node28'
GO
EXEC SqlGraph.Company$Insert @Name = 'node167', @ParentCompanyName = 'node28'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node167'
GO
EXEC SqlGraph.Company$Insert @Name = 'node268', @ParentCompanyName = 'node28'
GO
EXEC SqlGraph.Company$Insert @Name = 'node316', @ParentCompanyName = 'node28'
GO
EXEC SqlGraph.Company$Insert @Name = 'node416', @ParentCompanyName = 'node28'
GO
EXEC SqlGraph.Company$Insert @Name = 'node598', @ParentCompanyName = 'node28'
GO
EXEC SqlGraph.Company$Insert @Name = 'node679', @ParentCompanyName = 'node28'
GO
EXEC SqlGraph.Company$Insert @Name = 'node696', @ParentCompanyName = 'node28'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node696'
GO
EXEC SqlGraph.Company$Insert @Name = 'node734', @ParentCompanyName = 'node28'
GO
EXEC SqlGraph.Company$Insert @Name = 'node750', @ParentCompanyName = 'node28'
GO
EXEC SqlGraph.Company$Insert @Name = 'node766', @ParentCompanyName = 'node28'
GO
EXEC SqlGraph.Company$Insert @Name = 'node781', @ParentCompanyName = 'node28'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1084', @ParentCompanyName = 'node29'
GO
EXEC SqlGraph.Company$Insert @Name = 'node283', @ParentCompanyName = 'node29'
GO
EXEC SqlGraph.Company$Insert @Name = 'node327', @ParentCompanyName = 'node29'
GO
EXEC SqlGraph.Company$Insert @Name = 'node343', @ParentCompanyName = 'node29'
GO
EXEC SqlGraph.Company$Insert @Name = 'node351', @ParentCompanyName = 'node29'
GO
EXEC SqlGraph.Company$Insert @Name = 'node503', @ParentCompanyName = 'node29'
GO
EXEC SqlGraph.Company$Insert @Name = 'node612', @ParentCompanyName = 'node29'
GO
EXEC SqlGraph.Company$Insert @Name = 'node684', @ParentCompanyName = 'node29'
GO
EXEC SqlGraph.Company$Insert @Name = 'node740', @ParentCompanyName = 'node29'
GO
EXEC SqlGraph.Company$Insert @Name = 'node779', @ParentCompanyName = 'node29'
GO
EXEC SqlGraph.Company$Insert @Name = 'node821', @ParentCompanyName = 'node29'
GO
EXEC SqlGraph.Company$Insert @Name = 'node860', @ParentCompanyName = 'node29'
GO
EXEC SqlGraph.Company$Insert @Name = 'node933', @ParentCompanyName = 'node29'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1062', @ParentCompanyName = 'node3'
GO
EXEC SqlGraph.Company$Insert @Name = 'node318', @ParentCompanyName = 'node3'
GO
EXEC SqlGraph.Company$Insert @Name = 'node322', @ParentCompanyName = 'node3'
GO
EXEC SqlGraph.Company$Insert @Name = 'node689', @ParentCompanyName = 'node3'
GO
EXEC SqlGraph.Company$Insert @Name = 'node759', @ParentCompanyName = 'node3'
GO
EXEC SqlGraph.Company$Insert @Name = 'node784', @ParentCompanyName = 'node3'
GO
EXEC SqlGraph.Company$Insert @Name = 'node911', @ParentCompanyName = 'node3'
GO
EXEC SqlGraph.Company$Insert @Name = 'node997', @ParentCompanyName = 'node3'
GO
EXEC SqlGraph.Company$Insert @Name = 'node188', @ParentCompanyName = 'node30'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node188'
GO
EXEC SqlGraph.Company$Insert @Name = 'node364', @ParentCompanyName = 'node30'
GO
EXEC SqlGraph.Company$Insert @Name = 'node384', @ParentCompanyName = 'node30'
GO
EXEC SqlGraph.Company$Insert @Name = 'node420', @ParentCompanyName = 'node30'
GO
EXEC SqlGraph.Company$Insert @Name = 'node437', @ParentCompanyName = 'node30'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node437'
GO
EXEC SqlGraph.Company$Insert @Name = 'node769', @ParentCompanyName = 'node30'
GO
EXEC SqlGraph.Company$Insert @Name = 'node772', @ParentCompanyName = 'node30'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node772'
GO
EXEC SqlGraph.Company$Insert @Name = 'node795', @ParentCompanyName = 'node30'
GO
EXEC SqlGraph.Company$Insert @Name = 'node824', @ParentCompanyName = 'node30'
GO
EXEC SqlGraph.Company$Insert @Name = 'node937', @ParentCompanyName = 'node30'
GO
EXEC SqlGraph.Company$Insert @Name = 'node295', @ParentCompanyName = 'node31'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node295'
GO
EXEC SqlGraph.Company$Insert @Name = 'node342', @ParentCompanyName = 'node31'
GO
EXEC SqlGraph.Company$Insert @Name = 'node388', @ParentCompanyName = 'node31'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node388'
GO
EXEC SqlGraph.Company$Insert @Name = 'node538', @ParentCompanyName = 'node31'
GO
EXEC SqlGraph.Company$Insert @Name = 'node573', @ParentCompanyName = 'node31'
GO
EXEC SqlGraph.Company$Insert @Name = 'node771', @ParentCompanyName = 'node31'
GO
EXEC SqlGraph.Company$Insert @Name = 'node232', @ParentCompanyName = 'node32'
GO
EXEC SqlGraph.Company$Insert @Name = 'node514', @ParentCompanyName = 'node32'
GO
EXEC SqlGraph.Company$Insert @Name = 'node548', @ParentCompanyName = 'node32'
GO
EXEC SqlGraph.Company$Insert @Name = 'node630', @ParentCompanyName = 'node32'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node630'
GO
EXEC SqlGraph.Company$Insert @Name = 'node830', @ParentCompanyName = 'node32'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node830'
GO
EXEC SqlGraph.Company$Insert @Name = 'node904', @ParentCompanyName = 'node32'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node904'
GO
EXEC SqlGraph.Company$Insert @Name = 'node965', @ParentCompanyName = 'node32'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1048', @ParentCompanyName = 'node33'
GO
EXEC SqlGraph.Company$Insert @Name = 'node184', @ParentCompanyName = 'node33'
GO
EXEC SqlGraph.Company$Insert @Name = 'node259', @ParentCompanyName = 'node33'
GO
EXEC SqlGraph.Company$Insert @Name = 'node497', @ParentCompanyName = 'node33'
GO
EXEC SqlGraph.Company$Insert @Name = 'node595', @ParentCompanyName = 'node33'
GO
EXEC SqlGraph.Company$Insert @Name = 'node668', @ParentCompanyName = 'node33'
GO
EXEC SqlGraph.Company$Insert @Name = 'node763', @ParentCompanyName = 'node33'
GO
EXEC SqlGraph.Company$Insert @Name = 'node901', @ParentCompanyName = 'node33'
GO
EXEC SqlGraph.Company$Insert @Name = 'node977', @ParentCompanyName = 'node33'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node977'
GO
EXEC SqlGraph.Company$Insert @Name = 'node112', @ParentCompanyName = 'node34'
GO
EXEC SqlGraph.Company$Insert @Name = 'node189', @ParentCompanyName = 'node34'
GO
EXEC SqlGraph.Company$Insert @Name = 'node377', @ParentCompanyName = 'node34'
GO
EXEC SqlGraph.Company$Insert @Name = 'node402', @ParentCompanyName = 'node34'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node402'
GO
EXEC SqlGraph.Company$Insert @Name = 'node449', @ParentCompanyName = 'node34'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node449'
GO
EXEC SqlGraph.Company$Insert @Name = 'node470', @ParentCompanyName = 'node34'
GO
EXEC SqlGraph.Company$Insert @Name = 'node583', @ParentCompanyName = 'node34'
GO
EXEC SqlGraph.Company$Insert @Name = 'node605', @ParentCompanyName = 'node34'
GO
EXEC SqlGraph.Company$Insert @Name = 'node792', @ParentCompanyName = 'node34'
GO
EXEC SqlGraph.Company$Insert @Name = 'node802', @ParentCompanyName = 'node34'
GO
EXEC SqlGraph.Company$Insert @Name = 'node834', @ParentCompanyName = 'node34'
GO
EXEC SqlGraph.Company$Insert @Name = 'node868', @ParentCompanyName = 'node34'
GO
EXEC SqlGraph.Company$Insert @Name = 'node981', @ParentCompanyName = 'node34'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1079', @ParentCompanyName = 'node35'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1082', @ParentCompanyName = 'node35'
GO
EXEC SqlGraph.Company$Insert @Name = 'node133', @ParentCompanyName = 'node35'
GO
EXEC SqlGraph.Company$Insert @Name = 'node174', @ParentCompanyName = 'node35'
GO
EXEC SqlGraph.Company$Insert @Name = 'node250', @ParentCompanyName = 'node35'
GO
EXEC SqlGraph.Company$Insert @Name = 'node380', @ParentCompanyName = 'node35'
GO
EXEC SqlGraph.Company$Insert @Name = 'node778', @ParentCompanyName = 'node35'
GO
EXEC SqlGraph.Company$Insert @Name = 'node880', @ParentCompanyName = 'node35'
GO
EXEC SqlGraph.Company$Insert @Name = 'node914', @ParentCompanyName = 'node35'
GO
EXEC SqlGraph.Company$Insert @Name = 'node917', @ParentCompanyName = 'node35'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node917'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1012', @ParentCompanyName = 'node36'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1012'
GO
EXEC SqlGraph.Company$Insert @Name = 'node148', @ParentCompanyName = 'node36'
GO
EXEC SqlGraph.Company$Insert @Name = 'node620', @ParentCompanyName = 'node36'
GO
EXEC SqlGraph.Company$Insert @Name = 'node972', @ParentCompanyName = 'node36'
GO
EXEC SqlGraph.Company$Insert @Name = 'node102', @ParentCompanyName = 'node37'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node102'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1037', @ParentCompanyName = 'node37'
GO
EXEC SqlGraph.Company$Insert @Name = 'node119', @ParentCompanyName = 'node37'
GO
EXEC SqlGraph.Company$Insert @Name = 'node502', @ParentCompanyName = 'node37'
GO
EXEC SqlGraph.Company$Insert @Name = 'node528', @ParentCompanyName = 'node37'
GO
EXEC SqlGraph.Company$Insert @Name = 'node576', @ParentCompanyName = 'node37'
GO
EXEC SqlGraph.Company$Insert @Name = 'node588', @ParentCompanyName = 'node37'
GO
EXEC SqlGraph.Company$Insert @Name = 'node753', @ParentCompanyName = 'node37'
GO
EXEC SqlGraph.Company$Insert @Name = 'node844', @ParentCompanyName = 'node37'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1023', @ParentCompanyName = 'node38'
GO
EXEC SqlGraph.Company$Insert @Name = 'node468', @ParentCompanyName = 'node38'
GO
EXEC SqlGraph.Company$Insert @Name = 'node475', @ParentCompanyName = 'node38'
GO
EXEC SqlGraph.Company$Insert @Name = 'node518', @ParentCompanyName = 'node38'
GO
EXEC SqlGraph.Company$Insert @Name = 'node691', @ParentCompanyName = 'node38'
GO
EXEC SqlGraph.Company$Insert @Name = 'node758', @ParentCompanyName = 'node38'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node758'
GO
EXEC SqlGraph.Company$Insert @Name = 'node774', @ParentCompanyName = 'node38'
GO
EXEC SqlGraph.Company$Insert @Name = 'node825', @ParentCompanyName = 'node38'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1099', @ParentCompanyName = 'node39'
GO
EXEC SqlGraph.Company$Insert @Name = 'node140', @ParentCompanyName = 'node39'
GO
EXEC SqlGraph.Company$Insert @Name = 'node152', @ParentCompanyName = 'node39'
GO
EXEC SqlGraph.Company$Insert @Name = 'node186', @ParentCompanyName = 'node39'
GO
EXEC SqlGraph.Company$Insert @Name = 'node200', @ParentCompanyName = 'node39'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node200'
GO
EXEC SqlGraph.Company$Insert @Name = 'node288', @ParentCompanyName = 'node39'
GO
EXEC SqlGraph.Company$Insert @Name = 'node444', @ParentCompanyName = 'node39'
GO
EXEC SqlGraph.Company$Insert @Name = 'node543', @ParentCompanyName = 'node39'
GO
EXEC SqlGraph.Company$Insert @Name = 'node600', @ParentCompanyName = 'node39'
GO
EXEC SqlGraph.Company$Insert @Name = 'node604', @ParentCompanyName = 'node39'
GO
EXEC SqlGraph.Company$Insert @Name = 'node672', @ParentCompanyName = 'node39'
GO
EXEC SqlGraph.Company$Insert @Name = 'node677', @ParentCompanyName = 'node39'
GO
EXEC SqlGraph.Company$Insert @Name = 'node711', @ParentCompanyName = 'node39'
GO
EXEC SqlGraph.Company$Insert @Name = 'node730', @ParentCompanyName = 'node39'
GO
EXEC SqlGraph.Company$Insert @Name = 'node748', @ParentCompanyName = 'node39'
GO
EXEC SqlGraph.Company$Insert @Name = 'node754', @ParentCompanyName = 'node39'
GO
EXEC SqlGraph.Company$Insert @Name = 'node790', @ParentCompanyName = 'node39'
GO
EXEC SqlGraph.Company$Insert @Name = 'node210', @ParentCompanyName = 'node4'
GO
EXEC SqlGraph.Company$Insert @Name = 'node216', @ParentCompanyName = 'node4'
GO
EXEC SqlGraph.Company$Insert @Name = 'node278', @ParentCompanyName = 'node4'
GO
EXEC SqlGraph.Company$Insert @Name = 'node339', @ParentCompanyName = 'node4'
GO
EXEC SqlGraph.Company$Insert @Name = 'node345', @ParentCompanyName = 'node4'
GO
EXEC SqlGraph.Company$Insert @Name = 'node487', @ParentCompanyName = 'node4'
GO
EXEC SqlGraph.Company$Insert @Name = 'node692', @ParentCompanyName = 'node4'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node692'
GO
EXEC SqlGraph.Company$Insert @Name = 'node716', @ParentCompanyName = 'node4'
GO
EXEC SqlGraph.Company$Insert @Name = 'node888', @ParentCompanyName = 'node4'
GO
EXEC SqlGraph.Company$Insert @Name = 'node903', @ParentCompanyName = 'node4'
GO
EXEC SqlGraph.Company$Insert @Name = 'node958', @ParentCompanyName = 'node4'
GO
EXEC SqlGraph.Company$Insert @Name = 'node272', @ParentCompanyName = 'node40'
GO
EXEC SqlGraph.Company$Insert @Name = 'node471', @ParentCompanyName = 'node40'
GO
EXEC SqlGraph.Company$Insert @Name = 'node481', @ParentCompanyName = 'node40'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node481'
GO
EXEC SqlGraph.Company$Insert @Name = 'node698', @ParentCompanyName = 'node40'
GO
EXEC SqlGraph.Company$Insert @Name = 'node787', @ParentCompanyName = 'node40'
GO
EXEC SqlGraph.Company$Insert @Name = 'node805', @ParentCompanyName = 'node40'
GO
EXEC SqlGraph.Company$Insert @Name = 'node835', @ParentCompanyName = 'node40'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node835'
GO
EXEC SqlGraph.Company$Insert @Name = 'node879', @ParentCompanyName = 'node40'
GO
EXEC SqlGraph.Company$Insert @Name = 'node881', @ParentCompanyName = 'node40'
GO
EXEC SqlGraph.Company$Insert @Name = 'node134', @ParentCompanyName = 'node41'
GO
EXEC SqlGraph.Company$Insert @Name = 'node289', @ParentCompanyName = 'node41'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node289'
GO
EXEC SqlGraph.Company$Insert @Name = 'node315', @ParentCompanyName = 'node41'
GO
EXEC SqlGraph.Company$Insert @Name = 'node338', @ParentCompanyName = 'node41'
GO
EXEC SqlGraph.Company$Insert @Name = 'node371', @ParentCompanyName = 'node41'
GO
EXEC SqlGraph.Company$Insert @Name = 'node473', @ParentCompanyName = 'node41'
GO
EXEC SqlGraph.Company$Insert @Name = 'node570', @ParentCompanyName = 'node41'
GO
EXEC SqlGraph.Company$Insert @Name = 'node720', @ParentCompanyName = 'node41'
GO
EXEC SqlGraph.Company$Insert @Name = 'node874', @ParentCompanyName = 'node41'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1020', @ParentCompanyName = 'node42'
GO
EXEC SqlGraph.Company$Insert @Name = 'node203', @ParentCompanyName = 'node42'
GO
EXEC SqlGraph.Company$Insert @Name = 'node360', @ParentCompanyName = 'node42'
GO
EXEC SqlGraph.Company$Insert @Name = 'node488', @ParentCompanyName = 'node42'
GO
EXEC SqlGraph.Company$Insert @Name = 'node646', @ParentCompanyName = 'node42'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node646'
GO
EXEC SqlGraph.Company$Insert @Name = 'node667', @ParentCompanyName = 'node42'
GO
EXEC SqlGraph.Company$Insert @Name = 'node701', @ParentCompanyName = 'node42'
GO
EXEC SqlGraph.Company$Insert @Name = 'node794', @ParentCompanyName = 'node42'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node794'
GO
EXEC SqlGraph.Company$Insert @Name = 'node836', @ParentCompanyName = 'node42'
GO
EXEC SqlGraph.Company$Insert @Name = 'node120', @ParentCompanyName = 'node43'
GO
EXEC SqlGraph.Company$Insert @Name = 'node121', @ParentCompanyName = 'node43'
GO
EXEC SqlGraph.Company$Insert @Name = 'node170', @ParentCompanyName = 'node43'
GO
EXEC SqlGraph.Company$Insert @Name = 'node176', @ParentCompanyName = 'node43'
GO
EXEC SqlGraph.Company$Insert @Name = 'node355', @ParentCompanyName = 'node43'
GO
EXEC SqlGraph.Company$Insert @Name = 'node357', @ParentCompanyName = 'node43'
GO
EXEC SqlGraph.Company$Insert @Name = 'node389', @ParentCompanyName = 'node43'
GO
EXEC SqlGraph.Company$Insert @Name = 'node658', @ParentCompanyName = 'node43'
GO
EXEC SqlGraph.Company$Insert @Name = 'node882', @ParentCompanyName = 'node43'
GO
EXEC SqlGraph.Company$Insert @Name = 'node897', @ParentCompanyName = 'node43'
GO
EXEC SqlGraph.Company$Insert @Name = 'node225', @ParentCompanyName = 'node44'
GO
EXEC SqlGraph.Company$Insert @Name = 'node337', @ParentCompanyName = 'node44'
GO
EXEC SqlGraph.Company$Insert @Name = 'node512', @ParentCompanyName = 'node44'
GO
EXEC SqlGraph.Company$Insert @Name = 'node533', @ParentCompanyName = 'node44'
GO
EXEC SqlGraph.Company$Insert @Name = 'node685', @ParentCompanyName = 'node44'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node685'
GO
EXEC SqlGraph.Company$Insert @Name = 'node715', @ParentCompanyName = 'node44'
GO
EXEC SqlGraph.Company$Insert @Name = 'node755', @ParentCompanyName = 'node44'
GO
EXEC SqlGraph.Company$Insert @Name = 'node840', @ParentCompanyName = 'node44'
GO
EXEC SqlGraph.Company$Insert @Name = 'node990', @ParentCompanyName = 'node44'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1010', @ParentCompanyName = 'node45'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1076', @ParentCompanyName = 'node45'
GO
EXEC SqlGraph.Company$Insert @Name = 'node117', @ParentCompanyName = 'node45'
GO
EXEC SqlGraph.Company$Insert @Name = 'node168', @ParentCompanyName = 'node45'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node168'
GO
EXEC SqlGraph.Company$Insert @Name = 'node392', @ParentCompanyName = 'node45'
GO
EXEC SqlGraph.Company$Insert @Name = 'node578', @ParentCompanyName = 'node45'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node578'
GO
EXEC SqlGraph.Company$Insert @Name = 'node804', @ParentCompanyName = 'node45'
GO
EXEC SqlGraph.Company$Insert @Name = 'node949', @ParentCompanyName = 'node45'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1005', @ParentCompanyName = 'node46'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1070', @ParentCompanyName = 'node46'
GO
EXEC SqlGraph.Company$Insert @Name = 'node154', @ParentCompanyName = 'node46'
GO
EXEC SqlGraph.Company$Insert @Name = 'node362', @ParentCompanyName = 'node46'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node362'
GO
EXEC SqlGraph.Company$Insert @Name = 'node390', @ParentCompanyName = 'node46'
GO
EXEC SqlGraph.Company$Insert @Name = 'node435', @ParentCompanyName = 'node46'
GO
EXEC SqlGraph.Company$Insert @Name = 'node495', @ParentCompanyName = 'node46'
GO
EXEC SqlGraph.Company$Insert @Name = 'node516', @ParentCompanyName = 'node46'
GO
EXEC SqlGraph.Company$Insert @Name = 'node643', @ParentCompanyName = 'node46'
GO
EXEC SqlGraph.Company$Insert @Name = 'node673', @ParentCompanyName = 'node46'
GO
EXEC SqlGraph.Company$Insert @Name = 'node842', @ParentCompanyName = 'node46'
GO
EXEC SqlGraph.Company$Insert @Name = 'node850', @ParentCompanyName = 'node46'
GO
EXEC SqlGraph.Company$Insert @Name = 'node187', @ParentCompanyName = 'node47'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node187'
GO
EXEC SqlGraph.Company$Insert @Name = 'node192', @ParentCompanyName = 'node47'
GO
EXEC SqlGraph.Company$Insert @Name = 'node361', @ParentCompanyName = 'node47'
GO
EXEC SqlGraph.Company$Insert @Name = 'node656', @ParentCompanyName = 'node47'
GO
EXEC SqlGraph.Company$Insert @Name = 'node664', @ParentCompanyName = 'node47'
GO
EXEC SqlGraph.Company$Insert @Name = 'node725', @ParentCompanyName = 'node47'
GO
EXEC SqlGraph.Company$Insert @Name = 'node739', @ParentCompanyName = 'node47'
GO
EXEC SqlGraph.Company$Insert @Name = 'node907', @ParentCompanyName = 'node47'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1002', @ParentCompanyName = 'node48'
GO
EXEC SqlGraph.Company$Insert @Name = 'node106', @ParentCompanyName = 'node48'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node106'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1092', @ParentCompanyName = 'node48'
GO
EXEC SqlGraph.Company$Insert @Name = 'node130', @ParentCompanyName = 'node48'
GO
EXEC SqlGraph.Company$Insert @Name = 'node182', @ParentCompanyName = 'node48'
GO
EXEC SqlGraph.Company$Insert @Name = 'node432', @ParentCompanyName = 'node48'
GO
EXEC SqlGraph.Company$Insert @Name = 'node532', @ParentCompanyName = 'node48'
GO
EXEC SqlGraph.Company$Insert @Name = 'node706', @ParentCompanyName = 'node48'
GO
EXEC SqlGraph.Company$Insert @Name = 'node786', @ParentCompanyName = 'node48'
GO
EXEC SqlGraph.Company$Insert @Name = 'node789', @ParentCompanyName = 'node48'
GO
EXEC SqlGraph.Company$Insert @Name = 'node798', @ParentCompanyName = 'node48'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node798'
GO
EXEC SqlGraph.Company$Insert @Name = 'node812', @ParentCompanyName = 'node48'
GO
EXEC SqlGraph.Company$Insert @Name = 'node913', @ParentCompanyName = 'node48'
GO
EXEC SqlGraph.Company$Insert @Name = 'node919', @ParentCompanyName = 'node48'
GO
EXEC SqlGraph.Company$Insert @Name = 'node242', @ParentCompanyName = 'node49'
GO
EXEC SqlGraph.Company$Insert @Name = 'node366', @ParentCompanyName = 'node49'
GO
EXEC SqlGraph.Company$Insert @Name = 'node393', @ParentCompanyName = 'node49'
GO
EXEC SqlGraph.Company$Insert @Name = 'node575', @ParentCompanyName = 'node49'
GO
EXEC SqlGraph.Company$Insert @Name = 'node608', @ParentCompanyName = 'node49'
GO
EXEC SqlGraph.Company$Insert @Name = 'node655', @ParentCompanyName = 'node49'
GO
EXEC SqlGraph.Company$Insert @Name = 'node796', @ParentCompanyName = 'node49'
GO
EXEC SqlGraph.Company$Insert @Name = 'node918', @ParentCompanyName = 'node49'
GO
EXEC SqlGraph.Company$Insert @Name = 'node987', @ParentCompanyName = 'node49'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1007', @ParentCompanyName = 'node5'
GO
EXEC SqlGraph.Company$Insert @Name = 'node127', @ParentCompanyName = 'node5'
GO
EXEC SqlGraph.Company$Insert @Name = 'node878', @ParentCompanyName = 'node5'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node878'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1093', @ParentCompanyName = 'node50'
GO
EXEC SqlGraph.Company$Insert @Name = 'node180', @ParentCompanyName = 'node50'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node180'
GO
EXEC SqlGraph.Company$Insert @Name = 'node212', @ParentCompanyName = 'node50'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node212'
GO
EXEC SqlGraph.Company$Insert @Name = 'node213', @ParentCompanyName = 'node50'
GO
EXEC SqlGraph.Company$Insert @Name = 'node443', @ParentCompanyName = 'node50'
GO
EXEC SqlGraph.Company$Insert @Name = 'node486', @ParentCompanyName = 'node50'
GO
EXEC SqlGraph.Company$Insert @Name = 'node511', @ParentCompanyName = 'node50'
GO
EXEC SqlGraph.Company$Insert @Name = 'node717', @ParentCompanyName = 'node50'
GO
EXEC SqlGraph.Company$Insert @Name = 'node776', @ParentCompanyName = 'node50'
GO
EXEC SqlGraph.Company$Insert @Name = 'node777', @ParentCompanyName = 'node50'
GO
EXEC SqlGraph.Company$Insert @Name = 'node962', @ParentCompanyName = 'node50'
GO
EXEC SqlGraph.Company$Insert @Name = 'node980', @ParentCompanyName = 'node50'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1060', @ParentCompanyName = 'node51'
GO
EXEC SqlGraph.Company$Insert @Name = 'node109', @ParentCompanyName = 'node51'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node109'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1096', @ParentCompanyName = 'node51'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1096'
GO
EXEC SqlGraph.Company$Insert @Name = 'node139', @ParentCompanyName = 'node51'
GO
EXEC SqlGraph.Company$Insert @Name = 'node463', @ParentCompanyName = 'node51'
GO
EXEC SqlGraph.Company$Insert @Name = 'node571', @ParentCompanyName = 'node51'
GO
EXEC SqlGraph.Company$Insert @Name = 'node584', @ParentCompanyName = 'node51'
GO
EXEC SqlGraph.Company$Insert @Name = 'node680', @ParentCompanyName = 'node51'
GO
EXEC SqlGraph.Company$Insert @Name = 'node745', @ParentCompanyName = 'node51'
GO
EXEC SqlGraph.Company$Insert @Name = 'node799', @ParentCompanyName = 'node51'
GO
EXEC SqlGraph.Company$Insert @Name = 'node895', @ParentCompanyName = 'node51'
GO
EXEC SqlGraph.Company$Insert @Name = 'node900', @ParentCompanyName = 'node51'
GO
EXEC SqlGraph.Company$Insert @Name = 'node956', @ParentCompanyName = 'node51'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1030', @ParentCompanyName = 'node52'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1101', @ParentCompanyName = 'node52'
GO
EXEC SqlGraph.Company$Insert @Name = 'node135', @ParentCompanyName = 'node52'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node135'
GO
EXEC SqlGraph.Company$Insert @Name = 'node291', @ParentCompanyName = 'node52'
GO
EXEC SqlGraph.Company$Insert @Name = 'node429', @ParentCompanyName = 'node52'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node429'
GO
EXEC SqlGraph.Company$Insert @Name = 'node457', @ParentCompanyName = 'node52'
GO
EXEC SqlGraph.Company$Insert @Name = 'node480', @ParentCompanyName = 'node52'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node480'
GO
EXEC SqlGraph.Company$Insert @Name = 'node562', @ParentCompanyName = 'node52'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node562'
GO
EXEC SqlGraph.Company$Insert @Name = 'node567', @ParentCompanyName = 'node52'
GO
EXEC SqlGraph.Company$Insert @Name = 'node665', @ParentCompanyName = 'node52'
GO
EXEC SqlGraph.Company$Insert @Name = 'node733', @ParentCompanyName = 'node52'
GO
EXEC SqlGraph.Company$Insert @Name = 'node817', @ParentCompanyName = 'node52'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node817'
GO
EXEC SqlGraph.Company$Insert @Name = 'node938', @ParentCompanyName = 'node52'
GO
EXEC SqlGraph.Company$Insert @Name = 'node968', @ParentCompanyName = 'node52'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1016', @ParentCompanyName = 'node53'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1094', @ParentCompanyName = 'node53'
GO
EXEC SqlGraph.Company$Insert @Name = 'node348', @ParentCompanyName = 'node53'
GO
EXEC SqlGraph.Company$Insert @Name = 'node408', @ParentCompanyName = 'node53'
GO
EXEC SqlGraph.Company$Insert @Name = 'node428', @ParentCompanyName = 'node53'
GO
EXEC SqlGraph.Company$Insert @Name = 'node513', @ParentCompanyName = 'node53'
GO
EXEC SqlGraph.Company$Insert @Name = 'node559', @ParentCompanyName = 'node53'
GO
EXEC SqlGraph.Company$Insert @Name = 'node601', @ParentCompanyName = 'node53'
GO
EXEC SqlGraph.Company$Insert @Name = 'node660', @ParentCompanyName = 'node53'
GO
EXEC SqlGraph.Company$Insert @Name = 'node849', @ParentCompanyName = 'node53'
GO
EXEC SqlGraph.Company$Insert @Name = 'node861', @ParentCompanyName = 'node53'
GO
EXEC SqlGraph.Company$Insert @Name = 'node929', @ParentCompanyName = 'node53'
GO
EXEC SqlGraph.Company$Insert @Name = 'node973', @ParentCompanyName = 'node53'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1035', @ParentCompanyName = 'node54'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1035'
GO
EXEC SqlGraph.Company$Insert @Name = 'node346', @ParentCompanyName = 'node54'
GO
EXEC SqlGraph.Company$Insert @Name = 'node379', @ParentCompanyName = 'node54'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node379'
GO
EXEC SqlGraph.Company$Insert @Name = 'node383', @ParentCompanyName = 'node54'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node383'
GO
EXEC SqlGraph.Company$Insert @Name = 'node399', @ParentCompanyName = 'node54'
GO
EXEC SqlGraph.Company$Insert @Name = 'node586', @ParentCompanyName = 'node54'
GO
EXEC SqlGraph.Company$Insert @Name = 'node693', @ParentCompanyName = 'node54'
GO
EXEC SqlGraph.Company$Insert @Name = 'node891', @ParentCompanyName = 'node54'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node891'
GO
EXEC SqlGraph.Company$Insert @Name = 'node932', @ParentCompanyName = 'node54'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node932'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1077', @ParentCompanyName = 'node55'
GO
EXEC SqlGraph.Company$Insert @Name = 'node125', @ParentCompanyName = 'node55'
GO
EXEC SqlGraph.Company$Insert @Name = 'node205', @ParentCompanyName = 'node55'
GO
EXEC SqlGraph.Company$Insert @Name = 'node207', @ParentCompanyName = 'node55'
GO
EXEC SqlGraph.Company$Insert @Name = 'node243', @ParentCompanyName = 'node55'
GO
EXEC SqlGraph.Company$Insert @Name = 'node410', @ParentCompanyName = 'node55'
GO
EXEC SqlGraph.Company$Insert @Name = 'node441', @ParentCompanyName = 'node55'
GO
EXEC SqlGraph.Company$Insert @Name = 'node621', @ParentCompanyName = 'node55'
GO
EXEC SqlGraph.Company$Insert @Name = 'node682', @ParentCompanyName = 'node55'
GO
EXEC SqlGraph.Company$Insert @Name = 'node724', @ParentCompanyName = 'node55'
GO
EXEC SqlGraph.Company$Insert @Name = 'node761', @ParentCompanyName = 'node55'
GO
EXEC SqlGraph.Company$Insert @Name = 'node899', @ParentCompanyName = 'node55'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node899'
GO
EXEC SqlGraph.Company$Insert @Name = 'node992', @ParentCompanyName = 'node55'
GO
EXEC SqlGraph.Company$Insert @Name = 'node107', @ParentCompanyName = 'node56'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node107'
GO
EXEC SqlGraph.Company$Insert @Name = 'node306', @ParentCompanyName = 'node56'
GO
EXEC SqlGraph.Company$Insert @Name = 'node400', @ParentCompanyName = 'node56'
GO
EXEC SqlGraph.Company$Insert @Name = 'node669', @ParentCompanyName = 'node56'
GO
EXEC SqlGraph.Company$Insert @Name = 'node800', @ParentCompanyName = 'node56'
GO
EXEC SqlGraph.Company$Insert @Name = 'node820', @ParentCompanyName = 'node56'
GO
EXEC SqlGraph.Company$Insert @Name = 'node858', @ParentCompanyName = 'node56'
GO
EXEC SqlGraph.Company$Insert @Name = 'node902', @ParentCompanyName = 'node56'
GO
EXEC SqlGraph.Company$Insert @Name = 'node936', @ParentCompanyName = 'node56'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1044', @ParentCompanyName = 'node57'
GO
EXEC SqlGraph.Company$Insert @Name = 'node293', @ParentCompanyName = 'node57'
GO
EXEC SqlGraph.Company$Insert @Name = 'node302', @ParentCompanyName = 'node57'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node302'
GO
EXEC SqlGraph.Company$Insert @Name = 'node453', @ParentCompanyName = 'node57'
GO
EXEC SqlGraph.Company$Insert @Name = 'node585', @ParentCompanyName = 'node57'
GO
EXEC SqlGraph.Company$Insert @Name = 'node640', @ParentCompanyName = 'node57'
GO
EXEC SqlGraph.Company$Insert @Name = 'node923', @ParentCompanyName = 'node57'
GO
EXEC SqlGraph.Company$Insert @Name = 'node974', @ParentCompanyName = 'node57'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1021', @ParentCompanyName = 'node58'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1036', @ParentCompanyName = 'node58'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1036'
GO
EXEC SqlGraph.Company$Insert @Name = 'node129', @ParentCompanyName = 'node58'
GO
EXEC SqlGraph.Company$Insert @Name = 'node145', @ParentCompanyName = 'node58'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node145'
GO
EXEC SqlGraph.Company$Insert @Name = 'node401', @ParentCompanyName = 'node58'
GO
EXEC SqlGraph.Company$Insert @Name = 'node451', @ParentCompanyName = 'node58'
GO
EXEC SqlGraph.Company$Insert @Name = 'node499', @ParentCompanyName = 'node58'
GO
EXEC SqlGraph.Company$Insert @Name = 'node633', @ParentCompanyName = 'node58'
GO
EXEC SqlGraph.Company$Insert @Name = 'node699', @ParentCompanyName = 'node58'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node699'
GO
EXEC SqlGraph.Company$Insert @Name = 'node924', @ParentCompanyName = 'node58'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node924'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1004', @ParentCompanyName = 'node59'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1031', @ParentCompanyName = 'node59'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1054', @ParentCompanyName = 'node59'
GO
EXEC SqlGraph.Company$Insert @Name = 'node175', @ParentCompanyName = 'node59'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node175'
GO
EXEC SqlGraph.Company$Insert @Name = 'node298', @ParentCompanyName = 'node59'
GO
EXEC SqlGraph.Company$Insert @Name = 'node332', @ParentCompanyName = 'node59'
GO
EXEC SqlGraph.Company$Insert @Name = 'node483', @ParentCompanyName = 'node59'
GO
EXEC SqlGraph.Company$Insert @Name = 'node523', @ParentCompanyName = 'node59'
GO
EXEC SqlGraph.Company$Insert @Name = 'node534', @ParentCompanyName = 'node59'
GO
EXEC SqlGraph.Company$Insert @Name = 'node564', @ParentCompanyName = 'node59'
GO
EXEC SqlGraph.Company$Insert @Name = 'node592', @ParentCompanyName = 'node59'
GO
EXEC SqlGraph.Company$Insert @Name = 'node606', @ParentCompanyName = 'node59'
GO
EXEC SqlGraph.Company$Insert @Name = 'node823', @ParentCompanyName = 'node59'
GO
EXEC SqlGraph.Company$Insert @Name = 'node930', @ParentCompanyName = 'node59'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1066', @ParentCompanyName = 'node6'
GO
EXEC SqlGraph.Company$Insert @Name = 'node190', @ParentCompanyName = 'node6'
GO
EXEC SqlGraph.Company$Insert @Name = 'node218', @ParentCompanyName = 'node6'
GO
EXEC SqlGraph.Company$Insert @Name = 'node403', @ParentCompanyName = 'node6'
GO
EXEC SqlGraph.Company$Insert @Name = 'node439', @ParentCompanyName = 'node6'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node439'
GO
EXEC SqlGraph.Company$Insert @Name = 'node493', @ParentCompanyName = 'node6'
GO
EXEC SqlGraph.Company$Insert @Name = 'node634', @ParentCompanyName = 'node6'
GO
EXEC SqlGraph.Company$Insert @Name = 'node747', @ParentCompanyName = 'node6'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node747'
GO
EXEC SqlGraph.Company$Insert @Name = 'node780', @ParentCompanyName = 'node6'
GO
EXEC SqlGraph.Company$Insert @Name = 'node810', @ParentCompanyName = 'node6'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1064', @ParentCompanyName = 'node60'
GO
EXEC SqlGraph.Company$Insert @Name = 'node155', @ParentCompanyName = 'node60'
GO
EXEC SqlGraph.Company$Insert @Name = 'node172', @ParentCompanyName = 'node60'
GO
EXEC SqlGraph.Company$Insert @Name = 'node385', @ParentCompanyName = 'node60'
GO
EXEC SqlGraph.Company$Insert @Name = 'node450', @ParentCompanyName = 'node60'
GO
EXEC SqlGraph.Company$Insert @Name = 'node474', @ParentCompanyName = 'node60'
GO
EXEC SqlGraph.Company$Insert @Name = 'node535', @ParentCompanyName = 'node60'
GO
EXEC SqlGraph.Company$Insert @Name = 'node549', @ParentCompanyName = 'node60'
GO
EXEC SqlGraph.Company$Insert @Name = 'node579', @ParentCompanyName = 'node60'
GO
EXEC SqlGraph.Company$Insert @Name = 'node645', @ParentCompanyName = 'node60'
GO
EXEC SqlGraph.Company$Insert @Name = 'node681', @ParentCompanyName = 'node60'
GO
EXEC SqlGraph.Company$Insert @Name = 'node712', @ParentCompanyName = 'node60'
GO
EXEC SqlGraph.Company$Insert @Name = 'node816', @ParentCompanyName = 'node60'
GO
EXEC SqlGraph.Company$Insert @Name = 'node104', @ParentCompanyName = 'node61'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1047', @ParentCompanyName = 'node61'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1086', @ParentCompanyName = 'node61'
GO
EXEC SqlGraph.Company$Insert @Name = 'node191', @ParentCompanyName = 'node61'
GO
EXEC SqlGraph.Company$Insert @Name = 'node247', @ParentCompanyName = 'node61'
GO
EXEC SqlGraph.Company$Insert @Name = 'node321', @ParentCompanyName = 'node61'
GO
EXEC SqlGraph.Company$Insert @Name = 'node365', @ParentCompanyName = 'node61'
GO
EXEC SqlGraph.Company$Insert @Name = 'node434', @ParentCompanyName = 'node61'
GO
EXEC SqlGraph.Company$Insert @Name = 'node524', @ParentCompanyName = 'node61'
GO
EXEC SqlGraph.Company$Insert @Name = 'node525', @ParentCompanyName = 'node61'
GO
EXEC SqlGraph.Company$Insert @Name = 'node709', @ParentCompanyName = 'node61'
GO
EXEC SqlGraph.Company$Insert @Name = 'node819', @ParentCompanyName = 'node61'
GO
EXEC SqlGraph.Company$Insert @Name = 'node872', @ParentCompanyName = 'node61'
GO
EXEC SqlGraph.Company$Insert @Name = 'node946', @ParentCompanyName = 'node61'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node946'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1017', @ParentCompanyName = 'node62'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1052', @ParentCompanyName = 'node62'
GO
EXEC SqlGraph.Company$Insert @Name = 'node131', @ParentCompanyName = 'node62'
GO
EXEC SqlGraph.Company$Insert @Name = 'node169', @ParentCompanyName = 'node62'
GO
EXEC SqlGraph.Company$Insert @Name = 'node312', @ParentCompanyName = 'node62'
GO
EXEC SqlGraph.Company$Insert @Name = 'node314', @ParentCompanyName = 'node62'
GO
EXEC SqlGraph.Company$Insert @Name = 'node319', @ParentCompanyName = 'node62'
GO
EXEC SqlGraph.Company$Insert @Name = 'node381', @ParentCompanyName = 'node62'
GO
EXEC SqlGraph.Company$Insert @Name = 'node814', @ParentCompanyName = 'node62'
GO
EXEC SqlGraph.Company$Insert @Name = 'node922', @ParentCompanyName = 'node62'
GO
EXEC SqlGraph.Company$Insert @Name = 'node959', @ParentCompanyName = 'node62'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1033', @ParentCompanyName = 'node63'
GO
EXEC SqlGraph.Company$Insert @Name = 'node423', @ParentCompanyName = 'node63'
GO
EXEC SqlGraph.Company$Insert @Name = 'node649', @ParentCompanyName = 'node63'
GO
EXEC SqlGraph.Company$Insert @Name = 'node663', @ParentCompanyName = 'node63'
GO
EXEC SqlGraph.Company$Insert @Name = 'node675', @ParentCompanyName = 'node63'
GO
EXEC SqlGraph.Company$Insert @Name = 'node126', @ParentCompanyName = 'node64'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node126'
GO
EXEC SqlGraph.Company$Insert @Name = 'node165', @ParentCompanyName = 'node64'
GO
EXEC SqlGraph.Company$Insert @Name = 'node177', @ParentCompanyName = 'node64'
GO
EXEC SqlGraph.Company$Insert @Name = 'node300', @ParentCompanyName = 'node64'
GO
EXEC SqlGraph.Company$Insert @Name = 'node359', @ParentCompanyName = 'node64'
GO
EXEC SqlGraph.Company$Insert @Name = 'node448', @ParentCompanyName = 'node64'
GO
EXEC SqlGraph.Company$Insert @Name = 'node478', @ParentCompanyName = 'node64'
GO
EXEC SqlGraph.Company$Insert @Name = 'node490', @ParentCompanyName = 'node64'
GO
EXEC SqlGraph.Company$Insert @Name = 'node527', @ParentCompanyName = 'node64'
GO
EXEC SqlGraph.Company$Insert @Name = 'node639', @ParentCompanyName = 'node64'
GO
EXEC SqlGraph.Company$Insert @Name = 'node837', @ParentCompanyName = 'node64'
GO
EXEC SqlGraph.Company$Insert @Name = 'node963', @ParentCompanyName = 'node64'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node963'
GO
EXEC SqlGraph.Company$Insert @Name = 'node179', @ParentCompanyName = 'node65'
GO
EXEC SqlGraph.Company$Insert @Name = 'node265', @ParentCompanyName = 'node65'
GO
EXEC SqlGraph.Company$Insert @Name = 'node375', @ParentCompanyName = 'node65'
GO
EXEC SqlGraph.Company$Insert @Name = 'node558', @ParentCompanyName = 'node65'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node558'
GO
EXEC SqlGraph.Company$Insert @Name = 'node563', @ParentCompanyName = 'node65'
GO
EXEC SqlGraph.Company$Insert @Name = 'node636', @ParentCompanyName = 'node65'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node636'
GO
EXEC SqlGraph.Company$Insert @Name = 'node714', @ParentCompanyName = 'node65'
GO
EXEC SqlGraph.Company$Insert @Name = 'node731', @ParentCompanyName = 'node65'
GO
EXEC SqlGraph.Company$Insert @Name = 'node822', @ParentCompanyName = 'node65'
GO
EXEC SqlGraph.Company$Insert @Name = 'node894', @ParentCompanyName = 'node65'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node894'
GO
EXEC SqlGraph.Company$Insert @Name = 'node970', @ParentCompanyName = 'node65'
GO
EXEC SqlGraph.Company$Insert @Name = 'node138', @ParentCompanyName = 'node66'
GO
EXEC SqlGraph.Company$Insert @Name = 'node146', @ParentCompanyName = 'node66'
GO
EXEC SqlGraph.Company$Insert @Name = 'node264', @ParentCompanyName = 'node66'
GO
EXEC SqlGraph.Company$Insert @Name = 'node269', @ParentCompanyName = 'node66'
GO
EXEC SqlGraph.Company$Insert @Name = 'node336', @ParentCompanyName = 'node66'
GO
EXEC SqlGraph.Company$Insert @Name = 'node430', @ParentCompanyName = 'node66'
GO
EXEC SqlGraph.Company$Insert @Name = 'node708', @ParentCompanyName = 'node66'
GO
EXEC SqlGraph.Company$Insert @Name = 'node873', @ParentCompanyName = 'node66'
GO
EXEC SqlGraph.Company$Insert @Name = 'node887', @ParentCompanyName = 'node66'
GO
EXEC SqlGraph.Company$Insert @Name = 'node942', @ParentCompanyName = 'node66'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node942'
GO
EXEC SqlGraph.Company$Insert @Name = 'node954', @ParentCompanyName = 'node66'
GO
EXEC SqlGraph.Company$Insert @Name = 'node217', @ParentCompanyName = 'node67'
GO
EXEC SqlGraph.Company$Insert @Name = 'node255', @ParentCompanyName = 'node67'
GO
EXEC SqlGraph.Company$Insert @Name = 'node257', @ParentCompanyName = 'node67'
GO
EXEC SqlGraph.Company$Insert @Name = 'node258', @ParentCompanyName = 'node67'
GO
EXEC SqlGraph.Company$Insert @Name = 'node347', @ParentCompanyName = 'node67'
GO
EXEC SqlGraph.Company$Insert @Name = 'node446', @ParentCompanyName = 'node67'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node446'
GO
EXEC SqlGraph.Company$Insert @Name = 'node702', @ParentCompanyName = 'node67'
GO
EXEC SqlGraph.Company$Insert @Name = 'node866', @ParentCompanyName = 'node67'
GO
EXEC SqlGraph.Company$Insert @Name = 'node925', @ParentCompanyName = 'node67'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1009', @ParentCompanyName = 'node68'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1015', @ParentCompanyName = 'node68'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1015'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1022', @ParentCompanyName = 'node68'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1042', @ParentCompanyName = 'node68'
GO
EXEC SqlGraph.Company$Insert @Name = 'node161', @ParentCompanyName = 'node68'
GO
EXEC SqlGraph.Company$Insert @Name = 'node223', @ParentCompanyName = 'node68'
GO
EXEC SqlGraph.Company$Insert @Name = 'node275', @ParentCompanyName = 'node68'
GO
EXEC SqlGraph.Company$Insert @Name = 'node368', @ParentCompanyName = 'node68'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node368'
GO
EXEC SqlGraph.Company$Insert @Name = 'node637', @ParentCompanyName = 'node68'
GO
EXEC SqlGraph.Company$Insert @Name = 'node697', @ParentCompanyName = 'node68'
GO
EXEC SqlGraph.Company$Insert @Name = 'node752', @ParentCompanyName = 'node68'
GO
EXEC SqlGraph.Company$Insert @Name = 'node764', @ParentCompanyName = 'node68'
GO
EXEC SqlGraph.Company$Insert @Name = 'node845', @ParentCompanyName = 'node68'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node845'
GO
EXEC SqlGraph.Company$Insert @Name = 'node848', @ParentCompanyName = 'node68'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1027', @ParentCompanyName = 'node69'
GO
EXEC SqlGraph.Company$Insert @Name = 'node394', @ParentCompanyName = 'node69'
GO
EXEC SqlGraph.Company$Insert @Name = 'node597', @ParentCompanyName = 'node69'
GO
EXEC SqlGraph.Company$Insert @Name = 'node657', @ParentCompanyName = 'node69'
GO
EXEC SqlGraph.Company$Insert @Name = 'node877', @ParentCompanyName = 'node69'
GO
EXEC SqlGraph.Company$Insert @Name = 'node927', @ParentCompanyName = 'node69'
GO
EXEC SqlGraph.Company$Insert @Name = 'node935', @ParentCompanyName = 'node69'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node935'
GO
EXEC SqlGraph.Company$Insert @Name = 'node229', @ParentCompanyName = 'node7'
GO
EXEC SqlGraph.Company$Insert @Name = 'node252', @ParentCompanyName = 'node7'
GO
EXEC SqlGraph.Company$Insert @Name = 'node271', @ParentCompanyName = 'node7'
GO
EXEC SqlGraph.Company$Insert @Name = 'node299', @ParentCompanyName = 'node7'
GO
EXEC SqlGraph.Company$Insert @Name = 'node349', @ParentCompanyName = 'node7'
GO
EXEC SqlGraph.Company$Insert @Name = 'node476', @ParentCompanyName = 'node7'
GO
EXEC SqlGraph.Company$Insert @Name = 'node517', @ParentCompanyName = 'node7'
GO
EXEC SqlGraph.Company$Insert @Name = 'node803', @ParentCompanyName = 'node7'
GO
EXEC SqlGraph.Company$Insert @Name = 'node961', @ParentCompanyName = 'node7'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1088', @ParentCompanyName = 'node70'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1088'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1100', @ParentCompanyName = 'node70'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1100'
GO
EXEC SqlGraph.Company$Insert @Name = 'node162', @ParentCompanyName = 'node70'
GO
EXEC SqlGraph.Company$Insert @Name = 'node290', @ParentCompanyName = 'node70'
GO
EXEC SqlGraph.Company$Insert @Name = 'node442', @ParentCompanyName = 'node70'
GO
EXEC SqlGraph.Company$Insert @Name = 'node638', @ParentCompanyName = 'node70'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node638'
GO
EXEC SqlGraph.Company$Insert @Name = 'node650', @ParentCompanyName = 'node70'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node650'
GO
EXEC SqlGraph.Company$Insert @Name = 'node704', @ParentCompanyName = 'node70'
GO
EXEC SqlGraph.Company$Insert @Name = 'node783', @ParentCompanyName = 'node70'
GO
EXEC SqlGraph.Company$Insert @Name = 'node864', @ParentCompanyName = 'node70'
GO
EXEC SqlGraph.Company$Insert @Name = 'node905', @ParentCompanyName = 'node70'
GO
EXEC SqlGraph.Company$Insert @Name = 'node926', @ParentCompanyName = 'node70'
GO
EXEC SqlGraph.Company$Insert @Name = 'node993', @ParentCompanyName = 'node70'
GO
EXEC SqlGraph.Company$Insert @Name = 'node143', @ParentCompanyName = 'node71'
GO
EXEC SqlGraph.Company$Insert @Name = 'node256', @ParentCompanyName = 'node71'
GO
EXEC SqlGraph.Company$Insert @Name = 'node262', @ParentCompanyName = 'node71'
GO
EXEC SqlGraph.Company$Insert @Name = 'node323', @ParentCompanyName = 'node71'
GO
EXEC SqlGraph.Company$Insert @Name = 'node372', @ParentCompanyName = 'node71'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node372'
GO
EXEC SqlGraph.Company$Insert @Name = 'node386', @ParentCompanyName = 'node71'
GO
EXEC SqlGraph.Company$Insert @Name = 'node460', @ParentCompanyName = 'node71'
GO
EXEC SqlGraph.Company$Insert @Name = 'node529', @ParentCompanyName = 'node71'
GO
EXEC SqlGraph.Company$Insert @Name = 'node602', @ParentCompanyName = 'node71'
GO
EXEC SqlGraph.Company$Insert @Name = 'node611', @ParentCompanyName = 'node71'
GO
EXEC SqlGraph.Company$Insert @Name = 'node813', @ParentCompanyName = 'node71'
GO
EXEC SqlGraph.Company$Insert @Name = 'node920', @ParentCompanyName = 'node71'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1063', @ParentCompanyName = 'node72'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1063'
GO
EXEC SqlGraph.Company$Insert @Name = 'node122', @ParentCompanyName = 'node72'
GO
EXEC SqlGraph.Company$Insert @Name = 'node209', @ParentCompanyName = 'node72'
GO
EXEC SqlGraph.Company$Insert @Name = 'node617', @ParentCompanyName = 'node72'
GO
EXEC SqlGraph.Company$Insert @Name = 'node885', @ParentCompanyName = 'node72'
GO
EXEC SqlGraph.Company$Insert @Name = 'node890', @ParentCompanyName = 'node72'
GO
EXEC SqlGraph.Company$Insert @Name = 'node984', @ParentCompanyName = 'node72'
GO
EXEC SqlGraph.Company$Insert @Name = 'node985', @ParentCompanyName = 'node72'
GO
EXEC SqlGraph.Company$Insert @Name = 'node995', @ParentCompanyName = 'node72'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1024', @ParentCompanyName = 'node73'
GO
EXEC SqlGraph.Company$Insert @Name = 'node136', @ParentCompanyName = 'node73'
GO
EXEC SqlGraph.Company$Insert @Name = 'node178', @ParentCompanyName = 'node73'
GO
EXEC SqlGraph.Company$Insert @Name = 'node220', @ParentCompanyName = 'node73'
GO
EXEC SqlGraph.Company$Insert @Name = 'node237', @ParentCompanyName = 'node73'
GO
EXEC SqlGraph.Company$Insert @Name = 'node286', @ParentCompanyName = 'node73'
GO
EXEC SqlGraph.Company$Insert @Name = 'node519', @ParentCompanyName = 'node73'
GO
EXEC SqlGraph.Company$Insert @Name = 'node526', @ParentCompanyName = 'node73'
GO
EXEC SqlGraph.Company$Insert @Name = 'node627', @ParentCompanyName = 'node73'
GO
EXEC SqlGraph.Company$Insert @Name = 'node746', @ParentCompanyName = 'node73'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node746'
GO
EXEC SqlGraph.Company$Insert @Name = 'node762', @ParentCompanyName = 'node73'
GO
EXEC SqlGraph.Company$Insert @Name = 'node782', @ParentCompanyName = 'node73'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node782'
GO
EXEC SqlGraph.Company$Insert @Name = 'node151', @ParentCompanyName = 'node74'
GO
EXEC SqlGraph.Company$Insert @Name = 'node158', @ParentCompanyName = 'node74'
GO
EXEC SqlGraph.Company$Insert @Name = 'node193', @ParentCompanyName = 'node74'
GO
EXEC SqlGraph.Company$Insert @Name = 'node211', @ParentCompanyName = 'node74'
GO
EXEC SqlGraph.Company$Insert @Name = 'node281', @ParentCompanyName = 'node74'
GO
EXEC SqlGraph.Company$Insert @Name = 'node659', @ParentCompanyName = 'node74'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node659'
GO
EXEC SqlGraph.Company$Insert @Name = 'node770', @ParentCompanyName = 'node74'
GO
EXEC SqlGraph.Company$Insert @Name = 'node831', @ParentCompanyName = 'node74'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node831'
GO
EXEC SqlGraph.Company$Insert @Name = 'node297', @ParentCompanyName = 'node75'
GO
EXEC SqlGraph.Company$Insert @Name = 'node582', @ParentCompanyName = 'node75'
GO
EXEC SqlGraph.Company$Insert @Name = 'node741', @ParentCompanyName = 'node75'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1039', @ParentCompanyName = 'node76'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1056', @ParentCompanyName = 'node76'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1059', @ParentCompanyName = 'node76'
GO
EXEC SqlGraph.Company$Insert @Name = 'node150', @ParentCompanyName = 'node76'
GO
EXEC SqlGraph.Company$Insert @Name = 'node267', @ParentCompanyName = 'node76'
GO
EXEC SqlGraph.Company$Insert @Name = 'node330', @ParentCompanyName = 'node76'
GO
EXEC SqlGraph.Company$Insert @Name = 'node340', @ParentCompanyName = 'node76'
GO
EXEC SqlGraph.Company$Insert @Name = 'node391', @ParentCompanyName = 'node76'
GO
EXEC SqlGraph.Company$Insert @Name = 'node409', @ParentCompanyName = 'node76'
GO
EXEC SqlGraph.Company$Insert @Name = 'node504', @ParentCompanyName = 'node76'
GO
EXEC SqlGraph.Company$Insert @Name = 'node566', @ParentCompanyName = 'node76'
GO
EXEC SqlGraph.Company$Insert @Name = 'node666', @ParentCompanyName = 'node76'
GO
EXEC SqlGraph.Company$Insert @Name = 'node688', @ParentCompanyName = 'node76'
GO
EXEC SqlGraph.Company$Insert @Name = 'node838', @ParentCompanyName = 'node76'
GO
EXEC SqlGraph.Company$Insert @Name = 'node846', @ParentCompanyName = 'node76'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node846'
GO
EXEC SqlGraph.Company$Insert @Name = 'node955', @ParentCompanyName = 'node76'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1026', @ParentCompanyName = 'node77'
GO
EXEC SqlGraph.Company$Insert @Name = 'node397', @ParentCompanyName = 'node77'
GO
EXEC SqlGraph.Company$Insert @Name = 'node852', @ParentCompanyName = 'node77'
GO
EXEC SqlGraph.Company$Insert @Name = 'node853', @ParentCompanyName = 'node77'
GO
EXEC SqlGraph.Company$Insert @Name = 'node870', @ParentCompanyName = 'node77'
GO
EXEC SqlGraph.Company$Insert @Name = 'node944', @ParentCompanyName = 'node77'
GO
EXEC SqlGraph.Company$Insert @Name = 'node945', @ParentCompanyName = 'node77'
GO
EXEC SqlGraph.Company$Insert @Name = 'node953', @ParentCompanyName = 'node77'
GO
EXEC SqlGraph.Company$Insert @Name = 'node969', @ParentCompanyName = 'node77'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1029', @ParentCompanyName = 'node78'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1075', @ParentCompanyName = 'node78'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1091', @ParentCompanyName = 'node78'
GO
EXEC SqlGraph.Company$Insert @Name = 'node202', @ParentCompanyName = 'node78'
GO
EXEC SqlGraph.Company$Insert @Name = 'node233', @ParentCompanyName = 'node78'
GO
EXEC SqlGraph.Company$Insert @Name = 'node454', @ParentCompanyName = 'node78'
GO
EXEC SqlGraph.Company$Insert @Name = 'node555', @ParentCompanyName = 'node78'
GO
EXEC SqlGraph.Company$Insert @Name = 'node618', @ParentCompanyName = 'node78'
GO
EXEC SqlGraph.Company$Insert @Name = 'node729', @ParentCompanyName = 'node78'
GO
EXEC SqlGraph.Company$Insert @Name = 'node960', @ParentCompanyName = 'node78'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1041', @ParentCompanyName = 'node79'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1074', @ParentCompanyName = 'node79'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1078', @ParentCompanyName = 'node79'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1078'
GO
EXEC SqlGraph.Company$Insert @Name = 'node171', @ParentCompanyName = 'node79'
GO
EXEC SqlGraph.Company$Insert @Name = 'node219', @ParentCompanyName = 'node79'
GO
EXEC SqlGraph.Company$Insert @Name = 'node341', @ParentCompanyName = 'node79'
GO
EXEC SqlGraph.Company$Insert @Name = 'node496', @ParentCompanyName = 'node79'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1011', @ParentCompanyName = 'node8'
GO
EXEC SqlGraph.Company$Insert @Name = 'node110', @ParentCompanyName = 'node8'
GO
EXEC SqlGraph.Company$Insert @Name = 'node118', @ParentCompanyName = 'node8'
GO
EXEC SqlGraph.Company$Insert @Name = 'node163', @ParentCompanyName = 'node8'
GO
EXEC SqlGraph.Company$Insert @Name = 'node231', @ParentCompanyName = 'node8'
GO
EXEC SqlGraph.Company$Insert @Name = 'node609', @ParentCompanyName = 'node8'
GO
EXEC SqlGraph.Company$Insert @Name = 'node626', @ParentCompanyName = 'node8'
GO
EXEC SqlGraph.Company$Insert @Name = 'node632', @ParentCompanyName = 'node8'
GO
EXEC SqlGraph.Company$Insert @Name = 'node694', @ParentCompanyName = 'node8'
GO
EXEC SqlGraph.Company$Insert @Name = 'node788', @ParentCompanyName = 'node8'
GO
EXEC SqlGraph.Company$Insert @Name = 'node893', @ParentCompanyName = 'node8'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1072', @ParentCompanyName = 'node80'
GO
EXEC SqlGraph.Company$Insert @Name = 'node254', @ParentCompanyName = 'node80'
GO
EXEC SqlGraph.Company$Insert @Name = 'node462', @ParentCompanyName = 'node80'
GO
EXEC SqlGraph.Company$Insert @Name = 'node624', @ParentCompanyName = 'node80'
GO
EXEC SqlGraph.Company$Insert @Name = 'node686', @ParentCompanyName = 'node80'
GO
EXEC SqlGraph.Company$Insert @Name = 'node742', @ParentCompanyName = 'node80'
GO
EXEC SqlGraph.Company$Insert @Name = 'node757', @ParentCompanyName = 'node80'
GO
EXEC SqlGraph.Company$Insert @Name = 'node124', @ParentCompanyName = 'node81'
GO
EXEC SqlGraph.Company$Insert @Name = 'node304', @ParentCompanyName = 'node81'
GO
EXEC SqlGraph.Company$Insert @Name = 'node431', @ParentCompanyName = 'node81'
GO
EXEC SqlGraph.Company$Insert @Name = 'node580', @ParentCompanyName = 'node81'
GO
EXEC SqlGraph.Company$Insert @Name = 'node642', @ParentCompanyName = 'node81'
GO
EXEC SqlGraph.Company$Insert @Name = 'node652', @ParentCompanyName = 'node81'
GO
EXEC SqlGraph.Company$Insert @Name = 'node671', @ParentCompanyName = 'node81'
GO
EXEC SqlGraph.Company$Insert @Name = 'node809', @ParentCompanyName = 'node81'
GO
EXEC SqlGraph.Company$Insert @Name = 'node886', @ParentCompanyName = 'node81'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1068', @ParentCompanyName = 'node82'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1068'
GO
EXEC SqlGraph.Company$Insert @Name = 'node116', @ParentCompanyName = 'node82'
GO
EXEC SqlGraph.Company$Insert @Name = 'node238', @ParentCompanyName = 'node82'
GO
EXEC SqlGraph.Company$Insert @Name = 'node253', @ParentCompanyName = 'node82'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node253'
GO
EXEC SqlGraph.Company$Insert @Name = 'node334', @ParentCompanyName = 'node82'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node334'
GO
EXEC SqlGraph.Company$Insert @Name = 'node378', @ParentCompanyName = 'node82'
GO
EXEC SqlGraph.Company$Insert @Name = 'node928', @ParentCompanyName = 'node82'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1053', @ParentCompanyName = 'node83'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1069', @ParentCompanyName = 'node83'
GO
EXEC SqlGraph.Company$Insert @Name = 'node141', @ParentCompanyName = 'node83'
GO
EXEC SqlGraph.Company$Insert @Name = 'node239', @ParentCompanyName = 'node83'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node239'
GO
EXEC SqlGraph.Company$Insert @Name = 'node307', @ParentCompanyName = 'node83'
GO
EXEC SqlGraph.Company$Insert @Name = 'node395', @ParentCompanyName = 'node83'
GO
EXEC SqlGraph.Company$Insert @Name = 'node542', @ParentCompanyName = 'node83'
GO
EXEC SqlGraph.Company$Insert @Name = 'node625', @ParentCompanyName = 'node83'
GO
EXEC SqlGraph.Company$Insert @Name = 'node826', @ParentCompanyName = 'node83'
GO
EXEC SqlGraph.Company$Insert @Name = 'node828', @ParentCompanyName = 'node83'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node828'
GO
EXEC SqlGraph.Company$Insert @Name = 'node966', @ParentCompanyName = 'node83'
GO
EXEC SqlGraph.Company$Insert @Name = 'node979', @ParentCompanyName = 'node83'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1081', @ParentCompanyName = 'node84'
GO
EXEC SqlGraph.Company$Insert @Name = 'node181', @ParentCompanyName = 'node84'
GO
EXEC SqlGraph.Company$Insert @Name = 'node198', @ParentCompanyName = 'node84'
GO
EXEC SqlGraph.Company$Insert @Name = 'node244', @ParentCompanyName = 'node84'
GO
EXEC SqlGraph.Company$Insert @Name = 'node489', @ParentCompanyName = 'node84'
GO
EXEC SqlGraph.Company$Insert @Name = 'node536', @ParentCompanyName = 'node84'
GO
EXEC SqlGraph.Company$Insert @Name = 'node581', @ParentCompanyName = 'node84'
GO
EXEC SqlGraph.Company$Insert @Name = 'node623', @ParentCompanyName = 'node84'
GO
EXEC SqlGraph.Company$Insert @Name = 'node718', @ParentCompanyName = 'node84'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node718'
GO
EXEC SqlGraph.Company$Insert @Name = 'node743', @ParentCompanyName = 'node84'
GO
EXEC SqlGraph.Company$Insert @Name = 'node806', @ParentCompanyName = 'node84'
GO
EXEC SqlGraph.Company$Insert @Name = 'node808', @ParentCompanyName = 'node84'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1000', @ParentCompanyName = 'node85'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1046', @ParentCompanyName = 'node85'
GO
EXEC SqlGraph.Company$Insert @Name = 'node156', @ParentCompanyName = 'node85'
GO
EXEC SqlGraph.Company$Insert @Name = 'node273', @ParentCompanyName = 'node85'
GO
EXEC SqlGraph.Company$Insert @Name = 'node317', @ParentCompanyName = 'node85'
GO
EXEC SqlGraph.Company$Insert @Name = 'node325', @ParentCompanyName = 'node85'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node325'
GO
EXEC SqlGraph.Company$Insert @Name = 'node354', @ParentCompanyName = 'node85'
GO
EXEC SqlGraph.Company$Insert @Name = 'node406', @ParentCompanyName = 'node85'
GO
EXEC SqlGraph.Company$Insert @Name = 'node614', @ParentCompanyName = 'node85'
GO
EXEC SqlGraph.Company$Insert @Name = 'node736', @ParentCompanyName = 'node85'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node736'
GO
EXEC SqlGraph.Company$Insert @Name = 'node947', @ParentCompanyName = 'node85'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1073', @ParentCompanyName = 'node86'
GO
EXEC SqlGraph.Company$Insert @Name = 'node274', @ParentCompanyName = 'node86'
GO
EXEC SqlGraph.Company$Insert @Name = 'node282', @ParentCompanyName = 'node86'
GO
EXEC SqlGraph.Company$Insert @Name = 'node356', @ParentCompanyName = 'node86'
GO
EXEC SqlGraph.Company$Insert @Name = 'node458', @ParentCompanyName = 'node86'
GO
EXEC SqlGraph.Company$Insert @Name = 'node539', @ParentCompanyName = 'node86'
GO
EXEC SqlGraph.Company$Insert @Name = 'node553', @ParentCompanyName = 'node86'
GO
EXEC SqlGraph.Company$Insert @Name = 'node721', @ParentCompanyName = 'node86'
GO
EXEC SqlGraph.Company$Insert @Name = 'node775', @ParentCompanyName = 'node86'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node775'
GO
EXEC SqlGraph.Company$Insert @Name = 'node865', @ParentCompanyName = 'node86'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node865'
GO
EXEC SqlGraph.Company$Insert @Name = 'node867', @ParentCompanyName = 'node86'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node867'
GO
EXEC SqlGraph.Company$Insert @Name = 'node948', @ParentCompanyName = 'node86'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1006', @ParentCompanyName = 'node87'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1013', @ParentCompanyName = 'node87'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1067', @ParentCompanyName = 'node87'
GO
EXEC SqlGraph.Company$Insert @Name = 'node727', @ParentCompanyName = 'node87'
GO
EXEC SqlGraph.Company$Insert @Name = 'node941', @ParentCompanyName = 'node87'
GO
EXEC SqlGraph.Company$Insert @Name = 'node132', @ParentCompanyName = 'node88'
GO
EXEC SqlGraph.Company$Insert @Name = 'node142', @ParentCompanyName = 'node88'
GO
EXEC SqlGraph.Company$Insert @Name = 'node221', @ParentCompanyName = 'node88'
GO
EXEC SqlGraph.Company$Insert @Name = 'node236', @ParentCompanyName = 'node88'
GO
EXEC SqlGraph.Company$Insert @Name = 'node251', @ParentCompanyName = 'node88'
GO
EXEC SqlGraph.Company$Insert @Name = 'node369', @ParentCompanyName = 'node88'
GO
EXEC SqlGraph.Company$Insert @Name = 'node455', @ParentCompanyName = 'node88'
GO
EXEC SqlGraph.Company$Insert @Name = 'node492', @ParentCompanyName = 'node88'
GO
EXEC SqlGraph.Company$Insert @Name = 'node509', @ParentCompanyName = 'node88'
GO
EXEC SqlGraph.Company$Insert @Name = 'node587', @ParentCompanyName = 'node88'
GO
EXEC SqlGraph.Company$Insert @Name = 'node703', @ParentCompanyName = 'node88'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node703'
GO
EXEC SqlGraph.Company$Insert @Name = 'node713', @ParentCompanyName = 'node88'
GO
EXEC SqlGraph.Company$Insert @Name = 'node719', @ParentCompanyName = 'node88'
GO
EXEC SqlGraph.Company$Insert @Name = 'node931', @ParentCompanyName = 'node88'
GO
EXEC SqlGraph.Company$Insert @Name = 'node971', @ParentCompanyName = 'node88'
GO
EXEC SqlGraph.Company$Insert @Name = 'node296', @ParentCompanyName = 'node89'
GO
EXEC SqlGraph.Company$Insert @Name = 'node358', @ParentCompanyName = 'node89'
GO
EXEC SqlGraph.Company$Insert @Name = 'node417', @ParentCompanyName = 'node89'
GO
EXEC SqlGraph.Company$Insert @Name = 'node440', @ParentCompanyName = 'node89'
GO
EXEC SqlGraph.Company$Insert @Name = 'node550', @ParentCompanyName = 'node89'
GO
EXEC SqlGraph.Company$Insert @Name = 'node561', @ParentCompanyName = 'node89'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node561'
GO
EXEC SqlGraph.Company$Insert @Name = 'node884', @ParentCompanyName = 'node89'
GO
EXEC SqlGraph.Company$Insert @Name = 'node898', @ParentCompanyName = 'node89'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node898'
GO
EXEC SqlGraph.Company$Insert @Name = 'node194', @ParentCompanyName = 'node9'
GO
EXEC SqlGraph.Company$Insert @Name = 'node199', @ParentCompanyName = 'node9'
GO
EXEC SqlGraph.Company$Insert @Name = 'node344', @ParentCompanyName = 'node9'
GO
EXEC SqlGraph.Company$Insert @Name = 'node374', @ParentCompanyName = 'node9'
GO
EXEC SqlGraph.Company$Insert @Name = 'node520', @ParentCompanyName = 'node9'
GO
EXEC SqlGraph.Company$Insert @Name = 'node521', @ParentCompanyName = 'node9'
GO
EXEC SqlGraph.Company$Insert @Name = 'node603', @ParentCompanyName = 'node9'
GO
EXEC SqlGraph.Company$Insert @Name = 'node674', @ParentCompanyName = 'node9'
GO
EXEC SqlGraph.Company$Insert @Name = 'node687', @ParentCompanyName = 'node9'
GO
EXEC SqlGraph.Company$Insert @Name = 'node827', @ParentCompanyName = 'node9'
GO
EXEC SqlGraph.Company$Insert @Name = 'node103', @ParentCompanyName = 'node90'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1085', @ParentCompanyName = 'node90'
GO
EXEC SqlGraph.Company$Insert @Name = 'node195', @ParentCompanyName = 'node90'
GO
EXEC SqlGraph.Company$Insert @Name = 'node228', @ParentCompanyName = 'node90'
GO
EXEC SqlGraph.Company$Insert @Name = 'node245', @ParentCompanyName = 'node90'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node245'
GO
EXEC SqlGraph.Company$Insert @Name = 'node405', @ParentCompanyName = 'node90'
GO
EXEC SqlGraph.Company$Insert @Name = 'node438', @ParentCompanyName = 'node90'
GO
EXEC SqlGraph.Company$Insert @Name = 'node498', @ParentCompanyName = 'node90'
GO
EXEC SqlGraph.Company$Insert @Name = 'node615', @ParentCompanyName = 'node90'
GO
EXEC SqlGraph.Company$Insert @Name = 'node654', @ParentCompanyName = 'node90'
GO
EXEC SqlGraph.Company$Insert @Name = 'node765', @ParentCompanyName = 'node90'
GO
EXEC SqlGraph.Company$Insert @Name = 'node793', @ParentCompanyName = 'node90'
GO
EXEC SqlGraph.Company$Insert @Name = 'node906', @ParentCompanyName = 'node90'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1057', @ParentCompanyName = 'node91'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1098', @ParentCompanyName = 'node91'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1098'
GO
EXEC SqlGraph.Company$Insert @Name = 'node111', @ParentCompanyName = 'node91'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node111'
GO
EXEC SqlGraph.Company$Insert @Name = 'node303', @ParentCompanyName = 'node91'
GO
EXEC SqlGraph.Company$Insert @Name = 'node311', @ParentCompanyName = 'node91'
GO
EXEC SqlGraph.Company$Insert @Name = 'node591', @ParentCompanyName = 'node91'
GO
EXEC SqlGraph.Company$Insert @Name = 'node695', @ParentCompanyName = 'node91'
GO
EXEC SqlGraph.Company$Insert @Name = 'node710', @ParentCompanyName = 'node91'
GO
EXEC SqlGraph.Company$Insert @Name = 'node767', @ParentCompanyName = 'node91'
GO
EXEC SqlGraph.Company$Insert @Name = 'node841', @ParentCompanyName = 'node91'
GO
EXEC SqlGraph.Company$Insert @Name = 'node847', @ParentCompanyName = 'node91'
GO
EXEC SqlGraph.Company$Insert @Name = 'node115', @ParentCompanyName = 'node92'
GO
EXEC SqlGraph.Company$Insert @Name = 'node466', @ParentCompanyName = 'node92'
GO
EXEC SqlGraph.Company$Insert @Name = 'node554', @ParentCompanyName = 'node92'
GO
EXEC SqlGraph.Company$Insert @Name = 'node829', @ParentCompanyName = 'node92'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1018', @ParentCompanyName = 'node93'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1080', @ParentCompanyName = 'node93'
GO
EXEC SqlGraph.Company$Insert @Name = 'node144', @ParentCompanyName = 'node93'
GO
EXEC SqlGraph.Company$Insert @Name = 'node157', @ParentCompanyName = 'node93'
GO
EXEC SqlGraph.Company$Insert @Name = 'node240', @ParentCompanyName = 'node93'
GO
EXEC SqlGraph.Company$Insert @Name = 'node301', @ParentCompanyName = 'node93'
GO
EXEC SqlGraph.Company$Insert @Name = 'node635', @ParentCompanyName = 'node93'
GO
EXEC SqlGraph.Company$Insert @Name = 'node201', @ParentCompanyName = 'node94'
GO
EXEC SqlGraph.Company$Insert @Name = 'node280', @ParentCompanyName = 'node94'
GO
EXEC SqlGraph.Company$Insert @Name = 'node329', @ParentCompanyName = 'node94'
GO
EXEC SqlGraph.Company$Insert @Name = 'node436', @ParentCompanyName = 'node94'
GO
EXEC SqlGraph.Company$Insert @Name = 'node445', @ParentCompanyName = 'node94'
GO
EXEC SqlGraph.Company$Insert @Name = 'node464', @ParentCompanyName = 'node94'
GO
EXEC SqlGraph.Company$Insert @Name = 'node477', @ParentCompanyName = 'node94'
GO
EXEC SqlGraph.Company$Insert @Name = 'node522', @ParentCompanyName = 'node94'
GO
EXEC SqlGraph.Company$Insert @Name = 'node537', @ParentCompanyName = 'node94'
GO
EXEC SqlGraph.Company$Insert @Name = 'node596', @ParentCompanyName = 'node94'
GO
EXEC SqlGraph.Company$Insert @Name = 'node773', @ParentCompanyName = 'node94'
GO
EXEC SqlGraph.Company$Insert @Name = 'node876', @ParentCompanyName = 'node94'
GO
EXEC SqlGraph.Company$Insert @Name = 'node950', @ParentCompanyName = 'node94'
GO
EXEC SqlGraph.Company$Insert @Name = 'node982', @ParentCompanyName = 'node94'
GO
EXEC SqlGraph.Company$Insert @Name = 'node214', @ParentCompanyName = 'node95'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node214'
GO
EXEC SqlGraph.Company$Insert @Name = 'node266', @ParentCompanyName = 'node95'
GO
EXEC SqlGraph.Company$Insert @Name = 'node294', @ParentCompanyName = 'node95'
GO
EXEC SqlGraph.Company$Insert @Name = 'node352', @ParentCompanyName = 'node95'
GO
EXEC SqlGraph.Company$Insert @Name = 'node411', @ParentCompanyName = 'node95'
GO
EXEC SqlGraph.Company$Insert @Name = 'node510', @ParentCompanyName = 'node95'
GO
EXEC SqlGraph.Company$Insert @Name = 'node515', @ParentCompanyName = 'node95'
GO
EXEC SqlGraph.Company$Insert @Name = 'node690', @ParentCompanyName = 'node95'
GO
EXEC SqlGraph.Company$Insert @Name = 'node749', @ParentCompanyName = 'node95'
GO
EXEC SqlGraph.Company$Insert @Name = 'node797', @ParentCompanyName = 'node95'
GO
EXEC SqlGraph.Company$Insert @Name = 'node859', @ParentCompanyName = 'node95'
GO
EXEC SqlGraph.Company$Insert @Name = 'node943', @ParentCompanyName = 'node95'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1019', @ParentCompanyName = 'node96'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1019'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1065', @ParentCompanyName = 'node96'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1089', @ParentCompanyName = 'node96'
GO
EXEC SqlGraph.Company$Insert @Name = 'node114', @ParentCompanyName = 'node96'
GO
EXEC SqlGraph.Company$Insert @Name = 'node123', @ParentCompanyName = 'node96'
GO
EXEC SqlGraph.Company$Insert @Name = 'node206', @ParentCompanyName = 'node96'
GO
EXEC SqlGraph.Company$Insert @Name = 'node208', @ParentCompanyName = 'node96'
GO
EXEC SqlGraph.Company$Insert @Name = 'node276', @ParentCompanyName = 'node96'
GO
EXEC SqlGraph.Company$Insert @Name = 'node284', @ParentCompanyName = 'node96'
GO
EXEC SqlGraph.Company$Insert @Name = 'node415', @ParentCompanyName = 'node96'
GO
EXEC SqlGraph.Company$Insert @Name = 'node418', @ParentCompanyName = 'node96'
GO
EXEC SqlGraph.Company$Insert @Name = 'node482', @ParentCompanyName = 'node96'
GO
EXEC SqlGraph.Company$Insert @Name = 'node551', @ParentCompanyName = 'node96'
GO
EXEC SqlGraph.Company$Insert @Name = 'node590', @ParentCompanyName = 'node96'
GO
EXEC SqlGraph.Company$Insert @Name = 'node610', @ParentCompanyName = 'node96'
GO
EXEC SqlGraph.Company$Insert @Name = 'node705', @ParentCompanyName = 'node96'
GO
EXEC SqlGraph.Company$Insert @Name = 'node998', @ParentCompanyName = 'node96'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1025', @ParentCompanyName = 'node97'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1083', @ParentCompanyName = 'node97'
GO
EXEC SqlGraph.Company$Insert @Name = 'node128', @ParentCompanyName = 'node97'
GO
EXEC SqlGraph.Company$Insert @Name = 'node159', @ParentCompanyName = 'node97'
GO
EXEC SqlGraph.Company$Insert @Name = 'node224', @ParentCompanyName = 'node97'
GO
EXEC SqlGraph.Company$Insert @Name = 'node308', @ParentCompanyName = 'node97'
GO
EXEC SqlGraph.Company$Insert @Name = 'node479', @ParentCompanyName = 'node97'
GO
EXEC SqlGraph.Company$Insert @Name = 'node577', @ParentCompanyName = 'node97'
GO
EXEC SqlGraph.Company$Insert @Name = 'node738', @ParentCompanyName = 'node97'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node738'
GO
EXEC SqlGraph.Company$Insert @Name = 'node869', @ParentCompanyName = 'node97'
GO
EXEC SqlGraph.Company$Insert @Name = 'node910', @ParentCompanyName = 'node97'
GO
EXEC SqlGraph.Company$Insert @Name = 'node983', @ParentCompanyName = 'node97'
GO
EXEC SqlGraph.Company$Insert @Name = 'node991', @ParentCompanyName = 'node97'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node991'
GO
EXEC SqlGraph.Company$Insert @Name = 'node147', @ParentCompanyName = 'node98'
GO
EXEC SqlGraph.Company$Insert @Name = 'node373', @ParentCompanyName = 'node98'
GO
EXEC SqlGraph.Company$Insert @Name = 'node376', @ParentCompanyName = 'node98'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node376'
GO
EXEC SqlGraph.Company$Insert @Name = 'node387', @ParentCompanyName = 'node98'
GO
EXEC SqlGraph.Company$Insert @Name = 'node427', @ParentCompanyName = 'node98'
GO
EXEC SqlGraph.Company$Insert @Name = 'node732', @ParentCompanyName = 'node98'
GO
EXEC SqlGraph.Company$Insert @Name = 'node839', @ParentCompanyName = 'node98'
GO
EXEC SqlGraph.Company$Insert @Name = 'node951', @ParentCompanyName = 'node98'
GO
EXEC SqlGraph.Company$Insert @Name = 'node975', @ParentCompanyName = 'node98'
GO
EXEC SqlGraph.Company$Insert @Name = 'node105', @ParentCompanyName = 'node99'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1087', @ParentCompanyName = 'node99'
GO
EXEC SqlGraph.Company$Insert @Name = 'node404', @ParentCompanyName = 'node99'
GO
EXEC SqlGraph.Company$Insert @Name = 'node484', @ParentCompanyName = 'node99'
GO
EXEC SqlGraph.Company$Insert @Name = 'node508', @ParentCompanyName = 'node99'
GO
EXEC SqlGraph.Company$Insert @Name = 'node832', @ParentCompanyName = 'node99'
GO
EXEC SqlGraph.Company$Insert @Name = 'node843', @ParentCompanyName = 'node99'
GO
EXEC SqlGraph.Company$Insert @Name = 'node3049', @ParentCompanyName = 'node1000'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1385', @ParentCompanyName = 'node1001'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1385'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1939', @ParentCompanyName = 'node1001'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1939'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2087', @ParentCompanyName = 'node1001'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2479', @ParentCompanyName = 'node1001'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2479'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2696', @ParentCompanyName = 'node1002'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2696'
GO
EXEC SqlGraph.Company$Insert @Name = 'node3082', @ParentCompanyName = 'node1002'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1642', @ParentCompanyName = 'node1003'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1642'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2256', @ParentCompanyName = 'node1003'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2256'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2763', @ParentCompanyName = 'node1003'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2763'
GO
EXEC SqlGraph.Company$Insert @Name = 'node3015', @ParentCompanyName = 'node1003'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node3015'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1664', @ParentCompanyName = 'node1004'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1664'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2469', @ParentCompanyName = 'node1004'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2469'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1281', @ParentCompanyName = 'node1005'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1281'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2249', @ParentCompanyName = 'node1005'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2249'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2608', @ParentCompanyName = 'node1005'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2608'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2918', @ParentCompanyName = 'node1005'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2918'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1708', @ParentCompanyName = 'node1006'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1708'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2900', @ParentCompanyName = 'node1006'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2900'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2569', @ParentCompanyName = 'node1007'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2569'
GO
EXEC SqlGraph.Company$Insert @Name = 'node3060', @ParentCompanyName = 'node1007'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node3060'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2215', @ParentCompanyName = 'node1008'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2215'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2344', @ParentCompanyName = 'node1008'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2344'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2388', @ParentCompanyName = 'node1008'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2388'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2718', @ParentCompanyName = 'node1008'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2718'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1470', @ParentCompanyName = 'node1009'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1470'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2624', @ParentCompanyName = 'node1009'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2624'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2817', @ParentCompanyName = 'node1009'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2817'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1312', @ParentCompanyName = 'node1010'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1312'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2308', @ParentCompanyName = 'node1010'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2308'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1926', @ParentCompanyName = 'node1011'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1926'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2359', @ParentCompanyName = 'node1011'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2359'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2831', @ParentCompanyName = 'node1011'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2831'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2758', @ParentCompanyName = 'node1013'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2758'
GO
EXEC SqlGraph.Company$Insert @Name = 'node3081', @ParentCompanyName = 'node1013'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node3081'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2030', @ParentCompanyName = 'node1016'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2030'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2443', @ParentCompanyName = 'node1016'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2443'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1451', @ParentCompanyName = 'node1017'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1451'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1612', @ParentCompanyName = 'node1017'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1612'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2267', @ParentCompanyName = 'node1018'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2267'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1218', @ParentCompanyName = 'node1020'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1218'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1416', @ParentCompanyName = 'node1021'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1975', @ParentCompanyName = 'node1021'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2210', @ParentCompanyName = 'node1021'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2210'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1745', @ParentCompanyName = 'node1022'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1745'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1863', @ParentCompanyName = 'node1022'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1863'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2265', @ParentCompanyName = 'node1022'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2265'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2478', @ParentCompanyName = 'node1022'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2478'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1701', @ParentCompanyName = 'node1023'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1701'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2381', @ParentCompanyName = 'node1023'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2401', @ParentCompanyName = 'node1023'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2401'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1230', @ParentCompanyName = 'node1024'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1957', @ParentCompanyName = 'node1024'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2277', @ParentCompanyName = 'node1024'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2277'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2791', @ParentCompanyName = 'node1024'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2791'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2203', @ParentCompanyName = 'node1025'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2203'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2328', @ParentCompanyName = 'node1025'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2328'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1862', @ParentCompanyName = 'node1026'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1862'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2374', @ParentCompanyName = 'node1026'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2374'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2572', @ParentCompanyName = 'node1027'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2572'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1651', @ParentCompanyName = 'node1028'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1651'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1718', @ParentCompanyName = 'node1029'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1718'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2310', @ParentCompanyName = 'node1029'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2310'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2903', @ParentCompanyName = 'node1029'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2903'
GO
EXEC SqlGraph.Company$Insert @Name = 'node3003', @ParentCompanyName = 'node1029'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1232', @ParentCompanyName = 'node103'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1418', @ParentCompanyName = 'node103'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1418'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2287', @ParentCompanyName = 'node103'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2287'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1688', @ParentCompanyName = 'node1030'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1688'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1254', @ParentCompanyName = 'node1031'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1254'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1484', @ParentCompanyName = 'node1031'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1484'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1573', @ParentCompanyName = 'node1031'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1573'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1580', @ParentCompanyName = 'node1031'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1580'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1616', @ParentCompanyName = 'node1031'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1616'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1953', @ParentCompanyName = 'node1031'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2563', @ParentCompanyName = 'node1031'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2563'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2636', @ParentCompanyName = 'node1031'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2636'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2160', @ParentCompanyName = 'node1032'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2160'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2246', @ParentCompanyName = 'node1032'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2246'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1581', @ParentCompanyName = 'node1033'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1581'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2919', @ParentCompanyName = 'node1033'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2919'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1103', @ParentCompanyName = 'node1034'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1103'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1804', @ParentCompanyName = 'node1034'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1804'
GO
EXEC SqlGraph.Company$Insert @Name = 'node3032', @ParentCompanyName = 'node1034'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node3032'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1337', @ParentCompanyName = 'node1037'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1337'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1568', @ParentCompanyName = 'node1037'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1568'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1591', @ParentCompanyName = 'node1037'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2312', @ParentCompanyName = 'node1037'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2312'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2399', @ParentCompanyName = 'node1037'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2399'
GO
EXEC SqlGraph.Company$Insert @Name = 'node3089', @ParentCompanyName = 'node1037'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node3089'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2929', @ParentCompanyName = 'node1038'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2929'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1562', @ParentCompanyName = 'node1039'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1562'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2669', @ParentCompanyName = 'node1039'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2669'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2805', @ParentCompanyName = 'node1039'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2805'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1827', @ParentCompanyName = 'node104'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1827'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1599', @ParentCompanyName = 'node1040'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1599'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2368', @ParentCompanyName = 'node1040'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2368'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2357', @ParentCompanyName = 'node1041'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2357'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2997', @ParentCompanyName = 'node1042'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2997'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1443', @ParentCompanyName = 'node1043'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1813', @ParentCompanyName = 'node1043'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1813'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2810', @ParentCompanyName = 'node1043'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2810'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1219', @ParentCompanyName = 'node1044'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1791', @ParentCompanyName = 'node1044'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1791'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1903', @ParentCompanyName = 'node1044'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1903'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1522', @ParentCompanyName = 'node1045'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1522'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1801', @ParentCompanyName = 'node1045'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1801'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2181', @ParentCompanyName = 'node1045'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2181'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2540', @ParentCompanyName = 'node1045'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2540'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1264', @ParentCompanyName = 'node1046'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1264'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1606', @ParentCompanyName = 'node1046'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1606'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1803', @ParentCompanyName = 'node1046'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1803'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1126', @ParentCompanyName = 'node1047'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1126'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1727', @ParentCompanyName = 'node1048'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1727'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2822', @ParentCompanyName = 'node1048'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2699', @ParentCompanyName = 'node1049'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2699'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1486', @ParentCompanyName = 'node105'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2621', @ParentCompanyName = 'node105'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2621'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1622', @ParentCompanyName = 'node1050'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1622'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1864', @ParentCompanyName = 'node1051'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2551', @ParentCompanyName = 'node1051'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2551'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2891', @ParentCompanyName = 'node1051'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2891'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2034', @ParentCompanyName = 'node1052'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2034'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2241', @ParentCompanyName = 'node1052'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2241'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2134', @ParentCompanyName = 'node1053'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2134'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2613', @ParentCompanyName = 'node1053'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1158', @ParentCompanyName = 'node1054'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1158'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1269', @ParentCompanyName = 'node1054'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2138', @ParentCompanyName = 'node1055'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2380', @ParentCompanyName = 'node1055'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2380'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2686', @ParentCompanyName = 'node1055'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2686'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1631', @ParentCompanyName = 'node1056'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1631'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2338', @ParentCompanyName = 'node1056'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2338'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2985', @ParentCompanyName = 'node1056'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2985'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2990', @ParentCompanyName = 'node1057'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2990'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1321', @ParentCompanyName = 'node1058'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1976', @ParentCompanyName = 'node1058'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1976'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2152', @ParentCompanyName = 'node1058'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2152'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2202', @ParentCompanyName = 'node1059'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2202'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1713', @ParentCompanyName = 'node1060'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1713'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2656', @ParentCompanyName = 'node1060'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2656'
GO
EXEC SqlGraph.Company$Insert @Name = 'node3056', @ParentCompanyName = 'node1060'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node3056'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1893', @ParentCompanyName = 'node1061'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1893'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2024', @ParentCompanyName = 'node1061'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2024'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2756', @ParentCompanyName = 'node1061'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2756'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1491', @ParentCompanyName = 'node1062'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1491'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1915', @ParentCompanyName = 'node1062'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1915'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2197', @ParentCompanyName = 'node1064'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2436', @ParentCompanyName = 'node1064'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2436'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1367', @ParentCompanyName = 'node1065'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1367'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2533', @ParentCompanyName = 'node1065'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2533'
GO
EXEC SqlGraph.Company$Insert @Name = 'node3076', @ParentCompanyName = 'node1065'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node3076'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1826', @ParentCompanyName = 'node1066'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1826'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2598', @ParentCompanyName = 'node1066'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2106', @ParentCompanyName = 'node1067'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2106'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2480', @ParentCompanyName = 'node1069'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2480'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2941', @ParentCompanyName = 'node1069'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2941'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2550', @ParentCompanyName = 'node1070'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2550'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2429', @ParentCompanyName = 'node1071'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2429'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2667', @ParentCompanyName = 'node1071'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2667'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2220', @ParentCompanyName = 'node1072'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2220'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1147', @ParentCompanyName = 'node1073'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1147'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1378', @ParentCompanyName = 'node1074'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1378'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2475', @ParentCompanyName = 'node1074'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2475'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1292', @ParentCompanyName = 'node1075'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1292'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1428', @ParentCompanyName = 'node1075'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1428'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1778', @ParentCompanyName = 'node1075'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1778'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2466', @ParentCompanyName = 'node1075'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2888', @ParentCompanyName = 'node1076'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2888'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2175', @ParentCompanyName = 'node1077'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2175'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1733', @ParentCompanyName = 'node1079'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1733'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2430', @ParentCompanyName = 'node1079'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2430'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1362', @ParentCompanyName = 'node108'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1362'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1881', @ParentCompanyName = 'node108'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1881'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2064', @ParentCompanyName = 'node108'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2064'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1124', @ParentCompanyName = 'node1080'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1124'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1984', @ParentCompanyName = 'node1080'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1984'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2361', @ParentCompanyName = 'node1080'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2361'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2842', @ParentCompanyName = 'node1080'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2842'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2950', @ParentCompanyName = 'node1080'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2950'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2535', @ParentCompanyName = 'node1081'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2535'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2876', @ParentCompanyName = 'node1081'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2876'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2768', @ParentCompanyName = 'node1082'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2768'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2841', @ParentCompanyName = 'node1082'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2841'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1422', @ParentCompanyName = 'node1083'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1422'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2854', @ParentCompanyName = 'node1083'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2854'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2917', @ParentCompanyName = 'node1083'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2917'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2198', @ParentCompanyName = 'node1084'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2198'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1117', @ParentCompanyName = 'node1085'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1117'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1974', @ParentCompanyName = 'node1085'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1974'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2129', @ParentCompanyName = 'node1085'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2129'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2618', @ParentCompanyName = 'node1085'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2618'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1245', @ParentCompanyName = 'node1086'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1245'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1841', @ParentCompanyName = 'node1086'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1841'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2861', @ParentCompanyName = 'node1086'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2861'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1208', @ParentCompanyName = 'node1087'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1849', @ParentCompanyName = 'node1087'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1849'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2411', @ParentCompanyName = 'node1087'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2411'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2964', @ParentCompanyName = 'node1087'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2964'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1141', @ParentCompanyName = 'node1089'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1141'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1904', @ParentCompanyName = 'node1089'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1904'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2372', @ParentCompanyName = 'node1089'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2372'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1397', @ParentCompanyName = 'node1090'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1397'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1835', @ParentCompanyName = 'node1090'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1835'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2895', @ParentCompanyName = 'node1090'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1430', @ParentCompanyName = 'node1091'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1430'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1721', @ParentCompanyName = 'node1092'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1868', @ParentCompanyName = 'node1092'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1241', @ParentCompanyName = 'node1093'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1241'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1255', @ParentCompanyName = 'node1093'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2013', @ParentCompanyName = 'node1093'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2013'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1592', @ParentCompanyName = 'node1094'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1592'
GO
EXEC SqlGraph.Company$Insert @Name = 'node3042', @ParentCompanyName = 'node1094'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node3042'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2498', @ParentCompanyName = 'node1095'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2498'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2526', @ParentCompanyName = 'node1097'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2969', @ParentCompanyName = 'node1099'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1532', @ParentCompanyName = 'node110'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1532'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1634', @ParentCompanyName = 'node110'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1634'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1891', @ParentCompanyName = 'node110'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1891'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1519', @ParentCompanyName = 'node1101'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1545', @ParentCompanyName = 'node1101'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1545'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1797', @ParentCompanyName = 'node1101'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1797'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1398', @ParentCompanyName = 'node112'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1398'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2268', @ParentCompanyName = 'node112'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2268'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2971', @ParentCompanyName = 'node112'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2971'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1114', @ParentCompanyName = 'node113'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1114'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2042', @ParentCompanyName = 'node114'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2042'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2074', @ParentCompanyName = 'node114'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1354', @ParentCompanyName = 'node115'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1306', @ParentCompanyName = 'node116'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1306'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1705', @ParentCompanyName = 'node116'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1705'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2245', @ParentCompanyName = 'node116'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2245'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1204', @ParentCompanyName = 'node117'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1204'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1319', @ParentCompanyName = 'node117'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1319'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1342', @ParentCompanyName = 'node117'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1342'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2872', @ParentCompanyName = 'node117'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2872'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1261', @ParentCompanyName = 'node118'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1261'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1310', @ParentCompanyName = 'node118'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1310'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1351', @ParentCompanyName = 'node119'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1351'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1793', @ParentCompanyName = 'node119'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2415', @ParentCompanyName = 'node119'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2415'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1203', @ParentCompanyName = 'node120'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1203'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1584', @ParentCompanyName = 'node121'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1584'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1231', @ParentCompanyName = 'node122'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1231'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1540', @ParentCompanyName = 'node122'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1540'
GO
EXEC SqlGraph.Company$Insert @Name = 'node3000', @ParentCompanyName = 'node122'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node3000'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1234', @ParentCompanyName = 'node123'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2232', @ParentCompanyName = 'node123'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2232'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1560', @ParentCompanyName = 'node124'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1560'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1726', @ParentCompanyName = 'node125'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1847', @ParentCompanyName = 'node125'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1847'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1964', @ParentCompanyName = 'node125'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1964'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1774', @ParentCompanyName = 'node127'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1846', @ParentCompanyName = 'node128'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1846'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2400', @ParentCompanyName = 'node128'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2400'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2532', @ParentCompanyName = 'node129'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2532'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2840', @ParentCompanyName = 'node130'
GO
EXEC SqlGraph.Company$Insert @Name = 'node3098', @ParentCompanyName = 'node130'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node3098'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2863', @ParentCompanyName = 'node131'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2863'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2984', @ParentCompanyName = 'node131'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2984'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1672', @ParentCompanyName = 'node132'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1672'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1236', @ParentCompanyName = 'node133'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1236'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2723', @ParentCompanyName = 'node134'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2723'
GO
EXEC SqlGraph.Company$Insert @Name = 'node3033', @ParentCompanyName = 'node134'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node3033'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1773', @ParentCompanyName = 'node136'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2325', @ParentCompanyName = 'node136'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2325'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2821', @ParentCompanyName = 'node136'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2821'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1138', @ParentCompanyName = 'node137'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1138'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1395', @ParentCompanyName = 'node137'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1395'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2165', @ParentCompanyName = 'node137'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2165'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1935', @ParentCompanyName = 'node138'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1935'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2570', @ParentCompanyName = 'node138'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2570'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2512', @ParentCompanyName = 'node139'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2512'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1311', @ParentCompanyName = 'node140'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1311'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2170', @ParentCompanyName = 'node140'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2170'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2476', @ParentCompanyName = 'node141'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2476'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2635', @ParentCompanyName = 'node141'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2635'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2707', @ParentCompanyName = 'node141'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2707'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1157', @ParentCompanyName = 'node142'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1157'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1882', @ParentCompanyName = 'node142'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1882'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2534', @ParentCompanyName = 'node142'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2534'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2922', @ParentCompanyName = 'node142'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2922'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2363', @ParentCompanyName = 'node143'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2363'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1182', @ParentCompanyName = 'node144'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1182'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1212', @ParentCompanyName = 'node144'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1565', @ParentCompanyName = 'node146'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1565'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1899', @ParentCompanyName = 'node146'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2582', @ParentCompanyName = 'node146'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2582'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2995', @ParentCompanyName = 'node147'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2995'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1760', @ParentCompanyName = 'node148'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1760'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2385', @ParentCompanyName = 'node148'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2385'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2637', @ParentCompanyName = 'node148'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2001', @ParentCompanyName = 'node149'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2001'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2490', @ParentCompanyName = 'node149'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2490'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2053', @ParentCompanyName = 'node150'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2053'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2377', @ParentCompanyName = 'node150'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2377'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2679', @ParentCompanyName = 'node150'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2679'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2939', @ParentCompanyName = 'node150'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2939'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2844', @ParentCompanyName = 'node151'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2844'
GO
EXEC SqlGraph.Company$Insert @Name = 'node3044', @ParentCompanyName = 'node151'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node3044'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2946', @ParentCompanyName = 'node152'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2946'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2167', @ParentCompanyName = 'node153'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2167'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2622', @ParentCompanyName = 'node153'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2622'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1923', @ParentCompanyName = 'node154'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1923'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2798', @ParentCompanyName = 'node154'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2798'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1922', @ParentCompanyName = 'node155'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1922'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2781', @ParentCompanyName = 'node155'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2781'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2354', @ParentCompanyName = 'node156'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2935', @ParentCompanyName = 'node157'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2935'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1163', @ParentCompanyName = 'node158'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1163'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2076', @ParentCompanyName = 'node158'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2076'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2901', @ParentCompanyName = 'node158'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2901'
GO
EXEC SqlGraph.Company$Insert @Name = 'node3050', @ParentCompanyName = 'node158'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node3050'
GO
EXEC SqlGraph.Company$Insert @Name = 'node3065', @ParentCompanyName = 'node158'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2394', @ParentCompanyName = 'node159'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2394'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2715', @ParentCompanyName = 'node159'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2715'
GO
EXEC SqlGraph.Company$Insert @Name = 'node3094', @ParentCompanyName = 'node159'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node3094'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2427', @ParentCompanyName = 'node160'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2427'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1271', @ParentCompanyName = 'node161'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1271'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1589', @ParentCompanyName = 'node161'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1589'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1938', @ParentCompanyName = 'node162'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1938'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2021', @ParentCompanyName = 'node162'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2021'
GO
EXEC SqlGraph.Company$Insert @Name = 'node3018', @ParentCompanyName = 'node162'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node3018'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1523', @ParentCompanyName = 'node163'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1523'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1325', @ParentCompanyName = 'node164'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1596', @ParentCompanyName = 'node164'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1596'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1752', @ParentCompanyName = 'node164'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2309', @ParentCompanyName = 'node164'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2309'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2343', @ParentCompanyName = 'node164'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2398', @ParentCompanyName = 'node164'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2398'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1446', @ParentCompanyName = 'node165'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2510', @ParentCompanyName = 'node165'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2510'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1146', @ParentCompanyName = 'node166'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1146'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2371', @ParentCompanyName = 'node166'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2371'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1993', @ParentCompanyName = 'node169'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1993'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2855', @ParentCompanyName = 'node169'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2855'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1635', @ParentCompanyName = 'node170'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1635'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1270', @ParentCompanyName = 'node171'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1382', @ParentCompanyName = 'node171'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1382'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1889', @ParentCompanyName = 'node171'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1889'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2538', @ParentCompanyName = 'node171'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2538'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2641', @ParentCompanyName = 'node171'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2641'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2073', @ParentCompanyName = 'node172'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2073'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2405', @ParentCompanyName = 'node173'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2405'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2269', @ParentCompanyName = 'node174'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2269'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1176', @ParentCompanyName = 'node176'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1176'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1883', @ParentCompanyName = 'node177'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1883'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2441', @ParentCompanyName = 'node178'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2441'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2752', @ParentCompanyName = 'node178'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2752'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2515', @ParentCompanyName = 'node179'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2515'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1472', @ParentCompanyName = 'node181'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1472'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1611', @ParentCompanyName = 'node181'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1611'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2389', @ParentCompanyName = 'node181'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2389'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1233', @ParentCompanyName = 'node182'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1233'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2576', @ParentCompanyName = 'node182'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2576'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2765', @ParentCompanyName = 'node182'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1895', @ParentCompanyName = 'node183'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1895'
GO
EXEC SqlGraph.Company$Insert @Name = 'node3016', @ParentCompanyName = 'node183'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node3016'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1107', @ParentCompanyName = 'node184'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1107'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1434', @ParentCompanyName = 'node184'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1434'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1510', @ParentCompanyName = 'node184'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1410', @ParentCompanyName = 'node185'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1410'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2207', @ParentCompanyName = 'node185'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2207'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2229', @ParentCompanyName = 'node185'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2229'
GO
EXEC SqlGraph.Company$Insert @Name = 'node3077', @ParentCompanyName = 'node185'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node3077'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1806', @ParentCompanyName = 'node186'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1806'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2413', @ParentCompanyName = 'node189'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2413'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2078', @ParentCompanyName = 'node190'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2078'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2976', @ParentCompanyName = 'node190'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2976'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1706', @ParentCompanyName = 'node191'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2910', @ParentCompanyName = 'node191'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2910'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2829', @ParentCompanyName = 'node192'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2159', @ParentCompanyName = 'node193'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2159'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1632', @ParentCompanyName = 'node194'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1632'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2414', @ParentCompanyName = 'node194'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2414'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1377', @ParentCompanyName = 'node195'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1377'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1783', @ParentCompanyName = 'node195'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1783'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1549', @ParentCompanyName = 'node196'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1549'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2511', @ParentCompanyName = 'node196'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2511'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1348', @ParentCompanyName = 'node197'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1348'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1440', @ParentCompanyName = 'node197'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2897', @ParentCompanyName = 'node197'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2897'
GO
EXEC SqlGraph.Company$Insert @Name = 'node3046', @ParentCompanyName = 'node198'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2199', @ParentCompanyName = 'node199'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2873', @ParentCompanyName = 'node199'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2873'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2926', @ParentCompanyName = 'node199'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2926'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1316', @ParentCompanyName = 'node201'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1316'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2043', @ParentCompanyName = 'node202'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2043'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2645', @ParentCompanyName = 'node202'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1112', @ParentCompanyName = 'node203'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1244', @ParentCompanyName = 'node203'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1244'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1551', @ParentCompanyName = 'node203'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1551'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2237', @ParentCompanyName = 'node203'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2237'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2280', @ParentCompanyName = 'node203'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2280'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1467', @ParentCompanyName = 'node205'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1467'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1499', @ParentCompanyName = 'node205'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1499'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2303', @ParentCompanyName = 'node205'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2303'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1313', @ParentCompanyName = 'node206'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1313'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1414', @ParentCompanyName = 'node206'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1414'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1777', @ParentCompanyName = 'node206'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1777'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2524', @ParentCompanyName = 'node207'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2524'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2591', @ParentCompanyName = 'node207'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2591'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2761', @ParentCompanyName = 'node207'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2761'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1478', @ParentCompanyName = 'node208'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2687', @ParentCompanyName = 'node208'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2687'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2940', @ParentCompanyName = 'node208'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2940'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1776', @ParentCompanyName = 'node209'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1776'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1755', @ParentCompanyName = 'node210'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1755'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1876', @ParentCompanyName = 'node210'
GO
EXEC SqlGraph.Company$Insert @Name = 'node3011', @ParentCompanyName = 'node210'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2056', @ParentCompanyName = 'node211'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2056'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1496', @ParentCompanyName = 'node213'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1496'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1525', @ParentCompanyName = 'node213'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1525'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2664', @ParentCompanyName = 'node213'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2664'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1199', @ParentCompanyName = 'node215'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1199'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2839', @ParentCompanyName = 'node215'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2839'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1621', @ParentCompanyName = 'node216'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1621'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1799', @ParentCompanyName = 'node216'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1799'
GO
EXEC SqlGraph.Company$Insert @Name = 'node3085', @ParentCompanyName = 'node217'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1656', @ParentCompanyName = 'node218'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1656'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2934', @ParentCompanyName = 'node218'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2934'
GO
EXEC SqlGraph.Company$Insert @Name = 'node3075', @ParentCompanyName = 'node219'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node3075'
GO
EXEC SqlGraph.Company$Insert @Name = 'node3030', @ParentCompanyName = 'node220'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node3030'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1574', @ParentCompanyName = 'node221'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1574'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1739', @ParentCompanyName = 'node221'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1739'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2614', @ParentCompanyName = 'node221'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2614'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1709', @ParentCompanyName = 'node223'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1709'
GO
EXEC SqlGraph.Company$Insert @Name = 'node3087', @ParentCompanyName = 'node223'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node3087'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1111', @ParentCompanyName = 'node224'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1111'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2327', @ParentCompanyName = 'node224'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2327'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2852', @ParentCompanyName = 'node224'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2852'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1456', @ParentCompanyName = 'node225'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1456'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1949', @ParentCompanyName = 'node225'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2629', @ParentCompanyName = 'node225'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1419', @ParentCompanyName = 'node226'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1419'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2820', @ParentCompanyName = 'node226'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2820'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1328', @ParentCompanyName = 'node227'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1515', @ParentCompanyName = 'node227'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1958', @ParentCompanyName = 'node227'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1958'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2853', @ParentCompanyName = 'node227'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2853'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1453', @ParentCompanyName = 'node228'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1453'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2217', @ParentCompanyName = 'node229'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2217'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2982', @ParentCompanyName = 'node229'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2982'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2251', @ParentCompanyName = 'node230'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2251'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2684', @ParentCompanyName = 'node230'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2751', @ParentCompanyName = 'node230'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2751'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2460', @ParentCompanyName = 'node231'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2460'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2958', @ParentCompanyName = 'node231'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2958'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1332', @ParentCompanyName = 'node232'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1332'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2311', @ParentCompanyName = 'node232'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2311'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2255', @ParentCompanyName = 'node233'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2255'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2558', @ParentCompanyName = 'node234'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2558'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1374', @ParentCompanyName = 'node235'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1374'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1380', @ParentCompanyName = 'node235'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2889', @ParentCompanyName = 'node235'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2889'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1142', @ParentCompanyName = 'node236'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1142'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1404', @ParentCompanyName = 'node236'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1404'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2513', @ParentCompanyName = 'node236'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2513'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2720', @ParentCompanyName = 'node236'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2720'
GO
EXEC SqlGraph.Company$Insert @Name = 'node3022', @ParentCompanyName = 'node236'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node3022'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1928', @ParentCompanyName = 'node237'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1928'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2449', @ParentCompanyName = 'node237'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2449'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1193', @ParentCompanyName = 'node238'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1193'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1914', @ParentCompanyName = 'node238'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2693', @ParentCompanyName = 'node238'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2693'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1189', @ParentCompanyName = 'node240'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1189'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1782', @ParentCompanyName = 'node240'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1782'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1907', @ParentCompanyName = 'node240'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2421', @ParentCompanyName = 'node240'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2421'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1583', @ParentCompanyName = 'node241'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1751', @ParentCompanyName = 'node241'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1751'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1880', @ParentCompanyName = 'node241'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1880'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1507', @ParentCompanyName = 'node242'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1507'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2705', @ParentCompanyName = 'node242'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2705'
GO
EXEC SqlGraph.Company$Insert @Name = 'node3055', @ParentCompanyName = 'node242'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node3055'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1128', @ParentCompanyName = 'node243'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1128'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1220', @ParentCompanyName = 'node243'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1220'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1242', @ParentCompanyName = 'node243'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1242'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1481', @ParentCompanyName = 'node243'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1481'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2163', @ParentCompanyName = 'node243'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2163'
GO
EXEC SqlGraph.Company$Insert @Name = 'node3058', @ParentCompanyName = 'node243'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node3058'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2652', @ParentCompanyName = 'node244'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2652'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1346', @ParentCompanyName = 'node247'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1346'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1738', @ParentCompanyName = 'node248'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1738'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1856', @ParentCompanyName = 'node248'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1448', @ParentCompanyName = 'node250'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1448'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1353', @ParentCompanyName = 'node251'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1353'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1982', @ParentCompanyName = 'node251'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1982'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2695', @ParentCompanyName = 'node251'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2836', @ParentCompanyName = 'node251'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2836'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2981', @ParentCompanyName = 'node252'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2981'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2531', @ParentCompanyName = 'node254'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2531'
GO
EXEC SqlGraph.Company$Insert @Name = 'node3008', @ParentCompanyName = 'node254'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node3008'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1228', @ParentCompanyName = 'node255'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1228'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2005', @ParentCompanyName = 'node255'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2005'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2093', @ParentCompanyName = 'node255'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2093'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2177', @ParentCompanyName = 'node256'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2177'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1170', @ParentCompanyName = 'node257'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1170'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2041', @ParentCompanyName = 'node257'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1786', @ParentCompanyName = 'node258'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1211', @ParentCompanyName = 'node259'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1211'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1403', @ParentCompanyName = 'node259'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1403'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1824', @ParentCompanyName = 'node260'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2295', @ParentCompanyName = 'node260'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2295'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2927', @ParentCompanyName = 'node260'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2927'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1155', @ParentCompanyName = 'node261'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1155'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1165', @ParentCompanyName = 'node261'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1165'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2609', @ParentCompanyName = 'node261'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2609'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2694', @ParentCompanyName = 'node261'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2694'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2745', @ParentCompanyName = 'node261'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2745'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2772', @ParentCompanyName = 'node261'
GO
EXEC SqlGraph.Company$Insert @Name = 'node3092', @ParentCompanyName = 'node261'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node3092'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2431', @ParentCompanyName = 'node262'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1202', @ParentCompanyName = 'node264'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2481', @ParentCompanyName = 'node264'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2481'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1276', @ParentCompanyName = 'node265'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1276'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2755', @ParentCompanyName = 'node265'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2755'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2980', @ParentCompanyName = 'node265'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2980'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1134', @ParentCompanyName = 'node266'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1134'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1280', @ParentCompanyName = 'node266'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1280'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1594', @ParentCompanyName = 'node266'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1594'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1210', @ParentCompanyName = 'node267'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1210'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1518', @ParentCompanyName = 'node267'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1518'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2447', @ParentCompanyName = 'node267'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2447'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2968', @ParentCompanyName = 'node267'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2968'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2178', @ParentCompanyName = 'node268'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2416', @ParentCompanyName = 'node268'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2500', @ParentCompanyName = 'node269'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2500'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2646', @ParentCompanyName = 'node269'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2646'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1854', @ParentCompanyName = 'node270'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1854'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2560', @ParentCompanyName = 'node270'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2560'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1517', @ParentCompanyName = 'node271'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1517'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2575', @ParentCompanyName = 'node271'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2575'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1326', @ParentCompanyName = 'node272'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1326'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1676', @ParentCompanyName = 'node272'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1676'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1871', @ParentCompanyName = 'node272'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1871'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2467', @ParentCompanyName = 'node272'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2467'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2407', @ParentCompanyName = 'node273'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2407'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2470', @ParentCompanyName = 'node274'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2470'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1850', @ParentCompanyName = 'node275'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1850'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2183', @ParentCompanyName = 'node275'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2183'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1717', @ParentCompanyName = 'node276'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1717'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2057', @ParentCompanyName = 'node276'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2057'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1461', @ParentCompanyName = 'node277'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1461'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1681', @ParentCompanyName = 'node277'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1681'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2627', @ParentCompanyName = 'node277'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2627'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2725', @ParentCompanyName = 'node277'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2725'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2930', @ParentCompanyName = 'node277'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2930'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1497', @ParentCompanyName = 'node278'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1497'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1597', @ParentCompanyName = 'node278'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1597'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2456', @ParentCompanyName = 'node278'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2456'
GO
EXEC SqlGraph.Company$Insert @Name = 'node3012', @ParentCompanyName = 'node278'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1294', @ParentCompanyName = 'node279'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1294'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2577', @ParentCompanyName = 'node279'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2577'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2169', @ParentCompanyName = 'node280'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2169'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2886', @ParentCompanyName = 'node280'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2886'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2630', @ParentCompanyName = 'node281'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2784', @ParentCompanyName = 'node282'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2784'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1436', @ParentCompanyName = 'node283'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1436'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2351', @ParentCompanyName = 'node283'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2351'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1162', @ParentCompanyName = 'node284'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1162'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1186', @ParentCompanyName = 'node284'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1186'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1392', @ParentCompanyName = 'node284'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1392'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1394', @ParentCompanyName = 'node284'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1394'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2222', @ParentCompanyName = 'node284'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2222'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2176', @ParentCompanyName = 'node285'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2176'
GO
EXEC SqlGraph.Company$Insert @Name = 'node3093', @ParentCompanyName = 'node286'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node3093'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1536', @ParentCompanyName = 'node287'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1536'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2426', @ParentCompanyName = 'node287'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2426'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2828', @ParentCompanyName = 'node287'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2828'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2902', @ParentCompanyName = 'node287'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2902'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1299', @ParentCompanyName = 'node288'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1299'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1329', @ParentCompanyName = 'node288'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1329'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1458', @ParentCompanyName = 'node290'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1458'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2092', @ParentCompanyName = 'node290'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2092'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2194', @ParentCompanyName = 'node290'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2194'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1539', @ParentCompanyName = 'node291'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1539'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2206', @ParentCompanyName = 'node291'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2206'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1504', @ParentCompanyName = 'node292'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1504'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2306', @ParentCompanyName = 'node292'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2306'
GO
EXEC SqlGraph.Company$Insert @Name = 'node3005', @ParentCompanyName = 'node292'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2088', @ParentCompanyName = 'node293'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2224', @ParentCompanyName = 'node293'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2224'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1429', @ParentCompanyName = 'node294'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1429'
GO
EXEC SqlGraph.Company$Insert @Name = 'node3024', @ParentCompanyName = 'node294'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1275', @ParentCompanyName = 'node296'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1275'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1962', @ParentCompanyName = 'node297'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1962'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2096', @ParentCompanyName = 'node297'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2096'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1730', @ParentCompanyName = 'node298'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1730'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1831', @ParentCompanyName = 'node298'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1831'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1879', @ParentCompanyName = 'node298'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1879'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2192', @ParentCompanyName = 'node298'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2192'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2119', @ParentCompanyName = 'node299'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2119'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2594', @ParentCompanyName = 'node299'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1390', @ParentCompanyName = 'node300'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1829', @ParentCompanyName = 'node300'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1829'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2346', @ParentCompanyName = 'node300'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2346'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1968', @ParentCompanyName = 'node301'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1968'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2583', @ParentCompanyName = 'node301'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2583'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1753', @ParentCompanyName = 'node303'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1753'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1843', @ParentCompanyName = 'node304'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1843'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1952', @ParentCompanyName = 'node304'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1952'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2095', @ParentCompanyName = 'node304'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2095'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2067', @ParentCompanyName = 'node305'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2067'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2356', @ParentCompanyName = 'node305'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1548', @ParentCompanyName = 'node306'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1548'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1908', @ParentCompanyName = 'node307'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2931', @ParentCompanyName = 'node307'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2931'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1287', @ParentCompanyName = 'node308'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1287'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2151', @ParentCompanyName = 'node308'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2151'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2673', @ParentCompanyName = 'node308'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2673'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1537', @ParentCompanyName = 'node309'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1537'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2369', @ParentCompanyName = 'node310'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2369'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1720', @ParentCompanyName = 'node311'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1720'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2234', @ParentCompanyName = 'node311'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2234'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2503', @ParentCompanyName = 'node311'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1765', @ParentCompanyName = 'node312'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1765'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2383', @ParentCompanyName = 'node312'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2383'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2780', @ParentCompanyName = 'node312'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2780'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2211', @ParentCompanyName = 'node313'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2211'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1338', @ParentCompanyName = 'node314'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1338'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1866', @ParentCompanyName = 'node314'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1866'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2016', @ParentCompanyName = 'node315'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2016'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2827', @ParentCompanyName = 'node315'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2827'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2439', @ParentCompanyName = 'node316'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2488', @ParentCompanyName = 'node316'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2488'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1415', @ParentCompanyName = 'node317'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1415'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1454', @ParentCompanyName = 'node317'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1454'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2082', @ParentCompanyName = 'node317'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2082'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2145', @ParentCompanyName = 'node317'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2145'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2316', @ParentCompanyName = 'node317'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2316'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2528', @ParentCompanyName = 'node317'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2528'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1123', @ParentCompanyName = 'node318'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1123'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2750', @ParentCompanyName = 'node318'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2750'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2937', @ParentCompanyName = 'node318'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2937'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2487', @ParentCompanyName = 'node319'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2487'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1344', @ParentCompanyName = 'node320'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1344'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1620', @ParentCompanyName = 'node320'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1620'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2061', @ParentCompanyName = 'node320'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2061'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1828', @ParentCompanyName = 'node321'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2148', @ParentCompanyName = 'node321'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2218', @ParentCompanyName = 'node321'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2218'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2628', @ParentCompanyName = 'node322'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2628'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2833', @ParentCompanyName = 'node322'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2833'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2126', @ParentCompanyName = 'node323'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2126'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1768', @ParentCompanyName = 'node324'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1768'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2125', @ParentCompanyName = 'node324'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2125'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2660', @ParentCompanyName = 'node324'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2660'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2240', @ParentCompanyName = 'node326'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2240'
GO
EXEC SqlGraph.Company$Insert @Name = 'node3027', @ParentCompanyName = 'node327'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2186', @ParentCompanyName = 'node328'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2634', @ParentCompanyName = 'node328'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2634'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2845', @ParentCompanyName = 'node328'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2845'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1617', @ParentCompanyName = 'node329'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1617'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2252', @ParentCompanyName = 'node329'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2252'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2856', @ParentCompanyName = 'node329'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2856'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2907', @ParentCompanyName = 'node329'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2907'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1363', @ParentCompanyName = 'node330'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1363'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2047', @ParentCompanyName = 'node330'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2047'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1166', @ParentCompanyName = 'node331'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2759', @ParentCompanyName = 'node331'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2759'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1601', @ParentCompanyName = 'node332'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1601'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2623', @ParentCompanyName = 'node332'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2623'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1347', @ParentCompanyName = 'node333'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1347'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1570', @ParentCompanyName = 'node333'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1677', @ParentCompanyName = 'node333'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1677'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1267', @ParentCompanyName = 'node335'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1267'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2894', @ParentCompanyName = 'node335'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2894'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1172', @ParentCompanyName = 'node336'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1172'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2004', @ParentCompanyName = 'node337'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2004'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2422', @ParentCompanyName = 'node337'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2422'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1896', @ParentCompanyName = 'node338'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1896'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1201', @ParentCompanyName = 'node339'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1201'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2450', @ParentCompanyName = 'node339'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2996', @ParentCompanyName = 'node340'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2996'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1603', @ParentCompanyName = 'node341'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1603'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2123', @ParentCompanyName = 'node341'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2032', @ParentCompanyName = 'node342'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2032'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2484', @ParentCompanyName = 'node342'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2484'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1661', @ParentCompanyName = 'node343'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1661'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1852', @ParentCompanyName = 'node343'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1852'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2103', @ParentCompanyName = 'node343'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2103'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1372', @ParentCompanyName = 'node344'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1372'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2936', @ParentCompanyName = 'node344'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2936'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1119', @ParentCompanyName = 'node345'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1462', @ParentCompanyName = 'node345'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1462'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2216', @ParentCompanyName = 'node345'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2216'
GO
EXEC SqlGraph.Company$Insert @Name = 'node3072', @ParentCompanyName = 'node346'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node3072'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1502', @ParentCompanyName = 'node347'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1582', @ParentCompanyName = 'node347'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1582'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2364', @ParentCompanyName = 'node347'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2364'
GO
EXEC SqlGraph.Company$Insert @Name = 'node3099', @ParentCompanyName = 'node347'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node3099'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2077', @ParentCompanyName = 'node348'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2077'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2236', @ParentCompanyName = 'node348'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2236'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1699', @ParentCompanyName = 'node349'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1699'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2580', @ParentCompanyName = 'node349'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2580'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2607', @ParentCompanyName = 'node350'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2607'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2775', @ParentCompanyName = 'node350'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2775'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2797', @ParentCompanyName = 'node350'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2797'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1104', @ParentCompanyName = 'node351'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1104'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1669', @ParentCompanyName = 'node351'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1669'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2184', @ParentCompanyName = 'node351'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2184'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1330', @ParentCompanyName = 'node352'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1330'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1916', @ParentCompanyName = 'node352'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1916'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1991', @ParentCompanyName = 'node353'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1991'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2871', @ParentCompanyName = 'node353'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2871'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1183', @ParentCompanyName = 'node354'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1183'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1627', @ParentCompanyName = 'node354'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1627'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2335', @ParentCompanyName = 'node354'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2499', @ParentCompanyName = 'node354'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2499'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1544', @ParentCompanyName = 'node355'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1544'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1697', @ParentCompanyName = 'node355'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1697'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1341', @ParentCompanyName = 'node356'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2497', @ParentCompanyName = 'node356'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2497'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2783', @ParentCompanyName = 'node356'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2783'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2857', @ParentCompanyName = 'node356'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2857'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1628', @ParentCompanyName = 'node357'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1628'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2244', @ParentCompanyName = 'node357'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2339', @ParentCompanyName = 'node357'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2799', @ParentCompanyName = 'node357'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2799'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2545', @ParentCompanyName = 'node358'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2545'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2880', @ParentCompanyName = 'node358'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2880'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2893', @ParentCompanyName = 'node358'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1268', @ParentCompanyName = 'node359'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1268'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1665', @ParentCompanyName = 'node359'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1665'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1815', @ParentCompanyName = 'node359'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1815'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2406', @ParentCompanyName = 'node359'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2406'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2587', @ParentCompanyName = 'node359'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2587'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2638', @ParentCompanyName = 'node359'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2638'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1305', @ParentCompanyName = 'node360'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1305'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2097', @ParentCompanyName = 'node360'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2097'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2072', @ParentCompanyName = 'node361'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2072'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2599', @ParentCompanyName = 'node363'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2599'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2825', @ParentCompanyName = 'node363'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2825'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1845', @ParentCompanyName = 'node364'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1845'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2000', @ParentCompanyName = 'node364'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2000'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2410', @ParentCompanyName = 'node364'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1300', @ParentCompanyName = 'node365'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1300'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2118', @ParentCompanyName = 'node365'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2118'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2650', @ParentCompanyName = 'node366'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2650'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1151', @ParentCompanyName = 'node367'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1151'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1653', @ParentCompanyName = 'node367'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1885', @ParentCompanyName = 'node367'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1885'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2243', @ParentCompanyName = 'node367'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2243'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2052', @ParentCompanyName = 'node369'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2052'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2233', @ParentCompanyName = 'node369'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2233'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2564', @ParentCompanyName = 'node369'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2564'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1825', @ParentCompanyName = 'node370'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1825'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2706', @ParentCompanyName = 'node370'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2706'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2347', @ParentCompanyName = 'node371'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2347'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2445', @ParentCompanyName = 'node371'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2445'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2731', @ParentCompanyName = 'node371'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2731'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2135', @ParentCompanyName = 'node373'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2135'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2317', @ParentCompanyName = 'node373'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2317'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2423', @ParentCompanyName = 'node373'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2423'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2417', @ParentCompanyName = 'node374'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2417'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2568', @ParentCompanyName = 'node375'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2568'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2333', @ParentCompanyName = 'node377'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2333'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2671', @ParentCompanyName = 'node377'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2671'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2945', @ParentCompanyName = 'node377'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2945'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1555', @ParentCompanyName = 'node378'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1555'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2007', @ParentCompanyName = 'node378'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2026', @ParentCompanyName = 'node378'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2026'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2951', @ParentCompanyName = 'node378'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2951'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1388', @ParentCompanyName = 'node380'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1388'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2520', @ParentCompanyName = 'node380'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2520'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2584', @ParentCompanyName = 'node380'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2584'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1657', @ParentCompanyName = 'node381'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1657'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1559', @ParentCompanyName = 'node384'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1559'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1853', @ParentCompanyName = 'node385'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1853'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1180', @ParentCompanyName = 'node386'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1180'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1188', @ParentCompanyName = 'node386'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2603', @ParentCompanyName = 'node386'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2603'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1243', @ParentCompanyName = 'node387'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1243'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2493', @ParentCompanyName = 'node387'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2493'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2012', @ParentCompanyName = 'node389'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2012'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2209', @ParentCompanyName = 'node389'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2209'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2382', @ParentCompanyName = 'node389'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2382'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1836', @ParentCompanyName = 'node390'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1836'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2749', @ParentCompanyName = 'node391'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2749'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2974', @ParentCompanyName = 'node391'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2974'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2068', @ParentCompanyName = 'node392'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2068'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2011', @ParentCompanyName = 'node393'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2011'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2205', @ParentCompanyName = 'node393'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2205'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1386', @ParentCompanyName = 'node394'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1386'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1646', @ParentCompanyName = 'node394'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1646'
GO
EXEC SqlGraph.Company$Insert @Name = 'node3062', @ParentCompanyName = 'node394'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2457', @ParentCompanyName = 'node395'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2457'
GO
EXEC SqlGraph.Company$Insert @Name = 'node3073', @ParentCompanyName = 'node395'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2465', @ParentCompanyName = 'node396'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2465'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1209', @ParentCompanyName = 'node397'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1209'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1140', @ParentCompanyName = 'node398'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1140'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1663', @ParentCompanyName = 'node398'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1345', @ParentCompanyName = 'node399'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1345'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2172', @ParentCompanyName = 'node399'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2172'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2916', @ParentCompanyName = 'node399'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2916'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1207', @ParentCompanyName = 'node400'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1207'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1381', @ParentCompanyName = 'node400'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1381'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1659', @ParentCompanyName = 'node400'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2304', @ParentCompanyName = 'node400'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2304'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1576', @ParentCompanyName = 'node401'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1576'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1625', @ParentCompanyName = 'node401'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1625'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2086', @ParentCompanyName = 'node401'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2086'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2358', @ParentCompanyName = 'node401'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2358'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1482', @ParentCompanyName = 'node403'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1482'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2420', @ParentCompanyName = 'node403'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2420'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2625', @ParentCompanyName = 'node403'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2625'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2956', @ParentCompanyName = 'node403'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2956'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1557', @ParentCompanyName = 'node404'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1557'
GO
EXEC SqlGraph.Company$Insert @Name = 'node3034', @ParentCompanyName = 'node404'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node3034'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1248', @ParentCompanyName = 'node405'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1248'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2573', @ParentCompanyName = 'node406'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2960', @ParentCompanyName = 'node406'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2960'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2063', @ParentCompanyName = 'node407'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2063'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2585', @ParentCompanyName = 'node407'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2585'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2649', @ParentCompanyName = 'node408'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2649'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2744', @ParentCompanyName = 'node408'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2744'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1224', @ParentCompanyName = 'node409'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1297', @ParentCompanyName = 'node409'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1297'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1970', @ParentCompanyName = 'node409'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1970'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2824', @ParentCompanyName = 'node410'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2824'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2048', @ParentCompanyName = 'node411'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2048'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1150', @ParentCompanyName = 'node412'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1150'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2835', @ParentCompanyName = 'node412'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2835'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2898', @ParentCompanyName = 'node412'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1262', @ParentCompanyName = 'node413'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1262'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2578', @ParentCompanyName = 'node413'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2578'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1318', @ParentCompanyName = 'node414'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1318'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1707', @ParentCompanyName = 'node414'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1707'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2112', @ParentCompanyName = 'node414'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2112'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1475', @ParentCompanyName = 'node415'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1475'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1566', @ParentCompanyName = 'node415'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1566'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2139', @ParentCompanyName = 'node415'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2139'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2463', @ParentCompanyName = 'node415'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2463'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2952', @ParentCompanyName = 'node415'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2952'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1289', @ParentCompanyName = 'node416'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1289'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1543', @ParentCompanyName = 'node416'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1639', @ParentCompanyName = 'node416'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1639'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1985', @ParentCompanyName = 'node416'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1985'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1217', @ParentCompanyName = 'node417'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1217'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1637', @ParentCompanyName = 'node417'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1637'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2541', @ParentCompanyName = 'node418'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2541'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2546', @ParentCompanyName = 'node419'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2019', @ParentCompanyName = 'node420'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2019'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1298', @ParentCompanyName = 'node421'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1298'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2967', @ParentCompanyName = 'node422'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2967'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1796', @ParentCompanyName = 'node423'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1323', @ParentCompanyName = 'node424'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1323'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1619', @ParentCompanyName = 'node425'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1619'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2070', @ParentCompanyName = 'node426'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2070'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1206', @ParentCompanyName = 'node427'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1206'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2848', @ParentCompanyName = 'node427'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2848'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1335', @ParentCompanyName = 'node428'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1339', @ParentCompanyName = 'node428'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1339'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1931', @ParentCompanyName = 'node430'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1931'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1943', @ParentCompanyName = 'node430'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1943'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2345', @ParentCompanyName = 'node430'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2345'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2631', @ParentCompanyName = 'node430'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2631'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2788', @ParentCompanyName = 'node430'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2788'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2943', @ParentCompanyName = 'node430'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2943'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1178', @ParentCompanyName = 'node431'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1178'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2313', @ParentCompanyName = 'node431'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2313'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1295', @ParentCompanyName = 'node432'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1295'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1608', @ParentCompanyName = 'node432'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2336', @ParentCompanyName = 'node432'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2336'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2657', @ParentCompanyName = 'node432'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2657'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1986', @ParentCompanyName = 'node433'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1986'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2166', @ParentCompanyName = 'node433'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2166'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2293', @ParentCompanyName = 'node433'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2293'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2740', @ParentCompanyName = 'node433'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2740'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1563', @ParentCompanyName = 'node434'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1563'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1769', @ParentCompanyName = 'node434'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1769'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2549', @ParentCompanyName = 'node434'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2549'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2683', @ParentCompanyName = 'node435'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2683'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2885', @ParentCompanyName = 'node435'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2885'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2029', @ParentCompanyName = 'node436'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2029'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1818', @ParentCompanyName = 'node438'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1818'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2714', @ParentCompanyName = 'node438'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2714'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2789', @ParentCompanyName = 'node438'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2789'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2815', @ParentCompanyName = 'node438'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2815'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2495', @ParentCompanyName = 'node440'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2698', @ParentCompanyName = 'node441'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2698'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2779', @ParentCompanyName = 'node441'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2779'
GO
EXEC SqlGraph.Company$Insert @Name = 'node3064', @ParentCompanyName = 'node441'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node3064'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2035', @ParentCompanyName = 'node442'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2035'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2069', @ParentCompanyName = 'node442'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2069'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2764', @ParentCompanyName = 'node442'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2764'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1963', @ParentCompanyName = 'node443'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1963'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2979', @ParentCompanyName = 'node443'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2979'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1925', @ParentCompanyName = 'node444'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1925'
GO
EXEC SqlGraph.Company$Insert @Name = 'node3001', @ParentCompanyName = 'node444'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node3001'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1654', @ParentCompanyName = 'node445'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1654'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1679', @ParentCompanyName = 'node445'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2654', @ParentCompanyName = 'node445'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2743', @ParentCompanyName = 'node445'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2262', @ParentCompanyName = 'node447'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2262'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2046', @ParentCompanyName = 'node448'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2046'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1921', @ParentCompanyName = 'node450'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1921'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2602', @ParentCompanyName = 'node450'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2602'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2947', @ParentCompanyName = 'node450'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1108', @ParentCompanyName = 'node451'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2777', @ParentCompanyName = 'node451'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2777'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2710', @ParentCompanyName = 'node452'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2710'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2912', @ParentCompanyName = 'node452'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2174', @ParentCompanyName = 'node453'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1406', @ParentCompanyName = 'node454'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1406'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2795', @ParentCompanyName = 'node454'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2795'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2986', @ParentCompanyName = 'node454'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2986'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1645', @ParentCompanyName = 'node455'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1645'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1662', @ParentCompanyName = 'node455'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1459', @ParentCompanyName = 'node456'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1459'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1790', @ParentCompanyName = 'node457'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1790'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2254', @ParentCompanyName = 'node457'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2254'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2462', @ParentCompanyName = 'node457'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2462'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2529', @ParentCompanyName = 'node457'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2529'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1650', @ParentCompanyName = 'node458'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1650'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1238', @ParentCompanyName = 'node459'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1238'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1877', @ParentCompanyName = 'node459'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1877'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2117', @ParentCompanyName = 'node460'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2117'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2324', @ParentCompanyName = 'node460'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2324'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2600', @ParentCompanyName = 'node460'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2600'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1214', @ParentCompanyName = 'node461'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2882', @ParentCompanyName = 'node461'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2882'
GO
EXEC SqlGraph.Company$Insert @Name = 'node3019', @ParentCompanyName = 'node461'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node3019'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1257', @ParentCompanyName = 'node462'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1257'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1990', @ParentCompanyName = 'node463'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2485', @ParentCompanyName = 'node463'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2485'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2539', @ParentCompanyName = 'node463'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2539'
GO
EXEC SqlGraph.Company$Insert @Name = 'node3097', @ParentCompanyName = 'node463'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1723', @ParentCompanyName = 'node464'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1723'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1920', @ParentCompanyName = 'node465'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1920'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1357', @ParentCompanyName = 'node466'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1357'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1913', @ParentCompanyName = 'node466'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1913'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2653', @ParentCompanyName = 'node466'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2653'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2655', @ParentCompanyName = 'node466'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2655'
GO
EXEC SqlGraph.Company$Insert @Name = 'node3048', @ParentCompanyName = 'node466'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node3048'
GO
EXEC SqlGraph.Company$Insert @Name = 'node3074', @ParentCompanyName = 'node466'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node3074'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1966', @ParentCompanyName = 'node467'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1966'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2722', @ParentCompanyName = 'node468'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2722'
GO
EXEC SqlGraph.Company$Insert @Name = 'node3039', @ParentCompanyName = 'node468'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node3039'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1113', @ParentCompanyName = 'node469'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1113'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1127', @ParentCompanyName = 'node470'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1127'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1728', @ParentCompanyName = 'node470'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1728'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2353', @ParentCompanyName = 'node470'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2353'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2143', @ParentCompanyName = 'node471'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2143'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2349', @ParentCompanyName = 'node471'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2349'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2675', @ParentCompanyName = 'node471'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2675'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2701', @ParentCompanyName = 'node471'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2701'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2260', @ParentCompanyName = 'node472'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2260'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2790', @ParentCompanyName = 'node472'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2790'
GO
EXEC SqlGraph.Company$Insert @Name = 'node3086', @ParentCompanyName = 'node472'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1177', @ParentCompanyName = 'node473'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1177'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1839', @ParentCompanyName = 'node474'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1839'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2226', @ParentCompanyName = 'node474'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1159', @ParentCompanyName = 'node475'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1159'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1690', @ParentCompanyName = 'node475'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1772', @ParentCompanyName = 'node476'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1772'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2299', @ParentCompanyName = 'node477'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2299'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1168', @ParentCompanyName = 'node478'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1168'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1284', @ParentCompanyName = 'node478'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1284'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1902', @ParentCompanyName = 'node478'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1902'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2109', @ParentCompanyName = 'node478'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2109'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2544', @ParentCompanyName = 'node478'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2544'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2769', @ParentCompanyName = 'node478'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2769'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1742', @ParentCompanyName = 'node479'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1742'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2595', @ParentCompanyName = 'node479'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2595'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1185', @ParentCompanyName = 'node482'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2444', @ParentCompanyName = 'node482'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2444'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2432', @ParentCompanyName = 'node483'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2432'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1237', @ParentCompanyName = 'node484'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1237'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1693', @ParentCompanyName = 'node484'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1693'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1823', @ParentCompanyName = 'node484'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1823'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2402', @ParentCompanyName = 'node484'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2402'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1668', @ParentCompanyName = 'node485'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1668'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2482', @ParentCompanyName = 'node485'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2482'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1225', @ParentCompanyName = 'node486'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1225'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1610', @ParentCompanyName = 'node486'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1898', @ParentCompanyName = 'node486'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1898'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2747', @ParentCompanyName = 'node486'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2747'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1424', @ParentCompanyName = 'node487'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1424'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2424', @ParentCompanyName = 'node487'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2424'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1638', @ParentCompanyName = 'node488'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1638'
GO
EXEC SqlGraph.Company$Insert @Name = 'node3045', @ParentCompanyName = 'node488'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node3045'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2195', @ParentCompanyName = 'node489'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2590', @ParentCompanyName = 'node489'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2590'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1439', @ParentCompanyName = 'node490'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1439'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2014', @ParentCompanyName = 'node490'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2014'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2171', @ParentCompanyName = 'node490'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2171'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2542', @ParentCompanyName = 'node490'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2542'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1683', @ParentCompanyName = 'node492'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1683'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2275', @ParentCompanyName = 'node492'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2275'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1457', @ParentCompanyName = 'node493'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1457'
GO
EXEC SqlGraph.Company$Insert @Name = 'node3090', @ParentCompanyName = 'node494'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node3090'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2697', @ParentCompanyName = 'node495'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2697'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1630', @ParentCompanyName = 'node496'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1630'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1633', @ParentCompanyName = 'node496'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1633'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1179', @ParentCompanyName = 'node497'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1179'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1290', @ParentCompanyName = 'node497'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1290'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1809', @ParentCompanyName = 'node497'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1809'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2785', @ParentCompanyName = 'node498'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2785'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1837', @ParentCompanyName = 'node499'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1837'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2890', @ParentCompanyName = 'node499'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2890'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1285', @ParentCompanyName = 'node500'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1285'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1981', @ParentCompanyName = 'node500'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1981'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2522', @ParentCompanyName = 'node500'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1133', @ParentCompanyName = 'node501'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1133'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1932', @ParentCompanyName = 'node501'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2404', @ParentCompanyName = 'node501'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2404'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2966', @ParentCompanyName = 'node501'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2966'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2146', @ParentCompanyName = 'node502'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2146'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1371', @ParentCompanyName = 'node503'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1602', @ParentCompanyName = 'node503'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1602'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1712', @ParentCompanyName = 'node503'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1712'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1775', @ParentCompanyName = 'node503'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1775'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2735', @ParentCompanyName = 'node503'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2735'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2774', @ParentCompanyName = 'node504'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2774'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1283', @ParentCompanyName = 'node506'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1283'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1858', @ParentCompanyName = 'node507'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2998', @ParentCompanyName = 'node508'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2998'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1933', @ParentCompanyName = 'node509'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1933'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1279', @ParentCompanyName = 'node510'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1279'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2247', @ParentCompanyName = 'node510'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2247'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1317', @ParentCompanyName = 'node511'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1317'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2083', @ParentCompanyName = 'node511'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2083'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2658', @ParentCompanyName = 'node511'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2658'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1205', @ParentCompanyName = 'node512'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1205'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2847', @ParentCompanyName = 'node512'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2847'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1148', @ParentCompanyName = 'node513'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1148'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1226', @ParentCompanyName = 'node513'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1226'
GO
EXEC SqlGraph.Company$Insert @Name = 'node3041', @ParentCompanyName = 'node514'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node3041'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2392', @ParentCompanyName = 'node515'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2018', @ParentCompanyName = 'node516'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2018'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1954', @ParentCompanyName = 'node517'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1954'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2137', @ParentCompanyName = 'node517'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2137'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2796', @ParentCompanyName = 'node517'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2796'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2924', @ParentCompanyName = 'node517'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2924'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2837', @ParentCompanyName = 'node518'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2837'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1356', @ParentCompanyName = 'node519'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1356'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2787', @ParentCompanyName = 'node519'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2787'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1417', @ParentCompanyName = 'node520'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1417'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1477', @ParentCompanyName = 'node520'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1477'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1508', @ParentCompanyName = 'node520'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1508'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2523', @ParentCompanyName = 'node521'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1368', @ParentCompanyName = 'node522'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1368'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1652', @ParentCompanyName = 'node522'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1652'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1514', @ParentCompanyName = 'node523'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1514'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2818', @ParentCompanyName = 'node524'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2378', @ParentCompanyName = 'node525'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2378'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2391', @ParentCompanyName = 'node525'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2391'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2452', @ParentCompanyName = 'node525'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2452'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1505', @ParentCompanyName = 'node526'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1505'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2713', @ParentCompanyName = 'node526'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2713'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1552', @ParentCompanyName = 'node527'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1552'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1860', @ParentCompanyName = 'node527'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1860'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2838', @ParentCompanyName = 'node527'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2838'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2742', @ParentCompanyName = 'node528'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2742'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1814', @ParentCompanyName = 'node529'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1814'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2601', @ParentCompanyName = 'node530'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2122', @ParentCompanyName = 'node531'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2122'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1687', @ParentCompanyName = 'node532'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1687'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2051', @ParentCompanyName = 'node532'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2051'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2315', @ParentCompanyName = 'node532'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2315'
GO
EXEC SqlGraph.Company$Insert @Name = 'node3083', @ParentCompanyName = 'node532'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node3083'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1250', @ParentCompanyName = 'node533'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1250'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1438', @ParentCompanyName = 'node533'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1438'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1746', @ParentCompanyName = 'node533'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1746'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1787', @ParentCompanyName = 'node533'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1787'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2040', @ParentCompanyName = 'node533'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2040'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1309', @ParentCompanyName = 'node534'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1309'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1756', @ParentCompanyName = 'node534'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1756'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1322', @ParentCompanyName = 'node535'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1322'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1441', @ParentCompanyName = 'node535'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1441'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1554', @ParentCompanyName = 'node535'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1554'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1959', @ParentCompanyName = 'node535'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1959'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1160', @ParentCompanyName = 'node536'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2808', @ParentCompanyName = 'node536'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2808'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2860', @ParentCompanyName = 'node537'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2860'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1266', @ParentCompanyName = 'node538'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1266'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2681', @ParentCompanyName = 'node539'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2681'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1989', @ParentCompanyName = 'node540'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1989'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2626', @ParentCompanyName = 'node541'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2626'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1327', @ParentCompanyName = 'node542'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1327'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1492', @ParentCompanyName = 'node543'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1492'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2793', @ParentCompanyName = 'node543'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2793'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2925', @ParentCompanyName = 'node543'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2925'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2025', @ParentCompanyName = 'node544'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2025'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2187', @ParentCompanyName = 'node545'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2187'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2521', @ParentCompanyName = 'node545'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2521'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2666', @ParentCompanyName = 'node546'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2666'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2689', @ParentCompanyName = 'node546'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1169', @ParentCompanyName = 'node547'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1169'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1487', @ParentCompanyName = 'node548'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1567', @ParentCompanyName = 'node548'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1587', @ParentCompanyName = 'node549'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1587'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1834', @ParentCompanyName = 'node550'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1834'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2242', @ParentCompanyName = 'node550'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2242'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2670', @ParentCompanyName = 'node550'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2670'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1691', @ParentCompanyName = 'node551'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1764', @ParentCompanyName = 'node551'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1764'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2834', @ParentCompanyName = 'node551'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2834'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1384', @ParentCompanyName = 'node553'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1384'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1489', @ParentCompanyName = 'node553'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2189', @ParentCompanyName = 'node553'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2887', @ParentCompanyName = 'node553'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2887'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2323', @ParentCompanyName = 'node554'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2864', @ParentCompanyName = 'node555'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2864'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2867', @ParentCompanyName = 'node555'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2867'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1710', @ParentCompanyName = 'node556'
GO
EXEC SqlGraph.Company$Insert @Name = 'node3095', @ParentCompanyName = 'node556'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node3095'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2593', @ParentCompanyName = 'node557'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2593'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1937', @ParentCompanyName = 'node559'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1937'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2965', @ParentCompanyName = 'node559'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2965'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1577', @ParentCompanyName = 'node560'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1888', @ParentCompanyName = 'node560'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1888'
GO
EXEC SqlGraph.Company$Insert @Name = 'node3052', @ParentCompanyName = 'node560'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2185', @ParentCompanyName = 'node563'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2442', @ParentCompanyName = 'node563'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2442'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2553', @ParentCompanyName = 'node563'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2553'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1437', @ParentCompanyName = 'node564'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1437'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1423', @ParentCompanyName = 'node565'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1423'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1800', @ParentCompanyName = 'node565'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1800'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2257', @ParentCompanyName = 'node565'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2257'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2923', @ParentCompanyName = 'node565'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2923'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2370', @ParentCompanyName = 'node566'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2370'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2865', @ParentCompanyName = 'node566'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2865'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2492', @ParentCompanyName = 'node567'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1465', @ParentCompanyName = 'node568'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1465'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1731', @ParentCompanyName = 'node568'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1731'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2662', @ParentCompanyName = 'node568'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2662'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2977', @ParentCompanyName = 'node568'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2977'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2204', @ParentCompanyName = 'node569'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2204'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2692', @ParentCompanyName = 'node569'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2692'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1370', @ParentCompanyName = 'node570'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1370'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1389', @ParentCompanyName = 'node570'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1389'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1145', @ParentCompanyName = 'node571'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2501', @ParentCompanyName = 'node572'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2501'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2739', @ParentCompanyName = 'node572'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2739'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1816', @ParentCompanyName = 'node573'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1816'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1878', @ParentCompanyName = 'node573'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1878'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2157', @ParentCompanyName = 'node573'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2157'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2702', @ParentCompanyName = 'node573'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2702'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2321', @ParentCompanyName = 'node575'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2321'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2409', @ParentCompanyName = 'node575'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2409'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2994', @ParentCompanyName = 'node575'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2994'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2132', @ParentCompanyName = 'node576'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2132'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2075', @ParentCompanyName = 'node577'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2075'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2326', @ParentCompanyName = 'node577'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2326'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2288', @ParentCompanyName = 'node579'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2288'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2331', @ParentCompanyName = 'node579'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2331'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2868', @ParentCompanyName = 'node579'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2868'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1980', @ParentCompanyName = 'node580'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2688', @ParentCompanyName = 'node580'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2688'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1946', @ParentCompanyName = 'node581'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1946'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2266', @ParentCompanyName = 'node581'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2266'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1167', @ParentCompanyName = 'node582'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1167'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1221', @ParentCompanyName = 'node583'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1221'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1762', @ParentCompanyName = 'node583'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1762'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1767', @ParentCompanyName = 'node583'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1767'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2975', @ParentCompanyName = 'node583'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2975'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2988', @ParentCompanyName = 'node583'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2988'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2136', @ParentCompanyName = 'node584'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2136'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2496', @ParentCompanyName = 'node584'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2496'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2397', @ParentCompanyName = 'node585'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2397'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1716', @ParentCompanyName = 'node586'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1716'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2556', @ParentCompanyName = 'node586'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2556'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2332', @ParentCompanyName = 'node587'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2812', @ParentCompanyName = 'node587'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2812'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1614', @ParentCompanyName = 'node588'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1614'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1833', @ParentCompanyName = 'node588'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1833'
GO
EXEC SqlGraph.Company$Insert @Name = 'node3059', @ParentCompanyName = 'node588'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node3059'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1520', @ParentCompanyName = 'node589'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1520'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1930', @ParentCompanyName = 'node589'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1930'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2090', @ParentCompanyName = 'node589'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2090'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2227', @ParentCompanyName = 'node589'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2227'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2875', @ParentCompanyName = 'node589'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2875'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2238', @ParentCompanyName = 'node590'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2238'
GO
EXEC SqlGraph.Company$Insert @Name = 'node3054', @ParentCompanyName = 'node590'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node3054'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1247', @ParentCompanyName = 'node591'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1247'
GO
EXEC SqlGraph.Company$Insert @Name = 'node3002', @ParentCompanyName = 'node591'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node3002'
GO
EXEC SqlGraph.Company$Insert @Name = 'node3084', @ParentCompanyName = 'node592'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node3084'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2028', @ParentCompanyName = 'node593'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2028'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2651', @ParentCompanyName = 'node593'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2651'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1200', @ParentCompanyName = 'node594'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1200'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2412', @ParentCompanyName = 'node594'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2412'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2571', @ParentCompanyName = 'node594'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2571'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2801', @ParentCompanyName = 'node594'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2801'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1383', @ParentCompanyName = 'node595'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1383'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2274', @ParentCompanyName = 'node595'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2228', @ParentCompanyName = 'node596'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2228'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2434', @ParentCompanyName = 'node597'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2434'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2298', @ParentCompanyName = 'node598'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2319', @ParentCompanyName = 'node598'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2319'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1785', @ParentCompanyName = 'node599'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1785'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2066', @ParentCompanyName = 'node599'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2066'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2212', @ParentCompanyName = 'node599'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2212'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2719', @ParentCompanyName = 'node599'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2719'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2978', @ParentCompanyName = 'node599'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2978'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2983', @ParentCompanyName = 'node599'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2983'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1884', @ParentCompanyName = 'node600'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1884'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2830', @ParentCompanyName = 'node600'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2830'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1449', @ParentCompanyName = 'node601'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1449'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2105', @ParentCompanyName = 'node601'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2105'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2182', @ParentCompanyName = 'node601'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2182'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1670', @ParentCompanyName = 'node602'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1670'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1848', @ParentCompanyName = 'node602'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1848'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2164', @ParentCompanyName = 'node602'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2162', @ParentCompanyName = 'node603'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2162'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1590', @ParentCompanyName = 'node604'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1590'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2729', @ParentCompanyName = 'node604'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2729'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2757', @ParentCompanyName = 'node605'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2757'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1334', @ParentCompanyName = 'node606'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1334'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1366', @ParentCompanyName = 'node606'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1366'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1700', @ParentCompanyName = 'node606'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1700'
GO
EXEC SqlGraph.Company$Insert @Name = 'node3009', @ParentCompanyName = 'node606'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node3009'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2517', @ParentCompanyName = 'node607'
GO
EXEC SqlGraph.Company$Insert @Name = 'node3091', @ParentCompanyName = 'node608'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node3091'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2592', @ParentCompanyName = 'node609'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2592'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1819', @ParentCompanyName = 'node610'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1819'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1830', @ParentCompanyName = 'node610'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1830'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2329', @ParentCompanyName = 'node610'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2329'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2408', @ParentCompanyName = 'node610'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2408'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1259', @ParentCompanyName = 'node611'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1259'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1997', @ParentCompanyName = 'node611'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1997'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2786', @ParentCompanyName = 'node611'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2786'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1660', @ParentCompanyName = 'node612'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1660'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1293', @ParentCompanyName = 'node613'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1293'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1640', @ParentCompanyName = 'node613'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1640'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2156', @ParentCompanyName = 'node613'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2156'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1761', @ParentCompanyName = 'node614'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1761'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1808', @ParentCompanyName = 'node614'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1808'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2518', @ParentCompanyName = 'node614'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2518'
GO
EXEC SqlGraph.Company$Insert @Name = 'node3100', @ParentCompanyName = 'node614'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node3100'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1924', @ParentCompanyName = 'node615'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1924'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2519', @ParentCompanyName = 'node615'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2519'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2320', @ParentCompanyName = 'node616'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2320'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2562', @ParentCompanyName = 'node616'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2562'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2737', @ParentCompanyName = 'node617'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2737'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1810', @ParentCompanyName = 'node618'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2149', @ParentCompanyName = 'node618'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2149'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1840', @ParentCompanyName = 'node620'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1840'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1892', @ParentCompanyName = 'node620'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2877', @ParentCompanyName = 'node620'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2877'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1195', @ParentCompanyName = 'node621'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1195'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1431', @ParentCompanyName = 'node621'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1431'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2031', @ParentCompanyName = 'node621'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2031'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1948', @ParentCompanyName = 'node622'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1948'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2959', @ParentCompanyName = 'node622'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2959'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1643', @ParentCompanyName = 'node623'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1643'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1979', @ParentCompanyName = 'node623'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1979'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1455', @ParentCompanyName = 'node624'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2440', @ParentCompanyName = 'node624'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2440'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2738', @ParentCompanyName = 'node624'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2738'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2193', @ParentCompanyName = 'node625'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2193'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2084', @ParentCompanyName = 'node626'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2084'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1667', @ParentCompanyName = 'node627'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1667'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1887', @ParentCompanyName = 'node627'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2318', @ParentCompanyName = 'node627'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2318'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2586', @ParentCompanyName = 'node627'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2586'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1213', @ParentCompanyName = 'node628'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1213'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2395', @ParentCompanyName = 'node628'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2395'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1239', @ParentCompanyName = 'node629'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1239'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2674', @ParentCompanyName = 'node629'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2674'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2015', @ParentCompanyName = 'node631'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2015'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1399', @ParentCompanyName = 'node632'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1399'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2081', @ParentCompanyName = 'node632'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2081'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2850', @ParentCompanyName = 'node632'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2850'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2999', @ParentCompanyName = 'node632'
GO
EXEC SqlGraph.Company$Insert @Name = 'node3014', @ParentCompanyName = 'node632'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node3014'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1420', @ParentCompanyName = 'node633'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1420'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2079', @ParentCompanyName = 'node633'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2079'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2231', @ParentCompanyName = 'node633'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2231'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1743', @ParentCompanyName = 'node634'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1743'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2869', @ParentCompanyName = 'node634'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2869'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2846', @ParentCompanyName = 'node635'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1110', @ParentCompanyName = 'node637'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1296', @ParentCompanyName = 'node637'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1296'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2250', @ParentCompanyName = 'node639'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2250'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1307', @ParentCompanyName = 'node640'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1307'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2766', @ParentCompanyName = 'node640'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2766'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1122', @ParentCompanyName = 'node642'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1122'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1516', @ParentCompanyName = 'node642'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1516'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1911', @ParentCompanyName = 'node642'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1911'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1149', @ParentCompanyName = 'node643'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1149'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1692', @ParentCompanyName = 'node643'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1692'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1771', @ParentCompanyName = 'node643'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2471', @ParentCompanyName = 'node643'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2921', @ParentCompanyName = 'node644'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2921'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2428', @ParentCompanyName = 'node645'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2428'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2823', @ParentCompanyName = 'node647'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2823'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1320', @ParentCompanyName = 'node648'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1320'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1408', @ParentCompanyName = 'node648'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1408'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2892', @ParentCompanyName = 'node649'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2892'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2196', @ParentCompanyName = 'node651'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2271', @ParentCompanyName = 'node651'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2271'
GO
EXEC SqlGraph.Company$Insert @Name = 'node3061', @ParentCompanyName = 'node651'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node3061'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1945', @ParentCompanyName = 'node652'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1945'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2010', @ParentCompanyName = 'node652'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2010'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2874', @ParentCompanyName = 'node652'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2874'
GO
EXEC SqlGraph.Company$Insert @Name = 'node3013', @ParentCompanyName = 'node652'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node3013'
GO
EXEC SqlGraph.Company$Insert @Name = 'node3096', @ParentCompanyName = 'node652'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node3096'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1798', @ParentCompanyName = 'node653'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2525', @ParentCompanyName = 'node653'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2525'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1886', @ParentCompanyName = 'node654'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1886'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1556', @ParentCompanyName = 'node655'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1901', @ParentCompanyName = 'node655'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1901'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2944', @ParentCompanyName = 'node655'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2944'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1832', @ParentCompanyName = 'node656'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1832'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2124', @ParentCompanyName = 'node656'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2124'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2566', @ParentCompanyName = 'node656'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1376', @ParentCompanyName = 'node657'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1376'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2273', @ParentCompanyName = 'node657'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2273'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1379', @ParentCompanyName = 'node658'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1379'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2851', @ParentCompanyName = 'node658'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2851'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1579', @ParentCompanyName = 'node660'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1579'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1703', @ParentCompanyName = 'node660'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1703'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1156', @ParentCompanyName = 'node661'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1156'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1795', @ParentCompanyName = 'node661'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1795'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2002', @ParentCompanyName = 'node662'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2002'
GO
EXEC SqlGraph.Company$Insert @Name = 'node3006', @ParentCompanyName = 'node662'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1546', @ParentCompanyName = 'node663'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1546'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2509', @ParentCompanyName = 'node663'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2509'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1541', @ParentCompanyName = 'node664'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1844', @ParentCompanyName = 'node664'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1844'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1246', @ParentCompanyName = 'node665'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1246'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2341', @ParentCompanyName = 'node665'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2341'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1136', @ParentCompanyName = 'node666'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1136'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1171', @ParentCompanyName = 'node666'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1171'
GO
EXEC SqlGraph.Company$Insert @Name = 'node3031', @ParentCompanyName = 'node666'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node3031'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1533', @ParentCompanyName = 'node667'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1533'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1817', @ParentCompanyName = 'node668'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1817'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2158', @ParentCompanyName = 'node668'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2158'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2734', @ParentCompanyName = 'node668'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2477', @ParentCompanyName = 'node669'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2477'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2896', @ParentCompanyName = 'node670'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2896'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1512', @ParentCompanyName = 'node671'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1512'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2130', @ParentCompanyName = 'node671'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2130'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2334', @ParentCompanyName = 'node671'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2991', @ParentCompanyName = 'node671'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2991'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1131', @ParentCompanyName = 'node672'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1131'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1695', @ParentCompanyName = 'node672'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1695'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1749', @ParentCompanyName = 'node672'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1749'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2301', @ParentCompanyName = 'node672'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2301'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2049', @ParentCompanyName = 'node673'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2049'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2773', @ParentCompanyName = 'node673'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2773'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1641', @ParentCompanyName = 'node674'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1641'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2050', @ParentCompanyName = 'node674'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2050'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2507', @ParentCompanyName = 'node674'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2507'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2712', @ParentCompanyName = 'node674'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1874', @ParentCompanyName = 'node675'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1874'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1240', @ParentCompanyName = 'node676'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1240'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1865', @ParentCompanyName = 'node676'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1865'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2279', @ParentCompanyName = 'node676'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2279'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2330', @ParentCompanyName = 'node676'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2330'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1940', @ParentCompanyName = 'node677'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1940'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2121', @ParentCompanyName = 'node677'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2121'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2393', @ParentCompanyName = 'node677'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2393'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1352', @ParentCompanyName = 'node679'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1352'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2214', @ParentCompanyName = 'node679'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2214'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2908', @ParentCompanyName = 'node679'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2908'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2435', @ParentCompanyName = 'node680'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2435'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2726', @ParentCompanyName = 'node680'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2726'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2659', @ParentCompanyName = 'node681'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2659'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1535', @ParentCompanyName = 'node682'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1535'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2814', @ParentCompanyName = 'node682'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1900', @ParentCompanyName = 'node683'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1900'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1433', @ParentCompanyName = 'node684'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1433'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2858', @ParentCompanyName = 'node684'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2858'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2680', @ParentCompanyName = 'node686'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2680'
GO
EXEC SqlGraph.Company$Insert @Name = 'node3036', @ParentCompanyName = 'node686'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node3036'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2006', @ParentCompanyName = 'node687'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2006'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2111', @ParentCompanyName = 'node687'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2111'
GO
EXEC SqlGraph.Company$Insert @Name = 'node3017', @ParentCompanyName = 'node688'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node3017'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1965', @ParentCompanyName = 'node689'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1965'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1838', @ParentCompanyName = 'node690'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1838'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2003', @ParentCompanyName = 'node690'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1919', @ParentCompanyName = 'node691'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1919'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1143', @ParentCompanyName = 'node693'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1143'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2942', @ParentCompanyName = 'node693'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2942'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1265', @ParentCompanyName = 'node694'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1950', @ParentCompanyName = 'node694'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1950'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1595', @ParentCompanyName = 'node695'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2071', @ParentCompanyName = 'node695'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2071'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2640', @ParentCompanyName = 'node695'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2640'
GO
EXEC SqlGraph.Company$Insert @Name = 'node3028', @ParentCompanyName = 'node695'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node3028'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1736', @ParentCompanyName = 'node697'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1736'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2508', @ParentCompanyName = 'node697'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2264', @ParentCompanyName = 'node698'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2264'
GO
EXEC SqlGraph.Company$Insert @Name = 'node3088', @ParentCompanyName = 'node698'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node3088'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2305', @ParentCompanyName = 'node700'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2305'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1564', @ParentCompanyName = 'node701'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1564'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1725', @ParentCompanyName = 'node701'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1725'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1735', @ParentCompanyName = 'node701'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2644', @ParentCompanyName = 'node701'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2644'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1744', @ParentCompanyName = 'node702'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1941', @ParentCompanyName = 'node702'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1941'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2168', @ParentCompanyName = 'node702'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2168'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1365', @ParentCompanyName = 'node704'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1521', @ParentCompanyName = 'node704'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2961', @ParentCompanyName = 'node704'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2961'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1256', @ParentCompanyName = 'node705'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1256'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1490', @ParentCompanyName = 'node705'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1490'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1607', @ParentCompanyName = 'node705'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1607'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2955', @ParentCompanyName = 'node705'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2955'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1192', @ParentCompanyName = 'node706'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1192'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2639', @ParentCompanyName = 'node706'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2639'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1174', @ParentCompanyName = 'node707'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1174'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1473', @ParentCompanyName = 'node707'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1473'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2302', @ParentCompanyName = 'node707'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2302'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2494', @ParentCompanyName = 'node707'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2494'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2771', @ParentCompanyName = 'node707'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2771'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2870', @ParentCompanyName = 'node707'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2870'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1529', @ParentCompanyName = 'node708'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1529'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1685', @ParentCompanyName = 'node708'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1685'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2811', @ParentCompanyName = 'node708'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2811'
GO
EXEC SqlGraph.Company$Insert @Name = 'node3071', @ParentCompanyName = 'node708'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node3071'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1194', @ParentCompanyName = 'node709'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1194'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2914', @ParentCompanyName = 'node709'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2914'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2017', @ParentCompanyName = 'node710'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2017'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1358', @ParentCompanyName = 'node711'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1978', @ParentCompanyName = 'node711'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1978'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2263', @ParentCompanyName = 'node711'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2565', @ParentCompanyName = 'node711'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2565'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2859', @ParentCompanyName = 'node711'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2859'
GO
EXEC SqlGraph.Company$Insert @Name = 'node3029', @ParentCompanyName = 'node712'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node3029'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1191', @ParentCompanyName = 'node713'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1191'
GO
EXEC SqlGraph.Company$Insert @Name = 'node3021', @ParentCompanyName = 'node713'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node3021'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1476', @ParentCompanyName = 'node714'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1476'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2054', @ParentCompanyName = 'node714'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2054'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2678', @ParentCompanyName = 'node714'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2678'
GO
EXEC SqlGraph.Company$Insert @Name = 'node3023', @ParentCompanyName = 'node714'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node3023'
GO
EXEC SqlGraph.Company$Insert @Name = 'node3070', @ParentCompanyName = 'node715'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node3070'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1766', @ParentCompanyName = 'node716'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1766'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2970', @ParentCompanyName = 'node716'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2970'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1802', @ParentCompanyName = 'node717'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1802'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2611', @ParentCompanyName = 'node717'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2611'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1263', @ParentCompanyName = 'node719'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1301', @ParentCompanyName = 'node720'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1301'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2461', @ParentCompanyName = 'node720'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2461'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2375', @ParentCompanyName = 'node721'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2375'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1732', @ParentCompanyName = 'node722'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2438', @ParentCompanyName = 'node722'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2438'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1445', @ParentCompanyName = 'node723'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1445'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2155', @ParentCompanyName = 'node723'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2155'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2190', @ParentCompanyName = 'node723'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2190'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1698', @ParentCompanyName = 'node724'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2396', @ParentCompanyName = 'node724'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2396'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2454', @ParentCompanyName = 'node724'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2454'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2807', @ParentCompanyName = 'node724'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2807'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2879', @ParentCompanyName = 'node724'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2879'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2905', @ParentCompanyName = 'node725'
GO
EXEC SqlGraph.Company$Insert @Name = 'node3020', @ParentCompanyName = 'node725'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node3020'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1303', @ParentCompanyName = 'node726'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1303'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1983', @ParentCompanyName = 'node726'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1983'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2672', @ParentCompanyName = 'node726'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2672'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1754', @ParentCompanyName = 'node727'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1754'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1909', @ParentCompanyName = 'node727'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1909'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2120', @ParentCompanyName = 'node727'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2483', @ParentCompanyName = 'node727'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2483'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1336', @ParentCompanyName = 'node728'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1336'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2276', @ParentCompanyName = 'node728'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2276'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1435', @ParentCompanyName = 'node729'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1498', @ParentCompanyName = 'node729'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1498'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2746', @ParentCompanyName = 'node729'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2746'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1164', @ParentCompanyName = 'node730'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1164'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1729', @ParentCompanyName = 'node730'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1729'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2128', @ParentCompanyName = 'node730'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2128'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2403', @ParentCompanyName = 'node730'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2403'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1647', @ParentCompanyName = 'node731'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1647'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1805', @ParentCompanyName = 'node731'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1805'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2270', @ParentCompanyName = 'node731'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2270'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2748', @ParentCompanyName = 'node731'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2748'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1198', @ParentCompanyName = 'node732'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1198'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1714', @ParentCompanyName = 'node732'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1714'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2131', @ParentCompanyName = 'node732'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2131'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2676', @ParentCompanyName = 'node732'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2676'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2045', @ParentCompanyName = 'node733'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2045'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1506', @ParentCompanyName = 'node734'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2703', @ParentCompanyName = 'node734'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2703'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2365', @ParentCompanyName = 'node737'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2365'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2433', @ParentCompanyName = 'node737'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2433'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1469', @ParentCompanyName = 'node739'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1469'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2286', @ParentCompanyName = 'node739'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2286'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1109', @ParentCompanyName = 'node740'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1109'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1288', @ParentCompanyName = 'node740'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1500', @ParentCompanyName = 'node740'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1413', @ParentCompanyName = 'node741'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1413'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2292', @ParentCompanyName = 'node741'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2292'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2516', @ParentCompanyName = 'node741'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1118', @ParentCompanyName = 'node742'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1118'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1511', @ParentCompanyName = 'node742'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1511'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1867', @ParentCompanyName = 'node742'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1867'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1757', @ParentCompanyName = 'node743'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1757'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2604', @ParentCompanyName = 'node743'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2604'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1130', @ParentCompanyName = 'node745'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1130'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2259', @ParentCompanyName = 'node745'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2259'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2366', @ParentCompanyName = 'node745'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2366'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2554', @ParentCompanyName = 'node745'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2554'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1427', @ParentCompanyName = 'node748'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1427'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2376', @ParentCompanyName = 'node748'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2376'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1360', @ParentCompanyName = 'node749'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1273', @ParentCompanyName = 'node750'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1273'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1585', @ParentCompanyName = 'node750'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1585'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2107', @ParentCompanyName = 'node750'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2107'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2027', @ParentCompanyName = 'node752'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2027'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2711', @ParentCompanyName = 'node752'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2711'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1918', @ParentCompanyName = 'node753'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1918'
GO
EXEC SqlGraph.Company$Insert @Name = 'node3010', @ParentCompanyName = 'node753'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node3010'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1575', @ParentCompanyName = 'node754'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1861', @ParentCompanyName = 'node754'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1861'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1972', @ParentCompanyName = 'node754'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1972'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1402', @ParentCompanyName = 'node755'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1402'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2813', @ParentCompanyName = 'node755'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2813'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2179', @ParentCompanyName = 'node756'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2179'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2200', @ParentCompanyName = 'node756'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2200'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1135', @ParentCompanyName = 'node757'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1135'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1561', @ParentCompanyName = 'node757'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1561'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1624', @ParentCompanyName = 'node757'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1624'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1960', @ParentCompanyName = 'node757'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1960'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2732', @ParentCompanyName = 'node757'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2732'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1779', @ParentCompanyName = 'node759'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2446', @ParentCompanyName = 'node759'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2446'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1724', @ParentCompanyName = 'node760'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1724'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2297', @ParentCompanyName = 'node760'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2297'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2557', @ParentCompanyName = 'node760'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2557'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2802', @ParentCompanyName = 'node760'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2230', @ParentCompanyName = 'node761'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2230'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1314', @ParentCompanyName = 'node762'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1314'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1426', @ParentCompanyName = 'node762'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1426'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1513', @ParentCompanyName = 'node762'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1513'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2883', @ParentCompanyName = 'node763'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2883'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2486', @ParentCompanyName = 'node764'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1719', @ParentCompanyName = 'node765'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1719'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1485', @ParentCompanyName = 'node766'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1485'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1942', @ParentCompanyName = 'node766'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1942'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2992', @ParentCompanyName = 'node766'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2992'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1649', @ParentCompanyName = 'node767'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1649'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1894', @ParentCompanyName = 'node767'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1894'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2290', @ParentCompanyName = 'node767'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2290'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2953', @ParentCompanyName = 'node767'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2953'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1531', @ParentCompanyName = 'node769'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1531'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2928', @ParentCompanyName = 'node769'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2928'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2685', @ParentCompanyName = 'node770'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2685'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2055', @ParentCompanyName = 'node771'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2055'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2239', @ParentCompanyName = 'node773'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2352', @ParentCompanyName = 'node773'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2352'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1391', @ParentCompanyName = 'node774'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1391'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1401', @ParentCompanyName = 'node774'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1401'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2282', @ParentCompanyName = 'node774'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2282'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1748', @ParentCompanyName = 'node776'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1748'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1875', @ParentCompanyName = 'node776'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1875'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1509', @ParentCompanyName = 'node777'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1509'
GO
EXEC SqlGraph.Company$Insert @Name = 'node3026', @ParentCompanyName = 'node777'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node3026'
GO
EXEC SqlGraph.Company$Insert @Name = 'node3067', @ParentCompanyName = 'node778'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node3067'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1784', @ParentCompanyName = 'node779'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1636', @ParentCompanyName = 'node780'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1951', @ParentCompanyName = 'node780'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1951'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2213', @ParentCompanyName = 'node780'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1763', @ParentCompanyName = 'node781'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1763'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1794', @ParentCompanyName = 'node781'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2098', @ParentCompanyName = 'node781'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2098'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1934', @ParentCompanyName = 'node783'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1934'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2091', @ParentCompanyName = 'node784'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2091'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2453', @ParentCompanyName = 'node784'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1464', @ParentCompanyName = 'node785'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1464'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2642', @ParentCompanyName = 'node785'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2642'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1759', @ParentCompanyName = 'node786'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2023', @ParentCompanyName = 'node786'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2023'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2059', @ParentCompanyName = 'node786'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2059'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2065', @ParentCompanyName = 'node786'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2065'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1936', @ParentCompanyName = 'node787'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1936'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1524', @ParentCompanyName = 'node788'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1524'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1741', @ParentCompanyName = 'node788'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1741'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2491', @ParentCompanyName = 'node788'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2491'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2127', @ParentCompanyName = 'node789'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2127'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1851', @ParentCompanyName = 'node790'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2727', @ParentCompanyName = 'node791'
GO
EXEC SqlGraph.Company$Insert @Name = 'node3037', @ParentCompanyName = 'node791'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node3037'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1623', @ParentCompanyName = 'node792'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1623'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1737', @ParentCompanyName = 'node792'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1737'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2911', @ParentCompanyName = 'node792'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2911'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1927', @ParentCompanyName = 'node793'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1927'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1967', @ParentCompanyName = 'node793'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1967'
GO
EXEC SqlGraph.Company$Insert @Name = 'node3080', @ParentCompanyName = 'node793'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node3080'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2253', @ParentCompanyName = 'node795'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2253'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2728', @ParentCompanyName = 'node795'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2826', @ParentCompanyName = 'node795'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2826'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1125', @ParentCompanyName = 'node796'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1125'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1821', @ParentCompanyName = 'node796'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1821'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1187', @ParentCompanyName = 'node797'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1187'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1400', @ParentCompanyName = 'node797'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1400'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1873', @ParentCompanyName = 'node797'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1873'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2588', @ParentCompanyName = 'node797'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1740', @ParentCompanyName = 'node799'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1740'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1897', @ParentCompanyName = 'node799'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1897'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2437', @ParentCompanyName = 'node799'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2437'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2619', @ParentCompanyName = 'node799'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2619'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1578', @ParentCompanyName = 'node800'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1578'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1227', @ParentCompanyName = 'node801'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1227'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2140', @ParentCompanyName = 'node801'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2721', @ParentCompanyName = 'node801'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2721'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1842', @ParentCompanyName = 'node802'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1842'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2612', @ParentCompanyName = 'node802'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2612'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1409', @ParentCompanyName = 'node803'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1409'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1571', @ParentCompanyName = 'node803'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1571'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1996', @ParentCompanyName = 'node803'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1996'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2425', @ParentCompanyName = 'node803'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2425'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2610', @ParentCompanyName = 'node804'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2610'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2663', @ParentCompanyName = 'node804'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2663'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2770', @ParentCompanyName = 'node804'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2770'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1702', @ParentCompanyName = 'node805'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1702'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1977', @ParentCompanyName = 'node805'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1977'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1161', @ParentCompanyName = 'node806'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1161'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1857', @ParentCompanyName = 'node806'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1857'
GO
EXEC SqlGraph.Company$Insert @Name = 'node3101', @ParentCompanyName = 'node806'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node3101'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2110', @ParentCompanyName = 'node807'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2110'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2147', @ParentCompanyName = 'node807'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2147'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2574', @ParentCompanyName = 'node807'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2574'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2963', @ParentCompanyName = 'node808'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2963'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2458', @ParentCompanyName = 'node809'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2458'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1704', @ParentCompanyName = 'node810'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1704'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1973', @ParentCompanyName = 'node810'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2108', @ParentCompanyName = 'node810'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2108'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2899', @ParentCompanyName = 'node811'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2899'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2552', @ParentCompanyName = 'node812'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2552'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1393', @ParentCompanyName = 'node813'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1393'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1115', @ParentCompanyName = 'node814'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1115'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1471', @ParentCompanyName = 'node814'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1471'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2060', @ParentCompanyName = 'node814'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2904', @ParentCompanyName = 'node814'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2904'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1137', @ParentCompanyName = 'node815'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1137'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1994', @ParentCompanyName = 'node816'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1994'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1872', @ParentCompanyName = 'node819'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1872'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2340', @ParentCompanyName = 'node819'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2340'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2530', @ParentCompanyName = 'node819'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2530'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2972', @ParentCompanyName = 'node819'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2972'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2794', @ParentCompanyName = 'node820'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2794'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1120', @ParentCompanyName = 'node821'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1120'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1260', @ParentCompanyName = 'node821'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1260'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1526', @ParentCompanyName = 'node821'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1526'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2089', @ParentCompanyName = 'node821'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2089'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2281', @ParentCompanyName = 'node822'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2281'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2668', @ParentCompanyName = 'node823'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2668'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2932', @ParentCompanyName = 'node823'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2932'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1615', @ParentCompanyName = 'node824'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2180', @ParentCompanyName = 'node825'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2180'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2489', @ParentCompanyName = 'node825'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1474', @ParentCompanyName = 'node826'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1474'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1715', @ParentCompanyName = 'node826'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1715'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1483', @ParentCompanyName = 'node827'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1483'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1780', @ParentCompanyName = 'node827'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1780'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1961', @ParentCompanyName = 'node827'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1961'
GO
EXEC SqlGraph.Company$Insert @Name = 'node3078', @ParentCompanyName = 'node827'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node3078'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2350', @ParentCompanyName = 'node829'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2350'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2881', @ParentCompanyName = 'node832'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2881'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1609', @ParentCompanyName = 'node833'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1609'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1789', @ParentCompanyName = 'node834'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1789'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2993', @ParentCompanyName = 'node834'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2993'
GO
EXEC SqlGraph.Company$Insert @Name = 'node3069', @ParentCompanyName = 'node834'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node3069'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1466', @ParentCompanyName = 'node836'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1466'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1792', @ParentCompanyName = 'node836'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1792'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2133', @ParentCompanyName = 'node837'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2133'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2390', @ParentCompanyName = 'node837'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2390'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2472', @ParentCompanyName = 'node837'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2472'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2033', @ParentCompanyName = 'node838'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2033'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2058', @ParentCompanyName = 'node838'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2058'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2360', @ParentCompanyName = 'node838'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2360'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2661', @ParentCompanyName = 'node838'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2661'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2691', @ParentCompanyName = 'node838'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2691'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2806', @ParentCompanyName = 'node838'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2806'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2973', @ParentCompanyName = 'node838'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2153', @ParentCompanyName = 'node839'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2153'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1447', @ParentCompanyName = 'node840'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1447'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1184', @ParentCompanyName = 'node841'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1184'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1452', @ParentCompanyName = 'node841'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1452'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1788', @ParentCompanyName = 'node841'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1788'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2647', @ParentCompanyName = 'node841'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2647'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1308', @ParentCompanyName = 'node842'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1308'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2843', @ParentCompanyName = 'node843'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2843'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1550', @ParentCompanyName = 'node844'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1550'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2866', @ParentCompanyName = 'node844'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2866'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1190', @ParentCompanyName = 'node847'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1190'
GO
EXEC SqlGraph.Company$Insert @Name = 'node3068', @ParentCompanyName = 'node847'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node3068'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1588', @ParentCompanyName = 'node848'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1588'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1758', @ParentCompanyName = 'node848'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1758'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2036', @ParentCompanyName = 'node849'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2036'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2514', @ParentCompanyName = 'node849'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2514'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2709', @ParentCompanyName = 'node849'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2709'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2733', @ParentCompanyName = 'node850'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2733'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1501', @ParentCompanyName = 'node851'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1929', @ParentCompanyName = 'node851'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1929'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2387', @ParentCompanyName = 'node852'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2387'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2527', @ParentCompanyName = 'node853'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2527'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2760', @ParentCompanyName = 'node854'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2760'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1626', @ParentCompanyName = 'node855'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1626'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2803', @ParentCompanyName = 'node856'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2803'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1274', @ParentCompanyName = 'node857'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1274'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1694', @ParentCompanyName = 'node857'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2459', @ParentCompanyName = 'node857'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2459'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1251', @ParentCompanyName = 'node858'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1251'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1494', @ParentCompanyName = 'node858'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1494'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1530', @ParentCompanyName = 'node858'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1530'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2294', @ParentCompanyName = 'node858'
GO
EXEC SqlGraph.Company$Insert @Name = 'node3004', @ParentCompanyName = 'node858'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node3004'
GO
EXEC SqlGraph.Company$Insert @Name = 'node3043', @ParentCompanyName = 'node858'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2504', @ParentCompanyName = 'node859'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2504'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1644', @ParentCompanyName = 'node860'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1644'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2451', @ParentCompanyName = 'node860'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2677', @ParentCompanyName = 'node860'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2878', @ParentCompanyName = 'node860'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2878'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2386', @ParentCompanyName = 'node861'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2386'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2849', @ParentCompanyName = 'node862'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2849'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1387', @ParentCompanyName = 'node863'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1547', @ParentCompanyName = 'node863'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1547'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2296', @ParentCompanyName = 'node863'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2296'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1600', @ParentCompanyName = 'node864'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1600'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1674', @ParentCompanyName = 'node864'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1674'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2223', @ParentCompanyName = 'node864'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2223'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2987', @ParentCompanyName = 'node864'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2987'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1302', @ParentCompanyName = 'node866'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1302'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1988', @ParentCompanyName = 'node866'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1988'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2819', @ParentCompanyName = 'node866'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1286', @ParentCompanyName = 'node868'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1286'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1493', @ParentCompanyName = 'node868'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1493'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2616', @ParentCompanyName = 'node868'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2616'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1277', @ParentCompanyName = 'node869'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1277'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1432', @ParentCompanyName = 'node869'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1432'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2102', @ParentCompanyName = 'node869'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2102'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2690', @ParentCompanyName = 'node869'
GO
EXEC SqlGraph.Company$Insert @Name = 'node3051', @ParentCompanyName = 'node869'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node3051'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1542', @ParentCompanyName = 'node870'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1542'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2832', @ParentCompanyName = 'node870'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2832'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1488', @ParentCompanyName = 'node871'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1488'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2094', @ParentCompanyName = 'node871'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2094'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2589', @ParentCompanyName = 'node872'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2589'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1629', @ParentCompanyName = 'node873'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2800', @ParentCompanyName = 'node873'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2800'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1364', @ParentCompanyName = 'node874'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1364'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1569', @ParentCompanyName = 'node875'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1196', @ParentCompanyName = 'node876'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1196'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1910', @ParentCompanyName = 'node876'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1910'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2009', @ParentCompanyName = 'node876'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2009'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2039', @ParentCompanyName = 'node876'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2039'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1479', @ParentCompanyName = 'node877'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1479'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1807', @ParentCompanyName = 'node879'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1992', @ParentCompanyName = 'node879'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1992'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2284', @ParentCompanyName = 'node879'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2284'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2716', @ParentCompanyName = 'node879'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2716'
GO
EXEC SqlGraph.Company$Insert @Name = 'node3057', @ParentCompanyName = 'node879'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node3057'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1105', @ParentCompanyName = 'node880'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1105'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1855', @ParentCompanyName = 'node880'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1855'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1999', @ParentCompanyName = 'node880'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1999'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2080', @ParentCompanyName = 'node880'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1598', @ParentCompanyName = 'node881'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1598'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2816', @ParentCompanyName = 'node882'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2816'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2191', @ParentCompanyName = 'node883'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1442', @ParentCompanyName = 'node884'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1442'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1553', @ParentCompanyName = 'node885'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1553'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1734', @ParentCompanyName = 'node885'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1734'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2704', @ParentCompanyName = 'node885'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2704'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1811', @ParentCompanyName = 'node886'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1811'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2384', @ParentCompanyName = 'node886'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2384'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1340', @ParentCompanyName = 'node887'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1340'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1750', @ParentCompanyName = 'node888'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1750'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1405', @ParentCompanyName = 'node889'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1405'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2367', @ParentCompanyName = 'node890'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2617', @ParentCompanyName = 'node890'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2617'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2920', @ParentCompanyName = 'node890'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2920'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1252', @ParentCompanyName = 'node892'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1252'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1675', @ParentCompanyName = 'node892'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1675'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1971', @ParentCompanyName = 'node892'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1971'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2201', @ParentCompanyName = 'node892'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2201'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2884', @ParentCompanyName = 'node892'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2884'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1229', @ParentCompanyName = 'node893'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1229'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2020', @ParentCompanyName = 'node893'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2020'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2307', @ParentCompanyName = 'node893'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2307'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2455', @ParentCompanyName = 'node893'
GO
EXEC SqlGraph.Company$Insert @Name = 'node3066', @ParentCompanyName = 'node893'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node3066'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1460', @ParentCompanyName = 'node895'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1460'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1528', @ParentCompanyName = 'node895'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1528'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2261', @ParentCompanyName = 'node895'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2261'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2804', @ParentCompanyName = 'node895'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2989', @ParentCompanyName = 'node895'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2989'
GO
EXEC SqlGraph.Company$Insert @Name = 'node3053', @ParentCompanyName = 'node895'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node3053'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1944', @ParentCompanyName = 'node896'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2225', @ParentCompanyName = 'node896'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2225'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1291', @ParentCompanyName = 'node897'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2933', @ParentCompanyName = 'node897'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2948', @ParentCompanyName = 'node897'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2948'
GO
EXEC SqlGraph.Company$Insert @Name = 'node3047', @ParentCompanyName = 'node897'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node3047'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1689', @ParentCompanyName = 'node900'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1689'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2300', @ParentCompanyName = 'node900'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2300'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2938', @ParentCompanyName = 'node900'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2938'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2915', @ParentCompanyName = 'node901'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2915'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1613', @ParentCompanyName = 'node902'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1613'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2142', @ParentCompanyName = 'node902'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2142'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2448', @ParentCompanyName = 'node902'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2448'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2555', @ParentCompanyName = 'node902'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2597', @ParentCompanyName = 'node902'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2597'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2949', @ParentCompanyName = 'node902'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2949'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2633', @ParentCompanyName = 'node903'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2633'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1686', @ParentCompanyName = 'node905'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1686'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2144', @ParentCompanyName = 'node905'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2219', @ParentCompanyName = 'node905'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2219'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1956', @ParentCompanyName = 'node906'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1956'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2116', @ParentCompanyName = 'node906'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2116'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2379', @ParentCompanyName = 'node906'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2379'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2100', @ParentCompanyName = 'node907'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2419', @ParentCompanyName = 'node907'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2474', @ParentCompanyName = 'node907'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1995', @ParentCompanyName = 'node908'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2502', @ParentCompanyName = 'node908'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1711', @ParentCompanyName = 'node909'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2208', @ParentCompanyName = 'node909'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2221', @ParentCompanyName = 'node909'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2221'
GO
EXEC SqlGraph.Company$Insert @Name = 'node3025', @ParentCompanyName = 'node909'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1343', @ParentCompanyName = 'node910'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1343'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2008', @ParentCompanyName = 'node911'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2008'
GO
EXEC SqlGraph.Company$Insert @Name = 'node3007', @ParentCompanyName = 'node911'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node3007'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1655', @ParentCompanyName = 'node912'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1655'
GO
EXEC SqlGraph.Company$Insert @Name = 'node3035', @ParentCompanyName = 'node912'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2862', @ParentCompanyName = 'node913'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2862'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2792', @ParentCompanyName = 'node914'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2792'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1235', @ParentCompanyName = 'node915'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1235'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2154', @ParentCompanyName = 'node915'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2154'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1258', @ParentCompanyName = 'node916'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1258'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1820', @ParentCompanyName = 'node916'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1820'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1987', @ParentCompanyName = 'node916'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1987'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1870', @ParentCompanyName = 'node918'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1870'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2913', @ParentCompanyName = 'node918'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2913'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1369', @ParentCompanyName = 'node919'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1369'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2596', @ParentCompanyName = 'node919'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2596'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2762', @ParentCompanyName = 'node919'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2762'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2104', @ParentCompanyName = 'node920'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2104'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2188', @ParentCompanyName = 'node920'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2188'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1139', @ParentCompanyName = 'node922'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1139'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1444', @ParentCompanyName = 'node923'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1444'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1912', @ParentCompanyName = 'node923'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1912'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2022', @ParentCompanyName = 'node923'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2022'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2289', @ParentCompanyName = 'node923'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2289'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2632', @ParentCompanyName = 'node923'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2632'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1282', @ParentCompanyName = 'node925'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1282'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2322', @ParentCompanyName = 'node926'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2322'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2581', @ParentCompanyName = 'node927'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2581'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1969', @ParentCompanyName = 'node928'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1969'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1538', @ParentCompanyName = 'node929'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1538'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1722', @ParentCompanyName = 'node929'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1722'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1175', @ParentCompanyName = 'node930'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1175'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1468', @ParentCompanyName = 'node930'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1468'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2272', @ParentCompanyName = 'node930'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2272'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1604', @ParentCompanyName = 'node931'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1604'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1333', @ParentCompanyName = 'node933'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1333'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1812', @ParentCompanyName = 'node933'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1812'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2579', @ParentCompanyName = 'node933'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2579'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1480', @ParentCompanyName = 'node934'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1480'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1998', @ParentCompanyName = 'node934'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1998'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2567', @ParentCompanyName = 'node934'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1153', @ParentCompanyName = 'node936'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1153'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1361', @ParentCompanyName = 'node936'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1361'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1373', @ParentCompanyName = 'node936'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1373'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1304', @ParentCompanyName = 'node937'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1304'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1605', @ParentCompanyName = 'node937'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1605'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1648', @ParentCompanyName = 'node937'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1648'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2258', @ParentCompanyName = 'node937'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2258'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2700', @ParentCompanyName = 'node937'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2700'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1272', @ParentCompanyName = 'node938'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1272'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2615', @ParentCompanyName = 'node938'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2615'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2782', @ParentCompanyName = 'node938'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1181', @ParentCompanyName = 'node939'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1181'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1770', @ParentCompanyName = 'node940'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1770'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2085', @ParentCompanyName = 'node940'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2085'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2605', @ParentCompanyName = 'node940'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2605'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2778', @ParentCompanyName = 'node940'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2778'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1450', @ParentCompanyName = 'node941'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1450'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2113', @ParentCompanyName = 'node941'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2373', @ParentCompanyName = 'node941'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2373'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1425', @ParentCompanyName = 'node943'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1425'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2342', @ParentCompanyName = 'node943'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2342'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1558', @ParentCompanyName = 'node944'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1558'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1906', @ParentCompanyName = 'node944'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1906'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2682', @ParentCompanyName = 'node944'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2682'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2717', @ParentCompanyName = 'node944'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2717'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1154', @ParentCompanyName = 'node945'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1154'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2337', @ParentCompanyName = 'node945'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2337'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2101', @ParentCompanyName = 'node947'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2101'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2291', @ParentCompanyName = 'node947'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2291'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2537', @ParentCompanyName = 'node947'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2537'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1678', @ParentCompanyName = 'node948'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1678'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1682', @ParentCompanyName = 'node948'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1682'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1905', @ParentCompanyName = 'node948'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1905'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2505', @ParentCompanyName = 'node948'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2505'
GO
EXEC SqlGraph.Company$Insert @Name = 'node3079', @ParentCompanyName = 'node948'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node3079'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1350', @ParentCompanyName = 'node949'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1350'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1495', @ParentCompanyName = 'node949'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1495'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2355', @ParentCompanyName = 'node950'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1132', @ParentCompanyName = 'node951'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1132'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2248', @ParentCompanyName = 'node952'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2248'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2506', @ParentCompanyName = 'node952'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2506'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1917', @ParentCompanyName = 'node953'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1917'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2561', @ParentCompanyName = 'node953'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1173', @ParentCompanyName = 'node954'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1173'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1121', @ParentCompanyName = 'node955'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1822', @ParentCompanyName = 'node956'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1822'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1859', @ParentCompanyName = 'node956'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1859'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2044', @ParentCompanyName = 'node956'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2044'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2468', @ParentCompanyName = 'node956'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2468'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2547', @ParentCompanyName = 'node956'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2547'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2909', @ParentCompanyName = 'node956'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2909'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2099', @ParentCompanyName = 'node957'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2099'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1618', @ParentCompanyName = 'node958'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1618'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2543', @ParentCompanyName = 'node958'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2543'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1102', @ParentCompanyName = 'node959'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1102'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1278', @ParentCompanyName = 'node959'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1278'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1359', @ParentCompanyName = 'node959'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1359'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2278', @ParentCompanyName = 'node959'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2278'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1253', @ParentCompanyName = 'node960'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1253'
GO
EXEC SqlGraph.Company$Insert @Name = 'node3038', @ParentCompanyName = 'node960'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node3038'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1534', @ParentCompanyName = 'node961'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1534'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1671', @ParentCompanyName = 'node961'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1671'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1349', @ParentCompanyName = 'node962'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1349'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2606', @ParentCompanyName = 'node962'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2606'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1116', @ParentCompanyName = 'node964'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1116'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2906', @ParentCompanyName = 'node964'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2906'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1331', @ParentCompanyName = 'node965'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1331'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1955', @ParentCompanyName = 'node965'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1955'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2283', @ParentCompanyName = 'node965'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2283'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2536', @ParentCompanyName = 'node965'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2536'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2730', @ParentCompanyName = 'node965'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2730'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2753', @ParentCompanyName = 'node965'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2753'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2141', @ParentCompanyName = 'node966'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1144', @ParentCompanyName = 'node967'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1144'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1747', @ParentCompanyName = 'node967'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1747'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1355', @ParentCompanyName = 'node968'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1355'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1222', @ParentCompanyName = 'node969'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1222'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2708', @ParentCompanyName = 'node969'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2708'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2150', @ParentCompanyName = 'node970'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2150'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2754', @ParentCompanyName = 'node970'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2754'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2464', @ParentCompanyName = 'node971'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2464'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1781', @ParentCompanyName = 'node972'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1781'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2235', @ParentCompanyName = 'node972'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2235'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2767', @ParentCompanyName = 'node972'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2767'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1407', @ParentCompanyName = 'node973'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1407'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1869', @ParentCompanyName = 'node973'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2115', @ParentCompanyName = 'node973'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2115'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2362', @ParentCompanyName = 'node973'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2362'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1129', @ParentCompanyName = 'node974'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1658', @ParentCompanyName = 'node974'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1658'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1680', @ParentCompanyName = 'node974'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2314', @ParentCompanyName = 'node974'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2314'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2418', @ParentCompanyName = 'node975'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2418'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2741', @ParentCompanyName = 'node975'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2741'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1249', @ParentCompanyName = 'node976'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1249'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1421', @ParentCompanyName = 'node976'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1315', @ParentCompanyName = 'node978'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1315'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1586', @ParentCompanyName = 'node978'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1586'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2062', @ParentCompanyName = 'node978'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2473', @ParentCompanyName = 'node978'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2473'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2559', @ParentCompanyName = 'node978'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1396', @ParentCompanyName = 'node979'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1396'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2348', @ParentCompanyName = 'node979'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2348'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2548', @ParentCompanyName = 'node979'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2548'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2648', @ParentCompanyName = 'node979'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2648'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2114', @ParentCompanyName = 'node980'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2114'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2954', @ParentCompanyName = 'node980'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2954'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1463', @ParentCompanyName = 'node981'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1463'
GO
EXEC SqlGraph.Company$Insert @Name = 'node3063', @ParentCompanyName = 'node981'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1503', @ParentCompanyName = 'node982'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1503'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2809', @ParentCompanyName = 'node982'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2809'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2736', @ParentCompanyName = 'node983'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2736'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2962', @ParentCompanyName = 'node983'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2962'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1197', @ParentCompanyName = 'node984'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1197'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1572', @ParentCompanyName = 'node984'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1572'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1666', @ParentCompanyName = 'node984'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1666'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2173', @ParentCompanyName = 'node984'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2173'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2776', @ParentCompanyName = 'node984'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2776'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1223', @ParentCompanyName = 'node985'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1223'
GO
EXEC SqlGraph.Company$Insert @Name = 'node3040', @ParentCompanyName = 'node985'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2161', @ParentCompanyName = 'node986'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2161'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1324', @ParentCompanyName = 'node987'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1324'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1375', @ParentCompanyName = 'node988'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1375'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2643', @ParentCompanyName = 'node988'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2643'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2665', @ParentCompanyName = 'node988'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2665'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1106', @ParentCompanyName = 'node989'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1106'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1947', @ParentCompanyName = 'node989'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1947'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2285', @ParentCompanyName = 'node989'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2957', @ParentCompanyName = 'node989'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1412', @ParentCompanyName = 'node990'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1412'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1696', @ParentCompanyName = 'node990'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1593', @ParentCompanyName = 'node992'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1593'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1673', @ParentCompanyName = 'node993'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1673'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2037', @ParentCompanyName = 'node993'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2037'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2724', @ParentCompanyName = 'node993'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2724'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1216', @ParentCompanyName = 'node995'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1216'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1684', @ParentCompanyName = 'node995'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1684'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2038', @ParentCompanyName = 'node995'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2038'
GO
EXEC SqlGraph.Company$Insert @Name = 'node2620', @ParentCompanyName = 'node995'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node2620'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1527', @ParentCompanyName = 'node997'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1527'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1152', @ParentCompanyName = 'node998'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1890', @ParentCompanyName = 'node998'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1890'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1215', @ParentCompanyName = 'node999'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1215'
GO
EXEC SqlGraph.Company$Insert @Name = 'node1411', @ParentCompanyName = 'node999'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node1411'
GO
EXEC SqlGraph.Company$Insert @Name = 'node3123', @ParentCompanyName = 'node1108'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node3123'
GO
EXEC SqlGraph.Company$Insert @Name = 'node3106', @ParentCompanyName = 'node1110'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node3106'
GO
EXEC SqlGraph.Company$Insert @Name = 'node3383', @ParentCompanyName = 'node1112'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node3383'
GO
EXEC SqlGraph.Company$Insert @Name = 'node3329', @ParentCompanyName = 'node1119'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node3329'
GO
EXEC SqlGraph.Company$Insert @Name = 'node3218', @ParentCompanyName = 'node1121'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node3218'
GO
EXEC SqlGraph.Company$Insert @Name = 'node3284', @ParentCompanyName = 'node1129'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node3284'
GO
EXEC SqlGraph.Company$Insert @Name = 'node3130', @ParentCompanyName = 'node1145'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node3130'
GO
EXEC SqlGraph.Company$Insert @Name = 'node3177', @ParentCompanyName = 'node1145'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node3177'
GO
EXEC SqlGraph.Company$Insert @Name = 'node3243', @ParentCompanyName = 'node1152'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node3243'
GO
EXEC SqlGraph.Company$Insert @Name = 'node3283', @ParentCompanyName = 'node1160'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node3283'
GO
EXEC SqlGraph.Company$Insert @Name = 'node3229', @ParentCompanyName = 'node1166'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node3229'
GO
EXEC SqlGraph.Company$Insert @Name = 'node3252', @ParentCompanyName = 'node1185'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node3252'
GO
EXEC SqlGraph.Company$Insert @Name = 'node3200', @ParentCompanyName = 'node1188'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node3200'
GO
EXEC SqlGraph.Company$Insert @Name = 'node3345', @ParentCompanyName = 'node1188'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node3345'
GO
EXEC SqlGraph.Company$Insert @Name = 'node3209', @ParentCompanyName = 'node1202'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node3209'
GO
EXEC SqlGraph.Company$Insert @Name = 'node3326', @ParentCompanyName = 'node1208'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node3326'
GO
EXEC SqlGraph.Company$Insert @Name = 'node3187', @ParentCompanyName = 'node1212'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node3187'
GO
EXEC SqlGraph.Company$Insert @Name = 'node3165', @ParentCompanyName = 'node1214'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node3165'
GO
EXEC SqlGraph.Company$Insert @Name = 'node3198', @ParentCompanyName = 'node1219'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node3198'
GO
EXEC SqlGraph.Company$Insert @Name = 'node3255', @ParentCompanyName = 'node1224'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node3255'
GO
EXEC SqlGraph.Company$Insert @Name = 'node3335', @ParentCompanyName = 'node1230'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node3335'
GO
EXEC SqlGraph.Company$Insert @Name = 'node3337', @ParentCompanyName = 'node1232'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node3337'
GO
EXEC SqlGraph.Company$Insert @Name = 'node3346', @ParentCompanyName = 'node1234'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node3346'
GO
EXEC SqlGraph.Company$Insert @Name = 'node3248', @ParentCompanyName = 'node1255'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node3248'
GO
EXEC SqlGraph.Company$Insert @Name = 'node3190', @ParentCompanyName = 'node1263'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node3190'
GO
EXEC SqlGraph.Company$Insert @Name = 'node3320', @ParentCompanyName = 'node1265'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node3320'
GO
EXEC SqlGraph.Company$Insert @Name = 'node3381', @ParentCompanyName = 'node1269'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node3381'
GO
EXEC SqlGraph.Company$Insert @Name = 'node3297', @ParentCompanyName = 'node1270'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node3297'
GO
EXEC SqlGraph.Company$Insert @Name = 'node3368', @ParentCompanyName = 'node1288'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node3368'
GO
EXEC SqlGraph.Company$Insert @Name = 'node3351', @ParentCompanyName = 'node1291'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node3351'
GO
EXEC SqlGraph.Company$Insert @Name = 'node3145', @ParentCompanyName = 'node1321'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node3145'
GO
EXEC SqlGraph.Company$Insert @Name = 'node3306', @ParentCompanyName = 'node1325'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node3306'
GO
EXEC SqlGraph.Company$Insert @Name = 'node3114', @ParentCompanyName = 'node1328'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node3114'
GO
EXEC SqlGraph.Company$Insert @Name = 'node3194', @ParentCompanyName = 'node1335'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node3194'
GO
EXEC SqlGraph.Company$Insert @Name = 'node3193', @ParentCompanyName = 'node1341'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node3193'
GO
EXEC SqlGraph.Company$Insert @Name = 'node3242', @ParentCompanyName = 'node1354'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node3242'
GO
EXEC SqlGraph.Company$Insert @Name = 'node3325', @ParentCompanyName = 'node1354'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node3325'
GO
EXEC SqlGraph.Company$Insert @Name = 'node3374', @ParentCompanyName = 'node1358'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node3374'
GO
EXEC SqlGraph.Company$Insert @Name = 'node3249', @ParentCompanyName = 'node1360'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node3249'
GO
EXEC SqlGraph.Company$Insert @Name = 'node3214', @ParentCompanyName = 'node1365'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node3214'
GO
EXEC SqlGraph.Company$Insert @Name = 'node3163', @ParentCompanyName = 'node1371'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node3163'
GO
EXEC SqlGraph.Company$Insert @Name = 'node3141', @ParentCompanyName = 'node1380'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node3141'
GO
EXEC SqlGraph.Company$Insert @Name = 'node3336', @ParentCompanyName = 'node1380'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node3336'
GO
EXEC SqlGraph.Company$Insert @Name = 'node3133', @ParentCompanyName = 'node1387'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node3133'
GO
EXEC SqlGraph.Company$Insert @Name = 'node3373', @ParentCompanyName = 'node1390'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node3373'
GO
EXEC SqlGraph.Company$Insert @Name = 'node3372', @ParentCompanyName = 'node1416'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node3372'
GO
EXEC SqlGraph.Company$Insert @Name = 'node3395', @ParentCompanyName = 'node1421'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node3395'
GO
EXEC SqlGraph.Company$Insert @Name = 'node3367', @ParentCompanyName = 'node1435'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node3367'
GO
EXEC SqlGraph.Company$Insert @Name = 'node3237', @ParentCompanyName = 'node1440'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node3237'
GO
EXEC SqlGraph.Company$Insert @Name = 'node3136', @ParentCompanyName = 'node1443'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node3136'
GO
EXEC SqlGraph.Company$Insert @Name = 'node3162', @ParentCompanyName = 'node1446'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node3162'
GO
EXEC SqlGraph.Company$Insert @Name = 'node3305', @ParentCompanyName = 'node1455'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node3305'
GO
EXEC SqlGraph.Company$Insert @Name = 'node3330', @ParentCompanyName = 'node1478'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node3330'
GO
EXEC SqlGraph.Company$Insert @Name = 'node3269', @ParentCompanyName = 'node1486'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node3269'
GO
EXEC SqlGraph.Company$Insert @Name = 'node3299', @ParentCompanyName = 'node1486'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node3299'
GO
EXEC SqlGraph.Company$Insert @Name = 'node3103', @ParentCompanyName = 'node1487'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node3103'
GO
EXEC SqlGraph.Company$Insert @Name = 'node3271', @ParentCompanyName = 'node1489'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node3271'
GO
EXEC SqlGraph.Company$Insert @Name = 'node3343', @ParentCompanyName = 'node1500'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node3343'
GO
EXEC SqlGraph.Company$Insert @Name = 'node3254', @ParentCompanyName = 'node1501'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node3254'
GO
EXEC SqlGraph.Company$Insert @Name = 'node3293', @ParentCompanyName = 'node1502'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node3293'
GO
EXEC SqlGraph.Company$Insert @Name = 'node3313', @ParentCompanyName = 'node1506'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node3313'
GO
EXEC SqlGraph.Company$Insert @Name = 'node3250', @ParentCompanyName = 'node1510'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node3250'
GO
EXEC SqlGraph.Company$Insert @Name = 'node3132', @ParentCompanyName = 'node1515'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node3132'
GO
EXEC SqlGraph.Company$Insert @Name = 'node3115', @ParentCompanyName = 'node1519'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node3115'
GO
EXEC SqlGraph.Company$Insert @Name = 'node3108', @ParentCompanyName = 'node1521'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node3108'
GO
EXEC SqlGraph.Company$Insert @Name = 'node3280', @ParentCompanyName = 'node1541'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node3280'
GO
EXEC SqlGraph.Company$Insert @Name = 'node3331', @ParentCompanyName = 'node1543'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node3331'
GO
EXEC SqlGraph.Company$Insert @Name = 'node3310', @ParentCompanyName = 'node1556'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node3310'
GO
EXEC SqlGraph.Company$Insert @Name = 'node3107', @ParentCompanyName = 'node1567'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node3107'
GO
EXEC SqlGraph.Company$Insert @Name = 'node3220', @ParentCompanyName = 'node1569'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node3220'
GO
EXEC SqlGraph.Company$Insert @Name = 'node3226', @ParentCompanyName = 'node1570'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node3226'
GO
EXEC SqlGraph.Company$Insert @Name = 'node3321', @ParentCompanyName = 'node1575'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node3321'
GO
EXEC SqlGraph.Company$Insert @Name = 'node3204', @ParentCompanyName = 'node1577'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node3204'
GO
EXEC SqlGraph.Company$Insert @Name = 'node3181', @ParentCompanyName = 'node1583'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node3181'
GO
EXEC SqlGraph.Company$Insert @Name = 'node3134', @ParentCompanyName = 'node1591'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node3134'
GO
EXEC SqlGraph.Company$Insert @Name = 'node3300', @ParentCompanyName = 'node1595'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node3300'
GO
EXEC SqlGraph.Company$Insert @Name = 'node3288', @ParentCompanyName = 'node1608'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node3288'
GO
EXEC SqlGraph.Company$Insert @Name = 'node3332', @ParentCompanyName = 'node1610'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node3332'
GO
EXEC SqlGraph.Company$Insert @Name = 'node3292', @ParentCompanyName = 'node1615'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node3292'
GO
EXEC SqlGraph.Company$Insert @Name = 'node3348', @ParentCompanyName = 'node1629'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node3348'
GO
EXEC SqlGraph.Company$Insert @Name = 'node3311', @ParentCompanyName = 'node1636'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node3311'
GO
EXEC SqlGraph.Company$Insert @Name = 'node3135', @ParentCompanyName = 'node1653'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node3135'
GO
EXEC SqlGraph.Company$Insert @Name = 'node3231', @ParentCompanyName = 'node1659'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node3231'
GO
EXEC SqlGraph.Company$Insert @Name = 'node3192', @ParentCompanyName = 'node1662'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node3192'
GO
EXEC SqlGraph.Company$Insert @Name = 'node3144', @ParentCompanyName = 'node1663'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node3144'
GO
EXEC SqlGraph.Company$Insert @Name = 'node3342', @ParentCompanyName = 'node1679'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node3342'
GO
EXEC SqlGraph.Company$Insert @Name = 'node3253', @ParentCompanyName = 'node1680'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node3253'
GO
EXEC SqlGraph.Company$Insert @Name = 'node3397', @ParentCompanyName = 'node1690'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node3397'
GO
EXEC SqlGraph.Company$Insert @Name = 'node3148', @ParentCompanyName = 'node1691'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node3148'
GO
EXEC SqlGraph.Company$Insert @Name = 'node3203', @ParentCompanyName = 'node1694'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node3203'
GO
EXEC SqlGraph.Company$Insert @Name = 'node3307', @ParentCompanyName = 'node1696'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node3307'
GO
EXEC SqlGraph.Company$Insert @Name = 'node3232', @ParentCompanyName = 'node1698'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node3232'
GO
EXEC SqlGraph.Company$Insert @Name = 'node3239', @ParentCompanyName = 'node1706'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node3239'
GO
EXEC SqlGraph.Company$Insert @Name = 'node3324', @ParentCompanyName = 'node1710'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node3324'
GO
EXEC SqlGraph.Company$Insert @Name = 'node3354', @ParentCompanyName = 'node1711'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node3354'
GO
EXEC SqlGraph.Company$Insert @Name = 'node3233', @ParentCompanyName = 'node1721'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node3233'
GO
EXEC SqlGraph.Company$Insert @Name = 'node3314', @ParentCompanyName = 'node1726'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node3314'
GO
EXEC SqlGraph.Company$Insert @Name = 'node3363', @ParentCompanyName = 'node1732'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node3363'
GO
EXEC SqlGraph.Company$Insert @Name = 'node3125', @ParentCompanyName = 'node1735'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node3125'
GO
EXEC SqlGraph.Company$Insert @Name = 'node3196', @ParentCompanyName = 'node1744'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node3196'
GO
EXEC SqlGraph.Company$Insert @Name = 'node3166', @ParentCompanyName = 'node1752'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node3166'
GO
EXEC SqlGraph.Company$Insert @Name = 'node3296', @ParentCompanyName = 'node1759'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node3296'
GO
EXEC SqlGraph.Company$Insert @Name = 'node3149', @ParentCompanyName = 'node1771'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node3149'
GO
EXEC SqlGraph.Company$Insert @Name = 'node3223', @ParentCompanyName = 'node1773'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node3223'
GO
EXEC SqlGraph.Company$Insert @Name = 'node3246', @ParentCompanyName = 'node1773'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node3246'
GO
EXEC SqlGraph.Company$Insert @Name = 'node3173', @ParentCompanyName = 'node1774'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node3173'
GO
EXEC SqlGraph.Company$Insert @Name = 'node3369', @ParentCompanyName = 'node1774'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node3369'
GO
EXEC SqlGraph.Company$Insert @Name = 'node3360', @ParentCompanyName = 'node1779'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node3360'
GO
EXEC SqlGraph.Company$Insert @Name = 'node3394', @ParentCompanyName = 'node1784'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node3394'
GO
EXEC SqlGraph.Company$Insert @Name = 'node3235', @ParentCompanyName = 'node1786'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node3235'
GO
EXEC SqlGraph.Company$Insert @Name = 'node3195', @ParentCompanyName = 'node1793'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node3195'
GO
EXEC SqlGraph.Company$Insert @Name = 'node3278', @ParentCompanyName = 'node1794'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node3278'
GO
EXEC SqlGraph.Company$Insert @Name = 'node3375', @ParentCompanyName = 'node1796'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node3375'
GO
EXEC SqlGraph.Company$Insert @Name = 'node3221', @ParentCompanyName = 'node1798'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node3221'
GO
EXEC SqlGraph.Company$Insert @Name = 'node3201', @ParentCompanyName = 'node1807'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node3201'
GO
EXEC SqlGraph.Company$Insert @Name = 'node3109', @ParentCompanyName = 'node1810'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node3109'
GO
EXEC SqlGraph.Company$Insert @Name = 'node3390', @ParentCompanyName = 'node1824'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node3390'
GO
EXEC SqlGraph.Company$Insert @Name = 'node3371', @ParentCompanyName = 'node1828'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node3371'
GO
EXEC SqlGraph.Company$Insert @Name = 'node3160', @ParentCompanyName = 'node1851'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node3160'
GO
EXEC SqlGraph.Company$Insert @Name = 'node3224', @ParentCompanyName = 'node1851'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node3224'
GO
EXEC SqlGraph.Company$Insert @Name = 'node3120', @ParentCompanyName = 'node1856'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node3120'
GO
EXEC SqlGraph.Company$Insert @Name = 'node3349', @ParentCompanyName = 'node1858'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node3349'
GO
EXEC SqlGraph.Company$Insert @Name = 'node3238', @ParentCompanyName = 'node1864'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node3238'
GO
EXEC SqlGraph.Company$Insert @Name = 'node3240', @ParentCompanyName = 'node1868'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node3240'
GO
EXEC SqlGraph.Company$Insert @Name = 'node3391', @ParentCompanyName = 'node1869'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node3391'
GO
EXEC SqlGraph.Company$Insert @Name = 'node3286', @ParentCompanyName = 'node1876'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node3286'
GO
EXEC SqlGraph.Company$Insert @Name = 'node3316', @ParentCompanyName = 'node1887'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node3316'
GO
EXEC SqlGraph.Company$Insert @Name = 'node3157', @ParentCompanyName = 'node1892'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node3157'
GO
EXEC SqlGraph.Company$Insert @Name = 'node3191', @ParentCompanyName = 'node1899'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node3191'
GO
EXEC SqlGraph.Company$Insert @Name = 'node3179', @ParentCompanyName = 'node1907'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node3179'
GO
EXEC SqlGraph.Company$Insert @Name = 'node3308', @ParentCompanyName = 'node1908'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node3308'
GO
EXEC SqlGraph.Company$Insert @Name = 'node3212', @ParentCompanyName = 'node1914'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node3212'
GO
EXEC SqlGraph.Company$Insert @Name = 'node3104', @ParentCompanyName = 'node1932'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node3104'
GO
EXEC SqlGraph.Company$Insert @Name = 'node3156', @ParentCompanyName = 'node1944'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node3156'
GO
EXEC SqlGraph.Company$Insert @Name = 'node3197', @ParentCompanyName = 'node1949'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node3197'
GO
EXEC SqlGraph.Company$Insert @Name = 'node3110', @ParentCompanyName = 'node1953'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node3110'
GO
EXEC SqlGraph.Company$Insert @Name = 'node3178', @ParentCompanyName = 'node1957'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node3178'
GO
EXEC SqlGraph.Company$Insert @Name = 'node3117', @ParentCompanyName = 'node1973'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node3117'
GO
EXEC SqlGraph.Company$Insert @Name = 'node3119', @ParentCompanyName = 'node1975'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node3119'
GO
EXEC SqlGraph.Company$Insert @Name = 'node3189', @ParentCompanyName = 'node1980'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node3189'
GO
EXEC SqlGraph.Company$Insert @Name = 'node3352', @ParentCompanyName = 'node1980'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node3352'
GO
EXEC SqlGraph.Company$Insert @Name = 'node3303', @ParentCompanyName = 'node1990'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node3303'
GO
EXEC SqlGraph.Company$Insert @Name = 'node3207', @ParentCompanyName = 'node1995'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node3207'
GO
EXEC SqlGraph.Company$Insert @Name = 'node3328', @ParentCompanyName = 'node2003'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node3328'
GO
EXEC SqlGraph.Company$Insert @Name = 'node3182', @ParentCompanyName = 'node2007'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node3182'
GO
EXEC SqlGraph.Company$Insert @Name = 'node3227', @ParentCompanyName = 'node2041'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node3227'
GO
EXEC SqlGraph.Company$Insert @Name = 'node3274', @ParentCompanyName = 'node2060'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node3274'
GO
EXEC SqlGraph.Company$Insert @Name = 'node3170', @ParentCompanyName = 'node2062'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node3170'
GO
EXEC SqlGraph.Company$Insert @Name = 'node3215', @ParentCompanyName = 'node2074'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node3215'
GO
EXEC SqlGraph.Company$Insert @Name = 'node3385', @ParentCompanyName = 'node2080'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node3385'
GO
EXEC SqlGraph.Company$Insert @Name = 'node3245', @ParentCompanyName = 'node2087'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node3245'
GO
EXEC SqlGraph.Company$Insert @Name = 'node3338', @ParentCompanyName = 'node2088'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node3338'
GO
EXEC SqlGraph.Company$Insert @Name = 'node3230', @ParentCompanyName = 'node2100'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node3230'
GO
EXEC SqlGraph.Company$Insert @Name = 'node3327', @ParentCompanyName = 'node2113'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node3327'
GO
EXEC SqlGraph.Company$Insert @Name = 'node3387', @ParentCompanyName = 'node2120'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node3387'
GO
EXEC SqlGraph.Company$Insert @Name = 'node3380', @ParentCompanyName = 'node2123'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node3380'
GO
EXEC SqlGraph.Company$Insert @Name = 'node3124', @ParentCompanyName = 'node2138'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node3124'
GO
EXEC SqlGraph.Company$Insert @Name = 'node3378', @ParentCompanyName = 'node2140'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node3378'
GO
EXEC SqlGraph.Company$Insert @Name = 'node3262', @ParentCompanyName = 'node2141'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node3262'
GO
EXEC SqlGraph.Company$Insert @Name = 'node3259', @ParentCompanyName = 'node2144'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node3259'
GO
EXEC SqlGraph.Company$Insert @Name = 'node3370', @ParentCompanyName = 'node2148'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node3370'
GO
EXEC SqlGraph.Company$Insert @Name = 'node3281', @ParentCompanyName = 'node2164'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node3281'
GO
EXEC SqlGraph.Company$Insert @Name = 'node3287', @ParentCompanyName = 'node2174'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node3287'
GO
EXEC SqlGraph.Company$Insert @Name = 'node3263', @ParentCompanyName = 'node2178'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node3263'
GO
EXEC SqlGraph.Company$Insert @Name = 'node3399', @ParentCompanyName = 'node2185'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node3399'
GO
EXEC SqlGraph.Company$Insert @Name = 'node3113', @ParentCompanyName = 'node2186'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node3113'
GO
EXEC SqlGraph.Company$Insert @Name = 'node3361', @ParentCompanyName = 'node2189'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node3361'
GO
EXEC SqlGraph.Company$Insert @Name = 'node3365', @ParentCompanyName = 'node2191'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node3365'
GO
EXEC SqlGraph.Company$Insert @Name = 'node3379', @ParentCompanyName = 'node2195'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node3379'
GO
EXEC SqlGraph.Company$Insert @Name = 'node3282', @ParentCompanyName = 'node2196'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node3282'
GO
EXEC SqlGraph.Company$Insert @Name = 'node3222', @ParentCompanyName = 'node2197'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node3222'
GO
EXEC SqlGraph.Company$Insert @Name = 'node3143', @ParentCompanyName = 'node2199'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node3143'
GO
EXEC SqlGraph.Company$Insert @Name = 'node3318', @ParentCompanyName = 'node2208'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node3318'
GO
EXEC SqlGraph.Company$Insert @Name = 'node3183', @ParentCompanyName = 'node2213'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node3183'
GO
EXEC SqlGraph.Company$Insert @Name = 'node3392', @ParentCompanyName = 'node2226'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node3392'
GO
EXEC SqlGraph.Company$Insert @Name = 'node3225', @ParentCompanyName = 'node2239'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node3225'
GO
EXEC SqlGraph.Company$Insert @Name = 'node3353', @ParentCompanyName = 'node2244'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node3353'
GO
EXEC SqlGraph.Company$Insert @Name = 'node3400', @ParentCompanyName = 'node2263'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node3400'
GO
EXEC SqlGraph.Company$Insert @Name = 'node3364', @ParentCompanyName = 'node2274'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node3364'
GO
EXEC SqlGraph.Company$Insert @Name = 'node3340', @ParentCompanyName = 'node2285'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node3340'
GO
EXEC SqlGraph.Company$Insert @Name = 'node3131', @ParentCompanyName = 'node2294'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node3131'
GO
EXEC SqlGraph.Company$Insert @Name = 'node3122', @ParentCompanyName = 'node2298'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node3122'
GO
EXEC SqlGraph.Company$Insert @Name = 'node3102', @ParentCompanyName = 'node2323'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node3102'
GO
EXEC SqlGraph.Company$Insert @Name = 'node3317', @ParentCompanyName = 'node2332'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node3317'
GO
EXEC SqlGraph.Company$Insert @Name = 'node3301', @ParentCompanyName = 'node2334'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node3301'
GO
EXEC SqlGraph.Company$Insert @Name = 'node3358', @ParentCompanyName = 'node2335'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node3358'
GO
EXEC SqlGraph.Company$Insert @Name = 'node3389', @ParentCompanyName = 'node2335'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node3389'
GO
EXEC SqlGraph.Company$Insert @Name = 'node3175', @ParentCompanyName = 'node2339'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node3175'
GO
EXEC SqlGraph.Company$Insert @Name = 'node3247', @ParentCompanyName = 'node2343'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node3247'
GO
EXEC SqlGraph.Company$Insert @Name = 'node3139', @ParentCompanyName = 'node2354'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node3139'
GO
EXEC SqlGraph.Company$Insert @Name = 'node3386', @ParentCompanyName = 'node2355'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node3386'
GO
EXEC SqlGraph.Company$Insert @Name = 'node3357', @ParentCompanyName = 'node2356'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node3357'
GO
EXEC SqlGraph.Company$Insert @Name = 'node3219', @ParentCompanyName = 'node2367'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node3219'
GO
EXEC SqlGraph.Company$Insert @Name = 'node3172', @ParentCompanyName = 'node2381'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node3172'
GO
EXEC SqlGraph.Company$Insert @Name = 'node3264', @ParentCompanyName = 'node2392'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node3264'
GO
EXEC SqlGraph.Company$Insert @Name = 'node3159', @ParentCompanyName = 'node2410'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node3159'
GO
EXEC SqlGraph.Company$Insert @Name = 'node3341', @ParentCompanyName = 'node2416'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node3341'
GO
EXEC SqlGraph.Company$Insert @Name = 'node3164', @ParentCompanyName = 'node2419'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node3164'
GO
EXEC SqlGraph.Company$Insert @Name = 'node3258', @ParentCompanyName = 'node2431'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node3258'
GO
EXEC SqlGraph.Company$Insert @Name = 'node3111', @ParentCompanyName = 'node2439'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node3111'
GO
EXEC SqlGraph.Company$Insert @Name = 'node3266', @ParentCompanyName = 'node2450'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node3266'
GO
EXEC SqlGraph.Company$Insert @Name = 'node3112', @ParentCompanyName = 'node2451'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node3112'
GO
EXEC SqlGraph.Company$Insert @Name = 'node3241', @ParentCompanyName = 'node2451'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node3241'
GO
EXEC SqlGraph.Company$Insert @Name = 'node3129', @ParentCompanyName = 'node2453'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node3129'
GO
EXEC SqlGraph.Company$Insert @Name = 'node3279', @ParentCompanyName = 'node2455'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node3279'
GO
EXEC SqlGraph.Company$Insert @Name = 'node3275', @ParentCompanyName = 'node2466'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node3275'
GO
EXEC SqlGraph.Company$Insert @Name = 'node3105', @ParentCompanyName = 'node2471'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node3105'
GO
EXEC SqlGraph.Company$Insert @Name = 'node3285', @ParentCompanyName = 'node2474'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node3285'
GO
EXEC SqlGraph.Company$Insert @Name = 'node3265', @ParentCompanyName = 'node2486'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node3265'
GO
EXEC SqlGraph.Company$Insert @Name = 'node3312', @ParentCompanyName = 'node2489'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node3312'
GO
EXEC SqlGraph.Company$Insert @Name = 'node3202', @ParentCompanyName = 'node2492'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node3202'
GO
EXEC SqlGraph.Company$Insert @Name = 'node3217', @ParentCompanyName = 'node2495'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node3217'
GO
EXEC SqlGraph.Company$Insert @Name = 'node3142', @ParentCompanyName = 'node2502'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node3142'
GO
EXEC SqlGraph.Company$Insert @Name = 'node3211', @ParentCompanyName = 'node2503'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node3211'
GO
EXEC SqlGraph.Company$Insert @Name = 'node3298', @ParentCompanyName = 'node2508'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node3298'
GO
EXEC SqlGraph.Company$Insert @Name = 'node3167', @ParentCompanyName = 'node2516'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node3167'
GO
EXEC SqlGraph.Company$Insert @Name = 'node3210', @ParentCompanyName = 'node2517'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node3210'
GO
EXEC SqlGraph.Company$Insert @Name = 'node3257', @ParentCompanyName = 'node2522'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node3257'
GO
EXEC SqlGraph.Company$Insert @Name = 'node3161', @ParentCompanyName = 'node2523'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node3161'
GO
EXEC SqlGraph.Company$Insert @Name = 'node3356', @ParentCompanyName = 'node2526'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node3356'
GO
EXEC SqlGraph.Company$Insert @Name = 'node3366', @ParentCompanyName = 'node2546'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node3366'
GO
EXEC SqlGraph.Company$Insert @Name = 'node3116', @ParentCompanyName = 'node2555'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node3116'
GO
EXEC SqlGraph.Company$Insert @Name = 'node3291', @ParentCompanyName = 'node2555'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node3291'
GO
EXEC SqlGraph.Company$Insert @Name = 'node3155', @ParentCompanyName = 'node2559'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node3155'
GO
EXEC SqlGraph.Company$Insert @Name = 'node3147', @ParentCompanyName = 'node2561'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node3147'
GO
EXEC SqlGraph.Company$Insert @Name = 'node3121', @ParentCompanyName = 'node2566'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node3121'
GO
EXEC SqlGraph.Company$Insert @Name = 'node3295', @ParentCompanyName = 'node2567'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node3295'
GO
EXEC SqlGraph.Company$Insert @Name = 'node3276', @ParentCompanyName = 'node2573'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node3276'
GO
EXEC SqlGraph.Company$Insert @Name = 'node3355', @ParentCompanyName = 'node2588'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node3355'
GO
EXEC SqlGraph.Company$Insert @Name = 'node3359', @ParentCompanyName = 'node2594'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node3359'
GO
EXEC SqlGraph.Company$Insert @Name = 'node3344', @ParentCompanyName = 'node2598'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node3344'
GO
EXEC SqlGraph.Company$Insert @Name = 'node3350', @ParentCompanyName = 'node2601'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node3350'
GO
EXEC SqlGraph.Company$Insert @Name = 'node3304', @ParentCompanyName = 'node2613'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node3304'
GO
EXEC SqlGraph.Company$Insert @Name = 'node3322', @ParentCompanyName = 'node2629'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node3322'
GO
EXEC SqlGraph.Company$Insert @Name = 'node3323', @ParentCompanyName = 'node2630'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node3323'
GO
EXEC SqlGraph.Company$Insert @Name = 'node3188', @ParentCompanyName = 'node2637'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node3188'
GO
EXEC SqlGraph.Company$Insert @Name = 'node3228', @ParentCompanyName = 'node2637'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node3228'
GO
EXEC SqlGraph.Company$Insert @Name = 'node3384', @ParentCompanyName = 'node2645'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node3384'
GO
EXEC SqlGraph.Company$Insert @Name = 'node3171', @ParentCompanyName = 'node2654'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node3171'
GO
EXEC SqlGraph.Company$Insert @Name = 'node3151', @ParentCompanyName = 'node2677'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node3151'
GO
EXEC SqlGraph.Company$Insert @Name = 'node3382', @ParentCompanyName = 'node2684'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node3382'
GO
EXEC SqlGraph.Company$Insert @Name = 'node3290', @ParentCompanyName = 'node2689'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node3290'
GO
EXEC SqlGraph.Company$Insert @Name = 'node3127', @ParentCompanyName = 'node2690'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node3127'
GO
EXEC SqlGraph.Company$Insert @Name = 'node3118', @ParentCompanyName = 'node2695'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node3118'
GO
EXEC SqlGraph.Company$Insert @Name = 'node3168', @ParentCompanyName = 'node2712'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node3168'
GO
EXEC SqlGraph.Company$Insert @Name = 'node3126', @ParentCompanyName = 'node2727'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node3126'
GO
EXEC SqlGraph.Company$Insert @Name = 'node3256', @ParentCompanyName = 'node2728'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node3256'
GO
EXEC SqlGraph.Company$Insert @Name = 'node3334', @ParentCompanyName = 'node2734'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node3334'
GO
EXEC SqlGraph.Company$Insert @Name = 'node3208', @ParentCompanyName = 'node2743'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node3208'
GO
EXEC SqlGraph.Company$Insert @Name = 'node3294', @ParentCompanyName = 'node2765'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node3294'
GO
EXEC SqlGraph.Company$Insert @Name = 'node3289', @ParentCompanyName = 'node2772'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node3289'
GO
EXEC SqlGraph.Company$Insert @Name = 'node3138', @ParentCompanyName = 'node2782'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node3138'
GO
EXEC SqlGraph.Company$Insert @Name = 'node3234', @ParentCompanyName = 'node2802'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node3234'
GO
EXEC SqlGraph.Company$Insert @Name = 'node3339', @ParentCompanyName = 'node2804'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node3339'
GO
EXEC SqlGraph.Company$Insert @Name = 'node3158', @ParentCompanyName = 'node2814'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node3158'
GO
EXEC SqlGraph.Company$Insert @Name = 'node3362', @ParentCompanyName = 'node2818'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node3362'
GO
EXEC SqlGraph.Company$Insert @Name = 'node3393', @ParentCompanyName = 'node2819'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node3393'
GO
EXEC SqlGraph.Company$Insert @Name = 'node3261', @ParentCompanyName = 'node2822'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node3261'
GO
EXEC SqlGraph.Company$Insert @Name = 'node3186', @ParentCompanyName = 'node2829'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node3186'
GO
EXEC SqlGraph.Company$Insert @Name = 'node3180', @ParentCompanyName = 'node2840'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node3180'
GO
EXEC SqlGraph.Company$Insert @Name = 'node3268', @ParentCompanyName = 'node2840'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node3268'
GO
EXEC SqlGraph.Company$Insert @Name = 'node3244', @ParentCompanyName = 'node2846'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node3244'
GO
EXEC SqlGraph.Company$Insert @Name = 'node3270', @ParentCompanyName = 'node2893'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node3270'
GO
EXEC SqlGraph.Company$Insert @Name = 'node3319', @ParentCompanyName = 'node2895'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node3319'
GO
EXEC SqlGraph.Company$Insert @Name = 'node3267', @ParentCompanyName = 'node2898'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node3267'
GO
EXEC SqlGraph.Company$Insert @Name = 'node3302', @ParentCompanyName = 'node2905'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node3302'
GO
EXEC SqlGraph.Company$Insert @Name = 'node3146', @ParentCompanyName = 'node2912'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node3146'
GO
EXEC SqlGraph.Company$Insert @Name = 'node3140', @ParentCompanyName = 'node2933'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node3140'
GO
EXEC SqlGraph.Company$Insert @Name = 'node3377', @ParentCompanyName = 'node2947'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node3377'
GO
EXEC SqlGraph.Company$Insert @Name = 'node3150', @ParentCompanyName = 'node2957'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node3150'
GO
EXEC SqlGraph.Company$Insert @Name = 'node3236', @ParentCompanyName = 'node2957'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node3236'
GO
EXEC SqlGraph.Company$Insert @Name = 'node3154', @ParentCompanyName = 'node2969'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node3154'
GO
EXEC SqlGraph.Company$Insert @Name = 'node3272', @ParentCompanyName = 'node2969'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node3272'
GO
EXEC SqlGraph.Company$Insert @Name = 'node3213', @ParentCompanyName = 'node2973'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node3213'
GO
EXEC SqlGraph.Company$Insert @Name = 'node3152', @ParentCompanyName = 'node2999'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node3152'
GO
EXEC SqlGraph.Company$Insert @Name = 'node3251', @ParentCompanyName = 'node2999'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node3251'
GO
EXEC SqlGraph.Company$Insert @Name = 'node3153', @ParentCompanyName = 'node3003'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node3153'
GO
EXEC SqlGraph.Company$Insert @Name = 'node3273', @ParentCompanyName = 'node3005'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node3273'
GO
EXEC SqlGraph.Company$Insert @Name = 'node3176', @ParentCompanyName = 'node3006'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node3176'
GO
EXEC SqlGraph.Company$Insert @Name = 'node3128', @ParentCompanyName = 'node3011'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node3128'
GO
EXEC SqlGraph.Company$Insert @Name = 'node3169', @ParentCompanyName = 'node3012'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node3169'
GO
EXEC SqlGraph.Company$Insert @Name = 'node3333', @ParentCompanyName = 'node3024'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node3333'
GO
EXEC SqlGraph.Company$Insert @Name = 'node3277', @ParentCompanyName = 'node3025'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node3277'
GO
EXEC SqlGraph.Company$Insert @Name = 'node3174', @ParentCompanyName = 'node3027'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node3174'
GO
EXEC SqlGraph.Company$Insert @Name = 'node3199', @ParentCompanyName = 'node3035'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node3199'
GO
EXEC SqlGraph.Company$Insert @Name = 'node3216', @ParentCompanyName = 'node3040'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node3216'
GO
EXEC SqlGraph.Company$Insert @Name = 'node3260', @ParentCompanyName = 'node3043'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node3260'
GO
EXEC SqlGraph.Company$Insert @Name = 'node3376', @ParentCompanyName = 'node3046'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node3376'
GO
EXEC SqlGraph.Company$Insert @Name = 'node3184', @ParentCompanyName = 'node3049'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node3184'
GO
EXEC SqlGraph.Company$Insert @Name = 'node3309', @ParentCompanyName = 'node3052'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node3309'
GO
EXEC SqlGraph.Company$Insert @Name = 'node3185', @ParentCompanyName = 'node3062'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node3185'
GO
EXEC SqlGraph.Company$Insert @Name = 'node3388', @ParentCompanyName = 'node3062'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node3388'
GO
EXEC SqlGraph.Company$Insert @Name = 'node3396', @ParentCompanyName = 'node3063'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node3396'
GO
EXEC SqlGraph.Company$Insert @Name = 'node3205', @ParentCompanyName = 'node3065'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node3205'
GO
EXEC SqlGraph.Company$Insert @Name = 'node3315', @ParentCompanyName = 'node3073'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node3315'
GO
EXEC SqlGraph.Company$Insert @Name = 'node3137', @ParentCompanyName = 'node3082'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node3137'
GO
EXEC SqlGraph.Company$Insert @Name = 'node3347', @ParentCompanyName = 'node3085'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node3347'
GO
EXEC SqlGraph.Company$Insert @Name = 'node3206', @ParentCompanyName = 'node3086'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node3206'
GO
EXEC SqlGraph.Company$Insert @Name = 'node3398', @ParentCompanyName = 'node3097'
GO
EXEC SqlGraph.Sale$InsertTestData @Name = 'node3398'
GO


---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

INSERT INTO #holdTiming (CheckInTime)
SELECT GETDATE() AS CheckInTime
GO
SELECT CONCAT(DATEDIFF(millisecond,MIN(CheckInTime), MAX(CheckInTime)) / 1000.0,' Seconds')
from #holdTiming

INSERT INTO SqlGraph.DataSetStats(TestSetName, CompanyCount)
SELECT 'LargeSet',COUNT(*)
FROM   SqlGraph.Company;
GO
SELECT *
from   SqlGraph.DataSetStats;