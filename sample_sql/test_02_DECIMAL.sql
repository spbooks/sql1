/*  Chapter 9: Data Types  */

/*  Create and populate a table to test DECIMAL  */

/*  We'll use DECIMAL(3,2), to demonstrate what happens 
    when inserts are attempted using numbers that exceed
    the precision or scale.
*/

CREATE TABLE test_decimals
( d   DECIMAL(3,2)  NOT NULL PRIMARY KEY )
;
INSERT INTO test_decimals (d) VALUES (   9.37  );
INSERT INTO test_decimals (d) VALUES (   0.567 );

SELECT 
  d 
FROM 
  test_decimals
;
/*  Results should look like this --
        d
     0.57
     9.37
*/

/*  The following may or may not create an error  --

INSERT INTO test_decimals (d) VALUES (  12.34  );
INSERT INTO test_decimals (d) VALUES ( 888.88  );

    In SQL Server, the message is "Arithmetic overflow error 
    converting numeric to data type numeric."  Seriously.

*/

SELECT 
  d 
FROM 
  test_decimals
;
/*  In MySQL, results will look like this --
        d
     0.57
     9.37
    12.34
    99.99  

    Can you see where 99.99 came from? and why? 
    and why 12.34 was not treated the same way?
*/