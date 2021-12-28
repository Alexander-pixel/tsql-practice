--create database AcademyDB
--go
--use AcademyDB
--go

--create table Departments
--(
--	id int primary key identity,
--	financing money not null default 0,
--	[name] nvarchar(100) not null unique,

--	constraint CK_Department_Financing_Value check (financing >= 0),
--	constraint CK_Department_Name_Not_Empty check ([name] != N'')
--)

--create table Faculties
--(
--	id int primary key identity,
--	dean nvarchar(max) not null,
--	[name] nvarchar(100) not null unique,

--	constraint CK_Faculty_Dean_Not_Empty check (dean != N''),
--	constraint CK_Faculty_Name_Not_Empty check ([name] != N''),
--)

--create table Groups
--(
--	id int primary key identity,
--	[name] nvarchar(10) not null unique,
--	rating int not null,
--	[year] int not null,

--	constraint CK_Group_Name_Not_Empty check (name != N''),
--	constraint CK_Group_Rating_Range check (rating between 0 and 5),
--	constraint CK_Group_Year_Range check ([year] between 1 and 5),
--)

--create table Teachers
--(
--	id int primary key identity,
--	employmentDate date not null,
--	isAssistant bit not null default 0,
--	isProfessor bit not null default 0,
--	[name] nvarchar(max) not null,
--	position nvarchar(max) not null,
--	premium money not null default 0,
--	salary money not null,
--	surname nvarchar(max) not null,

--	constraint CK_Teacher_EmploymentDate_Value check (employmentDate >= '01.01.1990'),
--	constraint CK_Teacher_Name_Not_Empty check ([name] != N''),
--	constraint CK_Teacher_Position_Not_Empty check (position != N''),
--	constraint CK_Teacher_Premium_Value check (premium >= 0),
--	constraint CK_Teacher_Salary_Value check (salary > 0),
--	constraint CK_Teacher_Surname_Not_empty check (surname != N''),
--)
 
 --insert into Faculties values
 --('Dean_1', 'Faculty_1'),
 --('Dean_2', 'Faculty_2'),
 --('Dean_3', 'Faculty_3'),
 --('Dean_4', 'Faculty_4'),
 --('Dean_5', 'Faculty_5')

 --insert into Teachers values
--('06.12.2004', 0, 1, 'Name_1', 'Position_1', 2000, 15000, 'Surname_1'),
--('01.19.2009', 1, 0, 'Name_2', 'Position_2', 3700, 19000, 'Surname_2'),
--('03.27.2003', 0, 1, 'Name_3', 'Position_3', 1200, 12000, 'Surname_3'),
--('05.13.2001', 1, 0, 'Name_4', 'Position_4', 0, 5700, 'Surname_4'),
--('08.18.2011', 0, 1, 'Name_5', 'Position_5', 3000, 9600, 'Surname_5'),
--('07.23.2018', 0, 1, 'Name_6', 'Position_6', 7800, 23000, 'Surname_6'),
--('02.28.2021', 1, 0, 'Name_7', 'Position_7', 2000, 12000, 'Surname_7')

--insert into Departments values
--(12000, 'Department_1'),
--(26000, 'Department_2'),
--(25000, 'Department_3'),
--(9500, 'Department_4'),
--(10000, 'Department_5'),
--(4850, 'Department_6'),
--(12500, 'Department_7')

--insert into Departments values
--(10000, 'Computer Science'),
--(12000, 'Machine Learning'),
--(13500, 'AI'),
--(29000, 'Web Design'),
--(10550, 'Mobile Development')

--insert into Teachers values
--('09.30.1997', 0, 1, 'Name_8', 'Position_8', 1000, 10500, 'Surname_8'),
--('06.3.1994', 0, 0, 'Name_9', 'Position_9', 1500, 11400, 'Surname_9'),
--('02.25.1991', 1, 0, 'Name_10', 'Position_10', 2800, 9000, 'Surname_10')


select * from Departments

-- Task 1
select name, financing, id from Departments

-- Task 2
select [name] as [Group Name], rating as [Group Rating]
from Groups

-- Task 3
select surname, salary/premium as [Salary to Premium], 
premium/salary as [Premium to Salary] 
from Teachers

-- Task 4
select 'The dean of faculty ' + name + ' is ' + dean from Faculties

-- Task 5
select surname from Teachers
where isProfessor = 1 and salary > 1050

-- Task 6
select [name] from Departments 
where financing < 11000 or financing > 25000

-- Task 7
select [name] from Departments
where [name] != 'Computer Science'

-- Task 8
select surname, position from Teachers
where isProfessor = 0

-- Task 9
select surname, position, salary, premium from Teachers
where isAssistant = 1 and premium between 160 and 550

-- Task 10
select surname, salary from Teachers
where isAssistant = 1

-- Task 11
select surname, position from Teachers
where employmentDate < '01.01.2000'

-- Task 12
select [name] as [Name of Department] from Departments
where [name] like '[A-R]%' 

-- Task 13
select surname from Teachers
where isAssistant = 1 and salary + premium <= 1200

-- Task 14
select [name] from Groups 
where [year] = 5 and rating between 2 and 4

-- Task 15
select surname from Teachers
where isAssistant = 1 and salary < 550 or premium < 200