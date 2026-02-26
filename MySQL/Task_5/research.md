## 1. Window Functions vs GROUP BY

- **Window functions** are used to perform calculations such as aggregation on a specific subset of data, without losing the level of detail of rows, and they don't collapse rows like compressing them.  
    **Example:**
    ```sql
    SELECT 
        id,
        name,
        salary,
        departmentId,
        AVG(salary) OVER (PARTITION BY departmentId) AS avg_salary
    FROM Employee;
    ```

- **GROUP BY** is a clause used to group rows together and returns one row per group, which means compressing the rows and collapsing data.  
    **Example:**
    ```sql
    SELECT departmentId, AVG(salary) AS avg_salary
    FROM Employee
    GROUP BY departmentId;
    ```

---

## 2. Clustered vs Non-Clustered Indexes

- **Clustered index** stores the actual table data in sorted index order inside the table itself, meaning that the data rows are the index. It is very fast for range queries and reading data but slower in writing. The B-tree leaf nodes contain the actual data pages but sorted.  
    **Example:**
    ```sql
    CREATE CLUSTERED INDEX idx_emp_id
    ON Employee(id);
    ```

- **Non-clustered index** does not reorganize or change anything on the data pages but creates a separate structure that contains an indexed column and a pointer to the actual row location. The B-tree leaf nodes contain pointers to the actual data pages of the table.  
    **Example:**
    ```sql
    CREATE NONCLUSTERED INDEX idx_salary
    ON Employee(salary);
    ```

![Clustered vs Non-Clustered Index](https://josipmisko.com/img/clustered-vs-nonclustered-index.webp)

---

## 3. Filtered vs Unique Indexes

- **Filtered index** is an index that includes only rows meeting the specified conditions. It indexes only the rows you actually care about, not the whole table, making it faster, smaller, and cheaper to maintain.  
    **Example:**
    ```sql
    CREATE INDEX idx_active_users
    ON Users(status)
    WHERE status = 'Active';
    ```

- **Unique index** is a special type of index that ensures no duplicate values exist in a specific column.  
    - SQL should first guarantee that there are no duplicates before any process, which is an extra time to consider.  
    - Enforces uniqueness and increases query performance (reading process like `SELECT`).  
    - Writing performance (e.g., `INSERT`) is slower than non-unique due to the time required to ensure uniqueness.  
    **Example:**
    ```sql
    CREATE UNIQUE INDEX idx_email
    ON Users(email);
    ```

---

## 4. Choosing the Right Index

- If there are millions of insert operations (write) and the inserts need to be fast with too few reads, a **Heap structure** is preferable as it is used for fast inserts like in staging tables.

---

## 5. Database Transactions (ACID)

- **ACID** properties define reliable database transactions:
    - **A – Atomicity**
    - **C – Consistency**
    - **I – Isolation**
    - **D – Durability**

- **Atomicity** means a transaction must be fully completed or not executed at all. In case of partial failure, the entire transaction is automatically undone or rolled back.
