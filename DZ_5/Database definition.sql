--create database BarberShop;
--go
--use BarberShop;

--create table Barber
--(
--	id int primary key identity,
--	f_name nvarchar(50) not null,
--	m_name nvarchar(50) not null,
--	l_name nvarchar(50) not null,
--	sex nchar not null,
--	phone nvarchar(50) not null,
--	email nvarchar(50) not null,
--	birthDate date not null,
--	employmentDate date not null,
--	position nvarchar(50) not null,

--	constraint Barber_First_Name_Not_Empty check (f_name != N''),
--	constraint Barber_Last_Name_Not_Empty check (l_name != N''),
--	constraint Barber_Middle_Name_Not_Empty check (m_name != N''),
--	constraint Barber_Sex_Check check (sex = 'M' or sex = 'F'),
--	constraint Barber_Phone_Not_Empty check (phone != N''),
--	constraint Barber_Email_Not_Empty check (email != N''),
--	constraint Barber_BirthDate_More_Than check (birthDate > '1950-01-01'),
--	constraint Barber_EmploymentDate_More_Than check (employmentDate > '2000-01-01'),
--	constraint Barber_Position_Not_Empty check (position != N''),
--)

--create table [Service]
--(
--	id int primary key identity,
--	title nvarchar(50) not null,
--	price money not null,
--	duration int not null,  

--	constraint Service_Title_Not_Empty check (title != N''),
--	constraint Service_Price_More_Than_0 check (price > 0),
--	constraint Service_Duration_More_Than_0 check (duration > 0),
--)

--create table BarberService
--(
--	id int primary key identity,
--	barberId int not null,
--	serviceId int not null

--	foreign key (barberId) references Barber (id),
--	foreign key (serviceId) references [Service] (id),
--)

--create table BarberFeedback
--(
--	id int primary key identity,
--	barberId int not null,
--	feedback nvarchar(max) not null,
--	rating int not null,
--	clientId int not null,
--	visitId int not null,

--	foreign key (barberId) references Barber (id),
--	foreign key (clientId) references Client (id),
--	foreign key (visitId) references VisitsArchive (id),
--	constraint BarberFeedback_Feedback_Not_Empty check (feedback != N''),
--	constraint BarberFeedback_Rating_Value check (rating between 1 and 5),
--)

--create table Client
--(
--	id int primary key identity,
--	f_name nvarchar(50) not null,
--	m_name nvarchar(50) not null,
--	l_name nvarchar(50) not null,
--	sex nchar not null,
--	phone nvarchar(50) not null,
--	email nvarchar(50) not null,
--	birthDate date not null,

--	constraint Client_First_Name_Not_Empty check (f_name != N''),
--	constraint Client_Last_Name_Not_Empty check (l_name != N''),
--	constraint Client_Middle_Name_Not_Empty check (m_name != N''),
--	constraint Client_Sex_Check check (sex = 'M' or sex = 'F'),
--	constraint Client_Phone_Not_Empty check (phone != N''),
--	constraint Client_Email_Not_Empty check (email != N''),
--	constraint Client_BirthDate_More_Than check (birthDate > '1950-01-01'),
--)

--create table Schedule
--(
--	id int primary key identity,
--	barberId int not null,
--	clientId int not null,
--	[date] date not null, 
--	[description] nvarchar(max) not null,
--	duration int not null,

--	foreign key (barberId) references Barber (id),
--	foreign key (clientId) references Client (id),
--	constraint Schedule_Duration_Value check (duration > 0)
--)

--create procedure SP_Book_Time (@barberId int, @clientId int, @date date, @description nvarchar(max), @duration int)
--as
--begin
--	if ((select count(*) from Schedule 
--			   where barberId = @barberId
--			   and [date] = @date) = 0)
--	begin
--		insert into Schedule values
--		(@barberId, @clientId, @date, @description, @duration);

--		return 1;
--	end

--	return 0;
--end

--create table VisitsArchive
--(
--	id int primary key identity,
--	clientId int not null,
--	barberId int not null,
--	[date] date not null,
--	totalValue money not null,

--	foreign key (barberId) references Barber (id),
--	foreign key (clientId) references Client (id),
--	constraint VisitsArchive_Date_Value check (date >= '2000-01-01'),
--)

--create table VisitsServicesArchive
--(
--	id int primary key identity,
--	visitId int not null, 
--	serviceId int not null,
	
--	foreign key (visitId) references VisitsArchive (id),
--	foreign key (serviceId) references BarberService (id)
--)
