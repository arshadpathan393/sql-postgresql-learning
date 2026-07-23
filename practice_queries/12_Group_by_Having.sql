-- HERE ALL PRACTICE QUERIES ARE WRITTEN FOR GROUP BY AND HAVING IN POSTGRESQL DATABASE

-- GROUP BY CLAUSE
--Display total salary department-wise.
SELECT deptno,SUM(sal) FROM emp1
GROUP BY deptno;
--Display average salary department-wise.
SELECT deptno,AVG(sal) FROM emp1
GROUP BY deptno;
--Display employee count department-wise.
SELECT deptno,COUNT(*) FROM emp1
GROUP BY deptno;

--HAVING CLAUSE
--Display departments having average salary greater than 2500.
SELECT deptno,AVG(sal) FROM emp1
GROUP BY deptno
HAVING AVG(sal) > 2500;
--Display departments having more than three employees.
SELECT deptno,COUNT(*) FROM emp1
GROUP BY deptno
HAVING COUNT(*) > 3;
--Display departments whose maximum salary is greater than 4000.
SELECT deptno,MAX(sal) FROM emp1
GROUP BY deptno
HAVING MAX(sal) > 4000;

-- QUERIES
--Display the number of employees in each department.
SELECT deptno,COUNT(*) FROM emp1
GROUP BY deptno;
--Display the total salary of each department.
SELECT deptno,SUM(sal) FROM emp1
GROUP BY deptno;
--Display the average salary of each department.
SELECT deptno,AVG(sal) FROM emp1
GROUP BY deptno;
--Display the maximum salary in each department.
SELECT deptno,MAX(sal) FROM emp1
GROUP BY deptno;
--Display the minimum salary in each department.
SELECT deptno,MIN(sal) FROM emp1
GROUP BY deptno;
--Display the total commission paid department-wise.
SELECT deptno,SUM(comm) FROM emp1
GROUP BY deptno;
--Display the number of employees for each job.
SELECT job,COUNT(*) FROM emp1
GROUP BY job;
--Display the average salary for each job.
SELECT job,AVG(sal) FROM emp1
GROUP BY job;
--Display the maximum salary for each job.
SELECT job,MAX(sal) FROM emp1
GROUP BY job;
--Display the minimum salary for each job.
SELECT job,MIN(sal) FROM emp1
GROUP BY job;
--Display the total salary paid to each job in every department.
SELECT job,deptno,SUM(sal) FROM emp1
GROUP BY job,deptno;
--Display the number of employees department-wise and job-wise.
SELECT deptno,job,COUNT(*) FROM emp1
GROUP BY deptno,job;
--Display the average salary department-wise and job-wise.
SELECT deptno,job,AVG(sal) FROM emp1
GROUP BY deptno,job;
--Display the maximum salary department-wise and job-wise.
SELECT deptno,job,MAX(sal) FROM emp1
GROUP BY deptno,job;
--Display the minimum salary department-wise and job-wise.
SELECT deptno,job,MIN(sal) FROM emp1
GROUP BY deptno,job;
--Display department number and total annual salary.
SELECT deptno,SUM(sal)*12 AS tot_ann_sal FROM emp1
GROUP BY deptno;
--Display job and total annual salary.
SELECT job,SUM(sal)*12 AS tot_ann_sal FROM emp1
GROUP BY job;
--Display the number of employees hired in each year.
SELECT EXTRACT(YEAR FROM hiredate),COUNT(*) FROM emp1
GROUP BY EXTRACT(YEAR FROM hiredate);
--Display the total commission for each job.
SELECT job,SUM(comm) FROM emp1
GROUP BY job;
--Display the highest commission department-wise.
SELECT deptno,MAX(comm) FROM emp1
GROUP BY deptno;
--Display the number of employees reporting to each manager.
SELECT mgr,COUNT(*) FROM emp1
GROUP BY mgr;
--Display the average salary under each manager.
SELECT mgr,AVG(sal) FROM emp1
GROUP BY mgr;
--Display the total salary under each manager.
SELECT mgr,SUM(sal) FROM emp1
GROUP BY mgr;
--Display department-wise total monthly salary.
SELECT dept,SUM(sal) FROM emp1
GROUP BY dept;
--Display department-wise total annual salary.
SELECT dept,AVG(sal)*12 AS tot_ann_sal FROM emp1
GROUP BY dept;
--Display the number of employees receiving commission in each department.
--Display department-wise highest salary.
--Display department-wise lowest salary.
--Display job-wise highest salary.
--Display job-wise lowest salary.
--Display departments having more than 3 employees.
--Display departments whose total salary is greater than 9000.
--Display departments whose average salary is greater than 2500.
--Display departments whose maximum salary is greater than 4000.
--Display departments whose minimum salary is greater than 1000.
--Display jobs having more than 2 employees.
--Display jobs whose average salary is greater than 2500.
--Display jobs whose total salary exceeds 8000.
--Display managers supervising more than 2 employees.
--Display departments having employees with commission.
--Display departments whose total commission exceeds 1000.
--Display departments having more than one MANAGER.
--Display departments where the highest salary exceeds 5000.
--Display departments where the lowest salary is below 1000.
--Display jobs having more than one employee with commission.
--Display managers whose team average salary exceeds 3000.
--Display departments where total annual salary exceeds 100000.
--Display jobs having exactly two employees.
--Display departments having exactly five employees.
--Display departments where average commission exceeds 500.
--Display departments having more than three employees and show total salary.
--Display jobs having average salary greater than 2500.
--Display managers supervising more than three employees.
--Display departments whose highest salary exceeds 4000.
--Display departments whose total salary is greater than department 30's total salary.
--Display jobs whose average salary is greater than the company average salary.
--Display departments having more employees than department 10.
--Display departments where maximum commission exceeds 1000.
--Display departments having at least two employees with commission.
--Display departments where average salary is less than the company average.
--Find the department with the highest average salary.
--Find the department with the lowest average salary.
--Find the job having the highest employee count.
--Find the department paying the highest total salary.
--Find departments where every employee earns more than 2000.
--Find jobs where no employee receives commission.
--Display departments whose employee count equals department 10.
--Display the top 3 departments by total salary.
--Display departments where average salary lies between 2500 and 3500.
--Display jobs whose maximum salary is less than the company average salary.

