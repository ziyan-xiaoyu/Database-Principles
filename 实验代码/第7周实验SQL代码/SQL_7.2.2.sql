use Stu_Cou
--显示英语系学生原来的已修学分
select Sno,Spre from Student where Sdept='英语'
go
--定义游标
declare update_spre cursor for
		select Sno,Spre from Student where Sdept='英语'
for update
--打开游标
open update_spre
--读取数据
while(0=0)
	begin
		fetch update_spre
		if(@@FETCH_STATUS<>0) break
		update Student
		set Spre = Spre+8
		where current of update_spre
	end
--关闭游标
close update_spre
--释放游标
deallocate update_spre
go
--显示英语系学生新的已修学分
select Sno,Spre from Student where Sdept='英语'
go