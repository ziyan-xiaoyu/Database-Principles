set nocount    on
set dateformat mdy
go
use master
go

if exists (select * from sysdatabases where name='ScoreDB')
  drop database ScoreDB
go

create database ScoreDB
on 
  ( name='ScoreDB',
    filename='d:\sqlWork\ScoreDB.mdf',
    size=5,
    maxsize=10,
    filegrowth= 5)
log on
 ( name='ScoreLog',
   filename='d:\sqlWork\ScoreLog.ldf',
   size=2,
   maxsize=5,
   filegrowth=1)
go

use ScoreDB
go
  
print 'create Course'
go

CREATE TABLE Course (
  courseNo	  char(3) 	        NOT NULL ,  --�γ̺�
  courseName	  varchar(30) unique    NOT NULL,   --�γ���
  creditHour      numeric(1)  default 0 NOT NULL,   --ѧ��
  courseHour      tinyint     default 0 NOT NULL,   --��ʱ��
  priorCourse     char(3)		NULL,       --���޿γ�        
  constraint CoursePK primary key (courseNo),
  FOREIGN KEY (PriorCourse) REFERENCES  Course(courseNo)  
) 
go

insert into Course values('001','��ѧ����',2,32,null)
insert into Course values('002','����',    2,32,null)
insert into Course values('003','��ѧӢ��',3,48,null)
insert into Course values('004','�ߵ���ѧ',6,96,null)

insert into Course values('005','C���Գ������',4,80,'004')
insert into Course values('006','�����ԭ��',4,64,'005')
insert into Course values('007','���ݽṹ',5,96,'005')
insert into Course values('008','����ϵͳ',4,64,'007')
insert into Course values('009','���ݿ�ϵͳԭ��',4,80,'008')

insert into Course values('010','���ѧԭ��',4,64,'004')
insert into Course values('011','�м�������',5,80,'010')

go


------------------------------------------------------------------
------------------------------------------------------------------
print 'create Class'
go

CREATE TABLE Class (
  classNo	  char(6) 	          NOT NULL ,  --�༶��
  className	  varchar(30)  unique     NOT NULL,   --�༶��
  institute       varchar(30)             NOT NULL,   --����ѧԺ
  grade           smallint     default 0  NOT NULL,   --�꼶
  classNum        tinyint		  NULL,       --�༶����        
  constraint ClassPK primary key (ClassNo) 
) 
go

insert into Class values('CS1501','�������ѧ�뼼��15-01��','��Ϣ����ѧԺ',2015,null)
insert into Class values('CS1502','�������ѧ�뼼��15-02��','��Ϣ����ѧԺ',2015,null)
insert into Class values('IS1501','��Ϣ��������Ϣϵͳ15-01��','��Ϣ����ѧԺ',2015,null)
insert into Class values('IS1601','��Ϣ��������Ϣϵͳ16-01��','��Ϣ����ѧԺ',2016,null)
insert into Class values('CP1601','ע����16_01��','���ѧԺ',2016,null)
insert into Class values('CP1602','ע����16_02��','���ѧԺ',2016,null)
insert into Class values('CP1603','ע����16_03��','���ѧԺ',2016,null)
insert into Class values('ER1501','���ڹ���15-01��','����ѧԺ',2015,null)
insert into Class values('CS1601','�������ѧ�뼼��16-01��','��Ϣ����ѧԺ',2016,null)

go

------------------------------------------------------------------
------------------------------------------------------------------
print 'Student'
go
CREATE TABLE Student (
  studentNo	char(7) 		  NOT NULL 
    check ( StudentNo like '[0-9][0-9][0-9][0-9][0-9][0-9][0-9]'),  --ѧ��
  studentName	varchar(20) 		  NOT NULL ,          --����
  sex 	        char(2) 		      NULL ,          --�Ա�
  birthday	datetime 		      NULL ,          --��������
  native        varchar(20)                   NULL ,          --����                
  nation	varchar(30) default '����'    NULL,           --����
  classNo	char(6) 	              NULL            --�����༶	
  constraint StudentPK primary key (studentNo),
  constraint StudentFK foreign key(classNo) references Class(classNo)
) 
go

insert into Student values('1600001','����',   '��','1998-12-21 00:00','�ϲ�','����',   'CS1601')
insert into Student values('1600002','����',   'Ů','1998-11-11 00:00','�Ž�','����',   'IS1601')
insert into Student values('1600003','����',   'Ů','1998-10-01 00:00','�Ϻ�','����',   'IS1601')
insert into Student values('1600004','����',   '��','1999-05-20 00:00','�ϲ�','�ɹ���', 'CS1601')
insert into Student values('1600005','����',   '��','1999-04-26 00:00','�ϲ�','�ɹ���', 'CP1602')
insert into Student values('1600006','��־ǿ', '��','1999-12-21 00:00','����','����',   'CP1602')
insert into Student values('1600007','����',   'Ů','1999-08-21 00:00','����','���',   'IS1601')
insert into Student values('1600008','��С��', 'Ů','1999-08-09 00:00','����','����',   'CS1601')
insert into Student values('1600009','����',   '��','1999-11-21 00:00','�Ž�','����',   'CP1602')
insert into Student values('1600010','����', 'Ů','1998-03-09 00:00','�Ϻ�','����',   'CP1602')
insert into Student values('1600011','������', '��','1998-12-20 00:00','�Ϻ�','����',   'CP1602')
insert into Student values('1600012','������', '��','1998-11-18 00:00','����','����',   'CS1601')
insert into Student values('1600013','��С��', 'Ů','1999-07-16 00:00','����','������', 'IS1601')
insert into Student values('1600014','�����', '��','1999-09-16 00:00','����','����',   'IS1601')
insert into Student values('1600015','����',   'Ů','1997-01-20 00:00','����','���',   'CP1602')
insert into Student values('1500001','��С��',   '��','1998-12-21 00:00','�ϲ�','����',   'CS1501')
insert into Student values('1500002','������',   'Ů','1998-11-11 00:00','�Ž�','����',   'IS1501')
insert into Student values('1500003','������',   'Ů','1997-10-01 00:00','�Ϻ�','����',   'IS1501')
insert into Student values('1500004','�ſ���',   '��','1999-05-20 00:00','�ϲ�','�ɹ���', 'CS1501')
insert into Student values('1500005','����',   '��','2000-04-26 00:00','�ϲ�','�ɹ���',   'CS1502')
go
------------------------------------------------------------------------------------
------------------------------------------------------------------------------------
print 'Term'
go
CREATE TABLE Term (
  termNo	char(3) 	     NOT NULL ,      --ѧ�ں�
  termName	varchar(30)          NOT NULL,       --ѧ����
  remarks       varchar(10)          NULL,           --��ע       
  constraint termPK primary key (termNo) 
) 
go
insert into  Term values('151','2015-2016ѧ���һѧ��',null)
insert into  Term values('152','2015-2016ѧ��ڶ�ѧ��',null)
insert into  Term values('153','2015-2016ѧ�����ѧ��','Сѧ��')
insert into  Term values('161','2016-2017ѧ���һѧ��',null)
insert into  Term values('162','2016-2017ѧ��ڶ�ѧ��',null)
insert into  Term values('163','2016-2017ѧ�����ѧ��','Сѧ��')
go

