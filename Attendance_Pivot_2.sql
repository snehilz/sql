
declare @STARTDATE DATETIME
declare @ENDDATE DATETIME  
set @STARTDATE='2016-07-01'
set @ENDDATE='2016-07-10'
declare @countz int =0

select  @countz 



drop table #tmp_dates
set nocount on

create table #TMP_DATES (date1 smalldatetime)
declare @countz int =0
while(@countz<10)
begin
set @countz = @countz+1 
insert into #TMP_DATES values(DATEADD(DD,1, getdate()-@countz ))
end 
select  * from #TMP_DATES


WITH DATERANGE AS  
(  
   SELECT DT =DATEADD(DD,0, getdate()-100 )  
   WHERE DATEADD(DD, 1, getdate()-100 ) <= getdate()  
  UNION ALL  
  SELECT DATEADD(DD, 1, DT)  
   FROM DATERANGE  
   WHERE DATEADD(DD, 1, DT) <= getdate() 
)  
SELECT * INTO #TMP_DATES  
FROM DATERANGE  





use sanu


CREATE TABLE attend
(  
   NAME VARCHAR(50),  
   DATE DATETIME ,  
   PRESENT_STATUS VARCHAR(10)  
)  



INSERT INTO Attend VALUES ('Sanu','2016-07-04','PRESENT')  
INSERT INTO Attend VALUES ('Lihens','2016-07-04','PRESENT')  
INSERT INTO Attend VALUES ('Sanu','2016-07-05','PRESENT')  
INSERT INTO Attend VALUES ('Lihens','2016-07-05','ABSENT')  
INSERT INTO Attend VALUES ('Sanu','2016-07-06','PRESENT')  
INSERT INTO Attend VALUES ('Lihens','2016-07-06','PRESENT')  


INSERT INTO Attend VALUES ('Sanu','2016-08-04','ABSENT')  
INSERT INTO Attend VALUES ('Lihens','2016-08-04','PRESENT')  
INSERT INTO Attend VALUES ('Sanu','2016-08-05','ABSENT')  
INSERT INTO Attend VALUES ('Lihens','2016-08-05','ABSENT')  
INSERT INTO Attend VALUES ('Sanu','2016-08-06','ABSENT')  
INSERT INTO Attend VALUES ('Lihens','2016-08-06','PRESENT')  



Select * from attend order by DATE;



alter procedure 
ATTENDANCEREPORT   

declare @STARTDATE DATETIME
declare @ENDDATE DATETIME  
set @STARTDATE='2016-07-01'
set @ENDDATE='2016-07-10'
WITH DATERANGE AS  
(  
   SELECT DT =DATEADD(DD,0, @STARTDATE)  
   WHERE DATEADD(DD, 1, @STARTDATE) <= @ENDDATE  
   UNION ALL  
   SELECT DATEADD(DD, 1, DT)  
   FROM DATERANGE  
   WHERE DATEADD(DD, 1, DT) <= @ENDDATE  
)  
SELECT * INTO #TMP_DATES  
FROM DATERANGE  


drop table #TMP_DATES 


create table #TMP_DATES (dt datetime)
declare @countz int =0, @dt datetime 
select  @dt = min(date) from attend 
while(@countz<30)
begin
set @countz = @countz+1 
insert into #TMP_DATES values(DATEADD(DD,1, @dt+ @countz ))
end 

DECLARE @COLUMN VARCHAR(MAX)  
SELECT @COLUMN=ISNULL(@COLUMN+',','')+ '['+ CAST(CONVERT(DATE , T.DT) AS VARCHAR) + ']' FROM #TMP_DATES T
DECLARE @Columns2 VARCHAR(MAX)  
SET @Columns2 = SUBSTRING((SELECT DISTINCT ',ISNULL(['+ CAST(CONVERT(DATE , DT) 
as varchar )+'],''N/A'') AS ['+CAST(CONVERT(DATE , DT) as varchar )+']' 
FROM #TMP_DATES GROUP BY dt FOR XML PATH('')),2,8000)  
select  @columns2 

 SELECT NAME, @Columns2 FROM  attend 

DECLARE @QUERY VARCHAR(MAX)  

SET @QUERY = 'SELECT NAME, ' + @Columns2 +' FROM   
(  
SELECT A.NAME , B.DT AS DATE, A.PRESENT_STATUS FROM attend A RIGHT OUTER JOIN #TMP_DATES B ON A.DATE=B.DT   
) X  
PIVOT   
(  
MIN([PRESENT_STATUS])  
FOR [DATE] IN (' + @COLUMN + ')  
) P   '

--WHERE ISNULL(NAME,'''')<>''''  
--'


execute  (@QUERY)  
DROP TABLE #TMP_DATES  
  


EXEC dbo.ATTENDANCEREPORT @STARTDATE ='2016-07-01',  
@ENDDATE='2016-07-31'  

