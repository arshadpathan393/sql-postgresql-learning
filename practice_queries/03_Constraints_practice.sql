-- HERE ALL PRACTICE QUERIES ARE WRITTEN FOR CONSTRAINTS IN POSTGRESQL DATABASE

1. -- NOT NULL CONSTRAINT

CREATE TABLE demo_not_null(
	id INTEGER,
	name VARCHAR(10) NOT NULL
);

INSERT INTO demo_not_null VALUES(1,'A');
--- The above query will successfully insert the values into the table 
-- because the 'name' column has a value and it is not null.
INSERT INTO demo_not_null VALUES(2,'B');
--- The above query will successfully insert the values into the table
INSERT INTO demo_not_null VALUES(3);
--- The above query will fail to insert the values into the table
INSERT INTO demo_not_null VALUES(3,NULL);
--- The above query will fail to insert the values into the table

SELECT * FROM demo_not_null;

