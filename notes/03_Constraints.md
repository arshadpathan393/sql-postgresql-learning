# Constraints

## Data Integrity Using Constraints

    -> Constraints are rules applied on table columns to maintain data integrity.
    -> Constraints help maintain:
        - Accuracy
        - Correctness
        - Consistency

    -> Constraints prevent invalid data from being inserted into a table.

    Examples:
        - Prevent NULL values
        - Prevent duplicate values
        - Enforce relationships between tables
        - Restrict invalid values

## What is a Constraint?

    A Constraint is a rule that restricts the type of data that can be stored
    in a table column.

    Constraints help:
        -> Validate data
        -> Maintain data integrity
        -> Avoid duplicate records
        -> Establish relationships between tables

## Types of Constraints

1. NOT NULL
2. UNIQUE
3. PRIMARY KEY
4. FOREIGN KEY
5. CHECK
6. DEFAULT
7. AUTO INCREMENT / IDENTITY

---

## 1. NOT NULL Constraint

    -> NOT NULL ensures that a column cannot contain NULL values.
    -> Every row must have a value for that column.


### Syntax
    column_name datatype NOT NULL

### Example
    CREATE TABLE employee(
        emp_id INT,
        emp_name VARCHAR(50) NOT NULL
    );

### Valid Insert
    INSERT INTO employee VALUES(101,'ARSHAD');

### Invalid Insert
    INSERT INTO employee VALUES(102,NULL);

### Oracle vs MySQL vs PostgreSQL
    Feature         Oracle          MySQL           PostgreSQL

    Supported       Yes             Yes             Yes
    Allows NULL     No              No              No

### Important Notes
    -> NOT NULL prevents missing values.
    -> Multiple columns can have NOT NULL constraints.
    -> NOT NULL does not prevent duplicate values.

### Interview Point

    Q. Can a NOT NULL column contain duplicate values?
    Ans. Yes

    Q. What is the purpose of NOT NULL?
    Ans. To prevent NULL values from being stored.

---

## 2. UNIQUE Constraint

    -> UNIQUE ensures that all values in a column are different.
    -> Duplicate values are not allowed.

### Syntax
    column_name datatype UNIQUE

### Example
    CREATE TABLE employee(
        emp_id INT,
        email VARCHAR(100) UNIQUE
    );

### Valid Inserts
    INSERT INTO employee VALUES(101,'a@gmail.com');
    INSERT INTO employee VALUES(102,'b@gmail.com');

### Invalid Insert
    INSERT INTO employee VALUES(103,'a@gmail.com');

### Oracle vs MySQL vs PostgreSQL
    Feature                 Oracle      MySQL       PostgreSQL

    Duplicate Values        No          No          No
    NULL Allowed            Yes         Yes         Yes

### Important Notes
    -> UNIQUE prevents duplicate values.
    -> A table can have multiple UNIQUE constraints.
    -> NULL values are generally allowed.

### Interview Point

    Q. Does UNIQUE allow NULL values?
    Ans. Yes

    Q. Can duplicate values exist in a UNIQUE column?
    Ans. No

---

## 3. PRIMARY KEY Constraint
        -> PRIMARY KEY uniquely identifies each row in a table.
        -> It is a combination of:
            NOT NULL + UNIQUE

### Syntax
    column_name datatype PRIMARY KEY

### Example
    CREATE TABLE employee(
        emp_id INT PRIMARY KEY,
        emp_name VARCHAR(50)
    );

### Valid Insert
    INSERT INTO employee VALUES(101,'ARSHAD');

### Invalid Inserts
    INSERT INTO employee VALUES(101,'AMIR');
    INSERT INTO employee VALUES(NULL,'RAHUL');

### Oracle vs MySQL vs PostgreSQL
    Feature                 Oracle      MySQL       PostgreSQL

    Duplicate Values        No          No          No
    NULL Allowed            No          No          No

