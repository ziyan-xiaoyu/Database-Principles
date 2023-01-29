use Stu_Cou
select b.Sno, avg(Grade) ave
from student a, SC b
group by b.Sno
having avg(Grade)>70
order by ave desc