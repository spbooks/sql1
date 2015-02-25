/*  Chapter 1: Introduction to SQL  */

/*  UPDATE  */

UPDATE 
  teams
SET 
  conference = 'E' 
WHERE 
  id = 9
;

SELECT 
  id
, name
, conference
FROM 
  teams
;
/* Results should look like this:
   id  name       conference
    9  Riff Raff  E
   37  Havoc      F
   63  Brewers    C
*/