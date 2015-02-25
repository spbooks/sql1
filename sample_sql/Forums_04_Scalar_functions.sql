/*  Chapter 7: The SELECT Clause  */

/*  Scalar functions  */

SELECT 
  threads.id AS t_id
, threads.name AS thread
, posts.id AS p_id
, SUBSTRING(posts.post FROM 1 FOR 21) AS excerpt 
/*  One popular variation --
     , LEFT(posts.post,21) AS excerpt
*/
FROM
  threads
  LEFT OUTER JOIN posts
    ON posts.thread_id = threads.id
;
/*  Results should look like this --
    t_id thread                               p_id  excerpt               
    15   Difficulty with join query            201  I'm having a lot of t
    25   How do I get listed in Yahoo?         215  I've figured out how 
    25   How do I get listed in Yahoo?         216  Try http://search.yah
    25   How do I get listed in Yahoo?         218  That's it! How did yo
    25   How do I get listed in Yahoo?         219  There's a link at the
    35   People who bought ... also bought ... 222  For each item in the 
    45   WHERE clause doesn't work             230  My query has WHERE st
*/

/*  To demonstrate string concatenation and COALESCE,
    we'll quickly add and populate lastname/firstname 
    columns in the members table.
*/
ALTER TABLE members
  ADD lastname VARCHAR(21) NULL
;
ALTER TABLE members
  ADD firstname VARCHAR(21) NULL
;
UPDATE 
  members
SET 
  lastname = 'Trudeau'
, firstname = 'Pierre'
WHERE 
  id = 42
;
UPDATE 
  members
SET 
  firstname = 'Cher'
WHERE 
  id = 99
;
UPDATE 
  members
SET 
  lastname = 'Van Damme'
, firstname = 'Jean-Claude'
WHERE 
  id = 187
;

/*  The following query may need to be modified to use the 
    appropriate concatenation operator for your particular
    database system. The WHERE clause returns only those members
    for which we have supplied a firstname.
*/
SELECT 
  COALESCE(lastname||', ','')||firstname AS fullname
FROM 
  members
WHERE 
  firstname IS NOT NULL
;
/*  Results should look like this --
    fullname                                     
    Trudeau, Pierre
    Cher
    Van Damme, Jean-Claude
*/
