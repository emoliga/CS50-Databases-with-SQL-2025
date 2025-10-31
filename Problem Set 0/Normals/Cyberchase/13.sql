-- write a SQL query to explore a question of your choice. This query should: Involve at least one condition, using WHERE with AND or OR

-- this query will list the season, title and topic of the episodes not from season 4 to 6 (included) and which topic is not null ordered
-- first descendent by season and then ascendent by title

SELECT "season", "title", "topic" FROM "episodes"
WHERE ("season" <= 3 OR "season" >= 7) AND "topic" NOT NULL
ORDER BY "season" DESC, "title";
