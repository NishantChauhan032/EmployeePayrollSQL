# UC 1- To show,create and select database
show databases;
create database payroll_service;
use payroll_service;
Select database();

# UC 2- To create employee payroll table
create table employee_payroll                                     #Create table
(
ID       int unsigned NOT NULL auto_increment,                    #Set ID as auto increment
Name     Varchar(150) NOT NULL,                                    
Salary   double NOT NULL,
START    DATE NOT NULL,
primary key (ID)                                                  #Set ID as primary key
);        
describe employee_payroll;                                        #To describe table

# UC 3- To insert data into the table
Insert into employee_payroll(name , salary , start) values
( 'Bill',1000000.00,'2018-01-03' ),
( 'Terisa',2000000.00,'2019-11-13'),
( 'Charlie',3000000.00,'2020-05-21');

# UC 4- To retrieve all employee payroll data
select * from employee_payroll;

# UC 5- To retrieve salaray from payroll data
select salary from employee_payroll where name ='Bill';                   #salary of any particular employee
select * from employee_payroll                                            #salary of employees joined after a particular date
	where start between cast('2018-01-01' as date) and date(now()); 
    
# UC 6- Table altered to add gender 
alter table employee_payroll ADD Gender char(1) after name;
update employee_payroll set Gender = 'F' where name = 'Terisa';
update employee_payroll set Gender = 'M' where name = 'Bill' or name = 'Charlie';

#UC 7- Ability to find sum, average, min, max and number of male and female employees
select gender,SUM(salary) from employee_payroll where gender = 'F' group by gender;       #To show sum of salary for female employees
select gender,SUM(salary) from employee_payroll where gender = 'M' group by gender;       #To show sum of salary for male employees
select gender,SUM(salary) from employee_payroll  group by gender;                         #To show sum of salary for both male and female employees

select gender,AVG(salary) from employee_payroll where gender = 'F' group by gender;       #To show average salary for female employees
select gender,AVG(salary) from employee_payroll where gender = 'M' group by gender;       #To show average salary for male employees
select gender,AVG(salary) from employee_payroll group by gender;                          #To show average salary forboth male and female employees

select gender,MIN(salary) from employee_payroll where gender = 'F' group by gender;       #To show minimum salary for female employees
select gender,MIN(salary) from employee_payroll where gender = 'M' group by gender;       #To show minimum salary for male employees
select gender,MIN(salary) from employee_payroll group by gender;                          #To show minimum salary for both male and female employees

select gender,MAX(salary) from employee_payroll where gender = 'M' group by gender;       #To show maximum salary for female employees
select gender,MAX(salary) from employee_payroll where gender = 'M' group by gender;       #To show maximum salary for male employees
select gender,MAX(salary) from employee_payroll group by gender;                          #To show maximum salary for both male and female employees
 
select gender,COUNT(*) from employee_payroll group by gender;                             #To count number of male and female employees



