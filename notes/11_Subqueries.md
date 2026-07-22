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
---

# Correlated Subquery
## What is a Correlated Subquery?
    -> A Correlated Subquery is a Subquery that depends on the Outer Query.
    -> The Inner Query cannot execute independently.
    -> It executes once for every row processed by the Outer Query.
    -> It is also called a Repeating Subquery.

### Syntax
    SELECT column_name FROM table1 t1
    WHERE condition
    (   SELECT column_name
        FROM table2 t2
        WHERE t1.column_name = t2.column_name
    );

## How does it work?
        Outer Query
        ↓
        Processes first row
        ↓
        Executes Subquery
        ↓
        Returns result
        ↓
        Processes second row
        ↓
        Executes Subquery again
        ↓
        Repeats until all rows are processed.

## Example 1: Find employees earning more than the average salary of their department.
        SELECT e1.ename,e1.sal,e1.deptno FROM emp e1
        WHERE sal >
        (   SELECT AVG(e2.sal)
            FROM emp e2
            WHERE e1.deptno = e2.deptno
        );
### Explanation
        For every employee,
        ↓
        Calculate the average salary of that employee's department.
        ↓
        Compare employee salary with that department average.
---

# EXISTS
## Definition
    -> EXISTS checks whether the Subquery returns at least one row.
    -> It returns
    TRUE: if rows exist, otherwise FALSE.
    -> Refer Operators chapter for EXISTS operator details.

### Example: Find departments having employees.
    SELECT * FROM dept d
    WHERE EXISTS
    (   SELECT 1
        FROM emp e
        WHERE d.deptno = e.deptno
    );
### Explanation
    If at least one employee belongs to a department,
    ↓
    That department is returned.
---

# NOT EXISTS
## Definition
    -> NOT EXISTS returns rows when the Subquery returns no rows.
### Example: Find departments having no employees.
    SELECT * FROM dept d
    WHERE NOT EXISTS
    (   SELECT 1
        FROM emp e
        WHERE d.deptno = e.deptno
    );

## Difference

    | Correlated Subquery           | Normal Subquery       |
    |-------------------------------|-----------------------|
    | Depends on Outer Query        | Independent           |
    | Executes once for every row   | Executes only once    |
    | Usually slower                | Usually faster        |

## Real-Time Examples
    -> Find highest-paid employee from every department.
    -> Find lowest-paid employee from every department.
    -> Find latest order of every customer.
    -> Find first login of every user.
    -> Find products priced above category average.

## Interview Point
    Q. What is a Correlated Subquery?
    Ans.
        A Subquery that depends on the Outer Query.

    Q. Why is a Correlated Subquery slower?
    Ans.
        Because it executes once for every row.

    Q. Difference between Correlated and Normal Subquery?
    Ans.
        Normal Subquery executes once.Correlated Subquery executes once for every row.

    Q. When should EXISTS be used?
    Ans.
        When checking whether matching rows exist.
---

# Scalar Subquery

## What is a Scalar Subquery?
    -> A Scalar Subquery returns exactly One Row and One Column.
    -> Since it returns a single value, it can be used wherever a value or expression is allowed.

### Syntax
    SELECT column_name,
    (   SELECT column_name
        FROM table_name
    )
    FROM table_name;
## Example 1: Display employee name along with the company average salary.
    SELECT ename,sal,
    (   SELECT AVG(sal)
        FROM emp
    ) AS avg_salary
    FROM emp;
### Explanation
    The Subquery executes once and returns a single value.
    ↓
    That value is displayed for every row.
## Example 2: Display employee name along with total number of employees.
    SELECT ename,
    (   SELECT COUNT(*)
        FROM emp
    ) AS total_employees
    FROM emp;
---

# Multiple Column Subquery
## What is a Multiple Column Subquery?
    -> A Multiple Column Subquery returns Multiple Columns from one or more rows.
    -> The Main Query compares multiple columns together.

### Syntax
    SELECT * FROM table_name
    WHERE
    (   column1,
        column2
    ) IN
    (   SELECT column1,
            column2
        FROM table_name
    );

