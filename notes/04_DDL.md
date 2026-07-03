# DDL (Data Definition Language)

## What is DDL?
    -> DDL stands for Data Definition Language.
    -> DDL commands are used to define and manage database objects.
    -> These commands affect the structure of database objects.

    Database Objects:
        -> Tables
        -> Views
        -> Indexes
        -> Sequences

## DDL Commands
1. CREATE
2. ALTER
3. DROP
4. TRUNCATE
5. RENAME

---

## 1. CREATE Command

-> CREATE command is used to create database objects.
-> Most commonly used to create tables.

### Syntax
CREATE TABLE table_name(
    column1 datatype,
    column2 datatype
);

### Example
CREATE TABLE employee(
    emp_id INT,
    emp_name VARCHAR(50),
    salary DECIMAL(10,2)
);

### Verify Table
SELECT * FROM employee;

### Important Notes
    -> CREATE creates a new database object.
    -> Table name must be unique within a schema.
    -> Column names should be meaningful.
    -> CREATE is used to create duplicate tables and views also

### Creating Duplicate Table

CREATE TABLE new_table_name 
AS SELECT */column_names FROM old_table_name;

#### Example
CREATE TABLE emp1 AS SELECT * FROM employee;

### Interview Point
Q. Which command is used to create a table?
Ans -> CREATE

---

## 2. ALTER Command

    -> ALTER command is used to modify an existing table structure.
    -> We can add, modify, rename, or drop columns.

### ALTER ADD COLUMN

#### Syntax
    ALTER TABLE table_name
    ADD column_name datatype;

#### Example
    ALTER TABLE employee
    ADD email VARCHAR(100);

### Table Structure After ALTER
    emp_id
    emp_name
    salary
    email

---

### ALTER MODIFY COLUMN

#### Oracle
    ALTER TABLE employee
    MODIFY emp_name VARCHAR2(100);

#### MySQL
    ALTER TABLE employee
    MODIFY emp_name VARCHAR(100);

#### PostgreSQL
    ALTER TABLE employee
    ALTER COLUMN emp_name TYPE VARCHAR(100);

### Use Case
    -> Increase column size.
    -> Change datatype.

---

### ALTER DROP COLUMN

#### Syntax
    ALTER TABLE employee
    DROP COLUMN email;

### Result
-> email column is removed permanently.

---

### ALTER RENAME COLUMN

#### Oracle
    ALTER TABLE employee
    RENAME COLUMN emp_name TO employee_name;

#### MySQL
    ALTER TABLE employee
    RENAME COLUMN emp_name TO employee_name;

#### PostgreSQL
    ALTER TABLE employee
    RENAME COLUMN emp_name TO employee_name;

### ALTER ADD CONSTRAINT
    ALTER TABLE employee
    ADD CONSTRAINT pk PRIMARY KEY(emp_id)

    ALTER TABLE employee
    ADD CONSTRAINT fk 
    FOREIGN KEY (dept_id)
    REFERENCES department(dept_id)

### ALTER DROP CONSTRAINT
    ALTER TABLE employee
    DROP CONSTRAINT pk

    ALTER TABLE employee
    DROP CONSTRAINT fk 
    
#### SET NOT NULL CONSTRAINT
    ALTER TABLE employee
    ALTER COLUMN emp_name SET NOT NULL;

#### DROP NOT NULL CONSTRAINT
    ALTER TABLE employee
    ALTER COLUMN emp_name DROP NOT NULL;

#### SET DEFAULT VALUE
    ALTER TABLE employee
    ALTER COLUMN city SET DEFAULT 'Mumbai';
    
#### DROP DEFAULT VALUE
    ALTER TABLE employee
    ALTER COLUMN city DROP DEFAULT;


### Important Notes
    -> ALTER changes only the structure.
    -> Existing data remains intact.
    -> Use carefully in production systems.

### Interview Point
    Q. Which command is used to modify table structure?
    Ans. 
        -> ALTER
    Q. Can we modify constraints using ALTER?
    Ans.
        → Yes (PRIMARY KEY, FOREIGN KEY, UNIQUE, NOT NULL, DEFAULT)
    
---

## 3. DROP Command
    -> DROP command removes a database object completely.
    -> Both structure and data are deleted.
    
