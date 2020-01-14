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
conference CHAR(2) NOT NULL 
CHECK ( conference IN ( 'AA','A','B','C','D','E','F','G' ) ) );

INSERT INTO teams (id,	name,	conference)
VALUES (9,'Riff Raff','F');

INSERT INTO	TeamsGames.teams ( conference,	id,	name)
VALUES ( 'F',37, 'Havoc') 
			,( 'C ',63, 'Brewers');

UPDATE
	TeamsGames.teams
SET
	conference = 'E'
WHERE
	id = 9;

DELETE FROM TeamsGames.teams
WHERE	id = 63;

SHOW DATABASES;

USE TeamsGames;

SELECT	* FROM	teams;

SELECT	name
FROM	TeamsGames.teams;

SELECT	id,	name
FROM	TeamsGames.teans
WHERE	conference = 'F';

CREATE DATABASE cms;

USE cms;

CREATE TABLE entries ( id INT NOT NULL PRIMARY KEY ,
title VARCHARACTER(99) NOT NULL ,
created TIMESTAMP NOT NULL ,
updated TIMESTAMP NULL ,
category VARCHARACTER(37) NULL ,
content TEXT NULL );

SELECT	*
from	entries;

INSERT	INTO	entries (id,	title,	created,	updated,	category)
VALUES (423 ,'What If I Get Sick and Die?' ,'2008-12-30' ,'2009-03-11' ,'angst') 
,(524 ,'Uncle Karl and the Gasoline' ,'2009-02-28' ,NULL ,'humor') 
,(537 ,'Be Nice to Everybody' ,'2009-03-02' ,NULL ,'advice') 
,(573 ,'Hello Statue' ,'2009-03-17' ,NULL ,'humor') 
,(598 ,'The Size of Our Galaxy' ,'2009-04-03' ,NULL ,'science') ;

SELECT	category,	title
FROM	cms.entries;

SELECT	title,	created,	content
FROM	entries
WHERE	id = 524;

UPDATE	entries
SET	content = 'When I was about nine or ten, my Uncle Karl, who
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
WHERE id = 524;

SELECT	title,	created,	content
FROM	entries
WHERE	id = 524;

SELECT * FROM cms.entries;

SELECT	category,	COUNT(*) AS articles
FROM	cms.entries
GROUP BY	category;
HAVING	COUNT(*) > 1;

SELECT	title, category, created
FROM	entries
ORDER BY	category, created DESC;
-- CHAPTER 3: for test tables in chapter 3

 SHOW DATABASES;

USE cms;

SHOW tables;

SELECT a FROM A; -- because b is in table B.

CREATE TABLE A ( a SMALLINT NOT NULL PRIMARY KEY ) ;

INSERT	INTO	A
VALUES (102),(104),(106),(107) ;

CREATE TABLE B ( b SMALLINT NOT NULL PRIMARY KEY ) ;

INSERT	INTO	B
VALUES (101),(102),(104),(106),(108) ;

-- **Type** inner join
SELECT	a,	b
FROM	A
INNER JOIN B 
	ON	a = b;

SELECT	a,	b
FROM	
B INNER JOIN A 
	ON	b != a;

-- **Type** left outer join
SELECT	a,	b
FROM	
A LEFT OUTER JOIN B 
	ON	a = b;

-- **Type** right outer join
SELECT a, b 
FROM
A RIGHT OUTER JOIN B
	ON a = b;

-- **Type** Full outer join

-- * FULL OUTER JOIN does not work in MySQL!!
SELECT a, b 
FROM A FULL OUTER JOIN B
	ON a = b;
-- to see if order in FROM makes any difference

 SELECT	a,	b
FROM	B
LEFT OUTER JOIN A ON	a = b;

SELECT	a,	b
FROM	A
RIGHT OUTER JOIN B ON	a = b;
-- the above two produce same result

 SELECT	a,	b
FROM	B
RIGHT OUTER JOIN A ON	a = b;

SELECT	a,	b
	-- error 
	FROM A FULL OUTER JOIN B ON	a = b;
-- mysql doesn't have a FULL OUTER JOIN
-- This is the correct example: 
-- SELECT ... 
-- FROM tbl1 LEFT JOIN tbl2 ...
-- UNION ALL 
-- SELECT ... 
-- FROM tbl1 RIGHT JOIN tbl2 ... 

-- WHERE tbl1.col IS NULL
 SELECT	a,	b
FROM	A
LEFT JOIN B UNION ALL

SELECT	a,	b
FROM	A
RIGHT JOIN B;
-- WHERE A.col IS NULL;

