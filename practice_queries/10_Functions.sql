-- HERE ALL PRACTICE QUERIES ARE WRITTEN FOR FUNCTIONS IN POSTGRESQL DATABASE
-- FUNCTIONS
A.--S MULTI ROW FUNCTIONS
1.-- COUNT()
SELECT COUNT(*) FROM emp1;
SELECT COUNT(ename) FROM emp1;
SELECT COUNT(comm) FROM emp1;

2.-- SUM()
SELECT SUM(sal) FROM emp1;

3.-- AVG()
SELECT AVG(sal) FROM emp1;
SELECT AVG(sal) FROM emp1 WHERE deptno = 30;

4.-- MIN()
SELECT MIN(sal) FROM emp1;
SELECT MIN(sal),MIN(ename),MIN(hiredate) FROM emp1;

5.-- MAX()
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
B.-- SINGLE ROW FUNCTIONS
1.-- CHARACTER FUNCTIONS
a.-- CASE MANIPULATION
--UPPER()
SELECT UPPER('arshad');
SELECT UPPER(ename) FROM emp1; 

--LOWER()
SELECT LOWER('ARSHAD');
SELECT LOWER(ename) FROM emp1;

--INITCAP()
SELECT INITCAP('java backend dveloper');
SELECT INITCAP('aRShaD');
SELECT INITCAP(ename) FROM emp1;

b.--CHARACTER MANIPULATION
--LENGTH()
SELECT LENGTH('ARSHAD');
SELECT ename,LENGTH(ename) FROM emp1;

--REVERSE()
SELECT REVERSE('QSPIDERS');
SELECT REVERSE(ename) FROM emp1;

--REPLACE()
SELECT REPLACE('QSPIDERS','Q','J');
SELECT REPLACE('QSPIDERS','S','$');
SELECT REPLACE('QSPIDERS','SPIDER','*');
SELECT REPLACE('QSPIDERS','s','$'); --> Nothing will change - case sensitive
SELECT REPLACE(job,'SALESMAN','SALES EXECUTIVE') FROM emp1;

--CONCAT()
SELECT CONCAT('QSPIDERS',' JSPIDERS');
SELECT CONCAT(CONCAT('QSPIDERS',' JSPIDERS'),' HADAPSAR');
SELECT CONCAT(ename,CONCAT('(',CONCAT(job,')'))) FROM emp1; --> ENAME(JOB)
--OR 
SELECT CONCAT(CONCAT(ename,CONCAT('(',job)),')') FROM emp1;

--SUBSTR()
SELECT SUBSTR('QSPIDERS',3,2);
SELECT SUBSTR('QSPIDERS',3,-2); --> length cant be negtive (postegreSQL)
SELECT SUBSTR('QSPIDERS',3);
SELECT SUBSTR('QSPIDERS',0,2); --> fetches only first character because it starts from zero (postegreSQL)
SELECT SUBSTR('QSPIDERS',1,2);
SELECT SUBSTR(ename,1,3) FROM emp1;

--INSTR() OR POSITION() OR STRPOS() 
--oracle INSTR()
SELECT INSTR('QSPIDERS','S',1,1) FROM dual; -> 2
SELECT INSTR('QSPIDERS','S',1,2) FROM dual; -> 8
SELECT INSTR('QSPIDERS','S',2,1) FROM dual; -> 2
SELECT INSTR('QSPIDERS','S',1,3) FROM dual; -> 0 --> no of occurances are only 2
SELECT INSTR('QSPIDERS','S',3,2) FROM dual; -> 0
SELECT INSTR('QSPIDERS','S',-2,1) FROM dual; -> 2
SELECT INSTR('QSPIDERS','S',-1,1) FROM dual; -> 8
SELECT INSTR('QSPIDERS','S') FROM dual; -> 2
SELECT INSTR('QSPIDERS','S',3) FROM dual; -> 8
SELECT INSTR('QSPIDERS','S',0,2) FROM dual; -> 0 --> Position always starts with 1
SELECT INSTR('QSPIDERS','S',1,0) FROM dual; -> error --> no.of occurances cant be 0
SELECT INSTR('QSPIDERS','S',1,-1) FROM dual; -> error --> no.of occurances cant be negative
--postrgreSQL POSITION()
SELECT POSITION('S' IN 'QSPIDERS'); ->2
SELECT POSITION('P' IN 'QSPIDERS'); ->3
SELECT STRPOS('ARSHAD','S'); ->3
SELECT STRPOS(SUBSTRING('QSPIDERS' FROM 3),'S') + 2; -> 8 --> position for second occurance of 'S'
SELECT STRPOS(SUBSTRING('ARSHAD' FROM 2),'A') + 1; -> --> position for second occurance of 'A

--TRIM()
SELECT TRIM('   ARSHAD   ');
SELECT TRIM('N' FROM 'NITIN');
SELECT TRIM('N' FROM 'NIBM');
SELECT TRIM('N' FROM 'MARTIN');
SELECT TRIM(LEADING 'N' FROM 'NITIN');
SELECT TRIM(TRAILING 'N' FROM 'NITIN');
SELECT TRIM(BOTH 'N' FROM 'NITIN');
SELECT TRIM(BOTH 'NI' FROM 'NITIN'); -> 'T'
SELECT TRIM('NI' FROM 'NITINLMN'); -> TINLM
SELECT TRIM('N' FROM 'NNITINN');
SELECT TRIM('n' FROM 'NITIN'); --> Data is case sensitive
SELECT TRIM('Q' FROM TRIM('S' FROM 'QPSIDERS')); -> PSIDER 

--LTRIM()
SELECT LTRIM('   QPSIDERS  ');
SELECT LTRIM('NITIN','N');
SELECT LTRIM('EAEATAEAE','EAT') --> TAEAE
SELECT LTRIM('EAEATAEAE','EAT') --> REMOVES FULL STRING

--RTRIM()
SELECT RTRIM('  ARSHAD     ');
SELECT RTRIM('NITIN','N');
SELECT RTRIM('EAEATAEAE','AE'); --> EAEAT
SELECT RTRIM('EAEATAEAE','EAT'); --> REMOVES FULL STRING

--LPAD()
SELECT LPAD('NITIN',10,'*'); --> *****NITIN
SELECT LPAD('SQL',6,'#'); --> ###SQL
SELECT LPAD('SQL',6); -->    SQL -- BLANK SPACES ADDED TO THE LEFT

--RPAD()
SELECT LPAD('NITIN',10,'*'); --> NITIN*****
SELECT LPAD('SQL',6,'#'); --> SQL###
SELECT LPAD('SQL',6); --> SQL   -- BLANK SPACES ADDED TO THE RIGHT

--LEFT()
SELECT LEFT('QSPIDERS',3);
SELECT LEFT(ename,3) FROM emp1;

--RIGHT()
SELECT RIGHT('QSPIDERS',3);
SELECT RIGHT(ename,3) FROM emp1;

--SPLIT_PART()
SELECT SPLIT_PART('JAVA,SQL,SPRING',',',1);-->JAVA
SELECT SPLIT_PART('JAVA,SQL,SPRING',',',2);-->SQL
SELECT SPLIT_PART('JAVA,SQL,SPRING',',',3);-->SPRING
SELECT SPLIT_PART('arshad@gmail.com','@',1);

--TRANSLATE()
SELECT TRANSLATE('QSPIDERS','QS','AB'); -->ABPIDERB

--ASCII()
SELECT ASCII('A');-->65
SELECT ASCII('a');-->97