### Syntax
    DROP TABLE table_name;
    
### Example
    DROP TABLE employee;
    
### Result
    -> Table deleted permanently.
    -> All records deleted permanently.
    -> Structure deleted permanently.
    
### Important Notes
    -> DROP cannot be rolled back in most cases.
    -> Use carefully.
    
### Interview Point
    Q. What happens when a table is dropped?
    Ans.
        -> Table structure is deleted.
        -> Table data is deleted.

---

## 4. TRUNCATE Command

    -> TRUNCATE removes all records from a table.
    -> Table structure remains unchanged.

### Syntax
    TRUNCATE TABLE table_name;

### Example
    TRUNCATE TABLE employee;

### Before TRUNCATE
    emp_id      emp_name

    101         ARSHAD
    102         AMIR
    103         RAHUL

### After TRUNCATE
    No Rows Selected

### Important Notes
    -> Removes all rows.
    -> Structure remains.
    -> Faster than DELETE.
    -> Cannot use WHERE clause.

### Interview Point
    Q. Does TRUNCATE delete table structure?
    Ans.
        -> No

---

## 5. RENAME Command

    -> RENAME command changes the name of a database object.

### Oracle
    RENAME employee TO employees;

### MySQL
    RENAME TABLE employee TO employees;

### PostgreSQL
    ALTER TABLE employee
    RENAME TO employees;
 
### Result
   employee  --->  employees

### Important Notes
    -> Only object name changes.
    -> Data remains unchanged.
    -> Structure remains unchanged.

### Interview Point
    Q. Which command is used to rename a table?
    Ans.
        -> RENAME

---

## Oracle vs MySQL vs PostgreSQL

### CREATE TABLE
    Oracle
        CREATE TABLE employee(
            emp_id NUMBER
        );

    MySQL
        CREATE TABLE employee(
            emp_id INT
        );

    PostgreSQL
        CREATE TABLE employee(
            emp_id INTEGER
        );

---

## Difference Between DELETE, TRUNCATE and DROP
   DELETE

        -> Removes selected rows.
        -> WHERE clause allowed.
        -> Structure remains.

    TRUNCATE

        -> Removes all rows.
        -> WHERE clause not allowed.
        -> Structure remains.

    DROP

        -> Removes complete table.
        -> Structure deleted.
        -> Data deleted.
 
---

## DELETE vs TRUNCATE vs DROP

    Feature            DELETE      TRUNCATE        DROP

    Removes Data       Yes         Yes             Yes
    Removes Structure  No          No              Yes
    WHERE Allowed      Yes         No              No
    Faster             No          Yes             Yes
    Can Recover        Usually     Difficult       Difficult
 
---

## Real-Time Examples

### CREATE
    Create a new Employee table.
 
### ALTER
    Add Email column to Employee table.
    
### DROP
    Remove old backup table.
    
### TRUNCATE
    Clear test data before new testing cycle.
    
### RENAME
    Rename employee to employees.
    
---

## Summary
    
    CREATE
        Creates database objects.

    ALTER
        Modifies database objects.

    DROP
        Deletes structure and data.

    TRUNCATE
        Deletes all rows only.

    RENAME
        Changes object name.
    
---

## Most Asked Interview Questions

    Q. What is DDL?
    Ans.
        -> Data Definition Language.
        -> Used to define database structure.

    Q. Which command creates a table?
    Ans.
        -> CREATE

    Q. Which command modifies table structure?
    Ans.
        -> ALTER

    Q. Difference between DROP and TRUNCATE?
    Ans.
        -> DROP removes structure and data.
        -> TRUNCATE removes only data.

    Q. Can TRUNCATE use a WHERE clause?
    Ans.
        -> No

    Q. Which DDL command is fastest for removing all rows?
    Ans.
        -> TRUNCATE

    Q. Which command renames a table?
    Ans.
        -> RENAME

## Performance Tips
### Best Practices
        Give meaningful table and column names.
        Follow a consistent naming convention.
        Always define a PRIMARY KEY.
        Use appropriate data types.
        Keep DDL scripts in version control.
### Common Mistakes
        Creating tables without PRIMARY KEY.
        Using VARCHAR for every column.
        Dropping production tables accidentally.
        Modifying table structure directly in production