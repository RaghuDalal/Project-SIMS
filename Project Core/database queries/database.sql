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