--CHR()
SELECT CHR(97);-->a
SELECT CHR(121);-->y

--REPEAT()
SELECT REPEAT('SQL',4);-->SQLSQLSQLSQL
SELECT REPEAT('*',10);-->**********

--OVERLAY()
SELECT OVERLAY('QSPIDERS' PLACING 'J' FROM 1 FOR 1); -->JSPIDERS
SELECT OVERLAY('QSPIDERS' PLACING 'JAVA' FROM 3 FOR 3); -->QSJAVAERS
SELECT OVERLAY('QSPIDERS' PLACING 'JAVA' FROM 3 FOR 4);-->QSJAVARS

--REGEXP_REPLACE()
SELECT REGEXP_REPLACE('987-654-3210','[^0-9]','','g');-->9876543210
SELECT REGEXP_REPLACE('987-654-3210','[0-9]','','g');--> --
SELECT REGEXP_REPLACE('Java123SQL456','[0-9]','','g');-->JavaSQL
SELECT REGEXP_REPLACE('Java123SQL456','[^0-9]','','g');-->123456

--REGEXP_MATCHES()
SELECT REGEXP_MATCHES('Java SQL Spring', 'SQL');-->{SQL}
SELECT REGEXP_MATCHES('abc123xyz', '[0-9]+');-->{123}

--STRING_AGG()
SELECT STRING_AGG(ename,', ') FROM emp;
SELECT deptno,STRING_AGG(ename,', ') FROM emp GROUP BY deptno;

--QUERIES

--UPPER()
--Display all employee names in uppercase.
SELECT UPPER(ename) FROM emp1;
--Display employee names whose uppercase value is 'SMITH'.
SELECT ename FROM emp1
WHERE UPPER(ename) = 'SMITH' ;
--Display names and their uppercase values.
SELECT ename,UPPER(ename) FROM emp1;
--Display employee names in uppercase where department is 20.
SELECT UPPER(ename),deptno FROM emp1
WHERE deptno = 20;
--Display employee names in uppercase along with their jobs.
SELECT UPPER(ename),job FROM emp1;
--Convert the string 'qspiders' to uppercase.
SELECT UPPER('qspiders');

--LOWER()
--Display all employee names in lowercase.
SELECT LOWER(ename) FROM emp1;
--Convert 'QSPIDERS' to lowercase.
SELECT LOWER('QSPIDERS');
--Display lowercase names of managers only.
SELECT DISTINCT LOWER(ename) FROM emp1
WHERE empno IN
	(SELECT mgr FROM emp1
	WHERE mgr IS NOT NULL);
--Find employees whose lowercase name is 'allen'.
SELECT ename FROM emp1
WHERE LOWER(ename)= 'allen';
--Display names and their lowercase values.
SELECT ename,LOWER(ename) FROM emp1;

--INITCAP()
--Display all employee names in proper case.
SELECT INITCAP(ename) FROM emp1;
--Display employee name and its INITCAP() value.
SELECT ename,INITCAP(ename) FROM emp1;
--Convert 'qSPIDERS' into proper case.
SELECT INITCAP('qSPIDERS');
--Update employee name 'JONES' to proper case.
UPDATE emp1
SET ename = INITCAP(ename)
WHERE ename = 'JONES';

--LENGTH()
--List employees whose names have exactly 4 characters.
SELECT ename FROM emp1
WHERE LENGTH(ename)=4;
--List employees whose jobs have exactly 4 characters.
SELECT ename FROM emp1
WHERE LENGTH(job)=4;
--Display length of 'QSPIDERS'.
SELECT LENGTH('QSPIDERS');
--Display employee names with their lengths.
SELECT ename,LENGTH(ename) FROM emp1;
--Find employees having the longest name.
SELECT ename FROM emp1
WHERE LENGTH(ename) IN
(SELECT MAX(LENGTH(ename)) FROM emp1);
--OR 
SELECT ename FROM emp1
ORDER BY LENGTH(ename) DESC
LIMIT 1;
--Find employees having the shortest name.
SELECT ename FROM emp1
WHERE LENGTH(ename) IN
(SELECT MIN(LENGTH(ename)) FROM emp1);
--OR
SELECT ename FROM emp1
ORDER BY LENGTH(ename) ASC
LIMIT 1;
--Find employees whose name length is greater than 5.
SELECT ename FROM emp1
WHERE LENGTH(ename)>5;

--REVERSE()
--Reverse 'QSPIDERS'.
SELECT REVERSE('QSPIDERS');
--Display employee names in reverse.
SELECT REVERSE(ename) FROM emp1;
--Display reverse of all jobs.
SELECT REVERSE(job) FROM emp1;
--Find employees whose reverse name starts with 'H'
SELECT ename FROM emp1
WHERE REVERSE(ename) LIKE 'H%';

--REPLACE()
--Replace 'S' with '$' in 'QSPIDERS'.
SELECT REPLACE('QSPIDERS','S','$');
--Replace 'Spider' with 'SP'.
SELECT REPLACE('QSPIDERS','Spider','SP');--> NO CHANGE
--Replace both 'I' and 'E' from 'QSPIDERS' wih '!' and '$' respectively using nested REPLACE().
SELECT REPLACE(REPLACE('QSPIDERS','S','$'),'I','!');
--Display 'A' with '*' in employee names.
SELECT REPLACE(ename,'A','*') FROM emp1;
--Display 'MAN' with 'LEAD' in JOB.
SELECT REPLACE(job,'MAN','LEAD') FROM emp1;

--CONCAT()
--Concatenate employee name and job.
SELECT CONCAT(ename,job) FROM emp1;
--Display "ENAME works as JOB".
SELECT CONCAT(ename,CONCAT(' works as ',job)) FROM emp1;
--Concatenate 'QSPIDERS' and 'JSPIDERS'.
SELECT CONCAT('QSPIDERS','JSPIDERS') FROM emp1;
--Display "My name is <ENAME>".
SELECT CONCAT('My name is ',CONCAT('<',CONCAT(ename,'>'))) FROM emp1;

--SUBSTR()
--Display first 3 characters of employee names.
SELECT SUBSTR(ename,1,3) FROM emp1;
--Display last 2 characters of employee names.
SELECT SUBSTR(ename,-2,2) FROM emp1;
--OR
SELECT RIGHT(ENAME,2) FROM emp1;
--Display employee names starting from the 3rd character.
SELECT SUBSTR(ename,3) FROM emp1;
--Display the middle 4 characters of employee names.
SELECT ename, 
       SUBSTRING(ename, ((LENGTH(ename) - 4) / 2) + 1, 4) AS middle_four
