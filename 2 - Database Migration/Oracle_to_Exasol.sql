
-- JDBC Connection
create or replace connection oracle_jdbc_connection
to 'jdbc:oracle:thin:@192.168.56.106:1521/cdb2'
user 'C##DB_MIG' identified by 'C##DB_MIG';

-- Test Connection
import from JDBC at ORACLE_JDBC_CONNECTION statement 'select ''Connection works'' from dual';

-- OCI Connection
create or replace connection oracle_oci_connection
to '192.168.56.106:1521/cdb2'
user 'C##DB_MIG' identified by 'C##DB_MIG';

-- Test Connection
import from ORA at ORACLE_OCI_CONNECTION statement 'select ''Connection works'' from dual';


execute script database_migration.oracle_to_exasol(
        'ORACLE_OCI',   -- connection name
        true,                   -- case insensitivity flag
        'C##DB_MIG',    -- schema name filter
        '%',                    -- table name filter
        4,                              -- degree of parallelism for the import statements.
        false,                  -- flag for primary key generation.
        false,                  -- flag for foreign key generation.
        false                   -- flag for creation and loading of checking tables
)
--with output
;