/*  Chapter 3: The FROM Clause  */

/*  parsing syntax error  */

SELECT name, id FROM teans WHERE conference = 'F'
;

/* Results should be a syntax error, similar to:

   "Table 'teans' doesn't exist."

   or:

   "Invalid object name 'teans'."

*/