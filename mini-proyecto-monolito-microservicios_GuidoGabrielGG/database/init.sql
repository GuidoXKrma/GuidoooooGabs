CREATE TABLE IF NOT EXISTS usuarios (id SERIAL PRIMARY KEY, nombre VARCHAR(100) NOT NULL, email VARCHAR(150) UNIQUE NOT NULL);
CREATE TABLE IF NOT EXISTS productos (id SERIAL PRIMARY KEY, nombre VARCHAR(100) NOT NULL, precio NUMERIC(10,2) NOT NULL CHECK (precio >= 0));
CREATE TABLE IF NOT EXISTS pedidos (id SERIAL PRIMARY KEY, usuario_id INTEGER NOT NULL REFERENCES usuarios(id), producto_id INTEGER NOT NULL REFERENCES productos(id), cantidad INTEGER NOT NULL CHECK (cantidad > 0));
INSERT INTO usuarios(nombre,email) VALUES ('Ana Torres','ana@correo.com'),('Luis Pérez','luis@correo.com'),('Carlos Mendoza','carlos@correo.com') ON CONFLICT(email) DO NOTHING;
INSERT INTO productos(nombre,precio) VALUES ('Laptop',2500.00),('Teclado',120.00),('Mouse',80.00) ON CONFLICT DO NOTHING;
INSERT INTO pedidos(usuario_id,producto_id,cantidad) SELECT 1,1,1 WHERE NOT EXISTS(SELECT 1 FROM pedidos);