FROM emp1;
--Display first character of every employee name.
SELECT ename,SUBSTR(ename,1,1) FROM emp1;
--Display last character of every employee name.
SELECT ename,SUBSTR(ename,-1) FROM emp1;
--OR
SELECT ename,RIGHT(ename,1) FROM emp1;
--Display employee names starting with 'A'.
SELECT ename FROM emp1
WHERE SUBSTR(ename,1,1)='A';
--Display employee names ending with 'N'.
SELECT ename FROM emp1
WHERE SUBSTR(ename,-1)='N';
--OR
SELECT ename FROM emp1
WHERE RIGHT(ename,1)='N';
--Display employee names having 'A' at second position.
SELECT ename FROM emp1
WHERE SUBSTR(ename,2,1)='A';
--Display employee names having 'E' at second last position.
SELECT ename FROM emp1
WHERE SUBSTR(ename,-2,1)='E';
--OR
SELECT ename FROM emp1
WHERE LEFT(RIGHT(ename,2),1)='E';
--Display employee names containing 'A' anywhere.
SELECT ename FROM emp1
WHERE SUBSTR(ename,STRPOS(ename,'A'),1)='A';
--OR
SELECT ename FROM emp1
WHERE SUBSTR(ename,INSTR(ename,'A'),1)='A';
--OR
SELECT ename FROM emp1
WHERE SUBSTR(ename,POSITION('A' IN ename),1)='A';
--Display middle 3 characters.
SELECT SUBSTR(ename,(LENGTH(ename)-3)/2+1,3) FROM emp1;
--OR
SELECT SUBSTR(ename,ROUND((LENGTH(ename)-3)/2.0)::INTEGER+1,3) FROM emp1;
--Display employee names except first character.
SELECT SUBSTR(ename,2) FROM emp1;
--Display employee names except last character.
SELECT SUBSTR(ename,1,LENGTH(ename)-1) FROM emp1;

--INSTR()/POSITION()/STRPOS()
--Find the position of 'A' in every employee name.
SELECT INSTR(ename,'A') FROM emp1;
--OR
SELECT POSITION('A' IN ename) FROM emp1;
--OR
SELECT STRPOS(ename,'A') FROM emp1;
--Find employees whose names contain 'A'.
SELECT ename FROM emp1
WHERE INSTR(ename,'A')<>0;
--OR
SELECT ename FROM emp1
WHERE STRPOS(ename,'A')<>0;
--Find employees whose names do not contain 'A'.
SELECT ename FROM emp1
WHERE INSTR(ename,'A')=0;
--OR
SELECT ename FROM emp1
WHERE STRPOS(ename,'A')=0;
--OR
SELECT ename FROM emp1
WHERE POSITION('A' IN ename)=0;
--Find the position of 'E' in employee names.
SELECT ename,POSITION('E' IN ename) FROM emp1;
--Find employees whose second character is 'A'.
SELECT ename FROM emp1
WHERE INSTR(ename,'A') = 2;
--OR
SELECT ename FROM emp1
WHERE POSITION('A' IN ename) = 2;
--OR
SELECT ename FROM emp1
WHERE STRPOS(ename,'A') = 2;
--Find position of 'P' in 'QSPIDERS'.
SELECT INSTR('QSPIDERS','P') FROM dual;
--OR
SELECT POSITION('P' IN 'QSPIDERS')
--Find second occurrence of 'S' in 'QSPIDERS'.
SELECT INSTR('QSPIDERS','S',1,2) FROM dual;
--OR
SELECT REGEXP_INSTR('QSPIDERS', 'S', 1, 2) AS second_occurrence;
--Find last occurrence of 'S' in 'QSPIDERS'.
SELECT INSTR('QSPIDERS','S',-1) FROM dual;
--OR
SELECT LENGTH('QSPIDERS')-STRPOS(REVERSE('QSPIDERS'),'S');
--Display employees whose names end with 'N'.
SELECT ename FROM emp1
WHERE INSTR(ename,'N',1)=LENGTH(ename)-1
--OR
SELECT ename FROM emp1
WHERE STRPOS(ename,'N')=LENGTH(ename)-1
--Display employees having 'A' at second position.
SELECT ename FROM emp1
WHERE INSTR(ename,'A')=2
--OR
SELECT ename FROM emp1
WHERE STRPOS(ename,'A')=2
--Display employees containing 'A' anywhere.
SELECT ename FROM emp1
WHERE INSTR(ename,'A') <> 0
--OR
SELECT ename FROM emp1
WHERE STRPOS(ename,'A') <> 0
--Count number of 'S' in 'QSPIDERS'. --> After studying CASE
SELECT 
    (CASE WHEN REGEXP_INSTR('QSPIDERS', 'S', 1, 1) > 0 THEN 1 ELSE 0 END) +
    (CASE WHEN REGEXP_INSTR('QSPIDERS', 'S', 1, 2) > 0 THEN 1 ELSE 0 END) +
    (CASE WHEN REGEXP_INSTR('QSPIDERS', 'S', 1, 3) > 0 THEN 1 ELSE 0 END) AS count_of_s

--TRIM()/LTRIM()/RTRIM()
--Trim leading spaces from '  QSPIDERS   '
SELECT TRIM(LEADING FROM '  QSPIDERS   ');
--Trim trailing spaces from '  QSPIDERS   '
SELECT TRIM(TRAILING FROM '  QSPIDERS   ');
--Trim both sides '  QSPIDERS'.
SELECT TRIM(BOTH '  QSPIDERS   ');
--Remove 'EAT' from both ends from 'EAEATAEAE'.
SELECT TRIM('EAT', 'EAEATAEAE');
--Remove 'AE' using LTRIM from 'EAEATAEAE'.
SELECT LTRIM('EAEATAEAE','AE');
--Remove 'EAT' using RTRIM from 'EAEATAEAE'.
SELECT RTRIM('EAEATAEAE','EAT');
--Remove leading 'N' from 'NITIN'.
SELECT LTRIM('NITIN','N');
--Remove trailing 'N' from 'NITIN'.
SELECT RTRIM('NITIN','N');
--Display trimmed employee names.
SELECT TRIM(ename) FROM emp1;

--LPAD()/RPAD()
--Pad employee names to 15 characters using '*'.
SELECT LPAD(ename,15,'*') FROM emp1;
SELECT RPAD(ename,15,'*') FROM emp1;
--Pad employee numbers with leading zeros.
SELECT LPAD(ename,LENGTH(ename)+1,'0') FROM emp1;
--Display salary with leading zeros.
SELECT LPAD(sal::text,LENGTH(sal::text)+1,'0') FROM emp1;

--LEFT()
--Display first 3 characters employee names using LEFT().
SELECT LEFT(ename,3) FROM emp1;
--Display first letter of employee names.
SELECT LEFT(ename,1) FROM emp1;

--RIGHT()
--Display last 2 characters.
SELECT RIGHT(ename,2) FROM emp1;
--Display employees whose last character is 'N'.
SELECT ename FROM emp1
WHERE RIGHT(ename,1)='N';

--POSITION()
--Find the position of 'A' in employee names.
SELECT POSITION('A' IN ename) FROM emp1;
--Find employees whose names contain 'A'.
SELECT ename FROM emp1
WHERE POSITION('A' IN ename)<>0;

--SPLIT_PART()
--Split 'John-Doe-Pune' into three parts.
SELECT SPLIT_PART('John-Doe-Pune','-',1) AS FIRST_NAME,
	   SPLIT_PART('John-Doe-Pune','-',2) AS LAST_NAME,
	   SPLIT_PART('John-Doe-Pune','-',3) AS CITY;

--Extract city from 'Arshad-Mumbai-India'.
SELECT SPLIT_PART('Arshad-Mumbai-India','-',2) AS CITY;

--TRANSLATE()
--Replace vowels with from employees name'*'.
SELECT TRANSLATE(ename,'AEIOU','*****') FROM emp1;
--Replace 'ABC' with 'XYZ' using TRANSLATE().
SELECT TRANSLATE('ABCDEFG','ABC','XYZ');

--REPEAT()
--Display employee names followed by '***' repeated 5 times.
SELECT CONCAT(REPEAT('*',3),ename) FROM emp1;
--Repeat '-' 20 times.
SELECT REPEAT('-',20);

