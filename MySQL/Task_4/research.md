## 1. UNION vs UNION ALL

- **UNION**  
  The `UNION` operator is used to combine the result set of two or more `SELECT` statements and automatically removes duplicate rows from the result set.  

  **Requirements:**  
  1. Every `SELECT` statement within `UNION` must have the same number of columns.  
  2. The columns must have similar data types.  
  3. The columns in every `SELECT` statement must be in the same order.  

  **Example:**
  ```sql
  SELECT City FROM Customers
  UNION
  SELECT City FROM Suppliers
  ORDER BY City;
  ```

- **UNION ALL**  
  The `UNION ALL` operator is also used to combine the result set of two or more `SELECT` statements, but it **includes all rows**, including duplicates. It is faster than `UNION` because it does not check for duplicates.  

  **Requirements:**  
  Same as `UNION`.  

  **Example:**
  ```sql
  SELECT city FROM Customers
  UNION ALL
  SELECT city FROM Suppliers;
  ```

---

## 2. Subquery vs JOIN

- **Subquery**  
  A subquery is a query nested inside another query, used to provide a value or set of values for the outer query.  

  **Characteristics:**  
  - Might be slower for large datasets.  
  - Easier to read in simple cases.  
  - Outer query runs, and the inner query runs for every row (like nested loops).  

  **Example:**
  ```sql
  SELECT u.user_id, u.name,
      (SELECT COUNT(*) 
       FROM Orders o 
       WHERE o.buyer_id = u.user_id 
         AND o.order_date LIKE '2019%') AS order_count
  FROM Users u;
  ```

- **JOIN**  
  `JOIN` combines rows from 2 or more tables based on a related column.  

  **Characteristics:**  
  - Combines tables first, then filters.  
  - Usually faster than subqueries on large datasets.  
  - Better for complex relationships.  

  **Types of JOINs:**  
  - **INNER JOIN:** Returns records with matching values in both tables.  
  - **LEFT (OUTER) JOIN:** Returns all records from the left table, and matched records from the right table.  
  - **RIGHT (OUTER) JOIN:** Returns all records from the right table, and matched records from the left table.  
  - **FULL (OUTER) JOIN:** Returns all records when there is a match in either left or right table.  

  **Example:**
  ```sql
  SELECT Products.ProductID, Products.ProductName, Categories.CategoryName
  FROM Products
  JOIN Categories ON Products.CategoryID = Categories.CategoryID;
  ```