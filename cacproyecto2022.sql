-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:3306
-- Tiempo de generación: 17-07-2022 a las 22:20:35
-- Versión del servidor: 5.7.36
-- Versión de PHP: 7.4.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `cacproyecto2022`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `localidades`
--

DROP TABLE IF EXISTS `localidades`;
CREATE TABLE IF NOT EXISTS `localidades` (
  `idlocalidad` int(11) NOT NULL AUTO_INCREMENT,
  `nombrelocalidad` varchar(40) COLLATE utf8mb4_spanish_ci NOT NULL,
  `provincialocalidad` int(11) NOT NULL,
  PRIMARY KEY (`idlocalidad`),
  UNIQUE KEY `LocProvincia` (`provincialocalidad`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

--
-- Volcado de datos para la tabla `localidades`
--

INSERT INTO `localidades` (`idlocalidad`, `nombrelocalidad`, `provincialocalidad`) VALUES
(1, 'Moreno', 3),
(2, 'Guaymallen', 4),
(5, 'Cafayate', 2),
(6, 'Cruz Alta', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedidos`
--

DROP TABLE IF EXISTS `pedidos`;
CREATE TABLE IF NOT EXISTS `pedidos` (
  `idpedido` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(40) COLLATE utf8mb4_spanish_ci NOT NULL,
  `apellido` varchar(40) COLLATE utf8mb4_spanish_ci NOT NULL,
  `usuario` varchar(20) COLLATE utf8mb4_spanish_ci NOT NULL,
  `mail` varchar(30) COLLATE utf8mb4_spanish_ci NOT NULL,
  `lugarentrega` varchar(80) COLLATE utf8mb4_spanish_ci NOT NULL,
  `localidad` int(11) NOT NULL,
  `provincia` int(11) NOT NULL,
  `codigopostal` varchar(9) COLLATE utf8mb4_spanish_ci NOT NULL,
  `formadepago` varchar(1) COLLATE utf8mb4_spanish_ci NOT NULL,
  `tarjtitular` varchar(40) COLLATE utf8mb4_spanish_ci NOT NULL,
  `tarjnumero` varchar(16) COLLATE utf8mb4_spanish_ci NOT NULL,
  `tarjvto` varchar(10) COLLATE utf8mb4_spanish_ci NOT NULL,
  `tarjclave` int(4) NOT NULL,
  PRIMARY KEY (`idpedido`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `provincias`
--

DROP TABLE IF EXISTS `provincias`;
CREATE TABLE IF NOT EXISTS `provincias` (
  `idprovincia` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(40) COLLATE utf8mb4_spanish_ci NOT NULL,
  PRIMARY KEY (`idprovincia`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

--
-- Volcado de datos para la tabla `provincias`
--

INSERT INTO `provincias` (`idprovincia`, `nombre`) VALUES
(1, 'Tucuman'),
(2, 'Salta'),
(3, 'Buenos Aires'),
(4, 'Mendoza');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
CREATE TABLE IF NOT EXISTS `usuarios` (
  `idusuario` int(11) NOT NULL AUTO_INCREMENT,
  `usuario` varchar(20) COLLATE utf8mb4_spanish_ci NOT NULL,
  `clave` varchar(20) COLLATE utf8mb4_spanish_ci NOT NULL,
  `nombreyapellido` varchar(40) COLLATE utf8mb4_spanish_ci NOT NULL,
  PRIMARY KEY (`idusuario`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`idusuario`, `usuario`, `clave`, `nombreyapellido`) VALUES
(1, 'prueba@gmail.com', '909090', 'silvinavilleres'),
(2, 'mail@gmail.com', 'miclave', 'Juana Perez');

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `localidades`
--
ALTER TABLE `localidades`
  ADD CONSTRAINT `localidadprovincia` FOREIGN KEY (`provincialocalidad`) REFERENCES `provincias` (`idprovincia`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
