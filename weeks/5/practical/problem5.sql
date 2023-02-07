/* Write a query identifying the type of each record
   in the TRIANGLES table using its three side lengths.
   Output one of the following statements for each
   record in the table:

   Equilateral: It's a triangle with 3 sides of equal length.
   Isosceles: It's a triangle with 2 sides of equal length.
   Scalene: It's a triangle with 3 sides of differing lengths.
   Not A Triangle: The given values of A, B, and C don't form a triangle. */
SELECT CASE
    WHEN a >= b + c OR b >= a + c OR c >= a + b THEN "Not A Triangle"
    WHEN a = b AND b = c THEN "Equilateral"
    WHEN a = b OR a = c OR b = c THEN "Isosceles"
    WHEN a != b AND b != c AND c != a THEN "Scalene"
END AS triangletype FROM triangles;