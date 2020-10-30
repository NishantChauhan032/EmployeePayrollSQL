# UC 1- To show,create and select databaseemployee_payrollemployee_payroll
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

# UC 8- To store employee information like employee phone, address and department 
Alter table employee_payroll Add PhoneNumber Varchar(250) After Name;                     #To add phone number column after name column
Alter table employee_payroll Add Address Varchar(250) After PhoneNumber;                  #To add Address column after PhoneNumber column
Alter table employee_payroll Add Department Varchar(150) NOT NULL After Address;          #To add department column after Address Column
Alter table employee_payroll Alter Address SET Default 'TBD';                             #To set a default value to the address
describe employee_payroll;
select * from employee_payroll;

# UC 9- To extend table to have Basic pay,deductions,Taxable Pay,Income Tax,Net Pay
Alter table employee_payroll Rename Column Salary To Basic_Pay;
Alter table employee_payroll Add Deductions Double NOT NULL After Basic_Pay;
Alter table employee_payroll Add Taxable_Pay Double NOT NULL After Deductions;
Alter table employee_payroll Add Income_Tax Double NOT NULL After Taxable_Pay;
Alter table employee_payroll Add Net_Pay Double NOT NULL After Income_Tax;
Describe employee_payroll;

# UC 10- To make Terisa as a part of Sales and Marketing Department
Update employee_payroll SET department = 'sales'  WHERE name = 'Terisa';
Update employee_payroll SET basic_pay = '3000000.00'  WHERE name = 'Terisa';
Insert into employee_payroll(Name ,PhoneNumber,Address,Department,Gender,Basic_Pay,Deductions,Taxable_Pay,Income_Tax,Net_Pay,Start) values
( 'Terisa','9878765469','Srinagar','marketing','F',3000000.00,1000000.00,2000000.00,500000.00,1500000.00,'2020-05-21' );
select * from employee_payroll;

# UC 11- To implement the ER Diagram to Payroll Service DataBase
drop table employee_payroll;                                       #dropping previous data
CREATE TABLE Employee_Details (
  ID int unsigned NOT NULL auto_increment,
  Name Varchar(150) NOT NULL, 
  PhoneNumber Varchar(250),
  Address Varchar(250),
  Gender char(1),
  START DATE NOT NULL,
  Salary_ID int unsigned NOT NULL,
  PRIMARY KEY (ID),
  FOREIGN KEY(Salary_ID) references employee_Payroll(Salary_ID)                  #Defining foreign key
);

CREATE TABLE Employee_Payroll (
  Salary_ID int unsigned NOT NULL,
  Basic_Pay Double NOT NULL,
  Deductions Double NOT NULL,
  Taxable_Pay Double NOT NULL,
  Income_Tax Double NOT NULL,
  Net_Pay Double NOT NULL,
  PRIMARY KEY (Salary_ID)
);

CREATE TABLE Department (
  Dep_ID VARCHAR(10) NOT NULL,
  Department VARCHAR(150),
  PRIMARY KEY (Dep_ID)
);

CREATE TABLE Employee_Dept (
  ID int unsigned NOT NULL,
  Dep_ID VARCHAR(10) NOT NULL,
  FOREIGN KEY(ID) references Employee_Details(ID),                                  #Defining multiple foreign keys      
  FOREIGN KEY(Dep_ID) references Department(Dep_ID)
);

Insert Into Employee_Payroll(Salary_ID,Basic_Pay,Deductions,Taxable_Pay,Income_Tax,Net_Pay) Values
(0001,3000000,1000000,2000000,200000,1800000),
(0002,4000000,1000000,3000000,300000,2700000),
(0003,5000000,1000000,4000000,400000,3600000);
select * from employee_payroll;

Insert Into Employee_Details(Name,PhoneNumber,Address,Gender,START,Salary_ID) Values
('Bill','9876543212','Bihar','M','2020-05-11',0001),
('Terisa','7878676756','Jharkhand','F','2018-05-21',0002),
('Charlie','7876756456','Bangalore','M','2019-05-13',0003);
select * from employee_details;

Insert into Department(Dep_Id,Department) Values
('DID01','Sales'),
('DID02','Marketing'),
('DID03','Analytics');
select * from department;

Insert into Employee_Dept(ID,Dep_ID) Values
(1,'DID01'),
(2,'DID01'),
(2,'DID02'),
(3,'DID03');
select * from employee_dept;





