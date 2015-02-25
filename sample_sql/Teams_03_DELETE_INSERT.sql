/*  Chapter 1: Introduction to SQL  */

/*  INSERT  */

DELETE FROM teams
;
INSERT INTO teams
  ( conference , id, name )
VALUES
  ( 'F' , 9 , 'Riff Raff' )
;

DELETE FROM teams
;
INSERT INTO teams
VALUES
  ( 9 , 'Riff Raff' , 'F' )
;

DELETE FROM teams
;
INSERT INTO teams
  ( conference , id, name )
VALUES
  ( 'F' , 9 , 'Riff Raff' )
, ( 'F' , 37 , 'Havoc' ) 
, ( 'C' , 63 , 'Brewers' )
;