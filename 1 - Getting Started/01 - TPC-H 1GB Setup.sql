/*
                                -- +++ TPC-H Queries Setup

STEPS:
  >>> RUN ALL THE QUERIES (FAR LEFT GREEN PLAY BUTTON) TO:
        > CREATE SCHEMA
        > CREATE TABLES
        > IMPORT DATA

Estimated time 4vcpu, 8gb memory
  >>> ~ 1 min

-- Next, Go to Scripts > 1 - Getting Started > 02 - TPC-H 1GB Queries.sql

*/

-- BEGIN

-- ### SCHEMAS ###
CREATE SCHEMA IF NOT EXISTS TPCH_1GB;

-- ### TABLES ###
CREATE OR REPLACE TABLE "TPCH_1GB"."CUSTOMER" ("C_CUSTKEY" DECIMAL(11,0) NOT NULL ,"C_NAME" VARCHAR(25) ASCII ,"C_ADDRESS" VARCHAR(40) ASCII ,"C_NATIONKEY" DECIMAL(11,0) ,"C_PHONE" CHAR(15) ASCII ,"C_ACCTBAL" DECIMAL(12,2) ,"C_MKTSEGMENT" CHAR(10) ASCII ,"C_COMMENT" VARCHAR(117) ASCII , CONSTRAINT "PK_CUSTOMER" PRIMARY KEY (C_CUSTKEY) DISABLE);
CREATE OR REPLACE TABLE "TPCH_1GB"."LINEITEM" ("L_ORDERKEY" DECIMAL(12,0) NOT NULL ,"L_PARTKEY" DECIMAL(11,0) ,"L_SUPPKEY" DECIMAL(11,0) ,"L_LINENUMBER" DECIMAL(10,0) NOT NULL ,"L_QUANTITY" DECIMAL(12,2) ,"L_EXTENDEDPRICE" DECIMAL(12,2) ,"L_DISCOUNT" DECIMAL(12,2) ,"L_TAX" DECIMAL(12,2) ,"L_RETURNFLAG" CHAR(1) ASCII ,"L_LINESTATUS" CHAR(1) ASCII ,"L_SHIPDATE" DATE ,"L_COMMITDATE" DATE ,"L_RECEIPTDATE" DATE ,"L_SHIPINSTRUCT" CHAR(25) ASCII ,"L_SHIPMODE" CHAR(10) ASCII ,"L_COMMENT" VARCHAR(44) ASCII , CONSTRAINT "PK_LINEITEM" PRIMARY KEY (L_LINENUMBER,L_ORDERKEY) DISABLE);
CREATE OR REPLACE TABLE "TPCH_1GB"."NATION" ("N_NATIONKEY" DECIMAL(11,0) NOT NULL ,"N_NAME" CHAR(25) ASCII ,"N_REGIONKEY" DECIMAL(11,0) ,"N_COMMENT" VARCHAR(152) ASCII , CONSTRAINT "PK_NATION" PRIMARY KEY (N_NATIONKEY) DISABLE);
CREATE OR REPLACE TABLE "TPCH_1GB"."ORDERS" ("O_ORDERKEY" DECIMAL(12,0) NOT NULL ,"O_CUSTKEY" DECIMAL(11,0) ,"O_ORDERSTATUS" CHAR(1) ASCII ,"O_TOTALPRICE" DECIMAL(12,2) ,"O_ORDERDATE" DATE ,"O_ORDERPRIORITY" CHAR(15) ASCII ,"O_CLERK" CHAR(15) ASCII ,"O_SHIPPRIORITY" DECIMAL(10,0) ,"O_COMMENT" VARCHAR(79) ASCII , CONSTRAINT "PK_ORDERS" PRIMARY KEY (O_ORDERKEY) DISABLE);
CREATE OR REPLACE TABLE "TPCH_1GB"."PART" ("P_PARTKEY" DECIMAL(11,0) NOT NULL ,"P_NAME" VARCHAR(55) ASCII ,"P_MFGR" CHAR(25) ASCII ,"P_BRAND" CHAR(10) ASCII ,"P_TYPE" VARCHAR(25) ASCII ,"P_SIZE" DECIMAL(10,0) ,"P_CONTAINER" CHAR(10) ASCII ,"P_RETAILPRICE" DECIMAL(12,2) ,"P_COMMENT" VARCHAR(23) ASCII , CONSTRAINT "PK_PART" PRIMARY KEY (P_PARTKEY) DISABLE);
CREATE OR REPLACE TABLE "TPCH_1GB"."PARTSUPP" ("PS_PARTKEY" DECIMAL(11,0) NOT NULL ,"PS_SUPPKEY" DECIMAL(11,0) NOT NULL ,"PS_AVAILQTY" DECIMAL(10,0) ,"PS_SUPPLYCOST" DECIMAL(12,2) ,"PS_COMMENT" VARCHAR(199) ASCII , CONSTRAINT "PK_PARTSUPP" PRIMARY KEY (PS_PARTKEY,PS_SUPPKEY) DISABLE);
CREATE OR REPLACE TABLE "TPCH_1GB"."REGION" ("R_REGIONKEY" DECIMAL(11,0) NOT NULL ,"R_NAME" CHAR(25) ASCII ,"R_COMMENT" VARCHAR(152) ASCII , CONSTRAINT "PK_REGION" PRIMARY KEY (R_REGIONKEY) DISABLE);
CREATE OR REPLACE TABLE "TPCH_1GB"."SUPPLIER" ("S_SUPPKEY" DECIMAL(11,0) NOT NULL ,"S_NAME" CHAR(25) ASCII ,"S_ADDRESS" VARCHAR(40) ASCII ,"S_NATIONKEY" DECIMAL(11,0) ,"S_PHONE" CHAR(15) ASCII ,"S_ACCTBAL" DECIMAL(12,2) ,"S_COMMENT" VARCHAR(101) ASCII , CONSTRAINT "PK_SUPPLIER" PRIMARY KEY (S_SUPPKEY) DISABLE);

