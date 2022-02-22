create schema Tkachenko;

-- Task 1

if exists (select 1 from sys.procedures where name = N'SP_Get_Dates_When_User_Worked_More_Than_2_Hours_By_Id')
drop proc SP_Get_Dates_When_User_Worked_More_Than_2_Hours_By_Id;

go

create proc Tkachenko.SP_Get_Dates_When_User_Worked_More_Than_2_Hours_By_Id(@userId int)
as
begin
	select cast(Start as date) as [Dates], sum(duration) as [Sum] from Services
	where UserId = @userId
	group by cast(Start as date)
	having sum(duration) > 120
end

-- Usage

exec SP_Get_Dates_When_User_Worked_More_Than_2_Hours_By_Id 2

----------------------------------------------------------------------

-- Task 2

if exists (select 1 from sys.objects where type in ('FN', 'IF', 'TF') and name = 'FN_Get_Users_Who_Worked_More_Than_Average_During_Period_Of_Time')
drop function FN_Get_Users_Who_Worked_More_Than_Average_During_Period_Of_Time;

go

create function Tkachenko.FN_Get_Users_Who_Worked_More_Than_Average_During_Period_Of_Time (@startDate date, @endDate date)
returns table
as
	return 
	(
		with userWorkDurationDuringPeriod
		as
		(
			select UserId, cast(Start as date) as [Date], sum(duration) as [Sum] 
			from Services
			where cast(Start as date) >= @startDate and cast(Start as date) <= @endDate
			group by UserId, cast(Start as date)
		)
		select u.Id, u.Login, u.FirstName, [Sum] from Users as u
		join userWorkDurationDuringPeriod as uwddp on uwddp.UserId = u.Id
		where [Sum] > (select avg([Sum]) from userWorkDurationDuringPeriod)
	)

-- Usage 

select * from FN_Get_Users_Who_Worked_More_Than_Average_During_Period_Of_Time ('2022-01-25', '2022-01-26')

----------------------------------------------------------------------

-- Task 3

create view Tkachenko.Groups_Level_View
as
with hierarhy
as
(
	select Id, 1 as [Level]
	from Groups
	where ParentGroupId is null
	union all
	select Groups.Id, [Level] + 1
	from Groups 
	join hierarhy on hierarhy.Id = Groups.ParentGroupId
) 
select Groups.Id, Groups.Name, Groups.ParentGroupId, hierarhy.Level from Groups
join hierarhy on hierarhy.Id = Groups.id

-- Usage

select * from Groups_Level_View

----------------------------------------------------------------------

-- Task 4

if exists (select 1 from sys.objects where type in ('FN', 'IF', 'TF') and name = 'FN_Get_Users_Id_By_Group_Id_And_Its_Connections')
drop function FN_Get_Users_Id_By_Group_Id_And_Its_Connections;

go

create function Tkachenko.FN_Get_Users_Id_By_Group_Id_And_Its_Connections (@groupId int)
returns table
as
	return
	(
		select UserId from UserGroups
		where GroupId = @groupId
		union all
		select UserId from UserGroups
		join Groups on Groups.Id = UserGroups.GroupId
		where ParentGroupId is not null
		and ParentGroupId = @groupId
	)

-- Usage

select * from FN_Get_Users_Id_By_Group_Id_And_Its_Connections (7)