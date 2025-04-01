# PLSQL

Login

```
sqlplus pdbadmin/YourPassword123@//localhost:1521/FREEPDB1
```

Turn on output

```sql
SET SERVEROUTPUT ON;
```

Output

```sql
BEGIN
    DBMS_OUTPUT.PUT_LINE('Hello, World!');
END;
/
```

Variable declaration

```sql
DECLARE
    v_name VARCHAR2(50) := 'Alice';
BEGIN
    DBMS_OUTPUT.PUT_LINE('Employee Name: ' || v_name);
END;
/
```

If else

```sql
DECLARE
    salary NUMBER := 55000;
BEGIN
    IF salary > 50000 THEN
        DBMS_OUTPUT.PUT_LINE('High Salary');
    ELSE
        DBMS_OUTPUT.PUT_LINE('Low Salary');
    END IF;
END;
/
```

While Loop

```sql
DECLARE
    i NUMBER := 1;
BEGIN
    WHILE i <= 5 LOOP
        DBMS_OUTPUT.PUT_LINE('Value: ' || i);
        i := i + 1;
    END LOOP;
END;
/
```

For loop

```sql
BEGIN
    FOR i IN 1..5 LOOP
        DBMS_OUTPUT.PUT_LINE('Iteration: ' || i);
    END LOOP;
END;
/
```

Procedure

```sql
CREATE OR REPLACE PROCEDURE greet_user (p_name IN VARCHAR2) AS
BEGIN
    DBMS_OUTPUT.PUT_LINE('Hello, ' || p_name || '!');
END;
/
```

Function

```sql
CREATE OR REPLACE FUNCTION get_salary (p_empid IN NUMBER) RETURN NUMBER AS
    v_salary NUMBER;
BEGIN
    SELECT Salary INTO v_salary FROM Employees WHERE EmployeeID = p_empid;
    RETURN v_salary;
END;
/
```

Trigger

```sql
CREATE OR REPLACE TRIGGER trg_check_salary
BEFORE INSERT ON Employees
FOR EACH ROW
BEGIN
    IF :NEW.Salary < 30000 THEN
        RAISE_APPLICATION_ERROR(-20001, 'Salary cannot be less than 30,000');
    END IF;
END;
/
```