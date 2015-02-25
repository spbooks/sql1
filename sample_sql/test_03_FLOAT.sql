/*  Chapter 9: Data Types  */

/*  Create and populate a table to test FLOAT  */

/*  We'll use FLOAT, without explicit precision/scale, 
    as the syntax varies from one database system to another.
*/

CREATE TABLE test_floats
( f   FLOAT   )
;
INSERT INTO test_floats (f) VALUES (   9.37  );
INSERT INTO test_floats (f) VALUES (   0.567 );
INSERT INTO test_floats (f) VALUES (  12.34  ); 
INSERT INTO test_floats (f) VALUES ( 888.88  ); 

SELECT 
  f
FROM 
  test_floats
;
/*  Results should look like this --
         f
     0.567
      9.37
     12.34
    888.88
*/  


INSERT INTO test_floats 
  ( f ) 
VALUES 
  ( 7900000000000000000000000 )
;
INSERT INTO test_floats 
  ( f ) 
VALUES 
  ( 7.9E24 )
;

SELECT 
  f
FROM 
  test_floats
;
/*  Results should look like this --
         f
     0.567
      9.37
     12.34
    888.88
    7.9E24
    7.9E24 

    Alternatively 7.9E+24 for the latter.
*/ 