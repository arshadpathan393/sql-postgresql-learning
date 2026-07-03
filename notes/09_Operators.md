# Operators

## What are Operators?
    -> Operators are special symbols or keywords used to perform operations
    on one or more operands.
    -> Operators are mainly used with the WHERE clause to filter records.
    -> They are also used in calculations, comparisons and logical
    operations.
### Example
    SELECT * FROM emp WHERE sal > 3000;
### Important Notes
    -> Operators are commonly used with SELECT, UPDATE and DELETE.
    -> Different operators perform different types of operations.
    -> Choosing the correct operator improves query readability.
---

## Types of Operators
1. Arithmetic Operators
2. Comparison (Relational) Operators
3. Logical Operators
4. Special Operators
5. Concat Operator
6. Subquery Operators
---

# 1. Arithmetic Operators
    -> Arithmetic operators perform mathematical calculations on numeric
    values.
## Types of Arithmetic Operators
    +       Addition
    -       Subtraction
    *       Multiplication
    /       Division
    %       Modulus (Returns Remainder)
---

## Addition Operator (+)
    -> Used to add two numeric values.
### Syntax
    SELECT expression + expression;
### Example
    SELECT sal + 1000
    FROM emp;
### Output
    SAL + 1000

    1800
    2600
    2250

### Important Notes
    -> Mostly used for calculations.
    -> Can be used with numeric columns.
    -> Commonly used while calculating salary increments.

### Interview Point
    Q. Which operator is used for addition?
    Ans.
        -> +
---
## Subtraction Operator (-)
    -> Used to subtract one value from another.
### Syntax
    SELECT expression - expression;
### Example
    SELECT sal - 500
    FROM emp;
### Output
    SAL - 500

    300
    1100
    750
### Important Notes
    -> Returns the difference between two values.
    -> Used in financial and reporting calculations.
### Interview Point
    Q. Which operator is used for subtraction?
    Ans.
        -> -
---

## Multiplication Operator (*)
    -> Used to multiply two numeric values.
### Syntax
    SELECT expression * expression;
### Example
    SELECT sal * 12 AS Annual_Salary
    FROM emp;
### Output
    Annual_Salary

    9600
    19200
    15000
### Important Notes
    -> Frequently used while calculating annual salary.
    -> Can be combined with aliases.
### Interview Point
    Q. Which operator is used for multiplication?
    Ans.
        -> *
---

## Division Operator (/)
    -> Used to divide one value by another.
### Syntax
    SELECT expression / expression;
### Example
    SELECT sal / 2
    FROM emp;
### Output
    SAL / 2

    400
    800
    625
### Important Notes
    -> Dividing by zero results in an error.
    -> Result depends on the datatype of operands.

### Interview Point
    Q. What happens if a number is divided by zero?
    Ans.
        -> An error is generated.
---

## Modulus Operator (%)
    -> Modulus returns the remainder after division.
### Syntax
    SELECT expression % expression;
### Example
    SELECT 25 % 4;
### Output
    1
### Database Difference
    PostgreSQL
        SELECT MOD(25,4);
        SELECT 25 % 4;

    MySQL
        SELECT MOD(25,4);
        SELECT 25 % 4;

    Oracle
        SELECT MOD(25,4)
        FROM dual;
### Important Notes
    -> Used to determine even and odd numbers.
    -> Frequently used in programming logic.
### Interview Point
    Q. Which operator returns the remainder?
    Ans.
        -> %
---

# 2. Comparison (Relational) Operators
    -> Comparison operators compare two values.
    -> They return TRUE or FALSE based on the comparison.
## Types of Comparison Operators
    =           Equal To
    <> or !=    Not Equal To
    <           Less Than
    <=          Less Than or Equal To
    >           Greater Than
    >=          Greater Than or Equal To
    
---
## Equal To (=)
    -> Returns rows where both values are equal.
### Syntax
    SELECT *
    FROM emp
    WHERE sal = 3000;
### Example
    SELECT empno,ename,sal
    FROM emp
    WHERE sal = 3000;
### Important Notes
    -> Most frequently used comparison operator.
    -> Cannot be used to compare NULL values.
### Interview Point
    Q. Can '=' compare NULL values?
    Ans.
        -> No
        -> Use IS NULL instead.
---

## Not Equal To (<>)
    -> Returns rows where values are not equal.
### Syntax
    SELECT *
    FROM emp
    WHERE deptno <> 10;
