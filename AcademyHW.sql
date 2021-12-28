use AcademyDB;

--insert into Subjects values
--('Computer Science'),
--('Database Theory'),
--('Mobile Development'),
--('Web Design')

--insert into Teachers values
--('Name_1', 4500, 'Surname_1'),
--('Name_2', 9200, 'Surname_2'),
--('Name_3', 3800, 'Surname_3'),
--('Name_4', 6400, 'Surname_4'),
--('Name_5', 11500, 'Surname_5')

--insert into Lectures (LectureRoom, SubjectId, TeacherId) values
--('Lecture_1', 2, 1),
--('Lecture_2', 1, 2),
--('Lecture_3', 3, 3),
--('Lecture_4', 4, 4),
--('Lecture_5', 2, 5)

--insert into Faculties (Financing, Name) values
--(25000, 'Faculty_1'),
--(10000, 'Faculty_2'),
--(15000, 'Faculty_3'),
--(55000, 'Faculty_4'),
--(20000, 'Faculty_5')

--insert into Departments (Financing, Name, FacultyId) values
--(12000, 'Department_1', 1),
--(10000, 'Department_2', 2),
--(11500, 'Department_3', 3),
--(15700, 'Department_4', 4),
--(29300, 'Department_5', 5)

--insert into Groups (Name, Year, DepartmentId) values 
--('Group_1', 1, 1),
--('Group_2', 2, 2),
--('Group_3', 3, 3),
--('Group_4', 4, 4),
--('Group_5', 5, 5)

--insert into GroupsLectures (GroupId, LectureId) values
--(1, 5),
--(2, 4),
--(3, 3),
--(4, 2),
--(5, 1)

--insert into Curators (Name, Surname) values
--('Name_1', 'Surname_1'),
--('Name_2', 'Surname_2'),
--('Name_3', 'Surname_3'),
--('Name_4', 'Surname_4'),
--('Name_5', 'Surname_5'),
--('Name_6', 'Surname_6')

--insert into GroupsCurators values
--(1, 1),
--(2, 2),
--(3, 3),
--(4, 4),
--(5, 5),
--(6, 2),
--(3, 3),
--(4, 5)

select * from GroupsLectures;
select * from Lectures;
select * from Subjects;
select * from Teachers;
select * from Groups;
select * from Curators;
select * from Departments;
select * from Faculties;
select * from GroupsCurators;
select * from Curators;

-- Task 1
select distinct (Teachers.[Name] + N' ' + Teachers.[Surname]) as [Full Name], 
Groups.[Name] 
from Teachers, Groups

-- Task 2
select Departments.[Name], Departments.Financing from Departments, Faculties
where Departments.FacultyId = Faculties.Id 
and Departments.Financing > Faculties.Financing

-- Task 3
select Curators.Surname, Groups.Name from Curators, Groups, GroupsCurators 
where Curators.Id = GroupsCurators.CuratorId 
and Groups.Id = GroupsCurators.GroupId

-- Task 4
select Teachers.Name, Teachers.Surname from Teachers, Lectures, GroupsLectures, Groups
where Lectures.TeacherId = Teachers.Id 
and GroupsLectures.LectureId = Lectures.Id
and GroupsLectures.GroupId = Groups.Id
and Groups.Name = 'Group_1'

-- Task 5
select Teachers.[Surname], Faculties.Name from Teachers, Faculties, Lectures, GroupsLectures, Groups,
Departments
where Teachers.Id = Lectures.Id 
and GroupsLectures.LectureId = Lectures.Id
and GroupsLectures.GroupId = Groups.Id
and Departments.Id = Groups.DepartmentId
and Departments.FacultyId = Faculties.Id


-- Task 6
select Departments.Name, Groups.Name from Departments, Groups
where Groups.DepartmentId = Departments.Id

-- Task 7
select Subjects.Name from Subjects, Teachers, Lectures
where Lectures.SubjectId = Subjects.Id and Lectures.TeacherId = Teachers.Id

-- Task 8
select Departments.Name from Departments, Subjects, Groups, GroupsLectures, Lectures
where Lectures.SubjectId = Subjects.Id
and GroupsLectures.LectureId = Lectures.Id
and GroupsLectures.GroupId = Groups.Id
and Groups.DepartmentId = Departments.Id
and Subjects.Name = 'Database Theory'

-- Task 9
select * from Groups, Departments
where Groups.DepartmentId = Departments.Id
and Departments.Name = 'Department_1'

-- Task 10
select Groups.Name from Groups, Departments, Faculties
where Groups.DepartmentId = Departments.Id
and Departments.FacultyId = Faculties.Id
and Groups.Year = 5

-- Task 11
select (Teachers.Name + N' ' + Teachers.Surname) as [Full Name],
Subjects.Name, Groups.Name
from Teachers, Lectures, Subjects, GroupsLectures, Groups
where Lectures.TeacherId = Teachers.Id
and Lectures.SubjectId = Subjects.Id
and GroupsLectures.LectureId = Lectures.Id
and Groups.Id = GroupsLectures.GroupId
and Lectures.LectureRoom = 'Lecture_1'