--ASCII()
--Display ASCII value of first character of employee name.
SELECT ASCII(SUBSTR(ename,1,1)) FROM emp1;
--Find employees whose first character ASCII value is greater than 75.
SELECT ename FROM emp1
WHERE ASCII(SUBSTR(ename,1,1))>75;

--CHR()
--Convert ASCII value 65 to character.
SELECT CHR(65);
--Display CHR(97).
SELECT CHR(97);

--OVERLAY()
--Replace characters from position 3 with 'SQL' in 'QSP'.
SELECT OVERLAY('QSP','SQL',3,1);
--Replace first three characters of employee name with 'ABC'.
SELECT OVERLAY(ename,'ABC',1,3) FROM emp1;

--REGEXP_REPLACE()
--Remove all vowels from employee names.
SELECT REGEXP_REPLACE(ename,'[AEIOU]','','g') FROM emp1;
--Remove all digits from a string 'JAVA123SQL456'.
SELECT REGEXP_REPLACE('JAVA123SQL456','[0-9]','','g');
--Replace multiple spaces with a single space.
SELECT REGEXP_REPLACE('          ','[ ]',' ','g');

--REGEXP_MATCHES()
--Find names containing only alphabets.
SELECT REGEXP_MATCHES(ename,'[A-Z]+') FROM emp1;
--Find employees whose names contain two consecutive vowels.
SELECT REGEXP_MATCHES(ename,'[AEIOU]{2}','i') FROM emp1;

--STRING_AGG()
--Display all employee names separated by commas.
SELECT STRING_AGG(ename,',') FROM emp1;
--Display department-wise employee names separated by ' | '.
SELECT deptno,STRING_AGG(ename,' | ') FROM emp1 GROUP BY deptno;

--Mixed Character Function Queries (Interview Level)
--Display employee name in uppercase along with its length.
--Display first 3 letters of every employee name in uppercase.
--Display employee names in lowercase and their last 2 characters.
--Display employee name along with its first and last character.
--Display employee name along with total number of characters.
--Display employee names whose first letter is 'A'.
--Display employee names ending with 'N'.
--Display employee names containing exactly one 'A'.
--Display employee names whose second letter is 'L'.
--Display employee names beginning with 'S' and ending with 'H'.
--Display employee names with vowels replaced by '*'.
--Display employee names without the first character.
--Display employee names without the last character.
--Display employee names with the first character in uppercase and the remaining characters in lowercase.
--Display employee names surrounded by ***.
--Display employee names along with the number of occurrences of the letter 'A'. (Advanced)
--Display employee names after removing all vowels.
--Display employee names with spaces replaced by underscores.
--Display employee names in reverse uppercase.
--Display the initials of employee names. (Useful when names contain spaces.)
--Find palindrome strings using REVERSE(). (Practice concept.)
--Display employee names sorted by their length.
--Find employees whose name length is between 4 and 6.
--Display the first half of every employee name.
--Display first 3 characters of employee name in lowercase and remaining characters in uppercase.
--Display output like:
--Employee JONES is CLERK and salary is 800.
--Display first half of employee name in lowercase and second half in reverse.
--Display first half in lowercase and second half in uppercase.
--Display names having exactly one 'A'.
--Display names having at least three 'A'.
--Display names where third and seventh characters are the same.
--Display first 3 letters in lowercase and remaining letters in uppercase.
--Display names whose second character is 'M'.
--Display names ending with 'ER'.
--Display names beginning with 'S' and ending with 'H'.
--Display employee initials.
--Count occurrences of each vowel in employee names.
--Mask employee names except first and last characters.
--Convert employee names to camelCase.
--Reverse only the first half of the employee name.
--Display employee names as a palindrome.
--Find the longest employee name.
--Find names containing only one vowel.
--Find names with repeated consecutive characters.
--Display employee names without vowels.
--Display employee names with alternate letters in uppercase.
--Display employee names with every space replaced by _.

----------------------------------------------------------------------------------------------
2.-- NUMERIC/NUMBER FUNCTIONS
a.-- CEIL()
SELECT CEIL(12.99); -> 13
SELECT CEIL(13.50); -> 14
SELECT CEIL(14.01); -> 15
SELECT CEIL(15.00); -> 15
SELECT CEIL(-123.34); -> -123

b.-- FLOOR()
SELECT FLOOR(12.99); -> 12
SELECT FLOOR(13.50); -> 13
SELECT FLOOR(14.01); -> 14
SELECT FLOOR(15.00); -> 15
SELECT FLOOR(-123.34); -> -124

c.-- ROUND()
SELECT ROUND(123.34); -> 123
SELECT ROUND(123.345,2); -> 123.35
SELECT ROUND(123.345,1); -> 123.3
SELECT ROUND(123.543,0); -> 124 
SELECT ROUND(123.543,-1); -> 120
SELECT ROUND(123.543,-2); -> 100
SELECT ROUND(555.555,-3); -> 1000

d.-- POWER()
SELECT POWER(2,5); -> 32
SELECT POWER(-2,5); -> -32
SELECT POWER(-2,4); -> 16
SELECT POWER(2.5,5); -> 97.65625
SELECT POWER(2.3,3.5); -> 18.452169105555043
SELECT POWER(8,0); -> 1

e.-- MOD()
SELECT MOD(25,4); -> 1
SELECT MOD(27,6); -> 3
SELECT MOD(-27,6); -> -3
SELECT MOD(-27,-6); -> -3
SELECT MOD(-27.4,-6); -3.4

e.-- SQRT()
SELECT SQRT(144); -> 12
SELECT SQRT(-144); --> ERROR:  cannot take square root of a negative number 

f.-- ABS()
SELECT ABS(-250); -> 250
SELECT ABS(-10); -> 10
SELECT ABS(-000.10); -> 0.10 

h.-- TRUNC()
SELECT TRUNC(123.34); -> 123
SELECT TRUNC(123.345,2); -> 123.34
SELECT TRUNC(123.345,1); -> 123.3
SELECT TRUNC(123.543,0); -> 123 
SELECT TRUNC(123.543,-1); -> 120
SELECT TRUNC(123.543,-2); -> 100
SELECT TRUNC(555.555,-3); -> 0

i.-- RANDOM()
SELECT RANDOM();

--QUERIES

--CEIL()
--Find the ceiling value of 12.34.
SELECT CEIL(12.34); -> 13
--Find the ceiling value of -12.34.
SELECT CEIL(-12.34); -> 12 
--Find the ceiling value of 15.99.
SELECT CEIL(15.99); -> 16
--Display employee salary after applying CEIL(sal/12).
SELECT empno, ename, CEIL(sal/12) FROM emp1; 
--Find monthly salary rounded up to the nearest integer.
SELECT empno, ename, sal, CEIL(sal) AS rounded_sal FROM emp1; 
--Display commission rounded up.
SELECT empno, ename, comm, CEIL(comm) FROM emp1; 

--FLOOR()
--Find the floor value of 12.99.
SELECT FLOOR(12.99); -> 12
--Find the floor value of -12.99.
SELECT FLOOR(-12.99); -> 13
--Find the floor value of 15.01.
SELECT FLOOR(15.01); -> 15
--Display monthly salary rounded down.
SELECT empno, ename, sal, FLOOR(sal) FROM emp1;
--Display commission rounded down.
SELECT empno, ename, comm, FLOOR(comm) FROM emp1;
--Compare CEIL() and FLOOR() on employee salaries.
SELECT empno, ename, sal, CEIL(sal) AS ceil_sal, FLOOR(sal) AS floor_sal FROM emp1;

