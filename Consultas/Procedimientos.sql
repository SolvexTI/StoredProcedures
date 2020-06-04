/*CREATE OR REPLACE PROCEDURE pr_insertar_usuario (
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
/*
BEGIN
  INSERT INTO usuario (id_usuario,username, password, telefono, correo, id_rol)
  values(id_usuario_seq.NEXTVAL, p_username, p_password, p_telefono, p_correo, p_id_rol);
END;
/
*/
CREATE OR REPLACE TYPE tp_profesional as object(
  id_usuario NUMBER(38),
  username   VARCHAR2(80),
  password   VARCHAR2(40),
  telefono   VARCHAR2(12),
  correo     VARCHAR2(80),
  id_rol     NUMBER(38),
  id_profesional   NUMBER(38),
  nombre           VARCHAR2(120),
  apellido_paterno VARCHAR2(80),
  apellido_materno VARCHAR2(80),
  rut              NUMBER(38),
  dv               VARCHAR2(1)
);
/

CREATE OR REPLACE PROCEDURE pr_insertar_profesional (
  p_username in usuario.username%TYPE,
  p_password in usuario.password%TYPE,
  p_telefono in usuario.telefono%TYPE,
  p_correo in usuario.correo%TYPE,
  p_nombre in profesional.nombre%TYPE,
  p_apellido_paterno in profesional.apellido_paterno%TYPE,
  p_apellido_materno in profesional.apellido_materno%TYPE,
  p_rut in profesional.rut%TYPE,
  p_dv in profesional.dv%TYPE,
  p_profesional out tp_profesional
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
  values(id_usuario_seq.NEXTVAL, p_username, p_password, p_telefono, p_correo, 2);

  INSERT INTO profesional (id_usuario, id_profesional, nombre, apellido_paterno, apellido_materno, rut, dv)
  VALUES(id_usuario_seq.CURRVAL, id_profesional_seq.NEXTVAL, p_nombre, p_apellido_paterno, p_apellido_materno, p_rut, p_dv);

  p_profesional := fn_obtener_profesional(id_usuario_seq.CURRVAL);

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

CREATE OR REPLACE FUNCTION fn_obtener_usuario ( p_username in usuario.username%TYPE) RETURN usuario%rowtype
AS
    v_usuario usuario%rowtype;
BEGIN
  SELECT * INTO v_usuario FROM usuario WHERE username LIKE p_username;
  RETURN v_usuario;
END;
/
CREATE OR REPLACE FUNCTION fn_obtener_cliente ( p_id_usuario in usuario.id_usuario%TYPE) RETURN cliente%rowtype
AS
    v_cliente cliente%rowtype;
BEGIN
  SELECT * INTO v_cliente FROM cliente WHERE id_usuario = p_id_usuario;
  RETURN v_cliente;
END;
/
CREATE OR REPLACE FUNCTION fn_obtener_profesional ( p_id_usuario in usuario.id_usuario%TYPE) RETURN tp_profesional
AS
    v_profesional tp_profesional;
BEGIN
  SELECT id_usuario,username,password,telefono,correo,id_rol,id_profesional,nombre,apellido_paterno,apellido_materno,rut,dv
  INTO v_profesional.id_usuario,v_profesional.username,v_profesional.password,v_profesional.telefono,v_profesional.correo,v_profesional.id_rol,v_profesional.id_profesional,v_profesional.nombre,v_profesional.apellido_paterno,v_profesional.apellido_materno,v_profesional.rut,v_profesional.dv
  from USUARIO u join PROFESIONAL p using (id_usuario)
  WHERE id_usuario = p_id_usuario;
  RETURN v_profesional;
END;
/
CREATE OR REPLACE PROCEDURE pr_eliminar_usuario (p_id_usuario in usuario.id_usuario%TYPE, p_id_rol usuario.id_rol%TYPE)
AS
BEGIN
  IF p_id_rol = 2 THEN
   DELETE FROM profesional WHERE id_usuario = p_id_usuario;
  ELSIF p_id_rol = 3 THEN
    DELETE FROM cliente WHERE id_usuario = p_id_usuario;
  END IF;
  DELETE FROM usuario WHERE id_usuario = p_id_usuario;
END;
/

CREATE OR REPLACE PROCEDURE pr_modificar_usuario (
p_id_usuario in usuario.id_usuario%TYPE,
p_nuevo_valor usuario.correo%TYPE,
p_columna in usuario.correo%TYPE)
AS
BEGIN
  IF UPPER(p_columna) = 'USERNAME' THEN
    UPDATE usuario SET username = p_nuevo_valor WHERE id_usuario = p_id_usuario;
  ELSIF UPPER(p_columna) = 'PASSWORD' THEN
    UPDATE usuario SET password = p_nuevo_valor WHERE id_usuario = p_id_usuario;
  ELSIF UPPER(p_columna) = 'TELEFONO' THEN
    UPDATE usuario SET telefono = p_nuevo_valor WHERE id_usuario = p_id_usuario;
  ELSIF UPPER(p_columna) = 'CORREO' THEN
    UPDATE usuario SET correo = p_nuevo_valor WHERE id_usuario = p_id_usuario;
  ELSE
    UPDATE usuario SET id_rol =  TO_NUMBER(p_nuevo_valor) WHERE id_usuario = p_id_usuario;
  END IF;
END;
/
CREATE OR REPLACE PROCEDURE pr_modificar_profesional (
p_id_usuario in usuario.id_usuario%TYPE,
p_nuevo_valor usuario.correo%TYPE,
p_columna in usuario.correo%TYPE)
AS
BEGIN
  IF UPPER(p_columna) = 'NOMBRE' THEN
    UPDATE profesional SET nombre = p_nuevo_valor WHERE id_usuario = p_id_usuario;
  ELSIF UPPER(p_columna) = 'APELLIDO_PATERNO' THEN
    UPDATE profesional SET apellido_paterno = p_nuevo_valor WHERE id_usuario = p_id_usuario;
  ELSIF UPPER(p_columna) = 'APELLIDO_MATERNO' THEN
    UPDATE profesional SET apellido_materno = p_nuevo_valor WHERE id_usuario = p_id_usuario;
  ELSIF UPPER(p_columna) = 'RUT' THEN
    UPDATE profesional SET rut = TO_NUMBER(p_nuevo_valor) WHERE id_usuario = p_id_usuario;
  ELSIF UPPER(p_columna) = 'DV' THEN
    UPDATE profesional SET dv = p_nuevo_valor WHERE id_usuario = p_id_usuario;
  END IF;
END;
/

CREATE OR REPLACE PROCEDURE pr_modificar_cliente (
p_id_usuario in usuario.id_usuario%TYPE,
p_nuevo_valor usuario.correo%TYPE,
p_columna in usuario.correo%TYPE)
AS
BEGIN
  IF UPPER(p_columna) = 'NOMBRE' THEN
    UPDATE cliente SET nombre = p_nuevo_valor WHERE id_usuario = p_id_usuario;
  ELSIF UPPER(p_columna) = 'DIRECCION' THEN
    UPDATE cliente SET direccion = p_nuevo_valor WHERE id_usuario = p_id_usuario;
  ELSIF UPPER(p_columna) = 'RUBRO' THEN
    UPDATE cliente SET rubro = p_nuevo_valor WHERE id_usuario = p_id_usuario;
  END IF;
END;
/




CREATE OR REPLACE PROCEDURE pr_insertar_notificacion(
  p_mensaje in notificacion.mensaje%TYPE,
  p_hora in notificacion.hora%TYPE,
  p_id_usuario in notificacion.id_usuario%TYPE
)
AS
BEGIN
  INSERT INTO notificacion (id_notificacion, mensaje, hora, id_usuario)
  VALUES (id_notificacion_seq.NEXTVAL, p_mensaje, p_hora, p_id_usuario);
END PR_INSERTAR_NOTIFICACIOn;
/

/*******************************************ACTIVIDADES*******************************************************/


create or replace type tp_actividad as object (
  id_actividad NUMBER(38),
  nombre VARCHAR2(100),
  descripcion VARCHAR2(600),
  estado CHAR(1),
  fecha_inicio DATE,
  resultado VARCHAR2(600),
  cantidad_modificacion NUMBER(38),
  id_profesional NUMBER(38),
  id_cliente NUMBER(38),
  id_tipo_actividad NUMBER(38)
);
/

CREATE OR REPLACE TYPE tb_actividad as table of tp_actividad;
/

CREATE OR REPLACE PROCEDURE pr_insertar_actividad (
  p_nombre in actividad.nombre%TYPE,
  p_descripcion in actividad.descripcion%TYPE,
  p_estado in actividad.estado%TYPE,
  p_fecha_inicio in actividad.fecha_inicio%TYPE,
  p_resultado in actividad.resultado%TYPE,
  p_cantidad_modificaciones in actividad.cantidad_modificaciones%TYPE,
  p_id_profesional in actividad.id_profesional%TYPE,
  p_id_cliente in actividad.id_cliente%TYPE,
  p_id_tipo_actividad in actividad.id_tipo_actividad%TYPE
)
AS
BEGIN
  INSERT INTO actividad ( id_actividad,nombre,descripcion, estado, fecha_inicio, resultado, cantidad_modificaciones, id_profesional, id_cliente, id_tipo_actividad)
  VALUES( id_actividad_seq.NEXTVAL,p_nombre,p_descripcion,p_estado,p_fecha_inicio,p_resultado,p_cantidad_modificaciones,p_id_profesional,p_id_cliente,p_id_tipo_actividad);
END;
/

CREATE OR REPLACE FUNCTION fn_obtener_actividad_por_columna (
  p_valor_buscado usuario.correo%TYPE,
  p_columna in usuario.correo%TYPE) return tb_actividad
AS
  v_actividad tb_actividad;
BEGIN
  IF    UPPER(p_columna) = 'ID_ACTIVIDAD' THEN
    SELECT id_actividad,nombre,descripcion, estado, fecha_inicio, resultado, cantidad_modificaciones, id_profesional, id_cliente, id_tipo_actividad
    BULK COLLECT INTO v_actividad
    FROM actividad
    WHERE id_actividad = TO_NUMBER(p_valor_buscado);
/*
  ELSIF UPPER(p_columna) = 'ID_PROFESIONAL' THEN
    SELECT * BULK COLLECT INTO v_actividad FROM actividad WHERE id_profesional = TO_NUMBER(p_valor_buscado);
  ELSIF UPPER(p_columna) = 'ID_CLIENTE' THEN
    SELECT * BULK COLLECT INTO v_actividad FROM actividad WHERE id_cliente = TO_NUMBER(p_valor_buscado);
  ELSIF UPPER(p_columna) = 'NOMBRE' THEN
    SELECT * BULK COLLECT INTO v_actividad FROM actividad WHERE nombre LIKE p_valor_buscado;
*/
  END IF;
  RETURN v_actividad;
END;
/
