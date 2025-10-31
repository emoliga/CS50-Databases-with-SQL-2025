-- write a SQL query to find the normal temperature of the deepest sensor near the Gulf of Maine, at the same coordinate above.

SELECT "225m" FROM "normals"
WHERE "latitude" = '42.5' AND "longitude" = '-69.5';
