Use BillOfMaterialsExample;
GO

SET NOCOUNT ON;
DELETE FROM PartsSystem.Includes;
DELETE FROM PartsSystem.Part;

INSERT INTO PartsSystem.Part(PartName)
VALUES ('Shelvii')
INSERT INTO PartsSystem.Part(PartName)
VALUES ('Shelf Set');
INSERT INTO PartsSystem.Part(PartName)
VALUES ('Shelvii Shelf Enhancer');
INSERT INTO PartsSystem.Part(PartName)
VALUES ('Flat Shelf')
INSERT INTO PartsSystem.Part(PartName)
VALUES ('Shelvii Side');
INSERT INTO PartsSystem.Part(PartName)
VALUES ('Small Wooden Dowel Pack');
INSERT INTO PartsSystem.Part(PartName)
VALUES ('Wooden Dowel');
INSERT INTO PartsSystem.Part(PartName)
VALUES ('Small Screw Pack')
INSERT INTO PartsSystem.Part(PartName)
VALUES ('Small Screw')
GO


INSERT INTO PartsSystem_UI.Part_Includes_Part(PartName, IncludeCount, IncludesPartName)
VALUES ('Shelvii', 3, 'Shelf Set');
INSERT INTO PartsSystem_UI.Part_Includes_Part(PartName, IncludeCount, IncludesPartName)
VALUES ('Shelvii', 2, 'Flat Shelf');
INSERT INTO PartsSystem_UI.Part_Includes_Part(PartName, IncludeCount, IncludesPartName)
VALUES ('Shelvii', 5,  'Small Wooden Dowel Pack');
INSERT INTO PartsSystem_UI.Part_Includes_Part(PartName, IncludeCount, IncludesPartName)
VALUES ('Shelvii', 2, 'Shelvii Side');
INSERT INTO PartsSystem_UI.Part_Includes_Part(PartName, IncludeCount, IncludesPartName)
VALUES ('Shelvii', 2, 'Small Screw Pack');

INSERT INTO PartsSystem_UI.Part_Includes_Part(PartName, IncludeCount, IncludesPartName)
VALUES ('Shelf Set', 2, 'Shelvii Shelf Enhancer');
INSERT INTO PartsSystem_UI.Part_Includes_Part(PartName, IncludeCount, IncludesPartName)
VALUES ('Shelf Set', 1, 'Flat Shelf');
INSERT INTO PartsSystem_UI.Part_Includes_Part(PartName, IncludeCount, IncludesPartName)
VALUES ('Shelf Set', 3, 'Small Screw Pack');

INSERT INTO PartsSystem_UI.Part_Includes_Part(PartName, IncludeCount, IncludesPartName)
VALUES ('Small Screw Pack', 3, 'Small Screw');

INSERT INTO PartsSystem_UI.Part_Includes_Part(PartName, IncludeCount, IncludesPartName)
VALUES ('Small Wooden Dowel Pack', 3, 'Wooden Dowel');

GO
SELECT * 
FROM   PartsSystem_UI.Part_Includes_Part;

