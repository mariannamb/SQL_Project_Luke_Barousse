/*
Question: What skills are required for the top-paying data analyst and data scientist jobs?
- Use the top 25 highest-paying jobs from first query
- Add the specific skills required for these roles
- Why? It provides a detailed look at which high-paying jobs demand certain skills,
helping job seekers understand which skills to develop that align with top salaries
*/

WITH top_paying_jobs AS (
    SELECT
        job_id,
        job_title_short,
        job_title,
        salary_year_avg,
        company_dim.name AS company_name
    FROM
        job_postings_fact
    LEFT JOIN company_dim
        ON job_postings_fact.company_id = company_dim.company_id
    WHERE
        (job_title_short = 'Data Analyst'
        OR job_title_short = 'Data Scientist')
        AND salary_year_avg IS NOT NULL
        AND job_work_from_home = TRUE
    ORDER BY
        salary_year_avg DESC
    LIMIT 25
)

SELECT
    top_paying_jobs.*,
    skills_dim.skills
FROM top_paying_jobs
INNER JOIN skills_job_dim
    ON top_paying_jobs.job_id = skills_job_dim.job_id
INNER JOIN skills_dim
    ON skills_job_dim.skill_id = skills_dim.skill_id
ORDER BY
    salary_year_avg DESC



-- Checking why the 1st highest-paying data analyst role did not appear in the skills results.
-- My theory was that this job did not list any skills required, and since I used an inner join, it did not appear

SELECT
    job_postings_fact.job_id,
    job_title_short,
    job_title,
    salary_year_avg,
    skills_dim.skills
FROM
    job_postings_fact
LEFT JOIN skills_job_dim
    ON job_postings_fact.job_id = skills_job_dim.job_id
LEFT JOIN skills_dim
    ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE
    job_postings_fact.job_id = 226942

-- This query proved my theory to be true since using a left join showed a null value for the skills column