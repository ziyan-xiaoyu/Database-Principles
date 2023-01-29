use Stu_Cou
select Sclass 班级, count(distinct a.Sno) 学生人数, 
       avg(Grade) 总平均成绩
from Student a left outer join SC b on a.Sno=b.Sno
group by Sclass