--
-- ER/Studio 8.0 SQL Code Generation
-- Company :      UNAM - FI
-- Project :      BD_Caja.DM1
-- Author :       oswaldo121oswaldo@gmail.com
--
-- Date Created : Thursday, September 07, 2023 21:58:59
-- Target DBMS : MySQL 5.x
--

SET NAMES 'UTF8MB4';
DROP DATABASE IF EXISTS caja_ahorro_bd;
CREATE DATABASE IF NOT EXISTS caja_ahorro_bd DEFAULT CHARACTER SET UTF8MB4;

use caja_ahorro_bd;

--
-- TABLE: CUENTA
--

--
-- ER/Studio 8.0 SQL Code Generation
-- Company :      UNAM - FI
-- Project :      BD_Caja.DM1
-- Author :       oswaldo121oswaldo@gmail.com
--
-- Date Created : Friday, September 08, 2023 01:57:38
-- Target DBMS : MySQL 5.x
--

--
-- TABLE: CUENTA
--

CREATE TABLE CUENTA(
                       CUENTA_ID            INT      AUTO_INCREMENT    NOT NULL,
                       SALDO                INT         DEFAULT 0 NOT NULL,
                       FECHA_APERTURA       DATETIME    NOT NULL,
                       USUARIO_ID           INT         NOT NULL,
                       ESTATUS_CUENTA_ID    INT         NULL,
                       PRIMARY KEY (CUENTA_ID)
)ENGINE=INNODB
;



--
-- TABLE: ESTATUS_CUENTA
--

CREATE TABLE ESTATUS_CUENTA(
                               ESTATUS_CUENTA_ID    INT           AUTO_INCREMENT NOT NULL,
                               NOMBRE               VARCHAR(40)    NOT NULL,
                               DESCRIPCION          TEXT           NOT NULL,
                               PRIMARY KEY (ESTATUS_CUENTA_ID)
)ENGINE=INNODB
;



--
-- TABLE: ESTATUS_PRESTAMOS
--

CREATE TABLE ESTATUS_PRESTAMOS(
                                  ESTATUS_PRESTAMOS_ID    INT          AUTO_INCREMENT  NOT NULL,
                                  NOMBRE                  VARCHAR(40)    NOT NULL,
                                  DESCRIPCION             TEXT           NOT NULL,
                                  PRIMARY KEY (ESTATUS_PRESTAMOS_ID)
)ENGINE=INNODB
;



--
-- TABLE: ESTATUS_TRANSACCION
--

CREATE TABLE ESTATUS_TRANSACCION(
                                    ESTATUS_TRANSACCION_ID    INT        AUTO_INCREMENT    NOT NULL,
                                    NOMBRE                    VARCHAR(40)    NOT NULL,
                                    DESCRIPCION               VARCHAR(40)    NOT NULL,
                                    PRIMARY KEY (ESTATUS_TRANSACCION_ID)
)ENGINE=INNODB
;



--
-- TABLE: HISTORICO_ESTATUS_CUENTA
--

CREATE TABLE HISTORICO_ESTATUS_CUENTA(
                                         HISTORICO_ESTATUS_CUENTA_ID    INT   AUTO_INCREMENT  NOT NULL,
                                         FECHA                          DATE    NOT NULL,
                                         CUENTA_ID                      INT     NOT NULL,
                                         ESTATUS_CUENTA_ID              INT     NOT NULL,
                                         PRIMARY KEY (HISTORICO_ESTATUS_CUENTA_ID)
)ENGINE=INNODB
;



--
-- TABLE: HISTORICO_ESTATUS_PRESTAMOS
--

CREATE TABLE HISTORICO_ESTATUS_PRESTAMOS(
                                            HISTORICO_ESTATUS_PRESTAMOS_ID    INT     AUTO_INCREMENT    NOT NULL,
                                            DEUDA                             INT         NOT NULL,
                                            FECHA_ACTUALIZACION               DATETIME    NOT NULL,
                                            ESTATUS_PRESTAMOS_ID              INT         NOT NULL,
                                            PRESTAMO_ID                       INT         NOT NULL,
                                            PRIMARY KEY (HISTORICO_ESTATUS_PRESTAMOS_ID)
)ENGINE=INNODB
;



--
-- TABLE: HISTORICO_ESTATUS_TRANSACCION
--

