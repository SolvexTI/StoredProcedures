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

  FUNCTION fn_obtener_profesional(p_id_usuario usuario.id_usuario%TYPE) RETURN tp_profesional;
  PROCEDURE pr_insertar_profesional(
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
  );
  PROCEDURE pr_eliminar_profesional(p_id_usuario in usuario.id_usuario%TYPE);

END pkg_profesional;
/


CREATE OR REPLACE PACKAGE BODY pkg_profesional AS

  FUNCTION fn_obtener_profesional (p_id_usuario usuario.id_usuario%TYPE) RETURN tp_profesional AS
    r_profesional tp_profesional;
  BEGIN
    SELECT id_usuario,username,password,telefono,correo,id_profesional,nombre,apellido_paterno,apellido_materno,rut,dv
    INTO r_profesional.id_usuario,r_profesional.username,r_profesional.password,r_profesional.telefono,r_profesional.correo,r_profesional.id_profesional,r_profesional.nombre,r_profesional.apellido_paterno,r_profesional.apellido_materno,r_profesional.rut,r_profesional.dv
    FROM USUARIO u join PROFESIONAL p using (id_usuario)
    WHERE id_usuario = p_id_usuario;
    RETURN r_profesional;
  END;

  PROCEDURE pr_insertar_profesional(
    p_username in usuario.username%TYPE,
    p_password in usuario.password%TYPE,
    p_telefono in usuario.telefono%TYPE,
    p_correo in usuario.correo%TYPE,
    p_nombre in profesional.nombre%TYPE,
    p_apellido_paterno in profesional.apellido_paterno%TYPE,
    p_apellido_materno in profesional.apellido_materno%TYPE,
    p_rut in profesional.rut%TYPE,
    p_dv in profesional.dv%TYPE,
    p_profesional out tp_profesional) AS
  BEGIN

    INSERT INTO usuario (id_usuario,username, password, telefono, correo, id_rol)
    VALUES(id_usuario_seq.NEXTVAL, p_username, p_password, p_telefono, p_correo, 2);

    INSERT INTO profesional (id_usuario, id_profesional, nombre, apellido_paterno, apellido_materno, rut, dv)
    VALUES(id_usuario_seq.CURRVAL, id_profesional_seq.NEXTVAL, p_nombre, p_apellido_paterno, p_apellido_materno, p_rut, p_dv);

    p_profesional := fn_obtener_profesional(id_usuario_seq.CURRVAL);
  END;

  PROCEDURE pr_eliminar_profesional(p_id_usuario in usuario.id_usuario%TYPE) AS
  BEGIN
    DELETE FROM profesional WHERE id_usuario = p_id_usuario;
    DELETE FROM usuario WHERE id_usuario = p_id_usuario;
  END;
END pkg_profesional;
/


CREATE OR REPLACE PACKAGE pkg_cliente AS

  TYPE tp_cliente IS RECORD (
    id_usuario       NUMBER(38),
    username         VARCHAR2(80),
    password         VARCHAR2(40),
    telefono         VARCHAR2(12),
    correo           VARCHAR2(80),
    id_cliente       NUMBER(38),
    nombre           VARCHAR2(100),
    direccion        VARCHAR2(120),
    rubro            VARCHAR2(100),
    id_profesional   NUMBER(38)
  );

  TYPE tb_cliente IS TABLE OF tp_cliente;

  FUNCTION fn_obtener_cliente(p_id_usuario usuario.id_usuario%TYPE) RETURN tp_cliente;
  PROCEDURE pr_insertar_cliente(
    p_username in usuario.username%TYPE,
    p_password in usuario.password%TYPE,
    p_telefono in usuario.telefono%TYPE,
    p_correo in usuario.correo%TYPE,
    p_nombre in cliente.nombre%TYPE,
    p_direccion in cliente.direccion%TYPE,
    p_rubro in cliente.rubro%TYPE,
    p_id_profesional in cliente.id_profesional%TYPE,
    p_cliente out tp_cliente
  );
  PROCEDURE pr_eliminar_cliente(p_id_usuario in usuario.id_usuario%TYPE);
END pkg_cliente;
/

