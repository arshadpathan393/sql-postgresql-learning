# Functions

## What are Functions?
    -> Functions are predefined programs provided by the database.
    -> They accept one or more values as input and return a result.
    -> Functions are used to perform calculations, manipulate data and
    retrieve meaningful information.

### Example
    -> SELECT UPPER('arshad');
    -> SELECT COUNT(*) FROM emp;
### Important Notes
    -> Functions simplify SQL queries.
    -> They reduce the amount of SQL code.
    -> Functions can be used in SELECT, WHERE, ORDER BY and HAVING clauses.
---

## Types of Functions
1. Multi Row Functions (MRF)
2. Single Row Functions (SRF)
---

# 1. Multi Row Functions (MRF)
    -> Multi Row Functions are also called Aggregate Functions.
    -> They operate on multiple rows and return a single result.
    -> NULL values are ignored except by COUNT(*).
    -> MRF can accept only one argument.
    -> Along with MRF we are not supposed to add any other column in SELECT clause.
    -> We cannot use MRF in WHERE clause.
    -> COUNT() is the only MRF which can accept * as an argument.

## Types of Multi Row Functions
    COUNT()
    SUM()
    AVG()
    MIN()
    MAX()
---

## COUNT() Function
    -> COUNT() returns the total number of rows of the table or number of records in the column.
    -> COUNT() will not count NULL values.
### Syntax
    SELECT COUNT(*) FROM table_name;
### Example
    -> SELECT COUNT(*) FROM emp; ->    14
    -> SELECT COUNT(comm) FROM emp; ->   4 (Counts only non-NULL values.)

### Important Notes
    -> COUNT(*) counts all rows.
    -> COUNT(column_name) ignores NULL values.
    -> COUNT() always returns a numeric value.
### Interview Point
    Q. What is the difference between COUNT(*) and COUNT(column_name)?
    Ans.
        -> COUNT(*) counts all rows.
        -> COUNT(column_name) counts only non-NULL values.
---

## SUM() Function
    -> SUM() returns the total of numeric values i.e., summation of all the values in given column.

### Syntax
    SELECT SUM(column_name) FROM table_name;
### Example
    SELECT SUM(sal) FROM emp;

### Important Notes
    -> Works only with numeric columns.
    -> NULL values are ignored.
### Interview Point
    Q. Can SUM() be used on character columns?
    Ans.
        -> No
--- 

## AVG() Function
    -> AVG() returns the average value of a numeric column.

### Syntax
    SELECT AVG(column_name) FROM table_name;
### Example
    SELECT AVG(sal) FROM emp;

### Important Notes
    -> Works only with numeric columns.
    -> NULL values are ignored.
    -> Average is calculated using non-NULL values.
### Interview Point
    Q. Does AVG() consider NULL values?
    Ans.
        -> No
---

## MIN() Function
    -> MIN() returns the smallest value or smallest character.

### Syntax
    SELECT MIN(column_name) FROM table_name;
### Example
    SELECT MIN(sal) FROM emp;
    SELECT MIN(sal),MIN(ename),MIN(hiredate) FROM emp1;
### Important Notes
    -> Works with numbers, dates and character data.
    -> NULL values are ignored.
### Interview Point
    Q. Which function returns the smallest value?
    Ans.
        -> MIN()
---

## MAX() Function
    -> MAX() returns the largest value.

### Syntax
    SELECT MAX(column_name) FROM table_name;
### Example
    SELECT MAX(sal) FROM emp;
    SELECT MAX(sal), MAX(hiredate), MAX(ename) FROM emp1;

### Important Notes
    -> Works with numbers, dates and character data.
    -> NULL values are ignored.
### Interview Point
    Q. Which function returns the largest value?
    Ans.
        -> MAX()
---

## Real-Time Examples

### Total Employees
    SELECT COUNT(*) FROM emp;
### Total Salary
    SELECT SUM(sal) FROM emp;
### Average Salary
    SELECT AVG(sal) FROM emp;
### Lowest Salary
    SELECT MIN(sal) FROM emp;
### Highest Salary
    SELECT MAX(sal) FROM emp;
---

## Summary
    COUNT() -> Counts rows.
    SUM()   -> Calculates total.
    AVG()   -> Calculates average.
    MIN()   -> Returns smallest value.
    MAX()   -> Returns largest value.
---

## Most Asked Interview Questions
    Q. What are Multi Row Functions?
    Ans.
        -> Functions that operate on multiple rows and return one result.
    Q. Which aggregate function counts all rows?
    Ans.
        -> COUNT(*)
    Q. Which aggregate function ignores NULL values?
    Ans.
        -> SUM(), AVG(), MIN(), MAX() and COUNT(column_name)
    Q. Difference between COUNT(*) and COUNT(column_name)?
    Ans.
        -> COUNT(*) counts all rows.
        -> COUNT(column_name) counts only non-NULL values.
---

