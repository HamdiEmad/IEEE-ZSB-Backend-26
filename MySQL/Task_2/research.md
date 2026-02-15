# 1. What is the difference between a DBMS and an RDBMS?

- Database Management System aka "DBMS" is a software system that stores and manages data in files or other formats, allowing users to create, read, update, and delete data. Relationships between data are not strictly enforced.

- RDBMS (Relational Database Management System): A type of DBMS that stores data in tables with rows and columns and enforces relationships, constraints, and data integrity using keys. It supports ACID transactions and structured querying with SQL.

&nbsp;&nbsp;&nbsp;

# 2. DDL and DML

- Data Definition Language (DDL) is a set of SQL commands used to define or modify the database structure (like CREATE, ALTER, DROP and TRUNCATE).

```-- Create a table
CREATE TABLE Students (
    StudentID INT PRIMARY KEY,
    Name VARCHAR(50),
    Age INT
);
```

- Data Manipulation Language (DML) is a set of SQL commands allows to manage and manipulate the data inside the database (INSERT, UPDATE, DELETE, SELECT.)

```
INSERT INTO Students (StudentID, Name, Age)
VALUES (1, 'Alice', 20);
```

&nbsp;&nbsp;&nbsp;

# 3. Why is Normalization important ?

- Normalization is important for large databases because it's like a multi-stage filter that puts the data in the best way to be understood easily as it reduces redundancy, makes relations more clear, improves data integrity and easier manipulation and maintenance of data.