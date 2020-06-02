-- FUNCION QUE RECUPERA TRAZA DE ERROR

CREATE OR REPLACE FUNCTION FN_GET_GLOSA_ERROR RETURN VARCHAR2
AS

/***********************************************************************************************************************
   NAME:    FN_GET_GLOSA_ERROR
   PURPOSE: Funcion que retorna glosa de error, incluye stacktrace con nombre del SP y linea donde se produce el error

   REVISIONS:
   Ver          Date           Author                       Description
   ---------    ----------     -------------------          -------------------------------------------------------------
   X.X.X-X.X    DD/MM/YYYY     AUTOR DE LA FUNCION          1. Funcion que retorna detalles del error ocurrido

************************************************************************************************************************/

LV_BACKTRACE VARCHAR2(4000) := DBMS_UTILITY.format_error_backtrace;
LV_MENSAJE VARCHAR2(4000) := '';

BEGIN

    LV_MENSAJE := CONCAT(LV_BACKTRACE, SUBSTR(SQLERRM, 1, 255));

    RETURN SUBSTR(LV_MENSAJE, 1, 4000);

EXCEPTION
    WHEN OTHERS THEN
        RETURN NULL;
END FN_GET_GLOSA_ERROR;


-- PROCEDIMIENTO QUE CREA UN REGISTRO

--CREAR
CREATE OR REPLACE PROCEDURE SP_NOMBRE_PROCEDIMIENTO(
    IN_DATO_1 IN VARCHAR2,
    IN_DATO_2 IN VARCHAR2,
    IN_DATO_3 IN VARCHAR2,
    IN_DATO_4 IN NUMBER,
    IN_DATO_5 IN VARCHAR2,
    IN_DATO_6 IN NUMBER,    
    OUT_GLOSA OUT VARCHAR2,
    OUT_ESTADO OUT NUMBER,
    OUT_ID_SALIDA OUT NUMBER
) AS

/**************************************************************************************************************
   NAME:       	SP_NOMBRE_PROCEDIMIENTO
   PURPOSE		ACCION QUE REALIZA EL PROCEDURE

   REVISIONS:
   Ver          Date           Author                               Description
   ---------    ----------     -------------------                  ----------------------------------------------
   X.X.X-X.X    DD/MM/YYYY     AUTOR DEL PROCEDURE       			1. DESCRIPCIÓN SIMPLE PARA LA VERSIÓN
	
   SE DEBEN AGREGAR TODAS LAS VERSIONES QUE Y NOMBRES DE LOS QUE TRABAJEN EN EL 
***************************************************************************************************************/

BEGIN
    OUT_ESTADO := 0;
    OUT_GLOSA := 'SP_NOMBRE_PROCEDIMIENTO ejecutado exitosamente';

    INSERT INTO ESQUEMA.NOMBRE_TABLA(
        CAMPO_1,
        CAMPO_2,
        CAMPO_3,
        CAMPO_4,
        CAMPO_5,
        CAMPO_6
   )
    VALUES (
      ESQUEMA.SECUENCIA_ID_SEQ.NEXTVAL,
      IN_DATO_1,
	  IN_DATO_2,
      IN_DATO_3,
	  IN_DATO_4,
	  IN_DATO_5,
	  IN_DATO_6
    ) RETURNING ID INTO OUT_ID_SALIDA;

    EXCEPTION
        WHEN OTHERS THEN
            OUT_ESTADO := -1;
            OUT_GLOSA := ESQUEMA.FN_GET_GLOSA_ERROR;

END SP_NOMBRE_PROCEDIMIENTO;

-- PROCEDIMIENTO QUE UPDATEA UN REGISTRO

// UPDATE
CREATE OR REPLACE PROCEDURE SP_NOMBRE_PROCEDIMIENTO(
  IN_DATO_1 IN NUMBER,
  IN_DATO_2 IN VARCHAR2,  
  IN_DATO_3 IN NUMBER,
  OUT_GLOSA OUT VARCHAR2,
  OUT_ESTADO OUT NUMBER
) AS

