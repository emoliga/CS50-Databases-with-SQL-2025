-- write a SQL query to answer a question of your choice about the prints. The query should: Make use of AS to rename a column, Involve at least one
-- condition using WHERE, Sort by at least one column, using ORDER BY

SELECT "japanese_title" FROM "views" AS "Blue and Brightness"
WHERE "brightness" AND "average_color" LIKE '#b%'
ORDER BY "brightness" DESC;
