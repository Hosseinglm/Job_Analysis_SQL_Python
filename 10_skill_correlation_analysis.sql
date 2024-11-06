SELECT 
    s1.skills AS skill1,
    s2.skills AS skill2,
    COUNT(sjd1.job_id) AS job_count
FROM 
    skills_job_dim sjd1
INNER JOIN 
    skills_job_dim sjd2 ON sjd1.job_id = sjd2.job_id
INNER JOIN 
    skills_dim s1 ON sjd1.skill_id = s1.skill_id
INNER JOIN 
    skills_dim s2 ON sjd2.skill_id = s2.skill_id
GROUP BY s1.skills, s2.skills