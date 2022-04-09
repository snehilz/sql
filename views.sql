
select * from hp_employee_profile

create view ot_dtl  as
select employee_code,prf.employee_id,first_name+'  '+middle_name +'  '+last_name ename  ,check_in ,ot_mins from hp_employee_profile prf, hp_employee_hr_info inf, hp_extra_ot ot where ot.employee_id = 
prf.employee_id and inf.employee_id = prf.employee_id and check_in>'2021-01-01'

select * from ot_dtl 

create view leave_dtl  as

select employee_code,prf.employee_id,first_name+'  '+middle_name +'  '+last_name ename  ,lt.leave_type_id,leave_type_name,
sum(opening_balance) ob ,
isnull((select sum(case when half_full ='f' then 1 else .5 end)  from  hp_leave_application_days dy , 
hp_leave_applications ap where ap.employee_id= dy.employee_id  and
application_status ='A' and dy.leave_type_id = lt.leave_type_id and leave_date>'2020-12-31'
and ap.employee_id= prf.employee_id),0) availed 
from hp_employee_profile prf, hp_employee_hr_info inf ,hp_leave_type lt , hp_employee_leave_opening_balance ob  
where  inf.employee_id = prf.employee_id and  lt.leave_type_id= ob.leave_type_id and ob.employee_id= prf.employee_id and
as_on_date >'2020-12-31'  and leave_type_name  not like 'leave with%'
group by lt.leave_type_id,employee_code,prf.employee_id,first_name+'  '+middle_name +'  '+last_name   ,leave_type_name

select * from ot_dtl

select employee_id,employee_code,first_name,employee_password from hp_employee_profile

where employee_id=295

select * from  leave_dtl
where employee_code='NW3440036' and leave_type_name='Casual Leave'


select distinct(leave_type_name) from leave_dtl;




select  * from  hp_leave_application_days dy , 
hp_leave_applications ap where ap.employee_id= dy.employee_id  and
application_status ='A'  and leave_date>'2020-12-31' 
and ap.employee_id= 295

select dy.* from hp_leave_applications ap ,hp_leave_application_days dy  where dy.employee_id=295 and
leave_date>'2020-12-31' and ap.employee_id = dy.employee_id 
select * from  hp_leave_applications where employee_id=295


ALTER  VIEW PAYSLIDATA AS 
select 'GUWAHATI' LOCATION , CASE HDR.DIVISION_ID WHEN 1 THEN 'ARL ASBESTOS' WHEN 2 THEN 'ARL STEEL' WHEN 3 THEN 'PDP STEEL' WHEN 4 THEN 'NORTH EAST ROOFING PVT LTD.' END UNIT ,EMPLOYEE_CODE,FIRST_NAME+ ' '+MIDDLE_NAME+' '+LAST_NAME NAME ,department_name,designation_name,PAYABLE_DAYS,GROSS_PAY,NET_PAY, PAYROLL_CYCLE_NAME,HEAD_NAME,HEAD_TYPE,HEAD_dEFAULT_AMOUNT,HEAD_ACTUAL_AMOUNT from HP_EMPLOYEE_PROFILE PRF, HP_EMPLOYEE_HR_INFO INF, HP_DEPARTMENT DEPT, HP_DESIGNATION DESG, 
HP_PAYROLL_HDR HDR, hp_payroll_dtls DTL ,HP_PAYROLL_CYCLE PC   where   HDR.employee_id = 395 and 
DTL.PAYROLL_CYCLE_ID= PC.PAYROLL_CYCLE_ID AND
PC.payroll_cycle_id =189 AND HDR.HDR_ID= DTL.HDR_ID AND INF.employee_id = PRF.employee_ID AND PRF.employee_id = HDR.employee_id AND
INF.primary_dept_id = DEPT.department_id AND INF.designation_id = DESG.designation_id 

SELECT * FROM PAYSLIDATA 


