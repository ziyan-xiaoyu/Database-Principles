create procedure maxscorepro
as
select * from SC a
where not exists(select * from SC b
				where a.Sno=b.Sno and a.Cno=b.Cno and a.Grade<b.Grade)

exec maxscorepro