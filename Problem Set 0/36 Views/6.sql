-- write a SQL query to find the average entropy of prints by Hiroshige, rounded to two decimal places. Call the resulting column “Hiroshige Average Entropy”.

SELECT ROUND (AVG ( "entropy" ), 2) FROM "views"
AS "Hiroshige Average Entropy"
WHERE "artist" = "Hiroshige";
