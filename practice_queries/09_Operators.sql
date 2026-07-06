-- HERE ALL PRACTICE QUERIES ARE WRITTEN FOR OPERATORS 

1.-- ARITHMETIC OPERATORS

SELECT 10 + 5 AS Addition;
SELECT 25%4 AS ModulusResult;
SELECT MOD(25,4) AS ModulusResultUsingFunction;

Q--Display employee name, salary and salary after adding 100 to it of all the employees from 
--emp1 table.
SELECT ename,sal,sal+100 FROM emp1;
Q-- Decrement salary of SMITH by 100
UPDATE emp1 
SET sal=sal-100 
WHERE ename='SMITH';
Q--Display employee name and annual salary (SAL * 12).
SELECT ename,sal*12 AS AnnualSalary FROM emp1;
Q--Display employee name and annual salary after adding ₹1000 monthly bonus.
SELECT ename,(sal+1000)*12 AS AnnualSalaryWithBonus FROM emp1;
Q--Display employee name and double the salary.
SELECT ename,sal*2 AS DoubleSalary FROM emp1;
Q--Display employee name and salary after deducting ₹500.
SELECT ename,sal-500 AS SalaryAfterDeduction FROM emp1;
Q--Display employee name and half of the salary.
SELECT ename,sal/2 AS HalfSalary FROM emp1;
Q--Display employee name and salary increment of 15%.
SELECT ename,sal*1.15 AS SalaryAfterIncrement FROM emp1;
--OR
SELECT ename,sal+(sal*0.15) as incremented_salary
FROM emp1;
Q--Display employee name and total yearly income after adding commission.
SELECT ename,(sal+comm)*12 AS TotalYearlyIncome FROM emp1;
   -- if commission is NULL then it will return NULL, so we can use COALESCE to handle NULL values
SELECT ename,(sal+COALESCE(comm,0))*12 AS TotalYearlyIncome FROM emp1;
Q--Find the monthly tax assuming tax is 10% of salary.
SELECT ename,sal*0.10 AS MonthlyTax FROM emp1;
Q--Display employee name and remaining salary after 5% PF deduction.
SELECT ename,sal-(sal*0.05)	 as salary_after_pf_deduc
FROM emp1;
Q--Display employee name and total package (SAL + COMM) where commission is NULL-safe.
SELECT ename,sal+COALESCE(comm,0) AS TotalMonthlyPackage FROM emp1;
--OR
SELECT ename,(sal+COALESCE(comm,0)*12) as TotalAnnualPackage
FROM emp1;

2.-- COMPARISON (RELATIONAL) OPERATORS

Q--Display employees whose salary is exactly 3000.
SELECT ename,sal FROM emp1
WHERE sal = 3000;
Q--Display employees whose salary is greater than 2000.
SELECT ename,sal FROM emp1
WHERE sal > 2000;
Q--Display employees whose salary is less than 1500.
SELECT ename,sal FROM emp1
WHERE sal < 1500;
Q--Display employees earning at least 2500.
SELECT ename,sal FROM emp1
WHERE sal >= 2500;
Q--Display employees earning at most 1500.
SELECT ename,sal FROM emp1
WHERE sal <= 1500;
Q--Display employees whose job is not CLERK.
SELECT ename,job FROM emp1
WHERE job <> 'CLERK';
Q--Display employees whose department number is not 10.
SELECT ename,deptno FROM emp1
WHERE deptno <> 10;
Q--Display employees hired after 1982.
SELECT ename,hiredate FROM emp1
WHERE hiredate > '31-12-1982' ;
--or 
SELECT ename,hiredate FROM emp1
WHERE hiredate > '31-DEC-1982' ;
--or
SELECT ename,hiredate FROM emp1
WHERE hiredate > '1982-12-31' ;
Q--Display employees hired before 1981.
SELECT ename,hiredate FROM emp1
WHERE hiredate < '1981-01-01' ;
--or
SELECT ename,hiredate FROM emp1
WHERE hiredate <= '1980-12-31' ;
Q--Display employees whose commission is greater than salary.
SELECT ename,sal,comm FROM emp1
WHERE comm > sal ;
Q---Display employees who are not working in department 10.
SELECT ename,deptno FROM emp1
WHERE deptno <> 20 ;
Q--LIST ALL SALESMAN.
SELECT ename,job FROM emp1
WHERE job = 'SALESMAN' ;

--LOGICAL OPERATORS

