INSERT INTO DEPARTMENTS (
    DEPARTMENT_ID,
    DEPARTMENT_NAME,
    MANAGER_ID,
    LOCATION_ID
) VALUES (
    199,
    'PROJECT REVISAMENT',
    103,
    1400
);

DESC DEPARTMENTS;

INSERT INTO DEPARTMENTS VALUES (
    500,
    'AI',
    NULL,
    NULL
);

INSERT INTO DEPARTMENTS(
    DEPARTMENT_ID,
    DEPARTMENT_NAME
) VALUES (
    501,
    'PYTHON'
);

COMMIT;

INSERT INTO EMPLOYEES (
    EMPLOYEE_ID,
    FIRST_NAME,
    LAST_NAME,
    EMAIL,
    PHONE_NUMBER,
    HIRE_DATE,
    JOB_ID,
    SALARY,
    COMMISSION_PCT,
    MANAGER_ID,
    DEPARTMENT_ID
) VALUES (
    209,
    'Young',
    'Kiwi',
    'KIWIOUNG',
    '525.346.262',
    SYSDATE,
    'IT_PROG',
    9500,
    NULL,
    103,
    60
);

INSERT INTO EMPLOYEES (
    EMPLOYEE_ID,
    FIRST_NAME,
    LAST_NAME,
    EMAIL,
    PHONE_NUMBER,
    HIRE_DATE,
    JOB_ID,
    SALARY,
    COMMISSION_PCT,
    MANAGER_ID,
    DEPARTMENT_ID
) VALUES (
    212,
    'Bonequinho',
    'Fortnite',
    'BFORTZ',
    '521.324.263',
    TO_DATE('22/06/2023', 'DD/MM/YYYY'),
    'IT_PROG',
    18000,
    NULL,
    103,
    60
);

SELECT
    *
FROM
    EMPLOYEES;

COMMIT;

INSERT INTO DEPARTMENTS (
    DEPARTMENT_ID,
    DEPARTMENT_NAME,
    LOCATION_ID
) VALUES (
    &DEPARTMENT_ID,
    '&DEPARTMENT_NAME',
    &LOCATION
);

SELECT
    *
FROM
    DEPARTMENTS
ORDER BY
    DEPARTMENT_ID DESC;

COMMIT;

DROP TABLE SALES_REPS;

CREATE TABLE SALES_REPS(
    ID NUMBER (6, 0),
    NAME VARCHAR2 (20),
    SALARY NUMBER (8, 2),
    COMMISSION_PCT NUMBER(2, 2)
);

INSERT INTO SALES_REPS(
    ID,
    NAME,
    SALARY,
    COMMISSION_PCT
)
    SELECT
        EMPLOYEE_ID,
        LAST_NAME,
        SALARY,
        COMMISSION_PCT
    FROM
        EMPLOYEES
    WHERE
        JOB_ID = 'SA_REP';

COMMIT;

SELECT
    *
FROM
    SALES_REPS;

UPDATE EMPLOYEES
SET
    SALARY = SALARY * 1.2;

ROLLBACK;

UPDATE EMPLOYEES
SET
    SALARY = SALARY * 2.25
WHERE
    LAST_NAME = 'Kiwi';

COMMIT;

SELECT
    *
FROM
    EMPLOYEES
WHERE
    LAST_NAME = 'Kiwi';

DELETE FROM COUNTRIES
WHERE
    COUNTRY_NAME = 'Nigeria';

ROLLBACK;