### Important Notes
    -> Every table should have a PRIMARY KEY.
    -> Only one PRIMARY KEY can exist per table.
    -> PRIMARY KEY automatically creates uniqueness.

### Interview Point

    Q. How many PRIMARY KEY constraints can a table have?
    Ans. Only one

    Q. Can PRIMARY KEY contain NULL values?
    Ans. No

## Composite Primary Key
    -> A PRIMARY KEY created using multiple columns is called a Composite
    Primary Key.

### Example
    CREATE TABLE student_course(
        student_id INT,
        course_id INT,
        PRIMARY KEY(student_id,course_id)
    );

### Valid Inserts
    (101,1)
    (101,2)

### Invalid Insert
    (101,1)

### Important Notes
    -> Combination must be unique.
    -> Individual column values may repeat.

---

## 4. FOREIGN KEY Constraint
    
    -> FOREIGN KEY creates a relationship between two tables.
    -> Child table references Parent table.

### Parent Table
    CREATE TABLE department(
        dept_id INT PRIMARY KEY,
        dept_name VARCHAR(50)
    );

### Child Table
    CREATE TABLE employee(
        emp_id INT PRIMARY KEY,
        emp_name VARCHAR(50),
        dept_id INT,
        FOREIGN KEY(dept_id) REFERENCES department(dept_id)
    );

### Valid Insert
    INSERT INTO department VALUES(10,'HR');
    INSERT INTO employee VALUES(101,'ARSHAD',10);
    
### Invalid Insert
    INSERT INTO employee VALUES(102,'AMIR',99);
    
### Oracle vs MySQL vs PostgreSQL

    Feature                 Oracle      MySQL       PostgreSQL

    Supported               Yes         Yes         Yes
    Maintains Relation      Yes         Yes         Yes

### Important Notes
    -> Parent value must exist before inserting child value.
    -> Prevents orphan records.
    -> Improves data consistency.

### Interview Point

    Q. What is the purpose of FOREIGN KEY?
    Ans. To establish a relationship between two tables.

    Q. Which table contains FOREIGN KEY?
    Ans. Child table.

---

## 5. CHECK Constraint

    -> CHECK restricts values based on a condition.

### Syntax
    column_name datatype CHECK(condition)

### Example
    CREATE TABLE employee(
        emp_id INT,
        age INT CHECK(age >= 18)
    );

### Valid Insert
    INSERT INTO employee VALUES(101,25);

### Invalid Insert
    INSERT INTO employee VALUES(102,15);

### Oracle vs MySQL vs PostgreSQL

    Feature                 Oracle      MySQL       PostgreSQL

    Supported               Yes         Yes         Yes

### Important Notes
    -> CHECK enforces business rules.
    -> Multiple CHECK constraints can be used.

### Interview Point

    Q. What is the purpose of CHECK constraint?
    Ans. To restrict values based on a condition.

---

## 6. DEFAULT Constraint

    -> DEFAULT provides a value automatically if no value is supplied.

### Syntax
    column_name datatype DEFAULT value

### Example
    CREATE TABLE employee(
        emp_id INT,
        city VARCHAR(30) DEFAULT 'PUNE'
    );

### Insert
    INSERT INTO employee(emp_id) VALUES(101);

### Result
    emp_id      city

    101         PUNE

### Oracle vs MySQL vs PostgreSQL
    Feature                 Oracle      MySQL       PostgreSQL

    Supported               Yes         Yes         Yes

### Important Notes
    -> DEFAULT reduces manual data entry.
    -> Applied only when no value is provided.

### Interview Point

    Q. When is DEFAULT value applied?
    Ans. When no value is supplied during insertion.

## Difference Between PRIMARY KEY and UNIQUE
        PRIMARY KEY                         UNIQUE
    ->    No NULL values                      Allows NULL values
    ->    Only one per table                  Multiple allowed
    ->    Uniquely identifies row             Prevents duplicates
    ->    Automatically NOT NULL              NULL generally allowed

    ---

