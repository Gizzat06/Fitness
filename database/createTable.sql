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
    foreign key (paidalanushy_id)
    references Paidalanushy(id),
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
    foreign key (paidalanushy_id)
    references Paidalanushy(id),
    foreign key (trenazher_id)
    references Trenazher(id)
    );

    create table Tolem (
    id int identity(1,1) primary key,
    somasy decimal(10,2) not null,
    tolemKuni datetime2 not null,
    adis nvarchar(30),
    kuyi nvarchar(30),
    abonement_id int not null,
    foreign key (abonement_id)
    references Abonement(id)
    );

    create table JattyguSabagy (
    id int identity(1,1) primary key,
    atauy nvarchar(100) not null,
    bastaluUaqyty datetime2 not null,
    uzaqtygy int not null,
    orynSany int not null,
    jattyqtyrushy_id int not null,
    foreign key (jattyqtyrushy_id)
    references Paidalanushy(id)
    );

    create table SabakkaJazylu (
    id int identity(1,1) primary key,
    jazyluKuni datetime2 not null,
    kuyi nvarchar(30),
    paidalanushy_id int not null,
    sabak_id int not null,
    foreign key (paidalanushy_id)
    references Paidalanushy(id),
    foreign key (sabak_id)
    references JattyguSabagy(id)
    );