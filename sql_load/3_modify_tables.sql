
SELECT * FROM skills_job_dim

COPY company_dim
FROM '/Users/jonahschwartz/Desktop/all_folders/csv_files/company_dim.csv'
DELIMITER ','
CSV HEADER;

COPY skills_dim
FROM '/Users/jonahschwartz/Desktop/all_folders/csv_files/skills_dim.csv'
DELIMITER ','
CSV HEADER;

COPY job_postings_fact
FROM '/Users/jonahschwartz/Desktop/all_folders/csv_files/job_postings_fact.csv'
DELIMITER ','
CSV HEADER;

COPY skills_job_dim
FROM '/Users/jonahschwartz/Desktop/all_folders/csv_files/skills_job_dim.csv'
DELIMITER ','
CSV HEADER;
