/*  Chapter 2: SELECT Overview  */

/*  Count Entries by Category  */

SELECT 
  category
, COUNT(*) AS articles
FROM
  entries
GROUP BY
  category
;
/* Results should look like this --
   category  articles
   advice       1
   angst        1
   humor        2
   science      1
*/

SELECT
  category
, COUNT(*) AS articles
FROM
  entries
GROUP BY
  category
HAVING
  COUNT(*) > 1
;
/* Results should look like this --
   category  articles
   humor        2
*/
