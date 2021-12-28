use MusicalCollection

--insert into Songs values
--('Song_7', 3, 3, 250, 2),
--('Song_8', 3, 1, 267, 2),
--('Song_9', 3, 4, 234, 4)

--insert into Songs values
--('Song_10', 1, 2, 250, 2)

-- Task 6

-- Task 1
--create proc sp_get_info_music_disk as
--begin
--	select * from MusicalDisk
--end

exec sp_get_info_music_disk

-- Task 2
--create proc sp_get_music_disks_by_publisher @publisher nvarchar(50)
--as
--begin
--	select MusicalDisk.id, MusicalDisk.title, MusicalDisk.singerId, 
--	MusicalDisk.publishDate, MusicalDisk.styleId, MusicalDisk.publisherId, 
--	MusicalDisk.desciption from MusicalDisk
--	join Publishers on MusicalDisk.publisherId = Publishers.id
--	where Publishers.title = @publisher
--end

exec sp_get_music_disks_by_publisher N'Publisher_4'

-- Task 3-4
--create proc sp_get_most_popular_style 
--as
--begin
--	select top(1) count(styleId) from MusicalDisk
--	group by styleId
--	order by count(styleId) desc
--end

exec sp_get_most_popular_style

-- Task 5
--create proc sp_get_music_disks_by_style @param nvarchar(10)
--as
--begin
--	if (@param = 'all')
--		begin
--			select m.id, m.title, m.singerId, m.publishDate, m.styleId, m.publisherId, m.desciption, count(Songs.id)
--			from MusicalDisk as m
--			join Songs on Songs.diskId = m.id
--			group by m.id, m.title, m.singerId, m.publishDate, m.styleId, m.publisherId, m.desciption
--			order by count(Songs.id) desc
--		end
--	else
--		begin
--			select m.id, m.title, m.singerId, m.publishDate, m.styleId, m.publisherId, m.desciption, count(Songs.id)
--			from MusicalDisk as m
--			join Songs on Songs.diskId = m.id
--			join Styles on Styles.id = m.styleId
--			where Styles.title = @param
--			group by m.id, m.title, m.singerId, m.publishDate, m.styleId, m.publisherId, m.desciption
--			order by count(Songs.id) desc
--		end
--end

exec sp_get_music_disks_by_style N'Style_2'

-- Task 6 
--alter proc sp_delete_disk_by_style @style nvarchar(10), @res int out
--as
--begin
--	declare @before_delete int = (select count(*) from MusicalDisk)

--	delete from MusicalDisk
--	where MusicalDisk.styleId in (select Styles.id from Styles
--	where Styles.title = @style)

--	declare @after_delete int = (select count(*) from MusicalDisk)

--	set @res = @before_delete - @after_delete
--end

declare @res int
exec sp_delete_disk_by_style N'Style_2', @res out
print(@res)

--alter table Songs
--add foreign key(diskId) references MusicalDisk(id) on delete cascade

--insert into MusicalDisk values
--('MusicalDisk_1', 4, '2009-06-02', 1, 5, 'Great'),
--('MusicalDisk_2', 3, '2021-10-07', 2, 4, 'Great'),
--('MusicalDisk_3', 2, '2015-03-05', 3, 1, 'Great'),
--('MusicalDisk_4', 1, '2019-09-19', 4, 3, 'Great'),
--('MusicalDisk_5', 3, '2012-11-01', 2, 2, 'Great')

-- Task 7
--create proc sp_get_newest_oldest_musical_disks 
--as
--begin
--	select * from MusicalDisk
--	where publishDate = (select max(publishDate) from MusicalDisk)

--	select * from MusicalDisk
--	where publishDate = (select min(publishDate) from MusicalDisk)
--end

exec sp_get_newest_oldest_musical_disks

-- Task 8
--create proc sp_delete_music_disks_by_word @word nvarchar(50), @res int out
--as
--begin
--	declare @before_delete int = (select count(*) from MusicalDisk)
	
--	delete from MusicalDisk
--	where title like ('%' + @word + '%')

--	declare @after_delete int = (select count(*) from MusicalDisk)
--	set @res = @before_delete - @after_delete
--end

declare @res int
exec sp_delete_music_disks_by_word '_4', @res out
print(@res)