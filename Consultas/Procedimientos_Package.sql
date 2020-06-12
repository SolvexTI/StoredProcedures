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
    p_actividad out tp_actividad
  )
  AS
    v_id_tipo_actividad tipo_actividad.id_tipo_actividad%TYPE;
  BEGIN
    SELECT id_tipo_actividad INTO v_id_tipo_actividad FROM tipo_actividad WHERE UPPER(nombre) LIKE UPPER(p_tipo_actividad);
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

CREATE OR REPLACE PACKAGE pkg_punto_mejorable AS

  TYPE tp_punto_mejorable IS RECORD (
    id_punto_mejorable NUMBER(38),
    titulo             VARCHAR2(80),
    descripcion        VARCHAR2(300),
    cumplido           CHAR(1),
    resultado          VARCHAR2(300),
    id_actividad       NUMBER(38)
  );

  TYPE tb_punto_mejorable IS TABLE OF tp_punto_mejorable;

  FUNCTION fn_obtener_punto_mejorable(p_id_punto_mejorable punto_mejorable.id_punto_mejorable%TYPE) RETURN tp_punto_mejorable;
  FUNCTION fn_obtener_punto_mejorable_activadad(p_id_actividad actividad.id_actividad%TYPE) RETURN tb_punto_mejorable;
  PROCEDURE pr_insertar_punto_mejorable (
    p_titulo IN punto_mejorable.titulo%TYPE,
    p_descripcion IN punto_mejorable.descripcion%TYPE,
    p_cumplido IN punto_mejorable.cumplido%TYPE,
    p_resultado IN punto_mejorable.resultado%TYPE,
    p_id_actividad IN punto_mejorable.id_actividad%TYPE,
    p_punto_mejorable OUT tp_punto_mejorable
  );
  PROCEDURE pr_eliminar_punto_mejorable(p_id_punto_mejorable punto_mejorable.id_punto_mejorable%TYPE);
  PROCEDURE pr_modificar_punto_mejorable(p_punto_mejorable in tp_punto_mejorable);

END pkg_punto_mejorable;
/


CREATE OR REPLACE PACKAGE BODY pkg_punto_mejorable AS

  FUNCTION fn_obtener_punto_mejorable(p_id_punto_mejorable punto_mejorable.id_punto_mejorable%TYPE) RETURN tp_punto_mejorable AS
    r_punto_mejorable tp_punto_mejorable;
  BEGIN
    SELECT id_punto_mejorable,titulo,descripcion,cumplido,resultado,id_actividad
    INTO r_punto_mejorable.id_punto_mejorable, r_punto_mejorable.titulo, r_punto_mejorable.descripcion, r_punto_mejorable.cumplido, r_punto_mejorable.resultado, r_punto_mejorable.id_actividad
    FROM punto_mejorable
    WHERE id_punto_mejorable = p_id_punto_mejorable;

    RETURN r_punto_mejorable;
  END;

  FUNCTION fn_obtener_punto_mejorable_activadad(p_id_actividad actividad.id_actividad%TYPE) RETURN tb_punto_mejorable AS

    CURSOR act_cursor  IS
    SELECT id_punto_mejorable,titulo,descripcion,cumplido,resultado,id_actividad
    FROM punto_mejorable
    WHERE id_actividad = p_id_actividad;

    r_punto_mejorable tb_punto_mejorable;
  BEGIN
    OPEN act_cursor;
      LOOP
          FETCH act_cursor BULK COLLECT INTO r_punto_mejorable;
          EXIT WHEN act_cursor%NOTFOUND;
      END LOOP;

    RETURN r_punto_mejorable;
  END;

  PROCEDURE pr_insertar_punto_mejorable (
    p_titulo IN punto_mejorable.titulo%TYPE,
    p_descripcion IN punto_mejorable.descripcion%TYPE,
    p_cumplido IN punto_mejorable.cumplido%TYPE,
    p_resultado IN punto_mejorable.resultado%TYPE,
    p_id_actividad IN punto_mejorable.id_actividad%TYPE,
    p_punto_mejorable OUT tp_punto_mejorable
  )AS
  BEGIN
    INSERT INTO punto_mejorable (id_punto_mejorable,titulo,descripcion,cumplido,resultado,id_actividad)
    VALUES ( id_punto_mejorable_seq.NEXTVAL,p_titulo,p_descripcion,p_cumplido,p_resultado,p_id_actividad);

    p_punto_mejorable := fn_obtener_punto_mejorable(id_punto_mejorable_seq.CURRVAL);

  END;

  PROCEDURE pr_eliminar_punto_mejorable(p_id_punto_mejorable punto_mejorable.id_punto_mejorable%TYPE) AS
  BEGIN
    DELETE FROM punto_mejorable WHERE id_punto_mejorable = p_id_punto_mejorable;
  END;

  PROCEDURE pr_modificar_punto_mejorable(p_punto_mejorable in tp_punto_mejorable) AS
  BEGIN
    UPDATE punto_mejorable
    SET id_punto_mejorable = p_punto_mejorable.id_punto_mejorable,
        titulo = p_punto_mejorable.titulo,
        descripcion = p_punto_mejorable.descripcion,
        cumplido = p_punto_mejorable.cumplido,
        resultado = p_punto_mejorable.resultado,
        id_actividad = p_punto_mejorable.id_actividad

    WHERE id_punto_mejorable = p_punto_mejorable.id_punto_mejorable;
  END;