/**************************************************************************************************************
   NAME:       	SP_NOMBRE_PROCEDIMIENTO
   PURPOSE		ACCION QUE REALIZA EL PROCEDURE

   REVISIONS:
   Ver          Date           Author                               Description
   ---------    ----------     -------------------                  ----------------------------------------------
   X.X.X-X.X    DD/MM/YYYY     AUTOR DEL PROCEDURE       			1. DESCRIPCIÓN SIMPLE PARA LA VERSIÓN
   
   SE DEBEN AGREGAR TODAS LAS VERSIONES QUE Y NOMBRES DE LOS QUE TRABAJEN EN EL 
***************************************************************************************************************/


BEGIN
    OUT_ESTADO := 0;
    OUT_GLOSA := 'SP_NOMBRE_PROCEDIMIENTO ejecutado exitosamente';

    UPDATE ESQUEMA.NOMBRE_TABLA SET
      CAMPO_1 = IN_DATO_1,
      CAMPO_1 = IN_DATO_2          
      WHERE ID = IN_DATO_3;

    EXCEPTION
        WHEN OTHERS THEN
            OUT_ESTADO := -1;
            OUT_GLOSA := ESQUEMA.FN_GET_GLOSA_ERROR;

END SP_NOMBRE_PROCEDIMIENTO;

-- PROCEDIMIENTO QUE LEE DATOS

CREATE OR REPLACE PROCEDURE SP_NOMBRE_PROCEDIMIENTO(
  IN_DATO_1 IN NUMBER,
  OUT_GLOSA OUT VARCHAR2,
  OUT_ESTADO OUT NUMBER,
  OUT_NOMBRE_CURSOR OUT SYS_REFCURSOR  
) AS
/**************************************************************************************************************
   NAME:       	SP_NOMBRE_PROCEDIMIENTO
   PURPOSE		ACCION QUE REALIZA EL PROCEDURE

   REVISIONS:
   Ver          Date           Author                               Description
   ---------    ----------     -------------------                  ----------------------------------------------
   X.X.X-X.X    DD/MM/YYYY     AUTOR DEL PROCEDURE       			1. DESCRIPCIÓN SIMPLE PARA LA VERSIÓN
   
   SE DEBEN AGREGAR TODAS LAS VERSIONES QUE Y NOMBRES DE LOS QUE TRABAJEN EN EL 
***************************************************************************************************************/
    

BEGIN
    OUT_ESTADO := 0;
    OUT_GLOSA := 'SP_NOMBRE_PROCEDIMIENTO ejecutado exitosamente';


    OPEN OUT_NOMBRE_CURSOR FOR
        SELECT
            CAMPO_1,
            CAMPO_2,
            CAMPO_3,
            CAMPO_4,
            CAMPO_5,
            CAMPO_6            
        FROM ESQUEMA.TABLA WHERE CAMPO = IN_DATO_1;
  

    EXCEPTION
        WHEN OTHERS THEN
            OUT_ESTADO := -1;
            OUT_GLOSA := ESQUEMA.FN_GET_GLOSA_ERROR;

END SP_NOMBRE_PROCEDIMIENTO;

-- PROCEDIMIENTO ELIMINA DATOS


CREATE OR REPLACE PROCEDURE SP_NOMBRE_PROCEDIMIENTO(
  IN_DATO_1 IN NUMBER,
  OUT_GLOSA OUT VARCHAR2,
  OUT_ESTADO OUT NUMBER
) AS


/**************************************************************************************************************
   NAME:       	SP_NOMBRE_PROCEDIMIENTO
   PURPOSE		ACCION QUE REALIZA EL PROCEDURE

   REVISIONS:
   Ver          Date           Author                               Description
   ---------    ----------     -------------------                  ----------------------------------------------
   X.X.X-X.X    DD/MM/YYYY     AUTOR DEL PROCEDURE       			1. DESCRIPCIÓN SIMPLE PARA LA VERSIÓN
   
   SE DEBEN AGREGAR TODAS LAS VERSIONES QUE Y NOMBRES DE LOS QUE TRABAJEN EN EL 
***************************************************************************************************************/

BEGIN
    OUT_ESTADO := 0;
    OUT_GLOSA := 'SP_NOMBRE_PROCEDIMIENTO ejecutado exitosamente';

    DELETE FROM ESQUEMA.TABLA WHERE ID = IN_DATO_1;

    EXCEPTION
        WHEN OTHERS THEN
            OUT_ESTADO := -1;
            OUT_GLOSA := ESQUEMA.FN_GET_GLOSA_ERROR;

END SP_NOMBRE_PROCEDIMIENTO;