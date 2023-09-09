-- Agregar 10 datos ficticios a la tabla ENFERMEDAD
INSERT INTO ENFERMEDAD (tipo) VALUES
('Enfermedad 1'),  -- Tabla ENFERMEDAD
('Enfermedad 2'),  -- Tabla ENFERMEDAD
('Enfermedad 3'),  -- Tabla ENFERMEDAD
('Enfermedad 4'),  -- Tabla ENFERMEDAD
('Enfermedad 5'),  -- Tabla ENFERMEDAD
('Enfermedad 6'),  -- Tabla ENFERMEDAD
('Enfermedad 7'),  -- Tabla ENFERMEDAD
('Enfermedad 8'),  -- Tabla ENFERMEDAD
('Enfermedad 9'),  -- Tabla ENFERMEDAD
('Enfermedad 10'); -- Tabla ENFERMEDAD

-- Agregar 10 datos ficticios a la tabla ALERGIA
INSERT INTO ALERGIA (causante) VALUES
('Causante 1'),  -- Tabla ALERGIA
('Causante 2'),  -- Tabla ALERGIA
('Causante 3'),  -- Tabla ALERGIA
('Causante 4'),  -- Tabla ALERGIA
('Causante 5'),  -- Tabla ALERGIA
('Causante 6'),  -- Tabla ALERGIA
('Causante 7'),  -- Tabla ALERGIA
('Causante 8'),  -- Tabla ALERGIA
('Causante 9'),  -- Tabla ALERGIA
('Causante 10'); -- Tabla ALERGIA

-- Agregar 10 datos ficticios a la tabla CLIENTE
INSERT INTO CLIENTE (nombre, apellido, fecha_nacimiento, celular, id_enfermedad, id_alergia) VALUES
('Cliente 1', 'Apellido 1', '1980-01-01', '555-111-1111', 1, 1),  -- Tabla CLIENTE
('Cliente 2', 'Apellido 2', '1985-02-02', '555-222-2222', 2, 2),  -- Tabla CLIENTE
('Cliente 3', 'Apellido 3', '1990-03-03', '555-333-3333', 3, 3),  -- Tabla CLIENTE
('Cliente 4', 'Apellido 4', '1995-04-04', '555-444-4444', 4, 4),  -- Tabla CLIENTE
('Cliente 5', 'Apellido 5', '2000-05-05', '555-555-5555', 5, 5),  -- Tabla CLIENTE
('Cliente 6', 'Apellido 6', '2005-06-06', '555-666-6666', 6, 6),  -- Tabla CLIENTE
('Cliente 7', 'Apellido 7', '2010-07-07', '555-777-7777', 7, 7),  -- Tabla CLIENTE
('Cliente 8', 'Apellido 8', '2015-08-08', '555-888-8888', 8, 8),  -- Tabla CLIENTE
('Cliente 9', 'Apellido 9', '2020-09-09', '555-999-9999', 9, 9),  -- Tabla CLIENTE
('Cliente 10', 'Apellido 10', '2025-10-10', '555-1010-1010', 10, 10); -- Tabla CLIENTE

-- Agregar 10 datos ficticios a la tabla PRODUCTO
INSERT INTO PRODUCTO (descripcion, precio, stock) VALUES
('Producto a', 10.00, 100),  -- Tabla PRODUCTO
('Producto b', 15.00, 200),  -- Tabla PRODUCTO
('Producto c', 20.00, 150),  -- Tabla PRODUCTO
('Producto d', 25.00, 180),  -- Tabla PRODUCTO
('Producto e', 30.00, 220),  -- Tabla PRODUCTO
('Producto f', 35.00, 120),  -- Tabla PRODUCTO
('Producto g', 40.00, 90),   -- Tabla PRODUCTO
('Producto h', 45.00, 110),  -- Tabla PRODUCTO
('Producto i', 50.00, 80),   -- Tabla PRODUCTO
('Producto j', 55.00, 70);  -- Tabla PRODUCTO

