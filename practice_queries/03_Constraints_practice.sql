-- HERE ALL PRACTICE QUERIES ARE WRITTEN FOR CONSTRAINTS IN POSTGRESQL DATABASE

1. -- NOT NULL CONSTRAINT

CREATE TABLE demo_not_null(
	id INTEGER,
	name VARCHAR(10) NOT NULL
);

INSERT INTO demo_not_null VALUES(1,'A');
-- The above query will successfully insert the values into the table 
-- because the 'name' column has a value and it is not null.
INSERT INTO demo_not_null VALUES(2,'B');
-- The above query will successfully insert the values into the table
INSERT INTO demo_not_null VALUES(3);
-- The above query will fail to insert the values into the table
INSERT INTO demo_not_null VALUES(3,NULL);
-- The above query will fail to insert the values into the table

SELECT * FROM demo_not_null;

2. -- UNIQUE CONSTRAINT

CREATE TABLE demo_unique(
	id INTEGER,
	email VARCHAR(30) UNIQUE
);
INSERT INTO demo_unique VALUES(1,'abc@gmail.com' );
-- The above query will successfully insert the values into the table
INSERT INTO demo_unique VALUES(2,'def@gmail.com' );
-- The above query will successfully insert the values into the table
INSERT INTO demo_unique VALUES(3,'abc@gmail.com' );
-- The above query will fail to insert the values into the table

SELECT * FROM demo_unique;

CREATE TABLE demo_unique2(
	id INTEGER,
	name VARCHAR(10) NOT NULL,
	CONTACT INTEGER UNIQUE
);

INSERT INTO demo_unique2 VALUES(1,'ABC',9563214);
-- The above query will successfully insert the values into the table
INSERT INTO demo_unique2 VALUES(2,'DEF',9563214);
-- The above query will fail to insert the values into the table
INSERT INTO demo_unique2 VALUES(2,'DEF',NULL);
-- The above query will successfully insert the values into the table because 
-- the 'CONTACT' column is unique but it allows NULL values, and NULL is considered unique in SQL.
INSERT INTO demo_unique2 VALUES(3,'PQR',NULL);
-- The above query will successfully insert the values into the table because
-- the 'CONTACT' column is unique but it allows NULL values, and NULL is considered unique in SQL.
INSERT INTO demo_unique2 VALUES(4,NULL,5321562);
-- The above query will fail to insert the values into the table because
-- the 'name' column has a NOT NULL constraint, and it cannot accept NULL values.

SELECT * FROM demo_unique2;

3.-- PRIMARY KEY CONSTRAINT

CREATE TABLE demo_pk(
	id INTEGER PRIMARY KEY,
	name VARCHAR(10) NOT NULL,
	contact BIGINT UNIQUE 
);

INSERT INTO demo_pk VALUES(1,'A',123);
-- The above query will successfully insert the values into the table
INSERT INTO demo_pk VALUES(2,'A',NULL);
-- The above query will successfully insert the values into the table because
-- the 'contact' column is unique but it allows NULL values, and NULL is considered unique in SQL.
INSERT INTO demo_pk VALUES(3,'B',123);
-- The above query will fail to insert the values into the table because the 'id' column is a 
-- primary key and it cannot accept duplicate values.
INSERT INTO demo_pk VALUES(3,'C',NULL);
-- The above query will successfully insert the values into the table
INSERT INTO demo_pk VALUES(3,'D',567);
-- The above query will fail to insert the values into the table because the 'id' column is a 
-- primary key and it cannot accept duplicate values.
INSERT INTO demo_pk VALUES(4,'D',567);
-- The above query will successfully insert the values into the table
INSERT INTO demo_pk VALUES(NULL,'E',890);
-- The above query will fail to insert the values into the table because the 'id' column is a 
-- primary key and it cannot accept NULL values.
INSERT INTO demo_pk VALUES(5,NULL,890);
-- The above query will fail to insert the values into the table because the 'name' column 
--has a NOT NULL constraint.
SELECT * FROM demo_pk;

-- COMPOSITE PRIMARY KEY CONSTRAINT

CREATE TABLE demo_cpk(
	id INTEGER,
	course_id INTEGER,
	PRIMARY KEY (id,course_id)
);
INSERT INTO demo_cpk VALUES(1,101);
-- The above query will successfully insert the values into the table
INSERT INTO demo_cpk VALUES(1,102);
-- The above query will successfully insert the values into the table
INSERT INTO demo_cpk VALUES(1,101);
-- The above query will fail to insert the values into the table because 
-- the combination of 'id' and 'course_id' is already present in the table.
INSERT INTO demo_cpk VALUES(NULL,103);
-- The above query will fail to insert the values into the table because
-- the 'id' column is part of the composite primary key and it cannot accept NULL values
SELECT * FROM demo_cpk;