END ;
/


CREATE OR REPLACE PACKAGE pkg_plan AS

  TYPE tp_plan IS RECORD (
    id_plan      NUMBER(38),
    valor        NUMBER(38),
    descripcion  VARCHAR2(300)
  );

  TYPE tb_plan IS TABLE OF tp_plan;

  FUNCTION fn_obtener_plan(p_id_plan plan.id_plan%TYPE) RETURN tp_plan;
  FUNCTION fn_obtener_planes RETURN tb_plan;
  PROCEDURE pr_insertar_plan (p_plan IN OUT tp_plan);
  PROCEDURE pr_eliminar_plan (p_id_plan plan.id_plan%TYPE);
  PROCEDURE pr_modificar_plan (p_plan IN OUT tp_plan);

END pkg_plan;
/

CREATE OR REPLACE PACKAGE BODY pkg_plan AS
  FUNCTION fn_obtener_plan(p_id_plan plan.id_plan%TYPE) RETURN tp_plan AS
    r_plan tp_plan;
  BEGIN
    SELECT id_plan,valor,descripcion
    INTO r_plan.id_plan,r_plan.valor,r_plan.descripcion
    FROM plan
    WHERE id_plan = p_id_plan;
  END;

  FUNCTION fn_obtener_planes RETURN tb_plan AS
    CURSOR plan_cursor  IS
    SELECT id_plan,valor,descripcion
    FROM plan;
    r_plan tb_plan;
  BEGIN
    OPEN plan_cursor;
      LOOP
          FETCH plan_cursor BULK COLLECT INTO r_plan;
          EXIT WHEN plan_cursor%NOTFOUND;
      END LOOP;
    RETURN r_plan;
  END;


  PROCEDURE pr_insertar_plan (p_plan IN OUT tp_plan) AS
  BEGIN
    INSERT INTO plan (id_plan,valor,descripcion)
    VALUES (id_plan_seq.NEXTVAL,p_plan.valor,p_plan.descripcion);
  END;

  PROCEDURE pr_eliminar_plan (p_id_plan plan.id_plan%TYPE) AS
  BEGIN
    DELETE FROM plan WHERE id_plan = p_id_plan;
  END;

  PROCEDURE pr_modificar_plan (p_plan IN OUT tp_plan) AS
  BEGIN
    UPDATE plan
    SET valor = p_plan.valor,
        descripcion = p_plan.descripcion
    WHERE id_plan = p_plan.id_plan;
  END;


