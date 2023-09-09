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
CALL sp_ordenar_productos('descripcion', 'ASC');

-- Para ordenar los productos por precio de manera descendente:
CALL sp_ordenar_productos('precio', 'DESC');

-- Para insertar un nuevo producto:
CALL sp_insertar_producto('Nuevo Producto', 25.00, 100);

-- Ver tabla PRODUCTOS con nuevo producto agregado
SELECT p.*
FROM PRODUCTO p
WHERE p.id_producto = (
    SELECT MAX(id_producto) FROM PRODUCTO
);