SELECT 'DROP SYNONYM CUSTOMER.'||rtrim(OBJECT_NAME)||';
create synonym CUSTOMER.'||rtrim(OBJECT_NAME)||' for '||OWNER|| '.' ||rtrim(OBJECT_NAME)||';'
FROM ALL_OBJECTS
WHERE object_type IN ('TABLE','PACKAGE','PROCEDURE','FUNCTION','VIEW','SEQUENCE')
and OWNER='CUST_MASTER'
AND not exists (SELECT null
                FROM   dba_synonyms
                WHERE  owner = 'CUSTOMER'
                  AND  dba_synonyms.synonym_name = all_objects.object_name
                  AND  dba_synonyms.table_owner  = 'CUSTOMER');
