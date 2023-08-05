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
SELECT * FROM VISTA_PRODUCTOS_MAS_VENDIDOS;

-- Ejecutar la vista VISTA_SERVICIOS_MAS_CONTRATADOS
SELECT * FROM VISTA_SERVICIOS_MAS_CONTRATADOS;

-- Ejecutar la vista VISTA_SUCURSAL_CON_MAS_VENTAS
SELECT * FROM VISTA_SUCURSAL_CON_MAS_VENTAS;

-- Ejecutar la vista VISTA_CLIENTES_POR_PROFESIONAL
SELECT * FROM VISTA_CLIENTES_POR_PROFESIONAL;

-- Ejecutar la vista VISTA_SERVICIOS_POR_SUCURSAL
SELECT * FROM VISTA_SERVICIO_MAS_CONTRATADO_POR_SUCURSAL;