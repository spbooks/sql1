 /*  Chapter 3: The FROM Clause  */

/*  Categories INNER JOIN Entries  */

CREATE TABLE categories
( 
  category   VARCHAR(9)   NOT NULL  PRIMARY KEY
, name       VARCHAR(37)  NOT NULL
);

INSERT INTO categories
VALUES
  ( 'blog'    , 'Log on to My Blog' )
, ( 'humor'  ,  'Humorous Anecdotes' )
, ( 'angst'   , 'Stories from the Id' )
, ( 'advice'  , 'Gentle Words of Advice' )
, ( 'science' , 'Our Spectacular Universe' )
;
  
SELECT 
  category
, name
FROM
  categories
;
/* Results should look like this --
   category  name                    
   advice    Gentle Words of Advice  
   angst     Stories from the Id     
   blog      Log On to My Blog       
   humor     Humorous Anecdotes     
   science   Our Spectacular Universe
*/


SELECT
  categories.name
, entries.title
, entries.created
FROM
  categories
    INNER JOIN entries
      ON entries.category = categories.category
;
/* Results should look like this --
   name                      title                        created
   Gentle Words of Advice    Be Nice to Everybody         2009-03-02
   Stories from the Id       What If I Get Sick and Die?  2008-12-30
   Humorous Anecdotes        Uncle Karl and the Gasoline  2009-02-28
   Humorous Anecdotes        Hello Statue                 2009-03-17
   Our Spectacular Universe  The Size of Our Galaxy       2009-04-03
*/