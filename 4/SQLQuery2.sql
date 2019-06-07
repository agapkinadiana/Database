 USE master;
 GO 
create database A_UNIVER
on primary
(
	name = N'A_UNIVER_mdf', filename = N'C:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\A_UNIVER_mdf.mdf',
	size = 5Mb, maxsize = 10Mb, filegrowth = 1Mb
),
(
	name = N'A_UNIVER_ndf', filename = N'C:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\A_UNIVER_ndf.ndf',
	size = 5Mb, maxsize = 10Mb, filegrowth = 10%
),

FILEGROUP G1
(
	name = N'A_UNIVER11_ndf', filename = N'C:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\A_UNIVER11_ndf.ndf',
	size = 10Mb, maxsize = 15Mb, filegrowth = 1Mb
),
(
	name = N'A_UNIVER12_ndf', filename = N'C:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\A_UNIVER12_ndf.ndf',
	size = 2Mb, maxsize = 5Mb, filegrowth = 1Mb
),

FILEGROUP G2
(
	name = N'A_UNIVER21_ndf', filename = N'C:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\A_UNIVER21_ndf.ndf',
	size = 5Mb, maxsize = 10Mb, filegrowth = 1Mb
),
(
	name = N'A_UNIVER22_ndf', filename = N'C:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\A_UNIVER22_ndf.ndf',
	size = 2Mb, maxsize = 5Mb, filegrowth = 1Mb
)

LOG ON
(
	name = N'A_UNIVER_log', filename = N'C:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\A_UNIVER_log.ldf',
	size = 5Mb, maxsize = UNLIMITED, filegrowth = 1Mb
)
go

CREATE table FACULTY
(
	FACULTY char(10) not null,
	constraint PK_FACULTY primary key(FACULTY),
	FACULTY_NAME varchar(50) not null default '???'
);

insert into FACULTY (FACULTY, FACULTY_NAME )
            values  ('����', '���������� ���������� � �������'),
            ('���', '����������������� ���������'),
			('���', '���������-������������� ���������'),
			('����', '���������� � ������� ������ ��������������'),
			('���', '���������� ������������ �������'),
			('����', '������������ ���� � ����������'),
			('��', '��������� �������������� ����������');

CREATE table PROFESSION
(
	PROFESSION char(20) not null,
	constraint PK_PROFESSION primary key(PROFESSION),
	FACULTY char(10) not null,
	constraint FK_FACULTY_FACULTY foreign key(FACULTY)
	references FACULTY(FACULTY),
	PROFESSION_NAME varchar(100) null,
	QUALIFICATION varchar(50) null
);


insert into PROFESSION (FACULTY, PROFESSION, PROFESSION_NAME, QUALIFICATION)
	   values ('����', '1-40 01 02', '�������������� ������� � ����������', '�������-�����������-�������������');
insert into PROFESSION (FACULTY, PROFESSION, PROFESSION_NAME, QUALIFICATION)
	   values ('����', '1-47 01 01', '������������ ����', '��������-��������');
insert into PROFESSION (FACULTY, PROFESSION, PROFESSION_NAME, QUALIFICATION)
	   values ('����', '1-36 06 01', '��������������� ������������ � ������� ��������� ����������', '�������-��������������');   
insert into PROFESSION (FACULTY, PROFESSION, PROFESSION_NAME, QUALIFICATION)
	   values ('����', '1-36 01 08', '��������������� � ������������ ������� �� �������������� ����������', '�������-�������');
insert into PROFESSION (FACULTY, PROFESSION, PROFESSION_NAME, QUALIFICATION)
	   values ('����', '1-36 07 01', '������ � �������� ���������� ����������� � ����������� ������������ ����������', '�������-�������');
insert into PROFESSION (FACULTY, PROFESSION, PROFESSION_NAME, QUALIFICATION)
	   values ('���', '1-75 01 01', '������ ���������', '������� ������� ���������');
