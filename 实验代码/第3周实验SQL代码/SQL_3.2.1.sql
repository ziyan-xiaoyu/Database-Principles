use Stu_Cou
select Sname 姓名, year(getdate())-year(Sbirth) 年龄
from Student
where Sdept='数学'