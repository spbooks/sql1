/*  Chapter 1: Introduction to SQL  */

/*  CREATE, ALTER, DROP  */

CREATE TABLE teams
( 
  id           INTEGER      NOT NULL  PRIMARY KEY
, name         VARCHAR(37)  NOT NULL
, conference   VARCHAR(2)   NULL
);

ALTER TABLE teams DROP COLUMN conference
;

DROP TABLE teams
;
