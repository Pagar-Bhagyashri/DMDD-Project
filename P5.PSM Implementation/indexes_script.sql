-- Non-clustered Indexes
use tms;
CREATE NONCLUSTERED INDEX IX_Booking_TourID
ON Booking(Tour_ID)
INCLUDE (Booking_Date, Total_Cost);


-- 1. View all indexes on the Booking table
SELECT 
    i.name AS IndexName,
    i.type_desc AS IndexType,
    OBJECT_NAME(i.object_id) AS TableName,
    COL_NAME(ic.object_id, ic.column_id) AS ColumnName,
    i.is_unique AS IsUnique,
    i.is_disabled AS IsDisabled
FROM sys.indexes i
INNER JOIN sys.index_columns ic 
    ON i.object_id = ic.object_id 
    AND i.index_id = ic.index_id
WHERE i.object_id = OBJECT_ID('Booking');



-- 2. View detailed index information including included columns
SELECT
    i.name AS IndexName,
    OBJECT_NAME(i.object_id) AS TableName,
    i.type_desc AS IndexType,
    COL_NAME(ic.object_id, ic.column_id) AS ColumnName,
    ic.is_included_column AS IsIncludedColumn,
    i.is_unique AS IsUnique,
    i.is_disabled AS IsDisabled
FROM sys.indexes i
INNER JOIN sys.index_columns ic 
    ON i.object_id = ic.object_id 
    AND i.index_id = ic.index_id
WHERE i.object_id = OBJECT_ID('Booking')
ORDER BY i.name, ic.key_ordinal;


