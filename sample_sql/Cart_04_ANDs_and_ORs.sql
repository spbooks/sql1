/*  Chapter 4: The WHERE Clause  */

/*  ANDs and ORs  */

/*  First, supply missing prices */

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

/*  Next, create customers, carts, and cartitems  */

CREATE TABLE customers
( 
  id        INTEGER      NOT NULL PRIMARY KEY
, name      VARCHAR(99)  NOT NULL
, billaddr  VARCHAR(255) NOT NULL
, shipaddr  VARCHAR(255) NOT NULL DEFAULT 'See billing address.'
);
INSERT INTO customers (id, name, billaddr) VALUES (710,'A. Jones','123 Sesame St., Eureka, KS');
INSERT INTO customers (id, name, billaddr) VALUES (730,'B. Smith','456 Sesame St., Eureka, KS');
INSERT INTO customers (id, name, billaddr) VALUES (750,'C. Brown','789 Sesame St., Eureka, KS');
INSERT INTO customers (id, name, billaddr) VALUES (770,'D. White','246 Sesame St., Eureka, KS');
INSERT INTO customers (id, name, billaddr) VALUES (820,'E. Baker','135 Sesame St., Eureka, KS');
INSERT INTO customers (id, name, billaddr) VALUES (840,'F. Black','468 Sesame St., Eureka, KS');
INSERT INTO customers (id, name, billaddr) VALUES (860,'G. Scott','357 Sesame St., Eureka, KS');
INSERT INTO customers (id, name, billaddr, shipaddr) VALUES (880,'H. Clark','937 Sesame St., Eureka, KS', 'P.O. Box 9, Toledo, OH' );

CREATE TABLE carts
( 
  id          INTEGER    NOT NULL PRIMARY KEY
, customer_id INTEGER    NOT NULL
/*  Note: use DATETIME if your database system does not support TIMESTAMP  */
, cartdate    TIMESTAMP  NOT NULL
);

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

CREATE TABLE cartitems
( 
  cart_id  INTEGER  NOT NULL
, item_id  INTEGER  NOT NULL
/*  Remove the DEFAULT and CHECK constraint if not supported  */
, qty      SMALLINT NOT NULL  DEFAULT 1
     CHECK ( qty <= 10 )
);
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


/*  The following query will be used again in Chapter 5. Here, it 
    serves to confirm that the tables have been populated properly.  
*/

SELECT 
  customers.name    AS customer
, carts.id          AS cart
, items.name        AS item
, cartitems.qty
, items.price
, cartitems.qty
      * items.price AS total
FROM
  customers
    INNER JOIN carts
      ON carts.customer_id = customers.id
    INNER JOIN cartitems
      ON cartitems.cart_id = carts.id
    INNER JOIN items
      ON items.id = cartitems.item_id
ORDER BY
  customers.name
, carts.id
, items.name
;
/*  Results should look like this --
    customer  cart  item             qty  price   total   
    A. Jones  2131  gimmick           3    9.37   28.11   
    A. Jones  2131  thingum           2   22.22   44.44   
    B. Smith  2921  dingus            3   29.37   88.11   
    B. Smith  2921  whatsis           2   93.70  187.40   
    B. Smith  3002  doohickey         1   12.00   12.00   
    C. Brown  2937  thingum           1   22.22   22.22   
    C. Brown  3001  thingamabob       3   22.22   66.66   
    C. Brown  3001  whatsis           2   93.70  187.40   
    C. Brown  3937  thingum           3   22.22   66.66   
    D. White  3197  whatchamacallit   1   59.95   59.95   
    E. Baker  2461  doohickey         2   12.00   24.00   
    E. Baker  2461  whatnot           3   15.00   45.00   
    G. Scott  3321  whatchamacallit   3   59.95  179.85   
    H. Clark  3081  dingus            3   29.37   88.11   
    H. Clark  3081  thingum           2   22.22   44.44   
*/


/*  Query with incorrect OR condition  */

SELECT 
  id
, name
, billaddr
FROM
  customers
WHERE 
  name = 'A. Jones' OR 'B. Smith'
;
/*  This query will fail on a syntax error in all database systems 
    except MySQL, which will return this --
    id   name      billaddr
    710  A. Jones  123 Sesame St., Eureka, KS
*/


/*  ANDs and ORs  */

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
  customers.name = 'A. Jones' OR customers.name = 'B. Smith'
      AND items.name = 'thingum'
;
/*  Results should look like this --
    customer  cart  item
    A. Jones  2131  gimmick
    A. Jones  2131  thingum
*/

/*  The query above returns no rows for B. Smith because B. Smith 
    did not purchase any thingums. It returns all items for A. Jones. 
    The same results are produced if the WHERE clause is --

WHERE customers.name = 'A. Jones'                               
   OR ( customers.name = 'B. Smith' AND items.name = 'thingum' )

*/


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
  (customers.name = 'A. Jones' OR customers.name = 'B. Smith' )
      AND items.name = 'thingum'
;
/*  Results should look like this --
    customer  cart  item
    A. Jones  2131  thingum
*/


/*  In the section on IN conditions (later on in the chapter),
    the above WHERE clause is rewritten as follows, with
    of course the same results:

WHERE customers.name IN ( 'A. Jones', 'B. Smith' )
  AND items.name = 'thingum'

*/


/*  Here's the same query, using a NOT IN condition  */

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
  NOT ( customers.name IN ( 'A. Jones', 'B. Smith' ) )
;
/*  Results should look like this --
    customer  cart  item
    E. Baker  2461  whatnot
    E. Baker  2461  doohickey
    C. Brown  2937  thingum
    C. Brown  3001  thingamabob
    C. Brown  3001  whatsis
    H. Clark  3081  dingus
    H. Clark  3081  thingum
    D. White  3197  whatchamacallit
    G. Scott  3321  whatchamacallit
    C. Brown  3937  thingum
*/

/*  The above WHERE clause can also be written as follows with,
    of course, the same results:

WHERE customers.name NOT IN ( 'A. Jones', 'B. Smith' )

    Two more WHERE clauses can be tried on the same query:

WHERE NOT ( customers.name = 'A. Jones' )

WHERE customers.name NOT = 'A. Jones'  

    This last one will not work at all.
*/