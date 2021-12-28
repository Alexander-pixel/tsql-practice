create database HospitalDB;
go
use HospitalDB;
go

create table Departments
(
	id int primary key identity,
	building int not null,
	financing money not null default 0,
	[floor] int not null,
	[name] nvarchar(100) not null unique,

	constraint CK_Department_Building_Range check (building between 1 and 5),
	constraint CK_Department_Financing_Value check (financing >= 0),
	constraint CK_Department_Floor_Value check ([floor] >= 1),
	constraint CK_Department_Name_Not_Empty check ([name] != N''),
)

create table Diseases
(
	id int primary key identity,
	[name] nvarchar(100) not null unique, 
	severity int default 1 not null,

	constraint CK_Disease_Name_Not_Empty check ([name] != N''),
	constraint CK_Disease_Severity_Value check (severity >= 1),
)

create table Doctors
(
	id int primary key identity,
	[name] nvarchar(max) not null, 
	phone char(10),
	premium money not null default 0,
	salary money not null,
	surname nvarchar(max) not null,

	constraint CK_Doctor_Name_Not_Empty check ([name] != N''),
	constraint CK_Doctor_Premium_Value check (premium >= 0),
	constraint CK_Doctor_Salary_Value check (salary > 0),
	constraint CK_Doctor_Surname_Not_Empty check (surname != N''),
)

create table Examinations
(
	id int primary key identity,
	[dayOfWeek] int not null,
	[name] nvarchar(100) not null unique,
	startTime time not null,
	endTime time not null,
	
	constraint CK_Examination_DayOfWeek_Range check ([dayOfWeek] between 1 and 7),
	constraint CK_Examination_Name_Not_Empty check ([name] != N''),
	constraint CK_Examination_StartTime_Range check (startTime between '8:00:00' and '18:00:00'),
	constraint CK_Examination_EndTime_Value check (endTime > startTime),
)

create table Wards
(
	id int primary key identity,
	building int not null,
	[floor] int not null,
	[name] nvarchar(20) not null unique,

	constraint CK_Ward_Building_Range check (building between 1 and 5),
	constraint CK_Ward_Floor_Value check ([floor] >= 1),
	constraint CK_Ward_Name_Not_Empty check ([name] != N''),
)

--insert into Departments (building, financing, floor, name) values
--(2, 10000, 3, 'Department_1'),
--(1, 10000, 1, 'Department_2'),
--(5, 15000, 3, 'Department_3'),
--(3, 17000, 5, 'Department_4'),
--(2, 15500, 4, 'Department_5'),
--(1, 27000, 7, 'Department_6')

--insert into Diseases values
--('Name_1', 1),
--('Name_2', 2),
--('Name_3', 3),
--('Name_4', 4),
--('Name_5', 5),
--('Name_6', 1)

--insert into Doctors values
--('Name_1', '+380-22-2', 15000, 25000, 'Surname_1'),
--('Name_2', '+380-33-8', 25000, 54000, 'Surname_2'),
--('Name_3', '+380-77-9', 1000, 16700, 'Surname_3'),
--('Name_5', '+380-55-6', 2500, 27900, 'Surname_4'),
--('Name_5', '+380-33-4', 3900, 1900, 'Surname_5')

--insert into Examinations values
--(3, 'Examination_1', '12:00', '14:00'),
--(5, 'Examination_2', '11:00', '12:00'),
--(3, 'Examination_3', '14:00', '15:00'),
--(4, 'Examination_4', '11:00', '12:00'),
--(1, 'Examination_5', '14:30', '15:00')

--insert into Wards values
--(2, 2, 'Ward_1'),
--(1, 3, 'Ward_2'),
--(5, 4, 'Ward_3'),
--(3, 1, 'Ward_4'),
--(2, 2, 'Ward_5'),
--(1, 6, 'Ward_6')

-- Task 1
select * from Wards

-- Task 2
select surname as [Surname], phone as [Phone] from Doctors

-- Task 3
select distinct floor from Wards

-- Task 4
select [name] as [Name of Disease], 
severity as [Severity of Disease]
from Diseases

-- Task 5
select * from Departments as [Отделения]
select * from Diseases as [Заболевания]
select * from Doctors as [Врачи]

-- Task 6
select [name] 
from Departments
where building = 5 and financing < 30000

-- Task 7
select [name] 
from Departments
where building = 3 and financing between 12000 and 15000

-- Task 8
select [name]
from Wards
where building between 4 and 5 and [floor] = 1

-- Task 9
select [name], building, financing
from Departments
where building = 3
and (financing < 11000 or financing > 25000)

-- Task 10
select surname 
from Doctors
where premium + salary > 1500

-- Task 11
select surname 
from Doctors 
where (salary / 2) > (premium * 3)

-- Task 12
select distinct [name]
from Examinations
where ([dayOfWeek] between 1 and 3)
and (startTime >= '12:00' and endTime <= '15:00')

-- Task 13
select [name], building
from Departments
where building = 1 or building = 3 or building = 8 or building = 10

-- Task 14
select [name] 
from Diseases
where severity > 2

-- Task 15
select [name]
from Departments 
where building != 1 and building != 3

-- Task 16
select [name]
from Departments 
where building = 1 or building = 3

-- Task 17
select surname
from Doctors
where surname like 'N%'