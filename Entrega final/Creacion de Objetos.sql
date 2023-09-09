-- DB
CREATE DATABASE local_belleza;

-- Usar la base de datos recién creada
USE local_belleza;

-- TABLAS
-- Tabla ENFERMEDAD
CREATE TABLE ENFERMEDAD (
    id_enfermedad INT PRIMARY KEY AUTO_INCREMENT,
    tipo VARCHAR(40) NOT NULL
);

-- Tabla ALERGIA
CREATE TABLE ALERGIA (
    id_alergia INT PRIMARY KEY AUTO_INCREMENT,
    causante VARCHAR(40) NOT NULL
);

-- Tabla CLIENTE
CREATE TABLE CLIENTE (
    id_cliente INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(50) NOT NULL,
    apellido VARCHAR(50) NOT NULL,
    fecha_nacimiento DATE NOT NULL,
    celular VARCHAR(30) NOT NULL,
    id_enfermedad INT,
    id_alergia INT,
    FOREIGN KEY (id_enfermedad) REFERENCES ENFERMEDAD(id_enfermedad),
    FOREIGN KEY (id_alergia) REFERENCES ALERGIA(id_alergia)
);

-- Tabla PRODUCTO
CREATE TABLE PRODUCTO (
    id_producto INT PRIMARY KEY AUTO_INCREMENT,
    descripcion VARCHAR(50) NOT NULL,
    precio DECIMAL(11,2) NOT NULL,
    stock INT NOT NULL
);

-- Tabla LOCALIDAD
CREATE TABLE LOCALIDAD (
    id_localidad INT PRIMARY KEY AUTO_INCREMENT,
    localidad VARCHAR(40) NOT NULL,
    partido VARCHAR(40) NOT NULL,
    provincia VARCHAR(40) NOT NULL
);

-- Tabla SUCURSAL
CREATE TABLE SUCURSAL (
    nro_sucursal INT PRIMARY KEY AUTO_INCREMENT,
    direccion VARCHAR(50) NOT NULL,
    capacidad INT,
    id_localidad INT,
    FOREIGN KEY (id_localidad) REFERENCES LOCALIDAD(id_localidad)
);

-- Tabla SERVICIO
CREATE TABLE SERVICIO (
    id_servicio INT PRIMARY KEY AUTO_INCREMENT,
    tipo VARCHAR(30) NOT NULL,
    duracion INT NOT NULL,
    costo DECIMAL(11,2) NOT NULL
);

-- Tabla PROFESIONAL
CREATE TABLE PROFESIONAL (
    legajo INT PRIMARY KEY AUTO_INCREMENT,
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
    id_factura INT PRIMARY KEY AUTO_INCREMENT,
    fecha DATETIME NOT NULL,
    total DECIMAL(11,2),
    id_cliente INT,
    FOREIGN KEY (id_cliente) REFERENCES CLIENTE(id_cliente)
);

-- Tabla DETALLE FACTURA
CREATE TABLE DETALLE_FACTURA (
    id_detalle INT PRIMARY KEY AUTO_INCREMENT,
    cantidad INT NOT NULL,
    precio_unitario DECIMAL(11,2) NOT NULL,
    subtotal DECIMAL(11,2) NOT NULL,
    id_factura INT,
    id_producto INT,
    FOREIGN KEY (id_factura) REFERENCES CABECERA_FACTURA(id_factura),
    FOREIGN KEY (id_producto) REFERENCES PRODUCTO(id_producto)
);

-- Tabla RESERVA
CREATE TABLE RESERVA (
    id_reserva INT PRIMARY KEY AUTO_INCREMENT,
    fecha DATETIME NOT NULL,
    costo INT NOT NULL,
    id_cliente INT,
    id_servicio INT,
    nro_sucursal INT,
    FOREIGN KEY (id_cliente) REFERENCES CLIENTE(id_cliente),
    FOREIGN KEY (id_servicio) REFERENCES SERVICIO(id_servicio),
    FOREIGN KEY (nro_sucursal) REFERENCES SUCURSAL(nro_sucursal)
);

-- Tabla LOG_CLIENTE
CREATE TABLE LOG_CLIENTE (
    id_cliente INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(50) NOT NULL,
    apellido VARCHAR(50) NOT NULL,
    usuario VARCHAR(50) NOT NULL,
    fecha_hora DATETIME NOT NULL
);

