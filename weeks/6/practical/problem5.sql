/* You are given three tables: Students,
   Friends and Packages. Students contains
   two columns: ID and Name. Friends contains
   two columns: ID and Friend_ID (ID of the ONLY
   best friend). Packages contains two columns:
   ID and Salary (offered salary in $ thousands
   per month).
   
   Write a query to output the names of those
   students whose best friends got offered a
   higher salary than them. Names must be
   ordered by the salary amount offered to
   the best friends. It is guaranteed that
   no two students got same salary offer. */
SELECT student.name FROM friends
JOIN packages AS student_package
    ON friends.id = student_package.id
JOIN packages AS friend_package
    ON friends.friend_id = friend_package.id
JOIN students AS student
    ON friends.id = student.id
WHERE friend_package.salary > student_package.salary
ORDER BY friend_package.salary;