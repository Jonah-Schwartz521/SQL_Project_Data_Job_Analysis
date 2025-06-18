# Introduction 
This project explores the data job market with a specific focus on Business and Data Analyst roles in Chicago. By analyzing job postings, I aimed to uncover which skills are most in demand, which roles offer the highest salaries, and how these two factors intersect. The goal was to provide actionable insight into where opportunities are strongest for aspiring analysts in one of the most active job markets in the U.S.

Check out the SQL queries here: [project_sql folder](/project_sql/)

# Background 
This project was completed as part of the SQL for Data Analytics course by Luke Barousse. While following the course structure, I customized the analysis to focus specifically on Business and Data Analyst roles in the Chicago job market.

Chicago is a major hub for analytics and consulting, making it an ideal focus for exploring high-paying, high-demand roles. Using real job posting data, I set out to understand what the most competitive analyst positions look like in this city — and what skills are needed to land them.

 ### The questions I wanted to answer through my SQL queries were:
1.	What are the top-paying Data and Business Analyst jobs in Chicago?
2.	What skills are required for these top-paying roles?
3.	Which skills are most in demand for analysts in this city?
4.	Which skills tend to be associated with higher salaries?
5.	Based on both demand and salary, what are the most strategic skills to learn?

# Tools I Used
To explore the Chicago analyst job market using real data, I relied on a small but powerful toolkit:

I relied on a small but powerful toolkit:

- **SQL**: Used to filter, join, and analyze job postings — the foundation of my entire project.  
- **PostgreSQL**: Served as the database for storing and querying job, company, and skill tables.  
- **Visual Studio Code**: My primary workspace for writing SQL queries, organizing files, and previewing outputs.  
- **Git & GitHub**: Used for version control and to document and share my progress throughout the project.

# The Analysis 
Each query in this project was designed to explore a different aspect of the Chicago analyst job market, with a focus on Data Analyst and Business Analyst roles. I used SQL to break down trends in salary, job titles, and skill demand. Here’s how I approached each question:

### 1. Top Paying Data and Business Analyst Jobs
To identify the highest-paying opportunities, I filtered Data Analyst and Business Analyst job postings by location and average yearly salary. I focused specifically on roles based in Chicago with clearly listed compensation. This query highlights the most lucrative analyst positions are concentrated within the city.

```sql
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
```
**Here's the breakdown of the top-paying analyst jobs in Chicago:**

- **Strong Salary Range:** The top analyst roles in Chicago offer salaries well above $100K, showing the high earning potential for data-focused roles in this market.

- **Variety of Employers:** Companies like **Provi**, **Cisco Meraki**, and **WGN-TV** show that high-paying analyst roles exist across a range of industries, not just in big tech.

- **Data-Focused Roles Dominate:** None of the top 10 roles were classic “Business Analyst” positions. Instead, all were **data-driven roles** such as *Data Governance Analyst*, *BI Analyst*, or *Data Quality Analyst*.

### 2. Skills Required for Top-Paying Analyst Jobs
This query looked at the top 10 highest-paying Data and Business Analyst roles in Chicago and identified the specific skills those roles listed. By joining the job postings with the skills dataset, I was able to reveal what tools and technologies are expected at the highest compensation levels.

```sql
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
```

**Here's the breakdown of the most in-demand skills for the top 10 highest-paying analyst roles:**

- **SQL is the most common skill**, appearing in 10 of the top 10 jobs.
- **Tableau is also highly sought after**, appearing in 9 listings.
- **Python follows closely**, appearing in 8 of the top roles.
- **Other valuable skills** like R, Excel, and Power BI also showed up multiple times, indicating their continued importance in well-paid analyst roles.

### 3. Most In-Demand Skills for Analysts in Chicago
This query counted how often each skill appeared in job postings for Data Analyst and Business Analyst roles located in Chicago. By ranking skills by frequency, it highlights what employers are consistently asking for in the local market.

```sql
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
```
**Here's the breakdown of the most in-demand skills for analyst roles in Chicago:**

- **SQL is essential for analyst roles:** It appeared far more than any other skill, confirming its dominance in the field.

- **Excel and Tableau are still core business tools:** Both were among the most frequently listed skills in Chicago analyst roles.

- **Python adds value for technical analysis:** Strong presence in job postings highlights its importance for automation and data manipulation.

- **SAS appears in some enterprise roles:** It’s still commonly requested, especially in organizations with legacy statistical systems.

