select OPNAME
,MESSAGE,NVL(TIME_REMAINING,0) Seconds
,ROUND(NVL(TIME_REMAINING,0)/60) Minutes
,ROUND((SOFAR/DECODE(TOTALWORK,'0','1',TOTALWORK))*100)||' %' "PERCENT COMP"
,ELAPSED_SECONDS,SOFAR,TOTALWORK,START_TIME,LAST_UPDATE_TIME,v$session.SID,v$session.SERIAL#,TARGET , SQL_TEXT
from V$SESSION_LONGOPS
LEFT OUTER JOIN v$session ON v$session.SID=V$SESSION_LONGOPS.SID AND v$session.SERIAL#=V$SESSION_LONGOPS.SERIAL#
LEFT OUTER JOIN V$SQL ON v$session.sql_hash_value=HASH_VALUE and osuser is not null
where trunc(start_time)=trunc(sysdate)
order by
last_update_time desc
;

