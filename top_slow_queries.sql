
select * from sys.dm_exec_sql_text()

select * from sys.dm_exec_query_stats eqs 


------query start
Select distinct top 20 
--execute sql text 
est.text as query ,db_name(dbid) ,
--//execution count
eqs.execution_count as execcount,
--maximum elapsed time by query
eqs.max_elapsed_time maxlapsedtime,

isnull(eqs.total_elapsed_time /  nullif(eqs.execution_count,0),0) as avgelapsedtime ,

--example isnull
--select name,isnull(PRESENT_STATUS,'nodata') from sanu..attend

eqs.creation_time as creation_time , 

isnull(eqs.execution_count/ nullif(datediff(s, eqs.creation_time, getdate()),0),0)   as exec_per_second, 

total_physical_reads as agg_physical_reads from sys.dm_exec_query_stats eqs 

cross apply sys.dm_exec_sql_text(eqs.sql_handle) est order by eqs.max_elapsed_time desc



--select  * from sys.dm_exec_query_stats 
--select  * from   sys.dm_exec_sql_text(0x020000008604D91CA9F06799CE074F7300128D092E006FD80000000000000000000000000000000000000000)
