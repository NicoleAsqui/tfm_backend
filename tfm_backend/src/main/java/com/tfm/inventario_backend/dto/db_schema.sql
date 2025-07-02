CREATE DATABASE inventario_db;

-- Table for Inventory entity
CREATE TABLE inventory (
                           id VARCHAR(255) PRIMARY KEY,
                           nombre VARCHAR(255),
                           categoria VARCHAR(255),
                           marca VARCHAR(255),
                           precio_compra NUMERIC,
                           precio_venta NUMERIC,
                           stock_total INT,
                           stock_minimo INT,
                           caducidad DATE,
                           lote VARCHAR(255),
                           punto_venta VARCHAR(255)
);

-- Table for Movement entity
CREATE TABLE movement (
                          id BIGINT PRIMARY KEY,
                          fecha DATE,
                          producto VARCHAR(255),
                          tipo VARCHAR(100),
                          categoria VARCHAR(255),
                          cantidad INT,
                          costo_unitario NUMERIC,
                          costo_total NUMERIC,
                          punto_venta VARCHAR(255),
                          responsable VARCHAR(255),
                          cliente VARCHAR(255),
                          motivo VARCHAR(255),
                          aprobado_por VARCHAR(255)
);

-- Table for Alert entity
CREATE TABLE alert (
                       id VARCHAR(255) PRIMARY KEY,
                       tipo VARCHAR(50),
                       severidad VARCHAR(50),
                       timestamp BIGINT,
                       titulo VARCHAR(255),
                       descripcion VARCHAR(1024),
                       detalles TEXT,
                       leida BOOLEAN
);