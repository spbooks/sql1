/*  Chapter 10: Relational Integrity  */

/*  Foreign keys may be NULL  */

/*  Create and populate the vendors table  */

CREATE TABLE vendors
(
  id     INTEGER      NOT NULL PRIMARY KEY
, name   VARCHAR(21)  NOT NULL
);

INSERT INTO vendors VALUES ( 17, 'Acme Corp' );
INSERT INTO vendors VALUES ( 19, 'Ersatz Inc' );


/*  Add and populate the vendor FK in the items table  */

ALTER TABLE items
ADD COLUMN
  vendor_id INTEGER NULL
;
ALTER TABLE items
ADD INDEX
  vendor_ix (vendor_id)
;
ALTER TABLE items
ADD CONSTRAINT
  vendor_fk
    FOREIGN KEY (vendor_id)
      REFERENCES vendors (id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
;
UPDATE
  items
SET
  vendor_id = 17  /* Acme */
WHERE 
  name < 't'
;
UPDATE 
  items
SET
  vendor_id = 19  /* Ersatz */
WHERE
  name > 'w'
;

INSERT INTO items
  ( id, name, type, price, vendor_id )
VALUES
  ( 9901, 'gift wrapping', 'service', 5.00, NULL )
, ( 9902, 'discount coupon', 'service', -10.00, NULL )
;

SELECT
  id
, name
, type
, price
, vendor_id
FROM
  items
ORDER BY 
  id
;
/* Results should look like this --
  id    name             type      price  vendor_id
  5021  thingie          widgets    9.37
  5022  gadget           doodads   19.37   17
  5023  dingus           gizmos    29.37   17
  5041  gewgaw           widgets    5.00   17
  5042  knickknack       doodads   10.00   17
  5043  whatnot          gizmos    15.00   19
  5061  bric-a-brac      widgets    2.00   17
  5062  folderol         doodads    4.00   17
  5063  jigger           gizmos     6.00   17
  5901  doohickey        widgets   12.00   17
  5902  gimmick          doodads    9.37   17
  5903  dingbat          gizmos     9.37   17
  5911  thingamajig      widgets   22.22
  5912  thingamabob      doodads   22.22
  5913  thingum          gizmos    22.22
  5931  contraption      widgets   49.95   17
  5932  whatchamacallit  doodads   59.95   19
  5937  whatsis          gizmos    93.70   19
  9901  gift wrapping    service    5.00
  9902  discount coupon  service  -10.00
*/