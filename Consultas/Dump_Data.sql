/**************************************************************************************************************
   NAME:        DUMP_DATA
   PURPOSE		Ingreso de datos para pruebas del sistema

   REVISIONS:
   Ver          Date           Author                               Description
   ---------    ----------     -------------------                  ----------------------------------------------
   1.1.1-1.1    02/06/2020     Alejandro Del Pino       			1. Insercion datos tablas

***************************************************************************************************************/

DELETE CLIENTE WHERE 1 = 1;
DELETE PROFESIONAL WHERE 1 = 1;
DELETE USUARIO WHERE 1 = 1;
DELETE ROL WHERE 1 = 1;

/************************************INSERSION TABLA ROL*******************************************************/

INSERT INTO ROL VALUES(ID_ROL_SEQ.NEXTVAL, 'Administrador');
INSERT INTO ROL VALUES(ID_ROL_SEQ.NEXTVAL, 'Profesional');
INSERT INTO ROL VALUES(ID_ROL_SEQ.NEXTVAL, 'Cliente');


/************************************INSERSION TABLA ROL*******************************************************/


INSERT INTO USUARIO VALUES(ID_USUARIO_SEQ.NEXTVAL, 'AL.DELPINO', 'AL.DELPINO', '+56942035153', 'AL.DELPINO@ALUMNOS.DUOC.CL', 1);


    
/************************************INSERSION TABLA PROFESIONAL***************************************************/
INSERT INTO USUARIO VALUES(ID_USUARIO_SEQ.NEXTVAL, 'CA.DELPINO', 'CA.DELPINO', '+56942035153', 'CA.DELPINO@ALUMNOS.DUOC.CL', 2);
INSERT INTO PROFESIONAL VALUES (ID_USUARIO_SEQ.CURRVAL, ID_PROFESIONAL_SEQ.NEXTVAL, 'CARLA', 'DEL PINO', 'ACEVEDO', 19952352,'K');

/************************************INSERSION TABLA CLIENTE*******************************************************/
INSERT INTO USUARIO VALUES(ID_USUARIO_SEQ.NEXTVAL, 'ES.DELPINO', 'ES.DELPINO', '+56942035153', 'ES.DELPINO@ALUMNOS.DUOC.CL', 3);
INSERT INTO CLIENTE VALUES (ID_USUARIO_SEQ.CURRVAL, ID_CLIENTE_SEQ.NEXTVAL, 'DUOC UC', 'ANTONIO VARAS #666', 'EDUCACION', 1);

/************************************INSERSION TABLA TIPO_ACTIVIDAD*************************************************/

INSERT INTO TIPO_ACTIVIDAD VALUES(ID_TIPO_ACTIVIDAD_SEQ.NEXTVAL, 'Asesoria general');
INSERT INTO TIPO_ACTIVIDAD VALUES(ID_TIPO_ACTIVIDAD_SEQ.NEXTVAL, 'Asesoria por accidente');
INSERT INTO TIPO_ACTIVIDAD VALUES(ID_TIPO_ACTIVIDAD_SEQ.NEXTVAL, 'Asesoria por multa');
INSERT INTO TIPO_ACTIVIDAD VALUES(ID_TIPO_ACTIVIDAD_SEQ.NEXTVAL, 'Capacitacion');
INSERT INTO TIPO_ACTIVIDAD VALUES(ID_TIPO_ACTIVIDAD_SEQ.NEXTVAL, 'Revision Documentacion');
INSERT INTO TIPO_ACTIVIDAD VALUES(ID_TIPO_ACTIVIDAD_SEQ.NEXTVAL, 'Llamada telefonica');


INSERT INTO ACTIVIDAD 
VALUES (id_actividad_seq.NEXTVAL,'Asesoria General', 'Asesoria General', 'A',TO_DATE('05/06/2020', 'dd/mm/yyyy'), 'Sin resultado aun', 0, 1, 1, 1);