CREATE DATABASE demo;

use demo;

create table student(id int PRIMARY KEY, name varchar(20), age int, email varchar(50));

alter table student 
add contact varchar(10);

insert into student values(1, 'Shreyansh',20,'prajapatishreyansh2369@gmail.com','8200890816');

insert into student values(2,'Ajit',20,'ajit.chauhan@gmail.com','9376746521'),(3,'Meet',21,'bhavsarmeet@gmail.com','7430457955');

select *from student;

select distinct age from student;

select age from student group by age;

select * from student where age>20;

select * from student where name LIKE 'S%';

update student set age=21 where id=1;

delete from student where id=3;

truncate table student;

drop table student;