CREATE TABLE HISTORICO_ESTATUS_TRANSACCION(
                                              HISTORICO_ESTATUS_TRANSACCION_ID    INT    AUTO_INCREMENT NOT NULL,
                                              FECHA                               DATE    NOT NULL,
                                              ESTATUS_TRANSACCION_ID              INT     NOT NULL,
                                              TRANSACCION_ID                      INT     NOT NULL,
                                              PRIMARY KEY (HISTORICO_ESTATUS_TRANSACCION_ID)
)ENGINE=INNODB
;



--
-- TABLE: PRESTAMO
--

CREATE TABLE PRESTAMO(
                         PRESTAMO_ID             INT         AUTO_INCREMENT NOT NULL,
                         MENSUALIDADES           INT         DEFAULT 1 NOT NULL
                             CHECK (MENSUALIDADES >0),
                         INTERES                 INT         NOT NULL,
                         MONTO_PAGAR             INT         NOT NULL,
                         MONTO_ORIGINAL          INT         NOT NULL
                             CHECK (MONTO_ORIGINAL >0),
                         FECHA_PETICION          DATETIME    NOT NULL,
                         USUARIO_ID              INT         NULL,
                         ESTATUS_PRESTAMOS_ID    INT         NOT NULL,
                         PRIMARY KEY (PRESTAMO_ID)
)ENGINE=INNODB
;



--
-- TABLE: ROL
--

CREATE TABLE ROL(
                    ROL_ID         TINYINT    AUTO_INCREMENT    NOT NULL,
                    NOMBRE         VARCHAR(40)    NOT NULL,
                    DESCRIPCION    VARCHAR(40)    NOT NULL,
                    PRIMARY KEY (ROL_ID)
)ENGINE=INNODB
;



--
-- TABLE: TIPO_TRANSACCION
--

CREATE TABLE TIPO_TRANSACCION(
                                 TIPO_TRANSACCION_ID    TINYINT        AUTO_INCREMENT NOT NULL,
                                 NOMBRE                 VARCHAR(40)    NOT NULL,
                                 DESCRIPCION            TEXT           NOT NULL,
                                 PRIMARY KEY (TIPO_TRANSACCION_ID)
)ENGINE=INNODB
;



--
-- TABLE: TRANSACCION
--

CREATE TABLE TRANSACCION(
                            TRANSACCION_ID            INT  AUTO_INCREMENT         NOT NULL,
                            MONTO                     INT         NOT NULL,
                            FECHA                     DATETIME    NOT NULL,
                            CUENTA_ID                 INT         NOT NULL,
                            TIPO_TRANSACCION_ID       TINYINT     NULL,
                            ESTATUS_TRANSACCION_ID    INT         NULL,
                            PRIMARY KEY (TRANSACCION_ID)
)ENGINE=INNODB
;



--
-- TABLE: TRANSACCION_ABONO_AHORRO
--

CREATE TABLE TRANSACCION_ABONO_AHORRO(
                                         TRANSACCION_ID    INT       AUTO_INCREMENT  NOT NULL,
                                         DIAS_ATRASO       TINYINT    DEFAULT 0 NOT NULL,
                                         PRIMARY KEY (TRANSACCION_ID)
)ENGINE=INNODB
;



--
-- TABLE: TRANSACCION_PAGO_PRESTAMO
--

CREATE TABLE TRANSACCION_PAGO_PRESTAMO(
                                          TRANSACCION_ID    INT    AUTO_INCREMENT NOT NULL,
                                          PRESTAMO_ID       INT    NOT NULL,
                                          PRIMARY KEY (TRANSACCION_ID)
)ENGINE=INNODB
;



--
-- TABLE: USUARIO
--

CREATE TABLE USUARIO(
                        USUARIO_ID           INT             AUTO_INCREMENT  NOT NULL,
                        EMAIL                VARCHAR(100)    NOT NULL,
                        CONTRASENA           VARCHAR(250)    NOT NULL,
                        APELLIDO_MATERNO     VARCHAR(40)     NOT NULL,
                        NUMERO_TELEFONICO    VARCHAR(12)     NOT NULL,
                        CALLE                VARCHAR(50)     NOT NULL,
                        ESTADO               VARCHAR(40)     NOT NULL,
                        ZIP                  INT             NOT NULL,
                        NOMBRE               VARCHAR(40)     NOT NULL,
                        APELLIDO_PATERNO     VARCHAR(40)     NOT NULL,
                        ROL_ID               TINYINT         NOT NULL,
                        PRIMARY KEY (USUARIO_ID)
)ENGINE=INNODB
;



--
-- TABLE: CUENTA
--

