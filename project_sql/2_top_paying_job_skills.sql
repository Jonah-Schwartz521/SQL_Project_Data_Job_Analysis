-- question: what skills are needed 
-- for the top-paying data and business analyst jobs?
-- use specific skills required for these roles 
-- use top 10 highest paying jobs from previous query

WITH top_paying_jobs AS (
    SELECT
        job_id,
        job_title,
        salary_year_avg,
        name AS company_name
    FROM 
        job_postings_fact
    LEFT JOIN company_dim ON job_postings_fact.company_id = company_dim.company_id
    WHERE 
       (job_title_short = 'Data Analyst' OR job_title_short = 'Business Analyst') AND
        job_location = 'Chicago, IL' AND
        salary_year_avg IS NOT NULL
    ORDER BY
        salary_year_avg DESC 
    LIMIT 10
    )

SELECT 
    top_paying_jobs.*, 
    skills
FROM top_paying_jobs
INNER JOIN skills_job_dim ON top_paying_jobs.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id 
ORDER BY
    salary_year_avg DESC

/*
    Here’s the breakdown of the most in-demand skills for top-paying Data Analyst and Business Analyst roles, based on job postings:
	•	SQL is leading with a bold count of 10.
	•	Tableau is also highly sought after, with a bold count of 9.
	•	Python is right behind, with a bold count of 8.
	•	Other valuable skills include R, Excel, and Power BI, showing consistent presence across high-paying jobs.
    
    [
  {
    "job_id": 1092247,
    "job_title": "Director, Internal Audit, Data Analytics",
    "salary_year_avg": "225000.0",
    "company_name": "Options Clearing Corporation",
    "skills": "sql"
  },
  {
    "job_id": 1092247,
    "job_title": "Director, Internal Audit, Data Analytics",
    "salary_year_avg": "225000.0",
    "company_name": "Options Clearing Corporation",
    "skills": "db2"
  },
  {
    "job_id": 1092247,
    "job_title": "Director, Internal Audit, Data Analytics",
    "salary_year_avg": "225000.0",
    "company_name": "Options Clearing Corporation",
    "skills": "azure"
  },
  {
    "job_id": 1092247,
    "job_title": "Director, Internal Audit, Data Analytics",
    "salary_year_avg": "225000.0",
    "company_name": "Options Clearing Corporation",
    "skills": "aws"
  },
  {
    "job_id": 1092247,
    "job_title": "Director, Internal Audit, Data Analytics",
    "salary_year_avg": "225000.0",
    "company_name": "Options Clearing Corporation",
    "skills": "oracle"
  },
  {
    "job_id": 1092247,
    "job_title": "Director, Internal Audit, Data Analytics",
    "salary_year_avg": "225000.0",
    "company_name": "Options Clearing Corporation",
    "skills": "tableau"
  },
  {
    "job_id": 1092247,
    "job_title": "Director, Internal Audit, Data Analytics",
    "salary_year_avg": "225000.0",
    "company_name": "Options Clearing Corporation",
    "skills": "alteryx"
  },
  {
    "job_id": 1783938,
    "job_title": "#10128 - Data Analytics Roadmap Manager",
    "salary_year_avg": "165000.0",
    "company_name": "Qualitest",
    "skills": "hadoop"
  },
  {
    "job_id": 1783938,
    "job_title": "#10128 - Data Analytics Roadmap Manager",
    "salary_year_avg": "165000.0",
    "company_name": "Qualitest",
    "skills": "tableau"
  },
  {
    "job_id": 1783938,
    "job_title": "#10128 - Data Analytics Roadmap Manager",
    "salary_year_avg": "165000.0",
    "company_name": "Qualitest",
    "skills": "splunk"
  },
  {
    "job_id": 186318,
    "job_title": "Data Governance Analyst",
    "salary_year_avg": "150000.0",
    "company_name": "WGN-TV",
    "skills": "sql"
  },
  {
    "job_id": 1129690,
    "job_title": "Medicaid Data Analytics Consulting Lead/Associate Director",
    "salary_year_avg": "150000.0",
    "company_name": "Guidehouse",
    "skills": "sql"
  },
  {
    "job_id": 1129690,
    "job_title": "Medicaid Data Analytics Consulting Lead/Associate Director",
    "salary_year_avg": "150000.0",
    "company_name": "Guidehouse",
    "skills": "python"
  },
  {
    "job_id": 1129690,
    "job_title": "Medicaid Data Analytics Consulting Lead/Associate Director",
    "salary_year_avg": "150000.0",
    "company_name": "Guidehouse",
    "skills": "r"
  },
  {
    "job_id": 1129690,
    "job_title": "Medicaid Data Analytics Consulting Lead/Associate Director",
    "salary_year_avg": "150000.0",
    "company_name": "Guidehouse",
    "skills": "databricks"
  },
  {
    "job_id": 1129690,
    "job_title": "Medicaid Data Analytics Consulting Lead/Associate Director",
    "salary_year_avg": "150000.0",
    "company_name": "Guidehouse",
    "skills": "aws"
  },
  {
    "job_id": 1129690,
    "job_title": "Medicaid Data Analytics Consulting Lead/Associate Director",
    "salary_year_avg": "150000.0",
    "company_name": "Guidehouse",
    "skills": "redshift"
  },
  {
    "job_id": 1129690,
    "job_title": "Medicaid Data Analytics Consulting Lead/Associate Director",
    "salary_year_avg": "150000.0",
    "company_name": "Guidehouse",
    "skills": "spark"
  },
  {
    "job_id": 1129690,
    "job_title": "Medicaid Data Analytics Consulting Lead/Associate Director",
    "salary_year_avg": "150000.0",
    "company_name": "Guidehouse",
    "skills": "pyspark"
  },
  {
    "job_id": 1129690,
    "job_title": "Medicaid Data Analytics Consulting Lead/Associate Director",
    "salary_year_avg": "150000.0",
    "company_name": "Guidehouse",
    "skills": "atlassian"
  },
  {
    "job_id": 374138,
    "job_title": "Staff, Data Analyst - Data as a Service",
    "salary_year_avg": "150000.0",
    "company_name": "Provi",
    "skills": "sql"
  },
  {
    "job_id": 374138,
    "job_title": "Staff, Data Analyst - Data as a Service",
    "salary_year_avg": "150000.0",
    "company_name": "Provi",
    "skills": "python"
  },
  {
    "job_id": 374138,
    "job_title": "Staff, Data Analyst - Data as a Service",
    "salary_year_avg": "150000.0",
    "company_name": "Provi",
    "skills": "scala"
  },
  {
    "job_id": 374138,
    "job_title": "Staff, Data Analyst - Data as a Service",
    "salary_year_avg": "150000.0",
    "company_name": "Provi",
    "skills": "r"
  },
  {
    "job_id": 374138,
    "job_title": "Staff, Data Analyst - Data as a Service",
    "salary_year_avg": "150000.0",
    "company_name": "Provi",
    "skills": "snowflake"
  },
  {
    "job_id": 374138,
    "job_title": "Staff, Data Analyst - Data as a Service",
    "salary_year_avg": "150000.0",
    "company_name": "Provi",
    "skills": "tableau"
  },
  {
    "job_id": 185951,
    "job_title": "Data Analyst",
    "salary_year_avg": "142500.0",
    "company_name": "Atlantic Partners Corporation",
    "skills": "sql"
  },
  {
    "job_id": 185951,
    "job_title": "Data Analyst",
    "salary_year_avg": "142500.0",
    "company_name": "Atlantic Partners Corporation",
    "skills": "t-sql"
  },
  {
    "job_id": 185951,
    "job_title": "Data Analyst",
    "salary_year_avg": "142500.0",
    "company_name": "Atlantic Partners Corporation",
    "skills": "sql server"
  },
  {
    "job_id": 185951,
    "job_title": "Data Analyst",
    "salary_year_avg": "142500.0",
    "company_name": "Atlantic Partners Corporation",
    "skills": "azure"
  },
  {
    "job_id": 185951,
    "job_title": "Data Analyst",
    "salary_year_avg": "142500.0",
    "company_name": "Atlantic Partners Corporation",
    "skills": "excel"
  },
  {
    "job_id": 185951,
    "job_title": "Data Analyst",
    "salary_year_avg": "142500.0",
    "company_name": "Atlantic Partners Corporation",
    "skills": "power bi"
  },
  {
    "job_id": 185951,
    "job_title": "Data Analyst",
    "salary_year_avg": "142500.0",
    "company_name": "Atlantic Partners Corporation",
    "skills": "dax"
  },
  {
    "job_id": 852995,
    "job_title": "Data Analyst (Business Intelligence), Support (Chicago, IL)",
    "salary_year_avg": "140500.0",
    "company_name": "Cisco Meraki",
    "skills": "sql"
  },
  {
    "job_id": 852995,
    "job_title": "Data Analyst (Business Intelligence), Support (Chicago, IL)",
    "salary_year_avg": "140500.0",
    "company_name": "Cisco Meraki",
    "skills": "python"
  },
  {
    "job_id": 852995,
    "job_title": "Data Analyst (Business Intelligence), Support (Chicago, IL)",
    "salary_year_avg": "140500.0",
    "company_name": "Cisco Meraki",
    "skills": "r"
  },
  {
    "job_id": 852995,
    "job_title": "Data Analyst (Business Intelligence), Support (Chicago, IL)",
    "salary_year_avg": "140500.0",
    "company_name": "Cisco Meraki",
    "skills": "snowflake"
  },
  {
    "job_id": 852995,
    "job_title": "Data Analyst (Business Intelligence), Support (Chicago, IL)",
    "salary_year_avg": "140500.0",
    "company_name": "Cisco Meraki",
    "skills": "react"
  },
  {
    "job_id": 852995,
    "job_title": "Data Analyst (Business Intelligence), Support (Chicago, IL)",
    "salary_year_avg": "140500.0",
    "company_name": "Cisco Meraki",
    "skills": "tableau"
  },
  {
    "job_id": 852995,
    "job_title": "Data Analyst (Business Intelligence), Support (Chicago, IL)",
    "salary_year_avg": "140500.0",
    "company_name": "Cisco Meraki",
    "skills": "microstrategy"
  },
  {
    "job_id": 254899,
    "job_title": "Data Quality Analyst",
    "salary_year_avg": "140000.0",
    "company_name": "Interactive Brokers",
    "skills": "sql"
  },
  {
    "job_id": 254899,
    "job_title": "Data Quality Analyst",
    "salary_year_avg": "140000.0",
    "company_name": "Interactive Brokers",
    "skills": "python"
  },
  {
    "job_id": 254899,
    "job_title": "Data Quality Analyst",
    "salary_year_avg": "140000.0",
    "company_name": "Interactive Brokers",
    "skills": "aws"
  },
  {
    "job_id": 254899,
    "job_title": "Data Quality Analyst",
    "salary_year_avg": "140000.0",
    "company_name": "Interactive Brokers",
    "skills": "unify"
  },
  {
    "job_id": 87274,
    "job_title": "Technical Data Governance Analyst",
    "salary_year_avg": "132500.0",
    "company_name": "Request Technology - Craig Johnson",
    "skills": "sql"
  },
  {
    "job_id": 87274,
    "job_title": "Technical Data Governance Analyst",
    "salary_year_avg": "132500.0",
    "company_name": "Request Technology - Craig Johnson",
    "skills": "sql server"
  },
  {
    "job_id": 87274,
    "job_title": "Technical Data Governance Analyst",
    "salary_year_avg": "132500.0",
    "company_name": "Request Technology - Craig Johnson",
    "skills": "db2"
  },
  {
    "job_id": 87274,
    "job_title": "Technical Data Governance Analyst",
    "salary_year_avg": "132500.0",
    "company_name": "Request Technology - Craig Johnson",
    "skills": "redshift"
  },
  {
    "job_id": 87274,
    "job_title": "Technical Data Governance Analyst",
    "salary_year_avg": "132500.0",
    "company_name": "Request Technology - Craig Johnson",
    "skills": "oracle"
  },
  {
    "job_id": 87274,
    "job_title": "Technical Data Governance Analyst",
    "salary_year_avg": "132500.0",
    "company_name": "Request Technology - Craig Johnson",
    "skills": "kafka"
  },
  {
    "job_id": 87274,
    "job_title": "Technical Data Governance Analyst",
    "salary_year_avg": "132500.0",
    "company_name": "Request Technology - Craig Johnson",
    "skills": "excel"
  },
  {
    "job_id": 87274,
    "job_title": "Technical Data Governance Analyst",
    "salary_year_avg": "132500.0",
    "company_name": "Request Technology - Craig Johnson",
    "skills": "word"
  },
  {
    "job_id": 1574884,
    "job_title": "Financial Risk Data Analyst",
    "salary_year_avg": "130000.0",
    "company_name": "New York Technology Partners",
    "skills": "sql"
  },
  {
    "job_id": 1574884,
    "job_title": "Financial Risk Data Analyst",
    "salary_year_avg": "130000.0",
    "company_name": "New York Technology Partners",
    "skills": "python"
  },
  {
    "job_id": 1574884,
    "job_title": "Financial Risk Data Analyst",
    "salary_year_avg": "130000.0",
    "company_name": "New York Technology Partners",
    "skills": "r"
  },
  {
    "job_id": 1574884,
    "job_title": "Financial Risk Data Analyst",
    "salary_year_avg": "130000.0",
    "company_name": "New York Technology Partners",
    "skills": "vba"
  },
  {
    "job_id": 1574884,
    "job_title": "Financial Risk Data Analyst",
    "salary_year_avg": "130000.0",
    "company_name": "New York Technology Partners",
    "skills": "excel"
  },
  {
    "job_id": 1574884,
    "job_title": "Financial Risk Data Analyst",
    "salary_year_avg": "130000.0",
    "company_name": "New York Technology Partners",
    "skills": "tableau"
  },
  {
    "job_id": 1574884,
    "job_title": "Financial Risk Data Analyst",
    "salary_year_avg": "130000.0",
    "company_name": "New York Technology Partners",
    "skills": "power bi"
  },
  {
    "job_id": 1574884,
    "job_title": "Financial Risk Data Analyst",
    "salary_year_avg": "130000.0",
    "company_name": "New York Technology Partners",
    "skills": "powerpoint"
  },
  {
    "job_id": 1574884,
    "job_title": "Financial Risk Data Analyst",
    "salary_year_avg": "130000.0",
    "company_name": "New York Technology Partners",
    "skills": "alteryx"
  }
]
*/