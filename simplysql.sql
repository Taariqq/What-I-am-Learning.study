SHOW DATABASES;
-- sql statements have 3 components: keywords, identifiers and constants
-- clauses: the SELECT clause, the FROM clause, the WHERE clause, etc.. EACH clause has syntax rules as to how to write it
-- syntax/symantics - interchangable words - syntax is what you said, demantics is what you meant 
-- DDL manages 'database objects' while DML manages the 'date' in tables and columns   
-- DDL changes database 'structure' while DML changes only the 'data'.
-- Template for returning unmatched rows

FROM ltable
LEFT OUTER JOIN rtable ON
rtable.fk = ltable.pk
WHERE
rtable.fk IS NULL;

-- CREATE DATABASE TeamsGames;

USE TeamsGames;

--
-- Teams_02_INSERT.sql
 CREATE TABLE teams ( id INTEGER NOT NULL PRIMARY KEY ,
name VARCHAR(37) NOT NULL ,
conference CHAR(2) NOT NULL CHECK ( conference IN ( 'AA',
'A',
'B',
'C',
'D',
'E',
'F',
'G' ) ) );

INSERT
	INTO
	teams (id,
	name,
	conference)
VALUES (9,
'Riff Raff',
'F');

INSERT
	INTO
	TeamsGames.teams ( conference,
	id,
	name)
VALUES ( 'F',
37,
'Havoc') ,
( 'C ',
63,
'Brewers');

UPDATE
	TeamsGames.teams
SET
	conference = 'E'
WHERE
	id = 9;

DELETE
FROM
	TeamsGames.teams
WHERE
	id = 63;

SHOW DATABASES;

USE TeamsGames;

SELECT
	*
FROM
	teams;

SELECT
	name
FROM
	TeamsGames.teams;

SELECT
	id,
	name
FROM
	TeamsGames.teans
WHERE
	conference = 'F';

CREATE DATABASE cms;

USE cms;

CREATE TABLE entries ( id INT NOT NULL PRIMARY KEY ,
title VARCHARACTER(99) NOT NULL ,
created TIMESTAMP NOT NULL ,
updated TIMESTAMP NULL ,
category VARCHARACTER(37) NULL ,
content TEXT NULL );

SELECT
	*
from
	entries;

INSERT
	INTO
	entries (id,
	title,
	created,
	updated,
	category)
VALUES (423 ,
'What If I Get Sick and Die?' ,
'2008-12-30' ,
'2009-03-11' ,
'angst') ,
(524 ,
'Uncle Karl and the Gasoline' ,
'2009-02-28' ,
NULL ,
'humor') ,
(537 ,
'Be Nice to Everybody' ,
'2009-03-02' ,
NULL ,
'advice') ,
(573 ,
'Hello Statue' ,
'2009-03-17' ,
NULL ,
'humor') ,
(598 ,
'The Size of Our Galaxy' ,
'2009-04-03' ,
NULL ,
'science') ;

SELECT
	category,
	title
FROM
	cms.entries;

SELECT
	title,
	created,
	content
FROM
	entries
WHERE
	id = 524;

UPDATE
	entries
SET
	content = 'When I was about nine or ten, my Uncle Karl, who
would''ve been in his late teens or early twenties, once performed
what to me seemed like a magic trick.

Using a rubber hose, which he snaked down into the gas tank of my 
father''s car, he siphoned some gasoline into his mouth, lit a match, 
held it up a few inches in front of his face, and then, with explosive 
force, sprayed the gasoline out towards the lit match.

Of course, a huge fireball erupted, much to the delight of the kids
watching. I don''t recall if he did it more than once.

The funny part of this story? We lived to tell it.

Karl was like that.'
WHERE
	id = 524;

SELECT
	title,
	created,
	content
FROM
	entries
WHERE
	id = 524;

SELECT
	category,
	COUNT(*) AS articles
FROM
	entries
GROUP BY
	category
HAVING
	COUNT(*) > 1;

SELECT
	title,
	created
FROM
	entries
ORDER BY
	created DESC;
-- CHAPTER 3: for test tables in chapter 3
 SHOW DATABASES;

USE cms;

SHOW tables;

CREATE TABLE A ( a SMALLINT NOT NULL PRIMARY KEY ) ;

INSERT
	INTO
	A
VALUES (102),
(104),
(106),
(107) ;

CREATE TABLE B ( b SMALLINT NOT NULL PRIMARY KEY ) ;

INSERT
	INTO
	B
VALUES (101),
(102),
(104),
(106),
(108) ;

SELECT
	a,
	b
FROM
	A
INNER JOIN B ON
	a = b;

SELECT
	a,
	b
FROM
	B
INNER JOIN A ON
	b != a;

SELECT
	a,
	b
FROM
	A
LEFT OUTER JOIN B ON
	a = b;
-- to see if order in FROM makes any difference
 SELECT
	a,
	b
FROM
	B
LEFT OUTER JOIN A ON
	a = b;

SELECT
	a,
	b
FROM
	A
RIGHT OUTER JOIN B ON
	a = b;
-- the above two produce same result
 SELECT
	a,
	b
FROM
	B
RIGHT OUTER JOIN A ON
	a = b;

SELECT
	a,
	b
	-- error 

	FROM A
FULL OUTER JOIN B ON
	a = b;
-- mysql doesn't have a FULL OUTER JOIN
-- This is the correct example: 
-- SELECT ... 
-- FROM tbl1 LEFT JOIN tbl2 ...
-- UNION ALL 
-- SELECT ... 
-- FROM tbl1 RIGHT JOIN tbl2 ... 

-- WHERE tbl1.col IS NULL
 SELECT
	a,
	b
FROM
	A
LEFT JOIN B
UNION ALL
SELECT
	a,
	b
FROM
	A
RIGHT JOIN B;
-- WHERE A.col IS NULL;

-- not working :(
 SELECT
	a,
	b
FROM
	A
CROSS JOIN B;
-- column B is laid out first and then A is matched accordingly.
 SELECT
	a,
	b
FROM
	A,
	B
WHERE
	a = b;
-- don't use these
-- real world joins
 show databases;

USE cms;

show tables;

SELECT
	e.category,
	e.title,
	e.created
FROM
	cms.entries e;

/*  Categories INNER JOIN Entries  */
CREATE TABLE categories ( category VARCHAR(9) NOT NULL PRIMARY KEY ,
name VARCHAR(37) NOT NULL );

INSERT
	INTO
	categories
VALUES ( 'blog' ,
'Log on to My Blog' ) ,
( 'humor' ,
'Humorous Anecdotes' ) ,
( 'angst' ,
'Stories from the Id' ) ,
( 'advice' ,
'Gentle Words of Advice' ) ,
( 'science' ,
'Our Spectacular Universe' ) ;

SELECT
	category,
	name
FROM
	cms.categories;

SELECT *
FROM cms.categories c;

SELECT *
FROM cms.entries e;

SELECT c.name, e.title, e.created, c.category	
FROM cms.categories c
		INNER JOIN cms.entries e 
			ON e.category = c.category;

USE TeamsGames;

SELECT name 
FROM teams;

SHOW tables;
DESCRIBE teams;



