## Example: Find employees whose salary and department are the highest in their department.
    SELECT * FROM emp
    WHERE
    (   deptno,
        sal
    )IN
    (   SELECT deptno,
            MAX(sal)
        FROM emp
        GROUP BY deptno
    );
### Explanation
    The Subquery returns Dept No
    +
    Maximum Salary
    ↓
    The Main Query compares both columns together.
---

# Nested Subquery
## What is a Nested Subquery?
    -> A Nested Subquery is a Subquery inside another Subquery.
    -> SQL executes from the innermost query outward.

### Syntax
    SELECT * FROM table_name 
    WHERE column_name IN
    (   SELECT column_name FROM table_name
        WHERE column_name
        IN
        (   SELECT column_name
            FROM table_name
        )
    );
## Example: Find employees working in the SALES department.
    SELECT ename FROM emp
    WHERE deptno IN
    (   SELECT deptno
        FROM dept
        WHERE loc IN
        (   SELECT loc
            FROM dept
            WHERE dname='SALES'
        )
    );
## Execution Order
    Innermost Query
    ↓
    Middle Query
    ↓
    Outer Query

## Interview Point
    Q. What is a Scalar Subquery?
    Ans.
        A Subquery that returns one row and one column.

    Q. Where is a Scalar Subquery commonly used?
    Ans.
        SELECT, WHERE, HAVING

    Q. What is a Multiple Column Subquery?
    Ans.
        A Subquery returning multiple columns.

    Q. What is a Nested Subquery?
    Ans.
        A Subquery inside another Subquery.

    Q. In which order are Nested Subqueries executed?
    Ans.
        From the innermost query to the outermost query.
---

# Using Subqueries in Different Clauses
## Subquery in WHERE Clause
    -> The WHERE clause is the most common place to use a Subquery.
    -> It filters rows based on the result returned by the Subquery.
### Example
    SELECT ename,sal FROM emp
    WHERE sal >
    (   SELECT AVG(sal)
        FROM emp
    );

## Subquery in SELECT Clause
    -> A Subquery can be used in the SELECT list
    -> It must return only one value (Scalar Subquery).

### Example
    SELECT ename, sal,
    (   SELECT AVG(sal)
        FROM emp
    ) AS avg_salary
    FROM emp;

## Subquery in FROM Clause
    -> A Subquery can be treated as a temporary table.
    -> This temporary result is also called a Derived Table.
    -> An alias is mandatory.

### Example
    SELECT * FROM
    ( SELECT empno, ename, sal FROM emp
    ) AS employee_data;

## Subquery in HAVING Clause
    -> A Subquery can be used in the HAVING clause.
    -> It is generally used with aggregate functions.

### Example
    SELECT deptno, AVG(sal) FROM emp
    GROUP BY deptno
    HAVING AVG(sal) >
    (   SELECT AVG(sal)
        FROM emp
    );

## Summary

    | Clause    | Purpose                                   |
    |-----------|-------------------------------------------|
    | WHERE     | Filter rows                               |
    | SELECT    | Return calculated value                   |
    | FROM      | Create a temporary table (Derived Table)  |
    | HAVING    | Filter grouped data                       |

## Important Notes
    -> WHERE is the most common place to use Subqueries.
    -> SELECT clause supports only Scalar Subqueries.
    -> FROM clause requires an alias.
    -> HAVING is mainly used with aggregate functions.

## Interview Point
    Q. In which clauses can a Subquery be used?
    Ans.
        SELECT, FROM, WHERE, HAVING

    Q. Which clause most commonly uses Subqueries?
    Ans.
        WHERE

    Q. Why is an alias required in the FROM clause?
    Ans.
        Because the Subquery result acts as a temporary table.

    Q. Which type of Subquery is used in the SELECT clause?
    Ans.
        Scalar Subquery.
---

