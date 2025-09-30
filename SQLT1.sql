CREATE DATABASE BD1_Apellido;
USE BD1_Apellido;

-- Tabla categoria
CREATE TABLE categoria (
    id_cate INT AUTO_INCREMENT PRIMARY KEY,
    descripcion VARCHAR(50) NOT NULL,
    frecuencia_compra ENUM('Diario', 'Interdiario', 'Semanal', 'Por_Stock') NOT NULL
);

INSERT INTO categoria (descripcion, frecuencia_compra) VALUES
('Bebidas', 'Diario'),
('Snacks', 'Semanal'),
('Limpieza', 'Por_Stock');

-- Tabla productos
CREATE TABLE productos (
    id_prod INT AUTO_INCREMENT PRIMARY KEY,
    nom_prod VARCHAR(50) NOT NULL,
    id_cate INT NOT NULL,
    stock_actual INT DEFAULT 0,
    FOREIGN KEY (id_cate) REFERENCES categoria(id_cate)
);

INSERT INTO productos (nom_prod, id_cate, stock_actual) VALUES
('Coca Cola 500ml', 1, 100),
('Papitas Lays', 2, 50),
('Detergente Ariel 1kg', 3, 80);

-- Tabla inventario
CREATE TABLE inventario (
    nro_inventario INT AUTO_INCREMENT PRIMARY KEY,
    fecha TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    id_prod INT NOT NULL,
    costo_ingreso DECIMAL(10,2) NOT NULL,
    motivo_ingreso VARCHAR(100) NOT NULL,
    FOREIGN KEY (id_prod) REFERENCES productos(id_prod)
);
