/*  Chapter 4: The WHERE Clause  */

/*  WHERE name LIKE pattern */

SELECT
  name
, type
FROM
  items
WHERE 
  name LIKE 'thing%'
;
/* Results should look like this --
   name          type
   thingie       widgets
   thingamajig   widgets
   thingamabob   doodads
   thingum       gizmos
*/


/*  WHERE price BETWEEN values */

SELECT
  name
, price
FROM
  items
WHERE
  price BETWEEN 5.00 AND 10.00
;
SELECT 
name
, price
FROM
  items
WHERE
  5.00 <= price AND price <= 10.00
;
/* Results of both queries should look like this --
   name        price
   thingie      9.37
   gewgaw       5.00
   knickknack  10.00
   jigger       6.00
   gimmick      9.37
   dingbat      9.37
*/