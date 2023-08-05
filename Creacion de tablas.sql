CREATE DATABASE local_belleza;

-- Usar la base de datos recién creada
USE local_belleza;

-- Tabla CLIENTE
CREATE TABLE CLIENTE (
    id_cliente INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    apellido VARCHAR(50) NOT NULL,
    fecha_nacimiento DATE NOT NULL,
    celular VARCHAR(30) NOT NULL,
    enfermedad VARCHAR(50) NOT NULL,
    alergia VARCHAR(50) NOT NULL
);

-- Tabla PRODUCTO
CREATE TABLE PRODUCTO (
    id_producto INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    descripcion VARCHAR(50) NOT NULL,
    precio DECIMAL(11,2) NOT NULL,
    stock INT NOT NULL
);

-- Tabla LOCALIDAD
CREATE TABLE LOCALIDAD (
    id_localidad INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    localidad VARCHAR(40) NOT NULL,
    partido VARCHAR(40) NOT NULL,
    provincia VARCHAR(40) NOT NULL
);

-- Tabla SUCURSAL
CREATE TABLE SUCURSAL (
    nro_sucursal INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    direccion VARCHAR(50) NOT NULL,
    capacidad INT,
    id_localidad INT,
    FOREIGN KEY (id_localidad) REFERENCES LOCALIDAD(id_localidad)
);

-- Tabla SERVICIO
CREATE TABLE SERVICIO (
    id_servicio INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    tipo VARCHAR(30) NOT NULL,
    duracion INT NOT NULL,
    costo DECIMAL(11,2) NOT NULL
);

-- Tabla RESERVA
CREATE TABLE RESERVA (
    id_reserva INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    fecha DATETIME NOT NULL,
    costo INT NOT NULL,
    id_cliente INT,
    id_servicio INT,
    -- nro_sucursal INT,
    FOREIGN KEY (id_cliente) REFERENCES CLIENTE(id_cliente),
    FOREIGN KEY (id_servicio) REFERENCES SERVICIO(id_servicio)
    -- FOREIGN KEY (nro_sucursal) REFERENCES SUCURSAL(nro_sucursal)
);

-- Tabla PROFESIONAL
CREATE TABLE PROFESIONAL (
    legajo INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    apellido VARCHAR(50) NOT NULL,
    celular VARCHAR(30) NOT NULL,
    nro_sucursal INT,
    id_servicio INT,
    FOREIGN KEY (nro_sucursal) REFERENCES SUCURSAL(nro_sucursal),
    FOREIGN KEY (id_servicio) REFERENCES SERVICIO(id_servicio)
);

-- Tabla CABECERA FACTURA
CREATE TABLE CABECERA_FACTURA (
    id_factura INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    fecha DATETIME NOT NULL,
    total DECIMAL(11,2),
    id_cliente INT,
    FOREIGN KEY (id_cliente) REFERENCES CLIENTE(id_cliente)
);

-- Tabla DETALLE FACTURA
CREATE TABLE DETALLE_FACTURA (
    id_detalle INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    cantidad INT NOT NULL,
    precio_unitario DECIMAL(11,2) NOT NULL,
    subtotal DECIMAL(11,2) NOT NULL,
    id_factura INT NOT NULL,
    id_producto INT NOT NULL,
    FOREIGN KEY (id_factura) REFERENCES CABECERA_FACTURA(id_factura),
    FOREIGN KEY (id_producto) REFERENCES PRODUCTO(id_producto)
);

-- Agregado de nro_sucursal a la tabla RESERVA
ALTER TABLE reserva
ADD nro_sucursal INT;

ALTER TABLE reserva
ADD FOREIGN KEY (nro_sucursal) REFERENCES sucursal (nro_sucursal);