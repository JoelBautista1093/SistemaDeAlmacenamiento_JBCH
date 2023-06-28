-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 28-06-2023 a las 08:50:22
-- Versión del servidor: 10.4.28-MariaDB
-- Versión de PHP: 8.0.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `db_proyecto`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categoria`
--

CREATE TABLE `categoria` (
  `id_cat` int(11) NOT NULL,
  `descripcion` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `categoria`
--

INSERT INTO `categoria` (`id_cat`, `descripcion`) VALUES
(1, 'COMPLEMENTOS DE LIMPIEZA'),
(2, 'DESECHABLES'),
(3, 'ECOLÓGICOS'),
(4, 'HOSTELERÍA'),
(5, 'PAPEL Y CELULOSA'),
(6, 'QUÍMICOS'),
(7, 'ÚTILES DE LIMPIEZA');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

CREATE TABLE `clientes` (
  `id` int(11) NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `apellido` varchar(255) NOT NULL,
  `ci` varchar(255) NOT NULL,
  `correo` varchar(255) DEFAULT NULL,
  `celular` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `clientes`
--

INSERT INTO `clientes` (`id`, `nombre`, `apellido`, `ci`, `correo`, `celular`) VALUES
(1, 'JuanMod', 'Gonzalez', '12345678', 'juangonzalez@example.com', '1234567890'),
(2, 'María', 'López', '87654321', 'marialopez@example.com', '0987654321'),
(4, 'Laura', 'Martínez', '90123456', 'lauramartinez@example.com', '4567890123'),
(6, 'Ana', 'Pérez', '67890123', 'anaperez@example.com', '7654321098'),
(7, 'Luis', 'Gómez', '01234567', 'luisgomez@example.com', '6543210987'),
(8, 'Sofía', 'Torres', '43210987', 'sofiatorres@example.com', '5432109876'),
(9, 'Andrés', 'Vargas', '78901234', 'andresvargas@example.com', '4321098765'),
(10, 'Isabel', 'Sánchez', '21098765', 'isabelsanchez@example.com', '3210987654'),
(11, 'Javier', 'Ramírez', '45678901', 'javierramirez@example.com', '2109876543'),
(12, 'Fernanda', 'Gutiérrez', '09876543', 'fernandagutierrez@example.com', '1098765432'),
(13, 'Diego', 'Navarro', '54321098', 'diegonavarro@example.com', '0987654321'),
(14, 'Carmen', 'Cruz', '89012345', 'carmencruz@example.com', '9876543210'),
(15, 'Roberto', 'Ortega', '32109876', 'robertoortega@example.com', '8765432109'),
(16, 'Paula', 'Silva', '65432109', 'paulasilva@example.com', '7654321098'),
(17, 'Ricardo', 'Rojas', '10987654', 'ricardorojas@example.com', '6543210987'),
(18, 'Gabriela', 'Mendoza', '43210987', 'gabrielamendoza@example.com', '5432109876'),
(19, 'Hugo', 'Sosa', '76543210', 'hugososa@example.com', '4321098765'),
(20, 'Mariana', 'Chávez', '21098765', 'marianachavez@example.com', '3210987654'),
(22, 'Joel', 'Bautista', '10933174', 'joelbautistach@gmail.com', '74000504');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `id` int(11) NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `descripcion` varchar(255) NOT NULL,
  `categoria` int(255) NOT NULL,
  `subCategoria` int(255) NOT NULL,
  `marca` varchar(255) NOT NULL,
  `precio` float NOT NULL,
  `ubicacion` varchar(255) NOT NULL,
  `stock` varchar(255) NOT NULL,
  `cantidad` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`id`, `nombre`, `descripcion`, `categoria`, `subCategoria`, `marca`, `precio`, `ubicacion`, `stock`, `cantidad`) VALUES
(34, 'Aluminio y Film Alimentario 1', 'Descripción del producto de Aluminio y Film Alimentario 1', 1, 1, 'MarcaA', 15.5, 'Pasillo 1', 'disponible', 200),
(35, 'Aluminio y Film Alimentario 2', 'Descripción del producto de Aluminio y Film Alimentario 2', 1, 1, 'MarcaB', 10.25, 'Pasillo 3', 'disponible', 150),
(37, 'Aspiradora Profesional 2', 'Descripción del producto de Aspiradora Profesional 2', 1, 2, 'MarcaD', 320.75, 'Pasillo 2', 'disponible', 80),
(38, 'Bata Desechable 1', 'Descripción del producto de Bata Desechable 1', 2, 3, 'MarcaE', 7.99, 'Pasillo 1', 'disponible', 100),
(39, 'Bata Desechable 2', 'Descripción del producto de Bata Desechable 2', 2, 3, 'MarcaF', 8.99, 'Pasillo 3', 'disponible', 150),
(40, 'Cubrecalzado Desechable 1', 'Descripción del producto de Cubrecalzado Desechable 1', 2, 4, 'MarcaG', 3.5, 'Pasillo 4', 'disponible', 200),
(41, 'Cubrecalzado Desechable 2', 'Descripción del producto de Cubrecalzado Desechable 2', 2, 4, 'MarcaH', 4.25, 'Pasillo 2', 'disponible', 250),
(42, 'Papel y Celulosa 1', 'Descripción del producto de Papel y Celulosa 1', 3, 5, 'MarcaI', 12.75, 'Pasillo 1', 'disponible', 300),
(43, 'Papel y Celulosa 2', 'Descripción del producto de Papel y Celulosa 2', 3, 5, 'MarcaJ', 8.99, 'Pasillo 3', 'disponible', 250),
(44, 'Útiles de Limpieza Ecológicos 1', 'Descripción del producto de Útiles de Limpieza Ecológicos 1', 3, 6, 'MarcaK', 9.5, 'Pasillo 4', 'disponible', 150),
(45, 'Útiles de Limpieza Ecológicos 2', 'Descripción del producto de Útiles de Limpieza Ecológicos 2', 3, 6, 'MarcaL', 11.25, 'Pasillo 2', 'disponible', 200),
(46, 'Amenities y Acogida 1', 'Descripción del producto de Amenities y Acogida 1', 4, 7, 'MarcaM', 5.75, 'Pasillo 1', 'disponible', 100),
(47, 'Amenities y Acogida 2', 'Descripción del producto de Amenities y Acogida 2', 4, 7, 'MarcaN', 6.99, 'Pasillo 3', 'disponible', 80),
(48, 'Desechables de un Solo Uso 1', 'Descripción del producto de Desechables de un Solo Uso 1', 4, 8, 'MarcaO', 4.5, 'Pasillo 4', 'disponible', 150),
(49, 'Desechables de un Solo Uso 2', 'Descripción del producto de Desechables de un Solo Uso 2', 4, 8, 'MarcaP', 5.25, 'Pasillo 2', 'disponible', 200),
(50, 'Papel Higiénico 1', 'Descripción del producto de Papel Higiénico 1', 5, 9, 'MarcaQ', 6.5, 'Pasillo 5', 'disponible', 300),
(51, 'Papel Higiénico 2', 'Descripción del producto de Papel Higiénico 2', 5, 9, 'MarcaR', 7.99, 'Pasillo 2', 'disponible', 250),
(52, 'Servilletas y Manteles 1', 'Descripción del producto de Servilletas y Manteles 1', 5, 10, 'MarcaS', 4.75, 'Pasillo 3', 'disponible', 150),
(53, 'Servilletas y Manteles 2', 'Descripción del producto de Servilletas y Manteles 2', 5, 10, 'MarcaT', 5.25, 'Pasillo 4', 'disponible', 200),
(54, 'Ambientadores 1', 'Descripción del producto de Ambientadores 1', 6, 11, 'MarcaU', 8.25, 'Pasillo 1', 'disponible', 100),
(55, 'Ambientadores 2', 'Descripción del producto de Ambientadores 2', 6, 11, 'MarcaV', 9.5, 'Pasillo 2', 'disponible', 80),
(56, 'Desengrasantes 1', 'Descripción del producto de Desengrasantes 1', 6, 12, 'MarcaW', 7.75, 'Pasillo 3', 'disponible', 150),
(57, 'Desengrasantes 2', 'Descripción del producto de Desengrasantes 2', 6, 12, 'MarcaX', 6.99, 'Pasillo 4', 'disponible', 200),
(58, 'Bayetas y Paños 1', 'Descripción del producto de Bayetas y Paños 1', 7, 13, 'MarcaA', 6.75, 'Pasillo 2', 'disponible', 180),
(59, 'Bayetas y Paños 2', 'Descripción del producto de Bayetas y Paños 2', 7, 13, 'MarcaB', 5.99, 'Pasillo 3', 'disponible', 220),
(60, 'Bolsas de Basura 1', 'Descripción del producto de Bolsas de Basura 1', 7, 14, 'MarcaC', 9.25, 'Pasillo 4', 'disponible', 120),
(62, 'jabon', 'limpieza manos', 7, 21, 'patito', 25, 'pasillo 2', 'disponible', 123);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `subcategoria`
--

CREATE TABLE `subcategoria` (
  `id` int(11) NOT NULL,
  `id_cat` int(11) DEFAULT NULL,
  `descripcion` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `subcategoria`
--

INSERT INTO `subcategoria` (`id`, `id_cat`, `descripcion`) VALUES
(1, 1, 'Aluminio y film alimentario'),
(2, 1, 'Aspiradoras profesionales'),
(3, 1, 'Carros de servicio'),
(4, 1, 'Difusores de aroma automáticos'),
(5, 1, 'Carros de limpieza y cubos'),
(6, 1, 'Dispensadores y dosificadores'),
(7, 1, 'Mangos y recogedores'),
(8, 2, 'Estética'),
(9, 2, 'Batas desechables'),
(10, 2, 'Cubrecalzado desechable'),
(11, 2, 'Mascarillas desechables'),
(12, 2, 'Delantal desechable'),
(13, 2, 'Desechables de un solo uso'),
(14, 2, 'Esponjas jabonosas'),
(15, 2, 'Gorros desechables'),
(16, 2, 'Guantes desechables'),
(17, 3, 'Papel y celulosa'),
(18, 3, 'Útiles de limpieza ecológicos'),
(19, 3, 'Limpiadores eco-friendly con sistema ECO-Z'),
(20, 3, 'Fregasuelos y limpiadores ecológicos'),
(21, 3, 'Productos biológicos de limpieza'),
(22, 3, 'Vajilla desechable ecológica'),
(23, 4, 'Amenities y acogida'),
(24, 4, 'Desechables de un solo uso'),
(25, 4, 'Lotes de productos de limpieza'),
(26, 4, 'Posavasos'),
(27, 4, 'Envases Take Away'),
(28, 4, 'Vajilla desechable ecológica'),
(29, 4, 'Papeleras y contenedores'),
(30, 4, 'Productos de limpieza HA'),
(31, 5, 'Papel higiénico'),
(32, 5, 'Rollos y papel secamanos'),
(33, 5, 'Rollos industriales'),
(34, 5, 'Servilletas y manteles'),
(35, 6, 'Ambientadores'),
(36, 6, 'Desengrasantes'),
(37, 6, 'Desinfectantes'),
(38, 6, 'Fregasuelos'),
(39, 6, 'Higiene y mantenimiento industrial'),
(40, 6, 'Insecticidas'),
(41, 6, 'Industria alimentaria'),
(42, 6, 'Lavado de vehículos'),
(43, 6, 'Lejías'),
(44, 6, 'Productos de limpieza concentrados'),
(45, 6, 'Productos para máquinas fregadoras'),
(46, 7, 'Bayetas y paños'),
(47, 7, 'Bolsas de basura'),
(48, 7, 'Discos de limpieza'),
(49, 7, 'Estropajos'),
(50, 7, 'Piedra de limpieza'),
(51, 7, 'Plumeros');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `apellido` varchar(255) NOT NULL,
  `ci` varchar(255) NOT NULL,
  `correo` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `celular` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id`, `nombre`, `apellido`, `ci`, `correo`, `password`, `celular`) VALUES