Q--Display employees working AS clerk and earning more than 1000.
SELECT ename,job,sal FROM emp1
WHERE job = 'CLERK' AND sal > 1000 ;
Q--Display employees who are working in deptartment 10 or 20.
SELECT ename,deptno FROM emp1
WHERE deptno = 10 OR deptno = 20 ;
Q--Display employees who are earning more than 1250 but less than 3000.
SELECT ename,sal FROM emp1
WHERE sal > 1250 AND sal < 3000;
Q--List all salsmen and managers from employee table.
SELECT ename,job FROM emp1
WHERE job = 'SALESMAN' OR job = 'MANAGER';
Q--Display employees who are hire after year 1981 and before year 1987.
SELECT ename,hiredate FROM emp1
WHERE hiredate > '1981-12-31' AND hiredate < '1987-01-01';
Q--Dispaly employees who are not clerk.
SELECT ename,job FROM emp1
WHERE NOT job = 'CLERK';
Q--Display employees working in department 30 and salary greater than 2000.
SELECT ename,deptno,sal FROM emp1
WHERE deptno = 30 AND sal >2000;
Q--Display employees who are CLERK and belong to department 20.
SELECT ename,job,deptno FROM emp1
WHERE job = 'CLERK' AND deptno = 20;
Q--Display employees whose salary is greater than 2500 or department is 10.
SELECT ename,sal,deptno FROM emp1
WHERE sal > 2500 AND deptno = 10;
Q--Display employees who are MANAGER or ANALYST.
SELECT ename,job FROM emp1
WHERE job = 'MANAGER' OR job = 'ANALYST';
Q--Display employees who are not SALESMAN.
SELECT ename,job FROM emp1
WHERE NOT job = 'SALESMAN';
Q--Display employees hired after 1982 and earning more than 1500.
SELECT ename,hiredate,sal FROM emp1
WHERE hiredate > '1982-12-31' AND sal > 1500;
Q--Display employees working in department 10 or earning less than 1000.
SELECT ename,deptno,sal FROM emp1
WHERE deptno = 10 OR sal < 1000; 	 	
Q--Display employees who are not in department 30 and salary above 2000.
SELECT ename,deptno,sal FROM emp1
WHERE NOT deptno = 30 AND sal > 2000; 	 	
Q--Display employees who are CLERK and salary between 1000 and 2000.
SELECT ename,job,sal FROM emp1
WHERE job = 'CLERK' AND (sal < 2000 AND sal > 1000); 	 	
Q--Display employees who are MANAGER or salary greater than 2500.
SELECT ename,job,sal FROM emp1
WHERE job = 'MANAGER' OR sal > 2500;

-- IN / NOT IN OPERATOR

Q--Display employees working in departments 10, 20.
SELECT ename,deptno FROM emp1
WHERE deptno IN (10,20);
Q--Display employees not working in departments 10, 20.
SELECT ename,deptno FROM emp1
WHERE deptno NOT IN (10,20);
Q--Display employees working in departments 10, 20, and 30.
SELECT ename,deptno FROM emp1
WHERE deptno IN (10,20,30);
Q--Display employees whose job is CLERK, MANAGER, or ANALYST.
SELECT ename,job FROM emp1
WHERE job IN ('CLERK','MANAGER','ANALYST');
Q--Display employees whose employee number is in (7369, 7499, 7521).
SELECT ename,empno FROM emp1
WHERE empno IN (7369,7499,7521);
Q--Display employees whose manager ID is in (7566, 7698).
SELECT ename,mgr FROM emp1
WHERE mgr IN (7566,7698);

-- IS NULL / IS NOT NULL OPERATOR

Q--Display employees who's commission is NULL
SELECT ename,comm FROM emp1
WHERE comm IS NULL;
Q--Display employees who are not earning any commission.
SELECT ename,comm FROM emp1
WHERE comm = 0 OR comm IS NULL;
Q--Display employees who are earning some commission.
SELECT ename,comm FROM emp1
WHERE comm IS NOT NULL AND COMM > 0;
Q--Display employees whose manager is NULL.
SELECT ename,mgr FROM emp1
WHERE mgr IS NULL;
Q--Display employees whose manager is not NULL.
SELECT ename,mgr FROM emp1
WHERE mgr IS NOT NULL;
Q--Display employees having both salary and commission.
SELECT ename,sal,comm FROM emp1
WHERE (sal IS NOT NULL AND comm IS NOT NULL) 
	 AND (sal > 0 AND comm > 0) ;
Q--Display employees where commission is NULL and department is 30.
SELECT ename,comm,deptno FROM emp1
WHERE comm IS NULL AND deptno = 30;

-- BETWEEN / NOT BETWEEN OPERATOR

