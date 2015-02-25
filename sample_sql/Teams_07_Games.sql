/*  Chapter 11: Special Structures  */

/*  Joining to a table twice  */

/*  First, repopulate the teams table  */

DELETE FROM teams
;
INSERT INTO teams
  ( id , name , conference )
VALUES
  ( 9 , 'Riff Raff'   , 'F' )
, (11 , 'Savages'     , 'F' )
, (15 , 'Blue Devils' , 'F' )
, (24 , 'Hurricanes'  , 'F' )
;

/*  Create and populate some games  */

CREATE TABLE games
( 
  gamedate   DATETIME     NOT NULL 
, location   VARCHAR(37)  NOT NULL
, hometeam   INTEGER      NOT NULL
, awayteam   INTEGER      NOT NULL
);
INSERT INTO games 
  ( gamedate , location , hometeam , awayteam )
VALUES
  ( '2008-09-06' , 'McKenzie'  ,  9 , 24 )
, ( '2008-09-13' , 'Applewood' , 15 ,  9 )
;

/*  Query to list games with team names.  */

SELECT 
  games.gamedate
, games.location
, home.name AS hometeam
, away.name AS awayteam
FROM 
  games
    INNER JOIN teams AS home
      ON home.id = games.hometeam
    INNER JOIN teams AS away
      ON away.id = games.awayteam
;
/* Results should look like this --
   gamedate    location   hometeam     awayteam
   2008-09-06  McKenzie   Riff Raff    Hurricanes
   2008-09-13  Applewood  Blue Devils  Riff Raff
*/
