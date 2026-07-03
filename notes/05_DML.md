# DML (Data Manipulation Language)

## What is DML?
    -> DML stands for Data Manipulation Language.
    -> DML commands are used to manipulate the data stored in database
    tables.
    -> DML affects only the data, not the table structure.

## DML Commands
1. INSERT
2. UPDATE
3. DELETE

## 1. INSERT Command
    -> INSERT command is used to insert new records into a table.

### Syntax
    INSERT INTO table_name
    VALUES(value1, value2, value3);

### Example
    INSERT INTO employee
    VALUES(101,'ARSHAD',45000);

### Insert Into Specific Columns
#### Syntax
    INSERT INTO table_name(column1,column2)
    VALUES(value1,value2);
#### Example
    INSERT INTO employee(emp_id,emp_name)
    VALUES(102,'AMIR');

### Insert Multiple Rows
#### PostgreSQL / MySQL
    INSERT INTO employee
    VALUES
    (103,'RAHUL',35000),
    (104,'ROHIT',40000);

#### Oracle
    INSERT ALL
        INTO employee VALUES(103,'RAHUL',35000)
        INTO employee VALUES(104,'ROHIT',40000)
    SELECT * FROM dual;

### Important Notes
    -> Values must match the column order.
    -> Number of values must match the number of columns.
    -> Specify column names whenever possible.
    -> Multiple rows can be inserted in a single statement.

### Interview Point
    Q. Which command is used to insert new records?
    Ans.
        -> INSERT
---

## 2. UPDATE Command
    -> UPDATE command is used to modify existing records in a table.

### Syntax
    UPDATE table_name
    SET column_name = value
    WHERE condition;

### Example
    UPDATE employee
    SET salary = 50000
    WHERE emp_id = 101;

### UPDATE ALL RECORDS
    UPDATE employee
    SET salary = 50000;

### Result
    -> Updates every row in the table.

### Update Multiple Columns
#### Example
    UPDATE employee
    SET emp_name = 'ARSHAD P',
        salary = 60000
    WHERE emp_id = 101;

### Important Notes
    -> WHERE clause should be used carefully.
    -> Without WHERE, all rows are updated.
    -> Multiple columns can be updated together.

### Interview Point
    Q. What happens if WHERE clause is omitted?
    Ans.
        -> All rows are updated.
---

## 3. DELETE Command
    -> DELETE command is used to remove records from a table.

### Syntax
    DELETE FROM table_name
    WHERE condition;

### Example
    DELETE FROM employee
    WHERE emp_id = 101;

### DELETE ALL RECORDS
    DELETE FROM employee;

### Result
    -> Deletes all rows from the table.
    -> Table structure remains unchanged.

### Important Notes
    -> WHERE clause should be used carefully.
    -> DELETE can remove one or many rows.
    -> Table structure is not deleted.

### Interview Point
    Q. What happens if WHERE clause is omitted?
    Ans.
        -> All rows are deleted.

---

## Difference Between DELETE and TRUNCATE

DELETE

    -> Removes selected rows.
    -> WHERE clause allowed.
    -> Deletes rows one by one.
    -> Structure remains.

TRUNCATE

    -> Removes all rows.
    -> WHERE clause not allowed.
    -> Removes all rows at once.
    -> Structure remains.
---

## DELETE vs TRUNCATE

Feature                DELETE          TRUNCATE

Removes Data           Yes             Yes
Removes Structure      No              No
WHERE Allowed          Yes             No
Deletes Selected Rows  Yes             No
Faster                 No              Yes
---

## Real-Time Examples
### INSERT
    Add a new employee record.
### UPDATE
    Increase employee salary.
### DELETE
    Remove resigned employee records.
---

## Summary
    INSERT
        Inserts new records.

    UPDATE
        Modifies existing records.

    DELETE
        Removes existing records.
---

## Most Asked Interview Questions
    Q. What is DML?
    Ans.
        -   > Data Manipulation Language.
        -> Used to manipulate table data.

    Q. Which command inserts new records?
    Ans.
        -> INSERT

    Q. Which command modifies existing records?
    Ans.
        -> UPDATE

    Q. Which command removes records?
    Ans.
        -> DELETE

    Q. What happens if UPDATE is executed without WHERE?
    Ans.
        -> All rows are updated.

    Q. What happens if DELETE is executed without WHERE?
    Ans.
        -> All rows are deleted.

    Q. Difference between DELETE and TRUNCATE?
    Ans.
        -> DELETE removes selected rows.
        -> TRUNCATE removes all rows.

## Performance Tips
### Best Practices
        Always execute SELECT before UPDATE/DELETE.
        Always use WHERE unless intentionally affecting all rows.
        Perform DML inside transactions.
        Test on development data first.
        Commit only after verification.

### Common Mistakes
        UPDATE without WHERE.
        DELETE without WHERE.
        Forgetting COMMIT.
        Committing incorrect data.
        Inserting values without specifying column names.