use Stu_Cou
select Sclass �༶, count(distinct a.Sno) ѧ������, 
       avg(Grade) ��ƽ���ɼ�
from Student a left outer join SC b on a.Sno=b.Sno
group by Sclass