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

  PROCEDURE pr_obtener_profesional(p_id_usuario usuario.id_usuario%TYPE, p_profesional OUT tp_profesional) ;
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
  PROCEDURE pr_eliminar_profesional(p_id_usuario in usuario.id_usuario%TYPE );

END pkg_profesional;
/

CREATE OR REPLACE PACKAGE BODY pkg_profesional AS

  PROCEDURE pr_obtener_profesional (p_id_usuario usuario.id_usuario%TYPE, p_profesional OUT tp_profesional) AS
/**************************************************************************************************************
   NAME:       	pr_obtener_profesional
   PURPOSE		Obtiene datos de profesional segun su ID de usuario

   REVISIONS:
   Ver          Date           Author                               Description
   ---------    ----------     -------------------                  ----------------------------------------------
   1.1           04/06/2020     Alejandro Del Pino       		       	1. Creación Procedimiento

***************************************************************************************************************/
  BEGIN
    SELECT id_usuario,username,password,telefono,correo,id_profesional,nombre,apellido_paterno,apellido_materno,rut,dv
    INTO p_profesional.id_usuario,p_profesional.username,p_profesional.password,p_profesional.telefono,p_profesional.correo,p_profesional.id_profesional,p_profesional.nombre,p_profesional.apellido_paterno,p_profesional.apellido_materno,p_profesional.rut,p_profesional.dv
    FROM USUARIO u join PROFESIONAL p using (id_usuario)
    WHERE id_usuario = p_id_usuario;

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
/**************************************************************************************************************
   NAME:       	pr_insertar_profesional
   PURPOSE		Inserta datos de profesional y usuario

   REVISIONS:
   Ver          Date           Author                               Description
   ---------    ----------     -------------------                  ----------------------------------------------
   1.1           04/06/2020     Alejandro Del Pino       		       	1. Creación Procedimiento

***************************************************************************************************************/
  BEGIN

    INSERT INTO usuario (id_usuario,username, password, telefono, correo, id_rol)
    VALUES(id_usuario_seq.NEXTVAL, p_username, p_password, p_telefono, p_correo, 2);

    INSERT INTO profesional (id_usuario, id_profesional, nombre, apellido_paterno, apellido_materno, rut, dv)
    VALUES(id_usuario_seq.CURRVAL, id_profesional_seq.NEXTVAL, p_nombre, p_apellido_paterno, p_apellido_materno, p_rut, p_dv);

    pr_obtener_profesional(id_profesional_seq.CURRVAL, p_profesional);
  END;

  PROCEDURE pr_eliminar_profesional(p_id_usuario in usuario.id_usuario%TYPE) AS
  /**************************************************************************************************************
     NAME:       	pr_eliminar_profesional
       PURPOSE		Elimina datos de profesional y usuario

     REVISIONS:
     Ver          Date           Author                               Description
     ---------    ----------     -------------------                  ----------------------------------------------
     1.1           04/06/2020     Alejandro Del Pino       		       	1. Creación Procedimiento

  ***************************************************************************************************************/

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

  PROCEDURE pr_obtener_cliente(p_id_usuario usuario.id_usuario%TYPE, p_cliente OUT tp_cliente);
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
  PROCEDURE pr_obtener_cliente (p_id_usuario usuario.id_usuario%TYPE, p_cliente OUT tp_cliente)
  AS
    /**************************************************************************************************************
       NAME:      pr_obtener_cliente
       PURPOSE		Obtiene datos de cliente y usuario

       REVISIONS:
       Ver          Date           Author                               Description
       ---------    ----------     -------------------                  ----------------------------------------------
       1.1           04/06/2020     Alejandro Del Pino       		       	1. Creación Procedimiento

    ***************************************************************************************************************/
  BEGIN
    SELECT id_usuario,username,password,telefono,correo,id_cliente,nombre,direccion,rubro,id_profesional
    INTO p_cliente.id_usuario,p_cliente.username,p_cliente.password,p_cliente.telefono,p_cliente.correo,p_cliente.id_cliente,p_cliente.nombre,p_cliente.direccion,p_cliente.rubro,p_cliente.id_profesional
    FROM cliente JOIN usuario USING(id_usuario)
    WHERE id_usuario = p_id_usuario;

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
    /**************************************************************************************************************
       NAME:      pr_insertar_cliente
       PURPOSE		Inserta datos de usuario y cliente, devuelve el tipo tp_cliente

       REVISIONS:
       Ver          Date           Author                               Description
       ---------    ----------     -------------------                  ----------------------------------------------
       1.1           04/06/2020     Alejandro Del Pino       		       	1. Creación Procedimiento

    ***************************************************************************************************************/
  BEGIN
    INSERT INTO usuario (id_usuario,username, password, telefono, correo, id_rol)
    VALUES(id_usuario_seq.NEXTVAL, p_username, p_password, p_telefono, p_correo, 3);

    INSERT INTO cliente (id_usuario,id_cliente,nombre,direccion,rubro,id_profesional)
    VALUES(id_usuario_seq.CURRVAL,id_cliente_seq.NEXTVAL,p_nombre,p_direccion,p_rubro,p_id_profesional);

    pr_obtener_cliente(id_usuario_seq.CURRVAL, p_cliente);
  END;


  PROCEDURE pr_eliminar_cliente(p_id_usuario in usuario.id_usuario%TYPE)
  AS
    /**************************************************************************************************************
       NAME:      pr_eliminar_cliente
       PURPOSE		Elimina datos de cliente y usuario segun su ID de usuario

       REVISIONS:
       Ver          Date           Author                               Description
       ---------    ----------     -------------------                  ----------------------------------------------
       1.1           04/06/2020     Alejandro Del Pino       		       	1. Creación Procedimiento

    ***************************************************************************************************************/
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

  PROCEDURE pr_obtener_actividad(p_id_actividad actividad.id_actividad%TYPE, p_actividad OUT tp_actividad);
  PROCEDURE pr_obtener_actividad_profesional(p_id_profesional profesional.id_profesional%TYPE, p_actividad OUT tb_actividad);
  PROCEDURE pr_obtener_actividad_cliente(p_id_cliente cliente.id_cliente%TYPE, p_actividad OUT tb_actividad);
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
  PROCEDURE pr_obtener_actividad(p_id_actividad actividad.id_actividad%TYPE,p_actividad OUT tp_actividad) AS
  /**************************************************************************************************************
     NAME:      pr_obtener_actividad
     PURPOSE		Obtiene datos de actividad segun su ID

     REVISIONS:
     Ver          Date           Author                               Description
     ---------    ----------     -------------------                  ----------------------------------------------
     1.1           04/06/2020     Alejandro Del Pino       		       	1. Creación Procedimiento

  ***************************************************************************************************************/
  BEGIN
    SELECT id_actividad,a.nombre,descripcion,estado,fecha_inicio,resultado,cantidad_modificaciones,id_profesional,id_cliente,ta.nombre tipo_actividad
    INTO p_actividad.id_actividad,p_actividad.nombre,p_actividad.descripcion,p_actividad.estado,p_actividad.fecha_inicio,p_actividad.resultado,p_actividad.cantidad_modificaciones,p_actividad.id_profesional,p_actividad.id_cliente,p_actividad.tipo_actividad
    FROM actividad a join tipo_actividad ta USING(id_tipo_actividad)
    WHERE id_actividad = p_id_actividad;
  END;

  PROCEDURE pr_obtener_actividad_profesional(p_id_profesional profesional.id_profesional%TYPE,p_actividad OUT tb_actividad) AS
  /**************************************************************************************************************
     NAME:      pr_obtener_actividad_profesional
     PURPOSE		Obtiene datos de actividades de un profesional

     REVISIONS:
     Ver          Date           Author                               Description
     ---------    ----------     -------------------                  ----------------------------------------------
     1.1           04/06/2020     Alejandro Del Pino       		       	1. Creación Procedimiento

  ***************************************************************************************************************/
    CURSOR act_cursor  IS
    SELECT id_actividad,a.nombre,descripcion,estado,fecha_inicio,resultado,cantidad_modificaciones,id_profesional,id_cliente,ta.nombre
    FROM actividad a join tipo_actividad ta USING(id_tipo_actividad)
    WHERE id_profesional = p_id_profesional;

  BEGIN
    OPEN act_cursor;
      LOOP
          FETCH act_cursor BULK COLLECT INTO p_actividad;
          EXIT WHEN act_cursor%NOTFOUND;
      END LOOP;

  END;

  PROCEDURE pr_obtener_actividad_cliente(p_id_cliente cliente.id_cliente%TYPE, p_actividad OUT tb_actividad) AS
  /**************************************************************************************************************
     NAME:      pr_obtener_actividad_cliente
     PURPOSE		Obtiene actividades de un cliente

     REVISIONS:
     Ver          Date           Author                               Description
     ---------    ----------     -------------------                  ----------------------------------------------
     1.1           04/06/2020     Alejandro Del Pino       		       	1. Creación Procedimiento

  ***************************************************************************************************************/
    CURSOR act_cursor  IS
    SELECT id_actividad,a.nombre,descripcion,estado,fecha_inicio,resultado,cantidad_modificaciones,id_profesional,id_cliente,ta.nombre
    FROM actividad a join tipo_actividad ta USING(id_tipo_actividad)
    WHERE id_cliente = p_id_cliente;
  BEGIN
    OPEN act_cursor;
      LOOP
          FETCH act_cursor BULK COLLECT INTO p_actividad;
          EXIT WHEN act_cursor%NOTFOUND;
      END LOOP;

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
  ) AS
    /**************************************************************************************************************
       NAME:      pr_insertar_actividad
       PURPOSE	  Inserta datos de una actividad y devuelve el tipo tp_actividad

       REVISIONS:
       Ver          Date           Author                               Description
       ---------    ----------     -------------------                  ----------------------------------------------
       1.1           04/06/2020     Alejandro Del Pino       		       	1. Creación Procedimiento

    ***************************************************************************************************************/
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
    pr_obtener_actividad(id_actividad_seq.CURRVAL, p_actividad);
  END;

  PROCEDURE pr_eliminar_actividad(p_id_actividad actividad.id_actividad%TYPE) AS
  /**************************************************************************************************************
     NAME:       pr_eliminar_actividad
     PURPOSE		Elimina actividad segun id de actividad

     REVISIONS:
     Ver          Date           Author                               Description
     ---------    ----------     -------------------                  ----------------------------------------------
     1.1           04/06/2020     Alejandro Del Pino       		       	1. Creación Procedimiento

  ***************************************************************************************************************/
  BEGIN
    DELETE actividad WHERE id_actividad = p_id_actividad;
  END;

  PROCEDURE pr_modificar_actividad(p_actividad in out tp_actividad) AS
  /**************************************************************************************************************
     NAME:      pr_modificar_actividad
     PURPOSE		Modifica actividad segun su ID

     REVISIONS:
     Ver          Date           Author                               Description
     ---------    ----------     -------------------                  ----------------------------------------------
     1.1           04/06/2020     Alejandro Del Pino       		       	1. Creación Procedimiento

  ***************************************************************************************************************/
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

  PROCEDURE pr_obtener_punto_mejorable(p_id_punto_mejorable punto_mejorable.id_punto_mejorable%TYPE, p_punto_mejorable OUT tp_punto_mejorable);
  PROCEDURE pr_obtener_punto_mejorable_activadad(p_id_actividad actividad.id_actividad%TYPE, p_punto_mejorable OUT tb_punto_mejorable);
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

  PROCEDURE pr_obtener_punto_mejorable(p_id_punto_mejorable punto_mejorable.id_punto_mejorable%TYPE, p_punto_mejorable OUT tp_punto_mejorable) AS
  /**************************************************************************************************************
     NAME:      pr_obtener_punto_mejorable
     PURPOSE		Obtiene datos de punto mejorable segun su ID

     REVISIONS:
     Ver          Date           Author                               Description
     ---------    ----------     -------------------                  ----------------------------------------------
     1.1           04/06/2020     Alejandro Del Pino       		       	1. Creación Procedimiento

  ***************************************************************************************************************/
  BEGIN
    SELECT id_punto_mejorable,titulo,descripcion,cumplido,resultado,id_actividad
    INTO p_punto_mejorable.id_punto_mejorable, p_punto_mejorable.titulo, p_punto_mejorable.descripcion, p_punto_mejorable.cumplido, p_punto_mejorable.resultado, p_punto_mejorable.id_actividad
    FROM punto_mejorable
    WHERE id_punto_mejorable = p_id_punto_mejorable;
  END;

  PROCEDURE pr_obtener_punto_mejorable_activadad(p_id_actividad actividad.id_actividad%TYPE, p_punto_mejorable OUT tb_punto_mejorable) AS
  /**************************************************************************************************************
     NAME:      pr_obtener_punto_mejorable_activadad
     PURPOSE	 Obtiene datos de punto mejorable por actividad

     REVISIONS:
     Ver          Date           Author                               Description
     ---------    ----------     -------------------                  ----------------------------------------------
     1.1           04/06/2020     Alejandro Del Pino       		       	1. Creación Procedimiento

  ***************************************************************************************************************/
    CURSOR act_cursor  IS
    SELECT id_punto_mejorable,titulo,descripcion,cumplido,resultado,id_actividad
    FROM punto_mejorable
    WHERE id_actividad = p_id_actividad;
  BEGIN
    OPEN act_cursor;
      LOOP
          FETCH act_cursor BULK COLLECT INTO p_punto_mejorable;
          EXIT WHEN act_cursor%NOTFOUND;
      END LOOP;

  END;

  PROCEDURE pr_insertar_punto_mejorable (
    p_titulo IN punto_mejorable.titulo%TYPE,
    p_descripcion IN punto_mejorable.descripcion%TYPE,
    p_cumplido IN punto_mejorable.cumplido%TYPE,
    p_resultado IN punto_mejorable.resultado%TYPE,
    p_id_actividad IN punto_mejorable.id_actividad%TYPE,
    p_punto_mejorable OUT tp_punto_mejorable
  )AS
  /**************************************************************************************************************
     NAME:      pr_insertar_punto_mejorable
     PURPOSE		Inserta datos de un punto mejorable y devuelve el tipo tp_punto_mejorable

     REVISIONS:
     Ver          Date           Author                               Description
     ---------    ----------     -------------------                  ----------------------------------------------
     1.1           04/06/2020     Alejandro Del Pino       		       	1. Creación Procedimiento

  ***************************************************************************************************************/
  BEGIN
    INSERT INTO punto_mejorable (id_punto_mejorable,titulo,descripcion,cumplido,resultado,id_actividad)
    VALUES ( id_punto_mejorable_seq.NEXTVAL,p_titulo,p_descripcion,p_cumplido,p_resultado,p_id_actividad);

    pr_obtener_punto_mejorable(id_punto_mejorable_seq.CURRVAL, p_punto_mejorable);

  END;

  PROCEDURE pr_eliminar_punto_mejorable(p_id_punto_mejorable punto_mejorable.id_punto_mejorable%TYPE) AS
  /**************************************************************************************************************
     NAME:      pr_eliminar_punto_mejorable
     PURPOSE		Elimina un punto mejorable sugun su ID

     REVISIONS:
     Ver          Date           Author                               Description
     ---------    ----------     -------------------                  ----------------------------------------------
     1.1           04/06/2020     Alejandro Del Pino       		       	1. Creación Procedimiento

  ***************************************************************************************************************/
  BEGIN
    DELETE FROM punto_mejorable WHERE id_punto_mejorable = p_id_punto_mejorable;
  END;

  PROCEDURE pr_modificar_punto_mejorable(p_punto_mejorable in tp_punto_mejorable) AS
  /**************************************************************************************************************
     NAME:      pr_modificar_punto_mejorable
     PURPOSE		Modifica datos de punto mejorable segun su ID

     REVISIONS:
     Ver          Date           Author                               Description
     ---------    ----------     -------------------                  ----------------------------------------------
     1.1           04/06/2020     Alejandro Del Pino       		       	1. Creación Procedimiento

  ***************************************************************************************************************/
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

  PROCEDURE pr_obtener_plan(p_id_plan plan.id_plan%TYPE, p_plan OUT tp_plan);
  PROCEDURE pr_obtener_planes ( p_plan OUT tb_plan);
  PROCEDURE pr_insertar_plan (p_plan IN OUT tp_plan);
  PROCEDURE pr_eliminar_plan (p_id_plan plan.id_plan%TYPE);
  PROCEDURE pr_modificar_plan (p_plan IN OUT tp_plan);

