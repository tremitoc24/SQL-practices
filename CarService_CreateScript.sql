use [master];
go

create database CarServiceDB;
go

/*
	Create database tables.

	Identification is done using an integer that starts at 1 and increments with each subsequent entry.
*/

create table Specializations (
	specialization_id int Primary key identity (1,1),
	name_of_specialization nvarchar(40) not null);

create table Mechanics (
	mechanic_id int Primary key identity (1,1),
	specializatio_id_FK int foreign key references Specializations(specialization_id) not null,
	first_name nvarchar(30) not null,
	last_name nvarchar(30) not null,
	work_experience int Check(work_experience >= 0) not null);	--If work experince is less than 0, then the new mechanic's registration is cancelled.

create table Marks (
	marks_id int Primary key identity (1,1),
	name_of_mark nvarchar(40) not null unique);

create table Colors (
	color_id int Primary key identity (1,1),
	name_of_color nvarchar(40) not null unique);

create table Cars (
	car_id nvarchar(10) Primary key,
	mark_id_FK int Foreign key references Marks(mark_id_FK) not null,
	color_id_FK int Foreign key references Colors(color_id_FK) not null,
	car_year int Check(car_year >= 1950) not null );	--If car year is less than 0 then the new car's registration is cancelled.

create table RepairTypes (
	repair_type_id int Primary key identity(1,1),
	name_of_repair nvarchar(40) not null unique default 'Diagnostics');
 
 create table Orders (
	order_id int Primary key identity(1,1),
	car_id_FK nvarchar(10) Foreign key references Cars(car_id) not null,
	mechanic_id_FK int Foreign key references Mechanics(mechanic_id_FK) not null,
	date datetime not null unique);

create table OrderParts (
	order_part_id int Primary key identity(1,1),
	order_id_FK int Foreign key references Orders(order_id_FK) not null,
	repair_type_id_FK int Foreign key references RepairTypes(repair_type_id_FK) not null,
	price decimal(10,2) not null default 800);