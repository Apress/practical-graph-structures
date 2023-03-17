--SELECT *
--FROM   Resources.Person
--SELECT *
--FROM   Resources.Document
--SELECT *
--FROM   Resources.Writes


--DECLARE @EdgeSchema sysname = 'Resources',
--		@EdgeName sysname = 'Writes',

--		@FromSchema sysname = 'Resources',
--		@FromObject sysname = 'Person',
--		@FromObjectColumnName sysname = 'PersonName',
--		@FromObjectColumnNameAS sysname ,

--		@ToSchema sysname = 'Resources',
--		@ToObject sysname = 'Document',
--		@ToObjectColumnName sysname = 'DocumentName',
--		@ToObjectColumnNameAS sysname,


--DECLARE @EdgeSchema sysname = 'Classifications',
--		@EdgeName sysname = 'Categorizes',

--		@FromSchema sysname = 'Classifications',
--		@FromObject sysname = 'Tag',
--		@FromObjectColumnName sysname = 'TagName',
--		@FromObjectColumnNameAS sysname = 'CategoryTagName',

--		@ToSchema sysname = 'Classifications',
--		@ToObject sysname = 'Tag',
--		@ToObjectColumnName sysname = 'TagName',
--		@ToObjectColumnNameAS sysname ,


DECLARE @EdgeSchema sysname = 'Locations',
		@EdgeName sysname = 'Includes',

		@FromSchema sysname = 'Locations',
		@FromObject sysname = 'Item',
		@FromObjectColumnName sysname = 'Name',
		@FromObjectColumnNameAS sysname ,

		@ToSchema sysname = 'Locations',
		@ToObject sysname = 'Item',
		@ToObjectColumnName sysname = 'Name',
		@ToObjectColumnNameAS sysname = 'ToName',


		@NameDelimiter CHAR(1) = '_'
		,@crlf nvarchar(2) = CHAR(13) + CHAR(10)
		
DECLARE @Query TABLE (LineNumber INT PRIMARY KEY, Line VARCHAR(1000))