ALTER  VIEW PAYSLIDATA AS 
select 'GUWAHATI' LOCATION , CASE HDR.DIVISION_ID WHEN 1 THEN 'ARL ASBESTOS' WHEN 2 THEN 'ARL STEEL' WHEN 3 THEN 'PDP STEEL' WHEN 4 THEN 'NORTH EAST ROOFING PVT LTD.' END UNIT 
,EMPLOYEE_CODE,FIRST_NAME+ ' '+MIDDLE_NAME+' '+LAST_NAME NAME ,department_name,designation_name,PAYABLE_DAYS,GROSS_PAY,NET_PAY, 
PAYROLL_CYCLE_NAME,pc_month,pc_year,HEAD_NAME,HEAD_TYPE, case head_name when 'shift allow' then 0 else HEAD_dEFAULT_AMOUNT end rate ,
sum(HEAD_ACTUAL_AMOUNT)  earning from
HP_EMPLOYEE_PROFILE PRF, HP_EMPLOYEE_HR_INFO INF, HP_DEPARTMENT DEPT, HP_DESIGNATION DESG, 
HP_PAYROLL_HDR HDR, hp_payroll_dtls DTL ,HP_PAYROLL_CYCLE PC   where    HDR.HDR_ID= DTL.HDR_ID AND 
INF.employee_id = PRF.employee_ID AND PRF.employee_id = HDR.employee_id AND  pc.payroll_cycle_id = hdr.payroll_cycle_id and
INF.primary_dept_id = DEPT.department_id AND INF.designation_id = DESG.designation_id and pc.company_id=HDR.company_id
group by   CASE HDR.DIVISION_ID WHEN 1 THEN 'ARL ASBESTOS' WHEN 2 THEN 'ARL STEEL' WHEN 3 THEN 'PDP STEEL' WHEN 4 THEN 'NORTH EAST ROOFING PVT LTD.' END
,EMPLOYEE_CODE,FIRST_NAME+ ' '+MIDDLE_NAME+' '+LAST_NAME  ,department_name,designation_name,PAYABLE_DAYS,GROSS_PAY,NET_PAY, 
PAYROLL_CYCLE_NAME,pc_month,pc_year,HEAD_NAME,HEAD_TYPE, case head_name when 'shift allow' then 0 else HEAD_dEFAULT_AMOUNT end 

and employee_code='ACW1250129' and pc_year=2021 and pc_month=11


2 
select * from  hp_payroll_hdr where employee_id=551


select distinct(pc_month) from hp_payroll_cycle

select distinct(pc_year) from hp_payroll_cycle

,payroll_cycle_name,pc_year from hp_payroll_cycle

SELECT * FROM SYSOBJECTS WHERE NAME LIKE '%DAYS%'

select distinct(payroll_cycle_name) from PAYSLIDATA asec


SELECT distinct head_type,head_name  FROM PAYSLIDATA  where  head_type not in('dln','ern')

>'ern'


order by head_type ,head_name 
select * from sysobjects where type='v'  order by  crdate desc



sp_helptext 	PAYSLIDATA

ERN	Shift Allow
ERN	Trainee Allow

select * from pslipdata where employee_code='AC1160233'  and pc_year=2021 and pc_month=9

select * from hp_employee_profile where employee_code='AC1160233'
AC1160085
where employee_code='PW2340001' and pc_year=2021 and pc_month=10 
alter view  pslipdata as
select 
location,unit,employee_code,name,department_name ,designation_name,payable_days,gross_pay,net_pay,payroll_cycle_name,pc_month,
pc_year,
isnull((select max(rate)  from payslidata  p where p.employee_code= p1.employee_code and p.payroll_cycle_name= p1.payroll_cycle_name and 
head_name in('Cons. Salary','BASIC & DA' ) ),0) as basic_rate ,
isnull((select max(rate)  from payslidata  p where p.employee_code= p1.employee_code and p.payroll_cycle_name= p1.payroll_cycle_name and head_name =
'Vda' ),0) as vda_rate  ,
isnull((select max(rate)  from payslidata  p where p.employee_code= p1.employee_code and p.payroll_cycle_name= p1.payroll_cycle_name and head_name =
'H.R.A.' ),0) as hra_rate ,
isnull((select max(rate)  from payslidata  p where p.employee_code= p1.employee_code and p.payroll_cycle_name= p1.payroll_cycle_name and head_name =
'Spl. Allw.' ),0) as Spl_allow_rate ,
isnull((select max(rate)  from payslidata  p where p.employee_code= p1.employee_code and p.payroll_cycle_name= p1.payroll_cycle_name and head_name =
'Wash. Allw.' ),0)  as Washing_allow_rate ,
isnull((select max(rate)   from payslidata  p where p.employee_code= p1.employee_code and p.payroll_cycle_name= p1.payroll_cycle_name and head_name =
'Med. Allowance' ),0)  as Med_Allowance_rate ,
isnull((select max(rate)  from payslidata  p where p.employee_code= p1.employee_code and p.payroll_cycle_name= p1.payroll_cycle_name and head_name =
'Trainee Allow' ) ,0) as Trainee_Allowance_rate ,
isnull((select max(rate)  from payslidata  p where p.employee_code= p1.employee_code and p.payroll_cycle_name= p1.payroll_cycle_name and head_name =
'Shift Allow' ),0) as Shift_Allowance_rate ,