### Example
    SELECT empno,ename,deptno
    FROM emp
    WHERE deptno <> 10;
### Database Difference
    PostgreSQL
        <>
        !=

    MySQL
        <>
        !=

    Oracle
        <>

### Important Notes
    -> '<>' is the ANSI SQL standard.
    -> Prefer '<>' for better portability.

### Interview Point
    Q. Which operator is the ANSI SQL standard for Not Equal To?
    Ans.
        -> <>
---

## Less Than (<)
    -> Returns rows having values less than the specified value.
### Syntax
    SELECT *
    FROM emp
    WHERE sal < 2000;
### Example
    SELECT ename,sal
    FROM emp
    WHERE sal < 2000;
### Important Notes
    -> Excludes the specified value.
    -> Frequently used in filtering records.
### Interview Point
    Q. Does '<' include the specified value?
    Ans.
        -> No
---

## Less Than or Equal To (<=)
    -> Returns rows having values less than or equal to the specified value.
### Syntax
    SELECT *
    FROM emp
    WHERE sal <= 2000;
### Example
    SELECT ename,sal
    FROM emp
    WHERE sal <= 2000;
### Important Notes
    -> Includes the specified value.
    -> Useful in range-based filtering.
### Interview Point
    Q. Does '<=' include the specified value?
    Ans.
        -> Yes

---

## Greater Than (>)
    -> Returns rows having values greater than the specified value.
### Syntax
    SELECT *
    FROM emp
    WHERE sal > 3000;
### Example
    SELECT ename,sal
    FROM emp
    WHERE sal > 3000;
### Important Notes
    -> Excludes the specified value.
    -> Commonly used in reports.
### Interview Point
    Q. Does '>' include the specified value?
    Ans.
        -> No
---

## Greater Than or Equal To (>=)
    -> Returns rows having values greater than or equal to the specified
    value.
### Syntax
    SELECT *
    FROM emp
    WHERE sal >= 3000;
### Example
    SELECT ename,sal
    FROM emp
    WHERE sal >= 3000;
### Important Notes
    -> Includes the specified value.
    -> Used when boundary values are required.
### Interview Point
    Q. Does '>=' include the specified value?
    Ans.
        -> Yes
---

# 3. Logical Operators
    -> Logical operators are used to combine multiple conditions.
    -> They return TRUE or FALSE based on the evaluation.
    -> Mainly used with the WHERE clause.

## Types of Logical Operators
    AND     Returns TRUE if all conditions are TRUE.
    OR      Returns TRUE if at least one condition is TRUE.
    NOT     Reverses the result of a condition.
---

## AND Operator
    -> Returns records only when all conditions are TRUE.
### Syntax
    SELECT *
    FROM emp
    WHERE condition1 AND condition2;
### Example
    SELECT empno, ename, sal, deptno
    FROM emp
    WHERE deptno = 30
    AND sal > 1500;
### Important Notes
    -> Every condition must be TRUE.
    -> Used to apply multiple filters.
    -> Produces fewer records than OR.
### Interview Point
    Q. When does AND return TRUE?
    Ans.
        -> Only when all conditions are TRUE.

---

## OR Operator
    -> Returns records when at least one condition is TRUE.
### Syntax
    SELECT *
    FROM emp
    WHERE condition1 OR condition2;
### Example
    SELECT empno, ename, deptno
    FROM emp
    WHERE deptno = 10
    OR deptno = 20;
### Important Notes
    -> At least one condition should be TRUE.
    -> Produces more records than AND.
### Interview Point
    Q. When does OR return TRUE?
    Ans.
        -> When any one condition is TRUE.
---

## NOT Operator
    -> NOT reverses the result of a condition.
### Syntax
    SELECT *
    FROM emp
    WHERE NOT condition;
### Example
    SELECT empno, ename, deptno
    FROM emp
    WHERE NOT deptno = 10;
### Important Notes
    -> Converts TRUE to FALSE.
    -> Converts FALSE to TRUE.
    -> Frequently used with IN, BETWEEN and LIKE.
### Interview Point
    Q. What is the purpose of NOT operator?
    Ans.
        -> To reverse a condition.

---

# 4. Special Operators
    -> Special operators are used to perform specific comparisons.
    -> They simplify SQL queries and improve readability.
## Types of Special Operators
    IN
    NOT IN
    BETWEEN
    NOT BETWEEN
    LIKE
    NOT LIKE
    IS NULL
    IS NOT NULL
    EXISTS
    NOT EXISTS
