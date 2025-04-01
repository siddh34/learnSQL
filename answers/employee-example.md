# Examples

## SEE ALL Data

```sql
SELECT * FROM Employees;
SELECT * FROM Departments;
```

## Types of JOINS

INNER JOIN

```sql
SELECT Employees.Name, Departments.DepartmentName
FROM Employees
INNER JOIN Departments ON Employees.DepartmentID = Departments.DepartmentID;
```

LEFT JOIN

```sql
SELECT Employees.Name, Departments.DepartmentName
FROM Employees
LEFT JOIN Departments ON Employees.DepartmentID = Departments.DepartmentID;
```

RIGHT JOIN

```sql
SELECT Employees.Name, Departments.DepartmentName
FROM Employees
RIGHT JOIN Departments ON Employees.DepartmentID = Departments.DepartmentID;
```

SQL does not support FULL OUTER JOIN So we use UNION

```sql
SELECT Employees.Name, Departments.DepartmentName
FROM Employees
LEFT JOIN Departments ON Employees.DepartmentID = Departments.DepartmentID

UNION

SELECT Employees.Name, Departments.DepartmentName
FROM Employees
RIGHT JOIN Departments ON Employees.DepartmentID = Departments.DepartmentID;
```

CROSS JOIN

```sql
SELECT Employees.Name, Departments.DepartmentName
FROM Employees
CROSS JOIN Departments;
```

## Aggregations

Count number of employees

```sql
SELECT COUNT(*) AS TotalEmployees FROM Employees;
```

Total Salary

```sql
SELECT SUM(Salary) AS TotalSalary FROM Employees;
```

AVG salary behind a employee

```sql
SELECT AVG(Salary) AS AverageSalary FROM Employees;
```

GET lowest and highest salaries

```sql
SELECT MIN(Salary) AS MinSalary, MAX(Salary) AS MaxSalary FROM Employees;
```

GET AVG salary for every department

```sql
SELECT Departments.DepartmentName, COUNT(Employees.EmployeeID) AS EmployeeCount, AVG(Employees.Salary) AS AvgSalary
FROM Employees
LEFT JOIN Departments ON Employees.DepartmentID = Departments.DepartmentID
GROUP BY Departments.DepartmentName;
```

Get employee Name and their department who are earning more than avg salary

```sql
SELECT Employees.Name, Departments.DepartmentName
FROM Employees
JOIN Departments ON Departments.DepartmentID = Employees.DepartmentID
WHERE Employees.Salary > (SELECT AVG(Salary) FROM Employees);
```