## Difference Between PRIMARY KEY and FOREIGN KEY

        PRIMARY KEY                         FOREIGN KEY

    ->    Identifies records                  Creates relationships
    ->    Must be unique                      Can contain duplicates
    ->    Cannot be NULL                      Can contain NULL
    ->    Exists in parent table              Exists in child table
    
---

## Constraint Creation Example
    CREATE TABLE employee(
        emp_id INT PRIMARY KEY,
        emp_name VARCHAR(50) NOT NULL,
        email VARCHAR(100) UNIQUE,
        age INT CHECK(age >= 18),
        city VARCHAR(30) DEFAULT 'PUNE',
        dept_id INT,
        FOREIGN KEY(dept_id) REFERENCES department(dept_id)
    );
    
---

## Key Concepts
    Keys are used to identify records uniquely and establish relationships
    between tables.

### Types of Keys
1. Super Key
2. Candidate Key
3. Primary Key
4. Alternate Key
5. Composite Key
6. Foreign Key

#### 1. Super Key
    -> A Super Key is a column or combination of columns that can uniquely
       identify a row.

    Example:
        Employee Table :
        emp_id    email               mobile
        101       a@gmail.com         9876543210

    Possible Super Keys:
        emp_id
        email
        mobile
        emp_id + email (combinations)

    Important Notes
        -> Can contain extra columns.
        -> Multiple Super Keys can exist in a table.

#### 2. Candidate Key
    -> A Candidate Key is the minimum set of columns required to uniquely
       identify a row.

    Example:
        emp_id
        email
        mobile

    All three can uniquely identify a record.
    Therefore:
        emp_id
        email
        mobile
    are Candidate Keys.

    Important Notes
        -> Candidate Key is a minimal Super Key.
        -> No unnecessary columns are present.

#### 3. Primary Key
    -> A Candidate Key selected to uniquely identify records is called a
       Primary Key.

    Example:
        emp_id

    Important Notes
        -> Only one Primary Key per table.
        -> Cannot contain NULL values.
        -> Cannot contain duplicate values.

#### 4. Alternate Key
    -> Candidate Keys that are not selected as Primary Key are called
       Alternate Keys.

    Example:
        Candidate Keys:
            emp_id
            email
            mobile

        Primary Key:
            emp_id

        Alternate Keys:
            email
            mobile

#### 5. Composite Key
    -> A key formed using multiple columns is called a Composite Key.

    Example:
        student_id + course_id
        PRIMARY KEY(student_id, course_id)

    Important Notes
        -> Combination must be unique.
        -> Individual columns may contain duplicate values.

#### 6. Foreign Key
    -> A Foreign Key is a column that refers to the Primary Key of another
       table.
    Purpose
        -> Establish relationship between tables.
        -> Maintain referential integrity.

    Example:
        Department Table :
        dept_id     dept_name

        Employee Table :
        emp_id      emp_name      dept_id

        dept_id in Employee table references Department table.

## Summary

    NOT NULL
        Prevents NULL values

    UNIQUE
        Prevents duplicate values

    PRIMARY KEY
        NOT NULL + UNIQUE

    FOREIGN KEY
        Creates table relationships

    CHECK
        Restricts values based on conditions

    DEFAULT
        Provides automatic default values

---

## Most Asked Interview Questions

    Q. Difference between PRIMARY KEY and UNIQUE?
        Ans.-> PRIMARY KEY does not allow NULL values.
            -> UNIQUE allows NULL values.

    Q. Can a table have multiple PRIMARY KEY constraints?
        Ans.-> No, only one PRIMARY KEY.

    Q. Can a FOREIGN KEY contain duplicate values?
        Ans.-> Yes.

    Q. Can a FOREIGN KEY contain NULL values?
        Ans.-> Yes.

    Q. Which constraint creates relationships between tables?
        Ans.-> FOREIGN KEY.

    Q. Which constraint is a combination of UNIQUE and NOT NULL?
        Ans.-> PRIMARY KEY.
