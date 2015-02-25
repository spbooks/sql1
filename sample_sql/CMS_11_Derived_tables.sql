/*  Chapter 3: The FROM Clause  */

/*  Derived tables  */

SELECT 
  title
, category_name
FROM (
  SELECT
    entries.title                              
  , entries.created                            
  , categories.name AS category_name           
  FROM
    entries                                    
      INNER JOIN categories                                 
        ON categories.category = entries.category     
  ) AS entries_with_category
;
/* Results should look like --
   title                        category_name                         
   What If I Get Sick and Die?  Stories from the Id
   Uncle Karl and the Gasoline  Humorous Anecdotes
   Be Nice to Everybody         Gentle Words of Advice
   Hello Statue                 Humorous Anecdotes
   The Size of Our Galaxy       Our Spectacular Universe
*/