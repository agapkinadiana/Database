select * from FACULTY;
select TEACHER, PULPIT from TEACHER;
select TEACHER_NAME, PULPIT from TEACHER where PULPIT = '����';
select TEACHER_NAME, PULPIT from TEACHER where PULPIT = '����' OR PULPIT = '������';
select TEACHER_NAME, GENDER, PULPIT from TEACHER where PULPIT = '����' AND GENDER = '�';
select TEACHER_NAME[��� �������������] from TEACHER where NOT GENDER = '�' AND PULPIT = '����'; -- !=
select distinct PULPIT from TEACHER;
select AUDITORIUM, AUDITORIUM_CAPACITY from AUDITORIUM order by AUDITORIUM_CAPACITY;
select distinct top(2) AUDITORIUM_TYPE, AUDITORIUM_CAPACITY from AUDITORIUM order by AUDITORIUM_CAPACITY desc;
select distinct SUBJECT, NOTE from PROGRESS where NOTE between 8 AND 10;
select distinct SUBJECT, PULPIT from SUBJECT where PULPIT in ('�����', '������', '��');
select PROFESSION_NAME[������������ �������������], QUALIFICATION[������������] from PROFESSION where QUALIFICATION like '%�����%'; 

create table #STU
(	FIO nvarchar(50),
	DATE date
);

select NAME, BDAY into #STUD from STUDENT;
select * from #STUD;

select (sum(NOTE)/count(NOTE))[������� ����] from PROGRESS where NOTE between 4 and 10;

select count(NOTE) from PROGRESS 
select sum(NOTE) from PROGRESS group by SUBJECT;