--insert into Departments values
--(1, 25000, 'Department_1'),
--(2, 25000, 'Department_2'),
--(3, 25000, 'Department_3'),
--(4, 25000, 'Department_4'),
--(5, 25000, 'Department_5'),
--(3, 25000, 'Department_6'),
--(2, 25000, 'Department_7'),
--(1, 25000, 'Department_8'),
--(5, 25000, 'Department_9'),
--(4, 25000, 'Department_10')

--insert into Wards values 
--('Ward_1', 20, 8),
--('Ward_2', 20, 7),
--('Ward_3', 20, 6),
--('Ward_4', 20, 5),
--('Ward_5', 20, 4),
--('Ward_6', 20, 3),
--('Ward_7', 20, 2),
--('Ward_8', 20, 1)

--insert into Diseases values
--('Disease_1'),
--('Disease_2'),
--('Disease_3'),
--('Disease_4'),
--('Disease_6'),
--('Disease_7'),
--('Disease_8')

--insert into Examinations values
--('Examination_1'),
--('Examination_2'),
--('Examination_3'),
--('Examination_4'),
--('Examination_5'),
--('Examination_6'),
--('Examination_7')

--insert into Doctors values
--('Name_1', 24000, 'Surname_1'),
--('Name_2', 14000, 'Surname_2'),
--('Name_3', 12000, 'Surname_3'),
--('Name_4', 15000, 'Surname_4'),
--('Name_5', 16000, 'Surname_5'),
--('Name_6', 19000, 'Surname_6')

--insert into Interns values
--(2),
--(5)

--insert into Professors values 
--(1),
--(3)

--insert into DoctorsExaminations values
--('2021-10-21', 1, 6, 7, 1),
--('2021-05-19', 2, 4, 6, 2),
--('2021-03-25', 3, 5, 5, 3),
--('2021-09-06', 4, 4, 4, 4),
--('2021-06-12', 5, 3, 3, 5),
--('2021-10-15', 6, 2, 2, 6),
--('2021-01-10', 7, 1, 1, 7)

--insert into DoctorsExaminations values
--('2021-11-17', 2, 4, 4, 1)

--insert into Diseases values
--('Disease_9'),
--('Disease_10')

--insert into Doctors values
--('Name_7', 2500, 'Surname_7'),
--('Name_8', 7000, 'Surname_8'),
--('Name_9', 19500, 'Surname_9')

--insert into Interns values
--(7),
--(8),
--(9)

--update Wards
--set places = 15 where id = 1
--update Wards
--set places = 30 where id = 2
--update Wards
--set places = 50 where id = 3
--update Wards
--set places = 15 where id = 4
--update Wards
--set places = 90 where id = 5
--update Wards
--set places = 15 where id = 6
--update Wards
--set places = 60 where id = 7

select * from Doctors

-- Task 1 ok
select Wards.Name, Wards.Places
from Wards 
join Departments on DepartmentId = Departments.Id
where Building = 5 and Places >= 5
and (select count(Places)
	from Wards join Departments 
	on DepartmentId = Departments.Id
	where Building = 5 and Places > 15) > 0

-- Task 2 - ok
select Departments.Name from Departments
join Wards on Departments.Id = Wards.DepartmentId
join DoctorsExaminations on Wards.Id = DoctorsExaminations.WardId
where Datediff(day, DoctorsExaminations.Date, Getdate()) <= 7

-- Task 3 doesn't work correctly
select distinct Diseases.[Name] from Diseases
left outer join DoctorsExaminations on Diseases.Id = DoctorsExaminations.Id

-- Task 6 ok
select Surname from Doctors
join Interns on Interns.DoctorId = Doctors.Id

-- Task 7 ok
select Surname from Doctors
join Interns on Interns.DoctorId = Doctors.Id
where Doctors.Salary > (select min(Salary) from Doctors)

-- Task 8 ok
select Wards.[Name] from Wards
where Wards.Places > (select MAX(Wards.Places) from Wards 
	join Departments on Wards.DepartmentId = Departments.Id
	where Building = 3)

-- Task 9 ok
select Surname from Doctors
join DoctorsExaminations on DoctorsExaminations.DoctorId = Doctors.Id
join Wards on DoctorsExaminations.WardId = Wards.Id
join Departments on Departments.Id = Wards.DepartmentId
where Departments.Name = 'Department_2'

-- Task 10 doesn't work correctly
select Departments.[Name] from Departments
join Wards on Wards.DepartmentId = Departments.Id
join DoctorsExaminations on DoctorsExaminations.WardId = Wards.Id
join Doctors on DoctorsExaminations.DoctorId = Doctors.Id

-- Task 11 ok
select Doctors.[Name] + N' ' + Surname as [Full Name], Departments.Name from Doctors
join DoctorsExaminations on DoctorsExaminations.DoctorId = Doctors.Id
join Wards on Wards.Id = DoctorsExaminations.WardId 
join Departments on Departments.Id = Wards.DepartmentId
where Financing > 20000

-- Task 12 ok
select Departments.Name from Departments
join Wards on Wards.DepartmentId = Departments.Id
join DoctorsExaminations on DoctorsExaminations.WardId = Wards.Id
join Doctors on DoctorsExaminations.DoctorId = Doctors.Id
where Doctors.Salary = (select max(Salary) from Doctors)

-- Task 13 ok
select Diseases.[Name], count(DoctorsExaminations.Id) from Diseases
join DoctorsExaminations on DoctorsExaminations.DiseaseId = Diseases.Id
group by Diseases.[Name]