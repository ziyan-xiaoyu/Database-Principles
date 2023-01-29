create table C1
(Cno char(6) not null constraint c_u unique,
Cname varchar(20) not null,
Ctype char(8),
Cpno char(6),
Ccredit int)