END pkg_plan;
/

CREATE OR REPLACE PACKAGE BODY pkg_plan AS
  PROCEDURE pr_obtener_plan(p_id_plan plan.id_plan%TYPE,  p_plan OUT tp_plan)  AS
  /**************************************************************************************************************
     NAME:      pr_obtener_plan
     PURPOSE		Obtiene datos de plan segun su ID

     REVISIONS:
     Ver          Date           Author                               Description
     ---------    ----------     -------------------                  ----------------------------------------------
     1.1           04/06/2020     Alejandro Del Pino       		       	1. Creación Procedimiento

  ***************************************************************************************************************/
  BEGIN
    SELECT id_plan,valor,descripcion
    INTO p_plan.id_plan,p_plan.valor,p_plan.descripcion
    FROM plan
    WHERE id_plan = p_id_plan;
  END;

  PROCEDURE pr_obtener_planes ( p_plan OUT tb_plan) AS
  /**************************************************************************************************************
     NAME:      pr_obtener_planes
     PURPOSE		Obtiene datos de todos los olanas y devuelve una lista del tipo tp_plan

     REVISIONS:
     Ver          Date           Author                               Description
     ---------    ----------     -------------------                  ----------------------------------------------
     1.1           04/06/2020     Alejandro Del Pino       		       	1. Creación Procedimiento

  ***************************************************************************************************************/
    CURSOR plan_cursor  IS
    SELECT id_plan,valor,descripcion
    FROM plan;
  BEGIN
    OPEN plan_cursor;
      LOOP
          FETCH plan_cursor BULK COLLECT INTO p_plan;
          EXIT WHEN plan_cursor%NOTFOUND;
      END LOOP;
  END;


  PROCEDURE pr_insertar_plan (p_plan IN OUT tp_plan) AS
  /**************************************************************************************************************
     NAME:      pr_insertar_plan
     PURPOSE		Inserta datos de un plan y devuelve el tipo tp_plan

     REVISIONS:
     Ver          Date           Author                               Description
     ---------    ----------     -------------------                  ----------------------------------------------
     1.1           04/06/2020     Alejandro Del Pino       		       	1. Creación Procedimiento

  ***************************************************************************************************************/
  BEGIN
    INSERT INTO plan (id_plan,valor,descripcion)
    VALUES (id_plan_seq.NEXTVAL,p_plan.valor,p_plan.descripcion);
  END;

  PROCEDURE pr_eliminar_plan (p_id_plan plan.id_plan%TYPE) AS
  /**************************************************************************************************************
     NAME:      pr_eliminar_plan
     PURPOSE		Eliman datos de plan segun su ID

     REVISIONS:
     Ver          Date           Author                               Description
     ---------    ----------     -------------------                  ----------------------------------------------
     1.1           04/06/2020     Alejandro Del Pino       		       	1. Creación Procedimiento

  ***************************************************************************************************************/
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

  PROCEDURE pr_obtener_contrato(p_id_cliente cliente.id_usuario%TYPE,p_contrato OUT tp_contrato);
  PROCEDURE pr_insertar_contrato(p_contrato IN OUT tp_contrato);
  PROCEDURE pr_eliminar_contrato(p_id_cliente cliente.id_usuario%TYPE);
  PROCEDURE pr_modificar_contrato(p_contrato IN OUT tp_contrato);
