
/*
Which skills are linked to the highest salaries for Data Analyst positions,
 taking into account remote work flexibility?
 In adddition there is a compare with average remote salary.
*/


SELECT 
    sd.skills,
    ROUND(AVG(jpf.salary_year_avg), 2) AS avg_salary,
    (SELECT 
        ROUND(AVG(jpf2.salary_year_avg), 2)
     FROM 
        job_postings_fact jpf2
     INNER JOIN 
        skills_job_dim sjd2 ON jpf2.job_id = sjd2.job_id
     INNER JOIN 
        skills_dim sd2 ON sjd2.skill_id = sd2.skill_id
     WHERE 
        jpf2.job_title_short = 'Data Analyst'
        AND jpf2.salary_year_avg IS NOT NULL 
        AND jpf2.job_work_from_home = TRUE
        AND sd2.skills = sd.skills
    ) AS avg_salary_remote
FROM 
    job_postings_fact jpf
INNER JOIN 
    skills_job_dim sjd ON jpf.job_id = sjd.job_id
INNER JOIN 
    skills_dim sd ON sjd.skill_id = sd.skill_id
WHERE 
    jpf.job_title_short = 'Data Analyst'
    AND jpf.salary_year_avg IS NOT NULL
GROUP BY 
    sd.skills
ORDER BY 
    avg_salary DESC
LIMIT 50;