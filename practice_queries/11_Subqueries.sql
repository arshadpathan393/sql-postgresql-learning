-- HERE ALL PRACTICE QUERIES ARE WRITTEN FOR SUBQURIES IN POSTGRESQL DATABASE
--EXAMPLES
-- INSIDE WHERE
SELECT ename,sal FROM emp1
WHERE sal >(
	SELECT AVG(sal) FROM emp1
);

-- INSIDE SELECT
SELECT ename,
		(SELECT dname FROM dept
		WHERE dept.deptno=emp1.deptno) 
FROM emp1;

-- INSIDE FROM
SELECT * FROM 
	(SELECT * FROM emp1);

-- INSIDE HAVING
SELECT deptno,AVG(sal) FROM emp1
GROUP BY deptno
HAVING AVG(sal)>(SELECT AVG(sal) FROM emp1); 

-- SINGAL ROW SUBQUERY
--Find employees earning more than the average salary.
SELECT empno,ename,sal FROM emp1
WHERE sal >(SELECT AVG(sal) FROM emp1);
--Find employees working in the SALES department.
SELECT empno,ename,deptno FROM emp1
WHERE deptno = 
(SELECT deptno FROM dept 
WHERE dname = 'SALES'
);
--Find employees earning the highest salary.
SELECT empno,ename FROM emp1
WHERE sal = 
(SELECT MAX(sal) FROM emp1
);
--Find employees earning the minimum salary.
SELECT empno,ename FROM emp1
WHERE sal = 
(SELECT MIN(sal) FROM emp1
);
--Find employees hired after BLAKE.
SELECT empno,ename FROM emp1
WHERE hiredate > 
(SELECT hiredate FROM emp1
WHERE ename = 'BLAKE'
);
--Find employees earning more than SMITH.
SELECT empno,ename FROM emp1
WHERE sal > 
(SELECT sal FROM emp1
WHERE ename = 'SMITH'
);
--Find employees hired before KING.
SELECT empno,ename FROM emp1
WHERE hiredate < 
(SELECT hiredate FROM emp1
WHERE ename = 'KING'
);
--Find employees working in ACCOUNTING department.
SELECT empno,ename,deptno FROM emp1
WHERE deptno = 
(SELECT deptno FROM dept
WHERE dname = 'ACCOUNTING'
);

-- MULTIPLE ROW SUBQUERY
--Find employees working in the SALES department.
SELECT empno,ename,deptno FROM emp1
WHERE deptno IN
(SELECT deptno FROM dept
 WHERE dname = 'SALES'
) ;
--Find employees working in ACCOUNTING or SALES departments.
SELECT empno,ename,deptno FROM emp1
WHERE deptno IN
(SELECT deptno FROM dept
 WHERE dname IN('SALES','ACCOUNTING') 
);
--Find employees whose salary is equal to any salary of Department 30.
SELECT empno,ename,deptno,sal FROM emp1
WHERE sal IN
(SELECT sal FROM emp1
 WHERE deptno = 30 
);
--Find employees who are not working in Department SALES.
SELECT empno,ename,deptno FROM emp1
WHERE deptno NOT IN 
(SELECT deptno FROM dept
 WHERE dname = 'SALES'
);
--Find employees earning more than ANY employee of Department 30.
SELECT empno,ename,sal FROM emp1
WHERE sal > ANY 
(SELECT sal FROM emp1
 WHERE deptno = 30
);
--Find employees earning more than ALL employees of Department 30.
SELECT empno,ename,sal FROM emp1
WHERE sal > ALL 
(SELECT sal FROM emp1
 WHERE deptno = 30
);

-- CORRELATED SUBQUERIES
--EXISTS
SELECT * FROM dept d
WHERE EXISTS (SELECT deptno FROM emp1 e 
 WHERE d.deptno = e.deptno);
--NOT EXISTS
SELECT * FROM dept d
WHERE NOT EXISTS
(SELECT deptno FROM emp1 e 
 WHERE d.deptno = e.deptno);
