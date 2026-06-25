
## Data Integrity (Validation) 

-> Data integrity is used to maintain accuracy, correctness, and consistency of a table (ACC).
-> We can achieve data integrity with the help of data types and constraints.
-> Data entered into a table can be validated in two ways: 
    1. Data Types -> Data types define what type of data can be stored in a column. 
        Examples: NUMBER, CHAR, VARCHAR, DATE 
    2. Constraints -> Constraints provide additional rules for data validation. 
        Examples: NOT NULL, UNIQUE, PRIMARY KEY, FOREIGN KEY, CHECK

##  Data Types

    A Data Type defines the type of data that can be stored in a memory location or column.
    Data types help:
    -> to Validate data
    -> Store data efficiently
    -> Maintain data integrity
    
    Common SQL Data Types :
    CHAR
    VARCHAR / VARCHAR2
    NUMBER
    DATE
    CLOB
    BLOB

### 1. CHAR

    -> CHAR datatype can store: A-Z, a-z, 0-9,Special Characters -> in string format.
    -> Whenever we use CHAR, we must specify its size.
    -> Syntax : CHAR(size)
    -> Example: CHAR(10)
    -> Characteristics
        Fixed Length Allocation
        CHAR always reserves the full specified size.
        -> Example:
        CHAR(10)
        Value stored: ARSHAD
        Actual storage: ARSHAD____ (remaining spaces are padded), Length remains 10.

    -> Oracle                      MySQL                   PostgreSQL
        CHAR(10)                    CHAR(10)                CHAR(10) or CHARACTER(10)
        Maximum:2000 characters     Fixed length string.    Fixed length string.
    -> Example
        Create table:
            CREATE TABLE demo_char(
            name CHAR(10)
            );
        Insert: INSERT INTO demo_char VALUES('ARSHAD');
        View: SELECT * FROM demo_char;

### 2. VARCHAR
    -> VARCHAR datatype can store: A-Z, a-z, 0-9,Special Characters -> in string format.
    -> Whenever we use VARCHAR, we must specify its size.
    -> Syntax : VARCHAR(size)
    -> Example: VARCHAR(10)
    -> Characteristics
        Variable Length Allocation
        VARCHAR stores only the actual data entered.
        -> Example:
        VARCHAR(10)
        Value stored: ARSHAD
        Storage used: ARSHAD    
        Only 6 characters are stored, unlike CHAR, remaining spaces are not padded.

        Feature	            Oracle            	    MySQL	             PostgreSQL
        Datatype	    VARCHAR / VARCHAR2  	    VARCHAR	                VARCHAR
        Syntax	            VARCHAR(10)	            VARCHAR(10)         	VARCHAR(10)
        Storage	        Variable Length	            Variable Length	        Variable Length
        Max Size	    2000 (VARCHAR),         	Much larger	            Very large
                        4000(VARCHAR2)
        Padding Spaces	        No	                    No	                    No
        Common Usage	Names, Address	            Names, Address	        Names, Address

#### CHAR vs VARCHAR

                CHAR	                                                VARCHAR
            Fixed Length	                                        Variable Length
            Wastes memory if data is small	                        Uses memory efficiently
            Pads extra spaces	                                    No extra spaces
            Better for fixed-size values	                        Better for varying-size values
            Example: Gender, Country Code	                        Example: Name, Email, Address

### 3. VARCHAR2
    -> VARCHAR2 is an upgraded version of VARCHAR in Oracle. It stores character data using variable-length memory allocation.
    -> Syntax: VARCHAR2(size)
    -> Example: VARCHAR2(20)
    -> Characteristics
        -> Stores character data.
        -> Variable length allocation.
        -> Does not pad extra spaces.
        -> Oracle recommends VARCHAR2 instead of VARCHAR.
        -> Maximum size according to your notes: 4000 characters

                            Oracle                  MySQL                              PostgreSQL
    Feature	                Oracle	                MySQL	                           PostgreSQL
    Datatype	            VARCHAR2                Not Available	                   Not Available
    Equivalent	            VARCHAR2	            VARCHAR	                           VARCHAR
    Storage	                Variable Length         Variable Length	                   Variable Length
    Recommended String Type	VARCHAR2	            VARCHAR	                           VARCHAR
    Common Usage	        Name,Address,Email     Name,Address,Email               Name,Address
                                                                                    Email

#### VARCHAR vs VARCHAR2

    Feature	                        VARCHAR                 	VARCHAR2
    Oracle Support	                Yes                     	Yes
    Recommended by Oracle	        No	                        Yes
    Max Size (Notes)	            2000	                    4000
    Usage in Oracle Projects	    Rare	                    Common

### 4. NUMBER
    -> NUMBER datatype is used to store numeric values.
    -> It can store:
        - Positive Numbers
        - Negative Numbers
        - Decimal Numbers
    -> Syntax : NUMBER(precision, scale)
    -> Parameters
        Precision = Total number of digits
        Scale = Number of digits after decimal point
    -> Examples
    NUMBER(5) -> Valid: 12345
                 Invalid: 123456

    NUMBER(5,2) Valid: 999.99
                Invalid: 9999.99

