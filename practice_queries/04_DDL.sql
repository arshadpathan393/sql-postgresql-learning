--HERE ALL PRACTICE QUERIES ARE WRITTEN FOR DDL (Data Definition Language) OPERATIONS

1.-- CREATE

    CREATE TABLE demo_cr_employee(
        emp_id INTEGER PRIMARY KEY,
        emp_name VARCHAR(20) NOT NULL,
        salary NUMERIC(10,2) NOT NULL,
        contact_no BIGINT UNIQUE,
        mgr_id INTEGER REFERENCES demo_cr_employee(emp_id),
        city VARCHAR(20) DEFAULT 'Pune'
    );
        
    --CREATEING DUPLICATE TABLE
    CREATE TABLE emp1 AS SELECT * FROM emp;

2.-- RENAME
    ALTER TABLE emp1 RENAME TO emp2;

3.-- DROP
    DROP TABLE fk_employee;

4.-- TRUNCATE
    TRUNCATE TABLE demo_pk;

5.-- ALTER
    -- ADD COLUMN
    ALTER TABLE demo_fk_emp
    ADD address VARCHAR(50);

    --MODIFY COLUMN
    ALTER TABLE demo_fk_emp
    ALTER COLUMN address TYPE CHAR(30);

    -- DROP COLUMN
    ALTER TABLE demo_fk_emp
    DROP COLUMN address;

    -- RENAME COLUMN
    ALTER TABLE demo_fk_emp
    RENAME COLUMN address TO post_add ;
    
    -- ADD CONSTRAINT
    ALTER TABLE demo_fk_emp
    ADD CONSTRAINT fk_dept
    FOREIGN KEY (dept_no)
    REFERENCES demo_fk_dept(dept_no);
    
    -- DROP CONSTRAINT
    ALTER TABLE demo_fk_emp
    DROP CONSTRAINT fk_dept;

    --SET NOT NULL CONSTRAINT
    ALTER TABLE demo_fk_emp
    ALTER COLUMN emp_name SET NOT NULL;

    -- DROP NOT NULL CONSTRAINT
    ALTER TABLE demo_fk_emp
    ALTER COLUMN emp_name DROP NOT NULL;

    -- SET DEFAULT VALUE
    ALTER TABLE demo_fk_emp
    ALTER COLUMN city SET DEFAULT 'Mumbai';
    
    -- DROP DEFAULT VALUE
    ALTER TABLE demo_fk_emp
    ALTER COLUMN city DROP DEFAULT;
