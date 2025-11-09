-- Another parent wants to send their child to a district with few other students. In 9.sql, write a SQL query to find the name (or names) of the school
-- district(s) with the single least number of pupils. Report only the name(s).

SELECT districts.name FROM expenditures
JOIN districts ON expenditures.district_id = districts.id
GROUP BY districts.name
ORDER BY SUM(expenditures.pupils) LIMIT 1;
