/*
Objective
- What are the top paying data analyst jobs
- Identify the top 10 highest-paying Data Analyst roles that are available remotely
- Focuses on job posting with speicfied salaries (remove nulls)
- Why? Highlight the top-paying opportunities for DA, offering insight
*/

SELECT
    job_id,
    job_title,
    name AS company_name,
    job_location,
    job_schedule_type,
    salary_year_avg,
    job_posted_date
FROM
    job_postings_fact
LEFT JOIN company_dim
ON job_postings_fact.company_id =company_dim.company_id
WHERE
-- Can change to the job title that interested
    job_title_short = 'Data Analyst'
    AND
    job_location = 'Anywhere'
    AND
    salary_year_avg is NOT NULL
ORDER BY
    salary_year_avg DESC
LIMIT 10
