

select * from Students

select department,max(totalmarks)

from Students group by department


select s.*,max(TotalMarks) over() as max_marks
from students s;


select s.*,max(TotalMarks) over(parti department) as max_marks
from students s;
