select owner,table_name,round((blocks*8),2)||'kb' "Fragmented size"
, round((num_rows*avg_row_len/1024),2)||'kb' "Actual size"
, round((blocks*8),2)-round((num_rows*avg_row_len/1024),2)||'kb' "Diff (reclaimable)"
, round(((round((blocks*8),2)-round((num_rows*avg_row_len/1024),2))/round((blocks*8),2))*100 -10) "reclaimable space % "
, num_rows
, '
ALTER SESSION FORCE PARALLEL DML PARALLEL 8;
ALTER SESSION FORCE PARALLEL QUERY PARALLEL 8;
alter table '||owner||'.'||table_name||' enable row movement;
alter table '||owner||'.'||table_name||' shrink space compact;
alter table '||owner||'.'||table_name||' shrink space;
exec DBMS_STATS.GATHER_TABLE_STATS(OWNNAME => '''||owner||''', TABNAME => '''||table_name||''', ESTIMATE_PERCENT  =>  ''25'', GRANULARITY => ''DEFAULT'' ,CASCADE  =>  TRUE );
' "Fix Table"
from dba_tables
where
--table_name ='&table_Name'
--AND
OWNER ='DIGIDATA'
and avg_row_len > 0
order by num_rows desc;

-- Check for ASSM (Auto Segment Space management)  If not no shrink command benefits
SELECT tablespace_name, extent_management, segment_space_management FROM dba_tablespaces;

