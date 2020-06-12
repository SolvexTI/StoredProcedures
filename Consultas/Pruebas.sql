set SERVEROUTPUT ON;


DECLARE 
    v_cliente PKG_CLIENTE.tp_cliente;
BEGIN

    PKG_CLIENTE.PR_INSERTAR_CLIENTE('EssS.DELPINO', 'ES.DELPINO', '+56942035153', 'ES.DELPINO@ALUMNOS.DUOC.CL','DUOC UC', 'ANTONIO VARAS #666', 'EDUCACION', 1,V_CLIENTE);
    --v_cliente := PKG_CLIENTE.FN_OBTENER_CLIENTE(3);
    DBMS_OUTPUT.PUT_LINE(v_cliente.nombre);
    
    
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

desc NOTIFICACION;


SELECT * FROm punto_mejorable join actividad using (id_actividad);
