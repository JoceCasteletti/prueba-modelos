-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost
-- Tiempo de generación: 14-06-2020 a las 10:02:38
-- Versión del servidor: 8.0.17
-- Versión de PHP: 7.3.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `prueba_modelos`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categoria`
--

CREATE TABLE `categoria` (
  `id` int(11) NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `descripcion` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `categoria`
--

INSERT INTO `categoria` (`id`, `nombre`, `descripcion`) VALUES
(1, 'Televisores', 'Telvisores 4k Smart TV, LED y LCD.'),
(2, 'Accesorios Pc', 'Monitores, pantallas, teclados, procesadores.'),
(3, 'Audio y Video', 'Parlantes, audifonos, camaras fotograficas.');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente`
--

CREATE TABLE `cliente` (
  `id` int(11) NOT NULL,
  `rut` int(11) NOT NULL,
  `dv` varchar(1) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `direccion` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `cliente`
--

INSERT INTO `cliente` (`id`, `rut`, `dv`, `nombre`, `direccion`) VALUES
(1, 14562378, '2', 'Gabriel Perez', 'Los prusianos 1345'),
(2, 18654982, '1', 'Andrea Sandova', 'Olimpo 2319'),
(3, 17987125, '7', 'Julio Verne', 'Sur 373'),
(4, 11388626, '5', 'Camilo Ovando', 'Ohiggins 1028'),
(5, 9060657, '8', 'Emilio Reyes', 'Pajaritos 1472');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `factura`
--

CREATE TABLE `factura` (
  `id` int(11) NOT NULL,
  `fecha` date NOT NULL,
  `subtotal` double NOT NULL DEFAULT '0',
  `iva` double NOT NULL DEFAULT '0',
  `total` double NOT NULL DEFAULT '0',
  `id_cliente` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `factura`
--

INSERT INTO `factura` (`id`, `fecha`, `subtotal`, `iva`, `total`, `id_cliente`) VALUES
(1, '2020-05-06', 305980, 58136.2, 364116.2, 1),
(2, '2020-03-08', 337450, 64115.5, 401565.5, 1),
(3, '2019-12-12', 292970, 55664.299999999996, 348634.3, 2),
(4, '2020-01-04', 102460, 19467.399999999998, 121927.4, 2),
(5, '2019-12-11', 481970, 91574.29999999999, 573544.3, 2),
(6, '2020-06-09', 259990, 49398.1, 309388.1, 3),
(7, '2019-10-03', 58460, 11107.400000000001, 69567.4, 4),
(8, '2020-03-08', 192970, 36664.299999999996, 229634.3, 4),
(9, '2019-12-03', 641960, 121972.4, 763932.4, 4),
(10, '2020-01-06', 27890, 5299.1, 33189.1, 4);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `factura_detalle`
--

CREATE TABLE `factura_detalle` (
  `id` int(11) NOT NULL,
  `precio_unitario` double NOT NULL,
  `cantidad` int(11) NOT NULL,
  `valor_total` double NOT NULL,
  `id_producto` int(11) DEFAULT NULL,
  `id_factura` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `factura_detalle`
--

INSERT INTO `factura_detalle` (`id`, `precio_unitario`, `cantidad`, `valor_total`, `id_producto`, `id_factura`) VALUES
(1, 259990, 1, 259990, 1, 1),
(2, 45990, 1, 45990, 2, 1),
(3, 234990, 1, 234990, 6, 2),
(4, 89990, 1, 89990, 7, 2),
(5, 12470, 1, 12470, 4, 2),
(6, 56990, 1, 56990, 5, 3),
(7, 189990, 1, 189990, 8, 3),
(8, 45990, 1, 45990, 2, 3),
(9, 89990, 1, 89990, 7, 4),
(10, 12470, 1, 12470, 4, 4),
(11, 189990, 1, 189990, 8, 5),
(12, 56990, 1, 56990, 5, 5),
(13, 234990, 1, 234990, 6, 5),
(14, 259990, 1, 259990, 1, 6),
(15, 12470, 1, 12470, 4, 7),
(16, 45990, 1, 45990, 2, 7),
(17, 45990, 1, 45990, 2, 8),
(18, 89990, 1, 89990, 3, 8),
(19, 56990, 1, 56990, 7, 8),
(20, 259990, 1, 259990, 1, 9),
(21, 56990, 1, 56990, 5, 9),
(22, 234990, 1, 234990, 6, 9),
(23, 89990, 1, 89990, 7, 9),
(24, 27890, 1, 27890, 3, 10);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto`
--

CREATE TABLE `producto` (
  `id` int(11) NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `descripcion` varchar(100) NOT NULL,
  `valor_unitario` double NOT NULL,
  `id_categoria` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `producto`
--

INSERT INTO `producto` (`id`, `nombre`, `descripcion`, `valor_unitario`, `id_categoria`) VALUES
(1, 'Televisor LED 32 pulgadas', 'Televisor 4k 32 pulgadas, LG.', 259990, 1),
(2, 'Parlante sony', 'Parlante sony resistente al agua.', 45990, 3),
(3, 'Teclado inalambrico', 'Teclado gamer con luces.', 27890, 2),
(4, 'Mousepad', 'Mousepad de 90 cm x 40cm.', 12470, 2),
(5, 'Audifonos', 'Audifonos sony Bluetooth y cargador.', 56990, 3),
(6, 'Apple Tv', 'Apple tv 4k con control remoto.', 234990, 3),
(7, 'Soundbar sony', 'Soundbar Sony NFC y Bluetooth.', 89990, 3),
(8, 'LED 49 pulgadas', 'LED 49 pulgadas FULL HD.', 189990, 1);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `categoria`
--
ALTER TABLE `categoria`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `factura`
--
ALTER TABLE `factura`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_cliente` (`id_cliente`);

--
-- Indices de la tabla `factura_detalle`
--
ALTER TABLE `factura_detalle`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_producto` (`id_producto`),
  ADD KEY `id_factura` (`id_factura`);

--
-- Indices de la tabla `producto`
--
ALTER TABLE `producto`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_categoria` (`id_categoria`);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `factura`
--
ALTER TABLE `factura`
  ADD CONSTRAINT `factura_ibfk_1` FOREIGN KEY (`id_cliente`) REFERENCES `cliente` (`id`);

--
-- Filtros para la tabla `factura_detalle`
--
ALTER TABLE `factura_detalle`
  ADD CONSTRAINT `factura_detalle_ibfk_1` FOREIGN KEY (`id_producto`) REFERENCES `producto` (`id`),
  ADD CONSTRAINT `factura_detalle_ibfk_2` FOREIGN KEY (`id_factura`) REFERENCES `factura` (`id`);

--
-- Filtros para la tabla `producto`
--
ALTER TABLE `producto`
  ADD CONSTRAINT `producto_ibfk_1` FOREIGN KEY (`id_categoria`) REFERENCES `categoria` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
