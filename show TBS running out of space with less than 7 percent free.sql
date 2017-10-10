--Run the below query to see which tablespaces have/are running out of free space

SELECT
'Table Space '||fs.tablespace_name||'  Status '||st.status||'  Total Size '||df.totalspace||'  MB Used '||(df.totalspace - fs.freespace)||'  MB Free '||fs.freespace||'  PCT Free '||round(100 * (fs.freespace / df.totalspace),2)||' %'
FROM
(SELECT tablespace_name, ROUND(SUM(bytes) / 1048576) TotalSpace FROM dba_data_files GROUP BY tablespace_name ) df
, (SELECT tablespace_name, ROUND(SUM(bytes) / 1048576) FreeSpace FROM dba_free_space GROUP BY tablespace_name ) fs
,(select  to_char(sysdate, 'MM/DD/YY') datum, tablespace_name, status from sys.dba_tablespaces) st
WHERE df.tablespace_name = fs.tablespace_name(+)
AND df.tablespace_name = st.tablespace_name(+)
AND fs.tablespace_name not in ('CWMLITE' ,'DRSYS' ,'EXAMPLE','ODM' ,'SYSTEM' ,'TOOLS' ,'UNDOTBS1' ,'XDB')
AND round(100 * (fs.freespace / df.totalspace),2) < 7    --Less than 7% free
order by (df.totalspace - fs.freespace) ASC;

--select ' Index '||owner || '.' || index_name ||' on '||table_owner || '.' || table_name ||' needs rebuilding/attention before the weekend load'
--  from   dba_indexes
--   where status = 'UNUSABLE' ;




