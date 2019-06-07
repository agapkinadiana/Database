CREATE TABLE STUDENT
(
	Номер_зачетки int primary key,
	Фамилия_студента nvarchar(20),
	Номер_группы int
)

ALTER Table STUDENT ADD Дата_поступления date;

ALTER Table STUDENT DROP Column Дата_поступления;

INSERT into STUDENT (Номер_зачетки, Фамилия_студента, Номер_группы)
	values (5452768, 'Агапкина', 6)

INSERT into STUDENT (Номер_зачетки, Фамилия_студента, Номер_группы)
	values (8765675, 'Септилко', 5)

INSERT into STUDENT (Номер_зачетки, Фамилия_студента, Номер_группы)
	values (8974325, 'Жукова', 10)

INSERT into STUDENT (Номер_зачетки, Фамилия_студента, Номер_группы)
	values (9532456, 'Истомин', 4)

INSERT into STUDENT (Номер_зачетки, Фамилия_студента, Номер_группы)
	values (0423556, 'Антонович', 3)

INSERT into STUDENT (Номер_зачетки, Фамилия_студента, Номер_группы)
	values (1356678, 'Лобович', 1)

INSERT into STUDENT (Номер_зачетки, Фамилия_студента, Номер_группы)
	values (0293847, 'Кутас', 9)

SELECT * from STUDENT;
SELECT Фамилия_студента from STUDENT;
SELECT Номер_зачетки, Фамилия_студента from STUDENT;
SELECT count(*) from STUDENT;

UPDATE STUDENT set Номер_группы = 5;
DELETE from STUDENT Where Номер_зачетки = '0293847';

SELECT Номер_зачетки, Фамилия_студента, Номер_группы from STUDENT;

DROP table STUDENT;

CREATE TABLE STUDENT
(
	Номер_зачетки int primary key,
	Фамилия_студента nvarchar(20) not null
)

INSERT into STUDENT (Номер_зачетки, Фамилия_студента)
	values (9532456, 'Истомин')

UPDATE STUDENT set Фамилия_студента = null;

INSERT into STUDENT (Номер_зачетки, Фамилия_студента)
	values (9532456, null)

DROP table STUDENT;

CREATE TABLE STUDENT
(
	Номер_зачетки int primary key,
	Фамилия_студента nvarchar(20) not null
)

ALTER table STUDENT ADD Пол nchar(1) check(Пол in ('м', 'ж'));

INSERT into STUDENT (Номер_зачетки, Фамилия_студента, Пол)
	values (9532456, 'Никита', 'м');

SELECT Номер_зачетки, Фамилия_студента, Пол from STUDENT;

DROP table STUDENT;

CREATE TABLE RESULTS
(
	ID int primary key identity (1,1),
	Имя_студента nvarchar(20),
	Математика int,
	Физика int,
	Среднее_значение as (Математика + Физика)/2
)

INSERT into RESULTS (Имя_студента, Математика, Физика)
	values ('Рома', 8, 6)

SELECT ID, Имя_студента, Математика, Физика, Среднее_значение from RESULTS;

DROP table RESULTS;

CREATE TABLE STUDENT
(
	Номер_зачетки int primary key,
	Фамилия_студента nvarchar(20),
	Дата_рождения date,
	Пол nchar(1) check(Пол in ('м', 'ж')),
	Дата_поступления date
)

INSERT into STUDENT(Номер_зачетки, Фамилия_студента, Дата_рождения, Пол, Дата_поступления)
	values (0568345, 'Петух', '07.04.2000', 'м', '01.08.2017'),
	(2344834, 'Антонович', '03.02.1999', 'ж', '01.08.2017'),
	(2340834, 'Септилко', '03.02.2000', 'ж', '01.08.2017');

SELECT *  from STUDENT Where Пол = 'ж' AND DATEADD(Year,18,Дата_рождения)<Дата_поступления;  --к дате рождения + 18 и сравниваем