END pkg_contrato;
/
CREATE OR REPLACE PACKAGE BODY pkg_contrato AS

  PROCEDURE pr_obtener_contrato(p_id_cliente cliente.id_usuario%TYPE,p_contrato OUT tp_contrato) AS
  /**************************************************************************************************************
     NAME:      pr_obtener_contrato
     PURPOSE		Obtiene datos de contrato segun ID de cliente

     REVISIONS:
     Ver          Date           Author                               Description
     ---------    ----------     -------------------                  ----------------------------------------------
     1.1           04/06/2020     Alejandro Del Pino       		       	1. Creación Procedimiento

  ***************************************************************************************************************/
  BEGIN
    SELECT id_contrato,fecha_inicio,fecha_termino,fecha_facturacion,id_cliente,id_plan
    INTO p_contrato.id_contrato,p_contrato.fecha_inicio,p_contrato.fecha_termino,p_contrato.fecha_facturacion,p_contrato.id_cliente,p_contrato.id_plan
    FROM contrato
    WHERE p_id_cliente = p_id_cliente;
  END;

  PROCEDURE pr_insertar_contrato(p_contrato IN OUT tp_contrato) AS
  /**************************************************************************************************************
     NAME:      pr_insertar_contrato
     PURPOSE	  Inserta datos de contrato y devuelve tipos de tp_contrato

     REVISIONS:
     Ver          Date           Author                               Description
     ---------    ----------     -------------------                  ----------------------------------------------
     1.1           04/06/2020     Alejandro Del Pino       		       	1. Creación Procedimiento

  ***************************************************************************************************************/
  BEGIN
    INSERT INTO contrato (id_contrato,fecha_inicio,fecha_termino,fecha_facturacion,id_cliente,id_plan)
    VALUES(id_contrato_seq.NEXTVAL,p_contrato.fecha_inicio,p_contrato.fecha_termino,p_contrato.fecha_facturacion,p_contrato.id_cliente,p_contrato.id_plan);
  END;

  PROCEDURE pr_eliminar_contrato(p_id_cliente cliente.id_usuario%TYPE) AS
  /**************************************************************************************************************
     NAME:      pr_eliminar_contrato
     PURPOSE		Elimina datos de contrato segun ID de cliente

     REVISIONS:
     Ver          Date           Author                               Description
     ---------    ----------     -------------------                  ----------------------------------------------
     1.1           04/06/2020     Alejandro Del Pino       		       	1. Creación Procedimiento

  ***************************************************************************************************************/
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

  PROCEDURE pr_obtener_trabajador(p_id_trabajador trabajador.id_trabajador%TYPE, p_trabajador OUT tp_trabajador) ;
  PROCEDURE pr_obtener_trabajadores_actividad(p_id_actividad actividad.id_actividad%TYPE, p_trabajador OUT tb_trabajador);
  PROCEDURE pr_obtener_trabajador_cliente(p_id_cliente cliente.id_cliente%TYPE, p_trabajador OUT tb_trabajador);
  PROCEDURE pr_insertar_trabajador(p_trabajador IN OUT tp_trabajador);
  PROCEDURE pr_insertar_trabajador_actividad(p_id_trabajador trabajador.id_trabajador%TYPE, p_id_actividad actividad.id_actividad%TYPE);
  PROCEDURE pr_eliminar_trabajador(p_id_trabajador trabajador.id_trabajador%TYPE);
  PROCEDURE pr_modificar_trabajador(p_trabajador IN OUT tp_trabajador);
