--create database Academy;

use Academy;
go

--create table Groups 
--(
--	id int primary key identity(1, 1),
--	[name] nvarchar(10) not null unique,
--	rating int not null,
--	[year] int not null, 

--	constraint CK_Group_Name_Not_Empty check ([name] != N''),
--	constraint CK_Group_Rating_Range check (rating >= 0 and rating <= 5),
--	constraint CK_Group_Year_Range check ([year] >= 1 and [year] <= 5),
--)

--create table Departments
--(
--	id int primary key identity(1, 1),
--	financing money not null default 0,
--	[name] nvarchar(100) not null unique,

--	constraint CK_Department_Financing_Value check (financing >= 0),
--	constraint CK_Department_Name_Not_Empty check ([name] != N''),
--)

--create table Faculties
--(
--	id int primary key identity(1, 1),
--	[name] nvarchar(100) not null unique,

--	constraint CK_Faculty_Name_Not_Empty check ([name] != N''),
--)

--create table Teachers
--(
--	id int primary key identity(1, 1),
--	employmentDate date not null,
--	[name] nvarchar(max) not null,
--	premium money not null default 0,
--	salary money not null,
--	surname nvarchar(max) not null,

--	constraint CK_Teacher_EmploymentDate check (employmentDate >= '01.01.1990'),
--	constraint CK_Teacher_Name_Not_Empty check ([name] != N''),
--	constraint CK_Teacher_Premium_Value check (premium >= 0),
--	constraint CK_Teacher_Salary_Value check (salary > 0),
--	constraint CK_Teacher_Surname_Not_Empty check(surname != N'')
--)

--insert into Groups ([name], rating, [year]) values ('Name_1', 1, 3);
--insert into Groups ([name], rating, [year]) values ('Name_2', 3, 2);
--insert into Groups ([name], rating, [year]) values ('Name_3', 2, 4);
--insert into Groups ([name], rating, [year]) values ('Name_4', 4, 5);

--insert into Departments (financing, name) values (12000, 'Department_1');
--insert into Departments (financing, name) values (35000, 'Department_2');
--insert into Departments (financing, name) values (24000, 'Department_3');
--insert into Departments (financing, name) values (12000, 'Department_4');
--insert into Departments (financing, name) values (10000, 'Department_5');

--insert into Faculties (name) values ('Faculty_1');
--insert into Faculties (name) values ('Faculty_2');
--insert into Faculties (name) values ('Faculty_3');
--
--insert into Faculties (name) values ('Faculty_4');
--insert into Faculties (name) values ('Faculty_5');

--insert into Teachers (employmentDate, [name], premium, salary, surname) values ('09-20-2004', 'Name_1', 1000, 15500, 'Surname_1');
--insert into Teachers (employmentDate, [name], premium, salary, surname) values ('05-12-2012', 'Name_1', 1500, 19000, 'Surname_2');
--insert into Teachers (employmentDate, [name], premium, salary, surname) values ('01-19-2019', 'Name_1', 3500, 21000, 'Surname_3');
--insert into Teachers (employmentDate, [name], premium, salary, surname) values ('10-01-1999', 'Name_1', 0, 12500, 'Surname_4');
