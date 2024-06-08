-- Top 10 highest_paying Data Analyst roles that are availble remotely.
SELECT job_id,
  job_title,
  job_location,
  job_schedule_type,
  salary_year_avg,
  job_posted_date,
  b.name AS company_name
FROM job_postings_fact a
  LEFT JOIN company_dim b ON a.company_id = b.company_id
WHERE job_title_short = 'Data Analyst'
  AND job_location = 'Anywhere'
  AND salary_year_avg IS NOT NULL
ORDER BY salary_year_avg DESC
LIMIT 10;
C: \ Users \ hazel \ OneDrive \ Desktop \ Developer \ SQL_PROJECT_DATA_JOB_ANALYSIS \ csv_files \ sql_portfolio \ 3_top_demand_skill.sql