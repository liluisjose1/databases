CREATE OR REPLACE FUNCTION FN_EGCC_ESTADO_CUENTA
(P_CUENTA VARCHAR2) RETURN VARCHAR2
AS
  V_ESTADO VARCHAR2(100);
  V_CONT NUMBER(5);
BEGIN
  
  SELECT COUNT(*) INTO V_CONT
  FROM CUENTA
  WHERE CHR_CUENCODIGO = P_CUENTA;
  
  IF V_CONT=0 THEN
    V_ESTADO := 'NO EXISTE';
  ELSE
    SELECT VCH_CUENESTADO INTO V_ESTADO
    FROM CUENTA
    WHERE CHR_CUENCODIGO = P_CUENTA;
  END IF;

  RETURN V_ESTADO;
    
END;
/
