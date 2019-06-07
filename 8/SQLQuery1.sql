----1
select  max(AUDITORIUM_CAPACITY) [Максимальная вместимость],
		min(AUDITORIUM_CAPACITY) [Минимальная вместимость],
		avg(AUDITORIUM_CAPACITY) [Средняя вместимость],
		sum(AUDITORIUM_CAPACITY) [Суммарная вместимость],
		count(*) [Количество аудиторий]
	from AUDITORIUM

----2
select  AUDITORIUM_TYPE.AUDITORIUM_TYPE,
		max(AUDITORIUM_CAPACITY) [Максимальная вместимость],
		min(AUDITORIUM_CAPACITY) [Минимальная вместимость],
		avg(AUDITORIUM_CAPACITY) [Средняя вместимость],
		count(*) [Количество аудиторий]
	from AUDITORIUM inner join AUDITORIUM_TYPE
	on AUDITORIUM.AUDITORIUM_TYPE = AUDITORIUM_TYPE.AUDITORIUM_TYPE
	group by AUDITORIUM_TYPE.AUDITORIUM_TYPE;

----3
select *
	from (select case
		when NOTE between 4 and 5 then '4-5'
		when NOTE between 6 and 7 then '6-7'
		when NOTE between 8 and 9 then '8-9'
		else '10'
		end [оценки], count(*) [количество]
	from PROGRESS group by case 
		when NOTE between 4 and 5 then '4-5'
		when NOTE between 6 and 7 then '6-7'
		when NOTE between 8 and 9 then '8-9'
		else '10'
		end) as T
			order by case [оценки]
				when '4-5' then 4
				when '6-7' then 3
				when '8-9' then 2 
				when '10' then 1
				else 0
				end

----4
select f.FACULTY_NAME, g.PROFESSION, YEAR(GETDATE()) - g.YEAR_FIRST [курс], round(avg(cast(p.NOTE as float(4))),2) [оценка]
	from FACULTY f inner join GROUPS g
	on f.FACULTY = g.FACULTY
		inner join STUDENT s
		on g.IDGROUP = s.IDGROUP
			inner join PROGRESS p
			on s.IDSTUDENT = p.IDSTUDENT
	group by f.FACULTY, f.FACULTY_NAME, g.PROFESSION, s.IDGROUP, g.YEAR_FIRST
	order by оценка desc;

----5
select f.FACULTY_NAME, g.PROFESSION, YEAR(GETDATE()) - g.YEAR_FIRST [курс], round(avg(cast(p.NOTE as float(4))),2) [оценка]
	from FACULTY f inner join GROUPS g
	on f.FACULTY = g.FACULTY
		inner join STUDENT s
		on g.IDGROUP = s.IDGROUP
			inner join PROGRESS p
			on s.IDSTUDENT = p.IDSTUDENT
	where p.[SUBJECT] LIKE 'ОАиП' OR p.[SUBJECT] LIKE 'СУБД'
	group by f.FACULTY_NAME, g.PROFESSION, g.YEAR_FIRST
	order by оценка desc;

----6, 7
select f.FACULTY, g.PROFESSION, round(avg(cast(p.NOTE as float(4))),2) [оценка], p.SUBJECT [предмет]
	from FACULTY f inner join GROUPS g
	on f.FACULTY = g.FACULTY
		inner join STUDENT s
		on g.IDGROUP = s.IDGROUP
			inner join PROGRESS p
			on s.IDSTUDENT = p.IDSTUDENT
	where f.FACULTY LIKE 'ИДиП'
	group by f.FACULTY, g.PROFESSION, p.SUBJECT
	--group by ROLLUP (f.FACULTY, g.PROFESSION, p.SUBJECT)
	--group by CUBE (f.FACULTY, g.PROFESSION, p.SUBJECT)
	--order by оценка desc;


----8
select p.SUBJECT [Дисциплина], 
		g.PROFESSION [Специальность],
		ROUND(AVG(CAST(p.NOTE as float (4))),2) [Средняя оценка]
		from PROGRESS p inner join STUDENT s
			on p.IDSTUDENT = s.IDSTUDENT
			inner join GROUPS g
			on s.IDGROUP = g.IDGROUP
		where g.FACULTY = 'ИДиП'
		group by g.PROFESSION, p.SUBJECT
union
select p.SUBJECT [Дисциплина], 
		g.PROFESSION [Специальность],
		ROUND(AVG(CAST(p.NOTE as float (4))),2) [Средняя оценка]
		from PROGRESS p inner join STUDENT s
			on p.IDSTUDENT = s.IDSTUDENT
			inner join GROUPS g
			on s.IDGROUP = g.IDGROUP
		where g.FACULTY = 'ХТиТ'
		group by g.PROFESSION, p.SUBJECT


----9
select p.SUBJECT [Дисциплина], 
		g.PROFESSION [Специальность],
		ROUND(AVG(CAST(p.NOTE as float (4))),2) [Средняя оценка]
		from PROGRESS p inner join STUDENT s
			on p.IDSTUDENT = s.IDSTUDENT
			inner join GROUPS g
			on s.IDGROUP = g.IDGROUP
		where g.FACULTY = 'ИДиП'
		group by g.PROFESSION, p.SUBJECT
intersect
select p.SUBJECT [Дисциплина], 
		g.PROFESSION [Специальность],
		ROUND(AVG(CAST(p.NOTE as float (4))),2) [Средняя оценка]
		from PROGRESS p inner join STUDENT s
			on p.IDSTUDENT = s.IDSTUDENT
			inner join GROUPS g
			on s.IDGROUP = g.IDGROUP
		where g.FACULTY = 'ХТиТ'
		group by g.PROFESSION, p.SUBJECT


----10
select p.SUBJECT [Дисциплина], 
		g.PROFESSION [Специальность],
		ROUND(AVG(CAST(p.NOTE as float (4))),2) [Средняя оценка]
		from PROGRESS p inner join STUDENT s
			on p.IDSTUDENT = s.IDSTUDENT
			inner join GROUPS g
			on s.IDGROUP = g.IDGROUP
		where g.FACULTY = 'ИДиП'
		group by g.PROFESSION, p.SUBJECT
except
select p.SUBJECT [Дисциплина], 
		g.PROFESSION [Специальность],
		ROUND(AVG(CAST(p.NOTE as float (4))),2) [Средняя оценка]
		from PROGRESS p inner join STUDENT s
			on p.IDSTUDENT = s.IDSTUDENT
			inner join GROUPS g
			on s.IDGROUP = g.IDGROUP
		where g.FACULTY = 'ХТиТ'
		group by g.PROFESSION, p.SUBJECT


----11
SELECT p.NOTE [Дисциплина], g.PROFESSION [Код специальности],
	(SELECT COUNT(*) from PROGRESS pr
	where p.IDSTUDENT = p.IDSTUDENT) [Количество]
	from STUDENT s join GROUPS g
		on g.IDGROUP = s.IDGROUP
		join PROGRESS p
			on p.IDSTUDENT = s.IDSTUDENT
	group by p.NOTE, p.IDSTUDENT, g.PROFESSION
	having NOTE = 8 or NOTE = 9
	order by p.NOTE desc, g.PROFESSION