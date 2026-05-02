SELECT  
    m_name,  

FROM  
    Treatment 

GROUP BY 
    m_name, 
    t_name 

HAVING  
    COUNT(DISTINCT d_name) >= 3; 