--POWER()
--Find 2³.
SELECT POWER(2,3); -> 8
--Find 5⁴.
SELECT POWER(5,4); -> 625
--Find 10².
SELECT POWER(10,2); -> 100
--Display square of employee salary.
SELECT empno,ename,sal, POWER(sal,2) AS sq_sal FROM emp1;
--Display cube of commission.
SELECT empno,ename,comm, POWER(comm,2) AS cube_comm FROM emp1;
--Display salary raised to power 2.
SELECT empno,ename,sal, POWER(sal,2) AS sq_sal FROM emp1;

--MOD()
--Find remainder of 15 ÷ 4.
SELECT MOD(15,4); -> 3
--Find remainder of 100 ÷ 9.
SELECT MOD(100,9) -> 1
--Display employees whose employee number is even.
SELECT empno,ename FROM emp1
WHERE MOD(empno,2) = 0;
--Display employees whose employee number is odd.
SELECT empno,ename FROM emp1
WHERE MOD(empno,2) <> 0;
--Display employees whose salary is divisible by 100.
SELECT empno,ename,sal FROM emp1
WHERE MOD(sal,100) = 0;
--Find employees whose department number is even.
SELECT empno,ename,deptno FROM emp1
WHERE MOD(deptno,2) = 0;
--Display salaries whose remainder after division by 500 is zero.
SELECT empno,ename,sal FROM emp1
WHERE MOD(sal,500) = 0;

--SQRT()
--Find square root of 144.
SELECT SQRT(144); -> 12
--Find square root of 625.
SELECT SQRT(625); -> 25
--Find square root of employee salary.
SELECT empno,ename,sal,SQRT(sal) sal_sqrt FROM emp1;
--Find square root of annual salary.
SELECT empno,ename,sal,SQRT(sal*12) ann_sal_sqrt FROM emp1;
--Display square root of commission.
SELECT empno,ename,comm,SQRT(comm) comm_sqrt FROM emp1;

--ABS()
--Find absolute value of -100.
SELECT ABS(-100); -> 100
--Find absolute value of 100.
SELECT ABS(-100); -> 100
--Find difference between employee salary and 3000 using ABS().
SELECT empno,ename,sal,ABS(sal-3000) AS diff FROM emp1;
--Display absolute commission values.
SELECT empno,ename,comm,ABS(comm) AS abs_comm FROM emp1;
--Display difference between highest and lowest salary using ABS().
SELECT MAX(ABS(SAL))-MIN(ABS(SAL)) AS diff FROM emp1;

--ROUND()
--Round 123.45.
SELECT ROUND(123.45); -> 123
--Round 123.55.
SELECT ROUND(123.55); -> 124
--Round 123.456 to 2 decimal places.
SELECT ROUND(123.456,2); -> 123.46
--Round 123.456 to 1 decimal place.
SELECT ROUND(123.456,1); -> 123.5
--Round 123.456 to 0 decimal places.
SELECT ROUND(123.456,0); -> 123
--Round 123.456 to -1.
SELECT ROUND(123.456,-1); -> 120
--Round 123.456 to -2.
SELECT ROUND(123.456,-2); -> 100
--Round employee salary to nearest hundred.
SELECT empno,ename,sal,ROUND(sal,-2) FROM emp1;
--Round employee salary to nearest thousand.
SELECT empno,ename,sal,ROUND(sal,-3) FROM emp1;
--Round average salary to two decimal places.
SELECT ROUND(AVG(sal),2) AS average_salary FROM emp1;
--Display rounded monthly salary.
SELECT ROUND(sal) AS rounded_salary FROM emp1;

--TRUNC()
--Truncate 123.456.
SELECT TRUNC(123.456); -> 123
--Truncate 123.456 to 2 decimal places.
SELECT TRUNC(123.456,2); -> 123.45
--Truncate 123.456 to 1 decimal place.
SELECT TRUNC(123.456,1); -> 123.4
--Truncate 123.456 to 0 decimal places.
SELECT TRUNC(123.456,0); -> 123
--Truncate 123.456 to -1.
SELECT TRUNC(123.456,-1); -> 120
--Truncate employee salary to nearest hundred.
SELECT TRUNC(sal,-2) FROM emp1;
--Display truncated commission.
SELECT TRUNC(comm) FROM emp1;
--Compare ROUND() and TRUNC() using employee salary.
SELECT sal,ROUND(sal) AS rounded_sal,TRUNC(sal) AS trunc_sal FROM emp1;

--Mixed Numeric Function Questions
--Display employee salary and its square.
SELECT sal, POWER(sal,2) as sq_sal FROM emp1;
--Display employee salary and square root.
SELECT sal, SQRT(sal) as sqroot_sal FROM emp1;
--Display employee salary rounded to nearest hundred.
SELECT sal, ROUND(sal,-2) as rounded_sal FROM emp1;
--Display employee salary truncated to nearest hundred.
SELECT sal, TRUNC(sal,-2) as truncated_sal FROM emp1;
--Display annual salary rounded to nearest thousand.
SELECT sal, ROUND(sal*12,-3) as round_ann_sal FROM emp1;
--Display annual salary truncated to nearest thousand.
SELECT sal, TRUNC(sal*12,-3) as trunc_ann_sal FROM emp1;
--Find employees whose salary is an even number.
SELECT empno,ename,sal FROM emp1
WHERE MOD(sal,2)=0;
--Find employees whose salary is an odd number.
SELECT empno,ename,sal FROM emp1
WHERE MOD(sal,2)<>0;
--Display monthly salary rounded up.
SELECT empno,sal,CEIL(sal) FROM emp1;
--Display monthly salary rounded down.
SELECT empno,sal,FLOOR(sal) FROM emp1;
--Display salary difference from 5000 using ABS().
SELECT empno,sal,ABS(sal-5000) AS abs_diff FROM emp1;
--Display salary raised to power 3.
SELECT empno,sal,POWER(sal,3) FROM emp1;
--Display square root of annual salary.
SELECT empno,sal,sqrt(sal*12) FROM emp1;
--Display salary after dividing by 12 and applying ROUND().
SELECT empno,sal,ROUND(sal/12) FROM emp1;
--Display salary after dividing by 12 and applying TRUNC().
SELECT empno,sal,TRUNC(sal/12) FROM emp1;
--Display salary after dividing by 12 and applying CEIL().
SELECT empno,sal,CEIL(sal/12) FROM emp1;
--Display salary after dividing by 12 and applying FLOOR().
SELECT empno,sal,FLOOR(sal/12) FROM emp1;

--PostgreSQL-Specific Numeric Functions
--RANDOM()
--Generate a random number.
SELECT RANDOM();
--Generate a random integer between 1 and 100.
SELECT RANDOM(1,100);
--Select a random employee.
SELECT empno, ename, sal FROM emp1 
ORDER BY RANDOM() LIMIT 1;
----------------------------------------------------------------------------------------------
3.-- GENERAL FUNCTIONS
a.-- NVL()
SELECT NVL(comm,0) FROM emp;
b.-- NVL2()
SELECT NVL2(comm,'Has Commission','No Commission') FROM emp;
c.-- DECODE()
SELECT DECODE(deptno,10,'ACCOUNTING',20,'RESEARCH',30,'SALES','OTHERS') FROM emp;
d.-- NULLIF()
SELECT NULLIF(100,100);
SELECT NULLIF(100,50);
e.-- COALESCE()
SELECT COALESCE(NULL,NULL,NULL,100,50); -->100
SELECT COALESCE(NULL,NULL,NULL,100,NULL); -->100
SELECT ename,COALESCE(comm,0) FROM emp;

