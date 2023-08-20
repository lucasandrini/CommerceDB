-- Inicio una transacción
START TRANSACTION;

-- Elimino dos registros de la tabla CLIENTE
DELETE FROM CLIENTE WHERE id_cliente = 1;
DELETE FROM CLIENTE WHERE id_cliente = 2;

-- --ROLLBACK; -- 

-- COMMIT; -- 

-- Reinsercion de los datos
-- INSERT INTO CLIENTE (id_cliente, nombre, apellido, fecha_nacimiento, celular, enfermedad, alergia)
-- VALUES
-- (1, 'Juan', 'Pérez', '1990-05-15', '555-1234', 'Ninguna', 'Ninguna'),
-- (2, 'María', 'González', '1985-10-20', '666-7890', 'Asma', 'Polen');

-- Inicio una transacción
START TRANSACTION;

-- Inserto ocho registros en la tabla PRODUCTO
INSERT INTO PRODUCTO (descripcion, precio, stock)
VALUES
('Vestido', 39.99, 60),
('Camisa', 24.99, 90),
('Chaqueta', 59.99, 40),
('Sombrero', 12.99, 100);

-- Savepoint después del registro #4
SAVEPOINT savepoint_after_4;

-- Inserto los siguientes cuatro registros
INSERT INTO PRODUCTO (descripcion, precio, stock)
VALUES
('Calcetines', 6.99, 200),
('Pulsera', 8.99, 150),
('Cinturón', 14.99, 80),
('Reloj', 99.99, 30);

-- Savepoint después del registro #8
SAVEPOINT savepoint_after_8;

-- --ROLLBACK TO savepoint_after_4; 

-- COMMIT;