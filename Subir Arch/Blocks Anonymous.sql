-- Bloco Anônimo
SET SERVEROUTPUT ON

DECLARE
    VTEXTO VARCHAR2(100) := 'Seja bem vindos ao Procedural Language/SQL';
BEGIN
    DBMS_OUTPUT.PUT_LINE(VTEXTO);
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Erro Oracle: '
            || SQLCODE
            || ' '
            || SQLERRM);
END;
DECLARE
    VNUMERO1 NUMBER(11, 2) := 500;
    VNUMERO2 NUMBER(11, 2) := 450;
    VMEDIA   NUMBER (11, 2);
BEGIN
    VMEDIA := (VNUMERO1 + VNUMERO2) / 2;
    DBMS_OUTPUT.PUT_LINE('Media = '
        || VMEDIA);
END;