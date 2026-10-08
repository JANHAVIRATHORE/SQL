create database schooldb; #no need to create db in real world

show databases;

use schooldb;

#varchar remove remailing block if name contiain less character than reserve value for it where as char keep the block
create table student (
name varchar(50),
age int,
marks int
);

insert into student (name,age,marks)
values
("Rahul",22,54),
("Manish",21,44),
("Ram",24,64);

select * from student;
#ddl-data definition languaage(create,alter,drop,truncate(remove the data inside the table))
alter table student add column grade varchar (50);

drop table student;
select * from student;

truncate table student;
select * from student;

create table student (
name varchar(50),
age int,
marks int,
grade varchar (50)
);

insert into student (name,age,marks)
values
("Rahul",22,54),
("Manish",21,44),
("Ram",24,64);

select * from student;

update student set grade='A' where name="Rahul";