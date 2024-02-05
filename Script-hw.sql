CREATE TABLE Salesperson (
    SalespersonID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50)
);

CREATE TABLE Customer (
    CustomerID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50)
);

CREATE TABLE Car (
    SerialNumber INT PRIMARY KEY,
    CarModel VARCHAR(20),
    CarMake VARCHAR(20),
    CarYear INT
);

CREATE TABLE Invoice (
    InvoiceNumber INT PRIMARY KEY,
    Description VARCHAR(300),
    Amount DECIMAL(10, 2),
    SoldBy INT REFERENCES Salesperson(SalespersonID),
    SoldTo INT REFERENCES Customer(CustomerID),
    CarID INT REFERENCES Car(SerialNumber)
);

CREATE TABLE ServiceTicket (
    TicketNumber INT PRIMARY KEY,
    ServiceType VARCHAR,
    TicketDate DATE,
    CustomerID INT REFERENCES Customer(CustomerID),
    CarID INT REFERENCES Car(SerialNumber)
);

CREATE TABLE ServiceHistory (
    ServiceHistoryID INT PRIMARY KEY,
    Description VARCHAR(300),
    ServiceDate DATE,
    SerialNumber INT REFERENCES Car(SerialNumber),
    MechanicID INT REFERENCES Mechanic(MechanicID)
);

CREATE TABLE Mechanic (
    MechanicID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    CarsServiced VARCHAR
);


INSERT INTO Salesperson VALUES (1, 'John', 'Doe');
INSERT INTO Customer VALUES (1, 'Alice', 'Smith');
INSERT INTO Car VALUES (123456, 'Sedan', 'Toyota', 2022);
INSERT INTO Invoice VALUES (1001, '2022-01-01', 25000.00, 1, 1, 123456);
INSERT INTO ServiceTicket VALUES (5001, '2022-02-01', 'Regular maintenance', 1, 123456);
INSERT INTO ServiceHistory VALUES (7001, 'Oil change', '2022-02-01', 123456, 101);
INSERT INTO Mechanic VALUES (101, 'Bob', 'Johnson');