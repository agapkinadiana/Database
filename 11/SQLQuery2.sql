----1
exec sp_helpindex "AUDITORIUM"
exec sp_helpindex "AUDITORIUM_TYPE"
exec sp_helpindex "FACULTY"
exec sp_helpindex "GROUPS"
exec sp_helpindex "PROFESSION"
exec sp_helpindex "PROGRESS"
exec sp_helpindex "PULPIT"
exec sp_helpindex "STUDENT"
exec sp_helpindex "SUBJECT"
exec sp_helpindex "TEACHER"

----2
use tempdb;

create table  #EXPLRE
 ( 
   TIND int,
   TFIELD varchar(100)
 );

set nocount on;      --не выводить сообщения о вводе строк
declare @i int=0; 
while @i<1000
  begin 
  insert #EXPLRE(TIND, TFIELD) 
               values(floor(20000*RAND()), REPLICATE('строка', 10));
  if(@i % 100=0)
	print @i;     --вывести сообщение
  set @i=@i+1;
  end;


select * from #EXPLRE where TIND between 1500 and 2500 order by TIND 

checkpoint;  --фиксация БД
dbcc DROPCLEANBUFFERS;  --очистить буферный кэш

create clustered index #EXPLRE_CL on #EXPLRE(TIND asc)
exec  SP_HELPINDEX '#EXPLRE'
drop table #EXPLRE

----3
create table #EX
 (
   TKEY int,
   CC int identity(1,1),
   TF varchar(100)
 );

set nocount on;           
  declare @i int = 0;
  while   @i < 20000       -- добавление в таблицу 20000 строк
  begin
  insert #EX(TKEY, TF) values(floor(30000*RAND()), replicate('строка ', 10));
  set @i = @i+1; 
  end;
  go
  select count(*)[количество строк] from #EX;
  select * from #EX


create index #EX_NONCLU on #EX(TKEY, CC)

select * from  #EX where  TKEY > 1500 and  CC < 4500;  
select * from  #EX order by  TKEY, CC

select * from  #EX where  TKEY = 556 and  CC > 3 --если зафиксировать,то индексир поиск


----4
--Индекс покрытия запроса позволяет включить в состав индексной строки значения 
--одного или нескольких неиндексируемых столбцов. 
create  index #EX_TKEY_X on #EX(TKEY) include (CC)  -- значение столбца СС включается в индекс EX_TKEY_X

select CC from #EX where TKEY>15000 -- время выполнения осталось одинаковое почему-то

drop index #EX_TKEY_X on #EX

----5
select TKEY from  #EX where TKEY between 5000 and 19999; 
select TKEY from  #EX where TKEY>15000 and  TKEY < 20000;  
select TKEY from  #EX where TKEY=17000; 

create  index #EX_WHERE on #EX(TKEY) where (TKEY>=15000 and TKEY < 20000);  
drop index #EX_WHERE on #EX

----6
create index #EX_TKEY on #EX(TKEY); 

-- получение информации о степени фрагментации индекса
use tempdb
select name [Индекс], avg_fragmentation_in_percent [Фрагментация (%)] 
from sys.dm_db_index_physical_stats(DB_ID(N'TEMPDB'), 
  OBJECT_ID(N'#EX'), NULL, NULL, NULL) ss
  JOIN sys.indexes ii on ss.object_id = ii.object_id and ss.index_id = ii.index_id 
  where name is not null;

-- изначально фрагментация 0%

-- уровень фрагментации превысит 97%
insert top(10000) #EX(TKEY, TF) select TKEY, TF from #EX;

-- два способа убрать фрагментацию
-- реорганизация выполняется быстро, но после нее фрагментация будет убрана только на самом нижнем уровне
alter index #EX_TKEY on #EX reorganize; -- стала 13%
-- перестройка затрагивает все узлы дерева, поэтому  после ее выполнения степень фрагментации равна нулю
alter index #EX_TKEY on #EX rebuild with (online = off); -- стала 1.5%

drop index #EX_TKEY on #EX

----7
-- уровнем фрагментации можно в некоторой степени управлять, если при создании или 
-- изменении индекса использовать параметры FILLFACTOR и PAD_INDEX. Параметр FILLFACTOR 
-- указывает процент заполнения индексных страниц нижнего уровня.
CREATE index #EX_TKEY1 on #EX(TKEY)with (fillfactor = 65);

--сначала фрагментация 1%

INSERT top(50)percent into #EX(TKEY, TF) select TKEY, TF  from #EX; -- стала 10%

use tempdb
SELECT name [Индекс], avg_fragmentation_in_percent [Фрагментация (%)]
FROM sys.dm_db_index_physical_stats(DB_ID(N'TEMPDB'), OBJECT_ID(N'#EX'), NULL, NULL, NULL) ss
       JOIN sys.indexes ii on ss.object_id = ii.object_id and ss.index_id = ii.index_id  
       where name is not null;

drop index #EX_TKEY1 on #EX
