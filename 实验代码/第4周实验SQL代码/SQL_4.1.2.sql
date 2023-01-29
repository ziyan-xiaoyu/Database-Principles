use Stu_Cou
select a.Sno,Sname
from Student a, Course b,SC c
where a.Sno=c.Sno and b.Cno=c.Cno
      and Cname='²Ù×÷ÏµÍ³'