-- 3. Test the index with a query (to see if it's being used)
SET STATISTICS IO ON;
SET STATISTICS TIME ON;


-- Query using the index
SELECT Tour_ID, Booking_Date, Total_Cost
FROM Booking
WHERE Tour_ID = 1;

SET STATISTICS IO OFF;
SET STATISTICS TIME OFF;




-- 4. View index usage statistics
SELECT 
    OBJECT_NAME(i.object_id) AS TableName,
    i.name AS IndexName,
    i.type_desc AS IndexType,
    ius.user_seeks AS NumberOfSeeks,
    ius.user_scans AS NumberOfScans,
    ius.user_lookups AS NumberOfLookups,
    ius.user_updates AS NumberOfUpdates,
    ius.last_user_seek AS LastSeek,
    ius.last_user_scan AS LastScan,
    ius.last_user_lookup AS LastLookup,
    ius.last_user_update AS LastUpdate
FROM sys.indexes i
LEFT JOIN sys.dm_db_index_usage_stats ius 
    ON i.object_id = ius.object_id 
    AND i.index_id = ius.index_id
WHERE i.object_id = OBJECT_ID('Booking')
AND ius.database_id = DB_ID();




-- 5. View index physical stats
SELECT 
    OBJECT_NAME(ips.object_id) AS TableName,
    i.name AS IndexName,
    ips.index_type_desc AS IndexType,
    ips.avg_fragmentation_in_percent AS FragmentationPercent,
    ips.page_count AS NumberOfPages,
    ips.record_count AS NumberOfRecords
FROM sys.dm_db_index_physical_stats(
    DB_ID(), 
    OBJECT_ID('Booking'), 
    NULL, 
    NULL, 
    'DETAILED') ips
JOIN sys.indexes i 
    ON ips.object_id = i.object_id 
    AND ips.index_id = i.index_id;




	
-- 6. Missing Index Details (if any better indexes are recommended)
SELECT 
    OBJECT_NAME(d.object_id) AS TableName,
    'CREATE INDEX [IX_' + OBJECT_NAME(d.object_id) + '_' 
    + REPLACE(REPLACE(REPLACE(ISNULL(d.equality_columns,''), ', ', '_'), '[', ''), ']', '') 
    + CASE
        WHEN d.inequality_columns IS NULL THEN ''
        ELSE '_' + REPLACE(REPLACE(REPLACE(d.inequality_columns, ', ', '_'), '[', ''), ']', '')
    END + '] ON ' + d.statement + ' (' + ISNULL(d.equality_columns,'')
    + CASE WHEN d.equality_columns IS NOT NULL AND d.inequality_columns IS NOT NULL THEN ',' ELSE '' END
    + ISNULL(d.inequality_columns, '') + ')' 
    + ISNULL(' INCLUDE (' + included_columns + ')', '') AS CreateIndexStatement,
    s.user_seeks,
    s.user_scans,
    s.avg_user_impact
FROM sys.dm_db_missing_index_details d
JOIN sys.dm_db_missing_index_groups g ON d.index_handle = g.index_handle
JOIN sys.dm_db_missing_index_group_stats s ON g.index_group_handle = s.group_handle
WHERE d.object_id = OBJECT_ID('Booking');



CREATE NONCLUSTERED INDEX IX_BookingService_ServiceID
ON Booking_Service(Service_ID)
INCLUDE (Total_service_cost);





-- 1. Basic view of all indexes on Booking_Service table
SELECT 
    i.name AS IndexName,
    i.type_desc AS IndexType,
    OBJECT_NAME(i.object_id) AS TableName,
    COL_NAME(ic.object_id, ic.column_id) AS ColumnName,
    ic.is_included_column AS IsIncludedColumn
FROM sys.indexes i
INNER JOIN sys.index_columns ic 
    ON i.object_id = ic.object_id 
    AND i.index_id = ic.index_id
WHERE i.object_id = OBJECT_ID('Booking_Service');


-- 2. Detailed index information including included columns
SELECT
    i.name AS IndexName,
    OBJECT_NAME(i.object_id) AS TableName,
    i.type_desc AS IndexType,
    COL_NAME(ic.object_id, ic.column_id) AS ColumnName,
    ic.is_included_column AS IsIncludedColumn,
    i.is_unique AS IsUnique,
    i.is_disabled AS IsDisabled
FROM sys.indexes i
INNER JOIN sys.index_columns ic 
    ON i.object_id = ic.object_id 
    AND i.index_id = ic.index_id
WHERE i.object_id = OBJECT_ID('Booking_Service')
ORDER BY i.name, ic.key_ordinal;




-- 3. Test the index with a query
SET STATISTICS IO ON;
SET STATISTICS TIME ON;

-- Query using the index
SELECT Service_ID, Total_service_cost
FROM Booking_Service
WHERE Service_ID = 1;

SET STATISTICS IO OFF;
SET STATISTICS TIME OFF;


-- 4. View index usage statistics
SELECT 
    OBJECT_NAME(i.object_id) AS TableName,
    i.name AS IndexName,
    i.type_desc AS IndexType,
    ius.user_seeks AS NumberOfSeeks,
    ius.user_scans AS NumberOfScans,
    ius.user_lookups AS NumberOfLookups,
    ius.user_updates AS NumberOfUpdates,
    ius.last_user_seek AS LastSeek,
    ius.last_user_scan AS LastScan
FROM sys.indexes i
LEFT JOIN sys.dm_db_index_usage_stats ius 
    ON i.object_id = ius.object_id 
    AND i.index_id = ius.index_id
WHERE i.object_id = OBJECT_ID('Booking_Service')
AND ius.database_id = DB_ID();



-- 5. Check index fragmentation
SELECT 
    OBJECT_NAME(ips.object_id) AS TableName,
    i.name AS IndexName,
    ips.index_type_desc,
    ips.avg_fragmentation_in_percent,
    ips.page_count
FROM sys.dm_db_index_physical_stats(
    DB_ID(), 
    OBJECT_ID('Booking_Service'), 
    NULL, 
    NULL, 
    'DETAILED') ips
JOIN sys.indexes i 
    ON ips.object_id = i.object_id 
    AND ips.index_id = i.index_id;




	-- 6. Simple query to verify index exists
SELECT 
    OBJECT_SCHEMA_NAME(t.object_id) AS SchemaName,
    t.name AS TableName,
    i.name AS IndexName,
    i.type_desc AS IndexType,
    ds.name AS FileGroup
FROM sys.tables t
INNER JOIN sys.indexes i 
    ON t.object_id = i.object_id
INNER JOIN sys.data_spaces ds 
    ON i.data_space_id = ds.data_space_id
WHERE t.name = 'Booking_Service'
AND i.name = 'IX_BookingService_ServiceID';




-- Test queries that should use the index
-- 1. Simple lookup
SELECT Service_ID, Total_service_cost
FROM Booking_Service
WHERE Service_ID = 1;


-- 2. Aggregation query
SELECT 
    Service_ID,
    SUM(Total_service_cost) as TotalCost,
    AVG(Total_service_cost) as AverageCost
FROM Booking_Service
GROUP BY Service_ID;



-- 3. Join query
SELECT 
    s.Service_Name,
    COUNT(*) as TimesBooked,
    SUM(bs.Total_service_cost) as TotalRevenue
FROM Service s
JOIN Booking_Service bs ON s.Service_ID = bs.Service_ID
GROUP BY s.Service_ID, s.Service_Name;






CREATE NONCLUSTERED INDEX IX_Customer_Name
ON Customer([Name])
INCLUDE (Email, Phone_Number);


-- 1. Basic view of index details
SELECT 
    i.name AS IndexName,
    i.type_desc AS IndexType,
    OBJECT_NAME(i.object_id) AS TableName,
    COL_NAME(ic.object_id, ic.column_id) AS ColumnName,
    ic.is_included_column AS IsIncludedColumn
FROM sys.indexes i
INNER JOIN sys.index_columns ic 
    ON i.object_id = ic.object_id 
    AND i.index_id = ic.index_id
WHERE i.object_id = OBJECT_ID('Customer')
AND i.name = 'IX_Customer_Name';


-- 2. View all indexes on Customer table with included columns
SELECT
    i.name AS IndexName,
    OBJECT_NAME(i.object_id) AS TableName,
    COL_NAME(ic.object_id, ic.column_id) AS ColumnName,
    ic.is_included_column AS IsIncludedColumn,
    i.is_unique AS IsUnique,
    i.is_disabled AS IsDisabled
FROM sys.indexes i
INNER JOIN sys.index_columns ic 
    ON i.object_id = ic.object_id 
    AND i.index_id = ic.index_id
WHERE i.object_id = OBJECT_ID('Customer')
ORDER BY i.name, ic.key_ordinal;


-- 3. Test the index with queries
SET STATISTICS IO ON;
SET STATISTICS TIME ON;


-- Query using the index
SELECT Name, Email, Phone_Number
FROM Customer
WHERE Name LIKE 'J%';


SET STATISTICS IO OFF;
SET STATISTICS TIME OFF;



-- 4. View index usage statistics
SELECT 
    OBJECT_NAME(i.object_id) AS TableName,
    i.name AS IndexName,
    ius.user_seeks AS NumberOfSeeks,
    ius.user_scans AS NumberOfScans,
    ius.user_lookups AS NumberOfLookups,
    ius.user_updates AS NumberOfUpdates,
    ius.last_user_seek AS LastSeek,
    ius.last_user_scan AS LastScan
FROM sys.indexes i
LEFT JOIN sys.dm_db_index_usage_stats ius 
    ON i.object_id = ius.object_id 
    AND i.index_id = ius.index_id
WHERE i.object_id = OBJECT_ID('Customer')
AND ius.database_id = DB_ID();



-- 5. Check index properties and size
SELECT 
    i.name AS IndexName,
    i.type_desc AS IndexType,
    ps.row_count AS NumberOfRows,
    ps.used_page_count AS UsedPages,
    ps.reserved_page_count AS ReservedPages,
    CAST(ps.used_page_count * 8.0 / 1024 AS DECIMAL(10,2)) AS UsedSpaceMB,
    CAST(ps.reserved_page_count * 8.0 / 1024 AS DECIMAL(10,2)) AS ReservedSpaceMB
FROM sys.indexes i
INNER JOIN sys.dm_db_partition_stats ps 
    ON i.object_id = ps.object_id 
    AND i.index_id = ps.index_id
WHERE i.object_id = OBJECT_ID('Customer')
AND i.name = 'IX_Customer_Name';



-- 6. Sample queries to test the index
-- Find customers by name pattern
SELECT Name, Email, Phone_Number
FROM Customer
WHERE Name LIKE 'J%'
ORDER BY Name;


-- Find exact customer
SELECT Name, Email, Phone_Number
FROM Customer
WHERE Name = 'John Doe';

-- Get customer count by name initial
SELECT 
    LEFT(Name, 1) as Initial,
    COUNT(*) as CustomerCount
FROM Customer
GROUP BY LEFT(Name, 1)
ORDER BY Initial;



-- 7. Check index fragmentation
SELECT 
    OBJECT_NAME(ips.object_id) AS TableName,
    i.name AS IndexName,
    ips.index_type_desc,
    ips.avg_fragmentation_in_percent,
    ips.page_count
FROM sys.dm_db_index_physical_stats(
    DB_ID(), 
    OBJECT_ID('Customer'), 
    NULL, 
    NULL, 
    'DETAILED') ips
JOIN sys.indexes i 
    ON ips.object_id = i.object_id 
    AND ips.index_id = i.index_id
WHERE i.name = 'IX_Customer_Name';




-- Enable execution plan
SET SHOWPLAN_XML ON;


-- Run a test query
SELECT Name, Email, Phone_Number
FROM Customer
WHERE Name LIKE 'J%';

SET SHOWPLAN_XML OFF;


-- Or use this simpler version to see if index is being used
SET STATISTICS IO ON;
SELECT Name, Email, Phone_Number
FROM Customer
WHERE Name LIKE 'J%';
SET STATISTICS IO OFF;