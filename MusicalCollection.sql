--create database MusicalCollection

use MusicalCollection

--create table Singers
--(
--	id int primary key identity,
--	f_name nvarchar(30) not null,
--	l_name nvarchar(30) not null,

--	constraint CK_Singer_FirstName_Not_Empty check (f_name != N''),
--	constraint CK_Singer_LastName_Not_Empty check (l_name != N'')
--)

--create table Styles
--(
--	id int primary key identity,
--	title nvarchar(30) not null unique,

--	constraint CK_Style_Title_Not_Empty check (title != N'')
--)

--create table Publishers
--(
--	id int primary key identity,
--	title nvarchar(30) not null unique,
--	country nvarchar(40) not null,

--	constraint CK_Publisher_Title_Not_Empty check (title != N''),
--	constraint CK_Publisher_Country_Not_Empty check (country != N''),
--)

--create table MusicalDisk
--(
--	id int primary key identity,
--	title nvarchar(30) not null,
--	singerId int,
--	publishDate date not null,
--	styleId int,
--	publisherId int,

--	constraint CK_Disk_Title_Not_Empty check (title != N''),
--	foreign key (singerId) references Singers(id),
--	foreign key (styleId) references Styles(id),
--	foreign key (publisherId) references Publishers(id),
--)

--create table Songs
--(
--	id int primary key identity,
--	title nvarchar(50) not null,
--	diskId int,
--	singerId int,
--	duration int not null,
--	styleId int,

--	constraint CK_Song_Duration_Value check (duration > 0),
--	constraint CK_Song_Title_Not_Empty check (title != N''),

--	foreign key (diskId) references MusicalDisk(id),
--	foreign key (singerId) references Singers(id),
--	foreign key (styleId) references Styles(id),
--)

select * from Singers

--insert into Singers values
--('Name_1', 'Surname_1'),
--('Name_2', 'Surname_2'),
--('Name_3', 'Surname_3'),
--('Name_4', 'Surname_4')

select * from Styles

--insert into Styles values
--('Style_1'),
--('Style_2'),
--('Style_3'),
--('Style_4')

select * from Publishers

--insert into Publishers values
--('Publisher_1', 'Ukraine'),
--('Publisher_2', 'USA'),
--('Publisher_3', 'UK'),
--('Publisher_4', 'Germany'),
--('Publisher_5', 'Italy')

select * from MusicalDisk

--insert into MusicalDisk values
--('MusicalDisk_1', 4, '2009-06-02', 1, 5),
--('MusicalDisk_2', 3, '2009-10-07', 2, 4),
--('MusicalDisk_3', 2, '2009-03-05', 3, 1),
--('MusicalDisk_4', 1, '2009-09-19', 4, 3),
--('MusicalDisk_5', 3, '2009-11-01', 2, 2)

select * from Songs

--insert into Songs values
--('Song_1', 5, 1, 243, 4),
--('Song_2', 4, 2, 350, 3),
--('Song_3', 3, 3, 258, 2),
--('Song_4', 2, 4, 213, 1),
--('Song_5', 1, 3, 254, 2)

select * from MusicalDisk


-- Exercise 4
-- Task 1
alter table MusicalDisk
add desciption nvarchar(200) not null default 'Great'

select * from Publishers
-- Task 2
alter table Publishers
add [address] nvarchar(70) not null default 'Gibraltar'

select * from Songs
-- Task 3
alter table Songs 
alter column title nvarchar(70) not null

select * from Publishers
-- Task 4
alter table Publishers
drop column [address]

select * from MusicalDisk
select * from Singers
-- Task 5
alter table MusicalDisk
drop constraint FK__MusicalDi__singe__440B1D61;

-- Task 6
alter table MusicalDisk
add foreign key (singerId) references Singers(id)

-- Exercise 5
-- Task 1
create view VW_Styles as
select title from Styles

-- Task 2
create view VW_Publishers as
select title from Publishers

-- Task 3
create view VW_MusicalDisks as
select title, singerId, publishDate, styleId, publisherId from MusicalDisk
