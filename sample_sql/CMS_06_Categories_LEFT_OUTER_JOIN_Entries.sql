/*  Chapter 3: The FROM Clause  */

/*  Categories LEFT OUTER JOIN Entries  */

SELECT 
  categories.name
, entries.title
, entries.created
FROM
  categories
    LEFT OUTER JOIN entries
      ON entries.category = categories.category
;
/* Results should look like this --
   name                      title                        created
   Gentle Words of Advice    Be Nice to Everybody         2009-03-02
   Stories from the Id       What If I Get Sick and Die?  2008-12-30
   Log On to My Blog         [NULL]                       [NULL]     
   Humorous Anecdotes        Uncle Karl and the Gasoline  2009-02-28
   Humorous Anecdotes        Hello Statue                 2009-03-17
   Our Spectacular Universe  The Size of Our Galaxy       2009-04-03
*/


/*  Entries RIGHT OUTER JOIN Categories  */

SELECT 
  categories.name
, entries.title
, entries.created
FROM 
  entries 
    RIGHT OUTER JOIN categories 
      ON categories.category = entries.category
;
/* Results should look identical to Categories LEFT OUTER JOIN Entries --
   name                      title                        created
   Gentle Words of Advice    Be Nice to Everybody         2009-03-02
   Stories from the Id       What If I Get Sick and Die?  2008-12-30
   Log On to My Blog         [NULL]                       [NULL]     
   Humorous Anecdotes        Uncle Karl and the Gasoline  2009-02-28
   Humorous Anecdotes        Hello Statue                 2009-03-17
   Our Spectacular Universe  The Size of Our Galaxy       2009-04-03
*/