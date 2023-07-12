SELECT
    FIRST_NAME,
    LAST_NAME,
    JOB_ID,
    SALARY
FROM
    EMPLOYEES
WHERE
    SALARY > (
        SELECT AVG(NVL(SALARY, 0))
        FROM EMPLOYEES
    );

       
SELECT 
    E1.DEPARTMENT_ID, 
    MAX(E1.SALARY)
FROM  
    EMPLOYEES E1
GROUP BY 
    E1.DEPARTMENT_ID
HAVING 
    MAX(SALARY) < (
    SELECT AVG(E2.SALARY) FROM EMPLOYEES E2
    );
    
    
SELECT
    EMPLOYEE_ID,
    FIRST_NAME,
    LAST_NAME
FROM
    EMPLOYEES
WHERE
    SALARY IN (
        SELECT AVG(NVL(SALARY, 0))
        FROM EMPLOYEES
        GROUP BY DEPARTMENT_ID
    );
    
    

SELECT 
    EMPLOYEE_ID, 
    FIRST_NAME, 
    LAST_NAME
FROM 
    EMPLOYEES
WHERE 
   SALARY  NOT IN (
               SELECT   AVG(NVL(SALARY,0))
               FROM     EMPLOYEES
               GROUP BY DEPARTMENT_ID);   
               
               
SELECT 
    EMPLOYEE_ID, 
    LAST_NAME, 
    JOB_ID, 
    SALARY
FROM 
    EMPLOYEES
WHERE 
   SALARY < ANY (
            SELECT   SALARY
            FROM     EMPLOYEES
            WHERE JOB_ID = 'IT_PROG'); 
            
            
SELECT 
    EMPLOYEE_ID, 
    LAST_NAME, 
    JOB_ID, 
    SALARY
FROM  
    EMPLOYEES
WHERE  
     SALARY < ALL (
                SELECT   SALARY
                FROM     EMPLOYEES
                WHERE JOB_ID = 'IT_PROG');
                
                
SELECT 
     EMP.EMPLOYEE_ID, 
     EMP.LAST_NAME
FROM   
    EMPLOYEES EMP
WHERE  
    EMP.EMPLOYEE_ID  IN (
                        SELECT MGR.MANAGER_ID
                        FROM EMPLOYEES MGR);
                        
                       
SELECT 
      D.DEPARTMENT_ID, 
      D.DEPARTMENT_NAME
FROM    
     DEPARTMENTS D 
WHERE EXISTS (
        SELECT E.DEPARTMENT_ID
        FROM EMPLOYEES E
        WHERE D.DEPARTMENT_ID = E.DEPARTMENT_ID);
        
        
 
SELECT  
     D.DEPARTMENT_ID, 
     D.DEPARTMENT_NAME
FROM    
    DEPARTMENTS D 
WHERE EXISTS  (
               SELECT E.DEPARTMENT_ID
               FROM EMPLOYEES E
               WHERE D.DEPARTMENT_ID = E.DEPARTMENT_ID
               ); 
               
              
SELECT  
     D.DEPARTMENT_ID,
     D.DEPARTMENT_NAME
FROM    
    DEPARTMENTS D 
WHERE 
    D.DEPARTMENT_ID IN (
                    SELECT E.DEPARTMENT_ID
                    FROM EMPLOYEES E
                    ); 
                    
                    
SELECT  
      D.DEPARTMENT_ID, 
      D.DEPARTMENT_NAME
FROM    
    DEPARTMENTS D 
WHERE NOT EXISTS  (
                  SELECT E.DEPARTMENT_ID
                  FROM EMPLOYEES E
                  WHERE D.DEPARTMENT_ID = E.DEPARTMENT_ID
                  );
                  
                  
SELECT 
      E1.EMPLOYEE_ID, 
      E1.FIRST_NAME, 
      E1.LAST_NAME, 
      E1.DEPARTMENT_ID, 
      E1.SALARY
FROM   
     EMPLOYEES E1
WHERE  
     E1.SALARY >= (
               SELECT   TRUNC(AVG(NVL(SALARY,0)),0)
               FROM     EMPLOYEES E2
               WHERE    E1.DEPARTMENT_ID = E2.DEPARTMENT_ID
               );
               
               
SELECT  
    TRUNC(AVG(NVL(SALARY,0)),0)
FROM   
    EMPLOYEES E2
WHERE 
    E2.DEPARTMENT_ID = 60;
    
    
SELECT 
     E1.EMPLOYEE_ID, 
     E1.FIRST_NAME, 
     E1.JOB_ID, 
     E1.SALARY
FROM   
    EMPLOYEES E1
WHERE 
     (E1.JOB_ID, E1.SALARY) 
     IN (
     SELECT E2.JOB_ID, MAX(E2.SALARY)
     FROM EMPLOYEES E2
     GROUP BY E2.JOB_ID
     );    
     
     
SELECT
    EMPREGADOS.EMPLOYEE_ID,
    EMPREGADOS.FIRST_NAME,
    EMPREGADOS.LAST_NAME,
    EMPREGADOS.JOB_ID,
    EMPREGADOS.SALARY,
    ROUND(MAX_SALARY_JOB.MAX_SALARY, 2)  MAX_SALARY,
    EMPREGADOS.SALARY - ROUND(MAX_SALARY_JOB.MAX_SALARY, 2)  DIFERENCA
FROM
    EMPLOYEES EMPREGADOS
LEFT JOIN (
    SELECT
        E2.JOB_ID,
        MAX(E2.SALARY)  MAX_SALARY
    FROM
        EMPLOYEES E2
    GROUP BY
        E2.JOB_ID
) MAX_SALARY_JOB ON EMPREGADOS.JOB_ID = MAX_SALARY_JOB.JOB_ID;
