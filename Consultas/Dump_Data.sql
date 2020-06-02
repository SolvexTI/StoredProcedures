/**************************************************************************************************************
   NAME:        DUMP_DATA
   PURPOSE		Ingreso de datos para pruebas del sistema 

   REVISIONS:
   Ver          Date           Author                               Description
   ---------    ----------     -------------------                  ----------------------------------------------
   1.1.1-1.1    02/06/2020     Alejandro Del Pino       			1. Insercion datos tablas
   
***************************************************************************************************************/
DELETE USUARIO WHERE 1 = 1;
DELETE ROL WHERE 1 = 1;

/************************************INSERSION TABLA ROL*******************************************************/

INSERT INTO ROL VALUES(ID_ROL_SEQ.NEXTVAL, 'Administrador');
INSERT INTO ROL VALUES(ID_ROL_SEQ.NEXTVAL, 'Profesional');
INSERT INTO ROL VALUES(ID_ROL_SEQ.NEXTVAL, 'Cliente');


/************************************INSERSION TABLA ROL*******************************************************/


INSERT INTO USUARIO VALUES(ID_USUARIO_SEQ.NEXTVAL, 'AL.DELPINO', 'AL.DELPINO', '+56942035153', 'AL.DELPINO@ALUMNOS.DUOC.CL', 1);
INSERT INTO USUARIO VALUES(ID_USUARIO_SEQ.NEXTVAL, 'CA.DELPINO', 'CA.DELPINO', '+56942035153', 'CA.DELPINO@ALUMNOS.DUOC.CL', 2);
INSERT INTO USUARIO VALUES(ID_USUARIO_SEQ.NEXTVAL, 'ES.DELPINO', 'ES.DELPINO', '+56942035153', 'ES.DELPINO@ALUMNOS.DUOC.CL', 3);

/************************************INSERSION TABLA PROFESIONAL***************************************************/

INSERT INTO PROFESIONAL VALUES (2, ID_PROFESIONAL_SEQ.NEXTVAL, 'CARLA', 'DEL PINO', 'ACEVEDO', 19952352,'K');

/************************************INSERSION TABLA CLIENTE*******************************************************/

INSERT INTO CLIENTE VALUES (3, ID_CLIENTE_SEQ.NEXTVAL, 'DUOC UC', 'ANTONIO VARAS #666', 'EDUCACION', 1);