-- Agregar 10 datos ficticios a la tabla LOCALIDAD
INSERT INTO LOCALIDAD (localidad, partido, provincia) VALUES
('Localidad 1', 'Partido 1', 'Provincia 1'),   -- Tabla LOCALIDAD
('Localidad 2', 'Partido 2', 'Provincia 2'),   -- Tabla LOCALIDAD
('Localidad 3', 'Partido 3', 'Provincia 3'),   -- Tabla LOCALIDAD
('Localidad 4', 'Partido 4', 'Provincia 4'),   -- Tabla LOCALIDAD
('Localidad 5', 'Partido 5', 'Provincia 5'),   -- Tabla LOCALIDAD
('Localidad 6', 'Partido 6', 'Provincia 6'),   -- Tabla LOCALIDAD
('Localidad 7', 'Partido 7', 'Provincia 7'),   -- Tabla LOCALIDAD
('Localidad 8', 'Partido 8', 'Provincia 8'),   -- Tabla LOCALIDAD
('Localidad 9', 'Partido 9', 'Provincia 9'),   -- Tabla LOCALIDAD
('Localidad 10', 'Partido 10', 'Provincia 10');  -- Tabla LOCALIDAD

-- Agregar 10 datos ficticios a la tabla SUCURSAL
INSERT INTO SUCURSAL (direccion, capacidad) VALUES
('Dirección 1', 50),   -- Tabla SUCURSAL
('Dirección 2', 60),   -- Tabla SUCURSAL
('Dirección 3', 70),   -- Tabla SUCURSAL
('Dirección 4', 80),   -- Tabla SUCURSAL
('Dirección 5', 90),   -- Tabla SUCURSAL
('Dirección 6', 100),  -- Tabla SUCURSAL
('Dirección 7', 110),  -- Tabla SUCURSAL
('Dirección 8', 120),  -- Tabla SUCURSAL
('Dirección 9', 130),  -- Tabla SUCURSAL
('Dirección 10', 140); -- Tabla SUCURSAL

-- Agregar 10 datos ficticios a la tabla SERVICIO
INSERT INTO SERVICIO (tipo, duracion, costo) VALUES
('Servicio 1', 30, 50.00),   -- Tabla SERVICIO
('Servicio 2', 45, 65.00),   -- Tabla SERVICIO
('Servicio 3', 60, 80.00),   -- Tabla SERVICIO
('Servicio 4', 75, 95.00),   -- Tabla SERVICIO
('Servicio 5', 90, 110.00),  -- Tabla SERVICIO
('Servicio 6', 30, 50.00),   -- Tabla SERVICIO
('Servicio 7', 45, 65.00),   -- Tabla SERVICIO
('Servicio 8', 60, 80.00),   -- Tabla SERVICIO
('Servicio 9', 75, 95.00),   -- Tabla SERVICIO
('Servicio 10', 90, 110.00);  -- Tabla SERVICIO

-- Agregar 10 datos ficticios a la tabla PROFESIONAL
INSERT INTO PROFESIONAL (nombre, apellido, celular, nro_sucursal, id_servicio) VALUES
('Profesional 1', 'Apellido 1', '555-111-1111', 1, 1),   -- Tabla PROFESIONAL
('Profesional 2', 'Apellido 2', '555-222-2222', 2, 2),   -- Tabla PROFESIONAL
('Profesional 3', 'Apellido 3', '555-333-3333', 3, 3),   -- Tabla PROFESIONAL
('Profesional 4', 'Apellido 4', '555-444-4444', 4, 4),   -- Tabla PROFESIONAL
('Profesional 5', 'Apellido 5', '555-555-5555', 5, 5),   -- Tabla PROFESIONAL
('Profesional 6', 'Apellido 6', '555-666-6666', 6, 6),   -- Tabla PROFESIONAL
('Profesional 7', 'Apellido 7', '555-777-7777', 7, 7),   -- Tabla PROFESIONAL
('Profesional 8', 'Apellido 8', '555-888-8888', 8, 8),   -- Tabla PROFESIONAL
('Profesional 9', 'Apellido 9', '555-999-9999', 9, 9),   -- Tabla PROFESIONAL
('Profesional 10', 'Apellido 10', '555-1010-1010', 10, 10);  -- Tabla PROFESIONAL

