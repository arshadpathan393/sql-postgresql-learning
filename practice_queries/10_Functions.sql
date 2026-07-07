-- HERE ALL PRACTICE QUERIES ARE WRITTEN FOR FUNCTIONS IN POSTGRESQL DATABASE
-- FUNCTIONS
--A. MULTI ROW FUNCTIONS
--1. COUNT()
SELECT COUNT(*) FROM emp1;
SELECT COUNT(ename) FROM emp1;
SELECT COUNT(comm) FROM emp1;

--2. SUM()
SELECT SUM(sal) FROM emp1;

--3. AVG()
SELECT AVG(sal) FROM emp1;
SELECT AVG(sal) FROM emp1 WHERE deptno = 30;

--4. MIN()
SELECT MIN(sal) FROM emp1;
SELECT MIN(sal),MIN(ename),MIN(hiredate) FROM emp1;

--5. MAX()
SELECT MAX(sal) FROM emp1;
SELECT MAX(sal), MAX(hiredate), MAX(ename) FROM emp1;

--QUERIES

Q--Display the total number of employees.
SELECT COUNT(ename) FROM emp1;
Q--Display the number of employees having a salary.
SELECT COUNT(ename) FROM emp1
WHERE sal>0 AND sal IS NOT NULL;
Q--Display the total salary of all employees.
SELECT SUM(sal) FROM emp1;
Q--Display the average salary.
SELECT AVG(sal) FROM emp1;
Q--Display the highest salary.
SELECT MAX(sal) FROM emp1;
Q--Display the lowest salary.
SELECT MIN(sal) FROM emp1;
Q--Display the difference between highest and lowest salary.
SELECT (MAX(sal)-MIN(sal)) AS diff FROM emp1;
Q--Display the total commission paid.
SELECT SUM(comm) FROM emp1;
Q--Display the average commission.
SELECT AVG(comm) FROM emp1;
Q--Display the total annual salary of all employees.
SELECT SUM(sal)*12 AS total_annual_sal FROM emp1;
Q--Find the number of employees working in department 10.
SELECT COUNT(ename) FROM emp1
WHERE deptno = 10;
Q--Find the total salary of employees in department 20.
SELECT SUM(sal) FROM emp1
WHERE deptno = 20;
Q--Find the average salary of employees in department 30.
SELECT AVG(sal) FROM emp1
WHERE deptno = 30;
Q--Find the highest salary among CLERKs.
SELECT MAX(sal) FROM emp1
WHERE job = 'CLERK';
Q--Find the lowest salary among MANAGERs.
SELECT MIN(sal) FROM emp1
WHERE job = 'MANAGER';
Q--Count employees who receive commission.
SELECT COUNT(comm) FROM emp1
WHERE comm>0;
Q--Count employees who do not receive commission.
SELECT COUNT(ename) FROM emp1
WHERE comm=0 OR comm IS NULL;
Q--Find the total salary of SALESMAN.
SELECT SUM(sal) FROM emp1
WHERE job = 'SALESMAN';
Q--Find the average salary of ANALYST.
SELECT AVG(sal) FROM emp1
WHERE job = 'ANALYST';
Q--Find the maximum commission.
SELECT MAX(comm) FROM emp1;
Q--Find the second highest salary using aggregate functions.
Q--Find the total salary of employees hired after 1982.
SELECT SUM(sal) FROM emp1
WHERE hiredate>'31-12-1982';
Q--Find the average salary of employees whose salary is greater than 2000.
SELECT AVG(sal) FROM emp1
WHERE sal>2000;
Q--Find the total salary of employees whose commission is not NULL.
SELECT SUM(sal) FROM emp1
WHERE comm IS NOT NULL;
Q--Find the number of employees whose name starts with 'S'.
SELECT COUNT(ename) FROM emp1
WHERE ename LIKE 'S%';
Q--Find the highest annual salary.
SELECT MAX(sal*12) FROM emp1;
Q--Find the minimum salary among employees who joined in 1981.
SELECT MIN(sal) FROM emp1
WHERE hiredate BETWEEN '01-01-1981' AND '31-12-1981';
Q--Find the average salary excluding employees with commission.
SELECT AVG(sal) FROM emp1
WHERE comm = 0 OR COMM IS NULL;
Q--Find the total salary of employees whose job is CLERK or ANALYST.
SELECT SUM(sal) FROM emp1
WHERE job IN ('CLERK','ANALYST');
Q--Find the total number of distinct jobs.
SELECT COUNT(DISTINCT job) FROM emp1;
Q--Find how many different departments have employees.
SELECT COUNT(DISTINCT deptno) FROM emp1;
Q--Find the total number of distinct salaries.
SELECT COUNT(DISTINCT sal) FROM emp1;
Q--Find the average of distinct salaries.
SELECT AVG(DISTINCT sal) FROM emp1;
Q--Find the sum of distinct salaries.
SELECT SUM(DISTINCT sal) FROM emp1;
Q--Find the total salary excluding NULL commissions.
SELECT SUM(sal) FROM emp1
WHERE comm IS NOT NULL;
Q--Find the total salary of employees whose manager is 7698.
SELECT SUM(sal) FROM emp1
WHERE mgr = 7698;
Q--Find the total salary of employees earning more than the average salary.
 --(Subquery - attempt later if not learned yet.)
SELECT SUM(sal) FROM emp1
WHERE sal >(SELECT AVG(sal) FROM emp1);
Q--Write a single query to display:
 --Total employees
 --Total salary
 --Average salary
 --Highest salary
 --Lowest salary
SELECT COUNT(*),SUM(sal),AVG(sal),MAX(sal),MIN(sal) FROM emp1;
Q--Find the salary range (MAX(sal) - MIN(sal)).
SELECT MAX(sal)-MIN(sal) as salary_range FROM emp1;
Q--Count employees who have commission and salary greater than 1500.
SELECT COUNT(*) FROM emp1
WHERE comm IS NOT NULL AND sal>1500;
Q--Find the total salary of employees whose names end with 'S'.
SELECT SUM(sal) FROM emp1
WHERE ename LIKE '%S'
Q--Find the average salary of employees hired before 01-JAN-1982.
SELECT AVG(sal) FROM emp1
WHERE hiredate <'1982-01-01'
----------------------------------------------------------------------------------------------
