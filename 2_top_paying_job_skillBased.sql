

--What are the skills required for these top-paying roles?

/*
Question: What are the top-paying data analyst jobs?
- Identify the top 10 highest-paying Data Analyst roles that are available remotely
- Focuses on job postings with specified salaries (remove nulls)
- BONUS: Include company names of top 10 roles
- Why? Highlight the top-paying opportunities for Data Analysts, offering insights into employment options and location flexibility.
*/

WITH top_paying_jobs AS(

    SELECT 
        job_id,
        name as company_name,
        job_title,
        job_posted_date,
        salary_year_avg

    FROM 
    job_postings_fact jpf
    LEFT JOIN company_dim cd On jpf.company_id = cd .company_id

    WHERE job_title_short = 'Data Analyst' AND job_location = 'Anywhere'
    AND salary_year_avg IS NOT NULL
    ORDER BY salary_year_avg DESC limit 10
)

SELECT tpj.*,
    sd.skills
FROM top_paying_jobs tpj
INNER JOIN skills_job_dim sjd ON tpj.job_id = sjd.job_id
INNER JOIN skills_dim sd On sjd.skill_id = sd.skill_id
ORDER BY salary_year_avg DESC