#### Oracle vs MySQL vs PostgreSQL

    Purpose         Oracle          MySQL           PostgreSQL
     Integer        NUMBER          INT             INTEGER 
     Decimal        NUMBER(10,2)    DECIMAL(10,2)   NUMERIC(10,2) 
     Employee ID    NUMBER(5)       INT             INTEGER 
     Salary         NUMBER(10,2)    DECIMAL(10,2)   NUMERIC(10,2)

Important Notes
    - Maximum precision in Oracle is 38.
    - NUMBER supports both integers and decimal values.
    - Precision = Total digits.
    - Scale = Digits after decimal point.

Interview Point

Q. What is Precision?
    Ans. Total number of digits.

Q. What is Scale?
    Ans. Number of digits after decimal point.

### 5. DATE

    -> DATE datatype is used to store date values.
    -> It stores:
        - Day
        - Month
        - Year
    -> In some databases it can also store:
        - Hours
        - Minutes
        - Seconds
    -> Syntax : DATE
    -> Examples : '25-DEC-2025', '01-JAN-2026', '15-AUG-2024'
    -> Common Date Format : DD-MON-YYYY
        Examples: 25-DEC-2025, 01-JAN-2026, 15-AUG-2024

#### Oracle vs MySQL vs PostgreSQL

    Feature             Oracle           MySQL           PostgreSQL 
     Datatype           DATE             DATE            DATE
     Stores Time        Yes              No              No
     Date Example       25-DEC-2025      2025-12-25      2025-12-25
     Date & Time Type   DATE             DATETIME        TIMESTAMP 

Important Notes

    - DATE datatype is used to store date values.
    - Oracle DATE stores both date and time.
    - MySQL DATE stores only date.
    - PostgreSQL DATE stores only date.
    - For date and time in PostgreSQL, TIMESTAMP is preferred.

Interview Point

Q. Which datatype is used to store date values?
    Ans. DATE

Q. Does Oracle DATE store time?
    Ans. Yes

Q. Which datatype is preferred for date and time in PostgreSQL?
    Ans. TIMESTAMP

### 6. CLOB (Character Large Object)

    -> CLOB datatype is used to store large amounts of character data.
    -> It can store:
        - Text
        - Documents
        - Articles
        - Large Descriptions
        - XML Data
    -> Syntax : CLOB
    -> Example : Employee Description, Book Content, Article Content

#### Oracle vs MySQL vs PostgreSQL

    Feature                 Oracle                  MySQL               PostgreSQL
    Datatype               CLOB                TEXT / LONGTEXT          TEXT
    Stores Character Data  Yes                 Yes                      Yes
    Large Text Support     Yes                 Yes                      Yes
    Common Usage           Documents,Articles  Documents, Articles      Documents, Articles

Important Notes

    - CLOB is used for very large text data.
    - No size needs to be specified.
    - Suitable for storing paragraphs, articles and documents.
    - Not suitable for calculations because it stores text.

 Interview Point

Q. What does CLOB stand for?
    Ans. Character Large Object

Q. What is the PostgreSQL equivalent of CLOB?
    Ans. TEXT

Q. What type of data is stored in CLOB?
    Ans. Large character/text data

### 7. BLOB (Binary Large Object)

    -> BLOB datatype is used to store large amounts of binary data.
    -> It can store:
        Images
        Audio Files
        Video Files
        PDF Documents
        Executable Files
        Binary Data
    -> Syntax : BLOB
    -> Example : Employee Photo,Student Signature,Passport Scan,Video File,PDF Document
    -> Characteristics
        -> Stores data in binary format.
        -> Used for non-text data.
        -> No size needs to be specified while creating the column.
        -> Can store very large files.
        -> Data stored in BLOB cannot be directly read as text.

#### Oracle vs MySQL vs PostgreSQL

    Feature             Oracle      MySQL       PostgreSQL
    Datatype            BLOB        BLOB        BYTEA
    Stores Binary Data  Yes         Yes         Yes
    Stores Images       Yes         Yes         Yes
    Stores Videos       Yes         Yes         Yes
    Stores PDFs         Yes         Yes         Yes

Important Notes

    -> BLOB stands for Binary Large Object.
    -> Used for storing binary files instead of text.
    -> Suitable for images, videos, audio files, and documents.
    -> No length or size needs to be specified.
    -> Large BLOB data may affect database performance if used excessively.
    -> For large text data, use CLOB instead of BLOB.

#### BLOB vs CLOB

    Feature                 BLOB                            CLOB
    Full Form               Binary Large Object             Character Large Object
    Stores                  Binary Data                     Character/Text Data
    Examples                Images, Videos, PDFs            Documents, Articles, XML
    Readable as Text        No                              Yes
    Common Usage            Files, Media                    Large Text Content

Interview Point

Q. What does BLOB stand for?
    Ans. Binary Large Object

Q. What type of data is stored in BLOB?
    Ans. Binary data such as images, videos, audio files, and PDF documents.

Q. What is the PostgreSQL equivalent of BLOB?
    Ans. BYTEA

Q. Which datatype is used to store images in a database?
    Ans. BLOB (Oracle/MySQL) or BYTEA (PostgreSQL)

Q. Difference between BLOB and CLOB?
    Ans. BLOB stores binary data, whereas CLOB stores character/text data.

### NULL
    -> NULL is missing or unknown value
    -> NULL is neither zero nor blank space
    -> Memory will not get allocated by NULL
    -> Any arithmetic operation performed with NULL it results into NULL only
    -> No two NULL's are same