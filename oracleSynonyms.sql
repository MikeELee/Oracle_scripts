set linesize 256;
spool oracleSynonyms.sql;

select 'create or replace '|| decode(owner,'PUBLIC','public ',null) ||  
'synonym ' || decode(owner,'PUBLIC',null, lower(owner) || '.') ||  
lower(synonym_name) || ' for ' || lower(table_owner) || '.' || lower(table_name) || decode(db_link,null,null,'@'||db_link) || ';'
from sys.dba_synonyms 
where table_owner not in('SI_INFORMTN_SCHEMA','SYS','SYSTEM','ORDSYS','XDB','CTXSYS','DMSYS','EXFSYS','MDSYS','SYSMAN','WKSYS','WMSYS')
order by owner, table_name;

spool off;