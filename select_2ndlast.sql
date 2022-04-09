select * from users

alter table  students add department varchar(20)



CREATE TABLE Students(
Id int,
Name varchar(20),
TotalMarks int);

INSERT INTO Students VALUES (1,'Neha',90);
INSERT INTO Students VALUES (2,'Sahil',50);
INSERT INTO Students VALUES (3,'Rohan',70);
INSERT INTO Students VALUES (4,'Ankita',80);
INSERT INTO Students VALUES (5,'Rahul',65);
INSERT INTO Students VALUES (6,'Swati',55);
INSERT INTO Students VALUES (7,'Alka',75);
INSERT INTO Students VALUES (3,'Rohan',70);
INSERT INTO Students VALUES (16,'Ankita',33,'A');
INSERT INTO Students VALUES (17,'Rahul',55,'A');
INSERT INTO Students VALUES (18,'Swati',46,'D');
INSERT INTO Students VALUES (15,'Alka',22,'C');


update Students set TotalMarks='81' where id=8

select * from Students order by TotalMarks desc

SELECT TOP 2 * From
(select Top 6 * from Students ORDER BY id desc) x                   
ORDER BY id asc

SELECT top 2 * From
(select Top 6 * from Students ORDER BY id asc) x                   
ORDER BY id desc


select department,totalmarks  from students s1  where totalmarks in
(select top 2 totalmarks  from students s2 where s1.department = s2.department order by TotalMarks desc )
order by department

select  department,totalmarks  from students s1  where totalmarks not  in
(select top 2 totalmarks  from students s2 where s1.department = s2.department order by TotalMarks desc )
order by department

select * from students order by department,TotalMarks desc





select * from Students 



select department ,max(totalmarks) from Students group by department


select * from (
select rank() over(PARTITION by department order by totalmarks desc )as 'rank',* from Students)
as a  where rank in( 3, 4)

select * from students order by department,TotalMarks desc


select  department,totalmarks  from students s1  where totalmarks not  in
(select top 2 2 totalmarks  from students s2 where s1.department = s2.department order by TotalMarks desc )
order by department





--select  * from Students where TotalMarks in(
--select  max(TotalMarks) as marks from students group by department) where row_number =2



--select  * from Students where TotalMarks in(
--select  top 2 TotalMarks as marks from students
--group by department
--)
