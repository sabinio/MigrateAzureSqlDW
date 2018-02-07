SET NOCOUNT ON;
DECLARE @ColumnsTotal INT;
SET @ColumnsTotal = (
		SELECT COUNT(*)
		FROM sys.columns c
		INNER JOIN sys.objects o ON c.object_id = o.object_id
		INNER JOIN sys.schemas s ON s.schema_id = o.schema_id
		INNER JOIN sys.tables t ON t.object_id= o.object_id
		WHERE o.type = 'U'
			AND o.name NOT IN (
				'sourceColumns'
				,'sourceColumnsNew'
				,'SourceDefinitions'
				)
			AND t.is_external = 0 
		);
	SELECT @ColumnsTotal