END pkg_plan;
/


CREATE OR REPLACE PACKAGE pkg_contrato AS
  TYPE tp_contrato IS RECORD (
    id_contrato        NUMBER(38),
    fecha_inicio       DATE,
    fecha_termino      DATE,
    fecha_facturacion  DATE,
    id_cliente         NUMBER(38),
    id_plan            NUMBER(38)
  );

  TYPE tb_contrato IS TABLE OF tp_contrato;

  FUNCTION fn_obtener_contrato(p_id_cliente cliente.id_usuario%TYPE) RETURN tp_contrato;
  PROCEDURE pr_insertar_contrato(p_contrato IN OUT tp_contrato);
  PROCEDURE pr_eliminar_contrato(p_id_cliente cliente.id_usuario%TYPE);
  PROCEDURE pr_modificar_contrato(p_contrato IN OUT tp_contrato);
END pkg_contrato;
/
CREATE OR REPLACE PACKAGE BODY pkg_contrato AS

  FUNCTION fn_obtener_contrato(p_id_cliente cliente.id_usuario%TYPE) RETURN tp_contrato AS
    r_contrato tp_contrato;
  BEGIN
    SELECT id_contrato,fecha_inicio,fecha_termino,fecha_facturacion,id_cliente,id_plan
    INTO r_contrato.id_contrato,r_contrato.fecha_inicio,r_contrato.fecha_termino,r_contrato.fecha_facturacion,r_contrato.id_cliente,r_contrato.id_plan
    FROM contrato
    WHERE p_id_cliente = p_id_cliente;
    RETURN r_contrato;
  END;

  PROCEDURE pr_insertar_contrato(p_contrato IN OUT tp_contrato) AS
  BEGIN
    INSERT INTO contrato (id_contrato,fecha_inicio,fecha_termino,fecha_facturacion,id_cliente,id_plan)
    VALUES(id_contrato_seq.NEXTVAL,p_contrato.fecha_inicio,p_contrato.fecha_termino,p_contrato.fecha_facturacion,p_contrato.id_cliente,p_contrato.id_plan);
  END;

  PROCEDURE pr_eliminar_contrato(p_id_cliente cliente.id_usuario%TYPE) AS
  BEGIN
    DELETE FROM contrato WHERE id_cliente = p_id_cliente;
  END;

  PROCEDURE pr_modificar_contrato(p_contrato IN OUT tp_contrato) AS
  BEGIN
    UPDATE contrato
    SET fecha_inicio = p_contrato.fecha_inicio,
        fecha_termino = p_contrato.fecha_termino,
        fecha_facturacion = p_contrato.fecha_facturacion,
        id_cliente = p_contrato.id_cliente,
        id_plan = p_contrato.id_plan
    WHERE id_contrato = p_contrato.id_contrato;
  END;
END pkg_contrato;
/

CREATE OR REPLACE PACKAGE pkg_trabajador AS
  TYPE tp_trabajador IS RECORD (
    id_trabajador     NUMBER(38),
    rut               NUMBER(38),
    dv                VARCHAR2(1),
    nombre            VARCHAR2(120),
    apellido_paterno  VARCHAR2(80),
    apellido_materno  VARCHAR2(80),
    id_cliente        NUMBER(38)
  );

  TYPE tb_trabajador IS TABLE OF tp_trabajador;

  FUNCTION fn_obtener_trabajador(p_id_trabajador trabajador.id_trabajador%TYPE) RETURN tp_trabajador;
  FUNCTION fn_obtener_trabajadores_actividad(p_id_actividad actividad.id_actividad%TYPE) RETURN tb_trabajador;
  FUNCTION fn_obtener_trabajador_cliente(p_id_cliente cliente.id_cliente%TYPE) RETURN tb_trabajador;
  PROCEDURE pr_insertar_trabajador(p_trabajador IN OUT tp_trabajador);
  PROCEDURE pr_eliminar_trabajador(p_id_trabajador trabajador.id_trabajador%TYPE);
  PROCEDURE pr_modificar_trabajador(p_trabajador IN OUT tp_trabajador);