--QUERIES

--NVL() (Oracle)
--Display employee salary, replacing NULL commission with 0.
SELECT empno,ename,sal,NVL(comm,0) FROM emp1;
--Display total salary (SAL + COMM) by replacing NULL commission with 0.
SELECT empno,ename,sal+NVL(comm,0) AS total_sal FROM emp1;
--Display annual salary by treating NULL commission as 0.
SELECT empno,ename,(sal+NVL(comm,0))*12 AS total_ann_sal FROM emp1;
--Display manager number, replacing NULL with 0.
SELECT empno,ename,NVL(mgr,0) FROM emp1;
--Display employee name and commission, showing 'No Commission' when commission is NULL.
SELECT empno,ename,NVL(TO_CHAR(comm),'NO COMMISSION') FROM emp1;
OR
SELECT empno,ename,COALESCE(CAST(comm AS TEXT),'NO COMMISSION') FROM emp1; -->FOR POSTGRESQL

--NVL2() (Oracle)
--Display "Commission Available" if COMM is not NULL; otherwise "No Commission".
SELECT empno,ename,NVL2(comm,'Commission Available','No Commission') FROM emp1;
OR 
SELECT empno,ename,
	CASE
	WHEN comm IS NOT NULL THEN 'Commission Available'
	ELSE 'No Commission'
	END
FROM emp1; --> FOR POSTGRESQL
--Display commission if available; otherwise display salary.
SELECT empno,ename,NVL2(comm,comm,sal) FROM emp1;
OR 
SELECT empno,ename,COALESCE(comm,sal) FROM emp1; --> FOR POSTGRESQL
--Display employee bonus:- COMM exists → COMM × 2 - COMM NULL → 500
SELECT empno,ename,NVL2(comm,comm*2,500) FROM emp1;
OR 
SELECT empno,ename,
	CASE
	WHEN comm IS NOT NULL THEN comm*2
	ELSE 500
	END
FROM emp1; --> FOR POSTGRESQL
OR 
SELECT empno,ename,
	CASE
	WHEN comm IS NULL OR comm=0.00 THEN 500
	ELSE comm*2
	END
FROM emp1; --> FOR POSTRGRESQL HERE, IF ANY EMP COMMISSION IS ZERO 
--Display manager number if available; otherwise display 'No Manager'.
SELECT empno,ename,NVL2(mgr,mgr,'No Manager') FROM EMP1;
OR 
SELECT empno,ename,
	CASE 
	WHEN mgr IS NOT NULL THEN CAST(mgr AS TEXT) 
	ELSE 'No Manager'
	END
FROM emp1; --> FOR POSTRGRESQL
--Display "Eligible" if commission exists; otherwise "Not Eligible".
SELECT empno,ename,comm,NVL2(comm,'Eligible','Not Eligible') FROM emp1;
OR
SELECT empno,ename,
    CASE
    WHEN comm IS NOT NULL THEN 'Eligible'
    ELSE 'Not Eligible'
    END
FROM emp1; --> FOR POSTGRESQL

--DECODE() (Oracle Only)
--Display department names using department numbers.
SELECT empno,ename,DECODE(deptno,10,'ACCOUNTING',20,'RESEARCH',30,'SALES','OTHER') FROM emp1;
OR
SELECT empno,ename,
    CASE deptno
    WHEN 10 THEN 'ACCOUNTING'
    WHEN 20 THEN 'RESEARCH'
    WHEN 30 THEN 'SALES'
    ELSE 'OTHER'
    END
FROM emp1;
--Display job grades using JOB column.
SELECT empno, ename, job,DECODE(UPPER(job),'CLERK','E','SALESMAN','D','ANALYST','C','MANAGER','B','PRESIDENT','A','Unknown Grade') AS grade
FROM emp1;
OR 
SELECT empno, ename, job,
    CASE UPPER(job) 
    WHEN 'CLERK' THEN 'E' 
    WHEN 'SALESMAN' THEN 'D' 
    WHEN 'ANALYST' THEN 'C' 
    WHEN 'MANAGER' THEN 'B' 
    WHEN 'PRESIDENT' THEN 'A' 
    ELSE 'Unknown Grade' 
	END AS grade
FROM emp1; --> FOR POSTGRESQL
--Increase salary based on JOB: MANAGER → +1000 ANALYST → +800 Others → +500
SELECT empno,ename,job,DECODE(job,'MANAGER',sal+1000,'ANALYST',sal+800,sal+500) FROM emp1;
OR 
SELECT empno,ename,job,
    CASE UPPER(job)
    WHEN 'MANAGER' THEN sal+1000
    WHEN 'ANALYST' THEN sal+800
    ELSE sal+500
    END AS inc_sal
FROM emp1; --> FOR POSTGRESQL
--Convert department numbers into city names.
SELECT empno, ename, deptno, DECODE(deptno,10,'NEW YORK',20,'DALLAS',30,'CHICAGO',40,'BOSTON','REMOTE/OTHER') AS city_location FROM emp1;
OR 
SELECT empno, ename, deptno,
    CASE deptno
        WHEN 10 THEN 'NEW YORK'
        WHEN 20 THEN 'DALLAS'
        WHEN 30 THEN 'CHICAGO'
        WHEN 40 THEN 'BOSTON'
        ELSE 'REMOTE / OTHER'
    END AS city_location
FROM emp1;

--NULLIF()
--Compare salary and commission; return NULL if both are equal.
SELECT empno,ename,sal,comm,NULLIF(sal,comm) FROM emp1;
--Prevent division by zero using NULLIF().
SELECT empno,ename,sal,comm,sal/NULLIF(comm, 0) AS sal_to_comm_ratio 
FROM emp1; -- If comm is 0, NULLIF turns it to NULL, preventing the division-by-zero crash
--Compare two columns and return NULL when they are equal.
SELECT empno,ename,sal,comm,NULLIF(sal,comm) FROM emp1;
--Compare department number and manager number using NULLIF().
SELECT empno,ename,deptno,mgr,NULLIF(deptno,mgr) FROM emp1;

--COALESCE()
--Return the first non-NULL value among COMM, SAL, and 0.
SELECT empno,ename,comm,sal,COALESCE(comm,sal,0) FROM emp1;
--Return the first available phone number from Mobile, Home, Office.
SELECT empno,ename,COALESCE(mobile,home,office) FROM emp1;
--Return the first available address from Permanent, Temporary, Office.
SELECT empno,ename,COALESCE(permanant,temporary,office) FROM emp1;
--Calculate total income using COMM and 0.
SELECT empno,ename,sal,comm,bonus,sal+COALESCE(comm,0) FROM emp1;
--Display employee name and commission, showing 'No Commission' when commission is NULL.
SELECT empno,ename,COALESCE(CAST(comm AS TEXT),'NO COMMISSION') FROM emp1;

--PostgreSQL Extras

