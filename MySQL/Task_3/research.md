## 1. Difference between WHERE and HAVING
Both are used to filter data, but the main difference between them is:  

- **WHERE** is used before ordering and grouping, and it **cannot** be used with aggregate functions.  
- **HAVING** is used with aggregate functions like `SUM()`, `AVG()`, `MIN()`, and `MAX()`, and it is usually related to `GROUP BY`.

---

## 2. DELETE vs TRUNCATE vs DROP
- **DELETE**: Removes specific rows from a table. It can also remove all rows, but the table structure remains intact.  
- **TRUNCATE**: Deletes all rows from a table, keeps the table structure, and is faster than `DELETE` for removing all rows because `DELETE` removes rows one by one.  
- **DROP**: Removes the entire table along with all its records from the database.

---

## 3. Order of Execution
1. **FROM**: Executed first to determine where to get the data (table).  
2. **ON**: Applied if there are `JOIN` conditions.  
3. **JOIN**: Combines tables based on `ON` conditions.  
4. **WHERE**: Filters rows before grouping.  
5. **GROUP BY**: Groups the filtered rows.  
6. **HAVING**: Filters groups.  
7. **SELECT**: Determines the final columns to be retrieved.  
8. **DISTINCT**: Removes duplicate rows.  
9. **ORDER BY**: Sorts the final result.  
10. **LIMIT/OFFSET**: Returns only a subset of rows.

---

## 4. COUNT(*) vs COUNT(column_name)
- **COUNT(*)**: Counts all rows, including those with `NULL` values.  
- **COUNT(column_name)**: Counts only rows where the column is **not null**.

---

## 5. CHAR vs VARCHAR
- **CHAR**: Fixed-length string. Extra spaces are added if the string is shorter than the defined length.  
  *Example:* If `CHAR(10)` stores `'cat'`, it will fill the remaining 7 characters with spaces.  
- **VARCHAR**: Variable-length string. Stores only the input string plus extra bytes for the length.  
  *Example:* If `VARCHAR(10)` stores `'cat'`, it will store 3 bytes for the string itself plus extra bytes for the length.
