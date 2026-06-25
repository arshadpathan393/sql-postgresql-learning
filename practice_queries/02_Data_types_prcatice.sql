
--CHAR DATATYPE 

CREATE TABLE demo_char(
	name CHAR(10)
);

CREATE TABLE demo_char2(
	name CHARACTER(10)
);
-- BOTH CHAR and CHARACTER are the same data type in PostgreSQL.
-- They are used to store fixed-length character strings. 
-- The number in parentheses specifies the length of the string. 
-- In this case, both tables will store names that are exactly 10 characters long.
-- If a name is shorter than 10 characters, it will be padded with spaces to reach the specified length.

INSERT INTO demo_char VALUES('Arshad');

SELECT * FROM demo_char;

--VARCHAR DATATYPE

CREATE TABLE demo_varchar(
	name VARCHAR(10)
);
-- VARCHAR is used to store variable-length character strings.
-- The number in parentheses specifies the maximum length of the string.
-- In this case, the table will store names that can be up to 10 characters long.
-- If a name is shorter than 10 characters, it will not be padded with spaces.
-- If a name is longer than 10 characters, it will be truncated to fit the specified length.
-- The main difference between CHAR and VARCHAR is that CHAR is fixed-length, while VARCHAR is variable-length.

INSERT INTO demo_varchar VALUES ('Pathan');

SELECT * FROM demo_varchar;

-- NUMBER (INTEGER/NUMERIC)DATATYPE
--1. INTEGER
CREATE TABLE demo_number(
id INTEGER
);
-- INTEGER is used to store whole numbers (both positive and negative) without any decimal places.
-- The range of values that can be stored in an INTEGER column is from -2,147,483,648 to 2,147,483,647. 

INSERT INTO demo_number VALUES(27);
-- Stores the integer value 27
INSERT INTO demo_number VALUES(3);
-- Stores the integer value 3
INSERT INTO demo_number VALUES(27.7);
-- Stores the integer value 27 (decimal places are truncated)
INSERT INTO demo_number VALUES(99.9);
-- Stores the integer value 100 (decimal places are rounded)
INSERT INTO demo_number VALUES(29.4);
-- Stores the integer value 29 (decimal places are truncated)
INSERT INTO demo_number VALUES(29.7);
-- Stores the integer value 30 (decimal places are rounded)

SELECT * FROM demo_number;

--2. NUMERIC
--  Precision > Scale

CREATE TABLE demo_number2(
	id NUMERIC(4,2)
);

INSERT INTO demo_number2 VALUES(27);
-- Stores the numeric value 27.00
INSERT INTO demo_number2 VALUES(27.9);
-- Stores the numeric value 27.90
INSERT INTO demo_number2 VALUES(27.99);
-- Stores the numeric value 27.99
INSERT INTO demo_number2 VALUES(6.48);
-- Stores the numeric value 6.48
INSERT INTO demo_number2 VALUES(6.5);
-- Stores the numeric value 6.50
INSERT INTO demo_number2 VALUES(99.99);
-- Stores the numeric value 99.99
INSERT INTO demo_number2 VALUES(99.89);
-- Stores the numeric value 99.89
INSERT INTO demo_number2 VALUES(0.99);
-- Stores the numeric value 0.99
INSERT INTO demo_number2 VALUES(100.99);
-- This will throw an error because the value exceeds the specified precision of 4 digits 
--(2 before the decimal and 2 after).
INSERT INTO demo_number2 VALUES(999.99);
-- This will also throw an error because the value exceeds the specified precision of 4 digits
INSERT INTO demo_number2 VALUES(546.00);
-- This will throw an error because the value exceeds the specified precision of 4 digits
INSERT INTO demo_number2 VALUES(6.999);
-- Stores the numeric value 7.00 (decimal places are rounded to fit the specified scale of 2)
INSERT INTO demo_number2 VALUES(1.2345);
-- Stores the numeric value 1.23 (decimal places are truncated to fit the specified scale of 2)
INSERT INTO demo_number2 VALUES(99.999);
-- This will throw an error because the value exceeds the specified precision of 4 digits

SELECT * FROM demo_number2;

-- Precision = Scale

CREATE TABLE demo_number3(
	id NUMERIC(3,3)
);

INSERT INTO demo_number3 VALUES (0.123);
-- This will store the numeric value 0.123 (the value fits within the specified precision and scale)
INSERT INTO demo_number3 VALUES (1.23);
-- This will throw an error because the value exceeds the specified precision of 3 digits
INSERT INTO demo_number3 VALUES (0.45628);
--This will store the numeric value 0.456 (the value is rounded to fit the specified scale of 3)
INSERT INTO demo_number3 VALUES (0.9999);
-- This will throw an error because the value exceeds the specified precision of 3 digits
INSERT INTO demo_number3 VALUES (0.45589);
-- This will store the numeric value 0.456 (the value is rounded to fit the specified scale of 3)

SELECT * FROM demo_number3;

-- Precision < Scale

CREATE TABLE demo_number4(
	id NUMERIC(2,3)
);

INSERT INTO demo_number4 VALUES (0.012);
-- -- This will store the numeric value 0.012 (the value fits within the specified precision and scale)
INSERT INTO demo_number4 VALUES (0.12);
-- This will throw an error because A field with precision 2, scale 3 must round to an absolute value less than 10^-1.
INSERT INTO demo_number4 VALUES (0.0799);
-- This will store the numeric value 0.080 (the value is rounded to fit the specified scale of 3)
INSERT INTO demo_number4 VALUES (0.0999);
-- This will throw an error because A field with precision 2, scale 3 must round to an absolute value less than 10^-1.

SELECT * FROM demo_number4;