--Find employees earning more than the average salary of their department.
SELECT empno,ename,sal FROM emp1 e1
WHERE sal >
(SELECT AVG(sal) FROM emp1 e2 
 WHERE e1.deptno = e2.deptno);
--Find employees who earn the highest salary in their department.
SELECT empno,ename,sal,deptno FROM emp1 e1
WHERE SAL =
(SELECT MAX(sal) FROM emp1 e2 
 WHERE e1.deptno = e2.deptno);
--Find employees hired first in their department.
SELECT empno,ename,hiredate FROM emp1 e1
WHERE hiredate =
(SELECT MIN(hiredate) FROM emp1 e2 
 WHERE e1.deptno = e2.deptno);
--Find departments having employees.
SELECT deptno,dname FROM dept d
WHERE EXISTS
(SELECT 1 FROM emp e
WHERE d.deptno = e.deptno)
--Find departments having no employees.
SELECT deptno,dname FROM dept d
WHERE NOT EXISTS
(SELECT 1 FROM emp e
WHERE d.deptno = e.deptno)
--Find Employees Earning Above Department Average
SELECT empno,ename,sal,deptno FROM emp1 e1
WHERE sal >(
SELECT AVG(sal) FROM emp1 e2
WHERE e1.deptno = e2.deptno
);
--Find Highest Paid Employee in Every Department
SELECT empno,ename,sal,deptno FROM emp1 e1
WHERE sal IN (
SELECT MAX(sal) FROM emp1 e2
WHERE e1.deptno = e2.deptno
GROUP BY deptno
);

-- SCALAR SUBQUERIES
--Display employee name along with the company average salary.
SELECT empno, 
		(SELECT AVG(sal) FROM emp1) AS avg_sal
FROM emp1;
--Display employee name along with total number of employees.
SELECT ename, 
		(SELECT COUNT(empno) FROM emp1) AS no_of_emp
FROM emp1;

-- MULTIPLE COLUMN SUBQUERIES
--Find employees whose salary and department are the highest in their department.
SELECT * FROM emp1
WHERE (deptno,sal) IN 
(SELECT deptno,MAX(sal) FROM emp1
GROUP BY deptno);

-- NESTED SUBQUERIES
--Find employees working in the SALES department.
SELECT ename FROM emp
WHERE deptno IN
(SELECT deptno FROM dept
 WHERE loc IN (SELECT loc FROM dept
 WHERE dname='SALES')
 );

 -- QUERIES