-- ### FOREIGN KEYS ###
ALTER TABLE "TPCH_1GB"."CUSTOMER" ADD CONSTRAINT "FK_NATION" FOREIGN KEY ("C_NATIONKEY") REFERENCES "TPCH_1GB"."NATION" DISABLE;
ALTER TABLE "TPCH_1GB"."LINEITEM" ADD CONSTRAINT "FK_PARTSUPP" FOREIGN KEY ("L_PARTKEY","L_SUPPKEY") REFERENCES "TPCH_1GB"."PARTSUPP" DISABLE;
ALTER TABLE "TPCH_1GB"."SUPPLIER" ADD CONSTRAINT "FK_NATION" FOREIGN KEY ("S_NATIONKEY") REFERENCES "TPCH_1GB"."NATION" DISABLE;
ALTER TABLE "TPCH_1GB"."PARTSUPP" ADD CONSTRAINT "FK_SUPP" FOREIGN KEY ("PS_SUPPKEY") REFERENCES "TPCH_1GB"."SUPPLIER" DISABLE;
ALTER TABLE "TPCH_1GB"."PARTSUPP" ADD CONSTRAINT "FK_PART" FOREIGN KEY ("PS_PARTKEY") REFERENCES "TPCH_1GB"."PART" DISABLE;
ALTER TABLE "TPCH_1GB"."ORDERS" ADD CONSTRAINT "FK_CUSTOMER" FOREIGN KEY ("O_CUSTKEY") REFERENCES "TPCH_1GB"."CUSTOMER" DISABLE;
ALTER TABLE "TPCH_1GB"."LINEITEM" ADD CONSTRAINT "FK_ORDER" FOREIGN KEY ("L_ORDERKEY") REFERENCES "TPCH_1GB"."ORDERS" DISABLE;
ALTER TABLE "TPCH_1GB"."NATION" ADD CONSTRAINT "FK_REGION" FOREIGN KEY ("N_REGIONKEY") REFERENCES "TPCH_1GB"."REGION" DISABLE;


-- +++ IMPORT DATA

-- estimated times are based on 4vcpu, 8gb memory
-- IMPORT performance increases with more nodes, vCPU, and RAM


-- 150,000 records, ~5s
IMPORT INTO TPCH_1GB.CUSTOMER FROM LOCAL CSV FILE 
'/home/exasol/ce_data/TPCH_1GB/CUSTOMER.csv.gz' -- local file path
;

-- 800,000 records, ~8s
IMPORT INTO TPCH_1GB.PARTSUPP FROM LOCAL CSV
FILE '/home/exasol/ce_data/TPCH_1GB/PARTSUPP.csv.gz'
;

-- 1,500,000 records, ~10s
IMPORT INTO TPCH_1GB.ORDERS FROM LOCAL CSV
FILE '/home/exasol/ce_data/TPCH_1GB/ORDERS.csv.gz'
;

-- 6,001,215 records, ~30s
IMPORT INTO TPCH_1GB.LINEITEM FROM LOCAL CSV
FILE '/home/exasol/ce_data/TPCH_1GB/LINEITEM.csv.gz' 
;

-- 200,000 records, ~5s
IMPORT INTO TPCH_1GB.PART FROM LOCAL CSV FILE 
'/home/exasol/ce_data/TPCH_1GB/PART.csv.gz'
;

-- 10,000 records, ~3s
IMPORT INTO TPCH_1GB.SUPPLIER FROM LOCAL CSV FILE 
'/home/exasol/ce_data/TPCH_1GB/SUPPLIER.csv.gz' 
;

-- 25 records, ~1s
IMPORT INTO TPCH_1GB.NATION FROM LOCAL CSV FILE 
'/home/exasol/ce_data/TPCH_1GB/NATION.csv.gz' 
;

-- 5 records, ~1s
IMPORT INTO TPCH_1GB.REGION FROM LOCAL CSV FILE 
'/home/exasol/ce_data/TPCH_1GB/REGION.csv.gz' 
;

-- DONE

-- Go to Scripts > 1 - Getting Started > 02 - TPC-H 1GB Queries.sql

