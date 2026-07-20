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
    Employee salary greater than company average.
    Students scoring above class average.
    Products costing more than average price.
    Customers with maximum orders.
    Employees working in the Sales department.
    Latest order placed by each customer.
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
    -> A Subquery can return one value, one row, multiple rows or multiple columns.
    -> ORDER BY is generally not used inside a Subquery unless combined with LIMIT/OFFSET or database-specific features.
    -> Multiple levels of nested Subqueries are allowed.
    -> A Subquery can be used with
    SELECT,
    INSERT,
    UPDATE,
    DELETE.
    -> A Subquery can appear in
    SELECT,
    FROM,
    WHERE,
    HAVING clauses.
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

## Database Difference
    PostgreSQL
        Supports all major types of Subqueries.

    Oracle
        Supports all major types of Subqueries.

    MySQL
        Supports all major types of Subqueries.

    Difference
        Syntax is almost identical.
        Performance optimization differs between databases.
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
        SELECT
        FROM
        WHERE
        HAVING
        INSERT
        UPDATE
        DELETE