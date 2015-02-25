/*  Chapter 4: The WHERE Clause  */

/*  NOT EXISTS and NOT IN */

/*  The following three queries all produce the same results.  
*/

SELECT
  name
FROM
  customers
WHERE 
  NOT EXISTS (
    SELECT
      1
    FROM
      carts
    WHERE
      customer_id = customers.id
  )
;
SELECT
  name
FROM
  customers
WHERE
  NOT (
    id IN (
      SELECT
        customer_id
      FROM
        carts
    )
  )
;
SELECT
  name
FROM
  customers AS t
WHERE
  NOT (
    id IN (
      SELECT
        customer_id
      FROM 
        carts 
      WHERE 
        customer_id = t.id
    )
  )
;
/* Results should look like this --
   name    
   F. Black
*/
