/*  Chapter 4: The WHERE Clause  */

/*  WHERE price equals value  */

/*  First, let's create and populate the items table  */

CREATE TABLE items
( 
  id     INTEGER      NOT NULL PRIMARY KEY
, name   VARCHAR(21)  NOT NULL
, type   VARCHAR(7)   NOT NULL
, price  DECIMAL(5,2)   NULL
);

INSERT INTO items VALUES (5021,'thingie'        ,'widgets',  9.37 );
INSERT INTO items VALUES (5022,'gadget'         ,'doodads', 19.37 );
INSERT INTO items VALUES (5023,'dingus'         ,'gizmos' , 29.37 );
INSERT INTO items VALUES (5041,'gewgaw'         ,'widgets',  5.00 );
INSERT INTO items VALUES (5042,'knickknack'     ,'doodads', 10.00 );
INSERT INTO items VALUES (5043,'whatnot'        ,'gizmos' , 15.00 );
INSERT INTO items VALUES (5061,'bric-a-brac'    ,'widgets',  2.00 );
INSERT INTO items VALUES (5062,'folderol'       ,'doodads',  4.00 );
INSERT INTO items VALUES (5063,'jigger'         ,'gizmos' ,  6.00 );
INSERT INTO items VALUES (5901,'doohickey'      ,'widgets', 12.00 );
INSERT INTO items VALUES (5902,'gimmick'        ,'doodads',  9.37 );
INSERT INTO items VALUES (5903,'dingbat'        ,'gizmos' ,  9.37 );
INSERT INTO items VALUES (5911,'thingamajig'    ,'widgets', NULL  );
INSERT INTO items VALUES (5912,'thingamabob'    ,'doodads', NULL  );
INSERT INTO items VALUES (5913,'thingum'        ,'gizmos' , NULL  );
INSERT INTO items VALUES (5931,'contraption'    ,'widgets', 49.95 );
INSERT INTO items VALUES (5932,'whatchamacallit','doodads', 59.95 );
INSERT INTO items VALUES (5937,'whatsis'        ,'gizmos' , NULL  );

SELECT 
  name
, type
, price 
FROM
  items
;
/* Results should look like this --
   name              type     price             
   thingie           widgets   9.37
   gadget            doodads  19.37
   dingus            gizmos   29.37
   gewgaw            widgets   5.00
   knickknack        doodads  10.00
   whatnot           gizmos   15.00
   bric-a-brac       widgets   2.00
   folderol          doodads   4.00
   jigger            gizmos    6.00
   doohickey         widgets  12.00
   gimmick           doodads   9.37
   dingbat           gizmos    9.37
   thingamajig       widgets 
   thingamabob       doodads 
   thingum           gizmos  
   contraption       widgets  49.95
   whatchamacallit   doodads  59.95
   whatsis           gizmos  
*/

SELECT
  name
, type
FROM
  items
WHERE
  price = 9.37
;
/* Results should look like this --
   name      type
   thingie   widgets
   gimmick   doodads
   dingbat   gizmos
*/

SELECT
  name  
, price
FROM
  items 
WHERE
  price < 10.00
;
/* Results should look like this --
   name         price
   thingie       9.37
   gewgaw        5.00
   bric-a-brac   2.00
   folderol      4.00
   jigger        6.00
   gimmick       9.37
   dingbat       9.37
*/

SELECT
name
, type
FROM
  items
WHERE
  name < 'C'
;
/* Results should look like this --
   name         type
   bric-a-brac  widgets
*/