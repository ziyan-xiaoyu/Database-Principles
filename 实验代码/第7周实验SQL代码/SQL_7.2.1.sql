--��������
use Stu_Cou
declare @cno char(6)
declare @cname varchar(20)
--�����α�
declare c_sdept cursor for
		select distinct b.Cno,Cname
		from Student a, Course b, SC c
		where a.Sno=c.Sno and b.Cno=c.Cno
			and Sdept = '�����'
for read only
--���α�
open c_sdept
--��ȡ����
while(0=0)
	begin
		fetch next from c_sdept
			into @cno, @cname
		if(@@FETCH_STATUS<>0) break
		print '�γ̺ţ�'+@cno+',�γ���:'+@cname
	end
--�ر��α�
close c_sdept
--�ͷ��α�
deallocate c_sdept