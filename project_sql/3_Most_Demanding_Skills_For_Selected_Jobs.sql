-- Basically is return the total count of certain skills that matched to selected jobs in the job posting

WITH remote_job_skills AS
(
SELECT 
    skill_id,
    COUNT(skill_id) AS skill_count
FROM job_postings_fact jpf
INNER JOIN skills_job_dim sj
    ON jpf.job_id = sj.job_id
WHERE 
    job_title_short = 'Data Analyst'
    AND
    job_work_from_home = TRUE
GROUP BY
    skill_id
)

SELECT
    remote_job_skills.skill_count,
    skills_dim.skill_id,
    skills_dim.skills
FROM remote_job_skills
INNER JOIN skills_dim
ON skills_dim.skill_id = remote_job_skills.skill_id
ORDER BY
skill_count DESC;

-- Shorter code version
SELECT 
    COUNT(skills) AS skill_count,
    skills
FROM job_postings_fact jpf
INNER JOIN skills_job_dim sj ON jpf.job_id = sj.job_id
INNER JOIN skills_dim sk ON sk.skill_id = sj.skill_id
WHERE
    jpf.job_title_short = 'Data Analyst'
    AND
    job_work_from_home = TRUE
GROUP BY
    skills
ORDER BY
    skill_count DESC
LIMIT 5
