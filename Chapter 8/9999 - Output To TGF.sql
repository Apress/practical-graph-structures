USE SocialGraph
GO
--list of nodes in format schema.nodetable.nameForLabel;schema.nodetable.nameForLabel;
--done this way because it is a lot easier to manually edit
DECLARE @NodeList nvarchar(4000) = 'SocialGraph.Account.AccountHandle;SocialGraph.Interest.InterestName'

--list of edges in format schema.edgeTable
DECLARE @EdgeList nvarchar(4000) = 'SocialGraph.Follows;SocialGraph.InterestedIn'

--used to determine formatting of name in output
DECLARE @DefaultNodeType nvarchar(100) = 'DefaultNodeType'
DECLARE @DefaultEdgeType nvarchar(100) = 'DefaultEdgeType'
DECLARE @LabelNonDefaultEdgeFlag bit = 1


--if node or edge type doesn't match this value exactly, the node will be named NameForLabel (NodeType) and the edge will 
--not have a label if it matches

DECLARE @NodeTableList table (SchemaName sysname, TableName sysname, NodeNameColumn sysname PRIMARY KEY (SchemaName, TableName))
DECLARE @EdgeTableList table (SchemaName sysname, TableName sysname, EdgeNameColumn sysname NULL PRIMARY KEY (SchemaName, TableName))

SET NOCOUNT ON;
DECLARE @crlf nvarchar(2) = CHAR(13) + CHAR(10)



--parse the two strings
INSERT INTO @NodeTableList(SchemaName, TableName, NodeNameColumn)
SELECT PARSENAME(value,3), PARSENAME(value,2), PARSENAME(value,1)
FROM   STRING_SPLIT(@NodeList,';')


INSERT INTO @EdgeTableList(SchemaName, TableName)
SELECT PARSENAME(value,2), PARSENAME(value,1)
FROM   STRING_SPLIT(@EdgeList,';')
    

DROP TABLE IF EXISTS #NodeOutput, #EdgeOutput
CREATE TABLE #NodeOutput
(
	NodeOutputId int IDENTITY PRIMARY KEY,
	NodeSchema sysname,
	NodeTable  sysname,
	NodeId     int,
	NodeName varchar(100),
	UNIQUE (NodeSchema, NodeTable, NodeId)
)

CREATE TABLE #EdgeOutput
(
	EdgeSchema varchar(1000),
	EdgeTable  varchar(1000),
	FromNodeOutputId int NULL,
	ToNodeOutputId int NULL,
	EdgeName	 varchar(100)
)

DECLARE @NodeCursor CURSOR,
		@EdgeCursor CURSOR,
		@NodeName sysname,
		@EdgeName sysname,
		@SchemaName sysname,
		@NodeNameColumn sysname,
		@SQLQuery nvarchar(MAX)

SET @NodeCursor = CURSOR FOR (SELECT SchemaName,TableName,NodeNameColumn FROM @NodeTableList)
OPEN @NodeCursor

WHILE 1=1
 BEGIN
	FETCH NEXT FROM @NodeCursor INTO @SchemaName, @NodeName,@NodeNameColumn
	IF @@FETCH_STATUS <> 0
	  BREAK

	SELECT @SQLQuery = 'INSERT INTO #NodeOutput (NodeSchema, NodeTable, NodeId, NodeName)' + @crlf + 
		   'SELECT ''' + REPLACE(@SchemaName,'''','''''') + ''', '''+ REPLACE(@NodeName,'''','''''') + ''', JSON_VALUE(CAST($node_id AS nvarchar(1000)),''$.id''), ' 
		   + QUOTENAME(@NodeNameColumn) + ' + ' +  CASE WHEN @DefaultNodeType = @NodeName OR @LabelNonDefaultEdgeFlag = 0 THEN '''''' ELSE ''' (' + REPLACE(@NodeName,'''','''''') + ')'''  END +
		   ' FROM ' + QUOTENAME(@SchemaName) + '.' + QUOTENAME(@NodeName)
	--SELECT @SQLQuery
	EXEC (@SQLQuery)

 END;


SET @EdgeCursor = CURSOR FOR (SELECT SchemaName, TableName FROM @EdgeTableList)
OPEN @EdgeCursor 

WHILE 1=1
	BEGIN
		FETCH NEXT FROM @edgeCursor INTO @SchemaName, @EdgeName
		IF @@FETCH_STATUS <> 0
			BREAK
		
		SELECT @SQLQuery = 'WITH Parts AS (
 SELECT JSON_VALUE(CAST($from_id AS nvarchar(1000)),''$.schema'') AS FromNodeSchema, 
		JSON_VALUE(CAST($from_id AS nvarchar(1000)),''$.table'') AS FromNodeTable, 
		JSON_VALUE(CAST($from_id AS nvarchar(1000)),''$.id'') AS FromNodeId, 

		JSON_VALUE(CAST($To_id AS nvarchar(1000)),''$.schema'') AS ToNodeSchema, 
		JSON_VALUE(CAST($to_id AS nvarchar(1000)),''$.table'') AS ToNodeTable, 
		JSON_VALUE(CAST($to_id AS nvarchar(1000)),''$.id'') AS ToNodeId, 

        CASE WHEN ''' + REPLACE(@EdgeName,'''','''''') +''' <> ''' + REPLACE(@DefaultEdgeType,'''','''''') + ''' THEN ''' + REPLACE(@EdgeName,'''','''''') + ''' ELSE '''' END AS EdgeName 
 FROM ' + QUOTENAME(@SchemaName) + '.' + QUOTENAME(@EdgeName) + '
 )
 INSERT INTO #EdgeOutput(EdgeSchema, EdgeTable, FromNodeOutputId, ToNodeOutputId, EdgeName)
 SELECT ''' + REPLACE(@SchemaName,'''','''''') + ''' AS EdgeSchema,
		''' + REPLACE(@EdgeName,'''','''''') + ''' as EdgeName,
		FromNodeOutput.NodeOutputId AS FromNodeOutputId, 
	    ToNodeOutput.NodeOutputId AS ToNodeOutputId, 
		EdgeName
 FROM   Parts
		 JOIN #NodeOutput AS FromNodeOutput
			ON FromNodeOutput.NodeSchema = Parts.FromNodeSchema
			  AND FromNodeOutput.NodeTable = Parts.FromNodeTable
			  AND FromNodeOutput.NodeId = Parts.FromNodeId
		 JOIN #NodeOutput AS ToNodeOutput
			ON ToNodeOutput.NodeSchema = Parts.ToNodeSchema
			  AND ToNodeOutput.NodeTable = Parts.ToNodeTable
			  AND ToNodeOutput.NodeId = Parts.ToNodeId'

		
		EXEC (@SQLQuery)
	END;
GO



DECLARE @Output table (Ordering int IDENTITY, outputValue nvarchar(1000))

INSERT INTO @Output(outputValue)
SELECT CONCAT(#NodeOutput.NodeOutputId, ' ', NodeName) FROM #NodeOutput

INSERT INTO @Output(outputValue)
SELECT '#'

INSERT INTO @Output(outputValue)
SELECT CONCAT(#EdgeOutput.FromNodeOutputId, ' ', #EdgeOutput.ToNodeOutputId, ' ',#EdgeOutput.EdgeName) FROM #EdgeOutput

SELECT [@Output].outputValue
FROM   @Output
ORDER BY [@Output].Ordering
