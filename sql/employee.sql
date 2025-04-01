CREATE TABLE Departments (
    DepartmentID INT PRIMARY KEY,
    DepartmentName VARCHAR(50) NOT NULL
);


CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(50) NOT NULL,
    FOREIGN KEY(DepartmentID) REFERENCES Departments(DepartmentID),
    Salary DECIMAL(10,2),
    HireDate DATE
);
