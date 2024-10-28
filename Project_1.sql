Task 1: 
Create a table named friends with three columns:

id that stores INTEGER
name that stores TEXT
birthday that stores DATE

CREATE table friends(
  id INTEGER,
  name TEXT,
  birthday DATE
);
Task 2: 
Beneath your current code, add Ororo Munroe to friends.

Her birthday is May 30th, 1940.

INSERT INTO friends (id, name, birthday)
VALUES (1, 'Ororo Munroe', 'May 30th, 1940');

TASK 3:
Add two of your friends to the table.

Insert an id, name, and birthday for each of them.

INSERT INTO friends (id, name, birthday)
VALUES (2, 'Sam', 'June 30th, 1940');
INSERT INTO friends (id, name, birthday)
VALUES (3, 'Pamila', 'May 20th, 1940');

Task 4:

Ororo Munroe just realized that she can control the weather and decided to change her name. Her new name is “Storm”.

Update her record in friends.

UPDATE friends
SET name = 'Storm'
WHERE id = 1;

Task 5:

Add a new column named email

ALTER TABLE friends
ADD COLUMN email;

Task 6:

Update the email address for everyone in your table.

Storm’s email is storm@codecademy.com

UPDATE friends
SET email = 'storm@codecademy.com'
WHERE id = 1;
UPDATE friends
SET email = 'sam@codecademy.com'
WHERE id = 2;
UPDATE friends
SET email = 'pamila@codecademy.com'
WHERE id = 3;

Task 7:

Storm is fictional…

Remove her from friends.

DELETE FROM friends
WHERE id = 1;

Task 8:

Let’s take a look at the result

SELECT * FROM friends;