SELECT 
    cd.name AS company_name,
    Round(AVG(jpf.salary_year_avg), 2) AS avg_salary,
    COUNT(jpf.job_id) AS job_count
FROM 
    job_postings_fact jpf
INNER JOIN 
    company_dim cd ON jpf.company_id = cd.company_id
WHERE 
    jpf.job_title_short = 'Data Analyst'
    AND jpf.salary_year_avg IS NOT NULL
GROUP BY 
    cd.name
ORDER BY 
    avg_salary DESC;