CREATE OR REPLACE PACKAGE BODY pkg_cliente AS
  FUNCTION fn_obtener_cliente (p_id_usuario usuario.id_usuario%TYPE) RETURN tp_cliente
  AS
    r_cliente tp_cliente;
  BEGIN
    SELECT id_usuario,username,password,telefono,correo,id_cliente,nombre,direccion,rubro,id_profesional
    INTO r_cliente.id_usuario,r_cliente.username,r_cliente.password,r_cliente.telefono,r_cliente.correo,r_cliente.id_cliente,r_cliente.nombre,r_cliente.direccion,r_cliente.rubro,r_cliente.id_profesional
    FROM cliente JOIN usuario USING(id_usuario)
    WHERE id_usuario = p_id_usuario;

    RETURN r_cliente;
  END;

  PROCEDURE pr_insertar_cliente (
    p_username in usuario.username%TYPE,
    p_password in usuario.password%TYPE,
    p_telefono in usuario.telefono%TYPE,
    p_correo in usuario.correo%TYPE,
    p_nombre in cliente.nombre%TYPE,
    p_direccion in cliente.direccion%TYPE,
    p_rubro in cliente.rubro%TYPE,
    p_id_profesional in cliente.id_profesional%TYPE,
    p_cliente out tp_cliente)
  AS
  BEGIN
    INSERT INTO usuario (id_usuario,username, password, telefono, correo, id_rol)
    VALUES(id_usuario_seq.NEXTVAL, p_username, p_password, p_telefono, p_correo, 3);

    INSERT INTO cliente (id_usuario,id_cliente,nombre,direccion,rubro,id_profesional)
    VALUES(id_usuario_seq.CURRVAL,id_cliente_seq.NEXTVAL,p_nombre,p_direccion,p_rubro,p_id_profesional);

    p_cliente := fn_obtener_cliente(id_usuario_seq.CURRVAL);
  END;


  PROCEDURE pr_eliminar_cliente(p_id_usuario in usuario.id_usuario%TYPE)
  AS
  BEGIN
    DELETE cliente WHERE id_usuario = p_id_usuario;
    DELETE usuario WHERE id_usuario = p_id_usuario;
  END;

END pkg_cliente;
/

CREATE  OR REPLACE PACKAGE pkg_actividad AS

  TYPE tp_actividad IS RECORD (
    id_actividad            NUMBER(38),
    nombre                  VARCHAR2(100),
    descripcion             VARCHAR2(600),
    estado                  CHAR(1),
    fecha_inicio            DATE,
    resultado               VARCHAR2(600),
    cantidad_modificaciones NUMBER(38),
    id_profesional          NUMBER(38),
    id_cliente              NUMBER(38),
    tipo_actividad          VARCHAR2(80)

  );

  TYPE tb_actividad IS TABLE OF tp_actividad;

  FUNCTION fn_obtener_actividad(p_id_actividad actividad.id_actividad%TYPE) RETURN tp_actividad;
  FUNCTION fn_obtener_actividad_profesional(p_id_profesional profesional.id_profesional%TYPE) RETURN tb_actividad;
  FUNCTION fn_obtener_actividad_cliente(p_id_cliente cliente.id_cliente%TYPE) RETURN tb_actividad;
  PROCEDURE pr_insertar_actividad (
    p_nombre in actividad.nombre%type,
    p_descripcion in actividad.descripcion%type,
    p_estado in actividad.estado%type,
    p_fecha_inicio in actividad.fecha_inicio%type,
    p_resultado in actividad.resultado%type,
    p_cantidad_modificaciones in actividad.cantidad_modificaciones%type,
    p_id_profesional in actividad.id_profesional%type,
    p_id_cliente in actividad.id_cliente%type,
    p_tipo_actividad in tipo_actividad.nombre%type,
    p_actividad out tp_actividad
  );
  PROCEDURE pr_eliminar_actividad(p_id_actividad actividad.id_actividad%TYPE);
  PROCEDURE pr_modificar_actividad(p_actividad in out tp_actividad);

END pkg_actividad;
/

