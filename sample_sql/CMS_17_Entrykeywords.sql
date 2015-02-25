/*  Chapter 11: Special Structures  */

/*  Keywords  */

/*  Create the entrykeywords table  */

CREATE TABLE entrykeywords
( 
  entry_id   INTEGER     NOT NULL
, keyword    VARCHAR(99) NOT NULL
, PRIMARY KEY ( entry_id, keyword )
, CONSTRAINT entry_fk
    FOREIGN KEY (entry_id)
      REFERENCES entries (id) 
);

/*  To populate the entrykeywords table, let's first run
    a quick query to confirm the entry id values, which
    we'll need when assigning keywords. Note how the
    subsequent INSERT statement has been "constructed"
    by text-editing the results of this query.
*/
SELECT
  title
, id
FROM 
  entries
;
/* Results should look like this --
   title                        id
   What If I Get Sick and Die?  423
   Uncle Karl and the Gasoline  524
   Be Nice to Everybody         537
   Hello Statue                 573
   The Size of Our Galaxy       598
   Windows Media Center Rocks   605
*/

INSERT INTO entrykeywords
  ( entry_id, keyword )
VALUES
/* What If I Get Sick and Die? */
/* Uncle Karl and the Gasoline */   (524,'family'),(524,'reckless')
/* Be Nice to Everybody */        , (537,'my three rules'),(537,'family')
/* Hello Statue */ 
/* The Size of Our Galaxy */      , (598,'astronomy')
/* Windows Media Center Rocks */  , (605,'windows'),(605,'television')
;

/*  Confirm  */

SELECT 
  entry_id
, keyword
FROM 
  entrykeywords
;
/* Results should look like this --
   entry_id  keyword
     524     family
     524     reckless
     537     family
     537     my three rules
     598     astronomy
     605     television
     605     windows
*/

SELECT 
  entries.title
, GROUP_CONCAT(entrykeywords.keyword) AS keywords
FROM 
  entries
    LEFT OUTER JOIN entrykeywords
      ON entrykeywords.entry_id = entries.id
GROUP BY
  entries.title
;
/* Results should look like this --
   title                        keywords
   Be Nice to Everybody         family,my three rules
   Hello Statue  
   The Size of Our Galaxy       astronomy
   Uncle Karl and the Gasoline  family,reckless
   What If I Get Sick and Die?  
   Windows Media Center Rocks   television,windows
*/

/*  Finally, gather the keywords, in preparation for
    creating the keywords table.
*/
SELECT DISTINCT 
  keyword 
FROM 
  entrykeywords
;
/* Results should look like this --
   keyword
   family
   reckless
   my three rules
   astronomy
   television
   windows
*/