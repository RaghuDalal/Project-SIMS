create database sims
use sims



-- Master Tables



--Department
create table Department
(
id int primary key identity,
Name varchar(50),
isActive bit
)

select * from Department

--Qualification
create table Qualification
(
id int primary key identity,
Name varchar(50),
isActive bit
)
select * from Qualification

--Specialization
create table Specialization
(
id int primary key identity,
Name varchar(50),
isActive bit
)
select * from Specialization



-- Transactional Tables



--Doctor
create table Doctor
(
id int primary key identity,
name varchar(50),
dob date,
gender varchar(7),
photo varchar(max),
address varchar(100),
contactNo bigint,
emergencyNo bigint,
email varchar(100),
dateOfJoining date,
departmentID int references Department(id),
registrationNo varchar(100),
facebookID varchar(100),
instagramID varchar(100),
linkedinID varchar(100),
twitterID varchar(100),
isActive bit
)
select * from Doctor

--Doctor Specialization
create table DoctorSpecialization
(
id int primary key identity,
specializationID int references Specialization(id),
doctorID int references Doctor(id),
isActive bit
)
select * from DoctorSpecialization

--Doctor Qualification
create table DoctorQualification
(
id int primary key identity,
qualificationID int references Qualification(id),
doctorID int references Doctor(id),
isActive bit
)
select * from DoctorQualification

--Doctor Key Achievements
create table doctorAchievements
(
id int primary key identity,
title varchar(100),
thumbnail varchar(max),
photo varchar(max),
doctorID int references Doctor(id)
)
select * from doctorAchievements




--SP Queries



--Department SP
create proc spDepartmentInsert(@Name varchar(50),@isActive bit)
as
if exists(select * from Department where Name=@Name)
	begin
	select 'Department already exists!' as msg
	end
else
	begin
	insert into Department(Name, isActive) values (@Name,@isActive)
		select 'Department created Successfully' as msg
	end

exec spDepartmentInsert 'Cardiology',1
select * from Department


--Qualification SP
create proc spQualificationInsert(@Name varchar(50),@isActive bit)
as
if exists(select * from Qualification where Name=@Name)
	begin
	select 'Qualification already exists!' as msg
	end
else
	begin
	insert into Qualification(Name, isActive) values (@Name,@isActive)
		select 'Qualification created Successfully' as msg
	end

exec spQualificationInsert 'MBBS',1
select * from Qualification


-- Specialization SP
create proc spSpecializationInsert(@Name varchar(50),@isActive bit)
as
if exists(select * from Specialization where Name=@Name)
	begin
	select 'Specialization already exists!' as msg
	end
else
	begin
	insert into Specialization(Name, isActive) values (@Name,@isActive)
		select 'Specialization created Successfully' as msg
	end

exec spSpecializationInsert 'cardiologist',1
select * from Specialization


-- Doctor SP 
create proc spDoctorInsert(@Name varchar(50),@dob date,@gender varchar(7),@photo varchar(max),@address varchar(100),
@contactNo bigint,@emergencyNo bigint,@email varchar(100),@dateofJoining date,@departmentID bigint,@registrationNo varchar(100),
@facebookID varchar(100),@instagramID varchar(100),@linkedinID varchar(100),@twitterID varchar(100),@isActive bit)
as 
if exists (select * from Doctor where photo=@photo and contactNo=@contactNo and emergencyNo=@emergencyNo and email=@email and registrationNo=@registrationNo)
	begin
	select 'Data already exists! Please enter new Data' as msg
	end
else
	begin
	insert into Doctor(name, dob,gender,photo,address,contactNo,emergencyNo,email,dateOfJoining,departmentID,registrationNo,
	facebookID,instagramID,linkedinID,twitterID,isActive) values 
	(@Name,@dob,@gender,@photo,@address,@contactNo,@emergencyNo,@email,@dateofJoining,@departmentID,@registrationNo,
	@facebookID,@instagramID,@linkedinID,@twitterID,@isActive)
	select 'Doctor Profile created Successfully' as msg
	end

exec spDoctorInsert 'Harsh','2000-06-23','Male','www.google.com/img.jpg','Hisar',99999,88888,'harsh@gmail.com','2020-11-20',1,'AX23','fb.com/harsh','insta/harsh','linkedin/harsh','twitter/harsh',1
select * from Doctor