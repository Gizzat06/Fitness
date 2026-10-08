create database FitnessCenter;
go
use FitnessCenter;
go

create table Paidalanushy (
id int identity(1,1) primary key,
aty nvarchar(100) not null,
telefon nvarchar(20),
poshta nvarchar(100),
kupiyaSoz nvarchar(100) not null,
rol nvarchar(50) not null
);
go

create table Abonement (
id int identity(1,1) primary key,
turi nvarchar(50) not null,
bastaluKuni date not null,
ayaqtaluKuni date not null,
kuyi nvarchar(30),
paidalanushy_id int not null,
constraint FK_Abonement_Paidalanushy
foreign key (paidalanushy_id)
references Paidalanushy(id)
);
go

create table Trenazher (
id int identity(1,1) primary key,
atauy nvarchar(100) not null,
turi nvarchar(50),
kuyi nvarchar(30)
);
go

create table VirtualdyKezek (
id int identity(1,1) primary key,
uaqyt datetime2 not null,
kezekNomiri int,
kuyi nvarchar(30),
paidalanushy_id int not null,
trenazher_id int not null,
constraint FK_Kezek_Paidalanushy
foreign key (paidalanushy_id)
references Paidalanushy(id),
constraint FK_Kezek_Trenazher
foreign key (trenazher_id)
references Trenazher(id)
);
go

create table AqauOtinimi (
id int identity(1,1) primary key,
sipattama nvarchar(255) not null,
qurylganUaqyt datetime2 not null,
kuyi nvarchar(30),
paidalanushy_id int not null,
trenazher_id int not null,
constraint FK_Aqau_Paidalanushy
foreign key (paidalanushy_id)
references Paidalanushy(id),
constraint FK_Aqau_Trenazher
foreign key (trenazher_id)
references Trenazher(id)
);
go