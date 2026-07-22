-- HERE ALL PRACTICE QUERIES ARE WRITTEN FOR FUNCTIONS IN POSTGRESQL DATABASE
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
(SELECT deptno FROM emp1
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
(SELECT deptno FROM emp e
WHERE d.deptno = e.deptno)
--Find departments having no employees.
SELECT deptno,dname FROM dept d
WHERE NOT EXISTS
(SELECT deptno FROM emp e
WHERE d.deptno = e.deptno)
--Find Employees Earning Above Department Average
SELECT empno,ename,sal,deptno FROM emp1 e1
WHERE sal >(
SELECT AVG(sal) FROM emp1 e2
WHERE e1.deptno = e2.deptno
GROUP BY deptno
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
--Find employees earning less than ALLEN.
--Find employees earning the same salary as SCOTT.
--Find employees working in the same department as SMITH.
--Find employees having the same job as MARTIN.
--Find employees hired before KING.
--Find employees hired after JONES.
--Find employees whose manager is the same as SMITH.
--Find employees not working in the same department as SMITH.
--Find employees whose commission is greater than ALLEN's commission.
--Find employees working in departments where MANAGERs work.
--Find employees having the same job as any employee in department 30.
--Find employees whose salary matches any SALESMAN.
--Find employees hired on the same date as any CLERK.
--Find employees not working in departments where CLERKs work.
--Find employees whose job is not held by employees in department 10.
--Find employees earning more than any CLERK.
--Find employees earning less than any MANAGER.
--Find employees earning more than all CLERKs.
--Find employees earning less than all MANAGERs.
--Display departments that have employees.
--Display employees only if department 10 exists.
--Display departments without employees.
--Display employees only if department 50 does not exist.
--Display employee name along with company average salary.
--Display employee name along with company maximum salary.
--Display employee name along with company minimum salary.
--Find employees working in the department of SMITH.
--Find employees reporting to the manager of JONES.
--Find employees working in the department of the highest-paid employee.
--Find employees earning more than the employee with employee number 7566.
--Find employees having the same hire date as BLAKE.
--Find employees earning less than KING but more than SMITH.
--Find employees managed by the same manager as ALLEN.
--Find employees whose job differs from SCOTT's.
--Find employees who belong to the department where KING works.
--Find employees who earn the minimum salary without using MIN().
--Find employees whose hire date is the earliest without using MIN().
--Find employees who do not report to KING's manager.
--Find employees having the same commission as MARTIN.