## Best Practices
    -> Use COUNT(*) when counting total rows.
    -> Use COUNT(column_name) only when NULL values should be excluded.
    -> Use meaningful aliases for aggregate results.
    -> Verify that aggregate functions are used on appropriate data types.
---
## Common Mistakes
    -> Confusing COUNT(*) with COUNT(column_name).
    -> Expecting AVG() to include NULL values.
    -> Using SUM() on non-numeric columns.
    -> Assuming MIN() and MAX() work only with numbers.
---
## Performance Tips
    -> Use COUNT(*) instead of retrieving all rows when only the row count
    is required.
    -> Avoid unnecessary aggregate calculations on large datasets.
    -> Create indexes on frequently aggregated columns when appropriate.
    -> Use aggregate functions only on required columns.

-------------------------------------------------------------------------------------------------------


# 2. Single Row Functions (SRF)
    -> Single Row Functions operate on one row at a time.
    -> They accept one input value and return one output value.
    -> A separate result is returned for every row processed.

## Types of Single Row Functions
1. Character Functions
2. Numeric Functions
3. General Functions
4. Conversion Functions
5. Date Functions
---
# 2.1 Character Functions
    -> Character functions are used to manipulate character or string data.
    -> They return either character values or numeric values.
## Types of Character Functions
    1. Case Manipulation
        UPPER()
        LOWER()
        INITCAP()
    2. Character Manipulation
        LENGTH()
        REVERSE()
        REPLACE()    
        CONCAT()
        SUBSTR()
        INSTR() / POSITION() / STRPOS()
        TRIM()
        LTRIM()
        RTRIM()
        LPAD()
        RPAD()
        LEFT()
        RIGHT()
        SPLIT_PART()
        TRANSLATE()
        ASCII()
        CHR()
        REPEAT()
        OVERLAY()
        REGEXP_REPLACE()
        REGEXP_MATCHES()
        STRING_AGG() 
---

## UPPER() Function
    -> UPPER() converts all alphabetic characters into uppercase.
### Syntax
    SELECT UPPER(column_name) FROM table_name;
### Example
    SELECT UPPER(ename) FROM emp;

### Important Notes
    -> Converts lowercase letters into uppercase.
    -> Non-alphabetic characters remain unchanged.
    -> Frequently used for case-insensitive comparisons.
### Interview Point
    Q. Which function converts a string into uppercase?
    Ans.
        -> UPPER()
---

## LOWER() Function
    -> LOWER() converts all alphabetic characters into lowercase.

### Syntax
    SELECT LOWER(column_name) FROM table_name;
### Example
    SELECT LOWER(ename) FROM emp;

### Important Notes
    -> Converts uppercase letters into lowercase.
    -> Frequently used while storing normalized data.
### Interview Point
    Q. Which function converts text into lowercase?
    Ans.
        -> LOWER()
---

## INITCAP() Function
    -> INITCAP() converts the first letter of every word into uppercase.

### Syntax
    SELECT INITCAP(column_name) FROM table_name;
### Example
    SELECT INITCAP('java backend developer');

### Database Difference
    PostgreSQL
        INITCAP()

    Oracle
        INITCAP()

    MySQL
        No built-in INITCAP().

### Important Notes
    -> Used to format names and addresses.
    -> Capitalizes the first letter of every word.
### Interview Point
    Q. Which function capitalizes the first letter of each word?
    Ans.
        -> INITCAP()
---

## LENGTH() Function
-> LENGTH() returns the number of characters in a string.
### Syntax
    SELECT LENGTH(column_name) FROM table_name;
### Example
    SELECT ename,LENGTH(ename) FROM emp;

### Important Notes
    -> Spaces are counted as characters.
    -> Returns an integer value.

### Interview Point
    Q. What does LENGTH() return?
    Ans.
        -> Number of characters in a string.
---

## REVERSE() Function
    -> REVERSE() returns the characters of a string in reverse order.
### Syntax
    SELECT REVERSE(string);
### Example
    SELECT REVERSE(ename) FROM emp;

### Database Difference
    PostgreSQL
        REVERSE()

    Oracle
        REVERSE()

    MySQL
        REVERSE()

### Important Notes
    -> Mainly used for string manipulation.
    -> Oracle provide a built-in REVERSE() function.
    -> Returns the reversed string.
### Interview Point
    Q. Which function reverses a string?
    Ans.
        -> REVERSE()  
---

## REPLACE() Function
    -> REPLACE() replaces all occurrences of a specified substring
       with another substring.
### Syntax
    SELECT REPLACE(string,old_value,new_value);
### Example
    SELECT REPLACE(job,'SALESMAN','SALES EXECUTIVE') FROM emp;

### Important Notes
    -> Replaces every occurrence of the specified text.
    -> Returns the original string if no match is found.
    -> Case-sensitive in PostgreSQL.
### Interview Point
    Q. Which function replaces a substring
    Ans.
        -> REPLACE()
---

## CONCAT() Function
    -> CONCAT() joins two or more strings into a single string.

