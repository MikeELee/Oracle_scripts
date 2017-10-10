conn wtv/wtv@bisu

select h.table_name,h.partition_name,L.HIGH_VALUE LOW_VALUE,H.HIGH_VALUE
--,'ALTER TABLE '||h.table_name||' TRUNCATE PARTITION '||h.partition_name||' DROP STORAGE ;'
,'ALTER TABLE '||h.table_name||'  MODIFY PARTITION '||h.partition_name||'  DEALLOCATE UNUSED;'
--,'ALTER TABLE '||h.table_name||'  MOVE    PARTITION '||h.partition_name||'     NOLOGGING     TABLESPACE CUST_DATA01     PCTUSED    40     PCTFREE    10     INITRANS   1     MAXTRANS   255     STORAGE    (                 INITIAL          64K                 NEXT             64K                 MINEXTENTS       1                 PCTINCREASE      0                 FREELISTS        1                 FREELIST GROUPS  1                 BUFFER_POOL      DEFAULT                );'
from DBA_TAB_PARTITIONS H, DBA_TAB_PARTITIONS L
where H.TABLE_OWNER='WTV'
--and H.table_name='WAPTV_CP_STATS_3'
--AND H.PARTITION_NAME !='WAPTV_QOS_P1'
--AND H.PARTITION_NAME < 'WAPTV_QOS_P37'
AND H.TABLE_OWNER=L.TABLE_OWNER
AND H.table_name=L.table_name
and (h.PARTITION_NAME) NOT LIKE '%MAX%'
AND L.PARTITION_POSITION=H.PARTITION_POSITION-1 ;