-- Tabla LOG_PRODUCTO
CREATE TABLE LOG_PRODUCTO (
    id_producto INT PRIMARY KEY AUTO_INCREMENT,
    descripcion VARCHAR(50) NOT NULL,
    precio INT NOT NULL,
    stock INT NOT NULL,
    usuario VARCHAR(50) NOT NULL,
    fecha_hora DATETIME NOT NULL
);

-- Tabla LOG_FACTURA
CREATE TABLE LOG_FACTURA (
    id_detalle INT PRIMARY KEY AUTO_INCREMENT,
    cantidad INT NOT NULL,
    precio_unitario DECIMAL(11,2) NOT NULL,
    subtotal DECIMAL(11,2) NOT NULL,
    usuario VARCHAR(50) NOT NULL,
    fecha_hora DATETIME NOT NULL
);

-- Tabla LOG_RESERVA
CREATE TABLE LOG_RESERVA (
    id_reserva INT PRIMARY KEY AUTO_INCREMENT,
    fecha_hora DATETIME NOT NULL,
    costo INT NOT NULL,
    usuario VARCHAR(50) NOT NULL
);

-- TRIGGERS
DELIMITER //
CREATE TRIGGER tr_agregar_cliente
AFTER INSERT ON CLIENTE
FOR EACH ROW
BEGIN
    -- Al insertar un nuevo cliente, este trigger registra los datos en la tabla LOG_CLIENTE.
    -- Los valores de usuario y fecha_hora se capturan automáticamente.
    INSERT INTO LOG_CLIENTE (id_cliente, nombre, apellido, usuario, fecha_hora)
    VALUES (NEW.id_cliente, NEW.nombre, NEW.apellido, USER(), NOW());
END;
//
DELIMITER ;

DELIMITER //

CREATE TRIGGER tr_agregar_producto
AFTER INSERT ON PRODUCTO
FOR EACH ROW
BEGIN
    -- Al insertar un nuevo producto, este trigger registra los datos en la tabla LOG_PRODUCTO.
    -- Los valores de usuario y fecha_registro se capturan automáticamente.
    INSERT INTO LOG_PRODUCTO (id_producto, descripcion, precio, stock, usuario, fecha_hora)
    VALUES (NEW.id_producto, NEW.descripcion, NEW.precio, NEW.stock, USER(), NOW());
END;
//
DELIMITER ;

DELIMITER //

CREATE TRIGGER tr_agregar_factura
AFTER INSERT ON DETALLE_FACTURA
FOR EACH ROW
BEGIN
    -- Al insertar un nuevo registro en DETALLE_FACTURA, este trigger registra los datos en la tabla LOG_FACTURA.
    -- Los valores de usuario y fecha_hora se capturan automáticamente.
    INSERT INTO LOG_FACTURA (id_detalle, cantidad, precio_unitario, subtotal, usuario, fecha_hora)
    VALUES (NEW.id_detalle, NEW.cantidad, NEW.precio_unitario, NEW.subtotal, USER(), NOW());
END;
//
DELIMITER ;

DELIMITER //

CREATE TRIGGER tr_agregar_reserva
AFTER INSERT ON RESERVA
FOR EACH ROW
BEGIN
    -- Al insertar una nueva reserva, este trigger registra los datos en la tabla LOG_RESERVA.
    -- Los valores de usuario y fecha_hora se capturan automáticamente.
    INSERT INTO LOG_RESERVA (id_reserva, fecha_hora, costo, usuario)
    VALUES (NEW.id_reserva, NOW(), NEW.costo, USER());
END;
//
DELIMITER ;

-- Agrego dato a tabla CLIENTE
-- INSERT INTO CLIENTE (nombre, apellido, fecha_nacimiento, celular, id_enfermedad, id_alergia)
-- VALUES ('Juan', 'Pérez', '1990-05-15', '555-123-4567', 1, 2);

--  -- Agrego dato a tabla PRODUCTO
-- INSERT INTO PRODUCTO (descripcion, precio, stock)
-- VALUES ('Producto A', 19.99, 100);

-- Agrego dato a tabla CABECERA_FACTURA (esto también agregará automáticamente un registro en DETALLE_FACTURA)
-- INSERT INTO CABECERA_FACTURA (fecha, total, id_cliente)
-- VALUES ('2023-09-15 12:00:00', 100.00, 1);  -- Supongamos que el ID del cliente es 1

