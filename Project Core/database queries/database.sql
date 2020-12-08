create database dbSims;
use dbSims



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




--OPD & Patient Tables





--Staff Table
create table Staff
(
id int primary key identity,
name varchar(50),
dob date,
gender varchar(7),
address varchar(100),
city varchar(100),
contactNo bigint,
alternateNo bigint,
email varchar(100),
dateOfJoining date,
staffID varchar(100),
password varchar(100),
isActive bit
)
select * from Staff
 

--Disease Table
create table Disease
(
id int primary key identity,
Name varchar(50),
isActive bit
)
select * from Disease


--Patient Table
create table Patient
(
id int primary key identity,
uhid varchar(50),
Name varchar(50),
dob date,
gender varchar(7),
address varchar(100),
city varchar(100),
mobileNo bigint,
alternteMobileNo bigint,
remarks varchar(max),
email varchar(100),
password varchar(100),
careTakerMobileNo bigint,
careTakerName varchar(100),
firstOPDdate date,
isActive bit
)
select * from Patient


--Patient Disease Table
create table PatientDisease
(
id int primary key identity,
diseaseID int references Disease(id),
patientID int references Patient(id),
isActive bit
)
select * from PatientDisease


--OPD Plans Table
create table OpdPlans
(
id int primary key identity,
Name varchar(50),
isActive bit
)
select * from OpdPlans


--TimeSlot Table
create table TimeSlot
(
id int primary key identity,
name varchar(50),
startTime time,
endTime time,
isActive bit
)
select * from TimeSlot


--OPD Table
create table OPD
(
id int primary key identity,
opdNo int,
date date,
patientID int references Patient(id),
opdPlanID int references OpdPlans(id),
staffID int references Staff(id),
timeSlotID int references TimeSlot(id),
doctorID int references Doctor(id),
patientDiseaseID int references PatientDisease(id),
opdDate date,
isActive bit
)
select * from OPD


--Coupons Table
create table Coupons
(
id int primary key identity,
coupenCode varchar(50),
mobileNo bigint,
doctorID int references Doctor(id),
status bit
)
select * from Coupons


--OPD Payment
create table OpdPayment
(
id int primary key identity,
amount bigint,
paymentMode varchar(50),
staffID int references Staff(id),
opdID int references OPD(id),
couponID int references Coupons(id),
discountAmount bigint,
paymentAmount bigint,
paymentDate date
)
select * from OpdPayment


--SP Queries


--Staff SP

CREATE PROCEDURE spStaffInsert(@name varchar(100),@dob date,@gender varchar(7),@address varchar(100),@city varchar(100),@contactno bigint,@alternateno bigint,@email varchar(100),@dateofjoining date,@staffid varchar(100),@password varchar(100),@isactive bit)
as
if exists ( select *from Staff where  contactNo=@contactno and alternateNo=@alternateno and email=@email and staffID=@staffid)
	begin
	select 'Data already exists!' as msg
	end
else
	begin
	insert into Staff(name,dob,gender,address,city,contactNo,alternateNo,email,dateOfJoining,staffID,password,
	isActive)
	values(@name,@dob,@gender,@address,@city,@contactno,@alternateno,@email,@dateofjoining,@staffid ,@password,@isactive)
	select 'Staff Profile has been created successfully!' as msg
	end

exec spStaffInsert 'Harsh','2000-06-23','Male','Kaimari Road ','Hisar',99999,88888,'harsh@gmail.com','2020-11-20',1,'pass123',1


--Disease SP

create proc spDiseaseInsert(@name varchar(50),@isactive bit)
as 
insert into Disease(Name,isActive) values(@name,@isactive)
select 'Data Inserted Successfully' as msg

exec spDiseaseInsert 'Ravi',1;


--Patient SP

create proc spPatientInsert(@uhid varchar(50),@name varchar(50),@dob date,@gender varchar(7),@address varchar(100),@city varchar(100),@contactno bigint,@alternateno bigint,@remarks varchar(max),@email varchar(100),@password varchar(100),@caretakermobileno bigint,@caretakername varchar(100),@firstOPDdate date,@isactive bit)
as
if exists (select * from Patient where mobileNo=@contactno and alternteMobileNo=@alternateno and email=@email and uhid=@uhid)
	begin
	select 'Data already exists!' as msg
	end
else
	begin
	insert into Patient(uhid,name,dob,gender,address,city,mobileNo,alternteMobileNo,remarks,email,password,caretakermobileno,caretakername,firstOPDdate,isactive) values(@uhid,@name,@dob,@gender,@address,@city,@contactno ,@alternateno,@remarks,@email,@password,@caretakermobileno,@caretakername,@firstOPDdate,@isactive)
	select 'Patient Profile has been created successfully!' as msg
	end
	
exec spPatientInsert 1,'Harsh','2010-06-03','male','Bank Road ','Fatehabad',45645,88453888,'remarks','harsh@gmail.com','pas468723',14645,'rv','2010-06-03',1
select * from Patient


--Patient  Disease SP

/*

create proc spDiseaseInsert(@diseaseid int,@patientid int,@isactive bit)
as
insert into PatientDisease(diseaseID,patientID,isActive)
values(@diseaseid,@patientid,@isactive)
select 'Disease Inserted Successfully!' as msg

exec spDiseaseInsert

select * from PatientDisease

*/


--OPD Plans SP

create proc spOpdplanInsert(@name varchar(50),@isactive bit)
as 
insert into OpdPlans(Name,isActive) values(@name,@isactive)
select 'Data Inserted Successfully' as msg

exec spOpdplanInsert 'Ravi',1;

select * from Opdplans;