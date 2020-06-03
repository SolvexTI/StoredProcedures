--------------------------------------------------------
-- Archivo creado  - mi�rcoles-junio-03-2020   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Sequence ID_ACTIVIDAD_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "SOLVEXTI_V3"."ID_ACTIVIDAD_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;
--------------------------------------------------------
--  DDL for Sequence ID_BOLETA_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "SOLVEXTI_V3"."ID_BOLETA_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;
--------------------------------------------------------
--  DDL for Sequence ID_CLIENTE_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "SOLVEXTI_V3"."ID_CLIENTE_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;
--------------------------------------------------------
--  DDL for Sequence ID_CONTRATO_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "SOLVEXTI_V3"."ID_CONTRATO_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;
--------------------------------------------------------
--  DDL for Sequence ID_INCIDENTE_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "SOLVEXTI_V3"."ID_INCIDENTE_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;
--------------------------------------------------------
--  DDL for Sequence ID_MODIFICACION
--------------------------------------------------------

   CREATE SEQUENCE  "SOLVEXTI_V3"."ID_MODIFICACION"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;
--------------------------------------------------------
--  DDL for Sequence ID_NOTIFICACION_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "SOLVEXTI_V3"."ID_NOTIFICACION_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;
--------------------------------------------------------
--  DDL for Sequence ID_PLAN_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "SOLVEXTI_V3"."ID_PLAN_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;
--------------------------------------------------------
--  DDL for Sequence ID_PROFESIONAL_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "SOLVEXTI_V3"."ID_PROFESIONAL_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 21 CACHE 20 NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;
--------------------------------------------------------
--  DDL for Sequence ID_PUNTO_MEJORABLE_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "SOLVEXTI_V3"."ID_PUNTO_MEJORABLE_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;
--------------------------------------------------------
--  DDL for Sequence ID_ROL_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "SOLVEXTI_V3"."ID_ROL_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 21 CACHE 20 NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;
--------------------------------------------------------
--  DDL for Sequence ID_TIPO_ACTIVIDAD_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "SOLVEXTI_V3"."ID_TIPO_ACTIVIDAD_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;
--------------------------------------------------------
--  DDL for Sequence ID_TRABAJADOR_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "SOLVEXTI_V3"."ID_TRABAJADOR_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;
--------------------------------------------------------
--  DDL for Sequence ID_USUARIO_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "SOLVEXTI_V3"."ID_USUARIO_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 21 CACHE 20 NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;
--------------------------------------------------------
--  DDL for Table ACTIVIDAD
--------------------------------------------------------

  CREATE TABLE "SOLVEXTI_V3"."ACTIVIDAD" 
   (	"ID_ACTIVIDAD" NUMBER(*,0), 
	"NOMBRE" VARCHAR2(100 BYTE), 
	"DESCRIPCION" VARCHAR2(600 BYTE), 
	"ESTADO" CHAR(1 BYTE), 
	"FECHA_INICIO" DATE, 
	"RESULTADO" VARCHAR2(600 BYTE), 
	"CANTIDAD_MODIFICACIONES" NUMBER(*,0), 
	"ID_PROFESIONAL" NUMBER(*,0), 
	"ID_CLIENTE" NUMBER(*,0), 
	"ID_TIPO_ACTIVIDAD" NUMBER(*,0)
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table ACTIVIDAD_TRABAJADOR
--------------------------------------------------------

  CREATE TABLE "SOLVEXTI_V3"."ACTIVIDAD_TRABAJADOR" 
   (	"ID_TRABAJADOR" NUMBER(*,0), 
	"ID_ACTIVIDAD" NUMBER(*,0)
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table BOLETA
--------------------------------------------------------

  CREATE TABLE "SOLVEXTI_V3"."BOLETA" 
   (	"ID_BOLETA" NUMBER(*,0), 
	"VALOR" NUMBER(*,0), 
	"MEDIO_PAGO" VARCHAR2(200 BYTE), 
	"FECHA_PAGO" DATE, 
	"ID_CLIENTE" NUMBER(*,0), 
	"ID_PLAN" NUMBER(*,0)
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table CARGO_EXTRA
--------------------------------------------------------

  CREATE TABLE "SOLVEXTI_V3"."CARGO_EXTRA" 
   (	"ID_CARGO_EXTRA" NUMBER(*,0), 
	"VALOR" NUMBER(*,0), 
	"DESCRIPCION" VARCHAR2(200 BYTE), 
	"FECHA" DATE, 
	"ID_BOLETA" NUMBER(*,0)
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table CLIENTE
--------------------------------------------------------

  CREATE TABLE "SOLVEXTI_V3"."CLIENTE" 
   (	"ID_USUARIO" NUMBER(*,0), 
	"ID_CLIENTE" NUMBER(*,0), 
	"NOMBRE" VARCHAR2(100 BYTE), 
	"DIRECCION" VARCHAR2(120 BYTE), 
	"RUBRO" VARCHAR2(100 BYTE), 
	"ID_PROFESIONAL" NUMBER(*,0)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table CONTRATO
--------------------------------------------------------

  CREATE TABLE "SOLVEXTI_V3"."CONTRATO" 
   (	"ID_CONTRATO" NUMBER(*,0), 
	"FECHA_INICIO" DATE, 
	"FECHA_TERMINO" DATE, 
	"FECHA_FACTURACION" DATE, 
	"ID_CLIENTE" NUMBER(*,0), 
	"ID_PLAN" NUMBER(*,0)
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table INCIDENTE
--------------------------------------------------------

  CREATE TABLE "SOLVEXTI_V3"."INCIDENTE" 
   (	"ID_INCIDENTE" NUMBER(*,0), 
	"FECHA" DATE, 
	"DESCRIPCION" VARCHAR2(600 BYTE)
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table MODIFICACIONES
--------------------------------------------------------

  CREATE TABLE "SOLVEXTI_V3"."MODIFICACIONES" 
   (	"ID_MODIFICACIONES" NUMBER(*,0), 
	"DESCRIPCION" VARCHAR2(300 BYTE), 
	"ID_MEJORABLE" NUMBER(*,0)
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table NOTIFICACION
--------------------------------------------------------

  CREATE TABLE "SOLVEXTI_V3"."NOTIFICACION" 
   (	"ID_NOTIFICACION" NUMBER(*,0), 
	"MENSAJE" VARCHAR2(1000 BYTE), 
	"HORA" DATE, 
	"ID_USUARIO" NUMBER(*,0)
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table PLAN
--------------------------------------------------------

  CREATE TABLE "SOLVEXTI_V3"."PLAN" 
   (	"ID_PLAN" NUMBER(*,0), 
	"VALOR" NUMBER(*,0), 
	"DESCRIPCION" VARCHAR2(300 BYTE)
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table PROFESIONAL
--------------------------------------------------------

  CREATE TABLE "SOLVEXTI_V3"."PROFESIONAL" 
   (	"ID_USUARIO" NUMBER(*,0), 
	"ID_PROFESIONAL" NUMBER(*,0), 
	"NOMBRE" VARCHAR2(120 BYTE), 
	"APELLIDO_PATERNO" VARCHAR2(80 BYTE), 
	"APELLIDO_MATERNO" VARCHAR2(80 BYTE), 
	"RUT" NUMBER(*,0), 
	"DV" VARCHAR2(1 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table PUNTO_MEJORABLE
--------------------------------------------------------

  CREATE TABLE "SOLVEXTI_V3"."PUNTO_MEJORABLE" 
   (	"ID_PUNTO_MEJORABLE" NUMBER(*,0), 
	"TITULO" VARCHAR2(80 BYTE), 
	"DESCRIPCION" VARCHAR2(300 BYTE), 
	"CUMPLIDO" CHAR(1 BYTE), 
	"RESULTADO" VARCHAR2(300 BYTE), 
	"ID_ACTIVIDAD" NUMBER(*,0)
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table ROL
--------------------------------------------------------

  CREATE TABLE "SOLVEXTI_V3"."ROL" 
   (	"ID_ROL" NUMBER(*,0), 
	"NOMBRE" VARCHAR2(80 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table TIPO_ACTIVIDAD
--------------------------------------------------------

  CREATE TABLE "SOLVEXTI_V3"."TIPO_ACTIVIDAD" 
   (	"ID_TIPO_ACTIVIDAD" NUMBER(*,0), 
	"NOMBRE" VARCHAR2(80 BYTE)
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table TRABAJADOR
--------------------------------------------------------

  CREATE TABLE "SOLVEXTI_V3"."TRABAJADOR" 
   (	"ID_TRABAJADOR" NUMBER(*,0), 
	"RUT" NUMBER(*,0), 
	"DV" VARCHAR2(1 BYTE), 
	"NOMBRE" VARCHAR2(120 BYTE), 
	"APELLIDO_PATERNO" VARCHAR2(80 BYTE), 
	"APELLIDO_MATERNO" VARCHAR2(80 BYTE), 
	"ID_CLIENTE" NUMBER(*,0)
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table TRABAJADOR_INCIDENTE
--------------------------------------------------------

  CREATE TABLE "SOLVEXTI_V3"."TRABAJADOR_INCIDENTE" 
   (	"ID_TRABAJADOR" NUMBER(*,0), 
	"ID_INCIDENTE" NUMBER(*,0)
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table USUARIO
--------------------------------------------------------

  CREATE TABLE "SOLVEXTI_V3"."USUARIO" 
   (	"ID_USUARIO" NUMBER(*,0), 
	"USERNAME" VARCHAR2(80 BYTE), 
	"PASSWORD" VARCHAR2(40 BYTE), 
	"TELEFONO" VARCHAR2(12 BYTE), 
	"CORREO" VARCHAR2(80 BYTE), 
	"ID_ROL" NUMBER(*,0)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
REM INSERTING into SOLVEXTI_V3.ACTIVIDAD
SET DEFINE OFF;
REM INSERTING into SOLVEXTI_V3.ACTIVIDAD_TRABAJADOR
SET DEFINE OFF;
REM INSERTING into SOLVEXTI_V3.BOLETA
SET DEFINE OFF;
REM INSERTING into SOLVEXTI_V3.CARGO_EXTRA
SET DEFINE OFF;
REM INSERTING into SOLVEXTI_V3.CLIENTE
SET DEFINE OFF;
REM INSERTING into SOLVEXTI_V3.CONTRATO
SET DEFINE OFF;
REM INSERTING into SOLVEXTI_V3.INCIDENTE
SET DEFINE OFF;
REM INSERTING into SOLVEXTI_V3.MODIFICACIONES
SET DEFINE OFF;
REM INSERTING into SOLVEXTI_V3.NOTIFICACION
SET DEFINE OFF;
REM INSERTING into SOLVEXTI_V3.PLAN
SET DEFINE OFF;
REM INSERTING into SOLVEXTI_V3.PROFESIONAL
SET DEFINE OFF;
Insert into SOLVEXTI_V3.PROFESIONAL (ID_USUARIO,ID_PROFESIONAL,NOMBRE,APELLIDO_PATERNO,APELLIDO_MATERNO,RUT,DV) values ('2','1','ALEJANDRP','DEL PINO','ACEVEDO','19307652','1');
Insert into SOLVEXTI_V3.PROFESIONAL (ID_USUARIO,ID_PROFESIONAL,NOMBRE,APELLIDO_PATERNO,APELLIDO_MATERNO,RUT,DV) values ('2','2','ALEJANDRP','DEL PINO','ACEVEDO','19307652','1');
REM INSERTING into SOLVEXTI_V3.PUNTO_MEJORABLE
SET DEFINE OFF;
REM INSERTING into SOLVEXTI_V3.ROL
SET DEFINE OFF;
Insert into SOLVEXTI_V3.ROL (ID_ROL,NOMBRE) values ('1','Administrador');
Insert into SOLVEXTI_V3.ROL (ID_ROL,NOMBRE) values ('2','Profesional');
Insert into SOLVEXTI_V3.ROL (ID_ROL,NOMBRE) values ('3','Cliente');
REM INSERTING into SOLVEXTI_V3.TIPO_ACTIVIDAD
SET DEFINE OFF;
REM INSERTING into SOLVEXTI_V3.TRABAJADOR
SET DEFINE OFF;
REM INSERTING into SOLVEXTI_V3.TRABAJADOR_INCIDENTE
SET DEFINE OFF;
REM INSERTING into SOLVEXTI_V3.USUARIO
SET DEFINE OFF;
Insert into SOLVEXTI_V3.USUARIO (ID_USUARIO,USERNAME,PASSWORD,TELEFONO,CORREO,ID_ROL) values ('2','AL.DELPINO','AL.DELPINO','+56942035153','AL.DELPINO@ALUMNOS.DUOC.CL','1');
Insert into SOLVEXTI_V3.USUARIO (ID_USUARIO,USERNAME,PASSWORD,TELEFONO,CORREO,ID_ROL) values ('3','ALB.DELPINO','ALB.DELPINO','+56942035153','ALB.DELPINO@ALUMNOS.DUOC.CL','2');
--------------------------------------------------------
--  DDL for Index ACTIVIDAD_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "SOLVEXTI_V3"."ACTIVIDAD_PK" ON "SOLVEXTI_V3"."ACTIVIDAD" ("ID_ACTIVIDAD") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index BOLETA_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "SOLVEXTI_V3"."BOLETA_PK" ON "SOLVEXTI_V3"."BOLETA" ("ID_BOLETA") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index CARGO_EXTRA_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "SOLVEXTI_V3"."CARGO_EXTRA_PK" ON "SOLVEXTI_V3"."CARGO_EXTRA" ("ID_CARGO_EXTRA") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index CLIENTE_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "SOLVEXTI_V3"."CLIENTE_PK" ON "SOLVEXTI_V3"."CLIENTE" ("ID_CLIENTE") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index CONTRATO_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "SOLVEXTI_V3"."CONTRATO_PK" ON "SOLVEXTI_V3"."CONTRATO" ("ID_CONTRATO") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index INCIDENTE_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "SOLVEXTI_V3"."INCIDENTE_PK" ON "SOLVEXTI_V3"."INCIDENTE" ("ID_INCIDENTE") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index MODIFICACIONES_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "SOLVEXTI_V3"."MODIFICACIONES_PK" ON "SOLVEXTI_V3"."MODIFICACIONES" ("ID_MODIFICACIONES") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index NOTIFICACION_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "SOLVEXTI_V3"."NOTIFICACION_PK" ON "SOLVEXTI_V3"."NOTIFICACION" ("ID_NOTIFICACION") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index PLAN_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "SOLVEXTI_V3"."PLAN_PK" ON "SOLVEXTI_V3"."PLAN" ("ID_PLAN") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index PROFESIONAL_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "SOLVEXTI_V3"."PROFESIONAL_PK" ON "SOLVEXTI_V3"."PROFESIONAL" ("ID_PROFESIONAL") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index PUNTO_MEJORABLE_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "SOLVEXTI_V3"."PUNTO_MEJORABLE_PK" ON "SOLVEXTI_V3"."PUNTO_MEJORABLE" ("ID_PUNTO_MEJORABLE") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index RELATION_12_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "SOLVEXTI_V3"."RELATION_12_PK" ON "SOLVEXTI_V3"."ACTIVIDAD_TRABAJADOR" ("ID_TRABAJADOR", "ID_ACTIVIDAD") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index RELATION_20_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "SOLVEXTI_V3"."RELATION_20_PK" ON "SOLVEXTI_V3"."TRABAJADOR_INCIDENTE" ("ID_TRABAJADOR", "ID_INCIDENTE") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index ROL_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "SOLVEXTI_V3"."ROL_PK" ON "SOLVEXTI_V3"."ROL" ("ID_ROL") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index TIPO_ACTIVIDAD_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "SOLVEXTI_V3"."TIPO_ACTIVIDAD_PK" ON "SOLVEXTI_V3"."TIPO_ACTIVIDAD" ("ID_TIPO_ACTIVIDAD") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index TRABAJADOR_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "SOLVEXTI_V3"."TRABAJADOR_PK" ON "SOLVEXTI_V3"."TRABAJADOR" ("ID_TRABAJADOR") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index USUARIO_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "SOLVEXTI_V3"."USUARIO_PK" ON "SOLVEXTI_V3"."USUARIO" ("ID_USUARIO") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index USUARIO__UN
--------------------------------------------------------

  CREATE UNIQUE INDEX "SOLVEXTI_V3"."USUARIO__UN" ON "SOLVEXTI_V3"."USUARIO" ("USERNAME") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index BOLETA__IDX
--------------------------------------------------------

  CREATE UNIQUE INDEX "SOLVEXTI_V3"."BOLETA__IDX" ON "SOLVEXTI_V3"."BOLETA" ("ID_PLAN") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index ACTIVIDAD__IDX
--------------------------------------------------------

  CREATE UNIQUE INDEX "SOLVEXTI_V3"."ACTIVIDAD__IDX" ON "SOLVEXTI_V3"."ACTIVIDAD" ("ID_TIPO_ACTIVIDAD") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index CONTRATO__IDX
--------------------------------------------------------

  CREATE UNIQUE INDEX "SOLVEXTI_V3"."CONTRATO__IDX" ON "SOLVEXTI_V3"."CONTRATO" ("ID_CLIENTE") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index CONTRATO__IDXV1
--------------------------------------------------------

  CREATE UNIQUE INDEX "SOLVEXTI_V3"."CONTRATO__IDXV1" ON "SOLVEXTI_V3"."CONTRATO" ("ID_PLAN") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Procedure PR_ELIMINAR_USUARIO
--------------------------------------------------------
set define off;

  CREATE OR REPLACE NONEDITIONABLE PROCEDURE "SOLVEXTI_V3"."PR_ELIMINAR_USUARIO" (p_id_usuario in usuario.id_usuario%TYPE, p_id_rol usuario.id_rol%TYPE)
AS
BEGIN
  IF p_id_rol = 2 THEN
   DELETE FROM profesional WHERE id_usuario = p_id_usuario;
  ELSIF p_id_rol = 3 THEN
    DELETE FROM cliente WHERE id_usuario = p_id_usuario;
  END IF;
  DELETE FROM usuario WHERE id_usuario = p_id_usuario;
END;

/
--------------------------------------------------------
--  DDL for Procedure PR_INSERTAR_CLIENTE
--------------------------------------------------------
set define off;

  CREATE OR REPLACE NONEDITIONABLE PROCEDURE "SOLVEXTI_V3"."PR_INSERTAR_CLIENTE" (
 p_nombre in cliente.nombre%TYPE,
 p_direccion in cliente.direccion%TYPE,
 p_rubro in cliente.rubro%TYPE,
 p_id_profesional in cliente.id_profesional%TYPE
)
AS
/**************************************************************************************************************
   NAME:       	SP_NOMBRE_PROCEDIMIENTO
   PURPOSE		ACCION QUE REALIZA EL PROCEDURE

   REVISIONS:
   Ver          Date           Author                               Description
   ---------    ----------     -------------------                  ----------------------------------------------
   X.X.X-X.X    DD/MM/YYYY     AUTOR DEL PROCEDURE       			1. DESCRIPCIÓN SIMPLE PARA LA VERSIÓN

   SE DEBEN AGREGAR TODAS LAS VERSIONES QUE Y NOMBRES DE LOS QUE TRABAJEN EN EL
***************************************************************************************************************/
BEGIN
  INSERT INTO cliente ( id_usuario, id_cliente,  nombre,  direccion,  rubro,  id_profesional)
  VALUES( id_usuario_seq.CURRVAL, id_cliente_seq.NEXTVAL, p_nombre, p_direccion, p_rubro, p_id_profesional);
END;

/
--------------------------------------------------------
--  DDL for Procedure PR_INSERTAR_PROFESIONAL
--------------------------------------------------------
set define off;

  CREATE OR REPLACE NONEDITIONABLE PROCEDURE "SOLVEXTI_V3"."PR_INSERTAR_PROFESIONAL" (
  p_nombre in profesional.nombre%TYPE,
  p_apellido_paterno in profesional.apellido_paterno%TYPE,
  p_apellido_materno in profesional.apellido_materno%TYPE,
  p_rut in profesional.rut%TYPE,
  p_dv in profesional.dv%TYPE
)
AS
/**************************************************************************************************************
   NAME:       	SP_NOMBRE_PROCEDIMIENTO
   PURPOSE		ACCION QUE REALIZA EL PROCEDURE

   REVISIONS:
   Ver          Date           Author                               Description
   ---------    ----------     -------------------                  ----------------------------------------------
   X.X.X-X.X    DD/MM/YYYY     AUTOR DEL PROCEDURE       			1. DESCRIPCIÓN SIMPLE PARA LA VERSIÓN

   SE DEBEN AGREGAR TODAS LAS VERSIONES QUE Y NOMBRES DE LOS QUE TRABAJEN EN EL
***************************************************************************************************************/
BEGIN
   INSERT INTO profesional (id_usuario, id_profesional, nombre, apellido_paterno, apellido_materno, rut, dv)
   VALUES(id_usuario_seq.CURRVAL, id_profesional_seq.NEXTVAL, p_nombre, p_apellido_paterno, p_apellido_materno, p_rut, p_dv);
END;

/
--------------------------------------------------------
--  DDL for Procedure PR_INSERTAR_USUARIO
--------------------------------------------------------
set define off;

  CREATE OR REPLACE NONEDITIONABLE PROCEDURE "SOLVEXTI_V3"."PR_INSERTAR_USUARIO" (
  p_username in usuario.username%TYPE,
  p_password in usuario.password%TYPE,
  p_telefono in usuario.telefono%TYPE,
  p_correo in usuario.correo%TYPE,
  p_id_rol in usuario.id_rol%TYPE
)
AS
    /**************************************************************************************************************
    NAME:       	SP_NOMBRE_PROCEDIMIENTO
    PURPOSE		ACCION QUE REALIZA EL PROCEDURE

    REVISIONS:
    Ver          Date           Author                               Description
    ---------    ----------     -------------------                  ----------------------------------------------
    X.X.X-X.X    DD/MM/YYYY     AUTOR DEL PROCEDURE       			1. DESCRIPCIÓN SIMPLE PARA LA VERSIÓN

    SE DEBEN AGREGAR TODAS LAS VERSIONES QUE Y NOMBRES DE LOS QUE TRABAJEN EN EL
    ***************************************************************************************************************/
BEGIN
  INSERT INTO usuario (id_usuario,username, password, telefono, correo, id_rol)
  values(id_usuario_seq.NEXTVAL, p_username, p_password, p_telefono, p_correo, p_id_rol);
END;

/
--------------------------------------------------------
--  DDL for Procedure PR_MODIFICAR_CLIENTE
--------------------------------------------------------
set define off;

  CREATE OR REPLACE NONEDITIONABLE PROCEDURE "SOLVEXTI_V3"."PR_MODIFICAR_CLIENTE" (
p_id_usuario in usuario.id_usuario%TYPE,
p_nuevo_valor usuario.correo%TYPE,
p_columna in usuario.correo%TYPE)
AS
BEGIN
  IF UPPER(p_columna) = 'NOMBRE' THEN
    UPDATE cliente SET nombre = p_nuevo_valor WHERE id_usuario = p_id_usuario;
  ELSIF UPPER(p_columna) = 'DIRECCION' THEN
    UPDATE cliente SET direccion = p_nuevo_valor WHERE id_usuario = p_id_usuario;
  ELSIF UPPER(p_columna) = 'RUBRO' THEN
    UPDATE cliente SET rubro = p_nuevo_valor WHERE id_usuario = p_id_usuario;
  END IF;
END;

/
--------------------------------------------------------
--  DDL for Procedure PR_MODIFICAR_PROFESIONAL
--------------------------------------------------------
set define off;

  CREATE OR REPLACE NONEDITIONABLE PROCEDURE "SOLVEXTI_V3"."PR_MODIFICAR_PROFESIONAL" (
p_id_usuario in usuario.id_usuario%TYPE,
p_nuevo_valor usuario.correo%TYPE,
p_columna in usuario.correo%TYPE)
AS
BEGIN
  IF UPPER(p_columna) = 'NOMBRE' THEN
    UPDATE profesional SET nombre = p_nuevo_valor WHERE id_usuario = p_id_usuario;
  ELSIF UPPER(p_columna) = 'APELLIDO_PATERNO' THEN
    UPDATE profesional SET apellido_paterno = p_nuevo_valor WHERE id_usuario = p_id_usuario;
  ELSIF UPPER(p_columna) = 'APELLIDO_MATERNO' THEN
    UPDATE profesional SET apellido_materno = p_nuevo_valor WHERE id_usuario = p_id_usuario;
  ELSIF UPPER(p_columna) = 'RUT' THEN
    UPDATE profesional SET rut = TO_NUMBER(p_nuevo_valor) WHERE id_usuario = p_id_usuario;
  ELSIF UPPER(p_columna) = 'DV' THEN
    UPDATE profesional SET dv = p_nuevo_valor WHERE id_usuario = p_id_usuario;
  END IF;
END;

/
--------------------------------------------------------
--  DDL for Procedure PR_MODIFICAR_USUARIO
--------------------------------------------------------
set define off;

  CREATE OR REPLACE NONEDITIONABLE PROCEDURE "SOLVEXTI_V3"."PR_MODIFICAR_USUARIO" (
p_id_usuario in usuario.id_usuario%TYPE, 
p_nuevo_valor usuario.correo%TYPE, 
p_columna in usuario.correo%TYPE)
AS
BEGIN

IF UPPER(p_columna) = 'USERNAME' THEN
  UPDATE usuario SET username = p_nuevo_valor WHERE id_usuario = p_id_usuario;
ELSIF UPPER(p_columna) = 'PASSWORD' THEN
  UPDATE usuario SET password = p_nuevo_valor WHERE id_usuario = p_id_usuario;
ELSIF UPPER(p_columna) = 'TELEFONO' THEN
  UPDATE usuario SET telefono = p_nuevo_valor WHERE id_usuario = p_id_usuario;
ELSIF UPPER(p_columna) = 'CORREO' THEN
  UPDATE usuario SET correo = p_nuevo_valor WHERE id_usuario = p_id_usuario;
ELSE
  UPDATE usuario SET id_rol =  TO_NUMBER(p_nuevo_valor) WHERE id_usuario = p_id_usuario;
END IF;
END;

/
--------------------------------------------------------
--  DDL for Package PKG_SOLVEXTI_USUARIO
--------------------------------------------------------

  CREATE OR REPLACE NONEDITIONABLE PACKAGE "SOLVEXTI_V3"."PKG_SOLVEXTI_USUARIO" IS
    
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
--------------------------------------------------------
--  DDL for Package Body PKG_SOLVEXTI_USUARIO
--------------------------------------------------------

  CREATE OR REPLACE NONEDITIONABLE PACKAGE BODY "SOLVEXTI_V3"."PKG_SOLVEXTI_USUARIO" IS
    
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
--------------------------------------------------------
--  DDL for Function FN_OBTENER_CLIENTE
--------------------------------------------------------

  CREATE OR REPLACE NONEDITIONABLE FUNCTION "SOLVEXTI_V3"."FN_OBTENER_CLIENTE" ( p_id_usuario in usuario.id_usuario%TYPE) RETURN cliente%rowtype
AS
    v_cliente cliente%rowtype;
BEGIN
  SELECT * INTO v_cliente FROM cliente WHERE id_usuario = p_id_usuario;
  RETURN v_cliente;
END;

/
--------------------------------------------------------
--  DDL for Function FN_OBTENER_PROFESIONAL
--------------------------------------------------------

  CREATE OR REPLACE NONEDITIONABLE FUNCTION "SOLVEXTI_V3"."FN_OBTENER_PROFESIONAL" ( p_id_usuario in usuario.id_usuario%TYPE) RETURN profesional%rowtype
AS
    v_profesional profesional%rowtype;
BEGIN
  SELECT * INTO v_profesional FROM profesional WHERE id_usuario = p_id_usuario;
  RETURN v_profesional;
END;

/
--------------------------------------------------------
--  DDL for Function FN_OBTENER_USUARIO
--------------------------------------------------------

  CREATE OR REPLACE NONEDITIONABLE FUNCTION "SOLVEXTI_V3"."FN_OBTENER_USUARIO" ( p_username in usuario.username%TYPE) RETURN usuario%rowtype
AS
    v_usuario usuario%rowtype;
BEGIN
  SELECT * INTO v_usuario FROM usuario WHERE username LIKE p_username;
  RETURN v_usuario;
END;

/
--------------------------------------------------------
--  Constraints for Table TRABAJADOR_INCIDENTE
--------------------------------------------------------

  ALTER TABLE "SOLVEXTI_V3"."TRABAJADOR_INCIDENTE" MODIFY ("ID_TRABAJADOR" NOT NULL ENABLE);
  ALTER TABLE "SOLVEXTI_V3"."TRABAJADOR_INCIDENTE" MODIFY ("ID_INCIDENTE" NOT NULL ENABLE);
  ALTER TABLE "SOLVEXTI_V3"."TRABAJADOR_INCIDENTE" ADD CONSTRAINT "RELATION_20_PK" PRIMARY KEY ("ID_TRABAJADOR", "ID_INCIDENTE")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Constraints for Table ACTIVIDAD
--------------------------------------------------------

  ALTER TABLE "SOLVEXTI_V3"."ACTIVIDAD" MODIFY ("ID_ACTIVIDAD" NOT NULL ENABLE);
  ALTER TABLE "SOLVEXTI_V3"."ACTIVIDAD" MODIFY ("NOMBRE" NOT NULL ENABLE);
  ALTER TABLE "SOLVEXTI_V3"."ACTIVIDAD" MODIFY ("DESCRIPCION" NOT NULL ENABLE);
  ALTER TABLE "SOLVEXTI_V3"."ACTIVIDAD" MODIFY ("ESTADO" NOT NULL ENABLE);
  ALTER TABLE "SOLVEXTI_V3"."ACTIVIDAD" MODIFY ("FECHA_INICIO" NOT NULL ENABLE);
  ALTER TABLE "SOLVEXTI_V3"."ACTIVIDAD" MODIFY ("CANTIDAD_MODIFICACIONES" NOT NULL ENABLE);
  ALTER TABLE "SOLVEXTI_V3"."ACTIVIDAD" MODIFY ("ID_PROFESIONAL" NOT NULL ENABLE);
  ALTER TABLE "SOLVEXTI_V3"."ACTIVIDAD" MODIFY ("ID_CLIENTE" NOT NULL ENABLE);
  ALTER TABLE "SOLVEXTI_V3"."ACTIVIDAD" MODIFY ("ID_TIPO_ACTIVIDAD" NOT NULL ENABLE);
  ALTER TABLE "SOLVEXTI_V3"."ACTIVIDAD" ADD CONSTRAINT "ACTIVIDAD_PK" PRIMARY KEY ("ID_ACTIVIDAD")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Constraints for Table BOLETA
--------------------------------------------------------

  ALTER TABLE "SOLVEXTI_V3"."BOLETA" MODIFY ("ID_BOLETA" NOT NULL ENABLE);
  ALTER TABLE "SOLVEXTI_V3"."BOLETA" MODIFY ("VALOR" NOT NULL ENABLE);
  ALTER TABLE "SOLVEXTI_V3"."BOLETA" MODIFY ("MEDIO_PAGO" NOT NULL ENABLE);
  ALTER TABLE "SOLVEXTI_V3"."BOLETA" MODIFY ("FECHA_PAGO" NOT NULL ENABLE);
  ALTER TABLE "SOLVEXTI_V3"."BOLETA" MODIFY ("ID_CLIENTE" NOT NULL ENABLE);
  ALTER TABLE "SOLVEXTI_V3"."BOLETA" MODIFY ("ID_PLAN" NOT NULL ENABLE);
  ALTER TABLE "SOLVEXTI_V3"."BOLETA" ADD CONSTRAINT "BOLETA_PK" PRIMARY KEY ("ID_BOLETA")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Constraints for Table CARGO_EXTRA
--------------------------------------------------------

  ALTER TABLE "SOLVEXTI_V3"."CARGO_EXTRA" MODIFY ("ID_CARGO_EXTRA" NOT NULL ENABLE);
  ALTER TABLE "SOLVEXTI_V3"."CARGO_EXTRA" MODIFY ("VALOR" NOT NULL ENABLE);
  ALTER TABLE "SOLVEXTI_V3"."CARGO_EXTRA" MODIFY ("DESCRIPCION" NOT NULL ENABLE);
  ALTER TABLE "SOLVEXTI_V3"."CARGO_EXTRA" MODIFY ("FECHA" NOT NULL ENABLE);
  ALTER TABLE "SOLVEXTI_V3"."CARGO_EXTRA" MODIFY ("ID_BOLETA" NOT NULL ENABLE);
  ALTER TABLE "SOLVEXTI_V3"."CARGO_EXTRA" ADD CONSTRAINT "CARGO_EXTRA_PK" PRIMARY KEY ("ID_CARGO_EXTRA")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Constraints for Table PUNTO_MEJORABLE
--------------------------------------------------------

  ALTER TABLE "SOLVEXTI_V3"."PUNTO_MEJORABLE" MODIFY ("ID_PUNTO_MEJORABLE" NOT NULL ENABLE);
  ALTER TABLE "SOLVEXTI_V3"."PUNTO_MEJORABLE" MODIFY ("TITULO" NOT NULL ENABLE);
  ALTER TABLE "SOLVEXTI_V3"."PUNTO_MEJORABLE" MODIFY ("DESCRIPCION" NOT NULL ENABLE);
  ALTER TABLE "SOLVEXTI_V3"."PUNTO_MEJORABLE" MODIFY ("CUMPLIDO" NOT NULL ENABLE);
  ALTER TABLE "SOLVEXTI_V3"."PUNTO_MEJORABLE" MODIFY ("ID_ACTIVIDAD" NOT NULL ENABLE);
  ALTER TABLE "SOLVEXTI_V3"."PUNTO_MEJORABLE" ADD CONSTRAINT "PUNTO_MEJORABLE_PK" PRIMARY KEY ("ID_PUNTO_MEJORABLE")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Constraints for Table NOTIFICACION
--------------------------------------------------------

  ALTER TABLE "SOLVEXTI_V3"."NOTIFICACION" MODIFY ("ID_NOTIFICACION" NOT NULL ENABLE);
  ALTER TABLE "SOLVEXTI_V3"."NOTIFICACION" MODIFY ("MENSAJE" NOT NULL ENABLE);
  ALTER TABLE "SOLVEXTI_V3"."NOTIFICACION" MODIFY ("HORA" NOT NULL ENABLE);
  ALTER TABLE "SOLVEXTI_V3"."NOTIFICACION" MODIFY ("ID_USUARIO" NOT NULL ENABLE);
  ALTER TABLE "SOLVEXTI_V3"."NOTIFICACION" ADD CONSTRAINT "NOTIFICACION_PK" PRIMARY KEY ("ID_NOTIFICACION")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Constraints for Table ROL
--------------------------------------------------------

  ALTER TABLE "SOLVEXTI_V3"."ROL" MODIFY ("ID_ROL" NOT NULL ENABLE);
  ALTER TABLE "SOLVEXTI_V3"."ROL" MODIFY ("NOMBRE" NOT NULL ENABLE);
  ALTER TABLE "SOLVEXTI_V3"."ROL" ADD CONSTRAINT "ROL_PK" PRIMARY KEY ("ID_ROL")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Constraints for Table TIPO_ACTIVIDAD
--------------------------------------------------------

  ALTER TABLE "SOLVEXTI_V3"."TIPO_ACTIVIDAD" MODIFY ("ID_TIPO_ACTIVIDAD" NOT NULL ENABLE);
  ALTER TABLE "SOLVEXTI_V3"."TIPO_ACTIVIDAD" MODIFY ("NOMBRE" NOT NULL ENABLE);
  ALTER TABLE "SOLVEXTI_V3"."TIPO_ACTIVIDAD" ADD CONSTRAINT "TIPO_ACTIVIDAD_PK" PRIMARY KEY ("ID_TIPO_ACTIVIDAD")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Constraints for Table PLAN
--------------------------------------------------------

  ALTER TABLE "SOLVEXTI_V3"."PLAN" MODIFY ("ID_PLAN" NOT NULL ENABLE);
  ALTER TABLE "SOLVEXTI_V3"."PLAN" MODIFY ("VALOR" NOT NULL ENABLE);
  ALTER TABLE "SOLVEXTI_V3"."PLAN" MODIFY ("DESCRIPCION" NOT NULL ENABLE);
  ALTER TABLE "SOLVEXTI_V3"."PLAN" ADD CONSTRAINT "PLAN_PK" PRIMARY KEY ("ID_PLAN")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Constraints for Table CLIENTE
--------------------------------------------------------

  ALTER TABLE "SOLVEXTI_V3"."CLIENTE" MODIFY ("ID_USUARIO" NOT NULL ENABLE);
  ALTER TABLE "SOLVEXTI_V3"."CLIENTE" MODIFY ("ID_CLIENTE" NOT NULL ENABLE);
  ALTER TABLE "SOLVEXTI_V3"."CLIENTE" MODIFY ("NOMBRE" NOT NULL ENABLE);
  ALTER TABLE "SOLVEXTI_V3"."CLIENTE" MODIFY ("DIRECCION" NOT NULL ENABLE);
  ALTER TABLE "SOLVEXTI_V3"."CLIENTE" MODIFY ("RUBRO" NOT NULL ENABLE);
  ALTER TABLE "SOLVEXTI_V3"."CLIENTE" MODIFY ("ID_PROFESIONAL" NOT NULL ENABLE);
  ALTER TABLE "SOLVEXTI_V3"."CLIENTE" ADD CONSTRAINT "CLIENTE_PK" PRIMARY KEY ("ID_CLIENTE")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Constraints for Table USUARIO
--------------------------------------------------------

  ALTER TABLE "SOLVEXTI_V3"."USUARIO" MODIFY ("ID_USUARIO" NOT NULL ENABLE);
  ALTER TABLE "SOLVEXTI_V3"."USUARIO" MODIFY ("USERNAME" NOT NULL ENABLE);
  ALTER TABLE "SOLVEXTI_V3"."USUARIO" MODIFY ("PASSWORD" NOT NULL ENABLE);
  ALTER TABLE "SOLVEXTI_V3"."USUARIO" MODIFY ("TELEFONO" NOT NULL ENABLE);
  ALTER TABLE "SOLVEXTI_V3"."USUARIO" MODIFY ("CORREO" NOT NULL ENABLE);
  ALTER TABLE "SOLVEXTI_V3"."USUARIO" MODIFY ("ID_ROL" NOT NULL ENABLE);
  ALTER TABLE "SOLVEXTI_V3"."USUARIO" ADD CONSTRAINT "USUARIO_PK" PRIMARY KEY ("ID_USUARIO")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
  ALTER TABLE "SOLVEXTI_V3"."USUARIO" ADD CONSTRAINT "USUARIO__UN" UNIQUE ("USERNAME")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Constraints for Table CONTRATO
--------------------------------------------------------

  ALTER TABLE "SOLVEXTI_V3"."CONTRATO" MODIFY ("ID_CONTRATO" NOT NULL ENABLE);
  ALTER TABLE "SOLVEXTI_V3"."CONTRATO" MODIFY ("FECHA_INICIO" NOT NULL ENABLE);
  ALTER TABLE "SOLVEXTI_V3"."CONTRATO" MODIFY ("FECHA_TERMINO" NOT NULL ENABLE);
  ALTER TABLE "SOLVEXTI_V3"."CONTRATO" MODIFY ("ID_CLIENTE" NOT NULL ENABLE);
  ALTER TABLE "SOLVEXTI_V3"."CONTRATO" MODIFY ("ID_PLAN" NOT NULL ENABLE);
  ALTER TABLE "SOLVEXTI_V3"."CONTRATO" ADD CONSTRAINT "CONTRATO_PK" PRIMARY KEY ("ID_CONTRATO")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Constraints for Table INCIDENTE
--------------------------------------------------------

  ALTER TABLE "SOLVEXTI_V3"."INCIDENTE" MODIFY ("ID_INCIDENTE" NOT NULL ENABLE);
  ALTER TABLE "SOLVEXTI_V3"."INCIDENTE" MODIFY ("FECHA" NOT NULL ENABLE);
  ALTER TABLE "SOLVEXTI_V3"."INCIDENTE" MODIFY ("DESCRIPCION" NOT NULL ENABLE);
  ALTER TABLE "SOLVEXTI_V3"."INCIDENTE" ADD CONSTRAINT "INCIDENTE_PK" PRIMARY KEY ("ID_INCIDENTE")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Constraints for Table ACTIVIDAD_TRABAJADOR
--------------------------------------------------------

  ALTER TABLE "SOLVEXTI_V3"."ACTIVIDAD_TRABAJADOR" MODIFY ("ID_TRABAJADOR" NOT NULL ENABLE);
  ALTER TABLE "SOLVEXTI_V3"."ACTIVIDAD_TRABAJADOR" MODIFY ("ID_ACTIVIDAD" NOT NULL ENABLE);
  ALTER TABLE "SOLVEXTI_V3"."ACTIVIDAD_TRABAJADOR" ADD CONSTRAINT "RELATION_12_PK" PRIMARY KEY ("ID_TRABAJADOR", "ID_ACTIVIDAD")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Constraints for Table MODIFICACIONES
--------------------------------------------------------

  ALTER TABLE "SOLVEXTI_V3"."MODIFICACIONES" MODIFY ("ID_MODIFICACIONES" NOT NULL ENABLE);
  ALTER TABLE "SOLVEXTI_V3"."MODIFICACIONES" MODIFY ("DESCRIPCION" NOT NULL ENABLE);
  ALTER TABLE "SOLVEXTI_V3"."MODIFICACIONES" MODIFY ("ID_MEJORABLE" NOT NULL ENABLE);
  ALTER TABLE "SOLVEXTI_V3"."MODIFICACIONES" ADD CONSTRAINT "MODIFICACIONES_PK" PRIMARY KEY ("ID_MODIFICACIONES")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Constraints for Table PROFESIONAL
--------------------------------------------------------

  ALTER TABLE "SOLVEXTI_V3"."PROFESIONAL" MODIFY ("ID_USUARIO" NOT NULL ENABLE);
  ALTER TABLE "SOLVEXTI_V3"."PROFESIONAL" MODIFY ("ID_PROFESIONAL" NOT NULL ENABLE);
  ALTER TABLE "SOLVEXTI_V3"."PROFESIONAL" MODIFY ("NOMBRE" NOT NULL ENABLE);
  ALTER TABLE "SOLVEXTI_V3"."PROFESIONAL" MODIFY ("APELLIDO_PATERNO" NOT NULL ENABLE);
  ALTER TABLE "SOLVEXTI_V3"."PROFESIONAL" MODIFY ("APELLIDO_MATERNO" NOT NULL ENABLE);
  ALTER TABLE "SOLVEXTI_V3"."PROFESIONAL" MODIFY ("RUT" NOT NULL ENABLE);
  ALTER TABLE "SOLVEXTI_V3"."PROFESIONAL" MODIFY ("DV" NOT NULL ENABLE);
  ALTER TABLE "SOLVEXTI_V3"."PROFESIONAL" ADD CONSTRAINT "PROFESIONAL_PK" PRIMARY KEY ("ID_PROFESIONAL")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Constraints for Table TRABAJADOR
--------------------------------------------------------

  ALTER TABLE "SOLVEXTI_V3"."TRABAJADOR" MODIFY ("ID_TRABAJADOR" NOT NULL ENABLE);
  ALTER TABLE "SOLVEXTI_V3"."TRABAJADOR" MODIFY ("RUT" NOT NULL ENABLE);
  ALTER TABLE "SOLVEXTI_V3"."TRABAJADOR" MODIFY ("DV" NOT NULL ENABLE);
  ALTER TABLE "SOLVEXTI_V3"."TRABAJADOR" MODIFY ("NOMBRE" NOT NULL ENABLE);
  ALTER TABLE "SOLVEXTI_V3"."TRABAJADOR" MODIFY ("APELLIDO_PATERNO" NOT NULL ENABLE);
  ALTER TABLE "SOLVEXTI_V3"."TRABAJADOR" MODIFY ("APELLIDO_MATERNO" NOT NULL ENABLE);
  ALTER TABLE "SOLVEXTI_V3"."TRABAJADOR" MODIFY ("ID_CLIENTE" NOT NULL ENABLE);
  ALTER TABLE "SOLVEXTI_V3"."TRABAJADOR" ADD CONSTRAINT "TRABAJADOR_PK" PRIMARY KEY ("ID_TRABAJADOR")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table ACTIVIDAD
--------------------------------------------------------

  ALTER TABLE "SOLVEXTI_V3"."ACTIVIDAD" ADD CONSTRAINT "ACTIVIDAD_CLIENTE_FK" FOREIGN KEY ("ID_CLIENTE")
	  REFERENCES "SOLVEXTI_V3"."CLIENTE" ("ID_CLIENTE") ENABLE;
  ALTER TABLE "SOLVEXTI_V3"."ACTIVIDAD" ADD CONSTRAINT "ACTIVIDAD_PROFESIONAL_FK" FOREIGN KEY ("ID_PROFESIONAL")
	  REFERENCES "SOLVEXTI_V3"."PROFESIONAL" ("ID_PROFESIONAL") ENABLE;
  ALTER TABLE "SOLVEXTI_V3"."ACTIVIDAD" ADD CONSTRAINT "ACTIVIDAD_TIPO_ACTIVIDAD_FK" FOREIGN KEY ("ID_TIPO_ACTIVIDAD")
	  REFERENCES "SOLVEXTI_V3"."TIPO_ACTIVIDAD" ("ID_TIPO_ACTIVIDAD") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table ACTIVIDAD_TRABAJADOR
--------------------------------------------------------

  ALTER TABLE "SOLVEXTI_V3"."ACTIVIDAD_TRABAJADOR" ADD CONSTRAINT "RELATION_12_ACTIVIDAD_FK" FOREIGN KEY ("ID_ACTIVIDAD")
	  REFERENCES "SOLVEXTI_V3"."ACTIVIDAD" ("ID_ACTIVIDAD") ENABLE;
  ALTER TABLE "SOLVEXTI_V3"."ACTIVIDAD_TRABAJADOR" ADD CONSTRAINT "RELATION_12_TRABAJADOR_FK" FOREIGN KEY ("ID_TRABAJADOR")
	  REFERENCES "SOLVEXTI_V3"."TRABAJADOR" ("ID_TRABAJADOR") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table BOLETA
--------------------------------------------------------

  ALTER TABLE "SOLVEXTI_V3"."BOLETA" ADD CONSTRAINT "BOLETA_CLIENTE_FK" FOREIGN KEY ("ID_CLIENTE")
	  REFERENCES "SOLVEXTI_V3"."CLIENTE" ("ID_CLIENTE") ENABLE;
  ALTER TABLE "SOLVEXTI_V3"."BOLETA" ADD CONSTRAINT "BOLETA_PLAN_FK" FOREIGN KEY ("ID_PLAN")
	  REFERENCES "SOLVEXTI_V3"."PLAN" ("ID_PLAN") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table CARGO_EXTRA
--------------------------------------------------------

  ALTER TABLE "SOLVEXTI_V3"."CARGO_EXTRA" ADD CONSTRAINT "CARGO_EXTRA_BOLETA_FK" FOREIGN KEY ("ID_BOLETA")
	  REFERENCES "SOLVEXTI_V3"."BOLETA" ("ID_BOLETA") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table CLIENTE
--------------------------------------------------------

  ALTER TABLE "SOLVEXTI_V3"."CLIENTE" ADD CONSTRAINT "CLIENTE_PROFESIONAL_FK" FOREIGN KEY ("ID_PROFESIONAL")
	  REFERENCES "SOLVEXTI_V3"."PROFESIONAL" ("ID_PROFESIONAL") ENABLE;
  ALTER TABLE "SOLVEXTI_V3"."CLIENTE" ADD CONSTRAINT "CLIENTE_USUARIO_FK" FOREIGN KEY ("ID_USUARIO")
	  REFERENCES "SOLVEXTI_V3"."USUARIO" ("ID_USUARIO") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table CONTRATO
--------------------------------------------------------

  ALTER TABLE "SOLVEXTI_V3"."CONTRATO" ADD CONSTRAINT "CONTRATO_CLIENTE_FK" FOREIGN KEY ("ID_CLIENTE")
	  REFERENCES "SOLVEXTI_V3"."CLIENTE" ("ID_CLIENTE") ENABLE;
  ALTER TABLE "SOLVEXTI_V3"."CONTRATO" ADD CONSTRAINT "CONTRATO_PLAN_FK" FOREIGN KEY ("ID_PLAN")
	  REFERENCES "SOLVEXTI_V3"."PLAN" ("ID_PLAN") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table MODIFICACIONES
--------------------------------------------------------

  ALTER TABLE "SOLVEXTI_V3"."MODIFICACIONES" ADD CONSTRAINT "MODIFICACIONES_MEJORABLE_FK" FOREIGN KEY ("ID_MEJORABLE")
	  REFERENCES "SOLVEXTI_V3"."PUNTO_MEJORABLE" ("ID_PUNTO_MEJORABLE") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table NOTIFICACION
--------------------------------------------------------

  ALTER TABLE "SOLVEXTI_V3"."NOTIFICACION" ADD CONSTRAINT "NOTIFICACION_USUARIO_FK" FOREIGN KEY ("ID_USUARIO")
	  REFERENCES "SOLVEXTI_V3"."USUARIO" ("ID_USUARIO") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table PROFESIONAL
--------------------------------------------------------

  ALTER TABLE "SOLVEXTI_V3"."PROFESIONAL" ADD CONSTRAINT "PROFESIONAL_USUARIO_FK" FOREIGN KEY ("ID_USUARIO")
	  REFERENCES "SOLVEXTI_V3"."USUARIO" ("ID_USUARIO") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table PUNTO_MEJORABLE
--------------------------------------------------------

  ALTER TABLE "SOLVEXTI_V3"."PUNTO_MEJORABLE" ADD CONSTRAINT "PUNTO_MEJORABLE_ACTIVIDAD_FK" FOREIGN KEY ("ID_ACTIVIDAD")
	  REFERENCES "SOLVEXTI_V3"."ACTIVIDAD" ("ID_ACTIVIDAD") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table TRABAJADOR
--------------------------------------------------------

  ALTER TABLE "SOLVEXTI_V3"."TRABAJADOR" ADD CONSTRAINT "TRABAJADOR_CLIENTE_FK" FOREIGN KEY ("ID_CLIENTE")
	  REFERENCES "SOLVEXTI_V3"."CLIENTE" ("ID_CLIENTE") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table TRABAJADOR_INCIDENTE
--------------------------------------------------------

  ALTER TABLE "SOLVEXTI_V3"."TRABAJADOR_INCIDENTE" ADD CONSTRAINT "RELATION_20_INCIDENTE_FK" FOREIGN KEY ("ID_INCIDENTE")
	  REFERENCES "SOLVEXTI_V3"."INCIDENTE" ("ID_INCIDENTE") ENABLE;
  ALTER TABLE "SOLVEXTI_V3"."TRABAJADOR_INCIDENTE" ADD CONSTRAINT "RELATION_20_TRABAJADOR_FK" FOREIGN KEY ("ID_TRABAJADOR")
	  REFERENCES "SOLVEXTI_V3"."TRABAJADOR" ("ID_TRABAJADOR") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table USUARIO
--------------------------------------------------------

  ALTER TABLE "SOLVEXTI_V3"."USUARIO" ADD CONSTRAINT "USUARIO_ROL_FK" FOREIGN KEY ("ID_ROL")
	  REFERENCES "SOLVEXTI_V3"."ROL" ("ID_ROL") ENABLE;
