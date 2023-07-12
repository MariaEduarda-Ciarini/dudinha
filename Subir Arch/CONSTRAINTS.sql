DROP TABLE PROJECTS;

CREATE TABLE PROJECTS (
    PROJECT_ID   NUMBER(6)      NOT NULL,
    PROJECT_CODE VARCHAR2(10)   NOT NULL,
    PROJECT_NAME VARCHAR2(100)  NOT NULL,
    DEPARTMENT_ID NUMBER(4)     NOT NULL,
    CREATION_DATE DATE DEFAULT SYSDATE NOT NULL,
    START_DATE    DATE,
    END_DATE      DATE,
    STATUS        VARCHAR2(20)   NOT NULL,
    PRIORITY      VARCHAR2(10)   NOT NULL,
    BUDGET        NUMBER(11,2)   NOT NULL,
    DESCRIPTION   VARCHAR2(400)  NOT NULL
);

DESC PROJECTS

DROP TABLE PROJECTS;

CREATE TABLE PROJECTS (
    PROJECT_ID    NUMBER(6)       NOT NULL,
    PROJECT_CODE  VARCHAR2(10)    NOT NULL,
    PROJECT_NAME  VARCHAR2(100)   NOT NULL,
    DEPARTMENT_ID NUMBER(4)       NOT NULL,
    CREATION_DATE DATE            DEFAULT SYSDATE NOT NULL,
    START_DATE    DATE,
    END_DATE      DATE,
    STATUS        VARCHAR2(20)    NOT NULL,
    PRIORITY      VARCHAR2(10)    NOT NULL,
    BUDGET        NUMBER(11,2)    NOT NULL,
    DESCRIPTION   VARCHAR2(400)   NOT NULL,
    CONSTRAINT PROJECTS_PK PRIMARY KEY (PROJECT_ID)
);

DROP TABLE PROJECTS;

CREATE TABLE PROJECTS (
    PROJECT_ID    NUMBER(6)       NOT NULL,
    PROJECT_CODE  VARCHAR2(10)    NOT NULL,
    PROJECT_NAME  VARCHAR2(100)   NOT NULL,
    DEPARTMENT_ID NUMBER(4)       NOT NULL,
    CREATION_DATE DATE            DEFAULT SYSDATE NOT NULL,
    START_DATE    DATE,
    END_DATE      DATE,
    STATUS        VARCHAR2(20)    NOT NULL,
    PRIORITY      VARCHAR2(10)    NOT NULL,
    BUDGET        NUMBER(11,2)    NOT NULL,
    DESCRIPTION   VARCHAR2(400)   NOT NULL,
    CONSTRAINT PROJECTS_PROJECT_ID_PK  PRIMARY KEY(PROJECT_ID)
);

DROP TABLE PROJECTS;

CREATE TABLE PROJECTS (
    PROJECT_ID    NUMBER(6)       
    CONSTRAINT PROJECTS_PROJECT_ID_PK PRIMARY KEY,
    PROJECT_CODE  VARCHAR2(10)    
    CONSTRAINT PROJECTS_PROJECT_CODE_UK UNIQUE,
    PROJECT_NAME  VARCHAR2(100)   NOT NULL,
    DEPARTMENT_ID NUMBER(4)       NOT NULL,
    CREATION_DATE DATE            DEFAULT SYSDATE NOT NULL,
    START_DATE    DATE,
    END_DATE      DATE,
    STATUS        VARCHAR2(20)    NOT NULL,
    PRIORITY      VARCHAR2(10)    NOT NULL,
    BUDGET        NUMBER(11,2)    NOT NULL,
    DESCRIPTION   VARCHAR2(400)   NOT NULL
);

DROP TABLE PROJECTS;

CREATE TABLE PROJECTS (
    PROJECT_ID    NUMBER(6)       NOT NULL,
    PROJECT_CODE  VARCHAR2(10)    NOT NULL,
    PROJECT_NAME  VARCHAR2(100)   NOT NULL,
    DEPARTMENT_ID NUMBER(4)       NOT NULL,
    CREATION_DATE DATE            DEFAULT SYSDATE NOT NULL,
    START_DATE    DATE,
    END_DATE      DATE,
    STATUS        VARCHAR2(20)    NOT NULL,
    PRIORITY      VARCHAR2(10)    NOT NULL,
    BUDGET        NUMBER(11,2)    NOT NULL,
    DESCRIPTION   VARCHAR2(400)   NOT NULL,
    CONSTRAINT PROJECTS_PK PRIMARY KEY (PROJECT_ID),
    CONSTRAINT PROJECTS_CODE_UK UNIQUE (PROJECT_CODE)
);

