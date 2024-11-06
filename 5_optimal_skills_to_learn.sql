/* 
Which skills are both high in demand and associated with high salaries for 
remote Data Analyst roles, providing optimal targets for skill development?
*/



WITH skill_demand AS (
    SELECT 
        sd.skill_id,
        sd.skills,
        COUNT(sjd.job_id) AS demand_count
    FROM 
        job_postings_fact jpf
    INNER JOIN 
        skills_job_dim sjd ON jpf.job_id = sjd.job_id
    INNER JOIN 
        skills_dim sd ON sjd.skill_id = sd.skill_id
    WHERE 
        jpf.job_title_short = 'Data Analyst' 
        AND jpf.job_work_from_home = TRUE
    GROUP BY 
        sd.skill_id, sd.skills    -- Include sd.skills in the GROUP BY
), 
salary_demand AS (
    SELECT 
        sd.skill_id,
        ROUND(AVG(jpf.salary_year_avg), 2) AS avg_salary    
    FROM 
        job_postings_fact jpf
    INNER JOIN 
        skills_job_dim sjd ON jpf.job_id = sjd.job_id
    INNER JOIN 
        skills_dim sd ON sjd.skill_id = sd.skill_id
    WHERE 
        jpf.job_title_short = 'Data Analyst'
        AND jpf.salary_year_avg IS NOT NULL 
        AND jpf.job_work_from_home = TRUE
    GROUP BY 
        sd.skill_id
)
SELECT 
    skill_demand.skills,
    skill_demand.demand_count,
    salary_demand.avg_salary
FROM 
    skill_demand 
INNER JOIN 
    salary_demand ON skill_demand.skill_id = salary_demand.skill_id
WHERE 
    skill_demand.demand_count > 10
ORDER BY 
    salary_demand.avg_salary DESC,
    skill_demand.demand_count DESC
LIMIT 50;
