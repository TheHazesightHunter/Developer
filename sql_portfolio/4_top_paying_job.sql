SELECT skills,
  ROUND(AVG(a.salary_year_avg), 0) AS avg_salary
FROM job_postings_fact a
  INNER JOIN skills_job_dim b ON a.job_id = b.job_id
  INNER JOIN skills_dim c ON b.skill_id = c.skill_id
WHERE job_title_short = 'Data Analyst'
  AND salary_year_avg IS NOT NULL
  AND job_work_from_home = TRUE
GROUP BY skills
ORDER BY avg_salary DESC
LIMIT 25;
/*
 
 Big Data and Machine Learning Expertise: 
 Skills in big data frameworks like PySpark and machine learning platforms like Watson and DataRobot are the highest-paying,
 reflecting the critical demand for processing large datasets and deriving insights using advanced AI technologies.
 
 Cloud and DevOps Proficiency: 
 High salaries for skills in Kubernetes, GCP, and Gitlab highlight the importance of cloud computing, container orchestration, 
 and continuous integration/continuous deployment (CI/CD) in modern data analytics roles.
 
 Advanced Database and Programming Knowledge: 
 Proficiency in Couchbase, Elasticsearch, Swift, and Golang is highly valued, emphasizing the need 
 for expertise in both NoSQL and traditional databases, as well as versatile programming skills.
 */