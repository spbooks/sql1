/*  Chapter 5: The GROUP BY Clause  */

/*  A grouping query with a WHERE clause  */

SELECT 
  customers.name     AS customer
, SUM(cartitems.qty) AS qty
, SUM(cartitems.qty  
      * items.price) AS total
FROM
  customers 
    INNER JOIN carts 
      ON carts.customer_id = customers.id
    INNER JOIN cartitems 
      ON cartitems.cart_id = carts.id 
    INNER JOIN items
      ON items.id = cartitems.item_id
WHERE
  items.name = 'thingum'
GROUP BY 
  customers.name 
;
/*  Results should look like this --
    customer  qty  total
    A. Jones   2   44.44
    C. Brown   4   88.88
    H. Clark   2   44.44
*/