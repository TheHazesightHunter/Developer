/*
 Question: What are the most in-demand skills for data analysts?
 -Join job postings to inner join table similar to query 2
 -Identify the top 5 in-demand skills for a data analyst.
 -Focus on all job postings.
 -WHY? To retrieve the top 5 skills with the highest demand in the job market. 
 providing insights into the most valuable skills for job seekers.
 */
SELECT skills,
  COUNT(b.job_id) AS demand_count
FROM job_postings_fact a
  INNER JOIN skills_job_dim b ON a.job_id = b.job_id
  INNER JOIN skills_dim c ON b.skill_id = c.skill_id
WHERE job_title_short = 'Data Analyst'
  AND job_work_from_home = TRUE
GROUP BY skills
ORDER BY demand_count DESC
LIMIT 5;