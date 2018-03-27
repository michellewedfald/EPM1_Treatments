create database Treatments_DW
go

create table DimPatient
(
PatientID int primary key identity,
PatientName varchar(50) not null,
Gender varchar(6) not null,
)
go

insert into DimPatient(PatientName,Gender) values
('Anne Hansen', 'Kvinde'),
('Bo Hansen', 'Mand');

Go

create table DimTreatment
(
TreatmentID int primary key identity,
TreatmentName varchar(50) not null,
TreatmentCost int,
)
go

insert into DimTreatment(TreatmentName,TreatmentCost) values
('Femur fraktur', 100000),
('Fibula fraktur', 80000);
Go


create table DimHospitals
(
HospitalID int primary key identity,
HospitalName varchar(50) not null,
HospitalLocation varchar(50),
)
go

insert into DimHospitals(HospitalName,HospitalLocation) values
('Skejby University Hospital', 'Region Midtjylland'),
('Aalborg University Hospital', 'Region Midtjylland');
Go

create table DimTreater
(
TreaterID int primary key identity,
Title varchar(50) not null,
TreaterName varchar(50) not null

)
go

insert into DimTreater(Title,TreaterName) values
('Surgent', 'Niels Nielsen'),
('Anestisia doctor', 'Bodil Nielsen');
Go

create table DimDate
(
DateKey int primary key identity,
DateOfTreatment varchar(10),
)
go

insert into DimDate(DateOfTreatment)values
('10-12-2017'),
('12-06-2016');
go

create table DimTime
(
TimeKey int primary key identity,
TimeOfTreatment varchar(10),
)
go

insert into DimTime(TimeOfTreatment)values
('10:07'),
('12:06');
go


create table FactTreatmentPerformance
(
PerformanceID bigint primary key identity,
HospitalID int,
PatientID int,
TreatmentID int,
TreaterID int,
TimeKey int,
DateKey int,
AmountOfTreatments int,
TotalCost float
)
go



alter table FactTreatmentPerformance add constraint 
FK_HospitalID Foreign key (HospitalID)references DimHospitals(HospitalID); 
alter table FactTreatmentPerformance add constraint 
FK_PatientID Foreign key (PatientID)references DimPatient(PatientID); 
alter table FactTreatmentPerformance add constraint 
FK_TreatmentID Foreign key (TreatmentID)references DimTreatment(TreatmentID); 
alter table FactTreatmentPerformance add constraint 
FK_TreaterID Foreign key (TreaterID)references DimTreater(TreaterID); 
alter table FactTreatmentPerformance add constraint 
FK_Timekey Foreign key (TimeKey)references DimTime(TimeKey); 
alter table FactTreatmentPerformance add constraint 
FK_Datekey Foreign key (DateKey)references DimDate(DateKey); 

insert into FactTreatmentPerformance(PatientID,TreatmentID,DateKey,TimeKey,TreaterID,HospitalID)values
(1,1,1,1,1,1),
(2,2,2,2,2,2);
go