---

## IN Operator
    -> IN checks whether a value exists in a specified list.

### Syntax
    SELECT *
    FROM emp
    WHERE deptno IN (10,20,30);
### Example
    SELECT empno, ename, deptno
    FROM emp
    WHERE deptno IN (10,30);
### Important Notes
    -> Replaces multiple OR conditions.
    -> Improves query readability.
    -> Frequently used in reporting queries.
### Interview Point
    Q. Which operator replaces multiple OR conditions
    Ans.
        -> IN

---

## NOT IN Operator
    -> NOT IN returns records that are not present in a specified list.
### Syntax
    SELECT *
    FROM emp
    WHERE deptno NOT IN (10,20);
### Example
    SELECT empno, ename, deptno
    FROM emp
    WHERE deptno NOT IN (10,20);
### Important Notes
    -> Opposite of IN.
    -> Used to exclude multiple values.
    -> Be careful when NULL values are present.
### Interview Point
    Q. Which operator excludes multiple values?
    Ans.
        -> NOT IN
---

## BETWEEN Operator
    -> BETWEEN returns values within a specified range.
    -> Both boundary values are included.
### Syntax
    SELECT *
    FROM emp
    WHERE sal BETWEEN 1000 AND 3000;
### Example
    SELECT empno, ename, sal
    FROM emp
    WHERE sal BETWEEN 1500 AND 3000;
### Important Notes
    -> Includes both starting and ending values.
    -> Works with numbers, dates and text.
### Interview Point
    Q. Does BETWEEN include boundary values?
    Ans.
        -> Yes
---

## NOT BETWEEN Operator
    -> NOT BETWEEN returns values outside the specified range.
### Syntax
    SELECT *
    FROM emp
    WHERE sal NOT BETWEEN 1000 AND 3000;
### Example
    SELECT empno, ename, sal
    FROM emp
    WHERE sal NOT BETWEEN 1500 AND 3000;
### Important Notes
    -> Excludes values within the specified range.
    -> Includes values below and above the range.
### Interview Point
    Q. What is the opposite of BETWEEN?
    Ans.
        -> NOT BETWEEN
---

## LIKE Operator
    -> LIKE operator is used to search for a specified pattern in a column.
    -> It is mainly used with character data.
### Wildcards Used with LIKE
    %       Represents zero or more characters.
    _       Represents exactly one character.

### Syntax
    SELECT *
    FROM emp
    WHERE ename LIKE 'pattern';
### Examples
    Employee names starting with 'S'

    SELECT empno, ename
    FROM emp
    WHERE ename LIKE 'S%';

    Employee names ending with 'N'

    SELECT empno, ename
    FROM emp
    WHERE ename LIKE '%N';

    Employee names containing 'A'

    SELECT empno, ename
    FROM emp
    WHERE ename LIKE '%A%';

    Employee names having exactly five characters

    SELECT empno, ename
    FROM emp
    WHERE ename LIKE '_____';

    Employee names starting with 'S' and ending with 'H'

    SELECT empno, ename
    FROM emp
    WHERE ename LIKE 'S%H';

### Important Notes
    -> '%' represents zero or more characters.
    -> '_' represents exactly one character.
    -> LIKE is case-sensitive in PostgreSQL.

### Interview Point
    Q. What is the difference between '%' and '_'?
    Ans.
        -> '%' matches zero or more characters.
        -> '_' matches exactly one character.

---

## NOT LIKE Operator
    -> NOT LIKE returns rows that do not match a specified pattern.
### Syntax
    SELECT *
    FROM emp
    WHERE ename NOT LIKE 'S%';
### Example
    SELECT empno, ename
    FROM emp
    WHERE ename NOT LIKE 'S%';
### Important Notes
    -> Opposite of LIKE.
    -> Used to exclude matching patterns.
### Interview Point
    Q. Which operator is used to exclude matching patterns?
    Ans.
        -> NOT LIKE
---

## IS NULL Operator
    -> IS NULL returns rows containing NULL values.
### Syntax
    SELECT *
    FROM emp
    WHERE comm IS NULL;
### Example
    SELECT empno, ename, comm
    FROM emp
    WHERE comm IS NULL;
### Important Notes
    -> '=' cannot compare NULL values.
    -> Always use IS NULL.
    -> NULL represents an unknown or missing value.
### Interview Point
    Q. Can NULL be compared using '='?
    Ans.
        -> No
        -> Use IS NULL.
