use MusicalCollection

-- Exercise 2

select * from MusicalDisk

-- Task 1
--create trigger TF_Insert_Disk on MusicalDisk
--instead of insert
--as
--begin 
--	if ((select count(*) from inserted
--	join MusicalDisk as m
--	on m.title = inserted.title
--	where (m.singerId = inserted.singerId 
--	and m.publishDate = inserted.publishDate
--	and m.styleId = inserted.styleId
--	and m.publisherId = inserted.publisherId
--	and m.desciption = inserted.desciption)) = 0)
--		begin
--			insert into MusicalDisk (title, singerId, publishDate, styleId, publisherId, desciption)
--			(select title, singerId, publishDate, styleId, publisherId, desciption from inserted)
--		end
--end

--insert into MusicalDisk values
--('MusicalDisk_1', 4, '2009-06-02', 1, 5, 'Great')

select * from MusicalDisk

-- Task 2
--alter trigger TF_Delete_Disk on MusicalDisk
--instead of delete
--as
--begin 
--	if ((select count(*) from deleted
--		join Singers on Singers.id = deleted.singerId
--		where Singers.f_name != 'Name_1') > 0)
--		begin
--			delete from MusicalDisk	
--			where MusicalDisk.id = (select id from deleted)
--			and MusicalDisk.singerId = (select id from Singers
--											where f_name != 'Name_1')
--		end
--end

--insert into MusicalDisk values
--('MusicalDisk_6', 1, '2020-10-10', 2, 1, 'Great')

--delete from MusicalDisk
--where singerId = 1

select * From Singers
select * from MusicalDisk

--drop trigger TF_Insert_Disk

select * from MusicalDisk

-- Task 4
--create trigger TG_Insert_Disk_Dark_Power_Pop on MusicalDisk
--instead of insert
--as
--begin 
--	if ((select count(*) from inserted
--	join Styles as s
--	on s.id = inserted.styleId
--	where s.title != 'Dark Power Pop') > 0)
--		begin
--			insert into MusicalDisk (title, singerId, publishDate, styleId, publisherId, desciption)
--			(select inserted.title, singerId, publishDate, styleId, publisherId, desciption from inserted
--			join Styles on Styles.id = inserted.styleId
--			where Styles.title != 'Dark Power Pop')
--		end
--end

--insert into MusicalDisk values
--('MusicalDisk_7', 2, '2021-10-10', 7, 2, 'Great')

--insert into Styles values
--('Dark Power Pop')

select * from Styles
select * from MusicalDisk

-- Task 3
--create table Archive_Disks
--(
--	id int primary key identity,
--	title nvarchar(50) not null,
--	singerId int references Singers(id), 
--	styleId int references Styles(id),
--	publishersId int references Publishers(id),
--	[description] nvarchar(50) not null,
--)

--drop trigger TF_Delete_Disk

--create trigger TG_Delete_Disk on MusicalDisk
--after delete
--as
--begin
--	insert into Archive_Disks (title, singerId, styleId, publishersId, [description])
--	(select deleted.title, deleted.singerId, deleted.styleId, deleted.publisherId, deleted.desciption from deleted)
--end

select * from Archive_Disks
select * from MusicalDisk
--delete from MusicalDisk
--where id = 8