# Summary
    -> A Subquery is a query written inside another SQL query.
    -> It can return
        One Value
        One Row
        Multiple Rows
        Multiple Columns.
    -> Main types are
        Single Row
        Multiple Row
        Correlated
        Scalar
        Multiple Column
        Nested
    -> Subqueries are commonly used in
        SELECT
        FROM
        WHERE
        HAVING
    -> Correlated Subqueries execute once for every row.
    -> JOINs are often faster than Correlated Subqueries.
---

# Most Asked Interview Questions
    1. What is a Subquery?
    2. Types of Subqueries?
    3. Difference between Single Row and Multiple Row Subquery?
    4. Difference between Correlated and Normal Subquery?
    5. Why can't '=' be used with Multiple Row Subqueries?
    6. What is a Scalar Subquery?
    7. Where can Subqueries be used?
    8. What is a Derived Table?
    9. Difference between JOIN and Subquery?
    10. When should EXISTS be preferred?
    11. Why are Correlated Subqueries slower?
    12. Can a Subquery be used in INSERT, UPDATE and DELETE?
---

# Best Practices
    -> Ensure the Subquery returns only one row when a single value is expected.
    -> Prefer aggregate functions when a single value is expected.
    -> Test each Subquery independently before embedding it.
    -> Format Subqueries with proper indentation for readability.
    -> Use the appropriate operator based on the number of rows returned (e.g., =, IN, EXISTS, ANY, ALL).
    -> Use Correlated Subqueries only when necessary.
    -> Prefer JOINs when they provide a simpler or more readable solution.
    -> Use EXISTS instead of IN for large datasets when checking row existence.
    -> Keep nesting levels as low as possible.
    -> Keep Subqueries simple and readable.
    -> Use meaningful aliases for Subqueries and Derived Tables.
    -> Test the execution plan for performance.
    -> Create indexes on columns used for filtering and joining.

# Common Mistakes
    -> Using '=' when the Subquery returns multiple rows.
    -> Forgetting parentheses around the Subquery.
    -> Assuming a Subquery always returns only one row.
    -> Not testing the inner/Subquery independently before using it.
    -> Ignoring NULL values while using NOT IN.
    -> Forgetting the correlation condition in Correlated Subqueries.
    -> Writing unnecessary Correlated Subqueries.
    -> Using EXISTS when a simple JOIN is sufficient.
    -> Returning multiple rows from a Scalar Subquery.
    -> Mismatching the number of columns in Multiple Column Subqueries.
    -> Creating deeply nested queries unnecessarily.
    -> Forgetting the alias for a Derived Table in the FROM clause.
    -> Returning multiple values from a Scalar Subquery in the SELECT clause.
    -> Using HAVING instead of WHERE unnecessarily.

# Performance Tips
    -> Execute the Subquery independently while debugging.
    -> Use indexes on filtering and correlated columns.
    -> Prefer JOINs if they produce simpler and faster execution plans.
    -> Prefer JOINs over Correlated Subqueries whenever possible.
    -> Compare execution plans of Subqueries and JOINs for large datasets.
    -> Correlated Subqueries are generally slower than Normal Subqueries.
    -> Filter data as early as possible.
    -> Avoid unnecessary or deeply nested Subqueries.
    -> Check the execution plan for complex queries.
    -> Create indexes on frequently searched columns.
    -> Use EXISTS instead of IN for large datasets when checking row existence.
---

# Database Difference

    | Feature               | PostgreSQL        | Oracle         | MySQL             |
    |-----------------------|-------------------|----------------|-------------------|
    | Single Row Subquery   | ✅                | ✅            | ✅                |
    | Multiple Row Subquery | ✅                | ✅            | ✅                |
    | Correlated Subquery   | ✅                | ✅            | ✅                |
    | Scalar Subquery       | ✅                | ✅            | ✅                |
    | Nested Subquery       | ✅                | ✅            | ✅                |
    | Derived Table         | Alias Required    | Alias Optional | Alias Required    |

---

# Conclusion
    -> Subqueries are one of the most important SQL concepts.
    -> They are widely used in reporting, analytics and backend applications.
    -> Understanding when to use Subqueries and when to use JOINs is an important skill for Java Backend Developers.