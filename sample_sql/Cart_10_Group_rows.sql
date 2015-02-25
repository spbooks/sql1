/*  Chapter 5: The GROUP BY Clause  */

/*  Grouped rows  */     

/*  First, GROUP BY customer and cart  */

SELECT 
  customers.name     AS customer
, carts.id           AS cart
, COUNT(items.name)  AS items
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
, carts.id  
;
/*  Results should look like this --
    customer  cart  items  total
    A. Jones  2131    2    72.55
    B. Smith  2921    2   275.51
    B. Smith  3002    1    12.00
    C. Brown  2937    1    22.22
    C. Brown  3001    2   254.06
    C. Brown  3937    1    66.66
    D. White  3197    1    59.95
    E. Baker  2461    2    69.00
    G. Scott  3321    1   179.85
    H. Clark  3081    2   132.55
*/


/*  Next, GROUP BY customer only  */

SELECT 
  customers.name     AS customer
, COUNT(items.name)  AS items
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
;
/*  Results should look like this --
    customer  items  total
    A. Jones    2    72.55
    B. Smith    3   287.51
    C. Brown    4   342.94
    D. White    1    59.95
    E. Baker    2    69.00
    G. Scott    1   179.85
    H. Clark    2   132.55
*/