END pkg_trabajador;
/
CREATE OR REPLACE PACKAGE BODY pkg_trabajador AS
  FUNCTION fn_obtener_trabajador(p_id_trabajador trabajador.id_trabajador%TYPE) RETURN tp_trabajador AS
    r_trabajador tp_trabajador;
  BEGIN
    SELECT id_trabajador,rut,dv,nombre,apellido_paterno,apellido_materno,id_cliente
    INTO r_trabajador.id_trabajador,r_trabajador.rut,r_trabajador.dv,r_trabajador.nombre,r_trabajador.apellido_paterno,r_trabajador.apellido_materno,r_trabajador.id_cliente   
    FROM trabajador
    WHERE id_trabajador = p_id_trabajador;
    RETURN r_trabajador;
  END;

  FUNCTION fn_obtener_trabajadores_actividad(p_id_actividad actividad.id_actividad%TYPE) RETURN tb_trabajador AS
    CURSOR trabajador_cursor  IS
    SELECT id_trabajador,rut,dv,nombre,apellido_paterno,apellido_materno,id_cliente
    FROM trabajador join actividad_trabajador USING(id_trabajador)
    WHERE id_actividad = p_id_actividad;
    r_trabajador tb_trabajador;
  BEGIN
    OPEN trabajador_cursor;
      LOOP
          FETCH trabajador_cursor BULK COLLECT INTO r_trabajador;
          EXIT WHEN trabajador_cursor%NOTFOUND;
      END LOOP;
    RETURN r_trabajador;
  END;

  FUNCTION fn_obtener_trabajador_cliente(p_id_cliente cliente.id_cliente%TYPE) RETURN tb_trabajador AS
    CURSOR trabajador_cursor  IS
    SELECT id_trabajador,rut,dv,nombre,apellido_paterno,apellido_materno,id_cliente
    FROM trabajador
    WHERE id_cliente = p_id_cliente;
    r_trabajador tb_trabajador;
  BEGIN
    OPEN trabajador_cursor;
      LOOP
          FETCH trabajador_cursor BULK COLLECT INTO r_trabajador;
          EXIT WHEN trabajador_cursor%NOTFOUND;
      END LOOP;
    RETURN r_trabajador;
  END;

  PROCEDURE pr_insertar_trabajador(p_trabajador IN OUT tp_trabajador) AS
  BEGIN
    INSERT INTO trabajador (id_trabajador,rut,dv,nombre,apellido_paterno,apellido_materno,id_cliente)
    VALUES (id_trabajador_seq.NEXTVAL,p_trabajador.rut,p_trabajador.dv,p_trabajador.nombre,p_trabajador.apellido_paterno,p_trabajador.apellido_materno,p_trabajador.id_cliente);
  END;
  PROCEDURE pr_eliminar_trabajador(p_id_trabajador trabajador.id_trabajador%TYPE) AS
  BEGIN
    DELETE FROM trabajador WHERE id_trabajador = p_id_trabajador;
  END;
  PROCEDURE pr_modificar_trabajador(p_trabajador IN OUT tp_trabajador) AS
  BEGIN
    UPDATE trabajador
    SET rut = p_trabajador.rut,
        dv = p_trabajador.dv,
        nombre = p_trabajador.nombre,
        apellido_paterno = p_trabajador.apellido_paterno,
        apellido_materno = p_trabajador.apellido_materno,
        id_cliente = p_trabajador.id_cliente
    WHERE id_trabajador = p_trabajador.id_trabajador;
  END;
END pkg_trabajador;
