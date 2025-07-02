-- File: docker/init.sql

-- Create table for Alert model
CREATE TABLE alert (
                       id VARCHAR(50) PRIMARY KEY,
                       tipo VARCHAR(50),
                       severidad VARCHAR(50),
                       timestamp BIGINT,
                       titulo VARCHAR(255),
                       descripcion TEXT,
                       detalles TEXT,
                       leida BOOLEAN
);

-- Create table for Movement model
CREATE TABLE movement (
                          id BIGINT PRIMARY KEY,
                          fecha DATE,
                          producto VARCHAR(255),
                          tipo VARCHAR(50),
                          categoria VARCHAR(100),
                          cantidad INT,
                          costo_unitario NUMERIC(10,2),
                          costo_total NUMERIC(10,2),
                          punto_venta VARCHAR(100),
                          responsable VARCHAR(100),
                          cliente VARCHAR(100),
                          motivo VARCHAR(255),
                          aprobado_por VARCHAR(100)
);

-- Create table for Inventory model
CREATE TABLE inventory (
                           id VARCHAR(50) PRIMARY KEY,
                           nombre VARCHAR(255),
                           categoria VARCHAR(100),
                           marca VARCHAR(100),
                           precio_compra NUMERIC(10,2),
                           precio_venta NUMERIC(10,2),
                           stock_total INT,
                           stock_minimo INT,
                           caducidad DATE,
                           lote VARCHAR(100),
                           punto_venta VARCHAR(100)
);

-- Insert data into alert table
INSERT INTO alert VALUES
                      ('ALERT_1', 'caducidad', 'alta', 1749081600, 'Fecha de caducidad límite', 'El lote VT-2024-001 (Vino Tinto Reserva) caduca el 12 de junio del 2025', '{"producto": "Vino Tinto Reserva", "lote": "VT-2024-001", "fecha_caducidad": "2025-06-12", "punto_venta": "Metr\\u00f3polis", "stock_actual": 15, "cliente_asignado": "Cliente Premium 001"}', false),
                      ('ALERT_2', 'stock', 'media', 1748995200, 'Producto casi agotado', 'El producto Whisky 12 años está a 10% de su stock normal', '{"producto": "Whisky 12 años", "stock_actual": 5, "stock_minimo": 50, "punto_venta": "Metr\\u00f3polis", "proveedor": "Distribuidor Licores SA"}', false),
                      ('ALERT_3', 'cliente', 'media', 1747267200, 'Producto menos comprado', 'Ron Añejo tiene 45% menos compras en Metr\\u00f3polis', '{"cliente": "Tienda Metr\\u00f3polis", "producto_afectado": "Ron Añejo", "compra_promedio": "20 cajas/mes", "compra_actual": "11 cajas/mes", "ultimo_pedido": "2025-05-10", "tendencia": "bajando"}', true),
                      ('ALERT_4', 'caducidad', 'alta', 1745107200, 'Productos caducados en Metr\\u00f3polis', '3 lotes caducaron en el último mes', '{"punto_venta": "Metr\\u00f3polis", "productos": [{"nombre": "Cerveza Artesanal IPA", "lote": "CA-2024-001", "caducidad": "2025-04-05", "stock": 8}, {"nombre": "Ginebra Premium", "lote": "GP-2024-001", "caducidad": "2025-04-12", "stock": 5}, {"nombre": "Vodka Importado", "lote": "VI-2024-001", "caducidad": "2025-04-18", "stock": 3}]}', true);

-- Insert data into movement table
INSERT INTO movement VALUES
                         (1, '2023-05-15', 'Vino Tinto Reserva', 'egreso', 'degustacion', 5, 8.50, 42.50, 'Tienda Centro', 'Juan P\\u00e9rez', 'Cliente VIP 001', 'Degustaci\\u00f3n para cliente preferencial', 'Mar\\u00eda Gonz\\u00e1lez'),
                         (2, '2023-05-16', 'Whisky 12 a\\u00f1os', 'egreso', 'promocion', 2, 25.00, 50.00, 'Tienda Norte', 'Ana L\\u00f3pez', 'N/A', 'Promoci\\u00f3n de lanzamiento', 'Carlos Ruiz'),
                         (3, '2023-05-17', 'Cerveza Artesanal', 'egreso', 'merma', 12, 1.80, 21.60, 'Tienda Sur', 'Luis Mart\\u00ednez', 'N/A', 'Caducidad', 'Sistema'),
                         (4, '2023-05-18', 'Ron A\\u00f1ejo', 'egreso', 'devolucion', 1, 30.00, 30.00, 'Tienda Centro', 'Pedro S\\u00e1nchez', 'Cliente Regular 045', 'Producto defectuoso', 'Mar\\u00eda Gonz\\u00e1lez'),
                         (5, '2023-05-19', 'Vino Blanco', 'ingreso', 'compra', 50, 6.00, 300.00, 'Tienda Centro', 'Sistema', 'N/A', 'Reabastecimiento', 'N/A');

-- Insert data into inventory table with adapted mapping:
-- id: casted as text, nombre from product, precio_compra from unit_price,
-- precio_venta from total_price, stock_total from quantity, caducidad from inventory_date,
-- remaining fields set to empty or default values.
INSERT INTO inventory VALUES
                          ('1', 'Vino Tinto Reserva', '', '', 8.50, 42.50, 5, 0, '2023-05-15', '', 'Tienda Centro'),
                          ('2', 'Whisky 12 a\\u00f1os', '', '', 25.00, 50.00, 2, 0, '2023-05-16', '', 'Tienda Norte'),
                          ('3', 'Cerveza Artesanal', '', '', 1.80, 21.60, 12, 0, '2023-05-17', '', 'Tienda Sur'),
                          ('4', 'Ron A\\u00f1ejo', '', '', 30.00, 30.00, 1, 0, '2023-05-18', '', 'Tienda Centro'),
                          ('5', 'Vino Blanco', '', '', 6.00, 300.00, 50, 0, '2023-05-19', '', 'Tienda Centro');