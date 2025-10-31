-- write SQL query to answer a question of your choice. This query should: Make use of AS to rename a column, Involve at least one condition, using WHERE,
-- Sort by at least one column using ORDER BY

-- this query list the ids of the player born in a country which name starts with S and are older than my mother.

SELECT "id", "birth_country", "debut" FROM "players"
WHERE "birth_country" LIKE 'S%' AND "birth_year" >= '1973'
ORDER BY "birth_country", "debut" DESC;
