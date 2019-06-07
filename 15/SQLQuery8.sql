go
create function FFACPUL(@f varchar(20), @p varchar(20)) returns table
as return
select FACULTY.FACULTY, PULPIT.PULPIT from FACULTY left outer join PULPIT
  on FACULTY.FACULTY = PULPIT.FACULTY
   where FACULTY.FACULTY = ISNULL(@f, FACULTY.FACULTY) and --������ ��������, �� ������ null
    PULPIT.PULPIT = ISNULL(@p, PULPIT.PULPIT);

go
create procedure TASK
	as begin
		begin try         
			begin tran
				select * from dbo.FFACPUL(null, null);
				select * from dbo.FFACPUL('����', null);
				select * from dbo.FFACPUL(null, '����');
				select * from dbo.FFACPUL('����', '����');
			commit tran;
		end try
		begin catch
			print '����� ������: ' + cast(error_number() as varchar(6));
			print '���������: ' + error_message();
			print '�������: ' + cast(error_severity() as varchar(6));
			print '�����: ' + cast(error_state() as varchar(8));
			print '����� ������: ' + cast(error_line() as varchar(8));
			if error_procedure() is not  null   
				print '��� ���������: ' + error_procedure(); 
			if @@trancount > 0 rollback tran ; 
			return -1;
		end catch;
	end;

declare @k3 int;  
exec @k3 = TASK; 
print '��� ������: ' + cast(@k3 as varchar(3));