--Use GREATEST() to find the highest among Salary, Commission.
SELECT empno,ename,sal,comm,GREATEST(sal,COALESCE(comm, 0)) AS highest_pay_component
FROM emp1; --> Finds the highest value among the two, treating NULLs as 0
--Use LEAST() to find the smallest among Salary and Commission.
SELECT empno,ename,sal,comm,LEAST(COALESCE(sal,0),COALESCE(comm,0)) FROM emp1;
--Find the maximum of three numbers using GREATEST().
SELECT GREATEST(100,121,94);
--Find the minimum of three numbers using LEAST().
SELECT LEAST(100,121,94);
--Use COALESCE() with GREATEST().
SELECT empno,ename,sal,comm,GREATEST(sal,COALESCE(comm, 0)) AS highest_pay_component
--Use COALESCE() with LEAST().
SELECT empno,ename,sal,comm,LEAST(COALESCE(sal,0),COALESCE(comm,0)) FROM emp1;
--Replace NULL commission before calculating gross salary using COALESCE().
SELECT empno,ename,sal,comm,COALESCE(sal,0)+COALESCE(comm,0) as gross_sal FROM emp1;
--Find the greatest annual salary among employees.
SELECT empno,ename,sal,GREATEST(SAL*12) AS annu_sal FROM emp1;
--Display employee name with gross salary using COALESCE().
SELECT empno,ename,sal,comm,COALESCE(sal,0)+COALESCE(comm,0) as gross_sal FROM emp1;
----------------------------------------------------------------------------------------------
3.-- CONVERSION FUNCTIONS
a.-- CAST()
SELECT CAST('100' AS INTEGER);
SELECT CAST(121.36 AS INTEGER);
SELECT CAST(121 AS CHAR); --> 1
SELECT CAST(121 AS VARCHAR); --> 121
SELECT CAST(121 AS TEXT); --> 121
SELECT empno,ename,COALESCE(CAST(mgr AS TEXT),'CEO') FROM emp1;
SELECT empno,ename,COALESCE(TO_CHAR(mgr,'9999'),'CEO') FROM emp1;

b.-- TO_CHAR()
SELECT TO_CHAR(CURRENT_DATE,'DD-MM-YYYY');
SELECT TO_CHAR(CURRENT_DATE,'DD-MON-YYYY');
SELECT TO_CHAR(sal,'$9999.99') FROM emp1;
SELECT empno,ename,NVL(TO_CHAR(mgr,'9999'),'CEO') FROM emp1;

c.-- TO_DATE()
SELECT TO_DATE('06-07-2026','DD-MM-YYYY');--> 2026-07-06
SELECT TO_DATE('06-07-2026','MM-DD-YYYY');--> 2026-06-07
SELECT TO_DATE('06-JUL-26','DD-MON-YY');--> 2026-07-06
SELECT TO_DATE('06-JUL-2026','DD-MON-YYYY');--> 2026-07-06
SELECT TO_DATE('26-07-06','YY-DD-MM');--> 2026-06-07

d.-- TO_NUMBER()
SELECT TO_NUMBER('1250','9999'); --> 1250   
SELECT TO_NUMBER('12345.75','99999.99'); --> 12345.75
SELECT TO_NUMBER('D12C','9999'); --> 12
SELECT TO_NUMBER('ABDC','9999'); --> error

--QUERIES

--CAST() (ANSI SQL / PostgreSQL / Oracle)
--Convert an integer to VARCHAR.
SELECT CAST(123 AS VARCHAR);
OR 
SELECT 123 :: VARCHAR;
--Convert a string '12345' to an integer.
SELECT CAST('12345' AS INTEGER);
--Convert a string '1234.56' to a numeric value.
SELECT CAST('12345.56' AS NUMERIC);
--Convert employee salary to VARCHAR.
SELECT empno,ename,CAST(sal AS VARCHAR) FROM emp1;
--Convert employee number to text.
SELECT empno,CAST(empno AS TEXT) FROM emp1;
--Convert a string '2026-07-17' to DATE using CAST().
SELECT CAST('2026-07-17' AS DATE) FROM emp1;
--Convert a DATE to TIMESTAMP.
SELECT CAST(CURRENT_DATE AS TIMESTAMP) FROM emp1;
--Convert TIMESTAMP to DATE.
SELECT CAST(NOW() AS DATE) FROM emp1;
OR 
SELECT NOW()::DATE FROM emp1;
--Convert salary to DECIMAL(10,2).
SELECT empno,ename,sal,CAST(sal AS NUMERIC(10,2)) FROM emp1;
--Find employees whose salary is greater than '3000' after converting the string to a number.
SELECT empno,ename,sal FROM emp1
WHERE sal > '3000'::INTEGER

--TO_CHAR() (Oracle & PostgreSQL)
--Number Formatting
--Display salary as a character string.
SELECT empno,ename,sal,TO_CHAR(sal,'99999') FROM emp1;
--Display salary with commas (e.g., 12,345).
SELECT empno,ename,sal,TO_CHAR(sal,'99,999') FROM emp1;
--Display salary with two decimal places.
SELECT empno,ename,sal,TO_CHAR(sal,'99999.99') FROM emp1;
--Display salary with leading zeros.
SELECT empno,ename,sal,TO_CHAR(sal,'09999.99') FROM emp1;
--Display annual salary in formatted currency.
SELECT empno,ename,sal,TO_CHAR(sal*12,'$999999.99') AS annu_sal FROM emp1;
--Date Formatting
--Display the hire date as DD-MM-YYYY.
SELECT empno,ename,hiredate,TO_CHAR(hiredate,'DD-MM-YYYY') FROM emp1;
--Display the hire date as DD-MON-YYYY.
SELECT empno,ename,hiredate,TO_CHAR(hiredate,'DD-MON-YYYY') FROM emp1;
--Display the hire date as Month DD, YYYY.
SELECT empno,ename,hiredate,TO_CHAR(hiredate,'MONTH DD, YYYY') FROM emp1;
--Display only the month name from the hire date.
SELECT empno,ename,hiredate,TO_CHAR(hiredate,'MONTH') AS hiring_month FROM emp1;
--Display only the day name from the hire date.
SELECT empno,ename,hiredate,TO_CHAR(hiredate,'DAY') AS hiring_day FROM emp1;
--Display only the year from the hire date.
SELECT empno,ename,hiredate,TO_CHAR(hiredate,'YYYY') AS hiring_year FROM emp1;
--Display the current date in DD/MM/YYYY format.
SELECT TO_CHAR(CURRENT_DATE,'DD/MM/YYYY');
--Display the current timestamp in DD-MM-YYYY HH24:MI:SS.
SELECT TO_CHAR(CURRENT_TIMESTAMP,'DD-MM-YYYY HH24:MI:SS');
--Display the day number of the week.
SELECT TO_CHAR(CURRENT_TIMESTAMP,'D');
--Display the week number of the year.
SELECT TO_CHAR(CURRENT_TIMESTAMP,'WW');

--TO_DATE() (Oracle)
--Convert '15-08-2025' to a DATE.
SELECT TO_DATE('15-08-2025','DD-MM-YYYY');
--Convert '2025/08/15' to a DATE.
SELECT TO_DATE('2025/08/15','YYYY/MM/DD');
--Convert '15-AUG-2025' to a DATE.
SELECT TO_DATE('15-AUG-2025','DD-MON-YYYY');
--Find employees hired after '01-JAN-1982' using TO_DATE().
SELECT empno,ename,hiredate FROM emp1
WHERE hiredate > TO_DATE('01-JAN-1982','DD-MON-YYYY');
--Insert a date using TO_DATE().
INSERT INTO emp1 VALUES(9999,'ABCD','VC',7369,TO_DATE('17-07-2026','DD-MM-YYYY'),1000.00,400);
--Compare a date column with a converted string date '17-12-1980'. 
SELECT empno, ename, hiredate 
FROM emp1
WHERE hiredate = TO_DATE('17-12-1980', 'DD-MM-YYYY');
--Find employees hired between two dates '01-01-1982' and '31-12-1983' using TO_DATE().
SELECT empno, ename, hiredate 
FROM emp1
WHERE hiredate BETWEEN TO_DATE('01-01-1981', 'DD-MM-YYYY') AND TO_DATE('31-12-1983', 'DD-MM-YYYY');
--PostgreSQL Note: PostgreSQL also supports TO_DATE(text, format), but you can often use CAST('2025-08-15' AS DATE) 
--or the DATE '2025-08-15' literal.

