use Stu_Cou
if exists(select name from sysobjects
		  where name='is_pass' and type='tr')
	drop trigger is_pass
go
create trigger is_pass
on SC for update
as
declare @grade1 int, @grade2 int
select @grade1=grade from deleted
select @grade2=grade from inserted
if @grade1<60 and @grade1<>@grade2
	begin
		raiserror('不能对不及格的成绩进行修改！',16,1)
		rollback
	end
go

use Stu_Cou
update SC
set grade = 80
where Sno='95002' and Cno='3'