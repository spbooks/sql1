/*  Chapter 2: SELECT Overview  */

/*  Entries Sorted Latest First  */

SELECT 
  title   
, created
FROM
  entries
ORDER BY
  created DESC
;
/* Results should look like this --
   title                        created
   The Size of Our Galaxy       2009-04-03
   Hello Statue                 2009-03-17
   Be Nice to Everybody         2009-03-02
   Uncle Karl and the Gasoline  2009-02-28
   What If I Get Sick and Die?  2008-12-30
*/

SELECT
   title   
, category
, created
FROM
  entries
ORDER BY
  category
, created DESC
;
/* Results should look like this --
   title                        category  created
   Be Nice to Everybody         advice    2009-03-02
   What If I Get Sick and Die?  angst     2008-12-30
   Hello Statue                 humor     2009-03-17
   Uncle Karl and the Gasoline  humor     2009-02-28
   The Size of Our Galaxy       science   2009-04-03
*/
