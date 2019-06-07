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

set nocount on;      --�� �������� ��������� � ����� �����
declare @i int=0; 
while @i<1000
  begin 
  insert #EXPLRE(TIND, TFIELD) 
               values(floor(20000*RAND()), REPLICATE('������', 10));
  if(@i % 100=0)
	print @i;     --������� ���������
  set @i=@i+1;
  end;


select * from #EXPLRE where TIND between 1500 and 2500 order by TIND 

checkpoint;  --�������� ��
dbcc DROPCLEANBUFFERS;  --�������� �������� ���

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
  while   @i < 20000       -- ���������� � ������� 20000 �����
  begin
  insert #EX(TKEY, TF) values(floor(30000*RAND()), replicate('������ ', 10));
  set @i = @i+1; 
  end;
  go
  select count(*)[���������� �����] from #EX;
  select * from #EX


create index #EX_NONCLU on #EX(TKEY, CC)

select * from  #EX where  TKEY > 1500 and  CC < 4500;  
select * from  #EX order by  TKEY, CC

select * from  #EX where  TKEY = 556 and  CC > 3 --���� �������������,�� �������� �����


----4
--������ �������� ������� ��������� �������� � ������ ��������� ������ �������� 
--������ ��� ���������� ��������������� ��������. 
create  index #EX_TKEY_X on #EX(TKEY) include (CC)  -- �������� ������� �� ���������� � ������ EX_TKEY_X

select CC from #EX where TKEY>15000 -- ����� ���������� �������� ���������� ������-��

drop index #EX_TKEY_X on #EX

----5
select TKEY from  #EX where TKEY between 5000 and 19999; 
select TKEY from  #EX where TKEY>15000 and  TKEY < 20000;  
select TKEY from  #EX where TKEY=17000; 

create  index #EX_WHERE on #EX(TKEY) where (TKEY>=15000 and TKEY < 20000);  
drop index #EX_WHERE on #EX

----6
create index #EX_TKEY on #EX(TKEY); 

-- ��������� ���������� � ������� ������������ �������
use tempdb
select name [������], avg_fragmentation_in_percent [������������ (%)] 
from sys.dm_db_index_physical_stats(DB_ID(N'TEMPDB'), 
  OBJECT_ID(N'#EX'), NULL, NULL, NULL) ss
  JOIN sys.indexes ii on ss.object_id = ii.object_id and ss.index_id = ii.index_id 
  where name is not null;

-- ���������� ������������ 0%

-- ������� ������������ �������� 97%
insert top(10000) #EX(TKEY, TF) select TKEY, TF from #EX;

-- ��� ������� ������ ������������
-- ������������� ����������� ������, �� ����� ��� ������������ ����� ������ ������ �� ����� ������ ������
alter index #EX_TKEY on #EX reorganize; -- ����� 13%
-- ����������� ����������� ��� ���� ������, �������  ����� �� ���������� ������� ������������ ����� ����
alter index #EX_TKEY on #EX rebuild with (online = off); -- ����� 1.5%

drop index #EX_TKEY on #EX

----7
-- ������� ������������ ����� � ��������� ������� ���������, ���� ��� �������� ��� 
-- ��������� ������� ������������ ��������� FILLFACTOR � PAD_INDEX. �������� FILLFACTOR 
-- ��������� ������� ���������� ��������� ������� ������� ������.
CREATE index #EX_TKEY1 on #EX(TKEY)with (fillfactor = 65);

--������� ������������ 1%

INSERT top(50)percent into #EX(TKEY, TF) select TKEY, TF  from #EX; -- ����� 10%

use tempdb
SELECT name [������], avg_fragmentation_in_percent [������������ (%)]
FROM sys.dm_db_index_physical_stats(DB_ID(N'TEMPDB'), OBJECT_ID(N'#EX'), NULL, NULL, NULL) ss
       JOIN sys.indexes ii on ss.object_id = ii.object_id and ss.index_id = ii.index_id  
       where name is not null;

drop index #EX_TKEY1 on #EX
