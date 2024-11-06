
--Question:
--What are the highest-paying remote Data Analyst roles available, including the companies offering these positions?


WITH top_paying_jobs AS (
    SELECT 
        jpf.job_id,
        cd.name AS company_name,
        jpf.job_title,
        jpf.job_posted_date,
        jpf.salary_year_avg
    FROM 
        job_postings_fact jpf
    LEFT JOIN 
        company_dim cd ON jpf.company_id = cd.company_id
    WHERE 
        jpf.job_title_short = 'Data Analyst' 
        AND jpf.job_location = 'Anywhere'
        AND jpf.salary_year_avg IS NOT NULL
    ORDER BY 
        jpf.salary_year_avg DESC 
    LIMIT 10
)
SELECT 
    *
FROM 
    top_paying_jobs;
