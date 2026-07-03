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

