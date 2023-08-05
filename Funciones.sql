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

SELECT calcularVentasProducto('2023-07-26', '2023-07-30', 1) AS total_ventas_producto_1;

SELECT aplicarDescuento(29.99, 10) AS precio_final_con_descuento;