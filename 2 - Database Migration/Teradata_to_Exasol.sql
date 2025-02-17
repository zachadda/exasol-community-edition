
-- Create a connection to the Teradata database
create or replace connection teradata_connection
to 'jdbc:teradata://192.168.56.103/CHARSET=UTF8'
user 'username' identified by 'password';

/*
-- Depending on your Teradata installation, CHARSET=UTF16 instead of CHARSET=UTF8 could be the better choice - otherwise you get errors like this one:
-- [42636] ETL-3003: [Column=5 Row=0] [String data right truncation. String length exceeds limit of 2 characters] (Session: 1611884537138472475)
-- In that case, configure your connection like this:

-- create connection teradata_db
to 'jdbc:teradata://some.teradata.host.internal/CHARSET=UTF16'
user 'db_username' identified by 'exasolRocks!';
*/


-- Test Connection
IMPORT FROM JDBC AT teradata_connection STATEMENT 'SELECT ''connection to teradata works''';


-- Finally start the import process
execute script database_migration.TERADATA_TO_EXASOL(
    'TERADATA_CONNECTION'       -- name of your database connection
    ,true               -- case sensitivity handling for identifiers -> false: handle them case sensitiv / true: handle them case insensitiv --> recommended: true
    ,'%'                        -- schema filter --> '%' to load all schemas (except system schemas). Examples: 'CORE' (to migrate the 'CORE' schema), 'MART_%' (to migrate all schemas whose name starts with 'MART_')
    ,'%'                        -- table filter --> '%' to load all tables in the schemas considered. Examples: 'H_EMPLOYEE' (to migrate all the tables whose name is 'H_EMPLOYEE'), 'H_%' (to migrate all tables whose name starts with 'H_') 
    ,false                      -- boolean flag to create checking tables. TRUE -> create/load checking tables / FALSE -> do not create/load checking tables. -> default = FALSE. 
                                -- When the option is used, a checking table will be created and loaded for each individual table being migrated. 
                                -- The checking table will be created in the same schema with the same name adding '_MIG_CHK' as a suffix. 
                                -- A summary table for all the checking tables of a specific schema will be created in the database migration schema with the name of the migrated schema adding '_MIG_CHK' as a suffix.
) 
--with output
;