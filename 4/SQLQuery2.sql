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
            values  ('ХТиТ', 'Химическая технология и техника'),
            ('ЛХФ', 'Лесохозяйственный факультет'),
			('ИЭФ', 'Инженерно-экономический факультет'),
			('ТТЛП', 'Технология и техника лесной промышленности'),
			('ТОВ', 'Технология органических веществ'),
			('ИДиП', 'Издательское дело и полиграфия'),
			('ИТ', 'Факультет информационных технологий');

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
	   values ('ИДиП', '1-40 01 02', 'Информационные системы и технологии', 'инженер-программист-системотехник');
insert into PROFESSION (FACULTY, PROFESSION, PROFESSION_NAME, QUALIFICATION)
	   values ('ИДиП', '1-47 01 01', 'Издательское дело', 'редактор-технолог');
insert into PROFESSION (FACULTY, PROFESSION, PROFESSION_NAME, QUALIFICATION)
	   values ('ИДиП', '1-36 06 01', 'Полиграфическое оборудование и системы обработки информации', 'инженер-электромеханик');   
insert into PROFESSION (FACULTY, PROFESSION, PROFESSION_NAME, QUALIFICATION)
	   values ('ХТиТ', '1-36 01 08', 'Конструирование и производство изделий из композиционных материалов', 'инженер-механик');
insert into PROFESSION (FACULTY, PROFESSION, PROFESSION_NAME, QUALIFICATION)
	   values ('ХТиТ', '1-36 07 01', 'Машины и аппараты химических производств и предприятий строительных материалов', 'инженер-механик');
insert into PROFESSION (FACULTY, PROFESSION, PROFESSION_NAME, QUALIFICATION)
	   values ('ЛХФ', '1-75 01 01', 'Лесное хозяйство', 'инженер лесного хозяйства');
insert into PROFESSION (FACULTY, PROFESSION, PROFESSION_NAME, QUALIFICATION)
	   values ('ЛХФ', '1-75 02 01', 'Садово-парковое строительство', 'инженер садово-паркового строительства');
insert into PROFESSION (FACULTY, PROFESSION, PROFESSION_NAME, QUALIFICATION)
	   values ('ЛХФ', '1-89 02 02', 'Туризм и природопользова-ние', 'специалист в сфере туризма');
insert into PROFESSION (FACULTY, PROFESSION, PROFESSION_NAME, QUALIFICATION)
	   values ('ИЭФ', '1-25 01 07', 'Экономика и управление на предприятии', 'экономист-менеджер');
insert into PROFESSION (FACULTY, PROFESSION, PROFESSION_NAME, QUALIFICATION)
	   values ('ИЭФ', '1-25 01 08', 'Бухгалтерский учет, анализ и аудит', 'экономист');                     
insert into PROFESSION (FACULTY, PROFESSION, PROFESSION_NAME, QUALIFICATION)
	   values ('ТТЛП', '1-36 05 01', 'Машины и оборудование лес-ного комплекса', 'инженер-механик');
insert into PROFESSION (FACULTY, PROFESSION, PROFESSION_NAME, QUALIFICATION)
	   values ('ТТЛП', '1-46 01 01', 'Лесоинженерное дело', 'ин-женер-технолог');
insert into PROFESSION (FACULTY, PROFESSION, PROFESSION_NAME, QUALIFICATION)
	   values ('ТОВ', '1-48 01 02', 'Химическая технология орга-нических веществ, материалов и изделий', 'инженер-химик-технолог');               
insert into PROFESSION (FACULTY, PROFESSION, PROFESSION_NAME, QUALIFICATION)
	   values ('ТОВ', '1-48 01 05', 'Химическая технология пере-работки древесины', 'инженер-химик-технолог');
insert into PROFESSION (FACULTY, PROFESSION, PROFESSION_NAME, QUALIFICATION)
	   values ('ТОВ', '1-54 01 03', 'Физико-химические методы и приборы контроля качества продукции', 'инженер по сертификации'); 


CREATE table AUDITORIUM_TYPE
(
	AUDITORIUM_TYPE char(10) not null,
	constraint PK_AUDITORIUM_TYPE primary key(AUDITORIUM_TYPE),
	AUDITORIUM_TYPENAME varchar(30) null
);

insert into AUDITORIUM_TYPE (AUDITORIUM_TYPE,  AUDITORIUM_TYPENAME )
        values ('ЛК', 'Лекционная');