insert into PROFESSION (FACULTY, PROFESSION, PROFESSION_NAME, QUALIFICATION)
	   values ('���', '1-75 02 01', '������-�������� �������������', '������� ������-��������� �������������');
insert into PROFESSION (FACULTY, PROFESSION, PROFESSION_NAME, QUALIFICATION)
	   values ('���', '1-89 02 02', '������ � ���������������-���', '���������� � ����� �������');
insert into PROFESSION (FACULTY, PROFESSION, PROFESSION_NAME, QUALIFICATION)
	   values ('���', '1-25 01 07', '��������� � ���������� �� �����������', '���������-��������');
insert into PROFESSION (FACULTY, PROFESSION, PROFESSION_NAME, QUALIFICATION)
	   values ('���', '1-25 01 08', '������������� ����, ������ � �����', '���������');                     
insert into PROFESSION (FACULTY, PROFESSION, PROFESSION_NAME, QUALIFICATION)
	   values ('����', '1-36 05 01', '������ � ������������ ���-���� ���������', '�������-�������');
insert into PROFESSION (FACULTY, PROFESSION, PROFESSION_NAME, QUALIFICATION)
	   values ('����', '1-46 01 01', '�������������� ����', '��-�����-��������');
insert into PROFESSION (FACULTY, PROFESSION, PROFESSION_NAME, QUALIFICATION)
	   values ('���', '1-48 01 02', '���������� ���������� ����-�������� �������, ���������� � �������', '�������-�����-��������');               
insert into PROFESSION (FACULTY, PROFESSION, PROFESSION_NAME, QUALIFICATION)
	   values ('���', '1-48 01 05', '���������� ���������� ����-������� ���������', '�������-�����-��������');
insert into PROFESSION (FACULTY, PROFESSION, PROFESSION_NAME, QUALIFICATION)
	   values ('���', '1-54 01 03', '������-���������� ������ � ������� �������� �������� ���������', '������� �� ������������'); 


CREATE table AUDITORIUM_TYPE
(
	AUDITORIUM_TYPE char(10) not null,
	constraint PK_AUDITORIUM_TYPE primary key(AUDITORIUM_TYPE),
	AUDITORIUM_TYPENAME varchar(30) null
);

insert into AUDITORIUM_TYPE (AUDITORIUM_TYPE,  AUDITORIUM_TYPENAME )
        values ('��', '����������');
insert into AUDITORIUM_TYPE (AUDITORIUM_TYPE,  AUDITORIUM_TYPENAME )
         values ('��-�', '������������ �����');
insert into AUDITORIUM_TYPE (AUDITORIUM_TYPE, AUDITORIUM_TYPENAME )
         values ('��-�', '���������� � ���. ����������');
insert into AUDITORIUM_TYPE (AUDITORIUM_TYPE,  AUDITORIUM_TYPENAME ) 
         values  ('��-X', '���������� �����������');
insert into AUDITORIUM_TYPE (AUDITORIUM_TYPE, AUDITORIUM_TYPENAME )
        values  ('��-��', '����. ������������ �����');

CREATE table PULPIT
(
	PULPIT char(20) not null,
	constraint PK_PULPIT primary key(PULPIT),
	PULPIT_NAME varchar(100) null,
	FACULTY char(10) not null,
	constraint FK_PULPIT_FACULTY foreign key(FACULTY)
	references FACULTY(FACULTY)
)ON G1;

insert into PULPIT (PULPIT, PULPIT_NAME, FACULTY )
		values  ('����', '�������������� ������ � ���������� ','��');
insert into PULPIT (PULPIT, PULPIT_NAME, FACULTY )
		values ('������','���������������� ������������ � ������ ��������� ���������� ', '����');
insert into PULPIT (PULPIT, PULPIT_NAME, FACULTY )
		values ('��', '����������� ���������','����');
