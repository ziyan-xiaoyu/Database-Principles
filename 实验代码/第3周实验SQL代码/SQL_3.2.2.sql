use Stu_Cou
select Ctype 类型, count(*) 门数
from Course
group by Ctype