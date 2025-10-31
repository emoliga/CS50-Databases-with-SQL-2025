-- There are 180 whole degrees of latitude. Write a SQL query to determine how many points of latitude we have at least one data point for.

SELECT COUNT ( "latitude" ) FROM "normals"
WHERE 
