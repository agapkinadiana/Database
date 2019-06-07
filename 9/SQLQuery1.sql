----1
--create view [Преподаватель]
--	as select TEACHER [Код], 
--		TEACHER_NAME [Имя преподавателя],
--		GENDER [Пол],
--		PULPIT [Код кафедры] from TEACHER;

----2
--create view [Количество кафедр]
--	as select f.FACULTY_NAME [Факультет],
--		count (p.PULPIT) as [Количество кафедр] 
--			from FACULTY f inner join PULPIT p
--			on f.FACULTY = p.FACULTY
--				group by FACULTY_NAME;

--insert [Количество кафедр] values ( 'Наименование_факультета', 4 );

----3
--create view [Аудитория]
--	as select AUDITORIUM [Код],
--			AUDITORIUM_TYPE [Наименование аудитории] from AUDITORIUM
--			where AUDITORIUM_TYPE like 'ЛК%';

--select * from [Аудитория];

--insert [Аудитория] values ('202-1', 'ЛК');

--update [Аудитория]
--	set [Код] = '201-1'
--	where [Код] = '202-1';

--delete [Аудитория]
--	where [Код] = '201-1';

----4
--create view [Лекционные_аудитории]
--	as select AUDITORIUM [Код],
--			AUDITORIUM_TYPE [Наименование аудитории] from AUDITORIUM
--			where AUDITORIUM_TYPE like 'ЛК%' with check option;

--insert [Лекционные_аудитории] values ('202-1', 'ЛБ');

----5
--create view [Дисциплины]
--	as select top 150 SUBJECT [Код],
--			SUBJECT_NAME [Наименование дисциплины],
--			PULPIT [Код кафедры] from SUBJECT
--			order by SUBJECT_NAME;

--select * from [Дисциплины];

----6
--create view [Количество кафедр 2] with schemabinding
--	as select f.FACULTY_NAME [Факультет],
--		count (p.PULPIT) as [Количество кафедр] 
--			from dbo.FACULTY f inner join dbo.PULPIT p
--			on f.FACULTY = p.FACULTY
--				group by FACULTY_NAME;

--select * from [Количество кафедр 2]