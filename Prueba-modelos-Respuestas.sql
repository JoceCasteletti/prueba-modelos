

----Jocelyn Casteletti----



--------Parte 2--------



CREATE DATABASE prueba_modelos;
USE prueba_modelos;

----Creando tablas : Cliente, Categoria, Factura, Producto y Factura_detalle.
CREATE TABLE cliente(
  id INT PRIMARY KEY, 
  rut INT NOT NULL,
  dv VARCHAR(1) NOT NULL,
  nombre VARCHAR(100) NOT NULL,
  direccion VARCHAR(100) NOT NULL
);


CREATE TABLE categoria(
  id INT PRIMARY KEY,
  nombre VARCHAR(45) NOT NULL,
  descripcion VARCHAR(100) NOT NULL
);


CREATE TABLE factura(
  id INT PRIMARY KEY, 
  fecha DATE NOT NULL,
  subtotal DOUBLE NOT NULL DEFAULT 0,
  iva DOUBLE NOT NULL DEFAULT 0,
  total DOUBLE NOT NULL DEFAULT 0,
  id_cliente INT,
  FOREIGN KEY (id_cliente) REFERENCES cliente(id)
);


CREATE TABLE producto(
  id INT PRIMARY KEY,
  nombre VARCHAR(45) NOT NULL,
  descripcion VARCHAR(100) NOT NULL,
  valor_unitario DOUBLE NOT NULL,
  id_categoria INT,
  FOREIGN KEY (id_categoria) REFERENCES categoria(id)
);


CREATE TABLE factura_detalle(
  id INT PRIMARY KEY,
  precio_unitario DOUBLE NOT NULL,
  cantidad INT NOT NULL,
  valor_total DOUBLE NOT NULL,
  id_producto INT,
  id_factura INT,
  FOREIGN KEY (id_producto) REFERENCES producto(id),
  FOREIGN KEY (id_factura) REFERENCES factura(id)
);




----Insertando campos en tabla : Cliente, Categoria, Producto, Factura y Factura_detalle.
INSERT INTO cliente (id, rut, dv, nombre, direccion) 
VALUES (1, 14562378, "2", "Gabriel Perez", "Los prusianos 1345");
INSERT INTO cliente (id, rut, dv, nombre, direccion) 
VALUES (2, 18654982, "1", "Andrea Sandova", "Olimpo 2319");
INSERT INTO cliente (id, rut, dv, nombre, direccion) 
VALUES (3, 17987125, "7", "Julio Verne", "Sur 373");
INSERT INTO cliente (id, rut, dv, nombre, direccion) 
VALUES (4, 11388626, "5", "Camilo Ovando", "Ohiggins 1028");
INSERT INTO cliente (id, rut, dv, nombre, direccion) 
VALUES (5, 9060657, "8", "Emilio Reyes", "Pajaritos 1472");



INSERT INTO categoria (id, nombre, descripcion) 
VALUES (1, "Televisores", "Telvisores 4k Smart TV, LED y LCD.");
INSERT INTO categoria (id, nombre, descripcion) 
VALUES (2, "Accesorios Pc", "Monitores, pantallas, teclados, procesadores.");
INSERT INTO categoria (id, nombre, descripcion) 
VALUES (3, "Audio y Video", "Parlantes, audifonos, camaras fotograficas.");


INSERT INTO producto (id, nombre, descripcion, valor_unitario, id_categoria) 
VALUES (1, "Televisor LED 32 pulgadas", "Televisor 4k 32 pulgadas, LG.", 259990, 1);
INSERT INTO producto (id, nombre, descripcion, valor_unitario, id_categoria) 
VALUES (2, "Parlante sony", "Parlante sony resistente al agua.", 45990, 3);
INSERT INTO producto (id, nombre, descripcion, valor_unitario, id_categoria) 
VALUES (3, "Teclado inalambrico", "Teclado gamer con luces.", 27890, 2);
INSERT INTO producto (id, nombre, descripcion, valor_unitario, id_categoria) 
VALUES (4, "Mousepad", "Mousepad de 90 cm x 40cm.", 12470, 2);
INSERT INTO producto (id, nombre, descripcion, valor_unitario, id_categoria) 
VALUES (5, "Audifonos", "Audifonos sony Bluetooth y cargador.", 56990, 3);
INSERT INTO producto (id, nombre, descripcion, valor_unitario, id_categoria) 
VALUES (6, "Apple Tv", "Apple tv 4k con control remoto.", 234990, 3);
INSERT INTO producto (id, nombre, descripcion, valor_unitario, id_categoria) 
VALUES (7, "Soundbar sony", "Soundbar Sony NFC y Bluetooth.", 89990, 3);
INSERT INTO producto (id, nombre, descripcion, valor_unitario, id_categoria) 
VALUES (8, "LED 49 pulgadas", "LED 49 pulgadas FULL HD.", 189990, 1);