### Syntax
    SELECT CONCAT(string1,string2);
### Example
    SELECT CONCAT(ename,job) FROM emp;

### Database Difference
    PostgreSQL
        CONCAT() or ||

    Oracle
        CONCAT() or ||

    MySQL
        CONCAT()

### Important Notes
    -> PostgreSQL supports both CONCAT() and ||.
    -> Oracle supports both CONCAT() and ||.
    -> MySQL mainly uses CONCAT().
### Interview Point
    Q. Which database supports both CONCAT() and || ?
    Ans.
        -> PostgreSQL and Oracle
---

## SUBSTR() Function
    -> SUBSTR() extracts a part of a string.
### Syntax
    SELECT SUBSTR(string,start_position,length);
### Example
    SELECT SUBSTR(ename,1,3) FROM emp;
    SELECT SUBSTR('QSPIDERS',-3,2); -> In PostgreSQL negavtive position not works for this we can use RIGHT() function

    -> Oracle supports negative starting positions in SUBSTR().
        SELECT SUBSTR('QSPIDERS',-3,2)
        FROM dual;

    -> PostgreSQL developers generally use RIGHT() when extracting
    characters from the end of a string.
        SELECT LEFT(RIGHT('QSPIDERS',3),2);

### Important Notes
    -> Position starts from 1.
    -> Length parameter is optional.
    -> Negative position not works in PostgreSQL.
    -> In SUBSTR() length will never fetches in negative.
### Interview Point
    Q. Which function extracts part of a string?
    Ans.
        -> SUBSTR()
---

## INSTR() / POSITION() Function
    -> Returns the position of a character or substring within a string.

### Database Difference
    PostgreSQL
        POSITION()
        STRPOS()

    Oracle
        INSTR()

    MySQL
        INSTR()

