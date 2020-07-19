CREATE OR REPLACE PACKAGE pkg_incidente AS

  TYPE tp_incidente IS RECORD (
    id_incidente  NUMBER(38),
    fecha         NUMBER(38),
    descripcion   VARCHAR2(600)
  );

  TYPE tb_incidente IS TABLE OF tp_incidente;
  TYPE c_incidente IS REF CURSOR RETURN incidente%ROWTYPE;

  PROCEDURE pr_obtener_incidente(p_id_incidente incidente.id_incidente%TYPE, p_incidente OUT tp_incidente);
  PROCEDURE pr_obtener_incidente_trabajador(p_id_trabajador trabajador.id_trabajador%TYPE, p_cursor_incidente OUT c_incidente);
  PROCEDURE pr_obtener_incidente_cliente(p_id_cliente cliente.id_cliente%TYPE, p_cursor_incidente OUT c_incidente);
  PROCEDURE pr_insertar_incidente(
            p_fecha incidente.fecha%TYPE,
            p_descripcion incidente.descripcion%TYPE,
            p_id_trabajador trabajador.id_trabajador%TYPE,
            p_incidente OUT tp_incidente);
  PROCEDURE pr_eliminar_incidente(p_id_incidente incidente.id_incidente%TYPE);
  PROCEDURE pr_modificar_incidente(
            p_id_incidente incidente.id_incidente%TYPE,
            p_fecha incidente.fecha%TYPE,
            p_descripcion incidente.descripcion%TYPE,
            p_incidente OUT tp_incidente);


END;
/


CREATE OR REPLACE PACKAGE BODY pkg_incidente AS

  PROCEDURE pr_obtener_incidente(p_id_incidente incidente.id_incidente%TYPE, p_incidente OUT tp_incidente) AS
  /**************************************************************************************************************
     NAME:       	pr_obtener_incidente
     PURPOSE		Obtiene datos de incidente segun su ID y devuelve tipo tp_incidente

     REVISIONS:
     Ver          Date           Author                               Description
     ---------    ----------     -------------------                  ----------------------------------------------
     1.1           04/06/2020     Alejandro Del Pino       		       	1. Creación Procedimiento

  ***************************************************************************************************************/
  BEGIN
    SELECT id_incidente, fecha, descripcion
    INTO p_incidente.id_incidente, p_incidente.fecha, p_incidente.descripcion
    FROM incidente
    WHERE id_incidente = p_id_incidente;
  END;
  PROCEDURE pr_obtener_incidente_trabajador(p_id_trabajador trabajador.id_trabajador%TYPE, p_cursor_incidente OUT c_incidente) AS
  /**************************************************************************************************************
     NAME:      pr_obtener_incidente_trabajador
     PURPOSE		Obtiene todos los incidentes segun trabajador y devuelve tipo tabla tb_incidente

     REVISIONS:
     Ver          Date           Author                               Description
     ---------    ----------     -------------------                  ----------------------------------------------
     1.1           04/06/2020     Alejandro Del Pino       		       	1. Creación Procedimiento

  ***************************************************************************************************************/

  BEGIN
    OPEN p_cursor_incidente FOR
    SELECT id_incidente, fecha, descripcion
    FROM incidente JOIN trabajador_incidente USING(id_incidente)
    WHERE id_trabajador = p_id_trabajador;
  END;
  PROCEDURE pr_obtener_incidente_cliente(p_id_cliente cliente.id_cliente%TYPE, p_cursor_incidente OUT c_incidente) AS
  /**************************************************************************************************************
     NAME:      pr_obtener_incidente_cliente
     PURPOSE		Obtiene todos los incidentes segun cliente y devuelve tipo tabla tb_incidente

     REVISIONS:
     Ver          Date           Author                               Description
     ---------    ----------     -------------------                  ----------------------------------------------
     1.1           04/06/2020     Alejandro Del Pino       		       	1. Creación Procedimiento

  ***************************************************************************************************************/
  BEGIN
    OPEN p_cursor_incidente FOR
    SELECT id_incidente, fecha, descripcion
    FROM incidente JOIN trabajador_incidente USING(id_incidente) JOIN trabajador USING(id_trabajador)
    WHERE id_cliente = p_id_cliente;
  END;
  PROCEDURE pr_insertar_incidente(
            p_fecha incidente.fecha%TYPE,
            p_descripcion incidente.descripcion%TYPE,
            p_id_trabajador trabajador.id_trabajador%TYPE,
            p_incidente OUT tp_incidente) AS
  /**************************************************************************************************************
     NAME:      pr_insertar_incidente
     PURPOSE	  Inserta datos de incidente y devuelve tipo tp_incidente

     REVISIONS:
     Ver          Date           Author                               Description
     ---------    ----------     -------------------                  ----------------------------------------------
     1.1           04/06/2020     Alejandro Del Pino       		       	1. Creación Procedimiento

  ***************************************************************************************************************/
  BEGIN
    INSERT INTO incidente (id_incidente, fecha, descripcion)
    VALUES(id_incidente_seq.NEXTVAL, p_fecha, p_descripcion);
    INSERT INTO trabajador_incidente VALUES(p_id_trabajador, id_incidente_seq.CURRVAL);
    pr_obtener_incidente(id_incidente_seq.CURRVAL, p_incidente);

  END;
  PROCEDURE pr_eliminar_incidente(p_id_incidente incidente.id_incidente%TYPE) AS
  /**************************************************************************************************************
     NAME:    pr_eliminar_incidente
     PURPOSE	Elimina datos de incidente segun su ID

     REVISIONS:
     Ver          Date           Author                               Description
     ---------    ----------     -------------------                  ----------------------------------------------
     1.1           04/06/2020     Alejandro Del Pino       		       	1. Creación Procedimiento

  ***************************************************************************************************************/
  BEGIN
    DELETE FROM incidente WHERE id_incidente = p_id_incidente;
  END;
  PROCEDURE pr_modificar_incidente(
            p_id_incidente incidente.id_incidente%TYPE,
            p_fecha incidente.fecha%TYPE,
            p_descripcion incidente.descripcion%TYPE,
            p_incidente OUT tp_incidente) AS
  /**************************************************************************************************************
     NAME:      pr_modificar_incidente
     PURPOSE	  Modifica datos de incidente

     REVISIONS:
     Ver          Date           Author                               Description
     ---------    ----------     -------------------                  ----------------------------------------------
     1.1           04/06/2020     Alejandro Del Pino       		       	1. Creación Procedimiento

  ***************************************************************************************************************/
  BEGIN
    UPDATE incidente
    SET fecha = p_fecha,
        descripcion = p_descripcion
    WHERE id_incidente = p_id_incidente;
  END;
