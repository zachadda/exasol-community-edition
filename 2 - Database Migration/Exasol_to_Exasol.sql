
-- JDBC connection
CREATE OR REPLACE CONNECTION EXASOL_CONNECTION
TO 'jdbc:exa:<server>:8563'
user '<username>' identified by '<password>';

-- Test Connection
IMPORT FROM JDBC AT EXASOL_CONNECTION STATEMENT 'select ''connection works!!''';
                                                                                  
execute script database_migration.EXASOL_TO_EXASOL(
   'EXASOL_CONNECTION' -- name of your database connection   
   ,'JDBC'             -- set if import from EXA or JDBC connection
   ,FALSE             -- case sensitivity handling for identifiers -> false: handle them case sensitiv / true: handle them case insensitiv --> recommended: true
   ,'TPCH_1GB'           -- schema filter --> '%' to load all schemas except 'SYS' and 'EXA_STATISTICS'/ '%pub%' to load all schemas like '%pub%'
   ,'%'               -- table filter --> '%' to load all tables
   ,'TRUE'           -- view inclusion flag --> 'TRUE' to include views
   ,'%'               -- view filter --> '%' to generate all views
   ,'DISABLE'         -- pk & fk setting --> disable/enable to create disabled/enabled primary key
);
