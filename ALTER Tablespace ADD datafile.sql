select *
from dba_data_files
where tablespace_name = 'DIGITALDATA';

--connect sys/janet@cndr.uk;

ALTER  TABLESPACE DIGITALDATA
ADD    DATAFILE '/u02/app/oracle/oradata/digDEV/DIGITALDATA18.dbf' SIZE 5G;

ALTER  TABLESPACE DIGITALDATA
ADD    DATAFILE '/u02/datafiles_digidev12c/DIGITALDATA06.dbf' SIZE 5G;

--ALTER  TABLESPACE CONDOR_TEMP1
--ADD    DATAFILE '/data/oradata/tsf/UKCON/temp4UKCON.dbf' SIZE 1000M;
--
--ALTER  TABLESPACE CONDOR_TEMP1
--ADD    DATAFILE '/data/oradata/tsf/UKCON/temp5UKCON.dbf' SIZE 1000M;

--ALTER DATABASE DATAFILE '/u02/app/oracle/oradata/digDEV3/DIGITALDATA03.dbf' AUTOEXTEND ON;

