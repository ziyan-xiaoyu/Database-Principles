use Stu_Cou
if exists(select name from sysobjects
		  where name='cpro' and type='p')
	drop procedure cpro
go
create procedure cpro(@name varchar(20), @ctype char(8))
as
select Cno,Cname,Ctype,Ccredit
from Course
where Cname like @name and Ctype=@ctype
go

exec cpro '%Êý¾Ý%', '±ØÐÞ'
go