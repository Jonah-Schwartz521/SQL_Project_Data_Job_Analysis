
SELECT 
   COUNT(job_id) AS number_of_jobs,
     CASE 
        WHEN job_location = 'Anywhere' THEN 'Remote'
        WHEN job_location = 'New York, NY' THEN 'Local'
        ELSE 'Onsite'
     END AS location_category
FROM 
    job_postings_fact
WHERE 
    job_title_short = 'Data Analyst'
GROUP BY 
    location_category;

SELECT
  job_id,
  job_title,
  salary_year_avg,
  CASE 
    WHEN salary_year_avg >= 100000 THEN 'High salary'
    WHEN salary_year_avg >= 60000 THEN 'Standard salary'
    WHEN salary_year_avg < 60000 THEN 'Low salary'
  END AS salary_category
FROM 
	job_postings_fact
WHERE
    salary_year_avg IS NOT NULL
    and job_title_short = 'Data Analyst'
ORDER BY
    salary_year_avg DESC;

SELECT
    COUNT(DISTINCT CASE WHEN job_work_from_home THEN company_id END) AS wfh_companies,
    COUNT(DISTINCT CASE WHEN NOT job_work_from_home THEN company_id END) AS onsite_companies
FROM 
    job_postings_fact;

SELECT 
  job_title,
  company_id,
  CASE
    WHEN job_title ILIKE '%senior%' THEN 'Senior'
    WHEN job_title ILIKE '%manager%' OR job_title ILIKE '%lead%' THEN 'Lead/Manager'
    WHEN job_title ILIKE '%junior%' OR job_title ILIKE '%entry%' THEN 'Junior/Entry'
    ELSE 'Not Specified'
  END AS experience_level,
  CASE
    WHEN job_work_from_home THEN 'Yes'
    ELSE 'No'
  END AS remote_options
FROM job_postings_fact

WHERE 
  salary_year_avg IS NOT NULL 
ORDER BY 
  job_id;
    
    
