/*  Chapter 1: Introduction to SQL  */

/*  DELETE  */

DELETE
FROM 
  teams
WHERE 
  id = 63
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
*/