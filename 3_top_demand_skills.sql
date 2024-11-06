
/*
Which skills are most frequently required in remote Data Analyst job postings,
 and what is their demand volume?
*/


SELECT 
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
    sd.skills
ORDER BY 
    demand_count DESC
LIMIT 10;
