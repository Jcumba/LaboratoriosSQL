-- Created by Vertabelo (http://vertabelo.com)
-- Last modification date: 2018-05-25 16:52:01.857
CREATE DATABASE Restaurante;
USE Restaurante;
-- tables
-- Table: CLIENTE

CREATE TABLE CLIENTE (
    idCliente int  NOT NULL,
    nombre varchar(50)  NOT NULL,
    apellido varchar(50)  NOT NULL,
    sexo varchar(50)  NOT NULL,
    direccion varchar(50)  NOT NULL,
    telefono varchar(50)  NOT NULL,
    TIPO_CLIENTE_idTipoCliente int  NOT NULL,
    CONSTRAINT CLIENTE_pk PRIMARY KEY  (idCliente)
);

-- Table: COMIDA
CREATE TABLE COMIDA (
    idComida int  NOT NULL,
    nombre varchar(50)  NOT NULL,
    descripcion varchar(60)  NOT NULL,
    precio varchar(50)  NOT NULL,
    TIPO_COMIDA_idTipoComida varchar(50)  NOT NULL,
    CONSTRAINT COMIDA_pk PRIMARY KEY  (idComida)
	
);

-- Table: DETALLE_VENTA
CREATE TABLE DETALLE_VENTA (
    cantidad int  NOT NULL,
    importe varchar(50)  NOT NULL,
    COMIDA_idComida int  NOT NULL,
    VENTA_idVenta int  NOT NULL
);
	

-- Table: EMPLEADO
CREATE TABLE EMPLEADO (
    idEmpleado int  NOT NULL,
    nombre varchar(50)  NOT NULL,
    apellido varchar(50)  NOT NULL,
    sexo varchar(50)  NOT NULL,
    direccion varchar(50)  NOT NULL,
    telefono varchar(50)  NOT NULL,
    TIPO_Empleado_idTipoEmpleado int  NOT NULL,
    CONSTRAINT EMPLEADO_pk PRIMARY KEY  (idEmpleado)
);

-- Table: TIPO_CLIENTE
CREATE TABLE TIPO_CLIENTE (
    idTipoCliente int  NOT NULL,
    nombre varchar(50)  NOT NULL,
    CONSTRAINT TIPO_CLIENTE_pk PRIMARY KEY  (idTipoCliente)
);

-- Table: TIPO_COMIDA
CREATE TABLE TIPO_COMIDA (
    idTipoComida varchar(50)  NOT NULL,
    nombre varchar(50)  NOT NULL,
    CONSTRAINT TIPO_COMIDA_pk PRIMARY KEY  (idTipoComida)
);

-- Table: TIPO_EMPLEADO
CREATE TABLE TIPO_EMPLEADO (
    idTipoEmpleado int  NOT NULL,
    nombre varchar(50)  NOT NULL,
    CONSTRAINT TIPO_EMPLEADO_pk PRIMARY KEY  (idTipoEmpleado)
);

-- Table: VENTA
CREATE TABLE VENTA (
    idVenta int  NOT NULL,
    fechaVenta varchar(50)  NOT NULL,
    totalVenta varchar(50)  NOT NULL,
    EMPLEADO_idEmpleado int  NOT NULL,
    CLIENTE_idCliente int  NOT NULL,
    CONSTRAINT VENTA_pk PRIMARY KEY  (idVenta)


);

-- foreign keys
-- Reference: CLIENTE_TIPO_CLIENTE (table: CLIENTE)
ALTER TABLE CLIENTE ADD CONSTRAINT CLIENTE_TIPO_CLIENTE
    FOREIGN KEY (TIPO_CLIENTE_idTipoCliente)
    REFERENCES TIPO_CLIENTE (idTipoCliente);

-- Reference: COMIDA_TIPO_COMIDA (table: COMIDA)
ALTER TABLE COMIDA ADD CONSTRAINT COMIDA_TIPO_COMIDA
    FOREIGN KEY (TIPO_COMIDA_idTipoComida)
    REFERENCES TIPO_COMIDA (idTipoComida);

-- Reference: DETALLE_VENTA_COMIDA (table: DETALLE_VENTA)
ALTER TABLE DETALLE_VENTA ADD CONSTRAINT DETALLE_VENTA_COMIDA
    FOREIGN KEY (COMIDA_idComida)
    REFERENCES COMIDA (idComida);

-- Reference: DETALLE_VENTA_VENTA (table: DETALLE_VENTA)
ALTER TABLE DETALLE_VENTA ADD CONSTRAINT DETALLE_VENTA_VENTA
    FOREIGN KEY (VENTA_idVenta)
    REFERENCES VENTA (idVenta);

-- Reference: EMPLEADO_TIPO_Empleado (table: EMPLEADO)
ALTER TABLE EMPLEADO ADD CONSTRAINT EMPLEADO_TIPO_Empleado
    FOREIGN KEY (TIPO_Empleado_idTipoEmpleado)
    REFERENCES TIPO_EMPLEADO (idTipoEmpleado);

-- Reference: VENTA_CLIENTE (table: VENTA)
ALTER TABLE VENTA ADD CONSTRAINT VENTA_CLIENTE
    FOREIGN KEY (CLIENTE_idCliente)
    REFERENCES CLIENTE (idCliente);

-- Reference: VENTA_EMPLEADO (table: VENTA)
ALTER TABLE VENTA ADD CONSTRAINT VENTA_EMPLEADO
    FOREIGN KEY (EMPLEADO_idEmpleado)
    REFERENCES EMPLEADO (idEmpleado);

-- End of file.

INSERT INTO TIPO_COMIDA(idTipoComida,nombre ) VALUES  (1,'Platillos Principales');
INSERT INTO TIPO_COMIDA(idTipoComida,nombre ) VALUES  (2,'Acompañamiento');

INSERT INTO TIPO_CLIENTE(idTipoCliente,nombre ) VALUES  (1,'Reservado');
INSERT INTO TIPO_CLIENTE(idTipoCliente,nombre ) VALUES  (2,'Críticos');
INSERT INTO TIPO_CLIENTE(idTipoCliente,nombre ) VALUES  (3,'común');

INSERT INTO TIPO_EMPLEADO(idTipoEmpleado,nombre ) VALUES  (1,'Chef');
INSERT INTO TIPO_EMPLEADO(idTipoEmpleado,nombre ) VALUES  (2,'Mesero');
INSERT INTO TIPO_EMPLEADO(idTipoEmpleado,nombre ) VALUES  (3,'Ayudante');


INSERT INTO CLIENTE(idCliente, nombre, apellido,sexo,direccion, telefono,TIPO_CLIENTE_idTipoCliente) VALUES  (1,'diego','ramoz','M','AMAZONAS_LUYA_MARIA','959185144',1);
INSERT INTO CLIENTE(idCliente, nombre, apellido,sexo,direccion, telefono,TIPO_CLIENTE_idTipoCliente) VALUES  (2,'luz','frama','F','AMAZONAS_LUYA_MARIA','948274655',1);
INSERT INTO CLIENTE(idCliente, nombre, apellido,sexo,direccion, telefono,TIPO_CLIENTE_idTipoCliente) VALUES  (3,'fran','Rondoy','M','AMAZONAS_LUYA_MARIA','948375678',2);
INSERT INTO CLIENTE(idCliente, nombre, apellido,sexo,direccion, telefono,TIPO_CLIENTE_idTipoCliente) VALUES  (4,'Maria','Girrez','F','AMAZONAS_LUYA_MARIA','948374556',3);
INSERT INTO CLIENTE(idCliente, nombre, apellido,sexo,direccion, telefono,TIPO_CLIENTE_idTipoCliente) VALUES  (5,'Diana','Girrez','F','AYACUCHO_SUCRE_PAICO','948374556',3);
INSERT INTO CLIENTE(idCliente, nombre, apellido,sexo,direccion, telefono,TIPO_CLIENTE_idTipoCliente) VALUES  (6,'Demin','Braz','M','LIMA_LIMA_SANISIDRO','948374556',3);

INSERT INTO EMPLEADO(idEmpleado, nombre, apellido,sexo,direccion, telefono,TIPO_Empleado_idTipoEmpleado) VALUES  (1,'diego','ramoz','M','AMAZONAS_LUYA_MARIA','959185144',1);
INSERT INTO EMPLEADO(idEmpleado, nombre, apellido,sexo,direccion, telefono,TIPO_Empleado_idTipoEmpleado) VALUES  (2,'luz','frama','F','AMAZONAS_LUYA_MARIA','948274655',2);
INSERT INTO EMPLEADO(idEmpleado, nombre, apellido,sexo,direccion, telefono,TIPO_Empleado_idTipoEmpleado) VALUES  (3,'fran','Rondoy','M','AYACUCHO_SUCRE_PAICO','948375678',2);
INSERT INTO EMPLEADO(idEmpleado, nombre, apellido,sexo,direccion, telefono,TIPO_Empleado_idTipoEmpleado) VALUES  (4,'Maria','Girrez','F','AYACUCHO_SUCRE_PAICO','948374556',3);
INSERT INTO EMPLEADO(idEmpleado, nombre, apellido,sexo,direccion, telefono,TIPO_Empleado_idTipoEmpleado) VALUES  (5,'Maria','Girrez','F','AMAZONAS_LUYA_MARIA','948374556',2);
INSERT INTO EMPLEADO(idEmpleado, nombre, apellido,sexo,direccion, telefono,TIPO_Empleado_idTipoEmpleado) VALUES  (6,'Mario','Brun','M','LIMA_LIMA_SANISIDRO','948374556',3);



INSERT INTO COMIDA(idComida, nombre, descripcion,precio,TIPO_COMIDA_idTipoComida) VALUES  (1,'HAMBURGUESA','delicioso y poca grasa','S/. 10,00',1);
INSERT INTO COMIDA(idComida, nombre, descripcion,precio,TIPO_COMIDA_idTipoComida) VALUES  (2,'PIZZA','delicioso y poca grasa','S/. 40,00',1);
INSERT INTO COMIDA(idComida, nombre, descripcion,precio,TIPO_COMIDA_idTipoComida) VALUES  (3,'CANELONES','delicioso y poca grasa','S/. 20,00',2);
INSERT INTO COMIDA(idComida, nombre, descripcion,precio,TIPO_COMIDA_idTipoComida) VALUES  (4,'soda','bebidas helada','S/. 4,00',2);

	INSERT INTO VENTA(idVenta, fechaVenta, totalVenta,EMPLEADO_idEmpleado,CLIENTE_idCliente) VALUES  (1,'5/23/2016','S/. 40,00',1,2);
	INSERT INTO VENTA(idVenta, fechaVenta, totalVenta,EMPLEADO_idEmpleado,CLIENTE_idCliente) VALUES  (2,'2/23/2017','S/. 100,00',1,3);
	INSERT INTO VENTA(idVenta, fechaVenta, totalVenta,EMPLEADO_idEmpleado,CLIENTE_idCliente) VALUES  (3,'5/23/2015','S/. 150,00',3,3);
	INSERT INTO VENTA(idVenta, fechaVenta, totalVenta,EMPLEADO_idEmpleado,CLIENTE_idCliente) VALUES  (4,'4/23/2015','S/. 90,00',2,3);
	INSERT INTO VENTA(idVenta, fechaVenta, totalVenta,EMPLEADO_idEmpleado,CLIENTE_idCliente) VALUES  (5,'4/22/2014','S/. 100,00',2,2);
	INSERT INTO VENTA(idVenta, fechaVenta, totalVenta,EMPLEADO_idEmpleado,CLIENTE_idCliente) VALUES  (6,'3/10/2014','S/. 150,00',2,2);
	INSERT INTO VENTA(idVenta, fechaVenta, totalVenta,EMPLEADO_idEmpleado,CLIENTE_idCliente) VALUES  (7,'4/22/2014','S/. 60,00',4,2);
	INSERT INTO VENTA(idVenta, fechaVenta, totalVenta,EMPLEADO_idEmpleado,CLIENTE_idCliente) VALUES  (8,'3/10/2014','S/. 150,00',4,3);

	INSERT INTO DETALLE_VENTA(cantidad, importe, COMIDA_idComida,VENTA_idVenta) VALUES  (8,'S/. 8,00',1,1);
		INSERT INTO DETALLE_VENTA(cantidad, importe, COMIDA_idComida,VENTA_idVenta) VALUES  (2,'S/. 50,00',1,2);
			INSERT INTO DETALLE_VENTA(cantidad, importe, COMIDA_idComida,VENTA_idVenta) VALUES  (4,'S/. 8,00',1,3);
				INSERT INTO DETALLE_VENTA(cantidad, importe, COMIDA_idComida,VENTA_idVenta) VALUES  (6,'S/. 8,00',1,4);
					INSERT INTO DETALLE_VENTA(cantidad, importe, COMIDA_idComida,VENTA_idVenta) VALUES  (7,'S/. 8,00',1,5);

