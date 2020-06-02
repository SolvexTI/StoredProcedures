/**************************************************************************************************************
   NAME:        Secuencias
   PURPOSE		Gestiona secuencias de la base de datos Solvexti

   REVISIONS:
   Ver          Date           Author                               Description
   ---------    ----------     -------------------                  ----------------------------------------------
   1.1.1-1.1    02/06/2020     Alejandro Del Pino       			1. Creacion de Secuencias
   
***************************************************************************************************************/
/**************************************ZONA ELIMINACION SECUENCIAS*********************************************/

 DROP SEQUENCE ID_ACTIVIDAD_SEQ;
 DROP SEQUENCE ID_BOLETA_SEQ;
 DROP SEQUENCE ID_CLIENTE_SEQ;
 DROP SEQUENCE ID_CONTRATO_SEQ;
 DROP SEQUENCE ID_INCIDENTE_SEQ;
 DROP SEQUENCE ID_MODIFICACION;
 DROP SEQUENCE ID_PUNTO_MEJORABLE_SEQ;
 DROP SEQUENCE ID_ROL_SEQ;
 DROP SEQUENCE ID_TIPO_ACTIVIDAD_SEQ;
 DROP SEQUENCE ID_TRABAJADOR_SEQ;
 DROP SEQUENCE ID_USUARIO_SEQ;
 DROP SEQUENCE ID_NOTIFICACION_SEQ;
 DROP SEQUENCE ID_PLAN_SEQ;
 DROP SEQUENCE ID_PROFESIONAL_SEQ;
 
 /**************************************ZONA CREACION SECUENCIAS*********************************************/
 
 CREATE SEQUENCE ID_ACTIVIDAD_SEQ START WITH 1;
 CREATE SEQUENCE ID_BOLETA_SEQ START WITH 1;
 CREATE SEQUENCE ID_CLIENTE_SEQ START WITH 1;
 CREATE SEQUENCE ID_CONTRATO_SEQ START WITH 1;
 CREATE SEQUENCE ID_INCIDENTE_SEQ START WITH 1;
 CREATE SEQUENCE ID_MODIFICACION START WITH 1;
 CREATE SEQUENCE ID_PUNTO_MEJORABLE_SEQ START WITH 1;
 CREATE SEQUENCE ID_ROL_SEQ START WITH 1;
 CREATE SEQUENCE ID_TIPO_ACTIVIDAD_SEQ START WITH 1;
 CREATE SEQUENCE ID_TRABAJADOR_SEQ START WITH 1;
 CREATE SEQUENCE ID_USUARIO_SEQ START WITH 1;
 CREATE SEQUENCE ID_NOTIFICACION_SEQ START WITH 1;
 CREATE SEQUENCE ID_PLAN_SEQ START WITH 1;
 CREATE SEQUENCE ID_PROFESIONAL_SEQ START WITH 1;


    
