INSERT INTO job_applied
            (job_id,
            application_sent_date,
            custom_resume,
            resume_file_name,
            cover_letter_sent,
            cover_letter_file_name,
            status)
VALUES      (1, 
'2024-02-01',
true,
'resume_01.pdf',
'cover_letter_01.pdf',
'submitted');


ALTER TABLE job_applied
ADD contact VARCHAR(50);