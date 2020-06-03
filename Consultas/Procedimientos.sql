CREATE OR REPLACE PROCEDURE pr_insertar_usuario (
  p_username in usuario.username%TYPE,
  p_password in usuario.password%TYPE,
  p_telefono in usuario.telefono%TYPE,
  p_correo in usuario.correo%TYPE,
  p_id_rol in usuario.id_rol%TYPE
)
AS
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
  INSERT INTO usuario (id_usuario,username, password, telefono, correo, id_rol)
  values(id_usuario_seq.NEXTVAL, p_username, p_password, p_telefono, p_correo, p_id_rol);
END;
/



CREATE OR REPLACE PROCEDURE pr_insertar_profesional (
  p_nombre in profesional.nombre%TYPE,
  p_apellido_paterno in profesional.apellido_paterno%TYPE,
  p_apellido_materno in profesional.apellido_materno%TYPE,
  p_rut in profesional.rut%TYPE,
  p_dv in profesional.dv%TYPE
)
AS
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
   INSERT INTO profesional (id_usuario, id_profesional, nombre, apellido_paterno, apellido_materno, rut, dv)
   VALUES(id_usuario_seq.CURRVAL, id_profesional_seq.NEXTVAL, p_nombre, p_apellido_paterno, p_apellido_materno, p_rut, p_dv);
END;
/

CREATE OR REPLACE PROCEDURE pr_insertar_cliente (
 p_nombre in cliente.nombre%TYPE,
 p_direccion in cliente.direccion%TYPE,
 p_rubro in cliente.rubro%TYPE,
 p_id_profesional in cliente.id_profesional%TYPE
)
AS
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
  INSERT INTO cliente ( id_usuario, id_cliente,  nombre,  direccion,  rubro,  id_profesional)
  VALUES( id_usuario_seq.CURRVAL, id_cliente_seq.NEXTVAL, p_nombre, p_direccion, p_rubro, p_id_profesional);
END;
/
