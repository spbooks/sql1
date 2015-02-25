/*  Chapter 6: The HAVING Clause  */

/*  A grouping query with a HAVING clause  */

SELECT 
  customers.name     AS customer
, SUM(cartitems.qty) AS sumqty
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
GROUP BY
  customers.name
HAVING
  SUM(cartitems.qty) > 5
;

/*  Alternate HAVING clause --

HAVING sumqty > 5

*/

/*  Results should look like this --
    customer  sumqty  totsales
    B. Smith    6      287.51
    C. Brown    9      342.94
*/

/*  Results without the HAVING clause --
    customer  sumqty  totsales
    A. Jones    5       72.55
    B. Smith    6      287.51
    C. Brown    9      342.94
    D. White    1       59.95
    E. Baker    5       69.00
    G. Scott    3      179.85
    H. Clark    5      132.55
*/


/*  A HAVING clause without a GROUP BY clause  */

SELECT 
  SUM(cartitems.qty  
      * items.price)    AS totsales
FROM
  carts 
  INNER JOIN cartitems 
    ON cartitems.cart_id = carts.id 
  INNER JOIN items
    ON items.id = cartitems.item_id
/*
WHERE
  carts.cartdate = CURRENT_DATE - INTERVAL 1 DAY 

    Note that the WHERE clause is commented out. 
    Its intent is to obtain "yesterday's sales" but
    there are barely enough sales in the Shopping Cart 
    sample data for all dates combined to exceed the total.  
*/
HAVING
  totsales > 1000
;

/*  Results should look like this --
    totsales
    1144.35
*/