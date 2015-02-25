/*  Chapter 3: The FROM Clause  */

/*  Categories RIGHT OUTER JOIN Entries  */

/* First, run the RIGHT OUTER JOIN on the tables as is */

SELECT
  categories.name
, entries.title
, entries.created
FROM
  categories
    RIGHT OUTER JOIN entries
      ON entries.category = categories.category
;
/* Results should look like this --
   name                      title                        created
   Stories from the Id       What If I Get Sick and Die?  2008-12-30
   Humorous Anecdotes        Uncle Karl and the Gasoline  2009-02-28
   Gentle Words of Advice    Be Nice to Everybody         2009-03-02
   Humorous Anecdotes        Hello Statue                 2009-03-17
   Our Spectacular Universe  The Size of Our Galaxy       2009-04-03

   Note: sequence will likely be different than the results of the
   INNER JOIN. This time, because the entries table is an outer table, 
   the database system will execute the join differently, returning the 
   same result rows, but not necessarily in the same sequence. Note that   
   none of the join queries up to this point has used an ORDER BY clause. 
   
   Another advantage of having a simple, small sample of data is that 
   visual checking, even when rows are presented in slightly different 
   sequences, remains feasible.

*/


INSERT INTO entries 
  (id , title , created , updated , category)
VALUES 
  (605 , 'Windows Media Center Rocks' , '2009-04-29' , NULL , 'computers')
;

SELECT
  title
, created
, category
FROM 
  entries
;
/* Results should look like this --
   title                        created      category 
   What If I Get Sick and Die?  2008-12-30   angst   
   Uncle Karl and the Gasoline  2009-02-28   humor   
   Be Nice to Everybody         2009-03-02   advice    
   Hello Statue                 2009-03-17   humor
   The Size of Our Galaxy       2009-04-03   science
   Windows Media Center Rocks   2009-04-29   computers
*/

SELECT
  categories.name
, entries.title
, entries.created
FROM 
  categories
    RIGHT OUTER JOIN entries
      ON entries.category = categories.category
;
/* Results should look like this --
   name                      title                        created
   Gentle Words of Advice    Be Nice to Everybody         2009-03-02
   Stories from the Id       What If I Get Sick and Die?  2008-12-30
   Humorous Anecdotes        Uncle Karl and the Gasoline  2009-02-28
   Humorous Anecdotes        Hello Statue                 2009-03-17
   Our Spectacular Universe  The Size of Our Galaxy       2009-04-03
                             Windows Media Center Rocks   2009-04-29  
*/

