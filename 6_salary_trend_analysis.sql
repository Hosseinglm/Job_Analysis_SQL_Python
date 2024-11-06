/*What are the average salaries for Data Analyst positions per month over the last few years,
 and how do they trend over time?
*/
SELECT 
    EXTRACT(YEAR FROM job_posted_date) AS posting_year,
    EXTRACT(MONTH FROM job_posted_date) AS posting_month,
    ROUND(AVG(salary_year_avg), 2) AS avg_salary
FROM 
    job_postings_fact
WHERE 
    job_title_short = 'Data Analyst'
GROUP BY 
    posting_year, posting_month
ORDER BY 
    posting_year, posting_month;
