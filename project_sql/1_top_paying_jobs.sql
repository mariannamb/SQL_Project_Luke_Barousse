/*
Question: What are the top-paying data analyst or data scientist jobs?
- Identify the top 25 highest-paying data analyst or data scientist roles.
- Focus on job postings with specified salaries (remove nulls).
- Focus on job postings that are available remotely.
- Why? Highlight highest paying opportunities and compare salaries across jobs.
*/

SELECT
    job_title_short,
    job_title,
    job_location,
    job_schedule_type,
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
LIMIT 25;