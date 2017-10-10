select owner,object_name,SUBOBJECT_NAME,object_type,status from dba_objects
where status='INVALID'
and owner not in ('SYS','MDSYS','APEX_040200','PUBLIC')
--and owner like 'DIG%'
--order by owner;
order by object_type;

EXEC SYS.DBMS_UTILITY.COMPILE_SCHEMA ('CUST_MASTER');
EXEC SYS.DBMS_UTILITY.COMPILE_SCHEMA ('DIGIMART');
EXEC SYS.DBMS_UTILITY.COMPILE_SCHEMA ('DIGIMASTER');
EXEC SYS.DBMS_UTILITY.COMPILE_SCHEMA ('DIGIDATA');
EXEC SYS.DBMS_UTILITY.COMPILE_SCHEMA ('DIGITAL_RO');
EXEC SYS.DBMS_UTILITY.COMPILE_SCHEMA ('DIGIMART_USER');
EXEC SYS.DBMS_UTILITY.COMPILE_SCHEMA ('BUDGET_STAGING');
EXEC SYS.DBMS_UTILITY.COMPILE_SCHEMA ('BUDGET_USER');
EXEC SYS.DBMS_UTILITY.COMPILE_SCHEMA ('SECURITY');
EXEC SYS.DBMS_UTILITY.COMPILE_SCHEMA ('CUSTOMER');
EXEC SYS.DBMS_UTILITY.COMPILE_SCHEMA ('MDSYS');

select 'create or replace synonym ' || a.owner || '.' || a.synonym_name || ' for ' || a.table_owner || '.' || a.table_name||';'
    as cmd from dba_synonyms a where a.owner||a.synonym_name in
    (select distinct b.owner||b.object_name from dba_objects b where b.object_type='SYNONYM' and b.STATUS='INVALID')
    and a.owner !='PUBLIC';

select 'ALTER PACKAGE '||
   OWNER||'.'||OBJECT_NAME||' COMPILE PACKAGE;' from dba_objects
where status='INVALID'
and owner != 'SYS'
and OBJECT_TYPE like '%PACKA%';

select distinct 'EXEC SYS.DBMS_UTILITY.COMPILE_SCHEMA ('''||OWNER||''');' from dba_objects
where status='INVALID'
and owner != 'SYS'
--and OBJECT_TYPE like 'PACKAGE%'
;


SELECT DBMS_METADATA.GET_GRANTED_DDL('ROLE_GRANT','CUST_MASTER') FROM DUAL;

select 'create synonym uk_bo_user.'||synonym_name||' for '||table_owner||'.'||table_name||';'  from user_synonyms;

--alter synonym <name> compile;
select 'alter synonym '||
   OWNER||'.'||OBJECT_NAME||' COMPILE;' from dba_objects
where status='INVALID'
and owner != 'SYS'
and OBJECT_TYPE like 'SYNONYM';


select 'create or replace synonym '||OWNER||'.'||synonym_name||' for '||table_owner||'.'||table_name||';'
from ALL_SYNONYMS
where owner   in('PUBLIC','DIGITAL_CONFIG','OPENJAW','OJ_OJDP','OJ_XCAR','OJ_XDIST','OJ_XLOCATION','OJ_XREZAGENT','PROD1_RO','DIGITAL_RO','RELMAN','DIGIMASTER','CUST_MASTER','SECURITY','U_SECURITY','EXTRA','FLEET','LOCATION','WEBODS_STAGING','MERCHANDISING_STAGING','CDB_SYNC','CUSTOMER','BUDGET_STAGING','BUDGET_MASTER','AVIS_STAGING','AVIS_MASTER','BUDGET_USER','BUDGET_CLOVER','DIGITAL_CONFIG_USER','DIGIMART','DIGIDATA')
and status='INVALID';

select 'create or replace synonym '||OWNER||'.'||synonym_name||' for '||table_owner||'.'||table_name||';'
from ALL_SYNONYMS
where owner   in('SERVICES')
;

exec dbms_stats.gather_schema_stats('DIGIDATA');
exec dbms_stats.gather_schema_stats('DIGIMART');