END pkg_trabajador;
/
CREATE OR REPLACE PACKAGE BODY pkg_trabajador AS

PROCEDURE pr_obtener_trabajador(p_id_trabajador trabajador.id_trabajador%TYPE, p_trabajador OUT tp_trabajador) AS
/**************************************************************************************************************
   NAME:      pr_obtener_trabajador
   PURPOSE		Obtiene datos de trabajador segun ID de trabajador

   REVISIONS:
   Ver          Date           Author                               Description
   ---------    ----------     -------------------                  ----------------------------------------------
   1.1           04/06/2020     Alejandro Del Pino       		       	1. Creación Procedimiento

***************************************************************************************************************/
  BEGIN
    SELECT id_trabajador,rut,dv,nombre,apellido_paterno,apellido_materno,id_cliente
    INTO p_trabajador.id_trabajador,p_trabajador.rut,p_trabajador.dv,p_trabajador.nombre,p_trabajador.apellido_paterno,p_trabajador.apellido_materno,p_trabajador.id_cliente
    FROM trabajador
    WHERE id_trabajador = p_id_trabajador;
  END;

  PROCEDURE pr_obtener_trabajadores_actividad(p_id_actividad actividad.id_actividad%TYPE, p_trabajador OUT tb_trabajador)  AS
  /**************************************************************************************************************
     NAME:      pr_obtener_trabajadores_actividad
     PURPOSE		Obtiene datos de trabajadores que asisten a una actividad, devuelve tipo tabla tb_trabajador

     REVISIONS:
     Ver          Date           Author                               Description
     ---------    ----------     -------------------                  ----------------------------------------------
     1.1           04/06/2020     Alejandro Del Pino       		       	1. Creación Procedimiento

  ***************************************************************************************************************/
    CURSOR trabajador_cursor  IS
    SELECT id_trabajador,rut,dv,nombre,apellido_paterno,apellido_materno,id_cliente
    FROM trabajador join actividad_trabajador USING(id_trabajador)
    WHERE id_actividad = p_id_actividad;
  BEGIN
    OPEN trabajador_cursor;
      LOOP
          FETCH trabajador_cursor BULK COLLECT INTO p_trabajador;
          EXIT WHEN trabajador_cursor%NOTFOUND;
      END LOOP;
  END;

  PROCEDURE pr_obtener_trabajador_cliente(p_id_cliente cliente.id_cliente%TYPE, p_trabajador OUT tb_trabajador)  AS
  /**************************************************************************************************************
     NAME:      pr_obtener_trabajador_cliente
     PURPOSE		Obtiene datos de trabajadorres aosciados a un cliente, devuelve tipo tabla tb_trabajador

     REVISIONS:
     Ver          Date           Author                               Description
     ---------    ----------     -------------------                  ----------------------------------------------
     1.1           04/06/2020     Alejandro Del Pino       		       	1. Creación Procedimiento

  ***************************************************************************************************************/
    CURSOR trabajador_cursor  IS
    SELECT id_trabajador,rut,dv,nombre,apellido_paterno,apellido_materno,id_cliente
    FROM trabajador
    WHERE id_cliente = p_id_cliente;
  BEGIN
    OPEN trabajador_cursor;
      LOOP
          FETCH trabajador_cursor BULK COLLECT INTO p_trabajador;
          EXIT WHEN trabajador_cursor%NOTFOUND;
      END LOOP;
  END;

  PROCEDURE pr_insertar_trabajador(p_trabajador IN OUT tp_trabajador) AS
  /**************************************************************************************************************
     NAME:      pr_insertar_trabajador
     PURPOSE		Inserta datos de Trabajador y devuelve tipo tp_trabajador

     REVISIONS:
     Ver          Date           Author                               Description
     ---------    ----------     -------------------                  ----------------------------------------------
     1.1           04/06/2020     Alejandro Del Pino       		       	1. Creación Procedimiento

  ***************************************************************************************************************/
  BEGIN
    INSERT INTO trabajador (id_trabajador,rut,dv,nombre,apellido_paterno,apellido_materno,id_cliente)
    VALUES (id_trabajador_seq.NEXTVAL,p_trabajador.rut,p_trabajador.dv,p_trabajador.nombre,p_trabajador.apellido_paterno,p_trabajador.apellido_materno,p_trabajador.id_cliente);
  END;

  PROCEDURE pr_insertar_trabajador_actividad(p_id_trabajador trabajador.id_trabajador%TYPE, p_id_actividad actividad.id_actividad%TYPE) AS
  /**************************************************************************************************************
     NAME:      pr_insertar_trabajador_actividad
     PURPOSE		Asocia trabajadores a una actividad determinada segun sus ID's

     REVISIONS:
     Ver          Date           Author                               Description
     ---------    ----------     -------------------                  ----------------------------------------------
     1.1           04/06/2020     Alejandro Del Pino       		       	1. Creación Procedimiento

  ***************************************************************************************************************/
  BEGIN
    INSERT INTO actividad_trabajador (id_trabajador, id_actividad)
    VALUES (p_id_trabajador, p_id_actividad);
  END;
  PROCEDURE pr_eliminar_trabajador(p_id_trabajador trabajador.id_trabajador%TYPE) AS
  BEGIN
    DELETE FROM trabajador WHERE id_trabajador = p_id_trabajador;
  END;
  PROCEDURE pr_modificar_trabajador(p_trabajador IN OUT tp_trabajador) AS
  /**************************************************************************************************************
     NAME:      r_modificar_trabajador
     PURPOSE		Modifica datos de trabajador segun ID

     REVISIONS:
     Ver          Date           Author                               Description
     ---------    ----------     -------------------                  ----------------------------------------------
     1.1           04/06/2020     Alejandro Del Pino       		       	1. Creación Procedimiento

  ***************************************************************************************************************/
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
/

