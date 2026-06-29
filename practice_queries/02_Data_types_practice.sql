-- HERE ALL PRACTICE QUERIES ARE WRITTEN FOR DATA TYPES IN POSTGRESQL DATABASE

1. --CHAR DATATYPE 

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

2. --VARCHAR DATATYPE

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

3. -- NUMBER (INTEGER/NUMERIC)DATATYPE
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

4. -- DATE DATATYPE

CREATE TABLE demo_date(
	name VARCHAR(15),join_date DATE
);

INSERT INTO demo_date VALUES ('ARSHAD','01-MAR-2024')
-- This will store the name 'ARSHAD' and the date '2024-03-01' in the table.
INSERT INTO demo_date VALUES ('ABC','01-JANUARY-2024')
-- This will store the name 'ABC' and the date '2024-01-01' in the table.
INSERT INTO demo_date VALUES ('XYZ','2025-02-03');
-- This will store the name 'XYZ' and the date '2025-02-03' in the table.

SELECT * FROM demo_date

5.-- CLOB/TEXT (Character Large Object)

CREATE TABLE demo_text (
	id INTEGER,
	title VARCHAR(10),
	content TEXT
);

INSERT INTO demo_text (id,title,content)
VALUES (1,'PostgreSQL',
'What is PostgreSQL?
PostgreSQL is a powerful, open source object-relational database system that uses and extends the SQL language combined with many features that safely store and scale the most complicated data workloads. The origins of PostgreSQL date back to 1986 as part of the POSTGRES project at the University of California at Berkeley and has nearly 40 years of active development on the core platform.
PostgreSQL has earned a strong reputation for its proven architecture, reliability, data integrity, robust feature set, extensibility, and the dedication of the open source community behind the software to consistently deliver performant and innovative solutions. PostgreSQL runs on all major operating systems, has been ACID-compliant since 2001, and has powerful add-ons such as the popular PostGIS geospatial database extender. It is no surprise that PostgreSQL has become the open source relational database of choice for many people and organisations.
Getting started with using PostgreSQL has never been easier - pick a project you want to build, and let PostgreSQL safely and robustly store your data.'
);
--This will store the id, title, and content in the demo_text table. The content is a 
--large text block that describes PostgreSQL.

SELECT * FROM demo_text;

6.-- BLOB/BYTEA (Binary Large Object)

CREATE TABLE demo_bytea (
	id INTEGER,
	title VARCHAR(10),
	content BYTEA
);

INSERT INTO demo_bytea 
VALUES (1,'ro_sign', pg_read_binary_file('C:\Temp\ro_sign.jpg'));
--This will store the id, title, and content in the demo_bytea table. 
--The content is a binary file (image) read from the specified path.
--
SELECT * FROM demo_bytea;

7. -- BOOLEAN DATATYPE

CREATE TABLE demo_boolean(
	id INTEGER,
	name VARCHAR(10),
	is_active BOOLEAN
);

INSERT INTO demo_boolean VALUES (1,'ARSHAD',TRUE);
INSERT INTO demo_boolean VALUES (2,'ABC',FALSE);
-- This will store the id, name, and is_active status in the demo_boolean table.

SELECT * FROM demo_boolean;

8. -- TIMESTAMP DATATYPE

CREATE TABLE demo_timestamp (
user_id INTEGER,
username VARCHAR(10),
created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO demo_timestamp 
VALUES (1,'AMIT');
-- This will store the user_id, username, and the current timestamp in the demo_timestamp table.

SELECT * FROM demo_timestamp;