--Find employees earning more than SMITH.
SELECT empno,ename,sal FROM emp1
WHERE sal >(
	SELECT sal FROM emp1
	WHERE UPPER(ename) = 'SMITH'
);
--Find employees earning less than ALLEN.
SELECT empno,ename,sal FROM emp1
WHERE sal < (
	SELECT sal FROM emp1
	WHERE UPPER(ename) = 'ALLEN'
);
--Find employees earning the same salary as SCOTT.
SELECT empno,ename,sal FROM emp1
WHERE sal = (
	SELECT sal FROM emp1
	WHERE UPPER(ename) = 'SCOTT'
);
--Find employees working in the same department as SMITH.
SELECT empno,ename,deptno FROM emp1
WHERE deptno = (
	SELECT deptno FROM emp1
	WHERE UPPER(ename) = 'SMITH'
);
--Find employees having the same job as MARTIN.
SELECT empno,ename,job FROM emp1
WHERE job = (
	SELECT job FROM emp1
	WHERE UPPER(ename) = 'MARTIN'
);
--Find employees hired before KING.
SELECT empno,ename,hiredate FROM emp1
WHERE hiredate < (
	SELECT hiredate FROM emp1
	WHERE UPPER(ename) = 'KING'
);
--Find employees hired after JONES.
SELECT empno,ename,hiredate FROM emp1
WHERE hiredate > (
	SELECT hiredate FROM emp1
	WHERE UPPER(ename) = 'JONES'
);
--Find employees whose manager is the same as SMITH.
SELECT empno,ename,mgr FROM emp1
WHERE mgr = (
	SELECT mgr FROM emp1
	WHERE UPPER(ename) = 'SMITH'
);
--Find employees not working in the same department as SMITH.
SELECT empno,ename,deptno FROM emp1
WHERE deptno <> (
	SELECT deptno FROM emp1
	WHERE UPPER(ename) = 'SMITH'
);
--Find employees whose commission is greater than ALLEN's commission.
SELECT empno,ename,comm FROM emp1
WHERE comm > (
	SELECT comm FROM emp1
	WHERE UPPER(ename) = 'ALLEN' AND comm IS NOT NULL
);
--Find employees working in departments where MANAGERs work.
SELECT empno,ename,deptno FROM emp1
WHERE deptno IN (
	SELECT DISTINCT deptno FROM emp1
	WHERE job = 'MANAGER'
);
--Find employees having the same job as any employee in department 30.
SELECT empno,ename,job FROM emp1
WHERE job IN (
	SELECT DISTINCT job FROM emp1
	WHERE deptno = 30
);
--Find employees whose salary matches any SALESMAN.
SELECT empno,ename,sal FROM emp1
WHERE sal IN (
	SELECT DISTINCT sal FROM emp1
	WHERE UPPER(job) = 'SALESMAN'
);
--Find employees hired on the same date as any CLERK.
SELECT empno,ename,hiredate FROM emp1
WHERE hiredate IN (
	SELECT DISTINCT hiredate FROM emp1
	WHERE UPPER(job) = 'CLERK'
);
--Find employees not working in departments where CLERKs work.
SELECT empno,ename,deptno FROM emp1
WHERE deptno NOT IN (
	SELECT DISTINCT deptno FROM emp1
	WHERE UPPER(job) <> 'CLERK'
	AND deptno IS NOT NULL
);
--Find employees whose job is not held by employees in department 10.
SELECT empno,ename,job,deptno FROM emp1
WHERE job NOT IN (
	SELECT DISTINCT job FROM emp1
	WHERE deptno = 10
);
--Find employees earning more than any CLERK.
SELECT empno,ename,sal,job FROM emp1
WHERE SAL > ANY (
	SELECT sal FROM emp1
	WHERE job = 'CLERK'
);
--Find employees earning less than any MANAGER.
SELECT empno,ename,sal,job FROM emp1
WHERE SAL < ANY (
	SELECT sal FROM emp1
	WHERE job = 'MANAGER'
);
--Find employees earning more than all CLERKs.
SELECT empno,ename,sal,job FROM emp1
WHERE SAL > ALL (
	SELECT sal FROM emp1
	WHERE job = 'CLERK'
);
--Find employees earning less than all MANAGERs.
SELECT empno,ename,sal,job FROM emp1
WHERE SAL < ALL (
	SELECT sal FROM emp1
	WHERE job = 'MANAGER'
);
--Display departments that have employees.
SELECT deptno,dname FROM dept
WHERE deptno IN (
	SELECT deptno FROM emp1
	WHERE empno <> 0 OR empno IS NOT NULL
);
--Display employees only if department 10 exists.
SELECT empno,ename,deptno FROM emp1
WHERE EXISTS (
	SELECT 1 FROM emp1
	WHERE deptno = 10
);
--Display departments without employees.
SELECT deptno,dname FROM dept d
WHERE NOT EXISTS (
	SELECT 1 FROM emp1 e
	WHERE d.deptno = e.deptno
);
--Display employees only if department 50 does not exist.
SELECT empno,ename,deptno FROM emp1 e
WHERE NOT EXISTS (
	SELECT 1 FROM dept d
	WHERE deptno = 50
);
--Display employee name along with company average salary.
SELECT empno,ename,
	(SELECT AVG(sal) FROM emp1) AS avg_sal 
FROM emp1;
--Display employee name along with company maximum salary.
SELECT empno,ename,
	(SELECT MAX(sal) FROM emp1) AS avg_sal 
FROM emp1;
--Display employee name along with company minimum salary.
SELECT empno,ename,
	(SELECT MIN(sal) FROM emp1) AS avg_sal 
