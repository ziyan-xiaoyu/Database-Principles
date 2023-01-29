--声明变量
use Stu_Cou
declare @cno char(6)
declare @cname varchar(20)
--定义游标
declare c_sdept cursor for
		select distinct b.Cno,Cname
		from Student a, Course b, SC c
		where a.Sno=c.Sno and b.Cno=c.Cno
			and Sdept = '计算机'
for read only
--打开游标
open c_sdept
--读取数据
while(0=0)
	begin
		fetch next from c_sdept
			into @cno, @cname
		if(@@FETCH_STATUS<>0) break
		print '课程号：'+@cno+',课程名:'+@cname
	end
--关闭游标
close c_sdept
--释放游标
deallocate c_sdept