Q--Display employees whose salary is between 1250 and 3000.
SELECT ename,sal FROM emp1
WHERE sal BETWEEN 1250 AND 3000;
Q--Display employees hired between '01-JAN-1982' and '13-DEC-1986'.
SELECT ename,hiredate FROM emp1
WHERE hiredate BETWEEN '1982-01-01' AND '1986-12-13';
Q--Display employees whose names between 'ADAMS' and 'SMITH'.
SELECT ename FROM emp1
WHERE ename BETWEEN 'ADAMS' AND 'SMITH';
Q--Display employees whose names between 'A' and 'SZ'.
SELECT ename FROM emp1
WHERE ename BETWEEN 'A' AND 'SZ';
Q--Display employees whose salary is between 1000 and 2000.
SELECT ename,sal FROM emp1
WHERE sal BETWEEN 1000 AND 2000;
Q--Display employees whose employee number is between 7500 and 7700.
SELECT ename,empno FROM emp1
WHERE empno BETWEEN 7500 AND 7700;
Q--Display employees hired between 1981 and 1983.
SELECT ename,hiredate FROM emp1
WHERE hiredate BETWEEN '01-01-1981' AND '31-12-1983';
Q--Display employees whose commission is between 200 and 800.
SELECT ename,comm FROM emp1
WHERE comm BETWEEN 200 AND 800;
Q--Display employees not having salary between 1500 and 2500.
SELECT ename,sal FROM emp1
WHERE sal NOT BETWEEN 1500 AND 2500;

-- LIKE / NOT LIKE OPERATOR

Q--Display employees whose names start with 'A'.
SELECT ename FROM emp1
WHERE ename LIKE 'A%';
Q--Display employees whose names end with 'N'.
SELECT ename FROM emp1
WHERE ename LIKE '%N';
Q--Display employees whose names contain 'A'.
SELECT ename FROM emp1
WHERE ename LIKE '%A%';
Q--Display employees whose names have 'A' as the second character.
SELECT ename FROM emp1
WHERE ename LIKE '_A%';
Q--Display employees whose names have exactly five characters.
SELECT ename FROM emp1
WHERE ename LIKE '_____';
Q--Display employees whose names end with 'ES'.
SELECT ename FROM emp1
WHERE ename LIKE '%ES';
Q--Display employees whose names contain two consecutive 'L's.
SELECT ename FROM emp1
WHERE ename LIKE '%LL%';
Q--Display employees whose names start with 'S' and end with 'T'.
SELECT ename FROM emp1
WHERE ename LIKE 'S%T';
Q--Display employees whose job starts with 'S'.
SELECT ename,job FROM emp1
WHERE job LIKE 'S%';
Q--Display employees whose job contains 'MAN'.
SELECT ename,job FROM emp1
WHERE job LIKE '%MAN%';
Q--Display employees whose names have 'I' as the second last character.
SELECT ename FROM emp1
WHERE ename LIKE '%I_';
Q--Display employees whose names contains '%'.
SELECT ename FROM emp1
WHERE ename LIKE '%@%%' ESCAPE '@';
Q--Display employees whose names contains '_' at third place.
SELECT ename FROM emp1
WHERE ename LIKE '__*_%' ESCAPE '*';
Q--Display employees whose names does not contains 'A' at third place.
SELECT ename FROM emp1
WHERE ename NOT LIKE '__A%';

--EXISTS / NOT EXISTS OPERATOR

SELECT dname FROM dept d
WHERE EXISTS(
        SELECT 1
        FROM emp1 e
        WHERE e.deptno = d.deptno
    );

SELECT dname FROM dept d
WHERE NOT EXISTS(
        SELECT 1
        FROM emp1 e
        WHERE e.deptno = d.deptno
    );

-- CONCATENATION OPERATOR

SELECT 'My Name is '||ename FROM emp1;
SELECT 'My Name is '||'ARSHAD';
SELECT ename || ' works as ' || job AS employee_details FROM emp1;

--ALL OPERATORS

Q--Display employees whose salary is greater than all employees in department 30.
SELECT empno,ename,sal FROM emp1
WHERE sal > ALL(SELECT sal FROM emp1
WHERE deptno = 30);

--ANY OPERATORS

Q--Display employees whose salary is greater than any employee in department 20.
SELECT empno,ename,sal FROM emp1
WHERE sal > ANY(SELECT sal FROM emp1
WHERE deptno = 20);
   

-- COMBINED OPERATORS QUESTIONS

