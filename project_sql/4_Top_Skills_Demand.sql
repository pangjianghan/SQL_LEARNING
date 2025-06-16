-- Tells me the avg salary for acquiring certain skills for certain jobs

SELECT 
    ROUND(avg(salary_year_avg),0) avg_salary_for_skills,
    COUNT (salary_year_avg)AS num_of_data,
    sk.skills
FROM
    job_postings_fact jpf
INNER JOIN skills_job_dim sj ON jpf.job_id = sj.job_id
INNER JOIN skills_dim sk ON sk.skill_id = sj.skill_id
WHERE 
salary_year_avg IS NOT NULL
AND job_title_short = 'Data Analyst'
--AND num_of_data >5 is wrong for agg function --> use having instead
GROUP BY
    sk.skills
HAVING
    COUNT (salary_year_avg) >3
ORDER BY
    avg_salary_for_skills DESC