INSERT INTO factura (id, fecha, id_cliente) 
VALUES (1, '2020-05-06', 1);
INSERT INTO factura (id, fecha, id_cliente) 
VALUES (2, '2020-03-08', 1);
INSERT INTO factura (id, fecha, id_cliente) 
VALUES (3, '2019-12-12', 2);
INSERT INTO factura (id, fecha, id_cliente) 
VALUES (4, '2020-01-04', 2);
INSERT INTO factura (id, fecha, id_cliente) 
VALUES (5, '2019-12-11', 2);
INSERT INTO factura (id, fecha, id_cliente) 
VALUES (6, '2020-06-09', 3);
INSERT INTO factura (id, fecha, id_cliente) 
VALUES (7, '2019-10-03', 4);
INSERT INTO factura (id, fecha, id_cliente) 
VALUES (8, '2020-03-08', 4);
INSERT INTO factura (id, fecha, id_cliente) 
VALUES (9, '2019-12-03', 4);
INSERT INTO factura (id, fecha, id_cliente) 
VALUES (10, '2020-01-06', 4);


INSERT INTO factura_detalle (id, id_factura, id_producto, precio_unitario, cantidad, valor_total) 
VALUES (1, 1, 1, 259990, 1, 259990);
INSERT INTO factura_detalle (id, id_factura, id_producto, precio_unitario, cantidad, valor_total) 
VALUES (2, 1, 2, 45990, 1, 45990);
INSERT INTO factura_detalle (id, id_factura, id_producto, precio_unitario, cantidad, valor_total) 
VALUES (3, 2, 6, 234990, 1, 234990);
INSERT INTO factura_detalle (id, id_factura, id_producto, precio_unitario, cantidad, valor_total) 
VALUES (4, 2, 7, 89990, 1, 89990);
INSERT INTO factura_detalle (id, id_factura, id_producto, precio_unitario, cantidad, valor_total) 
VALUES (5, 2, 4, 12470, 1, 12470);
INSERT INTO factura_detalle (id, id_factura, id_producto, precio_unitario, cantidad, valor_total) 
VALUES (6, 3, 5, 56990, 1, 56990);
INSERT INTO factura_detalle (id, id_factura, id_producto, precio_unitario, cantidad, valor_total) 
VALUES (7, 3, 8, 189990, 1, 189990);
INSERT INTO factura_detalle (id, id_factura, id_producto, precio_unitario, cantidad, valor_total) 
VALUES (8, 3, 2, 45990, 1, 45990);
INSERT INTO factura_detalle (id, id_factura, id_producto, precio_unitario, cantidad, valor_total) 
VALUES (9, 4, 7, 89990, 1, 89990);
INSERT INTO factura_detalle (id, id_factura, id_producto, precio_unitario, cantidad, valor_total) 
VALUES (10, 4, 4, 12470, 1, 12470);
INSERT INTO factura_detalle (id, id_factura, id_producto, precio_unitario, cantidad, valor_total) 
VALUES (11, 5, 8, 189990, 1, 189990);
INSERT INTO factura_detalle (id, id_factura, id_producto, precio_unitario, cantidad, valor_total) 
VALUES (12, 5, 5, 56990, 1, 56990);
INSERT INTO factura_detalle (id, id_factura, id_producto, precio_unitario, cantidad, valor_total) 
VALUES (13, 5, 6, 234990, 1, 234990);
INSERT INTO factura_detalle (id, id_factura, id_producto, precio_unitario, cantidad, valor_total) 
VALUES (14, 6, 1, 259990, 1, 259990);
INSERT INTO factura_detalle (id, id_factura, id_producto, precio_unitario, cantidad, valor_total) 
VALUES (15, 7, 4, 12470, 1, 12470);
INSERT INTO factura_detalle (id, id_factura, id_producto, precio_unitario, cantidad, valor_total) 
VALUES (16, 7, 2, 45990, 1, 45990);
INSERT INTO factura_detalle (id, id_factura, id_producto, precio_unitario, cantidad, valor_total) 
VALUES (17, 8, 2, 45990, 1, 45990);
INSERT INTO factura_detalle (id, id_factura, id_producto, precio_unitario, cantidad, valor_total) 
VALUES (18, 8, 3, 89990, 1, 89990);
INSERT INTO factura_detalle (id, id_factura, id_producto, precio_unitario, cantidad, valor_total) 
VALUES (19, 8, 7, 56990, 1, 56990);
INSERT INTO factura_detalle (id, id_factura, id_producto, precio_unitario, cantidad, valor_total) 
VALUES (20, 9, 1, 259990, 1, 259990);
INSERT INTO factura_detalle (id, id_factura, id_producto, precio_unitario, cantidad, valor_total) 
VALUES (21, 9, 5, 56990, 1, 56990);
INSERT INTO factura_detalle (id, id_factura, id_producto, precio_unitario, cantidad, valor_total) 
VALUES (22, 9, 6, 234990, 1, 234990);
INSERT INTO factura_detalle (id, id_factura, id_producto, precio_unitario, cantidad, valor_total) 
VALUES (23, 9, 7, 89990, 1, 89990);
INSERT INTO factura_detalle (id, id_factura, id_producto, precio_unitario, cantidad, valor_total) 
VALUES (24, 10, 3, 27890, 1, 27890);



