
-- Create a connection to the Redshift database; Use the 4.2 JDBC driver
create connection redshift_connection
to 'jdbc:redshift://some_prefix.eu-west-1.redshift.amazonaws.com:5439/dev'
user 'admin' identified by 'exasolRocks!';

-- Test Connection
IMPORT FROM JDBC AT redshift_connection STATEMENT 'select ''connection works!!''';

-- Finally start the import process
execute script database_migration.REDSHIFT_TO_EXASOL(
   'redshift_connection' -- name of your database connection
   ,true         -- case sensitivity handling for identifiers -> false: handle them case sensitiv / true: handle them case insensitiv --> recommended: true
   ,'%'          -- schema filter --> '%' to load all schemas except 'information_schema' and 'pg_catalog' / '%publ%' to load all schemas like '%pub%'
   ,'%'          -- table filter --> '%' to load all tables (
);