insert into AUDITORIUM_TYPE (AUDITORIUM_TYPE,  AUDITORIUM_TYPENAME )
         values ('ЛБ-К', 'Компьютерный класс');
insert into AUDITORIUM_TYPE (AUDITORIUM_TYPE, AUDITORIUM_TYPENAME )
         values ('ЛК-К', 'Лекционная с уст. проектором');
insert into AUDITORIUM_TYPE (AUDITORIUM_TYPE,  AUDITORIUM_TYPENAME ) 
         values  ('ЛБ-X', 'Химическая лаборатория');
insert into AUDITORIUM_TYPE (AUDITORIUM_TYPE, AUDITORIUM_TYPENAME )
        values  ('ЛБ-СК', 'Спец. компьютерный класс');

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
		values  ('ИСиТ', 'Информационных систем и технологий ','ИТ');
insert into PULPIT (PULPIT, PULPIT_NAME, FACULTY )
		values ('ПОиСОИ','Полиграфического оборудования и систем обработки информации ', 'ИДиП');
insert into PULPIT (PULPIT, PULPIT_NAME, FACULTY )
		values ('БФ', 'Белорусской филологии','ИДиП');
insert into PULPIT (PULPIT, PULPIT_NAME, FACULTY )
		values ('РИТ', 'Редакционно-издательских тенологий', 'ИДиП');  
insert into PULPIT (PULPIT, PULPIT_NAME, FACULTY )
		values ('ПП', 'Полиграфических производств','ИДиП');  
insert into PULPIT (PULPIT, PULPIT_NAME, FACULTY )
		values ('ЛВ', 'Лесоводства','ЛХФ'); 
insert into PULPIT (PULPIT, PULPIT_NAME, FACULTY )
		values ('ЛУ', 'Лесоустройства','ЛХФ');       
insert into PULPIT (PULPIT, PULPIT_NAME, FACULTY )
		values ('ЛЗиДВ', 'Лесозащиты и древесиноведения','ЛХФ'); 
insert into PULPIT (PULPIT, PULPIT_NAME, FACULTY )
		values ('ЛКиП', 'Лесных культур и почвоведения','ЛХФ'); 
insert into PULPIT (PULPIT, PULPIT_NAME, FACULTY )
		values ('ТиП', 'Туризма и природопользования','ЛХФ');   
insert into PULPIT (PULPIT, PULPIT_NAME, FACULTY )
		values ('ЛПиСПС','Ландшафтного проектирования и садово-паркового строительства','ЛХФ'); 
insert into PULPIT (PULPIT, PULPIT_NAME, FACULTY )
		values ('ТЛ', 'Транспорта леса', 'ТТЛП');        
insert into PULPIT (PULPIT, PULPIT_NAME, FACULTY )
		values ('ЛМиЛЗ','Лесных машин и технологии лесозаготовок','ТТЛП');  
insert into PULPIT (PULPIT, PULPIT_NAME, FACULTY )
		values ('ТДП','Технологий деревообрабатывающих производств', 'ТТЛП');   
insert into PULPIT (PULPIT, PULPIT_NAME, FACULTY )
		values ('ТиДИД','Технологии и дизайна изделий из древесины','ТТЛП');   
insert into PULPIT (PULPIT, PULPIT_NAME, FACULTY )
		values ('ОХ', 'Органической химии','ТОВ'); 
insert into PULPIT (PULPIT, PULPIT_NAME, FACULTY )
		values ('ХПД','Химической переработки древесины','ТОВ');  
insert into PULPIT (PULPIT, PULPIT_NAME, FACULTY )
		values ('ТНХСиППМ','Технологии нефтехимического синтеза и переработки полимерных материалов','ТОВ');  
insert into PULPIT (PULPIT, PULPIT_NAME, FACULTY )
		values ('ТНВиОХТ','Технологии неорганических веществ и общей химической технологии ','ХТиТ'); 
insert into PULPIT (PULPIT, PULPIT_NAME, FACULTY )
		values ('ПиАХП','Процессов и аппаратов химических производств','ХТиТ');
insert into PULPIT (PULPIT, PULPIT_NAME, FACULTY )
		values ('ХТЭПиМЭЕ','Химии, технологии электрохимических производств и материалов электронной техники','ХТиТ');          
insert into PULPIT (PULPIT, PULPIT_NAME, FACULTY )
		values ('ЭТиМ', 'Экономической теории и маркетинга','ИЭФ');   