------------------------------------------------------------------------------------
------------------------------------------------------------------------------------
print 'Score'
go
CREATE TABLE Score (
  studentNo       char(7) 	 	  NOT NULL ,      --ѧ��
  courseNo        char(3) 		  NOT NULL ,      --�γ̺�
  termNo	  char(3) 	          NOT NULL ,      --ѧ�ں�
  score	numeric(5,1) default 0	NOT NULL 
           check( Score between 0.0 and 100.0)   --�ɼ�
  /* Ԫ�鼶������Լ���������������������Թ���*/
  constraint ScorePK primary key (studentNo,courseNo,termNo),
  /* ��������Լ��������studentNo�����룬�����ձ���Student */
  constraint ScoreFK1 foreign key(studentNo) references student(studentNo),
  /* ��������Լ��������courseNo�����룬�����ձ���Course*/
  constraint ScoreFK2 foreign key(termNo) references Term(termNo),
  /* ��������Լ��������termNo�����룬�����ձ���Term*/
  constraint ScoreFK3 foreign key(courseNo) references course(courseNo)
) 
go
insert into Score values('1500001','001','151',98)
insert into Score values('1500001','002','151',82)
insert into Score values('1500001','010','151',86)
insert into Score values('1500001','004','151',56)
insert into Score values('1500001','005','152',77)
insert into Score values('1500001','006','152',76)
insert into Score values('1500001','007','152',77)
insert into Score values('1500001','004','161',86)
insert into Score values('1500001','003','161',82)
insert into Score values('1500001','008','161',82)
insert into Score values('1500001','009','162',77)


insert into Score values('1500005','002','151',80)
insert into Score values('1500005','003','151',69)
insert into Score values('1500005','004','151',87)
insert into Score values('1500005','005','151',77)
insert into Score values('1500005','001','152',79)
insert into Score values('1500005','006','152',69)
insert into Score values('1500005','010','152',69)
insert into Score values('1500005','007','161',90)
insert into Score values('1500005','008','161',87)
insert into Score values('1500005','009','162',90)
insert into Score values('1500005','011','162',68)

insert into Score values('1500003','005','151',60)
insert into Score values('1500003','001','151',46)
insert into Score values('1500003','002','151',38)
insert into Score values('1500003','007','152',50)
insert into Score values('1500003','002','152',58)
insert into Score values('1500003','006','161',70)
insert into Score values('1500003','010','161',90)
insert into Score values('1500003','007','162',66)
insert into Score values('1500003','008','162',82)
insert into Score values('1500003','009','162',78)

insert into Score values('1500004','001','151',48)
insert into Score values('1500004','004','151',58)
insert into Score values('1500004','003','152',70)
insert into Score values('1500004','002','161',68)
insert into Score values('1500004','007','161',71)
insert into Score values('1500004','008','161',80)
insert into Score values('1500004','001','162',70)
insert into Score values('1500004','005','162',88)
insert into Score values('1500004','006','162',72)

insert into Score values('1600002','001','161',98)
insert into Score values('1600002','004','161',60)
insert into Score values('1600002','002','161',46)
insert into Score values('1600002','003','162',98)
insert into Score values('1600002','010','162',70)
insert into Score values('1600002','005','162',86)

insert into Score values('1600003','001','161',70)
insert into Score values('1600003','002','161',60)
insert into Score values('1600003','004','161',77)
insert into Score values('1600003','005','162',87)

insert into Score values('1600004','001','161',50)
insert into Score values('1600004','002','161',70)
insert into Score values('1600004','004','161',78)
insert into Score values('1600004','010','161',89)
insert into Score values('1600004','011','162',90)
insert into Score values('1600004','003','162',88)
insert into Score values('1600004','001','162',68)

insert into Score values('1600005','001','161',82)
insert into Score values('1600005','002','161',80)
insert into Score values('1600005','010','161',90)
insert into Score values('1600005','004','161',47)
insert into Score values('1600005','003','162',82)
insert into Score values('1600005','011','162',82)

insert into Score values('1600014','001','161',60)
insert into Score values('1600014','003','161',87)
insert into Score values('1600014','004','161',45)
insert into Score values('1600014','010','161',90)
insert into Score values('1600014','004','162',88)
insert into Score values('1600014','011','162',70)
insert into Score values('1600014','002','162',69)
insert into Score values('1600014','005','162',56)

insert into Score values('1600012','001','161',68)
insert into Score values('1600012','003','161',76)
insert into Score values('1600012','004','161',70)
insert into Score values('1600012','005','161',88)
insert into Score values('1600012','002','162',78)
insert into Score values('1600012','006','162',82)
insert into Score values('1600012','007','162',90)
insert into Score values('1600012','010','162',84)


go





