/*  Chapter 11: Special Structures  */

/*  Joining a table to itself  */

/*  Create the reflexive parent ("supercategory") relationship  */

ALTER TABLE categories
ADD COLUMN parent VARCHAR(9) NULL
;

/*  If necessary (it is for MySQL), index the FK column first */

ALTER TABLE categories
ADD INDEX parent_ix (parent)
;

/*  Add the foreign key  */

ALTER TABLE categories
ADD CONSTRAINT
  parent_fk
    FOREIGN KEY (parent)
      REFERENCES categories (category)
;

/*  Dump the categories table to show that the parent
    column still needs to be populated 
*/
SELECT 
  category
, name
, parent
FROM 
  categories
;
/* Results should look like this --
   category   name                       parent
   advice     Gentle Words of Advice
   angst      Stories from the Id
   blog       Log on to My Blog
   computers  Information Technology
   humor      Humorous Anecdotes
   science    Our Spectacular Universe
*/

/*  Categorize the categories  */

INSERT INTO categories
  ( category, name )
VALUES
  ( 'general' , 'Articles and Resources' )
, ( 'personal' , 'Personal Stories and Ideas' )
;
UPDATE
  categories
SET 
  parent = 'general'
WHERE 
  category in ( 'computers', 'science' )
;
UPDATE 
  categories
SET 
  parent = 'personal'
WHERE 
  category in ( 'advice', 'angst', 'blog', 'humor' )
;
SELECT 
  category
, name
, parent
FROM 
  categories
ORDER BY 
  parent
, category
;
/* Results should look like this --
   category   name                        parent
   general    Articles and Resources
   personal   Personal Stories and Ideas
   computers  Information Technology      general
   science    Our Spectacular Universe    general
   advice     Gentle Words of Advice      personal
   angst      Stories from the Id         personal
   blog       Log on to My Blog           personal
   humor      Humorous Anecdotes         personal
*/

/* Join the table to itself  */

SELECT 
  cat.name AS supercategory
, sub.name AS category
FROM 
  categories AS cat
    INNER JOIN categories AS sub
      ON sub.parent = cat.name
ORDER BY 
  cat.name
, sub.name
;
/* Results should look like this --
   supercategory               category
   Articles and Resources      Information Technology
   Articles and Resources      Our Spectacular Universe
   Personal Stories and Ideas  Gentle Words of Advice
   Personal Stories and Ideas  Humorous Anecdotes
   Personal Stories and Ideas  Log on to My Blog
   Personal Stories and Ideas  Stories from the Id
*/

/*  Extend the join to the entries table  */

SELECT 
  cat.name AS supercategory
, sub.name AS category
, entries.title
FROM 
  categories AS cat
    INNER JOIN categories AS sub
      ON sub.parent = cat.category
    LEFT OUTER JOIN entries
      ON entries.category = sub.category
ORDER BY 
  cat.name
, sub.name
, entries.title
;
/* Results should look like this --
   supercategory               category                  title
   Articles and Resources      Information Technology    Windows Media Center Rocks
   Articles and Resources      Our Spectacular Universe  The Size of Our Galaxy
   Personal Stories and Ideas  Gentle Words of Advice    Be Nice to Everybody
   Personal Stories and Ideas  Humorous Anecdotes        Hello Statue
   Personal Stories and Ideas  Humorous Anecdotes        Uncle Karl and the Gasoline
   Personal Stories and Ideas  Log on to My Blog
   Personal Stories and Ideas  Stories from the Id       What If I Get Sick and Die?
*/