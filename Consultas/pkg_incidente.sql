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
