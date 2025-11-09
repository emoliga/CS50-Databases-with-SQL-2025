
-- *** The Lost Letter ***

-- I think I will find the id of the letter searching for the packages that were sent from 900 Somerville Avenue

SELECT "id", "contents" FROM "packages"
WHERE "from_address_id" = (
    SELECT "id" FROM "addresses"
    WHERE "address" = '900 Somerville Avenue'
);

-- Now I have a list of packages sent by Anneke. I see one of the contents is the Congratulatory Letter with package id 384.
-- To see where was it sent, I need to query from the table addresses the id of the to_address_id from the table packages of the package sent from Anneke's
-- house with content the Congratulatory Letter.


SELECT "address", "type" FROM "addresses"
WHERE "id" = (
    SELECT "to_address_id" FROM "packages"
    WHERE "id" = '384'
);

-- The package has been sent to the wrong address as it is bad written.



-- *** The Devious Delivery ***

-- First I checked there is a package whose "from_address_id" is null.

SELECT * FROM "packages"
WHERE "from_address_id" IS NULL;

-- I see there is only one package without "from_address_id" so it must be the one with package id 5098.
-- I will check the scan of this package.

SELECT "driver_id", "package_id", "address_id", "action" FROM "scans"
WHERE "package_id" = '5098';

-- The same drives appears in 2 rows: the pick of the package and the drop.
-- I have seen before the package was supposed to be sent to address with id 50. However, in this list it says that the package was picked from that addres.
-- This means, the package the driver took was sent to address 348.

SELECT "address", "type" FROM "addresses"
WHERE "id" = '348';

-- The package might has been dropped at 7 Humboldt Place, a police station.



-- *** The Forgotten Gift ***

-- First, I will see how many packages has sent this man with a query that lists the packages sent from 109 Tileston Street

SELECT "id", "contents" FROM "packages"
WHERE "from_address_id" = (
    SELECT "id" FROM "addresses"
    WHERE "address" = '109 Tileston Street'
);

-- Now I see he has only sent one package with flowers with the id 9523. I will search the address that this package has been sent.

SELECT "address", "type" FROM "addresses"
WHERE "id" = (
    SELECT "to_address_id" FROM "packages"
    WHERE "id" = '9523'
);

-- It seem that the address is well written. I will take a look at the scan of the deliver.

SELECT * FROM "scans"
WHERE "package_id" = (
    SELECT "id" FROM "packages"
    WHERE "id" = '9523'
);

-- The package has been picked again from his granddaughter's house, driver 17 has it.