CREATE OR REPLACE PACKAGE BODY pkg_actividad AS
  FUNCTION fn_obtener_actividad(p_id_actividad actividad.id_actividad%TYPE) RETURN tp_actividad AS
    r_actividad tp_actividad;
  BEGIN
    SELECT id_actividad,a.nombre,descripcion,estado,fecha_inicio,resultado,cantidad_modificaciones,id_profesional,id_cliente,ta.nombre tipo_actividad
    INTO r_actividad.id_actividad,r_actividad.nombre,r_actividad.descripcion,r_actividad.estado,r_actividad.fecha_inicio,r_actividad.resultado,r_actividad.cantidad_modificaciones,r_actividad.id_profesional,r_actividad.id_cliente,r_actividad.tipo_actividad
    FROM actividad a join tipo_actividad ta USING(id_tipo_actividad)
    WHERE id_actividad = p_id_actividad;
    RETURN r_actividad;
  END;

  FUNCTION fn_obtener_actividad_profesional(p_id_profesional profesional.id_profesional%TYPE) RETURN tb_actividad AS

    CURSOR act_cursor  IS
    SELECT id_actividad,a.nombre,descripcion,estado,fecha_inicio,resultado,cantidad_modificaciones,id_profesional,id_cliente,ta.nombre
    FROM actividad a join tipo_actividad ta USING(id_tipo_actividad)
    WHERE id_profesional = p_id_profesional;

    r_actividad tb_actividad;
  BEGIN
    OPEN act_cursor;
      LOOP
          FETCH act_cursor BULK COLLECT INTO r_actividad;
          EXIT WHEN act_cursor%NOTFOUND;
      END LOOP;

    RETURN r_actividad;
  END;

  FUNCTION fn_obtener_actividad_cliente(p_id_cliente cliente.id_cliente%TYPE) RETURN tb_actividad AS

    CURSOR act_cursor  IS
    SELECT id_actividad,a.nombre,descripcion,estado,fecha_inicio,resultado,cantidad_modificaciones,id_profesional,id_cliente,ta.nombre
    FROM actividad a join tipo_actividad ta USING(id_tipo_actividad)
    WHERE id_cliente = p_id_cliente;

    r_actividad tb_actividad;
  BEGIN
    OPEN act_cursor;
      LOOP
          FETCH act_cursor BULK COLLECT INTO r_actividad;
          EXIT WHEN act_cursor%NOTFOUND;
      END LOOP;

    RETURN r_actividad;
  END;

  PROCEDURE pr_insertar_actividad (
    p_nombre in actividad.nombre%type,
    p_descripcion in actividad.descripcion%type,
    p_estado in actividad.estado%type,
    p_fecha_inicio in actividad.fecha_inicio%type,
    p_resultado in actividad.resultado%type,
    p_cantidad_modificaciones in actividad.cantidad_modificaciones%type,
    p_id_profesional in actividad.id_profesional%type,
    p_id_cliente in actividad.id_cliente%type,
    p_tipo_actividad in tipo_actividad.nombre%type,
    p_actividad out tp_actividad)
  AS
    v_id_tipo_actividad tipo_actividad.id_tipo_actividad%TYPE;
  BEGIN
    SELECT id_tipo_actividad INTO v_id_tipo_actividad FROM tipo_actividad WHERE nombre LIKE p_tipo_actividad;
    INSERT INTO actividad (id_actividad,
                           nombre,
                           descripcion,
                           estado,
                           fecha_inicio,
                           resultado,
                           cantidad_modificaciones,
                           id_profesional,
                           id_cliente,
                           id_tipo_actividad)
                    VALUES(id_actividad_seq.NEXTVAL,
                           p_nombre,
                           p_descripcion,
                           p_estado,
                           p_fecha_inicio,
                           p_resultado,
                           p_cantidad_modificaciones,
                           p_id_profesional,
                           p_id_cliente,
                           v_id_tipo_actividad);
    p_actividad := fn_obtener_actividad(id_actividad_seq.CURRVAL);
  END;

  PROCEDURE pr_eliminar_actividad(p_id_actividad actividad.id_actividad%TYPE) AS
  BEGIN
    DELETE actividad WHERE id_actividad = p_id_actividad;
  END;

  PROCEDURE pr_modificar_actividad(p_actividad in out tp_actividad) AS
    v_id_tipo_actividad tipo_actividad.id_tipo_actividad%TYPE;
  BEGIN
    SELECT id_tipo_actividad INTO v_id_tipo_actividad FROM tipo_actividad WHERE nombre LIKE p_actividad.tipo_actividad;
    UPDATE actividad
    SET nombre = p_actividad.nombre,
        descripcion = p_actividad.descripcion,
        estado = p_actividad.estado,
        fecha_inicio = p_actividad.fecha_inicio,
        resultado = p_actividad.resultado,
        cantidad_modificaciones = p_actividad.cantidad_modificaciones,
        id_profesional = p_actividad.id_profesional,
        id_cliente = p_actividad.id_cliente,
        id_tipo_actividad = v_id_tipo_actividad
    WHERE id_actividad = p_actividad.id_actividad;
  END;
END pkg_actividad;
/
