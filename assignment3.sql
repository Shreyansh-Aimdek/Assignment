---------------CREATING TABLES------------------
create table account (acc_id int primary key, account_name varchar(50), amount int);
create table transaction_history(acc_id int references account(acc_id) , date_time date, prev_amount int, curr_amount int);

insert into  account values (1,'Shreyansh',10000),(2,'Ajay',15000),(3,'Shrey',5000),(4,'Jay',12000),(5,'Vijay',8000);

update account set amount =10000 where acc_id=1;


-------------TCL COMMANDS------------------
begin try
	
begin transaction
	declare @in_suf_bal varchar(50);  
	declare @debit_amount int = 2000;
	declare @id int = 1;
	declare @curr_bal int;
	declare @new_bal int;
	set @curr_bal=(select amount from account where acc_id=@id);
	SAVE TRANSACTION FirstInsert
	if (@debit_amount>@curr_bal)
	begin
		print('Insufficient balance');
	end

	else
	begin
		declare @cr_date date;
		set @cr_date = GETDATE();
		set @new_bal = @curr_bal-@debit_amount;
		
		update account set amount=amount-@debit_amount where acc_id =@id;
		insert into transaction_history values(@id, @cr_date,@curr_bal, @new_bal);
	end
	if (@new_bal<2000)
	begin 
		rollback transaction FirstInsert;
		print (' Amount debit limit reached');
		end
	else
	begin
		print (CAST(@debit_amount AS VARCHAR(10) )+ ' rs Amount debited')
		print ('New Amount is:'+ CAST(@new_bal AS VARCHAR(10)))
		commit;
	end
END TRY

BEGIN CATCH
	print ERROR_MESSAGE();
END CATCH


select * from account where acc_id=1;

-----------ARITHMETIC FUNCTION------------

select MAX(amount) from account;
select Min(amount) from account;
select AVG(amount) from account;
select SUM(amount) from account;
select COUNT(*) from account;
select MAX(amount) from account;
select abs(amount) from account where acc_id=1;
select FLOOR(amount) from account where acc_id=1;
select SQRT(amount) from account where acc_id=1;
select POWER(amount,2) from account where acc_id=1;

