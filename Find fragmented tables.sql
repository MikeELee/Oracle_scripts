select owner,table_name,round((blocks*8),2)||'kb' "Fragmented size"
, round((num_rows*avg_row_len/1024),2)||'kb' "Actual size"
, round((blocks*8),2)-round((num_rows*avg_row_len/1024),2)||'kb' "Diff (reclaimable)"
, round(((round((blocks*8),2)-round((num_rows*avg_row_len/1024),2))/round((blocks*8),2))*100 -10) "reclaimable space % "
, num_rows
from dba_tables
where
--table_name ='&table_Name'
--AND
OWNER ='DIGIDATA'
and avg_row_len > 0
order by num_rows desc;


