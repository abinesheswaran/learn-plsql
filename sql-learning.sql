-- *****************************************************
--   CRUD Examples
-- *****************************************************

create table emp (
	id serial primary key,
	name varchar(50) not null,
	exp int default 0,
	phno bigint,
	email varchar(50),
	location varchar(5)
);

insert into emp (name,exp,phno,email,location) values 
('John Doe', 5, 9876543210, 'john.doe@example.com', 'TN'),
('Jane Smith', 3, 9123456789, 'jane.smith@example.com', 'AP'),
('Robert Brown', 10, 9988776655, 'robert.brown@example.com', 'KL'),
('Emily Davis', 7, 8877665544, 'emily.davis@example.com', 'TN'),
('Michael Johnson', 2, 7766554433, 'michael.johnson@example.com', 'UP');

insert into emp (name,exp,phno,email) values ('Test',0,123456789,'test@example.com');

select * from emp;

update emp set exp = 15 where name like 'John%';

delete from emp where name = 'Jane Smith';

delete from emp;

drop table emp;

-- *****************************************************
--   Alter Examples
-- *****************************************************

alter table emp drop column exp;

alter table emp rename phno to phone_number;

alter table emp alter column phone_number type varchar(50);

alter table emp add exp int default 1;

alter table emp rename to employee;

select * from employee;

alter table emp add column role varchar(50) default 'T';

update emp set role = 'SE' where id = 2;
update emp set role = 'TL' where id = 3;
update emp set role = 'SSE' where id = 4;
update emp set role = 'ASE' where id = 5;
-- *****************************************************
--   Group By Statements Examples
-- *****************************************************

select * from emp where name like 'John%';

select * from emp where exp > 6;

select * from emp order by exp;

select count(*), min(exp), max(exp), avg(exp) from emp;


-- *****************************************************
--   Joins Examples
-- *****************************************************

create table location (
	name varchar(5),
	fullname varchar(50),
	pincode int,
	language varchar(20)
);

insert into location (name,fullname,pincode, language) values 
('TN', 'Tamil Nadu', 600001, 'Tamil'),
('MH', 'Maharashtra', 400001, 'Marathi'),
('KL', 'Kerala', 670001, 'Malayalam'),
('UP', 'Uttar Pradesh', 110001, 'Hindi');

select * from location;

create table role (
	id varchar(5) primary key,
	name varchar(50),
	min_salary int,
	max_salary int
);

insert into role (id,name,min_salary,max_salary) values 
('T', 'Trainee', 40000, 60000),
('ASE', 'Associate Software Engineer', 500000, 70000),
('SE', 'Software Engineer', 60000, 90000),
('SSE', 'Senior Software Engineer', 80000, 150000),
('TL', 'Tech Lead', 130000, 190000),
('PM', 'Project Manager', 180000, 250000);

update role set min_salary = 50000 where id = 'ASE';

select * from role;

select * from emp;

select * from location;

-- Inner join
select emp.name, emp.exp, emp.role, role.min_salary, role.max_salary from emp
inner join role on role = role.id 
order by role.min_salary;

-- Right join
select emp.name, emp.exp, emp.role, role.min_salary, role.max_salary from emp
right join role on role = role.id 
order by role.min_salary;

-- Left join
select emp.name, emp.location, location.language from emp 
left join location on emp.location = location.name;

-- Three table join
select emp.name, emp.location, location.language,role.name from emp
full join location on emp.location = location.name
full join role on role.id = emp.role;









