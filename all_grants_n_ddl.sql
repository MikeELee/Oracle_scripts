-- ****************************
-- Save the output to a file where instance called PUBS
-- ****************************
spool all_grants_n_ddl.lst
-- ****************************

select 
   dbms_metadata.get_ddl( 'USER','PUBS' ) from dual

select 
   dbms_metadata.get_granted_ddl('SYSTEM_GRANT','PUBS') from dual;

select 
   dbms_metadata.get_granted_ddl('OBJECT_GRANT','PUBS') from dual;

select 
   dbms_metadata.get_granted_ddl('ROLE_GRANT','PUBS') from dual;

select 
   DBMS_METADATA.GET_DDL('TABLE',object_name,'PUBS') 
from 
   dba_objects 
where 
   owner=upper('PUBS') 
and 
   object_type ='TABLE';

select 
   DBMS_METADATA.GET_DDL('VIEW',object_name,'PUBS') 
from 
   dba_objects where owner=upper('PUBS') 
and 
   object_type ='VIEW';

spool off;