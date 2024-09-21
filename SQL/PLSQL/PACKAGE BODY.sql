CREATE OR REPLACE PACKAGE BODY PCK_EMPREGADOS
IS
	PROCEDURE PRC_INSERE_EMPREGADO
	  (PFIRST_NAME    IN VARCHAR2,
	   PLAST_NAME     IN VARCHAR2,
	   PEMAIL         IN VARCHAR2,
	   PPHONE_NUMBER  IN VARCHAR2,
	   PHIRE_DATE     IN DATE DEFAULT SYSDATE,
	   PJOB_ID        IN VARCHAR2,
	   PSALARY        IN NUMBER,
	   PCOMMISION_PCT IN NUMBER,
	   PMANAGER_ID    IN NUMBER,
	   PDEPARTMENT_ID IN NUMBER)
	IS 
	BEGIN
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
		DEPARTMENT_ID )
	  VALUES (
		EMPLOYEES_SEQ.NEXTVAL,
		PFIRST_NAME,
		PLAST_NAME,
		PEMAIL,
		PPHONE_NUMBER,
		PHIRE_DATE,
		PJOB_ID,
		PSALARY,
		PCOMMISION_PCT,
		PMANAGER_ID,
		PDEPARTMENT_ID );
	EXCEPTION
	  WHEN OTHERS THEN
		 RAISE_APPLICATION_ERROR(-20001, 'ERRO ORACLE ' || SQLCODE || SQLERRM);
	END;

	PROCEDURE PRC_AUMENTA_SALARIO_EMPREGADO
	  (PEMPLOYEE_ID   IN NUMBER,
	   PERCENTUAL    IN NUMBER)  -- Certifique-se de que o nome do parâmetro corresponde ao da especificação
	IS
	BEGIN
	  UPDATE EMPLOYEES 
	  SET SALARY = SALARY * (1 + PERCENTUAL / 100)
	  WHERE EMPLOYEE_ID = PEMPLOYEE_ID;

	EXCEPTION
	  WHEN OTHERS 
	  THEN
		 RAISE_APPLICATION_ERROR(-20001, 'ERRO ORACLE: ' || SQLCODE || ' - ' || SQLERRM);
	END;

	FUNCTION FNC_CONSULTA_SALARIO_EMPREGADO
	  (PEMPLOYEE_ID   IN NUMBER)
	   RETURN NUMBER
	IS 
	  VSALARY  EMPLOYEES.SALARY%TYPE;
	BEGIN
	  SELECT SALARY
	  INTO   VSALARY
	  FROM   EMPLOYEES
	  WHERE  EMPLOYEE_ID = PEMPLOYEE_ID;
	  RETURN (VSALARY);
	EXCEPTION
	  WHEN NO_DATA_FOUND THEN 
		  RAISE_APPLICATION_ERROR(-20001, 'EMPREGADO INEXISTENTE');
	  WHEN OTHERS THEN
		 RAISE_APPLICATION_ERROR(-20002, 'ERRO ORACLE ' || SQLCODE || SQLERRM);
	END;

END PCK_EMPREGADOS;