insert into PULPIT (PULPIT, PULPIT_NAME, FACULTY )
		values ('���', '�����������-������������ ���������', '����');  
insert into PULPIT (PULPIT, PULPIT_NAME, FACULTY )
		values ('��', '��������������� �����������','����');  
insert into PULPIT (PULPIT, PULPIT_NAME, FACULTY )
		values ('��', '�����������','���'); 
insert into PULPIT (PULPIT, PULPIT_NAME, FACULTY )
		values ('��', '��������������','���');       
insert into PULPIT (PULPIT, PULPIT_NAME, FACULTY )
		values ('�����', '���������� � ����������������','���'); 
insert into PULPIT (PULPIT, PULPIT_NAME, FACULTY )
		values ('����', '������ ������� � ������������','���'); 
insert into PULPIT (PULPIT, PULPIT_NAME, FACULTY )
		values ('���', '������� � ������������������','���');   
insert into PULPIT (PULPIT, PULPIT_NAME, FACULTY )
		values ('������','������������ �������������� � ������-��������� �������������','���'); 
insert into PULPIT (PULPIT, PULPIT_NAME, FACULTY )
		values ('��', '���������� ����', '����');        
insert into PULPIT (PULPIT, PULPIT_NAME, FACULTY )
		values ('�����','������ ����� � ���������� �������������','����');  
insert into PULPIT (PULPIT, PULPIT_NAME, FACULTY )
		values ('���','���������� �������������������� �����������', '����');   
insert into PULPIT (PULPIT, PULPIT_NAME, FACULTY )
		values ('�����','���������� � ������� ������� �� ���������','����');   
insert into PULPIT (PULPIT, PULPIT_NAME, FACULTY )
		values ('��', '������������ �����','���'); 
insert into PULPIT (PULPIT, PULPIT_NAME, FACULTY )
		values ('���','���������� ����������� ���������','���');  
insert into PULPIT (PULPIT, PULPIT_NAME, FACULTY )
		values ('��������','���������� ���������������� ������� � ����������� ���������� ����������','���');  
insert into PULPIT (PULPIT, PULPIT_NAME, FACULTY )
		values ('�������','���������� �������������� ������� � ����� ���������� ���������� ','����'); 
insert into PULPIT (PULPIT, PULPIT_NAME, FACULTY )
		values ('�����','��������� � ��������� ���������� �����������','����');
insert into PULPIT (PULPIT, PULPIT_NAME, FACULTY )
		values ('��������','�����, ���������� ����������������� ����������� � ���������� ����������� �������','����');          
insert into PULPIT (PULPIT, PULPIT_NAME, FACULTY )
		values ('����', '������������� ������ � ����������','���');   
insert into PULPIT (PULPIT, PULPIT_NAME, FACULTY )
		values ('����', '����������� � ��������� ������������������','���');   
insert into PULPIT (PULPIT, PULPIT_NAME, FACULTY )
		values ('������', '����������, �������������� �����, ������� � ������', '���');
		
insert into PULPIT (PULPIT, PULPIT_NAME, FACULTY )
		values  ('��', '������������ ������� ','���'); 

CREATE table TEACHER
(
	TEACHER char(10) not null,
	constraint PK_TEACHER primary key(TEACHER),
	TEACHER_NAME varchar(100) null,
	GENDER char(1) check (GENDER in ('�','�')),
	PULPIT char(20) not null,
	constraint FK_TEACHER_PULPIT foreign key(PULPIT)
	references PULPIT(PULPIT)
)ON G1;

insert into TEACHER (TEACHER, TEACHER_NAME, GENDER, PULPIT )
             values  ('����', '������ �������� �������������', '�', '����');
insert into TEACHER (TEACHER, TEACHER_NAME, GENDER, PULPIT )
             values ('�����', '�������� ��������� ��������', '�', '����');
insert into TEACHER (TEACHER, TEACHER_NAME, GENDER, PULPIT )
             values ('�����', '���������� ������� ����������', '�', '����');
