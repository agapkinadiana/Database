----1
declare Subs cursor for select SUBJECT from SUBJECT where SUBJECT.PULPIT='ИСиТ'; 

declare @sub char(4), @str char(100)=' '; 
open Subs;  
	fetch Subs into @sub; -- считывает строку из рез. набора и продвигает указатель на след. строку.   
	print 'Дисциплины на кафедре ИСиТ:';   
	while @@fetch_status = 0 -- считывание вып. успешно (1 если конец набора, 2 если строки не существует)                                    
    begin 
		set @str = rtrim(@sub)+', '+@str; -- удаляет все завершающие пробелы        
         fetch  Subs into @sub; 
    end;   
    print @str;        
close Subs;

deallocate Subs; 

----2
declare Puls cursor LOCAL for select PULPIT, FACULTY from PULPIT;

declare @pul nvarchar(10), @fac nvarchar(4);      
open Puls; 	  
	fetch  Puls into @pul, @fac; 	
    print rtrim(@pul)+' на факультете  '+ @fac; 



declare Puls cursor GLOBAL for select PULPIT, FACULTY from PULPIT;

declare @pul1 nvarchar(10), @fac1 nvarchar(4);      
open Puls;	  
	fetch  Puls into @pul1, @fac1; 	
    print rtrim(@pul1)+' на факультете  '+ @fac1; 

	declare @pul2 nvarchar(10), @fac2 nvarchar(4);       	
	fetch  Puls into @pul2, @fac2; 	
    print rtrim(@pul2)+' на факультете  '+ @fac2;   
close Puls;

deallocate Puls;

----3
declare @name char(50);  

declare Studs cursor local dynamic for select NAME from STUDENT where IDGROUP = 20;				   
	
OPEN Studs;
print 'Количество строк : '+cast(@@CURSOR_ROWS as varchar(5)); 

update STUDENT set IDGROUP=21 where IDGROUP=20;
delete STUDENT where IDGROUP=21;


fetch  Studs into @name;     
while @@fetch_status = 0                                    
begin 
   print @name + ' ';      
   fetch Studs into @name; 
end;          
close  Studs;

insert STUDENT(IDGROUP, NAME, BDAY, INFO, FOTO) 
	   values (20,'Андрей', '1997-08-02', NULL, NULL),
			  (20,'Александра', '1997-08-06', NULL, NULL);  
insert STUDENT(IDGROUP, NAME, BDAY, INFO, FOTO) 
	   values (20,'Игорь', '1997-08-01', NULL, NULL),
			  (20,'Елена', '1997-08-03', NULL, NULL);  


----4
declare  @t int, @rn char(50);  

declare ScrollCur cursor local dynamic scroll for 
		select row_number() over (order by NAME), NAME from STUDENT where IDGROUP = 1 
open ScrollCur;
	fetch FIRST from ScrollCur into  @t, @rn;                 
	print 'первая строка: ' + cast(@t as varchar(3))+ ' ' + rtrim(@rn);
	fetch NEXT from ScrollCur into  @t, @rn;                 
	print 'следующая строка: ' + cast(@t as varchar(3))+ ' ' + rtrim(@rn);      
	fetch LAST from  ScrollCur into @t, @rn;       
	print 'последняя строка: ' +  cast(@t as varchar(3))+ ' '+rtrim(@rn);   
	fetch PRIOR from ScrollCur into  @t, @rn;                 
	print 'предпоследняя строка: ' + cast(@t as varchar(3))+ ' ' + rtrim(@rn); 
	fetch ABSOLUTE 2 from ScrollCur into  @t, @rn;    -- от начала             
	print 'вторая строка: ' + cast(@t as varchar(3))+ ' ' + rtrim(@rn); 
	fetch RELATIVE 1 from ScrollCur into  @t, @rn;    -- от текущей          
	print 'третья строка: ' + cast(@t as varchar(3))+ ' ' + rtrim(@rn);         
close ScrollCur;

----5
declare @name1 nvarchar(20);  

-- удаляется первая строка в STUDENT, а студент из след. строки становится студентом 19 группы
declare UpdateCur cursor local dynamic for select NAME from STUDENT where IDGROUP=18 FOR UPDATE; 
open UpdateCur;  
    fetch  UpdateCur into @name1;
	print @name1;  
    delete STUDENT where CURRENT OF UpdateCur;	
    fetch  UpdateCur into @name1; 
    UPDATE STUDENT set IDGROUP=IDGROUP+1 where CURRENT OF UpdateCur;
	print @name1;
close UpdateCur;

----6
declare @name2 nvarchar(20), @n int;  

declare Cur1 cursor local for 
select NAME, NOTE from PROGRESS join STUDENT 
	on PROGRESS.IDSTUDENT = STUDENT.IDSTUDENT
		where NOTE<5

open Cur1;  
    fetch  Cur1 into @name2, @n;  
	while @@fetch_status = 0
	begin 		
		delete PROGRESS where CURRENT OF Cur1;	
		fetch  Cur1 into @name2, @n;  
	end
close Cur1;

select NAME, NOTE from PROGRESS join STUDENT
	on PROGRESS.IDSTUDENT = STUDENT.IDSTUDENT
		where NOTE<5
insert into PROGRESS (SUBJECT,IDSTUDENT,PDATE, NOTE)
    values 
           ('ОАиП', 1005,  '01.10.2013',4),
           ('СУБД', 1017,  '01.12.2013',4),
		   ('КГ',   1018,  '06.5.2013',4),
           ('ОХ',   1065,  '01.1.2013',4),
           ('ОХ',   1069,  '01.1.2013',4),
           ('ЭТ',   1058,  '01.1.2013',4)

-- увеличть оценку на единицу
declare @name3 char(20), @n3 int;  

declare Cur2 cursor local for 
select NAME, NOTE from PROGRESS join STUDENT
	on PROGRESS.IDSTUDENT = STUDENT.IDSTUDENT
		where PROGRESS.IDSTUDENT=1000
open Cur2;  
    fetch  Cur2 into @name3, @n3; 
    UPDATE PROGRESS set NOTE=NOTE+1 where current of Cur2;
close Cur2;

select NAME, NOTE from PROGRESS join STUDENT
	on PROGRESS.IDSTUDENT = STUDENT.IDSTUDENT 
		where PROGRESS.IDSTUDENT=1000

--факультеты, где есть кафедра
declare Fclty cursor for select FACULTY.FACULTY_NAME from FACULTY
	where exists (
		select * from PULPIT
		where FACULTY.FACULTY = PULPIT.FACULTY );

declare @fclty char(500) 

open Fclty;
	fetch Fclty into @fclty;   
	print 'Факультеты, где есть кафера:';   
	while @@fetch_status = 0                                   
    begin    
		print @fclty + ' ';    
        fetch Fclty into @fclty; 
    end;          
close Fclty;

deallocate Fclty; 

