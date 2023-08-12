-- Creacion de usuarios
CREATE USER 'user1'@'localhost' IDENTIFIED BY 'pw1';
CREATE USER 'user2'@'localhost' IDENTIFIED BY 'pw2';

-- Asignacion de permisos
-- User1: solo lectura
GRANT SELECT ON local_belleza.* TO 'user1'@'localhost';
-- User2: lectura, insercion y modificacion
GRANT SELECT, INSERT, UPDATE ON local_belleza.* TO 'user2'@'localhost';