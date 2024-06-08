/*
 What are the most optmal skill to learn (aka it's in high demand and a high-paying skill)?
 - Identify what skills in high demand and associated with high average salaries for data analyst roles
 - Concentrates on remote positions with specified salaries 
 - To know what skills that offer job security (high demand) and financial benefits (high salaries) to target
 - This offers strategic insights for career development in data analysis 
 */
With skills_demand AS (
  SELECT c.skill_id,
    c.skills,
    COUNT(b.job_id) AS demand_count
  FROM job_postings_fact a
    INNER JOIN skills_job_dim b ON a.job_id = b.job_id
    INNER JOIN skills_dim c ON b.skill_id = c.skill_id
  WHERE job_title_short = 'Data Analyst'
    AND salary_year_avg IS NOT NULL
    AND job_work_from_home = TRUE
  GROUP BY c.skill_id,
    c.skills
),
average_salary AS (
  SELECT b.skill_id,
    ROUND(AVG(a.salary_year_avg), 0) AS avg_salary
  FROM job_postings_fact a
    INNER JOIN skills_job_dim b ON a.job_id = b.job_id
    INNER JOIN skills_dim c ON b.skill_id = c.skill_id
  WHERE job_title_short = 'Data Analyst'
    AND salary_year_avg IS NOT NULL
    AND job_work_from_home = TRUE
  GROUP BY b.skill_id
)
SELECT skills_demand.skill_id,
  skills_demand.skills,
  demand_count,
  avg_salary
FROM skills_demand
  INNER JOIN average_salary ON skills_demand.skill_id = average_salary.skill_id
WHERE demand_count > 10
ORDER BY avg_salary DESC,
  demand_count DESC
LIMIT 25 

-- Rewriting the query more concisely