CREATE TABLE actividad (
    id_actividad              INTEGER NOT NULL,
    nombre                    VARCHAR2(100) NOT NULL,
    descripcion               VARCHAR2(600) NOT NULL,
    estado                    CHAR(1) NOT NULL,
    fecha_inicio              DATE NOT NULL,
    resultado                 VARCHAR2(600),
    cantidad_modificaciones   INTEGER NOT NULL,
    id_profesional            INTEGER NOT NULL,
    id_cliente                INTEGER NOT NULL,
    id_tipo_actividad         INTEGER NOT NULL
);

CREATE UNIQUE INDEX actividad__idx ON
    actividad (
        id_tipo_actividad
    ASC );

ALTER TABLE actividad ADD CONSTRAINT actividad_pk PRIMARY KEY ( id_actividad );

CREATE TABLE actividad_trabajador (
    id_trabajador   INTEGER NOT NULL,
    id_actividad    INTEGER NOT NULL
);

ALTER TABLE actividad_trabajador ADD CONSTRAINT relation_12_pk PRIMARY KEY ( id_trabajador,
                                                                             id_actividad );

CREATE TABLE boleta (
    id_boleta    INTEGER NOT NULL,
    valor        INTEGER NOT NULL,
    medio_pago   VARCHAR2(200) NOT NULL,
    fecha_pago   DATE NOT NULL,
    id_cliente   INTEGER NOT NULL,
    id_plan      INTEGER NOT NULL
);

CREATE UNIQUE INDEX boleta__idx ON
    boleta (
        id_plan
    ASC );

ALTER TABLE boleta ADD CONSTRAINT boleta_pk PRIMARY KEY ( id_boleta );

CREATE TABLE cargo_extra (
    id_cargo_extra   INTEGER NOT NULL,
    valor            INTEGER NOT NULL,
    descripcion      VARCHAR2(200) NOT NULL,
    fecha            DATE NOT NULL,
    id_boleta        INTEGER NOT NULL
);

ALTER TABLE cargo_extra ADD CONSTRAINT cargo_extra_pk PRIMARY KEY ( id_cargo_extra );

CREATE TABLE cliente (
    id_usuario       INTEGER NOT NULL,
    id_cliente       INTEGER NOT NULL,
    nombre           VARCHAR2(100) NOT NULL,
    direccion        VARCHAR2(120) NOT NULL,
    rubro            VARCHAR2(100) NOT NULL,
    id_profesional   INTEGER NOT NULL
);

ALTER TABLE cliente ADD CONSTRAINT cliente_pk PRIMARY KEY ( id_cliente );

CREATE TABLE contrato (
    id_contrato         INTEGER NOT NULL,
    fecha_inicio        DATE NOT NULL,
    fecha_termino       DATE NOT NULL,
    fecha_facturacion   DATE,
    id_cliente          INTEGER NOT NULL,
    id_plan             INTEGER NOT NULL
);

CREATE UNIQUE INDEX contrato__idx ON
    contrato (
        id_cliente
    ASC );

CREATE UNIQUE INDEX contrato__idxv1 ON
    contrato (
        id_plan
    ASC );

ALTER TABLE contrato ADD CONSTRAINT contrato_pk PRIMARY KEY ( id_contrato );

CREATE TABLE incidente (
    id_incidente   INTEGER NOT NULL,
    fecha          DATE NOT NULL,
    descripcion    VARCHAR2(600) NOT NULL
);

ALTER TABLE incidente ADD CONSTRAINT incidente_pk PRIMARY KEY ( id_incidente );

CREATE TABLE modificaciones (
    id_modificaciones   INTEGER NOT NULL,
    descripcion         VARCHAR2(300) NOT NULL,
    id_mejorable        INTEGER NOT NULL
);

ALTER TABLE modificaciones ADD CONSTRAINT modificaciones_pk PRIMARY KEY ( id_modificaciones );

CREATE TABLE notificacion (
    id_notificacion   INTEGER NOT NULL,
    mensaje           VARCHAR2(1000) NOT NULL,
    hora              DATE NOT NULL,
    id_usuario        INTEGER NOT NULL
);

ALTER TABLE notificacion ADD CONSTRAINT notificacion_pk PRIMARY KEY ( id_notificacion );

CREATE TABLE plan (
    id_plan       INTEGER NOT NULL,
    valor         INTEGER NOT NULL,
    descripcion   VARCHAR2(300) NOT NULL
);