-- Ahora agrego un dato a tabla DETALLE_FACTURA relacionado con la cabecera creada
-- Supongamos que el ID de la factura es 1
-- INSERT INTO DETALLE_FACTURA (cantidad, precio_unitario, subtotal, id_factura, id_producto)
-- VALUES (2, 45.00, 90.00, 14, 1);  -- Supongamos que el ID del producto es 1

-- Agrego dato a tabla RESERVA
-- INSERT INTO RESERVA (fecha, costo, id_cliente, id_servicio, nro_sucursal)
-- VALUES ('2023-09-20 14:30:00', 50, 2, 3, 1);  -- Supongamos que el ID del cliente es 2, ID del servicio es 3 y número de sucursal es 1

-- Verifico funcionamiento de trigger en tabla LOG_CLIENTE
-- SELECT * FROM LOG_CLIENTE;

-- Verifico funcionamiento de trigger en tabla LOG_PRODUCTO
-- SELECT * FROM LOG_PRODUCTO;

-- Verifico funcionamiento de trigger en tabla LOG_FACTURA
-- SELECT * FROM LOG_FACTURA;

-- Verifico funcionamiento de trigger en tabla LOG_RESERVA
-- SELECT * FROM LOG_RESERVA;

-- FUNCIONES
DELIMITER $$

CREATE FUNCTION calcularVentasProducto(fechaInicio DATE, fechaFin DATE, productoId INT) 
RETURNS DECIMAL(11,2) READS SQL DATA
BEGIN
    DECLARE totalVentas DECIMAL(11,2);
    
    SELECT SUM(df.cantidad * df.precio_unitario) INTO totalVentas
    FROM RESERVA r
    INNER JOIN DETALLE_FACTURA df ON r.id_reserva = df.id_factura
    WHERE r.fecha BETWEEN fechaInicio AND fechaFin
    AND df.id_producto = productoId;
    
    IF totalVentas IS NULL THEN
        SET totalVentas = 0;
    END IF;
    
    RETURN totalVentas;
END$$

DELIMITER ;

DELIMITER $$

CREATE FUNCTION aplicarDescuento(precioOriginal DECIMAL(11,2), descuento DECIMAL(5,2)) 
RETURNS DECIMAL(11,2) DETERMINISTIC
BEGIN
    DECLARE precioFinal DECIMAL(11,2);
    
    SET precioFinal = precioOriginal - (precioOriginal * descuento / 100);
    
    RETURN precioFinal;
END$$

DELIMITER ;

-- SELECT calcularVentasProducto('2020-07-26', '2023-09-09', 1) AS total_ventas_producto_1;

-- SELECT aplicarDescuento(29.99, 10) AS precio_final_con_descuento;

-- VISTAS
-- Los 3 productos más vendidos:
CREATE VIEW VISTA_PRODUCTOS_MAS_VENDIDOS AS
SELECT P.id_producto, P.descripcion, P.precio, P.stock, COUNT(DF.id_producto) AS cantidad_vendida
FROM PRODUCTO P
LEFT JOIN DETALLE_FACTURA DF ON P.id_producto = DF.id_producto
GROUP BY P.id_producto, P.descripcion, P.precio, P.stock
ORDER BY cantidad_vendida DESC
LIMIT 3;

-- Los 3 servicios más contratados:
CREATE VIEW VISTA_SERVICIOS_MAS_CONTRATADOS AS
SELECT S.id_servicio, S.tipo, S.duracion, S.costo, COUNT(R.id_servicio) AS cantidad_contratada
FROM SERVICIO S
LEFT JOIN RESERVA R ON S.id_servicio = R.id_servicio
GROUP BY S.id_servicio, S.tipo, S.duracion, S.costo
ORDER BY cantidad_contratada DESC
LIMIT 3;

-- En qué sucursal se producen más ventas usando las facturas:
CREATE VIEW VISTA_SUCURSAL_CON_MAS_VENTAS AS
SELECT S.nro_sucursal, S.direccion, COUNT(CF.id_factura) AS cantidad_ventas
FROM SUCURSAL S
LEFT JOIN CABECERA_FACTURA CF ON S.nro_sucursal = CF.id_cliente
LEFT JOIN RESERVA R ON CF.id_factura = R.id_reserva
GROUP BY S.nro_sucursal, S.direccion
ORDER BY cantidad_ventas DESC
LIMIT 1;

