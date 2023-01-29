use Stu_Cou
create table Sc_avg(
	Sno char(6) not null,  --学号
	Avgrade numeric(5,1) default 0  --平均成绩
	check(Avgrade between 0.0 and 100.0),
	constraint Sc_avgPK primary key(Sno)
	)

insert into Sc_avg
	select Sno, avg(grade)
	from SC
	group by Sno
