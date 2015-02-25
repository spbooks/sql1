/*  Chapter 7: The SELECT Clause  */

/*  Create and populate the Discussion Forums tables  */

CREATE TABLE forums
( 
  id         INTEGER      NOT NULL  PRIMARY KEY
, name       VARCHAR(37)  NOT NULL
, CONSTRAINT forum_name_uk UNIQUE ( name ) /* This is discussed in Chapter 10 */
);
INSERT INTO forums VALUES ( 10001 , 'Search Engines' );
INSERT INTO forums VALUES ( 10002 , 'Databases' );
INSERT INTO forums VALUES ( 10003 , 'Applications' );

CREATE TABLE members
( 
  id         INTEGER      NOT NULL  PRIMARY KEY
, name       VARCHAR(37)  NOT NULL
, CONSTRAINT name_uk UNIQUE ( name ) /* This is discussed in Chapter 10 */
);
INSERT INTO members VALUES (   9 , 'noo13' );
INSERT INTO members VALUES (  37 , 'r937' );
INSERT INTO members VALUES (  42 , 'DeepThought' );
INSERT INTO members VALUES (  99 , 'BarbFeldon' );
INSERT INTO members VALUES ( 187 , 'RJNeedham' );

CREATE TABLE threads
( 
  id         INTEGER      NOT NULL  PRIMARY KEY
, name       VARCHAR(99)  NOT NULL
, forum_id   INTEGER      NOT NULL
, starter    INTEGER      NOT NULL
, CONSTRAINT thread_name_uk UNIQUE ( id, name ) /* This is discussed in Chapter 10 */
);
INSERT INTO threads VALUES ( 15 , 'Difficulty with join query'            , 10002 , 187 );
INSERT INTO threads VALUES ( 25 , 'How do I get listed in Yahoo?'         , 10001 ,   9 );
INSERT INTO threads VALUES ( 35 , 'People who bought ... also bought ...' , 10002 ,  99 );
INSERT INTO threads VALUES ( 45 , 'WHERE clause doesn''t work'            , 10002 , 187 );

CREATE TABLE posts
( 
  id         INTEGER      NOT NULL  PRIMARY KEY
, name       VARCHAR(99)    NULL
, thread_id  INTEGER      NOT NULL
, reply_to   INTEGER        NULL
, posted_by  INTEGER      NOT NULL
/*  Note: use DATETIME if your database system does not support TIMESTAMP  */
/*  Remove the DEFAULT and CHECK constraint if not supported  */
, created    TIMESTAMP    NOT NULL  DEFAULT CURRENT_TIMESTAMP
, revised    TIMESTAMP      NULL    CHECK ( revised >= created ) 
, post       TEXT         NOT NULL
);
INSERT INTO posts 
VALUES 
  ( 201 , 'Difficulty with join query' , 15, NULL , 187 , '2008-11-12 11:12:13', NULL
, 'I''m having a lot of trouble joining my tables. What''s a foreign key?' );

INSERT INTO posts 
VALUES 
  ( 215 , 'How do I get listed in Yahoo?', 25, NULL , 9 , '2008-11-15 11:20:02', NULL
, 'I''ve figured out how to submit my URL to Google, but I can''t seem to find where to post it on Yahoo! Can anyone help?' );

INSERT INTO posts 
VALUES 
  ( 216 , NULL , 25, 215 , 42 , '2008-11-15 11:37:10', NULL
, 'Try http://search.yahoo.com/info/submit.html ' );

INSERT INTO posts 
VALUES 
  ( 218 , 'That''s it!' , 25, 216 , 9 , '2008-11-15 11:42:24', NULL
, 'That''s it! How did you find it?' );

INSERT INTO posts 
VALUES 
  ( 219 , NULL , 25, 218 , 42 , '2008-11-15 11:51:45', '2008-11-15 11:57:57'
, 'There''s a link at the bottom of the homepage called "Suggest a site"' );

INSERT INTO posts 
VALUES 
  ( 222 , 'People who bought ... also bought ...' , 35, NULL , 99 , '2008-11-22 22:22:22', NULL
, 'For each item in the user''s cart, I want to show other items that people bought who bought that item, but the SQL is too hairy for me. HELP!' );

INSERT INTO posts 
VALUES 
  ( 230 , 'WHERE clause doesn''t work' , 45, NULL , 187 , '2008-12-04 09:37:00', NULL
, 'My query has WHERE startdate > 2009-01-01 but I get 0 results, even though I know there are rows for next year!' );

SELECT 
  id         
, name       
, thread_id  
, reply_to   
, posted_by  
, post       
FROM 
  posts
;
/*  Results should look like this --
    id   name                                 thread_id reply_to posted_by    post                                                         
    201  Difficulty with join query              15                 187       I'm having a lot of trouble joining ...            
    215  How do I get listed in Yahoo?           25                 9         I've figured out how to submit my URL ...        
    216                                          25        215      42        Try http://search.yahoo.com/info/submit.html     
    218  That's it!                              25        216      9         That's it! How did you find it?                  
    219                                          25        218      42        There's a link at the bottom of the ...            
    222  People who bought ... also bought ...   35                 99        For each item in the user's cart, ...              
    230  WHERE clause doesn't work               45                 187       My query has WHERE startdate > ...                 
*/