-- write a SQL query to find the average per-pupil expenditure of each district. Name the column “Average District Per-Pupil Expenditure”.

SELECT AVG("per_pupil_expenditure") AS "Average District Per-Pupil Expenditure"
FROM "expenditures";