CREATE OR REPLACE PACKAGE pkg_incidente AS

  TYPE tp_incidente IS RECORD (
    id_incidente  NUMBER(38),
    fecha         DATE,
    descripcion   VARCHAR2(600)
  );

  TYPE tb_incidente IS TABLE OF tp_incidente;

  PROCEDURE pr_obtener_incidente(p_id_incidente incidente.id_incidente%TYPE, p_incidente OUT tp_incidente);
  PROCEDURE pr_obtener_incidente_trabajador(p_id_trabajador trabajador.id_trabajador%TYPE, p_incidente OUT tb_incidente);
  PROCEDURE pr_obtener_incidente_cliente(p_id_cliente cliente.id_cliente%TYPE, p_incidente OUT tb_incidente);
  PROCEDURE pr_insertar_incidente(p_incidente IN OUT tp_incidente, p_id_trabajador trabajador.id_trabajador%TYPE);
  PROCEDURE pr_eliminar_incidente(p_id_incidente incidente.id_incidente%TYPE);
  PROCEDURE pr_modificar_incidente(p_incidente IN OUT tp_incidente);


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
  PROCEDURE pr_obtener_incidente_trabajador(p_id_trabajador trabajador.id_trabajador%TYPE, p_incidente OUT tb_incidente) AS
  /**************************************************************************************************************
     NAME:      pr_obtener_incidente_trabajador
     PURPOSE		Obtiene todos los incidentes segun trabajador y devuelve tipo tabla tb_incidente

     REVISIONS:
     Ver          Date           Author                               Description
     ---------    ----------     -------------------                  ----------------------------------------------
     1.1           04/06/2020     Alejandro Del Pino       		       	1. Creación Procedimiento

  ***************************************************************************************************************/
    CURSOR incidente_cursor IS
    SELECT id_incidente, fecha, descripcion
    FROM incidente JOIN trabajador_incidente USING(id_incidente)
    WHERE id_trabajador = p_id_trabajador;
  BEGIN
    OPEN incidente_cursor;
      LOOP
          FETCH incidente_cursor BULK COLLECT INTO p_incidente;
          EXIT WHEN incidente_cursor%NOTFOUND;
      END LOOP;
  END;
  PROCEDURE pr_obtener_incidente_cliente(p_id_cliente cliente.id_cliente%TYPE, p_incidente OUT tb_incidente) AS
  /**************************************************************************************************************
     NAME:      pr_obtener_incidente_cliente
     PURPOSE		Obtiene todos los incidentes segun cliente y devuelve tipo tabla tb_incidente

     REVISIONS:
     Ver          Date           Author                               Description
     ---------    ----------     -------------------                  ----------------------------------------------
     1.1           04/06/2020     Alejandro Del Pino       		       	1. Creación Procedimiento

  ***************************************************************************************************************/
    CURSOR incidente_cursor IS
    SELECT id_incidente, fecha, descripcion
    FROM incidente JOIN trabajador_incidente USING(id_incidente) JOIN trabajador USING(id_trabajador)
    WHERE id_cliente = p_id_cliente;
  BEGIN
    OPEN incidente_cursor;
      LOOP
          FETCH incidente_cursor BULK COLLECT INTO p_incidente;
          EXIT WHEN incidente_cursor%NOTFOUND;
      END LOOP;
  END;
  PROCEDURE pr_insertar_incidente(p_incidente IN OUT tp_incidente, p_id_trabajador trabajador.id_trabajador%TYPE) AS
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
    VALUES(id_incidente_seq.NEXTVAL, p_incidente.fecha, p_incidente.descripcion);
    INSERT INTO trabajador_incidente VALUES(p_id_trabajador, id_incidente_seq.CURRVAL);
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
  PROCEDURE pr_modificar_incidente(p_incidente IN OUT tp_incidente) AS
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
    SET fecha = p_incidente.fecha,
        descripcion = p_incidente.descripcion
    WHERE id_incidente = p_incidente.id_incidente;
  END;