ALTER TABLE plan ADD CONSTRAINT plan_pk PRIMARY KEY ( id_plan );

CREATE TABLE profesional (
    id_usuario         INTEGER NOT NULL,
    id_profesional     INTEGER NOT NULL,
    nombre             VARCHAR2(120) NOT NULL,
    apellido_paterno   VARCHAR2(80) NOT NULL,
    apellido_materno   VARCHAR2(80) NOT NULL,
    rut                INTEGER NOT NULL,
    dv                 VARCHAR2(1) NOT NULL
);

ALTER TABLE profesional ADD CONSTRAINT profesional_pk PRIMARY KEY ( id_profesional );

CREATE TABLE punto_mejorable (
    id_punto_mejorable   INTEGER NOT NULL,
    titulo               VARCHAR2(80) NOT NULL,
    descripcion          VARCHAR2(300) NOT NULL,
    cumplido             CHAR(1) NOT NULL,
    resultado            VARCHAR2(300),
    id_actividad         INTEGER NOT NULL
);

ALTER TABLE punto_mejorable ADD CONSTRAINT punto_mejorable_pk PRIMARY KEY ( id_punto_mejorable );

CREATE TABLE rol (
    id_rol   INTEGER NOT NULL,
    nombre   VARCHAR2(80) NOT NULL
);

ALTER TABLE rol ADD CONSTRAINT rol_pk PRIMARY KEY ( id_rol );

CREATE TABLE tipo_actividad (
    id_tipo_actividad   INTEGER NOT NULL,
    nombre              VARCHAR2(80) NOT NULL
);

ALTER TABLE tipo_actividad ADD CONSTRAINT tipo_actividad_pk PRIMARY KEY ( id_tipo_actividad );

CREATE TABLE trabajador (
    id_trabajador      INTEGER NOT NULL,
    rut                INTEGER NOT NULL,
    dv                 VARCHAR2(1) NOT NULL,
    nombre             VARCHAR2(120) NOT NULL,
    apellido_paterno   VARCHAR2(80) NOT NULL,
    apellido_materno   VARCHAR2(80) NOT NULL,
    id_cliente         INTEGER NOT NULL
);

ALTER TABLE trabajador ADD CONSTRAINT trabajador_pk PRIMARY KEY ( id_trabajador );

CREATE TABLE trabajador_incidente (
    id_trabajador   INTEGER NOT NULL,
    id_incidente    INTEGER NOT NULL
);

ALTER TABLE trabajador_incidente ADD CONSTRAINT relation_20_pk PRIMARY KEY ( id_trabajador,
                                                                             id_incidente );

CREATE TABLE usuario (
    id_usuario   INTEGER NOT NULL,
    username     VARCHAR2(80) NOT NULL,
    password     VARCHAR2(40) NOT NULL,
    telefono     VARCHAR2(12) NOT NULL,
    correo       VARCHAR2(80) NOT NULL,
    id_rol       INTEGER NOT NULL
);

CREATE UNIQUE INDEX usuario__idx ON
    usuario (
        id_rol
    ASC );

ALTER TABLE usuario ADD CONSTRAINT usuario_pk PRIMARY KEY ( id_usuario );

ALTER TABLE usuario ADD CONSTRAINT usuario__un UNIQUE ( username );

ALTER TABLE actividad
    ADD CONSTRAINT actividad_cliente_fk FOREIGN KEY ( id_cliente )
        REFERENCES cliente ( id_cliente );

ALTER TABLE actividad
    ADD CONSTRAINT actividad_profesional_fk FOREIGN KEY ( id_profesional )
        REFERENCES profesional ( id_profesional );

ALTER TABLE actividad
    ADD CONSTRAINT actividad_tipo_actividad_fk FOREIGN KEY ( id_tipo_actividad )
        REFERENCES tipo_actividad ( id_tipo_actividad );

ALTER TABLE boleta
    ADD CONSTRAINT boleta_cliente_fk FOREIGN KEY ( id_cliente )
        REFERENCES cliente ( id_cliente );

ALTER TABLE boleta
    ADD CONSTRAINT boleta_plan_fk FOREIGN KEY ( id_plan )
        REFERENCES plan ( id_plan );

ALTER TABLE cargo_extra
    ADD CONSTRAINT cargo_extra_boleta_fk FOREIGN KEY ( id_boleta )
        REFERENCES boleta ( id_boleta );

ALTER TABLE cliente
    ADD CONSTRAINT cliente_profesional_fk FOREIGN KEY ( id_profesional )
        REFERENCES profesional ( id_profesional );