(1, 'Juan', 'González', '12345678', 'juangonzalez@example.com', 'e38ad214943daad1d64c102faec29de4afe9da3d', '1234567890'),
(2, 'Maria', 'Camacho', '87654321', 'marialopez@example.com', '2aa60a8ff7fcd473d321e0146afd9e26df395147', '0987654321'),
(4, 'Laura', 'Martínez', '90123456', 'lauramartinez@example.com', 'a1d7584daaca4738d499ad7082886b01117275d8', '4567890123'),
(6, 'Joel', 'Bautista', '10933174', 'joelbautistach@gmail.com', 'a66c4d927cac87ff34b73ca8be47acc34f8c8a88', '74000504');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ventas`
--

CREATE TABLE `ventas` (
  `id_venta` int(11) NOT NULL,
  `id_cliente` int(11) NOT NULL,
  `id_producto` int(11) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `fecha` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `ventas`
--

INSERT INTO `ventas` (`id_venta`, `id_cliente`, `id_producto`, `cantidad`, `fecha`) VALUES
(1, 1, 43, 25, '2023-06-01'),
(3, 3, 38, 10, '2023-06-03'),
(4, 4, 53, 75, '2023-06-04'),
(5, 5, 41, 30, '2023-06-05'),
(6, 6, 58, 90, '2023-06-06'),
(7, 7, 51, 40, '2023-06-07'),
(8, 8, 35, 15, '2023-06-08'),
(9, 9, 45, 70, '2023-06-09'),
(10, 10, 61, 20, '2023-06-10'),
(11, 11, 40, 65, '2023-06-11'),
(12, 12, 56, 45, '2023-06-12'),
(13, 13, 37, 5, '2023-06-13'),
(14, 14, 47, 80, '2023-06-14'),
(15, 15, 63, 35, '2023-06-15'),
(16, 16, 42, 60, '2023-06-16'),
(17, 17, 59, 10, '2023-06-17'),
(18, 18, 50, 55, '2023-06-18'),
(19, 19, 36, 25, '2023-06-19'),
(20, 20, 44, 95, '2023-06-20'),
(21, 1, 39, 70, '2023-06-21'),
(22, 2, 54, 15, '2023-06-22'),
(23, 3, 34, 50, '2023-06-23'),
(24, 4, 46, 30, '2023-06-24'),
(25, 5, 62, 80, '2023-06-25'),
(26, 6, 49, 20, '2023-06-26'),
(27, 7, 57, 45, '2023-06-27'),
(28, 8, 38, 10, '2023-06-28'),
(29, 9, 52, 75, '2023-06-29'),
(30, 10, 43, 25, '2023-06-30'),
(31, 11, 48, 60, '2023-07-01'),
(32, 12, 35, 35, '2023-07-02'),
(33, 13, 51, 5, '2023-07-03'),
(34, 14, 40, 90, '2023-07-04'),
(35, 15, 56, 40, '2023-07-05'),
(36, 16, 37, 15, '2023-07-06'),
(37, 17, 47, 70, '2023-07-07'),
(38, 18, 63, 20, '2023-07-08'),
(39, 19, 42, 65, '2023-07-09');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `categoria`
--
ALTER TABLE `categoria`
  ADD PRIMARY KEY (`id_cat`);

--
-- Indices de la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `subcategoria`
--
ALTER TABLE `subcategoria`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_cat` (`id_cat`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `ventas`
--
ALTER TABLE `ventas`
  ADD PRIMARY KEY (`id_venta`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `clientes`
--
ALTER TABLE `clientes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=63;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `ventas`
--
ALTER TABLE `ventas`
  MODIFY `id_venta` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `subcategoria`
--
ALTER TABLE `subcategoria`
  ADD CONSTRAINT `subcategoria_ibfk_1` FOREIGN KEY (`id_cat`) REFERENCES `categoria` (`id_cat`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