### 4. Skills Associated with the Highest Salaries
This query calculates the average salary for each skill across all non-remote Data and Business Analyst roles in Chicago. Rather than focusing on just a few top job listings, it takes a broader view of the entire market to highlight which skills are most consistently associated with higher pay.

```sql
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
```
**Here's the breakdown of the highest-paying skills for non-remote analyst roles in Chicago:**

- **Niche and backend-focused tools dominate:** Skills like SVN, Golang, Twilio, and MXNet are associated with top average salaries despite being less common.

- **ML/AI frameworks show strong earning potential:** Tools like Keras, PyTorch, TensorFlow, and Hugging Face are tied to higher-paying roles, reflecting demand for machine learning expertise.

- **Cloud and DevOps tools are highly paid:** Kafka, Terraform, and Airflow appear frequently among top-paying roles, suggesting that engineering-adjacent skills are valuable in analyst positions.

### 5. Most Strategic Skills to Learn
This query combined salary and demand data to identify which skills are both **high-paying and frequently requested** for Data and Business Analyst roles in Chicago. By filtering for skills with strong demand (more than 10 job postings) and ordering by average salary, it helps reveal which tools offer the best return on learning investment.

```sql
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
```

**Here's the breakdown of the most strategic skills based on salary and demand:**

- **Spark and Snowflake offer the best balance of high demand and strong salaries:** These tools appeared in many job postings and were consistently tied to high pay — making them ideal skills to prioritize.

- **Airflow, GCP, and Databricks highlight demand for cloud and data engineering tools:** These skills are becoming more common in analyst roles that overlap with data engineering and infrastructure.

- **ML frameworks like PyTorch and TensorFlow command high pay but appear in fewer listings:** They’re valuable but more niche — great to know if you're aiming for advanced roles with an ML focus.

- **Skills like Kafka, Perl, and Phoenix are well-paid but lower in demand:** These might be useful in specialized industries but are less broadly applicable for most analyst roles.

# What I Learned 
By completing this project as part of a SQL course, I became much more familiar with querying relational databases and structuring multi-step analyses using CTEs, joins, filtering, and aggregation. The hands-on nature of the course helped reinforce my understanding of how to use SQL not just to pull data — but to actually extract meaningful insights from it.

Focusing specifically on Data and Business Analyst roles in Chicago gave me a clearer picture of the current job market. I learned how to identify which skills are most in-demand, which ones are linked to higher salaries, and how to evaluate trade-offs between specialization and broad utility.

Overall, this project strengthened both my technical SQL skills and my ability to think analytically about real-world data.

# Conclusions

## Insights

**Here are the key findings based on the five core focus areas of this project:**

- **Top-paying Data and Business Analyst jobs in Chicago:**  
  The highest-paying roles were entirely data-driven — including titles like Data Governance Analyst, BI Analyst, and Data Quality Analyst. None of the top 10 roles included traditional “Business Analyst” titles. Salaries in these roles were consistently over $100K.

- **Skills required for these top-paying roles:**  
  SQL was the most common requirement, followed closely by Tableau and Python. Other frequently listed tools included R, Excel, and Power BI, reinforcing that a mix of traditional and modern analytics tools is expected at higher salary levels.

- **Most in-demand skills for analysts in this city:**  
  SQL led by a wide margin, appearing in the majority of postings. Excel and Tableau were also highly prevalent, and Python maintained strong presence. SAS still appeared in more enterprise-heavy roles, showing it's still relevant in certain sectors.

- **Skills associated with higher salaries:**  
  Specialized tools like SVN, Golang, and Twilio were linked to the highest average salaries but showed up in fewer listings. Machine learning frameworks — including PyTorch, TensorFlow, and Keras — were also tied to top salaries, typically in advanced or hybrid roles.

- **Most strategic skills to learn based on salary and demand:**  
  Spark and Snowflake stood out as the most balanced — they appeared frequently and were tied to high-paying roles. Airflow, GCP, and Databricks also offered strong value, while skills like Kafka, Perl, and Phoenix had high salaries but lower demand.

## Closing Thoughts

This project gave me a clearer view of what employers in a competitive market like Chicago are looking for in analysts. It reinforced the importance of foundational tools like SQL and Excel, while also highlighting the rising value of cloud platforms, data engineering tools, and machine learning frameworks.

By applying SQL to real-world job data, I not only strengthened my technical skills, but also gained meaningful insight into how to navigate the job market more strategically — both for myself and for others pursuing analyst roles.
