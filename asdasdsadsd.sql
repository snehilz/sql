
CREATE TABLE attendance(
userId int ,
checktime smalldatetime,
checktype  varchar(1));



INSERT INTO attendance VALUES (1,getdate(),'I');

select * from attendance



DECLARE @i INT = 1;
WHILE (@i <= 15)

 BEGIN

 WAITFOR DELAY '00:00:30'

 /*Your Script*/
 INSERT INTO attendance VALUES (2,getdate(),'I');


 SET @i = @i + 1;

END


SELECT *
FROM attendance 
WHERE checktime>= DATEADD(minute,-30,GETDATE())

sp_help  attendance 

use sanu

select * from attendance

SELECT
   userId,checktype, datepart(hour,checktime) hr, COUNT(*) cnt,min(checktime) mn,max(checktime) mx
into #t2 FROM    attendance 
GROUP BY  userId,checktype,datepart(hour,checktime)
SELECT * FROM #T2 


SELECT  * FROM attendance ATT, #T2  WHERE ATT.CHECKTIME >MN AND ATT.CHECKTYPE='I' AND #T2.USERID  =ATT.USERID  
AND ATT.CHECKTYPE = #T2.CHECKTYPE  AND HR = DATEPART(HOUR,CHECKTIME) AND CNT>1 

SELECT  * FROM attendance ATT, #T2  WHERE ATT.CHECKTIME <MX  AND ATT.CHECKTYPE='o' AND #T2.USERID  =ATT.USERID  
AND ATT.CHECKTYPE = #T2.CHECKTYPE  AND HR = DATEPART(HOUR,CHECKTIME) AND CNT>1  AND ATT.USERID=2


SELECT * FROM attendance WHERE USERID = 2 AND CHECKTYPE='o' AND CHECKTIME BETWEEN '2021-10-17' AND '2021-10-18'

ALTER TABLE ATTENDANCE ALTER COLUMN CHECKTIME DATETIME 


where checktime between '2021-01-01' and '2099-01-01'

select * into #1  from  attendance
insert into attendance select * from #1 

select * from #1
update #1 set userid = userid+50
update attendance set checktype='O' where datepart(hour,checktime)>15

update #1 set  checktime = checktime +.8

005








	
HAVING 
    COUNT(*) > 1

	select * from attendance where checktime between '2021/10/16 18:00:00' and  '2021/10/17 19:00:00'

	select datepart(hour,getdate())
