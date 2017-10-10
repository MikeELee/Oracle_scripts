exec DBMS_METADATA.SET_TRANSFORM_PARAM(DBMS_METADATA.SESSION_TRANSFORM,'PRETTY',true);
exec DBMS_METADATA.SET_TRANSFORM_PARAM(DBMS_METADATA.SESSION_TRANSFORM,'SQLTERMINATOR',true);

set feedback off
set verify off
set pagesize 0
set linesize 132

select
'spool "Index '||owner||'.'||index_name||'.sql"
SELECT to_char(DBMS_METADATA.GET_DDL (''INDEX'', '''||index_name||''', '''||owner||''')) from dual;
spool off'
FROM dba_indexes
WHERE owner in ('SCOTT')
and index_name not like '%$%'
UNION ALL
select
'spool "Constraint '||owner||'.'||Constraint_name||'.sql"
SELECT to_char(DBMS_METADATA.GET_DDL (''CONSTRAINT'', '''||Constraint_name||''', '''||owner||''')) from dual;
spool off'
FROM dba_constraints
WHERE owner in ('SCOTT')
and constraint_type !='C'
and constraint_name not like '%$%'
UNION ALL
select
'spool "Table '||owner||'.'||table_name||'.sql"
SELECT to_char(DBMS_METADATA.GET_DDL (''TABLE'', '''||table_name||''', '''||owner||''')) from dual;
spool off'
FROM dba_tables
WHERE owner in ('SCOTT')
and PARTITIONED='NO'
order by 1;


