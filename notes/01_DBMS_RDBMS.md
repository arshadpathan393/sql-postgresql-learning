Data :
    Data is a raw factor that describes the atrributes of an entity.
    Examples: Arshad, 25, Pune, 50000

Database :
    Database is a place where we store the data in organized way for easy retrival
    Examples: Oracle Database, MySQL Database, PostgreSQL Database

## DBMS (Database Management System)

DBMS is software used to store, manage, retrieve, and manipulate data in a database.

A DBMS acts as an interface between the user and the database.

### Features

* Data Storage
* Data Retrieval
* Data Security
* Authorization
* Data Management

### Basic Operations (CRUD)

* Create (Create/Insert)
* Read (Select)
* Update (Modify)
* Delete (Remove)

### Examples of DBMS

* Oracle Database
* MySQL
* PostgreSQL
* SQL Server

### Why do we need a DBMS?

Without a DBMS, data management becomes difficult and can lead to:

* Data redundancy
* Data inconsistency
* Security issues

A DBMS helps organize and control data efficiently.

What is DBMS?
Answer:
A DBMS (Database Management System) is software which is used to interact with data stored in
database for data manipulation using query language.
To manipulate the data we have to perform CRUD operations on database.

### Classification of DBMS
1. Flat File DBMS
2. Hierarchical DBMS
3. Network DBMS
4. Relational DBMS (RDBMS)

1. Flat File DBMS
    Here data is stored in terms of files and folders like how we store the data on different drives of computer
    Advantage :- Easy to store the data
    Disadvantage :- Data duplication

2. Hierarchical DBMS
    Data is stored in a tree-like structure.
    Company
    │
    ├── HR
    │   ├── Employee1
    │   └── Employee2
    │
    └── IT
        ├── Employee3
        └── Employee4
    
    Characteristics :-
        Parent → Child relationship
        One parent can have many children
        One child can have only one parent
    Advantage :- No data duplication
    Disadvantage :- Difficult to represent complex relationships (Time consuming)

3. Network DBMS
    Data is stored as a network. All data nodes are connected to each other
    Student
       ↕
    Course
       ↕
    Teacher
    Characteristics :-
        Many-to-many relationships possible
        More flexible than Hierarchical DBMS
    Advantage :- Less time consuming
    Disadvantage :- Complex structure

4. Relational DBMS (RDBMS)
    Data is stored in tables consisting of rows and columns.
    Example:
    EMP
        EMPNO	ENAME	DEPTNO
        7369	SMITH	20
        7499	ALLEN	30
    DEPT
        DEPTNO	DNAME
            20	RESEARCH
            30	SALES
    Characteristics :-
        Data stored in tables
        Relationships created using keys
        SQL is used to communicate with database
        Most widely used DBMS today
    Examples :- Oracle, MySQL, PostgreSQL, SQL Server
    
    Interview Question
    What type of DBMS is PostgreSQL?
    Answer: PostgreSQL is an RDBMS (Relational Database Management System) because it stores data in related tables and uses SQL for data manipulation.

## RDBMS (Relational Database Management System)

Definition :- RDBMS is a type of DBMS software in which we store data in the form of tables.
            We use Structured Query Language (SQL) to communicate with an RDBMS.

Characteristics of RDBMS :
1. Data is stored in tables: Table is a collection of related data organized in rows and columns.
Example:
EMP Table
EMPNO	ENAME	JOB
7369	SMITH	CLERK
7499	ALLEN	SALESMAN
2. Tables can be related: Multiple tables can be connected using key attributes.
Example:
EMP.DEPTNO
      ↓
DEPT.DEPTNO
This relationship allows data retrieval from multiple tables.
3. SQL is used to communicate with RDBMS
Examples:
SELECT * FROM emp;
INSERT INTO emp VALUES (...);
UPDATE emp SET sal = 3000 WHERE empno = 7369;
DELETE FROM emp WHERE empno = 7369;
Examples of RDBMS
1. Oracle
2. MySQL
3. PostgreSQL
4. SQL Server

Why RDBMS is preferred
-> Data is organized in tables.
-> Relationships can be maintained between tables.
-> Data redundancy can be reduced.
-> Data can be retrieved efficiently using SQL.

What is RDBMS?
Answer: 
RDBMS (Relational Database Management System) is a software and type of DBMS in which is used to interact with data in database for data manipulation using query language with relational model.
RDBMS follows the concept of E.F.Codd

### Table
    A table is a logical organization of data that consists of rows and columns.
    A table is used to store information about an entity.
    A table in a structure of rows and columns
    Example :
    EMP Table
        EMPNO	ENAME	JOB
        7369	SMITH	CLERK
        7499	ALLEN	SALESMAN
    Here:
        EMP is the table name.
    Characteristics of a Table :
    -> A table contains rows and columns.
    -> Each table has a unique name.
    -> A table stores related data.
    -> Data is organized in a structured format.

Interview Question
What is a table?
-> A table is a logical organization of related data arranged in structure rows and columns.

### Columns
    -> Columns are also known as Attributes or Fields.
    -> Columns represent the properties of an entity.
    -> Example
        EMP table columns: EMPNO, ENAME, JOB
    -> Here each column represents a specific property of an employee.

Interview Question
What is a column?
-> A column is an attribute or field that represents a property of an entity.

### Rows
    -> Rows are also known as Records or Tuples.
    -> A row represents all the properties of a single entity.
    -> Example
        EMP Table:
        7369 | SMITH | CLERK -> is one row (one employee record).
        7499 | ALLEN | SALESMAN- > is another row.

    -> Important Point
        Each row represents one complete record.
        Rows are stored horizontally in a table.

Interview Question
What is a row?
-> A row is a record or tuple that contains all the information about a single entity.

### Cell
    -> A cell is the intersection of a row and a column. It is the smallest unit in a table where data is stored.
    -> Example
        EMP Table
        EMPNO	ENAME	JOB
        7369	SMITH	CLERK
    -> The value:
        SMITH -> is a cell, because it lies at the intersection of: Row → Employee 7369 and Column → ENAME
    -> Important Point
        A cell stores a single value.
        According to E.F. Codd, data stored in a cell should be atomic (single-valued).

Interview Question
What is a cell?
-> A cell is the intersection of a row and a column and stores a single value.

### E.F.Codd Rules
    -> E.F. Codd is known as the Father of RDBMS.
    -> He proposed rules for storing and managing data in relational databases.
    
    Rules of E.F.Codd :- 

    Rule 1: Atomic Data
    
    According to E.F. Codd, the cell should be atomic in nature (single-valued) .
    ✅ Correct
        EMPNO	PHONE
        101	    9876543210
    ❌ Incorrect
    EMPNO	        PHONE
    101	    9876543210, 9988776655

    Rule 2: Data Can Be Stored in Multiple Tables
    -> According to E.F. Codd, data can be stored in multiple tables and relationships can be established between them using key attributes.
    -> Example:
        STUDENT Table
            Stu_Id	Name
            101	    Arshad
        SUBJECT Table
            Sub_Id	Stu_Id
            CS101	101
        Relationship: Stu_Id
    -> This reduces data redundancy.
    -> We should able to extablish relations between tables
    
    Rule3: Data should be stored in the form of tables only
    
    Rule4: Null should be independent of datatype 

### Schema
    -> Schema is a logical structure of database
    -> It contains tables, views, indexes, constraints etc.
    -> Example :
        HR Schema, Sales Schema

### Instance
    -> The data stored in database at a particular moment is called an instance.
    -> Example
        Emp table contains 14 rows today.
        Tommorrow it may contains 15 rows.