INSERT INTO @Query (LineNumber, Line)
VALUES 
     
       
       (1,CONCAT('IF NOT EXISTS (SELECT * FROM sys.schemas WHERE schemas.name = ''', @EdgeSchema,'_UI'')')),
	   (2,CONCAT( 'EXECUTE (''CREATE SCHEMA ',@EdgeSchema,'_UI'')',@crlf,'GO')),
	   (10, CONCAT('CREATE OR ALTER VIEW ',@EdgeSchema,'_UI.', CASE WHEN @EdgeSchema <> @FromSchema THEN @FromSchema END + @NameDelimiter,@FromObject,@NameDelimiter,@EdgeName,@NameDelimiter, CASE WHEN @EdgeSchema <> @ToSchema THEN @ToSchema END,
					@ToObject)),
	   (20, 'AS'),
	   (30, CONCAT('SELECT ', @FromObject,'.',@FromObjectColumnName, ' AS ', COALESCE(@FromObjectColumnNameAS, @FromObjectColumnName), ', ',@EdgeName,@ToObject,'.',@ToObjectColumnName, ' AS ', COALESCE(@ToObjectColumnNameAS, @ToObjectColumnName))),
	   (40, CONCAT('FROM   ',@FromSchema,'.',@FromObject,',',@EdgeSchema, '.',@EdgeName,',',@ToSchema,'.',@ToObject, ' AS ',@EdgeName,@ToObject)),
	   (50, CONCAT('WHERE MATCH(',@FromObject,'-(',@EdgeName,')->',@EdgeName,@ToObject,')')),
	   (60, 'GO'),
	   (70,''),
	   (80, CONCAT('CREATE OR ALTER TRIGGER ',@EdgeSchema,'_UI.'
	   	   , CASE WHEN @EdgeSchema <> @FromSchema THEN @FromSchema END + @NameDelimiter,@FromObject,@NameDelimiter,@EdgeName,@NameDelimiter, CASE WHEN @EdgeSchema <> @ToSchema THEN @ToSchema END,
					@ToObject,'$InsteadOfInsertTrigger')),
		(90, CONCAT('ON ',@EdgeSchema,'_UI.', CASE WHEN @EdgeSchema <> @FromSchema THEN @FromSchema END + @NameDelimiter,@FromObject,@NameDelimiter,@EdgeName,@NameDelimiter, CASE WHEN @EdgeSchema <> @ToSchema THEN @ToSchema END,
					@ToObject)),
		(100,CONCAT('INSTEAD OF INSERT',@crlf,'AS',@crlf,'SET NOCOUNT ON',@CRLF,'  BEGIN')),
		(110, CONCAT('   INSERT INTO ',@EdgeSchema,'.',@EdgeName,'($from_id, $to_id)')),
		(120, CONCAT('   SELECT ',@FromObject,'.$node_id, ',@EdgeName,@ToObject,'.$node_id' )),
		(130, '   FROM Inserted'),
		(140, CONCAT('         JOIN ',@FromSchema,'.',@FromObject)),
		(150, CONCAT('                ON ',@FromObject,'.',@FromObjectColumnName,' = Inserted.',COALESCE(@FromObjectColumnNameAS, @FromObjectColumnName))),
		(160, CONCAT('         JOIN ',@ToSchema,'.',@ToObject,' AS ',@EdgeName,@ToObject)),
		(170, CONCAT('                ON ',@EdgeName,@ToObject,'.',@ToObjectColumnName,' = Inserted.',COALESCE(@ToObjectColumnNameAS, @ToObjectColumnName))),
		(180, CONCAT('   END;',@crlf,'GO',@crlf)),

		(190, CONCAT('CREATE OR ALTER TRIGGER ',@EdgeSchema,'_UI.'
	   	   , CASE WHEN @EdgeSchema <> @FromSchema THEN @FromSchema END + @NameDelimiter,@FromObject,@NameDelimiter,@EdgeName,@NameDelimiter, CASE WHEN @EdgeSchema <> @ToSchema THEN @ToSchema END,
					@ToObject,'$InsteadOfDeleteTrigger')),
		(200, CONCAT('ON ',@EdgeSchema,'_UI.', CASE WHEN @EdgeSchema <> @FromSchema THEN @FromSchema END + @NameDelimiter,@FromObject,@NameDelimiter,@EdgeName,@NameDelimiter, CASE WHEN @EdgeSchema <> @ToSchema THEN @ToSchema END,
					@ToObject)),
		(210,CONCAT('INSTEAD OF DELETE',@crlf,'AS',@crlf,'SET NOCOUNT ON',@CRLF,'  BEGIN')),
		(220,CONCAT('       DELETE FROM ',@EdgeSchema,'.',@EdgeName)),
		(230,CONCAT('       FROM deleted, ',@FromSchema,'.',@FromObject,',')),
		(240,CONCAT('              ',@EdgeSchema,'.',@EdgeName,',')),
		(250,CONCAT('              ',@ToSchema,'.',@ToObject,' AS ', @EdgeSchema,@ToObject)),
		(260,CONCAT('       WHERE MATCH(',@FromObject,'-(',@EdgeName,')->',@EdgeSchema,@ToObject,')')),
		(270,CONCAT('		  AND deleted.',@FromObjectColumnName,' = ', @FromObject,'.',@FromObjectColumnName)),
		(280,CONCAT('		  AND deleted.',@ToObjectColumnName,' = ', @EdgeSchema,@ToObject,'.',@ToObjectColumnName)),
		(285,@crlf),
	    (290, CONCAT('   INSERT INTO ',@EdgeSchema,'.',@EdgeName,'($from_id, $to_id)')),
		(300, CONCAT('   SELECT ',@FromObject,'.$node_id, ',@EdgeName,@ToObject,'.$node_id' )),
		(310, '   FROM Inserted'),
		(320, CONCAT('         JOIN ',@FromSchema,'.',@FromObject)),
		(330, CONCAT('                ON ',@FromObject,'.',@FromObjectColumnName,' = Inserted.',COALESCE(@FromObjectColumnNameAS, @FromObjectColumnName))),
		(340, CONCAT('         JOIN ',@ToSchema,'.',@ToObject,' AS ',@EdgeName,@ToObject)),
		(350, CONCAT('                ON ',@EdgeName,@ToObject,'.',@ToObjectColumnName,' = Inserted.',COALESCE(@ToObjectColumnNameAS, @ToObjectColumnName))),
		(360, CONCAT('   END;',@crlf,'GO',@crlf,@crlf)),

		(370, CONCAT('CREATE OR ALTER TRIGGER ',@EdgeSchema,'_UI.'
	   	   , CASE WHEN @EdgeSchema <> @FromSchema THEN @FromSchema END + @NameDelimiter,@FromObject,@NameDelimiter,@EdgeName,@NameDelimiter, CASE WHEN @EdgeSchema <> @ToSchema THEN @ToSchema END,
					@ToObject,'$InsteadOfDeleteTrigger')),
		(380, CONCAT('ON ',@EdgeSchema,'_UI.', CASE WHEN @EdgeSchema <> @FromSchema THEN @FromSchema END + @NameDelimiter,@FromObject,@NameDelimiter,@EdgeName,@NameDelimiter, CASE WHEN @EdgeSchema <> @ToSchema THEN @ToSchema END,
					@ToObject)),
		(390,CONCAT('INSTEAD OF DELETE',@crlf,'AS',@crlf,'SET NOCOUNT ON',@CRLF,'  BEGIN')),
		(400,CONCAT('       DELETE FROM ',@EdgeSchema,'.',@EdgeName)),
		(410,CONCAT('       FROM deleted, ',@FromSchema,'.',@FromObject,',')),
		(420,CONCAT('              ',@EdgeSchema,'.',@EdgeName,',')),
		(430,CONCAT('              ',@ToSchema,'.',@ToObject,' AS ', @EdgeSchema,@ToObject)),
		(440,CONCAT('       WHERE MATCH(',@FromObject,'-(',@EdgeName,')->',@EdgeSchema,@ToObject,')')),
		(450,CONCAT('		  AND deleted.',@FromObjectColumnName,' = ', @FromObject,'.',@FromObjectColumnName)),
		(460,CONCAT('		  AND deleted.',@ToObjectColumnName,' = ', @EdgeSchema,@ToObject,'.',@ToObjectColumnName)),
		(475,@crlf),
		(560, CONCAT('   END;',@crlf,'GO',@crlf))




SELECT Line AS '--Line'
FROM  @Query
ORDER BY LineNumber
