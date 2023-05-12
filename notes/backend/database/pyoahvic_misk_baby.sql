-- phpMyAdmin SQL Dump
-- version 4.9.5
-- https://www.phpmyadmin.net/
--
-- Servidor: 10.0.10.28:3306
-- Tiempo de generación: 05-06-2021 a las 16:37:42
-- Versión del servidor: 10.3.28-MariaDB
-- Versión de PHP: 7.3.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `pyoahvic_misk_baby`
--
CREATE DATABASE IF NOT EXISTS `pyoahvic_misk_baby` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `pyoahvic_misk_baby`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `brands`
--

DROP TABLE IF EXISTS `brands`;
CREATE TABLE `brands` (
  `id` tinyint(3) UNSIGNED NOT NULL,
  `name` varchar(30) COLLATE utf8mb4_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

--
-- Volcado de datos para la tabla `brands`
--

INSERT INTO `brands` (`id`, `name`) VALUES
(1, 'Chicco'),
(2, 'Philips Avent'),
(3, 'Nuk'),
(4, 'Graco'),
(5, 'Kidy'),
(6, 'Bebesit');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categorys`
--

DROP TABLE IF EXISTS `categorys`;
CREATE TABLE `categorys` (
  `id` tinyint(3) UNSIGNED NOT NULL,
  `name` varchar(20) COLLATE utf8mb4_spanish_ci NOT NULL,
  `description` text COLLATE utf8mb4_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

--
-- Volcado de datos para la tabla `categorys`
--

INSERT INTO `categorys` (`id`, `name`, `description`) VALUES
(1, 'Maternidad', 'Artículos de Maternidad'),
(2, 'Lactancia', 'Artículos de Lactancia'),
(3, 'Alimentación', 'Artículos de Alimentación'),
(4, 'Juegos y Juguetes', 'Artículos de Juegos y Juguetes'),
(5, 'Higiene y Cuidado', 'Artículos de Higiene y Cuidado'),
(6, 'Paseo', 'Artículos de Paseo'),
(7, 'Seguridad', 'Artículos de Seguridad'),
(8, 'Cuarto', 'Artículos para el cuarto del bebé');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `products`
--

DROP TABLE IF EXISTS `products`;
CREATE TABLE `products` (
  `id` bigint(13) UNSIGNED ZEROFILL NOT NULL COMMENT 'Número de Artículo Internacional (originalmente European Article Number)',
  `brand_id` tinyint(3) UNSIGNED NOT NULL,
  `subcategory_id` tinyint(3) UNSIGNED NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_spanish_ci NOT NULL,
  `description` text COLLATE utf8mb4_spanish_ci NOT NULL,
  `tags` varchar(30) COLLATE utf8mb4_spanish_ci NOT NULL,
  `pruchase_price` decimal(6,2) UNSIGNED NOT NULL,
  `sale_price` decimal(6,2) UNSIGNED NOT NULL,
  `state` set('available','not available','offer','last units','coming soon','limited edition','offer 10%','offer 15%','offer 20%','offer 30%','featured') COLLATE utf8mb4_spanish_ci NOT NULL DEFAULT 'available'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

--
-- Volcado de datos para la tabla `products`
--

INSERT INTO `products` (`id`, `brand_id`, `subcategory_id`, `name`, `description`, `tags`, `pruchase_price`, `sale_price`, `state`) VALUES
(0012014030011, 1, 16, 'Silla de comer Polly Magic - Arnés gris', 'Silla de comer Polly Magic - Arnés gris', 'repuesto silla comer', 321.00, 450.00, 'available'),
(0012014036552, 1, 16, 'Silla de comer Polly Magic - Tapizado Wasabi', 'Silla de comer Polly Magic - Tapizado Wasabi', 'repuesto silla comer', 928.00, 1300.00, 'available'),
(0012014036609, 1, 16, 'Silla de comer Polly Magic - Tapizado Blue', 'Silla de comer Polly Magic - Tapizado Blue', 'repuesto silla comer', 928.00, 1300.00, 'available'),
(0012790650005, 1, 16, 'Silla de comer Polly 2en1 - Arnés gris', 'Silla de comer Polly 2en1 - Arnés gris', 'repuesto silla comer', 321.00, 450.00, 'available'),
(0012793020370, 1, 33, 'Liteway - Capota color Red', 'Liteway - Capota color Red', 'repuesto cochecito', 500.00, 700.00, 'available'),
(0012793020399, 1, 33, 'Liteway - Capota color Anthracite', 'Liteway - Capota color Anthracite', 'repuesto cochecito', 500.00, 700.00, 'available'),
(0012793020470, 1, 33, 'Liteway - Tapizado color Red', 'Liteway - Tapizado color Red', 'repuesto cochecito', 642.00, 900.00, 'last units'),
(0012793020499, 1, 33, 'Liteway - Tapizado color Anthracite', 'Liteway - Tapizado color Anthracite', 'repuesto cochecito', 642.00, 900.00, 'last units'),
(0012793030419, 1, 33, 'Liteway Plus - Tapizado color Fire', 'Liteway Plus - Tapizado color Fire', 'repuesto cochecito', 642.00, 900.00, 'last units'),
(0012793030420, 1, 33, 'Liteway Plus - Tapizado color Night', 'Liteway Plus - Tapizado color Night', 'repuesto cochecito', 642.00, 900.00, 'last units'),
(0012794810395, 1, 33, 'Simplicity - Arnés de cintura', 'Simplicity - Arnés de cintura', 'repuesto cochecito', 321.00, 450.00, 'available'),
(0028075200000, 1, 33, 'Liteway - Rueda trasera + freno color Silver', 'Liteway - Rueda trasera + freno color Silver', 'repuesto cochecito', 535.00, 750.00, 'available'),
(0028075200095, 1, 33, 'Liteway - Rueda trasera + freno color Black', 'Liteway - Rueda trasera + freno color Black', 'repuesto cochecito', 535.00, 750.00, 'available'),
(0028075205000, 1, 33, 'Liteway - Kit ruedas delanteras color Silver', 'Liteway - Kit ruedas delanteras color Silver', 'repuesto cochecito', 1071.00, 1500.00, 'available'),
(0028075212095, 1, 33, 'Liteway - Kit ruedas delanteras color Black', 'Liteway - Kit ruedas delanteras color Black', 'repuesto cochecito', 1071.00, 1500.00, 'available'),
(0028790650014, 1, 16, 'Silla de comer Polly 2en1 - Bandeja completa', 'Silla de comer Polly 2en1 - Bandeja completa', 'repuesto silla comer', 1071.00, 1500.00, 'available'),
(0028790650100, 1, 16, 'Silla de comer Polly 2en1 - Cubrebandeja transpare', 'Silla de comer Polly 2en1 - Cubrebandeja transparente', 'repuesto silla comer', 535.00, 750.00, 'available'),
(0028791080349, 1, 42, 'Practicuna Lullaby Baby - Barra de juegos', 'Practicuna Lullaby Baby - Barra de juegos', 'repuesto practicuna', 535.00, 750.00, 'available'),
(0028791080600, 1, 42, 'Practicuna Lullaby Baby - Portaobjetos organizador', 'Practicuna Lullaby Baby - Portaobjetos organizador', 'repuesto practicuna', 535.00, 750.00, 'last units'),
(0028793030100, 1, 33, 'Liteway Plus - Kit ruedas delanteras', 'Liteway Plus - Kit ruedas delanteras', 'repuesto cochecito', 1071.00, 1500.00, 'available'),
(0805866401257, 1, 17, 'Easy Cup 12 M+ Azul/Verde', 'Easy Cup 12 M+ Azul/Verde', 'vaso', 888.00, 1600.00, 'not available'),
(8003670740261, 1, 31, 'Set de higiene Rosa', 'Set de higiene Rosa', 'set higiene', 1027.00, 1850.00, 'not available'),
(8003670744047, 1, 11, 'Corrector de Pezón', 'Corrector de Pezón', '', 500.00, 900.00, 'available'),
(8003670748779, 1, 35, 'Base para butaca Key Fit', 'Base para butaca Key Fit', 'base butaca', 2058.00, 3500.00, 'available'),
(8003670823544, 1, 28, 'Aspirador Nasal', 'Aspirador Nasal', 'aspirador nasal', 416.00, 750.00, 'not available'),
(8003670826767, 1, 19, 'Arco Goal League', 'Arco Goal League', 'arco', 4950.00, 9900.00, 'offer 30%'),
(8003670826798, 1, 19, 'Monkey Strike', 'Monkey Strike', 'bolos', 2550.00, 5100.00, 'last units'),
(8003670844891, 1, 10, 'Mordillo Fresh Relax 4m+ Anillo', 'Mordillo Fresh Relax 4m+ Anillo', 'mordillo', 416.00, 750.00, 'not available'),
(8003670878544, 1, 35, 'Butaca Gr.0+ KeyFit Night (incluye base)', 'Butaca Gr.0+ KeyFit Night (incluye base)', 'butaca', 9999.99, 9999.99, 'offer 10%'),
(8003670911883, 1, 31, 'Set de higiene Celeste', 'Set de higiene Celeste', 'set higiene', 1027.00, 1850.00, 'not available'),
(8003670916659, 1, 11, 'Cascos Recogeleches ', 'Cascos Recogeleches ', '', 833.00, 1500.00, 'available'),
(8003670918707, 1, 30, 'Pasta de dientes 6m+ Manzana/Banana', 'Pasta de dientes 6m+ Manzana/Banana', 'pasta dental', 250.00, 450.00, 'not available'),
(8003670918714, 1, 30, 'Pasta de dientes 12m+ Frutilla', 'Pasta de dientes 12m+ Frutilla', 'pasta dental', 250.00, 450.00, 'not available'),
(8003670982722, 1, 38, 'Extensión para barrera  72mm', 'Extensión para barrera  72mm', 'extensión barrera', 558.00, 950.00, 'available'),
(8003670982739, 1, 38, 'Extensión para barrera  144mm', 'Extensión para barrera  144mm', 'extensión barrera', 1176.00, 2000.00, 'not available'),
(8003670982746, 1, 38, 'Extensión para barrera  360mm', 'Extensión para barrera  360mm', 'extensión barrera', 1470.00, 2500.00, 'available'),
(8003670986836, 1, 10, 'Mordillo Fresh Relax 4m+ Helado', 'Mordillo Fresh Relax 4m+ Helado', 'mordillo', 416.00, 750.00, 'coming soon'),
(8003670986843, 1, 10, 'Mordillo Fresh Relax 4m+ Cereza', 'Mordillo Fresh Relax 4m+ Cereza', 'modillo', 416.00, 750.00, 'not available'),
(8058664000791, 1, 15, 'Set de Platos 12m+ Verde', 'Set de Platos 12m+ Verde', 'set platos', 1194.00, 2150.00, 'available'),
(8058664008247, 1, 9, 'Tetinas NaturalFeeling 2m+ Flujo regulable x2', 'Tetinas NaturalFeeling 2m+ Flujo regulable x2', 'tetina', 433.00, 780.00, 'available'),
(8058664008261, 1, 9, 'Tetinas NaturalFeeling 6m+ Flujo pappa x2', 'Tetinas NaturalFeeling 6m+ Flujo pappa x2', 'tetina', 433.00, 780.00, 'coming soon'),
(8058664009916, 1, 32, 'Tijera Rosa', 'Tijera Rosa', 'tijera', 416.00, 750.00, 'not available'),
(8058664009923, 1, 32, 'Tijera Celeste', 'Tijera Celeste', 'tijera', 416.00, 750.00, 'available'),
(8058664010424, 1, 9, 'Tetina NaturalFeeling 0m+ Flujo lento x1', 'Tetina NaturalFeeling 0m+ Flujo lento x1', 'tetina', 338.00, 610.00, 'available'),
(8058664011926, 1, 29, 'Cepillo y peine Cerda natural Rosa', 'Cepillo y peine Cerda natural Rosa', 'set cabello', 611.00, 1100.00, 'not available'),
(8058664011933, 1, 29, 'Cepillo y peine Cerda natural Celeste', 'Cepillo y peine Cerda natural Celeste', 'set cabello', 611.00, 1100.00, 'not available'),
(8058664012183, 1, 9, 'Termo Porta mamaderas', 'Termo Porta mamaderas', 'termo mamadera', 3777.00, 6800.00, 'available'),
(8058664016556, 1, 38, 'Barrera de seguridad Canceletto', 'Barrera de seguridad Canceletto', 'barrera seguridad', 5000.00, 8500.00, 'not available'),
(8058664022625, 1, 30, 'Cepillo de dientes 6-36m Rosa', 'Cepillo de dientes 6-36m Rosa', 'cepillo dientes', 316.00, 570.00, 'not available'),
(8058664022632, 1, 30, 'Cepillo de dientes 6-36m Celeste', 'Cepillo de dientes 6-36m Celeste', 'cepillo dientes', 316.00, 570.00, 'last units'),
(8058664029495, 1, 25, 'Sra Jirafa ', 'Sra Jirafa ', 'jirafa', 1875.00, 3750.00, 'last units'),
(8058664030583, 1, 11, 'Descartaleche', 'Descartaleche', '', 916.00, 1650.00, 'available'),
(8058664034574, 1, 12, 'Sacaleche manual NaturalFeeling', 'Sacaleche manual NaturalFeeling', 'sacaleche', 3333.00, 6000.00, 'available'),
(8058664034680, 1, 9, 'NaturalFeeling 330ml 6m+ Flujo rápido', 'NaturalFeeling 330ml 6m+ Flujo rápido', 'biberón', 833.00, 1500.00, 'available'),
(8058664034697, 1, 9, 'NaturalFeeling 150ml 0m+ Flujo lento', 'NaturalFeeling 150ml 0m+ Flujo lento', 'biberón', 644.00, 1160.00, 'available'),
(8058664034772, 1, 9, 'NaturalFeeling 250ml 2m+ Flujo medio', 'NaturalFeeling 250ml 2m+ Flujo medio', 'biberón', 777.00, 1400.00, 'available'),
(8058664041688, 1, 33, 'Red Portaobjetos', 'Red Portaobjetos', 'red cochecito', 441.00, 750.00, 'available'),
(8058664041848, 1, 33, 'Sombrilla para cochecito', 'Sombrilla para cochecito', 'sonbrilla cochecito', 2058.00, 3500.00, 'last units'),
(8058664041978, 1, 39, 'Espejo retrovisor', 'Espejo retrovisor', 'espejo retrovisor', 1000.00, 1700.00, 'available'),
(8058664042913, 1, 33, 'Dispositivo repelente mosquitos', 'Dispositivo repelente mosquitos', 'repelente cochecito', 1000.00, 1800.00, 'available'),
(8058664045624, 1, 8, 'Esterilizador Microondas', 'Esterilizador Microondas', 'esterilizador', 2388.00, 4300.00, 'available'),
(8058664047376, 1, 30, 'Set Higiene bucal 6m+ Rosa', 'Set Higiene bucal 6m+ Rosa', 'set higiene bucal', 822.00, 1480.00, 'coming soon'),
(8058664047383, 1, 30, 'Set Higiene bucal 6m+ Celeste', 'Set Higiene bucal 6m+ Celeste', 'set higiene bucal', 822.00, 1480.00, 'coming soon'),
(8058664051854, 1, 7, 'Physio Soft Sil 0-6m Pink', 'Physio Soft Sil 0-6m Pink', 'chupete', 338.00, 610.00, 'available'),
(8058664051861, 1, 7, 'Physio Soft Sil 0-6m Blue', 'Physio Soft Sil 0-6m Blue', 'chupete', 338.00, 610.00, 'last units'),
(8058664051885, 1, 7, 'Physio Soft Sil 6-16m Pink', 'Physio Soft Sil 6-16m Pink', 'chupete', 338.00, 610.00, 'available'),
(8058664051892, 1, 7, 'Physio Soft Sil 6-16m Blue', 'Physio Soft Sil 6-16m Blue', 'chupete', 338.00, 610.00, 'available'),
(8058664051915, 1, 7, 'Physio Soft Sil 16-36m Pink', 'Physio Soft Sil 16-36m Pink', 'chupete', 338.00, 610.00, 'available'),
(8058664051922, 1, 7, 'Physio Soft Sil 16-36m Blue', 'Physio Soft Sil 16-36m Blue', 'chupete', 338.00, 610.00, 'coming soon'),
(8058664052509, 1, 25, 'Baby Bear Neutral', 'Baby Bear Neutral', 'proyector', 2950.00, 5900.00, 'not available'),
(8058664053131, 1, 27, 'Peter de Police', 'Peter de Police', 'auto policía', 1200.00, 2400.00, 'last units'),
(8058664053148, 1, 27, 'Francis de Fire ', 'Francis de Fire ', 'camión bombero', 1200.00, 2400.00, 'not available'),
(8058664058099, 1, 9, 'Tetina Well-being 0m+ F. lento x2', 'Tetina Well-being 0m+ F. lento x2', 'tetina', 377.00, 680.00, 'not available'),
(8058664058105, 1, 9, 'Tetina Well-being 2m+ F. medio x2', 'Tetina Well-being 2m+ F. medio x2', 'tetina', 377.00, 680.00, 'not available'),
(8058664058853, 1, 7, 'Physio Air 6-16M Pink', 'Physio Air 6-16M Pink', 'chupete', 400.00, 720.00, 'available'),
(8058664059010, 1, 7, 'Physio Comfort Sil 0-6m Pink', 'Physio Comfort Sil 0-6m Pink', 'chupete', 305.00, 550.00, 'coming soon'),
(8058664059034, 1, 7, 'Physio Comfort Sil 0-6m Blue', 'Physio Comfort Sil 0-6m Blue', 'chupete', 305.00, 550.00, 'coming soon'),
(8058664059041, 1, 7, 'Physio Comfort Sil 6-16m Pink', 'Physio Comfort Sil 6-16m Pink', 'chupete', 305.00, 550.00, 'available'),
(8058664059058, 1, 7, 'Physio Comfort Sil 6-16m Blue', 'Physio Comfort Sil 6-16m Blue', 'chupete', 305.00, 550.00, 'available'),
(8058664059072, 1, 7, 'Physio Comfort Sil 16-36m Pink LUMI', 'Physio Comfort Sil 16-36m Pink LUMI', 'chupete', 305.00, 550.00, 'available'),
(8058664059089, 1, 7, 'Physio Comfort Sil 16-36m Blue LUMI', 'Physio Comfort Sil 16-36m Blue LUMI', 'chupete', 305.00, 550.00, 'available'),
(8058664061624, 1, 39, 'Espejo para asiento trasero', 'Espejo para asiento trasero', 'espejo retrovisor', 2294.00, 3900.00, 'coming soon'),
(8058664061846, 1, 14, 'Cuchara de silicona 6m+ Rosa', 'Cuchara de silicona 6m+ Rosa', 'cuchara', 583.00, 1050.00, 'not available'),
(8058664061853, 1, 14, 'Cuchara de silicona 6m+ Azul', 'Cuchara de silicona 6m+ Azul', 'cuchara', 583.00, 1050.00, 'not available'),
(8058664066926, 1, 9, 'Well-Being Celeste 250ml 2m+ Flujo medio', 'Well-Being Celeste 250ml 2m+ Flujo medio', 'mamadera', 611.00, 1100.00, 'available'),
(8058664066933, 1, 9, 'Well-Being Verde 250ml 2m+ Flujo medio', 'Well-Being Verde 250ml 2m+ Flujo medio', 'mamadera', 611.00, 1100.00, 'available'),
(8058664066940, 1, 9, 'Well-Being Color Verde 250ml 2m+ Flujo medio', 'Well-Being Color Verde 250ml 2m+ Flujo medio', 'mamadera', 611.00, 1100.00, 'available'),
(8058664067374, 1, 20, 'Teddy Osito bilingüe', 'Teddy Osito bilingüe', 'oso', 3200.00, 6400.00, 'not available'),
(8058664067824, 1, 11, 'Contenedores de leche NaturalFeeling 150ml x4', 'Contenedores de leche NaturalFeeling 150ml x4', '', 1222.00, 2200.00, 'available'),
(8058664069507, 1, 7, 'Physio Micrò 0-2m Girl', 'Physio Micrò 0-2m Girl', 'chupete', 499.00, 899.00, 'coming soon'),
(8058664069538, 1, 7, 'Physio Micrò 0-2m Boy', 'Physio Micrò 0-2m Boy', 'chupete', 499.00, 899.00, 'coming soon'),
(8058664070039, 1, 17, 'Advanced Cup 12M+ Rosa/Violeta', 'Advanced Cup 12M+ Rosa/Violeta', 'vaso', 822.00, 1480.00, 'not available'),
(8058664070046, 1, 17, 'Advanced Cup 12M+ Azul', 'Advanced Cup 12M+ Azul', 'vaso', 822.00, 1480.00, 'not available'),
(8058664070466, 1, 5, 'Pezonera Silicona SkinToSkin S/M', 'Pezonera Silicona SkinToSkin S/M', 'pezonera', 611.00, 1100.00, 'coming soon'),
(8058664070473, 1, 5, 'Pezonera Silicona SkinToSkin M/L', 'Pezonera Silicona SkinToSkin M/L', 'pezonera', 611.00, 1100.00, 'available'),
(8058664075201, 1, 30, 'Cepillo de dientes 3-6y Rosa', 'Cepillo de dientes 3-6y Rosa', 'cepillo dientes', 288.00, 520.00, 'available'),
(8058664075218, 1, 30, 'Cepillo de dientes 3-6y Azul', 'Cepillo de dientes 3-6y Azul', 'cepillo dientes', 288.00, 520.00, 'available'),
(8058664077595, 1, 33, 'London BLUE', 'London BLUE', 'cochecito', 9999.99, 9999.99, 'available'),
(8058664079308, 1, 19, 'Mister Ring', 'Mister Ring', 'anillas', 2550.00, 5100.00, 'last units'),
(8058664079315, 1, 19, 'Alfombra Interactiva Juega y Salta', 'Alfombra Interactiva Juega y Salta', 'alfombra', 2925.00, 5850.00, 'not available'),
(8058664080540, 1, 35, 'GoFit - C32Shark', 'GoFit - C32Shark', 'butaca', 6470.00, 9999.99, 'coming soon'),
(8058664080632, 1, 16, 'Polly2Start Baby Elephant', 'Polly2Start Baby Elephant', 'silla comer', 9999.99, 9999.99, 'available'),
(8058664080663, 1, 16, 'Polly2Start Fancy Chicken', 'Polly2Start Fancy Chicken', 'silla comer', 9999.99, 9999.99, 'available'),
(8058664080724, 1, 9, 'NaturalFeeling 150ml 0m+ F.lento ROSA', 'NaturalFeeling 150ml 0m+ F.lento ROSA', 'biberón', 644.00, 1160.00, 'available'),
(8058664081240, 1, 17, 'Easy Cup 12 M+ Rosa/Violeta', 'Easy Cup 12 M+ Rosa/Violeta', 'vaso', 888.00, 1600.00, 'coming soon'),
(8058664083480, 1, 33, 'Cochecito BRAVO Air - Q Collection', 'Cochecito BRAVO Air - Q Collection', 'cochecito', 9999.99, 9999.99, 'offer 10%'),
(8058664085002, 1, 9, 'NaturalFeeling 150ml 0m+ F.lento CELESTE', 'NaturalFeeling 150ml 0m+ F.lento CELESTE', 'biberón', 644.00, 1160.00, 'available'),
(8058664086504, 1, 15, 'Plato térmico 6m+ Rosa', 'Plato térmico 6m+ Rosa', 'plato', 888.00, 1600.00, 'not available'),
(8058664086528, 1, 15, 'Plato térmico 6m+ Celeste', 'Plato térmico 6m+ Celeste', 'plato', 888.00, 1600.00, 'not available'),
(8058664086535, 1, 15, 'Plato térmico 6m+ Verde', 'Plato térmico 6m+ Verde', 'plato', 888.00, 1600.00, 'not available'),
(8058664086542, 1, 15, 'Plato Easy 6m+ Rosa', 'Plato Easy 6m+ Rosa', 'plato', 722.00, 1300.00, 'not available'),
(8058664086559, 1, 15, 'Plato Easy 6m+ Celeste', 'Plato Easy 6m+ Celeste', 'plato', 722.00, 1300.00, 'not available'),
(8058664086566, 1, 15, 'Plato Easy 6m+ Verde', 'Plato Easy 6m+ Verde', 'plato', 722.00, 1300.00, 'available'),
(8058664086573, 1, 15, 'Set de Platos 12m+ Rosa', 'Set de Platos 12m+ Rosa', 'set platos', 1194.00, 2150.00, 'not available'),
(8058664086580, 1, 15, 'Set de Platos 12m+ Celeste', 'Set de Platos 12m+ Celeste', 'set platos', 1194.00, 2150.00, 'not available'),
(8058664086627, 1, 14, 'Primeros Cubiertos 12m+ Verde', 'Primeros Cubiertos 12m+ Verde', 'set cubiertos', 438.00, 790.00, 'coming soon'),
(8058664086658, 1, 14, 'Cubiertos Inoxidables 18m+ Verde', 'Cubiertos Inoxidables 18m+ Verde', 'set cubiertos', 838.00, 1510.00, 'not available'),
(8058664089758, 1, 21, '2 en 1 Pelota Transformable ', '2 en 1 Pelota Transformable ', 'pelota', 1700.00, 3400.00, 'coming soon'),
(8058664091225, 1, 16, 'Polly2Start Honey Bear', 'Polly2Start Honey Bear', 'silla comer', 9999.99, 9999.99, 'available'),
(8058664092178, 1, 45, 'BabyHug 4en1 AQUARELLE', 'BabyHug 4en1 AQUARELLE', 'multifunción', 9999.99, 9999.99, 'available'),
(8058664092185, 1, 45, 'BabyHug 4en1 1 GLACIAL', 'BabyHug 4en1 1 GLACIAL', 'multifunción', 9999.99, 9999.99, 'available'),
(8058664093946, 1, 27, 'Vespa Primavera Italia', 'Vespa Primavera Italia', 'moto', 8250.00, 9999.99, 'not available'),
(8058664093960, 1, 27, 'Display Vespa x12  PVP unitario $825', 'Display Vespa x12  PVP unitario $825', 'moto', 4950.00, 9900.00, 'last units'),
(8058664097067, 1, 7, 'Physio Light 2-6M Girl ', 'Physio Light 2-6M Girl ', 'chupete', 527.00, 950.00, 'available'),
(8058664097074, 1, 7, 'Physio Light 2-6M Boy', 'Physio Light 2-6M Boy', 'chupete', 527.00, 950.00, 'available'),
(8058664097081, 1, 7, 'Physio Light 2-6M Lumi', 'Physio Light 2-6M Lumi', 'chupete', 527.00, 950.00, 'available'),
(8058664097098, 1, 7, 'Physio Light 6-16M Girl', 'Physio Light 6-16M Girl', 'chupete', 527.00, 950.00, 'available'),
(8058664097104, 1, 7, 'Physio Light 6-16M Boy', 'Physio Light 6-16M Boy', 'chupete', 527.00, 950.00, 'available'),
(8058664097258, 1, 7, 'Physio Light 6-16M Lumi', 'Physio Light 6-16M Lumi', 'chupete', 527.00, 950.00, 'available'),
(8058664097265, 1, 7, 'Physio Light 16-36M Girl', 'Physio Light 16-36M Girl', 'chupete', 527.00, 950.00, 'available'),
(8058664097272, 1, 7, 'Physio Light 16-36M Boy', 'Physio Light 16-36M Boy', 'chupete', 527.00, 950.00, 'available'),
(8058664097289, 1, 7, 'Physio Light 16-36M Lumi', 'Physio Light 16-36M Lumi', 'chupete', 527.00, 950.00, 'available'),
(8058664101320, 1, 17, 'Transition Cup 4M+ Rosa', 'Transition Cup 4M+ Rosa', 'vaso', 750.00, 1350.00, 'not available'),
(8058664101337, 1, 17, 'Transition Cup 4M+ Celeste', 'Transition Cup 4M+ Celeste', 'vaso', 750.00, 1350.00, 'not available'),
(8058664101351, 1, 17, 'Training Cup 6M+ Rosa/Violeta', 'Training Cup 6M+ Rosa/Violeta', 'vaso', 694.00, 1250.00, 'not available'),
(8058664101368, 1, 17, 'Training Cup 6M+ Azul/verde', 'Training Cup 6M+ Azul/verde', 'vaso', 694.00, 1250.00, 'not available'),
(8058664101382, 1, 17, 'Perfect Cup 12 M+ Rosa', 'Perfect Cup 12 M+ Rosa', 'vaso', 944.00, 1700.00, 'not available'),
(8058664101399, 1, 17, 'Perfect Cup 12 M+ Azul', 'Perfect Cup 12 M+ Azul', 'vaso', 944.00, 1700.00, 'not available'),
(8058664102914, 1, 21, '2 en 1 Multicubo Encajable ', '2 en 1 Multicubo Encajable ', 'multicubo', 1400.00, 2800.00, 'not available'),
(8058664103638, 1, 9, 'NaturalFeeling 150ml 0m+ F.lento VIDRIO', 'NaturalFeeling 150ml 0m+ F.lento VIDRIO', 'biberón', 1138.00, 2050.00, 'coming soon'),
(8058664103645, 1, 9, 'NaturalFeeling 250ml 0m+ F.lento VIDRIO', 'NaturalFeeling 250ml 0m+ F.lento VIDRIO', 'biberón', 1222.00, 2200.00, 'not available'),
(8058664103706, 1, 30, 'Set Higiene bucal 3Y+ Rosa', 'Set Higiene bucal 3Y+ Rosa', 'set higiene bucal', 861.00, 1550.00, 'not available'),
(8058664103713, 1, 30, 'Set Higiene bucal 3Y+ Azul', 'Set Higiene bucal 3Y+ Azul', 'set higiene bucal', 861.00, 1550.00, 'not available'),
(8058664104659, 1, 9, 'Cepillo limpiabiberon de silicona', 'Cepillo limpiabiberon de silicona', 'cepillo limpiabiberon', 666.00, 1200.00, 'not available'),
(8058664104819, 1, 33, 'Cochecito MINI BRAVO Plus Graphite (gris)', 'Cochecito MINI BRAVO Plus Graphite (gris)', 'cochecito', 9999.99, 9999.99, 'available'),
(8058664105090, 1, 33, 'Cochecito MINI BRAVO Plus Storm (negro)', 'Cochecito MINI BRAVO Plus Storm (negro)', 'cochecito', 9999.99, 9999.99, 'available'),
(8058664105649, 1, 7, 'Physio Soft + Clip Girl Sil 0-6m blister', 'Physio Soft + Clip Girl Sil 0-6m blister', 'chupete', 299.00, 539.00, 'available'),
(8058664105656, 1, 7, 'Physio Soft + Clip Boy Sil 0-6m blister', 'Physio Soft + Clip Boy Sil 0-6m blister', 'chupete', 299.00, 539.00, 'available'),
(8058664106257, 1, 27, 'Display Turbo Ball x12 PVP unitario $600', 'Display Turbo Ball x12 PVP unitario $600', 'autos', 3602.00, 7205.00, 'last units'),
(8058664107087, 1, 45, 'BabyHug 4en1 Legend', 'BabyHug 4en1 Legend', 'multifunción', 9999.99, 9999.99, 'available'),
(8058664107285, 1, 33, 'Adaptador KeyFit para Fully Twin', 'Adaptador KeyFit para Fully Twin', 'adaptador cochecito', 3235.00, 5500.00, 'not available'),
(8058664107612, 1, 7, 'Physio Soft + Clip Girl Sil 6-16m blister', 'Physio Soft + Clip Girl Sil 6-16m blister', 'chupete', 299.00, 539.00, 'available'),
(8058664107629, 1, 7, 'Physio Soft + Clip Boy Sil 6-16m blister', 'Physio Soft + Clip Boy Sil 6-16m blister', 'chupete', 299.00, 539.00, 'available'),
(8058664108022, 1, 25, 'El Libro de los animales de la granja ', 'El Libro de los animales de la granja ', 'libro', 1950.00, 3900.00, 'not available'),
(8058664108107, 1, 16, 'Polly2Start Miss Pink', 'Polly2Start Miss Pink', 'silla comer', 9999.99, 9999.99, 'available'),
(8058664109043, 1, 33, 'Fully Twin', 'Fully Twin', 'cochecito', 9999.99, 9999.99, 'available'),
(8058664109388, 1, 47, 'Nuevo Parasol', 'Nuevo Parasol', 'parasol', 1000.00, 1800.00, 'coming soon'),
(8058664110308, 1, 35, 'NextFit Zip - Juniper', 'NextFit Zip - Juniper', 'butaca', 9999.99, 9999.99, 'coming soon'),
(8058664110605, 1, 33, 'Ohlala2 Comics + Tapizado y Capota Black', 'Ohlala2 Comics + Tapizado y Capota Black', 'cochecito', 9999.99, 9999.99, 'limited edition'),
(8058664110629, 1, 33, 'Ohlala2 Unicorn + Tapizado y Capota Black ', 'Ohlala2 Unicorn + Tapizado y Capota Black ', 'cochecito', 9999.99, 9999.99, 'limited edition'),
(8058664111077, 1, 14, 'Primera cuchara 8m+ Azul', 'Primera cuchara 8m+ Azul', 'cuchara', 355.00, 640.00, 'coming soon'),
(8058664111084, 1, 14, 'Primera cuchara 8m+ Rosa', 'Primera cuchara 8m+ Rosa', 'cuchara', 355.00, 640.00, 'coming soon'),
(8058664111350, 1, 46, 'Mi primer nido Rosa', 'Mi primer nido Rosa', 'nido contención', 3575.00, 7150.00, 'offer 20%'),
(8058664111367, 1, 46, 'Mi primer nido Azul', 'Mi primer nido Azul', 'nido contención', 3575.00, 7150.00, 'offer 20%'),
(8058664114481, 1, 23, 'Flashy Xilofon', 'Flashy Xilofon', 'xilofon', 3450.00, 6900.00, 'last units'),
(8058664115006, 1, 18, 'Termo Mum&Baby 500ml', 'Termo Mum&Baby 500ml', 'termo', 1750.00, 3150.00, 'not available'),
(8058664116904, 1, 18, 'Fruit Friend', 'Fruit Friend', 'chupete alimentario', 611.00, 1100.00, 'not available'),
(8058664117703, 1, 27, 'Transformablox', 'Transformablox', 'mecánico', 3150.00, 6300.00, 'offer 20%'),
(8058664118663, 1, 25, 'Phil el Gusano ', 'Phil el Gusano ', 'gusano', 1960.00, 3920.00, 'not available'),
(8058664118670, 1, 25, 'Billy The Octopus', 'Billy The Octopus', 'pulpo', 1860.00, 3720.00, 'not available'),
(8058664119349, 1, 25, 'Pelota Soft ', 'Pelota Soft ', 'pelota', 550.00, 1100.00, 'not available'),
(8058664119530, 1, 21, '2 en 1 Q-Bricks', '2 en 1 Q-Bricks', 'cubo', 1700.00, 3400.00, 'coming soon'),
(8058664119547, 1, 21, '2 en 1 Escuela de Herramientas ', '2 en 1 Escuela de Herramientas ', 'herramientas engranajes', 1700.00, 3400.00, 'coming soon'),
(8058664120277, 1, 10, 'Mix Surtido mordillos Soft Relax Limón, Uva, Estre', 'Mix Surtido mordillos Soft Relax Limón, Uva, Estrella roja x12', 'mordillo', 3333.00, 6000.00, 'available'),
(8058664122790, 1, 35, 'Butaca Gr.0+ Kaily Black (incluye base)', 'Butaca Gr.0+ Kaily Black (incluye base)', 'butaca', 9999.99, 9999.99, 'offer 15%'),
(8058664125456, 1, 33, 'Ohlala Twin black night', 'Ohlala Twin black night', 'cochecito', 9999.99, 9999.99, 'available'),
(8058664125630, 1, 33, 'Cochecito BEST FRIEND+ OXFORD', 'Cochecito BEST FRIEND+ OXFORD', 'cochecito', 9999.99, 9999.99, 'offer 15%'),
(8058664125647, 1, 33, 'Cochecito BEST FRIEND+ STONE', 'Cochecito BEST FRIEND+ STONE', 'cochecito', 9999.99, 9999.99, 'offer 15%'),
(8058664127702, 1, 33, 'Goody Cool Grey', 'Goody Cool Grey', 'cochecito', 9999.99, 9999.99, 'available'),
(8058664127801, 1, 33, 'Goody Graphite (negro)', 'Goody Graphite (negro)', 'cochecito', 9999.99, 9999.99, 'available'),
(8059147059633, 1, 25, 'Goodnight stars projector Pink', 'Goodnight stars projector Pink', 'proyector', 3900.00, 7800.00, 'not available'),
(8059147059855, 1, 25, 'Goodnight stars projector Blue', 'Goodnight stars projector Blue', 'proyector', 3900.00, 7800.00, 'not available');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `subcategorys`
--

DROP TABLE IF EXISTS `subcategorys`;
CREATE TABLE `subcategorys` (
  `id` tinyint(3) UNSIGNED NOT NULL,
  `name` varchar(40) COLLATE utf8mb4_spanish_ci NOT NULL,
  `description` text COLLATE utf8mb4_spanish_ci NOT NULL,
  `category_id` tinyint(3) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

--
-- Volcado de datos para la tabla `subcategorys`
--

INSERT INTO `subcategorys` (`id`, `name`, `description`, `category_id`) VALUES
(1, 'Almohadones', '', 1),
(2, 'Bolsos', '', 1),
(3, 'Fajas', '', 1),
(4, 'Mochilas', '', 1),
(5, 'Pezoneras', '', 1),
(6, 'Protectores Mamarios', '', 1),
(7, 'Chupetes', 'Incluye chupetes, prendedores y porta chupetes', 2),
(8, 'Esterilizadores', 'Incluye esterilizadores de mamaderas, de chupetes, etc', 2),
(9, 'Mamaderas y Accesorios', 'Incluye mamaderas, biberones, tetinas, esterilizador, limpiador y termo', 2),
(10, 'Mordillos', '', 2),
(11, 'Otros', 'Incluye descartaleches, correctores de pezón, cascos recogeleches , contenedores', 2),
(12, 'Sacaleches', '', 2),
(13, 'Baberos', '', 3),
(14, 'Cubiertos', '', 3),
(15, 'Platos', '', 3),
(16, 'Sillas de Comer', 'Incluye sillas y repuestos', 3),
(17, 'Vasos', '', 3),
(18, 'Otros', 'Incluye chupetes alimentarios y termos', 3),
(19, 'Deportes y Gimnasios', 'FIT & FUN', 4),
(20, 'Educativos', 'ABC Bilingues', 4),
(21, 'Encastrables y Apilables', 'SMART2PLAY', 4),
(22, 'Muñecas y Muñecos', '', 4),
(23, 'Musicales', 'Happy Music', 4),
(24, 'Peluches', '', 4),
(25, 'Primeros Juegos', 'BABY SENSES', 4),
(26, 'Sonajeros', '', 4),
(27, 'Vehículos', 'TURBO VESPA', 4),
(28, 'Aspiradores Nasales', '', 5),
(29, 'Cepillos y Peines', '', 5),
(30, 'Higiene Bucal', 'Incluye cepillos, pastas, sets de higiene bucal', 5),
(31, 'Sets de Higiene', 'Incluye sets de cuidado', 5),
(32, 'Tijeras', '', 5),
(33, 'Cochecitos', 'Incluye accesorios (Red Portaobjetos, Sombrilla), adaptadores, repelentes y repuestos', 6),
(34, 'Cunas, Catres y Moisés', '', 6),
(35, 'Huevitos y Sillitas', 'Incluye butacas y bases', 6),
(36, 'Mochilas y Porta Bebés ', '', 6),
(37, 'Baby Call', '', 7),
(38, 'Barreras', 'Incluye barreras, extensiones y puertas', 7),
(39, 'Espejos Retrovisores', '', 7),
(40, 'Pisos de Goma', '', 7),
(41, 'Traba de Puertas', '', 7),
(42, 'Cunas', 'Incluye cunas, practicunas, cunas funcionales y repuestos', 8),
(43, 'Catres', 'Incluye catres de baño', 8),
(44, 'Moisés', '', 8),
(45, 'Multifunción', 'Moisés de día, Hamaca, Silla de comer o Primera sillita', 8),
(46, 'Nidos de Contensión', '', 8),
(47, 'Parasoles', '', 8);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `brands`
--
ALTER TABLE `brands`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `categorys`
--
ALTER TABLE `categorys`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`) USING BTREE,
  ADD KEY `brand_id` (`brand_id`),
  ADD KEY `subcategory_id` (`subcategory_id`),
  ADD KEY `subcategory_id_2` (`subcategory_id`);

--
-- Indices de la tabla `subcategorys`
--
ALTER TABLE `subcategorys`
  ADD PRIMARY KEY (`id`),
  ADD KEY `category_id` (`category_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `brands`
--
ALTER TABLE `brands`
  MODIFY `id` tinyint(3) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `categorys`
--
ALTER TABLE `categorys`
  MODIFY `id` tinyint(3) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `subcategorys`
--
ALTER TABLE `subcategorys`
  MODIFY `id` tinyint(3) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_ibfk_1` FOREIGN KEY (`brand_id`) REFERENCES `brands` (`id`),
  ADD CONSTRAINT `products_ibfk_2` FOREIGN KEY (`subcategory_id`) REFERENCES `subcategorys` (`id`);

--
-- Filtros para la tabla `subcategorys`
--
ALTER TABLE `subcategorys`
  ADD CONSTRAINT `subcategorys_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `categorys` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
