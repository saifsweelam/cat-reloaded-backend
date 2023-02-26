# Week 6 Practical Problems
Topic: _Basic JOIN and Conditions_

## Problem 1

### Question
[Employee Salaries](https://www.hackerrank.com/challenges/salary-of-employees/problem)

### Statement
Write a query that prints a list of employee names
(i.e.: the `name` attribute) for employees in `Employee`
having a salary greater than $2000 per month who have been
employees for less than 10 months. Sort your result
by ascending `employee_id`.

### Schema
**Employee table**

![Employee table](./schema1.png)

### Solution
```sql
SELECT name FROM employee
WHERE salary > 2000 AND months < 10
ORDER BY employee_id;
```

## Problem 2

### Question
[African Cities](https://www.hackerrank.com/challenges/african-cities/problem)

### Statement
Given the `CITY` and `COUNTRY` tables, query the names
of all cities where the `CONTINENT` is 'Africa'.

**Note**: `CITY.CountryCode` and `COUNTRY.Code` are matching key columns.

### Schema
![City table](../../4/practical/schema1.jpg)

![Country table](./schema3.jpg)

### Solution
```sql
SELECT city.name FROM city
JOIN country ON city.countrycode = country.code
WHERE country.continent = "Africa";
```

## Problem 3

### Question
[Population Census](https://www.hackerrank.com/challenges/asian-population/problem)

### Statement
Given the `CITY` and `COUNTRY` tables, query the
sum of the populations of all cities where
the `CONTINENT` is 'Asia'.

**Note**: `CITY.CountryCode` and `COUNTRY.Code` are matching key columns.

### Schema
![City table](../../4/practical/schema1.jpg)

![Country table](./schema3.jpg)

### Solution
```sql
SELECT SUM(city.population) FROM city JOIN country
ON city.countrycode = country.code
WHERE country.continent = "Asia"
GROUP BY country.continent;
```

## Problem 4

### Question
[Swap Salary](https://leetcode.com/problems/swap-salary/)

### Statement
Write an SQL query to swap all `'f'` and `'m'` values
(i.e., change all `'f'` values to `'m'` and vice versa)
with a single update statement and no intermediate
temporary tables.

### Schema
| Column Name | Type     |
|-------------|----------|
| id          | int      |
| name        | varchar  |
| sex         | ENUM     |
| salary      | int      |

id is the primary key for this table.
The sex column is ENUM value of type (`'m'`, `'f'`).
The table contains information about an employee.

### Solution
```sql
UPDATE salary
SET sex = (CASE
    WHEN sex = 'm' THEN 'f'
    WHEN sex = 'f' THEN 'm'
END)
```

## Problem 5

### Question


### Statement
You are given three tables: `Students`,
`Friends` and `Packages`. `Students` contains
two columns: `ID` and `Name`. `Friends` contains
two columns: `ID` and `Friend_ID` (`ID` of the ONLY
best friend). Packages contains two columns:
`ID` and `Salary` (offered salary in $ thousands
per month).

Write a query to output the names of those
students whose best friends got offered a
higher salary than them. Names must be
ordered by the salary amount offered to
the best friends. It is guaranteed that
no two students got same salary offer.

### Schema
![Problem 5 Schema](./schema2.png)

### Solution
```sql
SELECT student.name FROM friends
JOIN packages AS student_package
    ON friends.id = student_package.id
JOIN packages AS friend_package
    ON friends.friend_id = friend_package.id
JOIN students AS student
    ON friends.id = student.id
WHERE friend_package.salary > student_package.salary
ORDER BY friend_package.salary;
```