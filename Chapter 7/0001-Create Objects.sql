


Use BillOfMaterialsExample;
GO

DROP TABLE IF EXISTS PartsSystem.Includes;
DROP TABLE IF EXISTS PartsSystem.Part;
DROP SCHEMA IF EXISTS PartsSystem;
GO

CREATE SCHEMA PartsSystem;
GO


CREATE TABLE PartsSystem.Part(
	PartId	int NOT NULL IDENTITY
		CONSTRAINT PKPart PRIMARY KEY,
	PartName  nvarchar(30) NOT NULL 
	         CONSTRAINT AKPart UNIQUE
) as NODE;

CREATE TABLE PartsSystem.Includes
(
	IncludeCount int NOT NULL,
	CONSTRAINT AKIncludes_UniqueParts UNIQUE
					($from_id, $to_id),
	CONSTRAINT ECIncludes CONNECTION (PartsSystem.Part to PartsSystem.Part)
) AS EDGE;
GO

--our main condition is no cycles. This basic trigger will check for that.
CREATE TRIGGER PartsSystem.Includes$InsertUpdateTrigger
ON PartsSystem.Includes
AFTER INSERT, UPDATE
AS
 BEGIN
	SET NOCOUNT ON
	--Simplest case, a self relationship
	IF EXISTS (SELECT *
			   FROM   Inserted
			   WHERE  Inserted.$from_id = Inserted.$to_id)
	  THROW 50000,'No self relationships allowed',1;

	--look for cycles by checking to see if there is any 
	--item where the connected item matches the itemName
	DECLARE @CycleFoundFlag BIT = 0;
	WITH BaseRows AS (
	SELECT Part.PartId,  
		  LAST_VALUE(IncludedPart.PartId) WITHIN GROUP (GRAPH PATH)
													AS IncludedPartId
	FROM   PartsSystem.Part AS Part,
		   PartsSystem.Includes FOR PATH AS Includes,
		   PartsSystem.Part FOR PATH AS IncludedPart
	WHERE  MATCH(SHORTEST_PATH(Part(-(Includes)->IncludedPart)+))
	)
	SELECT @CycleFoundFlag = 1
	FROM   BaseRows
	WHERE  PartId = IncludedPartId

	IF @CycleFoundFlag = 1
	 THROW 50000, 'The data entered causes a cyclic relationship',1;
 END;
 GO

 --standard interface view parts to make the queries simple
 IF NOT EXISTS (SELECT * FROM sys.schemas WHERE schemas.Name = 'PartsSystem_UI')
EXECUTE ('CREATE SCHEMA PartsSystem_UI')
GO
CREATE OR ALTER VIEW PartsSystem_UI.Part_Includes_Part
AS
SELECT Part.PartName, Includes.IncludeCount, IncludesPart.PartName as IncludesPartName
FROM   PartsSystem.Part, PartsSystem.Includes,PartsSystem.Part as IncludesPart
WHERE MATCH(Part-(Includes)->IncludesPart)
GO

CREATE OR ALTER TRIGGER PartsSystem_UI.Part_Includes_Part$InsteadOfInsertTrigger
ON PartsSystem_UI.Part_Includes_Part
INSTEAD OF INSERT
AS
SET NOCOUNT ON
  BEGIN
   INSERT INTO PartsSystem.Includes($from_id, $to_id, IncludeCount)
   SELECT Part.$node_id, IncludesPart.$node_id, IncludeCount
   FROM Inserted
         LEFT JOIN PartsSystem.Part
                ON Part.PartName = Inserted.PartName
         LEFT JOIN PartsSystem.Part AS IncludesPart
                ON IncludesPart.PartName = Inserted.IncludesPartName;
   END;
GO
CREATE OR ALTER TRIGGER PartsSystem_UI.Part_IncludesPart$InsteadOfDeleteTrigger
ON PartsSystem_UI.Part_Includes_Part
INSTEAD OF UPDATE
AS
SET NOCOUNT ON
  BEGIN
       DELETE FROM PartsSystem.Includes
       FROM deleted, PartsSystem.Part,
              PartsSystem.Includes,
              PartsSystem.Part AS IncludesPart
       WHERE MATCH(Part-(Includes)->IncludesPart)
		  AND deleted.PartName = Part.PartName
		  AND deleted.PartName = IncludesPart.PartName

   INSERT INTO PartsSystem.Includes($from_id, $to_id, IncludeCount)
   SELECT Part.$node_id, IncludesPart.$node_id, IncludeCount
   FROM Inserted
         LEFT JOIN PartsSystem.Part
                ON Part.PartName = Inserted.PartName
         LEFT JOIN PartsSystem.Part AS IncludesPart
                ON IncludesPart.PartName = Inserted.IncludesPartName;
   END;
GO

CREATE OR ALTER TRIGGER PartsSystem_UI.Item_Includes_Item$InsteadOfDeleteTrigger
ON PartsSystem_UI.Part_Includes_Part
INSTEAD OF DELETE
AS
SET NOCOUNT ON
  BEGIN
       DELETE FROM PartsSystem.Includes
       FROM deleted, PartsSystem.Part,
              PartsSystem.Includes,
              PartsSystem.Part AS IncludesPart
       WHERE MATCH(Part-(Includes)->IncludesPart)
		  AND deleted.PartName = Part.PartName
		  AND deleted.PartName = IncludesPart.PartName;
   END;
GO