END;
/

CREATE OR REPLACE PACKAGE pkg_profesional AS

  TYPE tp_profesional IS RECORD (
    id_usuario       NUMBER(38),
    username         VARCHAR2(80),
    password         VARCHAR2(40),
    telefono         VARCHAR2(12),
    correo           VARCHAR2(80),
    id_profesional   NUMBER(38),
    nombre           VARCHAR2(120),
    apellido_paterno VARCHAR2(80),
    apellido_materno VARCHAR2(80),
    rut              NUMBER(38),
    dv               VARCHAR2(1)
  );

  TYPE tb_profesional IS TABLE OF tp_profesional;
  TYPE c_profesional IS REF CURSOR RETURN tp_profesional;

  PROCEDURE pr_obtener_profesional(p_id_usuario IN profesional.id_usuario%TYPE,p_profesional OUT tp_profesional);
  PROCEDURE pr_obtener_profesionales(p_cursor_profesional OUT c_profesional);
  PROCEDURE pr_insertar_profesional(
      p_username IN usuario.username%TYPE,
      p_password IN usuario.password%TYPE,
      p_telefono IN usuario.telefono%TYPE,
      p_correo IN usuario.correo%TYPE,
      p_nombre IN profesional.nombre%TYPE,
      p_apellido_paterno IN profesional.apellido_paterno%TYPE,
      p_apellido_materno IN profesional.apellido_materno%TYPE,
      p_rut IN profesional.rut%TYPE,
      p_dv IN profesional.dv%TYPE,
      p_profesional OUT tp_profesional);
  PROCEDURE pr_modificar_profesional(p_profesional OUT tp_profesional);
  PROCEDURE pr_eliminar_profesional(p_profesional IN tp_profesional);

END pkg_profesional;
/

CREATE OR REPLACE PACKAGE BODY pkg_profesional AS

  PROCEDURE pr_obtener_profesional (p_id_usuario IN profesional.id_usuario%TYPE, p_profesional OUT tp_profesional) AS
