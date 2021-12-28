--insert into Departments values 
--(1, 'Department_1'),
--(2, 'Department_2'),
--(3, 'Department_3'),
--(4, 'Department_4'),
--(5, 'Department_5'),
--(3, 'Department_6')

--insert into Wards values
--('Name_1', 2, 4),
--('Name_2', 1, 1),
--('Name_3', 4, 2),
--('Name_4', 3, 3),
--('Name_5', 8, 4),
--('Name_6', 6, 5),
--('Name_7', 4, 6)

--insert into Doctors values
--('Name_1', 2000, 6900, 'Surname_1'),
--('Name_2', 1200, 5330, 'Surname_2'),
--('Name_3', 3500, 2900, 'Surname_3'),
--('Name_4', 560, 1880, 'Surname_4'),
--('Name_5', 385, 5645, 'Surname_5'),
--('Name_6', 980, 12090, 'Surname_6')

--insert into Examinations values
--('Examination_1'),
--('Examination_2'),
--('Examination_3'),
--('Examination_4'),
--('Examination_5'),
--('Examination_6')

--insert into DoctorsExaminations (StartTime, EndTime, DoctorId, ExaminationId, WardId) values
--('10:00', '11:00', 1, 5, 7),
--('11:00', '12:00', 2, 3, 6),
--('12:00', '13:00', 3, 4, 5),
--('13:00', '14:00', 4, 1, 4),
--('14:00', '15:00', 5, 2, 3),
--('15:00', '16:00', 6, 3, 2),
--('16:00', '17:00', 2, 4, 1),
--('17:00', '18:00', 3, 5, 5),
--('18:00', '19:00', 5, 6, 2)

--insert into Departments values
--(1, 'Department_7'),
--(1, 'Department_8'),
--(1, 'Department_9'),
--(1, 'Department_10')

--insert into Wards values
--('Ward_8', 15, 5),
--('Ward_9', 25, 1),
--('Ward_10', 40, 2),
--('Ward_11', 90, 1),
--('Ward_12', 10, 3),
--('Ward_13', 12, 5),
--('Ward_14', 35, 3)

select * from Departments;
select * from Wards;
select * from Doctors;
select * from DoctorsExaminations;
select * from Examinations;

-- Task 1
select count(*) from Wards
where Places > 10;

-- Task 2
select Departments.Name, count(*) as [Wards Count] from Departments, Wards
where Departments.Id = Wards.DepartmentId
group by Departments.Name

-- Task 3
select Departments.Building, COUNT(*) as [Wards Count] from Departments, Wards
where Wards.DepartmentId = Departments.Id
group by Departments.Building

-- Task 4
select Departments.Name, sum(Doctors.Premium) 
from Departments, Doctors, DoctorsExaminations, Wards
where Wards.DepartmentId = Departments.Id 
and DoctorsExaminations.WardId = Wards.Id
and Doctors.Id = DoctorsExaminations.DoctorId
group by Departments.Name

-- Task 5
select Departments.Name, Count(Doctors.Name) as [Doctors Count]
from Departments, Wards, DoctorsExaminations, Doctors
where Wards.DepartmentId = Departments.Id 
and DoctorsExaminations.WardId = Wards.Id
and Doctors.Id = DoctorsExaminations.DoctorId
group by Departments.Name
having Count(Doctors.Name) >= 3

-- Task 6
select Count(Doctors.Name) as [Doctors Count], Sum(Doctors.Premium + Doctors.Salary) as [Sum of Salary] 
from Doctors

-- Task 7
select AVG(Salary + Premium) from Doctors

-- Task 8
select Wards.Name from Wards
where Places = (Select min(places) from Wards)

-- Task 9
select Departments.Name from Wards, Departments
where Wards.DepartmentId = Departments.Id
and (Departments.Building = 1 or Departments.Building between 6 and 8) 
and Wards.Places > 10 
group by Departments.Name
having SUM(Wards.Places) > 100

select * from Wards, Departments
where Wards.DepartmentId = Departments.Id
