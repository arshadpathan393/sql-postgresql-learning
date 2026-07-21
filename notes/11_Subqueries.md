# Subqueries
## What is a Subquery?
    -> A Subquery is a query written inside another SQL query.
    -> The inner query is called the Subquery.
    -> The outer query is called the Main Query.
    -> The result of the Subquery is used by the Main Query.
    -> A Subquery is also known as an Inner Query or Nested Query.
### Syntax
    SELECT column_name FROM table_name
    WHERE column_name operator
    (SELECT column_name FROM table_name);
### Example
    SELECT ename,sal FROM emp
    WHERE sal >
    (SELECT AVG(sal) FROM emp );
### Explanation
    Step 1 :
    The Subquery executes first.
    SELECT AVG(sal) FROM emp;
    Result - 2073.21
    ↓
    Step 2 :
    The Main Query becomes
    SELECT ename,sal FROM emp
    WHERE sal > 2073.21;
---

## Why do we need Subqueries?
    -> To retrieve data based on another query.
    -> To compare values with calculated results.
    -> To filter records dynamically.
    -> To avoid writing multiple SQL statements.
    -> To solve complex business problems.
    -> To improve query readability in many scenarios.

### Real-Time Examples
    -> Employee salary greater than company average.
    -> Students scoring above class average.
    -> Products costing more than average price.
    -> Customers with maximum orders.
    -> Employees working in the Sales department.
    -> Latest order placed by each customer.
---

## Syntax of Subqueries
### General Syntax
    SELECT column_list FROM table_name
    WHERE column operator
    (SELECT column FROM table_name);

### Subquery inside SELECT
    SELECT ename,(SELECT dname FROM dept WHERE dept.deptno = emp.deptno) AS department FROM emp;

### Subquery inside FROM
    SELECT * FROM (SELECT * FROM emp) AS employee_data;

### Subquery inside HAVING
    SELECT deptno, AVG(sal) FROM emp
    GROUP BY deptno
    HAVING AVG(sal) >
    ( SELECT AVG(sal) FROM emp);
---

## Rules of Subqueries
    -> A Subquery is enclosed within parentheses.
    -> The Subquery executes before the Main Query (except Correlated Subqueries).
    -> The output of the Subquery is used by the Main Query.
    -> ORDER BY is generally not used inside a Subquery unless combined with LIMIT/OFFSET or database-specific features.
    -> Multiple levels of nested Subqueries are allowed.
    -> A Subquery can be used with
        SELECT,INSERT,UPDATE,DELETE.
    -> A Subquery can appear in
        SELECT,FROM,WHERE,HAVING clauses.
---

## Advantages of Subqueries
    -> Makes complex queries easier to write.
    -> Reduces the need for temporary tables.
    -> Allows dynamic filtering.
    -> Improves code readability.
    -> Frequently used in reports and analytics.
    -> Useful when solving interview problems.
---

## Disadvantages of Subqueries
    -> Can become slow on large datasets.
    -> Deeply nested Subqueries are difficult to read.
    -> Correlated Subqueries execute repeatedly, making them slower.
    -> In many cases, JOINs provide better performance.
---

## Classification of Subqueries
    Subqueries
    ├── Single Row Subquery
    ├── Multiple Row Subquery
    ├── Multiple Column Subquery
    ├── Correlated Subquery
    ├── Nested Subquery
    └── Scalar Subquery

### Overview

    | Type              | Returns                               | Common Operators              |
    |-------------------|---------------------------------------|-------------------------------|
    | Single Row        | One value                             | =, >, <, >=, <=, <>           |
    | Multiple Row      | Multiple values                       | IN, NOT IN, ANY, ALL          |
    | Multiple Column   | Multiple columns                      | IN, EXISTS                    |
    | Correlated        | Executes for every outer row          | EXISTS, NOT EXISTS            |
    | Nested            | Subquery inside another Subquery      | Any                           |
    | Scalar            | One value (single column, single row) | Anywhere a value is expected  |
---

## Important Notes
    -> Subqueries execute from the innermost query outward.
    -> Not every problem should be solved using a Subquery.
    -> JOINs are often faster than Correlated Subqueries.
    -> EXISTS is generally preferred over IN for large datasets.
    -> Understanding execution order is essential for interviews.
---

## Interview Point
    Q. What is a Subquery?
    Ans.
        A query written inside another SQL query.

    Q. What is another name for a Subquery?
    Ans.
        Inner Query or Nested Query.

    Q. Which query executes first?
    Ans.
        The Subquery executes first,
        except in Correlated Subqueries.

    Q. Where can a Subquery be used?
    Ans.
        SELECT, FROM, WHERE, HAVING, INSERT, UPDATE, DELETE
---

# Single Row Subquery

## What is a Single Row Subquery?
    -> A Single Row Subquery returns exactly one row.
    -> It returns only one value (single column).
    -> The Main Query compares its value with comparison operators.
    -> It is the most commonly used type of Subquery.

### Syntax
    SELECT column_name FROM table_name
    WHERE column_name operator
    (   SELECT column_name
        FROM table_name
    );
## Comparison Operators Used : 
    =,>,<,>=,<=,<>

