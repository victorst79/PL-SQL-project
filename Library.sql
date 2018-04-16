CREATE DATABASE Library;
USE Library;

CREATE TABLE Books(
	ISBN VARCHAR(20) PRIMARY KEY,
    Location VARCHAR(50),
    Status BOOLEAN,
    Atribute VARCHAR(50),
    Delay FLOAT,
    Lost FLOAT);
    
CREATE TABLE Videos(
	Year INT,
    Title VARCHAR(50),
    Location VARCHAR(50),
    Status BOOLEAN,
    Atribute VARCHAR(50),
    Delay FLOAT,
    Lost FLOAT,
    PRIMARY KEY (Year,Title));
	
    #ID hay que usarlo en una nueva tabla
    
CREATE TABLE Customers(
	ID INT,
    Username VARCHAR(50),
	Name VARCHAR(50),
    Adress VARCHAR(50),
    Phone INT,
    Registered VARCHAR(10),
    Password VARCHAR(50),
    PRIMARY KEY (ID, Username));
    
CREATE TABLE Cards(
	Card INT,
	Fines FLOAT,
	Status BOOLEAN,
    Employee VARCHAR(50),
    Customer VARCHAR(50),
    PRIMARY KEY (Card),
	FOREIGN KEY (Employee) REFERENCES Employee(Username) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (Customer) REFERENCES Customers(Username) ON DELETE CASCADE ON UPDATE CASCADE);
    
CREATE TABLE Branchs(
	Name VARCHAR(50) PRIMARY KEY,
    Adress VARCHAR(50),
    Phone INT,
#	Media
    Employees INT);
    
CREATE TABLE Employees(
	Name VARCHAR(50),
    Adress VARCHAR(50),
    Phone INT,
    Paycheck FLOAT,
    Username VARCHAR(50),
    ID INT,
    Password VARCHAR(50),
    PRIMARY KEY (ID, Username));
    
    
    