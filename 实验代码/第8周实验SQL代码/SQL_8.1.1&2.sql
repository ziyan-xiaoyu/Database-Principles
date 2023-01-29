use Stu_Cou
if exists(select name from sysobjects
		  where name='no_grade' and type='p')
   drop procedure no_grade
go
create procedure no_grade
as
select a.Sno, Sname, Cname, grade
from Student a, Course b, SC c
where a.Sno=c.Sno and b.Cno=c.Cno and 
	  a.Sno in(select Sno from SC where grade is null)
go

if exists(select Sno from SC where grade is null)
	exec no_grade