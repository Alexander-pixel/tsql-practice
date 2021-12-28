use MusicalCollection;

-- Exercise 1
-- Task 1
create view VW_Singers as
select f_name, l_name from Singers

-- Task 2
create view VW_Songs as
select title, diskId, duration, styleId, singerId from Songs

-- Task 3
create view VW_MusicalDisks_Name_3 as
select title, publishDate, styleId, publisherId, desciption, f_name, l_name from MusicalDisk
join Singers on MusicalDisk.singerId = Singers.id
where Singers.f_name = 'Name_3'

-- Task 4
create view VW_Max_Disks as
select top(1) Singers.f_name, COUNT(singerId) as [Disks Count] from MusicalDisk
join Singers on MusicalDisk.singerId = Singers.id
group by Singers.f_name
order by COUNT(singerId) desc

-- Task 5
create view VW_Top3_Singers as
select top(3) Singers.f_name, COUNT(singerId) as [Disks Count] from MusicalDisk
join Singers on MusicalDisk.singerId = Singers.id
group by Singers.f_name
order by COUNT(singerId) desc

-- Task 6
create view VW_Longest_MusicalDisk as
select top(1) MusicalDisk.title, sum(duration) as [Sum of songs duration] from MusicalDisk
join Songs on MusicalDisk.id = Songs.diskId
group by MusicalDisk.title
order by sum(duration) desc

-- Exercise 2
-- Task 1
create view VW_Insert_Styles as
select * from Styles

-- Task 2
create view VW_Insert_Songs as
select * from Songs

-- Task 3
create view VW_Update_Publishers as
select * from Publishers

--update VW_Update_Publishers 
--set country = 'Spain' where id = 5

-- Task 4
create view VW_Delete_Singers as
select * from Singers

-- Task 5
create view VW_Update_Name_2 as
select * from Singers
where f_name = 'Name_2'

--update VW_Update_Name_2 
--set l_name = 'New_Surname_2'

-- Exercise 3
