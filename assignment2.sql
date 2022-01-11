-----------------------Creating tables-------------------
create table customer(c_id int PRIMARY KEY, Name varchar(20), Age int, Address varchar(50),Salary int);
create table supplier(sup_id int PRIMARY KEY, Sup_Name varchar(20), Product_Name varchar(50), Address varchar(50));
create table customer_order(id int PRIMARY KEY, C_id int ,S_id int references supplier(sup_id) , order_name varchar(20));

--------------------inserting data--------------------

insert into customer values(1,'Shreyansh',20,'Ahmedabad',10000),(2,'Ajit',21,'Ahmedabad',15000),(3,'Dhairya',22,'Rajkot',8000),(4,'Jay',20,'Rajkot',10000);
insert into supplier values(1,'Vijay','Laptop','Delhi'),(2,'Ajay','Bag','Mumbai'),(3,'Rushabh','Mouse','Kolkata'),(4,'Dipen','Keyboard','Ahmedabad');
insert into customer_order values(1,1,1,'Laptop'),(2,1,2,'Bag'),(3,2,3,'Mouse'),(4,3,2,'Bag'),(5,1,3,'Mouse'),(6,1,4,'Keyboard');

-------------------------selecting data---------------------

select * from customer;
select * from supplier;
select * from customer_order;

--------------------------joins--------------------------------
select * from customer inner join customer_order on customer.c_id= customer_order.id inner join supplier on customer.c_id=supplier.sup_id;
select * from customer left join customer_order on customer.c_id= customer_order.id right join supplier on customer.c_id=supplier.sup_id;
select * from customer right join customer_order on customer.c_id= customer_order.id left join supplier on customer.c_id=supplier.sup_id;


select * from customer inner join customer_order on customer.c_id= customer_order.id left join supplier on customer.c_id=supplier.sup_id
union
select * from customer right join customer_order on customer.c_id= customer_order.id left join supplier on customer.c_id=supplier.sup_id;

----------------------creating procedure------------------------

CREATE OR ALTER PROCEDURE spcustomer
as
begin
select * from customer
end;

exec spcustomer;

CREATE OR ALTER PROCEDURE spcustomer(@age int =18)
as
begin
select * from customer where Age=@age;
end;

exec spcustomer 20;
 --@age=21;


 CREATE OR ALTER PROCEDURE spcustomer_order(@id int, @count int output)
as
begin
select @count = COUNT (*)  from customer_order where C_id=@id;
end;

-----------------------Using exception with try catch block -------------------

BEGIN TRY

	declare @count int;
	exec spcustomer_order @id = 1, @count= @count output 
	select @count AS 'total orders by customer';

END TRY
BEGIN CATCH
	print ERROR_MESSAGE();
END CATCH


------------------- creating view-------------------
CREATE VIEW cst 
AS 
select Name, Address from customer;

select * from cst;



