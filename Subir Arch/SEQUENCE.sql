SELECT MAX(EMPLOYEE_ID)
FROM EMPLOYEES;

DROP SEQUENCE EMPLOYEES_SEQ;
CREATE SEQUENCE EMPLOYEES_SEQ
    START WITH 213
    INCREMENT BY 1
    NOMAXVALUE
    NOCACHE
    NOCYCLE;
    
SELECT *
FROM USER_SEQUENCES;

SELECT EMPLOYEES_SEQ.NEXTVAL
FROM DUAL;

SELECT EMPLOYEES_SEQ.CURRVAL
FROM DUAL;

DROP SEQUENCE EMPLOYEES_SEQ;
CREATE SEQUENCE EMPLOYEES_SEQ
    START WITH 213
    INCREMENT BY 1
    NOMAXVALUE
    NOCACHE
    NOCYCLE;
    
   
INSERT INTO EMPLOYEES (
    EMPLOYEE_ID, FIRST_NAME, LAST_NAME, EMAIL,
    PHONE_NUMBER, HIRE_DATE, JOB_ID, SALARY,
    COMMISSION_PCT, MANAGER_ID, DEPARTMENT_ID
)
VALUES (
    EMPLOYEES_SEQ.NEXTVAL, 'EZIO', 'AUDITORE', 'FIRENZAC',
    '512.312.242', TO_DATE('27.06.2023', 'DD/MM/YYYY'), 'IT_PROG', 3500,
    NULL, 103, 60
);

SELECT *
FROM EMPLOYEES
ORDER BY EMPLOYEE_ID 
    DESC;
    
COMMIT;

ALTER SEQUENCE EMPLOYEES_SEQ
MAXVALUE 999999
CACHE 20;    

SELECT *
FROM USER_SEQUENCES;
