----1
--create view [�������������]
--	as select TEACHER [���], 
--		TEACHER_NAME [��� �������������],
--		GENDER [���],
--		PULPIT [��� �������] from TEACHER;

----2
--create view [���������� ������]
--	as select f.FACULTY_NAME [���������],
--		count (p.PULPIT) as [���������� ������] 
--			from FACULTY f inner join PULPIT p
--			on f.FACULTY = p.FACULTY
--				group by FACULTY_NAME;

--insert [���������� ������] values ( '������������_����������', 4 );

----3
--create view [���������]
--	as select AUDITORIUM [���],
--			AUDITORIUM_TYPE [������������ ���������] from AUDITORIUM
--			where AUDITORIUM_TYPE like '��%';

--select * from [���������];

--insert [���������] values ('202-1', '��');

--update [���������]
--	set [���] = '201-1'
--	where [���] = '202-1';

--delete [���������]
--	where [���] = '201-1';

----4
--create view [����������_���������]
--	as select AUDITORIUM [���],
--			AUDITORIUM_TYPE [������������ ���������] from AUDITORIUM
--			where AUDITORIUM_TYPE like '��%' with check option;

--insert [����������_���������] values ('202-1', '��');

----5
--create view [����������]
--	as select top 150 SUBJECT [���],
--			SUBJECT_NAME [������������ ����������],
--			PULPIT [��� �������] from SUBJECT
--			order by SUBJECT_NAME;

--select * from [����������];

----6
--create view [���������� ������ 2] with schemabinding
--	as select f.FACULTY_NAME [���������],
--		count (p.PULPIT) as [���������� ������] 
--			from dbo.FACULTY f inner join dbo.PULPIT p
--			on f.FACULTY = p.FACULTY
--				group by FACULTY_NAME;

--select * from [���������� ������ 2]