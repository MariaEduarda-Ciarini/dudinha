-- SEÇÃO 15 - FUNÇÕES DE BANCO DE DADOS
--
-- AULA 2 - UTILIZANDO FUNÇÕES EM COMANDOS SQL
--

-- UTILIZANDO FUNÇÕES EM COMANDOS SQL

CREATE OR REPLACE FUNCTION FNC_CONSULTA_TITULO_CARGO_EMPREGADO
  (PJOB_ID   IN JOBS.JOB_ID%TYPE)
   RETURN VARCHAR2
IS 
  VJOB_TITLE JOBS.JOB_TITLE%TYPE;
BEGIN
  SELECT JOB_TITLE
  INTO   VJOB_TITLE
  FROM   JOBS
  WHERE  JOB_ID = PJOB_ID;
  RETURN (VJOB_TITLE);
EXCEPTION
  WHEN NO_DATA_FOUND THEN 
    RAISE_APPLICATION_ERROR(-20001, 'JOB INEXISTENTE');
  WHEN OTHERS THEN
    RAISE_APPLICATION_ERROR(-20002, 'ERRO ORACLE ' || SQLCODE || ' - ' || SQLERRM);
END;

-- UTILIZANDO FUNÇÕES EM COMANDOS SQL

SELECT EMPLOYEE_ID, FIRST_NAME, LAST_NAME, JOB_ID, FNC_CONSULTA_TITULO_CARGO_EMPREGADO(JOB_ID) "JOB TITLE"
FROM   EMPLOYEES;

-- EXECUTANDO A FUNÇÃO PELO COMANDO SELECT

SELECT FNC_CONSULTA_TITULO_CARGO_EMPREGADO('IT_PROG')
FROM   DUAL;

-- EXECUTANDO A FUNÇÃO PELO COMANDO SELECT

SELECT FNC_CONSULTA_SALARIO_EMPREGADO(207)
FROM   DUAL;
