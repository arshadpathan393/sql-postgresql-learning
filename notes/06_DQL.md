# DQL (Data Query Language)

## What is DQL?
    -> DQL stands for Data Query Language.
    -> DQL commands are used to retrieve data from database tables.
    -> DQL does not modify data or table structure.
    -> DQL is mainly used to display required information from a database.

## DQL Command

1. SELECT
# 1. SELECT Command
    -> SELECT command is used to retrieve data from one or more tables.
    -> It is the most frequently used SQL command.
### Syntax
    SELECT column_name
    FROM table_name;
### Example
    SELECT ename
    FROM emp;
### Output
    ENAME

    SMITH
    ALLEN
    WARD

### Important Notes
    -> SELECT retrieves data only.
    -> It does not modify table data.
    -> Multiple columns can be retrieved.

### Interview Point
Q. Which command is used to retrieve data from a table?
Ans.
    -> SELECT
---

## SELECT *
    -> '*' (Asterisk) is used to retrieve all columns from a table.

### Syntax
    SELECT *
    FROM table_name;
### Example
    SELECT *
    FROM emp;
### Output
EMPNO   ENAME   JOB   MGR   HIREDATE   SAL   COMM   DEPTNO


### Important Notes
    -> Returns all columns from the table.
    -> Mostly used for testing and learning.
    -> Avoid using SELECT * in production applications.

### Interview Point
    Q. What does '*' represent in SELECT statement?
    Ans.
        -> All columns of the table.

---

## SELECT Specific Columns
    -> We can retrieve only the required columns instead of all columns.

### Syntax
    SELECT column1,column2,column3
    FROM table_name;
### Example
    SELECT empno,ename,sal
    FROM emp;
### Output
    EMPNO   ENAME   SAL

    7369    SMITH   800
    7499    ALLEN   1600

### Important Notes
    -> Returns only selected columns.
    -> Improves readability.
    -> Improves query performance.

## WHERE Clause
    -> The WHERE clause is used to filter rows based on a specified condition.
    -> It returns only those records that satisfy the given condition.
    -> Without a WHERE clause, the query returns all rows from the table.

### Syntax
    SELECT column_name
    FROM table_name
    WHERE condition;
### Example
    SELECT *
    FROM emp
    WHERE deptno = 10;

    SELECT ename, sal
    FROM emp
    WHERE sal > 2000;

### Important Notes
    -> The WHERE clause commonly uses comparison operators.
    -> Multiple conditions can be combined using logical operators.
    -> WHERE filters rows before displaying the result.
    -> Character values must be enclosed in single quotes.
    -> Numeric values should not be enclosed in quotes.
    -> Multiple conditions can be combined using AND, OR, and NOT.
    -> WHERE can be used with SELECT, UPDATE, and DELETE statements.

### Interview Point
    Q. Which is better, SELECT * or selecting required columns?
    Ans.
        -> Selecting only required columns.
    Interview Point

    Q. What is the purpose of the WHERE clause?
    Ans.
        -> It filters rows based on a specified condition.

    Q. Which clause is used to filter records in SQL?
    Ans.
        -> WHERE

---

## Alias Column (AS)
    -> Alias is a temporary name given to a column.
    -> It makes the output more meaningful and readable.
### Syntax
    SELECT column_name AS alias_name
    FROM table_name;

### Example
    SELECT ename AS Employee_Name,
        sal AS Salary
    FROM emp;
### Output
    Employee_Name      Salary

    SMITH              800
    ALLEN              1600

### Alias Without AS
    SELECT ename Employee_Name
    FROM emp;

### Important Notes
    -> AS keyword is optional.
    -> Alias exists only during query execution.
    -> Original column name remains unchanged.

### Interview Point
    Q. Does alias permanently rename a column?
    Ans.
        -> No

---

## DISTINCT
    -> DISTINCT removes duplicate values from the result.

### Syntax
    SELECT DISTINCT column_name
    FROM table_name;

### Example
    SELECT DISTINCT job
    FROM emp;
### Output
    CLERK
    MANAGER
    ANALYST
    SALESMAN
    PRESIDENT

### Important Notes
    -> Removes duplicate values.
    -> NULL is treated as one distinct value.
    -> Can be used with one or more columns.

### Interview Point
    Q. What is the purpose of DISTINCT?
    Ans.
        -> To eliminate duplicate values from the result.

---

## DUAL TABLE

    Database	                                Equivalent
    Oracle	                                    DUAL table
    PostgreSQL	                                No DUAL table required
    MySQL	                                    No DUAL table required (supports DUAL for Oracle
                                                compatibility, but it's optional)
### Oracle
    -> Oracle requires the DUAL table when selecting expressions or constants.

### Example
    -> SELECT SYSDATE FROM dual;
    -> SELECT 10 + 20 FROM dual;
    -> SELECT 'ARSHAD' FROM dual;

### PostgreSQL
    -> No DUAL table is needed.

### Example
    -> SELECT CURRENT_DATE;
    -> SELECT 10 + 20;
    -> SELECT 'ARSHAD';
    
### MySQL
    -> DUAL is optional.

### Example
    Both work:
    -> SELECT NOW();
    -> SELECT 10 + 20;

    or
    -> SELECT NOW() FROM dual;
    -> SELECT 10 + 20 FROM dual;
    
#### Interview Question

    Q. Does PostgreSQL have a DUAL table?
    Ans.
        -> No.
        -> PostgreSQL does not require a DUAL table. You can directly execute:
            -> SELECT CURRENT_DATE;
            -> SELECT 'Hello';
            -> SELECT 10 + 20;

## Summary

    SELECT
        Retrieves data from tables.

    SELECT *
        Retrieves all columns.

    SELECT Specific Columns
        Retrieves only required columns.

    Alias (AS)
        Gives temporary names to columns.

    DISTINCT
        Removes duplicate values.



## Performance Tips
### Best Practices
        -> Select only required columns.
        -> Use meaningful aliases.
        -> Keep queries readable.
        -> Format long queries properly.
        -> Avoid unnecessary DISTINCT.
        -> Filter data as early as possible using the WHERE clause.
        -> Use indexed columns in WHERE conditions whenever possible.
        -> Write clear and readable conditions.
        -> Select only the required rows.

### Common Mistakes
        -> Using SELECT * in production.
        -> Returning unnecessary columns.
        -> Ignoring duplicate rows.
        -> Poor alias names.
        -> Writing unreadable queries.
        -> Forgetting the WHERE clause in UPDATE or DELETE statements.
        -> Using double quotes instead of single quotes for string values.
        -> Writing conditions that return unnecessary rows.
        -> Applying functions to indexed columns unnecessarily, which may prevent index usage.