-- not working :(

-- **Type** cross join
SELECT	a,	b
FROM	
A CROSS JOIN B;

-- in above, column A is laid out first, matching each w/ B's 1st, then 2nd, and so on.

SELECT	a,	b
FROM	A,	B
WHERE	a = b;
-- don't use these
-- use => real world joins
 show databases;

USE cms;

show tables;

SELECT	e.category,	e.title,	e.created
FROM	cms.entries e;

/*  Categories INNER JOIN Entries  */
CREATE TABLE categories
	( category VARCHAR(9) NOT NULL PRIMARY KEY 
		, name VARCHAR(37) NOT NULL );

INSERT	INTO	categories
VALUES ( 'blog' ,'Log on to My Blog' ) 
,( 'humor' ,'Humorous Anecdotes' ) 
,( 'angst' ,'Stories from the Id' ) 
,( 'advice' ,'Gentle Words of Advice' ) 
,( 'science' ,'Our Spectacular Universe' ) ;

SELECT	category,	name
FROM	cms.categories;

SELECT * FROM cms.categories;

DESCRIBE cms.categories;
DESCRIBE cms.entries;
SHOW DATABASES;
SHOW SCHEMAS;

SELECT * FROM cms.entries;

SELECT categories.name, entries.title, entries.created
FROM cms.categories INNER JOIN cms.entries 
			ON entries.category = categories.category;

USE TeamsGames;

SELECT name 
FROM teams;

SHOW tables;
DESCRIBE teams;

SELECT VERSION();

SELECT category, title
FROM entries e2;

SELECT name, title, created, categories.category
FROM cms.categories INNER JOIN cms.entries
	ON entries.category = categories.category;
-- w/o qualified names -or- add only to disambiguate

SELECT c.name NOM, e.title, e.created, c.category
FROM cms.categories c INNER JOIN cms.entries e
	ON c.category = e.category;

SELECT c.name AS nom, e.title AS tytal, e.created, c.category AS cat
FROM 	cms.categories c LEFT OUTER JOIN cms.entries e
	ON e.category = c.category;
-- in above, c.category will show the 'blog' category
-- whereas e.category will not show the 'blog' category
-- because 'categories' table is to the left of LEFT OUTER JOIN
-- now
-- if we make this RIGHT OUTER JOIN, e.category will not show 'blog
-- because 'entries' table does not have an entry for 'blog', yet!

SELECT c.name, e.title, e.created
FROM cms.categories c RIGHT OUTER JOIN cms.entries e
	ON c.category = e.category;

-- insert into entries for unmatched categories listing
INSERT INTO entries
	(id, title, created, updated, category)
VALUES
	(605, 'Windows Media Center Rocks', '2009-4-29', NULL, 'computers');

SELECT * FROM cms.entries;

-- union

SELECT c.name, e.title, e.created
FROM cms.categories c LEFT OUTER JOIN cms.entries e
	ON e.category = c.category
UNION
SELECT c.name, e.title, e.created
FROM cms.categories c RIGHT OUTER JOIN cms.entries e
	ON e.category = c.category
-- add another/different column at the end of each select and see the 
-- vertical stacking of results

-- union all
SELECT c.name, e.title, e.created
FROM cms.categories c LEFT OUTER JOIN cms.entries e
  ON e.category = c.category
UNION ALL
SELECT c.name, e.title, e.created
FROM cms.categories c RIGHT OUTER JOIN cms.entries e
  ON e.category = c.category;
 
-- views 
CREATE VIEW
	entries_with_category
AS 
SELECT e.title, e.created, c.name AS category_name
FROM cms.entries e INNER JOIN cms.categories c 
	ON c.category = e.category;

-- query the view
SELECT title, category_name /*, category => error bcs not defined in view */
FROM entries_with_category;

-- derived tables
SELECT title, category_name
FROM (SELECT e.title, e.created, c.name AS category_name
			FROM cms.entries e INNER JOIN cms.categories c
				ON c.category = e.category
			) AS entries_with_category;
		
-- ch4 WHERE - shopping cart

CREATE DATABASE cart;
SHOW DATABASES;
USE cart;
SHOW TABLES;

CREATE TABLE items
( 
  id     INTEGER      NOT NULL PRIMARY KEY
, name   VARCHAR(21)  NOT NULL
, type   VARCHAR(7)   NOT NULL
, price  DECIMAL(5,2)   NULL
);

INSERT INTO items
VALUES (5021,'thingie'        ,'widgets',  9.37 )
,				(5022,'gadget'         ,'doodads', 19.37 )
,				(5023,'dingus'         ,'gizmos' , 29.37 )
,				(5041,'gewgaw'         ,'widgets',  5.00 )
,				(5042,'knickknack'     ,'doodads', 10.00 )
,				(5043,'whatnot'        ,'gizmos' , 15.00 )
,				(5061,'bric-a-brac'    ,'widgets',  2.00 )
,				(5062,'folderol'       ,'doodads',  4.00 )
,				(5063,'jigger'         ,'gizmos' ,  6.00 )
,				(5901,'doohickey'      ,'widgets', 12.00 )
,				(5902,'gimmick'        ,'doodads',  9.37 )
,				(5903,'dingbat'        ,'gizmos' ,  9.37 )
,				(5911,'thingamajig'    ,'widgets', NULL  )
,				(5912,'thingamabob'    ,'doodads', NULL  )
,				(5913,'thingum'        ,'gizmos' , NULL  )
,				(5931,'contraption'    ,'widgets', 49.95 )
,				(5932,'whatchamacallit','doodads', 59.95 )
,				(5937,'whatsis'        ,'gizmos' , NULL  )
;

SELECT * FROM cart.items;

SELECT name, `type`
FROM cart.items
WHERE price = 9.37;

CREATE DATABASE xyz;
SHOW DATABASES;

SELECT name, `type`, price
FROM cart.items
WHERE price < 10.00;

SELECT name
FROM cart.items
WHERE name < 'C';

SELECT name, `type`
FROM cart.items
WHERE name LIKE 'thing%';

SELECT name, price
FROM cart.items
WHERE price BETWEEN 5.00 AND 10.00;

UPDATE
  items
SET
  price = 22.22
WHERE 
  name IN ( 'thingamajig'
          , 'thingamabob'
          , 'thingum' )
;
UPDATE
  items
SET
  price = 93.70
WHERE
  name = 'whatsis'
;

-- now create customers and stuff

CREATE TABLE customers
( 
  id        INTEGER      NOT NULL PRIMARY KEY
, name      VARCHAR(99)  NOT NULL
, billaddr  VARCHAR(255) NOT NULL
, shipaddr  VARCHAR(255) NOT NULL DEFAULT 'See billing address.'
);

-- insert values

INSERT INTO customers (id, name, billaddr) VALUES (710,'A. Jones','123 Sesame St., Eureka, KS');
INSERT INTO customers (id, name, billaddr) VALUES (730,'B. Smith','456 Sesame St., Eureka, KS');
INSERT INTO customers (id, name, billaddr) VALUES (750,'C. Brown','789 Sesame St., Eureka, KS');
INSERT INTO customers (id, name, billaddr) VALUES (770,'D. White','246 Sesame St., Eureka, KS');
INSERT INTO customers (id, name, billaddr) VALUES (820,'E. Baker','135 Sesame St., Eureka, KS');
INSERT INTO customers (id, name, billaddr) VALUES (840,'F. Black','468 Sesame St., Eureka, KS');
INSERT INTO customers (id, name, billaddr) VALUES (860,'G. Scott','357 Sesame St., Eureka, KS');
INSERT INTO customers (id, name, billaddr, shipaddr) VALUES (880,'H. Clark','937 Sesame St., Eureka, KS', 'P.O. Box 9, Toledo, OH' );

-- carts

CREATE TABLE carts
( 
  id          INTEGER    NOT NULL PRIMARY KEY
, customer_id INTEGER    NOT NULL
/*  Note: use DATETIME if your database system does not support TIMESTAMP  */
, cartdate    TIMESTAMP  NOT NULL
);

-- insert

INSERT INTO carts (id, customer_id, cartdate) VALUES (2131,710,'2008-09-03 00:00:00');
INSERT INTO carts (id, customer_id, cartdate) VALUES (2461,820,'2008-09-16 00:00:00');
INSERT INTO carts (id, customer_id, cartdate) VALUES (2921,730,'2008-09-19 00:00:00');
INSERT INTO carts (id, customer_id, cartdate) VALUES (2937,750,'2008-09-21 00:00:00');
INSERT INTO carts (id, customer_id, cartdate) VALUES (3001,750,'2008-09-23 00:00:00');
INSERT INTO carts (id, customer_id, cartdate) VALUES (3002,730,'2008-10-07 00:00:00');
INSERT INTO carts (id, customer_id, cartdate) VALUES (3081,880,'2008-10-13 00:00:00');
INSERT INTO carts (id, customer_id, cartdate) VALUES (3197,770,'2008-10-14 00:00:00');
INSERT INTO carts (id, customer_id, cartdate) VALUES (3321,860,'2008-10-26 00:00:00');
INSERT INTO carts (id, customer_id, cartdate) VALUES (3937,750,'2008-10-28 00:00:00');

-- create cartitems

CREATE TABLE cartitems
( 
  cart_id  INTEGER  NOT NULL
, item_id  INTEGER  NOT NULL
/*  Remove the DEFAULT and CHECK constraint if not supported  */
, qty      SMALLINT NOT NULL  DEFAULT 1
     CHECK ( qty <= 10 )
);

-- inserts
INSERT INTO cartitems (cart_id, item_id, qty) VALUES (2131,5902,3);
INSERT INTO cartitems (cart_id, item_id, qty) VALUES (2131,5913,2);
INSERT INTO cartitems (cart_id, item_id, qty) VALUES (2461,5043,3);
INSERT INTO cartitems (cart_id, item_id, qty) VALUES (2461,5901,2);
INSERT INTO cartitems (cart_id, item_id, qty) VALUES (2921,5023,3);
INSERT INTO cartitems (cart_id, item_id, qty) VALUES (2921,5937,2);
INSERT INTO cartitems (cart_id, item_id, qty) VALUES (2937,5913,1);
INSERT INTO cartitems (cart_id, item_id, qty) VALUES (3001,5912,3);
INSERT INTO cartitems (cart_id, item_id, qty) VALUES (3001,5937,2);
INSERT INTO cartitems (cart_id, item_id, qty) VALUES (3002,5901,1);
INSERT INTO cartitems (cart_id, item_id, qty) VALUES (3081,5023,3);
INSERT INTO cartitems (cart_id, item_id, qty) VALUES (3081,5913,2);
INSERT INTO cartitems (cart_id, item_id, qty) VALUES (3197,5932,1);
INSERT INTO cartitems (cart_id, item_id, qty) VALUES (3321,5932,3);
INSERT INTO cartitems (cart_id, item_id, qty) VALUES (3937,5913,3);


SELECT id, name, billaddr
FROM cart.customers
WHERE name = 'A. Jones' OR 'B. Smith';

SELECT id, name, billaddr
FROM cart.customers
WHERE name = 'A. Jones' OR name = 'B. Smith';

SELECT id, name
FROM 	cart.items
WHERE customers.name = 'A. Jones' OR (customers.name = 'B. Smith'
		AND items.name = 'thingum');

-- 
	
SELECT 
  customers.name    AS customer
, carts.id          AS cart
, items.name        AS item
FROM
  customers
    INNER JOIN carts
      ON carts.customer_id = customers.id
    INNER JOIN cartitems
      ON cartitems.cart_id = carts.id
    INNER JOIN items
      ON items.id = cartitems.item_id
WHERE
  customers.name = 'A. Jones' OR (customers.name = 'B. Smith'
      AND items.name = 'thingum');
     
-- corrected/other structure

SELECT 
  customers.name    AS customer
, carts.id          AS cart
, items.name        AS item
FROM
  customers
    INNER JOIN carts
      ON carts.customer_id = customers.id
    INNER JOIN cartitems
      ON cartitems.cart_id = carts.id
    INNER JOIN items
      ON items.id = cartitems.item_id
WHERE
  ( customers.name = 'A. Jones' OR customers.name = 'B. Smith')
      AND items.name = 'thingum';
     
     -- IN -- 
     
SELECT 
  customers.name    AS customer
, carts.id          AS cart
, items.name        AS item
FROM
  cart.customers INNER JOIN cart.carts
        ON carts.customer_id = customers.id 
      INNER JOIN cart.cartitems
        ON cartitems.cart_id = carts.id
      INNER JOIN cart.items
        ON items.id = cartitems.item_id
WHERE
  customers.name IN ( 'A. Jones', 'B. Smith');
--      AND items.name = 'thingum';

SELECT * FROM cart.cartitems;
DESCRIBE cart.customers;
DESCRIBE cart.carts;

SELECT * -- name
FROM cart.items
WHERE items.id IN (
					SELECT cartitems.item_id
					FROM cart.carts INNER JOIN cart.cartitems
						ON cartitems.cart_id = carts.id
					WHERE
						carts.customer_id = 750
					);
				
--     		so what if we wrote the query like this
SELECT items.name
FROM cart.items LEFT OUTER JOIN cart.customers
ON customers.id = items.id
-- WHERE customers.id = 750;

SELECT VERSION(), CURRENT_DATE;



































