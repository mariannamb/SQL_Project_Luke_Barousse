/*
What are the top skills based on salary?
- Look at the average salary associated with each skill for Data Analyst and Data Scientist positions
- Focus on roles with specified salaries, regardless of location
- Why? It reveals how different skills impact salary levels for Data Analysts or Data Scientists
and helps identify the most financially rewarding skills to acquire or improve
*/



SELECT
    skills,
    ROUND(AVG(salary_year_avg), 2) AS avg_salary
FROM job_postings_fact
INNER JOIN skills_job_dim
    ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim
    ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE
    job_title_short = 'Data Analyst' AND
    salary_year_avg IS NOT NULL
GROUP BY
    skills
ORDER BY
    avg_salary DESC
LIMIT 25


SELECT
    skills,
    ROUND(AVG(salary_year_avg), 2) AS avg_salary
FROM job_postings_fact
INNER JOIN skills_job_dim
    ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim
    ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE
    job_title_short = 'Data Scientist' AND
    salary_year_avg IS NOT NULL
GROUP BY
    skills
ORDER BY
    avg_salary DESC
LIMIT 25


/* Asked ChatGPT to provide some quick insights - Data Analyst
Based on the top 25 high-paying skills for data analysts, here are three quick insights into the trends:

Emergence of Specialized Tools and Frameworks:

Tools like SVN (Subversion), DataRobot, and VMware are among the top-paying skills, indicating a high demand for expertise in specific platforms and frameworks. This trend suggests that data analysts with specialized tool knowledge can command higher salaries.
Programming Languages and Libraries:

High-paying skills also include programming languages and libraries such as Solidity, Golang, Keras, PyTorch, and TensorFlow. This highlights the importance of having strong programming skills and familiarity with machine learning frameworks in the data analyst role.
Infrastructure and DevOps Skills:

Skills related to infrastructure and DevOps, such as Terraform, Puppet, Ansible, and Kafka, are also among the high-paying skills. This indicates a growing need for data analysts to have knowledge in managing and deploying data infrastructure, reflecting the integration of data analysis with cloud and automation technologies.
*/

/* Asked ChatGPT to provide some quick insights - Data Scientist
Project Management and Collaboration Tools:

Skills like Asana, Airtable, Slack, Notion, and Zoom are among the high-paying skills, indicating a significant emphasis on project management and collaboration tools. This trend suggests that data scientists who can effectively manage projects and collaborate with teams are highly valued.
Specialized Programming Languages and Libraries:

High-paying skills include specialized programming languages and libraries such as Elixir, Lua, Solidity, Ruby on Rails, Objective-C, and Haskell. This highlights the importance of diverse and specialized programming skills in the data scientist role, particularly in languages that support specific applications or industries.
Machine Learning and Data Infrastructure:

Skills related to machine learning frameworks and data infrastructure, such as Watson, Hugging Face, Airflow, Neo4j, DynamoDB, and BigQuery, are also among the high-paying skills. This indicates a high demand for data scientists who are proficient in advanced machine learning technologies and capable of managing complex data systems and pipelines.
*/