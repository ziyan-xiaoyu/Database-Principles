use Stu_Cou
alter table SC
add constraint fk_sc_s foreign key(Cno)
references Course(Cno)

use Stu_Cou
select name, type from sysobjects
where name ='s_xh_pk' or name = 'fk_sc_s'