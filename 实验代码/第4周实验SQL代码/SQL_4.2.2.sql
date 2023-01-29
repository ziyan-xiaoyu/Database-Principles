use Stu_Cou
select Sno
from Student x
where not exists
	(select * from SC y
	where Sno='96001'
		and not exists
			(select * from SC
			where Sno=x.Sno and Cno=y.Cno
			)
	)