
-- Question: What are the most in-demand skills for data and business analysts?


SELECT 
    skills,
    COUNT(skills_job_dim.job_id) AS demand_count
FROM job_postings_fact 
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id  
WHERE 
    (job_title_short = 'Data Analyst' OR job_title_short = 'Business Analyst') AND
    job_location = 'Chicago, IL' 
GROUP BY
    skills
ORDER BY 
    demand_count DESC
lIMIT 5

/*

 Key Takeaways:
	•	SQL is essential for analyst roles.
	•	Excel and Tableau are still core business tools.
	•	Python adds value for technical analysis.
	•	SAS appears in some enterprise roles.
[
  {
    "skills": "sql",
    "demand_count": "1462"
  },
  {
    "skills": "excel",
    "demand_count": "1156"
  },
  {
    "skills": "python",
    "demand_count": "821"
  },
  {
    "skills": "tableau",
    "demand_count": "807"
  },
  {
    "skills": "sas",
    "demand_count": "622"
  }
]