Q--Display employees in department 30 whose salary is between 1000 and 3000.
SELECT empno,ename,deptno,sal FROM emp1
WHERE deptno = 30 AND sal BETWEEN 1000 AND 3000;
Q--Display employees whose names start with 'S' and salary is above 2000.
SELECT empno,ename,deptno,sal FROM emp1
WHERE ename LIKE 'S%' AND sal > 2000;
Q--Display employees whose job is MANAGER or ANALYST and hired before 1983.
SELECT empno,ename,job,hiredate FROM emp1
WHERE job IN('MANAGER','ANALYST') AND hiredate < '1983-01-01';
Q--Display employees whose commission is NULL and salary greater than 1500.
SELECT empno,ename,comm,sal FROM emp1
WHERE comm IS NULL AND sal > 1500;
Q--Display employees in departments 10 or 20 with salary between 1000 and 2500.
SELECT empno,ename,deptno,sal FROM emp1
WHERE deptno IN (10,20) AND sal BETWEEN 1000 AND 2500;
Q--Display employees whose names contain 'A' but are not CLERKs.
SELECT empno,ename,job FROM emp1
WHERE ename LIKE '%A%' AND job <> 'CLERK';
Q--Display employees hired after 1981 and commission is not NULL.
SELECT empno,ename,hiredate,comm FROM emp1
WHERE hiredate > '1981-12-31' AND comm IS NOT NULL;
Q--Display employees whose names end with 'N' and department is not 10.
SELECT empno,ename,deptno FROM emp1
WHERE ename LIKE '%N' AND deptno <> 10;
Q--Display employees who are SALESMAN with commission greater than 500.
SELECT empno,ename,job,comm FROM emp1
WHERE job = 'SALESMAN' AND comm>500;
Q--Display employees whose salary is not between 1500 and 3000 and are not MANAGER.
SELECT empno,ename,sal,job FROM emp1
WHERE sal BETWEEN 1500 AND 3000 AND job <> 'MANAGER';

-- INTERVIEW LEVEL QUESTIONS ON OPERATORS

Q--Display employees whose commission is greater than 20% of their salary.
SELECT empno,ename,comm,sal FROM emp1
WHERE comm > (sal*0.20);
Q--Display employees whose annual salary exceeds ₹30,000.
SELECT empno,ename,sal*12 as Annual_Sal FROM emp1
WHERE 12*sal > 30000;
Q--Display employees whose salary is divisible by 100.
SELECT empno,ename,sal FROM emp1
WHERE MOD(sal,100) = 0;
Q--Display employees hired in the month of December.
SELECT empno,ename,hiredate FROM emp1
WHERE EXTRACT(MONTH FROM hiredate)=12;
Q--Display employees who have no manager but belong to department 10.
SELECT empno,ename,mgr,deptno FROM emp1
WHERE deptno = 10 AND mgr IS NULL;
Q--Display employees whose salary is greater than the average salary of department 30. 
--(Subquery comes later, skip solving for now.)
SELECT empno,ename,sal FROM emp1
WHERE sal >(SELECT AVG(sal) FROM emp1
	WHERE deptno = 30); 
Q--Display employees whose names contain exactly one 'A'.
SELECT empno,ename FROM emp1
WHERE LENGTH(ename)-LENGTH(REPLACE(ename,'A',''))=1;
Q--Display employees whose salary plus commission exceeds 4000.
SELECT empno,ename,comm,sal FROM emp1
WHERE sal+COALESCE(comm,0) > 4000;
Q--Display employees whose job is not CLERK and whose salary is not between 1000 and 2000.
SELECT empno,ename,job,sal FROM emp1
WHERE job <> 'CLERK' AND sal NOT BETWEEN 1000 AND 2000;
Q--List all employees whose commission is NULL
SELECT empno,ename,comm FROM emp1
WHERE comm IS NULL;
Q--List all employees who dont have a reporting manager
SELECT empno,ename,mgr FROM emp1
WHERE mgr IS NULL;
Q--Display name which has 8 characters in which 3rd character is 'A' and 6th character is 'B'
--and the last character is 'C'.
SELECT empno,ename FROM emp1
WHERE ename LIKE '__A__B_C';
Q--List all employees whose name starts with 'A' or 'S'.
SELECT empno,ename FROM emp1
WHERE ename LIKE 'A%' OR ename LIKE 'S%';
Q--List all the employees whose name does not start with 'S'.
SELECT empno,ename FROM emp1
WHERE ename NOT LIKE 'S%';
Q--Display the employees who dont get salary but get commission.
SELECT empno,ename,sal,comm FROM emp1
WHERE sal IS NULL AND comm IS NOT NULL; 