4. -- CHECK CONSTRAINT

CREATE TABLE demo_check(
 id INT PRIMARY KEY,
 name VARCHAR(20),
 age INT CHECK(age >18)
);

INSERT INTO demo_check VALUES(1,'A',20);
-- The above query will successfully insert the values into the table
INSERT INTO demo_check VALUES(2,'B',18);
-- The above query will fail to insert the values into the table because
-- the 'age' column has a CHECK constraint that requires the value to be greater than 18.
INSERT INTO demo_check VALUES(3,'C',25);
-- The above query will successfully insert the values into the table
INSERT INTO demo_check VALUES(4,'D',NULL);
-- The above query will successfully insert the values into the table because
-- the 'age' column has a CHECK constraint that allows NULL values, and NULL is considered
-- valid for the CHECK constraint.
SELECT * FROM demo_check;

5. -- DEFAULT CONSTRAINT

CREATE TABLE demo_default(
 id INT PRIMARY KEY,
 name VARCHAR(20) NOT NULL,
 city VARCHAR(20) DEFAULT 'PUNE'
);

INSERT INTO demo_default VALUES(1,'A','MUMBAI');
-- The above query will successfully insert the values into the table
INSERT INTO demo_default VALUES(2,'B');
-- The above query will successfully insert the values into the table because
-- the 'city' column has a DEFAULT constraint that assigns the value 'PUNE' 
-- when no value is provided.
INSERT INTO demo_default VALUES(3,'C',NULL);
-- The above query will successfully insert the values into the table because
-- the 'city' column has a DEFAULT constraint that assigns the value 'PUNE' 
-- when no value is provided.

SELECT * FROM demo_default;

6. -- FOREIGN KEY CONSTRAINT

CREATE TABLE demo_fk_dept(
 dept_no INT PRIMARY KEY,
 dept_name VARCHAR(20) NOT NULL
);

CREATE TABLE demo_fk_emp(
 emp_id INT PRIMARY KEY,
 emp_name VARCHAR(20) NOT NULL,
 dept_no INT,
 FOREIGN KEY (dept_no) REFERENCES demo_fk_dept(dept_no)
);
INSERT INTO demo_fk_dept VALUES(10,'HR');
-- The above query will successfully insert the values into the table
INSERT INTO demo_fk_dept VALUES(20,'IT');
-- The above query will successfully insert the values into the table
INSERT INTO demo_fk_emp VALUES(101,'ABC',10);
-- The above query will successfully insert the values into the table
INSERT INTO demo_fk_emp VALUES(102,'PQR',20);
-- The above query will successfully insert the values into the table
INSERT INTO demo_fk_emp VALUES(103,'XYZ',30);
-- The above query will fail to insert the values into the table because
-- the 'dept_no' value 30 does not exist in the referenced table 'demo_fk_dept'.
INSERT INTO demo_fk_emp VALUES(104,'LMN',NULL);
-- The above query will successfully insert the values into the table because
-- the 'dept_no' column allows NULL values, and NULL is considered valid 
-- for the foreign key constraint.

SELECT * FROM demo_fk_dept;
SELECT * FROM demo_fk_emp;

CREATE TABLE fk_department (
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(50)
);
    
 CREATE TABLE fk_employee (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    dept_id INT,
    CONSTRAINT fk_emp_dept
    FOREIGN KEY (dept_id)
    REFERENCES fk_department(dept_id)
);

SELECT * FROM fk_department;
SELECT * FROM fk_employee;

CREATE TABLE fk_department2 (
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(50)
);
    
 CREATE TABLE fk_employee2 (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    dept_id INT,
    CONSTRAINT fk_emp_dept
    FOREIGN KEY (dept_id)
    REFERENCES fk_department2(dept_id)
	ON UPDATE CASCADE
);

SELECT * FROM fk_department2;
SELECT * FROM fk_employee2;

CREATE TABLE fk_department3 (
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(50)
);
    
 CREATE TABLE fk_employee3 (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    dept_id INT,
    CONSTRAINT fk_emp_dept
    FOREIGN KEY (dept_id)
    REFERENCES fk_department3(dept_id)
	ON UPDATE CASCADE
);

CREATE TABLE fk_employee4 (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    dept_id INT,
    CONSTRAINT fk_emp_dept
    FOREIGN KEY (dept_id)
    REFERENCES fk_department3(dept_id)
	ON DELETE CASCADE
	ON UPDATE CASCADE
);

CREATE TABLE fk_employee5 (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    dept_id INT,
    CONSTRAINT fk_emp_dept
    FOREIGN KEY (dept_id)
    REFERENCES fk_department3(dept_id)
	ON DELETE CASCADE
	ON UPDATE CASCADE
	DEFERRABLE INITIALLY DEFERRED
);