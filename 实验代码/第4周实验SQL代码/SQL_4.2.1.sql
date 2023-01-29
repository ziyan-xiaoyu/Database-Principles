use Stu_Cou
select * from Course c
where not exists
	(select * from Student x
	where not exists
			(select * from SC 
			where Sno=x.Sno and Cno=c.Cno
			)
	)