END;
/

CREATE OR REPLACE PACKAGE pkg_notificacion AS

  TYPE tp_notificacion IS RECORD (
    id_notificacion  NUMBER(38),
    mensaje          VARCHAR2(1000),
    hora             DATE,
    id_usuario       NUMBER(38)
  );

  TYPE tb_notificacion IS TABLE OF tp_notificacion;

  PROCEDURE pr_obtener_notificacion(p_id_notificacion notificacion.id_notificacion%TYPE, p_notificacion OUT tp_notificacion);
  PROCEDURE pr_obtener_notificacion_usuario(p_id_usuario notificacion.id_usuario%TYPE,  p_notificacion OUT tb_notificacion) ;
  PROCEDURE pr_insertar_notificacion(p_notificacion IN OUT tp_notificacion);
  PROCEDURE pr_eliminar_notificacion(p_id_notificacion notificacion.id_notificacion%TYPE);

END;
/

CREATE OR REPLACE PACKAGE BODY pkg_notificacion AS

  PROCEDURE pr_obtener_notificacion(p_id_notificacion notificacion.id_notificacion%TYPE, p_notificacion OUT tp_notificacion) AS
  /**************************************************************************************************************
     NAME:      pr_obtener_notificacion
     PURPOSE		Obtiene datos de notificacion segun su ID

     REVISIONS:
     Ver          Date           Author                               Description
     ---------    ----------     -------------------                  ----------------------------------------------
     1.1           04/06/2020     Alejandro Del Pino       		       	1. Creación Procedimiento

  ***************************************************************************************************************/
  BEGIN
    SELECT id_notificacion,mensaje,hora,id_usuario
    INTO p_notificacion.id_notificacion,p_notificacion.mensaje,p_notificacion.hora,p_notificacion.id_usuario
    FROM notificacion
    WHERE id_notificacion = p_id_notificacion;
  END;

  PROCEDURE pr_obtener_notificacion_usuario(p_id_usuario notificacion.id_usuario%TYPE,  p_notificacion OUT tb_notificacion) AS
  /**************************************************************************************************************
     NAME:      pr_obtener_notificacion_usuario
     PURPOSE		Obtiene datos de notificacion segun su ID de usuario

     REVISIONS:
     Ver          Date           Author                               Description
     ---------    ----------     -------------------                  ----------------------------------------------
     1.1           04/06/2020     Alejandro Del Pino       		       	1. Creación Procedimiento

  ***************************************************************************************************************/
    CURSOR notificacion_cursor IS
    SELECT id_notificacion,mensaje,hora,id_usuario
    FROM notificacion
    WHERE id_usuario = p_id_usuario;
  BEGIN
    OPEN notificacion_cursor;
      LOOP
          FETCH notificacion_cursor BULK COLLECT INTO p_notificacion;
          EXIT WHEN notificacion_cursor%NOTFOUND;
      END LOOP;
  END;

  PROCEDURE pr_insertar_notificacion(p_notificacion IN OUT tp_notificacion) AS
  /**************************************************************************************************************
     NAME:      pr_insertar_notificacion
     PURPOSE		Inserta datos de una notificacion

     REVISIONS:
     Ver          Date           Author                               Description
     ---------    ----------     -------------------                  ----------------------------------------------
     1.1           04/06/2020     Alejandro Del Pino       		       	1. Creación Procedimiento

  ***************************************************************************************************************/
  BEGIN
    INSERT INTO notificacion (id_notificacion,mensaje,hora,id_usuario)
    VALUES (id_notificacion_seq.NEXTVAL,p_notificacion.mensaje,p_notificacion.hora,p_notificacion.id_usuario);
  END;

  PROCEDURE pr_eliminar_notificacion(p_id_notificacion notificacion.id_notificacion%TYPE) AS
  /**************************************************************************************************************
     NAME:      pr_eliminar_notificacion
     PURPOSE		Elimina datos de notificacion segun su ID 

     REVISIONS:
     Ver          Date           Author                               Description
     ---------    ----------     -------------------                  ----------------------------------------------
     1.1           04/06/2020     Alejandro Del Pino       		       	1. Creación Procedimiento

  ***************************************************************************************************************/
  BEGIN
    DELETE FROM notificacion WHERE id_notificacion = p_id_notificacion;
  END;
END;
/
