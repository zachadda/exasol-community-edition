
-- Create a connection to Snowflake
CREATE OR REPLACE CONNECTION SNOWFLAKE_CONNECTION TO
  'jdbc:snowflake://<myorganization>-<myaccount>.snowflakecomputing.com/?warehouse=<my_compute_wh>&role=<my_role>&CLIENT_SESSION_KEEP_ALIVE=true'
  USER '<sfuser>' IDENTIFIED BY '<sfpwd>';
  
-- Create a connection to Snowflake
CREATE CONNECTION SNOWFLAKE_CONNECTION TO
  'jdbc:snowflake://ssjnnoy-iu54573.snowflakecomputing.com/?warehouse=COMPUTE_WH&&role=ACCOUNTADMIN&CLIENT_SESSION_KEEP_ALIVE=true'
  USER 'MRZAAD' IDENTIFIED BY '****';
  
-- Test Connection
IMPORT FROM JDBC AT SNOWFLAKE_CONNECTION STATEMENT 'select ''connection works!''';

-- Finally start the import process
execute script database_migration.SNOWFLAKE_TO_EXASOL(
    'SNOWFLAKE_CONNECTION',     -- CONNECTION_NAME:      name of the database connection inside exasol -> e.g. sf_db
    true,                       -- DB2SCHEMA:            if true then Snowflake: database.schema.table => EXASOL: database.schema_table; if false then Snowflake: schema.table => EXASOL: schema.table
    'SNOWFLAKE_SAMPLE_DATA',                        -- DB_FILTER: filter for Snowflake db, e.g. 'master', 'ma%', 'first_db, second_db', '%'
    'TPCH_SF1',                        -- SCHEMA_FILTER: filter for the schemas to generate and load e.g. 'my_schema', 'my%', 'schema1, schema2', '%'
    'TPCH_1GB',                         -- EXASOL_TARGET_SCHEMA: set to empty string to use original values
    '%',                        -- TABLE_FILTER: filter for the tables to generate and load e.g. 'my_table', 'my%', 'table1, table2', '%'
    false                       -- IDENTIFIER_CASE_INSENSITIVE: set to TRUE if identifiers should be put uppercase
);
