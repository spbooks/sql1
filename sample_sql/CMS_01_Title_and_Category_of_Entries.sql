/*  Chapter 2: SELECT Overview  */

/*  Title and Category of Entries  */

CREATE TABLE entries
(
  id         INTEGER      NOT NULL  PRIMARY KEY
, title      VARCHAR(99)  NOT NULL
/*  Note: use DATETIME if your database system does not support TIMESTAMP  */
, created    TIMESTAMP     NOT NULL
, updated    TIMESTAMP       NULL
, category   VARCHAR(37)    NULL
, content    TEXT           NULL
);

INSERT INTO entries 
  ( id , title , created , updated , category )
VALUES 
  (423 , 'What If I Get Sick and Die?' , '2008-12-30' , '2009-03-11' , 'angst')
;
INSERT INTO entries 
  ( id , title , created , updated , category )
VALUES
  (524 , 'Uncle Karl and the Gasoline' , '2009-02-28' , NULL , 'humor')
;
INSERT INTO entries 
  ( id , title , created , updated , category )
VALUES
  (537 , 'Be Nice to Everybody' , '2009-03-02' , NULL , 'advice')
;
INSERT INTO entries 
  ( id , title , created , updated , category )
VALUES
  (573 , 'Hello Statue' , '2009-03-17' , NULL , 'humor')
;
INSERT INTO entries 
  ( id , title , created , updated , category )
VALUES 
  (598 , 'The Size of Our Galaxy' , '2009-04-03' , NULL , 'science')
;

SELECT 
  title
, category
FROM
  entries
;
/* Results should look like this --
   title                        category
   What If I Get Sick and Die?  angst
   Uncle Karl and the Gasoline  humor
   Be Nice to Everybody         advice
   Hello Statue                 humor
   The Size of Our Galaxy       science
*/

