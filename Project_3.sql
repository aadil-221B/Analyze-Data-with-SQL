/* Trends in Startups
Write queries with aggregate functions to retrieve some interesting insights about these companies.
*/

/* Task 1:
Getting started, take a look at the startups table:
*/
SELECT * 
FROM startups;
/*
name	TEXT
location	TEXT
category	TEXT
employees	INTEGER
raised	INTEGER
valuation	INTEGER
founded	INTEGER
stage	TEXT
ceo	TEXT
info	TEXT
*/
/* Task 2:
Calculate the total number of companies in the table.
*/

SELECT COUNT(*)
FROM startups;
/* Task 3:

We want to know the total value of all companies in this table.
*/

SELECT SUM(valuation)
FROM startups;

/* Task 4:

What is the highest amount raised by a startup?

*/

SELECT MAX(raised)
FROM startups;

/* Task 5:
Edit the query so that it returns the maximum amount of money raised, during ‘Seed’ stage

*/
SELECT MAX(raised)
FROM startups
WHERE stage LIKE 'seed';
SELECT MAX(raised)
FROM startups
WHERE stage = 'Seed';
SELECT MAX(raised)
FROM startups
WHERE lower(stage) = 'seed';
/* Task 6:
In what year was the oldest company on the list founded?

*/
SELECT MIN(founded)
FROM startups;

/* Let's find out the valuations among different sectors:
*/

/* Task 7:
Return the average valuation

*/

SELECT AVG(valuation)
FROM startups;

/* Task 8:

Return the average valuation, in each category.
Round the averages to two decimal places.
Lastly, order the list from highest averages to lowest.
*/
SELECT category, ROUND(AVG(valuation),2)
FROM startups
GROUP BY 1
ORDER BY 2 DESC;


/*
What are the most competitive markets?
*/

/* Task 9:
First, return the name of each category with the total number of companies that belong to it.

Next, filter the result to only include categories that have more than three companies in them.

What are the most competitive markets?
*/

SELECT category, COUNT(*)
FROM startups
GROUP BY 1
HAVING COUNT(*) > 3
ORDER BY 2 DESC;

/*
Let's see if there's a difference in startups sizes among different locations:
*/

/* Task 10:
What is the average size of a startup in each location?
with average sizes above 500?
*/
SELECT location, AVG(employees)
FROM startups
GROUP BY 1
HAVING AVG(employees) > 500;
