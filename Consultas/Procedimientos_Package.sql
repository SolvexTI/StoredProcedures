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

END pkg_profesional;
/