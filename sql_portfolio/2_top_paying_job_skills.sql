/*
 Question: What skills are required for the top-paying data analyst jobs?
 - Use the top 10 highest-paying Data Analayst jobs from first query.
 - Add the specific skills required for these roles
 - Why? It provides a detailed look at which high-paying jobs demand certain skills,
 helping job seekers understand which skills to develop that align with top salaries.
 */
-- Using the Top 10 highest_paying Data Analyst roles that are availble remotely Query as CTE
WITH Top10PayingJobs AS (
  SELECT job_id,
    job_title,
    salary_year_avg,
    b.name AS company_name
  FROM job_postings_fact a
    LEFT JOIN company_dim b ON a.company_id = b.company_id
  WHERE job_title_short = 'Data Analyst'
    AND job_location = 'Anywhere'
    AND salary_year_avg IS NOT NULL
  ORDER BY salary_year_avg DESC
  LIMIT 10
)
SELECT a.*,
  skills
FROM Top10PayingJobs a
  INNER JOIN skills_job_dim b ON a.job_id = b.job_id
  INNER JOIN skills_dim c ON b.skill_id = c.skill_id
ORDER BY salary_year_avg DESC;