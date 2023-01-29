use Stu_Cou
go
create view ms
as
	select a.Sno, Sname, Cno, grade
	from S2 a, SC b
	where a.Sno=b.Sno and Sdept='สýัง'
go

select name from sysobjects
where name = 'ms'

