----1
declare @a char= 5, 
	@b varchar(4)='БГТУ',
	@c datetime,   
	@d time(7),
	@i int,
	@f smallint,
	@g tinyint,
	@h numeric(12,5)=4.7;

set @c = getdate();
set @d = sysdatetime();
set @i = (select count(*) from STUDENT);

select @c c, @d d, @i i;

print 'i = '+ cast(@i as varchar(5));
print 'd= '+cast(@d as varchar(10));
print 'c= '+cast(@c as varchar(10)); 


----2
declare @cap int = (select sum(AUDITORIUM_CAPACITY) from AUDITORIUM);
if @cap > 200
begin
declare @count int = (select count(*) from AUDITORIUM);
declare @avg int = (select avg(AUDITORIUM_CAPACITY) from AUDITORIUM);
declare @countAvg int = (select count(AUDITORIUM) from AUDITORIUM where AUDITORIUM_CAPACITY<@avg);
declare @percAvg float = (select count(*)*100 from AUDITORIUM where AUDITORIUM_CAPACITY<@avg)/@count;
select @cap cap, @count [count], @avg [avg];
print 'countAvg = ' + cast(@countAvg as varchar(5));
print 'percAvg = ' + cast(@percAvg as varchar(5));
end
else if @cap < 200 print 'Размерность аудиторий меньше 200'


----3
print 'Число обработанных строк: '+ cast( @@ROWCOUNT as varchar(10)); 
print 'Версия SQL Server: '+ cast( @@VERSION  as varchar(100)); 
print 'Возвращает системный идентификатор процесса, назначенный сервером текущему подключению: '+ cast( @@SPID  as varchar(10)); 
print 'Код последней ошибки: '+ cast( @@ERROR  as varchar(10)); 
print 'Возвращает уровень вложенности транзакции: '+ cast( @@TRANCOUNT  as varchar(10)); 
print 'Проверка результата считывания строк результирующего набора: '+ cast( @@FETCH_STATUS  as varchar(10)); 
print 'Имя сервера: '+ cast( @@SERVERNAME as varchar(10)); 
print 'Уровень вложенности текущей процедуры: '+ cast( @@NESTLEVEL  as varchar(10));


----4
declare @t int = 5, 
        @x int = 1, 
		@z float;
if @t>@x  set @z = power(sin(@t), 2);
if @t<@x  set @z = 4*(@t+@x);
else      set @z = 1-exp(@x-2); 
print 'z = ' + cast(@z as varchar(10));

select SUBSTRING(NAME, 1, CHARINDEX(' ', NAME)+1)+'.'
      +SUBSTRING(NAME, CHARINDEX(' ', NAME, CHARINDEX(' ', NAME)+1)+1, 1) from STUDENT;

select NAME, BDAY, DATEDIFF(YEAR, BDAY, GETDATE()) [AGE]
	from STUDENT
		where MONTH(BDAY) = MONTH(DATEADD(MONTH, 1, GETDATE()));

select PDATE, DATENAME(WEEKDAY, PDATE) as [День_недели]
	from PROGRESS
		where SUBJECT = 'СУБД'


----5
  declare @i int = (select count(*) from FACULTY);
     if (select count(*) from FACULTY)>5
     begin
     print 'Количество факультетов больше 5';
     print 'Количество = ' +cast(@i as varchar(10));  
     end;
	 else
     begin
     print 'Количество факультетов меньше 5';
     print 'Количество = ' +cast(@i as varchar(10));  
     end;


----6
select
case 
	when NOTE between 9 and 10 then '9-10' 
    when NOTE between 7 and 8 then '7-8'
    when NOTE between 5 and 6 then '5-6'
	when NOTE = 4 then 'четыре'
	else   'пересдача'
    end  Оценка , count(*) [Количество] 
		from PROGRESS   
		group by
			case 
				when NOTE between 9 and 10 then '9-10' 
				when NOTE between 7 and 8 then '7-8'
				when NOTE between 5 and 6 then '5-6'
				when NOTE = 4 then 'четыре'
				else   'пересдача'
                end


----7
create table  #TT (
	Зарплата int,  
	Премия float, 
	Работник varchar(20) 
);
set nocount on;     --не выводить сообщения о вводе строк
declare @k int=0;
declare @salary int = 5; 
while @k<10
  begin 
  insert #TT values(@salary, power(@salary,2), replicate('Анисин', 1));
  set @k=@k+1;
  set @salary = @salary+10;
  end;
  select * from #TT

  drop table  #TT


----8
declare @xk int = 1
     print @xk + 1
     print @xk + 2
     return
     print @xk+3


----9
begin try
update PROGRESS set NOTE = 'пять' where NOTE= 6
end try
begin catch
	print ERROR_NUMBER() --код последней ошибки
	print ERROR_MESSAGE() --сообщение об ошибке
	print ERROR_LINE()  --код последней ошибки
	print ERROR_PROCEDURE() --имя  процедуры или NULL
	print ERROR_SEVERITY()  --уровень серьезности ошибки
	print ERROR_STATE() --метка ошибки
end catch