----Agregar calculo de montos de productos en tabla Factura : ----
----Subtotal , IVA y Total.----

SELECT d.id_factura AS id_factura, SUM(d.precio_unitario * d.cantidad) 
AS subtotal, SUM(d.precio_unitario * d.cantidad * 0.19) 
AS iva, SUM(d.precio_unitario * d.cantidad * 0.19) + 
SUM(d.precio_unitario * d.cantidad) AS precio_total 
FROM factura_detalle AS d GROUP BY d.id_factura

UPDATE factura
SET 
	subtotal = (SELECT SUM(d.precio_unitario * d.cantidad) FROM factura_detalle AS d WHERE d.id_factura = 1 GROUP BY d.id_factura),
    iva = (SELECT SUM(d.precio_unitario * d.cantidad * 0.19) FROM factura_detalle AS d WHERE d.id_factura = 1 GROUP BY d.id_factura),
    total = (SELECT SUM(d.precio_unitario * d.cantidad * 0.19) + SUM(d.precio_unitario * d.cantidad) FROM factura_detalle AS d WHERE d.id_factura = 1 GROUP BY d.id_factura)
WHERE id = 1



--------Parte 3--------


----¿Que cliente realizó la compra más cara?----

---Forma 1---
SELECT * FROM factura AS f ORDER BY f.total DESC LIMIT 1

---Forma 2---

SELECT f.id AS ID_FACTURA, c.id AS ID_CLIENTE, c.nombre AS NOMBRE_CLIENTE, f.total AS TOTAL FROM factura AS f INNER JOIN cliente AS c ON f.id_cliente = c.id ORDER BY f.total DESC LIMIT 1



----¿Que cliente pagó sobre 100 de monto?----

SELECT f.id, f.total, id_cliente FROM `factura` AS f WHERE total > 100000;
--Hice los calculos con 100000 porque puse montos reales de los productos.--


----¿Cuantos clientes han comprado el producto 6?----

SELECT COUNT(*) AS CANTIDAD FROM factura AS f LEFT JOIN factura_detalle AS d ON f.id = d.id_factura WHERE d.id_producto = 6