DROP TABLE PROJECTS;

CREATE TABLE PROJECTS (
    PROJECT_ID    NUMBER(6)       NOT NULL,
    PROJECT_CODE  VARCHAR2(10)    NOT NULL,
    PROJECT_NAME  VARCHAR2(100)   NOT NULL,
    DEPARTMENT_ID NUMBER(4)       NOT NULL,
    CREATION_DATE DATE            DEFAULT SYSDATE NOT NULL,
    START_DATE    DATE,
    END_DATE      DATE,
    STATUS        VARCHAR2(20)    NOT NULL,
    PRIORITY      VARCHAR2(10)    NOT NULL,
    BUDGET        NUMBER(11,2)    NOT NULL,
    DESCRIPTION   VARCHAR2(400)   NOT NULL,
    CONSTRAINT PROJECTS_PK PRIMARY KEY (PROJECT_ID),
    CONSTRAINT PROJECTS_CODE_UK UNIQUE (PROJECT_CODE),
    CONSTRAINT PROJECTS_DEPARTMENT_ID_FK FOREIGN KEY (DEPARTMENT_ID)
    REFERENCES DEPARTMENTS (DEPARTMENT_ID)
);


DROP TABLE TEAMS;

CREATE TABLE TEAMS (
    PROJECT_ID NUMBER(6) NOT NULL,
    EMPLOYEE_ID NUMBER(6) NOT NULL,
    CONSTRAINT TEAMS_PROJECT_ID_FK FOREIGN KEY (PROJECT_ID) REFERENCES PROJECTS (PROJECT_ID),
    CONSTRAINT TEAMS_EMPLOYEE_ID_FK FOREIGN KEY (EMPLOYEE_ID) REFERENCES EMPLOYEES (EMPLOYEE_ID)
);

DROP TABLE TEAMS;

CREATE TABLE TEAMS (
    PROJECT_ID NUMBER(6) NOT NULL,
    EMPLOYEE_ID NUMBER(6) NOT NULL,
    CONSTRAINT TEAMS_PROJECT_ID_FK FOREIGN KEY (PROJECT_ID) REFERENCES PROJECTS (PROJECT_ID) ON DELETE CASCADE,
    CONSTRAINT TEAMS_EMPLOYEE_ID_FK FOREIGN KEY (EMPLOYEE_ID) REFERENCES EMPLOYEES (EMPLOYEE_ID)
);

DROP TABLE TEAMS;


SELECT
    UID, 
    USERENV('LANGUAGE'),
    USER, 
    SYSDATE
FROM 
    DUAL;
    
    
DROP TABLE PROJECTS CASCADE CONSTRAINTS;

CREATE TABLE PROJECTS (
    PROJECT_ID    NUMBER(6)    NOT NULL
    CONSTRAINT PROJECTS_PROJECT_ID_PK PRIMARY KEY,
    PROJECT_CODE  VARCHAR2(10) NOT NULL 
    CONSTRAINT PROJECTS_PROJECT_CODE_UK UNIQUE,
    PROJECT_NAME  VARCHAR2(100) NOT NULL,
    DEPARTMENT_ID NUMBER(4)    NOT NULL 
    CONSTRAINT PROJECTS_DEPARTMENT_ID_FK REFERENCES DEPARTMENTS,
    CREATION_DATE DATE DEFAULT SYSDATE NOT NULL,
    START_DATE    DATE,
    END_DATE      DATE,
    STATUS        VARCHAR2(20) NOT NULL,
    PRIORITY      VARCHAR2(10) NOT NULL,
    BUDGET        NUMBER(11,2) NOT NULL 
    CONSTRAINT PROJECTS_BUDGET_CK CHECK (BUDGET > 0),
    DESCRIPTION   VARCHAR2(400) NOT NULL
);

DROP TABLE PROJECTS CASCADE CONSTRAINTS;