ALTER TABLE cliente
    ADD CONSTRAINT cliente_usuario_fk FOREIGN KEY ( id_usuario )
        REFERENCES usuario ( id_usuario );

ALTER TABLE contrato
    ADD CONSTRAINT contrato_cliente_fk FOREIGN KEY ( id_cliente )
        REFERENCES cliente ( id_cliente );

ALTER TABLE contrato
    ADD CONSTRAINT contrato_plan_fk FOREIGN KEY ( id_plan )
        REFERENCES plan ( id_plan );

--  ERROR: FK name length exceeds maximum allowed length(30) 
ALTER TABLE modificaciones
    ADD CONSTRAINT modificaciones_mejorable_fk FOREIGN KEY ( id_mejorable )
        REFERENCES punto_mejorable ( id_punto_mejorable );

ALTER TABLE notificacion
    ADD CONSTRAINT notificacion_usuario_fk FOREIGN KEY ( id_usuario )
        REFERENCES usuario ( id_usuario );

ALTER TABLE profesional
    ADD CONSTRAINT profesional_usuario_fk FOREIGN KEY ( id_usuario )
        REFERENCES usuario ( id_usuario );

ALTER TABLE punto_mejorable
    ADD CONSTRAINT punto_mejorable_actividad_fk FOREIGN KEY ( id_actividad )
        REFERENCES actividad ( id_actividad );

ALTER TABLE actividad_trabajador
    ADD CONSTRAINT relation_12_actividad_fk FOREIGN KEY ( id_actividad )
        REFERENCES actividad ( id_actividad );

ALTER TABLE actividad_trabajador
    ADD CONSTRAINT relation_12_trabajador_fk FOREIGN KEY ( id_trabajador )
        REFERENCES trabajador ( id_trabajador );

ALTER TABLE trabajador_incidente
    ADD CONSTRAINT relation_20_incidente_fk FOREIGN KEY ( id_incidente )
        REFERENCES incidente ( id_incidente );

ALTER TABLE trabajador_incidente
    ADD CONSTRAINT relation_20_trabajador_fk FOREIGN KEY ( id_trabajador )
        REFERENCES trabajador ( id_trabajador );

ALTER TABLE trabajador
    ADD CONSTRAINT trabajador_cliente_fk FOREIGN KEY ( id_cliente )
        REFERENCES cliente ( id_cliente );

ALTER TABLE usuario
    ADD CONSTRAINT usuario_rol_fk FOREIGN KEY ( id_rol )
        REFERENCES rol ( id_rol );

--  ERROR: No Discriminator Column found in Arc FKArc_1 - constraint trigger for Arc cannot be generated 

--  ERROR: No Discriminator Column found in Arc FKArc_1 - constraint trigger for Arc cannot be generated

CREATE SEQUENCE actividad_id_actividad_seq START WITH 1 INCREMENT BY 1NOCACHE ORDER;

CREATE OR REPLACE TRIGGER actividad_id_actividad_trg BEFORE
    INSERT ON actividad
    FOR EACH ROW
    WHEN ( new.id_actividad IS NULL )
BEGIN
    :new.id_actividad := actividad_id_actividad_seq.nextval;
END;
/

CREATE SEQUENCE boleta_id_boleta_seq START WITH 1 INCREMENT BY 1NOCACHE ORDER;

CREATE OR REPLACE TRIGGER boleta_id_boleta_trg BEFORE
    INSERT ON boleta
    FOR EACH ROW
    WHEN ( new.id_boleta IS NULL )
BEGIN
    :new.id_boleta := boleta_id_boleta_seq.nextval;
END;
/

CREATE SEQUENCE cliente_id_cliente_seq START WITH 1 INCREMENT BY 1NOCACHE ORDER;

CREATE OR REPLACE TRIGGER cliente_id_cliente_trg BEFORE
    INSERT ON cliente
    FOR EACH ROW
    WHEN ( new.id_cliente IS NULL )
BEGIN
    :new.id_cliente := cliente_id_cliente_seq.nextval;
END;
/

CREATE SEQUENCE contrato_id_contrato_seq START WITH 1 INCREMENT BY 1NOCACHE ORDER;

CREATE OR REPLACE TRIGGER contrato_id_contrato_trg BEFORE
    INSERT ON contrato
    FOR EACH ROW
    WHEN ( new.id_contrato IS NULL )
