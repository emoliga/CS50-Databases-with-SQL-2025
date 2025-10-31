-- write a SQL query to find the average ocean surface temperature, rounded to two decimal places, along the equator. Call the resulting
-- column “Average Equator Ocean Surface Temperature”. The equator’s ocean surface temperatures can be found at all longitudes between the
-- latitudes -0.5° and 0.5°, inclusive.

SELECT ROUND ( AVG ( "0m" )) FROM "normals"
AS "Average Equator Ocean Surface Temperature"
WHERE "latitude" >= '-0.5' AND "latitude" <= '0.5';
