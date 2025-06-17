-- What are the most optimal skills to learn?

WITH skills_demand AS (
    SELECT 
        skills_dim.skill_id,
        skills_dim.skills,
        COUNT(skills_job_dim.job_id) AS demand_count
    FROM job_postings_fact 
    INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
    INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id  
    WHERE 
        job_title_short = 'Data Analyst' AND 
        salary_year_avg IS NOT NULL AND
        job_work_from_home = False
    GROUP BY
        skills_dim.skill_id
), average_salary AS (
    SELECT 
    skills_job_dim.skill_id,
    ROUND(AVG(salary_year_avg), 0) AS avg_salary
FROM job_postings_fact 
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id  
WHERE 
    job_title_short = 'Data Analyst' AND 
    salary_year_avg IS NOT NULL AND 
    job_work_from_home = False
GROUP BY
    skills_job_dim.skill_id
) 

SELECT 
    skills_demand.skill_id,
    skills_demand.skills,
    demand_count,
    avg_salary
FROM 
    skills_demand
INNER JOIN average_salary ON skills_demand.skill_id = average_salary.skill_id
WHERE 
    demand_count > 10
ORDER BY
        avg_salary DESC,
        demand_count DESC
LIMIT 25

-- rewriting the same query more concisely

SELECT 
    skills_dim.skill_id,
    skills_dim.skills,
    COUNT(skills_job_dim.job_id) AS demand_count,
    ROUND(AVG(job_postings_fact.salary_year_avg), 0) AS avg_salary
FROM job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id  
WHERE 
    (job_title_short = 'Data Analyst' OR job_title_short = 'Business Analyst') AND
    salary_year_avg IS NOT NULL AND 
    job_work_from_home = False
GROUP BY 
    skills_dim.skill_id
HAVING
    COUNT(skills_job_dim.job_id) > 10
ORDER BY 
    avg_salary DESC,
    demand_count DESC
LIMIT 25;

/*
Key Insights
	•	Spark and Snowflake offer the best balance of high demand and strong salaries — ideal skills to prioritize.
	•	Airflow, GCP, and Databricks highlight growing demand for cloud and data engineering tools in analyst roles.
	•	ML frameworks like PyTorch and TensorFlow command high pay but appear in fewer job listings, indicating they’re valuable but more niche.
	•	Skills like Kafka, Perl, and Phoenix are well-paid but lower in demand, making them less strategic unless targeting specific industries.
    [
  {
    "skill_id": 98,
    "skills": "kafka",
    "demand_count": "44",
    "avg_salary": "127332"
  },
  {
    "skill_id": 101,
    "skills": "pytorch",
    "demand_count": "22",
    "avg_salary": "125251"
  },
  {
    "skill_id": 31,
    "skills": "perl",
    "demand_count": "21",
    "avg_salary": "122520"
  },
  {
    "skill_id": 137,
    "skills": "phoenix",
    "demand_count": "33",
    "avg_salary": "121698"
  },
  {
    "skill_id": 99,
    "skills": "tensorflow",
    "demand_count": "26",
    "avg_salary": "121020"
  },
  {
    "skill_id": 62,
    "skills": "mongodb",
    "demand_count": "25",
    "avg_salary": "119670"
  },
  {
    "skill_id": 18,
    "skills": "mongodb",
    "demand_count": "25",
    "avg_salary": "119670"
  },
  {
    "skill_id": 96,
    "skills": "airflow",
    "demand_count": "72",
    "avg_salary": "117298"
  },
  {
    "skill_id": 63,
    "skills": "cassandra",
    "demand_count": "13",
    "avg_salary": "116881"
  },
  {
    "skill_id": 92,
    "skills": "spark",
    "demand_count": "185",
    "avg_salary": "113967"
  },
  {
    "skill_id": 97,
    "skills": "hadoop",
    "demand_count": "129",
    "avg_salary": "113775"
  },
  {
    "skill_id": 3,
    "skills": "scala",
    "demand_count": "59",
    "avg_salary": "113474"
  },
  {
    "skill_id": 193,
    "skills": "splunk",
    "demand_count": "16",
    "avg_salary": "112067"
  },
  {
    "skill_id": 112,
    "skills": "plotly",
    "demand_count": "21",
    "avg_salary": "111908"
  },
  {
    "skill_id": 169,
    "skills": "linux",
    "demand_count": "60",
    "avg_salary": "111750"
  },
  {
    "skill_id": 234,
    "skills": "confluence",
    "demand_count": "55",
    "avg_salary": "111522"
  },
  {
    "skill_id": 80,
    "skills": "snowflake",
    "demand_count": "237",
    "avg_salary": "111490"
  },
  {
    "skill_id": 81,
    "skills": "gcp",
    "demand_count": "83",
    "avg_salary": "110922"
  },
  {
    "skill_id": 210,
    "skills": "git",
    "demand_count": "73",
    "avg_salary": "110684"
  },
  {
    "skill_id": 25,
    "skills": "php",
    "demand_count": "29",
    "avg_salary": "110469"
  },
  {
    "skill_id": 2,
    "skills": "nosql",
    "demand_count": "104",
    "avg_salary": "110318"
  },
  {
    "skill_id": 168,
    "skills": "unix",
    "demand_count": "38",
    "avg_salary": "110261"
  },
  {
    "skill_id": 95,
    "skills": "pyspark",
    "demand_count": "48",
    "avg_salary": "109954"
  },
  {
    "skill_id": 75,
    "skills": "databricks",
    "demand_count": "95",
    "avg_salary": "109242"
  },
  {
    "skill_id": 6,
    "skills": "shell",
    "demand_count": "46",
    "avg_salary": "109117"
  }
]