## Example 1: Find employees earning more than the average salary.
    SELECT ename,sal FROM emp
    WHERE sal >
    (    SELECT AVG(sal)
        FROM emp
    );
### Explanation
    Step 1 :
        SELECT AVG(sal) FROM emp;
        Result : 2073.21
        ↓
    Step 2: 
        SELECT ename,sal
        FROM emp
        WHERE sal > 2073.21;
## Example 2: Find employees working in the SALES department.
    SELECT * FROM emp
    WHERE deptno =
    (   SELECT deptno FROM dept
        WHERE dname='SALES'
    );
---

## Important Notes
    -> Single Row Subqueries return exactly one row.
    -> If the Subquery returns multiple rows, an error occurs.
    -> Comparison operators are used with Single Row Subqueries.
    -> Aggregate functions like MAX(),MIN(),AVG(),COUNT(),SUM() usually return one row.
    ---

## Common Error
### Incorrect Query
    SELECT * FROM emp
    WHERE sal =
    (   SELECT sal
        FROM emp
        WHERE deptno=30
    );

    ERROR:
    More than one row returned by a subquery used as an expression.
    -> Department 30 has multiple employees.
    -> The Subquery returns multiple salaries.
    -> The '=' operator expects only one value.

### Correct Solution
    SELECT * FROM emp
    WHERE sal IN
    (   SELECT sal
        FROM emp
        WHERE deptno=30
    );
---

## Real-Time Examples
    -> Find employees earning above average salary.
    -> Find the highest-priced product.
    -> Find students scoring highest marks.
    -> Find customers with maximum purchases.
    -> Find employees hired after a specific employee.
---

## Interview Point
    Q. What is a Single Row Subquery?
    Ans.
        A Subquery that returns exactly one row.

    Q. Which operators are used with Single Row Subqueries?
    Ans.
        =, >, <, >=, <=, <>

    Q. Why does the following query fail?
        WHERE sal =
        (
        SELECT sal
        FROM emp
        WHERE deptno=30
        );

    Ans.
        Because the Subquery returns multiple rows.

    Q. Which aggregate functions usually
    return a Single Row?
    Ans.
        COUNT(), SUM(), AVG(), MIN(), MAX()
---

## Best Practices
    -> Ensure the Subquery returns only one row.
    -> Prefer aggregate functions when a single value is expected.
    -> Test the Subquery independently before embedding it.
    -> Format Subqueries with proper indentation for readability.
---

## Common Mistakes
    -> Using '=' when the Subquery returns multiple rows.
    -> Forgetting parentheses around the Subquery.
    -> Assuming a Subquery always returns one row.
    -> Not testing the inner query first.
---

## Performance Tips
    -> Execute the Subquery separately while debugging.
    -> Use indexes on filtering columns when possible.
    -> Prefer JOINs if they produce simpler and faster execution plans.
    -> Avoid unnecessary nested Subqueries.
---

# Multiple Row Subquery

## What is a Multiple Row Subquery?
    -> A Multiple Row Subquery returns more than one row.
    -> Since multiple values are returned, comparison operators (=, >, <, etc.) cannot be used directly.
    -> Multiple Row Subqueries are commonly used with IN, NOT IN, ANY, ALL

### Syntax
    SELECT column_name FROM table_name
    WHERE column_name operator
    (   SELECT column_name
        FROM table_name
    );

## Example 1: Find employees working in the SALES department.
    SELECT ename,deptno FROM emp
    WHERE deptno IN
    (   SELECT deptno
        FROM dept
        WHERE dname='SALES'
    );
### Explanation
    Step 1: 
    The Subquery returns
    30
    ↓
    Step 2
    The Main Query becomes
    WHERE deptno IN (30)
 
## Important Notes
    -> A Multiple Row Subquery returns more than one row.
    -> Use IN, NOT IN, ANY, ALL according to the requirement.
    -> Do not use '=' if the Subquery returns multiple rows.
    -> Execute the Subquery separately while debugging.

## Common Error
### Incorrect Query
    SELECT * FROM emp
    WHERE sal =
    (   SELECT sal
        FROM emp
        WHERE deptno=30
    );
    ERROR:
    More than one row returned by a subquery.
### Correct Query
    SELECT * FROM emp
    WHERE sal IN
    (   SELECT sal
        FROM emp
        WHERE deptno=30
    );

## Interview Point
    Q. What is a Multiple Row Subquery?
    Ans.
        A Subquery that returns more than one row.

    Q. Why can't '=' be used with Multiple Row Subqueries?
    Ans.
        Because '=' expects a single value.

    Q. Which operators are commonly used with Multiple Row Subqueries?
    Ans.
        IN, NOT IN, ANY, ALL

## Best Practices
    -> Test the Subquery separately.
    -> Use the appropriate operator based on the number of rows returned.
    -> Keep Subqueries properly indented for readability.

## Common Mistakes
    -> Using '=' instead of IN.
    -> Assuming the Subquery returns only one row.
    -> Ignoring NULL values while using NOT IN.
    -> Not verifying the Subquery result.

## Performance Tips
    -> Use indexes on filtering columns.
    -> Avoid unnecessary nested Subqueries.
    -> For large datasets, compare execution plans of Subqueries and JOINs.
---