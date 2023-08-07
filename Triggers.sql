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

-- Agrego dato a tabla CLIENTE
INSERT INTO CLIENTE (nombre, apellido, fecha_nacimiento, celular, enfermedad, alergia)
VALUES ('Juan', 'Pérez', '1990-05-15', '555-123-4567', 'Ninguna', 'Polen');

 -- Agrego dato a tabla PRODUCTO
INSERT INTO PRODUCTO (descripcion, precio, stock)
VALUES ('Producto A', 19.99, 100);

-- Verifico funcionamiento de trigger en tabla LOG_CLIENTE
SELECT * FROM LOG_CLIENTE;

-- Verifico funcionamiento de trigger en tabla LOG_PRODUCTO
SELECT * FROM LOG_PRODUCTO;