insert into TEACHER (TEACHER, TEACHER_NAME, GENDER, PULPIT )
             values ('�����', '�������� ������ ��������', '�', '����');
insert into TEACHER (TEACHER, TEACHER_NAME, GENDER, PULPIT )
             values ('���', '����� ��������� ����������', '�', '����');
insert into TEACHER (TEACHER, TEACHER_NAME, GENDER, PULPIT )
             values ('���', '��������� ����� ��������', '�', '����');
insert into TEACHER (TEACHER, TEACHER_NAME, GENDER, PULPIT )
             values ('���', '����� ������� ��������', '�', '����');
insert into TEACHER (TEACHER, TEACHER_NAME, GENDER, PULPIT )
             values ('���', '����� ������� �������������',  '�', '����');
insert into TEACHER (TEACHER, TEACHER_NAME, GENDER, PULPIT )
             values ('���', '����� ����� �������������',  '�',   '����');
insert into TEACHER (TEACHER, TEACHER_NAME, GENDER, PULPIT )
             values ('������', '���������� ��������� �������������', '�','������');
insert into TEACHER (TEACHER, TEACHER_NAME, GENDER, PULPIT )
             values ('���', '��������� ������� �����������', '�', '������');
insert into TEACHER (TEACHER, TEACHER_NAME, GENDER, PULPIT )
             values ('������', '����������� ��������� ��������', '�', '����');
insert into TEACHER (TEACHER, TEACHER_NAME, GENDER, PULPIT )
             values ('����', '������� ��������� ����������', '�', '����');
insert into TEACHER (TEACHER, TEACHER_NAME, GENDER, PULPIT )
             values ('����', '������ ������ ��������', '�', '��');
insert into TEACHER (TEACHER, TEACHER_NAME, GENDER, PULPIT )
             values ('����', '������� ������ ����������',  '�',  '������');
insert into TEACHER (TEACHER, TEACHER_NAME, GENDER, PULPIT )
             values ('���', '���������� ������� ��������', '�', '������');
insert into TEACHER (TEACHER, TEACHER_NAME, GENDER, PULPIT )
             values ('���', '������ ������ ���������� ', '�', '��');
insert into TEACHER (TEACHER, TEACHER_NAME, GENDER, PULPIT )
             values ('�����', '��������� �������� ���������', '�', '�����');
insert into TEACHER (TEACHER, TEACHER_NAME, GENDER, PULPIT )
             values ('������', '���������� �������� ����������', '�', '��');
insert into TEACHER (TEACHER, TEACHER_NAME, GENDER, PULPIT )
             values ('�����', '�������� ������ ����������', '�', '��'); 

CREATE table SUBJECT
(
	SUBJECT char(10) not null,
	constraint PK_SUBJECT primary key(SUBJECT),
	SUBJECT_NAME varchar(100) null unique,
	PULPIT char(20) not null,
	constraint FK_SUBJECT_PULPIT foreign key(PULPIT)
	references PULPIT(PULPIT)
)ON G1;

insert into SUBJECT (SUBJECT, SUBJECT_NAME, PULPIT )
             values ('����', '������� ���������� ������ ������', '����');
insert into SUBJECT (SUBJECT, SUBJECT_NAME, PULPIT )
             values ('��', '���� ������','����');
insert into SUBJECT (SUBJECT, SUBJECT_NAME, PULPIT )
             values ('���', '�������������� ����������','����');
insert into SUBJECT (SUBJECT, SUBJECT_NAME, PULPIT )
             values ('����', '������ �������������� � ����������������', '����');
insert into SUBJECT (SUBJECT, SUBJECT_NAME, PULPIT )
             values ('��', '������������� ������ � ������������ ��������', '����');
insert into SUBJECT (SUBJECT, SUBJECT_NAME, PULPIT )
             values ('���', '���������������� ������� ����������','����');