FROM emp1;
--Find employees reporting to the manager of JONES.
SELECT empno,ename FROM emp1
WHERE mgr IN (
	SELECT mgr FROM emp1
	WHERE ename = 'JONES'
);
--Find employees working in the department of the highest-paid employee.
SELECT empno,ename,deptno FROM emp1
WHERE deptno IN (
	SELECT deptno FROM emp1
	WHERE sal =
	(SELECT MAX(sal) FROM emp1)
);
--Find employees earning more than the employee with employee number 7566.
SELECT empno,ename,deptno FROM emp1
WHERE sal > (
	SELECT sal FROM emp1
	WHERE empno = 7566
);
--Find employees managed by the same manager as ALLEN.
SELECT empno,ename,mgr FROM emp1
WHERE mgr = (
	SELECT empno FROM emp1
	WHERE UPPER(ename) = 'ALLEN'
);
--Find employees whose job differs from SCOTT's.
SELECT empno,ename,job FROM emp1
WHERE job NOT IN (
	SELECT job FROM emp1
	WHERE UPPER(ename) = 'SCOTT'
);
--Find employees who earn the minimum salary without using MIN().
SELECT empno,ename,sal FROM emp1
WHERE sal = (
	SELECT DISTINCT sal FROM emp1 ORDER BY sal ASC LIMIT 1
);
OR
SELECT e1.empno, e1.ename, e1.sal
FROM emp1 e1
WHERE NOT EXISTS (
    SELECT 1 
    FROM emp1 e2 
    WHERE e2.sal < e1.sal
);
--Find employees whose hire date is the earliest without using MIN().
SELECT empno,ename,hiredate FROM emp1
WHERE hiredate = (
	SELECT DISTINCT hiredate FROM emp1 ORDER BY hiredate ASC LIMIT 1
);
OR
SELECT e1.empno, e1.ename, e1.hiredate
FROM emp1 e1
WHERE NOT EXISTS (
    SELECT 1 
    FROM emp1 e2 
    WHERE e2.hiredate < e1.hiredate
);
--Display employees whose department name ends with 'S'.
SELECT empno,ename,deptno FROM emp1
WHERE deptno IN(
	SELECT deptno FROM dept
	WHERE UPPER(SUBSTR(dname,-1,1)) = 'S'
);
OR
SELECT empno,ename,deptno FROM emp1
WHERE deptno IN(
	SELECT deptno FROM dept
	WHERE UPPER(RIGHT(dname,1)) = 'S'
);
OR
SELECT empno,ename,deptno FROM emp1
WHERE deptno IN(
	SELECT deptno FROM dept
	WHERE UPPER(dname) LIKE '%S'
);
--Display the department name of all employees who are reporting to BLAKE.
SELECT deptno,dname FROM dept
WHERE deptno IN(
	SELECT deptno FROM emp1
	WHERE mgr = (
		SELECT empno FROM emp1 
		WHERE ename = 'BLAKE')
);
--Display the hire date and job of all employees working for the SALES department.
SELECT empno,ename,hiredate,job FROM emp1
WHERE deptno IN(
	SELECT DISTINCT deptno FROM dept
	WHERE dname = 'SALES'
);
--Display the last employee record with 25% hike in salary
SELECT empno,ename,(sal+sal*0.25) as inc_sal FROM emp1
WHERE hiredate IN(
	SELECT MAX(hiredate) FROM emp1
);
--Display the maximum salary of the SALES department.
SELECT MAX(sal) FROM emp1
WHERE deptno IN(
	SELECT DISTINCT deptno FROM dept
	WHERE dname = 'SALES'
);
--Display all employees whose name starts with 'S' and whose salary is greater than ALLEN and less than FORD.
SELECT empno,ename,sal FROM emp1
WHERE ename LIKE 'S%' AND sal >(
	SELECT sal FROM emp1
	WHERE UPPER(ename) = 'ALLEN'
)
AND sal <(
	SELECT sal FROM emp1
	WHERE UPPER(ename) = 'FORD'
);
OR
SELECT empno,ename,sal FROM emp1
WHERE UPPER(SUBSTR(ename,1,1)) = 'S' AND sal >(
	SELECT sal FROM emp1
	WHERE UPPER(ename) = 'ALLEN'
)
AND sal <(
	SELECT sal FROM emp1
	WHERE UPPER(ename) = 'FORD'
); 
--Display all employees who were joined after BLAKE.
SELECT empno,ename,hiredate FROM emp1
WHERE hiredate >(
	SELECT hiredate FROM emp1
	WHERE ename = 'BLAKE'
);
--Display the department names that have CLERKs in them.
SELECT deptno,dname FROM dept
WHERE deptno IN (
	SELECT deptno FROM emp1
	WHERE job = 'CLERK'
);
--Display all employees whose salary is greater than the average salary of department 30.
SELECT empno,ename,deptno,sal FROM emp1
WHERE sal >(
	SELECT AVG(sal) FROM emp1
	WHERE deptno = 30
);
--Display the location of all departments that have employees who joined in the year 1981.
SELECT deptno,dname,loc FROM dept
WHERE deptno IN (
	SELECT deptno FROM emp1
	WHERE hiredate BETWEEN '01-JAN-1981' AND '31-DEC-1981'
);
OR
SELECT deptno,dname,loc FROM dept
WHERE deptno IN (
	SELECT deptno FROM emp1
	WHERE TO_CHAR(hiredate,'yyyy') = '1981'
);
OR
SELECT deptno, dname, loc FROM dept
WHERE deptno IN (
    SELECT deptno FROM emp1
    WHERE EXTRACT(YEAR FROM hiredate) = 1981
);
--Display the employee names having the maximum salary in the ACCOUNTING department.
SELECT empno,ename,sal FROM emp1
WHERE sal IN(
	SELECT MAX(sal) FROM emp1
	WHERE deptno IN (
		SELECT deptno FROM dept
		WHERE dname = 'ACCOUNTING')
);
--Display the department name having the highest commission.
SELECT deptno,dname FROM dept
WHERE deptno IN(
	SELECT deptno FROM emp1
	WHERE comm IN (
		SELECT MAX(comm) FROM emp1
		WHERE comm IS NOT NULL)
);
--Display employee names whose department name has 2nd character as 'O'.
SELECT empno,ename,sal FROM emp1
WHERE deptno IN(
	SELECT deptno FROM dept
	WHERE SUBSTR(dname,2,1) = 'o'
);
--Display all employees whose department is not the same as SCOTT's.
SELECT empno,ename FROM emp1 
WHERE deptno NOT IN (
	SELECT deptno FROM emp1
	WHERE ename = 'SCOTT'
);
--Display all employees in the OPERATIONS and ACCOUNTING departments.
SELECT empno,ename,deptno FROM emp1
WHERE deptno IN(
	SELECT deptno FROM dept 
	WHERE dname IN ('ACCOUNTING','OPERATIONS')
);
--List employees whose salary is greater than MILLER's salary.
SELECT empno,ename,sal FROM emp1
WHERE sal >(
	SELECT sal FROM emp1
	WHERE ename = 'MILLER'
);
--Display all employees whose job is not the same as ALLEN's and whose salary is greater than MARTIN's salary.
SELECT empno,ename,sal FROM emp1
WHERE job <> (SELECT job FROM emp1
WHERE ename = 'ALLEN') AND 
sal >(
	SELECT sal FROM emp1
	WHERE ename = 'MARTIN'
);
--Display all employees whose location is the same as ADAMS' manager's location.
SELECT empno,ename,deptno FROM emp1
WHERE deptno IN (
	SELECT deptno FROM dept
	WHERE LOC IN (
		SELECT loc FROM dept
		WHERE deptno IN(
			SELECT deptno FROM emp1
			WHERE empno IN(
				SELECT mgr FROM emp1
				WHERE ename = 'ADAMS'
			)
		)
	)
);
--Display the job and manager number of employees working for JONES.
SELECT empno,ename,job,mgr FROM emp1
WHERE mgr = (
	SELECT empno FROM emp1
	WHERE ename = 'JONES'
);