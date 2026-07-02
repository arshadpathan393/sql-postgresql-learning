--HERE ALL PRACTICE QUERIES ARE WRITTEN FOR DQL (Data Query Language) OPERATIONS

-- SELECT *
SELECT * FROM emp1;

SELECT * FROM dept;

SELECT * FROM salgrade;

-- SELECT SPECIFIC COLUMNS
SELECT empno,ename,sal FROM emp1;

SELECT deptno,dname
FROM dept;

-- SELECT SPECIFIC COLUMNS WITH WHERE CLAUSE
SELECT empno,ename,sal 
FROM emp1
WHERE deptno = 10;

SELECT empno,ename,sal,deptno 
FROM emp1
WHERE sal >= 5000;

-- ALIASING COLUMNS
-- WITH 'AS' KEYWORD
SELECT empno,ename AS employee_name 
FROM emp1;
-- WITHOUT 'AS' KEYWORD
SELECT empno,ename employee_name 
FROM emp1;

-- DISTINCT KEYWORD
SELECT DISTINCT deptno 
FROM emp1;

SELECT DISTINCT deptno,sal 
FROM emp1;

SELECT DISTINCT job,deptno 
FROM emp1;

-- DUAL TABLE
SELECT CURRENT_DATE;

SELECT 10*25;