--TO_NUMBER() (Oracle)
--Convert '12345' to a number.
SELECT TO_NUMBER('12345','99999');--> ORACLE
SELECT TO_NUMBER('12345','99999');--> FOR POSTGRESQL
--Convert '12345.67' to a number.
SELECT TO_NUMBER('12345.67','99999.99');
--Convert a formatted string '12,345' to a number.
SELECT TO_NUMBER('12,345','99,999');
--Compare salary with a numeric string '3000.00' using TO_NUMBER().
SELECT empno, ename, sal 
FROM emp1
WHERE sal = TO_NUMBER('3000.00', '99999.99');
--Add two numeric strings after converting them to numbers.
SELECT TO_NUMBER('123','999')+ TO_NUMBER('345','999');
--Convert a salary stored as text into a numeric value.
SELECT empno, ename, TO_NUMBER(sal,'99999.99') FROM emp1
--PostgreSQL Note: Prefer CAST() or ::numeric instead of TO_NUMBER() for plain conversions. Use TO_NUMBER() 
--mainly when parsing formatted numeric strings.

--PostgreSQL-Specific Practice
--Convert a string to INTEGER using ::INT.
SELECT '99999':: INT;
--Convert salary to TEXT using ::TEXT.
SELECT empno,ename,sal :: TEXT FROM emp1;
--Convert a string to NUMERIC using ::NUMERIC.
SELECT '95486.32' :: NUMERIC;
--Convert a string to DATE using ::DATE.
SELECT '15-05-1985' :: DATE;
--Convert CURRENT_TIMESTAMP to DATE.
SELECT CURRENT_TIMESTAMP :: DATE;
--Compare CAST() and :: notation for the same conversion.
SELECT empno, ename, CAST(sal AS NUMERIC(10,2)) FROM emp1;
SELECT empno, ename, sal :: NUMERIC(10,2) FROM emp1;
--Convert 'true' to BOOLEAN.
SELECT 'true' :: BOOLEAN;
--Convert BOOLEAN to TEXT.
SELECT false :: TEXT;
--Convert a numeric value to TEXT and concatenate it with employee name.
SELECT CONCAT(empno :: TEXT,ename) FROM emp1;
--Convert a DATE to TEXT and display it in a report.
SELECT hiredate :: TEXT FROM emp1;

--Interview / Practical Questions
--Display employee name, salary, and formatted hire date in a single query.
--Convert salary to text and concatenate it with ' INR'.
--Display annual salary with commas and two decimal places.
--Find employees hired after a user-entered date string.
--Convert user input to the appropriate data type before comparison.
--Insert employee data where the joining date is provided as a string.
--Convert a formatted amount ('₹12,500.50' or '12,500.50') into a numeric value.
--Display the current date and time in a custom report format.
--Display month-wise hiring information using formatted dates.
--Build a report showing employee name, formatted salary, and formatted hire date.
----------------------------------------------------------------------------------------------
4.-- DATE FUNCTIONS
a.-- CURRENT_DATE
SELECT CURRENT_DATE; --> FOR POSTGRESQL & MYSQL
SELECT SYSDATE FROM DUAL;--> FOR ORACLE

b.-- CURRENT_TIME
SELECT CURRENT_TIME;

c.-- CURRENT_TIMESTAMP
SELECT CURRENT_TIMESTAMP;
SELECT SYSTIMESTAMP FROM DUAL; --> FOR ORACLE

d.-- NOW()
SELECT NOW();
SELECT SYSTIMESTAMP FROM DUAL; --> FOR ORACLE

e.-- AGE
SELECT AGE('2026-07-06','2000-01-15'); --> 26 years 5 mons 22 days
SELECT AGE('2023-11-29','20-07-2026'); --> -2 years -7 mons -21 days

f.-- EXTRACT()
SELECT EXTRACT(YEAR FROM CURRENT_DATE);
SELECT EXTRACT(MONTH FROM CURRENT_DATE);
SELECT EXTRACT(DAY FROM CURRENT_DATE);
SELECT EXTRACT(SECONDS FROM NOW());
SELECT EXTRACT(MINUTES FROM NOW());

g.-- DATE_TRUNC()
SELECT DATE_TRUNC('month',CURRENT_TIMESTAMP); --> 2026-07-20 00:00:00+05:30
SELECT DATE_TRUNC('month',CURRENT_TIMESTAMP); --> 2026-07-01 00:00:00+05:30
SELECT DATE_TRUNC('year',CURRENT_TIMESTAMP); --> 2026-01-01 00:00:00+05:30

h.-- TO_TIMESTAMP()
SELECT TO_TIMESTAMP('2026-07-12 10:30:45','YYYY-MM-DD HH24:MI:SS'); --> 2026-07-12 10:30:45+05:30
SELECT TO_TIMESTAMP('2026-07-07 10:30:45','YYYY-DD-MM HH24:MI:SS'); --> 2026-12-07 10:30:45+05:30

i.-- INTERVAL
SELECT CURRENT_DATE + INTERVAL '5 days';
SELECT CURRENT_TIMESTAMP + INTERVAL '2 hours';
SELECT NOW() + INTERVAL '2 hours';  
SELECT CURRENT_DATE + INTERVAL '10 days';
SELECT CURRENT_DATE - INTERVAL '1 month';

j.-- ADD_MONTHS()
SELECT ADD_MONTHS(TO_DATE('09-07-2026','DD-MM-YYYY'),3) FROM dual;
SELECT DATE '2026-07-09'+ INTERVAL '3 months'; --> FOR POSTGRESQL
SELECT ADD_MONTHS(SYSDATE,'DD-MM-YYYY'),3) FROM dual;

k.--MONTHS_BETWEEN()
SELECT MONTHS_BETWEEN(SYSDATE,DATE '2026-01-09') FROM dual; --> FOR ORACLE
SELECT EXTRACT(YEAR FROM AGE(DATE '2026-07-09',DATE '2023-01-09')) * 12 +
        EXTRACT(MONTH FROM AGE(DATE '2026-07-09',DATE '2026-01-09')); --> FOR POSTGRESQL
SELECT EXTRACT(MONTH FROM AGE(DATE '2026-07-09',DATE '2026-01-09')); --> FOR POSTGRESQL IF YEAR IS SAME

l.-- LAST_DAY()
SELECT LAST_DAY(SYSDATE) FROM dual;
SELECT DATE_TRUNC('MONTH',CURRENT_DATE)+ INTERVAL '1 MONTH'- INTERVAL '1 DAY';

m.-- NEXT_DAY()
SELECT next_day(CURRENT_DATE, 'MON');
SELECT next_day(DATE '2026-07-20', 'FRI');
SELECT next_day(CURRENT_DATE, 'SUNDAY');