---

## IS NOT NULL Operator
    -> IS NOT NULL returns rows containing non-NULL values.
### Syntax
    SELECT *
    FROM emp
    WHERE comm IS NOT NULL;
### Example
    SELECT empno, ename, comm
    FROM emp
    WHERE comm IS NOT NULL;
### Important Notes
    -> Returns only rows having values.
    -> Opposite of IS NULL.
### Interview Point
    Q. Which operator is used to retrieve non-NULL values?
    Ans.
        -> IS NOT NULL
---

## EXISTS Operator
    -> EXISTS checks whether a subquery returns at least one row.
    -> If the subquery returns rows, EXISTS returns TRUE.
### Syntax
    SELECT column_name
    FROM table_name
    WHERE EXISTS
    (
        subquery
    );

### Example
    SELECT dname
    FROM dept d
    WHERE EXISTS
    (
        SELECT 1
        FROM emp e
        WHERE e.deptno = d.deptno
    );
### Important Notes
    -> Mainly used with subqueries.
    -> Stops searching after finding the first matching row.
    -> Often performs better than IN for large datasets.
### Interview Point
    Q. When does EXISTS return TRUE?
    Ans.
        -> When the subquery returns at least one row.
---

## NOT EXISTS Operator
    -> NOT EXISTS returns TRUE when the subquery returns no rows.
### Syntax
    SELECT column_name
    FROM table_name
    WHERE NOT EXISTS
    (
        subquery
    );
### Example
    SELECT dname
    FROM dept d
    WHERE NOT EXISTS
    (
        SELECT 1
        FROM emp e
        WHERE e.deptno = d.deptno
    );
### Important Notes
    -> Opposite of EXISTS.
    -> Frequently used to find missing related records.
### Interview Point
    Q. What is the difference between EXISTS and NOT EXISTS?
    Ans.
        -> EXISTS returns TRUE when matching rows exist.
        -> NOT EXISTS returns TRUE when matching rows do not exist.
---

# 5. Concatenation Operator (||)
    -> Concatenation operator is used to combine two or more strings into a
    single string.
    -> It is commonly used to display meaningful output.
### Syntax
    SELECT string1 || string2;
### Example
    SELECT ename || ' works as ' || job AS employee_details
    FROM emp;
### Output
    SMITH works as CLERK
    ALLEN works as SALESMAN
### Database Difference
    PostgreSQL
        SELECT ename || ' - ' || job
        FROM emp;

    Oracle
        SELECT ename || ' - ' || job
        FROM emp;

    MySQL
        SELECT CONCAT(ename,' - ',job)
        FROM emp;

### Important Notes
    -> Used only for string concatenation.
    -> PostgreSQL and Oracle use '||'.
    -> MySQL commonly uses CONCAT().
    -> NULL values may affect the output.

### Interview Point
    Q. Which operator is used for string concatenation in PostgreSQL?
    Ans.
        -> ||
---

# 6. Subquery Operators
    -> Subquery operators are used with subqueries.
    -> They compare a value with the result returned by a subquery.
    -> They are mainly used with multi-row subqueries.
## Types of Subquery Operators
    ANY
    ALL
---

## ANY Operator
    -> ANY compares a value with each value returned by a subquery.
    -> The condition becomes TRUE if at least one value satisfies the condition.
### Syntax
    SELECT *
    FROM emp
    WHERE sal > ANY
    (
        SELECT sal
        FROM emp
        WHERE deptno = 30
    );
    ### Example
    SELECT empno, ename, sal
    FROM emp
    WHERE sal > ANY
    (
        SELECT sal
        FROM emp
        WHERE deptno = 30
    );
### Important Notes
    -> ANY works only with subqueries.
    -> Returns TRUE if at least one comparison is TRUE.
    -> Commonly used with >, <, >= and <= operators.

### Interview Point
    Q. When does ANY return TRUE?
    Ans.
        -> When at least one value satisfies the condition.
---

## ALL Operator
    -> ALL compares a value with every value returned by a subquery.
    -> The condition becomes TRUE only if all comparisons are TRUE.
    ### Syntax
    SELECT *
    FROM emp
    WHERE sal > ALL
    (
        SELECT sal
        FROM emp
        WHERE deptno = 30
    );
### Example
    SELECT empno, ename, sal
    FROM emp
    WHERE sal > ALL
    (
        SELECT sal
        FROM emp
        WHERE deptno = 30
    );
