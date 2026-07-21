-- HERE ALL PRACTICE QUERIES ARE WRITTEN FOR FUNCTIONS IN POSTGRESQL DATABASE
--EXAMPLES
-- GENERAL
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