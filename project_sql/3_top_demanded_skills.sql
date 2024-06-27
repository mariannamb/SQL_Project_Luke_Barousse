/*
Question: What are the most in-demand skills for data analysts and data scientists?
- Identify the top 5 in-demand skills for a data analyst and data scientist
- Focus on all job postings
- Why? Retrieve the top 5 skills with the highest demand in the job market,
providing insights into the most valuable skills for job seekers.
*/


SELECT
    skills,
    COUNT(skills_job_dim.job_id) AS demand_count
FROM job_postings_fact
INNER JOIN skills_job_dim
    ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim
    ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE
    job_title_short = 'Data Analyst'
GROUP BY
    skills
ORDER BY
    demand_count DESC
LIMIT 5;


SELECT
    skills,
    COUNT(skills_job_dim.job_id) AS demand_count
FROM job_postings_fact
INNER JOIN skills_job_dim
    ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim
    ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE
    job_title_short = 'Data Scientist'
GROUP BY
    skills
ORDER BY
    demand_count DESC
LIMIT 5;

/* Data Analyst
[
  {
    "skills": "sql",
    "demand_count": "92628"
  },
  {
    "skills": "excel",
    "demand_count": "67031"
  },
  {
    "skills": "python",
    "demand_count": "57326"
  },
  {
    "skills": "tableau",
    "demand_count": "46554"
  },
  {
    "skills": "power bi",
    "demand_count": "39468"
  }
]
*/

/* Data Scientist
[
  {
    "skills": "python",
    "demand_count": "114016"
  },
  {
    "skills": "sql",
    "demand_count": "79174"
  },
  {
    "skills": "r",
    "demand_count": "59754"
  },
  {
    "skills": "sas",
    "demand_count": "29642"
  },
  {
    "skills": "tableau",
    "demand_count": "29513"
  }
]
*/