CREATE TABLE PROJECTS (
    PROJECT_ID    NUMBER(6)    NOT NULL,
    PROJECT_CODE  VARCHAR2(10) NOT NULL,
    PROJECT_NAME  VARCHAR2(100)NOT NULL,
    DEPARTMENT_ID NUMBER(4)    NOT NULL,
    CREATION_DATE DATE DEFAULT SYSDATE NOT NULL,
    START_DATE    DATE,
    END_DATE      DATE,
    STATUS        VARCHAR2(20) NOT NULL,
    PRIORITY      VARCHAR2(10) NOT NULL,
    BUDGET        NUMBER(11,2) NOT NULL,
    DESCRIPTION   VARCHAR2(400)NOT NULL,
    CONSTRAINT PROJECTS_PROJECT_ID_PK PRIMARY KEY (PROJECT_ID),
    CONSTRAINT PROJECTS_PROJECT_CODE_UK UNIQUE (PROJECT_CODE),
    CONSTRAINT PROJECTS_DEPARTMENT_ID_FK FOREIGN KEY (DEPARTMENT_ID) 
    REFERENCES DEPARTMENTS(DEPARTMENT_ID),
    CONSTRAINT PROJECTS_BUDGET_CK CHECK (BUDGET > 0)
);

-- Violando Constraints - ERRO

INSERT INTO PROJECTS (
    PROJECT_ID, PROJECT_CODE, PROJECT_NAME, DEPARTMENT_ID,
    CREATION_DATE, START_DATE, END_DATE, STATUS, PRIORITY,
    BUDGET, DESCRIPTION
)
VALUES (
    1, 'ERPIMP', 'ERP IMPLEMENTATION', 77,
    SYSDATE, NULL, NULL, 'APPROVED', 'HIGH',
    1000000.00, 'ORACLE ERP IMPLEMENTATION'
);


-- Violando Constraints - Corrigindo

INSERT INTO PROJECTS (
    PROJECT_ID, PROJECT_CODE, PROJECT_NAME, DEPARTMENT_ID,
    CREATION_DATE, START_DATE, END_DATE, STATUS, PRIORITY,
    BUDGET, DESCRIPTION
)
VALUES (
    1, 'ERPIMP', 'ERP IMPLEMENTATION', 60,
    SYSDATE, NULL, NULL, 'APPROVED', 'HIGH',
    1000000.00, 'ORACLE ERP IMPLEMENTATION'
);

COMMIT;

DESC USER_CONSTRAINTS
DESC USER_CONS_COLUMNS


SELECT CO.CONSTRAINT_NAME,
       CO.CONSTRAINT_TYPE,
       CO.SEARCH_CONDITION,
       CO.R_CONSTRAINT_NAME,
       CO.DELETE_RULE,
       CC.COLUMN_NAME,
       CC.POSITION,
       CO.STATUS
FROM   USER_CONSTRAINTS CO
JOIN   USER_CONS_COLUMNS CC ON (CO.CONSTRAINT_NAME = CC.CONSTRAINT_NAME) 
                           AND (CO.TABLE_NAME = CC.TABLE_NAME)
WHERE  CO.TABLE_NAME = 'PROJECTS'
ORDER BY CO.CONSTRAINT_NAME, CC.POSITION;


ALTER TABLE PROJECTS
DROP CONSTRAINT PROJECTS_DEPARTMENT_ID_FK;


ALTER TABLE PROJECTS
DROP CONSTRAINT PROJECTS_PROJECT_ID_PK CASCADE;


ALTER TABLE PROJECTS
ADD CONSTRAINT PROJECTS_DEPARTMENT_ID_FK FOREIGN KEY (DEPARTMENT_ID) REFERENCES DEPARTMENTS(DEPARTMENT_ID);


ALTER TABLE PROJECTS
DISABLE CONSTRAINT  PROJECTS_DEPARTMENT_ID_FK;

ALTER TABLE PROJECTS
DISABLE CONSTRAINT PROJECTS_PROJECT_ID_PK CASCADE;


ALTER TABLE PROJECTS
ENABLE CONSTRAINT PROJECTS_DEPARTMENT_ID_FK;

ALTER TABLE projects
ENABLE CONSTRAINT projects_project_id_pk;
