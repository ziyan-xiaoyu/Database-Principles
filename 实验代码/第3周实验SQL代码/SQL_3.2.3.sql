use Stu_Cou
select distinct b.Sno
from Student a, SC b
group by b.Sno
having min(Grade)>=80