### PostgreSQL Example
    SELECT POSITION('A' IN ename) FROM emp;
    SELECT POSITION('ARSHAD,'A') FROM emp;
### Oracle Example
    SELECT INSTR(ename,'A') FROM emp;

### Important Notes
    -> Returns the position of the first occurrence.
    -> Returns 0 when the substring is not found.
    -> PostgreSQL commonly uses POSITION() or STRPOS().
### Interview Point
    Q. Which function returns the position of a substring?
    Ans.
        -> INSTR() in Oracle/MySQL
        -> POSITION() or STRPOS() in PostgreSQL
---

## TRIM() Function
    -> TRIM() removes leading and trailing spaces from a string.
### Syntax
    SELECT TRIM(string);
    SELECT TRIM(char_to_remove FROM string);
### Example
    SELECT TRIM('   ARSHAD   ');
    SELECT TRIM('NI' FROM 'NITIN'); -> 'T'
        --> Here, 'NI' is a trimset in oracle trimset should be one char but postgre supports it
        it removes 'N', 'I' from both ends till another character find.
    SELECT TRIM('NI' FROM 'NITINLMN'); -> TINLM
### Important Notes
    -> Removes spaces from both ends.
    -> Does not remove spaces between words.
    -> Can also remove specified characters.

### Interview Point
    Q. Which function removes spaces from both sides?
    Ans.
        -> TRIM()
---

## LTRIM() Function
    -> LTRIM() removes leading spaces from a string.
### Syntax
    SELECT LTRIM(string, char_to_remove);
### Example
    SELECT LTRIM('     ARSHAD');

### Important Notes
    -> Removes spaces from the left side only.
    -> Right-side spaces remain unchanged.
### Interview Point
    Q. Which function removes spaces from the left side?
    Ans.
        -> LTRIM()
---

## RTRIM() Function
    -> RTRIM() removes trailing spaces from a string.

### Syntax
    SELECT RTRIM(string, char_to_remove);
### Example
    SELECT RTRIM('ARSHAD     ');

### Important Notes
    -> Removes spaces from the right side only.
    -> Left-side spaces remain unchanged.
### Interview Point
    Q. Which function removes spaces from the right side?
    Ans.
        -> RTRIM()
---

## Most Asked Interview Questions
    Q. Difference between TRIM(), LTRIM() and RTRIM()?
    Ans.
        -> TRIM() removes spaces from both sides.
        -> LTRIM() removes leading spaces.
        -> RTRIM() removes trailing spaces.
    Q. Which function extracts part of a string?
    Ans.
        -> SUBSTR()
    Q. Which function replaces a substring?
    Ans.
        -> REPLACE()
    Q. Difference between CONCAT() and '||'?
    Ans.
        -> CONCAT() is a function.
        -> '||' is the concatenation operator.
    Q. Which function returns the length of a string?
    Ans.
        -> LENGTH()
---

## LPAD() Function
    -> LPAD() pads characters on the left side of a string.
    -> It returns a string of the specified length.

### Syntax
    SELECT LPAD(string,total_length,pad_string);

### Example
    SELECT LPAD(ename,10,'*')
    FROM emp;
### Output
    *****SMITH
    *****ALLEN

### Important Notes
    -> Adds characters to the left.
    -> If the string exceeds the specified length,
    it is truncated.
    -> Frequently used in report formatting.
### Interview Point
    Q. Which function pads characters on the left?
    Ans.
        -> LPAD()
---

## RPAD() Function
    -> RPAD() pads characters on the right side of a string.
    -> It returns a string of the specified length.

### Syntax
    SELECT RPAD(string,total_length,pad_string);
### Example
    SELECT RPAD(ename,10,'*')
    FROM emp;
### Output
    SMITH*****
    ALLEN*****

### Important Notes
    -> Adds characters to the right.
    -> Commonly used while generating formatted reports.
    -> If the string exceeds the specified length,
    it is truncated.
### Interview Point
    Q. Which function pads characters on the right?
    Ans.
        -> RPAD()
---

## LEFT() Function
    -> LEFT() returns the specified number of characters from the left side of a string.
### Syntax
    SELECT LEFT(string,number_of_characters);
### Example
    SELECT LEFT(ename,3) FROM emp;

### Database Difference
    PostgreSQL
        LEFT()

    Oracle
        SUBSTR(string,1,n)

    MySQL
    LEFT()

### Important Notes
    -> Returns characters from the beginning of the string.
    -> PostgreSQL and MySQL support LEFT() directly.
    -> Oracle uses SUBSTR() for the same functionality.
### Interview Point
    Q. What is the Oracle equivalent of LEFT()?
    Ans.
        -> SUBSTR(string,1,n)
---

## RIGHT() Function
    -> RIGHT() returns the specified number of characters from the right
    side of a string.

### Syntax
    SELECT RIGHT(string,number_of_characters);
### Example
    SELECT RIGHT(ename,2) FROM emp;

### Database Difference
    PostgreSQL
        RIGHT()

    Oracle
        SUBSTR(string,-n)

    MySQL
        RIGHT()

### Important Notes
    -> Returns characters from the end of the string.
    -> Oracle uses SUBSTR() with a negative starting position.

### Interview Point
    Q. What is the Oracle equivalent of RIGHT()?
    Ans.
        -> SUBSTR(string,-n)

---

## SPLIT_PART() Function
    -> SPLIT_PART() splits a string using a specified delimiter.
    -> It returns the requested part of the string.
    -> PostgreSQL provides this function.
### Syntax
    SELECT SPLIT_PART(string,delimiter,position);
### Example
    SELECT SPLIT_PART('Java,SQL,Spring',',',2);
    SELECT SPLIT_PART('arshad@gmail.com','@',1);

### Database Difference
    PostgreSQL
        SPLIT_PART()

    Oracle
        REGEXP_SUBSTR()

    MySQL
        SUBSTRING_INDEX()

### Important Notes
    -> Position starts from 1.
    -> Returns an empty string if the position
    does not exist.
    -> Frequently used while processing CSV data.
### Interview Point
    Q. Which PostgreSQL function splits a string using a delimiter?
    Ans.
        -> SPLIT_PART()
---

## TRANSLATE() Function
    -> TRANSLATE() replaces individual characters in a string.
    -> Each character is replaced based on its position.
### Syntax
    SELECT TRANSLATE(string,from_characters,to_characters);
### Example
    SELECT TRANSLATE('QSPIDERS','QS','AB');

### Database Difference
    PostgreSQL
        TRANSLATE()

    Oracle
        TRANSLATE()

    MySQL
        No direct equivalent.

### Important Notes
    -> Replaces characters, not words.
    -> Different from REPLACE().
    -> Useful for character mapping.
### Interview Point
    Q. Difference between TRANSLATE() and REPLACE()?
    Ans.
        -> TRANSLATE() replaces characters.
        -> REPLACE() replaces substrings.
---

## ASCII() Function
    -> ASCII() returns the ASCII value of the first character.
### Syntax
    SELECT ASCII(character);
### Example
    SELECT ASCII('A');
    SELECT ASCII('a');

### Important Notes
    -> Returns the ASCII value of only the first character.
    -> Commonly asked in interviews.
    -> Works with character data.
### Interview Point
    Q. What is the ASCII value of 'A'?
    Ans.
        -> 65
---

## CHR() Function
    -> CHR() returns the character represented by an ASCII value.
### Syntax
    SELECT CHR(ascii_value);
### Example
    SELECT CHR(65);
    SELECT CHR(97);

### Important Notes
    -> Opposite of ASCII().
    -> Converts an ASCII value into a character.
    -> Useful while generating special characters.
### Interview Point
    Q. Which function is opposite of ASCII()?
    Ans.
        -> CHR()
---

## REPEAT() Function
    -> REPEAT() repeats a string the specified number of times.
    -> It returns a new string containing repeated copies.
### Syntax
    SELECT REPEAT(string,number_of_times);
### Example
    SELECT REPEAT('SQL',3);
    SELECT REPEAT('*',10);

### Database Difference
    PostgreSQL
        REPEAT()

    Oracle
        RPAD()

    MySQL
        REPEAT()

### Oracle Equivalent
    SELECT RPAD('SQL',9,'SQL')
    FROM dual;

### Important Notes
    -> Repeats the complete string.
    -> Frequently used while generating sample data.
    -> Useful for formatting reports.
### Interview Point
    Q. Which function repeats a string multiple times?
    Ans.
        -> REPEAT()
---

## OVERLAY() Function
    -> OVERLAY() replaces a portion of a string with another string.
    -> PostgreSQL provides this function.
### Syntax
    SELECT OVERLAY(string PLACING new_string FROM start_position FOR length);                
### Example
    SELECT OVERLAY('QSPIDERS' PLACING 'JAVA' FROM 3 FOR 4);
    SELECT OVERLAY('PostgreSQL' PLACING 'Java' FROM 1 FOR 4);

### Database Difference
    PostgreSQL
        OVERLAY()

    Oracle
        No direct equivalent.

    MySQL
        No direct equivalent.

### Important Notes
    -> Replaces characters at a specified position.
    -> PostgreSQL-specific function.
    -> Similar to combining SUBSTR() and CONCAT().
### Interview Point
    Q. Which PostgreSQL function replaces part of a string at a specified position?
    Ans.
        -> OVERLAY()
---

## REGEXP_REPLACE() Function
    -> REGEXP_REPLACE() replaces text that matches a regular expression.
    -> It is commonly used for data cleaning and validation.
### Syntax
    SELECT REGEXP_REPLACE(string, pattern, replacement, flags);
### Example
    SELECT REGEXP_REPLACE('987-654-3210','[^0-9]','','g');
    SELECT REGEXP_REPLACE('Java123SQL456','[0-9]','','g');

### Database Difference
    PostgreSQL
        REGEXP_REPLACE()

    Oracle
        REGEXP_REPLACE()

    MySQL
        REGEXP_REPLACE()
        (MySQL 8.0+)

### Important Notes
    -> Uses regular expressions for pattern matching.
    -> 'g' replaces all matching occurrences.
    -> Frequently used for cleaning imported data.
### Interview Point
    Q. Which function replaces text using regular expressions?
    Ans.
        -> REGEXP_REPLACE()
---

## REGEXP_MATCHES() Function
    -> REGEXP_MATCHES() returns text matching a regular expression.
    -> PostgreSQL supports this function.
### Syntax
    SELECT REGEXP_MATCHES(string,pattern);
### Example
    SELECT REGEXP_MATCHES('Java SQL Spring', 'SQL');
    SELECT REGEXP_MATCHES('abc123xyz', '[0-9]+');

### Database Difference
    PostgreSQL
        REGEXP_MATCHES()

    Oracle
        REGEXP_SUBSTR()

    MySQL
        REGEXP_SUBSTR()
        (MySQL 8.0+)

### Important Notes
    -> Returns matching text.
    -> Supports powerful pattern matching.
    -> Frequently used in validations.

### Interview Point
    Q. Which PostgreSQL function returns text matching a regular expression?
    Ans.
        -> REGEXP_MATCHES()
---

## STRING_AGG() Function
    -> STRING_AGG() combines values from multiple rows into a single string.
    -> It is an aggregate function.

### Syntax
    SELECT STRING_AGG(column_name,separator) FROM table_name;
### Example
    SELECT STRING_AGG(ename,', ') FROM emp;
    SELECT deptno,STRING_AGG(ename,', ') FROM emp GROUP BY deptno;

### Database Difference
    PostgreSQL
        STRING_AGG()

    Oracle
        LISTAGG()

    MySQL
        GROUP_CONCAT()

### Important Notes
    -> Aggregate function.
    -> Concatenates values from multiple rows.
    -> Separator can be any character or string.
    -> Frequently used in reports.

### Interview Point
    Q. Which PostgreSQL aggregate function combines
    multiple rows into one string?
    Ans.
        -> STRING_AGG()
    Q. What is the Oracle equivalent of STRING_AGG()?
    Ans.
        -> LISTAGG()
    Q. What is the MySQL equivalent of STRING_AGG()?
    Ans.
        -> GROUP_CONCAT()
---

## Summary
    REGEXP_REPLACE()
        -> Replaces text using regular expressions.

    REGEXP_MATCHES()
        -> Returns text matching a regular expression.

    STRING_AGG()
        -> Combines multiple row values into a single string.
---

## Character Functions Summary
    UPPER()             -> Converts text to uppercase.
    LOWER()             -> Converts text to lowercase.
    INITCAP()           -> Capitalizes the first letter of every word.
    LENGTH()            -> Returns the number of characters.
    REVERSE()           -> Reverses a string.
    REPLACE()           -> Replaces a substring.
    CONCAT()            -> Joins two or more strings.
    SUBSTR()            -> Extracts a part of a string.
    INSTR()             -> Returns the position of a substring.    
    TRIM()              -> Removes spaces from both sides.
    LTRIM()             -> Removes leading spaces.
    RTRIM()             -> Removes trailing spaces.
    LPAD()              -> Pads characters on the left.
    RPAD()              -> Pads characters on the right.
    LEFT()              -> Extracts a part of a string from left side.   
    RIGHT()             -> Extracts a part of a string from right side.
    SPLIT_PART()        -> Splits a string using a specified delimiter.
    TRANSLATE()         -> Replaces individual characters in a string.
    ASCII()             -> Converts Character value into ASCII value.
    CHR()               -> Converts ASCII value into Character value.
    REPEAT()            -> Repeats a string the specified number of times.
    OVERLAY()           -> Replaces a portion of a string with another string.
    REGEXP_REPLACE()    -> Replaces text using regular expressions.
    REGEXP_MATCHES()    -> Returns text matching a regular expression.
    STRING_AGG()        -> Combines multiple row values into a single string.

---
# 2.2 Numeric Functions
    -> Numeric functions are used to perform mathematical operations on
       numeric values.
    -> They accept numeric input and return a numeric result.
## Types of Numeric Functions
    CEIL()
    FLOOR()
    ROUND()
    MOD()
    ABS()
    POWER()
    SQRT()
    TRUNC()
    RANDOM()

---

## CEIL() Function
    -> CEIL() returns the smallest integer greater than or equal to the
       given number.
### Syntax
    SELECT CEIL(number);
### Example
    SELECT CEIL(15.2); -> 16

### Important Notes
    -> Always rounds upward.
    -> Returns an integer value.

### Interview Point
    Q. Which function always rounds upward?
    Ans.
        -> CEIL()
---

## FLOOR() Function
    -> FLOOR() returns the largest integer less than or equal to the
       given number.
### Syntax
    SELECT FLOOR(number);
### Example
    SELECT FLOOR(15.9); -> 15

### Important Notes
    -> Always rounds downward.
    -> Returns an integer value.
### Interview Point
    Q. Which function always rounds downward?
    Ans.
        -> FLOOR()
---

## ROUND() Function
    -> ROUND() rounds a number to the specified decimal places.
### Syntax
    SELECT ROUND(number,decimal_places);
### Example
    SELECT ROUND(125.567,2); -> 125.57
    SELECT ROUND(125.567); -> 126

### Important Notes
    -> Positive decimal places round digits after the decimal point.
    -> Zero rounds to the nearest integer.
    -> Negative decimal places round digits before the decimal point.
### Interview Point
    Q. Which function rounds a numeric value?
    Ans.
        -> ROUND()
---

## POWER() Function
    -> POWER() returns a number raised to a specified power.

### Syntax
    SELECT POWER(base,exponent);
### Example
    SELECT POWER(2,5); -> 32

### Important Notes
    -> Used in mathematical calculations.
    -> Accepts two numeric arguments.
### Interview Point
    Q. Which function calculates exponentiation?
    Ans.
        -> POWER()
---

## MOD() Function
    -> MOD() returns the remainder after division.
### Syntax
    SELECT MOD(number1,number2);
### Example
    SELECT MOD(25,4); -> 1

### Database Difference
PostgreSQL
    MOD(25,4)
    25 % 4

Oracle
    MOD(25,4)

MySQL
    MOD(25,4)
    25 % 4

### Important Notes
    -> Returns the remainder after division.
    -> Frequently used to determine even and odd numbers.
### Interview Point
    Q. Which function returns the remainder?
    Ans.
        -> MOD()
---

## SQRT() Function
    -> SQRT() returns the square root of a number.

### Syntax
    SELECT SQRT(number);
### Example
    SELECT SQRT(144); -> 12

### Important Notes
    -> Returns the square root of a positive number.
    -> Negative numbers produce an error in most databases.
### Interview Point
    Q. Which function returns the square root?
    Ans.
        -> SQRT()
---

## ABS() Function
    -> ABS() returns the absolute (positive) value of a number.

### Syntax
    SELECT ABS(number);
### Example
    SELECT ABS(-250); -> 250

### Important Notes
    -> Removes the negative sign.
    -> Positive numbers remain unchanged.
### Interview Point
    Q. Which function returns the absolute value?
    Ans.
        -> ABS()
---

## TRUNC() Function
    -> TRUNC() removes the decimal portion of a number without rounding.
### Syntax
    SELECT TRUNC(number,decimal_places);
### Example
    SELECT TRUNC(125.567,2); -> 125.56
    SELECT TRUNC(125.567); -> 125

### Database Difference
PostgreSQL
    TRUNC()

Oracle
    TRUNC()

MySQL
    TRUNCATE(number,decimal_places)

### Important Notes
-> Removes decimal digits without rounding.
-> Positive decimal places keep digits after the decimal point.
-> Zero removes all decimal digits.
-> Negative decimal places remove digits before the decimal point.
### Interview Point
    Q. What is the difference between ROUND() and TRUNC()?
    Ans.
        -> ROUND() rounds the number.
        -> TRUNC() simply removes the decimal digits without rounding.
---

## RANDOM() Function
    -> RANDOM() generates a random number.

### Syntax
    SELECT RANDOM();
    SELECT RANDOM(starting_number,ending_number) --> for specific range
### Example
    SELECT RANDOM(); -> 0.648153100
    SELECT RANDOM(1,100) -> 25
### Database Difference
    PostgreSQL
        RANDOM()

    Oracle
        DBMS_RANDOM.VALUE

    MySQL
        RAND()

### Important Notes
    -> PostgreSQL returns a value between 0 and 1.
    -> Commonly used for testing and sample data generation.
    -> Every execution produces a different value.
### Interview Point
    Q. Which PostgreSQL function generates a random number?
    Ans.
        -> RANDOM()

---

## Numeric Functions Summary
    ROUND()    -> Rounds a number.
    CEIL()     -> Rounds upward.
    FLOOR()    -> Rounds downward.
    MOD()      -> Returns remainder.
    ABS()      -> Returns absolute value.
    POWER()    -> Calculates exponentiation.
    SQRT()     -> Returns square root.
    TRUNC()    -> Truncates the decimal portion without rounding.
    RANDOM()   -> Generates random number between 0 and 1.
---

## Most Asked Interview Questions
    Q. Difference between CEIL() and FLOOR()?
    Ans.
        -> CEIL() rounds upward.
        -> FLOOR() rounds downward.
    Q. Which function returns the remainder?
    Ans.
        -> MOD()
    Q. Which function removes the negative sign?
    Ans.
        -> ABS()
    Q. Which function returns the square root?
    Ans.
        -> SQRT()
---

# 2.3 General Functions
    -> General functions are used to handle NULL values and implement
       conditional logic.
    -> They improve data handling and query flexibility.

## Types of General Functions
    NVL()
    NVL2()
    DECODE()
    NULLIF()
    COALESCE()    
---

## NVL() Function
    -> NVL() replaces a NULL value with the specified value.
    -> It accepts only two arguments.
### Syntax
    SELECT NVL(expression,replacement_value);
### Example
    SELECT NVL(comm,0) FROM emp;
### Database Difference
    Oracle
        NVL()

    PostgreSQL
        COALESCE()

    MySQL
        IFNULL()

### PostgreSQL Equivalent
    SELECT COALESCE(comm,0) FROM emp;

### Important Notes
    -> NVL() is Oracle-specific.
    -> PostgreSQL uses COALESCE() instead.
    -> COALESCE() is ANSI SQL standard.
### Interview Point
    Q. What is the PostgreSQL equivalent of NVL()?
    Ans.
        -> COALESCE()
---

## NVL2() Function
    -> NVL2() checks whether an expression is NULL.
    -> If the expression is NOT NULL, it returns one value.
    -> If the expression is NULL, it returns another value.
### Syntax
    SELECT NVL2(expression,value_if_not_null,value_if_null);
### Example
    SELECT NVL2(comm,'Has Commission','No Commission') FROM emp;

### Database Difference
    Oracle
        NVL2()

    PostgreSQL
        CASE expression

### PostgreSQL Equivalent
    SELECT CASE
            WHEN comm IS NOT NULL
            THEN 'Has Commission'
            ELSE 'No Commission'
        END
    FROM emp;

### Important Notes
    -> NVL2() is Oracle-specific.
    -> PostgreSQL uses CASE for the same functionality.
    -> Useful for conditional output.
### Interview Point
    Q. What is the PostgreSQL equivalent of NVL2()?
    Ans.
        -> CASE expression.
---

## DECODE() Function
    -> DECODE() compares an expression with search values.
    -> When a match is found, it returns the corresponding result.
    -> It works similarly to SWITCH or CASE.
### Syntax
    SELECT DECODE(expression,search1,result1,search2,result2,default_result);
### Example
    SELECT DECODE(deptno,10,'ACCOUNTING',20,'RESEARCH',30,'SALES','OTHERS') FROM emp;

### Database Difference
    Oracle
        DECODE()

    PostgreSQL
        CASE

    MySQL
        CASE

### PostgreSQL Equivalent
    SELECT CASE deptno
            WHEN 10 THEN 'ACCOUNTING'
            WHEN 20 THEN 'RESEARCH'
            WHEN 30 THEN 'SALES'
            ELSE 'OTHERS'
        END
    FROM emp;

### Important Notes
    -> DECODE() is Oracle-specific.
    -> CASE is ANSI SQL standard.
    -> Prefer CASE for better portability.
### Interview Point
    Q. What is the PostgreSQL equivalent of DECODE()?
    Ans.
        -> CASE
---

## NULLIF() Function
    -> NULLIF() compares two expressions.
    -> If both expressions are equal, it returns NULL.
    -> Otherwise, it returns the first expression.
### Syntax
    SELECT NULLIF(expression1,expression2);
### Example
    SELECT NULLIF(100,100);
    SELECT NULLIF(100,50);

### Important Notes
    -> Returns NULL only when both values are equal.
    -> Frequently used to prevent divide-by-zero errors.
### Interview Point
    Q. What is the purpose of NULLIF()?
    Ans.
        -> Returns NULL when both expressions are equal.
---

## COALESCE() Function
    -> COALESCE() returns the first non-NULL value from the given list.
### Syntax
    SELECT COALESCE(expression1,expression2,...);
### Example
    SELECT COALESCE(NULL,NULL,NULL,100,50);
    SELECT COALESCE(NULL,NULL,NULL,100,NULL);
    SELECT ename,COALESCE(comm,0) FROM emp;

### Important Notes
    -> Returns the first non-NULL value.
    -> Can accept multiple expressions.
    -> Commonly used to replace NULL values.

### Database Difference
PostgreSQL
    COALESCE()

Oracle
    COALESCE()

MySQL
    COALESCE()

### Interview Point
Q. Which function replaces NULL values?
Ans.
    -> COALESCE()
---

## General Functions Summary
    NVL() -> Replaces a NULL value with the specified value.
    NVL2() -> Checks expression is NULL or NOT NULL, if NOT NULL it returns 1st value and if NUll it returns 2nd value.
    DECODE() -> It is similar to SWITCH CASE, it compares and expression with search values.
    NULLIF() -> Returns NULL if both expressions are equal.
    COALESCE() -> Returns first non-NULL value.
---

## Most Asked Interview Questions
    Q. Which function replaces NULL values?
    Ans.
        -> COALESCE()/NVL()

    Q. What does NULLIF() return when both expressions are equal?
    Ans.
        -> NULL
---

# 2.4 Conversion Functions
    -> Conversion functions are used to convert data from one datatype
    to another.
    -> They improve compatibility between different datatypes.

## Types of Conversion Functions
    CAST()
    TO_CHAR()
    TO_DATE()
    TO_NUMBER()
---

## CAST() Function
    -> CAST() converts a value from one datatype to another.
    -> It is an ANSI SQL standard function.
### Syntax
    SELECT CAST(expression AS datatype);
### Example
    SELECT CAST('100' AS INTEGER);
    SELECT CAST(125.75 AS INTEGER);

### Important Notes
    -> Supported by PostgreSQL, Oracle and MySQL.
    -> Frequently used for explicit datatype conversion.
    -> Improves query readability.
### Interview Point
    Q. Which function is the ANSI SQL standard for datatype conversion?
    Ans.
        -> CAST()
---

## TO_CHAR() Function
    -> TO_CHAR() converts numbers or dates into character strings.

### Syntax
    SELECT TO_CHAR(expression,format);
### Example
    SELECT TO_CHAR(CURRENT_DATE,'DD-MM-YYYY');
    SELECT TO_CHAR(1250.50,'9999.99');

### Important Notes
    -> Commonly used for formatting dates.
    -> Can also format numeric values.
    -> Frequently used in reports.
### Interview Point
    Q. Which function converts DATE into VARCHAR?
    Ans.
        -> TO_CHAR()
---

## TO_DATE() Function
    -> TO_DATE() converts a character string into a DATE value.
### Syntax
    SELECT TO_DATE(string,format);
### Example
    SELECT TO_DATE('06-07-2026','DD-MM-YYYY');

### Important Notes
    -> Input format must match the format string.
    -> Invalid formats generate an error.
### Interview Point
    Q. Which function converts VARCHAR into DATE?
    Ans.
        -> TO_DATE()
--- 

## TO_NUMBER() Function
    -> TO_NUMBER() converts character data into numeric values.
### Syntax
    SELECT TO_NUMBER(string);
### Example
    SELECT TO_NUMBER('1250','9999');
    SELECT TO_NUMBER('12345.75','99999.99');

### Important Notes
    -> String must contain a valid numeric value.
    -> Invalid numeric strings generate an error.
### Interview Point
    Q. Which function converts VARCHAR into NUMBER?
    Ans.
        -> TO_NUMBER()
---

## Conversion Functions Summary
    CAST()        -> Converts one datatype into another.
    TO_CHAR()     -> Converts DATE or NUMBER into VARCHAR.
    TO_DATE()     -> Converts VARCHAR into DATE.
    TO_NUMBER()   -> Converts VARCHAR into NUMBER.
---

## Most Asked Interview Questions
    Q. What are Conversion Functions?
    Ans.
        -> Functions used to convert one datatype into another.
    
    Q. Which conversion function is ANSI SQL standard?
    Ans.
        -> CAST()
    
    Q. Which function converts DATE into VARCHAR?
    Ans.
        -> TO_CHAR()
    
    Q. Which function converts VARCHAR into DATE?
    Ans.
        -> TO_DATE()
    
    Q. Which function converts VARCHAR into NUMBER?
    Ans.
        -> TO_NUMBER()
---