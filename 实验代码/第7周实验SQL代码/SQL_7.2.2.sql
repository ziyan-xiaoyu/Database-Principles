use Stu_Cou
--��ʾӢ��ϵѧ��ԭ��������ѧ��
select Sno,Spre from Student where Sdept='Ӣ��'
go
--�����α�
declare update_spre cursor for
		select Sno,Spre from Student where Sdept='Ӣ��'
for update
--���α�
open update_spre
--��ȡ����
while(0=0)
	begin
		fetch update_spre
		if(@@FETCH_STATUS<>0) break
		update Student
		set Spre = Spre+8
		where current of update_spre
	end
--�ر��α�
close update_spre
--�ͷ��α�
deallocate update_spre
go
--��ʾӢ��ϵѧ���µ�����ѧ��
select Sno,Spre from Student where Sdept='Ӣ��'
go