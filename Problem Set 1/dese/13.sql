-- In 13.sql, write a SQL query to answer a question you have about the data! The query should: Involve at least one JOIN or subquery

-- Which are the 5 schools with the lowest graduation rates in districts that spend more than $20,000 per student? This could reveal where the money isn't
-- paying off academically.


SELECT schools.name, districts.name AS district_name,
       graduation_rates.graduated, expenditures.per_pupil_expenditure
FROM schools
JOIN districts ON schools.district_id = districts.id
JOIN expenditures ON districts.id = expenditures.district_id
JOIN graduation_rates ON schools.id = graduation_rates.school_id
WHERE expenditures.per_pupil_expenditure > 20000
  AND graduation_rates.graduated IS NOT NULL
ORDER BY graduation_rates.graduated ASC LIMIT 5;
