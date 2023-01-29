use Stu_Cou
select a.Cno, Cname, Sno, Grade
from Course a LEFT OUTER JOIN SC b on a.Cno=b.Cno