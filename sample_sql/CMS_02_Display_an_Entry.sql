/*  Chapter 2: SELECT Overview  */

/*  Display an Entry  */

/* We must first provide the contents for the sample entry.
   This is done by updating the existing row. Notice the 
   WHERE clause at the end of the UPDATE statement. */

UPDATE 
  entries
SET
  content = 'When I was about nine or ten, my Uncle Karl, who
would''ve been in his late teens or early twenties, once performed
what to me seemed like a magic trick.

Using a rubber hose, which he snaked down into the gas tank of my 
father''s car, he siphoned some gasoline into his mouth, lit a match, 
held it up a few inches in front of his face, and then, with explosive 
force, sprayed the gasoline out towards the lit match.

Of course, a huge fireball erupted, much to the delight of the kids
watching. I don''t recall if he did it more than once.

The funny part of this story? We lived to tell it.

Karl was like that.'
WHERE
  id = 524
;

SELECT 
  title   
, created
, content
FROM
  entries
WHERE
  id = 524
;
/* Results should look like this --
   title                        created     content
   Uncle Karl and the Gasoline  2009-02-28  When I was about nine or ten, my Uncle Karl, who
                                            would've been in his late teens or early twenties, once performed
                                            what to me seemed like a magic trick.
                                            
                                            Using a rubber hose, which he snaked down into the gas tank of my 
                                            father's car, he siphoned some gasoline into his mouth, lit a match, 
                                            held it up a few inches in front of his face, and then, with explosive 
                                            force, sprayed the gasoline out towards the lit match.
                                            
                                            Of course, a huge fireball erupted, much to the delight of the kids
                                            watching. I don't recall if he did it more than once.
                                            
                                            The funny part of this story? We lived to tell it.
                                            
                                            Karl was like that.
*/