insert into PULPIT (PULPIT, PULPIT_NAME, FACULTY )
		values ('МиЭП', 'Менеджмента и экономики природопользования','ИЭФ');   
insert into PULPIT (PULPIT, PULPIT_NAME, FACULTY )
		values ('СБУАиА', 'Статистики, бухгалтерского учета, анализа и аудита', 'ИЭФ');
		
insert into PULPIT (PULPIT, PULPIT_NAME, FACULTY )
		values  ('ОВ', 'органических веществ ','ТОВ'); 

CREATE table TEACHER
(
	TEACHER char(10) not null,
	constraint PK_TEACHER primary key(TEACHER),
	TEACHER_NAME varchar(100) null,
	GENDER char(1) check (GENDER in ('м','ж')),
	PULPIT char(20) not null,
	constraint FK_TEACHER_PULPIT foreign key(PULPIT)
	references PULPIT(PULPIT)
)ON G1;

insert into TEACHER (TEACHER, TEACHER_NAME, GENDER, PULPIT )
             values  ('СМЛВ', 'Смелов Владимир Владиславович', 'м', 'ИСИТ');
insert into TEACHER (TEACHER, TEACHER_NAME, GENDER, PULPIT )
             values ('АКНВЧ', 'Акунович Станислав Иванович', 'м', 'ИСиТ');
insert into TEACHER (TEACHER, TEACHER_NAME, GENDER, PULPIT )
             values ('КЛСНВ', 'Колесников Виталий Леонидович', 'м', 'ИСиТ');
insert into TEACHER (TEACHER, TEACHER_NAME, GENDER, PULPIT )
             values ('БРКВЧ', 'Бракович Андрей Игоревич', 'м', 'ИСиТ');
insert into TEACHER (TEACHER, TEACHER_NAME, GENDER, PULPIT )
             values ('ДТК', 'Дятко Александр Аркадьевич', 'м', 'ИСиТ');
insert into TEACHER (TEACHER, TEACHER_NAME, GENDER, PULPIT )
             values ('УРБ', 'Урбанович Павел Павлович', 'м', 'ИСиТ');
insert into TEACHER (TEACHER, TEACHER_NAME, GENDER, PULPIT )
             values ('ГРН', 'Гурин Николай Иванович', 'м', 'ИСиТ');
insert into TEACHER (TEACHER, TEACHER_NAME, GENDER, PULPIT )
             values ('ЖЛК', 'Жиляк Надежда Александровна',  'ж', 'ИСиТ');
insert into TEACHER (TEACHER, TEACHER_NAME, GENDER, PULPIT )
             values ('МРЗ', 'Мороз Елена Станиславовна',  'ж',   'ИСиТ');
insert into TEACHER (TEACHER, TEACHER_NAME, GENDER, PULPIT )
             values ('БРТШВЧ', 'Барташевич Святослав Александрович', 'м','ПОиСОИ');
insert into TEACHER (TEACHER, TEACHER_NAME, GENDER, PULPIT )
             values ('АРС', 'Арсентьев Виталий Арсентьевич', 'м', 'ПОиСОИ');
insert into TEACHER (TEACHER, TEACHER_NAME, GENDER, PULPIT )
             values ('БРНВСК', 'Барановский Станислав Иванович', 'м', 'ЭТиМ');
insert into TEACHER (TEACHER, TEACHER_NAME, GENDER, PULPIT )
             values ('НВРВ', 'Неверов Александр Васильевич', 'м', 'МиЭП');
insert into TEACHER (TEACHER, TEACHER_NAME, GENDER, PULPIT )
             values ('РВКЧ', 'Ровкач Андрей Иванович', 'м', 'ОХ');
insert into TEACHER (TEACHER, TEACHER_NAME, GENDER, PULPIT )
             values ('ДМДК', 'Демидко Марина Николаевна',  'ж',  'ЛПиСПС');
insert into TEACHER (TEACHER, TEACHER_NAME, GENDER, PULPIT )
             values ('БРГ', 'Бурганская Татьяна Минаевна', 'ж', 'ЛПиСПС');
insert into TEACHER (TEACHER, TEACHER_NAME, GENDER, PULPIT )
             values ('РЖК', 'Рожков Леонид Николаевич ', 'м', 'ЛВ');
insert into TEACHER (TEACHER, TEACHER_NAME, GENDER, PULPIT )
             values ('ЗВГЦВ', 'Звягинцев Вячеслав Борисович', 'м', 'ЛЗиДВ');
