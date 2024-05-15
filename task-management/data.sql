-- Create Department table
CREATE TABLE Department (
    Department_ID INT PRIMARY KEY,
    Dname VARCHAR(255),
    Location VARCHAR(255)
);

-- Create Staff table
CREATE TABLE Staff (
    Staff_ID INT PRIMARY KEY,
    Department_ID INT,
    Name VARCHAR(255),
    Date DATE,
    Email VARCHAR(255),
    Age INT,
    Huis VARCHAR(255),
    Mergejil VARCHAR(255),
    FOREIGN KEY (Department_ID) REFERENCES Department(Department_ID)
);

-- Create Customer table
CREATE TABLE Customer (
    Customer_ID INT PRIMARY KEY,
    Name VARCHAR(255),
    Date DATE,
    Email VARCHAR(255),
    Age INT,
    Huis VARCHAR(255),
    Mergejil VARCHAR(255)
);

-- Create Task table
CREATE TABLE Task (
    Task_ID INT PRIMARY KEY,
    Customer_ID INT,
    Request VARCHAR(255),
    Task_date DATE,
    Description TEXT,
    Staff_ID INT,
    Status VARCHAR(255),
    FOREIGN KEY (Customer_ID) REFERENCES Customer(Customer_ID),
    FOREIGN KEY (Staff_ID) REFERENCES Staff(Staff_ID)
);

-- Create Log table
CREATE TABLE Log (
    Log_ID INT PRIMARY KEY,
    Staff_ID INT,
    Invoice_ID INT,
    Comment TEXT,
    Status VARCHAR(255),
    Date DATE,
    FOREIGN KEY (Staff_ID) REFERENCES Staff(Staff_ID)
);