insert into SUBJECT (SUBJECT, SUBJECT_NAME, PULPIT )
             values ('����', '������������� ������ ��������� ����������', '����');
insert into SUBJECT (SUBJECT, SUBJECT_NAME, PULPIT )
             values ('���', '�������������� �������������� ������', '����');
insert into SUBJECT (SUBJECT, SUBJECT_NAME, PULPIT )
             values ('��', '������������ ��������� ','����');
insert into SUBJECT (SUBJECT, SUBJECT_NAME, PULPIT )
             values ('�����', '��������. ������, �������� � �������� �����', '������');
insert into SUBJECT (SUBJECT, SUBJECT_NAME, PULPIT )
             values ('���', '������������ �������������� �������', '����');
insert into SUBJECT (SUBJECT, SUBJECT_NAME, PULPIT )
             values ('���', '����������� ��������. ������������', '������');
insert into SUBJECT (SUBJECT, SUBJECT_NAME, PULPIT )
             values ('��', '���������� ����������', '����');
insert into SUBJECT (SUBJECT, SUBJECT_NAME, PULPIT )
             values ('��', '�������������� ����������������','����');
insert into SUBJECT (SUBJECT, SUBJECT_NAME, PULPIT )
             values ('����', '���������� ������ ���',  '����');
insert into SUBJECT (SUBJECT, SUBJECT_NAME, PULPIT )
             values ('���',  '��������-��������������� ����������������', '����');
insert into SUBJECT (SUBJECT, SUBJECT_NAME, PULPIT )
             values ('��', '��������� ������������������','����');
insert into SUBJECT (SUBJECT, SUBJECT_NAME, PULPIT )
             values ('��', '������������� ������','����');
insert into SUBJECT (SUBJECT, SUBJECT_NAME, PULPIT )
             values ('������OO','�������� ������ ������ � ���� � ���. ���-���.','��');
insert into SUBJECT (SUBJECT, SUBJECT_NAME, PULPIT )
             values ('�������','������ ������-��������� � ������������� �����-����',  '������');
insert into SUBJECT (SUBJECT, SUBJECT_NAME, PULPIT )
             values ('��', '���������� �������� ','��');
insert into SUBJECT (SUBJECT, SUBJECT_NAME, PULPIT )
             values ('��', '�����������', '�����');
insert into SUBJECT (SUBJECT, SUBJECT_NAME, PULPIT )
             values ('��', '������������ �����', '��');
insert into SUBJECT (SUBJECT, SUBJECT_NAME, PULPIT )
             values ('���', '���������� ��������� �������','��������'); 
insert into SUBJECT (SUBJECT, SUBJECT_NAME, PULPIT )
             values ('���', '������ ��������� ����','��');
insert into SUBJECT (SUBJECT, SUBJECT_NAME, PULPIT )
             values ('����', '���������� � ������������ �������������', '�����');
insert into SUBJECT (SUBJECT, SUBJECT_NAME, PULPIT )
             values ('����', '���������� ���������� �������� ���������� ','�������');
insert into SUBJECT (SUBJECT, SUBJECT_NAME, PULPIT )
             values ('���', '���������� ������������','��������');  

