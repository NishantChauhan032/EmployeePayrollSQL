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