isnull((select max(earning)  from payslidata  p where p.employee_code= p1.employee_code and p.payroll_cycle_name= p1.payroll_cycle_name and 
head_name in('Cons. Salary','BASIC & DA' ) ),0) as basic_earn ,
isnull((select max(earning)  from payslidata  p where p.employee_code= p1.employee_code and p.payroll_cycle_name= p1.payroll_cycle_name and head_name =
'Vda' ),0) as vda_earn  ,
isnull((select max(earning)  from payslidata  p where p.employee_code= p1.employee_code and p.payroll_cycle_name= p1.payroll_cycle_name and head_name =
'H.R.A.' ),0) as hra_earn ,
isnull((select max(earning)  from payslidata  p where p.employee_code= p1.employee_code and p.payroll_cycle_name= p1.payroll_cycle_name and head_name =
'Spl. Allw.' ),0) as Spl_allow_earn ,
isnull((select max(earning)  from payslidata  p where p.employee_code= p1.employee_code and p.payroll_cycle_name= p1.payroll_cycle_name and head_name =
'Wash. Allw.' ),0)  as Washing_allow_earn ,
isnull((select max(earning)   from payslidata  p where p.employee_code= p1.employee_code and p.payroll_cycle_name= p1.payroll_cycle_name and head_name =
'Med. Allowance' ),0)  as Med_Allowance_earn ,
isnull((select max(earning)  from payslidata  p where p.employee_code= p1.employee_code and p.payroll_cycle_name= p1.payroll_cycle_name and head_name =
'Trainee Allow' ) ,0) as Trainee_Allowance_earn ,

isnull((select max(earning)  from payslidata  p where p.employee_code= p1.employee_code and p.payroll_cycle_name= p1.payroll_cycle_name and head_name =
'Shift Allow' ),0) as Shift_Allowance_earn ,

isnull((select sum(earning)  from payslidata  p where p.employee_code= p1.employee_code and p.payroll_cycle_name= 
p1.payroll_cycle_name and head_type='dln' ),0) as  staff_advance_ded,
isnull((select sum(earning)  from payslidata  p where p.employee_code= p1.employee_code and p.payroll_cycle_name= 
p1.payroll_cycle_name and head_name='provident fund' ),0) as  pf_ded,
isnull((select sum(earning)  from payslidata  p where p.employee_code= p1.employee_code and p.payroll_cycle_name= 
p1.payroll_cycle_name and head_name in('e.s.i','E.S.I.' ) ),0) as  ESI_ded,
isnull((select sum(earning)  from payslidata  p where p.employee_code= p1.employee_code and p.payroll_cycle_name= 
p1.payroll_cycle_name and head_name ='Income Tax' ),0) as  itax_ded,
isnull((select sum(earning)  from payslidata  p where p.employee_code= p1.employee_code and p.payroll_cycle_name= 
p1.payroll_cycle_name and head_name='Professional Tax' ),0) as  prof_tax,
isnull((select sum(earning)  from payslidata  p where p.employee_code= p1.employee_code and p.payroll_cycle_name= 
p1.payroll_cycle_name and head_name ='lic' ),0) as  LIc_ded,
isnull((select sum(earning)  from payslidata  p where p.employee_code= p1.employee_code and p.payroll_cycle_name= 
p1.payroll_cycle_name and head_type='Canteen Managing Commi.M.C.' ),0) as  Canteen_ded,
isnull((select sum(earning)  from payslidata  p where p.employee_code= p1.employee_code and p.payroll_cycle_name= 
p1.payroll_cycle_name and head_name='Co-Op. Cont.' ),0) as  coop_cont_ded,
isnull((select sum(earning)  from payslidata  p where p.employee_code= p1.employee_code and p.payroll_cycle_name= 
p1.payroll_cycle_name and head_name='Co-op. Loan' ),0) as  coop_loan_ded
from PAYSLIDATA p1 
group by  location,unit,employee_code,name,department_name ,designation_name,payable_days,gross_pay,net_pay,payroll_cycle_name,pc_month,
pc_year


DED	Canteen Managing Commi.M.C.
DCC	Co-Op. Cont.
DCL	Co-op. Loan

select 'HEAD_NAME' as headtype,[BASIC & DA],
[Canteen Managing Commi.M.C.],[Co-Op. Cont.],[Co-op. Loan],[Festival Loan Adv.-1],
[H.R.A.],
[LIC],
[Misc.Allow],
[Professional Tax],
[provident fund],
[Shift Allow],
[Spl. Allw.],
[VDA],
[Wash. Allw.]
from(select head_name,earning from PAYSLIDATA where employee_code='PW2340001' and pc_year=2021 and pc_month=10)
as sourcetable
pivot
(earning for head_name in ( [BASIC & DA],
[Canteen Managing Commi.M.C.],[Co-Op. Cont.],[Co-op. Loan],[Festival Loan Adv.-1],
[H.R.A.],
[LIC],
[Misc.Allow],
[Professional Tax],
[provident fund],
[Shift Allow],
[Spl. Allw.],
[VDA],
[Wash. Allw.])
)as pivottable




select sum(case when half_full ='f' then 1 else .5 end)  from  hp_leave_application_days

select *  from PAYSLIDATA where employee_code like 'AE1210158' 

group by pc_month order by(pc_month) asc

















select distinct(pc_year) from PAYSLIDATA where employee_code='ACW1250129' group by pc_year order by(pc_year) desc