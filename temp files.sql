SELECT value FROM v$parameter WHERE name = 'db_block_size';
--8192
select * from DBA_TEMP_FILES;

/*alter tablespace
   temp
add tempfile
   '/u02/app/oracle/oradata/DIGUAT3/datafile/temp_07.dbf'
size
   2500m
reuse
autoextend on
next
   1m
maxsize
   2500m;
   */

ALTER TABLESPACE temp ADD TEMPFILE '/u02/app/oracle/oradata/DIGUAT3/datafile/temp_20.dbf' SIZE  10G
reuse
autoextend on
;

ALTER DATABASE TEMPFILE '/u02/app/oracle/oradata/DIGUAT3/datafile/temp_09.dbf'    AUTOEXTEND ON;
