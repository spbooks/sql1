/*  Chapter 4: The WHERE Clause  */

/*  Date Comparisons  */

SELECT 
  title
, created
FROM 
  entries 
WHERE 
  created <= '2009-04-03'
;
/*  Results should look like this --
    title                        created
    What If I Get Sick and Die?  2008-12-30
    Uncle Karl and the Gasoline  2009-02-28
    Be Nice to Everybody         2009-03-02
    Hello Statue                 2009-03-17
    The Size of Our Galaxy       2009-04-03
*/

/*  Entries posted in last 5 days  */

/*  There will never be results from either of the next two queries.  
    The first date in the BETWEEN expression is later than the second.  
    This is a semantic error, not a syntax error.
*/
SELECT 
  title
, created
FROM
  entries
WHERE
  created BETWEEN CURRENT_DATE AND CURRENT_DATE - INTERVAL 5 DAY
;
SELECT 
  title
, created
FROM 
  entries
WHERE 
  created BETWEEN '2009-03-20' 
      AND '2009-03-15'
;

/*  There will never be results from the next query either.  
    It's the same problem as the BETWEEN semantic error.
*/
SELECT 
  title
, created
FROM 
  entries
WHERE 
  '2009-03-20' <= created
       AND created <= '2009-03-15'
;

/*  The correct semantics:  */

SELECT 
  title
, created
FROM 
  entries
WHERE 
  created BETWEEN '2009-03-15' AND '2009-03-20'
;
/*  Results should look like this --
    title         created
    Hello Statue  2009-03-17
*/


SELECT 
  title
, created
FROM 
  entries
WHERE 
  created BETWEEN CURRENT_DATE - INTERVAL 5 DAY AND CURRENT_DATE 
;
/*  There will be results from the sample data only if
    you happen to run this query on the right date.
    The CMS sample data contains future dates (at the
    time of printing). When you run the query, perhaps
    one of those dates will be within the last five days.    
*/


/* Entries posted in February 2009  */

SELECT 
  title
, created
FROM
  entries
WHERE
  created BETWEEN '2009-02-01' AND '2009-03-01'
;
/*  Results should look like this --
    title                        created
    Uncle Karl and the Gasoline  2009-02-28
*/