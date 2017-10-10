SELECT DBMS_METADATA.GET_GRANTED_DDL('OBJECT_GRANT','SCOTT') FROM DUAL;

select dbms_metadata.get_granted_ddl('ROLE_GRANT', 'SCOTT')
from dual UNION ALL
select dbms_metadata.get_granted_ddl('SYSTEM_GRANT', 'SCOTT')
from dual UNION ALL
select dbms_metadata.get_granted_ddl('OBJECT_GRANT', 'SCOTT')
from dual;

