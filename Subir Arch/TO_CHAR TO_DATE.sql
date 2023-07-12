SELECT 
   LAST_NAME, 
TO_CHAR
   (HIRE_DATE, 'DD/MM/YYYY HH24:MI:SS') DT_ADMISSÃO
FROM 
   EMPLOYEES;
  

SELECT 
    SYSDATE, 
TO_CHAR
   (SYSDATE, 'DD/MM/YYYY HH24:MI:SS') DATA
FROM 
   DUAL;  
  

SELECT 
    FIRST_NAME, 
TO_CHAR
    (HIRE_DATE, 'DD, "de" Month "de" YYYY') DT_ADMISSÃO
FROM 
    EMPLOYEES;


SELECT 
    FIRST_NAME, 
TO_CHAR
   (HIRE_DATE, 'FMDD, "de" Month "de" YYYY') DT_ADMISSÃO
FROM 
    EMPLOYEES;
  
  
SELECT
     FIRST_NAME, 
     LAST_NAME, 
TO_CHAR
    (SALARY, 'L99G999G999D99')  SALÁRIO
FROM
    EMPLOYEES;

SELECT
      FIRST_NAME, 
      LAST_NAME, 
TO_CHAR
     (SALARY, 'L99,999,999.99')  SÁLARIO
FROM
     EMPLOYEES; 
     
SELECT 
TO_NUMBER
          ('12000,50')
FROM 
          DUAL;     
     
     
SELECT
TO_DATE
       ('23/05/2023','DD/MM/YYYY') DATA
FROM 
   DUAL;     


SELECT 
          FIRST_NAME, 
          LAST_NAME, 
          HIRE_DATE
FROM 
         EMPLOYEES
WHERE  
        HIRE_DATE =  
        TO_DATE('05/06/2023','DD/MM/YYYY');  
        
        
SELECT 
         FIRST_NAME, 
         LAST_NAME, 
ROUND
        (MONTHS_BETWEEN(SYSDATE, HIRE_DATE),0)  NUMERO_MESES
FROM 
        EMPLOYEES
WHERE 
        HIRE_DATE = 
        TO_DATE('17/06/2003','DD/MM/YYYY');    
        
        
SELECT 
         LAST_NAME, 
         SALARY, 
         NVL (COMMISSION_PCT, 0), 
         SALARY *12 SALARIO_ANUAL,
        (SALARY *12)  + 
        (SALARY *12 
        *NVL(COMMISSION_PCT,0)) REMUNERAÇÃO_ANUAL
FROM
        EMPLOYEES;        
        
        
SELECT 
COALESCE
           (NULL, NULL, 'EXPRESSÃO 3'), 
COALESCE
           (NULL, 'EXPRESSÃO 2', 'EXPRESSÃO 3'),
COALESCE
           ('EXPRESSÃO 1', 'EXPRESSÃO 2', 'EXPRESSÃO 3')
FROM
          DUAL;        
          
          
SELECT 
          LAST_NAME, 
          EMPLOYEE_ID, 
          COMMISSION_PCT, 
          MANAGER_ID,
COALESCE
(TO_CHAR
           (COMMISSION_PCT), 
TO_CHAR
          (MANAGER_ID), 'SEM PERCENTUAL DE COMISSÃO E SEM GERENTE')
FROM 
          EMPLOYEES;    
          
          
SELECT 
          LAST_NAME, 
          SALARY, 
          COMMISSION_PCT,
NVL2
          (COMMISSION_PCT, 10, 0) PERCENTUAL_ALTERADO
FROM 
         EMPLOYEES;          
 
 
SELECT 
NULLIF
            (1000, 1000), 
NULLIF
           (1000, 2000)
FROM 
          DUAL;          
          
          
SELECT 
                  LAST_NAME, 
                  JOB_ID, 
                  SALARY,
         CASE 
         JOB_ID
         WHEN
         'IT_PROG'
         THEN 
         1.10* SALARY
         WHEN
         'ST_CLERK'
         THEN 
         1.15* SALARY
         WHEN
          'SA_REP'
          THEN 
          1.20*SALARY
          ELSE 
          SALARY
          END 
          "NOVO SALARIO"
FROM 
         EMPLOYEES;          
       
       
SELECT 
           LAST_NAME, 
           JOB_ID, 
           SALARY,
DECODE
               (JOB_ID, 
               'IT_PROG',  
               1.10* SALARY,
               'ST_CLERK',
               1.15* SALARY,
               'SA_REP' , 
               1.20* SALARY
             , SALARY) "NOVO SALARIO"
FROM
      EMPLOYEES;          