insert into TEACHER (TEACHER, TEACHER_NAME, GENDER, PULPIT )
             values ('БЗБРДВ', 'Безбородов Владимир Степанович', 'м', 'ОХ');
insert into TEACHER (TEACHER, TEACHER_NAME, GENDER, PULPIT )
             values ('НСКВЦ', 'Насковец Михаил Трофимович', 'м', 'ТЛ'); 

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
             values ('СУБД', 'Системы управления базами данных', 'ИСиТ');
insert into SUBJECT (SUBJECT, SUBJECT_NAME, PULPIT )
             values ('БД', 'Базы данных','ИСиТ');
insert into SUBJECT (SUBJECT, SUBJECT_NAME, PULPIT )
             values ('ИНФ', 'Информационные технологии','ИСиТ');
insert into SUBJECT (SUBJECT, SUBJECT_NAME, PULPIT )
             values ('ОАиП', 'Основы алгоритмизации и программирования', 'ИСиТ');
insert into SUBJECT (SUBJECT, SUBJECT_NAME, PULPIT )
             values ('ПЗ', 'Представление знаний в компьютерных системах', 'ИСиТ');
insert into SUBJECT (SUBJECT, SUBJECT_NAME, PULPIT )
             values ('ПСП', 'Программирование сетевых приложений','ИСиТ');
insert into SUBJECT (SUBJECT, SUBJECT_NAME, PULPIT )
             values ('МСОИ', 'Моделирование систем обработки информации', 'ИСиТ');
insert into SUBJECT (SUBJECT, SUBJECT_NAME, PULPIT )
             values ('ПИС', 'Проектирование информационных систем', 'ИСиТ');
insert into SUBJECT (SUBJECT, SUBJECT_NAME, PULPIT )
             values ('КГ', 'Компьютерная геометрия ','ИСиТ');
insert into SUBJECT (SUBJECT, SUBJECT_NAME, PULPIT )
             values ('ПМАПЛ', 'Полиграф. машины, автоматы и поточные линии', 'ПОиСОИ');
insert into SUBJECT (SUBJECT, SUBJECT_NAME, PULPIT )
             values ('КМС', 'Компьютерные мультимедийные системы', 'ИСиТ');
insert into SUBJECT (SUBJECT, SUBJECT_NAME, PULPIT )
             values ('ОПП', 'Организация полиграф. производства', 'ПОиСОИ');
insert into SUBJECT (SUBJECT, SUBJECT_NAME, PULPIT )
             values ('ДМ', 'Дискретная математика', 'ИСиТ');
insert into SUBJECT (SUBJECT, SUBJECT_NAME, PULPIT )
             values ('МП', 'Математическое программирование','ИСиТ');
insert into SUBJECT (SUBJECT, SUBJECT_NAME, PULPIT )
             values ('ЛЭВМ', 'Логические основы ЭВМ',  'ИСиТ');
insert into SUBJECT (SUBJECT, SUBJECT_NAME, PULPIT )
             values ('ООП',  'Объектно-ориентированное программирование', 'ИСиТ');
insert into SUBJECT (SUBJECT, SUBJECT_NAME, PULPIT )
             values ('ЭП', 'Экономика природопользования','МиЭП');
insert into SUBJECT (SUBJECT, SUBJECT_NAME, PULPIT )
             values ('ЭТ', 'Экономическая теория','ЭТиМ');
insert into SUBJECT (SUBJECT, SUBJECT_NAME, PULPIT )
             values ('БЛЗиПсOO','Биология лесных зверей и птиц с осн. охо-тов.','ОВ');
insert into SUBJECT (SUBJECT, SUBJECT_NAME, PULPIT )
             values ('ОСПиЛПХ','Основы садово-паркового и лесопаркового хозяй-ства',  'ЛПиСПС');
insert into SUBJECT (SUBJECT, SUBJECT_NAME, PULPIT )
             values ('ИГ', 'Инженерная геодезия ','ЛУ');
insert into SUBJECT (SUBJECT, SUBJECT_NAME, PULPIT )
             values ('ЛВ', 'Лесоводство', 'ЛЗиДВ');
insert into SUBJECT (SUBJECT, SUBJECT_NAME, PULPIT )
             values ('ОХ', 'Органическая химия', 'ОХ');
insert into SUBJECT (SUBJECT, SUBJECT_NAME, PULPIT )
             values ('ТРИ', 'Технология резиновых изделий','ТНХСиППМ'); 
