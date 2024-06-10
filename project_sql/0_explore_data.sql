/*
- Getting an overview of the data
- Retrieving a list of all jobs listed
- Viewing the different job locations and job skills
- Why? Identify which jobs to analyze and gain insights from
*/


SELECT *
FROM job_postings_fact
LIMIT 10;

SELECT *
FROM skills_job_dim
LIMIT 10;

SELECT *
FROM skills_dim
LIMIT 10;

SELECT DISTINCT
    job_title_short
FROM
    job_postings_fact;

/* "job_title_short"
"Business Analyst"
"Cloud Engineer"
"Data Analyst"
"Data Engineer"
"Data Scientist"
"Machine Learning Engineer"
"Senior Data Analyst"
"Senior Data Engineer"
"Senior Data Scientist"
"Software Engineer"
*/

SELECT DISTINCT
    job_location
FROM
    job_postings_fact;

SELECT DISTINCT
    skills
FROM
    skills_dim;
