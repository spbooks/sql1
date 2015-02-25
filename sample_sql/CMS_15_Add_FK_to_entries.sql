/*  Chapter 11: Special Structures  */

/*  Joining a table to itself  */

/*  Confirm that there is a missing category  */ 

SELECT 
  entries.title
, entries.category
FROM
  entries
    LEFT OUTER JOIN categories
      ON categories.category = entries.category
WHERE
  categories.category IS NULL
;
/* Results should look like this --
   title                        category
   Windows Media Center Rocks   computers
*/

/*  Add the missing category  */

INSERT INTO categories
  ( category, name )
VALUES 
  ( 'computers' , 'Information Technology' )
;

/*  If necessary (it is for MySQL), index the FK column first */

ALTER TABLE entries
ADD INDEX category_ix (category)
;

/*  Add the foreign key  */

ALTER TABLE entries
ADD CONSTRAINT
  category_fk
    FOREIGN KEY (category)
      REFERENCES categories (category)
        ON DELETE CASCADE
        ON UPDATE CASCADE
; 