-- ALTER TABLE CUENTA ADD CONSTRAINT RefUSUARIO3
--    FOREIGN KEY (USUARIO_ID)
--    REFERENCES USUARIO(USUARIO_ID)
-- ;
/*
ALTER TABLE CUENTA ADD CONSTRAINT RefESTATUS_CUENTA18
    FOREIGN KEY (ESTATUS_CUENTA_ID)
        REFERENCES ESTATUS_CUENTA(ESTATUS_CUENTA_ID)
;


--
-- TABLE: HISTORICO_ESTATUS_CUENTA
--

ALTER TABLE HISTORICO_ESTATUS_CUENTA ADD CONSTRAINT RefCUENTA16
    FOREIGN KEY (CUENTA_ID)
        REFERENCES CUENTA(CUENTA_ID)
;

ALTER TABLE HISTORICO_ESTATUS_CUENTA ADD CONSTRAINT RefESTATUS_CUENTA17
    FOREIGN KEY (ESTATUS_CUENTA_ID)
        REFERENCES ESTATUS_CUENTA(ESTATUS_CUENTA_ID)
;


--
-- TABLE: HISTORICO_ESTATUS_PRESTAMOS
--

ALTER TABLE HISTORICO_ESTATUS_PRESTAMOS ADD CONSTRAINT RefESTATUS_PRESTAMOS9
    FOREIGN KEY (ESTATUS_PRESTAMOS_ID)
        REFERENCES ESTATUS_PRESTAMOS(ESTATUS_PRESTAMOS_ID)
;

ALTER TABLE HISTORICO_ESTATUS_PRESTAMOS ADD CONSTRAINT RefPRESTAMO10
    FOREIGN KEY (PRESTAMO_ID)
        REFERENCES PRESTAMO(PRESTAMO_ID)
;


--
-- TABLE: HISTORICO_ESTATUS_TRANSACCION
--

ALTER TABLE HISTORICO_ESTATUS_TRANSACCION ADD CONSTRAINT RefESTATUS_TRANSACCION20
    FOREIGN KEY (ESTATUS_TRANSACCION_ID)
        REFERENCES ESTATUS_TRANSACCION(ESTATUS_TRANSACCION_ID)
;

ALTER TABLE HISTORICO_ESTATUS_TRANSACCION ADD CONSTRAINT RefTRANSACCION24
    FOREIGN KEY (TRANSACCION_ID)
        REFERENCES TRANSACCION(TRANSACCION_ID)
;



ALTER TABLE PRESTAMO ADD CONSTRAINT RefESTATUS_PRESTAMOS8
    FOREIGN KEY (ESTATUS_PRESTAMOS_ID)
        REFERENCES ESTATUS_PRESTAMOS(ESTATUS_PRESTAMOS_ID)
;

--
-- TABLE: TRANSACCION
--

-- ALTER TABLE TRANSACCION ADD CONSTRAINT RefCUENTA5
--    FOREIGN KEY (CUENTA_ID)
--    REFERENCES CUENTA(CUENTA_ID)
-- ;

ALTER TABLE TRANSACCION ADD CONSTRAINT RefTIPO_TRANSACCION15
    FOREIGN KEY (TIPO_TRANSACCION_ID)
        REFERENCES TIPO_TRANSACCION(TIPO_TRANSACCION_ID)
;

ALTER TABLE TRANSACCION ADD CONSTRAINT RefESTATUS_TRANSACCION21
    FOREIGN KEY (ESTATUS_TRANSACCION_ID)
        REFERENCES ESTATUS_TRANSACCION(ESTATUS_TRANSACCION_ID)
;


--
-- TABLE: TRANSACCION_ABONO_AHORRO
--

ALTER TABLE TRANSACCION_ABONO_AHORRO ADD CONSTRAINT RefTRANSACCION13
    FOREIGN KEY (TRANSACCION_ID)
        REFERENCES TRANSACCION(TRANSACCION_ID)
;


--
-- TABLE: TRANSACCION_PAGO_PRESTAMO
--

ALTER TABLE TRANSACCION_PAGO_PRESTAMO ADD CONSTRAINT RefTRANSACCION12
    FOREIGN KEY (TRANSACCION_ID)
        REFERENCES TRANSACCION(TRANSACCION_ID)
;

ALTER TABLE TRANSACCION_PAGO_PRESTAMO ADD CONSTRAINT RefPRESTAMO14
    FOREIGN KEY (PRESTAMO_ID)
        REFERENCES PRESTAMO(PRESTAMO_ID)
;


--
-- TABLE: USUARIO
--

ALTER TABLE USUARIO ADD CONSTRAINT RefROL11
    FOREIGN KEY (ROL_ID)
        REFERENCES ROL(ROL_ID)
;


 */