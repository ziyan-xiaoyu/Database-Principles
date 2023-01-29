use Stu_Cou
select Cno
from SC  SC1
where Sno='95001' and exists
(select * from SC SC2
where Sno='95002' and Cno=SC1.Cno)