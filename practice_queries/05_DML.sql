--HERE ALL PRACTICE QUERIES ARE WRITTEN FOR DML (Data Manipulation Language) OPERATIONS

1.-- INSERT
    -- INSERTING SINGLE RECORD
        INSERT INTO demo_fk_emp
        VALUES (104, 'DEF', 50000, 'MUMBAI', 20);

        INSERT INTO demo_fk_emp (emp_id, emp_name, dept_no)
        VALUES (109, 'MPW', 10);

    -- INSERTING MULTIPLE RECORDS
        INSERT INTO demo_fk_emp
        VALUES 
        (105,'GHI','NAGPUR',20),
        (106,'JKL','NAGPUR',20),
        (107,'MON','NAGPUR',20),
        (108,'KMN','NAGPUR',20);

2. -- UPDATE
    -- UPDATING ALL RECORDS
    UPDATE demo_fk_emp
    SET ADD = 'PUNE';

    -- UPDATING SINGLE RECORD
    UPDATE demo_fk_emp
    SET ADD = 'MUMBAI'
    WHERE emp_id = 104;

5. -- DELETE
    -- DELETING ALL RECORDS
    DELETE FROM demo_fk_emp;

    -- DELETING SINGLE RECORD
    DELETE FROM demo_fk_emp
    WHERE emp_id = 104; 

    SELECT * FROM demo_fk_emp