-- Agregar 10 datos ficticios a la tabla CABECERA_FACTURA
INSERT INTO CABECERA_FACTURA (fecha, total, id_cliente) VALUES
('2023-09-01 10:00:00', 100.00, 1),   -- Tabla CABECERA_FACTURA
('2023-09-02 11:00:00', 150.00, 2),   -- Tabla CABECERA_FACTURA
('2023-09-03 12:00:00', 120.00, 3),   -- Tabla CABECERA_FACTURA
('2023-09-04 13:00:00', 180.00, 4),   -- Tabla CABECERA_FACTURA
('2023-09-05 14:00:00', 200.00, 5),   -- Tabla CABECERA_FACTURA
('2023-09-06 15:00:00', 90.00, 6),    -- Tabla CABECERA_FACTURA
('2023-09-07 16:00:00', 130.00, 7),   -- Tabla CABECERA_FACTURA
('2023-09-08 17:00:00', 110.00, 8),   -- Tabla CABECERA_FACTURA
('2023-09-09 18:00:00', 95.00, 9),    -- Tabla CABECERA_FACTURA
('2023-09-10 19:00:00', 220.00, 10);  -- Tabla CABECERA_FACTURA

-- Agregar 10 datos ficticios a la tabla DETALLE_FACTURA
INSERT INTO DETALLE_FACTURA (cantidad, precio_unitario, subtotal, id_factura, id_producto) VALUES
(2, 10.00, 20.00, 1, 1),   -- Tabla DETALLE_FACTURA
(3, 15.00, 45.00, 2, 2),   -- Tabla DETALLE_FACTURA
(1, 20.00, 20.00, 3, 3),   -- Tabla DETALLE_FACTURA
(4, 25.00, 100.00, 4, 4),   -- Tabla DETALLE_FACTURA
(2, 30.00, 60.00, 5, 5),   -- Tabla DETALLE_FACTURA
(5, 35.00, 175.00, 6, 6),   -- Tabla DETALLE_FACTURA
(3, 40.00, 120.00, 7, 7),   -- Tabla DETALLE_FACTURA
(2, 45.00, 90.00, 8, 8),   -- Tabla DETALLE_FACTURA
(1, 50.00, 50.00, 9, 9),   -- Tabla DETALLE_FACTURA
(4, 55.00, 220.00, 10, 10);  -- Tabla DETALLE_FACTURA

-- Agregar 10 datos ficticios a la tabla RESERVA
INSERT INTO RESERVA (fecha, costo, id_cliente, id_servicio, nro_sucursal) VALUES
('2023-09-01 10:00:00', 100, 1, 1, 1),   -- Tabla RESERVA
('2023-09-02 11:00:00', 150, 2, 2, 2),   -- Tabla RESERVA
('2023-09-03 12:00:00', 120, 3, 3, 3),   -- Tabla RESERVA
('2023-09-04 13:00:00', 180, 4, 4, 4),   -- Tabla RESERVA
('2023-09-05 14:00:00', 200, 5, 5, 5),   -- Tabla RESERVA
('2023-09-06 15:00:00', 90, 6, 6, 6),    -- Tabla RESERVA
('2023-09-07 16:00:00', 130, 7, 7, 7),   -- Tabla RESERVA
('2023-09-08 17:00:00', 110, 8, 8, 8),   -- Tabla RESERVA
('2023-09-09 18:00:00', 95, 9, 9, 9),    -- Tabla RESERVA
('2023-09-10 19:00:00', 220, 10, 10, 10);  -- Tabla RESERVA