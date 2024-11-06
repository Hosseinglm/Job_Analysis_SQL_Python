SELECT 
    EXTRACT(MONTH FROM job_posted_date) AS posting_month,
    COUNT(job_id) AS job_count
FROM 
    job_postings_fact
WHERE 
    job_title_short = 'Data Analyst'
GROUP BY 
    posting_month
ORDER BY 
    posting_month;