/**************************************************************************************************************
   NAME:       	pr_obtener_profesional
   PURPOSE		Obtiene datos de profesional segun su ID de usuario

   REVISIONS:
   Ver          Date           Author                               Description
   ---------    ----------     -------------------                  ----------------------------------------------
   1.1           04/06/2020     Alejandro Del Pino       		       	1. Creación Procedimiento

***************************************************************************************************************/
  BEGIN
    SELECT username,password,telefono,correo,
    id_profesional,nombre,apellido_paterno,apellido_materno,rut,dv
    INTO p_profesional.username,p_profesional.password,p_profesional.telefono,p_profesional.correo,
    p_profesional.id_profesional,p_profesional.nombre,p_profesional.apellido_paterno,p_profesional.apellido_materno,p_profesional.rut,p_profesional.dv
    FROM usuario JOIN profesional USING(id_usuario)
    WHERE id_usuario = p_id_usuario;

  EXCEPTION
    WHEN NO_DATA_FOUND THEN
      NULL;
    WHEN TOO_MANY_ROWS THEN
      NULL;
  END;

  PROCEDURE pr_obtener_profesionales(p_cursor_profesional OUT c_profesional) AS
  /**************************************************************************************************************
     NAME:      pr_obtener_profesionales
     PURPOSE		Lista datos de todos los profesionales junto con los datos de usuario

     REVISIONS:
     Ver          Date           Author                               Description
     ---------    ----------     -------------------                  ----------------------------------------------
     1.1           14/06/2020     Alejandro Del Pino       		       	1. Creación Procedimiento

  ***************************************************************************************************************/
  BEGIN

    OPEN p_cursor_profesional FOR
    SELECT id_usuario,username,password,telefono,correo,id_profesional,nombre,apellido_paterno,apellido_materno,rut,dv
    FROM usuario u JOIN profesional p USING(id_usuario);

  END;

  PROCEDURE pr_insertar_profesional(
      p_username IN usuario.username%TYPE,
      p_password IN usuario.password%TYPE,
      p_telefono IN usuario.telefono%TYPE,
      p_correo IN usuario.correo%TYPE,
      p_nombre IN profesional.nombre%TYPE,
      p_apellido_paterno IN profesional.apellido_paterno%TYPE,
      p_apellido_materno IN profesional.apellido_materno%TYPE,
      p_rut IN profesional.rut%TYPE,
      p_dv IN profesional.dv%TYPE,
      p_profesional OUT tp_profesional) AS
/**************************************************************************************************************
   NAME:       	pr_insertar_profesional
   PURPOSE		Inserta datos de profesional y usuario

   REVISIONS:
   Ver          Date           Author                               Description
   ---------    ----------     -------------------                  ----------------------------------------------
   1.1           04/06/2020     Alejandro Del Pino       		       	1. Creación Procedimiento

***************************************************************************************************************/
    v_error_code NUMBER(10);
  BEGIN
    BEGIN
      v_error_code := 0;
      INSERT INTO usuario (id_usuario,username, password, telefono, correo, id_rol)
      VALUES(id_usuario_seq.NEXTVAL, p_username, p_password, p_telefono, p_correo, 2);

    EXCEPTION
      WHEN DUP_VAL_ON_INDEX THEN
        v_error_code := SQLCODE;
    END;
    if v_error_code = 0 THEN
      INSERT INTO profesional (id_usuario, id_profesional, nombre, apellido_paterno, apellido_materno, rut, dv)
      VALUES(id_usuario_seq.CURRVAL, id_profesional_seq.NEXTVAL, p_nombre, p_apellido_paterno, p_apellido_materno, p_rut, p_dv);
      pr_obtener_profesional(id_usuario_seq.CURRVAL,p_profesional);
    end if;

  END;

  PROCEDURE pr_modificar_profesional(p_profesional OUT tp_profesional) AS
  BEGIN
    BEGIN
        UPDATE usuario
        SET username = p_profesional.username,
            password = p_profesional.password,
            telefono = p_profesional.telefono,
            correo = p_profesional.correo
            WHERE id_usuario = p_profesional.id_usuario;
        EXCEPTION
          WHEN DUP_VAL_ON_INDEX THEN
            NULL;

    END;
    UPDATE profesional
    SET nombre = p_profesional.nombre,
        apellido_paterno = p_profesional.apellido_paterno,
        apellido_materno = p_profesional.apellido_materno,
        rut = p_profesional.rut,
        dv = p_profesional.dv
    WHERE id_profesional = p_profesional.id_profesional;
  END;

  PROCEDURE pr_eliminar_profesional(p_profesional IN tp_profesional) AS
  /**************************************************************************************************************
     NAME:       	pr_eliminar_profesional
       PURPOSE		Elimina datos de profesional y usuario

     REVISIONS:
     Ver          Date           Author                               Description
     ---------    ----------     -------------------                  ----------------------------------------------
     1.1           04/06/2020     Alejandro Del Pino       		       	1. Creación Procedimiento

  ***************************************************************************************************************/

  BEGIN
    DELETE FROM profesional WHERE id_usuario = p_profesional.id_usuario;
    DELETE FROM usuario WHERE id_usuario =  p_profesional.id_usuario;
  END;
END pkg_profesional;
/
