# GROUP BY Clause

## Definition
    -> GROUP BY is used to group rows having the similar values.
    -> It is commonly used with Aggregate Functions.
    -> It returns one row for each group.
## Syntax
    SELECT group_column,aggregate_function(column_name)
    FROM table_name
    WHERE condition
    GROUP BY group_column;
## Example 1: Display total salary department-wise.
    SELECT deptno,SUM(sal) FROM emp
    GROUP BY deptno;
## Example 2: Display average salary department-wise.
    SELECT deptno,AVG(sal) FROM emp
    GROUP BY deptno;
## Example 3: Display employee count department-wise.
    SELECT deptno,COUNT(*) FROM emp
    GROUP BY deptno;
---

## Rules of GROUP BY
    -> Every non-aggregate column in the SELECT clause must appear in GROUP BY.
    -> Aggregate functions need not be included in GROUP BY.
    -> GROUP BY creates one row for each group.
    -> WHERE filters rows before grouping.
---

# HAVING Clause
## Definition
    -> HAVING filters groups.
    -> It is used after GROUP BY.
    -> HAVING is mainly used with Aggregate Functions.

## Syntax
    SELECT group_column,aggregate_function(column_name)
    FROM table_name
    GROUP BY group_column
    HAVING aggregate_function(column_name)
    condition;

## Example 1: Display departments having average salary greater than 2500.
    SELECT deptno,AVG(sal) FROM emp
    GROUP BY deptno
    HAVING AVG(sal) > 2500;
## Example 2: Display departments having more than three employees.
    SELECT deptno,COUNT(*) FROM emp
    GROUP BY deptno
    HAVING COUNT(*) > 3;
## Example 3: Display departments whose maximum salary is greater than 4000.
    SELECT deptno,MAX(sal) FROM emp
    GROUP BY deptno
    HAVING MAX(sal) > 4000;
---

# Execution Order
    1. FROM
    2. WHERE
    3. GROUP BY
    4. HAVING
    5. SELECT
---

# WHERE vs HAVING
    | WHERE                             | HAVING                                |
    |-----------------------------------|---------------------------------------|
    | Filters rows                      | Filters groups                        |
    | Before GROUP BY                   | After GROUP BY                        |
    | Cannot use aggregate functions    | Mainly used with aggregate functions  |
---

# Important Notes
    -> GROUP BY groups rows.
    -> HAVING filters groups.
    -> WHERE filters rows.
    -> HAVING is usually used with Aggregate Functions.
    -> GROUP BY and HAVING are frequently used together.
---

# Interview Points
    Q. Why is GROUP BY used?
    Ans.
        To group similar rows.

    Q. Why is HAVING used?
    Ans.
        To filter grouped data.

    Q. Difference between WHERE and HAVING?
    Ans.
        WHERE filters rows.
        HAVING filters groups.

    Q. Which clause executes first?
    Ans.
        WHERE executes before GROUP BY.

    Q. Can Aggregate Functions be used in WHERE?
    Ans.
        No. Use HAVING instead.
---

# Summary
    -> GROUP BY creates groups.
    -> HAVING filters groups.
    -> WHERE filters rows.
    -> GROUP BY is generally used with Aggregate Functions.
    -> HAVING is evaluated after GROUP BY.
---

# Most Asked Interview Questions

    1. What is GROUP BY?
    2. Why is HAVING used?
    3. Difference between WHERE and HAVING?
    4. Can Aggregate Functions be used in WHERE?
    5. Can HAVING be used without GROUP BY?
    6. What is the execution order of SQL clauses?
    7. Why should every non-aggregate column appear in GROUP BY?
---

# Best Practices
    -> Use WHERE to filter rows before grouping.
    -> Use HAVING only for filtering grouped data.
    -> Group only required columns.
    -> Use meaningful aliases for aggregate columns.
    -> Test aggregate queries independently.
---

# Common Mistakes
    -> Using Aggregate Functions in WHERE.
    -> Forgetting GROUP BY for non-aggregate columns.
    -> Confusing WHERE and HAVING.
    -> Selecting columns that are not grouped or aggregated.
---

# Performance Tips
    -> Filter rows using WHERE before GROUP BY.
    -> Group only necessary data.
    -> Create indexes on columns frequently used for grouping.
    -> Avoid grouping unnecessary columns.
    -> Check execution plans for large datasets.