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
INSERT INTO CLIENTE (nombre, apellido, fecha_nacimiento, celular, id_enfermedad, id_alergia)
VALUES ('Juan', 'Pérez', '1990-05-15', '555-123-4567', 1, 2);

 -- Agrego dato a tabla PRODUCTO
INSERT INTO PRODUCTO (descripcion, precio, stock)
VALUES ('Producto A', 19.99, 100);

-- Agrego dato a tabla CABECERA_FACTURA (esto también agregará automáticamente un registro en DETALLE_FACTURA)
INSERT INTO CABECERA_FACTURA (fecha, total, id_cliente)
VALUES ('2023-09-15 12:00:00', 100.00, 1);  -- Supongamos que el ID del cliente es 1

-- Ahora agrego un dato a tabla DETALLE_FACTURA relacionado con la cabecera creada
-- Supongamos que el ID de la factura es 1
INSERT INTO DETALLE_FACTURA (cantidad, precio_unitario, subtotal, id_factura, id_producto)
VALUES (2, 45.00, 90.00, 14, 1);  -- Supongamos que el ID del producto es 1

-- Agrego dato a tabla RESERVA
INSERT INTO RESERVA (fecha, costo, id_cliente, id_servicio, nro_sucursal)
VALUES ('2023-09-20 14:30:00', 50, 2, 3, 1);  -- Supongamos que el ID del cliente es 2, ID del servicio es 3 y número de sucursal es 1

-- Verifico funcionamiento de trigger en tabla LOG_CLIENTE
SELECT * FROM LOG_CLIENTE;

-- Verifico funcionamiento de trigger en tabla LOG_PRODUCTO
SELECT * FROM LOG_PRODUCTO;

-- Verifico funcionamiento de trigger en tabla LOG_FACTURA
SELECT * FROM LOG_FACTURA;

-- Verifico funcionamiento de trigger en tabla LOG_RESERVA
SELECT * FROM LOG_RESERVA;