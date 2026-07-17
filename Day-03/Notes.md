# Day 3

## Topics Covered

* INNER JOIN
* LEFT OUTER JOIN (LEFT JOIN)
* RIGHT OUTER JOIN (RIGHT JOIN)
* FULL OUTER JOIN (FULL JOIN)

---

## SQL Joins

SQL Joins are used to combine rows from two or more tables based on a related column.

---

## INNER JOIN

Returns only the rows that have matching values in both tables.

**Syntax**

```sql
SELECT columns
FROM table1
INNER JOIN table2
ON table1.column = table2.column;
```

---

## LEFT JOIN

Returns all rows from the left table and the matching rows from the right table.

If no matching record exists, NULL values are returned for the right table.

**Syntax**

```sql
SELECT columns
FROM table1
LEFT JOIN table2
ON table1.column = table2.column;
```

---

## RIGHT JOIN

Returns all rows from the right table and the matching rows from the left table.

If no matching record exists, NULL values are returned for the left table.

**Syntax**

```sql
SELECT columns
FROM table1
RIGHT JOIN table2
ON table1.column = table2.column;
```

---

## FULL JOIN

Returns all rows from both tables.

Rows without matching records are displayed with NULL values.

**Syntax**

```sql
SELECT columns
FROM table1
FULL JOIN table2
ON table1.column = table2.column;
```
