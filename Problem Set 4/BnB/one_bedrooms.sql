CREATE VIEW "one_bedrooms" AS
SELECT "id", "property_name", "host_name", "accommodates"
FROM "listings"
WHERE "bedrooms" = '1';
