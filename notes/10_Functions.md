# Functions

## What are Functions?
    -> Functions are predefined programs provided by the database.
    -> They accept one or more values as input and return a result.
    -> Functions are used to perform calculations, manipulate data and
    retrieve meaningful information.

### Example
    -> SELECT UPPER('arshad');
    -> SELECT COUNT(*) FROM emp;
### Important Notes
    -> Functions simplify SQL queries.
    -> They reduce the amount of SQL code.
    -> Functions can be used in SELECT, WHERE, ORDER BY and HAVING clauses.
---

## Types of Functions
1. Multi Row Functions (MRF)
2. Single Row Functions (SRF)
---

# 1. Multi Row Functions (MRF)
    -> Multi Row Functions are also called Aggregate Functions.
    -> They operate on multiple rows and return a single result.
    -> NULL values are ignored except by COUNT(*).
    -> MRF can accept only one argument.
    -> Along with MRF we are not supposed to add any other column in SELECT clause.
    -> We cannot use MRF in WHERE clause.
    -> COUNT() is the only MRF which can accept * as an argument.

## Types of Multi Row Functions
    COUNT()
    SUM()
    AVG()
    MIN()
    MAX()
---

## COUNT() Function
    -> COUNT() returns the total number of rows of the table or number of records in the column.
    -> COUNT() will not count NULL values.
### Syntax
    SELECT COUNT(*) FROM table_name;
### Example
    -> SELECT COUNT(*) FROM emp; ->    14
    -> SELECT COUNT(comm) FROM emp; ->   4 (Counts only non-NULL values.)

### Important Notes
    -> COUNT(*) counts all rows.
    -> COUNT(column_name) ignores NULL values.
    -> COUNT() always returns a numeric value.
### Interview Point
    Q. What is the difference between COUNT(*) and COUNT(column_name)?
    Ans.
        -> COUNT(*) counts all rows.
        -> COUNT(column_name) counts only non-NULL values.
---

## SUM() Function
    -> SUM() returns the total of numeric values i.e., summation of all the values in given column.

### Syntax
    SELECT SUM(column_name) FROM table_name;
### Example
    SELECT SUM(sal) FROM emp;

### Important Notes
    -> Works only with numeric columns.
    -> NULL values are ignored.
### Interview Point
    Q. Can SUM() be used on character columns?
    Ans.
        -> No
--- 

## AVG() Function
    -> AVG() returns the average value of a numeric column.

### Syntax
    SELECT AVG(column_name) FROM table_name;
### Example
    SELECT AVG(sal) FROM emp;

### Important Notes
    -> Works only with numeric columns.
    -> NULL values are ignored.
    -> Average is calculated using non-NULL values.
### Interview Point
    Q. Does AVG() consider NULL values?
    Ans.
        -> No
---

## MIN() Function
    -> MIN() returns the smallest value or smallest character.

### Syntax
    SELECT MIN(column_name) FROM table_name;
### Example
    SELECT MIN(sal) FROM emp;
    SELECT MIN(sal),MIN(ename),MIN(hiredate) FROM emp1;
### Important Notes
    -> Works with numbers, dates and character data.
    -> NULL values are ignored.
### Interview Point
    Q. Which function returns the smallest value?
    Ans.
        -> MIN()
---

## MAX() Function
    -> MAX() returns the largest value.

### Syntax
    SELECT MAX(column_name) FROM table_name;
### Example
    SELECT MAX(sal) FROM emp;
    SELECT MAX(sal), MAX(hiredate), MAX(ename) FROM emp1;

### Important Notes
    -> Works with numbers, dates and character data.
    -> NULL values are ignored.
### Interview Point
    Q. Which function returns the largest value?
    Ans.
        -> MAX()
---

## Real-Time Examples

### Total Employees
    SELECT COUNT(*) FROM emp;
### Total Salary
    SELECT SUM(sal) FROM emp;
### Average Salary
    SELECT AVG(sal) FROM emp;
### Lowest Salary
    SELECT MIN(sal) FROM emp;
### Highest Salary
    SELECT MAX(sal) FROM emp;
---

## Summary
    COUNT() -> Counts rows.
    SUM()   -> Calculates total.
    AVG()   -> Calculates average.
    MIN()   -> Returns smallest value.
    MAX()   -> Returns largest value.
---

## Most Asked Interview Questions
    Q. What are Multi Row Functions?
    Ans.
        -> Functions that operate on multiple rows and return one result.
    Q. Which aggregate function counts all rows?
    Ans.
        -> COUNT(*)
    Q. Which aggregate function ignores NULL values?
    Ans.
        -> SUM(), AVG(), MIN(), MAX() and COUNT(column_name)
    Q. Difference between COUNT(*) and COUNT(column_name)?
    Ans.
        -> COUNT(*) counts all rows.
        -> COUNT(column_name) counts only non-NULL values.
---

## Best Practices
    -> Use COUNT(*) when counting total rows.
    -> Use COUNT(column_name) only when NULL values should be excluded.
    -> Use meaningful aliases for aggregate results.
    -> Verify that aggregate functions are used on appropriate data types.
---
## Common Mistakes
    -> Confusing COUNT(*) with COUNT(column_name).
    -> Expecting AVG() to include NULL values.
    -> Using SUM() on non-numeric columns.
    -> Assuming MIN() and MAX() work only with numbers.
---
## Performance Tips
    -> Use COUNT(*) instead of retrieving all rows when only the row count
    is required.
    -> Avoid unnecessary aggregate calculations on large datasets.
    -> Create indexes on frequently aggregated columns when appropriate.
    -> Use aggregate functions only on required columns.

-------------------------------------------------------------------------------------------------------
