/*  Chapter 7: The SELECT Clause  */

/*  COUNT(*)  */

/*  First, the ubiquitous "SELECT COUNT(*) FROM table"  */

SELECT 
  COUNT(*) AS rows
FROM 
  members
;
/*  Results should look like this --
    rows
      5
*/

SELECT 
  forums.id    AS f_id
, forums.name  AS forum
, threads.id   AS t_id
, threads.name AS thread
FROM 
  forums
    LEFT OUTER JOIN threads
      ON threads.forum_id = forums.id
;
/*  Results should look like this --
    f_id  forum          t_id  thread
    10001 Search Engines  25   How do I get listed in Yahoo?
    10002 Databases       15   Difficulty with join query
    10002 Databases       35   People who bought ... also bought ...
    10002 Databases       45   WHERE clause doesn't work
    10003 Applications
*/

SELECT 
  forums.id    AS f_id
, forums.name  AS forum
, COUNT(*)     AS rows
FROM
  forums
    LEFT OUTER JOIN threads
      ON threads.forum_id = forums.id
GROUP BY 
  forums.id
, forums.name
;
/*  Results should look like this --
    f_id  forum           rows
    10001 Search Engines   1
    10002 Databases        3
    10003 Applications     1
*/

SELECT 
  forums.id    AS f_id
, forums.name  AS forum              
, COUNT(threads.id) AS threads             
FROM
  forums                             
    LEFT OUTER JOIN threads                            
      ON threads.forum_id = forums.id       
GROUP BY 
  forums.id  
, forums.name  
;
/*  Results should look like this --
    f_id  forum           threads
    10001 Search Engines   1
    10002 Databases        3
    10003 Applications     0
*/