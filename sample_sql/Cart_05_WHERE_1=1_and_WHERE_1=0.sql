/*  Chapter 4: The WHERE Clause  */

/*  WHERE 1=1 and WHERE 1=0 */

/*  The following query will be mentioned again in Chapter 7. 
    Here, it serves to produce the contents for the HTML
    drop-down list which precedes the WHERE 1=1 example.
*/

SELECT DISTINCT
  type
FROM
  items
;
/*  Results should look like this --
    type
    widgets
    doodads
    gizmos
*/

SELECT 
  name
, price
FROM
  items
WHERE
  type = 'widgets'
      AND price BETWEEN 10.00 AND 20.00
;
/*  Results should look like this --
    name       price
    doohickey   12.00
*/

SELECT
  name
, price
FROM
  items
WHERE
  type = 'widgets'
;
/*  Results should look like this --
    name         price
    thingie       9.37
    gewgaw        5.00
    bric-a-brac   2.00
    doohickey    12.00
    thingamajig  22.22
    contraption  49.95
*/

/*  The following query, of course, produces the
    same results as the above.
*/
SELECT 
  name
, price
FROM
  items
WHERE
  1=1
      AND type = 'widgets'
;

SELECT
  id
, name
, billaddr
, shipaddr
FROM
  customers
WHERE
  1=0
      OR name LIKE '%Toledo%'
      OR billaddr LIKE '%Toledo%'
      OR shipaddr LIKE '%Toledo%'
;
/*  Results should look like this --
    id   name      billaddr                     shipaddr
    880  H. Clark  937 Sesame St., Eureka, KS   P.O. Box 9, Toledo, OH
*/