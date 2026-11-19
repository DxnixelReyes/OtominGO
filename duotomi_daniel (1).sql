-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 29-10-2026 a las 20:14:46
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `duotomi_daniel`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `curso`
--

CREATE TABLE `curso` (
  `id_curso` int(5) NOT NULL,
  `idioma` char(6) NOT NULL,
  `descripcion` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `curso`
--

INSERT INTO `curso` (`id_curso`, `idioma`, `descripcion`) VALUES
(100, 'otomí', 'curso básico de otomí en valle del Estado de Méxic');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ejercicio`
--

CREATE TABLE `ejercicio` (
  `id_ejercicio` int(5) NOT NULL,
  `tipo` varchar(20) NOT NULL,
  `pregunta` varchar(30) NOT NULL,
  `respuesta_correcta` varchar(25) NOT NULL,
  `id_unidad` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `ejercicio`
--

INSERT INTO `ejercicio` (`id_ejercicio`, `tipo`, `pregunta`, `respuesta_correcta`, `id_unidad`) VALUES
(1, 'opción múltiple', '¿Cuál de estos es el gato?', 'Mixtu', 1),
(2, 'opción múltiple', '¿Cuál de estos es el pato?', 'Badu', 1),
(3, 'opción múltiple', '¿Cuál de estos es el burro?', 'Juiji', 1),
(4, 'completa la frase', '¿El toma leche?', 'Mixtu', 1),
(5, 'Completa la frase', '¿El pone huevos?', 'Badu', 1),
(6, 'opción múltiple', 'Selecciona buenos días en otom', 'Jaxia', 2),
(7, 'opción múltiple', 'Cual es mamá en otomí', 'M\'e', 2),
(8, 'opción múltiple', 'Selecciona  T\'a días en españo', 'Papá', 2),
(9, 'Completa la frase', 'completa la frase buenos días,', 'Jaxia T\'a', 2),
(10, 'Completa la frase', 'completa la frase buenos días,', 'Jaxia M\'e', 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `progreso`
--

CREATE TABLE `progreso` (
  `id_progreso` int(5) NOT NULL,
  `porcentaje` decimal(10,0) NOT NULL,
  `experiencia` int(5) NOT NULL,
  `racha` int(2) NOT NULL,
  `fecha_resgistro` date NOT NULL,
  `id_ususario` int(5) NOT NULL,
  `id_curso` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `progreso`
--

INSERT INTO `progreso` (`id_progreso`, `porcentaje`, `experiencia`, `racha`, `fecha_resgistro`, `id_ususario`, `id_curso`) VALUES
(1, 0, 100, 1, '2026-10-19', 1, 100);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `respuesta_usuario`
--

CREATE TABLE `respuesta_usuario` (
  `id_respuesta` int(5) NOT NULL,
  `respuestadelusuario` varchar(25) NOT NULL,
  `respuesta_correcta` varchar(25) NOT NULL,
  `feha_respuesta` date NOT NULL,
  `id_usuario` int(5) NOT NULL,
  `id_leccion` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `unidad`
--

CREATE TABLE `unidad` (
  `id_unidad` int(5) NOT NULL,
  `titulo` varchar(20) NOT NULL,
  `descripcion` varchar(30) NOT NULL,
  `id_curso` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `unidad`
--

INSERT INTO `unidad` (`id_unidad`, `titulo`, `descripcion`, `id_curso`) VALUES
(1, 'Animales', 'Conoce animales en otomí', 100),
(2, 'Saludos', 'saludos en otomí', 100);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `id_usuario` int(5) NOT NULL,
  `nombre` varchar(30) NOT NULL,
  `email` varchar(30) NOT NULL,
  `contraseña` varchar(8) NOT NULL,
  `fecha_registro` date NOT NULL,
  `fecha_nac` date NOT NULL,
  `pais` varchar(20) NOT NULL,
  `nivel` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`id_usuario`, `nombre`, `email`, `contraseña`, `fecha_registro`, `fecha_nac`, `pais`, `nivel`) VALUES
(1, 'Daniel Reyes', 'reyesdaniel@gmail.com', '123456', '2026-10-19', '2007-07-07', 'México', 1);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `curso`
--
ALTER TABLE `curso`
  ADD PRIMARY KEY (`id_curso`);

--
-- Indices de la tabla `ejercicio`
--
ALTER TABLE `ejercicio`
  ADD KEY `id_unidad` (`id_unidad`);

--
-- Indices de la tabla `progreso`
--
ALTER TABLE `progreso`
  ADD PRIMARY KEY (`id_progreso`),
  ADD KEY `id_curso` (`id_curso`),
  ADD KEY `id_ususario` (`id_ususario`);

--
-- Indices de la tabla `unidad`
--
ALTER TABLE `unidad`
  ADD PRIMARY KEY (`id_unidad`),
  ADD KEY `id_curso` (`id_curso`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`id_usuario`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