--Write a query to display the total salary required to pay each job.
--Write a query to display the hire date on which at least 3 employees were hired.
--Display the department numbers where:
    --at least 2 employees work, and
    --the total monthly salary is more than 9000.
--Display the number of employees working in each department and the average salary, excluding employees whose salary is less than their commission.
--Display the salary values that are repeated in the EMP table.
--Display the employee names that occur more than once in the company.
--Display the department numbers whose average salary is between 2000 and 3000.
--Display the number of employees working as MANAGER or ANALYST with annual salary greater than 20,000 in each department.
--Display the number of CLERKs working in each department.
--Display the highest salary of a MANAGER in each department.
--Display the number of times each salary is repeated in the EMP table.
--Display the department number and employee count, excluding employees working in department 10.
--Display the number of employees receiving commission in each department.
--Display the number of employees earning more than 1600, excluding MANAGERS, department-wise.
--Display the average salary required to pay employees who have a reporting manager, job-wise.
--Display the number of employees hired in the same department on the same day.
--Display the number of employees having the same salary.
--Display the maximum salary for each designation, excluding employees whose name starts with 'K'.
--Display the number of employees reporting to manager 7839, department-wise.
--Display the number of employees whose names start with a vowel, department-wise.
--List the department names having at least 3 SALESMAN.
--List employees from RESEARCH and ACCOUNTING who have at least 2 reporting employees (i.e., are managers of at least two employees).
--Display the department locations having more than 4 employees.
--Display all employees of department 20 where that department has at least 3 employees.
--List the department names having at least 3 employees but not more than 5 employees.