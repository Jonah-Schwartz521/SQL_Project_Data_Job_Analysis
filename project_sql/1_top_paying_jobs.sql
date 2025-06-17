/*
Question: What are the top paying jobs that are either business analyst jobs?
- Identify the top 10 highest paying Business Analyst Jobs availible
- Focuses on job postings with specified salaries (remove nulls)
- Why? Highlight the top paying oppertunities for Business Analysts and Data Analysts
*/  

SELECT
    job_id,
    job_title,
    job_location,
    job_schedule_type,
    salary_year_avg,
    job_posted_date,
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
LIMIT 10;
 
 /*
 	•	Job Titles:
	•	All top roles are data-focused (e.g., Data Governance Analyst, BI Analyst, Data Quality Analyst).
	•	No classic “Business Analyst” titles appeared in the top 10.
	•	Top Companies Hiring:
	•	Provi
	•	Cisco Meraki
	•	WGN-TV
	•	Interactive Brokers
	•	Atlantic Partners Corp
    

    [
  {
    "job_id": 1092247,
    "job_title": "Director, Internal Audit, Data Analytics",
    "job_location": "Chicago, IL",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "225000.0",
    "job_posted_date": "2023-06-30 11:02:19",
    "company_name": "Options Clearing Corporation"
  },
  {
    "job_id": 1783938,
    "job_title": "#10128 - Data Analytics Roadmap Manager",
    "job_location": "Chicago, IL",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "165000.0",
    "job_posted_date": "2023-06-26 22:01:54",
    "company_name": "Qualitest"
  },
  {
    "job_id": 374138,
    "job_title": "Staff, Data Analyst - Data as a Service",
    "job_location": "Chicago, IL",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "150000.0",
    "job_posted_date": "2023-08-18 10:02:01",
    "company_name": "Provi"
  },
  {
    "job_id": 186318,
    "job_title": "Data Governance Analyst",
    "job_location": "Chicago, IL",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "150000.0",
    "job_posted_date": "2023-01-24 00:02:13",
    "company_name": "WGN-TV"
  },
  {
    "job_id": 1129690,
    "job_title": "Medicaid Data Analytics Consulting Lead/Associate Director",
    "job_location": "Chicago, IL",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "150000.0",
    "job_posted_date": "2023-07-11 10:04:30",
    "company_name": "Guidehouse"
  },
  {
    "job_id": 185951,
    "job_title": "Data Analyst",
    "job_location": "Chicago, IL",
    "job_schedule_type": "Contractor",
    "salary_year_avg": "142500.0",
    "job_posted_date": "2023-10-26 19:01:50",
    "company_name": "Atlantic Partners Corporation"
  },
  {
    "job_id": 852995,
    "job_title": "Data Analyst (Business Intelligence), Support (Chicago, IL)",
    "job_location": "Chicago, IL",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "140500.0",
    "job_posted_date": "2023-05-25 04:01:36",
    "company_name": "Cisco Meraki"
  },
  {
    "job_id": 254899,
    "job_title": "Data Quality Analyst",
    "job_location": "Chicago, IL",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "140000.0",
    "job_posted_date": "2023-06-08 19:01:25",
    "company_name": "Interactive Brokers"
  },
  {
    "job_id": 87274,
    "job_title": "Technical Data Governance Analyst",
    "job_location": "Chicago, IL",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "132500.0",
    "job_posted_date": "2023-08-15 19:01:40",
    "company_name": "Request Technology - Craig Johnson"
  },
  {
    "job_id": 1574884,
    "job_title": "Financial Risk Data Analyst",
    "job_location": "Chicago, IL",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "130000.0",
    "job_posted_date": "2023-01-03 20:30:06",
    "company_name": "New York Technology Partners"
  }
]
*/