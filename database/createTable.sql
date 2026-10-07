CREATE DATABASE FitnessCenter;
GO

USE FitnessCenter;
GO

CREATE TABLE Paidalanushy (
    id INT IDENTITY(1,1) PRIMARY KEY,
    aty NVARCHAR(100) NOT NULL,
    telefon NVARCHAR(20),
    poshta NVARCHAR(100),
    kupiyaSoz NVARCHAR(100) NOT NULL,
    rol NVARCHAR(50) NOT NULL
);
GO

CREATE TABLE Abonement (
    id INT IDENTITY(1,1) PRIMARY KEY,
    turi NVARCHAR(50) NOT NULL,
    bastaluKuni DATE NOT NULL,
    ayaqtaluKuni DATE NOT NULL,
    kuyi NVARCHAR(30),
    paidalanushy_id INT NOT NULL,

    CONSTRAINT FK_Abonement_Paidalanushy
    FOREIGN KEY (paidalanushy_id)
    REFERENCES Paidalanushy(id)
);
GO

CREATE TABLE Trenazher (
    id INT IDENTITY(1,1) PRIMARY KEY,
    atauy NVARCHAR(100) NOT NULL,
    turi NVARCHAR(50),
    kuyi NVARCHAR(30)
);
GO

CREATE TABLE VirtualdyKezek (
    id INT IDENTITY(1,1) PRIMARY KEY,
    uaqyt DATETIME2 NOT NULL,
    kezekNomiri INT,
    kuyi NVARCHAR(30),

    paidalanushy_id INT NOT NULL,
    trenazher_id INT NOT NULL,

    CONSTRAINT FK_Kezek_Paidalanushy
    FOREIGN KEY (paidalanushy_id)
    REFERENCES Paidalanushy(id),

    CONSTRAINT FK_Kezek_Trenazher
    FOREIGN KEY (trenazher_id)
    REFERENCES Trenazher(id)
);
GO

CREATE TABLE AqauOtinimi (
    id INT IDENTITY(1,1) PRIMARY KEY,
    sipattama NVARCHAR(255) NOT NULL,
    qurylganUaqyt DATETIME2 NOT NULL,
    kuyi NVARCHAR(30),

    paidalanushy_id INT NOT NULL,
    trenazher_id INT NOT NULL,

    CONSTRAINT FK_Aqau_Paidalanushy
    FOREIGN KEY (paidalanushy_id)
    REFERENCES Paidalanushy(id),

    CONSTRAINT FK_Aqau_Trenazher
    FOREIGN KEY (trenazher_id)
    REFERENCES Trenazher(id)
);
GO