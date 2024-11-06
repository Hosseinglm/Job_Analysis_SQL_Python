SELECT 
    job_work_from_home,
    Round(AVG(salary_year_avg), 2) AS avg_salary
FROM 
    job_postings_fact
WHERE 
    job_title_short = 'Data Analyst'
    AND salary_year_avg IS NOT NULL
GROUP BY 
    job_work_from_home;




