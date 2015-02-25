/*  Chapter 4: The WHERE Clause  */

/*  LEFT OUTER JOIN with IS NULL */

SELECT
  customers.name
FROM 
  customers
    LEFT OUTER JOIN carts
      ON carts.customer_id = customers.id
WHERE 
  carts.customer_id IS NULL
;
/* Results should look like this --
   name    
   F. Black
*/
