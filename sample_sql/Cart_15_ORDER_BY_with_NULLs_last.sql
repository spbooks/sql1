/*  Chapter 8: The ORDER BY Clause  */

/*  ORDER BY price, with NULLs last  */

SELECT 
  name
, price
FROM 
  items
ORDER BY
  CASE WHEN price IS NULL
    THEN 2
    ELSE 1
  END
, price
;
/* Results should look like this --
   name             price
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
   thingamabob
   thingamajig
   thingum
   whatsis
*/
