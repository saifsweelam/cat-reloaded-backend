/* Query the total population of all cities in CITY where District is California. */
SELECT SUM(population) AS totalpopulation FROM city WHERE district = "California";