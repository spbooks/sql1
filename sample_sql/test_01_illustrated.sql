/*  Chapter 3: The FROM Clause  */

/*  Create and populate a pair of test tables to 
    illustrate the various types of join  
*/

CREATE TABLE A 
( a   SMALLINT   NOT NULL PRIMARY KEY )
;
INSERT INTO A 
VALUES 
  (102),(104),(106),(107)
;
CREATE TABLE B 
( b   SMALLINT   NOT NULL PRIMARY KEY )
;
INSERT INTO B 
VALUES 
  (101),(102),(104),(106),(108)
;

/*  Results for the following queries are 
    as shown in the illustrations in the book.
*/
SELECT 
  a,b 
FROM 
  A INNER JOIN B
    ON a=b
;

SELECT 
  a,b 
FROM 
  A LEFT OUTER JOIN B
    ON a=b
;

SELECT 
  a,b 
FROM 
  A RIGHT OUTER JOIN B
    ON a=b
;

SELECT 
  a,b 
FROM 
  A FULL OUTER JOIN B
    ON a=b
;

SELECT 
  a,b 
FROM 
  A LEFT OUTER JOIN B 
    ON a=b

UNION

SELECT 
  a,b 
FROM 
  A RIGHT OUTER JOIN B 
    ON a=b
ORDER BY 
  COALESCE(a,b)
;

SELECT 
  a,b 
FROM 
  A CROSS JOIN B 
;