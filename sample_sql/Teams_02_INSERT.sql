/*  Chapter 1: Introduction to SQL  */

/*  INSERT  */

CREATE TABLE teams
( 
  id           INTEGER      NOT NULL  PRIMARY KEY
, name         VARCHAR(37)  NOT NULL
, conference   CHAR(2)      NOT NULL
/*  The CHECK constraint is discussed in Chapter 9: Data Types.
    It is commented out here so as not to confuse you early.
        CHECK ( conference IN ( 'AA','A','B','C','D','E','F','G' ) )
*/
);

INSERT INTO teams
  ( id , name , conference )
VALUES
  ( 9 , 'Riff Raff' , 'F' )
;

INSERT INTO teams
  ( conference , id, name )
VALUES
  ( 'F' , 9 , 'Riff Raff' )
;
/* This yields a "duplicate key" error. The key in this case is
   the id column, which is a primary key. The database system
   automatically rejects duplicate values in primary key columns.
*/