insert into SUBJECT (SUBJECT, SUBJECT_NAME, PULPIT )
             values ('ВТЛ', 'Водный транспорт леса','ТЛ');
insert into SUBJECT (SUBJECT, SUBJECT_NAME, PULPIT )
             values ('ТиОЛ', 'Технология и оборудование лесозаготовок', 'ЛМиЛЗ');
insert into SUBJECT (SUBJECT, SUBJECT_NAME, PULPIT )
             values ('ТОПИ', 'Технология обогащения полезных ископаемых ','ТНВиОХТ');
insert into SUBJECT (SUBJECT, SUBJECT_NAME, PULPIT )
             values ('ПЭХ', 'Прикладная электрохимия','ХТЭПиМЭЕ');  

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
         values ('ИДиП','1-40 01 02', 2013), --1
                ('ИДиП','1-40 01 02', 2012),
                ('ИДиП','1-40 01 02', 2011),
                ('ИДиП','1-40 01 02', 2010),
                ('ИДиП','1-47 01 01', 2013),---5 гр
                ('ИДиП','1-47 01 01', 2012),
                ('ИДиП','1-47 01 01', 2011),
                ('ИДиП','1-36 06 01', 2010),-----8 гр
                ('ИДиП','1-36 06 01', 2013),
                ('ИДиП','1-36 06 01', 2012),
                ('ИДиП','1-36 06 01', 2011),
                ('ХТиТ','1-36 01 08', 2013),---12 гр                                                  
                ('ХТиТ','1-36 01 08', 2012),
                ('ХТиТ','1-36 07 01', 2011),
                ('ХТиТ','1-36 07 01', 2010),
                ('ТОВ','1-48 01 02', 2012), ---16 гр 
                ('ТОВ','1-48 01 02', 2011),
                ('ТОВ','1-48 01 05', 2013),
                ('ТОВ','1-54 01 03', 2012),
                ('ЛХФ','1-75 01 01', 2013),--20 гр      
                ('ЛХФ','1-75 02 01', 2012),
                ('ЛХФ','1-75 02 01', 2011),
                ('ЛХФ','1-89 02 02', 2012),
                ('ЛХФ','1-89 02 02', 2011),  
                ('ТТЛП','1-36 05 01', 2013),
                ('ТТЛП','1-36 05 01', 2012),
                ('ТТЛП','1-46 01 01', 2012),--27 гр
                ('ИЭФ','1-25 01 07', 2013), 
                ('ИЭФ','1-25 01 07', 2012),     
                ('ИЭФ','1-25 01 07', 2010),
                ('ИЭФ','1-25 01 08', 2013),
                ('ИЭФ','1-25 01 08', 2012) ---32 гр       

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
	values ('206-1', '206-1','ЛБ-К', 15);
insert into  AUDITORIUM   (AUDITORIUM,   AUDITORIUM_NAME, AUDITORIUM_TYPE, AUDITORIUM_CAPACITY) 
	values  ('301-1', '301-1', 'ЛБ-К', 15);
insert into  AUDITORIUM   (AUDITORIUM,   AUDITORIUM_NAME, AUDITORIUM_TYPE, AUDITORIUM_CAPACITY )   
	values  ('236-1', '236-1', 'ЛК',   60);
insert into  AUDITORIUM   (AUDITORIUM,   AUDITORIUM_NAME, AUDITORIUM_TYPE, AUDITORIUM_CAPACITY )  
	values  ('313-1', '313-1', 'ЛК-К',   60);
insert into  AUDITORIUM   (AUDITORIUM,   AUDITORIUM_NAME, AUDITORIUM_TYPE, AUDITORIUM_CAPACITY )  
	values  ('324-1', '324-1', 'ЛК-К',   50);
insert into  AUDITORIUM   (AUDITORIUM,   AUDITORIUM_NAME, AUDITORIUM_TYPE, AUDITORIUM_CAPACITY )   
	values  ('413-1', '413-1', 'ЛБ-К', 15);
insert into  AUDITORIUM   (AUDITORIUM,   AUDITORIUM_NAME, AUDITORIUM_TYPE, AUDITORIUM_CAPACITY ) 
	values  ('423-1', '423-1', 'ЛБ-К', 90);
insert into  AUDITORIUM   (AUDITORIUM,   AUDITORIUM_NAME, AUDITORIUM_TYPE, AUDITORIUM_CAPACITY )     
	values  ('408-2', '408-2', 'ЛК',  90);
