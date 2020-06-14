set SERVEROUTPUT ON;


DECLARE
    v_cliente PKG_CLIENTE.tp_cliente;
    v_profesional PKG_PROFESIONAL.tp_profesional;
BEGIN
     v_profesional.username := '3';
     v_profesional.password := '1';
     v_profesional.telefono := '1';
     v_profesional.correo := '1';
     v_profesional.nombre := '1';
     v_profesional.apellido_paterno := '1';
     v_profesional.apellido_materno := '1';
     v_profesional.rut := 1;
     v_profesional.dv := '1';
    PKG_PROFESIONAL.PR_INSERTAR_PROFESIONAL(V_PROFESIONAL);
END;
/

desc ACTIVIDAD;

DECLARE
 v_actividad pkg_actividad.tp_actividad;

BEGIN
PKG_ACTIVIDAD.PR_INSERTAR_ACTIVIDAD(
                'Asesoria General',
                'Asesoria General',
                'A',
                TO_DATE('05/06/2020', 'dd/mm/yyyy'),
                'Sin resultado aun',
                0,
                1,
                1,
                'Asesoria genEral',
                v_actividad
                );

 DBMS_OUTPUT.PUT_LINE(v_actividad.nombre);
END;
/



DECLARE
    CURSOR c (tb_actividad PKG_ACTIVIDAD.tb_actividad) IS SELECT * FROM table(tb_actividad);
    tb_actividad PKG_ACTIVIDAD.tb_actividad;
BEGIN
    tb_actividad := PKG_ACTIVIDAD.FN_OBTENER_ACTIVIDAD_CLIENTE(1);

    FOR i IN c(TB_ACTIVIDAD) LOOP
          DBMS_OUTPUT.PUT_LINE(i.nombre);
        END LOOP;

END;
/

  SELECT username,password,telefono,correo,id_profesional,nombre,apellido_paterno,apellido_materno,rut,dv
    FROM usuario u JOIN profesional p USING(id_usuario);
