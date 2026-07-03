-- HERE ALL PRACTICE QUERIES ARE WRITTEN FOR DCL (Data Control Language) OPERATIONS

--CHECK CURRENT USER
SELECT CURRENT_USER;

--CREATE NEW USER
CREATE USER arshad
WITH PASSWORD 'Arshad@123';

--VIEW ALL USERS

SELECT * FROM pg_user;

SELECT rolname
FROM pg_roles
ORDER BY rolname;

SELECT rolname, rolcanlogin
FROM pg_roles
WHERE rolname = 'arshad';

Servers
├── PostgreSQL (postgres)
└── Arshad (arshad)
    -- Open the Query Tool from the Arshad server to execute SQL as that user.

SELECT current_user;

-- GRANTING PRIVILEGES

GRANT SELECT ON emp1 TO arshad; 
    -- Granting SELECT privilege on emp1 table from user postgres to user arshad

SELECT * from emp1; 
    -- from user arshad

GRANT SELECT,INSERT,UPDATE
ON emp1
TO arshad;
    -- Granting SELECT, INSERT, and UPDATE privileges on emp1 table 
    -- from user postgres to user arshad

SELECT * from emp1;

INSERT INTO emp1 
VALUES(8888,'BADSHAH','CEO',7839,'01-03-2026',6000,8000,40);
    -- from user arshad

UPDATE emp1
SET sal = 7000
WHERE empno = 8888;
    -- from user arshad

GRANT ALL PRIVILEGES
ON emp1
TO arshad;
    -- Granting ALL privileges on emp1 table from user postgres to user arshad

INSERT INTO emp1 
VALUES(9999,'SHAHENSHAH','MANAGER',8888,'2026-05-20',6000,2000,30);

UPDATE emp1
SET sal = 6500
WHERE empno = 9999;

DELETE FROM emp1
WHERE empno = 9999;

DELETE FROM emp1
WHERE empno = 8888;

SELECT * from emp1;
    -- performed all operations (SELECT, INSERT, UPDATE, DELETE) on emp1 table 
    -- from user arshad after granting ALL privileges.

GRANT ALL PRIVILEGES
ON ALL TABLES IN SCHEMA public 
TO arshad;
    -- Granting ALL privileges on all tables in public schema from user postgres to user arshad


--- REVOKING PRIVILEGES
REVOKE DELETE
ON emp1
FROM arshad;
    -- Revoking DELETE privilege on emp1 table from user arshad

DELETE FROM emp1
WHERE ename = 'ALLEN';
    -- from user arshad, this will give an error as DELETE privilege is revoked

REVOKE INSERT,UPDATE
ON emp1
FROM arshad;
    -- Revoking INSERT and UPDATE privileges on emp1 table from user arshad

UPDATE emp1
SET sal = 6500
WHERE empno = 7369;
    -- from user arshad, this will give an error as UPDATE privilege is revoked

REVOKE ALL PRIVILEGES
ON emp1
FROM arshad;
    -- Revoking ALL privileges on emp1 table from user arshad

REVOKE ALL PRIVILEGES 
ON ALL TABLES IN SCHEMA public 
FROM arshad;
    -- Revoking ALL privileges on all tables in public schema from user arshad


-- DROP USER
DROP OWNED BY arshad;
    -- Dropping all objects owned by user arshad
DROP USER arshad;
    -- Dropping user arshad from the database


-- If company_db is only a pgAdmin Server Connection
-- Right-click company_db in the left panel and choose:
-- Delete/Remove Server
