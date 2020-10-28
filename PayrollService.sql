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


