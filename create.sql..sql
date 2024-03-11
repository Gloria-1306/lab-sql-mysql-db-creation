-- Drop tables if they exist
DROP TABLE IF EXISTS Invoices;
DROP TABLE IF EXISTS Cars;
DROP TABLE IF EXISTS Customers;
DROP TABLE IF EXISTS Salespersons;

-- Create the database if it does not exist
CREATE DATABASE IF NOT EXISTS lab_mysql;

-- Use the database
USE lab_mysql;

-- Create the Cars table
CREATE TABLE Cars (
    VIN VARCHAR(17) PRIMARY KEY,
    Manufacturer VARCHAR(255) NOT NULL,
    Model VARCHAR(255) NOT NULL,
    Year INT NOT NULL,
    Color VARCHAR(50) NOT NULL
);

-- Create the Customers table
CREATE TABLE Customers (
    CustomerID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(255) NOT NULL,
    Phone VARCHAR(20),
    Email VARCHAR(255),
    Address VARCHAR(255),
    City VARCHAR(100),
    StateProvince VARCHAR(100),
    Country VARCHAR(100),
    ZipPostalCode VARCHAR(20)
);

-- Create the Salespersons table
CREATE TABLE Salespersons (
    StaffID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(255) NOT NULL,
    Store VARCHAR(255) NOT NULL
);

-- Create the Invoices table
CREATE TABLE Invoices (
    InvoiceNumber INT AUTO_INCREMENT PRIMARY KEY,
    Date DATE NOT NULL,
    Car_VIN VARCHAR(17),
    Customer_CustomerID INT,
    Salesperson_StaffID INT,
    FOREIGN KEY (Car_VIN) REFERENCES Cars(VIN),
    FOREIGN KEY (Customer_CustomerID) REFERENCES Customers(CustomerID),
    FOREIGN KEY (Salesperson_StaffID) REFERENCES Salespersons(StaffID)
);

