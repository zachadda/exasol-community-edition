
-- Create a connection to the Postgres database
create or replace connection postgres_connection
to 'jdbc:postgresql://192.168.59.103:5432/dbname'
user 'username' identified by 'password';

create or replace connection postgres_connection
to 'jdbc:postgresql://172.20.6.254:5432/postgres'
user 'postgres' identified by 'pExasol123!';

IMPORT FROM JDBC AT POSTGRES_CONNECTION STATEMENT 'select ''Connection Works!!''';

-- Finally start the import process
execute script database_migration.POSTGRES_TO_EXASOL(
    'postgres_connection', -- name of your database connection
    true,          -- case sensitivity handling for identifiers -> false: handle them case sensitiv / true: handle them case insensitiv --> recommended: true
    '%',           -- schema filter --> '%' to load all schemas except 'information_schema' and 'pg_catalog' / '%publ%' to load all schemas like '%pub%'
    '%',           -- table filter --> '%' to load all tables 
    'MY_SCHEMA'    -- destination schema 
);