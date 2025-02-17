
-- JTDS Connection
CREATE OR REPLACE CONNECTION sqlserver_jtds_connection 
        TO 'jdbc:jtds:sqlserver://192.168.1.42:1433'
        USER 'user'
        IDENTIFIED BY 'exasolRocks!';
        
IMPORT FROM JDBC AT SQLSERVER_JTDS_CONNECTION STATEMENT 'select ''connection works!!''';

-- SQL Server Connection
CREATE OR REPLACE CONNECTION sqlserver_connection 
        TO 'jdbc:sqlserver://192.168.1.42:1433;instance=v1;encrypt=true;trustServerCertificate=true;'
        USER 'user'
        IDENTIFIED BY 'exasolRocks!';
        
IMPORT FROM JDBC AT SQLSERVER_CONNECTION STATEMENT 'select ''connection works!!''';

-- Finally start the import process
execute script database_migration.SQLSERVER_TO_EXASOL(
    'sqlserver_jtds_connection', -- CONNECTION_NAME:             name of the database connection inside exasol -> e.g. sqlserver_db
    false,                   -- DB2SCHEMA:                   if true then SQL Server: database.schema.table => EXASOL: database.schema_table; if false then SQLSERVER: schema.table => EXASOL: schema.table
    'AdventureWorks%',      -- DB_FILTER:                   filter for SQLSERVER db, e.g. 'master', 'ma%', 'first_db, second_db', '%'
    '%',                    -- SCHEMA_FILTER:               filter for the schemas to generate and load e.g. 'my_schema', 'my%', 'schema1, schema2', '%'
    '',                     -- EXASOL_TARGET_SCHEMA:        set to empty string to use original values
    '%',                    -- TABLE_FILTER:                filter for the tables to generate and load e.g. 'my_table', 'my%', 'table1, table2', '%'
    false                    -- IDENTIFIER_CASE_INSENSITIVE: set to TRUE if identifiers should be put uppercase
);