CREATE table GROUPS
( IDGROUP int  identity(1,1),
 constraint PK_GROUPS  primary key(IDGROUP),              
 FACULTY char(10)
 constraint  GROUPS_FACULTY_FK foreign key        
 references FACULTY(FACULTY), 
 PROFESSION char(20),
 constraint  FK_GROUPS_PROFESSION foreign key(PROFESSION)   
 references PROFESSION(PROFESSION),
 YEAR_FIRST  smallint  check (YEAR_FIRST<=YEAR(GETDATE())+2),                  
)ON G1;
insert into GROUPS (FACULTY,  PROFESSION, YEAR_FIRST )
         values ('����','1-40 01 02', 2013), --1
                ('����','1-40 01 02', 2012),
                ('����','1-40 01 02', 2011),
                ('����','1-40 01 02', 2010),
                ('����','1-47 01 01', 2013),---5 ��
                ('����','1-47 01 01', 2012),
                ('����','1-47 01 01', 2011),
                ('����','1-36 06 01', 2010),-----8 ��
                ('����','1-36 06 01', 2013),
                ('����','1-36 06 01', 2012),
                ('����','1-36 06 01', 2011),
                ('����','1-36 01 08', 2013),---12 ��                                                  
                ('����','1-36 01 08', 2012),
                ('����','1-36 07 01', 2011),
                ('����','1-36 07 01', 2010),
                ('���','1-48 01 02', 2012), ---16 �� 
                ('���','1-48 01 02', 2011),
                ('���','1-48 01 05', 2013),
                ('���','1-54 01 03', 2012),
                ('���','1-75 01 01', 2013),--20 ��      
                ('���','1-75 02 01', 2012),
                ('���','1-75 02 01', 2011),
                ('���','1-89 02 02', 2012),
                ('���','1-89 02 02', 2011),  
                ('����','1-36 05 01', 2013),
                ('����','1-36 05 01', 2012),
                ('����','1-46 01 01', 2012),--27 ��
                ('���','1-25 01 07', 2013), 
                ('���','1-25 01 07', 2012),     
                ('���','1-25 01 07', 2010),
                ('���','1-25 01 08', 2013),
                ('���','1-25 01 08', 2012) ---32 ��       

CREATE table AUDITORIUM
(
	AUDITORIUM char(20) not null,
	constraint PK_AUDITORIUM primary key(AUDITORIUM),
	AUDITORIUM_TYPE char(10) not null,
	constraint FK_AUDITORIUM_AUDITORIUM_TYPE foreign key(AUDITORIUM_TYPE)
	references AUDITORIUM_TYPE(AUDITORIUM_TYPE),
	AUDITORIUM_NAME varchar(50) null,
	AUDITORIUM_CAPACITY int default 1, check (AUDITORIUM_CAPACITY between 1 and 300)
)ON G2;

insert into AUDITORIUM (AUDITORIUM, AUDITORIUM_NAME, AUDITORIUM_TYPE, AUDITORIUM_CAPACITY)   
	values ('206-1', '206-1','��-�', 15);
insert into  AUDITORIUM   (AUDITORIUM,   AUDITORIUM_NAME, AUDITORIUM_TYPE, AUDITORIUM_CAPACITY) 
	values  ('301-1', '301-1', '��-�', 15);
insert into  AUDITORIUM   (AUDITORIUM,   AUDITORIUM_NAME, AUDITORIUM_TYPE, AUDITORIUM_CAPACITY )   
	values  ('236-1', '236-1', '��',   60);
insert into  AUDITORIUM   (AUDITORIUM,   AUDITORIUM_NAME, AUDITORIUM_TYPE, AUDITORIUM_CAPACITY )  
	values  ('313-1', '313-1', '��-�',   60);
insert into  AUDITORIUM   (AUDITORIUM,   AUDITORIUM_NAME, AUDITORIUM_TYPE, AUDITORIUM_CAPACITY )  
	values  ('324-1', '324-1', '��-�',   50);
insert into  AUDITORIUM   (AUDITORIUM,   AUDITORIUM_NAME, AUDITORIUM_TYPE, AUDITORIUM_CAPACITY )   
	values  ('413-1', '413-1', '��-�', 15);
insert into  AUDITORIUM   (AUDITORIUM,   AUDITORIUM_NAME, AUDITORIUM_TYPE, AUDITORIUM_CAPACITY ) 
	values  ('423-1', '423-1', '��-�', 90);
insert into  AUDITORIUM   (AUDITORIUM,   AUDITORIUM_NAME, AUDITORIUM_TYPE, AUDITORIUM_CAPACITY )     
	values  ('408-2', '408-2', '��',  90);
