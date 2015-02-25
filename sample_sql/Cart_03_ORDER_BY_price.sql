/*  Chapter 8: The ORDER BY Clause  */

/*  ORDER BY price, when some prices are NULL  */

SELECT
  name
, price
FROM
  items
ORDER BY
  price
;
/* Results should look like this --
   name             price
   whatsis
   thingum
   thingamabob
   thingamajig
   bric-a-brac       2.00
   folderol          4.00
   gewgaw            5.00
   jigger            6.00
   dingbat           9.37
   gimmick           9.37
   thingie           9.37
   knickknack       10.00
   doohickey        12.00
   whatnot          15.00
   gadget           19.37
   dingus           29.37
   contraption      49.95
   whatchamacallit  59.95
*/

SELECT
  name
, price
FROM
  items
ORDER BY
  price DESC
;
/* Results should look like this --
   name             price
   whatchamacallit  59.95
   contraption      49.95
   dingus           29.37
   gadget           19.37
   whatnot          15.00
   doohickey        12.00
   knickknack       10.00
   dingbat           9.37
   gimmick           9.37
   thingie           9.37
   jigger            6.00
   gewgaw            5.00
   folderol          4.00
   bric-a-brac       2.00
   thingamajig
   thingamabob
   thingum
   whatsis
*/