-- Cuántos clientes se atienden por profesional:
CREATE VIEW VISTA_CLIENTES_POR_PROFESIONAL AS
SELECT P.legajo, P.nombre, P.apellido, COUNT(R.id_cliente) AS cantidad_clientes_atendidos
FROM PROFESIONAL P
LEFT JOIN RESERVA R ON P.legajo = R.id_cliente
GROUP BY P.legajo, P.nombre, P.apellido;

-- Servicios mas contratado por sucursal:
CREATE VIEW VISTA_SERVICIO_MAS_CONTRATADO_POR_SUCURSAL AS
SELECT SU.nro_sucursal, SU.direccion, SE.tipo AS servicio_mas_contratado, COUNT(R.id_servicio) AS cantidad_contratada
FROM RESERVA R
JOIN SUCURSAL SU ON R.nro_sucursal = SU.nro_sucursal
JOIN SERVICIO SE ON R.id_servicio = SE.id_servicio
GROUP BY SU.nro_sucursal, SE.tipo
HAVING COUNT(R.id_servicio) > 0
ORDER BY cantidad_contratada DESC;

-- Ejecutar la vista VISTA_PRODUCTOS_MAS_VENDIDOS
-- SELECT * FROM VISTA_PRODUCTOS_MAS_VENDIDOS;

-- Ejecutar la vista VISTA_SERVICIOS_MAS_CONTRATADOS
-- SELECT * FROM VISTA_SERVICIOS_MAS_CONTRATADOS;

-- Ejecutar la vista VISTA_SUCURSAL_CON_MAS_VENTAS
-- SELECT * FROM VISTA_SUCURSAL_CON_MAS_VENTAS;

-- Ejecutar la vista VISTA_CLIENTES_POR_PROFESIONAL
-- SELECT * FROM VISTA_CLIENTES_POR_PROFESIONAL;

-- Ejecutar la vista VISTA_SERVICIOS_POR_SUCURSAL
-- SELECT * FROM VISTA_SERVICIO_MAS_CONTRATADO_POR_SUCURSAL;

-- STORED PROCEDURES
DELIMITER //
CREATE PROCEDURE sp_ordenar_productos(
    IN campo_orden VARCHAR(50), -- Campo por el cual se ordenarán los productos
    IN direccion VARCHAR(10) -- Dirección de ordenamiento: 'ASC' (ascendente) o 'DESC' (descendente)
)
BEGIN
    -- Crear una cadena con el campo de ordenamiento y la dirección
    SET @orden = CONCAT(campo_orden, ' ', direccion);
    
    -- Crear la consulta SQL completa para ordenar los productos
    SET @consulta = CONCAT('SELECT * FROM PRODUCTO ORDER BY ', @orden);
    
    -- Preparar y ejecutar la consulta
    PREPARE ord FROM @consulta;
    EXECUTE ord;
    DEALLOCATE PREPARE ord;
END;
//
DELIMITER ;

DELIMITER //
CREATE PROCEDURE sp_insertar_producto(
    IN descripcion_producto VARCHAR(50), -- Descripción del nuevo producto
    IN precio_producto DECIMAL(11,2), -- Precio del nuevo producto
    IN stock_producto INT -- Stock del nuevo producto
)
BEGIN
    -- Insertar el nuevo producto en la tabla PRODUCTO
    INSERT INTO PRODUCTO (descripcion, precio, stock)
    VALUES (descripcion_producto, precio_producto, stock_producto);
END;
//
DELIMITER ;

-- Para ordenar los productos por descripción de manera ascendente:
-- CALL sp_ordenar_productos('descripcion', 'ASC');

-- Para ordenar los productos por precio de manera descendente:
-- CALL sp_ordenar_productos('precio', 'DESC');

-- Para insertar un nuevo producto:
-- CALL sp_insertar_producto('Nuevo Producto', 25.00, 100);

-- Ver tabla PRODUCTOS con nuevo producto agregado
-- SELECT p.*
-- FROM PRODUCTO p
-- WHERE p.id_producto = (
--     SELECT MAX(id_producto) FROM PRODUCTO
-- );