### Important Notes
    -> ALL works only with subqueries.
    -> Every comparison must be TRUE.
    -> More restrictive than ANY.
### Interview Point
    Q. What is the difference between ANY and ALL?
    Ans.
        -> ANY requires at least one comparison to be TRUE.
        -> ALL requires every comparison to be TRUE.

---

# Operator Precedence
    -> Operator precedence determines the order in which SQL evaluates
    expressions.
    -> Operators with higher precedence are evaluated before operators with
    lower precedence.
    -> Parentheses () can be used to override the default precedence.
    ## Precedence Order
1. ()
2. Arithmetic Operators
3. Comparison Operators
4. NOT
5. AND
6. OR

### Example
    SELECT *
    FROM emp
    WHERE deptno = 10
    OR deptno = 20
    AND sal > 3000;
### Evaluation
    AND is evaluated first.
    Equivalent to:
    deptno = 10
    OR
    (deptno = 20 AND sal > 3000)

### Using Parentheses
    SELECT *
    FROM emp
    WHERE (deptno = 10 OR deptno = 20)
    AND sal > 3000; 
### Important Notes
    -> Use parentheses to improve readability.
    -> Parentheses avoid logical mistakes.
    -> Never rely only on operator precedence for complex conditions.
### Interview Point
    Q. Which operator is evaluated first?
    Ans.
        -> AND
---

## Real-Time Examples
### Example 1 - Employees working in Department 10.
    SELECT empno, ename
    FROM emp
    WHERE deptno = 10;
### Example 2 - Employees having salary greater than 3000.
    SELECT empno, ename, sal
    FROM emp
    WHERE sal > 3000;
### Example 3 - Employees working in Department 10 or 20.
    SELECT empno, ename, deptno
    FROM emp
    WHERE deptno IN (10,20);
### Example 4 - Employees having NULL commission.
    SELECT empno, ename
    FROM emp
    WHERE comm IS NULL;
### Example 5 - Employees whose names start with 'A'.
    SELECT empno, ename
    FROM emp
    WHERE ename LIKE 'A%';
---

## Summary
    Arithmetic Operators
        -> Perform mathematical calculations.
    Comparison Operators
        -> Compare two values.
    Logical Operators
        -> Combine multiple conditions.
    Special Operators
        -> Simplify filtering and pattern matching.
---

## Most Asked Interview Questions
    Q. What are SQL operators?
    Ans.
        -> Operators perform calculations, comparisons and logical operations.
    Q. Which operator compares NULL values?
    Ans.
        -> IS NULL
    Q. Which operator replaces multiple OR conditions?
    Ans.
        -> IN
    Q. Does BETWEEN include boundary values?
    Ans.
        -> Yes
    Q. Which wildcard represents multiple characters?
    Ans.
        -> %
    Q. Which wildcard represents exactly one character?
    Ans.
        -> _
    Q. Difference between LIKE and IN?
    Ans.
        -> LIKE performs pattern matching.
        -> IN compares values from a specified list.
    Q. Difference between EXISTS and IN?
    Ans.
        -> EXISTS checks whether a subquery returns rows.
        -> IN compares a value with a list of values.
    Q. Can '=' compare NULL values?
    Ans.
        -> No
        -> Use IS NULL.
---

## Best Practices
    -> Select the most appropriate operator for the requirement.
    -> Use IN instead of multiple OR conditions.
    -> Always use IS NULL to compare NULL values.
    -> Use parentheses when combining AND and OR.
    -> Use meaningful aliases in complex queries.
    -> Prefer '<>' over '!=' for ANSI SQL compatibility.
    -> Write readable WHERE clauses.
---

## Common Mistakes
    -> Using '=' to compare NULL values.
    -> Forgetting parentheses in complex conditions.
    -> Using NOT IN when the list or subquery may contain NULL values.
    -> Using LIKE when an exact match ('=') is sufficient.
    -> Writing long OR conditions instead of using IN.
    -> Assuming BETWEEN excludes boundary values.
---

## Performance Tips
    -> Avoid SELECT * in production queries.
    -> LIKE 'ABC%' can use an index in many databases.
    -> LIKE '%ABC' usually cannot use a normal B-tree index efficiently.
    -> Large IN lists may affect query performance.
    -> EXISTS is often faster than IN for large subqueries.
    -> Avoid applying functions to indexed columns in WHERE clauses.
    -> Filter data as early as possible.
    -> Keep WHERE conditions simple and readable.