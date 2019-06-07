CREATE TABLE STUDENT
(
	�����_������� int primary key,
	�������_�������� nvarchar(20),
	�����_������ int
)

ALTER Table STUDENT ADD ����_����������� date;

ALTER Table STUDENT DROP Column ����_�����������;

INSERT into STUDENT (�����_�������, �������_��������, �����_������)
	values (5452768, '��������', 6)

INSERT into STUDENT (�����_�������, �������_��������, �����_������)
	values (8765675, '��������', 5)

INSERT into STUDENT (�����_�������, �������_��������, �����_������)
	values (8974325, '������', 10)

INSERT into STUDENT (�����_�������, �������_��������, �����_������)
	values (9532456, '�������', 4)

INSERT into STUDENT (�����_�������, �������_��������, �����_������)
	values (0423556, '���������', 3)

INSERT into STUDENT (�����_�������, �������_��������, �����_������)
	values (1356678, '�������', 1)

INSERT into STUDENT (�����_�������, �������_��������, �����_������)
	values (0293847, '�����', 9)

SELECT * from STUDENT;
SELECT �������_�������� from STUDENT;
SELECT �����_�������, �������_�������� from STUDENT;
SELECT count(*) from STUDENT;

UPDATE STUDENT set �����_������ = 5;
DELETE from STUDENT Where �����_������� = '0293847';

SELECT �����_�������, �������_��������, �����_������ from STUDENT;

DROP table STUDENT;

CREATE TABLE STUDENT
(
	�����_������� int primary key,
	�������_�������� nvarchar(20) not null
)

INSERT into STUDENT (�����_�������, �������_��������)
	values (9532456, '�������')

UPDATE STUDENT set �������_�������� = null;

INSERT into STUDENT (�����_�������, �������_��������)
	values (9532456, null)

DROP table STUDENT;

CREATE TABLE STUDENT
(
	�����_������� int primary key,
	�������_�������� nvarchar(20) not null
)

ALTER table STUDENT ADD ��� nchar(1) check(��� in ('�', '�'));

INSERT into STUDENT (�����_�������, �������_��������, ���)
	values (9532456, '������', '�');

SELECT �����_�������, �������_��������, ��� from STUDENT;

DROP table STUDENT;

CREATE TABLE RESULTS
(
	ID int primary key identity (1,1),
	���_�������� nvarchar(20),
	���������� int,
	������ int,
	�������_�������� as (���������� + ������)/2
)

INSERT into RESULTS (���_��������, ����������, ������)
	values ('����', 8, 6)

SELECT ID, ���_��������, ����������, ������, �������_�������� from RESULTS;

DROP table RESULTS;

CREATE TABLE STUDENT
(
	�����_������� int primary key,
	�������_�������� nvarchar(20),
	����_�������� date,
	��� nchar(1) check(��� in ('�', '�')),
	����_����������� date
)

INSERT into STUDENT(�����_�������, �������_��������, ����_��������, ���, ����_�����������)
	values (0568345, '�����', '07.04.2000', '�', '01.08.2017'),
	(2344834, '���������', '03.02.1999', '�', '01.08.2017'),
	(2340834, '��������', '03.02.2000', '�', '01.08.2017');

SELECT *  from STUDENT Where ��� = '�' AND DATEADD(Year,18,����_��������)<����_�����������;  --� ���� �������� + 18 � ����������


