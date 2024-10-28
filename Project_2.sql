-- New York Restaurants
-- Table name 'nomnom'
/* TAsk 1:
Start by getting a feel for the nomnom table:
What are the column names?
*/

SELECT *
FROM nomnom;

/* TAsk 2:
What are the distinct neighborhoods?
*/
SELECT DISTINCT neighborhood
FROM nomnom;

/* Task 3:
What are the distinct cuisine types?
*/
SELECT DISTINCT cuisine
FROM nomnom;

/* Task 4:
  
Suppose we would like some Chinese takeout.
What are our options?
*/
SELECT *
FROM nomnom
WHERE cuisine LIKE 'chinese';

/* Task 5:
  
Return all the restaurants with reviews of 4 and above.
*/
SELECT *
FROM nomnom
WHERE review >= 4;

/* Task 6:
  Suppose Abbi and Ilana want to have a fancy dinner date.
Return all the restaurants that are Italian and $$$

*/

SELECT *
FROM nomnom
WHERE lower(cuisine) = 'italian' AND price = '$$$';

/* Task 7:
 Your coworker Trey can’t remember the exact name of a restaurant he went to but he knows it contains the word ‘meatball’ in it.

Can you find it for him using a query?

*/
SELECT *
FROM nomnom
WHERE name LIKE '% meatball %';

/* Task 8:
Let’s order delivery to the house!

Find all the close by spots in Midtown, Downtown or Chinatown.

*/

SELECT *
FROM nomnom
WHERE lower(neighborhood) IN ('midtown','chinatown','downtown');

/* Task 9:

Find all the health grade pending restaurants (empty values).

*/

SELECT *
FROM nomnom
WHERE health IS NULL;

/* Task 10:

Create a Top 10 Restaurants Ranking based on reviews.

*/
SELECT *
FROM nomnom
ORDER BY review DESC
limit 10;

/* Task 11:


Use a CASE statement to change the rating system to:

review > 4.5 is Extraordinary
review > 4 is Excellent
review > 3 is Good
review > 2 is Fair
Everything else is Poor
Don’t forget to rename the new column!

*/

SELECT *,
CASE
  WHEN review > 4.5 THEN 'Extraordinary'
  WHEN review > 4 THEN 'Excellent'
  WHEN review > 3 THEN 'Good'
  WHEN review > 2 THEN 'Fair'
  ELSE 'Poor'

END AS 'Review_category'
FROM nomnom;

