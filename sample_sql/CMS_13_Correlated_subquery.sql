/*  Chapter 4: The WHERE Clause  */

/*  Correlated subquery  */

SELECT 
  category
, title
, created
FROM
  entries AS t
WHERE
  created = (
    SELECT
      MAX(created)
    FROM 
      entries 
    WHERE 
      category = t.category
  )
;
/* Results should look like --
   category  title                        created
   angst     What If I Get Sick and Die?  2008-12-30
   advice    Be Nice to Everybody         2009-03-02
   humor     Hello Statue                 2009-03-17
   science   The Size of Our Galaxy       2009-04-03
   computers Windows Media Center Rocks   2009-04-29
*/

/*  Join to "max" derived table  */

SELECT 
  t.category                      
, t.title                         
, t.created                       
FROM 
  entries AS t                    
    INNER JOIN (
      SELECT
        category               
      , MAX(created) AS maxdate
      FROM
        entries                
      GROUP BY 
        category
    ) AS m      
      ON m.category = t.category AND m.maxdate = t.created           
;
/* Results should look like --
   category  title                        created
   advice    Be Nice to Everybody         2009-03-02
   angst     What If I Get Sick and Die?  2008-12-30
   computers Windows Media Center Rocks   2009-04-29
   humor     Hello Statue                 2009-03-17
   science   The Size of Our Galaxy       2009-04-03
*/
