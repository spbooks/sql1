/*  Chapter 7: The SELECT Clause  */

/*  Aggregate functions  */

/*  First, show the selected forums data  */

SELECT 
  forums.id    AS f_id
, forums.name  AS forum
, threads.id   AS t_id
, threads.name AS thread
, posts.id     AS p_id
, posts.name   AS post
FROM 
  forums
    LEFT OUTER JOIN threads
      ON threads.forum_id = forums.id
    LEFT OUTER JOIN posts
      ON posts.thread_id = threads.id
;
/*  Results should look like this --
    f_id  forum          t_id  thread                               p_id  post
    10001 Search Engines  25   How do I get listed in Yahoo?         215  How do I get listed in Yahoo?
    10001 Search Engines  25   How do I get listed in Yahoo?         216
    10001 Search Engines  25   How do I get listed in Yahoo?         218  That's it!
    10001 Search Engines  25   How do I get listed in Yahoo?         219
    10002 Databases       15   Difficulty with join query            201  Difficulty with join query
    10002 Databases       35   People who bought ... also bought ... 222  People who bought ... also bought ...
    10002 Databases       45   WHERE clause doesn't work             230  WHERE clause doesn't work
    10003 Applications
*/

/*  Now, two queries using aggregate functions  */

SELECT 
  COUNT(forums.id)  AS forums 
, COUNT(threads.id) AS threads
, COUNT(posts.id)   AS posts  
FROM
  forums                      
    LEFT OUTER JOIN threads                     
      ON threads.forum_id = forums.id
    LEFT OUTER JOIN posts                       
      ON posts.thread_id = threads.id  
;
/*  Results should look like this --
    forums threads posts 
      8      7       7
*/

SELECT 
  COUNT(DISTINCT forums.id)  AS forums
, COUNT(DISTINCT threads.id) AS threads
, COUNT(DISTINCT posts.id)   AS posts
FROM 
  forums                      
    LEFT OUTER JOIN threads                     
      ON threads.forum_id = forums.id
    LEFT OUTER JOIN posts                       
      ON posts.thread_id = threads.id  
;
/*  Results should look like this --
    forums threads posts 
      3      4       7
*/
