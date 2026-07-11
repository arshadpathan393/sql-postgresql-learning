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
------------------------------------------------------------------------------------------------------------------------

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