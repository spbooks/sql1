/*  Chapter 8: The ORDER BY Clause  */

/*  Detail and Total rows  */

SELECT
  * 
FROM (
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
        
  UNION ALL
       
  SELECT
    customers.name                  AS customer
  , NULL                            AS cart
  , CAST(COUNT(items.name) AS CHAR) AS item
  , NULL                            AS qty
  , NULL                            AS price
  , SUM(cartitems.qty  
        * items.price)              AS total
  FROM
    customers 
      INNER JOIN carts 
        ON carts.customer_id = customers.id
      INNER JOIN cartitems 
        ON cartitems.cart_id = carts.id 
      INNER JOIN items
        ON items.id = cartitems.item_id
  GROUP BY
    customers.name 
  ) AS dt
ORDER BY
  customer
, cart
, item
;
/* Results should look like this --   
   customer  cart  item            qty   price    total             
   A. Jones        2                              72.55
   A. Jones  2131  gimmick           3    9.37    28.11
   A. Jones  2131  thingum           2   22.22    44.44
   B. Smith        3                             287.51
   B. Smith  2921  dingus            3   29.37    88.11
   B. Smith  2921  whatsis           2   93.70   187.40
   B. Smith  3002  doohickey         1   12.00    12.00
   C. Brown        4                             342.94
   C. Brown  2937  thingum           1   22.22    22.22
   C. Brown  3001  thingamabob       3   22.22    66.66
   C. Brown  3001  whatsis           2   93.70   187.40
   C. Brown  3937  thingum           3   2.22     66.66
   D. White        1                              59.95
   D. White  3197  whatchamacallit   1   59.95    59.95
   E. Baker        2                              69.00
   E. Baker  2461  doohickey         2   12.00    24.00
   E. Baker  2461  whatnot           3   15.00    45.00
   G. Scott        1                             179.85
   G. Scott  3321  whatchamacallit   3   59.95   179.85
   H. Clark        2                             132.55
   H. Clark  3081  dingus            3   29.37    88.11
   H. Clark  3081  thingum           2   22.22    44.44
*/