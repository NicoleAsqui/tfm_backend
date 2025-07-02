-- Create alerts table
CREATE TABLE alerts (
                        alert_id VARCHAR(50) PRIMARY KEY,
                        alert_type VARCHAR(50),
                        priority VARCHAR(50),
                        alert_timestamp BIGINT,
                        title VARCHAR(255),
                        description TEXT,
                        data JSONB,
                        acknowledged BOOLEAN
);

-- Create movement table
CREATE TABLE movement (
                          id INT PRIMARY KEY,
                          movement_date DATE,
                          product VARCHAR(255),
                          movement_type VARCHAR(50),
                          reason VARCHAR(100),
                          quantity INT,
                          unit_price NUMERIC(10,2),
                          total_price NUMERIC(10,2),
                          store VARCHAR(100),
                          requester VARCHAR(100),
                          client VARCHAR(100),
                          note TEXT,
                          operator VARCHAR(100)
);

-- Create inventory table
CREATE TABLE inventory (
                           id INT PRIMARY KEY,
                           inventory_date DATE,
                           product VARCHAR(255),
                           movement_type VARCHAR(50),
                           reason VARCHAR(100),
                           quantity INT,
                           unit_price NUMERIC(10,2),
                           total_price NUMERIC(10,2),
                           store VARCHAR(100),
                           requester VARCHAR(100),
                           client VARCHAR(100),
                           note TEXT,
                           operator VARCHAR(100)
);

-- Insert alerts data
INSERT INTO alerts VALUES
                       ('ALERT_1', 'caducidad', 'alta', 1749081600, 'Fecha de caducidad límite', 'El lote VT-2024-001 (Vino Tinto Reserva) caduca el 12 de junio del 2025', '{"producto": "Vino Tinto Reserva", "lote": "VT-2024-001", "fecha_caducidad": "2025-06-12", "punto_venta": "Metr\\u00f3polis", "stock_actual": 15, "cliente_asignado": "Cliente Premium 001"}', false),
                       ('ALERT_2', 'stock', 'media', 1748995200, 'Producto casi agotado', 'El producto Whisky 12 años está a 10% de su stock normal', '{"producto": "Whisky 12 años", "stock_actual": 5, "stock_minimo": 50, "punto_venta": "Metr\\u00f3polis", "proveedor": "Distribuidor Licores SA"}', false),
                       ('ALERT_3', 'cliente', 'media', 1747267200, 'Producto menos comprado', 'Ron Añejo tiene 45% menos compras en Metr\\u00f3polis', '{"cliente": "Tienda Metr\\u00f3polis", "producto_afectado": "Ron Añejo", "compra_promedio": "20 cajas/mes", "compra_actual": "11 cajas/mes", "ultimo_pedido": "2025-05-10", "tendencia": "bajando"}', true),
                       ('ALERT_4', 'caducidad', 'alta', 1745107200, 'Productos caducados en Metr\\u00f3polis', '3 lotes caducaron en el último mes', '{"punto_venta": "Metr\\u00f3polis", "productos": [{"nombre": "Cerveza Artesanal IPA", "lote": "CA-2024-001", "caducidad": "2025-04-05", "stock": 8}, {"nombre": "Ginebra Premium", "lote": "GP-2024-001", "caducidad": "2025-04-12", "stock": 5}, {"nombre": "Vodka Importado", "lote": "VI-2024-001", "caducidad": "2025-04-18", "stock": 3}]}', true);

-- Insert movement data
INSERT INTO movement VALUES
                         (1, '2023-05-15', 'Vino Tinto Reserva', 'egreso', 'degustacion', 5, 8.50, 42.50, 'Tienda Centro', 'Juan P\\u00e9rez', 'Cliente VIP 001', 'Degustaci\\u00f3n para cliente preferencial', 'Mar\\u00eda Gonz\\u00e1lez'),
                         (2, '2023-05-16', 'Whisky 12 a\\u00f1os', 'egreso', 'promocion', 2, 25.00, 50.00, 'Tienda Norte', 'Ana L\\u00f3pez', 'N/A', 'Promoci\\u00f3n de lanzamiento', 'Carlos Ruiz'),
                         (3, '2023-05-17', 'Cerveza Artesanal', 'egreso', 'merma', 12, 1.80, 21.60, 'Tienda Sur', 'Luis Mart\\u00ednez', 'N/A', 'Caducidad', 'Sistema'),
                         (4, '2023-05-18', 'Ron A\\u00f1ejo', 'egreso', 'devolucion', 1, 30.00, 30.00, 'Tienda Centro', 'Pedro S\\u00e1nchez', 'Cliente Regular 045', 'Producto defectuoso', 'Mar\\u00eda Gonz\\u00e1lez'),
                         (5, '2023-05-19', 'Vino Blanco', 'ingreso', 'compra', 50, 6.00, 300.00, 'Tienda Centro', 'Sistema', 'N/A', 'Reabastecimiento', 'N/A');

-- Insert inventory data
INSERT INTO inventory VALUES
                          (1, '2023-05-15', 'Vino Tinto Reserva', 'egreso', 'degustacion', 5, 8.50, 42.50, 'Tienda Centro', 'Juan P\\u00e9rez', 'Cliente VIP 001', 'Degustaci\\u00f3n para cliente preferencial', 'Mar\\u00eda Gonz\\u00e1lez'),
                          (2, '2023-05-16', 'Whisky 12 a\\u00f1os', 'egreso', 'promocion', 2, 25.00, 50.00, 'Tienda Norte', 'Ana L\\u00f3pez', 'N/A', 'Promoci\\u00f3n de lanzamiento', 'Carlos Ruiz'),
                          (3, '2023-05-17', 'Cerveza Artesanal', 'egreso', 'merma', 12, 1.80, 21.60, 'Tienda Sur', 'Luis Mart\\u00ednez', 'N/A', 'Caducidad', 'Sistema'),
                          (4, '2023-05-18', 'Ron A\\u00f1ejo', 'egreso', 'devolucion', 1, 30.00, 30.00, 'Tienda Centro', 'Pedro S\\u00e1nchez', 'Cliente Regular 045', 'Producto defectuoso', 'Mar\\u00eda Gonz\\u00e1lez'),
                          (5, '2023-05-19', 'Vino Blanco', 'ingreso', 'compra', 50, 6.00, 300.00, 'Tienda Centro', 'Sistema', 'N/A', 'Reabastecimiento', 'N/A');