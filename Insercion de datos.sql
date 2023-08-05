USE local_belleza;

-- Tabla CLIENTE
INSERT INTO CLIENTE (nombre, apellido, fecha_nacimiento, celular, enfermedad, alergia)
VALUES
('Juan', 'Pérez', '1990-05-15', '555-1234', 'Ninguna', 'Ninguna'),
('María', 'González', '1985-10-20', '666-7890', 'Asma', 'Polen'),
('Pedro', 'Ramírez', '1995-02-03', '444-5678', 'Diabetes', 'Lácteos'),
('Laura', 'López', '1988-09-12', '777-4321', 'Hipertensión', 'Nueces'),
('Carlos', 'Martínez', '1992-07-08', '888-9876', 'Ninguna', 'Ninguna');

-- Tabla PRODUCTO
INSERT INTO PRODUCTO (descripcion, precio, stock)
VALUES
('Camiseta', 19.99, 100),
('Pantalón', 29.99, 80),
('Zapatos', 49.99, 50),
('Gorra', 9.99, 120),
('Bufanda', 14.99, 60);

-- Tabla LOCALIDAD
INSERT INTO LOCALIDAD (localidad, partido, provincia)
VALUES
('Buenos Aires', 'La Matanza', 'Buenos Aires'),
('Córdoba', 'Córdoba Capital', 'Córdoba'),
('Rosario', 'Rosario Centro', 'Santa Fe'),
('Mendoza', 'Mendoza Norte', 'Mendoza'),
('Maracaibo', 'Maracaibo Centro', 'Zulia');

-- Tabla SUCURSAL
INSERT INTO SUCURSAL (direccion, capacidad, id_localidad)
VALUES
('Av. Libertador 123', 200, 1),
('Calle 9 de Julio 456', 150, 2),
('Av. San Martín 789', 100, 3),
('Plaza Independencia 234', 80, 4),
('Calle Principal 567', 120, 5);

-- Tabla SERVICIO
INSERT INTO SERVICIO (tipo, duracion, costo)
VALUES
('Corte de cabello', 30, 25.00),
('Manicura', 45, 15.00),
('Masaje relajante', 60, 40.00),
('Limpieza facial', 45, 35.00),
('Depilación', 60, 20.00);

-- Tabla RESERVA
INSERT INTO RESERVA (fecha, costo, id_cliente, id_servicio, nro_sucursal)
VALUES
('2023-07-26 10:00:00', 25, 1, 1, 1),
('2023-07-27 15:30:00', 15, 2, 2, 2),
('2023-07-28 12:00:00', 40, 3, 3, 3),
('2023-07-29 14:45:00', 35, 4, 4, 4),
('2023-07-30 11:30:00', 20, 5, 5, 5);

-- Tabla PROFESIONAL
INSERT INTO PROFESIONAL (nombre, apellido, celular, nro_sucursal, id_servicio)
VALUES
('Ana', 'Gómez', '555-1111', 1, 1),
('Luis', 'Sánchez', '666-2222', 2, 2),
('Elena', 'Fernández', '777-3333', 3, 3),
('Miguel', 'Hernández', '888-4444', 4, 4),
('Sofía', 'Vargas', '999-5555', 5, 5);

-- Tabla CABECERA FACTURA
INSERT INTO CABECERA_FACTURA (fecha, id_cliente)
VALUES
('2023-07-26 11:30:00', 1),
('2023-07-27 16:45:00', 2),
('2023-07-28 12:30:00', 3),
('2023-07-29 15:15:00', 4),
('2023-07-30 13:00:00', 5);

-- Tabla DETALLE FACTURA
INSERT INTO DETALLE_FACTURA (cantidad, precio_unitario, subtotal, id_factura, id_producto)
VALUES
(2, 19.99, 39.98, 1, 1),
(1, 29.99, 29.99, 2, 2),
(3, 49.99, 149.97, 3, 3),
(2, 9.99, 19.98, 4, 4),
(1, 14.99, 14.99, 5, 5);