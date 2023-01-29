use Stu_Cou
create unique nonclustered
index sc_c 
ON SC(Sno DESC, Cno DESC)

sp_helpindex SC