BEGIN
    :new.id_contrato := contrato_id_contrato_seq.nextval;
END;
/

CREATE SEQUENCE incidente_id_incidente_seq START WITH 1 INCREMENT BY 1NOCACHE ORDER;

CREATE OR REPLACE TRIGGER incidente_id_incidente_trg BEFORE
    INSERT ON incidente
    FOR EACH ROW
    WHEN ( new.id_incidente IS NULL )
BEGIN
    :new.id_incidente := incidente_id_incidente_seq.nextval;
END;
/

CREATE SEQUENCE modificaciones_id_modificacion START WITH 1 INCREMENT BY 1NOCACHE ORDER;

CREATE OR REPLACE TRIGGER modificaciones_id_modificacion BEFORE
    INSERT ON modificaciones
    FOR EACH ROW
    WHEN ( new.id_modificaciones IS NULL )
BEGIN
    :new.id_modificaciones := modificaciones_id_modificacion.nextval;
END;
/

CREATE SEQUENCE notificacion_id_notificacion START WITH 1 INCREMENT BY 1NOCACHE ORDER;

CREATE OR REPLACE TRIGGER notificacion_id_notificacion BEFORE
    INSERT ON notificacion
    FOR EACH ROW
    WHEN ( new.id_notificacion IS NULL )
BEGIN
    :new.id_notificacion := notificacion_id_notificacion.nextval;
END;
/

CREATE SEQUENCE plan_id_plan_seq START WITH 1 INCREMENT BY 1NOCACHE ORDER;

CREATE OR REPLACE TRIGGER plan_id_plan_trg BEFORE
    INSERT ON plan
    FOR EACH ROW
    WHEN ( new.id_plan IS NULL )
BEGIN
    :new.id_plan := plan_id_plan_seq.nextval;
END;
/

CREATE SEQUENCE profesional_id_profesional_seq START WITH 1 INCREMENT BY 1NOCACHE ORDER;

CREATE OR REPLACE TRIGGER profesional_id_profesional_trg BEFORE
    INSERT ON profesional
    FOR EACH ROW
    WHEN ( new.id_profesional IS NULL )
BEGIN
    :new.id_profesional := profesional_id_profesional_seq.nextval;
END;
/

CREATE SEQUENCE punto_mejorable_id_punto_mejor START WITH 1 INCREMENT BY 1NOCACHE ORDER;

CREATE OR REPLACE TRIGGER punto_mejorable_id_punto_mejor BEFORE
    INSERT ON punto_mejorable
    FOR EACH ROW
    WHEN ( new.id_punto_mejorable IS NULL )
BEGIN
    :new.id_punto_mejorable := punto_mejorable_id_punto_mejor.nextval;
END;
/

CREATE SEQUENCE rol_id_rol_seq START WITH 1 INCREMENT BY 1NOCACHE ORDER;

CREATE OR REPLACE TRIGGER rol_id_rol_trg BEFORE
    INSERT ON rol
    FOR EACH ROW
    WHEN ( new.id_rol IS NULL )
BEGIN
    :new.id_rol := rol_id_rol_seq.nextval;
END;
/

CREATE SEQUENCE tipo_actividad_id_tipo_activid START WITH 1 INCREMENT BY 1NOCACHE ORDER;

CREATE OR REPLACE TRIGGER tipo_actividad_id_tipo_activid BEFORE
    INSERT ON tipo_actividad
    FOR EACH ROW
    WHEN ( new.id_tipo_actividad IS NULL )
BEGIN
    :new.id_tipo_actividad := tipo_actividad_id_tipo_activid.nextval;
END;
/

CREATE SEQUENCE trabajador_id_trabajador_seq START WITH 1 INCREMENT BY 1NOCACHE ORDER;

CREATE OR REPLACE TRIGGER trabajador_id_trabajador_trg BEFORE
    INSERT ON trabajador
    FOR EACH ROW
    WHEN ( new.id_trabajador IS NULL )
BEGIN
    :new.id_trabajador := trabajador_id_trabajador_seq.nextval;
END;
/

CREATE SEQUENCE usuario_id_usuario_seq START WITH 1 INCREMENT BY 1NOCACHE ORDER;

CREATE OR REPLACE TRIGGER usuario_id_usuario_trg BEFORE
    INSERT ON usuario
    FOR EACH ROW
    WHEN ( new.id_usuario IS NULL )
BEGIN
    :new.id_usuario := usuario_id_usuario_seq.nextval;
END;
/
