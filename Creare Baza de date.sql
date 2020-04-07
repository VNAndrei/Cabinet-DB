CREATE DATABASE	CabinetDB;

USE CabinetDB;


CREATE TABLE Cabinet(
CabinetID INT PRIMARY KEY IDENTITY,
Nume varchar(30),
NumarTelefon varchar(10)
);


CREATE TABLE Medic(
MedicID int PRIMARY KEY IDENTITY,
CabinetID int,
Nume varchar(30),
Prenume varchar(30),
NumarTelefon varchar(10),
FOREIGN KEY (CabinetID) REFERENCES Cabinet(CabinetID)
);


CREATE TABLE Asistent(
AsistentID int PRIMARY KEY IDENTITY,
MedicID int,
Nume varchar(30),
Prenume varchar(30),
NumarTelefon varchar(10),
--FOREIGN KEY (MedicID) REFERENCES Medic(MedicID)
);


CREATE TABLE Medici_Asistenti(
MedicID int,
AsistentID int, 
FOREIGN KEY (MedicID) REFERENCES Medic(MedicID),
FOREIGN KEY (AsistentID) REFERENCES Asistent(AsistentID),
CONSTRAINT Cheie PRIMARY KEY(MedicID, AsistentID)
);


CREATE TABLE Tehnician(
TehnicianID int PRIMARY KEY IDENTITY,
MedicID int,
Nume varchar(30),
Prenume varchar(30),
NumarTelefon varchar(10),
FOREIGN KEY (MedicID) REFERENCES Medic(MedicID)
);


CREATE TABLE Client(
ClientID int PRIMARY KEY IDENTITY,
MedicID int,
Nume varchar(30),
Prenume varchar(30),
NumarTelefon varchar(10),
FOREIGN KEY (MedicID) REFERENCES Medic(MedicID)
);


CREATE TABLE Programare(
ProgramareID int PRIMARY KEY IDENTITY,
ClientID int,
Data varchar(30),
Descriere varchar(100),
FOREIGN KEY (ClientID) REFERENCES Client(ClientID)
);


CREATE TABLE Furnizor(
FurnizorID int PRIMARY KEY IDENTITY,
Nume varchar(30),
Pret int,
Cantitate int,
);


CREATE TABLE Material(
MaterialID int PRIMARY KEY IDENTITY,
CabientID int,
FurnizorID int,
Nume varchar(30),
Pret int,
Cantitate int,
FOREIGN KEY (CabientID) REFERENCES Cabinet(CabinetID),
FOREIGN KEY (FurnizorID) REFERENCES Furnizor(FurnizorID)
);


CREATE TABLE Buget(
BugetID int PRIMARY KEY IDENTITY,
CabinetID int UNIQUE,
Profit int,
Cheltuieli int,
FOREIGN KEY (CabinetID) REFERENCES Cabinet(CabinetID)
);
