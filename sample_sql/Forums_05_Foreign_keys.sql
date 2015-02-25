/*  Chapter 10: Relational Integrity  */

/*  Add foreign key constraints to the Discussion Forum tables  */


/*  If necessary (it is for MySQL), index the FK columns first */

ALTER TABLE threads
  ADD INDEX forum_ix (forum_id)
;
ALTER TABLE threads
  ADD INDEX starter_ix (starter)
;

/*  Add the foreign keys  */

ALTER TABLE threads
ADD CONSTRAINT 
  forum_fk
    FOREIGN KEY (forum_id)
      REFERENCES forums (id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
;
ALTER TABLE threads
ADD CONSTRAINT 
  starter_fk
    FOREIGN KEY (starter)
      REFERENCES members (id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
;
