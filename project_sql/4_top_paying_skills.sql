-- What are the top skills based on salary?


SELECT 
    skills,
    ROUND(AVG(salary_year_avg), 0) AS avg_salary
FROM job_postings_fact 
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id  
WHERE 
    (job_title_short = 'Data Analyst' OR job_title_short = 'Business Analyst') AND
    salary_year_avg IS NOT NULL AND 
    job_work_from_home = False
GROUP BY
    skills
ORDER BY 
    avg_salary DESC
lIMIT 25

/*
 Key Insights:
	•	Niche & backend-focused tools dominate (SVN, Golang, Twilio, MXNet).
	•	ML/AI frameworks like Keras, PyTorch, TensorFlow, and Hugging Face all show up with strong salaries.
	•	Cloud/devops tools like Kafka, Terraform, and Airflow are highly paid — likely tied to more engineering-heavy analyst roles.

    [
  {
    "skills": "svn",
    "avg_salary": "246586"
  },
  {
    "skills": "solidity",
    "avg_salary": "179000"
  },
  {
    "skills": "golang",
    "avg_salary": "165000"
  },
  {
    "skills": "twilio",
    "avg_salary": "150000"
  },
  {
    "skills": "mxnet",
    "avg_salary": "149000"
  },
  {
    "skills": "dplyr",
    "avg_salary": "147633"
  },
  {
    "skills": "vmware",
    "avg_salary": "147500"
  },
  {
    "skills": "sqlite",
    "avg_salary": "139000"
  },
  {
    "skills": "puppet",
    "avg_salary": "129820"
  },
  {
    "skills": "kafka",
    "avg_salary": "127332"
  },
  {
    "skills": "keras",
    "avg_salary": "127013"
  },
  {
    "skills": "pytorch",
    "avg_salary": "125251"
  },
  {
    "skills": "hugging face",
    "avg_salary": "123950"
  },
  {
    "skills": "perl",
    "avg_salary": "122520"
  },
  {
    "skills": "phoenix",
    "avg_salary": "121698"
  },
  {
    "skills": "tensorflow",
    "avg_salary": "121020"
  },
  {
    "skills": "mongodb",
    "avg_salary": "119670"
  },
  {
    "skills": "node.js",
    "avg_salary": "119141"
  },
  {
    "skills": "electron",
    "avg_salary": "117783"
  },
  {
    "skills": "terraform",
    "avg_salary": "117550"
  },
  {
    "skills": "airflow",
    "avg_salary": "117298"
  },
  {
    "skills": "cassandra",
    "avg_salary": "116881"
  },
  {
    "skills": "notion",
    "avg_salary": "116710"
  },
  {
    "skills": "webex",
    "avg_salary": "115000"
  },
  {
    "skills": "spark",
    "avg_salary": "113967"
  }
]
*/