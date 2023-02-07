# Week 5 Practical Problems
Topic: _Basic SELECT and Aggregations_

## Schemas

### Problems 1-2
![City Table](./schema1.jpg)

### Problems 3-4
![City Table](../../4/practical/schema1.jpg)

### Problem 5
**Triangles Table**

![Students Table](./schema2.png)

## Solutions

### Problem 1
Query a list of CITY and STATE from the STATION table.

```sql
SELECT city, state FROM station;
```

### Problem 2
Query a list of CITY names from STATION for cities
that have an even ID number. Print the results in
any order, but exclude duplicates from the answer.

```sql
SELECT city FROM station WHERE id % 2 = 0 GROUP BY city;
```

### Problem 3
Query the total population of all cities in CITY where District is California.

```sql
SELECT SUM(population) AS totalpopulation FROM city WHERE district = "California";
```

### Problem 4
Query a count of the number of cities in 
CITY having a Population larger than 100000.

```sql
SELECT COUNT(*) AS n FROM city WHERE population > 100000;
```

### Problem 5
Write a query identifying the type of each record
in the TRIANGLES table using its three side lengths.
Output one of the following statements for each
record in the table:

* **Equilateral**: It's a triangle with 3 sides of equal length.
* **Isosceles**: It's a triangle with 2 sides of equal length.
* **Scalene**: It's a triangle with 3 sides of differing lengths.
* **Not A Triangle**: The given values of A, B, and C don't form a triangle.
```sql
SELECT CASE
    WHEN a >= b + c OR b >= a + c OR c >= a + b THEN "Not A Triangle"
    WHEN a = b AND b = c THEN "Equilateral"
    WHEN a = b OR a = c OR b = c THEN "Isosceles"
    WHEN a != b AND b != c AND c != a THEN "Scalene"
END AS triangletype FROM triangles;
```