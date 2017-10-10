--select 'GRANT ALTER, DELETE, INDEX, INSERT, REFERENCES, SELECT, UPDATE, ON COMMIT REFRESH, QUERY REWRITE, DEBUG, FLASHBACK ON  '||OBJECT_NAME||' to SSR_REP_SHDW'||chr(10)||'/'
--from user_objects
--where object_type in ('TABLE','VIEW')
--union
select 'GRANT ALTER, DELETE, INDEX, INSERT, REFERENCES, SELECT, UPDATE, ON COMMIT REFRESH, QUERY REWRITE, DEBUG, FLASHBACK ON  '||OWNER||'.'||OBJECT_NAME||' to DIGIDATA;'||chr(10)||'/'
from all_objects
where object_type in ('TABLE','VIEW')
and object_name not like 'attrep%' and object_name not like '%$%'
and OWNER in ('BUDGET_STAGING')
union
select 'GRANT ALTER, DELETE, INDEX, INSERT, REFERENCES, SELECT, UPDATE, ON COMMIT REFRESH, QUERY REWRITE, DEBUG, FLASHBACK ON  '||OWNER||'.'||OBJECT_NAME||' to RELMAN;'||chr(10)||'/'
from all_objects
where object_type in ('TABLE','VIEW')
and OWNER in ('BUDGET_STAGING','DIGIDATA','DIGIMART','SECURITY')
and object_name not like 'attrep%'
and object_name not like '%$%'
--select 'GRANT ALTER, DELETE, INDEX, INSERT, REFERENCES, SELECT, UPDATE, ON COMMIT REFRESH, QUERY REWRITE, DEBUG, FLASHBACK ON  '||OBJECT_NAME||' to SSR_ODS_SHDW'||chr(10)||'/'
--from user_objects
--where object_type in ('TABLE','VIEW')
--union
--select 'GRANT SELECT ON '||OBJECT_NAME||' to SSR_ODS_RO'||chr(10)||'/'
--from all_objects
--where object_type in ('TABLE','VIEW')
--and OWNER in ('BUDGET_STAGING')
union
select distinct 'GRANT EXECUTE,DEBUG ON '||OWNER||'.'||OBJECT_NAME||' to RELMAN;'||chr(10)||'/'
from all_objects
where object_type not in ('TABLE','VIEW','INDEX','TABLE PARTITION')
and object_name not like '%$%'
and OWNER in ('BUDGET_STAGING','DIGIDATA','DIGIMART','SECURITY')
--union

--SSR_REP_RO




--SSR_REP_RO
