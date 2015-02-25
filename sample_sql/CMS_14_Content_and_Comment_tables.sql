/*  Chapter 5: GROUP BY Clause  */

/*  Content and Comment tables  */

CREATE TABLE contents
( 
  entry_id   INTEGER   NOT NULL  PRIMARY KEY
, content    TEXT      NOT NULL
);
INSERT INTO contents
  ( entry_id , content )
SELECT
  id 
, content
FROM 
  entries
WHERE 
  NOT ( content IS NULL )
;
SELECT * 
  FROM contents
;
/*  Results should look like --
     id  content                                                      
    524  When I was about nine or ten ...
*/


ALTER TABLE entries
DROP COLUMN
  content
;
SELECT
  * 
FROM
  entries
;
/*  Results should show all sample rows,
    not including the content column
*/


CREATE TABLE comments
( 
  entry_id   INTEGER      NOT NULL
, username   VARCHAR(37)  NOT NULL
/*  Note: use DATETIME if your database system does not support TIMESTAMP  */
, created    TIMESTAMP    NOT NULL
, PRIMARY KEY ( entry_id, username, created )
, revised    TIMESTAMP      NULL
, comment    TEXT         NOT NULL
); 
INSERT INTO comments
VALUES 
  ( 524, 'Steve0', '2009-03-05', NULL ,'Sounds like fun. Must try that.')
;
INSERT INTO comments
VALUES 
  ( 524, 'r937'  , '2009-03-06', NULL ,'I tasted gasoline once. Not worth the discomfort.')
;
INSERT INTO comments 
VALUES 
  ( 524, 'J4s0n' , '2009-03-16','2009-03-17','You and your uncle are both idiots.')
;
SELECT 
  *
FROM 
  comments
;
/*  Results should look like --
    entry_id  username  created     updated     comment                                                      
    524       J4s0n     2009-03-16  2009-03-17  You and your uncle are both idiots.
    524       r937      2009-03-06              I tasted gasoline once. Not worth the discomfort.
    524       Steve0    2009-03-05              Sounds like fun. Must try that.
*/

SELECT 
  entries.id
, entries.title
, entries.created
, contents.content
FROM
  entries
    LEFT OUTER JOIN contents
      ON contents.entry_id = entries.id
;
/*  Results should look like this --
    id   title                        created     content             
    423  What If I Get Sick and Die?  2008-12-30                
    524  Uncle Karl and the Gasoline  2009-02-28  When I was about ... 
    537  Be Nice to Everybody         2009-03-02                
    573  Hello Statue                 2009-03-17                
    598  The Size of Our Galaxy       2009-04-03                
*/

SELECT 
  entries.id
, entries.title
, entries.created
, contents.content
, COUNT(comments.entry_id) AS comment_count
FROM 
  entries
    LEFT OUTER JOIN contents
      ON contents.entry_id = entries.id
    LEFT OUTER JOIN comments
      ON comments.entry_id = entries.id
GROUP BY 
  entries.id
, entries.title
, entries.created
, contents.content
;
/*  Results, if you get them, should look like this --
    id   title                        created     content              comment_count
    423  What If I Get Sick and Die?  2008-12-30                       0
    524  Uncle Karl and the Gasoline  2009-02-28  When I was about ... 3
    537  Be Nice to Everybody         2009-03-02                       0
    573  Hello Statue                 2009-03-17                       0
    598  The Size of Our Galaxy       2009-04-03                       0
*/


SELECT 
  entries.id
, entries.title
, entries.created
, contents.content 
, c.comment_count
FROM 
  entries
    LEFT OUTER JOIN contents
      ON contents.entry_id = entries.id
    LEFT OUTER JOIN (
      SELECT
        entry_id
      , COUNT(*) AS comment_count
      FROM
        comments
      GROUP BY 
        entry_id
    ) AS c 
      ON c.entry_id = entries.id
;
/*  Results should look like this --
    id   title                        created     content              comment_count
    423  What If I Get Sick and Die?  2008-12-30                       
    524  Uncle Karl and the Gasoline  2009-02-28  When I was about ... 3
    537  Be Nice to Everybody         2009-03-02                       
    573  Hello Statue                 2009-03-17                       
    598  The Size of Our Galaxy       2009-04-03                       

    Notice that comment_count is NULL for some rows, instead of 0.

*/

SELECT 
  entries.id
, entries.title
, entries.created
, contents.content 
, ( SELECT
      COUNT(entry_id)
    FROM 
      comments
    WHERE 
      entry_id = entries.id 
  ) AS comment_count  
FROM 
  entries
    LEFT OUTER JOIN contents
      ON contents.entry_id = entries.id
;
/*  Results here are the same as the original GROUP BY query,
    with 0 instead of NULL.
*/ 