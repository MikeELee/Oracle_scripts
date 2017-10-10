prompt ** Tablespace Space Usage **
prompt
prompt Goal: Keep tablespace usage < 80%
prompt . Keep contiguous free space
prompt
prompt Corrective Action: Add more space to prompt tablespaces
prompt Coalesce fragmented free space.
prompt
compute sum LABEL 'TOTAL' of SUM_B1 on report
compute sum LABEL 'TOTAL' of SUM_B2 on report
compute sum LABEL 'TOTAL' of b3 on report
BREAK ON REPORT
Column TS1 Format A25 Heading 'TS Name'
Column SUM_B1 Format 999,999,999,999 Heading 'Total Space|Allocated'
Column SUM_B2 Format 999,999,999,999 Heading 'Total Free|Space'
Column b3 Format 999,999,999,999 Heading 'Total Space|Used'
Column b4 Format 90.99 Heading 'Percent|Used'
Column b5 Format 990.99 Heading 'Percent|Free'
Column b6 Format 99,999,999,999 Heading 'Max Single|Free Space'
Column b7 Format 999,999 Heading 'Count|Free|Space'

select a.TS1,
(1-(b.SUM_B2/a.SUM_B1))*100 b4,
(b.SUM_B2/a.SUM_B1)*100 b5,
a.SUM_B1,
a.SUM_B1 - b.SUM_B2 b3,
b.SUM_B2,
b.MAX_B2 b6,
b.CNT_B2 b7
FROM
(select tablespace_name TS1,
sum(bytes) SUM_B1
from dba_data_files
group by tablespace_name) a,
(select tablespace_name TS2,
sum(bytes) SUM_B2,
max(bytes) MAX_B2,
count(bytes) CNT_B2
from dba_free_space
group by tablespace_name) b
where a.TS1=b.TS2;
