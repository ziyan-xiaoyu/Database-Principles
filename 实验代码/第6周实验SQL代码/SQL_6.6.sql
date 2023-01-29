use Stu_Cou
delete from Sc_avg
where Sno in(select Sno from Student where Ssex='ÄÐ')