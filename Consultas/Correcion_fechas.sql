-- Correccion tipo de datos tablas de Date a NUMBER

-- Zona borrado de datos

DELETE FROM actividad WHERE 1 = 1;
DELETE FROM boleta WHERE 1 = 1;
DELETE FROM cargo_extra WHERE 1 = 1;
DELETE FROM contrato WHERE 1 = 1;
DELETE FROM incidente WHERE 1 = 1;
DELETE FROM notificacion WHERE 1 = 1;

-- Zona modificacion de columnas

ALTER TABLE actividad MODIFY fecha_inicio NUMBER;
ALTER TABLE boleta MODIFY fecha_pago NUMBER;
ALTER TABLE cargo_extra MODIFY fecha NUMBER;
ALTER TABLE contrato MODIFY fecha_inicio NUMBER;
ALTER TABLE contrato MODIFY fecha_termino NUMBER;
ALTER TABLE incidente MODIFY fecha NUMBER;
ALTER TABLE notificacion MODIFY hora NUMBER;
