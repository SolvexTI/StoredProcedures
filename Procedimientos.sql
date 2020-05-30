create or replace PACKAGE pkg_solvexti_usuario IS
    
    TYPE tp_cliente IS RECORD(
        id_usuario USUARIO.ID_USUARIO%TYPE,
        id_cliente CLIENTE.ID_CLIENTE%TYPE,
        id_profesional CLIENTE.ID_PROFESIONAL%TYPE,
        nombre CLIENTE.NOMBRE%TYPE,
        direccion CLIENTE.DIRECCION%TYPE,
        rubro CLIENTE.RUBRO%TYPE,
        username VARCHAR2(80),
        password USUARIO.PASSWORD%TYPE,
        telefono USUARIO.TELEFONO%TYPE,
        correo USUARIO.CORREO%TYPE,
        rol VARCHAR2(80)   
    );

     TYPE tp_profesional IS RECORD(
        id_usuario USUARIO.ID_USUARIO%TYPE,
        id_profesional USUARIO.ID_USUARIO%TYPE,
        nombre PROFESIONAL.NOMBRE%TYPE,
        apellido_paterno PROFESIONAL.APELLIDO_PATERNO%TYPE,
        apellido_materno PROFESIONAL.APELLIDO_MATERNO%TYPE,
        rut PROFESIONAL.RUT%TYPE,
        dv PROFESIONAL.DV%TYPE,
        username VARCHAR2(80),
        password USUARIO.PASSWORD%TYPE,
        telefono USUARIO.TELEFONO%TYPE,
        correo USUARIO.CORREO%TYPE,
        rol VARCHAR2(80)     
    );



  --PROCEDURE pr_buscar_usuario(id_usuario NUMBER);
    FUNCTION fn_obtener_cliente(p_id_cliente NUMBER) RETURN tp_cliente; 
    PROCEDURE pr_insertar_cliente(p_cliente tp_cliente);
  --PROCEDURE pr_editar_cliente (p_id_usuario NUMBER);
  --PROCEDURE pr_eliminar_cliente (p_id_usuario NUMBER);
    FUNCTION fn_obtener_profesional(p_id_profesional NUMBER) RETURN tp_profesional; 
    PROCEDURE pr_insertar_profesional(p_profesional tp_profesional);
END pkg_solvexti_usuario;
/


create or replace PACKAGE BODY pkg_solvexti_usuario IS
    
    FUNCTION fn_obtener_cliente(p_id_cliente NUMBER) RETURN tp_cliente IS
        v_cliente tp_cliente;
    BEGIN
        SELECT id_usuario, C.ID_CLIENTE, C.NOMBRE,C.DIRECCION, U.USERNAME, U.PASSWORD, U.TELEFONO, U.CORREO, R.NOMBRE, C.ID_PROFESIONAL
        INTO V_CLIENTE.ID_USUARIO, V_CLIENTE.ID_CLIENTE, V_CLIENTE.NOMBRE,V_CLIENTE.DIRECCION, V_CLIENTE.USERNAME, 
        V_CLIENTE.PASSWORD, V_CLIENTE.TELEFONO, V_CLIENTE.CORREO, V_CLIENTE.ROL, V_CLIENTE.ID_PROFESIONAL
        FROM USUARIO u JOIN CLIENTE c USING (id_usuario)
        JOIN ROL r USING(id_rol)
        WHERE ID_USUARIO = P_ID_CLIENTE;

        RETURN V_CLIENTE;
    END fn_obtener_cliente;

    PROCEDURE pr_insertar_cliente(p_cliente tp_cliente) IS

        v_id_rol ROL.ID_ROL%TYPE;
        V_id_usuario USUARIO.ID_USUARIO%TYPE;
    BEGIN

        SELECT ID_ROL INTO V_ID_ROL FROM ROL WHERE NOMBRE LIKE P_CLIENTE.rol;

        INSERT INTO USUARIO 
        VALUES( USUARIO_ID_USUARIO_SEQ.NEXTVAL, p_cliente.username, P_CLIENTE.password, P_CLIENTE.telefono, P_CLIENTE.correo, 1);

        SELECT ID_USUARIO INTO V_ID_USUARIO FROM USUARIO WHERE USERNAME LIKE P_CLIENTE.username;

       INSERT INTO CLIENTE (ID_USUARIO, NOMBRE, DIRECCION, RUBRO, ID_PROFESIONAL ) 
       VALUES(V_ID_USUARIO, P_CLIENTE.NOMBRE, P_CLIENTE.DIRECCION, P_CLIENTE.RUBRO, P_CLIENTE.ID_PROFESIONAL);
    END;

    FUNCTION fn_obtener_profesional(p_id_profesional NUMBER) RETURN tp_profesional IS
        v_profesional tp_profesional;
    BEGIN

        SELECT ID_USUARIO, P.ID_PROFESIONAL, P.NOMBRE, P.APELLIDO_PATERNO, P.APELLIDO_MATERNO, P.RUT,
               P.DV, U.USERNAME, U.PASSWORD, U.TELEFONO, U.CORREO, R.NOMBRE
        INTO  V_PROFESIONAL.ID_USUARIO, V_PROFESIONAL.ID_PROFESIONAL, V_PROFESIONAL.NOMBRE, V_PROFESIONAL.APELLIDO_PATERNO, 
              V_PROFESIONAL.APELLIDO_MATERNO, V_PROFESIONAL.RUT, V_PROFESIONAL.DV, V_PROFESIONAL.USERNAME, V_PROFESIONAL.PASSWORD, 
              V_PROFESIONAL.TELEFONO, V_PROFESIONAL.CORREO, V_PROFESIONAL.ROL
        FROM profesional p JOIN usuario u USING (id_usuario) 
        JOIN rol r using (id_rol);
        RETURN V_PROFESIONAL;
    END fn_obtener_profesional;

    PROCEDURE pr_insertar_profesional(p_profesional tp_profesional) IS
       v_id_usuario USUARIO.ID_USUARIO%TYPE;
       BEGIN
            
            
         INSERT INTO USUARIO (username, PASSWORD, TELEFONO, CORREO, ID_ROL) 
         VALUES( P_PROFESIONAL.username, P_PROFESIONAL.password, P_PROFESIONAL.telefono, P_PROFESIONAL.correo, 2);
           
         SELECT ID_USUARIO INTO V_ID_USUARIO FROM USUARIO WHERE USERNAME LIKE P_PROFESIONAL.USERNAME;
         
        -- INSERT INTO PROFESIONAL (id_usuario, nombre, apellido_paterno, apellido_materno, rut, dv) 
        -- VALUES(V_ID_USUARIO, P_PROFESIONAL.nombre, P_PROFESIONAL.apellido_paterno, P_PROFESIONAL.apellido_materno, P_PROFESIONAL.rut, P_PROFESIONAL.dv);
         
           
          
        END;
END pkg_solvexti_usuario;
/




