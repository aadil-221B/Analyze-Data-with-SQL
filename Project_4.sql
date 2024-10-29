/*
Analyze Hacker News Trends
Table name: hacker_news
title: the title of the story
user: the user who submitted the story
score: the score of the story
timestamp: the time of the story
url: the link of the story
*/ 
SELECT * 
FROM hacker_news
LIMIT 5;

-- Task 1:
/*
What are the top five stories with the highest scores
*/
SELECT *
FROM hacker_news
ORDER BY score DESC
LIMIT 5;

/*
Hacker News Moderating
*/
-- Task 2:
/*

Recent studies have found that online forums tend to be dominated by a small percentage of their users (1-9-90 Rule).

Is this true of Hacker News?

Is a small percentage of Hacker News submitters taking the majority of the points?

First, find the total score of all the stories.
Next, Find the individual users who have gotten combined scores of more than 200, and their combined scores.
Next, overall combined Percentage of scores these top 5 users have

*/

WITH top_5_scorer AS (
SELECT user, SUM(score) total_score
FROM hacker_news
GROUP BY 1
HAVING SUM(score) > 200
ORDER BY 2 DESC
)
SELECT CONCAT(ROUND((100.0 * SUM(total_score)/
(SELECT SUM(score) FROM hacker_news)), 2) , '%') AS percentage
FROM top_5_scorer;


-- Task 3:
/*

Oh no! While we are looking at the power users, some users are rickrolling — tricking readers into clicking on a link to a funny video and claiming that it links to information about coding.

The url of the video is:

https://www.youtube.com/watch?v=dQw4w9WgXcQ

How many times has each offending user posted this link?

*/
SELECT user, COUNT(url) AS number_of_offended_posts
FROM hacker_news
WHERE url LIKE '%watch?v=dQw4w9WgXcQ%'
GROUP BY 1;

/*

Which sites feed Hacker News?

*/

-- Task 4:
/*

Hacker News stories are essentially links that take users to other websites.

Which of these sites feed Hacker News the most:

GitHub, Medium, or New York Times?

First, we want to categorize each story based on their source.
Add a column for the number of stories from each URL 

*/
SELECT COUNT(DISTINCT (url))
FROM hacker_news;

SELECT
CASE
  WHEN url LIKE '%github.com%' THEN 'Github'
  WHEN url LIKE '%medium.com%' THEN 'Medium'
  WHEN url LIKE '%nytimes.com%' THEN 'New York Times'
  ELSE 'Other'
  
END AS Source,
COUNT(*)
FROM hacker_news
GROUP BY 1;

/*

What's the best time to post a story?

*/

-- Task 5:
/*


Every submitter wants their story to get a high score so that the story makes it to the front page, but…

What’s the best time of the day to post a story on Hacker News?
strftime(format, column)
Round the average scores (ROUND()).

Rename the columns to make it more readable (AS).

Add a WHERE clause to filter out the NULL values in timestamp.

*/
SELECT strftime('%H', timestamp) AS hour_of_day,
ROUND(AVG(score),2) AS average_score, COUNT(*) AS number_of_stories
FROM hacker_news
WHERE timestamp IS NOT NULL
GROUP BY 1
ORDER BY 2 DESC
;


