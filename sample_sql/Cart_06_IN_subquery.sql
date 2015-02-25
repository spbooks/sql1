/*  Chapter 4: The WHERE Clause  */

/*  IN subquery  */

SELECT
  name
FROM
  items
WHERE
  id IN (
    SELECT
      cartitems.item_id
    FROM
      carts
        INNER JOIN cartitems
        ON cartitems.cart_id = carts.id
    WHERE
      carts.customer_id = 750
  )
;
/*  Results should look like this --
    name
    thingamabob
    thingum
    whatsis
*/

/*  Notice that the subquery can be run by itself,
    and that it returns item 5913 twice.  
*/

SELECT
  cartitems.item_id
FROM 
  carts
    INNER JOIN cartitems
      ON cartitems.cart_id = carts.id
WHERE
  carts.customer_id = 750
;
/*  Results should look like this --
    item_id
    5913
    5912
    5937
    5913
*/