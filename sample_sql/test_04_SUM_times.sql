/*  Chapter 9: Data Types  */

/*  Create and populate a table for TIMEs  */

CREATE TABLE raceresults
( 
  split  VARCHAR(7)  NOT NULL
/*  Note: not all database systems support the TIME datatype  */
, splittime  TIME    NOT NULL
);
INSERT INTO raceresults VALUES ( 'swim' , '0:20:35' );
INSERT INTO raceresults VALUES ( 'bike' , '1:49:59' );
INSERT INTO raceresults VALUES ( 'run'  , '1:28:32' );

SELECT 
  *
FROM 
  raceresults
;
/*  Results should look like this --
    split  splittime
    swim   00:20:35
    bike   01:49:59
    run    01:28:32
*/  

SELECT 
  SUM(splittime) AS total_time
FROM 
  raceresults
;
/*  In MySQL, results are unintelligible --
    total_time
    29826
*/  

SELECT 
  SUM( TIME_TO_SEC(splittime) ) AS total_seconds
FROM 
  raceresults
;
/*  TIME_TO_SEC is a MySQL function --
    total_seconds
    13146
*/

SELECT 
  SEC_TO_TIME(
      SUM( TIME_TO_SEC(splittime) )
  ) AS total_time
FROM 
  raceresults
;
/*  SEC_TO_TIME is also a MySQL function --
    total_time
    03:39:06
*/