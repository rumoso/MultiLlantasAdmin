-- MySQL dump 10.13  Distrib 8.0.42, for Win64 (x86_64)
--
-- Host: localhost    Database: db_diprolimweb
-- ------------------------------------------------------
-- Server version	8.0.42

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `actions`
--

DROP TABLE IF EXISTS `actions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `actions` (
  `idAction` bigint NOT NULL AUTO_INCREMENT,
  `createDate` datetime DEFAULT NULL,
  `idActionSection` smallint NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `nameHtml` varchar(50) DEFAULT NULL,
  `description` varchar(1000) DEFAULT NULL,
  `active` smallint DEFAULT NULL,
  PRIMARY KEY (`idAction`),
  KEY `fk_actions_actionsection1_idx` (`idActionSection`),
  CONSTRAINT `fk_actions_actionsection1` FOREIGN KEY (`idActionSection`) REFERENCES `actionsection` (`idActionSection`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `actionsconf`
--

DROP TABLE IF EXISTS `actionsconf`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `actionsconf` (
  `idActionsConf` bigint NOT NULL AUTO_INCREMENT,
  `createDate` datetime DEFAULT NULL,
  `relationType` varchar(5) DEFAULT NULL,
  `idRelation` bigint DEFAULT NULL,
  `idAction` bigint NOT NULL,
  `active` smallint DEFAULT NULL,
  PRIMARY KEY (`idActionsConf`),
  KEY `fk_actionsconf_actions1_idx` (`idAction`),
  CONSTRAINT `fk_actionsconf_actions1` FOREIGN KEY (`idAction`) REFERENCES `actions` (`idAction`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=174 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `actionsection`
--

DROP TABLE IF EXISTS `actionsection`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `actionsection` (
  `idActionSection` smallint NOT NULL AUTO_INCREMENT,
  `sectionName` varchar(500) DEFAULT NULL,
  `iLugar` smallint DEFAULT NULL,
  `active` smallint DEFAULT NULL,
  PRIMARY KEY (`idActionSection`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `almacenes`
--

DROP TABLE IF EXISTS `almacenes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `almacenes` (
  `idAlmacen` smallint NOT NULL AUTO_INCREMENT,
  `createDate` datetime DEFAULT NULL,
  `name` varchar(45) DEFAULT NULL,
  `idCatRelacionOrigen` smallint NOT NULL,
  `calle` varchar(45) DEFAULT NULL,
  `numExt` varchar(10) DEFAULT NULL,
  `numInt` varchar(10) DEFAULT NULL,
  `entreCalles` varchar(45) DEFAULT NULL,
  `codigocolonia` int DEFAULT NULL,
  `telefono` varchar(20) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `lat` varchar(15) DEFAULT NULL,
  `long` varchar(15) DEFAULT NULL,
  `active` smallint DEFAULT NULL,
  PRIMARY KEY (`idAlmacen`),
  KEY `fk_almacenes_cat_relacion_origen1_idx` (`idCatRelacionOrigen`),
  CONSTRAINT `fk_almacenes_cat_relacion_origen1` FOREIGN KEY (`idCatRelacionOrigen`) REFERENCES `cat_relacion_origen` (`idCatRelacionOrigen`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cajas`
--

DROP TABLE IF EXISTS `cajas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cajas` (
  `idcajas` int NOT NULL AUTO_INCREMENT,
  `idSucursal` smallint NOT NULL,
  `nombre` varchar(45) DEFAULT NULL,
  `descripcion` text,
  `active` tinyint DEFAULT NULL,
  `createdAt` timestamp NULL DEFAULT NULL,
  `updatedAt` timestamp NULL DEFAULT NULL,
  `activeuuid` varchar(36) DEFAULT NULL,
  `ultimouso` datetime DEFAULT NULL,
  `esgeneral` tinyint DEFAULT NULL,
  `estatus` varchar(7) DEFAULT 'ABIERTA' COMMENT 'ABIERTA ó CERRADA',
  PRIMARY KEY (`idcajas`),
  KEY `fk_cajas_sucursales1_idx` (`idSucursal`),
  CONSTRAINT `fk_cajas_sucursales1` FOREIGN KEY (`idSucursal`) REFERENCES `sucursales` (`idSucursal`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cart`
--

DROP TABLE IF EXISTS `cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cart` (
  `idcart` bigint NOT NULL AUTO_INCREMENT,
  `createDate` datetime DEFAULT NULL,
  `idUser` bigint NOT NULL,
  `idCliente` bigint NOT NULL,
  `idSucursal` smallint NOT NULL,
  `idTipoVenta` int NOT NULL,
  PRIMARY KEY (`idcart`),
  KEY `fk_cart_users1_idx` (`idUser`),
  KEY `fk_cart_sucursales1_idx` (`idSucursal`),
  KEY `fk_cart_cat_tipo_venta1_idx` (`idTipoVenta`),
  CONSTRAINT `fk_cart_cat_tipo_venta1` FOREIGN KEY (`idTipoVenta`) REFERENCES `cat_tipo_venta` (`idTipoVenta`),
  CONSTRAINT `fk_cart_sucursales1` FOREIGN KEY (`idSucursal`) REFERENCES `sucursales` (`idSucursal`),
  CONSTRAINT `fk_cart_users1` FOREIGN KEY (`idUser`) REFERENCES `users` (`idUser`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cartdetail`
--

DROP TABLE IF EXISTS `cartdetail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cartdetail` (
  `idcartdetail` int NOT NULL AUTO_INCREMENT,
  `idcart` bigint NOT NULL,
  `sku` varchar(25) DEFAULT NULL,
  `idProducto` bigint NOT NULL,
  `descripcion` varchar(50) DEFAULT NULL,
  `cantidad` decimal(10,2) DEFAULT NULL,
  `precio` decimal(18,2) DEFAULT NULL,
  PRIMARY KEY (`idcartdetail`),
  KEY `fk_cartDetail_cart1_idx` (`idcart`),
  KEY `fk_cartDetail_productos1_idx` (`idProducto`),
  CONSTRAINT `fk_cartDetail_cart1` FOREIGN KEY (`idcart`) REFERENCES `cart` (`idcart`),
  CONSTRAINT `fk_cartDetail_productos1` FOREIGN KEY (`idProducto`) REFERENCES `productos` (`idProducto`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cat_categoria_producto`
--

DROP TABLE IF EXISTS `cat_categoria_producto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cat_categoria_producto` (
  `idcatcategoriaproducto` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `description` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`idcatcategoriaproducto`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cat_departamentos`
--

DROP TABLE IF EXISTS `cat_departamentos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cat_departamentos` (
  `idDepartamento` smallint NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `active` smallint DEFAULT NULL,
  PRIMARY KEY (`idDepartamento`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cat_descripciones`
--

DROP TABLE IF EXISTS `cat_descripciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cat_descripciones` (
  `idDescription` bigint NOT NULL AUTO_INCREMENT,
  `description` varchar(100) DEFAULT NULL,
  `active` smallint DEFAULT NULL,
  PRIMARY KEY (`idDescription`)
) ENGINE=InnoDB AUTO_INCREMENT=237 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cat_familias`
--

DROP TABLE IF EXISTS `cat_familias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cat_familias` (
  `idFamilia` smallint NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `active` smallint DEFAULT NULL,
  `idDepartamento` smallint NOT NULL,
  PRIMARY KEY (`idFamilia`),
  KEY `fk_cat_familias_cat_departamentos1_idx` (`idDepartamento`),
  CONSTRAINT `fk_cat_familias_cat_departamentos1` FOREIGN KEY (`idDepartamento`) REFERENCES `cat_departamentos` (`idDepartamento`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cat_mov_entrada_salida`
--

DROP TABLE IF EXISTS `cat_mov_entrada_salida`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cat_mov_entrada_salida` (
  `idCatMov` int NOT NULL AUTO_INCREMENT,
  `description` varchar(45) DEFAULT NULL,
  `active` smallint DEFAULT NULL,
  PRIMARY KEY (`idCatMov`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cat_movimientos_caja`
--

DROP TABLE IF EXISTS `cat_movimientos_caja`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cat_movimientos_caja` (
  `idcatmovimientoscaja` int NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(45) DEFAULT NULL,
  `activo` tinyint DEFAULT NULL,
  `tipo_movimiento` enum('INGRESO','EGRESO','AMBOS') DEFAULT 'AMBOS',
  PRIMARY KEY (`idcatmovimientoscaja`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cat_relacion_origen`
--

DROP TABLE IF EXISTS `cat_relacion_origen`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cat_relacion_origen` (
  `idCatRelacionOrigen` smallint NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `descripcion` varchar(45) DEFAULT NULL,
  `active` smallint DEFAULT NULL,
  `abreviatura` varchar(45) DEFAULT NULL,
  `idCatTipoProducto` int DEFAULT NULL,
  PRIMARY KEY (`idCatRelacionOrigen`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cat_status_cotizaciones`
--

DROP TABLE IF EXISTS `cat_status_cotizaciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cat_status_cotizaciones` (
  `idCatStatusCotizaciones` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `description` varchar(100) DEFAULT NULL,
  `active` smallint DEFAULT NULL,
  PRIMARY KEY (`idCatStatusCotizaciones`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cat_status_pedidos_clientes`
--

DROP TABLE IF EXISTS `cat_status_pedidos_clientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cat_status_pedidos_clientes` (
  `idCatStatusPedidosClientes` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `description` varchar(100) DEFAULT NULL,
  `active` smallint DEFAULT NULL,
  PRIMARY KEY (`idCatStatusPedidosClientes`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cat_status_prod`
--

DROP TABLE IF EXISTS `cat_status_prod`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cat_status_prod` (
  `idCatStatusProd` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `description` varchar(100) DEFAULT NULL,
  `active` smallint DEFAULT NULL,
  PRIMARY KEY (`idCatStatusProd`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cat_status_prod_base`
--

DROP TABLE IF EXISTS `cat_status_prod_base`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cat_status_prod_base` (
  `idStatus` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `description` varchar(100) DEFAULT NULL,
  `active` smallint DEFAULT NULL,
  PRIMARY KEY (`idStatus`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cat_status_user`
--

DROP TABLE IF EXISTS `cat_status_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cat_status_user` (
  `idStatus` smallint NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `active` smallint DEFAULT NULL,
  PRIMARY KEY (`idStatus`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cat_status_vendedor`
--

DROP TABLE IF EXISTS `cat_status_vendedor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cat_status_vendedor` (
  `idStatusVendedor` smallint NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `active` smallint DEFAULT NULL,
  PRIMARY KEY (`idStatusVendedor`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cat_tipo_cliente`
--

DROP TABLE IF EXISTS `cat_tipo_cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cat_tipo_cliente` (
  `idTipoCliente` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `description` varchar(100) DEFAULT NULL,
  `active` smallint DEFAULT NULL,
  PRIMARY KEY (`idTipoCliente`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cat_tipo_producto`
--

DROP TABLE IF EXISTS `cat_tipo_producto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cat_tipo_producto` (
  `idCatTipoProducto` smallint NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `descripcion` varchar(45) DEFAULT NULL,
  `abreviatura` varchar(10) DEFAULT NULL,
  `active` smallint DEFAULT NULL,
  `idTipoOrigen` smallint DEFAULT '0',
  PRIMARY KEY (`idCatTipoProducto`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cat_tipo_venta`
--

DROP TABLE IF EXISTS `cat_tipo_venta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cat_tipo_venta` (
  `idTipoVenta` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `description` varchar(100) DEFAULT NULL,
  `active` smallint DEFAULT NULL,
  PRIMARY KEY (`idTipoVenta`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cat_unidad_medida`
--

DROP TABLE IF EXISTS `cat_unidad_medida`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cat_unidad_medida` (
  `idUnidadMedida` smallint NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `abreviatura` varchar(45) DEFAULT NULL,
  `active` smallint DEFAULT NULL,
  PRIMARY KEY (`idUnidadMedida`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `change_status_ppd_log`
--

DROP TABLE IF EXISTS `change_status_ppd_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `change_status_ppd_log` (
  `keyx` bigint NOT NULL AUTO_INCREMENT,
  `idProdProdBaseDetalle` bigint NOT NULL,
  `createDate` datetime DEFAULT NULL,
  `idStatusFrom` int NOT NULL,
  `idStatusTo` int NOT NULL,
  `idCreateUser` bigint NOT NULL,
  PRIMARY KEY (`keyx`),
  KEY `fk_change_status_ppd_log_prod_prod_base_detalle1_idx` (`idProdProdBaseDetalle`),
  KEY `fk_change_status_ppd_log_cat_status_prod_base1_idx` (`idStatusFrom`),
  KEY `fk_change_status_ppd_log_cat_status_prod_base2_idx` (`idStatusTo`),
  KEY `fk_change_status_ppd_log_users1_idx` (`idCreateUser`),
  CONSTRAINT `fk_change_status_ppd_log_cat_status_prod_base1` FOREIGN KEY (`idStatusFrom`) REFERENCES `cat_status_prod_base` (`idStatus`),
  CONSTRAINT `fk_change_status_ppd_log_cat_status_prod_base2` FOREIGN KEY (`idStatusTo`) REFERENCES `cat_status_prod_base` (`idStatus`),
  CONSTRAINT `fk_change_status_ppd_log_prod_prod_base_detalle1` FOREIGN KEY (`idProdProdBaseDetalle`) REFERENCES `prod_prod_base_detalle` (`idProdProdBaseDetalle`),
  CONSTRAINT `fk_change_status_ppd_log_users1` FOREIGN KEY (`idCreateUser`) REFERENCES `users` (`idUser`)
) ENGINE=InnoDB AUTO_INCREMENT=193 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ciudades`
--

DROP TABLE IF EXISTS `ciudades`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ciudades` (
  `idciudades` int NOT NULL AUTO_INCREMENT,
  `codigociudad` varchar(4) DEFAULT NULL,
  `nombre` varchar(50) NOT NULL,
  `codigomunicipio` varchar(3) NOT NULL,
  `codigoestado` varchar(2) NOT NULL,
  PRIMARY KEY (`idciudades`),
  KEY `fk_ciudades_estados1_idx` (`codigoestado`),
  CONSTRAINT `fk_ciudades_estados1` FOREIGN KEY (`codigoestado`) REFERENCES `estados` (`codigoestado`)
) ENGINE=InnoDB AUTO_INCREMENT=673 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `clientes`
--

DROP TABLE IF EXISTS `clientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clientes` (
  `idCliente` bigint NOT NULL AUTO_INCREMENT,
  `createDate` datetime DEFAULT NULL,
  `nombre` varchar(100) DEFAULT NULL,
  `calle` varchar(100) DEFAULT NULL,
  `numExt` varchar(45) DEFAULT NULL,
  `numInt` varchar(45) DEFAULT NULL,
  `entreCalles` varchar(45) DEFAULT NULL,
  `codigocolonia` int DEFAULT NULL,
  `razonSocial` varchar(45) DEFAULT NULL,
  `rfc` varchar(45) DEFAULT NULL,
  `telefono` varchar(45) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `lat` varchar(15) DEFAULT NULL,
  `long` varchar(15) DEFAULT NULL,
  `active` smallint DEFAULT NULL,
  `idVendedor` bigint NOT NULL DEFAULT '1',
  `bCredito` smallint DEFAULT NULL,
  `iDiasCredito` int DEFAULT NULL,
  `limiteCredito` decimal(18,2) DEFAULT NULL,
  `idTipoCliente` int NOT NULL,
  `bPuntoDVenta` smallint DEFAULT NULL,
  `bDineroElectronico` smallint DEFAULT NULL,
  `bCompraMin` smallint DEFAULT NULL,
  `bReactivado` smallint DEFAULT NULL,
  `fechaReactivacion` datetime DEFAULT NULL,
  `idZona` int NOT NULL DEFAULT '0',
  `bProspecto` smallint DEFAULT NULL,
  `bFProspecto` smallint DEFAULT NULL,
  `clientDate` datetime DEFAULT NULL,
  `compraEstimada` decimal(18,2) DEFAULT NULL,
  `idGiro` int DEFAULT NULL,
  PRIMARY KEY (`idCliente`),
  KEY `fk_clientes_vendedores1_idx` (`idVendedor`),
  KEY `fk_clientes_cat_tipo_cliente1_idx` (`idTipoCliente`),
  CONSTRAINT `fk_clientes_cat_tipo_cliente1` FOREIGN KEY (`idTipoCliente`) REFERENCES `cat_tipo_cliente` (`idTipoCliente`),
  CONSTRAINT `fk_clientes_vendedores1` FOREIGN KEY (`idVendedor`) REFERENCES `vendedores` (`idVendedor`)
) ENGINE=InnoDB AUTO_INCREMENT=586 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `colonias`
--

DROP TABLE IF EXISTS `colonias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `colonias` (
  `codigocolonia` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  `codigopostal` varchar(5) NOT NULL,
  `codigociudad` varchar(4) DEFAULT NULL,
  `codigomunicipio` varchar(3) DEFAULT NULL,
  `codigoestado` varchar(2) NOT NULL,
  PRIMARY KEY (`codigocolonia`),
  KEY `fk_colonias_estados1_idx` (`codigoestado`),
  CONSTRAINT `fk_colonias_estados1` FOREIGN KEY (`codigoestado`) REFERENCES `estados` (`codigoestado`)
) ENGINE=InnoDB AUTO_INCREMENT=156296 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conf_min_compra`
--

DROP TABLE IF EXISTS `conf_min_compra`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conf_min_compra` (
  `keyx` bigint NOT NULL AUTO_INCREMENT,
  `idTipoCliente` int NOT NULL,
  `valorType` varchar(100) DEFAULT NULL,
  `valor` decimal(18,2) DEFAULT NULL,
  PRIMARY KEY (`keyx`),
  KEY `fk_conf_min_compra_cat_tipo_cliente1_idx` (`idTipoCliente`),
  CONSTRAINT `fk_conf_min_compra_cat_tipo_cliente1` FOREIGN KEY (`idTipoCliente`) REFERENCES `cat_tipo_cliente` (`idTipoCliente`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `constantes`
--

DROP TABLE IF EXISTS `constantes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `constantes` (
  `idConstante` bigint NOT NULL AUTO_INCREMENT,
  `createDate` datetime DEFAULT NULL,
  `active` smallint DEFAULT NULL,
  `key` varchar(100) DEFAULT NULL,
  `value` varchar(500) DEFAULT NULL,
  `value2` varchar(500) DEFAULT NULL,
  `value3` varchar(500) DEFAULT NULL,
  `value4` varchar(500) DEFAULT NULL,
  `value5` varchar(500) DEFAULT NULL,
  `value6` varchar(500) DEFAULT NULL,
  `value7` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`idConstante`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cortescaja`
--

DROP TABLE IF EXISTS `cortescaja`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cortescaja` (
  `idcortescaja` int NOT NULL AUTO_INCREMENT,
  `fecha` date NOT NULL,
  `horaapertura` time DEFAULT NULL,
  `horacierre` time DEFAULT NULL,
  `idUser` bigint NOT NULL,
  `idSucursal` smallint NOT NULL,
  `idcajas` int NOT NULL,
  `saldoinicial` decimal(18,2) DEFAULT '0.00',
  `totalefectivo` decimal(18,2) DEFAULT '0.00',
  `totaltarjeta` decimal(18,2) DEFAULT '0.00',
  `totaltransferencia` decimal(18,2) DEFAULT '0.00',
  `totalventas` decimal(18,2) DEFAULT '0.00',
  `totalgastos` decimal(18,2) DEFAULT '0.00',
  `saldofinal` decimal(18,2) DEFAULT '0.00',
  `efectivocontado` decimal(18,2) DEFAULT '0.00',
  `diferencia` decimal(18,2) DEFAULT '0.00',
  `retiroporcorte` decimal(18,2) DEFAULT NULL,
  `observaciones` text,
  `estatus` varchar(20) DEFAULT 'ABIERTO',
  `createdAt` timestamp NULL DEFAULT NULL,
  `updatedAt` timestamp NULL DEFAULT NULL,
  `idturnoscaja` int NOT NULL,
  `totalcheque` decimal(18,2) DEFAULT NULL,
  `totaldineroelectronico` decimal(18,2) DEFAULT NULL,
  PRIMARY KEY (`idcortescaja`),
  KEY `idcajas` (`idcajas`),
  KEY `IX_CortesCaja_Fecha` (`fecha`),
  KEY `IX_CortesCaja_idUser` (`idUser`),
  KEY `IX_CortesCaja_IdSucursal` (`idSucursal`),
  KEY `fk_cortescaja_turnoscaja1_idx` (`idturnoscaja`),
  CONSTRAINT `cortescaja_ibfk_1` FOREIGN KEY (`idUser`) REFERENCES `users` (`idUser`),
  CONSTRAINT `cortescaja_ibfk_2` FOREIGN KEY (`idSucursal`) REFERENCES `sucursales` (`idSucursal`),
  CONSTRAINT `cortescaja_ibfk_3` FOREIGN KEY (`idcajas`) REFERENCES `cajas` (`idcajas`),
  CONSTRAINT `fk_cortescaja_turnoscaja1` FOREIGN KEY (`idturnoscaja`) REFERENCES `turnoscaja` (`idturnoscaja`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cortescajadenominaciones`
--

DROP TABLE IF EXISTS `cortescajadenominaciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cortescajadenominaciones` (
  `idcortescajadenominaciones` int NOT NULL AUTO_INCREMENT,
  `idcortescaja` int NOT NULL,
  `tipo` varchar(20) NOT NULL,
  `valor` decimal(10,2) NOT NULL,
  `cantidad` int NOT NULL DEFAULT '0',
  `total` decimal(18,2) NOT NULL DEFAULT '0.00',
  `createdAt` timestamp NULL DEFAULT NULL,
  `updatedAt` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`idcortescajadenominaciones`),
  KEY `idcortescaja` (`idcortescaja`),
  CONSTRAINT `cortescajadenominaciones_ibfk_1` FOREIGN KEY (`idcortescaja`) REFERENCES `cortescaja` (`idcortescaja`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cortescajageneral`
--

DROP TABLE IF EXISTS `cortescajageneral`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cortescajageneral` (
  `idcortescajageneral` int NOT NULL AUTO_INCREMENT,
  `fechainicio` datetime NOT NULL,
  `fechacierre` datetime DEFAULT NULL,
  `idSucursal` smallint NOT NULL,
  `totalefectivo` decimal(18,2) DEFAULT '0.00',
  `totaltarjeta` decimal(18,2) DEFAULT '0.00',
  `totaltransferencia` decimal(18,2) DEFAULT '0.00',
  `totalventas` decimal(18,2) DEFAULT '0.00',
  `totalgastos` decimal(18,2) DEFAULT '0.00',
  `saldofinal` decimal(18,2) DEFAULT '0.00',
  `idUser` bigint DEFAULT NULL,
  `createdAt` timestamp NULL DEFAULT NULL,
  `updatedAt` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`idcortescajageneral`),
  KEY `idUser` (`idUser`),
  KEY `IX_CortesCajaGeneral_Fecha` (`fechainicio`),
  KEY `IX_CortesCajaGeneral_IdSucursal` (`idSucursal`),
  CONSTRAINT `cortescajageneral_ibfk_1` FOREIGN KEY (`idSucursal`) REFERENCES `sucursales` (`idSucursal`),
  CONSTRAINT `cortescajageneral_ibfk_2` FOREIGN KEY (`idUser`) REFERENCES `users` (`idUser`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cotizaciones`
--

DROP TABLE IF EXISTS `cotizaciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cotizaciones` (
  `idCotizacion` bigint NOT NULL AUTO_INCREMENT,
  `createDate` datetime DEFAULT NULL,
  `active` smallint DEFAULT NULL,
  `idSucursal` smallint NOT NULL,
  `idCliente` bigint NOT NULL,
  `idTipoVenta` int NOT NULL,
  `idCatStatusCotizaciones` int NOT NULL,
  `idCreateUser` bigint NOT NULL,
  `comments` varchar(5000) DEFAULT NULL,
  `subtotal` decimal(18,2) DEFAULT NULL,
  `iva` decimal(18,2) DEFAULT NULL,
  `descuento` decimal(18,2) DEFAULT NULL,
  `total` decimal(18,2) DEFAULT NULL,
  `idCotizacionNuevo` bigint DEFAULT NULL,
  `idPedido` bigint DEFAULT '0',
  PRIMARY KEY (`idCotizacion`),
  KEY `fk_pedidos_clientes_clientes1_idx` (`idCliente`),
  KEY `fk_pedidos_clientes_users1_idx` (`idCreateUser`),
  KEY `fk_pedidos_idtipoventa_idx` (`idTipoVenta`),
  KEY `fk_pedidos_clientes_sucursales1_idx` (`idSucursal`),
  KEY `fk_cotizaciones_cat_status_cotizaciones1_idx` (`idCatStatusCotizaciones`),
  CONSTRAINT `fk_cotizaciones_cat_status_cotizaciones1` FOREIGN KEY (`idCatStatusCotizaciones`) REFERENCES `cat_status_cotizaciones` (`idCatStatusCotizaciones`),
  CONSTRAINT `fk_pedidos_clientes_clientes10` FOREIGN KEY (`idCliente`) REFERENCES `clientes` (`idCliente`),
  CONSTRAINT `fk_pedidos_clientes_sucursales10` FOREIGN KEY (`idSucursal`) REFERENCES `sucursales` (`idSucursal`),
  CONSTRAINT `fk_pedidos_clientes_users10` FOREIGN KEY (`idCreateUser`) REFERENCES `users` (`idUser`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cotizaciones_detalle`
--

DROP TABLE IF EXISTS `cotizaciones_detalle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cotizaciones_detalle` (
  `idCotizacionDetalle` bigint NOT NULL AUTO_INCREMENT,
  `idCotizacion` bigint NOT NULL,
  `idProducto` bigint NOT NULL,
  `bEnvase` smallint DEFAULT NULL,
  `cantidad` decimal(18,2) DEFAULT NULL,
  `precioUnitario` decimal(18,2) DEFAULT NULL,
  `descuento` decimal(18,2) DEFAULT NULL,
  `precioConDescuento` decimal(18,2) DEFAULT NULL,
  `total` decimal(18,2) DEFAULT NULL,
  `aplicaPromo` smallint DEFAULT NULL,
  `idPromocion` bigint DEFAULT NULL,
  `promoName` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`idCotizacionDetalle`),
  KEY `fk_pedidos_clientes_detalle_productos1_idx` (`idProducto`),
  KEY `fk_cotizaciones_detalle_cotizaciones1_idx` (`idCotizacion`),
  CONSTRAINT `fk_cotizaciones_detalle_cotizaciones1` FOREIGN KEY (`idCotizacion`) REFERENCES `cotizaciones` (`idCotizacion`),
  CONSTRAINT `fk_pedidos_clientes_detalle_productos10` FOREIGN KEY (`idProducto`) REFERENCES `productos` (`idProducto`)
) ENGINE=InnoDB AUTO_INCREMENT=167 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cotizaciones_envases`
--

DROP TABLE IF EXISTS `cotizaciones_envases`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cotizaciones_envases` (
  `idCotizacionesEnvases` bigint NOT NULL AUTO_INCREMENT,
  `idCotizacion` bigint NOT NULL,
  `idProducto` bigint NOT NULL,
  `cantidad` int DEFAULT NULL,
  `valorMedida` decimal(18,2) DEFAULT NULL,
  PRIMARY KEY (`idCotizacionesEnvases`),
  KEY `fk_pedidos_envases_productos1_idx` (`idProducto`),
  KEY `fk_cotizaciones_envases_cotizaciones1_idx` (`idCotizacion`),
  CONSTRAINT `fk_cotizaciones_envases_cotizaciones1` FOREIGN KEY (`idCotizacion`) REFERENCES `cotizaciones` (`idCotizacion`),
  CONSTRAINT `fk_pedidos_envases_productos10` FOREIGN KEY (`idProducto`) REFERENCES `productos` (`idProducto`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dinero_electronico`
--

DROP TABLE IF EXISTS `dinero_electronico`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dinero_electronico` (
  `keyx` bigint NOT NULL AUTO_INCREMENT,
  `idCliente` bigint NOT NULL,
  `monto` decimal(18,2) DEFAULT NULL,
  PRIMARY KEY (`keyx`),
  KEY `fk_dinero_electronico_log_clientes1_idx` (`idCliente`),
  CONSTRAINT `fk_dinero_electronico_log_clientes10` FOREIGN KEY (`idCliente`) REFERENCES `clientes` (`idCliente`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dinero_electronico_log`
--

DROP TABLE IF EXISTS `dinero_electronico_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dinero_electronico_log` (
  `keyx` bigint NOT NULL AUTO_INCREMENT,
  `createDate` datetime DEFAULT NULL,
  `idCliente` bigint NOT NULL,
  `monto` decimal(18,2) DEFAULT NULL,
  `motivoDesc` varchar(5000) DEFAULT NULL,
  PRIMARY KEY (`keyx`),
  KEY `fk_dinero_electronico_log_clientes1_idx` (`idCliente`),
  CONSTRAINT `fk_dinero_electronico_log_clientes1` FOREIGN KEY (`idCliente`) REFERENCES `clientes` (`idCliente`)
) ENGINE=InnoDB AUTO_INCREMENT=121 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `entradas_salidas_detalle`
--

DROP TABLE IF EXISTS `entradas_salidas_detalle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `entradas_salidas_detalle` (
  `idEntradasSalidasDetalle` bigint NOT NULL AUTO_INCREMENT,
  `idEntradasSalidasH` bigint NOT NULL,
  `idProducto` bigint NOT NULL,
  `cantidad` decimal(18,2) DEFAULT NULL,
  `cantidadEnviada` decimal(18,2) DEFAULT NULL,
  `cantidadEnviadaReal` decimal(18,2) DEFAULT NULL,
  `cantidadRecibida` decimal(18,2) DEFAULT NULL,
  `cantidadRecibidaReal` decimal(18,2) DEFAULT NULL,
  `idStatusESDetalle` int DEFAULT NULL,
  PRIMARY KEY (`idEntradasSalidasDetalle`),
  KEY `fk_entradas_salidas_detalle_entradas_salidas_header1_idx` (`idEntradasSalidasH`),
  KEY `fk_entradas_salidas_detalle_productos1_idx` (`idProducto`),
  CONSTRAINT `fk_entradas_salidas_detalle_entradas_salidas_header1` FOREIGN KEY (`idEntradasSalidasH`) REFERENCES `entradas_salidas_header` (`idEntradasSalidasH`),
  CONSTRAINT `fk_entradas_salidas_detalle_productos1` FOREIGN KEY (`idProducto`) REFERENCES `productos` (`idProducto`)
) ENGINE=InnoDB AUTO_INCREMENT=125 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `entradas_salidas_detalle_status`
--

DROP TABLE IF EXISTS `entradas_salidas_detalle_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `entradas_salidas_detalle_status` (
  `idStatusESDetalle` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `description` varchar(100) DEFAULT NULL,
  `active` smallint DEFAULT NULL,
  PRIMARY KEY (`idStatusESDetalle`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `entradas_salidas_header`
--

DROP TABLE IF EXISTS `entradas_salidas_header`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `entradas_salidas_header` (
  `idEntradasSalidasH` bigint NOT NULL AUTO_INCREMENT,
  `createDate` datetime DEFAULT NULL,
  `active` smallint DEFAULT NULL,
  `idCreateUser` bigint NOT NULL,
  `idCatMov` int NOT NULL,
  `idEntradaSalidaStatus` smallint NOT NULL,
  `idOrigenFrom` bigint NOT NULL,
  `idOrigenTo` bigint DEFAULT NULL,
  `comments` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`idEntradasSalidasH`),
  KEY `fk_entradas_salidas_header_cat_mov_entrada_salida1_idx` (`idCatMov`),
  KEY `fk_entradas_salidas_header_entradas_salidas_status1_idx` (`idEntradaSalidaStatus`),
  KEY `fk_entradas_salidas_header_users1_idx` (`idCreateUser`),
  KEY `fk_entradas_salidas_header_origenes1_idx` (`idOrigenFrom`),
  CONSTRAINT `fk_entradas_salidas_header_cat_mov_entrada_salida1` FOREIGN KEY (`idCatMov`) REFERENCES `cat_mov_entrada_salida` (`idCatMov`),
  CONSTRAINT `fk_entradas_salidas_header_entradas_salidas_status1` FOREIGN KEY (`idEntradaSalidaStatus`) REFERENCES `entradas_salidas_status` (`idEntradaSalidaStatus`),
  CONSTRAINT `fk_entradas_salidas_header_origenes1` FOREIGN KEY (`idOrigenFrom`) REFERENCES `origenes` (`idOrigen`),
  CONSTRAINT `fk_entradas_salidas_header_users1` FOREIGN KEY (`idCreateUser`) REFERENCES `users` (`idUser`)
) ENGINE=InnoDB AUTO_INCREMENT=72 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `entradas_salidas_status`
--

DROP TABLE IF EXISTS `entradas_salidas_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `entradas_salidas_status` (
  `idEntradaSalidaStatus` smallint NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `description` varchar(100) DEFAULT NULL,
  `active` smallint DEFAULT NULL,
  PRIMARY KEY (`idEntradaSalidaStatus`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `estados`
--

DROP TABLE IF EXISTS `estados`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `estados` (
  `codigoestado` varchar(2) NOT NULL,
  `nombre` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`codigoestado`),
  UNIQUE KEY `codigoestado_UNIQUE` (`codigoestado`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `formas_pago`
--

DROP TABLE IF EXISTS `formas_pago`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `formas_pago` (
  `idformaspago` int NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(45) DEFAULT NULL,
  `activo` tinyint DEFAULT '1',
  PRIMARY KEY (`idformaspago`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `formulas_prod_base`
--

DROP TABLE IF EXISTS `formulas_prod_base`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `formulas_prod_base` (
  `idFormula` bigint NOT NULL AUTO_INCREMENT,
  `createDate` datetime DEFAULT NULL,
  `active` smallint DEFAULT NULL,
  `idProductoBase` bigint NOT NULL,
  `idMateriaPrima` bigint NOT NULL,
  `cantidad` float DEFAULT NULL,
  PRIMARY KEY (`idFormula`),
  KEY `fk_formulas_prod_base_productos1_idx` (`idProductoBase`),
  KEY `fk_formulas_prod_base_productos2_idx` (`idMateriaPrima`),
  CONSTRAINT `fk_formulas_prod_base_productos1` FOREIGN KEY (`idProductoBase`) REFERENCES `productos` (`idProducto`),
  CONSTRAINT `fk_formulas_prod_base_productos2` FOREIGN KEY (`idMateriaPrima`) REFERENCES `productos` (`idProducto`)
) ENGINE=InnoDB AUTO_INCREMENT=331 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `giros`
--

DROP TABLE IF EXISTS `giros`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `giros` (
  `idGiro` int NOT NULL AUTO_INCREMENT,
  `createDate` datetime DEFAULT NULL,
  `name` varchar(500) DEFAULT NULL,
  `active` smallint DEFAULT NULL,
  PRIMARY KEY (`idGiro`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `impresora_tickets`
--

DROP TABLE IF EXISTS `impresora_tickets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `impresora_tickets` (
  `idimpresoratickets` int NOT NULL AUTO_INCREMENT,
  `nombrenegocio` varchar(45) DEFAULT NULL,
  `razonsocial` varchar(45) DEFAULT NULL,
  `rfc` varchar(13) DEFAULT NULL,
  `direccion` varchar(150) DEFAULT NULL,
  `telefono` varchar(100) DEFAULT NULL,
  `agradecimiento` varchar(150) DEFAULT NULL,
  `infoadicional` varchar(150) DEFAULT NULL,
  `idSucursal` smallint NOT NULL,
  PRIMARY KEY (`idimpresoratickets`),
  KEY `fk_impresora_tickets_sucursales1_idx` (`idSucursal`),
  CONSTRAINT `fk_impresora_tickets_sucursales1` FOREIGN KEY (`idSucursal`) REFERENCES `sucursales` (`idSucursal`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `insumos_productos`
--

DROP TABLE IF EXISTS `insumos_productos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `insumos_productos` (
  `keyx` bigint NOT NULL AUTO_INCREMENT,
  `createDate` datetime DEFAULT NULL,
  `active` smallint DEFAULT NULL,
  `idProducto` bigint NOT NULL,
  `idInsumo` bigint NOT NULL,
  PRIMARY KEY (`keyx`),
  KEY `fk_insumos_prod_productos1_idx` (`idProducto`),
  KEY `fk_insumos_productos_productos1_idx` (`idInsumo`),
  CONSTRAINT `fk_insumos_prod_productos1` FOREIGN KEY (`idProducto`) REFERENCES `productos` (`idProducto`),
  CONSTRAINT `fk_insumos_productos_productos1` FOREIGN KEY (`idInsumo`) REFERENCES `productos` (`idProducto`)
) ENGINE=InnoDB AUTO_INCREMENT=395 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `inventario_fisico`
--

DROP TABLE IF EXISTS `inventario_fisico`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `inventario_fisico` (
  `idInventarioFisico` bigint NOT NULL AUTO_INCREMENT,
  `createDate` datetime DEFAULT NULL,
  `active` smallint DEFAULT NULL,
  `idCreateUser` bigint NOT NULL,
  `idOrigen` bigint NOT NULL,
  `fechaInicio` datetime DEFAULT NULL,
  `fechaCierre` datetime DEFAULT NULL,
  `idStatus` int DEFAULT NULL,
  `observaciones` varchar(500) DEFAULT NULL,
  `bFaltante` smallint DEFAULT NULL,
  `bSobrante` smallint DEFAULT NULL,
  `bAllOK` smallint DEFAULT NULL,
  PRIMARY KEY (`idInventarioFisico`),
  KEY `fk_inventario_fisico_origenes1_idx` (`idOrigen`),
  KEY `fk_inventario_fisico_users1_idx` (`idCreateUser`),
  CONSTRAINT `fk_inventario_fisico_origenes1` FOREIGN KEY (`idOrigen`) REFERENCES `origenes` (`idOrigen`),
  CONSTRAINT `fk_inventario_fisico_users1` FOREIGN KEY (`idCreateUser`) REFERENCES `users` (`idUser`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `inventario_fisico_detalle`
--

DROP TABLE IF EXISTS `inventario_fisico_detalle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `inventario_fisico_detalle` (
  `keyx` bigint NOT NULL AUTO_INCREMENT,
  `createDate` datetime DEFAULT NULL,
  `idInventarioFisico` bigint NOT NULL,
  `idCreateUser` bigint NOT NULL,
  `fechaConteo` datetime DEFAULT NULL,
  `idProducto` bigint NOT NULL,
  `cantidadSistema` decimal(18,2) DEFAULT NULL,
  `cantidadFisica` decimal(18,2) DEFAULT NULL,
  `diferencia` decimal(18,2) DEFAULT NULL,
  `precio` decimal(18,2) DEFAULT NULL,
  `total` decimal(18,2) DEFAULT NULL,
  `totalFisico` decimal(18,2) DEFAULT NULL,
  `observaciones` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`keyx`),
  KEY `fk_inventario_fisico_users1_idx` (`idCreateUser`),
  KEY `fk_inventario_fisico_detalle_inventario_fisico1_idx` (`idInventarioFisico`),
  KEY `fk_inventario_fisico_detalle_productos1_idx` (`idProducto`),
  CONSTRAINT `fk_inventario_fisico_detalle_inventario_fisico1` FOREIGN KEY (`idInventarioFisico`) REFERENCES `inventario_fisico` (`idInventarioFisico`),
  CONSTRAINT `fk_inventario_fisico_detalle_productos1` FOREIGN KEY (`idProducto`) REFERENCES `productos` (`idProducto`),
  CONSTRAINT `fk_inventario_fisico_users10` FOREIGN KEY (`idCreateUser`) REFERENCES `users` (`idUser`)
) ENGINE=InnoDB AUTO_INCREMENT=465 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `menupermisos`
--

DROP TABLE IF EXISTS `menupermisos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `menupermisos` (
  `idMenuPermiso` bigint NOT NULL AUTO_INCREMENT,
  `createDate` datetime DEFAULT NULL,
  `typeRelation` varchar(2) DEFAULT NULL,
  `idRelation` bigint DEFAULT NULL,
  `idMenu` bigint NOT NULL,
  `active` smallint DEFAULT NULL,
  PRIMARY KEY (`idMenuPermiso`),
  KEY `fk_menus_idmenu_menupermisos_idx` (`idMenu`),
  CONSTRAINT `fk_menus_idmenu_menupermisos` FOREIGN KEY (`idMenu`) REFERENCES `menus` (`idMenu`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=732 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `menus`
--

DROP TABLE IF EXISTS `menus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `menus` (
  `idMenu` bigint NOT NULL AUTO_INCREMENT,
  `createDate` datetime DEFAULT NULL,
  `idMenuPadre` bigint DEFAULT NULL,
  `lugar` float DEFAULT NULL,
  `name` varchar(45) DEFAULT NULL,
  `description` varchar(500) DEFAULT NULL,
  `icon` varchar(500) DEFAULT NULL,
  `linkCat` varchar(1000) DEFAULT NULL,
  `linkList` varchar(1000) DEFAULT NULL,
  `imgDash` varchar(1000) DEFAULT NULL,
  `imgDashSize` float DEFAULT NULL,
  `idAplication` int DEFAULT NULL,
  `active` smallint DEFAULT NULL,
  PRIMARY KEY (`idMenu`)
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `metodos_pago_detalle`
--

DROP TABLE IF EXISTS `metodos_pago_detalle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `metodos_pago_detalle` (
  `idMetodosPagoDetalle` bigint NOT NULL AUTO_INCREMENT,
  `efectivo` decimal(18,2) DEFAULT NULL,
  `recibido` decimal(18,2) DEFAULT NULL,
  `cambio` decimal(18,2) DEFAULT NULL,
  `tarjeta` decimal(18,2) DEFAULT NULL,
  `transferencia` decimal(18,2) DEFAULT NULL,
  `total` decimal(18,2) DEFAULT NULL,
  `referenciaTarjeta` varchar(45) DEFAULT NULL,
  `referenciaTransferencia` varchar(45) DEFAULT NULL,
  `fechaTransferencia` date DEFAULT NULL,
  `cheque` decimal(18,2) DEFAULT NULL,
  `fechaDeposito` date DEFAULT NULL,
  `dineroElectronico` decimal(18,2) DEFAULT NULL,
  PRIMARY KEY (`idMetodosPagoDetalle`)
) ENGINE=InnoDB AUTO_INCREMENT=413 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `movimientos_caja`
--

DROP TABLE IF EXISTS `movimientos_caja`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `movimientos_caja` (
  `idmovimientoscaja` bigint NOT NULL AUTO_INCREMENT,
  `fecha` datetime DEFAULT NULL,
  `tipo` enum('INGRESO','EGRESO') DEFAULT NULL,
  `monto` decimal(10,2) DEFAULT NULL,
  `idcatmovimientos` int NOT NULL,
  `idformaspago` int NOT NULL,
  `idUser` bigint NOT NULL,
  `idturnoscaja` int NOT NULL,
  `idcajas` int NOT NULL,
  `observaciones` varchar(500) DEFAULT NULL,
  `createdAt` timestamp NULL DEFAULT NULL,
  `updatedAt` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`idmovimientoscaja`),
  KEY `fk_movimientos_caja_cat_movimientos1_idx` (`idcatmovimientos`),
  KEY `fk_movimientos_caja_formas_pago1_idx` (`idformaspago`),
  KEY `fk_movimientos_caja_users1_idx` (`idUser`),
  KEY `fk_movimientos_caja_turnoscaja1_idx` (`idturnoscaja`),
  KEY `fk_movimientos_caja_cajas1_idx` (`idcajas`),
  CONSTRAINT `fk_movimientos_caja_cajas1` FOREIGN KEY (`idcajas`) REFERENCES `cajas` (`idcajas`),
  CONSTRAINT `fk_movimientos_caja_cat_movimientos1` FOREIGN KEY (`idcatmovimientos`) REFERENCES `cat_movimientos_caja` (`idcatmovimientoscaja`),
  CONSTRAINT `fk_movimientos_caja_formas_pago1` FOREIGN KEY (`idformaspago`) REFERENCES `formas_pago` (`idformaspago`),
  CONSTRAINT `fk_movimientos_caja_turnoscaja1` FOREIGN KEY (`idturnoscaja`) REFERENCES `turnoscaja` (`idturnoscaja`),
  CONSTRAINT `fk_movimientos_caja_users1` FOREIGN KEY (`idUser`) REFERENCES `users` (`idUser`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `municipios`
--

DROP TABLE IF EXISTS `municipios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `municipios` (
  `idmunicipios` int NOT NULL AUTO_INCREMENT,
  `codigomunicipio` varchar(3) DEFAULT NULL,
  `nombre` varchar(45) DEFAULT NULL,
  `codigoestado` varchar(2) NOT NULL,
  PRIMARY KEY (`idmunicipios`),
  KEY `fk_municipios_estados1_idx` (`codigoestado`),
  CONSTRAINT `fk_municipios_estados1` FOREIGN KEY (`codigoestado`) REFERENCES `estados` (`codigoestado`)
) ENGINE=InnoDB AUTO_INCREMENT=2479 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `orden_compra`
--

DROP TABLE IF EXISTS `orden_compra`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orden_compra` (
  `idOrdenDeCompra` bigint NOT NULL AUTO_INCREMENT,
  `createDate` datetime DEFAULT NULL,
  `idProveedor` bigint NOT NULL,
  `idOrdenCompraStatus` smallint NOT NULL,
  `costoTotal` decimal(18,2) DEFAULT NULL,
  `idCreateUser` bigint NOT NULL,
  `fechaPedido` date DEFAULT NULL,
  `fechaRecepcion` date DEFAULT NULL,
  `numeroFactura` varchar(45) DEFAULT NULL,
  `active` smallint DEFAULT NULL,
  PRIMARY KEY (`idOrdenDeCompra`),
  KEY `fk_orden_compra_proveedores1_idx` (`idProveedor`),
  KEY `fk_orden_compra_orden_compra_status1_idx` (`idOrdenCompraStatus`),
  KEY `fk_orden_compra_users1_idx` (`idCreateUser`),
  CONSTRAINT `fk_orden_compra_orden_compra_status1` FOREIGN KEY (`idOrdenCompraStatus`) REFERENCES `orden_compra_status` (`idOrdenCompraStatus`),
  CONSTRAINT `fk_orden_compra_proveedores1` FOREIGN KEY (`idProveedor`) REFERENCES `proveedores` (`idProveedor`),
  CONSTRAINT `fk_orden_compra_users1` FOREIGN KEY (`idCreateUser`) REFERENCES `users` (`idUser`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `orden_compra_detalle`
--

DROP TABLE IF EXISTS `orden_compra_detalle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orden_compra_detalle` (
  `idOrdenDeCompraDetalle` bigint NOT NULL AUTO_INCREMENT,
  `idOrdenDeCompra` bigint NOT NULL,
  `idProducto` bigint NOT NULL,
  `cantidad` decimal(18,2) DEFAULT NULL,
  `costo` decimal(18,2) DEFAULT NULL,
  `importe` decimal(18,2) DEFAULT NULL,
  `active` smallint DEFAULT NULL,
  PRIMARY KEY (`idOrdenDeCompraDetalle`),
  KEY `fk_orden_compra_detalle_orden_compra1_idx` (`idOrdenDeCompra`),
  KEY `fk_orden_compra_detalle_productos1_idx` (`idProducto`),
  CONSTRAINT `fk_orden_compra_detalle_orden_compra1` FOREIGN KEY (`idOrdenDeCompra`) REFERENCES `orden_compra` (`idOrdenDeCompra`),
  CONSTRAINT `fk_orden_compra_detalle_productos1` FOREIGN KEY (`idProducto`) REFERENCES `productos` (`idProducto`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `orden_compra_status`
--

DROP TABLE IF EXISTS `orden_compra_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orden_compra_status` (
  `idOrdenCompraStatus` smallint NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `description` varchar(100) DEFAULT NULL,
  `active` smallint DEFAULT NULL,
  PRIMARY KEY (`idOrdenCompraStatus`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `origenes`
--

DROP TABLE IF EXISTS `origenes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `origenes` (
  `idOrigen` bigint NOT NULL AUTO_INCREMENT,
  `nombre` varchar(500) DEFAULT NULL,
  `idRelacion` bigint DEFAULT NULL,
  `idCatRelacionOrigen` smallint NOT NULL,
  `active` smallint DEFAULT NULL,
  PRIMARY KEY (`idOrigen`),
  KEY `fk_origenes_cat_relacion_origen1_idx` (`idCatRelacionOrigen`),
  CONSTRAINT `fk_origenes_cat_relacion_origen1` FOREIGN KEY (`idCatRelacionOrigen`) REFERENCES `cat_relacion_origen` (`idCatRelacionOrigen`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `origenes_config`
--

DROP TABLE IF EXISTS `origenes_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `origenes_config` (
  `keyx` bigint NOT NULL AUTO_INCREMENT,
  `createDate` datetime DEFAULT NULL,
  `idUser` bigint NOT NULL,
  `idOrigen` bigint NOT NULL,
  `bPrincipal` smallint DEFAULT NULL,
  PRIMARY KEY (`keyx`),
  KEY `fk_sucursalesconfig_users1_idx` (`idUser`),
  KEY `fk_origenes_config_origenes1_idx` (`idOrigen`),
  CONSTRAINT `fk_origenes_config_origenes1` FOREIGN KEY (`idOrigen`) REFERENCES `origenes` (`idOrigen`),
  CONSTRAINT `fk_sucursalesconfig_users10` FOREIGN KEY (`idUser`) REFERENCES `users` (`idUser`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=94 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `origenes_responsables`
--

DROP TABLE IF EXISTS `origenes_responsables`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `origenes_responsables` (
  `idOrigenesResponsables` bigint NOT NULL AUTO_INCREMENT,
  `createDate` datetime DEFAULT NULL,
  `idOrigen` bigint NOT NULL,
  `idUser` bigint NOT NULL,
  `bPrincipal` smallint DEFAULT NULL,
  `idCreateUser` bigint NOT NULL,
  PRIMARY KEY (`idOrigenesResponsables`),
  KEY `fk_origenes_responsables_origenes1_idx` (`idOrigen`),
  KEY `fk_origenes_responsables_users1_idx` (`idUser`),
  KEY `fk_origenes_responsables_users2_idx` (`idCreateUser`),
  CONSTRAINT `fk_origenes_responsables_origenes1` FOREIGN KEY (`idOrigen`) REFERENCES `origenes` (`idOrigen`),
  CONSTRAINT `fk_origenes_responsables_users1` FOREIGN KEY (`idUser`) REFERENCES `users` (`idUser`),
  CONSTRAINT `fk_origenes_responsables_users2` FOREIGN KEY (`idCreateUser`) REFERENCES `users` (`idUser`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pagos`
--

DROP TABLE IF EXISTS `pagos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pagos` (
  `idPago` bigint NOT NULL AUTO_INCREMENT,
  `createDate` datetime DEFAULT NULL,
  `active` smallint DEFAULT NULL,
  `idMetodosPagoDetalle` bigint NOT NULL,
  `idVenta` bigint NOT NULL,
  `idCreateUser` bigint NOT NULL,
  `total` decimal(18,2) DEFAULT NULL,
  PRIMARY KEY (`idPago`),
  KEY `fk_pagos_ventas1_idx` (`idVenta`),
  KEY `fk_pagos_users1_idx` (`idCreateUser`),
  KEY `fk_pagos_pagos_detalle1_idx` (`idMetodosPagoDetalle`),
  CONSTRAINT `fk_pagos_pagos_detalle1` FOREIGN KEY (`idMetodosPagoDetalle`) REFERENCES `metodos_pago_detalle` (`idMetodosPagoDetalle`),
  CONSTRAINT `fk_pagos_users1` FOREIGN KEY (`idCreateUser`) REFERENCES `users` (`idUser`),
  CONSTRAINT `fk_pagos_ventas1` FOREIGN KEY (`idVenta`) REFERENCES `ventas` (`idVenta`)
) ENGINE=InnoDB AUTO_INCREMENT=421 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pedidos_clientes`
--

DROP TABLE IF EXISTS `pedidos_clientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pedidos_clientes` (
  `idPedido` bigint NOT NULL AUTO_INCREMENT,
  `createDate` datetime DEFAULT NULL,
  `active` smallint DEFAULT NULL,
  `idSucursal` smallint NOT NULL,
  `idCliente` bigint NOT NULL,
  `idCatStatusPedidosClientes` int NOT NULL,
  `fechaEntrega` date DEFAULT NULL,
  `fechaEntregada` date DEFAULT NULL,
  `idRepartidor` bigint NOT NULL DEFAULT '0',
  `idTipoVenta` int NOT NULL,
  `idCreateUser` bigint NOT NULL,
  `comments` varchar(5000) DEFAULT NULL,
  `subtotal` decimal(18,2) DEFAULT NULL,
  `iva` decimal(18,2) DEFAULT NULL,
  `descuento` decimal(18,2) DEFAULT NULL,
  `total` decimal(18,2) DEFAULT NULL,
  `idPedidoNuevo` bigint DEFAULT NULL,
  PRIMARY KEY (`idPedido`),
  KEY `fk_pedidos_clientes_clientes1_idx` (`idCliente`),
  KEY `fk_pedidos_clientes_cat_status_pedidos_clientes1_idx` (`idCatStatusPedidosClientes`),
  KEY `fk_pedidos_clientes_users1_idx` (`idCreateUser`),
  KEY `fk_pedidos_idrepartidor_idx` (`idRepartidor`),
  KEY `fk_pedidos_idtipoventa_idx` (`idTipoVenta`),
  KEY `fk_pedidos_clientes_sucursales1_idx` (`idSucursal`),
  CONSTRAINT `fk_pedidos_clientes_cat_status_pedidos_clientes1` FOREIGN KEY (`idCatStatusPedidosClientes`) REFERENCES `cat_status_pedidos_clientes` (`idCatStatusPedidosClientes`),
  CONSTRAINT `fk_pedidos_clientes_clientes1` FOREIGN KEY (`idCliente`) REFERENCES `clientes` (`idCliente`),
  CONSTRAINT `fk_pedidos_clientes_sucursales1` FOREIGN KEY (`idSucursal`) REFERENCES `sucursales` (`idSucursal`),
  CONSTRAINT `fk_pedidos_clientes_users1` FOREIGN KEY (`idCreateUser`) REFERENCES `users` (`idUser`)
) ENGINE=InnoDB AUTO_INCREMENT=90 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pedidos_clientes_detalle`
--

DROP TABLE IF EXISTS `pedidos_clientes_detalle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pedidos_clientes_detalle` (
  `idPedidoDetalle` bigint NOT NULL AUTO_INCREMENT,
  `idPedido` bigint NOT NULL,
  `idProducto` bigint NOT NULL,
  `bEnvase` smallint DEFAULT NULL,
  `cantidad` decimal(18,2) DEFAULT NULL,
  `precioUnitario` decimal(18,2) DEFAULT NULL,
  `descuento` decimal(18,2) DEFAULT NULL,
  `precioConDescuento` decimal(18,2) DEFAULT NULL,
  `total` decimal(18,2) DEFAULT NULL,
  `aplicaPromo` smallint DEFAULT NULL,
  `idPromocion` bigint DEFAULT NULL,
  `promoName` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`idPedidoDetalle`),
  KEY `fk_pedidos_clientes_detalle_productos1_idx` (`idProducto`),
  KEY `fk_pedidos_clientes_detalle_pedidos_clientes1_idx` (`idPedido`),
  CONSTRAINT `fk_pedidos_clientes_detalle_pedidos_clientes1` FOREIGN KEY (`idPedido`) REFERENCES `pedidos_clientes` (`idPedido`),
  CONSTRAINT `fk_pedidos_clientes_detalle_productos1` FOREIGN KEY (`idProducto`) REFERENCES `productos` (`idProducto`)
) ENGINE=InnoDB AUTO_INCREMENT=437 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pedidos_envases`
--

DROP TABLE IF EXISTS `pedidos_envases`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pedidos_envases` (
  `idPedidosEnvases` bigint NOT NULL AUTO_INCREMENT,
  `idPedido` bigint NOT NULL,
  `idProducto` bigint NOT NULL,
  `cantidad` int DEFAULT NULL,
  `valorMedida` decimal(18,2) DEFAULT NULL,
  PRIMARY KEY (`idPedidosEnvases`),
  KEY `fk_pedidos_envases_pedidos_clientes1_idx` (`idPedido`),
  KEY `fk_pedidos_envases_productos1_idx` (`idProducto`),
  CONSTRAINT `fk_pedidos_envases_pedidos_clientes1` FOREIGN KEY (`idPedido`) REFERENCES `pedidos_clientes` (`idPedido`),
  CONSTRAINT `fk_pedidos_envases_productos1` FOREIGN KEY (`idProducto`) REFERENCES `productos` (`idProducto`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `prod_prod_agranel`
--

DROP TABLE IF EXISTS `prod_prod_agranel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `prod_prod_agranel` (
  `idProdProdAgranelH` bigint NOT NULL AUTO_INCREMENT,
  `createDate` datetime DEFAULT NULL,
  `idCreateUser` bigint NOT NULL,
  `active` smallint DEFAULT NULL,
  `idCatStatusProd` int NOT NULL,
  `costoTotal` decimal(18,2) DEFAULT NULL,
  PRIMARY KEY (`idProdProdAgranelH`),
  KEY `fk_prod_prod_agranel_users1_idx` (`idCreateUser`),
  KEY `fk_prod_prod_agranel_cat_status_prod1_idx` (`idCatStatusProd`),
  CONSTRAINT `fk_prod_prod_agranel_cat_status_prod10` FOREIGN KEY (`idCatStatusProd`) REFERENCES `cat_status_prod` (`idCatStatusProd`),
  CONSTRAINT `fk_prod_prod_agranel_users10` FOREIGN KEY (`idCreateUser`) REFERENCES `users` (`idUser`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `prod_prod_agranel_detalle`
--

DROP TABLE IF EXISTS `prod_prod_agranel_detalle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `prod_prod_agranel_detalle` (
  `idProdProdAgranelDetalle` bigint NOT NULL AUTO_INCREMENT,
  `createDate` datetime DEFAULT NULL,
  `active` smallint DEFAULT NULL,
  `idProdProdAgranelH` bigint NOT NULL,
  `idProductoAgranel` bigint NOT NULL,
  `cantidad` decimal(18,2) DEFAULT NULL,
  `costo` decimal(18,2) DEFAULT NULL,
  `costoTotal` decimal(18,2) DEFAULT NULL,
  `bOK` smallint DEFAULT NULL,
  PRIMARY KEY (`idProdProdAgranelDetalle`),
  KEY `fk_prod_prod_agranel_productos1_idx` (`idProductoAgranel`),
  KEY `fk_prod_prod_agranel_detalle_prod_prod_base1_idx` (`idProdProdAgranelH`),
  CONSTRAINT `fk_prod_prod_agranel_detalle_prod_prod_base10` FOREIGN KEY (`idProdProdAgranelH`) REFERENCES `prod_prod_agranel` (`idProdProdAgranelH`),
  CONSTRAINT `fk_prod_prod_agranel_productos100` FOREIGN KEY (`idProductoAgranel`) REFERENCES `productos` (`idProducto`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `prod_prod_agranel_stock`
--

DROP TABLE IF EXISTS `prod_prod_agranel_stock`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `prod_prod_agranel_stock` (
  `keyx` bigint NOT NULL AUTO_INCREMENT,
  `idProdProdAgranelDetalle` bigint NOT NULL,
  `idStock` bigint NOT NULL,
  `cantidadConsumida` decimal(18,2) DEFAULT NULL,
  `costoUnitario` decimal(18,2) DEFAULT NULL,
  `costoTotal` decimal(18,2) DEFAULT NULL,
  PRIMARY KEY (`keyx`),
  KEY `fk_prod_prod_base_stock_stocklog1_idx` (`idStock`),
  KEY `fk_prod_prod_base_stock_prod_prod_base_detalle1_idx` (`idProdProdAgranelDetalle`),
  CONSTRAINT `fk_prod_prod_agranel_stock_prod_prod_base_detalle10` FOREIGN KEY (`idProdProdAgranelDetalle`) REFERENCES `prod_prod_agranel_detalle` (`idProdProdAgranelDetalle`),
  CONSTRAINT `fk_prod_prod_agranel_stock_stocklog10` FOREIGN KEY (`idStock`) REFERENCES `stocklog` (`idStock`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `prod_prod_base_detalle`
--

DROP TABLE IF EXISTS `prod_prod_base_detalle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `prod_prod_base_detalle` (
  `idProdProdBaseDetalle` bigint NOT NULL AUTO_INCREMENT,
  `createDate` datetime DEFAULT NULL,
  `active` smallint DEFAULT NULL,
  `idStatus` int NOT NULL,
  `idProductoBase` bigint NOT NULL,
  `cantidad` decimal(18,2) DEFAULT NULL,
  `cantProducida` decimal(18,2) DEFAULT NULL,
  `costo` decimal(18,2) DEFAULT NULL,
  `costoTotal` decimal(18,2) DEFAULT NULL,
  `bOK` smallint DEFAULT NULL,
  `idCreateUser` bigint NOT NULL,
  `comments` varchar(10000) DEFAULT NULL,
  PRIMARY KEY (`idProdProdBaseDetalle`),
  KEY `fk_prod_prod_base_productos1_idx` (`idProductoBase`),
  KEY `fk_prod_prod_base_detalle_cast_status_prod_base1_idx` (`idStatus`),
  KEY `fk_prod_prod_base_detalle_users1_idx` (`idCreateUser`),
  CONSTRAINT `fk_prod_prod_base_detalle_cast_status_prod_base1` FOREIGN KEY (`idStatus`) REFERENCES `cat_status_prod_base` (`idStatus`),
  CONSTRAINT `fk_prod_prod_base_detalle_users1` FOREIGN KEY (`idCreateUser`) REFERENCES `users` (`idUser`),
  CONSTRAINT `fk_prod_prod_base_productos10` FOREIGN KEY (`idProductoBase`) REFERENCES `productos` (`idProducto`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `prod_prod_base_stock`
--

DROP TABLE IF EXISTS `prod_prod_base_stock`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `prod_prod_base_stock` (
  `keyx` bigint NOT NULL AUTO_INCREMENT,
  `idProdProdBaseDetalle` bigint NOT NULL,
  `idStock` bigint DEFAULT NULL,
  `idProducto` bigint DEFAULT NULL,
  `cantidadDisponible` decimal(18,2) DEFAULT NULL,
  `cantidadConsumida` decimal(18,2) DEFAULT NULL,
  `costoUnitario` decimal(18,2) DEFAULT NULL,
  `costoTotal` decimal(18,2) DEFAULT NULL,
  `bOK` smallint DEFAULT NULL,
  PRIMARY KEY (`keyx`),
  KEY `fk_prod_prod_base_stock_prod_prod_base_detalle1_idx` (`idProdProdBaseDetalle`),
  CONSTRAINT `fk_prod_prod_base_stock_prod_prod_base_detalle1` FOREIGN KEY (`idProdProdBaseDetalle`) REFERENCES `prod_prod_base_detalle` (`idProdProdBaseDetalle`)
) ENGINE=InnoDB AUTO_INCREMENT=88 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `prod_prod_final`
--

DROP TABLE IF EXISTS `prod_prod_final`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `prod_prod_final` (
  `idProdProdFinalH` bigint NOT NULL AUTO_INCREMENT,
  `createDate` datetime DEFAULT NULL,
  `idCreateUser` bigint NOT NULL,
  `active` smallint DEFAULT NULL,
  `idCatStatusProd` int NOT NULL,
  `costoTotal` decimal(18,2) DEFAULT NULL,
  PRIMARY KEY (`idProdProdFinalH`),
  KEY `fk_prod_prod_final_users1_idx` (`idCreateUser`),
  KEY `fk_prod_prod_final_cat_status_prod1_idx` (`idCatStatusProd`),
  CONSTRAINT `fk_prod_prod_final_cat_status_prod100` FOREIGN KEY (`idCatStatusProd`) REFERENCES `cat_status_prod` (`idCatStatusProd`),
  CONSTRAINT `fk_prod_prod_final_users100` FOREIGN KEY (`idCreateUser`) REFERENCES `users` (`idUser`)
) ENGINE=InnoDB AUTO_INCREMENT=75 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `prod_prod_final_detalle`
--

DROP TABLE IF EXISTS `prod_prod_final_detalle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `prod_prod_final_detalle` (
  `idProdProdFinalDetalle` bigint NOT NULL AUTO_INCREMENT,
  `createDate` datetime DEFAULT NULL,
  `active` smallint DEFAULT NULL,
  `idProdProdFinalH` bigint NOT NULL,
  `idProductoFinal` bigint NOT NULL,
  `cantidad` decimal(18,2) DEFAULT NULL,
  `costo` decimal(18,2) DEFAULT NULL,
  `costoTotal` decimal(18,2) DEFAULT NULL,
  PRIMARY KEY (`idProdProdFinalDetalle`),
  KEY `fk_prod_prod_final_productos1_idx` (`idProductoFinal`),
  KEY `fk_prod_prod_final_detalle_prod_prod_base1_idx` (`idProdProdFinalH`),
  CONSTRAINT `fk_prod_prod_final_detalle_prod_prod_base100` FOREIGN KEY (`idProdProdFinalH`) REFERENCES `prod_prod_final` (`idProdProdFinalH`),
  CONSTRAINT `fk_prod_prod_final_productos1000` FOREIGN KEY (`idProductoFinal`) REFERENCES `productos` (`idProducto`)
) ENGINE=InnoDB AUTO_INCREMENT=109 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `prod_prod_final_insumos_stock`
--

DROP TABLE IF EXISTS `prod_prod_final_insumos_stock`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `prod_prod_final_insumos_stock` (
  `keyx` bigint NOT NULL AUTO_INCREMENT,
  `idProdProdFinalDetalle` bigint NOT NULL,
  `idStock` bigint NOT NULL,
  `cantidadDisponible` decimal(18,2) DEFAULT NULL,
  `cantidadConsumida` decimal(18,2) DEFAULT NULL,
  `costoUnitario` decimal(18,2) DEFAULT NULL,
  `costoTotal` decimal(18,2) DEFAULT NULL,
  PRIMARY KEY (`keyx`),
  KEY `fk_prod_prod_final_insumos_stock_prod_prod_final_detalle1_idx` (`idProdProdFinalDetalle`),
  KEY `fk_prod_prod_final_insumos_stock_stocklog1_idx` (`idStock`),
  CONSTRAINT `fk_prod_prod_final_insumos_stock_prod_prod_final_detalle1` FOREIGN KEY (`idProdProdFinalDetalle`) REFERENCES `prod_prod_final_detalle` (`idProdProdFinalDetalle`),
  CONSTRAINT `fk_prod_prod_final_insumos_stock_stocklog1` FOREIGN KEY (`idStock`) REFERENCES `stocklog` (`idStock`)
) ENGINE=InnoDB AUTO_INCREMENT=245 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `prod_prod_final_stock`
--

DROP TABLE IF EXISTS `prod_prod_final_stock`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `prod_prod_final_stock` (
  `keyx` bigint NOT NULL AUTO_INCREMENT,
  `idProdProdFinalDetalle` bigint NOT NULL,
  `idStock` bigint NOT NULL,
  `cantidadDisponible` decimal(18,2) DEFAULT NULL,
  `cantidadConsumida` decimal(18,2) DEFAULT NULL,
  `costoUnitario` decimal(18,2) DEFAULT NULL,
  `costoTotal` decimal(18,2) DEFAULT NULL,
  PRIMARY KEY (`keyx`),
  KEY `fk_prod_prod_final_stock_stocklog1_idx` (`idStock`),
  KEY `fk_prod_prod_final_stock_prod_prod_base_detalle1_idx` (`idProdProdFinalDetalle`) /*!80000 INVISIBLE */,
  CONSTRAINT `fk_prod_prod_final_stock_prod_prod_base_detalle100` FOREIGN KEY (`idProdProdFinalDetalle`) REFERENCES `prod_prod_final_detalle` (`idProdProdFinalDetalle`),
  CONSTRAINT `fk_prod_prod_final_stock_stocklog100` FOREIGN KEY (`idStock`) REFERENCES `stocklog` (`idStock`)
) ENGINE=InnoDB AUTO_INCREMENT=111 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `producciones_prod`
--

DROP TABLE IF EXISTS `producciones_prod`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `producciones_prod` (
  `keyx` bigint NOT NULL AUTO_INCREMENT,
  `createDate` datetime DEFAULT NULL,
  `idProducto` bigint NOT NULL,
  `cantidadProd` decimal(18,2) DEFAULT NULL,
  `costoDProd` decimal(18,2) DEFAULT NULL,
  PRIMARY KEY (`keyx`),
  KEY `fk_producciones_prod_productos1_idx` (`idProducto`),
  CONSTRAINT `fk_producciones_prod_productos1` FOREIGN KEY (`idProducto`) REFERENCES `productos` (`idProducto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `productos`
--

DROP TABLE IF EXISTS `productos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `productos` (
  `idProducto` bigint NOT NULL AUTO_INCREMENT,
  `createDate` datetime DEFAULT NULL,
  `sku` varchar(25) DEFAULT NULL,
  `idDescription` bigint NOT NULL,
  `valorMedida` decimal(18,2) DEFAULT NULL,
  `idUnidadMedida` smallint NOT NULL,
  `idCatTipoProducto` smallint NOT NULL,
  `idcatcategoriaproducto` int NOT NULL DEFAULT '1',
  `idProductoRelacion` bigint DEFAULT '0',
  `porcentajeRelation` decimal(18,2) DEFAULT NULL,
  `idproductocategoria` int DEFAULT '0',
  `costo` decimal(18,2) DEFAULT NULL,
  `precio` decimal(18,2) DEFAULT NULL,
  `active` smallint DEFAULT NULL,
  `imageUrl` varchar(100) DEFAULT NULL,
  `idFamilia` smallint NOT NULL,
  `bEnvase` smallint DEFAULT NULL,
  `precioEcoAgr` decimal(18,2) DEFAULT NULL,
  `porcentDineroElectronico` decimal(18,2) DEFAULT NULL,
  `porcentDineroElectronicoEnvase` decimal(18,2) DEFAULT NULL,
  `bDineroElectronico` smallint DEFAULT '0',
  PRIMARY KEY (`idProducto`),
  KEY `fk_productos_cat_descripciones1_idx` (`idDescription`),
  KEY `fk_productos_cat_unidad_medida1_idx` (`idUnidadMedida`),
  KEY `fk_productos_cat_tipo_producto1_idx` (`idCatTipoProducto`),
  KEY `fk_productos_cat_categoria_producto1_idx` (`idcatcategoriaproducto`),
  KEY `fk_productos_cat_familias1_idx` (`idFamilia`),
  CONSTRAINT `fk_productos_cat_categoria_producto1` FOREIGN KEY (`idcatcategoriaproducto`) REFERENCES `cat_categoria_producto` (`idcatcategoriaproducto`),
  CONSTRAINT `fk_productos_cat_descripciones1` FOREIGN KEY (`idDescription`) REFERENCES `cat_descripciones` (`idDescription`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_productos_cat_familias1` FOREIGN KEY (`idFamilia`) REFERENCES `cat_familias` (`idFamilia`),
  CONSTRAINT `fk_productos_cat_tipo_producto1` FOREIGN KEY (`idCatTipoProducto`) REFERENCES `cat_tipo_producto` (`idCatTipoProducto`),
  CONSTRAINT `fk_productos_cat_unidad_medida1` FOREIGN KEY (`idUnidadMedida`) REFERENCES `cat_unidad_medida` (`idUnidadMedida`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=503 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `promocionaccion`
--

DROP TABLE IF EXISTS `promocionaccion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `promocionaccion` (
  `idPromocionAccion` int NOT NULL AUTO_INCREMENT,
  `createdAt` timestamp NULL DEFAULT NULL,
  `updatedAt` timestamp NULL DEFAULT NULL,
  `idPromocion` int NOT NULL,
  `tipoAccion` varchar(45) DEFAULT NULL,
  `entidadObjetivo` varchar(45) DEFAULT NULL,
  `idObjetivo` int DEFAULT NULL,
  `valor` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`idPromocionAccion`),
  KEY `fk_PromotionActions_promotions1_idx` (`idPromocion`),
  CONSTRAINT `fk_PromotionActions_promotions1` FOREIGN KEY (`idPromocion`) REFERENCES `promociones` (`idPromocion`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `promocioncondicion`
--

DROP TABLE IF EXISTS `promocioncondicion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `promocioncondicion` (
  `idPromocionCondicion` int NOT NULL AUTO_INCREMENT,
  `createdAt` timestamp NULL DEFAULT NULL,
  `updatedAt` timestamp NULL DEFAULT NULL,
  `idPromocion` int NOT NULL,
  `tipoCondicion` varchar(45) DEFAULT NULL,
  `entidadObjetivo` varchar(45) DEFAULT NULL,
  `idObjetivo` int DEFAULT NULL,
  `operador` varchar(45) DEFAULT NULL,
  `valor` decimal(10,2) DEFAULT NULL,
  `operacion` varchar(45) DEFAULT NULL,
  `grupoCondicion` int DEFAULT NULL,
  PRIMARY KEY (`idPromocionCondicion`),
  KEY `fk_PromotionConditions_promotions1_idx` (`idPromocion`),
  CONSTRAINT `fk_PromotionConditions_promotions1` FOREIGN KEY (`idPromocion`) REFERENCES `promociones` (`idPromocion`)
) ENGINE=InnoDB AUTO_INCREMENT=192 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `promociones`
--

DROP TABLE IF EXISTS `promociones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `promociones` (
  `idPromocion` int NOT NULL AUTO_INCREMENT,
  `createdAt` timestamp NULL DEFAULT NULL,
  `updatedAt` timestamp NULL DEFAULT NULL,
  `nombre` varchar(5000) DEFAULT NULL,
  `descripcion` text,
  `tipoPromocion` varchar(45) DEFAULT NULL,
  `valor` decimal(10,2) DEFAULT NULL,
  `fechaInicio` datetime DEFAULT NULL,
  `fechaFin` datetime DEFAULT NULL,
  `activo` tinyint DEFAULT '1',
  `prioridad` int DEFAULT NULL,
  `requiereCodigoCupon` tinyint DEFAULT '0',
  `couponcode` varchar(45) DEFAULT NULL,
  `maxUsosTotal` int DEFAULT NULL,
  `maxUsosPorCliente` int DEFAULT NULL,
  PRIMARY KEY (`idPromocion`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `promocionuso`
--

DROP TABLE IF EXISTS `promocionuso`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `promocionuso` (
  `idpromocionuso` int NOT NULL AUTO_INCREMENT,
  `createdAt` timestamp NULL DEFAULT NULL,
  `updatedAt` timestamp NULL DEFAULT NULL,
  `idPromocion` int NOT NULL,
  `idventas` bigint NOT NULL,
  `idCliente` bigint NOT NULL,
  PRIMARY KEY (`idpromocionuso`),
  KEY `fk_promotionusage_promotions1_idx` (`idPromocion`),
  KEY `fk_promotionusage_ventas1_idx` (`idventas`),
  KEY `fk_promotionusage_clientes1_idx` (`idCliente`),
  CONSTRAINT `fk_promotionusage_clientes1` FOREIGN KEY (`idCliente`) REFERENCES `clientes` (`idCliente`),
  CONSTRAINT `fk_promotionusage_promotions1` FOREIGN KEY (`idPromocion`) REFERENCES `promociones` (`idPromocion`),
  CONSTRAINT `fk_promotionusage_ventas1` FOREIGN KEY (`idventas`) REFERENCES `ventas` (`idVenta`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `proveedores`
--

DROP TABLE IF EXISTS `proveedores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `proveedores` (
  `idProveedor` bigint NOT NULL AUTO_INCREMENT,
  `createDate` datetime DEFAULT NULL,
  `nombre` varchar(100) DEFAULT NULL,
  `calle` varchar(100) DEFAULT NULL,
  `numExt` varchar(45) DEFAULT NULL,
  `numInt` varchar(45) DEFAULT NULL,
  `entreCalles` varchar(45) DEFAULT NULL,
  `codigocolonia` int DEFAULT NULL,
  `rfc` varchar(45) DEFAULT NULL,
  `telefono` varchar(45) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `lat` varchar(15) DEFAULT NULL,
  `long` varchar(15) DEFAULT NULL,
  `active` smallint DEFAULT NULL,
  PRIMARY KEY (`idProveedor`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roles` (
  `idRol` int NOT NULL AUTO_INCREMENT,
  `createDate` datetime DEFAULT NULL,
  `name` varchar(45) DEFAULT NULL,
  `description` varchar(500) DEFAULT NULL,
  `active` smallint DEFAULT NULL,
  PRIMARY KEY (`idRol`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `seguimiento_prospectos`
--

DROP TABLE IF EXISTS `seguimiento_prospectos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `seguimiento_prospectos` (
  `idSeguimiento` bigint NOT NULL AUTO_INCREMENT,
  `createDate` datetime DEFAULT NULL,
  `idCliente` bigint NOT NULL,
  `idUser` bigint NOT NULL,
  `description` varchar(5000) DEFAULT NULL,
  PRIMARY KEY (`idSeguimiento`),
  KEY `fk_seguimiento_prospectos_clientes1_idx` (`idCliente`),
  KEY `fk_seguimiento_prospectos_users1_idx` (`idUser`),
  CONSTRAINT `fk_seguimiento_prospectos_clientes1` FOREIGN KEY (`idCliente`) REFERENCES `clientes` (`idCliente`),
  CONSTRAINT `fk_seguimiento_prospectos_users1` FOREIGN KEY (`idUser`) REFERENCES `users` (`idUser`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `stock`
--

DROP TABLE IF EXISTS `stock`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stock` (
  `idStock` bigint NOT NULL AUTO_INCREMENT,
  `createDate` datetime DEFAULT NULL,
  `active` smallint DEFAULT NULL,
  `idOrigen` bigint NOT NULL,
  `idProducto` bigint NOT NULL,
  `cantidad` decimal(18,2) DEFAULT NULL,
  `costo` decimal(18,2) DEFAULT NULL,
  `cantidadBlock` decimal(18,2) DEFAULT NULL,
  PRIMARY KEY (`idStock`),
  KEY `fk_stock_productos1_idx` (`idProducto`),
  KEY `fk_stock_origenes1_idx` (`idOrigen`),
  CONSTRAINT `fk_stock_origenes1` FOREIGN KEY (`idOrigen`) REFERENCES `origenes` (`idOrigen`),
  CONSTRAINT `fk_stock_productos1` FOREIGN KEY (`idProducto`) REFERENCES `productos` (`idProducto`)
) ENGINE=InnoDB AUTO_INCREMENT=91 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `stock_block_log`
--

DROP TABLE IF EXISTS `stock_block_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stock_block_log` (
  `idStock` bigint NOT NULL AUTO_INCREMENT,
  `createDate` datetime DEFAULT NULL,
  `active` smallint DEFAULT NULL,
  `idOrigen` bigint NOT NULL,
  `idProducto` bigint NOT NULL,
  `cantidad` decimal(18,2) DEFAULT NULL,
  `idRelation` bigint DEFAULT NULL,
  `relationType` varchar(45) DEFAULT NULL,
  `motivoDesc` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`idStock`),
  KEY `fk_stock_productos1_idx` (`idProducto`),
  KEY `fk_stock_origenes1_idx` (`idOrigen`),
  CONSTRAINT `fk_stock_origenes10` FOREIGN KEY (`idOrigen`) REFERENCES `origenes` (`idOrigen`),
  CONSTRAINT `fk_stock_productos10` FOREIGN KEY (`idProducto`) REFERENCES `productos` (`idProducto`)
) ENGINE=InnoDB AUTO_INCREMENT=204 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `stocklog`
--

DROP TABLE IF EXISTS `stocklog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stocklog` (
  `idStock` bigint NOT NULL AUTO_INCREMENT,
  `createDate` datetime DEFAULT NULL,
  `active` smallint DEFAULT NULL,
  `idOrigen` bigint NOT NULL,
  `idProducto` bigint NOT NULL,
  `idCatMov` int NOT NULL,
  `cantidad` decimal(18,2) DEFAULT NULL,
  `costo` decimal(18,2) DEFAULT NULL,
  `idStockFrom` bigint DEFAULT NULL,
  `idRelacionOperacion` bigint DEFAULT NULL,
  `comentarios` varchar(1000) DEFAULT NULL,
  `idCreateUser` bigint NOT NULL,
  `motivoDesc` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`idStock`),
  KEY `fk_stocklog_productos1_idx` (`idProducto`),
  KEY `fk_stocklog_users1_idx` (`idCreateUser`),
  KEY `fk_stocklog_cat_mov_entrada_salida1_idx` (`idCatMov`),
  KEY `fk_stocklog_origenes1_idx` (`idOrigen`),
  CONSTRAINT `fk_stocklog_cat_mov_entrada_salida1` FOREIGN KEY (`idCatMov`) REFERENCES `cat_mov_entrada_salida` (`idCatMov`),
  CONSTRAINT `fk_stocklog_origenes1` FOREIGN KEY (`idOrigen`) REFERENCES `origenes` (`idOrigen`),
  CONSTRAINT `fk_stocklog_productos1` FOREIGN KEY (`idProducto`) REFERENCES `productos` (`idProducto`),
  CONSTRAINT `fk_stocklog_users1` FOREIGN KEY (`idCreateUser`) REFERENCES `users` (`idUser`)
) ENGINE=InnoDB AUTO_INCREMENT=1580 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sucursales`
--

DROP TABLE IF EXISTS `sucursales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sucursales` (
  `idSucursal` smallint NOT NULL AUTO_INCREMENT,
  `createDate` datetime DEFAULT NULL,
  `name` varchar(45) DEFAULT NULL,
  `calle` varchar(45) DEFAULT NULL,
  `numExt` varchar(10) DEFAULT NULL,
  `numInt` varchar(10) DEFAULT NULL,
  `entreCalles` varchar(45) DEFAULT NULL,
  `codigocolonia` int DEFAULT NULL,
  `telefono` varchar(20) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `lat` varchar(15) DEFAULT NULL,
  `long` varchar(15) DEFAULT NULL,
  `active` smallint DEFAULT NULL,
  PRIMARY KEY (`idSucursal`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sucursalesconfig`
--

DROP TABLE IF EXISTS `sucursalesconfig`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sucursalesconfig` (
  `keyx` bigint NOT NULL AUTO_INCREMENT,
  `createDate` datetime DEFAULT NULL,
  `idUser` bigint NOT NULL,
  `idSucursal` smallint NOT NULL,
  `bPrincipal` smallint DEFAULT NULL,
  PRIMARY KEY (`keyx`),
  KEY `fk_sucursalesconfig_users1_idx` (`idUser`),
  KEY `fk_sucursalesconfig_sucursales1_idx` (`idSucursal`),
  CONSTRAINT `fk_sucursalesconfig_sucursales1` FOREIGN KEY (`idSucursal`) REFERENCES `sucursales` (`idSucursal`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_sucursalesconfig_users1` FOREIGN KEY (`idUser`) REFERENCES `users` (`idUser`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tipo_prod_by_origen`
--

DROP TABLE IF EXISTS `tipo_prod_by_origen`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipo_prod_by_origen` (
  `keyx` bigint NOT NULL AUTO_INCREMENT,
  `idCatRelacionOrigen` smallint NOT NULL,
  `idCatTipoProducto` int DEFAULT NULL,
  PRIMARY KEY (`keyx`),
  KEY `fk_tipo_prod_by_origen_cat_relacion_origen1_idx` (`idCatRelacionOrigen`),
  CONSTRAINT `fk_tipo_prod_by_origen_cat_relacion_origen1` FOREIGN KEY (`idCatRelacionOrigen`) REFERENCES `cat_relacion_origen` (`idCatRelacionOrigen`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tmp_stock_base`
--

DROP TABLE IF EXISTS `tmp_stock_base`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tmp_stock_base` (
  `keyx` bigint NOT NULL AUTO_INCREMENT,
  `idKey` bigint DEFAULT NULL,
  `idOrigen` bigint DEFAULT NULL,
  `idMateriaPrima` bigint DEFAULT NULL,
  `cantidadConsumida` decimal(18,2) DEFAULT NULL,
  PRIMARY KEY (`keyx`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `turnoscaja`
--

DROP TABLE IF EXISTS `turnoscaja`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `turnoscaja` (
  `idturnoscaja` int NOT NULL AUTO_INCREMENT,
  `idcajas` int NOT NULL,
  `idUser` bigint NOT NULL,
  `fechainicio` datetime DEFAULT NULL,
  `fechafin` datetime DEFAULT NULL,
  `createdAt` timestamp NULL DEFAULT NULL,
  `updatedAt` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`idturnoscaja`),
  KEY `fk_turnoscaja_cajas1_idx` (`idcajas`),
  KEY `fk_turnoscaja_users1_idx` (`idUser`),
  CONSTRAINT `fk_turnoscaja_cajas1` FOREIGN KEY (`idcajas`) REFERENCES `cajas` (`idcajas`),
  CONSTRAINT `fk_turnoscaja_users1` FOREIGN KEY (`idUser`) REFERENCES `users` (`idUser`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user_roles`
--

DROP TABLE IF EXISTS `user_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_roles` (
  `keyx` bigint NOT NULL AUTO_INCREMENT,
  `createDate` datetime DEFAULT NULL,
  `idUser` bigint NOT NULL,
  `idRol` int NOT NULL,
  PRIMARY KEY (`keyx`),
  KEY `fk_user_roles_users1_idx` (`idUser`),
  KEY `fk_user_roles_roles1_idx` (`idRol`),
  CONSTRAINT `fk_user_roles_roles1` FOREIGN KEY (`idRol`) REFERENCES `roles` (`idRol`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_user_roles_users1` FOREIGN KEY (`idUser`) REFERENCES `users` (`idUser`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `idUser` bigint NOT NULL AUTO_INCREMENT,
  `createDate` datetime DEFAULT NULL,
  `updateDate` datetime DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `userName` varchar(50) DEFAULT NULL,
  `pwd` text,
  `idStatus` smallint NOT NULL,
  `active` smallint DEFAULT NULL,
  PRIMARY KEY (`idUser`),
  KEY `fk_users_cat_status_user1_idx` (`idStatus`),
  CONSTRAINT `fk_users_cat_status_user1` FOREIGN KEY (`idStatus`) REFERENCES `cat_status_user` (`idStatus`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `vendedores`
--

DROP TABLE IF EXISTS `vendedores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vendedores` (
  `idVendedor` bigint NOT NULL AUTO_INCREMENT,
  `createDate` datetime DEFAULT NULL,
  `nombre` varchar(100) DEFAULT NULL,
  `fechaIngreso` date DEFAULT NULL,
  `fechaNacimiento` date DEFAULT NULL,
  `sexo` varchar(45) DEFAULT NULL,
  `idUser` bigint DEFAULT NULL,
  `idStatusVendedor` smallint NOT NULL,
  `calle` varchar(100) DEFAULT NULL,
  `numExt` varchar(45) DEFAULT NULL,
  `numInt` varchar(45) DEFAULT NULL,
  `entreCalle` varchar(45) DEFAULT NULL,
  `codigocolonia` int DEFAULT NULL,
  `rfc` varchar(45) DEFAULT NULL,
  `telefono` varchar(45) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `lat` varchar(15) DEFAULT NULL,
  `long` varchar(15) DEFAULT NULL,
  `active` smallint DEFAULT NULL,
  PRIMARY KEY (`idVendedor`),
  KEY `fk_vendedores_cat_status_vendedor1_idx` (`idStatusVendedor`),
  CONSTRAINT `fk_vendedores_cat_status_vendedor1` FOREIGN KEY (`idStatusVendedor`) REFERENCES `cat_status_vendedor` (`idStatusVendedor`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ventas`
--

DROP TABLE IF EXISTS `ventas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ventas` (
  `idVenta` bigint NOT NULL AUTO_INCREMENT,
  `createDate` datetime DEFAULT NULL,
  `active` smallint DEFAULT NULL,
  `idCreateUser` bigint NOT NULL,
  `subtotal` decimal(18,2) DEFAULT NULL,
  `descuento` decimal(18,2) DEFAULT NULL,
  `iva` decimal(10,2) DEFAULT NULL,
  `total` decimal(18,2) DEFAULT NULL,
  `pendiente` decimal(18,2) DEFAULT NULL,
  `idCliente` bigint NOT NULL,
  `idSucursal` smallint NOT NULL,
  `idCaja` int NOT NULL,
  `idTipoVenta` int NOT NULL DEFAULT '1',
  `idVendedor` bigint NOT NULL,
  `bClosed` smallint DEFAULT NULL,
  `idPedido` bigint DEFAULT NULL,
  `idOrigenVendedor` bigint DEFAULT NULL,
  `idClienteDiElect` bigint DEFAULT NULL,
  `dineroElectAcumulado` decimal(18,2) DEFAULT '0.00',
  PRIMARY KEY (`idVenta`),
  KEY `fk_ventas_users1_idx` (`idCreateUser`) /*!80000 INVISIBLE */,
  KEY `fk_ventas_sucursales1_idx` (`idSucursal`) /*!80000 INVISIBLE */,
  KEY `fk_ventas_cajas1_idx` (`idCaja`),
  KEY `fk_ventas_cat_tipo_venta1_idx` (`idTipoVenta`),
  KEY `fk_ventas_vendedores1_idx` (`idVendedor`),
  CONSTRAINT `fk_ventas_cajas1` FOREIGN KEY (`idCaja`) REFERENCES `cajas` (`idcajas`),
  CONSTRAINT `fk_ventas_cat_tipo_venta1` FOREIGN KEY (`idTipoVenta`) REFERENCES `cat_tipo_venta` (`idTipoVenta`),
  CONSTRAINT `fk_ventas_sucursales1` FOREIGN KEY (`idSucursal`) REFERENCES `sucursales` (`idSucursal`),
  CONSTRAINT `fk_ventas_users1` FOREIGN KEY (`idCreateUser`) REFERENCES `users` (`idUser`),
  CONSTRAINT `fk_ventas_vendedores1` FOREIGN KEY (`idVendedor`) REFERENCES `vendedores` (`idVendedor`)
) ENGINE=InnoDB AUTO_INCREMENT=423 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ventas_canceladas`
--

DROP TABLE IF EXISTS `ventas_canceladas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ventas_canceladas` (
  `keyx` bigint NOT NULL AUTO_INCREMENT,
  `idVenta` bigint NOT NULL,
  `cancelDate` datetime DEFAULT NULL,
  `idCancelUser` bigint DEFAULT NULL,
  PRIMARY KEY (`keyx`),
  KEY `fk_ventas_canceladas_ventas1_idx` (`idVenta`),
  CONSTRAINT `fk_ventas_canceladas_ventas1` FOREIGN KEY (`idVenta`) REFERENCES `ventas` (`idVenta`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ventas_envases`
--

DROP TABLE IF EXISTS `ventas_envases`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ventas_envases` (
  `idVentasEnvases` bigint NOT NULL AUTO_INCREMENT,
  `idVenta` bigint NOT NULL,
  `idProducto` bigint NOT NULL,
  `cantidad` int DEFAULT NULL,
  `valorMedida` decimal(18,2) DEFAULT NULL,
  PRIMARY KEY (`idVentasEnvases`),
  KEY `fk_ventas_envases_ventas1_idx` (`idVenta`),
  KEY `fk_ventas_envases_productos1_idx` (`idProducto`),
  CONSTRAINT `fk_ventas_envases_productos1` FOREIGN KEY (`idProducto`) REFERENCES `productos` (`idProducto`),
  CONSTRAINT `fk_ventas_envases_ventas1` FOREIGN KEY (`idVenta`) REFERENCES `ventas` (`idVenta`)
) ENGINE=InnoDB AUTO_INCREMENT=367 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ventasdetalle`
--

DROP TABLE IF EXISTS `ventasdetalle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ventasdetalle` (
  `idVentaDetalle` bigint NOT NULL AUTO_INCREMENT,
  `idVenta` bigint NOT NULL,
  `idProducto` bigint NOT NULL,
  `descripcion` varchar(500) DEFAULT NULL,
  `bEnvase` smallint DEFAULT NULL,
  `cantidad` decimal(18,2) DEFAULT NULL,
  `precioUnitario` decimal(18,2) DEFAULT NULL,
  `descuento` decimal(18,2) DEFAULT NULL,
  `precioConDescuento` decimal(18,2) DEFAULT NULL,
  `total` decimal(18,2) DEFAULT NULL,
  `aplicaPromo` smallint DEFAULT NULL,
  `idPromocion` bigint DEFAULT NULL,
  `promoName` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`idVentaDetalle`),
  KEY `fk_ventasdetalle_productos1_idx` (`idProducto`),
  KEY `fk_ventasdetalle_ventas1_idx` (`idVenta`),
  CONSTRAINT `fk_ventasdetalle_productos1` FOREIGN KEY (`idProducto`) REFERENCES `productos` (`idProducto`),
  CONSTRAINT `fk_ventasdetalle_ventas1` FOREIGN KEY (`idVenta`) REFERENCES `ventas` (`idVenta`)
) ENGINE=InnoDB AUTO_INCREMENT=1515 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `zonas`
--

DROP TABLE IF EXISTS `zonas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `zonas` (
  `idZona` int NOT NULL AUTO_INCREMENT,
  `createDate` datetime DEFAULT NULL,
  `name` varchar(500) DEFAULT NULL,
  `active` smallint DEFAULT NULL,
  PRIMARY KEY (`idZona`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping routines for database 'db_diprolimweb'
--
/*!50003 DROP PROCEDURE IF EXISTS `actualizarCantidadES` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `actualizarCantidadES`(
	IN p_idEntradasSalidasDetalle BIGINT,
	IN p_cantidad DECIMAL(18,2)
)
BEGIN

    UPDATE
		entradas_salidas_detalle
	SET
		cantidad = p_cantidad
	WHERE
		idEntradasSalidasDetalle = p_idEntradasSalidasDetalle
	;
	
	SET @idEntradasSalidasH = 0;
	
	SET @idEntradasSalidasH = IFNULL(
	(
		SELECT
		idEntradasSalidasH
		FROM entradas_salidas_detalle
		WHERE
			idEntradasSalidasDetalle = p_idEntradasSalidasDetalle
		LIMIT 1
	)
	,0);
	
	UPDATE
		entradas_salidas_detalle
	SET
		-- SI LA CANTIDAD ES LA MISMA QUE LA QUE LLEGÓ SE CAMBIA A RECIBIDO, SI NO ENTONCES A ENREVISIÓN
		idStatusESDetalle = ( CASE WHEN cantidad = cantidadRecibidaReal THEN 2 ELSE 3 END )
		-- LA CANTIDAD ENVIADA CAMBIA A CANTIDAD SI LA CANTIDAD ES ACTUALIZADA Y QUEDA IGUAL QUE LA CANTIDAD RECIBIDA
		, cantidadEnviadaReal = ( CASE WHEN cantidad = cantidadRecibidaReal THEN cantidad ELSE cantidadRecibidaReal END )
	WHERE
		idEntradasSalidasDetalle = p_idEntradasSalidasDetalle
	;
	
	-- SI LA CANTIDAD DE LÍNEAS ES IGUAL A LA CANTIDAD DE LINEAS YA RECIBIDAS ENTONCES CERRAMOS LA ENTRADA SALIDA
	IF
	(
		SELECT
		COUNT(*)
		FROM entradas_salidas_detalle
		WHERE
			idEntradasSalidasH = @idEntradasSalidasH
	)
	=
	(
		SELECT
		COUNT(*)
		FROM entradas_salidas_detalle
		WHERE
			idEntradasSalidasH = @idEntradasSalidasH
			AND idStatusESDetalle = 2
	) THEN
	
		UPDATE
			entradas_salidas_header
		SET
			idEntradaSalidaStatus = 3 -- 1: Borrador, 2: En Proceso, 3: Completa
		WHERE
			idEntradasSalidasH = @idEntradasSalidasH
		;
	
	END IF;
	
	SELECT 1 AS out_id, 'Actualizada con éxito.' AS message;
	
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `actualizarCantProducida` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `actualizarCantProducida`(
	IN p_idProdProdBaseDetalle BIGINT,
	IN p_cantAProducir DECIMAL(18,2)
)
BEGIN

	DECLARE mensaje_error TEXT;
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        -- Capturar el mensaje de error
        GET DIAGNOSTICS CONDITION 1 mensaje_error = MESSAGE_TEXT;
		SELECT 0 AS out_id, mensaje_error AS message;
    END;

    UPDATE
		prod_prod_base_detalle
	SET
		cantProducida = p_cantAProducir
	WHERE
		idProdProdBaseDetalle = p_idProdProdBaseDetalle
	;
		
	SELECT 1 AS out_id, 'Actualizada con éxito.' AS message;
	
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `actualizar_costo_producto` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `actualizar_costo_producto`(
	IN p_idProducto BIGINT
)
BEGIN
  DECLARE v_idCatTipoProducto SMALLINT;
  DECLARE v_idProductoRelacion BIGINT;
  DECLARE v_costo_base DECIMAL(18,2) DEFAULT 0;
  DECLARE v_costo_agranel DECIMAL(18,2) DEFAULT 0;
  DECLARE v_costo_insumos DECIMAL(18,2) DEFAULT 0;
  DECLARE v_costo_total DECIMAL(18,2) DEFAULT 0;
  DECLARE v_porcentajeRelation DECIMAL(18,2) DEFAULT 1;
  DECLARE v_valorMedida DECIMAL(18,2) DEFAULT 1;


  -- Obtener tipo y relación
  SELECT idCatTipoProducto, idProductoRelacion INTO v_idCatTipoProducto, v_idProductoRelacion
    FROM productos WHERE idProducto = p_idProducto;

  -- Producto Base
  IF v_idCatTipoProducto = 3 THEN
    SELECT IFNULL(SUM(fpb.cantidad * p2.costo),0) / 100
      INTO v_costo_total
      FROM formulas_prod_base fpb
      JOIN productos p2 ON fpb.idMateriaPrima = p2.idProducto
      WHERE fpb.idProductoBase = p_idProducto;
  END IF;

  -- Producto Agranel
  IF v_idCatTipoProducto = 4 THEN
    SELECT IFNULL(SUM(fpb.cantidad * p2.costo),0) / 100
      INTO v_costo_total
      FROM formulas_prod_base fpb
      JOIN productos p2 ON fpb.idMateriaPrima = p2.idProducto
      WHERE fpb.idProductoBase = v_idProductoRelacion;
  END IF;

  -- Producto Final
  IF v_idCatTipoProducto = 1 THEN
  
	SELECT ( porcentajeRelation/100 ), valorMedida INTO v_porcentajeRelation, v_valorMedida
	FROM productos
	WHERE idProducto = p_idProducto;
  
    -- Costo de agranel relacionado
    SELECT idProductoRelacion INTO @idBase FROM productos WHERE idProducto = v_idProductoRelacion;
    SELECT IFNULL(SUM(fpb.cantidad * p2.costo),0) / 100
      INTO v_costo_agranel
      FROM formulas_prod_base fpb
      JOIN productos p2 ON fpb.idMateriaPrima = p2.idProducto
      WHERE fpb.idProductoBase = @idBase;
    -- Suma de insumos
    SELECT IFNULL(SUM(p3.costo),0)
      INTO v_costo_insumos
      FROM insumos_productos ip
      JOIN productos p3 ON ip.idInsumo = p3.idProducto
      WHERE ip.idProducto = p_idProducto;
    SET v_costo_total = ( IFNULL(v_costo_agranel,0) * v_porcentajeRelation * v_valorMedida ) + IFNULL(v_costo_insumos,0);
	
  END IF;

	-- Actualiza el costo en la tabla productos
	UPDATE
		productos
	SET
		costo = v_costo_total
	WHERE idProducto = p_idProducto;
	
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `agregarEntradaSalidaDetalle` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `agregarEntradaSalidaDetalle`(
    IN p_idEntradasSalidasH BIGINT,
	IN p_idEntradasSalidasDetalle BIGINT,
	IN p_idProducto BIGINT,
	IN p_cantidad FLOAT
)
BEGIN

	SET @out_id = 0;
    SET @message = '';

    IF p_idEntradasSalidasH > 0 AND p_idProducto > 0 THEN
	
        IF p_idEntradasSalidasDetalle = 0 THEN
		
			INSERT INTO entradas_salidas_detalle
			(
				idEntradasSalidasH
				, idProducto
				, cantidad
                , cantidadEnviada
                , cantidadEnviadaReal
				, cantidadRecibida
				, cantidadRecibidaReal
				, idStatusESDetalle
			)
			SELECT
			p_idEntradasSalidasH
			, p_idProducto
			, p_cantidad
            , 0
            , 0
			, 0
			, 0
			, 0
			;
			
			SET @out_id = LAST_INSERT_ID();
			
			SET @message = 'Guardado con éxito.';
			
		ELSE
		
			UPDATE
				entradas_salidas_detalle
			SET
				idProducto = p_idProducto
				, cantidad = p_cantidad
			WHERE
				idEntradasSalidasDetalle = p_idEntradasSalidasDetalle
                ;
		
			SET @out_id = p_idEntradasSalidasDetalle;
			SET @message = 'Actualizado con éxito.';
			
		END IF;
		
    ELSE
	
		SET @message = 'Parámetros incorrectos.';
		
    END IF;
	

    SELECT @out_id AS out_id, @message AS message;
	
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `agregarInsumoAlProducto` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `agregarInsumoAlProducto`(
    IN oGetDateNow DATETIME,
    IN p_idProducto BIGINT,
    IN p_idInsumo BIGINT,
    IN p_idUserLogON BIGINT,
    IN p_keyx BIGINT
)
BEGIN
    SET @out_id = 0;
    SET @message = '';

    IF p_idProducto > 0 AND p_idInsumo > 0 THEN

        IF p_keyx > 0 THEN
            -- Actualiza el registro existente
            UPDATE insumos_productos
            SET idInsumo = p_idInsumo
            WHERE keyx = p_keyx;

            SET @out_id = p_keyx;
            SET @message = 'Actualizado con éxito.';
        ELSE
            -- Inserta un nuevo registro
            INSERT INTO insumos_productos (
                createDate,
                active,
                idProducto,
                idInsumo
            ) VALUES (
                oGetDateNow,
                1,
                p_idProducto,
                p_idInsumo
            );
            SET @out_id = LAST_INSERT_ID();
            SET @message = 'Guardado con éxito.';
        END IF;

    ELSE
        SET @message = 'Parámetros incorrectos.';
    END IF;

    SELECT @out_id AS out_id, @message AS message;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `agregarMateriaPrimaALaFomulaDeProductoBase` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `agregarMateriaPrimaALaFomulaDeProductoBase`(
IN oGetDateNow DATETIME,
	IN p_idFormula BIGINT,
	IN p_idProductoBase BIGINT,
	IN p_idMateriaPrima BIGINT,
	IN p_cantidad FLOAT,
	IN p_idUserLogON BIGINT
)
BEGIN

	DECLARE mensaje_error TEXT;
    
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        -- Capturar el mensaje de error
        GET DIAGNOSTICS CONDITION 1 mensaje_error = MESSAGE_TEXT;
		SELECT 0 AS out_id, mensaje_error AS message;
    END;

	SET @out_id = 0;
    SET @message = '';

    IF p_idProductoBase > 0 AND p_idMateriaPrima > 0 AND p_cantidad > 0 THEN
    
		IF p_idFormula = 0 THEN
	
			INSERT INTO formulas_prod_base
			(
				createDate
				, active
				, idProductoBase
				, idMateriaPrima
				, cantidad
			)
			SELECT
			oGetDateNow
			, 1
			, p_idProductoBase
			, p_idMateriaPrima
			, p_cantidad
			;
			
			SET @out_id = LAST_INSERT_ID();
			SET @message = 'Guardado con éxito.';
		
        ELSE
        
			UPDATE
				formulas_prod_base
			SET
				idMateriaPrima = p_idMateriaPrima
                , cantidad = p_cantidad
			WHERE
				idFormula = p_idFormula;
                
			SET @out_id = p_idFormula;
			SET @message = 'Actualizado con éxito.';
		
        END IF;
		
    ELSE
	
		SET @message = 'Parámetros incorrectos.';
		
    END IF;
	

    SELECT @out_id AS out_id, @message AS message;
	
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `agregarOrdenCompraDetalle` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `agregarOrdenCompraDetalle`(
IN p_idOrdenDeCompraDetalle BIGINT,
    IN p_idOrdenDeCompra BIGINT,
	IN p_idProducto BIGINT,
	IN p_cantidad FLOAT,
	IN p_costo FLOAT
)
BEGIN

	SET @out_id = 0;
    SET @message = '';

    IF p_idProducto > 0 AND p_cantidad > 0 AND p_costo > 0 THEN
	
		IF p_idOrdenDeCompraDetalle > 0 THEN
		
			UPDATE
				orden_compra_detalle
			SET
				idProducto = p_idProducto
				, cantidad = p_cantidad
				, costo = p_costo
				, importe = p_cantidad * p_costo
			WHERE
				idOrdenDeCompraDetalle = p_idOrdenDeCompraDetalle
			;
			
			SET @out_id = p_idOrdenDeCompraDetalle;
		
		ELSE
		
			INSERT INTO orden_compra_detalle
			(
				idOrdenDeCompra
				, idProducto
				, cantidad
				, costo
				, importe
				, active
			)
			SELECT
			p_idOrdenDeCompra
			, p_idProducto
			, p_cantidad
			, p_costo
			, p_cantidad * p_costo
			, 1;
			
			SET @out_id = LAST_INSERT_ID();
		
		END IF;
		
		SET @costoTotal = 0;
	
		SET @costoTotal = IFNULL( ( SELECT
					SUM( importe )
					FROM orden_compra_detalle AS A
					WHERE
						idOrdenDeCompra = p_idOrdenDeCompra
                        ) ,0)
						;
						
		UPDATE
			orden_compra
		SET
			costoTotal = ROUND( @costoTotal ,2)
		WHERE
			idOrdenDeCompra = p_idOrdenDeCompra;
		
		SET @message = 'Guardado con éxito.';
		
    ELSE
	
		SET @message = 'Parámetros incorrectos.';
		
    END IF;
	

    SELECT @out_id AS out_id, @message AS message;
	
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `agregarPedidosClientes` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `agregarPedidosClientes`(
    IN p_idPedido BIGINT,
    IN p_idPedidoDetalle BIGINT,
    IN p_idProducto BIGINT,
    IN p_bEnvase SMALLINT,
    IN p_cantidad FLOAT
)
BEGIN
    -- Limpieza/Inicialización de variables
    SET @out_id = 0;
    SET @message = '';
    SET @precioUnitario = 0;
    SET @existe_id = NULL;
    SET @id_agrupado = NULL;
    SET @cantidad_agrupado = 0;

    -- Obtener precio unitario del producto
    SELECT precio
    INTO @precioUnitario
    FROM productos
    WHERE idProducto = p_idProducto
    LIMIT 1;

    IF p_idPedido > 0 AND p_idProducto > 0 THEN

        IF p_idPedidoDetalle = 0 THEN
            -- Es nuevo registro, buscar si ya existe uno igual para agrupar
            SELECT idPedidoDetalle
            INTO @existe_id
            FROM pedidos_clientes_detalle
            WHERE idPedido = p_idPedido
              AND idProducto = p_idProducto
              AND bEnvase = p_bEnvase
            LIMIT 1;

            IF @existe_id IS NOT NULL THEN
                -- Ya existe, sumar cantidad y total
                UPDATE pedidos_clientes_detalle
                SET cantidad = cantidad + p_cantidad,
                    total = ROUND(@precioUnitario * (cantidad + p_cantidad), 2)
                WHERE idPedidoDetalle = @existe_id;

                SET @out_id = @existe_id;
                SET @message = 'Cantidad actualizada con éxito.';
            ELSE
                -- No existe, insertar nuevo
                INSERT INTO pedidos_clientes_detalle
                (
                    idPedido,
                    idProducto,
                    bEnvase,
                    cantidad,
                    precioUnitario,
                    descuento,
                    total
                )
                VALUES
                (
                    p_idPedido,
                    p_idProducto,
                    p_bEnvase,
                    p_cantidad,
                    ROUND(@precioUnitario, 2),
                    0,
                    ROUND(@precioUnitario * p_cantidad, 2)
                );

                SET @out_id = LAST_INSERT_ID();
                SET @message = 'Guardado con éxito.';
            END IF;

        ELSE
            -- Es edición: buscar si hay otro registro igual para agrupar
            SELECT idPedidoDetalle, cantidad
            INTO @id_agrupado, @cantidad_agrupado
            FROM pedidos_clientes_detalle
            WHERE idPedido = p_idPedido
              AND idProducto = p_idProducto
              AND bEnvase = p_bEnvase
              AND idPedidoDetalle <> p_idPedidoDetalle
            LIMIT 1;

            IF @id_agrupado IS NOT NULL THEN
                -- Agrupar: sumar cantidades y totales en el otro registro
                UPDATE pedidos_clientes_detalle
                SET cantidad = @cantidad_agrupado + p_cantidad,
                    precioUnitario = ROUND(@precioUnitario, 2),
                    total = ROUND(@precioUnitario * (@cantidad_agrupado + p_cantidad), 2)
                WHERE idPedidoDetalle = @id_agrupado;

                -- Borrar el registro actual
                DELETE FROM pedidos_clientes_detalle WHERE idPedidoDetalle = p_idPedidoDetalle;

                SET @out_id = @id_agrupado;
                SET @message = 'Actualizado y agrupado con éxito.';
            ELSE
                -- No hay otro igual, solo actualizar el actual
                UPDATE pedidos_clientes_detalle
                SET idProducto = p_idProducto,
                    cantidad = p_cantidad,
                    bEnvase = p_bEnvase,
                    precioUnitario = ROUND(@precioUnitario, 2),
                    total = ROUND(@precioUnitario * p_cantidad, 2)
                WHERE idPedidoDetalle = p_idPedidoDetalle;

                SET @out_id = p_idPedidoDetalle;
                SET @message = 'Actualizado con éxito.';
            END IF;
        END IF;

    ELSE
        SET @message = 'Parámetros incorrectos.';
    END IF;

    SELECT @out_id AS out_id, @message AS message;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `agregarProdProdAgranelDetalle` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `agregarProdProdAgranelDetalle`(
	IN oGetDateNow DATETIME,
    IN p_idProdProdAgranelH BIGINT,
	IN p_idProductoAgranel BIGINT,
	IN p_cantidad DECIMAL(18,2),
	IN p_bOK SMALLINT
)
BEGIN

	DECLARE mensaje_error TEXT;
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        -- Capturar el mensaje de error
        GET DIAGNOSTICS CONDITION 1 mensaje_error = MESSAGE_TEXT;
		SELECT 0 AS out_id, mensaje_error AS message;
    END;

	SET @out_id = 0;
    SET @message = '';

    IF p_idProdProdAgranelH > 0 AND p_idProductoAgranel > 0 AND p_cantidad > 0 THEN
	
        INSERT INTO prod_prod_agranel_detalle
		(
			createDate
			, active
			, idProdProdAgranelH
			, idProductoAgranel
			, cantidad
			, costo
			, costoTotal
		)
        SELECT
		oGetDateNow
		, 1
		, p_idProdProdAgranelH
		, p_idProductoAgranel
		, p_cantidad
		, 0
		, 0
		;
		
		SET @out_id = LAST_INSERT_ID();
		
		SET @message = 'Guardado con éxito.';
		
    ELSE
	
		SET @message = 'Parámetros incorrectos.';
		
    END IF;
	

    SELECT @out_id AS out_id, @message AS message;
	
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `agregarProdProdBaseDetalle` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `agregarProdProdBaseDetalle`(
	IN oGetDateNow DATETIME,
	IN p_idProdProdBaseDetalle BIGINT,
	IN p_idProductoBase BIGINT,
	IN p_cantidad DECIMAL(18,2),
	IN p_costo DECIMAL(18,2),
	IN p_costoTotal DECIMAL(18,2),
	IN p_bOK SMALLINT,
	IN p_idUserLogON BIGINT
)
BEGIN

	DECLARE mensaje_error TEXT;
    
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        -- Capturar el mensaje de error
        GET DIAGNOSTICS CONDITION 1 mensaje_error = MESSAGE_TEXT;
		SELECT 0 AS out_id, mensaje_error AS message;
    END;

	SET @out_id = 0;
    SET @message = '';

    IF p_idProductoBase > 0 AND p_cantidad > 0 THEN
	
		IF p_idProdProdBaseDetalle = 0 THEN
	
			INSERT INTO prod_prod_base_detalle
			(
				createDate
				, active
				, idStatus
				, idProductoBase
				, cantidad
				, costo
				, costoTotal
				, bOK
				, idCreateUser
			)
			SELECT
			oGetDateNow
			, 1 -- active
			, 1 -- idStatus
			, p_idProductoBase
			, p_cantidad
			, p_costo
			, p_costoTotal
			, p_bOK
			, p_idUserLogON
			;
			
			SET @out_id = LAST_INSERT_ID();
			
			SET @message = 'Guardado con éxito.';
			
		ELSE
		
			UPDATE
				prod_prod_base_detalle
			SET
				idProductoBase = p_idProductoBase
				, cantidad = p_cantidad
			WHERE
				idProdProdBaseDetalle = p_idProdProdBaseDetalle
				;
			
			SET @out_id = p_idProdProdBaseDetalle;
			
			SET @message = 'Actualizado con éxito.';
		
		END IF;
		
    ELSE
	
		SET @message = 'Parámetros incorrectos.';
		
    END IF;
	

    SELECT @out_id AS out_id, @message AS message;
	
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `agregarProdProdFinalDetalle` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `agregarProdProdFinalDetalle`(
	IN oGetDateNow DATETIME,
    IN p_idProdProdFinalH BIGINT,
	IN p_idProductoFinal BIGINT,
	IN p_cantidad DECIMAL(18,2)
)
BEGIN

	DECLARE mensaje_error TEXT;
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        -- Capturar el mensaje de error
        GET DIAGNOSTICS CONDITION 1 mensaje_error = MESSAGE_TEXT;
		SELECT 0 AS out_id, mensaje_error AS message;
    END;

	SET @out_id = 0;
    SET @message = '';

    IF p_idProdProdFinalH > 0 AND p_idProductoFinal > 0 AND p_cantidad > 0 THEN
	
        INSERT INTO prod_prod_final_detalle
		(
			createDate
			, active
			, idProdProdFinalH
			, idProductoFinal
			, cantidad
		)
        SELECT
		oGetDateNow
		, 1
		, p_idProdProdFinalH
		, p_idProductoFinal
		, p_cantidad
		;
		
		SET @out_id = LAST_INSERT_ID();
		
		SET @message = 'Guardado con éxito.';
		
    ELSE
		SET @message = 'Parámetros incorrectos.';
    END IF;

    SELECT @out_id AS out_id, @message AS message;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `agregarVentasDetalle` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `agregarVentasDetalle`(
    IN p_idVenta BIGINT,
    IN p_idVentaDetalle BIGINT,
    IN p_idProducto BIGINT,
    IN p_bEnvase SMALLINT,
    IN p_cantidad FLOAT,
    IN p_idType INT
)
BEGIN
    -- Limpieza/Inicialización de variables
    SET @out_id = 0;
    SET @message = '';
    SET @precioUnitario = 0;
	SET @descripcion = '';
    SET @existe_id = NULL;
    SET @id_agrupado = NULL;
    SET @cantidad_agrupado = 0;

    -- Obtener precio unitario del producto
    SELECT
	P.precio
	, CONCAT( 
		IFNULL( CTP.abreviatura ,'')
		, '-', CAST( P.idproductocategoria AS CHAR(12) )
		, '-', IFNULL( CD.description ,'')
		, ' ', REPLACE( CAST( P.valorMedida AS CHAR(12) ) , '.00', ''), ' ', IFNULL( UM.abreviatura ,'')
		)
    INTO @precioUnitario, @descripcion
    FROM productos AS P
	INNER JOIN cat_tipo_producto AS CTP ON CTP.active = 1 AND CTP.idCatTipoProducto = P.idCatTipoProducto
	INNER JOIN cat_descripciones AS CD ON CD.active = 1 AND CD.idDescription = P.idDescription
	INNER JOIN cat_unidad_medida AS UM ON UM.active = 1 AND UM.idUnidadMedida = P.idUnidadMedida
    WHERE
		P.idProducto = p_idProducto
    LIMIT 1;

    IF p_idVenta > 0 AND p_idProducto > 0 THEN

        IF p_idVentaDetalle = 0 THEN
            -- Es nuevo registro, buscar si ya existe uno igual para agrupar
            SELECT idVentaDetalle
            INTO @existe_id
            FROM ventasdetalle
            WHERE idVenta = p_idVenta
              AND idProducto = p_idProducto
              AND bEnvase = p_bEnvase
            LIMIT 1;

            IF @existe_id IS NOT NULL THEN
                -- Ya existe, sumar cantidad y total
                UPDATE ventasdetalle
                SET cantidad = cantidad + p_cantidad,
                    total = ROUND(@precioUnitario * (cantidad + p_cantidad), 2)
                WHERE idVentaDetalle = @existe_id;

                SET @out_id = @existe_id;
                SET @message = 'Cantidad actualizada con éxito.';
            ELSE
                -- No existe, insertar nuevo
                INSERT INTO ventasdetalle
                (
                    idVenta,
                    idProducto,
					descripcion,
                    bEnvase,
                    cantidad,
                    precioUnitario,
                    descuento,
                    total
                )
                VALUES
                (
                    p_idVenta,
                    p_idProducto,
					@descripcion,
                    p_bEnvase,
                    p_cantidad,
                    ROUND(@precioUnitario, 2),
                    0,
                    ROUND(@precioUnitario * p_cantidad, 2)
                );

                SET @out_id = LAST_INSERT_ID();
                SET @message = 'Guardado con éxito.';
            END IF;

        ELSE
            -- Es edición: buscar si hay otro registro igual para agrupar
            SELECT idVentaDetalle, cantidad
            INTO @id_agrupado, @cantidad_agrupado
            FROM ventasdetalle
            WHERE idVenta = p_idVenta
              AND idProducto = p_idProducto
              AND bEnvase = p_bEnvase
              AND idVentaDetalle <> p_idVentaDetalle
            LIMIT 1;

            IF @id_agrupado IS NOT NULL THEN
                -- Agrupar: sumar cantidades y totales en el otro registro
                UPDATE ventasdetalle
                SET cantidad = @cantidad_agrupado + p_cantidad,
                    precioUnitario = ROUND(@precioUnitario, 2),
                    total = ROUND(@precioUnitario * (@cantidad_agrupado + p_cantidad), 2)
                WHERE idVentaDetalle = @id_agrupado;

                -- Borrar el registro actual
                DELETE FROM ventasdetalle WHERE idVentaDetalle = p_idVentaDetalle;

                SET @out_id = @id_agrupado;
                SET @message = 'Actualizado y agrupado con éxito.';
            ELSE
                -- No hay otro igual, solo actualizar el actual
                UPDATE ventasdetalle
                SET idProducto = p_idProducto,
                    cantidad = p_cantidad,
                    bEnvase = p_bEnvase,
                    precioUnitario = ROUND(@precioUnitario, 2),
                    total = ROUND(@precioUnitario * p_cantidad, 2)
                WHERE idVentaDetalle = p_idVentaDetalle;

                SET @out_id = p_idVentaDetalle;
                SET @message = 'Actualizado con éxito.';
            END IF;
        END IF;

    ELSE
        SET @message = 'Parámetros incorrectos.';
    END IF;
    
    -- SOLO EN EL PUNTO DE VENTA
    IF p_idType = 1 THEN
    
		SET @idProductoEnvase20LT = 0;
			
		SELECT
			`value`
		INTO
			@idProductoEnvase20LT
		FROM constantes
		WHERE
			`key` = 'envase20LT'
		;
		
		SET @envase4LT = 0;
			
		SELECT
			`value`
		INTO
			@envase4LT
		FROM constantes
		WHERE
			`key` = 'envase4LT'
		;
		
		DELETE FROM ventas_envases WHERE idVenta = p_idVenta;
		
		INSERT INTO `ventas_envases`(`idVenta`,`idProducto`,`cantidad`,`valorMedida`)
		SELECT
			p_idVenta,
			CASE 
				WHEN P.valorMedida = 4 THEN @envase4LT
				WHEN P.valorMedida = 20 THEN @idProductoEnvase20LT
			END
			, sum( VD.cantidad ), P.valorMedida
		FROM ventasdetalle AS VD
		INNER JOIN productos AS P ON P.idProducto = VD.idProducto
		WHERE
			VD.bEnvase = 1 AND VD.idVenta = p_idVenta AND P.valorMedida IN( 4, 20 )
		GROUP BY P.valorMedida;
    
    END IF;

    SELECT @out_id AS out_id, @message AS message;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `cambioDeOrigenPrincipalByIdUser` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `cambioDeOrigenPrincipalByIdUser`(
	IN p_idUser BIGINT
	, IN p_idOrigen BIGINT
)
BEGIN

	UPDATE
		origenes_config
	SET
		bPrincipal = 0
	WHERE
		idUser = p_idUser
		;

	UPDATE
		origenes_config
	SET
		bPrincipal = 1
	WHERE
		idUser = p_idUser
		AND idOrigen = p_idOrigen;

	SET @iRows = ( SELECT ROW_COUNT() );

	SELECT @iRows AS iRows;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `cambioStatusPedido` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `cambioStatusPedido`(
IN p_idPedido BIGINT
, IN p_idCatStatusPedidosClientes INT

, IN p_idUserLogON BIGINT
)
BEGIN

	DECLARE mensaje_error TEXT;
    
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        -- Capturar el mensaje de error
        GET DIAGNOSTICS CONDITION 1 mensaje_error = MESSAGE_TEXT;
		SELECT 0 AS out_id, mensaje_error AS message;
    END;
    
	IF p_idCatStatusPedidosClientes IN( 6, 7, 8 ) THEN -- ESTATUS DE CANCELADO
		UPDATE
			pedidos_clientes
		SET
			idCatStatusPedidosClientes = p_idCatStatusPedidosClientes
		WHERE
			idPedido = p_idPedido;
			
		-- *******************************************************************************************************
		-- DESBLOQUEAR EL INVENTARIO
		DELETE FROM stock_block_log WHERE idStock > 0 AND idRelation = p_idPedido AND relationType = 'PedidoC';
		
		SET @idOrigen = 0;
		-- Obtener idOrigen
		SELECT O.idOrigen INTO @idOrigen
		FROM origenes AS O
		INNER JOIN pedidos_clientes AS PC ON PC.idSucursal = O.idRelacion
		WHERE O.idCatRelacionOrigen = 1 -- SUCURSAL
		  AND PC.idPedido = p_idPedido
		LIMIT 1;
		
		-- 3. Actualiza stock restando cantidadBlock por producto
		UPDATE stock s
		JOIN (
			SELECT idProducto, SUM(cantidad) AS cantidad
			FROM pedidos_clientes_detalle
			WHERE idPedido = p_idPedido
			GROUP BY idProducto
		) pcd ON s.idProducto = pcd.idProducto AND s.idOrigen = @idOrigen
		SET s.cantidadBlock = IFNULL(s.cantidadBlock, 0) - pcd.cantidad;
		
		-- *******************************************************************************************************
			
		SELECT p_idPedido AS out_id, 'Estatus actualizado correctamente' AS message;
	ELSE
		SELECT 0 AS out_id, 'No se puede cambiar el estatus, no es un estatus permitido' AS message;
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `cancelarVenta` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `cancelarVenta`(
	IN oGetDateNow DATETIME
	, IN p_idVenta BIGINT

	, IN p_idUserLogON BIGINT
)
BEGIN

	DECLARE mensaje_error TEXT;
	DECLARE v_idSucursal BIGINT DEFAULT 0;
    DECLARE v_idOrigenFrom BIGINT DEFAULT 0;
    
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        -- Capturar el mensaje de error
        GET DIAGNOSTICS CONDITION 1 mensaje_error = MESSAGE_TEXT;
		SELECT 0 AS out_id, mensaje_error AS message;
    END;
	
    SELECT
	idSucursal, IFNULL( idOrigenVendedor ,0)
		INTO
	v_idSucursal, v_idOrigenFrom
    FROM ventas
    WHERE
        idVenta = p_idVenta
	LIMIT 1
    ;
	
	IF v_idOrigenFrom = 0 THEN
		-- SACO LA EQUIVALENCIA DE LA SUCURSAL A ORIGEN
		SELECT
			idOrigen INTO v_idOrigenFrom
		FROM origenes
		WHERE
			idCatRelacionOrigen = 1 -- SUCURSAL
			AND idRelacion = v_idSucursal
		;
	END IF;
	
	INSERT INTO ventas_canceladas ( idVenta, idCancelUser, cancelDate )
	SELECT
	p_idVenta, p_idUserLogON, oGetDateNow
	;
	
	-- SE REGRESA EL PRODUTO AL INVENTARIO
	INSERT INTO stocklog (
		createDate, active, idOrigen, idProducto, idCatMov, cantidad, costo, idCreateUser, idStockFrom, motivoDesc
	)
	SELECT
		oGetDateNow, 1, v_idOrigenFrom, idProducto, 7, cantidad, 0, p_idUserLogON, 0, CONCAT('Se cancela venta #', p_idVenta)
	FROM ventasdetalle
	WHERE
		idVenta = p_idVenta
	;
	-- SE REGRESA EL PRODUTO AL INVENTARIO
	UPDATE stock s
	INNER JOIN ventasdetalle t ON s.idProducto = t.idProducto AND s.idOrigen = v_idOrigenFrom AND t.idVenta = p_idVenta
	SET s.cantidad = s.cantidad + t.cantidad;
	
	-- EN CASO DE HABER ENVASES SE QUITAN DEL INVENTARIO
	INSERT INTO stocklog (
		createDate, active, idOrigen, idProducto, idCatMov, cantidad, costo, idCreateUser, idStockFrom, motivoDesc
	)
	SELECT
		oGetDateNow, 1, v_idOrigenFrom, idProducto, 7, ( cantidad * -1 ), 0, p_idUserLogON, 0, CONCAT('Se cancela venta #', p_idVenta)
	FROM ventas_envases
	WHERE
		idVenta = p_idVenta
	;

	-- EN CASO DE HABER ENVASES SE QUITAN DEL INVENTARIO
	UPDATE stock s
	INNER JOIN ventas_envases t ON s.idProducto = t.idProducto AND s.idOrigen = v_idOrigenFrom AND t.idVenta = p_idVenta
	SET s.cantidad = s.cantidad - t.cantidad;
	
	
	DELETE FROM pagos WHERE idVenta = p_idVenta;
	
	DELETE MPD FROM metodos_pago_detalle AS MPD
	INNER JOIN pagos AS P ON P.idMetodosPagoDetalle = MPD.idMetodosPagoDetalle
	WHERE
		P.idVenta = p_idVenta
	;
	
	UPDATE ventas SET active = 0 WHERE idVenta = p_idVenta;

    SELECT p_idVenta AS out_id, 'Venta cancelada correctamente' AS message;
	
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `cbxAllProductos` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `cbxAllProductos`(
IN p_search VARCHAR(500)
)
BEGIN
	
	WITH RECURSIVE words AS (
	  SELECT
		SUBSTRING_INDEX(p_search, ' ', 1) AS palabra,
		SUBSTRING(p_search, LOCATE(' ', p_search) + 1) AS rest
	  UNION ALL
	  SELECT
		SUBSTRING_INDEX(rest, ' ', 1) AS palabra,
		SUBSTRING(rest, LOCATE(' ', rest) + 1) AS rest
	  FROM words
	  WHERE rest <> '' AND LOCATE(' ', rest) > 0
	  UNION ALL
	  SELECT
		rest AS palabra,
		'' AS rest
	  FROM words
	  WHERE rest <> '' AND LOCATE(' ', rest) = 0
	)
	SELECT
	
		P.idProducto AS id
		, CONCAT( IFNULL( CTP.abreviatura ,''), '-', CAST( P.idproductocategoria AS CHAR(12) ) , '-', IFNULL( CD.description ,''), ' ', REPLACE( CAST( P.valorMedida AS CHAR(12) ) , '.00', ''), ' ', IFNULL( UM.abreviatura ,'') ) AS text
		
		,(
		  SELECT COUNT(*) 
		  FROM words w
		  WHERE CONCAT(
			  IFNULL(CTP.abreviatura, ''),
			  '-', CAST(P.idproductocategoria AS CHAR(12)),
			  '-', IFNULL(CD.description, ''),
			  ' ', REPLACE(CAST(P.valorMedida AS CHAR(12)), '.00', ''),
			  ' ', IFNULL(UM.abreviatura, '')
		  ) LIKE CONCAT('%', w.palabra, '%')
		) AS iCountWords
	
    FROM productos AS P
	INNER JOIN cat_tipo_producto AS CTP ON CTP.active = 1 AND CTP.idCatTipoProducto = P.idCatTipoProducto
	INNER JOIN cat_descripciones AS CD ON CD.active = 1 AND CD.idDescription = P.idDescription
	INNER JOIN cat_unidad_medida AS UM ON UM.active = 1 AND UM.idUnidadMedida = P.idUnidadMedida
	WHERE
		P.active = 1
		AND
		(
			p_search = ''
			OR (
				SELECT COUNT(*) 
				FROM words w
				WHERE CONCAT(
					IFNULL(CTP.abreviatura, ''),
					'-', CAST(P.idproductocategoria AS CHAR(12)),
					'-', IFNULL(CD.description, ''),
					' ', REPLACE(CAST(P.valorMedida AS CHAR(12)), '.00', ''),
					' ', IFNULL(UM.abreviatura, '')
				) LIKE CONCAT('%', w.palabra, '%')
			) > 0
		)
    ORDER BY iCountWords DESC
	LIMIT 0, 20;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `cbxArticulosParaCotizaciones` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `cbxArticulosParaCotizaciones`(
IN p_search VARCHAR(500)
, IN p_idSucursal BIGINT
, IN p_idUserLogON BIGINT
)
BEGIN

	SET @idOrigen = 0;
    
	SET @idOrigen = IFNULL(
	(
		SELECT
		idOrigen
		FROM origenes AS O
		WHERE
			O.idRelacion = p_idSucursal
			AND O.idCatRelacionOrigen = 1 -- SUCURSAL
	)
	,0);

	WITH RECURSIVE words AS (
	  SELECT
		SUBSTRING_INDEX(p_search, ' ', 1) AS palabra,
		SUBSTRING(p_search, LOCATE(' ', p_search) + 1) AS rest
	  UNION ALL
	  SELECT
		SUBSTRING_INDEX(rest, ' ', 1) AS palabra,
		SUBSTRING(rest, LOCATE(' ', rest) + 1) AS rest
	  FROM words
	  WHERE rest <> '' AND LOCATE(' ', rest) > 0
	  UNION ALL
	  SELECT
		rest AS palabra,
		'' AS rest
	  FROM words
	  WHERE rest <> '' AND LOCATE(' ', rest) = 0
	)
	SELECT
	
		P.idProducto AS id
		, CONCAT(
			IFNULL( CTP.abreviatura ,'')
			, '-' , CAST( P.idproductocategoria AS CHAR(12) )
			, '-', IFNULL( CD.description ,'')
			, ' ', REPLACE( CAST( P.valorMedida AS CHAR(12) ) , '.00', '')
			, ' ', IFNULL( UM.abreviatura ,'')
			, ' - Inv: ', REPLACE( CAST( ROUND( IFNULL( S.cantidad ,0) - IFNULL( S.cantidadBlock ,0) ,2) AS CHAR(12) ) , '.00', '')
			) AS text
        , P.bEnvase AS bCanEnvase
		
		, ROUND( IFNULL( S.cantidad ,0) - IFNULL( S.cantidadBlock ,0) ,2) AS canInv
		
		,(
		  SELECT COUNT(*) 
		  FROM words w
		  WHERE CONCAT(
			  IFNULL(CTP.abreviatura, ''),
			  '-', CAST(P.idproductocategoria AS CHAR(12)),
			  '-', IFNULL(CD.description, ''),
			  ' ', REPLACE(CAST(P.valorMedida AS CHAR(12)), '.00', ''),
			  ' ', IFNULL(UM.abreviatura, '')
		  ) LIKE CONCAT('%', w.palabra, '%')
		) AS iCountWords
	
    FROM productos AS P
	INNER JOIN cat_tipo_producto AS CTP ON CTP.active = 1 AND CTP.idCatTipoProducto = P.idCatTipoProducto
	INNER JOIN cat_descripciones AS CD ON CD.active = 1 AND CD.idDescription = P.idDescription
	INNER JOIN cat_unidad_medida AS UM ON UM.active = 1 AND UM.idUnidadMedida = P.idUnidadMedida
	LEFT JOIN stock AS S
		ON
			S.idOrigen = @idOrigen
			AND S.idProducto = P.idProducto
	WHERE
		P.active = 1
		AND CTP.idCatTipoProducto IN ( 1, 3, 5 ) -- PRODUCTOS
		AND
		(
			p_search = ''
			OR (
				SELECT COUNT(*) 
				FROM words w
				WHERE CONCAT(
					IFNULL(CTP.abreviatura, ''),
					'-', CAST(P.idproductocategoria AS CHAR(12)),
					'-', IFNULL(CD.description, ''),
					' ', REPLACE(CAST(P.valorMedida AS CHAR(12)), '.00', ''),
					' ', IFNULL(UM.abreviatura, '')
				) LIKE CONCAT('%', w.palabra, '%')
			) > 0
		)
    ORDER BY iCountWords DESC
	LIMIT 0, 20;

 END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `cbxArticulosParaES` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `cbxArticulosParaES`(
IN P_idEntradasSalidasH BIGINT
, IN p_idCatMov INT
, IN p_idOrigen INT
, IN p_search VARCHAR(500)
, IN p_idUserLogON BIGINT
)
BEGIN

	SET @idCatRelacionOrigen = 0;
	
	SET @idCatRelacionOrigen = IFNULL(
	(
		SELECT
		CRO.idCatRelacionOrigen
		FROM cat_relacion_origen AS CRO
		INNER JOIN origenes AS O
			ON
				O.idCatRelacionOrigen = CRO.idCatRelacionOrigen
		WHERE
			O.idOrigen = p_idOrigen
	)
	,0);
	
	SET @esEncargado = 0;
	
	SET @esEncargado = IFNULL(
	(
		SELECT
		COUNT(*)
		FROM origenes_responsables ORR
		WHERE
				ORR.idOrigen = p_idOrigen
				AND ORR.idUser = p_idUserLogON
		LIMIT 1
	)
	,0);
	
    WITH RECURSIVE words AS (
	  SELECT
		SUBSTRING_INDEX(p_search, ' ', 1) AS palabra,
		SUBSTRING(p_search, LOCATE(' ', p_search) + 1) AS rest
	  UNION ALL
	  SELECT
		SUBSTRING_INDEX(rest, ' ', 1) AS palabra,
		SUBSTRING(rest, LOCATE(' ', rest) + 1) AS rest
	  FROM words
	  WHERE rest <> '' AND LOCATE(' ', rest) > 0
	  UNION ALL
	  SELECT
		rest AS palabra,
		'' AS rest
	  FROM words
	  WHERE rest <> '' AND LOCATE(' ', rest) = 0
	)
	SELECT
	
		P.idProducto AS id
		, CONCAT( IFNULL( CTP.abreviatura ,'')
			, '-'
			, CAST( P.idproductocategoria AS CHAR(12) )
			, '-'
			, IFNULL( CD.description ,'')
			, ' '
			, REPLACE( CAST( P.valorMedida AS CHAR(12) ) , '.00', '')
			, ' '
			, IFNULL( UM.abreviatura ,'')
			, CASE WHEN @esEncargado > 0 THEN 
					CONCAT( CASE WHEN p_idCatMov IN( 3,5 ) THEN ' - Inv: ' ELSE '' END
					, CASE WHEN p_idCatMov IN( 3,5 ) THEN REPLACE( CAST( ROUND( IFNULL( S.cantidad ,0) - IFNULL( S.cantidadBlock ,0) ,2) AS CHAR(12) ) , '.00', '') ELSE '' END
					)
					ELSE '' END
			) AS text
        
         , CASE WHEN @esEncargado > 0 THEN ROUND( IFNULL( S.cantidad ,0) - IFNULL( S.cantidadBlock ,0) ,2) ELSE 0 END AS canInv
         
         ,(
		  SELECT COUNT(*) 
		  FROM words w
		  WHERE CONCAT(
			  IFNULL(CTP.abreviatura, ''),
			  '-', CAST(P.idproductocategoria AS CHAR(12)),
			  '-', IFNULL(CD.description, ''),
			  ' ', REPLACE(CAST(P.valorMedida AS CHAR(12)), '.00', ''),
			  ' ', IFNULL(UM.abreviatura, '')
		  ) LIKE CONCAT('%', w.palabra, '%')
		) AS iCountWords
    FROM productos AS P
	INNER JOIN cat_tipo_producto AS CTP ON CTP.active = 1 AND CTP.idCatTipoProducto = P.idCatTipoProducto
	INNER JOIN tipo_prod_by_origen AS TPBO
		ON
			TPBO.idCatRelacionOrigen = @idCatRelacionOrigen
			AND TPBO.idCatTipoProducto = CTP.idCatTipoProducto
	INNER JOIN cat_descripciones AS CD ON CD.active = 1 AND CD.idDescription = P.idDescription
	INNER JOIN cat_unidad_medida AS UM ON UM.active = 1 AND UM.idUnidadMedida = P.idUnidadMedida
	LEFT JOIN entradas_salidas_detalle AS ESD ON ESD.idEntradasSalidasH = P_idEntradasSalidasH AND ESD.idProducto = P.idProducto
	LEFT JOIN stock AS S
		ON
			S.idOrigen = p_idOrigen
			AND S.idProducto = P.idProducto
			
	WHERE
		P.active = 1
		AND ESD.idEntradasSalidasDetalle IS NULL -- QUE NO SE HAYA AGREGADO ESE ARTICULO
		AND
		(
			p_search = ''
            OR (
				SELECT COUNT(*) 
				FROM words w
				WHERE CONCAT(
					IFNULL(CTP.abreviatura, ''),
					'-', CAST(P.idproductocategoria AS CHAR(12)),
					'-', IFNULL(CD.description, ''),
					' ', REPLACE(CAST(P.valorMedida AS CHAR(12)), '.00', ''),
					' ', IFNULL(UM.abreviatura, '')
				) LIKE CONCAT('%', w.palabra, '%')
			) > 0
		)
    ORDER BY iCountWords DESC
	LIMIT 0, 20;
	
 END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `cbxArticulosParaOC` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `cbxArticulosParaOC`(
IN P_idOrdenDeCompra BIGINT
, IN p_search VARCHAR(500)
)
BEGIN
	
    WITH RECURSIVE words AS (
	  SELECT
		SUBSTRING_INDEX(p_search, ' ', 1) AS palabra,
		SUBSTRING(p_search, LOCATE(' ', p_search) + 1) AS rest
	  UNION ALL
	  SELECT
		SUBSTRING_INDEX(rest, ' ', 1) AS palabra,
		SUBSTRING(rest, LOCATE(' ', rest) + 1) AS rest
	  FROM words
	  WHERE rest <> '' AND LOCATE(' ', rest) > 0
	  UNION ALL
	  SELECT
		rest AS palabra,
		'' AS rest
	  FROM words
	  WHERE rest <> '' AND LOCATE(' ', rest) = 0
	)
	SELECT
		P.idProducto AS id
		, CONCAT( IFNULL( CTP.abreviatura ,''), '-', CAST( P.idproductocategoria AS CHAR(12) ) , '-', IFNULL( CD.description ,''), ' ', REPLACE( CAST( P.valorMedida AS CHAR(12) ) , '.00', ''), ' ', IFNULL( UM.abreviatura ,'') ) AS text
	
		,(
		  SELECT COUNT(*) 
		  FROM words w
		  WHERE CONCAT(
			  IFNULL(CTP.abreviatura, ''),
			  '-', CAST(P.idproductocategoria AS CHAR(12)),
			  '-', IFNULL(CD.description, ''),
			  ' ', REPLACE(CAST(P.valorMedida AS CHAR(12)), '.00', ''),
			  ' ', IFNULL(UM.abreviatura, '')
		  ) LIKE CONCAT('%', w.palabra, '%')
		) AS iCountWords
    FROM productos AS P
	INNER JOIN cat_tipo_producto AS CTP ON CTP.active = 1 AND CTP.idCatTipoProducto = P.idCatTipoProducto
	INNER JOIN cat_descripciones AS CD ON CD.active = 1 AND CD.idDescription = P.idDescription
	INNER JOIN cat_unidad_medida AS UM ON UM.active = 1 AND UM.idUnidadMedida = P.idUnidadMedida
	LEFT JOIN orden_compra_detalle AS OCD ON OCD.active = 1 AND OCD.idOrdenDeCompra = P_idOrdenDeCompra AND OCD.idProducto = P.idProducto
	WHERE
		P.active = 1
		AND OCD.idOrdenDeCompraDetalle IS NULL -- QUE NO SE HAYA AGREGADO ESE ARTICULO
		AND CTP.idCatTipoProducto IN ( 2, 5 ) -- MATERIAS PRIMAS E INSUMOS
		AND
		(
			p_search = ''
            OR (
				SELECT COUNT(*) 
				FROM words w
				WHERE CONCAT(
					IFNULL(CTP.abreviatura, ''),
					'-', CAST(P.idproductocategoria AS CHAR(12)),
					'-', IFNULL(CD.description, ''),
					' ', REPLACE(CAST(P.valorMedida AS CHAR(12)), '.00', ''),
					' ', IFNULL(UM.abreviatura, '')
				) LIKE CONCAT('%', w.palabra, '%')
			) > 0
		)
    ORDER BY iCountWords DESC
	LIMIT 0, 20;
 
 END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `cbxArticulosParaPedidosClientes` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `cbxArticulosParaPedidosClientes`(
IN p_search VARCHAR(500)
, IN p_idSucursal BIGINT
, IN p_idOrigenVendedor BIGINT
, IN p_idUserLogON BIGINT
)
BEGIN

	SET @idOrigen = IFNULL( p_idOrigenVendedor ,0);
    
    IF @idOrigen = 0 THEN
		SET @idOrigen = IFNULL(
		(
			SELECT
			idOrigen
			FROM origenes AS O
			WHERE
				O.idRelacion = p_idSucursal
				AND O.idCatRelacionOrigen = 1 -- SUCURSAL
		)
		,0);
	END IF;
	
	WITH RECURSIVE words AS (
	  SELECT
		SUBSTRING_INDEX(p_search, ' ', 1) AS palabra,
		SUBSTRING(p_search, LOCATE(' ', p_search) + 1) AS rest
	  UNION ALL
	  SELECT
		SUBSTRING_INDEX(rest, ' ', 1) AS palabra,
		SUBSTRING(rest, LOCATE(' ', rest) + 1) AS rest
	  FROM words
	  WHERE rest <> '' AND LOCATE(' ', rest) > 0
	  UNION ALL
	  SELECT
		rest AS palabra,
		'' AS rest
	  FROM words
	  WHERE rest <> '' AND LOCATE(' ', rest) = 0
	)
	SELECT
	
		P.idProducto AS id
		, CONCAT(
			IFNULL( CTP.abreviatura ,'')
			, '-' , CAST( P.idproductocategoria AS CHAR(12) )
			, '-', IFNULL( CD.description ,'')
			, ' ', REPLACE( CAST( P.valorMedida AS CHAR(12) ) , '.00', '')
			, ' ', IFNULL( UM.abreviatura ,'')
			, ' - Inv: ', REPLACE( CAST( ROUND( IFNULL( S.cantidad ,0) - IFNULL( S.cantidadBlock ,0) ,2) AS CHAR(12) ) , '.00', '')
			) AS text
        , P.bEnvase AS bCanEnvase
		
		, ROUND( IFNULL( S.cantidad ,0) - IFNULL( S.cantidadBlock ,0) ,2) AS canInv
		
		,(
		  SELECT COUNT(*) 
		  FROM words w
		  WHERE CONCAT(
			  IFNULL(CTP.abreviatura, ''),
			  '-', CAST(P.idproductocategoria AS CHAR(12)),
			  '-', IFNULL(CD.description, ''),
			  ' ', REPLACE(CAST(P.valorMedida AS CHAR(12)), '.00', ''),
			  ' ', IFNULL(UM.abreviatura, '')
		  ) LIKE CONCAT('%', w.palabra, '%')
		) AS iCountWords
	
    FROM productos AS P
	INNER JOIN cat_tipo_producto AS CTP ON CTP.active = 1 AND CTP.idCatTipoProducto = P.idCatTipoProducto
	INNER JOIN cat_descripciones AS CD ON CD.active = 1 AND CD.idDescription = P.idDescription
	INNER JOIN cat_unidad_medida AS UM ON UM.active = 1 AND UM.idUnidadMedida = P.idUnidadMedida
	LEFT JOIN stock AS S
		ON
			S.idOrigen = @idOrigen
			AND S.idProducto = P.idProducto
	WHERE
		P.active = 1
		AND CTP.idCatTipoProducto IN ( 1, 3, 5 ) -- PRODUCTOS
		AND
		(
			p_search = ''
			OR (
				SELECT COUNT(*) 
				FROM words w
				WHERE CONCAT(
					IFNULL(CTP.abreviatura, ''),
					'-', CAST(P.idproductocategoria AS CHAR(12)),
					'-', IFNULL(CD.description, ''),
					' ', REPLACE(CAST(P.valorMedida AS CHAR(12)), '.00', ''),
					' ', IFNULL(UM.abreviatura, '')
				) LIKE CONCAT('%', w.palabra, '%')
			) > 0
		)
    ORDER BY iCountWords DESC
	LIMIT 0, 20;

 END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `cbxArticulosParaRepVentas` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `cbxArticulosParaRepVentas`(
IN p_search VARCHAR(500)
, IN p_idUserLogON BIGINT
)
BEGIN

	WITH RECURSIVE words AS (
	  SELECT
		SUBSTRING_INDEX(p_search, ' ', 1) AS palabra,
		SUBSTRING(p_search, LOCATE(' ', p_search) + 1) AS rest
	  UNION ALL
	  SELECT
		SUBSTRING_INDEX(rest, ' ', 1) AS palabra,
		SUBSTRING(rest, LOCATE(' ', rest) + 1) AS rest
	  FROM words
	  WHERE rest <> '' AND LOCATE(' ', rest) > 0
	  UNION ALL
	  SELECT
		rest AS palabra,
		'' AS rest
	  FROM words
	  WHERE rest <> '' AND LOCATE(' ', rest) = 0
	)
	SELECT
		P.idProducto AS id,
		CONCAT(
			IFNULL(CTP.abreviatura, ''),
			'-', CAST(P.idproductocategoria AS CHAR(12)),
			'-', IFNULL(CD.description, ''),
			' ', REPLACE(CAST(P.valorMedida AS CHAR(12)), '.00', ''),
			' ', IFNULL(UM.abreviatura, '')
		) AS text,
		P.bEnvase AS bCanEnvase,
		(
		  SELECT COUNT(*) 
		  FROM words w
		  WHERE CONCAT(
			  IFNULL(CTP.abreviatura, ''),
			  '-', CAST(P.idproductocategoria AS CHAR(12)),
			  '-', IFNULL(CD.description, ''),
			  ' ', REPLACE(CAST(P.valorMedida AS CHAR(12)), '.00', ''),
			  ' ', IFNULL(UM.abreviatura, '')
		  ) LIKE CONCAT('%', w.palabra, '%')
		) AS iCountWords
	FROM productos AS P
	INNER JOIN cat_tipo_producto AS CTP ON CTP.active = 1 AND CTP.idCatTipoProducto = P.idCatTipoProducto
	INNER JOIN cat_descripciones AS CD ON CD.active = 1 AND CD.idDescription = P.idDescription
	INNER JOIN cat_unidad_medida AS UM ON UM.active = 1 AND UM.idUnidadMedida = P.idUnidadMedida
	WHERE
		P.active = 1
		AND CTP.idCatTipoProducto IN (1)
		AND (
			p_search = ''
			OR (
				SELECT COUNT(*) 
				FROM words w
				WHERE CONCAT(
					IFNULL(CTP.abreviatura, ''),
					'-', CAST(P.idproductocategoria AS CHAR(12)),
					'-', IFNULL(CD.description, ''),
					' ', REPLACE(CAST(P.valorMedida AS CHAR(12)), '.00', ''),
					' ', IFNULL(UM.abreviatura, '')
				) LIKE CONCAT('%', w.palabra, '%')
			) > 0
		)
	ORDER BY iCountWords DESC
	LIMIT 0, 20;
	
 END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `cbxCatMovEntradaSalida` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `cbxCatMovEntradaSalida`(
IN p_search VARCHAR(500)
, IN P_ALL INT
, IN P_idUserLogON BIGINT
)
BEGIN

	DROP TEMPORARY TABLE IF EXISTS actionsList;
	
	CREATE TEMPORARY TABLE actionsList (
		id BIGINT AUTO_INCREMENT,
		idAction BIGINT,
		name VARCHAR(5000),
		PRIMARY KEY(id)
	) ENGINE=InnoDB;
	
	INSERT INTO actionsList( idAction, name )
	SELECT DISTINCT
	A.idAction
	, A.name
	FROM actions AS A
	INNER JOIN actionsconf AS AC ON AC.active = 1 AND relationType = 'R' AND A.idAction = AC.idAction
	INNER JOIN user_roles AS RC ON AC.idRelation = RC.idRol
	INNER JOIN users AS U ON RC.idUser = U.idUser
	WHERE A.active = 1
	AND U.idUser = P_idUserLogON
	;
	
	INSERT INTO actionsList( idAction, name )
	SELECT DISTINCT
	A.idAction
	, A.name
	FROM actions AS A
	INNER JOIN actionsconf AS AC ON AC.active = 1 AND AC.relationType = 'U' AND A.idAction = AC.idAction
	INNER JOIN users AS U ON AC.idRelation = U.idUser
	WHERE A.active = 1
	AND U.idUser = P_idUserLogON
	;
	
	SET @ES_Transferencia = 0;
	SET @ES_EntradaManual = 0;
	SET @ES_SalidaManual = 0;
	SET @ES_CompraProveedor = 0;
	
	SET @ES_Transferencia = ( SELECT COUNT(*) FROM actionsList WHERE name = 'ES_Transferencia' );
	SET @ES_EntradaManual = ( SELECT COUNT(*) FROM actionsList WHERE name = 'ES_EntradaManual' );
	SET @ES_SalidaManual = ( SELECT COUNT(*) FROM actionsList WHERE name = 'ES_SalidaManual' );
	SET @ES_CompraProveedor = ( SELECT COUNT(*) FROM actionsList WHERE name = 'ES_CompraProveedor' );
	
	DROP TEMPORARY TABLE IF EXISTS actionsList;

	SELECT
	
		CMES.idCatMov AS id
		, IFNULL( CMES.description ,'') AS text
	
	FROM cat_mov_entrada_salida AS CMES
	WHERE
		CMES.active = 1
        AND CMES.idCatMov IN( 3, 4, 5, 6 )
		AND
		(
			( @ES_Transferencia > 0 AND CMES.idCatMov IN( 3 ) )
			OR ( @ES_EntradaManual > 0 AND CMES.idCatMov IN( 4 ) )
			OR ( @ES_SalidaManual > 0 AND CMES.idCatMov IN( 5 ) )
			OR ( @ES_CompraProveedor > 0 AND CMES.idCatMov IN( 6 ) )
            OR P_ALL = 1
		)
		AND
		(
			p_search = ''
			OR IFNULL( CMES.description ,'') LIKE CONCAT('%', p_search ,'%')
		)
    ORDER BY CMES.idCatMov ASC
	LIMIT 0, 20;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `cbxCatRelacionOrigen` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `cbxCatRelacionOrigen`(
IN p_search VARCHAR(500)
)
BEGIN

SET SESSION TRANSACTION ISOLATION LEVEL READ UNCOMMITTED ;

	SELECT
	
		CMES.idCatRelacionOrigen AS id
		, IFNULL( CMES.name ,'') AS text
	
	FROM cat_relacion_origen AS CMES
	WHERE
		CMES.active = 1
        AND CMES.idCatRelacionOrigen IN( 3, 4, 5, 6, 7 )
		AND
		(
			p_search = ''
			OR IFNULL( CMES.name ,'') LIKE CONCAT('%', p_search ,'%')
		)
    ORDER BY CMES.idCatRelacionOrigen ASC
	LIMIT 0, 5;

 SET SESSION TRANSACTION ISOLATION LEVEL REPEATABLE READ ;
 
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `cbxCatStatusCotizaciones` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `cbxCatStatusCotizaciones`(
IN p_search VARCHAR(500)
)
BEGIN

	SELECT
	
		CMES.idCatStatusCotizaciones AS id
		, IFNULL( CMES.name ,'') AS text
        , IFNULL( CMES.description ,'') AS catStatusCotizacionesDesc
	
	FROM cat_status_cotizaciones AS CMES
	WHERE
		CMES.active = 1
		AND
		(
			p_search = ''
			OR IFNULL( CMES.name ,'') LIKE CONCAT('%', p_search ,'%')
		)
    ORDER BY CMES.idCatStatusCotizaciones ASC
	LIMIT 0, 15;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `cbxCatStatusPedidosClientes` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `cbxCatStatusPedidosClientes`(
IN p_search VARCHAR(500)
, IN p_bChangeStatus SMALLINT
)
BEGIN

SET SESSION TRANSACTION ISOLATION LEVEL READ UNCOMMITTED ;

	SELECT
	
		CMES.idCatStatusPedidosClientes AS id
		, IFNULL( CMES.name ,'') AS text
        , IFNULL( CMES.description ,'') AS catStatusPedidosClientesDesc
	
	FROM cat_status_pedidos_clientes AS CMES
	WHERE
		CMES.active = 1
        AND
        (
			p_bChangeStatus = 0
            OR CMES.idCatStatusPedidosClientes IN( 6, 7, 8 )
        )
		AND
		(
			p_search = ''
			OR IFNULL( CMES.name ,'') LIKE CONCAT('%', p_search ,'%')
		)
    ORDER BY CMES.idCatStatusPedidosClientes ASC
	LIMIT 0, 15;

 SET SESSION TRANSACTION ISOLATION LEVEL REPEATABLE READ ;
 
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `cbxEntradasSalidasStatusFilterES` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `cbxEntradasSalidasStatusFilterES`(
IN p_search VARCHAR(500)
, IN p_idUserLogON BIGINT
)
BEGIN

SET SESSION TRANSACTION ISOLATION LEVEL READ UNCOMMITTED ;

	SELECT
	
		idEntradaSalidaStatus AS id
        , name AS text
        
    FROM entradas_salidas_status
	WHERE
		active = 1
		AND
		(
			p_search = ''
			OR name LIKE CONCAT('%', p_search ,'%')
		)
    ORDER BY idEntradaSalidaStatus DESC
	LIMIT 0, 5;

 SET SESSION TRANSACTION ISOLATION LEVEL REPEATABLE READ ;
 
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `cbxGetClientes` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `cbxGetClientes`(
IN p_search VARCHAR(500)
)
BEGIN

SET SESSION TRANSACTION ISOLATION LEVEL READ UNCOMMITTED ;
	
	SELECT
	C.idCliente AS id
	, CONCAT( C.nombre, ' - ', IFNULL( TC.name ,'') ) AS text
	FROM clientes as C
    LEFT JOIN cat_tipo_cliente AS TC ON C.idTipoCliente = TC.idTipoCliente
	WHERE
		C.active = 1
		AND
		(
			p_search = ''
			OR C.nombre LIKE CONCAT('%', p_search ,'%')
		)
    ORDER BY C.idCliente DESC
	LIMIT 0, 10;

 SET SESSION TRANSACTION ISOLATION LEVEL REPEATABLE READ ;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `cbxGetClientesParaCotizaciones` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `cbxGetClientesParaCotizaciones`(
IN p_search VARCHAR(500)
)
BEGIN

	SELECT
	C.idCliente AS id
	, CONCAT(
	C.nombre
	, ' - '
	, IFNULL( TC.name ,'')
	, IF( C.active = 0, ' - INACTIVO', '' )
	, IF( IFNULL( C.bProspecto ,0) = 1, ' - PROSPECTO', '' )
	) AS text
	FROM clientes as C
    LEFT JOIN cat_tipo_cliente AS TC ON C.idTipoCliente = TC.idTipoCliente
	WHERE
		C.idTipoCliente NOT IN( 1 )
        AND C.idTipoCliente > 0
		-- AND IFNULL( C.bProspecto ,0) = 1
		AND
		(
			p_search = ''
			OR CONCAT( C.nombre, ' - ', IFNULL( TC.name ,'') ) LIKE CONCAT('%', p_search ,'%')
		)
    ORDER BY C.idCliente DESC
	LIMIT 0, 10;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `cbxGetClientesParaPedidos` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `cbxGetClientesParaPedidos`(
IN p_search VARCHAR(500)
)
BEGIN

	SELECT
	C.idCliente AS id
	, CONCAT( C.nombre, ' - ', IFNULL( TC.name ,''), IF( C.active = 0, ' - INACTIVO', '' ) ) AS text
	FROM clientes as C
    LEFT JOIN cat_tipo_cliente AS TC ON C.idTipoCliente = TC.idTipoCliente
	WHERE
		C.idTipoCliente NOT IN( 1 )
        AND C.idTipoCliente > 0
		AND
		(
			p_search = ''
			OR CONCAT( C.nombre, ' - ', IFNULL( TC.name ,'') ) LIKE CONCAT('%', p_search ,'%')
		)
    ORDER BY C.idCliente DESC
	LIMIT 0, 10;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `cbxGetClientesParaVentasClientes` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `cbxGetClientesParaVentasClientes`(
IN p_search VARCHAR(500)
)
BEGIN
	
	SELECT
	C.idCliente AS id
	, CONCAT( C.nombre, ' - ', IFNULL( TC.name ,''), IF( C.active = 0, ' - INACTIVO', '' ) ) AS text
	, C.bCredito
	, IFNULL( C.limiteCredito ,0) AS limiteCredito
	
	, V.idVendedor
	, V.nombre AS vendedorName
	
	FROM clientes as C
    INNER JOIN vendedores AS V ON V.idVendedor = C.idVendedor
	INNER JOIN cat_tipo_cliente AS TC ON C.idTipoCliente = TC.idTipoCliente
	
	WHERE
		C.idTipoCliente NOT IN( 1 ) -- QUE NO SEA EL CLIENTE GENERAL
        AND C.idTipoCliente > 0
		AND
		(
			p_search = ''
			OR CONCAT( C.nombre, ' - ', IFNULL( TC.name ,'') ) LIKE CONCAT('%', p_search ,'%')
		)
    ORDER BY C.idCliente DESC
	LIMIT 0, 10;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `cbxGetDepartamentos` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `cbxGetDepartamentos`(
IN p_search VARCHAR(500)
)
BEGIN
	
	SELECT
	
		C.idDepartamento
		, C.name
		, C.active
	
    FROM cat_departamentos AS C
	WHERE
		C.active = 1
		AND
		(
			p_search = ''
			OR C.name LIKE CONCAT('%', p_search ,'%')
		)
        AND C.idDepartamento NOT IN( 4 )
    ORDER BY C.idDepartamento ASC
	LIMIT 0, 50;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `cbxGetEmployeesForOrigen` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `cbxGetEmployeesForOrigen`(
IN p_idOrigen BIGINT
, IN p_search VARCHAR(500)
)
BEGIN

SET SESSION TRANSACTION ISOLATION LEVEL READ UNCOMMITTED ;
	
	SELECT
	
		U.idUser AS id
		, U.name AS text
	
    FROM users AS U
	LEFT JOIN origenes_responsables AS ORR ON ORR.idUser = U.idUser AND ORR.idOrigen = p_idOrigen
	WHERE
		U.active = 1
		AND ORR.idUser IS NULL
		AND
		(
			p_search = ''
			OR U.name LIKE CONCAT('%', p_search ,'%')
		)
    ORDER BY U.name ASC
	LIMIT 0, 5;
	

 SET SESSION TRANSACTION ISOLATION LEVEL REPEATABLE READ ;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `cbxGetFamilias` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `cbxGetFamilias`(
IN p_search VARCHAR(500)
)
BEGIN
	
	SELECT
	
		C.idFamilia
		, C.name
		, C.active
	
    FROM cat_familias AS C
	WHERE
		C.active = 1
		AND
		(
			p_search = ''
			OR C.name LIKE CONCAT('%', p_search ,'%')
		)
        AND C.idFamilia NOT IN( 1 )
    ORDER BY C.idFamilia ASC
	LIMIT 0, 50;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `cbxGetFamiliasByProductos` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `cbxGetFamiliasByProductos`(
IN p_search VARCHAR(500)
)
BEGIN
	
	SELECT
	
		C.idFamilia
		, CONCAT( IF( IFNULL( D.idDepartamento ,0) = 0, 'NONE', D.name ), ' - ', C.name ) AS name
		, C.active
        , IFNULL( D.idDepartamento ,0) AS idDepartamento
	
    FROM cat_familias AS C
	LEFT JOIN cat_departamentos AS D
		ON
			C.idDepartamento NOT IN( 4 )
			AND D.idDepartamento = C.idDepartamento
	WHERE
		C.active = 1
        AND C.idFamilia NOT IN( 1 )
		AND
		(
			p_search = ''
			OR CONCAT( IF( IFNULL( D.idDepartamento ,0) = 0, 'NONE', D.name ), ' - ', C.name ) LIKE CONCAT('%', p_search ,'%')
		)
    ORDER BY C.idFamilia ASC
	LIMIT 0, 50;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `cbxGetGiros` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `cbxGetGiros`(
IN p_search VARCHAR(500)
)
BEGIN

        SELECT

			G.idGiro
			, G.name
			, G.active

    FROM giros AS G
	WHERE
		G.active = 1
		AND
		(
			p_search = ''
			OR G.name LIKE CONCAT('%', p_search ,'%')
		)
    ORDER BY G.idGiro ASC
	LIMIT 0, 50;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `cbxGetInsumosByProducto` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `cbxGetInsumosByProducto`(
IN P_idProducto BIGINT
, IN p_search VARCHAR(500)
)
BEGIN

SET SESSION TRANSACTION ISOLATION LEVEL READ UNCOMMITTED ;
	
	SELECT
	
		P.idProducto AS id
		, CONCAT( IFNULL( CTP.abreviatura ,''), '-', CAST( P.idproductocategoria AS CHAR(12) ) , '-', IFNULL( CD.description ,''), ' ', REPLACE( CAST( P.valorMedida AS CHAR(12) ) , '.00', ''), ' ', IFNULL( UM.abreviatura ,'') ) AS text
	
    FROM productos AS P
	INNER JOIN cat_tipo_producto AS CTP ON CTP.active = 1 AND CTP.idCatTipoProducto = P.idCatTipoProducto
	INNER JOIN cat_descripciones AS CD ON CD.active = 1 AND CD.idDescription = P.idDescription
	INNER JOIN cat_unidad_medida AS UM ON UM.active = 1 AND UM.idUnidadMedida = P.idUnidadMedida
	LEFT JOIN insumos_productos AS FPB ON FPB.active = 1 AND FPB.idProducto = P_idProducto AND FPB.idInsumo = P.idProducto
	WHERE
		P.active = 1
		AND P.idCatTipoProducto IN ( 5 ) -- 1: Producto, 2: Materia Prima, 3: Productos Base, 4: Productos Agranel, 5: Insumo
		AND FPB.keyx IS NULL -- QUE NO SE HAYA AGREGADO ESE INSUMO
		AND
		(
			p_search = ''
			OR CONCAT( IFNULL( CTP.abreviatura ,''), '-', CAST( P.idproductocategoria AS CHAR(12) ) , '-', IFNULL( CD.description ,''), ' ', REPLACE( CAST( P.valorMedida AS CHAR(12) ) , '.00', ''), ' ', IFNULL( UM.abreviatura ,'') ) LIKE CONCAT('%', p_search ,'%')
		)
    ORDER BY P.idProducto DESC
	LIMIT 0, 5;

 SET SESSION TRANSACTION ISOLATION LEVEL REPEATABLE READ ;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `cbxGetMateriasPrimasByFormulaProdBase` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `cbxGetMateriasPrimasByFormulaProdBase`(
IN P_idProductoBase BIGINT
, IN p_search VARCHAR(500)
)
BEGIN

SET SESSION TRANSACTION ISOLATION LEVEL READ UNCOMMITTED ;
	
	SELECT
	
		P.idProducto AS id
		, CONCAT( IFNULL( CTP.abreviatura ,''), '-', CAST( P.idproductocategoria AS CHAR(12) ) , '-', IFNULL( CD.description ,''), ' ', REPLACE( CAST( P.valorMedida AS CHAR(12) ) , '.00', ''), ' ', IFNULL( UM.abreviatura ,'') ) AS text
	
    FROM productos AS P
	INNER JOIN cat_tipo_producto AS CTP ON CTP.active = 1 AND CTP.idCatTipoProducto = P.idCatTipoProducto
	INNER JOIN cat_descripciones AS CD ON CD.active = 1 AND CD.idDescription = P.idDescription
	INNER JOIN cat_unidad_medida AS UM ON UM.active = 1 AND UM.idUnidadMedida = P.idUnidadMedida
	LEFT JOIN formulas_prod_base AS FPB ON FPB.active = 1 AND FPB.idProductoBase = P_idProductoBase AND FPB.idMateriaPrima = P.idProducto
	WHERE
		P.active = 1
		AND P.idCatTipoProducto IN ( 2 ) -- 1: Producto, 2: Materia Prima, 3: Productos Base, 4: Productos Agranel
		AND FPB.idFormula IS NULL -- QUE NO SE HAYA AGREGADO ESA MATERIA PRIMA
		AND
		(
			p_search = ''
			OR CONCAT( IFNULL( CTP.abreviatura ,''), '-', CAST( P.idproductocategoria AS CHAR(12) ) , '-', IFNULL( CD.description ,''), ' ', REPLACE( CAST( P.valorMedida AS CHAR(12) ) , '.00', ''), ' ', IFNULL( UM.abreviatura ,'') ) LIKE CONCAT('%', p_search ,'%')
		)
    ORDER BY P.idProducto DESC
	LIMIT 0, 5;

 SET SESSION TRANSACTION ISOLATION LEVEL REPEATABLE READ ;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `cbxGetProductosBase` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `cbxGetProductosBase`(
IN p_search VARCHAR(500)
)
BEGIN
	
    WITH RECURSIVE words AS (
	  SELECT
		SUBSTRING_INDEX(p_search, ' ', 1) AS palabra,
		SUBSTRING(p_search, LOCATE(' ', p_search) + 1) AS rest
	  UNION ALL
	  SELECT
		SUBSTRING_INDEX(rest, ' ', 1) AS palabra,
		SUBSTRING(rest, LOCATE(' ', rest) + 1) AS rest
	  FROM words
	  WHERE rest <> '' AND LOCATE(' ', rest) > 0
	  UNION ALL
	  SELECT
		rest AS palabra,
		'' AS rest
	  FROM words
	  WHERE rest <> '' AND LOCATE(' ', rest) = 0
	)
	SELECT
	
		P.idProducto AS id
		, CONCAT( IFNULL( CTP.abreviatura ,''), '-', CAST( P.idproductocategoria AS CHAR(12) ) , '-', IFNULL( CD.description ,''), ' ', REPLACE( CAST( P.valorMedida AS CHAR(12) ) , '.00', ''), ' ', IFNULL( UM.abreviatura ,'') ) AS text
        
        ,(
		  SELECT COUNT(*) 
		  FROM words w
		  WHERE CONCAT(
			  IFNULL(CTP.abreviatura, ''),
			  '-', CAST(P.idproductocategoria AS CHAR(12)),
			  '-', IFNULL(CD.description, ''),
			  ' ', REPLACE(CAST(P.valorMedida AS CHAR(12)), '.00', ''),
			  ' ', IFNULL(UM.abreviatura, '')
		  ) LIKE CONCAT('%', w.palabra, '%')
		) AS iCountWords
	
    FROM productos AS P
	INNER JOIN cat_tipo_producto AS CTP ON CTP.active = 1 AND CTP.idCatTipoProducto = P.idCatTipoProducto
	INNER JOIN cat_descripciones AS CD ON CD.active = 1 AND CD.idDescription = P.idDescription
	INNER JOIN cat_unidad_medida AS UM ON UM.active = 1 AND UM.idUnidadMedida = P.idUnidadMedida
	WHERE
		P.active = 1
		AND P.idCatTipoProducto IN ( 3 ) -- 1: Producto, 2: Materia Prima, 3: Productos Base, 4: Productos Agranel
		AND
		(
			p_search = ''
            OR (
				SELECT COUNT(*) 
				FROM words w
				WHERE CONCAT(
					IFNULL(CTP.abreviatura, ''),
					'-', CAST(P.idproductocategoria AS CHAR(12)),
					'-', IFNULL(CD.description, ''),
					' ', REPLACE(CAST(P.valorMedida AS CHAR(12)), '.00', ''),
					' ', IFNULL(UM.abreviatura, '')
				) LIKE CONCAT('%', w.palabra, '%')
			) > 0
		)
    ORDER BY iCountWords DESC
	LIMIT 0, 20;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `cbxGetProveedores` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `cbxGetProveedores`(
IN p_search VARCHAR(500)
)
BEGIN

SET SESSION TRANSACTION ISOLATION LEVEL READ UNCOMMITTED ;
	
	SELECT
	
		P.idProveedor AS id
		, CONCAT( P.rfc, '-' , P.nombre ) AS text
	
    FROM proveedores AS P
	WHERE
		P.active = 1
		AND
		(
			p_search = ''
			OR CONCAT( P.rfc, '-' , P.nombre ) LIKE CONCAT('%', p_search ,'%')
		)
    ORDER BY P.idProveedor DESC
	LIMIT 0, 5;

 SET SESSION TRANSACTION ISOLATION LEVEL REPEATABLE READ ;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `cbxGetRepartidores` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `cbxGetRepartidores`(
IN p_search VARCHAR(500)
)
BEGIN

SET SESSION TRANSACTION ISOLATION LEVEL READ UNCOMMITTED ;
	
	SELECT
	
		U.idUser AS id
		, U.name AS text
	
    FROM users AS U
	WHERE
		U.active = 1
		AND
		(
			p_search = ''
			OR U.name LIKE CONCAT('%', p_search ,'%')
		)
    ORDER BY U.name ASC
	LIMIT 0, 5;
	

 SET SESSION TRANSACTION ISOLATION LEVEL REPEATABLE READ ;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `cbxGetSucursales` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `cbxGetSucursales`(
IN p_search VARCHAR(500)
, IN p_idUserLogON BIGINT
)
BEGIN

SET SESSION TRANSACTION ISOLATION LEVEL READ UNCOMMITTED ;
	
	SELECT
	S.idSucursal AS id
	, S.name AS text
	FROM sucursales as S
	INNER JOIN origenes AS O ON O.idCatRelacionOrigen = 1 AND O.idRelacion = S.idSucursal
	INNER JOIN origenes_config AS OC ON OC.idOrigen = O.idOrigen
	WHERE
		S.active = 1
		AND O.active = 1
		AND OC.idUser = p_idUserLogON
		AND
		(
			p_search = ''
			OR S.name LIKE CONCAT('%', p_search ,'%')
		)
    ORDER BY S.idSucursal DESC
	LIMIT 0, 10;

 SET SESSION TRANSACTION ISOLATION LEVEL REPEATABLE READ ;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `cbxGetSucursalesCombo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `cbxGetSucursalesCombo`(
IN p_search VARCHAR(500)
, IN p_idUserLogON BIGINT
)
BEGIN

SET SESSION TRANSACTION ISOLATION LEVEL READ UNCOMMITTED ;
	
	SELECT
	S.idSucursal AS id
	, S.name AS text
	FROM sucursales as S
	INNER JOIN sucursalesconfig AS SC ON S.idSucursal = SC.idSucursal
	WHERE
		S.active = 1
		AND SC.idUser = p_idUserLogON
		AND
		(
			p_search = ''
			OR S.name LIKE CONCAT('%', p_search ,'%')
		)
    ORDER BY S.idSucursal DESC
	LIMIT 0, 10;

 SET SESSION TRANSACTION ISOLATION LEVEL REPEATABLE READ ;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `cbxGetTipoClienteEmprendedores` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `cbxGetTipoClienteEmprendedores`(
IN p_search VARCHAR(500)
)
BEGIN
	
	SELECT
	
		C.idTipoCliente AS id
		, C.name AS text
	
    FROM cat_tipo_cliente AS C
	WHERE
		C.active = 1
        AND C.idTipoCliente IN( 3, 4, 6, 7 )
		AND
		(
			p_search = ''
			OR C.name LIKE CONCAT('%', p_search ,'%')
		)
    ORDER BY C.idTipoCliente ASC
	LIMIT 0, 50;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `cbxGetTiposDeVenta` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `cbxGetTiposDeVenta`(
IN p_search VARCHAR(500)
, IN p_idCliente BIGINT
)
BEGIN

SET SESSION TRANSACTION ISOLATION LEVEL READ UNCOMMITTED ;
	
	SELECT
	
		C.idTipoVenta AS id
		, C.name AS text
	
    FROM cat_tipo_venta AS C
	WHERE
		C.active = 1
		AND
		(
			p_search = ''
			OR C.name LIKE CONCAT('%', p_search ,'%')
		)
    ORDER BY C.name ASC
	LIMIT 0, 5;
	

 SET SESSION TRANSACTION ISOLATION LEVEL REPEATABLE READ ;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `cbxGetUnidadesMedida` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `cbxGetUnidadesMedida`(
IN p_search VARCHAR(500)
)
BEGIN

SET SESSION TRANSACTION ISOLATION LEVEL READ UNCOMMITTED ;
	
	SELECT
	
		UM.idUnidadMedida AS id
		, UM.name AS text
	
    FROM cat_unidad_medida AS UM
	WHERE
		UM.active = 1
		AND
		(
			p_search = ''
			OR UM.name LIKE CONCAT('%', p_search ,'%')
		)
    ORDER BY UM.idUnidadMedida DESC
	LIMIT 0, 5;

 SET SESSION TRANSACTION ISOLATION LEVEL REPEATABLE READ ;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `cbxGetUsersByVendedor` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `cbxGetUsersByVendedor`(
IN p_search VARCHAR(500)
)
BEGIN

SET SESSION TRANSACTION ISOLATION LEVEL READ UNCOMMITTED ;
	
	SELECT
	
		U.idUser AS id
		, CONCAT( U.name , ' - ', U.userName ) AS text
	
    FROM users as U
	INNER JOIN user_roles AS UR ON UR.idUser = U.idUser 
    INNER JOIN roles AS R ON R.idRol = UR.idRol AND R.name LIKE '%Vendedor%'
	WHERE
	(
		p_search = ''
		OR U.name LIKE CONCAT('%', p_search ,'%')
		OR U.userName LIKE CONCAT('%', p_search ,'%')
	)
    ORDER BY U.idUser DESC
	LIMIT 0, 5;

 SET SESSION TRANSACTION ISOLATION LEVEL REPEATABLE READ ;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `cbxGetVendedores` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `cbxGetVendedores`(
IN p_search VARCHAR(500)
, IN p_idUserLogON BIGINT
)
BEGIN

SET SESSION TRANSACTION ISOLATION LEVEL READ UNCOMMITTED ;
	
	SELECT
	C.idVendedor AS id
	, C.nombre AS text
	FROM vendedores as C
	WHERE
		C.active = 1
		AND
		(
			p_search = ''
			OR C.nombre LIKE CONCAT('%', p_search ,'%')
		)
    ORDER BY C.idVendedor DESC
	LIMIT 0, 10;

 SET SESSION TRANSACTION ISOLATION LEVEL REPEATABLE READ ;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `cbxGetZonas` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `cbxGetZonas`(
IN p_search VARCHAR(500)
)
BEGIN
	
	SELECT
	
		Z.idZona
		, Z.name
		, Z.active
	
    FROM zonas AS Z
	WHERE
		Z.active = 1
		AND
		(
			p_search = ''
			OR Z.name LIKE CONCAT('%', p_search ,'%')
		)
    ORDER BY Z.idZona ASC
	LIMIT 0, 50;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `cbxOrigenes` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `cbxOrigenes`(
IN p_search VARCHAR(500)
)
BEGIN

SET SESSION TRANSACTION ISOLATION LEVEL READ UNCOMMITTED ;

	SELECT
	
		O.idOrigen AS id
        , CONCAT( IFNULL( CRO.abreviatura ,''), '-', CAST( O.idOrigen AS CHAR(12) ), '-', O.nombre ) AS text
        
    FROM origenes AS O
    INNER JOIN cat_relacion_origen AS CRO ON CRO.idCatRelacionOrigen = O.idCatRelacionOrigen
	WHERE
		O.active = 1
		AND
		(
			p_search = ''
			OR CONCAT( IFNULL( CRO.abreviatura ,''), '-', CAST( O.idOrigen AS CHAR(12) ), '-', O.nombre ) LIKE CONCAT('%', p_search ,'%')
		)
    ORDER BY O.idOrigen DESC
	LIMIT 0, 5;

 SET SESSION TRANSACTION ISOLATION LEVEL REPEATABLE READ ;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `cbxOrigenesForConvert` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `cbxOrigenesForConvert`(
IN p_search VARCHAR(500)

, IN p_idUserLogON BIGINT
)
BEGIN

	SELECT
	
		O.idOrigen AS id
        , CONCAT( IFNULL( CRO.abreviatura ,''), '-', CAST( O.idOrigen AS CHAR(12) ), '-', O.nombre ) AS text
        
    FROM origenes AS O
    INNER JOIN cat_relacion_origen AS CRO ON CRO.idCatRelacionOrigen = O.idCatRelacionOrigen
	INNER JOIN tipo_prod_by_origen AS TPBO ON TPBO.idCatTipoProducto = 1 AND TPBO.idCatRelacionOrigen = CRO.idCatRelacionOrigen
	INNER JOIN origenes_responsables AS ORR ON ORR.idOrigen = O.idOrigen AND ORR.idUser = p_idUserLogON
	WHERE
		O.active = 1
		AND
		(
			p_search = ''
			OR CONCAT( IFNULL( CRO.abreviatura ,''), '-', CAST( O.idOrigen AS CHAR(12) ), '-', O.nombre ) LIKE CONCAT('%', p_search ,'%')
		)
	GROUP BY O.idOrigen
	, CRO.abreviatura
	, O.nombre
	
    ORDER BY O.idOrigen DESC
	LIMIT 0, 5;

 END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `cbxOrigenesForES` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `cbxOrigenesForES`(
IN p_search VARCHAR(500)
, IN p_idESType INT
)
BEGIN

SET SESSION TRANSACTION ISOLATION LEVEL READ UNCOMMITTED ;

	SELECT
	
		O.idOrigen AS id
        , CONCAT( IFNULL( CRO.abreviatura ,''), '-', CAST( O.idOrigen AS CHAR(12) ), '-', O.nombre ) AS text
        
    FROM origenes AS O
    INNER JOIN cat_relacion_origen AS CRO ON CRO.idCatRelacionOrigen = O.idCatRelacionOrigen
	WHERE
		O.active = 1
		AND
		(
			(
				p_idESType = 6
				AND ( O.idCatRelacionOrigen = 1
                OR O.idOrigen = 18)
			)
			OR p_idESType <> 6
		)
		AND
		(
			p_search = ''
			OR CONCAT( IFNULL( CRO.abreviatura ,''), '-', CAST( O.idOrigen AS CHAR(12) ), '-', O.nombre ) LIKE CONCAT('%', p_search ,'%')
		)
    ORDER BY O.idOrigen DESC
	LIMIT 0, 5;

 SET SESSION TRANSACTION ISOLATION LEVEL REPEATABLE READ ;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `cbxOrigenesFromFilterES` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `cbxOrigenesFromFilterES`(
IN p_search VARCHAR(500)
, IN p_idUserLogON BIGINT
)
BEGIN

SET SESSION TRANSACTION ISOLATION LEVEL READ UNCOMMITTED ;

	-- DROP TABLE IF EXISTS oOrigenes;

	-- CREATE TEMPORARY TABLE oOrigenes (
		-- id BIGINT AUTO_INCREMENT,
		-- idOrigen BIGINT
		-- PRIMARY KEY(id)
	-- ) ENGINE=InnoDB;
	
	SELECT
	
		O.idOrigen AS id
        , CONCAT( IFNULL( CRO.abreviatura ,''), '-', CAST( O.idOrigen AS CHAR(12) ), '-', O.nombre ) AS text
        
    FROM origenes AS O
    INNER JOIN cat_relacion_origen AS CRO ON CRO.idCatRelacionOrigen = O.idCatRelacionOrigen
	WHERE
		O.active = 1
		AND
		(
			p_search = ''
			OR CONCAT( IFNULL( CRO.abreviatura ,''), '-', CAST( O.idOrigen AS CHAR(12) ), '-', O.nombre ) LIKE CONCAT('%', p_search ,'%')
		)
    ORDER BY O.idOrigen DESC
	LIMIT 0, 5;

 SET SESSION TRANSACTION ISOLATION LEVEL REPEATABLE READ ;
 
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `cbxOrigenesRepInv` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `cbxOrigenesRepInv`(
IN p_search VARCHAR(500)
, IN p_idUserLogON BIGINT
)
BEGIN

SET SESSION TRANSACTION ISOLATION LEVEL READ UNCOMMITTED ;

	SELECT
	
		O.idOrigen AS id
        , CONCAT( IFNULL( CRO.abreviatura ,''), '-', CAST( O.idOrigen AS CHAR(12) ), '-', O.nombre ) AS text
        
    FROM origenes AS O
    INNER JOIN cat_relacion_origen AS CRO ON CRO.idCatRelacionOrigen = O.idCatRelacionOrigen
	INNER JOIN origenes_config AS OC ON OC.idOrigen = O.idOrigen AND OC.idUser = p_idUserLogON
	WHERE
		O.active = 1
		AND
		(
			p_search = ''
			OR CONCAT( IFNULL( CRO.abreviatura ,''), '-', CAST( O.idOrigen AS CHAR(12) ), '-', O.nombre ) LIKE CONCAT('%', p_search ,'%')
		)
    ORDER BY O.idOrigen DESC
	LIMIT 0, 5;

 SET SESSION TRANSACTION ISOLATION LEVEL REPEATABLE READ ;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `cbxOrigenesToES` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `cbxOrigenesToES`(
IN p_search VARCHAR(500),
IN p_idOrigenFrom BIGINT
)
BEGIN

SET SESSION TRANSACTION ISOLATION LEVEL READ UNCOMMITTED ;

	SELECT
	
		O.idOrigen AS id
        , CONCAT( IFNULL( CRO.abreviatura ,''), '-', CAST( O.idOrigen AS CHAR(12) ), '-', O.nombre ) AS text
        
    FROM origenes AS O
    INNER JOIN cat_relacion_origen AS CRO ON CRO.idCatRelacionOrigen = O.idCatRelacionOrigen
	INNER JOIN tipo_prod_by_origen AS CTPBO
		ON
			CTPBO.idCatRelacionOrigen = CRO.idCatRelacionOrigen
    INNER JOIN origenes AS OFrom ON OFrom.idOrigen = p_idOrigenFrom AND OFrom.idOrigen != O.idOrigen
    INNER JOIN cat_relacion_origen AS CROFrom ON CROFrom.idCatRelacionOrigen = OFrom.idCatRelacionOrigen
	INNER JOIN tipo_prod_by_origen AS CTPBOFrom
		ON
			CTPBOFrom.idCatRelacionOrigen = CROFrom.idCatRelacionOrigen
			AND CTPBOFrom.idCatTipoProducto = CTPBO.idCatTipoProducto
	WHERE
		O.active = 1
		AND
		(
			p_search = ''
			OR CONCAT( IFNULL( CRO.abreviatura ,''), '-', CAST( O.idOrigen AS CHAR(12) ), '-', O.nombre ) LIKE CONCAT('%', p_search ,'%')
		)
	GROUP BY
		O.idOrigen
        , CRO.abreviatura
		, O.idOrigen
		, O.nombre
		
    ORDER BY O.idOrigen DESC
	LIMIT 0, 5;

 SET SESSION TRANSACTION ISOLATION LEVEL REPEATABLE READ ;
 
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `cbxOrigenesToFilterES` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `cbxOrigenesToFilterES`(
IN p_search VARCHAR(500)
, IN p_idUserLogON BIGINT
)
BEGIN

SET SESSION TRANSACTION ISOLATION LEVEL READ UNCOMMITTED ;

	-- DROP TABLE IF EXISTS oOrigenes;

	-- CREATE TEMPORARY TABLE oOrigenes (
		-- id BIGINT AUTO_INCREMENT,
		-- idOrigen BIGINT
		-- PRIMARY KEY(id)
	-- ) ENGINE=InnoDB;
	
	SELECT
	
		O.idOrigen AS id
        , CONCAT( IFNULL( CRO.abreviatura ,''), '-', CAST( O.idOrigen AS CHAR(12) ), '-', O.nombre ) AS text
        
    FROM origenes AS O
    INNER JOIN cat_relacion_origen AS CRO ON CRO.idCatRelacionOrigen = O.idCatRelacionOrigen
	WHERE
		O.active = 1
		AND
		(
			p_search = ''
			OR CONCAT( IFNULL( CRO.abreviatura ,''), '-', CAST( O.idOrigen AS CHAR(12) ), '-', O.nombre ) LIKE CONCAT('%', p_search ,'%')
		)
    ORDER BY O.idOrigen DESC
	LIMIT 0, 5;

 SET SESSION TRANSACTION ISOLATION LEVEL REPEATABLE READ ;
 
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `cbxProductos` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `cbxProductos`(
IN p_search VARCHAR(500)
)
BEGIN
	
    WITH RECURSIVE words AS (
	  SELECT
		SUBSTRING_INDEX(p_search, ' ', 1) AS palabra,
		SUBSTRING(p_search, LOCATE(' ', p_search) + 1) AS rest
	  UNION ALL
	  SELECT
		SUBSTRING_INDEX(rest, ' ', 1) AS palabra,
		SUBSTRING(rest, LOCATE(' ', rest) + 1) AS rest
	  FROM words
	  WHERE rest <> '' AND LOCATE(' ', rest) > 0
	  UNION ALL
	  SELECT
		rest AS palabra,
		'' AS rest
	  FROM words
	  WHERE rest <> '' AND LOCATE(' ', rest) = 0
	)
	SELECT
		P.idProducto AS id
		, CONCAT( IFNULL( CTP.abreviatura ,''), '-', CAST( P.idproductocategoria AS CHAR(12) ) , '-', IFNULL( CD.description ,''), ' ', REPLACE( CAST( P.valorMedida AS CHAR(12) ) , '.00', ''), ' ', IFNULL( UM.abreviatura ,'') ) AS text
	
		,(
		  SELECT COUNT(*) 
		  FROM words w
		  WHERE CONCAT(
			  IFNULL(CTP.abreviatura, ''),
			  '-', CAST(P.idproductocategoria AS CHAR(12)),
			  '-', IFNULL(CD.description, ''),
			  ' ', REPLACE(CAST(P.valorMedida AS CHAR(12)), '.00', ''),
			  ' ', IFNULL(UM.abreviatura, '')
		  ) LIKE CONCAT('%', w.palabra, '%')
		) AS iCountWords
    FROM productos AS P
	INNER JOIN cat_tipo_producto AS CTP ON CTP.active = 1 AND CTP.idCatTipoProducto = P.idCatTipoProducto
	INNER JOIN cat_descripciones AS CD ON CD.active = 1 AND CD.idDescription = P.idDescription
	INNER JOIN cat_unidad_medida AS UM ON UM.active = 1 AND UM.idUnidadMedida = P.idUnidadMedida
	WHERE
		P.active = 1
		AND P.idCatTipoProducto IN ( 1 ) -- 1: Producto, 2: Materia Prima, 3: Productos Base, 4: Productos Agranel: 5: Producto
		AND
		(
			p_search = ''
			OR (
				SELECT COUNT(*) 
				FROM words w
				WHERE CONCAT(
					IFNULL(CTP.abreviatura, ''),
					'-', CAST(P.idproductocategoria AS CHAR(12)),
					'-', IFNULL(CD.description, ''),
					' ', REPLACE(CAST(P.valorMedida AS CHAR(12)), '.00', ''),
					' ', IFNULL(UM.abreviatura, '')
				) LIKE CONCAT('%', w.palabra, '%')
			) > 0
		)
    ORDER BY iCountWords DESC
	LIMIT 0, 20;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `cbxProductosAgranelForPA` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `cbxProductosAgranelForPA`(
IN p_search VARCHAR(500)
, IN p_idProdProdAgranelH BIGINT
)
BEGIN
	
    WITH RECURSIVE words AS (
	  SELECT
		SUBSTRING_INDEX(p_search, ' ', 1) AS palabra,
		SUBSTRING(p_search, LOCATE(' ', p_search) + 1) AS rest
	  UNION ALL
	  SELECT
		SUBSTRING_INDEX(rest, ' ', 1) AS palabra,
		SUBSTRING(rest, LOCATE(' ', rest) + 1) AS rest
	  FROM words
	  WHERE rest <> '' AND LOCATE(' ', rest) > 0
	  UNION ALL
	  SELECT
		rest AS palabra,
		'' AS rest
	  FROM words
	  WHERE rest <> '' AND LOCATE(' ', rest) = 0
	)
	SELECT
		P.idProducto AS id
		, CONCAT( IFNULL( CTP.abreviatura ,''), '-', CAST( P.idproductocategoria AS CHAR(12) ) , '-', IFNULL( CD.description ,''), ' ', REPLACE( CAST( P.valorMedida AS CHAR(12) ) , '.00', ''), ' ', IFNULL( UM.abreviatura ,'') ) AS text
	
		,(
		  SELECT COUNT(*) 
		  FROM words w
		  WHERE CONCAT(
			  IFNULL(CTP.abreviatura, ''),
			  '-', CAST(P.idproductocategoria AS CHAR(12)),
			  '-', IFNULL(CD.description, ''),
			  ' ', REPLACE(CAST(P.valorMedida AS CHAR(12)), '.00', ''),
			  ' ', IFNULL(UM.abreviatura, '')
		  ) LIKE CONCAT('%', w.palabra, '%')
		) AS iCountWords
    
    FROM productos AS P
	INNER JOIN cat_tipo_producto AS CTP ON CTP.active = 1 AND CTP.idCatTipoProducto = P.idCatTipoProducto
	INNER JOIN cat_descripciones AS CD ON CD.active = 1 AND CD.idDescription = P.idDescription
	INNER JOIN cat_unidad_medida AS UM ON UM.active = 1 AND UM.idUnidadMedida = P.idUnidadMedida
	LEFT JOIN prod_prod_agranel_detalle AS PPBD ON PPBD.active = 1 AND PPBD.idProdProdAgranelH = p_idProdProdAgranelH AND PPBD.idProductoAgranel = P.idProducto
	WHERE
		P.active = 1
		AND PPBD.idProdProdAgranelDetalle IS NULL
		AND P.idCatTipoProducto IN ( 4 ) -- 1: Producto, 2: Materia Prima, 3: Productos Base, 4: Productos Agranel
		AND
		(
			p_search = ''
            OR (
				SELECT COUNT(*) 
				FROM words w
				WHERE CONCAT(
					IFNULL(CTP.abreviatura, ''),
					'-', CAST(P.idproductocategoria AS CHAR(12)),
					'-', IFNULL(CD.description, ''),
					' ', REPLACE(CAST(P.valorMedida AS CHAR(12)), '.00', ''),
					' ', IFNULL(UM.abreviatura, '')
				) LIKE CONCAT('%', w.palabra, '%')
			) > 0
		)
    ORDER BY iCountWords DESC
	LIMIT 0, 20;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `cbxProductosByType` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `cbxProductosByType`(
IN p_search VARCHAR(500)
, IN p_idCatTipoProducto INT
)
BEGIN

SET SESSION TRANSACTION ISOLATION LEVEL READ UNCOMMITTED ;
	
	SELECT
	
		P.idProducto AS id
		, CONCAT( IFNULL( CTP.abreviatura ,''), '-', CAST( P.idproductocategoria AS CHAR(12) ) , '-', IFNULL( CD.description ,''), ' ', REPLACE( CAST( P.valorMedida AS CHAR(12) ) , '.00', ''), ' ', IFNULL( UM.abreviatura ,'') ) AS text
	
    FROM productos AS P
	INNER JOIN cat_tipo_producto AS CTP ON CTP.active = 1 AND CTP.idCatTipoProducto = P.idCatTipoProducto
	INNER JOIN cat_descripciones AS CD ON CD.active = 1 AND CD.idDescription = P.idDescription
	INNER JOIN cat_unidad_medida AS UM ON UM.active = 1 AND UM.idUnidadMedida = P.idUnidadMedida
	WHERE
		P.active = 1
		AND P.idCatTipoProducto = p_idCatTipoProducto
		AND
		(
			p_search = ''
			OR CONCAT( IFNULL( CTP.abreviatura ,''), '-', CAST( P.idproductocategoria AS CHAR(12) ) , '-', IFNULL( CD.description ,''), ' ', REPLACE( CAST( P.valorMedida AS CHAR(12) ) , '.00', ''), ' ', IFNULL( UM.abreviatura ,'') ) LIKE CONCAT('%', p_search ,'%')
		)
    ORDER BY P.idProducto DESC
	LIMIT 0, 5;

 SET SESSION TRANSACTION ISOLATION LEVEL REPEATABLE READ ;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `cbxProductosFinalForPF` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `cbxProductosFinalForPF`(
IN p_search VARCHAR(500)
, IN p_idProdProdFinalH BIGINT
)
BEGIN
	
    WITH RECURSIVE words AS (
	  SELECT
		SUBSTRING_INDEX(p_search, ' ', 1) AS palabra,
		SUBSTRING(p_search, LOCATE(' ', p_search) + 1) AS rest
	  UNION ALL
	  SELECT
		SUBSTRING_INDEX(rest, ' ', 1) AS palabra,
		SUBSTRING(rest, LOCATE(' ', rest) + 1) AS rest
	  FROM words
	  WHERE rest <> '' AND LOCATE(' ', rest) > 0
	  UNION ALL
	  SELECT
		rest AS palabra,
		'' AS rest
	  FROM words
	  WHERE rest <> '' AND LOCATE(' ', rest) = 0
	)
	SELECT
		P.idProducto AS id
		, CONCAT( IFNULL( CTP.abreviatura ,''), '-', CAST( P.idproductocategoria AS CHAR(12) ) , '-', IFNULL( CD.description ,''), ' ', REPLACE( CAST( P.valorMedida AS CHAR(12) ) , '.00', ''), ' ', IFNULL( UM.abreviatura ,'') ) AS text
	
		,(
		  SELECT COUNT(*) 
		  FROM words w
		  WHERE CONCAT(
			  IFNULL(CTP.abreviatura, ''),
			  '-', CAST(P.idproductocategoria AS CHAR(12)),
			  '-', IFNULL(CD.description, ''),
			  ' ', REPLACE(CAST(P.valorMedida AS CHAR(12)), '.00', ''),
			  ' ', IFNULL(UM.abreviatura, '')
		  ) LIKE CONCAT('%', w.palabra, '%')
		) AS iCountWords
    FROM productos AS P
	INNER JOIN cat_tipo_producto AS CTP ON CTP.active = 1 AND CTP.idCatTipoProducto = P.idCatTipoProducto
	INNER JOIN cat_descripciones AS CD ON CD.active = 1 AND CD.idDescription = P.idDescription
	INNER JOIN cat_unidad_medida AS UM ON UM.active = 1 AND UM.idUnidadMedida = P.idUnidadMedida
	LEFT JOIN prod_prod_final_detalle AS PPBD ON PPBD.active = 1 AND PPBD.idProdProdFinalH = p_idProdProdFinalH AND PPBD.idProductoFinal = P.idProducto
	WHERE
		P.active = 1
		AND PPBD.idProdProdFinalDetalle IS NULL
		AND P.idCatTipoProducto IN ( 1 ) -- 1: Producto, 2: Materia Prima, 3: Productos Base, 4: Productos Agranel: 5: Insumos
		AND
		(
			p_search = ''
			OR (
				SELECT COUNT(*) 
				FROM words w
				WHERE CONCAT(
					IFNULL(CTP.abreviatura, ''),
					'-', CAST(P.idproductocategoria AS CHAR(12)),
					'-', IFNULL(CD.description, ''),
					' ', REPLACE(CAST(P.valorMedida AS CHAR(12)), '.00', ''),
					' ', IFNULL(UM.abreviatura, '')
				) LIKE CONCAT('%', w.palabra, '%')
			) > 0
		)
    ORDER BY iCountWords DESC
	LIMIT 0, 20;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `cbxProductosFromConvert` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `cbxProductosFromConvert`(
IN p_search VARCHAR(500)
, IN p_idOrigen BIGINT
, IN p_idUserLogON BIGINT
)
BEGIN

    WITH RECURSIVE words AS (
	  SELECT
		SUBSTRING_INDEX(p_search, ' ', 1) AS palabra,
		SUBSTRING(p_search, LOCATE(' ', p_search) + 1) AS rest
	  UNION ALL
	  SELECT
		SUBSTRING_INDEX(rest, ' ', 1) AS palabra,
		SUBSTRING(rest, LOCATE(' ', rest) + 1) AS rest
	  FROM words
	  WHERE rest <> '' AND LOCATE(' ', rest) > 0
	  UNION ALL
	  SELECT
		rest AS palabra,
		'' AS rest
	  FROM words
	  WHERE rest <> '' AND LOCATE(' ', rest) = 0
	)
	SELECT
	
		P.idProducto AS id
		, CONCAT(
			IFNULL( CTP.abreviatura ,'')
			, '-' , CAST( P.idproductocategoria AS CHAR(12) )
			, '-', IFNULL( CD.description ,'')
			, ' ', REPLACE( CAST( P.valorMedida AS CHAR(12) ) , '.00', '')
			, ' ', IFNULL( UM.abreviatura ,'')
			, ' - Inv: ', REPLACE( CAST( IFNULL( ROUND( S.cantidad ,2) ,0) AS CHAR(12) ) , '.00', '')
			) AS text
            
		, P.idUnidadMedida
		, P.valorMedida
		
		, ROUND( IFNULL( S.cantidad ,0) - IFNULL( S.cantidadBlock ,0) ,2) AS canInv
		
		, P.idProductoRelacion
		, CONCAT( IFNULL( CTPP.abreviatura ,'')
			, '-', CAST( PP.idproductocategoria AS CHAR(12) )
			, '-', IFNULL( CDP.description ,'')
			, ' ', REPLACE( CAST( PP.valorMedida AS CHAR(12) ) , '.00', '')
			, ' ', IFNULL( UMP.abreviatura ,'') ) AS productoRelacionName
            
		,(
		  SELECT COUNT(*) 
		  FROM words w
		  WHERE CONCAT(
			  IFNULL(CTP.abreviatura, ''),
			  '-', CAST(P.idproductocategoria AS CHAR(12)),
			  '-', IFNULL(CD.description, ''),
			  ' ', REPLACE(CAST(P.valorMedida AS CHAR(12)), '.00', ''),
			  ' ', IFNULL(UM.abreviatura, '')
		  ) LIKE CONCAT('%', w.palabra, '%')
		) AS iCountWords
	
    FROM productos AS P
	INNER JOIN cat_tipo_producto AS CTP ON CTP.active = 1 AND CTP.idCatTipoProducto = P.idCatTipoProducto
	INNER JOIN cat_descripciones AS CD ON CD.active = 1 AND CD.idDescription = P.idDescription
	INNER JOIN cat_unidad_medida AS UM ON UM.active = 1 AND UM.idUnidadMedida = P.idUnidadMedida
	LEFT JOIN stock AS S
		ON
			S.idProducto = P.idProducto
			AND S.idOrigen = p_idOrigen
	INNER JOIN productos AS PP ON PP.idProducto = P.idProductoRelacion AND PP.idUnidadMedida = 3 AND PP.idCatTipoProducto = 4 -- AGRANEL
	INNER JOIN cat_tipo_producto AS CTPP ON CTPP.active = 1 AND CTPP.idCatTipoProducto = PP.idCatTipoProducto
	INNER JOIN cat_descripciones AS CDP ON CDP.active = 1 AND CDP.idDescription = PP.idDescription
	INNER JOIN cat_unidad_medida AS UMP ON UMP.active = 1 AND UMP.idUnidadMedida = PP.idUnidadMedida
	WHERE
		P.active = 1
		AND CTP.idCatTipoProducto IN ( 1 ) -- PRODUCTOS
		AND P.idUnidadMedida = 2 -- LITROS
		AND
		(
			p_search = ''
            OR (
				SELECT COUNT(*) 
				FROM words w
				WHERE CONCAT(
					IFNULL(CTP.abreviatura, ''),
					'-', CAST(P.idproductocategoria AS CHAR(12)),
					'-', IFNULL(CD.description, ''),
					' ', REPLACE(CAST(P.valorMedida AS CHAR(12)), '.00', ''),
					' ', IFNULL(UM.abreviatura, '')
				) LIKE CONCAT('%', w.palabra, '%')
			) > 0
		)
    ORDER BY iCountWords DESC
	LIMIT 0, 20;
	
 END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `cbxStatusProdBase` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `cbxStatusProdBase`(
IN p_search VARCHAR(500)
)
BEGIN

SET SESSION TRANSACTION ISOLATION LEVEL READ UNCOMMITTED ;
	
	SELECT
	
		P.idStatus AS id
		, P.name AS text
	
    FROM cat_status_prod_base AS P
	WHERE
		P.active = 1
		AND
		(
			p_search = ''
			OR P.name LIKE CONCAT('%', p_search ,'%')
		)
    ORDER BY P.idStatus ASC
	LIMIT 0, 5;
	

 SET SESSION TRANSACTION ISOLATION LEVEL REPEATABLE READ ;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `cbxTipoCliente` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `cbxTipoCliente`(
IN p_search VARCHAR(500)
, IN p_bAll INT
)
BEGIN
	
	SELECT
	
		C.idTipoCliente AS id
		, C.name AS text
	
    FROM cat_tipo_cliente AS C
	WHERE
		C.active = 1
		AND
        (
			p_bAll = 1
            OR C.idTipoCliente IN( 2, 3, 4, 6, 7 )
        )
		AND
		(
			p_search = ''
			OR C.name LIKE CONCAT('%', p_search ,'%')
		)
    ORDER BY C.idTipoCliente ASC
	LIMIT 0, 50;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `cerrarVenta` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `cerrarVenta`(
    IN p_oGetDateNow DATETIME,
    IN p_idVenta BIGINT,
    IN p_efectivo DECIMAL(18,2),
    IN p_recibido DECIMAL(18,2),
    IN p_cambio DECIMAL(18,2),
    IN p_tarjeta DECIMAL(18,2),
    IN p_referenciaTarjeta VARCHAR(45),
    IN p_transferencia DECIMAL(18,2),
    IN p_referenciaTransferencia VARCHAR(45),
    IN p_fechaTransferencia VARCHAR(50),
	IN p_cheque DECIMAL(18,2),
    IN p_fechaDeposito VARCHAR(45),
    IN p_dineroElectronico DECIMAL(18,2),
	
    IN p_idUserLogON BIGINT
)
BEGIN
    DECLARE v_idMetodosPagoDetalle BIGINT DEFAULT NULL;
    DECLARE v_total DECIMAL(18,2) DEFAULT 0;
    DECLARE v_idSucursal BIGINT DEFAULT 0;
    DECLARE v_idOrigenFrom BIGINT DEFAULT 0;
	DECLARE v_idClienteDiElect BIGINT DEFAULT 0;
	DECLARE v_idTipoCliente BIGINT DEFAULT 0;
	DECLARE v_idCliente BIGINT DEFAULT 0;
	DECLARE v_bDineroElectronico SMALLINT DEFAULT 0;
	DECLARE v_montoDiElect DECIMAL(18,2) DEFAULT 0;

    -- Variables para diagnóstico de error
    DECLARE v_sqlstate CHAR(5) DEFAULT '';
    DECLARE v_errno INT DEFAULT 0;
    DECLARE v_message TEXT DEFAULT '';

    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS CONDITION 1
            v_sqlstate = RETURNED_SQLSTATE,
            v_errno = MYSQL_ERRNO,
            v_message = MESSAGE_TEXT;
        SELECT 0 AS out_id, 
               CONCAT('SQLSTATE: ', v_sqlstate, ' | ERRNO: ', v_errno, ' | MSG: ', v_message) AS message;
    END;

    SELECT
	V.idSucursal, IFNULL( V.idOrigenVendedor ,0), IFNULL( V.idClienteDiElect ,0)
	, C.idTipoCliente, C.idCliente, IFNULL( C.bDineroElectronico ,0)
		INTO
	v_idSucursal, v_idOrigenFrom, v_idClienteDiElect
	, v_idTipoCliente, v_idCliente, v_bDineroElectronico
    FROM ventas AS V
	INNER JOIN clientes AS C ON C.idCliente = V.idCliente
    WHERE
        V.idVenta = p_idVenta
	LIMIT 1
    ;
	
	-- SI NO ES CLIENTE GENERAL PERO TIENE LA BANDERA DE DINERO ELECTRÓNICO, ENTONCES LO TOMO
	IF v_idClienteDiElect = 0 AND v_bDineroElectronico = 1 AND v_idTipoCliente IN( 2 ) THEN
	
		SET v_idClienteDiElect = v_idCliente;
		UPDATE ventas SET idClienteDiElect = v_idClienteDiElect WHERE idVenta = p_idVenta;
	
	END IF;
	
	IF v_idOrigenFrom = 0 THEN
		-- SACO LA EQUIVALENCIA DE LA SUCURSAL A ORIGEN
		SELECT
			idOrigen INTO v_idOrigenFrom
		FROM origenes
		WHERE
			idCatRelacionOrigen = 1 -- SUCURSAL
			AND idRelacion = v_idSucursal
		;
	END IF;
	
	IF
	(
		SELECT COUNT(*)
		FROM stock AS S
		INNER JOIN
		(
			SELECT V.idProducto, SUM(V.cantidad) AS cantidad
			FROM ventasdetalle AS V
			WHERE
				V.idVenta = p_idVenta
			GROUP BY V.idProducto
		) AS P
			ON P.idProducto = S.idProducto
		WHERE
			S.idOrigen = v_idOrigenFrom
			-- SI EL STOCK MENOS LO BLOQUEADO MENOS LA CANTIDAD NECESARIA ES MENOR A 0, QUIERE DECIR QUE NO HAY INV
			AND ( ROUND( IFNULL( S.cantidad ,0) - IFNULL( S.cantidadBlock ,0) - P.cantidad ,2) ) < 0
	) = 0 THEN
	
		SET v_total = IFNULL(p_efectivo,0) + IFNULL(p_tarjeta,0) + IFNULL(p_transferencia,0) + IFNULL(p_cheque,0) + IFNULL(p_dineroElectronico,0);
		
		IF v_total > 0 THEN

			-- 1. Insertar métodos de pago
			INSERT INTO metodos_pago_detalle (
				efectivo, recibido, cambio, tarjeta, referenciaTarjeta,
				transferencia, referenciaTransferencia, fechaTransferencia, total
				, cheque, fechaDeposito, dineroElectronico
			) VALUES (
				p_efectivo, p_recibido, p_cambio, p_tarjeta, p_referenciaTarjeta,
				p_transferencia, p_referenciaTransferencia, IF( p_transferencia > 0, p_fechaTransferencia, null ), v_total
				, p_cheque, IF( p_cheque > 0, p_fechaDeposito, null ), p_dineroElectronico
			);
			SET v_idMetodosPagoDetalle = LAST_INSERT_ID();

			-- 2. Insertar el pago principal
			INSERT INTO pagos (
				createDate, active, idMetodosPagoDetalle, idVenta, idCreateUser, total
			) VALUES (
				p_oGetDateNow, 1, v_idMetodosPagoDetalle, p_idVenta, p_idUserLogON, v_total
			);
			
		END IF;

		-- Crear tabla temporal para sumarizar cantidades por producto en ventasdetalle
		CREATE TEMPORARY TABLE IF NOT EXISTS tmp_ventasdetalle_sum AS
		SELECT
			idProducto,
			SUM(cantidad) AS cantidad
		FROM ventasdetalle
		WHERE idVenta = p_idVenta
		GROUP BY idProducto;

		-- 3. Salida de inventario de productos de ventasdetalle (stocklog)
		INSERT INTO stocklog (
			createDate, active, idOrigen, idProducto, idCatMov, cantidad, costo, idCreateUser, idStockFrom, motivoDesc
		)
		SELECT
			p_oGetDateNow, 1, v_idOrigenFrom, t.idProducto, 7, -t.cantidad, 0, p_idUserLogON, 0, CONCAT('Salida por Venta #', p_idVenta)
		FROM tmp_ventasdetalle_sum t;

		-- 4. Actualizar stock (restar cantidad) si existe
		UPDATE stock s
		INNER JOIN tmp_ventasdetalle_sum t ON s.idProducto = t.idProducto AND s.idOrigen = v_idOrigenFrom
		SET s.cantidad = s.cantidad - t.cantidad;

		-- 5. Insertar en stock si no existe
		INSERT INTO stock (createDate, active, idOrigen, idProducto, cantidad, costo)
		SELECT p_oGetDateNow, 1, v_idOrigenFrom, t.idProducto, -t.cantidad, 0
		FROM tmp_ventasdetalle_sum t
		LEFT JOIN stock s ON s.idProducto = t.idProducto AND s.idOrigen = v_idOrigenFrom
		WHERE s.idProducto IS NULL;

		-- Elimina la tabla temporal
		DROP TEMPORARY TABLE IF EXISTS tmp_ventasdetalle_sum;

		-- 6. Entrada de inventario de productos de ventas_envases (stocklog)
		INSERT INTO stocklog (
			createDate, active, idOrigen, idProducto, idCatMov, cantidad, costo, idCreateUser, idStockFrom, motivoDesc
		)
		SELECT
			p_oGetDateNow, 1, v_idOrigenFrom, ve.idProducto, 7, ve.cantidad, 0, p_idUserLogON, 0, CONCAT( 'Entrada por Venta #', p_idVenta)
		FROM ventas_envases ve
		WHERE ve.idVenta = p_idVenta;

		-- 7. Actualizar stock (sumar cantidad) si existe
		UPDATE stock s
		INNER JOIN ventas_envases ve ON s.idProducto = ve.idProducto AND s.idOrigen = v_idOrigenFrom
		SET s.cantidad = s.cantidad + ve.cantidad
		WHERE ve.idVenta = p_idVenta;

		-- 8. Insertar en stock si no existe
		INSERT INTO stock (createDate, active, idOrigen, idProducto, cantidad, costo)
		SELECT p_oGetDateNow, 1, v_idOrigenFrom, ve.idProducto, ve.cantidad, 0
		FROM ventas_envases ve
		LEFT JOIN stock s ON s.idProducto = ve.idProducto AND s.idOrigen = v_idOrigenFrom
		WHERE ve.idVenta = p_idVenta AND s.idProducto IS NULL;
		
		IF v_idClienteDiElect > 0 THEN
		
			SELECT
				IFNULL( V.total ,0)
			INTO
				v_total
			FROM ventas AS V
			WHERE
				V.idVenta = p_idVenta
			;
		
			-- **************************************************************************************
			-- PARTE DONDE SE VALIDA LA PRIMER COMPRA PARA LOS CLIENTES FRECUENTES
			SET @idTipoCliente = 0;
			SET @bCompraMin = 0;
			SET @conf_valorType = '';
			SET @conf_valor = 0;
			SET @v_porcentajeDineroElectronico = -1; -- INICIO EN -1 PORQUE AUN NO APLICA REGLAS
			
			SELECT
				IFNULL( C.idTipoCliente ,0)
				, IFNULL( C.bCompraMin ,0)
			INTO
				@idTipoCliente
				, @bCompraMin
			FROM clientes AS C
			WHERE
				C.idCliente = v_idClienteDiElect
			;
			-- Cliente frecuente O CLIENTE
			IF @idTipoCliente = 5 OR @idTipoCliente = 2 THEN
				-- SI EL CLIENTE YA TIENE LA COMPRA MINIMA
				-- VALIDO SI PASA DE LA COMPRA MINIMA REQUERIDA POR VENTA PARA VER SI SE LE DA MÁS %
				IF @bCompraMin = 1 THEN
				
					SET @v_minCompra = 0;
					SET @v_porcentMinCompra = 0;
					SET @sidTipoCliente = '';
					
					SELECT
						CAST( C.`value` AS DECIMAL(18,2) )
						, CAST( C.`value2` AS DECIMAL(18,2) )
					INTO
						@v_minCompra
						, @v_porcentMinCompra
					FROM constantes AS C
					WHERE
						C.`key` = CONCAT( 'DELimitCliFre', CAST( @idTipoCliente AS CHAR(1) ) )
					;
					
					-- SI EL TOTAL ES MENOR QUE LA COMPRA MINIMA
					-- EJEMPLO: COMPRA MINIMA 100 PESOS SI ES 99 O MENOS ENTONCES SOLO LE DA 1% DE DINERO ELECTRONICO
					IF v_total < @v_minCompra THEN
						-- SI NO CUMPLE CON LA COMPRA MINIMA LE DA 1% DE DINERO ELECTRONICO O EL QUE TENGA CONFIGURADO
						SET @v_porcentajeDineroElectronico = @v_porcentMinCompra;
					ELSE -- SI ES MAYOR ENTONCES DEBE DARLE EL QUE YA LE DABA ANTES
						SET @v_porcentajeDineroElectronico = -1; -- UTILIZO UN -1 PARA IDENTIFICAR SI APLICA O NO
					END IF;
				-- SI NO TIENE LA COMPRA MINIMA Y QUE SEA CLIENTE FRECUENTE, VALIDAMOS SI YA LA CUMPLE.
				ELSEIF @idTipoCliente = 5 THEN
				
					SELECT
						C.valorType
						, C.valor
					INTO
						@conf_valorType
						, @conf_valor
					FROM conf_min_compra AS C
					WHERE
						C.idTipoCliente = @idTipoCliente -- CLIENTE FRECUENTE
					;
					
					-- SI YA ESTÁ CUMPLIENDO CON LA COMPRA MINIMA
					IF v_total >= @conf_valor THEN
						-- POR SER LA PRIMERA COMPRA LE DA UN 10% DE DINERO ELECTRÓNICO
						SET @v_porcentajeDineroElectronico = 10;
						-- LE ACTUALIZO QUE YA CUMPLE CON LA COMPRA MINIMA
						UPDATE
							clientes
						SET
							bCompraMin = 1
						WHERE idCliente = v_idClienteDiElect; 
					ELSE
						SET @v_porcentajeDineroElectronico = 0;
					END IF;
				
				END IF;
			
			END IF;
			
			-- **************************************************************************************
		
			SELECT
			
			IFNULL( ROUND( SUM( VD.total * (
				(
					CASE WHEN IFNULL( VD.bEnvase ,0) = 1 AND P.idUnidadMedida = 2 AND P.valorMedida = 20 THEN
							
							( CASE WHEN @v_porcentajeDineroElectronico = -1 THEN IFNULL( P.porcentDineroElectronicoEnvase ,0) ELSE @v_porcentajeDineroElectronico END )
							
							ELSE
							
							( CASE WHEN @v_porcentajeDineroElectronico = -1 THEN IFNULL( P.porcentDineroElectronico ,0) ELSE @v_porcentajeDineroElectronico END )
							
							END
				)
				/100) ) / ( CASE WHEN @v_porcentajeDineroElectronico = 10 THEN 1 ELSE 1.16 END ) ,2) ,0)
				INTO
			v_montoDiElect
				
			FROM ventasdetalle AS VD
			INNER JOIN productos AS P ON P.active = 1 AND P.idProducto = VD.idProducto
			WHERE
				VD.idVenta = p_idVenta
				AND
				(
					IFNULL( VD.idPromocion ,0) = 0
					OR IFNULL( P.bDineroElectronico ,0) = 1
				)
			;
			
			IF IFNULL( v_montoDiElect ,0) > 0 THEN
			
				IF IFNULL( v_total ,0) = 0 THEN
					SELECT
						IFNULL( V.total ,0)
					INTO
						v_total
					FROM ventas AS V
					WHERE
						V.idVenta = p_idVenta
					;
				END IF;
			
				-- CALCULO EL PROPORCIONAL DE DINERO ELECTRÓNICO QUE SE DEBE ACUMULAR
				SET @total_pagado = v_total;
				SET @pagado_dinero_electronico = IFNULL(p_dineroElectronico,0);
				SET @saldo_a_acumular = v_montoDiElect;
				SET @pagado_otro = @total_pagado - @pagado_dinero_electronico; -- efectivo + tarjeta + transferencia + cheque
				
				SET @proporcion = @pagado_otro / @total_pagado;
				SET v_montoDiElect = ROUND(@saldo_a_acumular * @proporcion, 2);
            
				UPDATE
					dinero_electronico AS DE
				INNER JOIN
				(
					SELECT v_idClienteDiElect AS idCliente
					, v_montoDiElect AS monto
				) AS C
					ON
						C.idCliente = DE.idCliente
				SET	DE.monto = DE.monto + C.monto
				;
			
				INSERT INTO dinero_electronico
				(
					idCliente
					, monto
				)
				SELECT
				C.idCliente
				, v_montoDiElect
				FROM ( SELECT v_idClienteDiElect AS idCliente ) AS C
				LEFT JOIN dinero_electronico AS DE ON C.idCliente = DE.idCliente
				WHERE
					DE.idCliente IS NULL
				;
                
				INSERT INTO dinero_electronico_log
				(
					createDate
					, idCliente
					, monto
					, motivoDesc
				)
				SELECT
				p_oGetDateNow
				, v_idClienteDiElect
				, v_montoDiElect
				, CONCAT( 'Abono por Compra #', p_idVenta )
				;
				
				-- SE ACTUALIZA EL DINERO ELECTRÓNICO QUE SE ACUMULÓ EN ESTA VENTA
				UPDATE ventas SET dineroElectAcumulado = IFNULL( v_montoDiElect ,0) WHERE idVenta = p_idVenta;
			
			END IF;
			
			IF IFNULL( p_dineroElectronico ,0) > 0 THEN
			
				UPDATE
					dinero_electronico AS DE
				INNER JOIN
				(
					SELECT v_idClienteDiElect AS idCliente
					, p_dineroElectronico AS monto
				) AS C
					ON
						C.idCliente = DE.idCliente
				SET	DE.monto = DE.monto - C.monto
				;
			
				INSERT INTO dinero_electronico_log
				(
					createDate
					, idCliente
					, monto
					, motivoDesc
				)
				SELECT
				p_oGetDateNow
				, v_idClienteDiElect
				, ( p_dineroElectronico * -1 )
				, CONCAT( 'Cargo por Compra #', p_idVenta )
				;
			
			END IF;
		
		END IF;
		
		-- **************************************************************************************
		-- PARTE DONDE SE VALIDA LA PRIMER COMPRA
		SET @idCliente = 0;
		SET @idTipoCliente = 0;
		SET @bCompraMin = 0;
		SET @conf_valorType = '';
		SET @conf_valor = 0;
		SET @vv_cantidad = 0;
		SET @vv_total = 0;
		
		SELECT
			C.idCliente
			, IFNULL( C.idTipoCliente ,0)
			, IFNULL( C.bCompraMin ,0)
		INTO
			@idCliente
			, @idTipoCliente
			, @bCompraMin
		FROM clientes AS C
		INNER JOIN ventas AS PC ON C.idCliente = PC.idCliente
		WHERE
			PC.idVenta = p_idVenta
		;
		
		-- 3	D Emprendedor
		-- 4	D Emprendedor Premium
		-- 6	D a Detalle
		IF @idTipoCliente IN( 3, 4, 6 ) AND @bCompraMin = 0 THEN
		
			SELECT
				C.valorType
				, C.valor
			INTO
				@conf_valorType
				, @conf_valor
			FROM conf_min_compra AS C
			WHERE
				C.idTipoCliente = @idTipoCliente
			;
			
			SELECT
				SUM( PCD.cantidad )
				, SUM( PCD.total )
			INTO
				@vv_cantidad
				, @vv_total
			FROM ventasdetalle AS PCD
			INNER JOIN productos AS P ON P.idProducto = PCD.idProducto
			WHERE
				PCD.idPromocion > 0
				AND
				(
					@conf_valorType = 'montoVenta'
					-- SOLO LOS PRODUCTOS DE LITROS MEDIO, LITRO Y 4, ESTO PARA LAS PIEZAS
					OR ( P.idUnidadMedida = 2 && P.valorMedida IN( 0.5, 1, 4 ) )
				)
				AND PCD.idVenta = p_idVenta
			;
			
			UPDATE
				clientes
			SET
				bCompraMin =
				CASE WHEN @conf_valorType = 'cantidadUnidades' AND @vv_cantidad >= @conf_valor THEN 1
						WHEN @conf_valorType = 'montoVenta' AND @vv_total >= @conf_valor THEN 1
						ELSE 0 END
				
			WHERE idCliente = @idCliente;
			
		ELSE
			UPDATE clientes SET bCompraMin = 1 WHERE idCliente = @idCliente;
		END IF;
		-- **************************************************************************************

		-- SE MARCA COMO CERRADA LA VENTA, Y EL SALDO PENDIENTE BAJA CON LOS PAGOS
		UPDATE ventas SET bClosed = 1, pendiente = ROUND( pendiente - v_total ,2), createDate = p_oGetDateNow WHERE idVenta = p_idVenta;
        
        -- ACTIVO EL CLIENTE
        UPDATE
			clientes
		SET
			active = 1
			, bReactivado = 1
			, fechaReactivacion = p_oGetDateNow
        WHERE
			idCliente = @idCliente
			AND active = 0; -- SOLO SI ESTÁ INACTIVO
			
		-- SI ES PROSPECTO, LO CONVIERTO EN CLIENTE
        UPDATE
			clientes
		SET
			bProspecto = 0
			, bFProspecto = 1
			, clientDate = p_oGetDateNow
        WHERE
			bProspecto = 1
			AND idCliente = @idCliente;

		SELECT 1 AS out_id, 'Venta registrada correctamente' AS message;
		
	ELSE
		SELECT 0 AS out_id, 'No hay inventario suficiente' AS message;
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `changeStatusES` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `changeStatusES`(
	IN p_idEntradasSalidasH BIGINT
	, IN p_idStatus INT
	, IN p_idUserLogON BIGINT
)
BEGIN

	SET @bOK = 0;
	SET @idOrigenFrom = 0;
	
	SET @idOrigenFrom = IFNULL(
	(
		SELECT
		idOrigenFrom
		FROM entradas_salidas_header
		WHERE
			idEntradasSalidasH = p_idEntradasSalidasH
		LIMIT 1
	)
	,0);
	
	SET @idOrigenTo = 0;
	
	SET @idOrigenTo = IFNULL(
	(
		SELECT
		idOrigenTo
		FROM entradas_salidas_header
		WHERE
			idEntradasSalidasH = p_idEntradasSalidasH
		LIMIT 1
	)
	,0);
	
	-- SI SE ESTÁ PASANDO A STATUS ENVIADO O EN PROCESO
	IF p_idStatus = 2 THEN
	
		-- HAGO ESTE IF PORQUE SOLO EL ENCARGADO DEL ORIGEN PUEDE ENVIAR UNA TRANSFERENCIA
		IF
		(
			SELECT COUNT(*)
			FROM origenes_responsables
			WHERE
				idOrigen = @idOrigenFrom
				AND idUser = p_idUserLogON
		) > 0 THEN
	
			-- SE DEBE CAMBIAR EL ESTATUS DEL DETALLE
			UPDATE
				entradas_salidas_detalle
			SET
				idStatusESDetalle = 1 -- SE CAMBIA EL ESTATUS A ENVIADO
			WHERE
				idEntradasSalidasH = p_idEntradasSalidasH
			;
		
			SET @bOK = 1;
		
		ELSE
		
			SET @out_id = 0;
			SET @message = 'No tiene permitido enviar una transferencia.';
		
		END IF;
	
	ELSEIF p_idStatus = 4 THEN -- SI ES GENERACIÓN DE SOLICITUD DE TRANSFERENCIA
	
		-- HAGO ESTE IF PORQUE SOLO EL ENCARGADO DEL DESTINO PUEDE GENERAR UNA SOLICITUD DE TRANSFERENCIA
		IF
		(
			SELECT COUNT(*)
			FROM origenes_responsables
			WHERE
				idOrigen = @idOrigenTo
				AND idUser = p_idUserLogON
		) > 0 THEN
	
			-- SE DEBE CAMBIAR EL ESTATUS DEL DETALLE
			UPDATE
				entradas_salidas_detalle
			SET
				idStatusESDetalle = 4 -- SE CAMBIA EL ESTATUS A SOLICITADO
				, cantidadEnviada = 0
				, cantidadEnviadaReal = 0
			WHERE
				idEntradasSalidasH = p_idEntradasSalidasH
			;
			
			SET @bOK = 1;
		
		ELSE
		
			SET @out_id = 0;
			SET @message = 'No tiene permitido generar una solicitud de transferencia.';
		
		END IF;
	
	END IF;
	
	-- SI TODO SALE BIEN, ENTONCES SE CAMBIA EL STATUS DE LA ENTRADA SALIDA
	IF @bOK = 1 THEN
	
		UPDATE
			entradas_salidas_header
		SET
			idEntradaSalidaStatus = p_idStatus
		WHERE
			idEntradasSalidasH = p_idEntradasSalidasH
		;
		
		SET @out_id = 1;
		SET @message = 'Actualizado con éxito.';
		
	END IF;
		
	SELECT @out_id AS out_id, @message AS message;
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `changeStatusInventarioFisico` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `changeStatusInventarioFisico`(
    IN p_idInventarioFisico BIGINT,
    IN p_idStatus INT,
    IN p_idUserLogON BIGINT,
    IN oGetDateNow DATETIME
)
BEGIN
    DECLARE v_message VARCHAR(255);
    DECLARE v_out_id BIGINT DEFAULT 0;
	
	DECLARE mensaje_error TEXT;
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS CONDITION 1 mensaje_error = MESSAGE_TEXT;
        SELECT 0 AS out_id, mensaje_error AS message;
    END;
    
    -- Si el status es 3 (Cerrado), actualizar fechaCierre
    IF p_idStatus = 3 THEN
		
		-- ******************************************************
		-- AJUSTE DE INVENTARIO
		-- HAGO UN UPDATE AL STOCK DE LOS ARTICULOS EN CASO DE EXISTIR
		UPDATE stock AS S
		INNER JOIN inventario_fisico AS IFF
			ON
				IFF.idOrigen = S.idOrigen
				AND IFF.idInventarioFisico = p_idInventarioFisico
		INNER JOIN inventario_fisico_detalle AS IFD
			ON
				IFD.idInventarioFisico = IFF.idInventarioFisico
				AND IFD.idProducto = S.idProducto
		SET
			S.cantidad = S.cantidad + IFD.diferencia
		WHERE
			IFF.idInventarioFisico = p_idInventarioFisico
			AND IFNULL( IFD.diferencia ,0) <> 0
			;
	
		-- INSERTO EL LOG POSITIVO DE LA PRODUCCIÓN DEL PRODUCTO
		INSERT INTO stocklog
		(
			createDate
			, active
			, idOrigen
			, idProducto
			, idCatMov
			, cantidad
			, costo
			, idStockFrom
			, idRelacionOperacion
			, comentarios
			, idCreateUser
			, motivoDesc
		)
		SELECT
		
		oGetDateNow
		, 1
		, IFF.idOrigen -- 1: AMP, 2: APB, 3: APA, 4: APT
		, IFD.idProducto
		, 9 -- 1: Orden de compra, 2: Producción, 3: Transferencia, 9: Ajuste de Inventario físico
		, IFD.diferencia -- CANTIDAD PRODUCIDA
		, 0 -- COSTO UNITARIO
		, 0
		, 0
		, ''
		, P_idUserLogON
		, CONCAT( 'Ajuste de inventario físico #' , p_idInventarioFisico )
		
		FROM inventario_fisico AS IFF
		INNER JOIN inventario_fisico_detalle AS IFD
			ON
				IFD.idInventarioFisico = IFF.idInventarioFisico
		WHERE
			IFF.idInventarioFisico = p_idInventarioFisico
			AND IFNULL( IFD.diferencia ,0) <> 0
		;
		
		-- ******************************************************
	
        UPDATE inventario_fisico SET
            idStatus = p_idStatus,
            fechaCierre = oGetDateNow
        WHERE idInventarioFisico = p_idInventarioFisico;
    ELSE
        -- Para otros status, solo actualizar el status
        UPDATE inventario_fisico SET
            idStatus = p_idStatus
        WHERE idInventarioFisico = p_idInventarioFisico;
    END IF;
    
    SET v_out_id = p_idInventarioFisico;
    SET v_message = 'Status actualizado correctamente';
    
    SELECT v_out_id AS out_id, v_message AS message;
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `changeStatusPPB` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `changeStatusPPB`(
	IN oGetDateNow DATETIME
	, IN p_idStatus INT
	, IN jsonData JSON
	, IN p_idUserLogON BIGINT
)
BEGIN

	DECLARE mensaje_error TEXT;
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        -- Capturar el mensaje de error
        GET DIAGNOSTICS CONDITION 1 mensaje_error = MESSAGE_TEXT;
		SELECT 0 AS out_id, mensaje_error AS message;
    END;

	SET autocommit = 0;

	DROP TABLE IF EXISTS oTemp;

	CREATE TEMPORARY TABLE oTemp (
		id BIGINT AUTO_INCREMENT,
		idProdProdBaseDetalle BIGINT,
        cantProducida DECIMAL(18,2),
		comments VARCHAR(10000),
		PRIMARY KEY(id)
	) ENGINE=InnoDB;

    SET @i = 0;
    SET @total = 0;

    -- Obtener la cantidad de elementos en el JSON
    SET @total = JSON_LENGTH(jsonData);

    -- Recorrer el JSON e insertar directamente
    WHILE @i < @total DO
	
        INSERT INTO oTemp (
            idProdProdBaseDetalle, cantProducida, comments
        ) VALUES (
            JSON_EXTRACT(jsonData, CONCAT('$[', @i, '].idProdProdBaseDetalle')),
            JSON_EXTRACT(jsonData, CONCAT('$[', @i, '].cantProducida')),
			JSON_UNQUOTE(JSON_EXTRACT(jsonData, CONCAT('$[', @i, '].comments')))
        );

        -- Incrementar contador
        SET @i = @i + 1;
		
    END WHILE;
    
    INSERT INTO `change_status_ppd_log`
	(
	`idProdProdBaseDetalle`,
	`createDate`,
	`idStatusFrom`,
	`idStatusTo`,
	`idCreateUser`)
	SELECT
	PPBD.idProdProdBaseDetalle
	, oGetDateNow
	, PPBD.idStatus
	, p_idStatus
	, p_idUserLogON
	FROM prod_prod_base_detalle AS PPBD
	INNER JOIN oTemp AS temp
		ON
			temp.idProdProdBaseDetalle = PPBD.idProdProdBaseDetalle
		;
	
	UPDATE
		prod_prod_base_detalle AS PPBD
		INNER JOIN oTemp AS temp
			ON
				temp.idProdProdBaseDetalle = PPBD.idProdProdBaseDetalle
	SET
		PPBD.idStatus = p_idStatus
											-- SI SE PRODUCE O SE ENVIA Y NO ESPESIFICÓ CANTIDAD PRODUCIDA, EN AUTOMÁTICO TOMA LA CANTIDAD SOLICITADA
        , PPBD.cantProducida = ( CASE WHEN p_idStatus IN( 3, 4 ) AND temp.cantProducida > 0 THEN temp.cantProducida
										WHEN p_idStatus IN( 3, 4 ) AND temp.cantProducida = 0 THEN PPBD.cantidad
										ELSE PPBD.cantProducida END )
		, PPBD.comments = temp.comments
	;
    
	-- ESTATUS DE RECIBIDO
	IF p_idStatus = 5 THEN
	
		SET SQL_SAFE_UPDATES = 0;
		
		DROP TABLE IF EXISTS ODataProdTemp;

		CREATE TEMPORARY TABLE ODataProdTemp (
			id BIGINT AUTO_INCREMENT,
			idProdProdBaseDetalle BIGINT,
			idProductoBase BIGINT,
			cantidad DECIMAL(18,2),
			costo DECIMAL(18,2),
			costoTotal DECIMAL(18,2),
			PRIMARY KEY(id)
		) ENGINE=InnoDB;
		
		INSERT INTO ODataProdTemp ( idProdProdBaseDetalle, idProductoBase, cantidad, costo, costoTotal )
		SELECT
			PPBD.idProdProdBaseDetalle, idProductoBase, T.cantProducida, costo, costoTotal
		FROM prod_prod_base_detalle AS PPBD
		INNER JOIN oTemp AS T ON T.idProdProdBaseDetalle = PPBD.idProdProdBaseDetalle
		WHERE
			PPBD.bOK = 1
		;
		
		DROP TABLE IF EXISTS ODataTemp;
		
		CREATE TEMPORARY TABLE ODataTemp (
			id BIGINT AUTO_INCREMENT,
			idStock BIGINT,
			idMateriaPrima BIGINT,
			cantidadConsumida DECIMAL(18, 2),
			costoUnitario DECIMAL(18, 2),
			costoTotal DECIMAL(18, 2),
			PRIMARY KEY(id)
		) ENGINE=InnoDB;

		SET @i = 1;
		SET @total = 0;

		-- Obtener la cantidad de elementos para recorrer el while
		SET @total = ( SELECT COUNT(*) FROM ODataProdTemp );

		-- Recorrer el JSON e insertar directamente
		WHILE @i <= @total DO
		
			-- LIMPIO LA TABLA ANTES DE LLENARLA
			DELETE FROM ODataTemp;
		
			SET @idProdProdBaseDetalle = 0;
			SET @idProductoBase = 0;
			SET @cantidad = 0;
			SET @costo = 0;
			SET @costoTotal = 0;
			SET @productoBaseName = '';
			
			SET @idProdProdBaseDetalle = ( SELECT idProdProdBaseDetalle FROM ODataProdTemp WHERE id = @i );
			SET @idProductoBase = ( SELECT idProductoBase FROM ODataProdTemp WHERE id = @i );
			SET @cantidad = ( SELECT cantidad FROM ODataProdTemp WHERE id = @i );
			SET @costo = ( SELECT costo FROM ODataProdTemp WHERE id = @i );
			SET @costoTotal = ( SELECT costoTotal FROM ODataProdTemp WHERE id = @i );
			
			SET @productoBaseName = (
			
				SELECT 
				
					CONCAT( IFNULL( CTP.abreviatura ,''), '-', CAST( P.idproductocategoria AS CHAR(12) ) , '-', IFNULL( CD.description ,''), ' ', REPLACE( CAST( P.valorMedida AS CHAR(12) ) , '.00', ''), ' ', IFNULL( UM.abreviatura ,'') )

				FROM productos AS P
				INNER JOIN cat_tipo_producto AS CTP ON CTP.active = 1 AND CTP.idCatTipoProducto = P.idCatTipoProducto
				INNER JOIN cat_descripciones AS CD ON CD.active = 1 AND CD.idDescription = P.idDescription
				INNER JOIN cat_unidad_medida AS UM ON UM.active = 1 AND UM.idUnidadMedida = P.idUnidadMedida
				WHERE
					P.idProducto = @idProductoBase
			
			);
		
			INSERT INTO ODataTemp (
				idStock, idMateriaPrima, cantidadConsumida, costoUnitario, costoTotal
			)
			SELECT
			
			PPBS.idStock
			, SL.idProducto AS idMateriaPrima
			, PPBS.cantidadConsumida
			, PPBS.costoUnitario
			, PPBS.costoTotal
			
			FROM prod_prod_base_stock AS PPBS
			INNER JOIN stocklog AS SL ON SL.idStock = PPBS.idStock
			WHERE
				PPBS.idProdProdBaseDetalle = @idProdProdBaseDetalle
			;
			
			-- START TRANSACTION;
			
			-- BAJO EL INVENTARIO LOG
			INSERT INTO stocklog
			(
				createDate
				, active
				, idOrigen
				, idProducto
				, idCatMov
				, cantidad
				, costo
				, idStockFrom
				, idRelacionOperacion
				, comentarios
				, idCreateUser
				, motivoDesc
			)
			SELECT
			
			oGetDateNow
			, 1
			, 1 -- 1: AMP, 2: APB, 3: APA, 4: APT
			, idMateriaPrima
			, 2 -- 1: Orden de compra, 2: Producción, 3: Transferencia
			, cantidadConsumida * -1 -- LE QUITAMOS LO QUE SE CONSUMIÓ 
			, costoUnitario
			, idStock
			, 0
			, ''
			, P_idUserLogON
            , CONCAT( 'Salida por producción #', @idProdProdBaseDetalle,' de ', @productoBaseName )
			
			FROM ODataTemp;
			
			-- HAGO UN UPDATE AL STOCK DE LA MATERIA PRIMA
			UPDATE
				stock AS S
				INNER JOIN
				(
					SELECT
					MPP.idMateriaPrima
					, SUM( MPP.cantidadConsumida ) AS cantidadConsumida
					FROM ODataTemp AS MPP
					GROUP BY MPP.idMateriaPrima
				) AS MP
					ON
						S.idOrigen = 1 -- 1: AMP, 2: APB, 3: APA, 4: APT
						AND S.idProducto = MP.idMateriaPrima
						
			SET
				S.cantidad = S.cantidad - MP.cantidadConsumida
			;
			
			IF
			(
				SELECT
				COUNT(*)
				FROM stock
				WHERE
					idOrigen = 2 -- 1: AMP, 2: APB, 3: APA, 4: APT
					AND idProducto = @idProductoBase
			) > 0
			THEN
			
				-- AHORA INSERTO EL INVENTARIO DEL PRODUCTO BASE PRODUCIDO
				-- HAGO UN UPDATE AL STOCK POR SI EXISTE QUE LE SUME LA CANTIDAD
				-- SI NO EXISTE LO HACE EN EL INSERT DE ABAJO
				UPDATE
					stock
				SET
					cantidad = cantidad + @cantidad
					, costo = @costo
				WHERE
					idOrigen = 2 -- 1: AMP, 2: APB, 3: APA, 4: APT
					AND idProducto = @idProductoBase
				;
				
			ELSE
			
				-- EN CASO DE NO EXISTIR EL INVENTARIO DE LA MATERIA PRIMA, ENTONCES LO INSERTA
				INSERT INTO stock
				(
					createDate
					, active
					, idOrigen
					, idProducto
					, cantidad
					, costo
				)
				SELECT
				
				oGetDateNow
				, 1
				, 2 -- 1: AMP, 2: APB, 3: APA, 4: APT
				, @idProductoBase
				, @cantidad -- CANTIDAD PRODUCIDA
				, @costo -- COSTO UNITARIO
				;
			
			END IF;
			
			-- INSERTO EL LOG POSITIVO DE LA PRODUCCIÓN DEL PRODUCTO
			INSERT INTO stocklog
			(
				createDate
				, active
				, idOrigen
				, idProducto
				, idCatMov
				, cantidad
				, costo
				, idStockFrom
				, idRelacionOperacion
				, comentarios
				, idCreateUser
				, motivoDesc
			)
			SELECT
			
			oGetDateNow
			, 1
			, 2 -- 1: AMP, 2: APB, 3: APA, 4: APT
			, @idProductoBase
			, 2 -- 1: Orden de compra, 2: Producción, 3: Transferencia
			, @cantidad -- CANTIDAD PRODUCIDA
			, @costo -- COSTO UNITARIO
			, 0
			, 0
			, ''
			, P_idUserLogON
			, CONCAT( 'Entrada por producción #', @idProdProdBaseDetalle )
			;
			
			-- COMMIT;
			
			-- Incrementar contador
			SET @i = @i + 1;
			
		END WHILE;
		
		SELECT 1 AS out_id, 'Producido con éxito.' AS message;
	ELSE
		SELECT 1 AS out_id, 'Actualizado con éxito.' AS message;
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `changeStatusPPB2` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `changeStatusPPB2`(
	IN oGetDateNow DATETIME
	, IN p_idStatus INT
	, IN jsonData JSON
	, IN p_idUserLogON BIGINT
)
BEGIN

	DECLARE mensaje_error TEXT;
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        -- Capturar el mensaje de error
        GET DIAGNOSTICS CONDITION 1 mensaje_error = MESSAGE_TEXT;
		SELECT 0 AS out_id, mensaje_error AS message;
    END;

	DROP TABLE IF EXISTS oTemp;

	CREATE TEMPORARY TABLE oTemp (
		id BIGINT AUTO_INCREMENT,
		idProdProdBaseDetalle BIGINT,
        cantProducida DECIMAL(18,2),
		comments VARCHAR(10000),
		PRIMARY KEY(id)
	) ENGINE=InnoDB;

    SET @i = 0;
    SET @total = 0;

    -- Obtener la cantidad de elementos en el JSON
    SET @total = JSON_LENGTH(jsonData);

    -- Recorrer el JSON e insertar directamente
    WHILE @i < @total DO
	
        INSERT INTO oTemp (
            idProdProdBaseDetalle, cantProducida, comments
        ) VALUES (
            JSON_EXTRACT(jsonData, CONCAT('$[', @i, '].idProdProdBaseDetalle')),
            JSON_EXTRACT(jsonData, CONCAT('$[', @i, '].cantProducida')),
			JSON_UNQUOTE(JSON_EXTRACT(jsonData, CONCAT('$[', @i, '].comments')))
        );

        -- Incrementar contador
        SET @i = @i + 1;
		
    END WHILE;
    
    INSERT INTO `change_status_ppd_log`
	(
		`idProdProdBaseDetalle`,
		`createDate`,
		`idStatusFrom`,
		`idStatusTo`,
		`idCreateUser`
	)
	SELECT
	PPBD.idProdProdBaseDetalle
	, oGetDateNow
	, PPBD.idStatus
	, p_idStatus
	, p_idUserLogON
	FROM prod_prod_base_detalle AS PPBD
	INNER JOIN oTemp AS temp
		ON
			temp.idProdProdBaseDetalle = PPBD.idProdProdBaseDetalle
		;
	
	UPDATE
		prod_prod_base_detalle AS PPBD
		INNER JOIN oTemp AS temp
			ON
				temp.idProdProdBaseDetalle = PPBD.idProdProdBaseDetalle
	SET
		PPBD.idStatus = p_idStatus
											-- SI SE PRODUCE O SE ENVIA Y NO ESPESIFICÓ CANTIDAD PRODUCIDA, EN AUTOMÁTICO TOMA LA CANTIDAD SOLICITADA
        , PPBD.cantProducida = ( CASE WHEN p_idStatus IN( 3, 4 ) AND temp.cantProducida > 0 THEN temp.cantProducida
										WHEN p_idStatus IN( 3, 4 ) AND temp.cantProducida = 0 THEN PPBD.cantidad
										ELSE PPBD.cantProducida END )
		, PPBD.comments = temp.comments
	;
    
	-- ESTATUS DE RECIBIDO
	IF p_idStatus = 5 THEN
	
		SET SQL_SAFE_UPDATES = 0;
		
		DROP TABLE IF EXISTS ODataProdTemp;

		CREATE TEMPORARY TABLE ODataProdTemp (
			id BIGINT AUTO_INCREMENT,
			idProdProdBaseDetalle BIGINT,
			idProductoBase BIGINT,
			cantidad DECIMAL(18,2),
			PRIMARY KEY(id)
		) ENGINE=InnoDB;
		
		INSERT INTO ODataProdTemp ( idProdProdBaseDetalle, idProductoBase, cantidad )
		SELECT
			PPBD.idProdProdBaseDetalle, idProductoBase, T.cantProducida
		FROM prod_prod_base_detalle AS PPBD
		INNER JOIN oTemp AS T ON T.idProdProdBaseDetalle = PPBD.idProdProdBaseDetalle
		WHERE
			PPBD.bOK = 1
		;
		
		SET @i = 1;
		SET @total = 0;

		-- Obtener la cantidad de elementos para recorrer el while
		SET @total = ( SELECT COUNT(*) FROM ODataProdTemp );

		-- Recorrer el JSON e insertar directamente
		WHILE @i <= @total DO
		
			SET @idProdProdBaseDetalle = 0;
			SET @idProductoBase = 0;
			SET @cantidad = 0;
			SET @productoBaseName = '';
			
			SET @idProdProdBaseDetalle = ( SELECT idProdProdBaseDetalle FROM ODataProdTemp WHERE id = @i );
			SET @idProductoBase = ( SELECT idProductoBase FROM ODataProdTemp WHERE id = @i );
			SET @cantidad = ( SELECT cantidad FROM ODataProdTemp WHERE id = @i );
			
			SET @productoBaseName = (
			
				SELECT 
				
					CONCAT( IFNULL( CTP.abreviatura ,''), '-', CAST( P.idproductocategoria AS CHAR(12) ) , '-', IFNULL( CD.description ,''), ' ', REPLACE( CAST( P.valorMedida AS CHAR(12) ) , '.00', ''), ' ', IFNULL( UM.abreviatura ,'') )

				FROM productos AS P
				INNER JOIN cat_tipo_producto AS CTP ON CTP.active = 1 AND CTP.idCatTipoProducto = P.idCatTipoProducto
				INNER JOIN cat_descripciones AS CD ON CD.active = 1 AND CD.idDescription = P.idDescription
				INNER JOIN cat_unidad_medida AS UM ON UM.active = 1 AND UM.idUnidadMedida = P.idUnidadMedida
				WHERE
					P.idProducto = @idProductoBase
			
			);
			
			-- BAJO EL INVENTARIO LOG DE LA MATERIA PRIMA
			INSERT INTO stocklog
			(
				createDate
				, active
				, idOrigen
				, idProducto
				, idCatMov
				, cantidad
				, costo
				, idStockFrom
				, idRelacionOperacion
				, comentarios
				, idCreateUser
				, motivoDesc
			)
			SELECT
			
			oGetDateNow
			, 1
			, SBL.idOrigen -- 1: AMP, 2: APB, 3: APA, 4: APT
			, SBL.idProducto
			, 2 -- 1: Orden de compra, 2: Producción, 3: Transferencia
			, ( SBL.cantidad * -1 )
			, 0 -- costoUnitario
			, 0 -- idStock
			, 0
			, ''
			, P_idUserLogON
			, CONCAT( 'Salida por producción #',  @idProdProdBaseDetalle,' de ', @productoBaseName )
			
			FROM stock_block_log AS SBL
			WHERE
				SBL.idRelation = @idProdProdBaseDetalle
				AND SBL.relationType = 'ProdProdBase'
			;
			
			-- HAGO UN UPDATE AL STOCK DE LA MP
			UPDATE
				stock AS S
				INNER JOIN stock_block_log AS SBL
				ON
					SBL.idRelation = @idProdProdBaseDetalle
					AND SBL.relationType = 'ProdProdBase'
					AND SBL.idOrigen = S.idOrigen -- 1: AMP, 2: APB, 3: APA, 4: APT
					AND SBL.idProducto = S.idProducto
						
			SET
				S.cantidad = S.cantidad - SBL.cantidad
			;
			
			IF
			(
				SELECT
				COUNT(*)
				FROM stock
				WHERE
					idOrigen = 2 -- 1: AMP, 2: APB, 3: APA, 4: APT
					AND idProducto = @idProductoBase
			) > 0
			THEN
			
				-- AHORA INSERTO EL INVENTARIO DEL PRODUCTO BASE PRODUCIDO
				-- HAGO UN UPDATE AL STOCK POR SI EXISTE QUE LE SUME LA CANTIDAD
				-- SI NO EXISTE LO HACE EN EL INSERT DE ABAJO
				UPDATE
					stock
				SET
					cantidad = cantidad + @cantidad
				WHERE
					idOrigen = 2 -- 1: AMP, 2: APB, 3: APA, 4: APT
					AND idProducto = @idProductoBase
				;
				
			ELSE
			
				-- EN CASO DE NO EXISTIR EL INVENTARIO DE LA MATERIA PRIMA, ENTONCES LO INSERTA
				INSERT INTO stock
				(
					createDate
					, active
					, idOrigen
					, idProducto
					, cantidad
					, costo
				)
				SELECT
				
				oGetDateNow
				, 1
				, 2 -- 1: AMP, 2: APB, 3: APA, 4: APT
				, @idProductoBase
				, @cantidad -- CANTIDAD PRODUCIDA
				, 0 -- COSTO UNITARIO
				;
			
			END IF;
			
			-- INSERTO EL LOG POSITIVO DE LA PRODUCCIÓN DEL PRODUCTO
			INSERT INTO stocklog
			(
				createDate
				, active
				, idOrigen
				, idProducto
				, idCatMov
				, cantidad
				, costo
				, idStockFrom
				, idRelacionOperacion
				, comentarios
				, idCreateUser
				, motivoDesc
			)
			SELECT
			
			oGetDateNow
			, 1
			, 2 -- 1: AMP, 2: APB, 3: APA, 4: APT
			, @idProductoBase
			, 2 -- 1: Orden de compra, 2: Producción, 3: Transferencia
			, @cantidad -- CANTIDAD PRODUCIDA
			, 0 -- COSTO UNITARIO
			, 0
			, 0
			, ''
			, P_idUserLogON
			, CONCAT( 'Entrada por producción #', @idProdProdBaseDetalle )
			;
			
			-- *******************************************************************************************************
			-- DESBLOQUEAR EL INVENTARIO
			
			-- 3. Actualiza stock restando cantidadBlock por producto
			UPDATE
				stock AS S
				INNER JOIN stock_block_log AS SBL
				ON
					SBL.idRelation = @idProdProdBaseDetalle
					AND SBL.relationType = 'ProdProdBase'
					AND SBL.idOrigen = S.idOrigen -- 1: AMP, 2: APB, 3: APA, 4: APT
					AND SBL.idProducto = S.idProducto
					
			SET S.cantidadBlock = S.cantidadBlock - SBL.cantidad;
			
			DELETE FROM stock_block_log WHERE idStock > 0 AND idRelation = @idProdProdBaseDetalle AND relationType = 'ProdProdBase';
			
			-- *******************************************************************************************************
			
			-- Incrementar contador
			SET @i = @i + 1;
			
		END WHILE;
		
		SELECT 1 AS out_id, 'Producido con éxito.' AS message;
	ELSE
		SELECT 1 AS out_id, 'Actualizado con éxito.' AS message;
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `clearActionsConfByIdRelation` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `clearActionsConfByIdRelation`(
IN p_relationType VARCHAR(5)
, IN p_idRelation BIGINT
)
BEGIN

SET SESSION TRANSACTION ISOLATION LEVEL READ UNCOMMITTED ;
	
	DELETE FROM actionsconf 
	WHERE relationType = p_relationType
	AND idRelation = p_idRelation;

	SELECT 1 AS bOK;

SET SESSION TRANSACTION ISOLATION LEVEL REPEATABLE READ ;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `clearMenusPermisosByIdRelation` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `clearMenusPermisosByIdRelation`(
IN p_relationType VARCHAR(5)
, IN p_idRelation BIGINT
)
BEGIN

SET SESSION TRANSACTION ISOLATION LEVEL READ UNCOMMITTED ;
	
	DELETE FROM menupermisos 
	WHERE
		typeRelation = p_relationType
		AND idRelation = p_idRelation;

	SELECT 1 AS bOK;

 SET SESSION TRANSACTION ISOLATION LEVEL REPEATABLE READ ;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `completarOrdenCompra` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `completarOrdenCompra`(
    IN oGetDateNow DATETIME,
	IN p_idOrdenDeCompra BIGINT,
	IN P_idUserLogON BIGINT
	
)
BEGIN

	SET @out_id = 0;
    SET @message = '';
	
	SET @idOrdenCompraStatus = 0;
	
	SET @idOrdenCompraStatus = IFNULL(
	(
		SELECT
		idOrdenCompraStatus
		FROM orden_compra
		WHERE
			idOrdenDeCompra = p_idOrdenDeCompra
	)
	,0);

    IF @idOrdenCompraStatus = 1 THEN
	
		DROP TABLE IF EXISTS oGroupByMatPrimaTemp;
	
		CREATE TEMPORARY TABLE oGroupByMatPrimaTemp (
			id BIGINT AUTO_INCREMENT,
			idProducto BIGINT,
			idOrigen SMALLINT,
			cantidad FLOAT,
			costo FLOAT,
			PRIMARY KEY(id)
		) ENGINE=InnoDB;
		
		INSERT INTO oGroupByMatPrimaTemp
		(
			idProducto
			, idOrigen
			, cantidad
			, costo
		)
		SELECT
		
		OCD.idProducto
		-- SI ES MATERIA PRIMA ENTONCES ES ALMACEN DE MATERIA PRIMA
		, ( CASE WHEN idCatTipoProducto = 2 THEN 1
				-- SI ES INSUMO, ENTONCES ES ALMACEN DE INSUMO
				WHEN idCatTipoProducto = 5 THEN 5 END ) -- 1: AMP, 2: APB, 3: APA, 4: APT, 5: Insumos
		, SUM( OCD.cantidad )
		, MAX( OCD.costo )
		
		FROM orden_compra_detalle AS OCD
		INNER JOIN productos AS P ON P.idProducto = OCD.idProducto
		INNER JOIN orden_compra AS OC ON OC.idOrdenDeCompra = OCD.idOrdenDeCompra
		WHERE
			OCD.idOrdenDeCompra = p_idOrdenDeCompra
		GROUP BY
        
			OCD.idProducto
            
		;
		
		INSERT INTO stocklog
		(
			createDate
			, active
			, idOrigen
			, idProducto
			, idCatMov
			, cantidad
			, costo
			, idStockFrom
			, idRelacionOperacion
			, comentarios
			, idCreateUser
            , motivoDesc
		)
		SELECT
		
		oGetDateNow
		, 1
		, idOrigen -- 1: AMP, 2: APB, 3: APA, 4: APT, 5: Insumos
		, idProducto
		, 1 -- 1: Orden de compra, 2: Producción, 3: Transferencia
		, cantidad
		, costo
		, 0
        , p_idOrdenDeCompra
		, ''
		, P_idUserLogON
        , CONCAT( 'Entrada por Orden de Compra OC#' , p_idOrdenDeCompra )
		
		FROM oGroupByMatPrimaTemp;
		
		-- HAGO UN UPDATE AL STOCK POR SI EXISTE QUE LE SUME LA CANTIDAD DE LA MATERIA PRIA
		-- SI NO EXISTE LO HACE EN EL INSERT DE ABAJO
		UPDATE
			stock AS S
			INNER JOIN oGroupByMatPrimaTemp AS MP
				ON
					S.idOrigen = MP.idOrigen -- 1: AMP, 2: APB, 3: APA, 4: APT, 5: Insumos
					AND S.idProducto = MP.idProducto
		SET
			S.cantidad = S.cantidad + MP.cantidad
            , S.costo = MP.costo
		;
		
		-- EN CASO DE NO EXISTIR EL INVENTARIO DE LA MATERIA PRIMA, ENTONCES LO INSERTA
		INSERT INTO stock
		(
			createDate
			, active
			, idOrigen
			, idProducto
			, cantidad
			, costo
		)
		SELECT
		
		oGetDateNow
		, 1
		, MP.idOrigen -- 1: AMP, 2: APB, 3: APA, 4: APT, 5: Insumos
		, MP.idProducto
		, MP.cantidad
		, MP.costo
		
		FROM oGroupByMatPrimaTemp AS MP
		LEFT JOIN stock AS S
			ON
				S.idOrigen = MP.idOrigen -- 1: AMP, 2: APB, 3: APA, 4: APT, 5: Insumos
				AND S.idProducto = MP.idProducto
		WHERE
			S.idStock IS NULL -- QUE NO EXISTA EL REGISTRO
		;
		
		UPDATE
			orden_compra
		SET
			idOrdenCompraStatus = 2 -- 1: BORRADOR, 2: COMPLETO
		WHERE
			idOrdenDeCompra = p_idOrdenDeCompra
		;
	
		SET @out_id = p_idOrdenDeCompra;
		SET @message = 'Guardado con éxito.';	
		
    ELSE
		
		SET @message = 'Estatus incorrecto.';
		
    END IF;

    SELECT @out_id AS out_id, @message AS message;
	
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `completarYGuardarES` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `completarYGuardarES`(
	IN oGetDateNow DATETIME
	, IN p_idEntradasSalidasH BIGINT
    , IN P_idUserLogON BIGINT
)
BEGIN

	DECLARE mensaje_error TEXT;
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        -- Capturar el mensaje de error
        GET DIAGNOSTICS CONDITION 1 mensaje_error = MESSAGE_TEXT;
		SELECT 0 AS out_id, mensaje_error AS message;
    END;

	SET SQL_SAFE_UPDATES = 0;
	
	SET @idCatMov = 0;
	SET @idEntradaSalidaStatus = 0;
	
	SELECT
	ESH.idCatMov, ESH.idEntradaSalidaStatus
	INTO
	@idCatMov, @idEntradaSalidaStatus
	FROM entradas_salidas_header AS ESH
	WHERE
		ESH.idEntradasSalidasH = p_idEntradasSalidasH
	;
	
	SET @bOK = 0;
	
	-- SI ES ENTRADA MANUAL, COMPRA A PROVEEDOR
	IF @idCatMov IN( 4, 6 ) AND @idEntradaSalidaStatus = 1 THEN -- Y QUE ESTÉ EN BORRADOR
		SET @bOK = 1;
	-- SALIDA MANUAL
	ELSEIF @idCatMov IN( 5 ) AND @idEntradaSalidaStatus = 1 THEN -- Y QUE ESTÉ EN BORRADOR
		-- VALIDO EL INVENTARIO
		IF
		(
			SELECT COUNT(*)
			FROM stock AS S
			INNER JOIN
			(
				SELECT ESH.idOrigenFrom, ESD.idProducto, SUM( ESD.cantidad ) AS cantidad
				FROM entradas_salidas_detalle AS ESD
				INNER JOIN entradas_salidas_header AS ESH ON ESH.idEntradasSalidasH = ESD.idEntradasSalidasH
				WHERE
					ESD.idEntradasSalidasH = p_idEntradasSalidasH
				GROUP BY ESH.idOrigenFrom, ESD.idProducto
			) AS P
				ON P.idProducto = S.idProducto
				AND P.idOrigenFrom = S.idOrigen
			WHERE
				-- SI EL STOCK MENOS LO BLOQUEADO MENOS LA CANTIDAD NECESARIA ES MENOR A 0, QUIERE DECIR QUE NO HAY INV
				( ROUND( IFNULL( S.cantidad ,0) - IFNULL( S.cantidadBlock ,0) + P.cantidad ,2) ) < 0
		) = 0 THEN
			SET @bOK = 1;
		ELSE
			SET @bOK = 0;
			SELECT 0 AS out_id, 'No hay Inventario suficiente.' AS message;
		END IF;
		
	END IF;
	
	IF @bOK = 1 THEN
	
		-- HAGO UN UPDATE AL STOCK DE LOS ARTICULOS EN CASO DE EXISTIR
		UPDATE stock AS S
		INNER JOIN entradas_salidas_header AS ESH
			ON
				S.idOrigen = ESH.idOrigenFrom
		INNER JOIN entradas_salidas_detalle AS ESD
			ON
				ESH.idEntradasSalidasH = ESD.idEntradasSalidasH
				AND S.idProducto = ESD.idProducto
		SET
			S.cantidad = S.cantidad + ESD.cantidad
		WHERE
			ESH.idEntradasSalidasH = p_idEntradasSalidasH
			
			;
	
		-- EN CASO DE NO EXISTIR EL INVENTARIO, ENTONCES LO INSERTA
		INSERT INTO stock
		(
			createDate
			, active
			, idOrigen
			, idProducto
			, cantidad
			, costo
		)
		SELECT
		
		oGetDateNow
		, 1
		, ESH.idOrigenFrom -- 1: AMP, 2: APB, 3: APA, 4: APT
		, ESD.idProducto
		, ESD.cantidad
		, 0 -- @costo -- COSTO UNITARIO
		FROM entradas_salidas_detalle AS ESD
		INNER JOIN entradas_salidas_header AS ESH
			ON
				ESH.idEntradasSalidasH = ESD.idEntradasSalidasH
		LEFT JOIN stock AS S
			ON
				S.idProducto = ESD.idProducto
				AND S.idOrigen = ESH.idOrigenFrom
		WHERE
			ESH.idEntradasSalidasH = p_idEntradasSalidasH
			AND S.idStock IS NULL -- QUE NO TENGA REGISTROS
			
		;
			
		-- INSERTO EL LOG POSITIVO DE LA PRODUCCIÓN DEL PRODUCTO
		INSERT INTO stocklog
		(
			createDate
			, active
			, idOrigen
			, idProducto
			, idCatMov
			, cantidad
			, costo
			, idStockFrom
			, idRelacionOperacion
			, comentarios
			, idCreateUser
			, motivoDesc
		)
		SELECT
		
		oGetDateNow
		, 1
		, ESH.idOrigenFrom -- 1: AMP, 2: APB, 3: APA, 4: APT
		, ESD.idProducto
		, ESH.idCatMov -- 1: Orden de compra, 2: Producción, 3: Transferencia
		, ESD.cantidad -- CANTIDAD PRODUCIDA
		, 0 -- COSTO UNITARIO
		, 0
		, 0
		, ''
		, P_idUserLogON
		, CONCAT( CMES.description, ' ES#' , p_idEntradasSalidasH )
		
        FROM entradas_salidas_header AS ESH
		INNER JOIN entradas_salidas_detalle AS ESD
			ON
				ESH.idEntradasSalidasH = ESD.idEntradasSalidasH
		INNER JOIN cat_mov_entrada_salida AS CMES
			ON
				CMES.idCatMov = ESH.idCatMov
		
		WHERE
			ESH.idEntradasSalidasH = p_idEntradasSalidasH
		;
		
		UPDATE
			entradas_salidas_header
		SET
			idEntradaSalidaStatus = 3 -- 1: BORRADOR, 2: EN APROBACIÓN, 3: COMPLETO
		WHERE
			idEntradasSalidasH = p_idEntradasSalidasH
		;
		
		SELECT 1 AS out_id, 'Guardado con éxito.' AS message;
		
	ELSE
		SELECT 0 AS out_id, 'No se pudo guardar.' AS message;
	END IF;
    
    SET SQL_SAFE_UPDATES = 1;
	
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `compraMensualSumarizado` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `compraMensualSumarizado`(
IN oGetDateNow DATETIME
, IN p_startDate VARCHAR(50)
, IN p_endDate VARCHAR(50)
, IN p_idVendedor BIGINT
, IN p_idZona INT
, IN p_idTipoCliente BIGINT
, IN p_bProspecto SMALLINT
, IN p_idGiro INT
, IN p_iSeguimiento INT
, IN p_idDepartamento INT
, IN p_active SMALLINT
, IN p_search VARCHAR(500)
)
BEGIN

    DECLARE v_compraEstimada DECIMAL( 18, 2 ) DEFAULT 0;
	DECLARE v_compraEstimadaReal DECIMAL( 18, 2 ) DEFAULT 0;

    SELECT
        
		ROUND( SUM( IFNULL( C.compraEstimada ,0) ) ,2)
	INTO
		v_compraEstimada
		
    FROM clientes AS C
    WHERE
	( IFNULL( p_startDate ,'') = '' OR CAST( C.createDate AS DATE ) >= p_startDate)
	AND ( IFNULL( p_endDate ,'') = '' OR CAST( C.createDate AS DATE ) <= p_endDate)
	AND
	(
		p_idVendedor = 0
		OR C.idVendedor = p_idVendedor
	)
	AND
	(
		p_idZona = 0
		OR C.idZona = p_idZona
	)
    AND
	(
		p_idTipoCliente = 0
		OR C.idTipoCliente = p_idTipoCliente
	)
	AND
	(
        p_search = ''
        OR C.nombre LIKE CONCAT('%', p_search, '%')
        OR C.rfc LIKE CONCAT('%', p_search, '%')
    )
	AND
	(
		( p_bProspecto = 0 AND IFNULL( C.bProspecto ,0) = 0 )
		OR ( p_bProspecto = 1 AND ( IFNULL( C.bProspecto ,0) = 1 OR IFNULL( C.bFProspecto ,0) = 1 ) )
	)
	AND
	(
		p_idGiro = 0
		OR C.idGiro = p_idGiro
	)
	AND
	(
		p_iSeguimiento = 0
		OR ( p_iSeguimiento = 1 AND IFNULL( C.bProspecto ,0) = 1 )
		OR ( p_iSeguimiento = 2 AND IFNULL( C.bProspecto ,0) = 0 AND IFNULL( C.bFProspecto ,0) = 1 )
	)
	AND
	(
		p_active = 0
		OR ( p_active = 1 AND C.active = 1 )
		OR ( p_active = 2 AND C.active = 0 )
	);
	
	SELECT
		SUM( VD.total ) AS total
	INTO
		v_compraEstimadaReal
	FROM ventas AS V
	INNER JOIN clientes AS C ON V.idCliente = C.idCliente
	INNER JOIN ventasdetalle AS VD ON VD.idVenta = V.idVenta
	INNER JOIN productos AS P ON P.idProducto = VD.idProducto
	INNER JOIN cat_familias AS F ON F.idFamilia = P.idFamilia
	WHERE
		V.active = 1
		AND (p_idDepartamento = 0 OR F.idDepartamento = p_idDepartamento)
		AND CAST( V.createDate AS DATE )
			BETWEEN
				CAST( DATE_SUB( oGetDateNow, INTERVAL 1 MONTH) AS DATE )
			AND
				CAST( oGetDateNow AS DATE )
		AND ( IFNULL( p_startDate ,'') = '' OR CAST( C.createDate AS DATE ) >= p_startDate)
		AND ( IFNULL( p_endDate ,'') = '' OR CAST( C.createDate AS DATE ) <= p_endDate)
		AND
		(
			p_idVendedor = 0
			OR C.idVendedor = p_idVendedor
		)
		AND
		(
			p_idZona = 0
			OR C.idZona = p_idZona
		)
		AND
		(
			p_idTipoCliente = 0
			OR C.idTipoCliente = p_idTipoCliente
		)
		AND
		(
			p_search = ''
			OR C.nombre LIKE CONCAT('%', p_search, '%')
			OR C.rfc LIKE CONCAT('%', p_search, '%')
		)
		AND
		(
			( p_bProspecto = 0 AND IFNULL( C.bProspecto ,0) = 0 )
			OR ( p_bProspecto = 1 AND ( IFNULL( C.bProspecto ,0) = 1 OR IFNULL( C.bFProspecto ,0) = 1 ) )
		)
		AND
		(
			p_idGiro = 0
			OR C.idGiro = p_idGiro
		)
		AND
		(
			p_iSeguimiento = 0
			OR ( p_iSeguimiento = 1 AND IFNULL( C.bProspecto ,0) = 1 )
			OR ( p_iSeguimiento = 2 AND IFNULL( C.bProspecto ,0) = 0 AND IFNULL( C.bFProspecto ,0) = 1 )
		)
		AND
		(
			p_active = 0
			OR ( p_active = 1 AND C.active = 1 )
			OR ( p_active = 2 AND C.active = 0 )
		);
	
	SELECT v_compraEstimada AS compraEstimada, v_compraEstimadaReal AS compraEstimadaReal;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `consInvDeInsPProdFinal` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `consInvDeInsPProdFinal`(
	IN p_idProducto BIGINT
)
BEGIN

    SELECT
	
	FPB.idInsumo
    , CONCAT( IFNULL( CTP.abreviatura ,''), '-', CAST( P.idproductocategoria AS CHAR(12) ) , '-', IFNULL( CD.description ,''), ' ', REPLACE( CAST( P.valorMedida AS CHAR(12) ) , '.00', ''), ' ', IFNULL( UM.abreviatura ,'') ) AS insumoName
    , IFNULL( S.cantidad ,0) - IFNULL( S.cantidadBlock ,0) AS cantidadDisp
	
	FROM insumos_productos AS FPB
	INNER JOIN productos AS P ON P.active = 1 AND P.idProducto = FPB.idInsumo
	INNER JOIN cat_tipo_producto AS CTP ON CTP.active = 1 AND CTP.idCatTipoProducto = P.idCatTipoProducto
	INNER JOIN cat_descripciones AS CD ON CD.active = 1 AND CD.idDescription = P.idDescription
	INNER JOIN cat_unidad_medida AS UM ON UM.active = 1 AND UM.idUnidadMedida = P.idUnidadMedida
	
	LEFT JOIN stock AS S ON S.idProducto = P.idProducto AND S.idOrigen = 5 -- 1: AMP, 2: APB, 3: APA, 4: APT, 5: AIN
	
	WHERE
		FPB.active = 1
		AND FPB.idProducto = p_idProducto
	;
	
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `consInvDeProdAgrProdFinal` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `consInvDeProdAgrProdFinal`(
	IN p_idProducto BIGINT
)
BEGIN

	SELECT

	PP.idProductoRelacion
    , CONCAT( IFNULL( CTP.abreviatura ,''), '-', CAST( P.idproductocategoria AS CHAR(12) ) , '-', IFNULL( CD.description ,''), ' ', REPLACE( CAST( P.valorMedida AS CHAR(12) ) , '.00', ''), ' ', IFNULL( UM.abreviatura ,'') ) AS productoNameRelation
    
    , ROUND( IFNULL( S.cantidad ,0) - IFNULL( S.cantidadBlock ,0) ,2) AS cantidadDisp
    
    , ROUND( PP.porcentajeRelation / 100 ,2) AS porcentajeRelation

	FROM productos AS PP
	INNER JOIN productos AS P ON P.active = 1 AND P.idProducto = PP.idProductoRelacion
	INNER JOIN cat_tipo_producto AS CTP ON CTP.active = 1 AND CTP.idCatTipoProducto = P.idCatTipoProducto
	INNER JOIN cat_descripciones AS CD ON CD.active = 1 AND CD.idDescription = P.idDescription
	INNER JOIN cat_unidad_medida AS UM ON UM.active = 1 AND UM.idUnidadMedida = P.idUnidadMedida
    LEFT JOIN stock AS S ON S.idProducto = PP.idProductoRelacion
	WHERE
		PP.active = 1
		AND S.idOrigen = 3 -- 1: AMP, 2: APB, 3: APA, 4: APT

		AND PP.idProducto = p_idProducto
	LIMIT 1
	;
	
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `consInvPFormDeProdBase` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `consInvPFormDeProdBase`(
	IN p_idProductoBase BIGINT
	, IN p_cantAProducir DECIMAL(18,2)
)
BEGIN

	SELECT

	FPB.idMateriaPrima
    , CONCAT( IFNULL( CTP.abreviatura ,''), '-', CAST( P.idproductocategoria AS CHAR(12) ) , '-', IFNULL( CD.description ,''), ' ', REPLACE( CAST( P.valorMedida AS CHAR(12) ) , '.00', ''), ' ', IFNULL( UM.abreviatura ,'') ) AS materiaPrimaName
    
    , ROUND( IFNULL( S.cantidad ,0) - IFNULL( S.cantidadBlock ,0) ,2) AS cantidadDisp
	, ROUND( FPB.cantidad ,2) AS cantFormula
	, ROUND( FPB.cantidad/100 ,2) AS cantFormulaXLitro
	, ROUND( FPB.cantidad/100 * p_cantAProducir ,2) AS cantNecesaria

	FROM formulas_prod_base AS FPB
	INNER JOIN productos AS P ON P.active = 1 AND P.idProducto = FPB.idMateriaPrima
	INNER JOIN cat_tipo_producto AS CTP ON CTP.active = 1 AND CTP.idCatTipoProducto = P.idCatTipoProducto
	INNER JOIN cat_descripciones AS CD ON CD.active = 1 AND CD.idDescription = P.idDescription
	INNER JOIN cat_unidad_medida AS UM ON UM.active = 1 AND UM.idUnidadMedida = P.idUnidadMedida
    LEFT JOIN stock AS S ON S.idProducto = P.idProducto AND S.idOrigen = 1 -- 1: AMP, 2: APB, 3: APA, 4: APT
	WHERE
		FPB.idProductoBase = p_idProductoBase
	;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `consultarFormulaNecesariaProdBase` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `consultarFormulaNecesariaProdBase`(
	IN p_idProductoBase BIGINT
	, IN p_cantAProducir DECIMAL(18,2)
)
BEGIN

	SELECT
	
    FPB.idMateriaPrima
	, CONCAT( IFNULL( CTP.abreviatura ,''), '-', CAST( P.idproductocategoria AS CHAR(12) ) , '-', IFNULL( CD.description ,''), ' ', REPLACE( CAST( P.valorMedida AS CHAR(12) ) , '.00', ''), ' ', IFNULL( UM.abreviatura ,'') ) AS materiaPrimaName
	, FPB.cantidad AS cantFormula
	, ROUND( FPB.cantidad/100 ,2) AS cantFormulaXLitro
	, ROUND( FPB.cantidad/100 * p_cantAProducir  ,2) AS cantNecesaria
    
	FROM formulas_prod_base AS FPB
	INNER JOIN productos AS P ON P.idProducto = FPB.idMateriaPrima
	INNER JOIN cat_tipo_producto AS CTP ON CTP.active = 1 AND CTP.idCatTipoProducto = P.idCatTipoProducto
	INNER JOIN cat_descripciones AS CD ON CD.active = 1 AND CD.idDescription = P.idDescription
	INNER JOIN cat_unidad_medida AS UM ON UM.active = 1 AND UM.idUnidadMedida = P.idUnidadMedida
    WHERE
		FPB.idProductoBase = p_idProductoBase

	ORDER BY FPB.idMateriaPrima ASC
	;
	
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `consultarInvDeInsumosParaProdFinal` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `consultarInvDeInsumosParaProdFinal`(
	IN p_idProducto BIGINT
)
BEGIN

SET SESSION TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;
	
    SELECT
	
	IFNULL( S.idStock ,0) AS idStock
	, DATE_FORMAT( S.createDate, '%d-%m-%Y') AS createDate
	, ROUND( IFNULL( S.cantidad ,0) + IFNULL( SL.cantConsumido ,0) ,2) AS cantidadDisp
	, ROUND( IFNULL( S.costo ,0) ,2) AS costo
	, FPB.idInsumo
	, CONCAT( IFNULL( CTP.abreviatura ,''), '-', CAST( P.idproductocategoria AS CHAR(12) ) , '-', IFNULL( CD.description ,''), ' ', REPLACE( CAST( P.valorMedida AS CHAR(12) ) , '.00', ''), ' ', IFNULL( UM.abreviatura ,'') ) AS insumoName
    
    , IFNULL( S.idRelacionOperacion ,0) AS idRelacionOperacion
	
	FROM insumos_productos AS FPB
	INNER JOIN productos AS P ON P.active = 1 AND P.idProducto = FPB.idInsumo
	INNER JOIN cat_tipo_producto AS CTP ON CTP.active = 1 AND CTP.idCatTipoProducto = P.idCatTipoProducto
	INNER JOIN cat_descripciones AS CD ON CD.active = 1 AND CD.idDescription = P.idDescription
	INNER JOIN cat_unidad_medida AS UM ON UM.active = 1 AND UM.idUnidadMedida = P.idUnidadMedida
	
	LEFT JOIN stocklog AS S
		ON
			S.idOrigen = 5 -- 1: AMP, 2: APB, 3: APA, 4: APT, 5: AIN
			AND S.idProducto = P.idProducto
            AND S.cantidad > 0 -- QUE SEAN PURAS POSITIVAS
	LEFT JOIN
	(
		SELECT
		SS.idProducto
		, SS.idStockFrom
		, SUM( SS.cantidad ) AS cantConsumido
		FROM stocklog AS SS
		WHERE
			SS.idOrigen = 5 -- 1: AMP, 2: APB, 3: APA, 4: APT, 5: AIN
		AND IFNULL( SS.idStockFrom ,0) > 0
		GROUP BY SS.idProducto, SS.idStockFrom
	) AS SL ON SL.idProducto = S.idProducto AND SL.idStockFrom = S.idStock
    AND ROUND( S.cantidad + IFNULL( SL.cantConsumido ,0) ,2) > 0
	
	WHERE
		FPB.active = 1
		AND FPB.idProducto = p_idProducto

	ORDER BY S.idStock ASC
	;
	
SET SESSION TRANSACTION ISOLATION LEVEL REPEATABLE READ;
	
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `consultarInvDeProdAgranelProdFinal` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `consultarInvDeProdAgranelProdFinal`(
	IN p_idProducto BIGINT
)
BEGIN

	SELECT
	S.idStock
	, DATE_FORMAT( S.createDate, '%d-%m-%Y') AS createDate
	, ROUND( S.cantidad + IFNULL( SL.cantConsumido ,0) + IFNULL( SSLL.cantidadConsumida ,0) ,2) AS cantidadDisp
	, ROUND( S.costo ,2) AS costo
	, PP.idProductoRelacion AS idProductoFrom
	, CONCAT( IFNULL( CTP.abreviatura ,''), '-', CAST( P.idproductocategoria AS CHAR(12) ) , '-', IFNULL( CD.description ,''), ' ', REPLACE( CAST( P.valorMedida AS CHAR(12) ) , '.00', ''), ' ', IFNULL( UM.abreviatura ,'') ) AS productoFromName
    
	FROM stocklog AS S
	LEFT JOIN
	(
		SELECT
		SS.idProducto
		, SS.idStockFrom
		, SUM( SS.cantidad ) AS cantConsumido
		FROM stocklog AS SS
		WHERE
			SS.idOrigen = 3 -- 1: AMP, 2: APB, 3: APA, 4: APT
			AND IFNULL( SS.idStockFrom ,0) > 0
		GROUP BY SS.idProducto, SS.idStockFrom
	) AS SL ON SL.idProducto = S.idProducto AND SL.idStockFrom = S.idStock
	LEFT JOIN -- ESTA ES POR LAS PRODUCCIONES QUE ESTÁN EN PROCESO, PARA QUE NO SE UTILICE MATERIA PRIMA REPETIDA
	(
		SELECT
		PPFS.idStock
		, SUM( PPFS.cantidadConsumida ) * -1 AS cantidadConsumida
		FROM prod_prod_final_stock AS PPFS
		INNER JOIN prod_prod_final_detalle AS PPFD
			ON
				PPFD.active = 1
				AND PPFD.idProdProdFinalDetalle = PPFS.idProdProdFinalDetalle
		INNER JOIN prod_prod_final AS PPF ON PPF.idProdProdFinalH = PPFD.idProdProdFinalH
		WHERE
			PPF.idCatStatusProd = 1 -- EN BORRADOR DEBE BLOQUEAR
			AND IFNULL( PPFS.idStock ,0) > 0
		GROUP BY PPFS.idStock
	) AS SSLL ON SSLL.idStock = S.idStock
	INNER JOIN productos AS PP ON PP.active = 1 AND PP.idProductoRelacion = S.idProducto
	INNER JOIN productos AS P ON P.active = 1 AND P.idProducto = S.idProducto
	INNER JOIN cat_tipo_producto AS CTP ON CTP.active = 1 AND CTP.idCatTipoProducto = P.idCatTipoProducto
	INNER JOIN cat_descripciones AS CD ON CD.active = 1 AND CD.idDescription = P.idDescription
	INNER JOIN cat_unidad_medida AS UM ON UM.active = 1 AND UM.idUnidadMedida = P.idUnidadMedida
	WHERE
		S.idOrigen = 3 -- 1: AMP, 2: APB, 3: APA, 4: APT
        AND S.cantidad > 0 -- QUE SEAN PURAS POSITIVAS
	
	AND ROUND( S.cantidad + IFNULL( SL.cantConsumido ,0) + IFNULL( SSLL.cantidadConsumida ,0) ,2) > 0

	AND PP.idProducto = p_idProducto

	ORDER BY S.idStock ASC
	;
	
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `consultarInvParaFormulaDeProdAgranel` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `consultarInvParaFormulaDeProdAgranel`(
	IN p_idProductoBase BIGINT
	, IN p_cantNecesaria DECIMAL(18,2)
)
BEGIN

SET SESSION TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;

	SELECT
	S.idStock
	, DATE_FORMAT( S.createDate, '%d-%m-%Y') AS createDate
	, ROUND( S.cantidad + IFNULL( SL.cantConsumido ,0) ,2) AS cantidadDisp
	, ROUND( S.costo ,2) AS costo
	, PB.idProductoBase
	, IFNULL( PB.name ,'') AS productoBaseName
	
	FROM stocklog AS S
	LEFT JOIN
	(
		SELECT
		SS.idRelacionTipoProducto
		, SS.idStockFrom
		, SUM( SS.cantidad ) AS cantConsumido
		FROM stocklog AS SS
		WHERE SS.idRelacion = 1 -- ALMACEN DE MATERIA PRIMA GLOBAL: AUN NO HAY UN CATALOGO PORQUE NO EXISTE OTRO
		AND SS.idCatRelacionOrigen = 4 -- 1: SUCURSAL, 2: VENDEDOR: 3: Materias Primas, 4: Productos Base, 5: Productos Agranel
		AND SS.idCatTipoProducto = 3 -- 1: PRODUCTO, 2: MATERIA PRIMA, 3: PRODUCTO BASE, 4: PRODUCTO AGRANEL
		AND IFNULL( SS.idStockFrom ,0) > 0
		GROUP BY SS.idRelacionTipoProducto, SS.idStockFrom
	) AS SL ON SL.idRelacionTipoProducto = S.idRelacionTipoProducto AND SL.idStockFrom = S.idStock
	INNER JOIN productos_base AS PB ON PB.active = 1 AND PB.idProductoBase = S.idRelacionTipoProducto
	
	WHERE S.idRelacion = 1 -- ALMACEN DE MATERIA PRIMA GLOBAL: AUN NO HAY UN CATALOGO PORQUE NO EXISTE OTRO
	AND S.idCatRelacionOrigen = 4 -- 1: SUCURSAL, 2: VENDEDOR: 3: Materias Primas, 4: Productos Base, 5: Productos Agranel
	AND S.idCatTipoProducto = 3 -- 1: PRODUCTO, 2: MATERIA PRIMA, 3: PRODUCTO BASE, 4: PRODUCTO AGRANEL
	
	AND ROUND( S.cantidad + IFNULL( SL.cantConsumido ,0) ,2) > 0

	AND PB.idProductoBase = p_idProductoBase

	ORDER BY S.idStock ASC
	;
	
SET SESSION TRANSACTION ISOLATION LEVEL REPEATABLE READ;
	
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `consultarInvParaFormulaDeProdBase` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `consultarInvParaFormulaDeProdBase`(
	IN p_idProductoBase BIGINT
	, IN p_cantAProducir DECIMAL(18,2)
)
BEGIN

	SELECT
	S.idStock
	, DATE_FORMAT( S.createDate, '%d-%m-%Y') AS createDate
	, ROUND( S.cantidad + IFNULL( SL.cantConsumido ,0) + IFNULL( SSLL.cantidadConsumida ,0) ,2) AS cantidadDisp
	, ROUND( S.costo ,2) AS costo
	, ROUND( FPB.cantidad ,2) AS cantFormula
	, FPB.idMateriaPrima
	, CONCAT( IFNULL( CTP.abreviatura ,''), '-', CAST( P.idproductocategoria AS CHAR(12) ) , '-', IFNULL( CD.description ,''), ' ', REPLACE( CAST( P.valorMedida AS CHAR(12) ) , '.00', ''), ' ', IFNULL( UM.abreviatura ,'') ) AS materiaPrimaName
	, ROUND( FPB.cantidad/100 ,2) AS cantFormulaXLitro
	, ROUND( FPB.cantidad/100 * p_cantAProducir ,2) AS cantNecesaria
    
    , IFNULL( S.idRelacionOperacion ,0) AS idRelacionOperacion
	
	FROM stocklog AS S
	LEFT JOIN
	(
		SELECT
		SS.idProducto
		, SS.idStockFrom
		, SUM( SS.cantidad ) AS cantConsumido
		FROM stocklog AS SS
		WHERE SS.idOrigen = 1 -- 1: AMP, 2: APB, 3: APA, 4: APT
		AND IFNULL( SS.idStockFrom ,0) > 0
		GROUP BY SS.idProducto, SS.idStockFrom
	) AS SL ON SL.idProducto = S.idProducto AND SL.idStockFrom = S.idStock
	LEFT JOIN -- ESTA ES POR LAS PRODUCCIONES QUE ESTÁN EN PROCESO, PARA QUE NO SE UTILICE MATERIA PRIMA REPETIDA
	(
		SELECT
		PPBS.idProducto
		, PPBS.idStock
		, SUM( PPBS.cantidadConsumida ) * -1 AS cantidadConsumida
		FROM prod_prod_base_stock AS PPBS
		INNER JOIN prod_prod_base_detalle AS PPBD
			ON
				PPBD.active = 1
                AND PPBD.bOK = 1 -- SOLO LOS QUE SI ESTÁN BIEN
				AND PPBD.idProdProdBaseDetalle = PPBS.idProdProdBaseDetalle
				AND PPBD.idStatus NOT IN( 5, 6 ) -- QUE NO ESTÉ RECIBIDO Y EN REVISIÓN
		WHERE
			IFNULL( PPBS.idStock ,0) > 0
		GROUP BY PPBS.idProducto, PPBS.idStock
	) AS SSLL ON SSLL.idStock = S.idStock
	INNER JOIN formulas_prod_base AS FPB ON FPB.idMateriaPrima = S.idProducto
	INNER JOIN productos AS P ON P.idProducto = FPB.idMateriaPrima
	INNER JOIN cat_tipo_producto AS CTP ON CTP.active = 1 AND CTP.idCatTipoProducto = P.idCatTipoProducto
	INNER JOIN cat_descripciones AS CD ON CD.active = 1 AND CD.idDescription = P.idDescription
	INNER JOIN cat_unidad_medida AS UM ON UM.active = 1 AND UM.idUnidadMedida = P.idUnidadMedida
	WHERE
		S.idOrigen = 1 -- 1: AMP, 2: APB, 3: APA, 4: APT
        AND ROUND( S.cantidad + IFNULL( SL.cantConsumido ,0) + IFNULL( SSLL.cantidadConsumida ,0) ,2) > 0
		AND FPB.idProductoBase = p_idProductoBase

	ORDER BY S.idStock ASC
	;
	
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `consultarInvParaGenerarProdAgranel` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `consultarInvParaGenerarProdAgranel`(
	IN p_idProductoAgranel BIGINT
)
BEGIN

SET SESSION TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;

	SELECT
	S.idStock
	, DATE_FORMAT( S.createDate, '%d-%m-%Y') AS createDate
	, ROUND( S.cantidad + IFNULL( SL.cantConsumido ,0) ,2) AS cantidadDisponible
	, ROUND( S.costo ,2) AS costo
	, PP.idProductoRelacion AS idProductoBase
	, CONCAT( IFNULL( CTP.abreviatura ,''), '-', CAST( P.idproductocategoria AS CHAR(12) ) , '-', IFNULL( CD.description ,''), ' ', REPLACE( CAST( P.valorMedida AS CHAR(12) ) , '.00', ''), ' ', IFNULL( UM.abreviatura ,'') ) AS productoAgranelName
	
	FROM stocklog AS S
	LEFT JOIN
	(
		SELECT
		SS.idProducto
		, SS.idStockFrom
		, SUM( SS.cantidad ) AS cantConsumido
		FROM stocklog AS SS
		WHERE SS.idOrigen = 2 -- 1: AMP, 2: APB, 3: APA, 4: APT
		AND IFNULL( SS.idStockFrom ,0) > 0
		GROUP BY SS.idProducto, SS.idStockFrom
	) AS SL ON SL.idProducto = S.idProducto AND SL.idStockFrom = S.idStock
	INNER JOIN productos AS PP ON PP.idProductoRelacion = S.idProducto
	INNER JOIN productos AS P ON P.idProducto = S.idProducto
	INNER JOIN cat_tipo_producto AS CTP ON CTP.active = 1 AND CTP.idCatTipoProducto = P.idCatTipoProducto
	INNER JOIN cat_descripciones AS CD ON CD.active = 1 AND CD.idDescription = P.idDescription
	INNER JOIN cat_unidad_medida AS UM ON UM.active = 1 AND UM.idUnidadMedida = P.idUnidadMedida
	WHERE S.idOrigen = 2 -- 1: AMP, 2: APB, 3: APA, 4: APT
	
	AND ROUND( S.cantidad + IFNULL( SL.cantConsumido ,0) ,2) > 0

	AND PP.idProducto = p_idProductoAgranel

	ORDER BY S.idStock ASC
	;
	
SET SESSION TRANSACTION ISOLATION LEVEL REPEATABLE READ;
	
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `convertirCotizacionAPedido` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `convertirCotizacionAPedido`(
    IN oGetDateNow DATETIME,
    IN p_idCotizacion INT,
    IN p_idUserLogON BIGINT
)
BEGIN
    DECLARE v_idPedido BIGINT DEFAULT 0;
    DECLARE v_idCliente BIGINT;
    DECLARE v_idTipoVenta INT;
    DECLARE v_idSucursal SMALLINT;
    DECLARE v_comments VARCHAR(5000);
    DECLARE v_subtotal DECIMAL(18,2);
    DECLARE v_iva DECIMAL(18,2);
    DECLARE v_descuento DECIMAL(18,2);
    DECLARE v_total DECIMAL(18,2);
    
    DECLARE mensaje_error TEXT;

    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        -- Capturar el mensaje de error
        GET DIAGNOSTICS CONDITION 1 mensaje_error = MESSAGE_TEXT;
        SELECT 0 AS idPedido, mensaje_error AS message;
    END;
    
    -- Verificar que la cotización existe y está en status 'En solicitud' (2)
    IF NOT EXISTS (SELECT 1 FROM cotizaciones WHERE idCotizacion = p_idCotizacion AND active = 1 AND idCatStatusCotizaciones = 2) THEN
        SELECT 0 AS idPedido, 'La cotización no existe o no está en estado de solicitud' AS message;
    ELSE
        -- Obtener datos de la cotización
        SELECT 
            idCliente, 
            idTipoVenta, 
            idSucursal, 
            IFNULL(comments, ''),
            IFNULL(subtotal, 0),
            IFNULL(iva, 0),
            IFNULL(descuento, 0),
            IFNULL(total, 0)
        INTO 
            v_idCliente, 
            v_idTipoVenta, 
            v_idSucursal, 
            v_comments,
            v_subtotal,
            v_iva,
            v_descuento,
            v_total
        FROM cotizaciones 
        WHERE idCotizacion = p_idCotizacion;
        
        -- Insertar el pedido con los totales de la cotización
        INSERT INTO pedidos_clientes (
            createDate,
            active,
            idSucursal, 
            idCliente, 
            idCatStatusPedidosClientes,
            fechaEntrega,
            fechaEntregada,
            idRepartidor,
            idTipoVenta,
            idCreateUser,
            comments,
            subtotal,
            iva,
            descuento,
            total,
            idPedidoNuevo
        ) VALUES (
            oGetDateNow,
            1,
            v_idSucursal,
            v_idCliente,
            1, -- Status: En borrador
            NULL, -- fechaEntrega se asigna después
            NULL, -- fechaEntregada se asigna después
            0, -- idRepartidor se asigna después
            v_idTipoVenta,
            p_idUserLogON,
            CONCAT('Generado desde cotización #', p_idCotizacion, IF(v_comments != '', CONCAT(' - ', v_comments), '')),
            v_subtotal,
            v_iva,
            v_descuento,
            v_total,
            NULL
        );
        
        SET v_idPedido = LAST_INSERT_ID();
        
        -- Copiar detalles de la cotización al pedido
        INSERT INTO pedidos_clientes_detalle (
            idPedido,
            idProducto,
            bEnvase,
            cantidad,
            precioUnitario,
            descuento,
            precioConDescuento,
            total,
            aplicaPromo,
            idPromocion,
            promoName
        )
        SELECT 
            v_idPedido,
            cd.idProducto,
            cd.bEnvase,
            cd.cantidad,
            cd.precioUnitario,
            cd.descuento,
            cd.precioConDescuento,
            cd.total,
            cd.aplicaPromo,
            cd.idPromocion,
            cd.promoName
        FROM cotizaciones_detalle cd
        WHERE cd.idCotizacion = p_idCotizacion;
        
        -- Copiar envases si existen
        INSERT INTO pedidos_envases (
            idPedido,
            idProducto,
            cantidad,
            valorMedida
        )
        SELECT 
            v_idPedido,
            ce.idProducto,
            ce.cantidad,
            ce.valorMedida
        FROM cotizaciones_envases ce
        WHERE ce.idCotizacion = p_idCotizacion;
        
        -- Marcar la cotización como convertida (cambiar a status 1 'En borrador')
        UPDATE
			cotizaciones 
        SET
			idCatStatusCotizaciones = 3
			, idPedido = v_idPedido
        WHERE idCotizacion = p_idCotizacion;
        
        SELECT v_idPedido AS idPedido, CONCAT('Cotización #', p_idCotizacion, ' convertida a pedido #', v_idPedido, ' correctamente') AS message;
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `convertirPedidoAVenta` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `convertirPedidoAVenta`(
    IN oGetDateNow DATETIME,
    IN p_idPedido BIGINT,
	IN p_idCaja BIGINT,
    IN p_idUserLogON BIGINT
)
BEGIN
    DECLARE v_idVenta BIGINT DEFAULT 0;
    DECLARE v_idCliente BIGINT;
    DECLARE v_idSucursal SMALLINT;
    DECLARE v_idCaja INT;
    DECLARE v_idTipoVenta INT;
    DECLARE v_idVendedor BIGINT;
    DECLARE v_cantEnvases INT;
    DECLARE v_subtotal DECIMAL(18,2);
    DECLARE v_descuento DECIMAL(18,2);
    DECLARE v_iva DECIMAL(18,2);
    DECLARE v_total DECIMAL(18,2);
    
    DECLARE mensaje_error TEXT;
    
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        -- Capturar el mensaje de error
        GET DIAGNOSTICS CONDITION 1 mensaje_error = MESSAGE_TEXT;
		SELECT 0 AS idVenta, mensaje_error AS message;
    END;
	
	IF
	(
		SELECT COUNT(*) FROM ventas WHERE idPedido = p_idPedido
	) = 0 THEN

		-- 1. Obtener datos del pedido
		SELECT 
			PC.idCliente, PC.idSucursal, PC.idTipoVenta, PC.subtotal, PC.descuento, PC.iva, PC.total
			, C.idVendedor
		INTO 
			v_idCliente, v_idSucursal, v_idTipoVenta, v_subtotal, v_descuento, v_iva, v_total, v_idVendedor
		FROM pedidos_clientes AS PC
		INNER JOIN clientes AS C ON C.idCliente = PC.idCliente
		WHERE idPedido = p_idPedido;

		-- 2. Insertar en ventas
		INSERT INTO ventas (
			createDate, active, idCreateUser, subtotal, descuento, iva, total, pendiente,
			idCliente, idSucursal, idCaja, idTipoVenta, idVendedor, bClosed, idPedido, idOrigenVendedor
		) VALUES (
			oGetDateNow, 1, p_idUserLogON, v_subtotal, v_descuento, v_iva, v_total, v_total,
			v_idCliente, v_idSucursal, p_idCaja, v_idTipoVenta, v_idVendedor, 0, p_idPedido, 0
		);
		SET v_idVenta = LAST_INSERT_ID();

		-- 3. Insertar detalles en ventasdetalle
		INSERT INTO ventasdetalle (
			idVenta, idProducto, descripcion, bEnvase, cantidad, precioUnitario, descuento, 
			precioConDescuento, total, aplicaPromo, idPromocion, promoName
		)
		SELECT 
			v_idVenta, PCD.idProducto
			, CONCAT( 
				IFNULL( CTP.abreviatura ,'')
				, '-', CAST( P.idproductocategoria AS CHAR(12) )
				, '-', IFNULL( CD.description ,'')
				, ' ', REPLACE( CAST( P.valorMedida AS CHAR(12) ) , '.00', ''), ' ', IFNULL( UM.abreviatura ,'')
				)
			, PCD.bEnvase, PCD.cantidad, PCD.precioUnitario, PCD.descuento, 
			PCD.precioConDescuento, PCD.total, PCD.aplicaPromo, PCD.idPromocion, PCD.promoName
		FROM pedidos_clientes_detalle AS PCD
		INNER JOIN productos AS P ON P.active = 1 AND P.idProducto = PCD.idProducto
		INNER JOIN cat_tipo_producto AS CTP ON CTP.active = 1 AND CTP.idCatTipoProducto = P.idCatTipoProducto
		INNER JOIN cat_descripciones AS CD ON CD.active = 1 AND CD.idDescription = P.idDescription
		INNER JOIN cat_unidad_medida AS UM ON UM.active = 1 AND UM.idUnidadMedida = P.idUnidadMedida
		WHERE idPedido = p_idPedido;

		-- 4. Insertar envases si existen
		INSERT INTO ventas_envases (
			idVenta, idProducto, cantidad, valorMedida
		)
		SELECT 
			v_idVenta, idProducto, cantidad, valorMedida
		FROM pedidos_envases
		WHERE idPedido = p_idPedido;

		-- 5. (Opcional) Marcar pedido como convertido/cerrado
		UPDATE pedidos_clientes
		SET idCatStatusPedidosClientes = 5
		WHERE idPedido = p_idPedido;
		
		-- *******************************************************************************************************
		-- DESBLOQUEAR EL INVENTARIO
		DELETE FROM stock_block_log WHERE idStock > 0 AND idRelation = p_idPedido AND relationType = 'PedidoC';
		
		SET @idOrigen = 0;
		-- Obtener idOrigen
		SELECT O.idOrigen INTO @idOrigen
		FROM origenes AS O
		INNER JOIN pedidos_clientes AS PC ON PC.idSucursal = O.idRelacion
		WHERE O.idCatRelacionOrigen = 1 -- SUCURSAL
		  AND PC.idPedido = p_idPedido
		LIMIT 1;
		
		-- 3. Actualiza stock restando cantidadBlock por producto
		UPDATE stock s
		JOIN (
			SELECT idProducto, SUM(cantidad) AS cantidad
			FROM pedidos_clientes_detalle
			WHERE idPedido = p_idPedido
			GROUP BY idProducto
		) pcd ON s.idProducto = pcd.idProducto AND s.idOrigen = @idOrigen
		SET s.cantidadBlock = IFNULL(s.cantidadBlock, 0) - pcd.cantidad;
		
		-- *******************************************************************************************************
		
		SELECT v_idVenta AS idVenta, CONCAT('Pedido #', p_idPedido,' convertido a venta correctamente') AS message;
		
	ELSE
	
		SELECT 0 AS idVenta, CONCAT('El pedido #', p_idPedido, ', ya estaba convertido en venta') AS message;
	
	END IF;
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `convertirProductos` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `convertirProductos`(
  IN oGetDateNow DATETIME,
  IN jsonLista JSON,
  IN p_idOrigen INT,
  IN P_idUserLogON INT
)
BEGIN
	DECLARE i INT DEFAULT 0;
	DECLARE totalInsert INT DEFAULT JSON_LENGTH(jsonLista);
	
	DECLARE mensaje_error TEXT;
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        -- Capturar el mensaje de error
        GET DIAGNOSTICS CONDITION 1 mensaje_error = MESSAGE_TEXT;
		SELECT 0 AS out_id, mensaje_error AS message;
    END;
    
    SET SQL_SAFE_UPDATES = 0;

	DROP TEMPORARY TABLE IF EXISTS ODataTemp;
	-- Tabla temporal
	CREATE TEMPORARY TABLE ODataTemp (
		idProducto INT,
		productoFromName VARCHAR(5000),
		cantidad DECIMAL(18,2),
		idProductoRelacion INT,
		cantidadConvertida DECIMAL(18,2),
		productoToName VARCHAR(5000)
	);
    
	-- Llena la tabla temporal
	WHILE i < totalInsert DO
		INSERT INTO ODataTemp (
		  idProducto,
		  productoFromName,
		  cantidad,
		  idProductoRelacion,
		  cantidadConvertida,
		  productoToName
		)
		VALUES (
		  IFNULL(CAST(JSON_UNQUOTE(JSON_EXTRACT(jsonLista, CONCAT('$[', i, '].idProducto'))) AS UNSIGNED), 0),
		  '',
		  IFNULL(CAST(JSON_UNQUOTE(JSON_EXTRACT(jsonLista, CONCAT('$[', i, '].cantidad'))) AS DECIMAL(18,2)), 0),
		  0,
		  0,
		  ''
		);
		SET i = i + 1;
	END WHILE;
	
	UPDATE ODataTemp AS tmp
	INNER JOIN productos AS P ON P.idProducto = tmp.idProducto
	INNER JOIN cat_tipo_producto AS CTP ON CTP.active = 1 AND CTP.idCatTipoProducto = P.idCatTipoProducto
	INNER JOIN cat_descripciones AS CD ON CD.active = 1 AND CD.idDescription = P.idDescription
	INNER JOIN cat_unidad_medida AS UM ON UM.active = 1 AND UM.idUnidadMedida = P.idUnidadMedida
	
	INNER JOIN productos AS PP ON PP.idProducto = P.idProductoRelacion AND PP.idCatTipoProducto = 4 -- AGRANEL
	INNER JOIN cat_tipo_producto AS CTPP ON CTPP.active = 1 AND CTPP.idCatTipoProducto = PP.idCatTipoProducto
	INNER JOIN cat_descripciones AS CDP ON CDP.active = 1 AND CDP.idDescription = PP.idDescription
	INNER JOIN cat_unidad_medida AS UMP ON UMP.active = 1 AND UMP.idUnidadMedida = PP.idUnidadMedida
	SET
		tmp.idProductoRelacion = P.idProductoRelacion
		, tmp.cantidadConvertida = tmp.cantidad * P.valorMedida
		, tmp.productoFromName = CONCAT(
			IFNULL( CTP.abreviatura ,'')
			, '-' , CAST( P.idproductocategoria AS CHAR(12) )
			, '-', IFNULL( CD.description ,'')
			, ' ', REPLACE( CAST( P.valorMedida AS CHAR(12) ) , '.00', '')
			, ' ', IFNULL( UM.abreviatura ,'')
			)
		, tmp.productoToName = CONCAT( IFNULL( CTPP.abreviatura ,'')
			, '-', CAST( PP.idproductocategoria AS CHAR(12) )
			, '-', IFNULL( CDP.description ,'')
			, ' ', REPLACE( CAST( PP.valorMedida AS CHAR(12) ) , '.00', '')
			, ' ', IFNULL( UMP.abreviatura ,'') )
		;
  
	-- BAJA INVENTARIO DEL PRODUCTO ORIGEN
	INSERT INTO stocklog
	(
		createDate, active, idOrigen, idProducto, idCatMov, cantidad, costo, idStockFrom,
		idRelacionOperacion, comentarios, idCreateUser, motivoDesc
	)
	SELECT
		oGetDateNow, 1, p_idOrigen, idProducto, 8, cantidad * -1, 0, 0, 0, '', P_idUserLogON,
		CONCAT('Conversión al producto: ', productoToName)
	FROM ODataTemp;

	UPDATE stock AS S
	INNER JOIN (
		SELECT idProducto, SUM(cantidad) AS cantidadConsumida FROM ODataTemp GROUP BY idProducto
	) AS MP
		ON S.idOrigen = p_idOrigen AND S.idProducto = MP.idProducto
        AND S.idStock > 0
	SET S.cantidad = S.cantidad - MP.cantidadConsumida;

	-- AUMENTA INVENTARIO DEL PRODUCTO FINAL
	INSERT INTO stocklog
	(
		createDate, active, idOrigen, idProducto, idCatMov, cantidad, costo, idStockFrom,
		idRelacionOperacion, comentarios, idCreateUser, motivoDesc
	)
	SELECT
		oGetDateNow, 1, p_idOrigen, idProductoRelacion, 8, cantidadConvertida, 0, 0, 0, '', P_idUserLogON,
		CONCAT('Conversión del producto: ', productoFromName)
	FROM ODataTemp;
	
	-- SE HACE UN INSERT EN 0 SOLO SI NO EXISTE PARA QUE EN EL UPDATE SE LE PONGA LA CANTIDAD CORRECTA
	INSERT INTO stock
	(
		createDate
		, active
		, idOrigen
		, idProducto
		, cantidad
		, costo
	)
	SELECT
		oGetDateNow, 1, p_idOrigen, tmp.idProductoRelacion, 0, 0
	FROM ODataTemp AS tmp
	LEFT JOIN stock AS S ON S.idProducto = tmp.idProductoRelacion AND S.idOrigen = p_idOrigen
	WHERE
		S.idStock IS NULL
	GROUP BY tmp.idProductoRelacion
	;

	-- SE HACE UN UPDATE Y ENCASO DE NO EXISTIR ESTE UPDATE NO AFECTARÁ NADA
	UPDATE stock AS S
	INNER JOIN (
		SELECT idProductoRelacion, SUM(cantidadConvertida) AS cantidadConvertida FROM ODataTemp GROUP BY idProductoRelacion
	) AS MP
		ON S.idOrigen = p_idOrigen AND S.idProducto = MP.idProductoRelacion
        AND S.idStock > 0
	SET S.cantidad = S.cantidad + MP.cantidadConvertida;
	
	DROP TEMPORARY TABLE IF EXISTS ODataTemp;
	
	SELECT 1 AS out_id, 'Convertido con éxito.' AS message;
    
    SET SQL_SAFE_UPDATES = 1;
  
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `copiarPedido` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `copiarPedido`(
IN p_idPedido BIGINT
, IN oGetDateNow DATETIME
, IN p_idUserLogON BIGINT
)
BEGIN

	DECLARE mensaje_error TEXT;
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        -- Capturar el mensaje de error
        GET DIAGNOSTICS CONDITION 1 mensaje_error = MESSAGE_TEXT;
		SELECT 0 AS out_id, mensaje_error AS message;
    END;
	
	INSERT INTO pedidos_clientes (
		createDate,
		active,
		idSucursal,
		idCliente,
		idCatStatusPedidosClientes,
		fechaEntrega,
		fechaEntregada,
		idRepartidor,
		idTipoVenta,
		idCreateUser,
		comments,
		subtotal,
		iva,
		descuento,
		total,
		idPedidoNuevo
	)
	SELECT
		oGetDateNow,
		active,
		idSucursal,
		idCliente,
		1, -- Borrador
		fechaEntrega,
		fechaEntregada,
		idRepartidor,
		idTipoVenta,
		idCreateUser,
		comments,
		subtotal,
		iva,
		descuento,
		total,
		0
	FROM pedidos_clientes
	WHERE idPedido = p_idPedido;
	
	SET @idPedidoNuevo = 0;
	SET @idPedidoNuevo = LAST_INSERT_ID();
	
	UPDATE
		pedidos_clientes
	SET
		idPedidoNuevo = @idPedidoNuevo
	WHERE idPedido = p_idPedido;

    SELECT 1 AS out_id, CONCAT('Pedido copiado correctamente, pedido nuevo #', @idPedidoNuevo ) AS message;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `createInventarioFisico` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `createInventarioFisico`(
	IN p_oGetDateNow DATETIME,
    IN p_idOrigen BIGINT,
    IN p_observaciones VARCHAR(500),
    IN p_idStatus INT,
	IN p_idUnidadMedida INT,
	IN p_valorMedida VARCHAR(20),
	IN p_idDepartamento INT,
	IN p_idFamilia INT,
    IN p_idUserLogON BIGINT
)
BEGIN
    DECLARE v_message VARCHAR(255);
    DECLARE v_out_id BIGINT DEFAULT 0;
	DECLARE v_idInventarioFisico BIGINT DEFAULT 0;
	
	DECLARE mensaje_error TEXT;
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        -- Capturar el mensaje de error
        GET DIAGNOSTICS CONDITION 1 mensaje_error = MESSAGE_TEXT;
		SELECT 0 AS out_id, mensaje_error AS message;
    END;
    
	-- Insertar nuevo
	INSERT INTO inventario_fisico (
		createDate,
		active,
		idCreateUser,
		idOrigen,
		fechaInicio,
		fechaCierre,
		idStatus,
		observaciones
	) VALUES (
		p_oGetDateNow,
		1,
		p_idUserLogON,
		p_idOrigen,
		p_oGetDateNow,
		NULL,
		IFNULL(p_idStatus, 1),
		p_observaciones
	);
	
	SET v_idInventarioFisico = LAST_INSERT_ID();
	SET v_message = 'Inventario físico creado correctamente';
	
	
	INSERT INTO `inventario_fisico_detalle`
	(`createDate`,
	`idInventarioFisico`,
	`idCreateUser`,
	`fechaConteo`,
	`idProducto`,
	`cantidadSistema`,
	`cantidadFisica`,
	`diferencia`,
	`precio`,
	`total`,
    `totalFisico`,
	`observaciones`)
	SELECT
	p_oGetDateNow,
	v_idInventarioFisico,
	p_idUserLogON,
	NULL,
	S.idProducto,
	ROUND( IFNULL( S.cantidad, 0) - IFNULL( S.cantidadBlock, 0) , 2),
	0,
	0,
	IFNULL( P.precio ,0),
	IFNULL( P.precio ,0) * ( ROUND( IFNULL( S.cantidad, 0) - IFNULL( S.cantidadBlock, 0) , 2) ),
    0,
	''
	
    FROM stock AS S
	INNER JOIN productos AS P ON P.active = 1 AND P.idProducto = S.idProducto
	INNER JOIN cat_familias AS F ON F.idFamilia = P.idFamilia
    WHERE
		S.active = 1
		AND S.idOrigen = p_idOrigen
		AND
		(
			p_idDepartamento = 0
			OR F.idDepartamento = p_idDepartamento
		)
		AND
		(
			p_idFamilia = 0
			OR P.idFamilia = p_idFamilia
		)
		AND
		(
			p_idUnidadMedida = 0
			OR P.idUnidadMedida = p_idUnidadMedida
		)
        AND
		(
			p_valorMedida = ''
			OR P.valorMedida = p_valorMedida
		)
	;
    
    SELECT v_idInventarioFisico AS out_id, v_message AS message;
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `deleteAlmacen` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `deleteAlmacen`(
	IN p_idAlmacen SMALLINT
)
BEGIN

	DELETE FROM
		almacenes
	WHERE
		idAlmacen = p_idAlmacen;

	SET @iRows = ( SELECT ROW_COUNT() );

	SELECT @iRows AS iRows;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `deleteCliente` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `deleteCliente`(IN p_idCliente BIGINT)
BEGIN
    
    UPDATE clientes SET active = 0, bCompraMin = 0 WHERE idCliente = p_idCliente;

    SELECT 1 AS iRows;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `deleteCotizacionDetalle` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `deleteCotizacionDetalle`(
    IN p_idCotizacionDetalle BIGINT
)
BEGIN
    DELETE FROM cotizaciones_detalle
    WHERE idCotizacionDetalle = p_idCotizacionDetalle;

    SELECT p_idCotizacionDetalle AS out_id, 'Eliminado correctamente' AS message;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `deleteEntradaSalidaDetalle` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `deleteEntradaSalidaDetalle`(
IN p_idEntradasSalidasDetalle BIGINT
)
BEGIN
    
	DELETE FROM entradas_salidas_detalle
	WHERE
		idEntradasSalidasDetalle = p_idEntradasSalidasDetalle;
	

    SELECT p_idEntradasSalidasDetalle AS out_id, 'Eliminado correctamente' AS message;
	
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `deleteGiro` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `deleteGiro`(
IN p_idGiro INT
)
BEGIN

	UPDATE giros SET active = 0 WHERE idGiro = p_idGiro;

	SELECT 1 AS out_id, 'Giro deshabilitado' AS message;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `deleteInsumoDelProducto` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `deleteInsumoDelProducto`(
IN p_keyx BIGINT
)
BEGIN
    
	DELETE FROM insumos_productos
	WHERE
		keyx = p_keyx;
	
	SET @iRows = (SELECT ROW_COUNT());

    SELECT @iRows AS iRows;
	
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `deleteInventarioFisico` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `deleteInventarioFisico`(
	IN p_idInventarioFisico BIGINT
)
BEGIN

	DELETE FROM
		inventario_fisico_detalle
	WHERE
		idInventarioFisico = p_idInventarioFisico;

	SET @iRows = ( SELECT ROW_COUNT() );
	
	DELETE FROM
		inventario_fisico
	WHERE
		idInventarioFisico = p_idInventarioFisico;
		
	SET @iRows = @iRows + ( SELECT ROW_COUNT() );

	SELECT @iRows AS iRows;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `deleteMateriaPrimaDeLaFormula` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `deleteMateriaPrimaDeLaFormula`(IN p_idFormula BIGINT)
BEGIN

	DECLARE mensaje_error TEXT;
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        -- Capturar el mensaje de error
        GET DIAGNOSTICS CONDITION 1 mensaje_error = MESSAGE_TEXT;
		SELECT 0 AS out_id, mensaje_error AS message;
    END;
    
	DELETE FROM formulas_prod_base
	WHERE
		idFormula = p_idFormula;

    SELECT 1 AS out_id, 'Eliminado correctamente' AS message;
	
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `deleteOrdenCompra` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `deleteOrdenCompra`(IN p_idOrdenDeCompra BIGINT)
BEGIN
    
	UPDATE
		orden_compra
	SET
		active = 0
	WHERE
		idOrdenDeCompra = p_idOrdenDeCompra;
	
	SET @iRows = (SELECT ROW_COUNT());

    SELECT @iRows AS iRows;
	
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `deleteOrdenCompraDetalle` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `deleteOrdenCompraDetalle`(IN p_idOrdenDeCompra BIGINT, IN p_idOrdenDeCompraDetalle BIGINT)
BEGIN
    
	DELETE FROM
		orden_compra_detalle
	WHERE
		idOrdenDeCompraDetalle = p_idOrdenDeCompraDetalle;
	
	SET @iRows = (SELECT ROW_COUNT());
    
    SET @costoTotal = 0;
	
	SET @costoTotal = IFNULL( ( SELECT
					SUM( importe )
					FROM orden_compra_detalle AS A
					WHERE
						idOrdenDeCompra = p_idOrdenDeCompra
                        ) ,0);
						
	UPDATE
		orden_compra
	SET
		costoTotal = ROUND( @costoTotal ,2)
	WHERE
		idOrdenDeCompra = p_idOrdenDeCompra;

    SELECT @iRows AS iRows;
	
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `deleteOrigenByIdUser` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `deleteOrigenByIdUser`(
	IN p_idUser BIGINT
	, IN p_idOrigen BIGINT
)
BEGIN

	DELETE FROM
		origenes_config
	WHERE
		idUser = p_idUser
		AND idOrigen = p_idOrigen;

	SET @iRows = ( SELECT ROW_COUNT() );
	
	IF
	(
		SELECT
		COUNT(*)
		FROM origenes_config
		WHERE
			idUser = p_idUser
			AND bPrincipal = 1
	) = 0
	AND
	(
		SELECT
		COUNT(*)
		FROM origenes_config
		WHERE
			idUser = p_idUser
	) > 0
	THEN
	
		SET @keyxOld = 0;
		
		SET @keyxOld = IFNULL(
		(
			SELECT
			keyx
			FROM origenes_config
			WHERE
				idUser = p_idUser
			ORDER BY keyx ASC
			LIMIT 1
		)
		,0);
		
		UPDATE
			origenes_config
		SET
			bPrincipal = 1
		WHERE
			idUser = p_idUser
			AND keyx = @keyxOld;
	
	END IF;

	SELECT @iRows AS iRows;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `deleteOrinResponsable` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `deleteOrinResponsable`(
IN p_idOrigenesResponsables BIGINT
)
BEGIN

	SET @out_id = 0;
	SET @message = '';

	DELETE FROM
		origenes_responsables
	WHERE
		idOrigenesResponsables = p_idOrigenesResponsables
	;
		
	SET @out_id = p_idOrigenesResponsables;
	SET @message = 'Eliminado con éxito';

	SELECT @out_id AS out_id
	, @message AS message;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `deletePedido` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `deletePedido`(
IN p_idPedido BIGINT
)
BEGIN
    
	DELETE FROM pedidos_envases
	WHERE
		idPedido = p_idPedido;
		
	DELETE FROM pedidos_clientes_detalle
	WHERE
		idPedido = p_idPedido;
		
	DELETE FROM pedidos_clientes
	WHERE
		idPedido = p_idPedido;
    
    SET @next_id = (SELECT IFNULL(MAX(idPedido), 0) + 1 FROM pedidos_clientes);
	SET @sql = CONCAT('ALTER TABLE pedidos_clientes AUTO_INCREMENT = ', @next_id);
	PREPARE stmt FROM @sql;
	EXECUTE stmt;
	DEALLOCATE PREPARE stmt;

    SELECT p_idPedido AS out_id, 'Eliminado correctamente' AS message;
	
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `deletePedidoDetalle` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `deletePedidoDetalle`(
IN p_idPedidoDetalle BIGINT
)
BEGIN
    
	DELETE FROM pedidos_clientes_detalle
	WHERE
		idPedidoDetalle = p_idPedidoDetalle;
	

    SELECT p_idPedidoDetalle AS out_id, 'Eliminado correctamente' AS message;
	
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `deletePPADetail` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `deletePPADetail`(
IN p_idProdProdAgranelH BIGINT
, IN p_idProdProdAgranelDetalle BIGINT
, IN p_idUserLogON BIGINT
)
BEGIN

	DECLARE mensaje_error TEXT;
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        -- Capturar el mensaje de error
        GET DIAGNOSTICS CONDITION 1 mensaje_error = MESSAGE_TEXT;
		SELECT 0 AS out_id, mensaje_error AS message;
    END;

	DELETE
		PPBS
	FROM prod_prod_agranel_stock AS PPBS
	INNER JOIN prod_prod_agranel_detalle AS PPBD ON PPBD.idProdProdAgranelDetalle = PPBS.idProdProdAgranelDetalle
	WHERE
		PPBD.idProdProdAgranelH = p_idProdProdAgranelH
        AND PPBD.idProdProdAgranelDetalle = p_idProdProdAgranelDetalle
        AND PPBS.keyx > 0
		;

    DELETE FROM	prod_prod_agranel_detalle
    WHERE
		idProdProdAgranelH = p_idProdProdAgranelH
		AND idProdProdAgranelDetalle = p_idProdProdAgranelDetalle
		;

    SELECT 1 AS out_id, 'Eliminado correctamente' AS message;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `deletePPBDetail` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `deletePPBDetail`(
IN p_idProdProdBaseH BIGINT
, IN p_idProdProdBaseDetalle BIGINT
, IN p_idUserLogON BIGINT
)
BEGIN

	DECLARE mensaje_error TEXT;
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        -- Capturar el mensaje de error
        GET DIAGNOSTICS CONDITION 1 mensaje_error = MESSAGE_TEXT;
		SELECT 0 AS out_id, mensaje_error AS message;
    END;

	DELETE
		PPBS
	FROM prod_prod_base_stock AS PPBS
	INNER JOIN prod_prod_base_detalle AS PPBD ON PPBD.idProdProdBaseDetalle = PPBS.idProdProdBaseDetalle
	WHERE
		PPBD.idProdProdBaseH = p_idProdProdBaseH
        AND PPBD.idProdProdBaseDetalle = p_idProdProdBaseDetalle
        AND PPBS.keyx > 0
		;

    DELETE FROM	prod_prod_base_detalle
    WHERE
		idProdProdBaseH = p_idProdProdBaseH
		AND idProdProdBaseDetalle = p_idProdProdBaseDetalle
		;

    SELECT 1 AS out_id, 'Eliminado correctamente' AS message;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `deletePPFDetail` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `deletePPFDetail`(
IN p_idProdProdFinalH BIGINT
, IN p_idProdProdFinalDetalle BIGINT
, IN p_idUserLogON BIGINT
)
BEGIN

	DECLARE mensaje_error TEXT;
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        -- Capturar el mensaje de error
        GET DIAGNOSTICS CONDITION 1 mensaje_error = MESSAGE_TEXT;
		SELECT 0 AS out_id, mensaje_error AS message;
    END;
    
    SET SQL_SAFE_UPDATES = 0;

	DELETE
		PPBS
	FROM prod_prod_final_stock AS PPBS
	INNER JOIN prod_prod_final_detalle AS PPBD ON PPBD.idProdProdFinalDetalle = PPBS.idProdProdFinalDetalle
	WHERE
		PPBD.idProdProdFinalH = p_idProdProdFinalH
        AND PPBD.idProdProdFinalDetalle = p_idProdProdFinalDetalle
        AND PPBS.keyx > 0
		;
		
	DELETE
		PPBS
	FROM prod_prod_final_insumos_stock AS PPBS
	INNER JOIN prod_prod_final_detalle AS PPBD ON PPBD.idProdProdFinalDetalle = PPBS.idProdProdFinalDetalle
	WHERE
		PPBD.idProdProdFinalH = p_idProdProdFinalH
        AND PPBD.idProdProdFinalDetalle = p_idProdProdFinalDetalle
        AND PPBS.keyx > 0
		;

    DELETE FROM	prod_prod_final_detalle
    WHERE
		idProdProdFinalH = p_idProdProdFinalH
		AND idProdProdFinalDetalle = p_idProdProdFinalDetalle
		;
		
	-- *******************************************************************************************************
	-- DESBLOQUEAR EL INVENTARIO
	
	-- 3. Actualiza stock restando cantidadBlock por producto
	UPDATE stock s
	JOIN (
		SELECT idOrigen, idProducto, SUM(cantidad) AS cantidad
		FROM stock_block_log
		WHERE
			idRelation = p_idProdProdFinalDetalle
			AND relationType = 'ProdProdF'
		GROUP BY idOrigen, idProducto
	) pcd
		ON
			s.idProducto = pcd.idProducto
			AND s.idOrigen = pcd.idOrigen
			
	SET s.cantidadBlock = IFNULL(s.cantidadBlock, 0) - pcd.cantidad;
	
	DELETE FROM stock_block_log WHERE idStock > 0 AND idRelation = p_idProdProdFinalDetalle AND relationType = 'ProdProdF';
	
	-- *******************************************************************************************************
	SET SQL_SAFE_UPDATES = 1;
    
    SELECT 1 AS out_id, 'Eliminado correctamente' AS message;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `deleteProdProdBaseStock` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `deleteProdProdBaseStock`(
IN p_idProdProdBaseDetalle BIGINT
)
BEGIN

	DECLARE mensaje_error TEXT;
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        -- Capturar el mensaje de error
        GET DIAGNOSTICS CONDITION 1 mensaje_error = MESSAGE_TEXT;
		SELECT 0 AS out_id, mensaje_error AS message;
    END;
	
	UPDATE
		stock AS S
		INNER JOIN stock_block_log AS SBL
		ON
			SBL.idRelation = p_idProdProdBaseDetalle
			AND SBL.relationType = 'ProdProdBase'
			AND SBL.idOrigen = S.idOrigen -- 1: AMP, 2: APB, 3: APA, 4: APT
			AND SBL.idProducto = S.idProducto
			
	SET S.cantidadBlock = S.cantidadBlock - SBL.cantidad;

	DELETE FROM stock_block_log WHERE idStock > 0 AND idRelation = p_idProdProdBaseDetalle AND relationType = 'ProdProdBase';
    
    SELECT 1 AS out_id, 'Eliminado correctamente' AS message;
	
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `deleteRol` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `deleteRol`(
IN p_idRol INT

, IN p_idUserC BIGINT
)
BEGIN

	DELETE FROM roles WHERE idRol = p_idRol;

	SELECT 1 AS out_id, 'Rol eliminado' AS message;
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `deleteRolByIdUser` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `deleteRolByIdUser`(
	IN p_idUser BIGINT
	, IN p_idRol BIGINT
)
BEGIN

	DELETE FROM
		user_roles
	WHERE
		idUser = p_idUser
		AND idRol = p_idRol;

	SET @iRows = ( SELECT ROW_COUNT() );

	SELECT @iRows AS iRows;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `deleteSucursal` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `deleteSucursal`(
	IN p_idSucursal SMALLINT
)
BEGIN

	DELETE FROM
		sucursales
	WHERE
		idSucursal = p_idSucursal;

	SET @iRows = ( SELECT ROW_COUNT() );

	SELECT @iRows AS iRows;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `deleteSucursalByIdUser` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `deleteSucursalByIdUser`(
	IN p_idUser BIGINT
	, IN p_idSucursal BIGINT
)
BEGIN

	DELETE FROM
		sucursalesconfig
	WHERE
		idUser = p_idUser
		AND idSucursal = p_idSucursal;

	SET @iRows = ( SELECT ROW_COUNT() );

	SELECT @iRows AS iRows;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `deleteVendedor` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `deleteVendedor`(IN p_idVendedor BIGINT)
BEGIN
    
    UPDATE vendedores SET active = 0 WHERE idVendedor = p_idVendedor;

    SET @iRows = (SELECT ROW_COUNT());

    SELECT @iRows AS iRows;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `deleteVentaDetalle` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `deleteVentaDetalle`(
IN p_idVentaDetalle BIGINT
)
BEGIN

	SET @idVenta = 0;
    SET @idType = 0;
    
    SELECT
		VD.idVenta
        , V.idCliente
        INTO
        @idVenta
        , @idType
    FROM ventasdetalle AS VD
    INNER JOIN ventas AS V ON V.idVenta = VD.idVenta
    WHERE
		VD.idVentaDetalle = p_idVentaDetalle
	LIMIT 1;
    
	DELETE FROM ventasdetalle
	WHERE
		idVentaDetalle = p_idVentaDetalle;
        
	-- SOLO EN EL PUNTO DE VENTA
    IF @idType = 1 THEN
    
		SET @idProductoEnvase20LT = 0;
			
		SELECT
			`value`
		INTO
			@idProductoEnvase20LT
		FROM constantes
		WHERE
			`key` = 'envase20LT'
		;
		
		SET @envase4LT = 0;
			
		SELECT
			`value`
		INTO
			@envase4LT
		FROM constantes
		WHERE
			`key` = 'envase4LT'
		;
		
		DELETE FROM ventas_envases WHERE idVenta = @idVenta;
		
		INSERT INTO `ventas_envases`(`idVenta`,`idProducto`,`cantidad`,`valorMedida`)
		SELECT
			@idVenta,
			CASE 
				WHEN P.valorMedida = 4 THEN @envase4LT
				WHEN P.valorMedida = 20 THEN @idProductoEnvase20LT
			END
			, sum( VD.cantidad ), P.valorMedida
		FROM ventasdetalle AS VD
		INNER JOIN productos AS P ON P.idProducto = VD.idProducto
		WHERE
			VD.bEnvase = 1 AND VD.idVenta = @idVenta AND P.valorMedida IN( 4, 20 )
		GROUP BY P.valorMedida;
    
    END IF;

    SELECT p_idVentaDetalle AS out_id, 'Eliminado correctamente' AS message;
	
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `deleteZona` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `deleteZona`(
IN p_idZona INT
)
BEGIN

	UPDATE zonas SET active = 0 WHERE idZona = p_idZona;

	SELECT 1 AS out_id, 'Zona deshabilitada' AS message;
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `disabledActions` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `disabledActions`(
	IN p_idAction BIGINT
)
BEGIN

	UPDATE
		actions
	SET
		active = 0
	WHERE
		idAction = p_idAction;

	SELECT p_idAction AS idRelation;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `EmparejarStockBlockConLog` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `EmparejarStockBlockConLog`()
BEGIN

	SET SQL_SAFE_UPDATES = 0;
	
    UPDATE stock s
    LEFT JOIN (
        SELECT idProducto, idOrigen, SUM( cantidad ) AS sumaLog
        FROM stock_block_log
        GROUP BY idProducto, idOrigen
    ) sl ON s.idProducto = sl.idProducto AND s.idOrigen = sl.idOrigen
    SET s.cantidadBlock = IFNULL( sl.sumaLog ,0)
    WHERE s.idStock > 0 AND IFNULL( s.cantidadBlock ,0) != IFNULL( sl.sumaLog ,0)
	;
	
	SET SQL_SAFE_UPDATES = 1;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `EmparejarStockConLogPorProductoOrigen` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `EmparejarStockConLogPorProductoOrigen`(
    IN p_idProducto INT,
    IN p_idOrigen INT
)
BEGIN
    UPDATE stock s
    JOIN (
        SELECT idProducto, idOrigen, SUM(cantidad) AS sumaLog
        FROM stocklog
        WHERE idProducto = p_idProducto AND idOrigen = p_idOrigen
        GROUP BY idProducto, idOrigen
    ) sl ON s.idProducto = sl.idProducto AND s.idOrigen = sl.idOrigen
    SET s.cantidad = sl.sumaLog
    WHERE s.cantidad != sl.sumaLog
    AND s.idProducto = p_idProducto
    AND s.idOrigen = p_idOrigen;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `enviarArticulosES` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `enviarArticulosES`(
	IN oGetDateNow DATETIME
	, IN jsonData JSON
	, IN p_idEntradasSalidasH BIGINT
	, IN p_idUserLogON BIGINT
)
BEGIN

	DECLARE mensaje_error TEXT;
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        -- Capturar el mensaje de error
        GET DIAGNOSTICS CONDITION 1 mensaje_error = MESSAGE_TEXT;
		SELECT 0 AS out_id, mensaje_error AS message;
    END;

	DROP TABLE IF EXISTS oTemp;

	CREATE TEMPORARY TABLE oTemp (
		id BIGINT AUTO_INCREMENT,
		idEntradasSalidasDetalle BIGINT,
		cantidadEnviada DECIMAL(18,2),
		PRIMARY KEY(id)
	) ENGINE=InnoDB;

    SET @i = 0;
    SET @total = 0;

    -- Obtener la cantidad de elementos en el JSON
    SET @total = JSON_LENGTH(jsonData);

    -- Recorrer el JSON e insertar directamente
    WHILE @i < @total DO
	
        INSERT INTO oTemp (
            idEntradasSalidasDetalle, cantidadEnviada
        ) VALUES (
            JSON_EXTRACT(jsonData, CONCAT('$[', @i, '].idEntradasSalidasDetalle')),
			JSON_EXTRACT(jsonData, CONCAT('$[', @i, '].cantidadEnviada'))
        );

        -- Incrementar contador
        SET @i = @i + 1;
		
    END WHILE;
	
	IF
	(
		SELECT COUNT(*)
		FROM stock AS S
		INNER JOIN
		(
			SELECT ESH.idOrigenFrom, ESD.idProducto, SUM( ESD.cantidadEnviada ) AS cantidad
			FROM entradas_salidas_detalle AS ESD
			INNER JOIN oTemp AS temp
			ON
				temp.idEntradasSalidasDetalle = ESD.idEntradasSalidasDetalle
			INNER JOIN entradas_salidas_header AS ESH ON ESH.idEntradasSalidasH = ESD.idEntradasSalidasH
			WHERE
				ESD.idEntradasSalidasH = p_idEntradasSalidasH
				AND ESD.idStatusESDetalle IN( 0, 1, 3, 4 )
			GROUP BY ESH.idOrigenFrom, ESD.idProducto
		) AS P
			ON P.idProducto = S.idProducto
			AND P.idOrigenFrom = S.idOrigen
		WHERE
			-- SI EL STOCK MENOS LO BLOQUEADO MENOS LA CANTIDAD NECESARIA ES MENOR A 0, QUIERE DECIR QUE NO HAY INV
			( ROUND( IFNULL( S.cantidad ,0) - IFNULL( S.cantidadBlock ,0) - P.cantidad ,2) ) < 0
	) = 0 THEN
		SET @bOK = 1;
	ELSE
		SET @bOK = 0;
		SELECT 0 AS out_id, 'No hay Inventario suficiente.' AS message;
	END IF;
	
	-- SI TODO ESTÁ BIEN
	IF @bOK = 1 THEN
	
		UPDATE
			entradas_salidas_detalle AS PPBD
			INNER JOIN oTemp AS temp
				ON
					temp.idEntradasSalidasDetalle = PPBD.idEntradasSalidasDetalle
		SET
			-- LE CAMBIO EL STATUS A ENVIADO
			PPBD.idStatusESDetalle = 1
			, PPBD.cantidadEnviadaReal = temp.cantidadEnviada
		WHERE
			-- SOLO LOS QUE ESTABAN EN BORRADOR, EN REVISIÓN Y SOLICITUD, ESTE CANDADO ADICIONAL POR SI VIENE ALGUN OTRO QUE NO DEBE JAJAJA
			PPBD.idStatusESDetalle IN( 0, 1, 3, 4 )
		;
		
		-- CAMBIAMOS EL STATUS DEL HEADER
		UPDATE
			entradas_salidas_header
		SET
			idEntradaSalidaStatus = 2 -- SE COLOCA EN PROCESO PORQUE SE ENVIO ALGUN ARTICULO
		WHERE
			idEntradasSalidasH = p_idEntradasSalidasH
		;
		
		-- Insertar en stock_block_log para Insumos
		INSERT INTO stock_block_log (
			createDate,
			active,
			idOrigen,
			idProducto,
			cantidad,
			idRelation,
			relationType,
			motivoDesc
		)
		SELECT 
			oGetDateNow,
			1,
			ESH.idOrigenFrom,
			ESD.idProducto,
			SUM( temp.cantidadEnviada ),
			ESD.idEntradasSalidasDetalle,
			'ESTransfer',
			CONCAT('Bloqueado por la transferencia #', p_idEntradasSalidasH)
			
		FROM entradas_salidas_detalle AS ESD
		INNER JOIN oTemp AS temp
		ON
			temp.idEntradasSalidasDetalle = ESD.idEntradasSalidasDetalle
		INNER JOIN entradas_salidas_header AS ESH ON ESH.idEntradasSalidasH = ESD.idEntradasSalidasH
		WHERE
			ESD.idEntradasSalidasH = p_idEntradasSalidasH
			AND ESD.idStatusESDetalle IN( 0, 1, 3, 4 )
		GROUP BY ESH.idOrigenFrom, ESD.idProducto, ESD.idEntradasSalidasDetalle
        ;

		-- Actualizar stock para Insumos
		UPDATE stock s
		JOIN (
			SELECT
				ESH.idOrigenFrom AS idOrigen,
				ESD.idProducto,
				SUM( temp.cantidadEnviada ) AS cantidadConsumida
			FROM entradas_salidas_detalle AS ESD
			INNER JOIN oTemp AS temp
			ON
				temp.idEntradasSalidasDetalle = ESD.idEntradasSalidasDetalle
			INNER JOIN entradas_salidas_header AS ESH ON ESH.idEntradasSalidasH = ESD.idEntradasSalidasH
			WHERE
				ESD.idEntradasSalidasH = p_idEntradasSalidasH
				AND ESD.idStatusESDetalle IN( 0, 1, 3, 4 )
			GROUP BY ESH.idOrigenFrom, ESD.idProducto
		) pcd ON s.idProducto = pcd.idProducto AND s.idOrigen = pcd.idOrigen
		SET s.cantidadBlock = IFNULL(s.cantidadBlock, 0) + pcd.cantidadConsumida;
		
		SELECT 1 AS out_id, 'Enviado con éxito.' AS message;
		
	END IF;
		
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getActionListWithPage` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getActionListWithPage`(
IN p_search VARCHAR(500)
, IN p_start INT
, IN p_limiter INT
)
BEGIN

SET SESSION TRANSACTION ISOLATION LEVEL READ UNCOMMITTED ;

	SET @iRows = 0;
	
	SET @iRows = ( SELECT
					COUNT(*)
					FROM actions AS A
					WHERE
						(
							p_search = ''
							OR A.name LIKE CONCAT('%', p_search ,'%')
							OR A.description LIKE CONCAT('%', p_search ,'%')
						)
	);
	
	SELECT
	@iRows AS iRows
	, A.idAction
	, A.createDate
	, A.name
	, A.description
	, A.active
	FROM actions AS A
	WHERE
		(
			p_search = ''
			OR A.name LIKE CONCAT('%', p_search ,'%')
			OR A.description LIKE CONCAT('%', p_search ,'%')
		)
    ORDER BY A.idAction DESC
	LIMIT p_start, p_limiter;

SET SESSION TRANSACTION ISOLATION LEVEL REPEATABLE READ ;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getActionsBySectionAndPermission` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getActionsBySectionAndPermission`(
IN p_idActionSection BIGINT
, IN p_relationType VARCHAR(5)
, IN p_idRelation BIGINT

)
BEGIN

SET SESSION TRANSACTION ISOLATION LEVEL READ UNCOMMITTED ;
	
	SELECT
	A.idAction
	, A.createDate
	, ASS.sectionName
	, A.name
	, A.nameHtml
	, A.description
	,IFNULL(
	(
		SELECT
		1
		FROM actionsconf AS AC
		WHERE AC.active = 1
		AND AC.relationType = p_relationType
		AND AC.idRelation = p_idRelation
		AND AC.idAction = A.idAction
	), 0) AS bPermissionAction
	, A.active
	FROM actions AS A
	INNER JOIN actionsection ASS ON A.idActionSection = ASS.idActionSection
	WHERE A.active = 1
	AND ASS.idActionSection = p_idActionSection
	ORDER BY A.idAction ASC;

SET SESSION TRANSACTION ISOLATION LEVEL REPEATABLE READ ;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getActionsBySectionPagindo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getActionsBySectionPagindo`(
IN p_idActionSection SMALLINT
, IN p_search VARCHAR(500)
, IN p_start INT
, IN p_limiter INT
)
BEGIN

SET SESSION TRANSACTION ISOLATION LEVEL READ UNCOMMITTED ;

	SELECT
	
		COUNT(*) AS iRows
		, A.idActionSection
		, A.idAction
		, A.name
		, A.nameHtml
		, A.description
		, A.active
		
	FROM actions AS A
	WHERE
		A.active = 1
		AND A.idActionSection = p_idActionSection
        AND
		(
			p_search = ''
			OR A.name LIKE CONCAT('%', p_search ,'%')
			OR A.nameHtml LIKE CONCAT('%', p_search ,'%')
			OR A.description LIKE CONCAT('%', p_search ,'%')
		)
	GROUP BY
	
		A.idActionSection
		, A.idAction
		, A.name
		, A.nameHtml
		, A.description
		, A.active
	
    ORDER BY A.idAction ASC
	LIMIT p_start, p_limiter;

SET SESSION TRANSACTION ISOLATION LEVEL REPEATABLE READ ;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getActionSection` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getActionSection`()
BEGIN

SET SESSION TRANSACTION ISOLATION LEVEL READ UNCOMMITTED ;
	
	SELECT
	ASS.idActionSection
	, ASS.sectionName
	, ASS.active
	FROM actionsection ASS 
	ORDER BY ASS.iLugar ASC;

SET SESSION TRANSACTION ISOLATION LEVEL REPEATABLE READ ;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getActionsPermissionByUser` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getActionsPermissionByUser`(
	IN p_idUser BIGINT
)
BEGIN

SET SESSION TRANSACTION ISOLATION LEVEL READ UNCOMMITTED ;

	SET @iRows = 0;
	
	CREATE TEMPORARY TABLE actionsList (
		id BIGINT AUTO_INCREMENT,
		idAction BIGINT,
		PRIMARY KEY(id)
	) ENGINE=InnoDB;
	
	INSERT INTO actionsList( idAction )
	SELECT DISTINCT
	A.idAction
	FROM actions AS A
	INNER JOIN actionsconf AS AC ON AC.active = 1 AND relationType = 'R' AND A.idAction = AC.idAction
	INNER JOIN user_roles AS RC ON AC.idRelation = RC.idRol
	INNER JOIN users AS U ON RC.idUser = U.idUser
	WHERE A.active = 1
	AND U.idUser = p_idUser
	;
	
	INSERT INTO actionsList( idAction )
	SELECT DISTINCT
	A.idAction
	FROM actions AS A
	INNER JOIN actionsconf AS AC ON AC.active = 1 AND AC.relationType = 'U' AND A.idAction = AC.idAction
	INNER JOIN users AS U ON AC.idRelation = U.idUser
	WHERE A.active = 1
	AND U.idUser = p_idUser
	;
	
	SELECT DISTINCT
	A.idAction
	,A.name
	FROM actions AS A
	INNER JOIN actionsList AS AL ON A.idAction = AL.idAction;
    
    DROP TABLE actionsList;

SET SESSION TRANSACTION ISOLATION LEVEL REPEATABLE READ ;
 
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getAlmacenByID` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getAlmacenByID`(IN p_idAlmacen BIGINT)
BEGIN

SET SESSION TRANSACTION ISOLATION LEVEL READ UNCOMMITTED ;
	
	SELECT
	S.idAlmacen
	, S.createDate
	, S.name
    , IFNULL( CRO.idCatRelacionOrigen ,0) AS idCatRelacionOrigen
    , IFNULL( CRO.name ,'') AS catRelacionOrigenDesc
    
	, S.calle
	, S.entreCalles
    , S.codigocolonia
	, CO.nombre AS colonia
	, MU.nombre AS municipio
	, ES.nombre AS estado
	, CO.codigopostal
	, S.telefono
	, S.email	
	, S.numExt
	, S.numInt
	, S.lat
	, S.long
	, S.active
	FROM almacenes AS S
    LEFT JOIN cat_relacion_origen AS CRO ON S.idCatRelacionOrigen = CRO.idCatRelacionOrigen
	LEFT JOIN colonias CO ON CO.codigocolonia = S.codigocolonia
    LEFT JOIN municipios MU ON MU.codigomunicipio = CO.codigomunicipio AND MU.codigoestado = CO.codigoestado
    LEFT JOIN estados ES ON ES.codigoestado = CO.codigoestado
	WHERE S.idAlmacen = p_idAlmacen;

 SET SESSION TRANSACTION ISOLATION LEVEL REPEATABLE READ ;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getAlmacenesPaginado` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getAlmacenesPaginado`(IN p_search VARCHAR(500),IN p_start INT, IN p_limiter INT)
BEGIN

SET SESSION TRANSACTION ISOLATION LEVEL READ UNCOMMITTED ;

	SET @iRows = 0;
	
	
	SET @iRows = ( SELECT
					COUNT(*)
					FROM almacenes AS S
					WHERE
					(
						p_search = ''
						OR S.name LIKE CONCAT('%', p_search ,'%')
					)
	);
	
	SELECT
	@iRows AS iRows
	, S.idAlmacen
	, S.createDate
	, S.name
	, S.calle
    , S.entreCalles
	, S.codigocolonia
	, CO.nombre AS colonia
    , CD.nombre AS ciudad
    , MU.nombre AS municipio
    , ES.nombre AS estado
    , CO.codigopostal
	, S.active
	FROM almacenes AS S
	LEFT JOIN colonias CO ON CO.codigocolonia = S.codigocolonia
    LEFT JOIN ciudades CD ON CD.codigomunicipio = CO.codigomunicipio AND CD.codigoestado = CO.codigoestado AND CD.codigociudad = CO.codigociudad
	LEFT JOIN municipios MU ON MU.codigomunicipio = CD.codigomunicipio AND MU.codigoestado = CD.codigoestado
	LEFT JOIN estados ES ON ES.codigoestado = MU.codigoestado
	WHERE
	(
		p_search = ''
		OR S.name LIKE CONCAT('%', p_search ,'%')
	)
    ORDER BY S.idAlmacen DESC
	LIMIT p_start, p_limiter;

SET SESSION TRANSACTION ISOLATION LEVEL REPEATABLE READ ;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getArticulosParaVenta` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getArticulosParaVenta`(
	IN p_idSucursal BIGINT,
    IN p_search VARCHAR(500),
    IN p_start INT,
    IN p_limiter INT,
    IN p_idUserLogON BIGINT
)
BEGIN

	CREATE TEMPORARY TABLE IF NOT EXISTS tmp_VentasPorProducto AS
	SELECT VD.idProducto, SUM( VD.cantidad ) AS cantidad
	FROM ventasdetalle AS VD
	INNER JOIN ventas AS V ON V.idVenta = VD.idVenta
	INNER JOIN clientes AS C ON C.idCliente = V.idCliente AND C.idTipoCliente = 1
	WHERE
		V.idSucursal = p_idSucursal
	GROUP BY VD.idProducto
		;

	SET @iRows = 0;

    SET @iRows = (
        SELECT COUNT(*)
        FROM productos AS P
		INNER JOIN cat_tipo_producto AS CTP ON CTP.active = 1 AND CTP.idCatTipoProducto = P.idCatTipoProducto
		INNER JOIN cat_descripciones AS CD ON CD.active = 1 AND CD.idDescription = P.idDescription
		INNER JOIN cat_unidad_medida AS UM ON UM.active = 1 AND UM.idUnidadMedida = P.idUnidadMedida
		WHERE
			P.active = 1
			AND CTP.idCatTipoProducto IN ( 1 ) -- PRODUCTOS
			AND
			(
				p_search = ''
				OR CONCAT( IFNULL( CTP.abreviatura ,''), '-', CAST( P.idproductocategoria AS CHAR(12) ) , '-', IFNULL( CD.description ,''), ' ', REPLACE( CAST( P.valorMedida AS CHAR(12) ) , '.00', ''), ' ', IFNULL( UM.abreviatura ,'') ) LIKE CONCAT('%', p_search ,'%')
			)
		ORDER BY P.idProducto DESC
    );

	SET @idOrigen = 0;
	
	SET @idOrigen = IFNULL(
	(
		SELECT
		O.idOrigen
		FROM origenes AS O
		WHERE
			O.idRelacion = p_idSucursal
			AND O.idCatRelacionOrigen = 1 -- SUCURSAL
	)
	,0);
	
	WITH RECURSIVE words AS (
	  SELECT
		SUBSTRING_INDEX(p_search, ' ', 1) AS palabra,
		SUBSTRING(p_search, LOCATE(' ', p_search) + 1) AS rest
	  UNION ALL
	  SELECT
		SUBSTRING_INDEX(rest, ' ', 1) AS palabra,
		SUBSTRING(rest, LOCATE(' ', rest) + 1) AS rest
	  FROM words
	  WHERE rest <> '' AND LOCATE(' ', rest) > 0
	  UNION ALL
	  SELECT
		rest AS palabra,
		'' AS rest
	  FROM words
	  WHERE rest <> '' AND LOCATE(' ', rest) = 0
	)
	SELECT
	
		P.idProducto AS idProducto
		, CONCAT(
			CAST( P.idproductocategoria AS CHAR(12) )
			, '-', IFNULL( CD.description ,'')
			, ' ', REPLACE( CAST( P.valorMedida AS CHAR(12) ) , '.00', '')
			, ' ', IFNULL( UM.abreviatura ,'')
			, ' - Inv: ', REPLACE( CAST( ROUND( IFNULL( S.cantidad ,0) - IFNULL( S.cantidadBlock ,0) ,2) AS CHAR(12) ) , '.00', '')
			) AS articuloName
        , P.bEnvase AS bCanEnvase
		, P.precio
		
		, ROUND( IFNULL( S.cantidad ,0) - IFNULL( S.cantidadBlock ,0) ,2) AS canInv
		
		,(
		  SELECT COUNT(*) 
		  FROM words w
		  WHERE CONCAT(
			  IFNULL(CTP.abreviatura, ''),
			  '-', CAST(P.idproductocategoria AS CHAR(12)),
			  '-', IFNULL(CD.description, ''),
			  ' ', REPLACE(CAST(P.valorMedida AS CHAR(12)), '.00', ''),
			  ' ', IFNULL(UM.abreviatura, '')
		  ) LIKE CONCAT('%', w.palabra, '%')
		) AS iCountWords
	
    FROM productos AS P
	INNER JOIN cat_tipo_producto AS CTP ON CTP.active = 1 AND CTP.idCatTipoProducto = P.idCatTipoProducto
	INNER JOIN cat_descripciones AS CD ON CD.active = 1 AND CD.idDescription = P.idDescription
	INNER JOIN cat_unidad_medida AS UM ON UM.active = 1 AND UM.idUnidadMedida = P.idUnidadMedida
	LEFT JOIN stock AS S
		ON
			S.idProducto = P.idProducto
            AND S.idOrigen = @idOrigen
	LEFT JOIN tmp_VentasPorProducto VPP ON VPP.idProducto = P.idProducto
	WHERE
		P.active = 1
		AND CTP.idCatTipoProducto IN ( 1, 4 ) -- PRODUCTOS
		AND
		(
			p_search = ''
			OR (
				SELECT COUNT(*) 
				FROM words w
				WHERE CONCAT(
					IFNULL(CTP.abreviatura, ''),
					'-', CAST(P.idproductocategoria AS CHAR(12)),
					'-', IFNULL(CD.description, ''),
					' ', REPLACE(CAST(P.valorMedida AS CHAR(12)), '.00', ''),
					' ', IFNULL(UM.abreviatura, '')
				) LIKE CONCAT('%', w.palabra, '%')
			) > 0
		)
    ORDER BY iCountWords DESC, IFNULL( VPP.cantidad ,0) DESC
	LIMIT p_start, p_limiter;
	
 END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getCajaByID` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getCajaByID`(
	IN p_idcajas INT
)
BEGIN

	SELECT
	idcajas
	, idSucursal
	, nombre
	FROM cajas
	WHERE idcajas = p_idcajas;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getCajas` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getCajas`(
IN p_idUserLogON BIGINT
)
BEGIN

	SELECT
	
		C.idcajas
		,C.idSucursal
		,C.nombre
		,C.descripcion
		,C.active
		,C.createdAt
		,C.updatedAt
		,C.activeuuid
		,C.ultimouso
		,C.esgeneral
		,C.estatus
	
    FROM cajas AS C
	INNER JOIN sucursales AS S ON S.idSucursal = C.idSucursal
	INNER JOIN origenes O ON O.idCatRelacionOrigen = 1 AND O.idRelacion = S.idSucursal
	INNER JOIN origenes_config AS OC ON OC.idOrigen = O.idOrigen AND OC.idUser = p_idUserLogON
    
	GROUP BY 
	C.idcajas
		,C.idSucursal
		,C.nombre
		,C.descripcion
		,C.active
		,C.createdAt
		,C.updatedAt
		,C.activeuuid
		,C.ultimouso
		,C.esgeneral
		,C.estatus
	ORDER BY C.idcajas ASC;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getCatActionSectionListWithPage` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getCatActionSectionListWithPage`(
IN p_search VARCHAR(500)
, IN p_start INT
, IN p_limiter INT
)
BEGIN

SET SESSION TRANSACTION ISOLATION LEVEL READ UNCOMMITTED ;

	SET @iRows = 0;
	
	SET @iRows = ( SELECT
					COUNT(*)
					FROM actionsection AS A
					WHERE
						(
							p_search = ''
							OR A.sectionName LIKE CONCAT('%', p_search ,'%')
						)
	);
	
	SELECT
	@iRows AS iRows
	, A.idActionSection
	, A.sectionName
	, A.iLugar
	, A.active
	FROM actionsection AS A
	WHERE
		(
			p_search = ''
			OR A.sectionName LIKE CONCAT('%', p_search ,'%')
		)
    ORDER BY A.iLugar ASC
	LIMIT p_start, p_limiter;

SET SESSION TRANSACTION ISOLATION LEVEL REPEATABLE READ ;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getCatStatusUser` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getCatStatusUser`(
	IN p_search VARCHAR(500)
)
BEGIN

SET SESSION TRANSACTION ISOLATION LEVEL READ UNCOMMITTED ;
	
	SELECT
	CSU.idStatus AS id
	, CSU.name AS text
	FROM cat_status_user as CSU
	WHERE
		CSU.active = 1
		AND
		(
			p_search = ''
			OR CSU.name LIKE CONCAT('%', p_search ,'%')
		)
    ORDER BY CSU.idStatus DESC
	LIMIT 0, 5;

 SET SESSION TRANSACTION ISOLATION LEVEL REPEATABLE READ ;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getClienteByID` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getClienteByID`(IN p_idCliente BIGINT)
BEGIN

    SELECT
        C.idCliente,
        C.idVendedor,
        C.createDate,
        C.nombre,
        C.calle,
        C.numExt,
        C.numInt,
        C.entreCalles,
        C.codigocolonia,
        CO.nombre AS colonia,
        MU.nombre AS municipio,
        ES.nombre AS estado,
        CO.codigopostal,
        C.razonSocial,
        C.rfc,
        C.telefono,
        C.email,
        C.lat,
        C.long,
        C.active,
        IFNULL( C.bCredito ,0) AS bCredito,
        IFNULL( C.iDiasCredito ,0) AS iDiasCredito,
        IFNULL( C.limiteCredito ,0) AS limiteCredito,
        C.idTipoCliente,
        IFNULL( TC.name ,'') AS tipoClienteDesc,
        C.bPuntoDVenta,
        (
        IFNULL(
        (
			SELECT ROUND( SUM( V.pendiente ), 2)
			FROM ventas AS V
			WHERE
				V.active = 1
                AND V.idCliente = C.idCliente
				AND V.idTipoVenta = 2
                AND V.bClosed = 1
		)
        , 0 )
        +
        IFNULL(
        (
			SELECT ROUND( SUM( PC.total ), 2)
			FROM pedidos_clientes AS PC
			WHERE
				PC.idCliente = C.idCliente
				AND PC.idTipoVenta = 2
                AND PC.idCatStatusPedidosClientes IN( 3, 4 )
		)
        , 0 )
        )AS creditoPendiente,
		
		IFNULL( ROUND( monto ,2) ,0) AS montoDiElect
        
        , IFNULL( C.bDineroElectronico ,0) AS bDineroElectronico
        , IFNULL( C.bCompraMin ,0) AS bCompraMin
		
		, IFNULL( CMN.valorType ,'' ) AS conf_valorType
		, IFNULL( CMN.valor ,'' ) AS conf_valor
        
        , IFNULL( C.bDineroElectronico ,0) AS bDineroElectronico
        
        , IFNULL(
        (
			SELECT COUNT(*)
			FROM ventas AS V
			WHERE
				V.active = 1
				AND V.idCliente = C.idCliente
		)
        , 0 ) AS iCountSales
        
        , Z.idZona
        , IFNULL( Z.name ,'') AS zonaDesc
        
        , IFNULL( bProspecto ,0) AS bProspecto
        , IFNULL( bFProspecto ,0) AS bFProspecto
		, IFNULL( C.compraEstimada ,0) AS compraEstimada
		, DATE_FORMAT( C.clientDate, '%d/%m/%Y') AS clientDateDate
		, DATE_FORMAT( C.clientDate, '%h:%i:%s %p') AS clientDateHours
		, CONCAT( 'Se hizo cliente: ', DATE_FORMAT( C.clientDate, '%d/%m/%Y'), ' ', DATE_FORMAT( C.clientDate, '%h:%i:%s %p') ) AS clientDateDesc
		, IFNULL( C.idGiro ,0) AS idGiro
		, IFNULL( G.name ,'') AS giroDesc
		
    FROM clientes AS C
	LEFT JOIN dinero_electronico AS DE ON DE.idCliente = C.idCliente
    LEFT JOIN cat_tipo_cliente AS TC ON C.idTipoCliente = TC.idTipoCliente
    LEFT JOIN colonias CO ON CO.codigocolonia = C.codigocolonia
    LEFT JOIN municipios MU ON MU.codigomunicipio = CO.codigomunicipio AND MU.codigoestado = CO.codigoestado
    LEFT JOIN estados ES ON ES.codigoestado = CO.codigoestado
    LEFT JOIN conf_min_compra AS CMN ON CMN.idTipoCliente = C.idTipoCliente
    LEFT JOIN zonas AS Z ON Z.idZona = C.idZona
	LEFT JOIN giros AS G ON G.idGiro = C.idGiro
    
    WHERE C.idCliente = p_idCliente;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getClienteByTel` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getClienteByTel`(IN p_telefono VARCHAR(45))
BEGIN

    SELECT
        C.idCliente,
        C.idVendedor,
        C.createDate,
        C.nombre,
        C.calle,
        C.numExt,
        C.numInt,
        C.entreCalles,
        C.codigocolonia,
        CO.nombre AS colonia,
        MU.nombre AS municipio,
        ES.nombre AS estado,
        CO.codigopostal,
        C.razonSocial,
        C.rfc,
        C.telefono,
        C.email,
        C.lat,
        C.long,
        C.active,
        IFNULL( C.bCredito ,0) AS bCredito,
        IFNULL( C.iDiasCredito ,0) AS iDiasCredito,
        IFNULL( C.limiteCredito ,0) AS limiteCredito,
        C.idTipoCliente,
        IFNULL( TC.name ,'') AS tipoClienteDesc,
        C.bPuntoDVenta,
		
		IFNULL( ROUND( monto ,2) ,0) AS montoDiElect
		
    FROM clientes AS C
	LEFT JOIN dinero_electronico AS DE ON DE.idCliente = C.idCliente
    LEFT JOIN cat_tipo_cliente AS TC ON C.idTipoCliente = TC.idTipoCliente
    LEFT JOIN colonias CO ON CO.codigocolonia = C.codigocolonia
    LEFT JOIN municipios MU ON MU.codigomunicipio = CO.codigomunicipio AND MU.codigoestado = CO.codigoestado
    LEFT JOIN estados ES ON ES.codigoestado = CO.codigoestado
    
    WHERE C.telefono = p_telefono;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getClientesListWithPage` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getClientesListWithPage`(
IN p_startDate VARCHAR(50)
, IN p_endDate VARCHAR(50)
, IN p_idVendedor BIGINT
, IN p_idZona INT
, IN p_idTipoCliente BIGINT
, IN p_bProspecto SMALLINT
, IN p_idGiro INT
, IN p_iSeguimiento INT
, IN p_active SMALLINT
, IN p_search VARCHAR(500)
, IN p_start INT
, IN p_limiter INT
)
BEGIN

    SET @iRows = 0;

    SET @iRows = (
					SELECT COUNT(*)
					FROM clientes AS C
					WHERE
					( IFNULL( p_startDate ,'') = '' OR CAST( C.createDate AS DATE ) >= p_startDate)
					AND ( IFNULL( p_endDate ,'') = '' OR CAST( C.createDate AS DATE ) <= p_endDate)
					AND
					(
						p_idVendedor = 0
						OR C.idVendedor = p_idVendedor
					)
					AND
                    (
						p_idZona = 0
                        OR C.idZona = p_idZona
                    )
                    AND
                    (
						p_idTipoCliente = 0
                        OR C.idTipoCliente = p_idTipoCliente
                    )
					AND
					(
						p_search = ''
						OR C.nombre LIKE CONCAT('%', p_search, '%')
						OR C.rfc LIKE CONCAT('%', p_search, '%')
					)
					AND
					(
						( p_bProspecto = 0 AND IFNULL( C.bProspecto ,0) = 0 )
						OR ( p_bProspecto = 1 AND ( IFNULL( C.bProspecto ,0) = 1 OR IFNULL( C.bFProspecto ,0) = 1 ) )
					)
					AND
                    (
						p_idGiro = 0
                        OR C.idGiro = p_idGiro
                    )
					AND
					(
						p_iSeguimiento = 0
						OR ( p_iSeguimiento = 1 AND IFNULL( C.bProspecto ,0) = 1 )
						OR ( p_iSeguimiento = 2 AND IFNULL( C.bProspecto ,0) = 0 AND IFNULL( C.bFProspecto ,0) = 1 )
					)
					AND
					(
						p_active = 0
						OR ( p_active = 1 AND C.active = 1 )
						OR ( p_active = 2 AND C.active = 0 )
					)
				  );

    SELECT
        @iRows AS iRows,
        C.idCliente,
        C.idVendedor,
        C.createDate,
        C.nombre,
        C.calle,
		C.entreCalles,
        C.codigocolonia,
        CO.nombre AS colonia,
        MU.nombre AS municipio,
        ES.nombre AS estado,
        CO.codigopostal,
        C.active,
        C.telefono,
        C.idTipoCliente,
        IFNULL( TC.name ,'') AS tipoClienteDesc,
		
		Z.idZona,
		Z.name AS zonaName,
        
        IFNULL( C.bProspecto ,0) AS bProspecto,
        IFNULL( C.bFProspecto ,0) AS bFProspecto,
		IFNULL( C.compraEstimada ,0) AS compraEstimada,
		DATE_FORMAT( C.clientDate, '%d/%m/%Y') AS clientDateDate,
		DATE_FORMAT( C.clientDate, '%h:%i:%s %p') AS clientDateHours,
		CONCAT( 'Se hizo cliente: ', DATE_FORMAT( C.clientDate, '%d/%m/%Y'), ' ', DATE_FORMAT( C.clientDate, '%h:%i:%s %p') ) AS clientDateDesc,
		IFNULL( C.idGiro ,0) AS idGiro,
		IFNULL( G.name ,'') AS giroDesc,
		
		IFNULL(
		(
			SELECT
			CONCAT( DATE_FORMAT( C.clientDate, '%d/%m/%Y'), ' - ', DATE_FORMAT( C.clientDate, '%h:%i:%s %p'), ': ', SP.description )
			FROM seguimiento_prospectos AS SP
			WHERE
				SP.idCliente = C.idCliente
			ORDER BY SP.idSeguimiento DESC
			LIMIT 1
		),'') AS lastSeguimiento
    FROM clientes AS C
    LEFT JOIN cat_tipo_cliente AS TC ON C.idTipoCliente = TC.idTipoCliente
    LEFT JOIN colonias CO ON CO.codigocolonia = C.codigocolonia
    LEFT JOIN ciudades CD ON CD.codigomunicipio = CO.codigomunicipio AND CD.codigoestado = CO.codigoestado AND CD.codigociudad = CO.codigociudad
	LEFT JOIN municipios MU ON MU.codigomunicipio = CD.codigomunicipio AND MU.codigoestado = CD.codigoestado
	LEFT JOIN estados ES ON ES.codigoestado = MU.codigoestado
	LEFT JOIN zonas AS Z ON Z.idZona = C.idZona
	LEFT JOIN giros AS G ON G.idGiro = C.idGiro
    WHERE
	( IFNULL( p_startDate ,'') = '' OR CAST( C.createDate AS DATE ) >= p_startDate)
	AND ( IFNULL( p_endDate ,'') = '' OR CAST( C.createDate AS DATE ) <= p_endDate)
	AND
	(
		p_idVendedor = 0
		OR C.idVendedor = p_idVendedor
	)
	AND
	(
		p_idZona = 0
		OR C.idZona = p_idZona
	)
    AND
	(
		p_idTipoCliente = 0
		OR C.idTipoCliente = p_idTipoCliente
	)
	AND
	(
        p_search = ''
        OR C.nombre LIKE CONCAT('%', p_search, '%')
        OR C.rfc LIKE CONCAT('%', p_search, '%')
    )
	AND
	(
		( p_bProspecto = 0 AND IFNULL( C.bProspecto ,0) = 0 )
		OR ( p_bProspecto = 1 AND ( IFNULL( C.bProspecto ,0) = 1 OR IFNULL( C.bFProspecto ,0) = 1 ) )
	)
	AND
	(
		p_idGiro = 0
		OR C.idGiro = p_idGiro
	)
	AND
	(
		p_iSeguimiento = 0
		OR ( p_iSeguimiento = 1 AND IFNULL( C.bProspecto ,0) = 1 )
		OR ( p_iSeguimiento = 2 AND IFNULL( C.bProspecto ,0) = 0 AND IFNULL( C.bFProspecto ,0) = 1 )
	)
	AND
	(
		p_active = 0
		OR ( p_active = 1 AND C.active = 1 )
		OR ( p_active = 2 AND C.active = 0 )
	)
    ORDER BY C.idCliente DESC
    LIMIT p_start, p_limiter;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getConstanteByKey` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getConstanteByKey`(
	IN p_key VARCHAR(100)
)
BEGIN

	SELECT
		IFNULL( C.`value` ,'' ) AS `value`
		, IFNULL( C.`value2` ,'' ) AS `value2`
		, IFNULL( C.`value3` ,'' ) AS `value3`
		, IFNULL( C.`value4` ,'' ) AS `value4`
		, IFNULL( C.`value5` ,'' ) AS `value5`
		, IFNULL( C.`value6` ,'' ) AS `value6`
		, IFNULL( C.`value7` ,'' ) AS `value7`
	FROM constantes AS C
	WHERE
		C.`key` = p_key
	;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getCotizacionByID` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getCotizacionByID`(IN p_idCotizacion BIGINT)
BEGIN

	SELECT
	
        H.idCotizacion
        , H.createDate
		
		, DATE_FORMAT( H.createDate, '%d-%m-%Y') AS createDateDate
		, DATE_FORMAT( H.createDate, '%h:%i:%s %p') AS createDateHours
		
		, H.active
		
		, H.idSucursal AS idSucursalOld
		, H.idSucursal
        , SS.name AS sucursalName
		
		, H.idCliente AS idClienteOld
		, H.idCliente
        , CONCAT(
			C.nombre
			, ' - '
			, IFNULL( TC.name ,'')
			) AS clienteName
		, CONCAT(
			C.nombre
			, ' - '
			, IFNULL( TC.name ,'')
			, IF( C.active = 0, ' - INACTIVO', '' )
			, IF( IFNULL( C.bProspecto ,0) = 1, ' - PROSPECTO', '' )
			) AS clienteNamePlus
        , IF( C.active = 0, ' - INACTIVO', '' ) AS statusCliente
		
        , H.idCatStatusCotizaciones AS idCatStatusCotizacionesOld
		, H.idCatStatusCotizaciones
		, S.name AS catStatusCotizacionesName
		
		, H.idTipoVenta AS idTipoVentaOld
		, H.idTipoVenta
		, CRV.name AS tipoVentaDesc
		
		, H.idCreateUser
		, U.name AS createUserName
		
		, H.active
		
		, IFNULL(
		(
			SELECT
			ROUND( SUM(total) ,2)
			FROM cotizaciones_detalle AS PCD
			WHERE
				PCD.idCotizacion = H.idCotizacion
		)
		,0) AS total
		
		, IFNULL( H.comments ,'') AS comments
		
		, C.idTipoCliente
        , IFNULL( TC.name ,'') AS tipoClienteDesc
		
		, IFNULL(
		(
			SELECT
			cantidad
			FROM cotizaciones_envases AS PE
			WHERE
				PE.idCotizacion = H.idCotizacion
				AND PE.valorMedida = 20
			LIMIT 1
		)
		,0) AS cantEnvases,
        
        IFNULL( idCotizacionNuevo ,0) AS idCotizacionNuevo
		
    FROM cotizaciones AS H
	INNER JOIN sucursales AS SS ON SS.idSucursal = H.idSucursal
	INNER JOIN clientes AS C ON C.idCliente = H.idCliente
    LEFT JOIN cat_tipo_cliente AS TC ON TC.idTipoCliente = C.idTipoCliente
	INNER JOIN cat_status_cotizaciones AS S ON S.idCatStatusCotizaciones = H.idCatStatusCotizaciones
	INNER JOIN users AS U ON U.idUser = H.idCreateUser
	LEFT JOIN cat_tipo_venta AS CRV ON CRV.idTipoVenta = H.idTipoVenta
    WHERE
		H.idCotizacion = p_idCotizacion
	;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getCotizacionDetalle` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getCotizacionDetalle`(
    IN p_idCotizacion BIGINT,
    IN p_idUserLogON BIGINT
)
BEGIN
    
	-- Consulta principal
    SELECT
        ESD.idCotizacionDetalle,
        P.idProducto,
        CONCAT(
            IFNULL(CTP.abreviatura, ''),
            '-', CAST(P.idproductocategoria AS CHAR(12)),
            '-', IFNULL(CD.description, ''),
            ' ', REPLACE(CAST(P.valorMedida AS CHAR(12)), '.00', ''), ' ', IFNULL(UM.abreviatura, '')
        ) AS articuloName,
        P.valorMedida,
        P.idUnidadMedida,
        ESD.bEnvase,
        P.bEnvase AS bCanEnvase,
        ROUND(IFNULL(ESD.cantidad, 0), 2) AS cantidad,
        P.precio AS precioUnitarioOLD,
        ESD.precioUnitario,
        ESD.descuento,
        IFNULL(ESD.precioConDescuento, 0) AS precioConDescuento,
        ESD.total,
        IFNULL(ESD.aplicaPromo, 0) AS aplicaPromo,
        IFNULL(ESD.idPromocion, 0) AS idPromocion,
        IFNULL(ESD.promoName, '') AS promoName,
        IFNULL(P.idProductoRelacion, 0) AS idProductoRelacion,
        IFNULL(PR.precio, 0) AS productoRelacionPrecio,
        IFNULL(P.precioEcoAgr, 0) AS precioEcoAgr
    FROM cotizaciones_detalle AS ESD
    INNER JOIN productos AS P ON P.active = 1 AND P.idProducto = ESD.idProducto
    LEFT JOIN productos AS PR ON PR.active = 1 AND PR.idProducto = P.idProductoRelacion
    INNER JOIN cat_tipo_producto AS CTP ON CTP.active = 1 AND CTP.idCatTipoProducto = P.idCatTipoProducto
    INNER JOIN cat_descripciones AS CD ON CD.active = 1 AND CD.idDescription = P.idDescription
    INNER JOIN cat_unidad_medida AS UM ON UM.active = 1 AND UM.idUnidadMedida = P.idUnidadMedida
    WHERE ESD.idCotizacion = p_idCotizacion
    ORDER BY ESD.idCotizacionDetalle DESC;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getCotizacionEnvases` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getCotizacionEnvases`(
	IN p_idCotizacion BIGINT
	, IN p_idUserLogON BIGINT
)
BEGIN

	SELECT
	
		idCotizacionesEnvases
        , idCotizacion
		, cantidad
        , valorMedida
        
    FROM cotizaciones_envases
	WHERE
		idCotizacion = p_idCotizacion;
	
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getCotizacionesPaginado` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getCotizacionesPaginado`(
    IN p_startDate VARCHAR(50),
    IN p_endDate VARCHAR(50),
    IN p_idCatStatusCotizaciones INT,
    IN p_idTipoVenta INT,
    IN p_idVendedor INT,
	IN p_idCliente INT,
    IN p_idCotizacionSearch VARCHAR(50),
    IN p_search VARCHAR(500),
    IN p_start INT,
    IN p_limiter INT,
    IN p_idUserLogON BIGINT
)
BEGIN

    SET @iRows = 0;

    SET @iRows = (
        SELECT COUNT(*)
        FROM cotizaciones AS H
        INNER JOIN users AS U ON U.idUser = H.idCreateUser
        INNER JOIN cat_status_cotizaciones AS ESS ON ESS.idCatStatusCotizaciones = H.idCatStatusCotizaciones
        INNER JOIN clientes AS C ON H.idCliente = C.idCliente
        LEFT JOIN cat_tipo_venta AS CTV ON CTV.idTipoVenta = H.idTipoVenta
        WHERE
            H.active = 1
            AND (p_startDate = '' OR DATE(H.createDate) >= DATE(p_startDate))
            AND (p_endDate = '' OR DATE(H.createDate) <= DATE(p_endDate))
            AND (p_idCatStatusCotizaciones = 0 OR H.idCatStatusCotizaciones = p_idCatStatusCotizaciones)
            AND (p_idTipoVenta = 0 OR H.idTipoVenta = p_idTipoVenta)
			AND (p_idVendedor = 0 OR C.idVendedor = p_idVendedor)
            AND (p_idCliente = 0 OR H.idCliente = p_idCliente)
            AND (p_idCotizacionSearch = '' OR H.idCotizacion = p_idCotizacionSearch)
            AND (p_search = '' OR C.nombre LIKE CONCAT('%', p_search, '%'))
    );

    SELECT
        @iRows AS iRows,
        H.idCotizacion,
        H.createDate,
        H.idSucursal,
        S.name AS sucursalName,
        H.idCliente,
		C.nombre AS clienteName,
        CONCAT(
			C.nombre
			, ' - '
			, IFNULL( TC.name ,'')
			, IF( C.active = 0, ' - INACTIVO', '' )
			, IF( IFNULL( C.bProspecto ,0) = 1, ' - PROSPECTO', '' )
			) AS clienteNamePlus,
        H.idCatStatusCotizaciones,
        ESS.name AS catStatusCotizacionesName,
        H.idTipoVenta,
        CTV.name AS tipoVentaDesc,
        H.idCreateUser,
        U.name AS createUserName,
        H.active,
        H.comments,
        IFNULL(
            (
                SELECT ROUND(SUM(total), 2)
                FROM cotizaciones_detalle AS CD
                WHERE CD.idCotizacion = H.idCotizacion
            ),
            0
        ) AS total,
        
        C.idTipoCliente,
        TC.name AS tipoClienteDesc,
        IFNULL(H.idCotizacionNuevo, 0) AS idCotizacionNuevo,
		
		IFNULL( H.idPedido ,0) AS idPedido,
		IFNULL( CSPC.name ,'') AS catStatusPedidosClientesName
        
    FROM cotizaciones AS H
    INNER JOIN sucursales AS S ON S.idSucursal = H.idSucursal
    INNER JOIN clientes AS C ON H.idCliente = C.idCliente
    LEFT JOIN cat_tipo_cliente AS TC ON C.idTipoCliente = TC.idTipoCliente
    INNER JOIN users AS U ON U.idUser = H.idCreateUser
    INNER JOIN cat_status_cotizaciones AS ESS ON ESS.idCatStatusCotizaciones = H.idCatStatusCotizaciones
    LEFT JOIN cat_tipo_venta AS CTV ON CTV.idTipoVenta = H.idTipoVenta
	LEFT JOIN pedidos_clientes AS PC ON PC.idPedido = H.idPedido
	LEFT JOIN cat_status_pedidos_clientes AS CSPC ON CSPC.idCatStatusPedidosClientes = PC.idCatStatusPedidosClientes
    WHERE
        H.active = 1
        AND (p_startDate = '' OR DATE(H.createDate) >= DATE(p_startDate))
        AND (p_endDate = '' OR DATE(H.createDate) <= DATE(p_endDate))
        AND (p_idCatStatusCotizaciones = 0 OR H.idCatStatusCotizaciones = p_idCatStatusCotizaciones)
        AND (p_idTipoVenta = 0 OR H.idTipoVenta = p_idTipoVenta)
		AND (p_idVendedor = 0 OR C.idVendedor = p_idVendedor)
        AND (p_idCliente = 0 OR H.idCliente = p_idCliente)
        AND (p_idCotizacionSearch = '' OR H.idCotizacion = p_idCotizacionSearch)
        AND (p_search = '' OR C.nombre LIKE CONCAT('%', p_search, '%'))
    ORDER BY H.idCotizacion DESC
    LIMIT p_start, p_limiter;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getCreditosPendientesPorCliente` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getCreditosPendientesPorCliente`(
    IN p_idCliente INT,
    IN p_idUserLogON BIGINT
)
BEGIN

	DECLARE v_CURDATE DATE;
	DECLARE v_NOW DATETIME;
	
	SET v_CURDATE = CONVERT_TZ(NOW(), 'UTC', 'America/Mazatlan');
	SET v_NOW = CONVERT_TZ(NOW(), 'UTC', 'America/Mazatlan');

		SELECT
			v.idVenta,
            v.createDate,
            DATE_FORMAT( v.createDate, '%d/%m/%Y') AS createDateDate,
			DATE_FORMAT( v.createDate, '%h:%i:%s %p') AS createDateHours,
			v.total AS total_venta,
			IFNULL(SUM(p.total), 0) AS total_pagado,
			0 AS abono,
			(v.total - IFNULL(SUM(p.total), 0)) AS saldo,
			c.idCliente,
			c.nombre AS cliente,
			c.iDiasCredito,
			DATEDIFF(v_CURDATE, v.createDate) + 1 AS dias_transcurridos,
			-- Estatus: 1 = vencido, 0 = dentro del plazo
			CASE
				WHEN DATEDIFF(v_CURDATE, v.createDate) + 1 > c.iDiasCredito THEN 'vencido'
				WHEN DATEDIFF(v_CURDATE, v.createDate) + 1 = c.iDiasCredito THEN 'por vencer'
				ELSE 'dentro del plazo'
			END AS estatus_credito
		FROM
			ventas v
			JOIN clientes c ON v.idCliente = c.idCliente
			LEFT JOIN pagos p ON v.idVenta = p.idVenta AND p.active = 1
		WHERE
			v.active = 1
			AND c.idCliente = p_idCliente
		GROUP BY
			v.idVenta
		HAVING
			saldo > 0
		ORDER BY
			dias_transcurridos DESC, saldo DESC;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getEmployeesRespForOrigen` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getEmployeesRespForOrigen`(
IN p_idOrigen BIGINT
)
BEGIN

SET SESSION TRANSACTION ISOLATION LEVEL READ UNCOMMITTED ;
	
	SELECT
	
		U.idUser AS idEmployee
		, U.name AS userName
	
    FROM users AS U
	INNER JOIN origenes_responsables AS ORR ON ORR.idUser = U.idUser
	WHERE
		U.active = 1
		AND ORR.idOrigen = p_idOrigen
    ORDER BY U.idUser ASC;
	

 SET SESSION TRANSACTION ISOLATION LEVEL REPEATABLE READ ;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getEntradaSalidaByID` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getEntradaSalidaByID`(IN p_idEntradasSalidasH BIGINT)
BEGIN
    SET SESSION TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;

	SELECT
	
        ESH.idEntradasSalidasH
        , ESH.createDate
		
		, DATE_FORMAT( ESH.createDate, '%d-%m-%Y') AS createDateDate
		, DATE_FORMAT( ESH.createDate, '%h:%i:%s %p') AS createDateHours
		
        , ESH.idCatMov AS idCatMovOld
		, ESH.idCatMov
		, CMES.description AS motivoName
		
		, ESH.idEntradaSalidaStatus
		, ESS.name AS entradaSalidaStatusName
		
		, ESH.idCreateUser
		, U.name AS createUserName
		
		, ESH.active
		
        , ESH.idOrigenFrom AS idOrigenFromOld
		, ESH.idOrigenFrom
		, CONCAT( IFNULL( CROFrom.abreviatura ,''), '-', CAST( OFrom.idOrigen AS CHAR(12) ), '-', OFrom.nombre ) AS origenDesc
		
		, ESH.idOrigenTo AS idOrigenToOld
        , ESH.idOrigenTo
		, CONCAT( IFNULL( CROTo.abreviatura ,''), '-', CAST( OTo.idOrigen AS CHAR(12) ), '-', OTo.nombre ) AS origenToDesc
		
		, IFNULL( ESH.comments ,'') AS comments
        
    FROM entradas_salidas_header AS ESH
	INNER JOIN cat_mov_entrada_salida AS CMES ON CMES.idCatMov = ESH.idCatMov
	INNER JOIN users AS U ON U.idUser = ESH.idCreateUser
	INNER JOIN entradas_salidas_status AS ESS ON ESS.idEntradaSalidaStatus = ESH.idEntradaSalidaStatus
	INNER JOIN origenes AS OFrom ON OFrom.idOrigen = ESH.idOrigenFrom
	INNER JOIN cat_relacion_origen AS CROFrom ON CROFrom.idCatRelacionOrigen = OFrom.idCatRelacionOrigen
	LEFT JOIN origenes AS OTo ON OTo.idOrigen = ESH.idOrigenTo
	LEFT JOIN cat_relacion_origen AS CROTo ON CROTo.idCatRelacionOrigen = OTo.idCatRelacionOrigen
    WHERE
		ESH.idEntradasSalidasH = p_idEntradasSalidasH
	;

    SET SESSION TRANSACTION ISOLATION LEVEL REPEATABLE READ;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getEntradaSalidaDetallePaginado` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getEntradaSalidaDetallePaginado`(
	IN p_idEntradasSalidasH BIGINT
	, IN p_idUserLogON BIGINT
)
BEGIN

	SET @esEncargadoFrom = 0;
	
	SET @esEncargadoFrom = IFNULL(
	(
		SELECT
		COUNT(*)
		FROM entradas_salidas_header AS ESH
		INNER JOIN origenes_responsables ORR
			ON
				ORR.idOrigen = ESH.idOrigenFrom
				AND ORR.idUser = p_idUserLogON
		WHERE
			ESH.idEntradasSalidasH = p_idEntradasSalidasH
		LIMIT 1
	)
	,0);
	
	SET @esEncargadoTo = 0;
	
	SET @esEncargadoTo = IFNULL(
	(
		SELECT
		COUNT(*)
		FROM entradas_salidas_header AS ESH
		INNER JOIN origenes_responsables ORR
			ON
				ORR.idOrigen = ESH.idOrigenTo
				AND ORR.idUser = p_idUserLogON
		WHERE
			ESH.idEntradasSalidasH = p_idEntradasSalidasH
		LIMIT 1
	)
	,0);
	
	SET @idOrigenFrom = 0;
	SET @idOrigenTo = 0;
	SET @idCatMov = 0;
	
	SELECT
	ESH.idOrigenFrom, ESH.idOrigenTo, ESH.idCatMov
		INTO
	@idOrigenFrom, @idOrigenTo, @idCatMov
	FROM entradas_salidas_header AS ESH
	WHERE
		ESH.idEntradasSalidasH = p_idEntradasSalidasH
	LIMIT 1
	;
	
	SET @idOrigenFrom = IF( @esEncargadoFrom > 0, @idOrigenFrom, @idOrigenTo );
	
	SET @idSucursal = 0;
	SET @idSucursal = IFNULL(
	(
		SELECT
		idRelacion
		FROM origenes AS O
		WHERE
			O.idOrigen = @idOrigenFrom
			AND O.idCatRelacionOrigen = 1 -- SUCURSAL
	)
	,0);

	SELECT
	
		ESD.idEntradasSalidasDetalle
        , P.idProducto
		, CONCAT( 
			IFNULL( CTP.abreviatura ,'')
			, '-', CAST( P.idproductocategoria AS CHAR(12) )
			, '-', IFNULL( CD.description ,'')
			, ' ', REPLACE( CAST( P.valorMedida AS CHAR(12) ) , '.00', ''), ' ', IFNULL( UM.abreviatura ,'')
			, CASE WHEN ( @esEncargadoFrom > 0 OR @esEncargadoTo > 0) AND ESD.idStatusESDetalle IN( 3, 4, 0 ) THEN
					CONCAT( ' - Inv: ', REPLACE( CAST( ROUND( IFNULL( S.cantidad ,0) - IFNULL( S.cantidadBlock ,0) ,2) AS CHAR(12) ) , '.00', '') )
					ELSE '' END
			) AS articuloName
		, ROUND( IFNULL( ESD.cantidad ,0) ,2) AS cantidad
        , ROUND( IFNULL( ESD.cantidad ,0) ,2) AS cantidadOld
        , ROUND( IFNULL( ESD.cantidadEnviada ,0) ,2) AS cantidadEnviada
        , ROUND( IFNULL( ESD.cantidadEnviadaReal ,0) ,2) AS cantidadEnviadaReal
		, ROUND( IFNULL( ESD.cantidadRecibida ,0) ,2) AS cantidadRecibida
        , ROUND( IFNULL( ESD.cantidadRecibidaReal ,0) ,2) AS cantidadRecibidaReal
        
        , ESD.idStatusESDetalle
        , IFNULL( ESDS.name ,'') AS statusESDetalleName
        
        , CASE WHEN ( @esEncargadoFrom > 0 OR @esEncargadoTo > 0) THEN ROUND( IFNULL( S.cantidad ,0) - IFNULL( S.cantidadBlock ,0) ,2) ELSE 0 END AS canInv
        
        , CASE WHEN @esEncargadoFrom > 0 THEN 1 ELSE 0 END AS esEncargado
        
    FROM entradas_salidas_detalle AS ESD
    INNER JOIN entradas_salidas_header AS ESH ON ESH.idEntradasSalidasH = ESD.idEntradasSalidasH
	INNER JOIN productos AS P ON P.active = 1 AND P.idProducto = ESD.idProducto
	INNER JOIN cat_tipo_producto AS CTP ON CTP.active = 1 AND CTP.idCatTipoProducto = P.idCatTipoProducto
	INNER JOIN cat_descripciones AS CD ON CD.active = 1 AND CD.idDescription = P.idDescription
	INNER JOIN cat_unidad_medida AS UM ON UM.active = 1 AND UM.idUnidadMedida = P.idUnidadMedida
    LEFT JOIN entradas_salidas_detalle_status AS ESDS ON ESDS.idStatusESDetalle = ESD.idStatusESDetalle
    
    LEFT JOIN stock AS S
    ON
		S.idOrigen = @idOrigenFrom
		AND S.idProducto = P.idProducto
	
	WHERE
		ESD.idEntradasSalidasH = p_idEntradasSalidasH
		
    ORDER BY ESD.idEntradasSalidasDetalle DESC;
	
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getEntradasSalidasPaginado` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getEntradasSalidasPaginado`(
IN p_startDate VARCHAR(50)
, IN p_endDate VARCHAR(50)
, IN p_idCatMov BIGINT
, IN p_idEntradaSalidaStatus BIGINT
, IN p_idOrigenFrom BIGINT
, IN p_idOrigenTo BIGINT

, IN p_search VARCHAR(500)
, IN p_start INT
, IN p_limiter INT
, IN p_idUserLogON BIGINT
)
BEGIN

SET SESSION TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;

	SET @iRows = 0;
	
	SET @iRows = ( SELECT
					COUNT(*)
					FROM entradas_salidas_header AS ESH
					INNER JOIN cat_mov_entrada_salida AS CMES ON CMES.idCatMov = ESH.idCatMov
					INNER JOIN users AS U ON U.idUser = ESH.idCreateUser
					INNER JOIN entradas_salidas_status AS ESS ON ESS.idEntradaSalidaStatus = ESH.idEntradaSalidaStatus
					INNER JOIN origenes AS OFrom ON OFrom.idOrigen = ESH.idOrigenFrom
					INNER JOIN cat_relacion_origen AS CROFrom ON CROFrom.idCatRelacionOrigen = OFrom.idCatRelacionOrigen
					LEFT JOIN origenes AS OTo ON OTo.idOrigen = ESH.idOrigenTo
					LEFT JOIN cat_relacion_origen AS CROTo ON CROTo.idCatRelacionOrigen = OTo.idCatRelacionOrigen
					WHERE
						(
							p_startDate = ''
							OR
							(
								CAST( ESH.createDate AS DATE ) >= CAST( p_startDate AS DATE )
								AND CAST( ESH.createDate AS DATE ) <= CAST( p_endDate AS DATE )
							)
						)
						AND
						(
							p_idCatMov = 0
							OR ESH.idCatMov = p_idCatMov
						)
						AND
						(
							p_idEntradaSalidaStatus = 0
							OR ESH.idEntradaSalidaStatus = p_idEntradaSalidaStatus
						)
						AND
						(
							p_idOrigenFrom = 0
							OR ESH.idOrigenFrom = p_idOrigenFrom
						)
						AND
						(
							p_idOrigenTo = 0
							OR ESH.idOrigenTo = p_idOrigenTo
						)
	);

    SELECT
	
        @iRows AS iRows
        , ESH.idEntradasSalidasH
        , ESH.createDate
		
		, ESH.idCatMov
		, CONCAT(
			CMES.description
			, CASE WHEN ESH.idCatMov = 3 THEN
					CONCAT(
					' De: ', CONCAT( IFNULL( CROFrom.abreviatura ,'')
								, '-', CAST( OFrom.idOrigen AS CHAR(12) )
								, '-', OFrom.nombre )
								,
					' - A: ', CONCAT( IFNULL( CROTo.abreviatura ,'')
								, '-', CAST( OTo.idOrigen AS CHAR(12) )
								, '-', OTo.nombre
								)
					)
					WHEN ESH.idCatMov = 4 THEN
					CONCAT(
					' A: ', CONCAT( IFNULL( CROFrom.abreviatura ,'')
								, '-', CAST( OFrom.idOrigen AS CHAR(12) )
								, '-', OFrom.nombre )
					)
					WHEN ESH.idCatMov = 5 THEN
					CONCAT(
					' De: ', CONCAT( IFNULL( CROFrom.abreviatura ,'')
								, '-', CAST( OFrom.idOrigen AS CHAR(12) )
								, '-', OFrom.nombre )
					)
					ELSE '' END
		
		) AS motivoName
		
		, ESH.idEntradaSalidaStatus
		, ESS.name AS entradaSalidaStatusName
		
		, ESH.idCreateUser
		, U.name AS createUserName
		
		, ESH.active
		
		, IFNULL(
		(
			SELECT
			COUNT(*)
			FROM entradas_salidas_detalle AS ESD
			WHERE
				ESD.idStatusESDetalle = 3 -- EN REVISIÓN
				AND ESD.idEntradasSalidasH = ESH.idEntradasSalidasH
		)
		,0) AS bHaveEnRevision
		
		, IFNULL(
		(
			SELECT
			COUNT(*)
			FROM entradas_salidas_detalle AS ESD
			WHERE
				ESD.cantidad != ESD.cantidadEnviadaReal
                AND ESD.idStatusESDetalle != 2
				AND IFNULL( ESD.cantidadEnviadaReal ,0) > 0
				AND ESD.idEntradasSalidasH = ESH.idEntradasSalidasH
		)
		,0) AS bHaveEnviosParciales
        
    FROM entradas_salidas_header AS ESH
	INNER JOIN cat_mov_entrada_salida AS CMES ON CMES.idCatMov = ESH.idCatMov
	INNER JOIN users AS U ON U.idUser = ESH.idCreateUser
	INNER JOIN entradas_salidas_status AS ESS ON ESS.idEntradaSalidaStatus = ESH.idEntradaSalidaStatus
	INNER JOIN origenes AS OFrom ON OFrom.idOrigen = ESH.idOrigenFrom
	INNER JOIN cat_relacion_origen AS CROFrom ON CROFrom.idCatRelacionOrigen = OFrom.idCatRelacionOrigen
	LEFT JOIN origenes AS OTo ON OTo.idOrigen = ESH.idOrigenTo
	LEFT JOIN cat_relacion_origen AS CROTo ON CROTo.idCatRelacionOrigen = OTo.idCatRelacionOrigen
    WHERE
		(
			p_startDate = ''
			OR
			(
				CAST( ESH.createDate AS DATE ) >= CAST( p_startDate AS DATE )
				AND CAST( ESH.createDate AS DATE ) <= CAST( p_endDate AS DATE )
			)
		)
		AND
		(
			p_idCatMov = 0
			OR ESH.idCatMov = p_idCatMov
		)
		AND
		(
			p_idEntradaSalidaStatus = 0
			OR ESH.idEntradaSalidaStatus = p_idEntradaSalidaStatus
		)
		AND
		(
			p_idOrigenFrom = 0
			OR ESH.idOrigenFrom = p_idOrigenFrom
		)
		AND
		(
			p_idOrigenTo = 0
			OR ESH.idOrigenTo = p_idOrigenTo
		)
		
    ORDER BY ESH.idEntradasSalidasH DESC
    LIMIT p_start, p_limiter;
	
SET SESSION TRANSACTION ISOLATION LEVEL REPEATABLE READ;
	
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getFamiliaByID` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getFamiliaByID`(
	IN p_idFamilia INT
)
BEGIN

    SELECT
        C.idFamilia,
        C.name,
        C.active,
		D.name AS departamentoDesc
    FROM cat_familias AS C
	LEFT JOIN cat_departamentos AS D ON D.idDepartamento = C.idDepartamento
	WHERE
		C.idFamilia = p_idFamilia
	;
        
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getFamiliasPaginado` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getFamiliasPaginado`(
IN p_search VARCHAR(500)
, IN p_start INT
, IN p_limiter INT
)
BEGIN

    SET @iRows = 0;

    SET @iRows = (
					SELECT COUNT(*)
					FROM cat_familias AS C
                    WHERE
					(
						p_search = ''
						OR C.name LIKE CONCAT('%', p_search, '%')
					)
				  );

    SELECT
        @iRows AS iRows,
        C.idFamilia,
        C.name AS familiaName,
        C.active,
		D.name AS departamentoName
    FROM cat_familias AS C
	LEFT JOIN cat_departamentos AS D ON D.idDepartamento = C.idDepartamento
    WHERE
	(
		p_search = ''
		OR C.name LIKE CONCAT('%', p_search, '%')
	)
    ORDER BY C.idFamilia ASC
    LIMIT p_start, p_limiter;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getFirtsSaleByIdCliente` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getFirtsSaleByIdCliente`(IN p_idCliente BIGINT)
BEGIN

	SELECT V.idVenta
	FROM ventas AS V
	WHERE
		V.active = 1
		AND V.idClienteDiElect = p_idCliente
	ORDER BY V.idVenta ASC
	LIMIT 1
	;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getFormasDePagoPorVenta` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getFormasDePagoPorVenta`(
    IN p_idVenta BIGINT
)
BEGIN

    SELECT
	MPD.efectivo
	, MPD.recibido
	, MPD.cambio
	, MPD.tarjeta
	, MPD.transferencia
	, MPD.total
	, MPD.referenciaTarjeta
	, MPD.referenciaTransferencia
    , MPD.cheque
    , MPD.fechaDeposito
    , MPD.dineroElectronico
	FROM metodos_pago_detalle AS MPD
	INNER JOIN pagos AS P ON P.idMetodosPagoDetalle = MPD.idMetodosPagoDetalle
	WHERE
		idVenta = p_idVenta
	;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getFormulaByProdBasePaginado` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getFormulaByProdBasePaginado`(
	IN p_idProductoBase BIGINT
	, IN p_search VARCHAR(500)
	, IN p_start INT
	, IN p_limiter INT
)
BEGIN

	DECLARE iRows INT DEFAULT 0;

    -- Contar filas
    SELECT COUNT(*) INTO iRows
    FROM formulas_prod_base AS FPB
	INNER JOIN productos AS P ON P.idProducto = FPB.idMateriaPrima
	INNER JOIN cat_tipo_producto AS CTP ON CTP.active = 1 AND CTP.idCatTipoProducto = P.idCatTipoProducto
	INNER JOIN cat_descripciones AS CD ON CD.active = 1 AND CD.idDescription = P.idDescription
	INNER JOIN cat_unidad_medida AS UM ON UM.active = 1 AND UM.idUnidadMedida = P.idUnidadMedida
	WHERE
		FPB.active = 1
		AND P.active = 1
		AND FPB.idProductoBase = p_idProductoBase
	;

	SELECT
	
		iRows AS iRows
		, FPB.idFormula
        , P.idProducto
		, CONCAT( IFNULL( CTP.abreviatura ,''), '-', CAST( P.idproductocategoria AS CHAR(12) ) , '-', IFNULL( CD.description ,''), ' ', REPLACE( CAST( P.valorMedida AS CHAR(12) ) , '.00', ''), ' ', IFNULL( UM.abreviatura ,'') ) AS articuloName
		, ROUND( FPB.cantidad ,3) AS cantidad
		, IFNULL( ROUND( P.costo ,2) ,0) AS costo
        
    FROM formulas_prod_base AS FPB
	INNER JOIN productos AS P ON P.idProducto = FPB.idMateriaPrima
	INNER JOIN cat_tipo_producto AS CTP ON CTP.active = 1 AND CTP.idCatTipoProducto = P.idCatTipoProducto
	INNER JOIN cat_descripciones AS CD ON CD.active = 1 AND CD.idDescription = P.idDescription
	INNER JOIN cat_unidad_medida AS UM ON UM.active = 1 AND UM.idUnidadMedida = P.idUnidadMedida
	WHERE
		FPB.active = 1
		AND P.active = 1
		AND FPB.idProductoBase = p_idProductoBase
    ORDER BY FPB.idFormula DESC
	LIMIT p_start, p_limiter;
	
SET SESSION TRANSACTION ISOLATION LEVEL REPEATABLE READ;
	
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getGiroByID` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getGiroByID`(
IN p_idGiro INT
)
BEGIN

	SELECT
	G.idGiro
	, G.createDate
	, G.name
	, G.active
	FROM giros AS G
	WHERE G.idGiro = p_idGiro;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getGirosPaginado` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getGirosPaginado`(
IN p_search VARCHAR(500)
, IN p_start INT
, IN p_limiter INT
)
BEGIN

        SET @iRows = 0;


        SET @iRows = ( SELECT
						COUNT(*)
						FROM giros as G
						WHERE
						(
								p_search = ''
								OR G.name LIKE CONCAT('%', p_search ,'%')
						)
        );

        SELECT
        @iRows AS iRows
        , G.idGiro
        , G.createDate
        , G.name
        , G.active
        FROM giros as G
        WHERE
        (
                p_search = ''
                OR G.name LIKE CONCAT('%', p_search ,'%')
        )
    ORDER BY G.idGiro DESC
        LIMIT p_start, p_limiter;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getIdOrigenByRelation` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getIdOrigenByRelation`(
IN p_idRelation BIGINT
, IN p_idCatRelacionOrigen BIGINT
)
BEGIN
	
	SELECT
	
		O.idOrigen
	
    FROM origenes AS O
	WHERE
		O.active = 1
		AND O.idRelacion = p_idRelation
		AND O.idCatRelacionOrigen = p_idCatRelacionOrigen
    ;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getIdVendedorByIDUser` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getIdVendedorByIDUser`(
	IN p_idUser BIGINT
)
BEGIN

	SELECT
	V.idVendedor
	FROM vendedores AS V
	WHERE
		V.idUser = p_idUser;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getImpresoraTicketsData` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getImpresoraTicketsData`(
    IN p_idSucursal BIGINT
)
BEGIN

    SELECT
	nombrenegocio, razonsocial, rfc, direccion, telefono, agradecimiento, infoadicional
	FROM impresora_tickets
	WHERE
		idSucursal = p_idSucursal
	;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getInsumosByProductosPaginado` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getInsumosByProductosPaginado`(
	IN p_idProducto BIGINT
)
BEGIN

SET SESSION TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;

	SELECT
	
		COUNT(*) AS iRows
		, FPB.keyx
        , P.idProducto
		, CONCAT( IFNULL( CTP.abreviatura ,''), '-', CAST( P.idproductocategoria AS CHAR(12) ) , '-', IFNULL( CD.description ,''), ' ', REPLACE( CAST( P.valorMedida AS CHAR(12) ) , '.00', ''), ' ', IFNULL( UM.abreviatura ,'') ) AS articuloName
        , IFNULL( P.costo ,0) AS costo
        
    FROM insumos_productos AS FPB
	INNER JOIN productos AS P ON P.idProducto = FPB.idInsumo
	INNER JOIN cat_tipo_producto AS CTP ON CTP.active = 1 AND CTP.idCatTipoProducto = P.idCatTipoProducto
	INNER JOIN cat_descripciones AS CD ON CD.active = 1 AND CD.idDescription = P.idDescription
	INNER JOIN cat_unidad_medida AS UM ON UM.active = 1 AND UM.idUnidadMedida = P.idUnidadMedida
	WHERE
		FPB.active = 1
		AND P.active = 1
		AND FPB.idProducto = p_idProducto
	GROUP BY
		FPB.keyx
        , P.idproductocategoria
        , P.idProducto
        , CTP.abreviatura
		, CD.description
		, P.valorMedida
		, UM.abreviatura
    ORDER BY FPB.keyx DESC;
	
SET SESSION TRANSACTION ISOLATION LEVEL REPEATABLE READ;
	
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getInventarioFisicoByID` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getInventarioFisicoByID`(
    IN p_idInventarioFisico BIGINT
)
BEGIN
    SELECT 
        inf.idInventarioFisico,
        inf.createDate,
        inf.active,
        inf.idCreateUser,
        uCreador.name AS creadoPor,
        inf.idOrigen,
        o.nombre AS origenName,
        CONCAT(IFNULL(cro.abreviatura, ''), '-', CAST(o.idOrigen AS CHAR(12)), '-', o.nombre) AS origenFullName,
		DATE_FORMAT(inf.fechaInicio, '%d/%m/%Y') AS fechaInicioDate,
        DATE_FORMAT(inf.fechaInicio, '%H:%i:%s') AS fechaInicioHours,
		DATE_FORMAT(inf.fechaCierre, '%d/%m/%Y') AS fechaCierreDate,
        DATE_FORMAT(inf.fechaCierre, '%H:%i:%s') AS fechaCierreHours,
        inf.idStatus,
        CASE 
            WHEN inf.idStatus = 1 THEN 'Pendiente'
            WHEN inf.idStatus = 2 THEN 'En Proceso'
            WHEN inf.idStatus = 3 THEN 'Cerrado'
            WHEN inf.idStatus = 4 THEN 'Cancelado'
            ELSE 'Desconocido'
        END AS statusDesc,
        inf.observaciones
    FROM inventario_fisico AS inf
    INNER JOIN origenes AS o ON o.idOrigen = inf.idOrigen
    INNER JOIN cat_relacion_origen AS cro ON cro.idCatRelacionOrigen = o.idCatRelacionOrigen
    INNER JOIN users AS uCreador ON uCreador.idUser = inf.idCreateUser
    WHERE inf.idInventarioFisico = p_idInventarioFisico;
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getInventarioFisicoDetalle` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getInventarioFisicoDetalle`(
    IN p_idInventarioFisico BIGINT,
	IN p_bFaltante SMALLINT,
    IN p_bSobrante SMALLINT,
    IN p_bAllOK SMALLINT,
	IN p_idUnidadMedida INT,
	IN p_valorMedida VARCHAR(20),
	IN p_idDepartamento INT,
	IN p_idFamilia INT,
    IN p_start INT,
    IN p_limiter INT
)
BEGIN
    
    SET @iRows = 0;
    
    SET @iRows = (
        SELECT COUNT(*)
        FROM inventario_fisico_detalle AS IFD
		INNER JOIN productos AS P ON P.active = 1 AND P.idProducto = IFD.idProducto
		INNER JOIN cat_familias AS F ON F.idFamilia = P.idFamilia
        WHERE IFD.idInventarioFisico = p_idInventarioFisico
		AND (
			-- Si ninguna bandera está activada, devolver todo
			(p_bFaltante = 0 AND p_bSobrante = 0 AND p_bAllOK = 0)
			-- Si hay alguna bandera activada, devolver filas que cumplan cualquiera de las activadas
			OR (p_bFaltante = 1 AND IFD.diferencia < 0)
			OR (p_bSobrante  = 1 AND IFD.diferencia > 0)
			OR (p_bAllOK     = 1 AND IFD.diferencia = 0)
		)
		AND
		(
			p_idDepartamento = 0
			OR F.idDepartamento = p_idDepartamento
		)
		AND
		(
			p_idFamilia = 0
			OR P.idFamilia = p_idFamilia
		)
		AND
		(
			p_idUnidadMedida = 0
			OR P.idUnidadMedida = p_idUnidadMedida
		)
        AND
		(
			p_valorMedida = ''
			OR P.valorMedida = p_valorMedida
		)
    );
    
    -- Resultados paginados
    SELECT 
        @iRows AS iRows,
        ifd.keyx,
        ifd.createDate,
        ifd.idInventarioFisico,
        ifd.idCreateUser,
        ifd.fechaConteo,
        DATE_FORMAT(ifd.fechaConteo, '%d/%m/%Y %H:%i:%s') AS fechaConteoFormat,
        ifd.idProducto,
        CONCAT( IFNULL( CTP.abreviatura ,''), '-', CAST( P.idproductocategoria AS CHAR(12) ) , '-', IFNULL( CD.description ,''), ' ', REPLACE( CAST( P.valorMedida AS CHAR(12) ) , '.00', ''), ' ', IFNULL( UM.abreviatura ,'') ) AS articuloName,
        ifd.cantidadSistema,
        ifd.cantidadFisica,
        ifd.diferencia,
        ifd.precio,
        ifd.total,
        ifd.totalFisico,
        ifd.observaciones
    FROM inventario_fisico_detalle AS ifd
    INNER JOIN productos AS P ON P.idProducto = ifd.idProducto
	INNER JOIN cat_familias AS F ON F.idFamilia = P.idFamilia
    INNER JOIN cat_tipo_producto AS CTP ON CTP.active = 1 AND CTP.idCatTipoProducto = P.idCatTipoProducto
	INNER JOIN cat_descripciones AS CD ON CD.active = 1 AND CD.idDescription = P.idDescription
	INNER JOIN cat_unidad_medida AS UM ON UM.active = 1 AND UM.idUnidadMedida = P.idUnidadMedida
    WHERE ifd.idInventarioFisico = p_idInventarioFisico
	AND (
		-- Si ninguna bandera está activada, devolver todo
		(p_bFaltante = 0 AND p_bSobrante = 0 AND p_bAllOK = 0)
		-- Si hay alguna bandera activada, devolver filas que cumplan cualquiera de las activadas
		OR (p_bFaltante = 1 AND diferencia < 0)
		OR (p_bSobrante  = 1 AND diferencia > 0)
		OR (p_bAllOK     = 1 AND diferencia = 0)
	)
	AND
	(
		p_idDepartamento = 0
		OR F.idDepartamento = p_idDepartamento
	)
	AND
	(
		p_idFamilia = 0
		OR P.idFamilia = p_idFamilia
	)
	AND
	(
		p_idUnidadMedida = 0
		OR P.idUnidadMedida = p_idUnidadMedida
	)
	AND
	(
		p_valorMedida = ''
		OR P.valorMedida = p_valorMedida
	)
    ORDER BY ifd.idProducto ASC
    LIMIT p_start, p_limiter;
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getInventariosFisicosPaginado` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getInventariosFisicosPaginado`(
    IN p_startDate VARCHAR(50),
    IN p_endDate VARCHAR(50),
    IN p_idOrigen BIGINT,
    IN p_idStatus INT,
	IN p_bFaltante SMALLINT,
    IN p_bSobrante SMALLINT,
    IN p_bAllOK SMALLINT,
    IN p_start INT,
    IN p_limiter INT,
    IN p_idUserLogON BIGINT
)
BEGIN

    -- Calcular total de registros
    SET @iRows = 0;
    
    SET @iRows = (
        SELECT COUNT(*)
        FROM inventario_fisico AS inf
        INNER JOIN origenes AS o ON o.idOrigen = inf.idOrigen
        INNER JOIN cat_relacion_origen AS cro ON cro.idCatRelacionOrigen = o.idCatRelacionOrigen
        WHERE inf.active = 1
            AND (
                p_startDate = ''
                OR (
                    CAST(inf.fechaInicio AS DATE) >= CAST(p_startDate AS DATE)
                    AND CAST(inf.fechaInicio AS DATE) <= CAST(p_endDate AS DATE)
                )
            )
            AND (
                p_idOrigen = 0
                OR inf.idOrigen = p_idOrigen
            )
            AND (
                p_idStatus = 0
                OR inf.idStatus = p_idStatus
            )
            AND (
                p_bFaltante = 0
                OR inf.bFaltante = 1
            )
            AND (
                p_bSobrante = 0
                OR inf.bSobrante = 1
            )
            AND (
                p_bAllOK = 0
                OR inf.bAllOK = 1
            )
    );
    
    -- Query principal con resultados paginados
    SELECT 
        @iRows AS iRows,
        inf.idInventarioFisico,
        inf.createDate,
        DATE_FORMAT(inf.createDate, '%d/%m/%Y') AS createDateDate,
        DATE_FORMAT(inf.createDate, '%H:%i:%s') AS createDateHours,
        inf.active,
        inf.idCreateUser,
        CONCAT(uCreador.name) AS creadoPor,
        inf.idOrigen,
        CONCAT(IFNULL(cro.abreviatura, ''), '-', CAST(o.idOrigen AS CHAR(12)), '-', o.nombre) AS origenName,
        inf.fechaInicio,
        DATE_FORMAT(inf.fechaInicio, '%d/%m/%Y') AS fechaInicioDate,
        DATE_FORMAT(inf.fechaInicio, '%H:%i:%s') AS fechaInicioHours,
        inf.fechaCierre,
        DATE_FORMAT(inf.fechaCierre, '%d/%m/%Y') AS fechaCierreDate,
        DATE_FORMAT(inf.fechaCierre, '%H:%i:%s') AS fechaCierreHours,
        inf.idStatus,
        CASE 
            WHEN inf.idStatus = 1 THEN 'Pendiente'
            WHEN inf.idStatus = 2 THEN 'En Proceso'
            WHEN inf.idStatus = 3 THEN 'Cerrado'
            WHEN inf.idStatus = 4 THEN 'Cancelado'
            ELSE 'Desconocido'
        END AS statusDesc,
        inf.observaciones,
        CASE 
            WHEN inf.idStatus IN (1, 2) THEN 1
            ELSE 0
        END AS puedeEliminar,
        CASE 
            WHEN inf.idStatus IN (1, 2) THEN 1
            ELSE 0
        END AS puedeEditar,
        
        inf.bFaltante,
        inf.bSobrante,
        inf.bAllOK
        
    FROM inventario_fisico AS inf
    INNER JOIN origenes AS o ON o.idOrigen = inf.idOrigen
    INNER JOIN cat_relacion_origen AS cro ON cro.idCatRelacionOrigen = o.idCatRelacionOrigen
    INNER JOIN users AS uCreador ON uCreador.idUser = inf.idCreateUser
    WHERE inf.active = 1
        AND (
			p_startDate = ''
			OR (
				CAST(inf.fechaInicio AS DATE) >= CAST(p_startDate AS DATE)
				AND CAST(inf.fechaInicio AS DATE) <= CAST(p_endDate AS DATE)
			)
		)
		AND (
			p_idOrigen = 0
			OR inf.idOrigen = p_idOrigen
		)
		AND (
			p_idStatus = 0
			OR inf.idStatus = p_idStatus
		)
		AND (
			p_bFaltante = 0
			OR inf.bFaltante = 1
		)
		AND (
			p_bSobrante = 0
			OR inf.bSobrante = 1
		)
		AND (
			p_bAllOK = 0
			OR inf.bAllOK = 1
		)
    ORDER BY inf.idInventarioFisico DESC
    LIMIT p_start, p_limiter;
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getLastVentaByType` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getLastVentaByType`(IN p_idType INT, IN p_idCaja INT)
BEGIN

	SET @idVenta = 0;

	SELECT
		V.idVenta INTO @idVenta
	FROM ventas AS V
	INNER JOIN clientes AS C ON C.idCliente = V.idCliente
	INNER JOIN cat_tipo_cliente AS TC ON TC.idTipoCliente = C.idTipoCliente
	
	WHERE
		V.bClosed = 0
		AND V.idCaja = p_idCaja
		AND
		(
			(
				p_idType = 1
				AND TC.idTipoCliente = 1
			)
			OR
			(
				p_idType <> 1
				AND TC.idTipoCliente <> 1
			)
		)
	ORDER BY idVenta DESC
	LIMIT 1
	;
	
	SELECT IFNULL( @idVenta ,0) AS idVenta;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getMenuDetailsByPermission` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getMenuDetailsByPermission`(
IN p_idUser BIGINT
, IN p_idMenuPadre BIGINT
)
BEGIN

SET SESSION TRANSACTION ISOLATION LEVEL READ UNCOMMITTED ;
	
	SELECT *
	FROM
	(
		SELECT
		M.idMenu
		,M.idMenuPadre
		,M.lugar
		,M.name
		,M.description
		,M.icon
		,M.linkCat
		,M.linkList
		,M.imgDash
		,M.imgDashSize
		FROM menus AS M
		INNER JOIN menupermisos AS MP
			ON
				M.idMenu = MP.idMenu
				AND MP.typeRelation = 'R'
                
        INNER JOIN user_roles AS UR
			ON
				UR.idRol = MP.idRelation
				
		INNER JOIN users AS U
			ON
				U.idUser = UR.idUser
                
		WHERE
			M.active = 1
			AND M.idAplication = 1
			AND M.idMenuPadre > 0
			AND MP.active = 1
			AND U.idUser = p_idUser
			AND M.idMenuPadre = p_idMenuPadre
		
		UNION
		
		SELECT
		M.idMenu
		,M.idMenuPadre
		,M.lugar
		,M.name
		,M.description
		,M.icon
		,M.linkCat
		,M.linkList
		,M.imgDash
		,M.imgDashSize
		FROM menus AS M
		INNER JOIN menupermisos AS MP
			ON
				M.idMenu = MP.idMenu
                AND MP.typeRelation = 'U'
                
		WHERE
			M.active = 1
			AND M.idAplication = 1
			AND M.idMenuPadre > 0
			AND MP.active = 1
			AND MP.idRelation = p_idUser
			AND M.idMenuPadre = p_idMenuPadre
		
	) AS subquery
	ORDER BY idMenuPadre, lugar ASC;
		

 SET SESSION TRANSACTION ISOLATION LEVEL REPEATABLE READ ;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getMenuDetailsForPermission` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getMenuDetailsForPermission`(
IN p_idMenuPadre BIGINT
, IN p_relationType VARCHAR(5)
, IN p_idRelation BIGINT
)
BEGIN

SET SESSION TRANSACTION ISOLATION LEVEL READ UNCOMMITTED ;
	
	SELECT
	M.idMenu
	,M.idMenuPadre
	,M.lugar
	,M.name
	,M.description
	,M.icon
	,M.linkCat
	,M.linkList
	,M.imgDash
	,M.imgDashSize
	,IFNULL(
	(
		SELECT
		1
		FROM menupermisos AS MP
		WHERE
			MP.active = 1
			AND MP.typeRelation = p_relationType
			AND MP.idRelation = p_idRelation
			AND MP.idMenu = M.idMenu
	), 0) AS bPermissionMenu
	FROM menus AS M
	WHERE
		M.active = 1
		AND M.idAplication = 1
		AND M.idMenuPadre > 0
		AND M.idMenuPadre = p_idMenuPadre
	ORDER BY idMenuPadre, lugar ASC;

 SET SESSION TRANSACTION ISOLATION LEVEL REPEATABLE READ ;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getMenuFathersByPermission` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getMenuFathersByPermission`(
IN p_idUser BIGINT
)
BEGIN

SET SESSION TRANSACTION ISOLATION LEVEL READ UNCOMMITTED ;
	
	SELECT DISTINCT *
	FROM
	(
		SELECT
		MPadre.idMenu
		,MPadre.lugar
		,MPadre.name
		,MPadre.icon
		FROM menus AS MPadre
		INNER JOIN menus AS M
			ON
				MPadre.idMenu = M.idMenuPadre
				
		INNER JOIN menupermisos AS MP
			ON
				M.idMenu = MP.idMenu
				AND MP.typeRelation = 'R'
				
		INNER JOIN user_roles AS UR
			ON
				UR.idRol = MP.idRelation
				
		INNER JOIN users AS U
			ON
				U.idUser = UR.idUser
				
		WHERE
			M.active = 1
			AND M.idAplication = 1
			AND MPadre.idMenuPadre = 0
			AND MP.active = 1
			AND U.idUser = p_idUser
		
		UNION
		
		SELECT
		MPadre.idMenu
		,MPadre.lugar
		,MPadre.name
		,MPadre.icon
		FROM menus AS MPadre
		INNER JOIN menus AS M
			ON
				MPadre.idMenu = M.idMenuPadre
				
		INNER JOIN menupermisos AS MP
			ON
				M.idMenu = MP.idMenu
				AND MP.typeRelation = 'U'
				
		WHERE
			M.active = 1
			AND M.idAplication = 1
			AND MPadre.idMenuPadre = 0
			AND MP.active = 1
			AND MP.idRelation = p_idUser
	) AS subquery
	ORDER BY lugar;

 SET SESSION TRANSACTION ISOLATION LEVEL REPEATABLE READ ;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getMenuFathersForPermission` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getMenuFathersForPermission`()
BEGIN

SET SESSION TRANSACTION ISOLATION LEVEL READ UNCOMMITTED ;
	
	SELECT DISTINCT
	MPadre.idMenu
	,MPadre.lugar
	,MPadre.name
	,MPadre.icon
	FROM menus AS MPadre
	WHERE
		MPadre.active = 1
		AND MPadre.idAplication = 1
		AND MPadre.idMenuPadre = 0
    ORDER BY MPadre.lugar ASC
	;

SET SESSION TRANSACTION ISOLATION LEVEL REPEATABLE READ ;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getMetodoPagoBySale` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getMetodoPagoBySale`(
	IN p_idVenta BIGINT
)
BEGIN

	SELECT 
		mpd.*
	FROM 
		pagos p
	INNER JOIN 
		metodos_pago_detalle mpd ON p.idMetodosPagoDetalle = mpd.idMetodosPagoDetalle
	WHERE 
		p.idVenta = p_idVenta;

 END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getOrdenCompraByID` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getOrdenCompraByID`(IN p_idOrdenDeCompra BIGINT)
BEGIN
    SET SESSION TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;

	SELECT
	
        OO.idOrdenDeCompra
        , OO.createDate
		, OO.idProveedor
		, P.nombre AS proveedorName
		, OO.idOrdenCompraStatus
		, OCS.name AS ordenCompraStatusName
		, OO.costoTotal
		, OO.fechaPedido
		, OO.fechaRecepcion
		, OO.numeroFactura
		, OO.active
		
    FROM orden_compra AS OO
	INNER JOIN proveedores AS P ON OO.idProveedor = P.idProveedor
	INNER JOIN orden_compra_status AS OCS ON OO.idOrdenCompraStatus = OCS.idOrdenCompraStatus
    WHERE
		OO.idOrdenDeCompra = p_idOrdenDeCompra;

    SET SESSION TRANSACTION ISOLATION LEVEL REPEATABLE READ;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getOrdenCompraDetailList` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getOrdenCompraDetailList`(
	IN p_idOrdenDeCompra BIGINT
)
BEGIN

SET SESSION TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;

	SELECT
	
		COUNT(*) AS iRows
		, OCD.idOrdenDeCompraDetalle
        , P.idProducto
		, CONCAT( IFNULL( CTP.abreviatura ,''), '-', CAST( P.idproductocategoria AS CHAR(12) ) , '-', IFNULL( CD.description ,''), ' ', REPLACE( CAST( P.valorMedida AS CHAR(12) ) , '.00', ''), ' ', IFNULL( UM.abreviatura ,'') ) AS articuloName
		, ROUND( OCD.cantidad ,2) AS cantidad
		, ROUND( OCD.costo ,2) AS costo
		, ROUND( OCD.importe ,2) AS importe
        
        , ROUND( OC.costoTotal ,2) AS costoTotal
        
    FROM orden_compra_detalle AS OCD
    INNER JOIN orden_compra AS OC ON OC.idOrdenDeCompra = OCD.idOrdenDeCompra
	INNER JOIN productos AS P ON P.active = 1 AND P.idProducto = OCD.idProducto
	INNER JOIN cat_tipo_producto AS CTP ON CTP.active = 1 AND CTP.idCatTipoProducto = P.idCatTipoProducto
	INNER JOIN cat_descripciones AS CD ON CD.active = 1 AND CD.idDescription = P.idDescription
	INNER JOIN cat_unidad_medida AS UM ON UM.active = 1 AND UM.idUnidadMedida = P.idUnidadMedida
	
	WHERE
		OCD.active = 1
		AND OCD.idOrdenDeCompra = p_idOrdenDeCompra
        
	GROUP BY
		OCD.idOrdenDeCompraDetalle
        , P.idProducto
		, CTP.abreviatura
		, CD.description
		, P.valorMedida
		, UM.abreviatura
		, OCD.cantidad
		, OCD.costo
		, OCD.importe
        
        , OC.costoTotal
    ORDER BY OCD.idOrdenDeCompraDetalle DESC;
	
SET SESSION TRANSACTION ISOLATION LEVEL REPEATABLE READ;
	
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getOrdenesCompraListWithPage` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getOrdenesCompraListWithPage`(
IN p_startDate VARCHAR(50)
, IN p_endDate VARCHAR(50)
, IN p_idProveedor BIGINT
, IN p_folio VARCHAR(50)
, IN p_start INT
, IN p_limiter INT
, IN p_idUserLogON BIGINT
)
BEGIN

	-- **********************************************************************************************************
	-- SECCIÓN DE PERMISOS DE ACCIONES
	
	DROP TEMPORARY TABLE IF EXISTS actionsList;
	
	CREATE TEMPORARY TABLE actionsList (
		id BIGINT AUTO_INCREMENT,
		idAction BIGINT,
		name VARCHAR(5000),
		PRIMARY KEY(id)
	) ENGINE=InnoDB;
	
	INSERT INTO actionsList( idAction, name )
	SELECT DISTINCT
	A.idAction
	, A.name
	FROM actions AS A
	INNER JOIN actionsconf AS AC ON AC.active = 1 AND relationType = 'R' AND A.idAction = AC.idAction
	INNER JOIN user_roles AS RC ON AC.idRelation = RC.idRol
	INNER JOIN users AS U ON RC.idUser = U.idUser
	WHERE A.active = 1
	AND U.idUser = P_idUserLogON
	;
	
	INSERT INTO actionsList( idAction, name )
	SELECT DISTINCT
	A.idAction
	, A.name
	FROM actions AS A
	INNER JOIN actionsconf AS AC ON AC.active = 1 AND AC.relationType = 'U' AND A.idAction = AC.idAction
	INNER JOIN users AS U ON AC.idRelation = U.idUser
	WHERE A.active = 1
	AND U.idUser = P_idUserLogON
	;
	
	SET @OC_ViewAll = 0;
	
	SET @OC_ViewAll = ( SELECT COUNT(*) FROM actionsList WHERE name = 'OC_ViewAll' );
	
	-- **********************************************************************************************************

	SET @iRows = 0;
	
	SET @iRows = (
	SELECT
	COUNT(*)
	FROM orden_compra AS OO
	INNER JOIN proveedores AS P ON OO.idProveedor = P.idProveedor
	INNER JOIN users AS U ON U.idUser = OO.idCreateUser
	INNER JOIN orden_compra_status AS OCS ON OO.idOrdenCompraStatus = OCS.idOrdenCompraStatus
    WHERE
		(
			p_idProveedor = 0
			OR OO.idProveedor = p_idProveedor
		)
		AND
		(
			p_folio = 0
			OR OO.idOrdenDeCompra = p_folio
		)
		AND
		(
			p_startDate = ''
			OR
			(
				CAST( OO.createDate AS DATE ) >= CAST( p_startDate AS DATE )
				AND CAST( OO.createDate AS DATE ) <= CAST( p_endDate AS DATE )
			)
		)
		AND
		(
			@OC_ViewAll > 0
			OR OO.idCreateUser = p_idUserLogON
		)
	);

    SELECT
	
        @iRows AS iRows
        , OO.idOrdenDeCompra
        , OO.createDate
		, OO.idProveedor
		, P.nombre AS proveedorName
		, OO.idOrdenCompraStatus
		, OCS.name AS ordenCompraStatusName
		, OO.costoTotal
		, OO.idCreateUser
		, U.name AS createUserName
		, OO.active
        
        , 1 AS mostrarAcciones
		
    FROM orden_compra AS OO
	INNER JOIN proveedores AS P ON OO.idProveedor = P.idProveedor
	INNER JOIN users AS U ON U.idUser = OO.idCreateUser
	INNER JOIN orden_compra_status AS OCS ON OO.idOrdenCompraStatus = OCS.idOrdenCompraStatus
    WHERE
		(
			p_idProveedor = 0
			OR OO.idProveedor = p_idProveedor
		)
		AND
		(
			p_folio = 0
			OR OO.idOrdenDeCompra = p_folio
		)
		AND
		(
			p_startDate = ''
			OR
			(
				CAST( OO.createDate AS DATE ) >= CAST( p_startDate AS DATE )
				AND CAST( OO.createDate AS DATE ) <= CAST( p_endDate AS DATE )
			)
		)
		AND
		(
			@OC_ViewAll > 0
			OR OO.idCreateUser = p_idUserLogON
		)
		
	GROUP BY
		OO.idOrdenDeCompra
        , OO.createDate
		, OO.idProveedor
		, P.nombre
		, OO.idOrdenCompraStatus
		, OCS.name
		, OO.costoTotal
		, OO.active
    ORDER BY OO.idOrdenDeCompra DESC
    LIMIT p_start, p_limiter;
	
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getOrigenesByIdUser` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getOrigenesByIdUser`(
	IN p_idUser BIGINT
)
BEGIN

SET SESSION TRANSACTION ISOLATION LEVEL READ UNCOMMITTED ;
	
	SELECT
		OC.createDate
		, O.idOrigen
		, CONCAT( IFNULL( CROFrom.abreviatura ,''), '-', CAST( O.idOrigen AS CHAR(12) ), '-', O.nombre ) AS origenName
        , IFNULL( OC.bPrincipal ,0) AS bPrincipal
	FROM origenes as O
	INNER JOIN cat_relacion_origen AS CROFrom ON CROFrom.idCatRelacionOrigen = O.idCatRelacionOrigen
	INNER JOIN origenes_config AS OC ON OC.idOrigen = O.idOrigen
	WHERE
		O.active = 1
		AND OC.idUser = p_idUser
    ORDER BY OC.keyx DESC;

 SET SESSION TRANSACTION ISOLATION LEVEL REPEATABLE READ ;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getOrigenesForAddUser` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getOrigenesForAddUser`(
IN p_search VARCHAR(500)
, IN p_idUser BIGINT
)
BEGIN

SET SESSION TRANSACTION ISOLATION LEVEL READ UNCOMMITTED ;
	
	SELECT
	O.idOrigen AS id
	, CONCAT( IFNULL( CROFrom.abreviatura ,''), '-', CAST( O.idOrigen AS CHAR(12) ), '-', O.nombre ) AS text
	FROM origenes as O
	INNER JOIN cat_relacion_origen AS CROFrom ON CROFrom.idCatRelacionOrigen = O.idCatRelacionOrigen
	LEFT JOIN origenes_config AS OC ON OC.idUser = p_idUser AND OC.idOrigen = O.idOrigen
	WHERE
		O.active = 1
		AND OC.keyx IS NULL
		AND
		(
			p_search = ''
			OR CONCAT( IFNULL( CROFrom.abreviatura ,''), '-', CAST( O.idOrigen AS CHAR(12) ), '-', O.nombre ) LIKE CONCAT('%', p_search ,'%')
		)
    ORDER BY O.idOrigen DESC
	LIMIT 0, 5;

 SET SESSION TRANSACTION ISOLATION LEVEL REPEATABLE READ ;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getOrigenesResponsables` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getOrigenesResponsables`(
	IN p_idOrigen BIGINT
)
BEGIN

SET SESSION TRANSACTION ISOLATION LEVEL READ UNCOMMITTED ;

	SELECT
	
		ORR.idOrigenesResponsables
		, DATE_FORMAT( ORR.createDate, '%d-%m-%Y') AS createDateDate
		, DATE_FORMAT( ORR.createDate, '%h:%i:%s %p') AS createDateHours
		, U.name AS userName
		, ORR.bPrincipal
	
	FROM origenes_responsables AS ORR
	INNER JOIN users AS U ON U.idUser = ORR.idUser
	WHERE
		ORR.idOrigen = p_idOrigen
		
    ORDER BY ORR.idOrigenesResponsables ASC
	;

SET SESSION TRANSACTION ISOLATION LEVEL REPEATABLE READ ;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getPedidoByID` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getPedidoByID`(IN p_idPedido BIGINT)
BEGIN

	SELECT
	
        H.idPedido
        , H.createDate
		
		, DATE_FORMAT( H.createDate, '%d-%m-%Y') AS createDateDate
		, DATE_FORMAT( H.createDate, '%h:%i:%s %p') AS createDateHours
		
		, H.active
		
		, H.idSucursal AS idSucursalOld
		, H.idSucursal
        , SS.name AS sucursalName
		
		, H.idCliente AS idClienteOld
		, H.idCliente
		, C.nombre AS clienteName
        , IF( C.active = 0, ' - INACTIVO', '' ) AS statusCliente
		
        , H.idCatStatusPedidosClientes AS idCatStatusPedidosClientesOld
		, H.idCatStatusPedidosClientes
		, S.name AS catStatusPedidosClientesName
		
		, H.idRepartidor AS idRepartidorOld
		, H.idRepartidor
		, UR.name AS repartidorName
		
		, H.idTipoVenta AS idTipoVentaOld
		, H.idTipoVenta
		, CRV.name AS tipoVentaDesc
		
		, H.idCreateUser
		, U.name AS createUserName
		
		, H.active
		
		, IFNULL(
		(
			SELECT
			ROUND( SUM(total) ,2)
			FROM pedidos_clientes_detalle AS PCD
			WHERE
				PCD.idPedido = H.idPedido
		)
		,0) AS total
		
		, H.fechaEntrega
		, H.fechaEntregada
		
		, IFNULL( H.comments ,'') AS comments
		
		, C.idTipoCliente
        , IFNULL( TC.name ,'') AS tipoClienteDesc
		
		, IFNULL(
		(
			SELECT
			cantidad
			FROM pedidos_envases AS PE
			WHERE
				PE.idPedido = H.idPedido
				AND PE.valorMedida = 20
			LIMIT 1
		)
		,0) AS cantEnvases,
        
        IFNULL( idPedidoNuevo ,0) AS idPedidoNuevo
		
    FROM pedidos_clientes AS H
	INNER JOIN sucursales AS SS ON SS.idSucursal = H.idSucursal
	INNER JOIN clientes AS C ON C.idCliente = H.idCliente
    LEFT JOIN cat_tipo_cliente AS TC ON TC.idTipoCliente = C.idTipoCliente
	INNER JOIN cat_status_pedidos_clientes AS S ON S.idCatStatusPedidosClientes = H.idCatStatusPedidosClientes
	INNER JOIN users AS U ON U.idUser = H.idCreateUser
	LEFT JOIN users AS UR ON UR.idUser = H.idRepartidor
	LEFT JOIN cat_tipo_venta AS CRV ON CRV.idTipoVenta = H.idTipoVenta
    WHERE
		H.idPedido = p_idPedido
	;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getPedidoClienteDetalle` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getPedidoClienteDetalle`(
    IN p_idPedido BIGINT,
    IN p_idUserLogON BIGINT
)
BEGIN
    DECLARE v_idOrigen BIGINT DEFAULT 0;

    -- Obtener idOrigen
    SELECT O.idOrigen INTO v_idOrigen
    FROM origenes AS O
    INNER JOIN pedidos_clientes AS PC ON PC.idSucursal = O.idRelacion
    WHERE O.idCatRelacionOrigen = 1 -- SUCURSAL
      AND PC.idPedido = p_idPedido
    LIMIT 1;

    -- Consulta principal
    SELECT
        ESD.idPedidoDetalle,
        P.idProducto,
        CONCAT(
            IFNULL(CTP.abreviatura, ''),
            '-', CAST(P.idproductocategoria AS CHAR(12)),
            '-', IFNULL(CD.description, ''),
            ' ', REPLACE(CAST(P.valorMedida AS CHAR(12)), '.00', ''), ' ', IFNULL(UM.abreviatura, '')
        ) AS articuloName,
        P.valorMedida,
        P.idUnidadMedida,
        ESD.bEnvase,
        P.bEnvase AS bCanEnvase,
        ROUND(IFNULL(ESD.cantidad, 0), 2) AS cantidad,
        P.precio AS precioUnitarioOLD,
        ESD.precioUnitario,
        ESD.descuento,
        IFNULL(ESD.precioConDescuento, 0) AS precioConDescuento,
        ESD.total,
        IFNULL(ESD.aplicaPromo, 0) AS aplicaPromo,
        IFNULL(ESD.idPromocion, 0) AS idPromocion,
        IFNULL(ESD.promoName, '') AS promoName,
        IFNULL(P.idProductoRelacion, 0) AS idProductoRelacion,
        IFNULL(PR.precio, 0) AS productoRelacionPrecio,
        IFNULL(P.precioEcoAgr, 0) AS precioEcoAgr,
        IFNULL((
            SELECT ROUND( IFNULL( SS.cantidad ,0) - IFNULL( SS.cantidadBlock ,0) ,2)
            FROM stock AS SS
            WHERE
				SS.idOrigen = v_idOrigen
				AND SS.idProducto = P.idProducto
            LIMIT 1
        ), 0) AS canInv
    FROM pedidos_clientes_detalle AS ESD
    INNER JOIN productos AS P ON P.active = 1 AND P.idProducto = ESD.idProducto
    LEFT JOIN productos AS PR ON PR.active = 1 AND PR.idProducto = P.idProductoRelacion
    INNER JOIN cat_tipo_producto AS CTP ON CTP.active = 1 AND CTP.idCatTipoProducto = P.idCatTipoProducto
    INNER JOIN cat_descripciones AS CD ON CD.active = 1 AND CD.idDescription = P.idDescription
    INNER JOIN cat_unidad_medida AS UM ON UM.active = 1 AND UM.idUnidadMedida = P.idUnidadMedida
    WHERE ESD.idPedido = p_idPedido
    ORDER BY ESD.idPedidoDetalle DESC;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getPedidoClienteEnvases` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getPedidoClienteEnvases`(
	IN p_idPedido BIGINT
	, IN p_idUserLogON BIGINT
)
BEGIN

	SELECT
	
		idPedidosEnvases
        , idPedido
		, cantidad
        , valorMedida
        
    FROM pedidos_envases
	WHERE
		idPedido = p_idPedido;
	
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getPedidosClientesPaginado` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getPedidosClientesPaginado`(
    IN p_startDate VARCHAR(50),
    IN p_endDate VARCHAR(50),
    IN p_idCatStatusPedidosClientes INT,
    IN p_idTipoVenta INT,
    IN p_idRepartidor INT,
    IN p_idCliente INT,
    IN p_idPedidoSearch VARCHAR(50), -- <-- Nuevo parámetro
    IN p_search VARCHAR(500),
    IN p_start INT,
    IN p_limiter INT,
    IN p_idUserLogON BIGINT
)
BEGIN

    SET SESSION TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;

    SET @iRows = 0;

    SET @iRows = (
        SELECT COUNT(*)
        FROM pedidos_clientes AS H
        INNER JOIN users AS U ON U.idUser = H.idCreateUser
        INNER JOIN cat_status_pedidos_clientes AS ESS ON ESS.idCatStatusPedidosClientes = H.idCatStatusPedidosClientes
        INNER JOIN clientes AS C ON H.idCliente = C.idCliente
        LEFT JOIN users AS UR ON UR.idUser = H.idRepartidor
        LEFT JOIN cat_tipo_venta AS CRV ON CRV.idTipoVenta = H.idTipoVenta
        WHERE
            (p_startDate = '' OR DATE(H.createDate) >= DATE(p_startDate))
            AND (p_endDate = '' OR DATE(H.createDate) <= DATE(p_endDate))
            AND (p_idCatStatusPedidosClientes = 0 OR H.idCatStatusPedidosClientes = p_idCatStatusPedidosClientes)
            AND (p_idTipoVenta = 0 OR H.idTipoVenta = p_idTipoVenta)
            AND (p_idRepartidor = 0 OR H.idRepartidor = p_idRepartidor)
            AND (p_idCliente = 0 OR H.idCliente = p_idCliente)
            AND (p_idPedidoSearch = '' OR H.idPedido = p_idPedidoSearch)
    );

    SELECT
        @iRows AS iRows,
        H.idPedido,
        H.createDate,
        H.idSucursal,
        S.name AS sucursalName,
        H.idCliente,
        C.nombre AS clienteName,
        H.idCatStatusPedidosClientes,
        ESS.name AS catStatusPedidosClientesName,
        H.idRepartidor,
        UR.name AS repartidorName,
        H.idTipoVenta,
        CRV.name AS tipoVentaDesc,
        H.idCreateUser,
        U.name AS createUserName,
        H.active,
        IFNULL(
            (
                SELECT ROUND(SUM(total), 2)
                FROM pedidos_clientes_detalle AS PCD
                WHERE PCD.idPedido = H.idPedido
            ),
            0
        ) AS total,
        
        C.idTipoCliente,
        TC.name AS tipoClienteDesc,
        IFNULL( idPedidoNuevo ,0) AS idPedidoNuevo
        
        
    FROM pedidos_clientes AS H
    INNER JOIN sucursales AS S ON S.idSucursal = H.idSucursal
    INNER JOIN clientes AS C ON H.idCliente = C.idCliente
    LEFT JOIN cat_tipo_cliente AS TC ON C.idTipoCliente = TC.idTipoCliente
    INNER JOIN users AS U ON U.idUser = H.idCreateUser
    INNER JOIN cat_status_pedidos_clientes AS ESS ON ESS.idCatStatusPedidosClientes = H.idCatStatusPedidosClientes
    LEFT JOIN users AS UR ON UR.idUser = H.idRepartidor
    LEFT JOIN cat_tipo_venta AS CRV ON CRV.idTipoVenta = H.idTipoVenta
    WHERE
        (p_startDate = '' OR DATE(H.createDate) >= DATE(p_startDate))
        AND (p_endDate = '' OR DATE(H.createDate) <= DATE(p_endDate))
        AND (p_idCatStatusPedidosClientes = 0 OR H.idCatStatusPedidosClientes = p_idCatStatusPedidosClientes)
        AND (p_idTipoVenta = 0 OR H.idTipoVenta = p_idTipoVenta)
        AND (p_idRepartidor = 0 OR H.idRepartidor = p_idRepartidor)
        AND (p_idCliente = 0 OR H.idCliente = p_idCliente)
        AND (p_idPedidoSearch = '' OR H.idPedido = p_idPedidoSearch)
    ORDER BY H.idPedido DESC
    LIMIT p_start, p_limiter;

    SET SESSION TRANSACTION ISOLATION LEVEL REPEATABLE READ;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getPedidosPendientesPaginado` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getPedidosPendientesPaginado`(
    IN p_startDate VARCHAR(50),
    IN p_endDate VARCHAR(50),
    IN p_idPedidoSearch VARCHAR(50),
    IN p_idSucursal BIGINT,
    IN p_idVendedor BIGINT,
	IN p_idCliente BIGINT,
    IN p_search VARCHAR(500),
    IN p_start INT,
    IN p_limiter INT,
    IN p_idUserLogON BIGINT
)
BEGIN

    SET SESSION TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;

    SET @iRows = 0;

    SET @iRows = (
        SELECT COUNT(*)
        FROM pedidos_clientes AS H
        INNER JOIN users AS U ON U.idUser = H.idCreateUser
        INNER JOIN cat_status_pedidos_clientes AS ESS ON ESS.idCatStatusPedidosClientes = H.idCatStatusPedidosClientes
        INNER JOIN clientes AS C ON H.idCliente = C.idCliente
        WHERE
            (p_startDate = '' OR DATE(H.createDate) >= DATE(p_startDate))
            AND (p_endDate = '' OR DATE(H.createDate) <= DATE(p_endDate))
            AND (p_idSucursal = 0 OR H.idSucursal = p_idSucursal)
			AND (p_idVendedor = 0 OR C.idVendedor = p_idVendedor)
			AND (p_idCliente = 0 OR H.idCliente = p_idCliente)
            AND (p_idPedidoSearch = '' OR H.idPedido = p_idPedidoSearch)
            AND H.idCatStatusPedidosClientes = 3
    );

    SELECT
        @iRows AS iRows,
        H.idPedido,
        H.createDate,
        H.idSucursal,
        S.name AS sucursalName,
        H.idCliente,
        C.nombre AS clienteName,
        H.idCatStatusPedidosClientes,
        ESS.name AS catStatusPedidosClientesName,
        H.idRepartidor,
        UR.name AS repartidorName,
        H.idTipoVenta,
        CRV.name AS tipoVentaDesc,
        H.idCreateUser,
        U.name AS createUserName,
        H.active,
        IFNULL(
            (
                SELECT ROUND(SUM(total), 2)
                FROM pedidos_clientes_detalle AS PCD
                WHERE PCD.idPedido = H.idPedido
            ),
            0
        ) AS total,
        
        C.idTipoCliente,
        TC.name AS tipoClienteDesc
        
        
    FROM pedidos_clientes AS H
	INNER JOIN sucursales AS S ON S.idSucursal = H.idSucursal
    INNER JOIN clientes AS C ON H.idCliente = C.idCliente
    LEFT JOIN cat_tipo_cliente AS TC ON C.idTipoCliente = TC.idTipoCliente
    INNER JOIN users AS U ON U.idUser = H.idCreateUser
    INNER JOIN cat_status_pedidos_clientes AS ESS ON ESS.idCatStatusPedidosClientes = H.idCatStatusPedidosClientes
    LEFT JOIN users AS UR ON UR.idUser = H.idRepartidor
    LEFT JOIN cat_tipo_venta AS CRV ON CRV.idTipoVenta = H.idTipoVenta
    WHERE
        (p_startDate = '' OR DATE(H.createDate) >= DATE(p_startDate))
		AND (p_endDate = '' OR DATE(H.createDate) <= DATE(p_endDate))
		AND (p_idSucursal = 0 OR H.idSucursal = p_idSucursal)
		AND (p_idVendedor = 0 OR C.idVendedor = p_idVendedor)
		AND (p_idCliente = 0 OR H.idCliente = p_idCliente)
		AND (p_idPedidoSearch = '' OR H.idPedido = p_idPedidoSearch)
        AND H.idCatStatusPedidosClientes = 3
        
    ORDER BY H.idPedido DESC
    LIMIT p_start, p_limiter;

    SET SESSION TRANSACTION ISOLATION LEVEL REPEATABLE READ;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getPPBStock` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getPPBStock`(
	IN p_idProdProdBaseDetalle BIGINT
)
BEGIN

SET SESSION TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;

	SELECT
	IFNULL( S.idStock ,0) AS idStock
	, PPBS.bOK
	, DATE_FORMAT( S.createDate, '%d-%m-%Y') AS createDate
	, ROUND( IFNULL( PPBS.cantidadDisponible ,0) ,2) AS cantidadDisponible
	, ROUND( IFNULL( PPBS.cantidadConsumida ,0) ,2) AS cantidadConsumida
	, ROUND( IFNULL( PPBS.costoUnitario ,0) ,2) AS costoUnitario
	, ROUND( IFNULL( PPBS.costoTotal ,0) ,2) AS costoTotal
	, PPBS.idProducto AS idMateriaPrima
	, CONCAT( IFNULL( CTP.abreviatura ,''), '-', CAST( P.idproductocategoria AS CHAR(12) ) , '-', IFNULL( CD.description ,''), ' ', REPLACE( CAST( P.valorMedida AS CHAR(12) ) , '.00', ''), ' ', IFNULL( UM.abreviatura ,'') ) AS materiaPrimaName
    
    , IFNULL( S.idRelacionOperacion ,0) AS idRelacionOperacion
	
	FROM prod_prod_base_stock AS PPBS
	LEFT JOIN stocklog AS S ON PPBS.idStock = S.idStock
	INNER JOIN productos AS P ON P.idProducto = PPBS.idProducto
	INNER JOIN cat_tipo_producto AS CTP ON CTP.active = 1 AND CTP.idCatTipoProducto = P.idCatTipoProducto
	INNER JOIN cat_descripciones AS CD ON CD.active = 1 AND CD.idDescription = P.idDescription
	INNER JOIN cat_unidad_medida AS UM ON UM.active = 1 AND UM.idUnidadMedida = P.idUnidadMedida
	WHERE
		PPBS.idProdProdBaseDetalle = p_idProdProdBaseDetalle
	ORDER BY PPBS.keyx ASC
	;
	
SET SESSION TRANSACTION ISOLATION LEVEL REPEATABLE READ;
	
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getProdProdAgranelByID` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getProdProdAgranelByID`(
IN p_idProdProdAgranelH BIGINT
)
BEGIN

SET SESSION TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;

    SELECT
	
        PPB.idProdProdAgranelH
        , DATE_FORMAT( PPB.createDate, '%d-%m-%Y') AS createDateDate
		, DATE_FORMAT( PPB.createDate, '%h:%i:%s %p') AS createDateHours
		
		, PPB.idCatStatusProd
		, CSP.name AS catStatusProdName
		
		, IFNULL( PPB.costoTotal ,2) AS costoTotal
		
		, PPB.idCreateUser
		, U.name AS createUserName
		, PPB.active
        
    FROM prod_prod_agranel AS PPB
	INNER JOIN users AS U ON U.idUser = PPB.idCreateUser
	INNER JOIN cat_status_prod AS CSP ON CSP.idCatStatusProd = PPB.idCatStatusProd
    WHERE
		PPB.idProdProdAgranelH = p_idProdProdAgranelH
	;
	
SET SESSION TRANSACTION ISOLATION LEVEL REPEATABLE READ;
	
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getProdProdAgranelDetalle` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getProdProdAgranelDetalle`(
IN p_idProdProdAgranelH BIGINT
)
BEGIN

SET SESSION TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;

    SELECT
	
    PPBD.idProdProdAgranelDetalle
	, PPBD.idProductoAgranel
	, CONCAT( IFNULL( CTP.abreviatura ,''), '-', CAST( P.idproductocategoria AS CHAR(12) ) , '-', IFNULL( CD.description ,''), ' ', REPLACE( CAST( P.valorMedida AS CHAR(12) ) , '.00', ''), ' ', IFNULL( UM.abreviatura ,'') ) AS articuloName
	, PPBD.cantidad
	, PPBD.costo
	, PPBD.costoTotal
    
	FROM prod_prod_agranel_detalle AS PPBD
	INNER JOIN productos AS P ON P.idProducto = PPBD.idProductoAgranel
	INNER JOIN cat_tipo_producto AS CTP ON CTP.active = 1 AND CTP.idCatTipoProducto = P.idCatTipoProducto
	INNER JOIN cat_descripciones AS CD ON CD.active = 1 AND CD.idDescription = P.idDescription
	INNER JOIN cat_unidad_medida AS UM ON UM.active = 1 AND UM.idUnidadMedida = P.idUnidadMedida
    WHERE
		PPBD.idProdProdAgranelH = p_idProdProdAgranelH

	ORDER BY PPBD.idProdProdAgranelDetalle ASC;
	
SET SESSION TRANSACTION ISOLATION LEVEL REPEATABLE READ;
	
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getProdProdAgranelPaginado` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getProdProdAgranelPaginado`(
IN p_startDate VARCHAR(50)
, IN p_endDate VARCHAR(50)
, IN p_search VARCHAR(500)
, IN p_start INT
, IN p_limiter INT
)
BEGIN

	DECLARE iRows INT DEFAULT 0;

    -- Contar filas
	SELECT
		COUNT(*)
	INTO
		iRows
	FROM prod_prod_agranel AS PPB
	INNER JOIN users AS U ON U.idUser = PPB.idCreateUser
	INNER JOIN cat_status_prod AS CSP ON CSP.idCatStatusProd = PPB.idCatStatusProd
    WHERE		
		(
			p_search = ''
			OR CAST( PPB.idProdProdAgranelH AS CHAR(12) ) LIKE CONCAT('%', p_search, '%')
			OR CSP.name LIKE CONCAT('%', p_search, '%')
		)
		AND
		(
			p_startDate = ''
			OR
			(
				CAST( PPB.createDate AS DATE ) >= CAST( p_startDate AS DATE )
				AND CAST( PPB.createDate AS DATE ) <= CAST( p_endDate AS DATE )
			)
		)
	;

    SELECT
	
        iRows AS iRows
        , PPB.idProdProdAgranelH
        , DATE_FORMAT( PPB.createDate, '%d-%m-%Y') AS createDateDate
		, DATE_FORMAT( PPB.createDate, '%h:%i:%s %p') AS createDateHours
		
		, PPB.idCatStatusProd
		, CSP.name AS catStatusProdName
		
		, IFNULL( PPB.costoTotal ,2) AS costoTotal
		
		, PPB.idCreateUser
		, U.name AS createUserName
		, PPB.active
        
    FROM prod_prod_agranel AS PPB
	INNER JOIN users AS U ON U.idUser = PPB.idCreateUser
	INNER JOIN cat_status_prod AS CSP ON CSP.idCatStatusProd = PPB.idCatStatusProd
    WHERE		
		(
			p_search = ''
			OR CAST( PPB.idProdProdAgranelH AS CHAR(12) ) LIKE CONCAT('%', p_search, '%')
			OR CSP.name LIKE CONCAT('%', p_search, '%')
		)
		AND
		(
			p_startDate = ''
			OR
			(
				CAST( PPB.createDate AS DATE ) >= CAST( p_startDate AS DATE )
				AND CAST( PPB.createDate AS DATE ) <= CAST( p_endDate AS DATE )
			)
		)
		
    ORDER BY PPB.idProdProdAgranelH DESC
    LIMIT p_start, p_limiter;
	
SET SESSION TRANSACTION ISOLATION LEVEL REPEATABLE READ;
	
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getProdProdBaseByID` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getProdProdBaseByID`(
IN p_idProdProdBaseH BIGINT
)
BEGIN

SET SESSION TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;

    SELECT
	
        PPB.idProdProdBaseH
        , DATE_FORMAT( PPB.createDate, '%d-%m-%Y') AS createDateDate
		, DATE_FORMAT( PPB.createDate, '%h:%i:%s %p') AS createDateHours
		
		, PPB.idCatStatusProd
		, CSP.name AS catStatusProdName
		
		, IFNULL( PPB.costoTotal ,2) AS costoTotal
		
		, PPB.idCreateUser
		, U.name AS createUserName
		, PPB.active
        
    FROM prod_prod_base AS PPB
	INNER JOIN users AS U ON U.idUser = PPB.idCreateUser
	INNER JOIN cat_status_prod AS CSP ON CSP.idCatStatusProd = PPB.idCatStatusProd
    WHERE
		PPB.idProdProdBaseH = p_idProdProdBaseH
	;
	
SET SESSION TRANSACTION ISOLATION LEVEL REPEATABLE READ;
	
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getProdProdBaseDetallePag` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getProdProdBaseDetallePag`(
IN p_startDate VARCHAR(50)
, IN p_endDate VARCHAR(50)
, IN p_idProducto BIGINT
, IN p_idStatus INT
, IN p_start INT
, IN p_limiter INT
, IN p_idUserLogON BIGINT
)
BEGIN

SET SESSION TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;

	SET @iRows = 0;
	
	SET @iRows = ( SELECT
					COUNT(*)
					FROM prod_prod_base_detalle AS PPBD
					INNER JOIN cat_status_prod_base AS CSPB ON CSPB.active = 1 AND CSPB.idStatus = PPBD.idStatus
					INNER JOIN productos AS P ON P.active = 1 AND P.idProducto = PPBD.idProductoBase
					INNER JOIN cat_tipo_producto AS CTP ON CTP.active = 1 AND CTP.idCatTipoProducto = P.idCatTipoProducto
					INNER JOIN cat_descripciones AS CD ON CD.active = 1 AND CD.idDescription = P.idDescription
					INNER JOIN cat_unidad_medida AS UM ON UM.active = 1 AND UM.idUnidadMedida = P.idUnidadMedida
					WHERE
						(
							p_idProducto = 0
							OR PPBD.idProductoBase = p_idProducto
						)
						AND
						(
							p_idStatus = 0
							OR PPBD.idStatus = p_idStatus
						)
						AND
						(
							p_startDate = ''
							OR
							(
								CAST( PPBD.createDate AS DATE ) >= CAST( p_startDate AS DATE )
								AND CAST( PPBD.createDate AS DATE ) <= CAST( p_endDate AS DATE )
							)
						)
	);

    SELECT
	@iRows AS iRows
    , 0 AS selected
    , PPBD.idProdProdBaseDetalle
	, DATE_FORMAT( PPBD.createDate, '%d-%m-%Y') AS createDateDate
	, DATE_FORMAT( PPBD.createDate, '%h:%i:%s %p') AS createDateHours
	, PPBD.idStatus
	, CSPB.name AS statusName
	, PPBD.idProductoBase
	, CONCAT( IFNULL( CTP.abreviatura ,''), '-', CAST( P.idproductocategoria AS CHAR(12) ) , '-', IFNULL( CD.description ,''), ' ', REPLACE( CAST( P.valorMedida AS CHAR(12) ) , '.00', ''), ' ', IFNULL( UM.abreviatura ,'') ) AS articuloName
	, PPBD.cantidad
	, PPBD.cantProducida
	, PPBD.costo
	, PPBD.costoTotal
	, PPBD.bOK
	
	, PPBD.idCreateUser
	, U.name AS createUserName
	
	, IFNULL( PPBD.comments ,'') AS comments
    
    , IFNULL(
    (
		SELECT DATE_FORMAT( CSPL.createDate, '%d-%m-%Y %h:%i:%s') FROM change_status_ppd_log AS CSPL
        WHERE
			CSPL.idStatusTo = 4
            AND CSPL.idProdProdBaseDetalle = PPBD.idProdProdBaseDetalle
		LIMIT 1
    )
    , '') AS sendDate
    
	FROM prod_prod_base_detalle AS PPBD
	INNER JOIN cat_status_prod_base AS CSPB ON CSPB.active = 1 AND CSPB.idStatus = PPBD.idStatus
	INNER JOIN productos AS P ON P.active = 1 AND P.idProducto = PPBD.idProductoBase
	INNER JOIN cat_tipo_producto AS CTP ON CTP.active = 1 AND CTP.idCatTipoProducto = P.idCatTipoProducto
	INNER JOIN cat_descripciones AS CD ON CD.active = 1 AND CD.idDescription = P.idDescription
	INNER JOIN cat_unidad_medida AS UM ON UM.active = 1 AND UM.idUnidadMedida = P.idUnidadMedida
	INNER JOIN users AS U ON U.idUser = PPBD.idCreateUser
    WHERE
		(
			p_idProducto = 0
			OR PPBD.idProductoBase = p_idProducto
		)
		AND
		(
			p_idStatus = 0
			OR PPBD.idStatus = p_idStatus
		)
		AND
		(
			p_startDate = ''
			OR
			(
				CAST( PPBD.createDate AS DATE ) >= CAST( p_startDate AS DATE )
				AND CAST( PPBD.createDate AS DATE ) <= CAST( p_endDate AS DATE )
			)
		)
	
	ORDER BY PPBD.idStatus ASC, PPBD.idProdProdBaseDetalle DESC
    LIMIT p_start, p_limiter;
	
SET SESSION TRANSACTION ISOLATION LEVEL REPEATABLE READ;
	
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getProdProdFinalByID` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getProdProdFinalByID`(
IN p_idProdProdFinalH BIGINT
)
BEGIN

SET SESSION TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;

    SELECT
	
        PPB.idProdProdFinalH
        , DATE_FORMAT( PPB.createDate, '%d-%m-%Y') AS createDateDate
		, DATE_FORMAT( PPB.createDate, '%h:%i:%s %p') AS createDateHours
		
		, PPB.idCatStatusProd
		, CSP.name AS catStatusProdName
		
		, IFNULL( PPB.costoTotal ,2) AS costoTotal
		
		, PPB.idCreateUser
		, U.name AS createUserName
		, PPB.active
        
    FROM prod_prod_final AS PPB
	INNER JOIN users AS U ON U.idUser = PPB.idCreateUser
	INNER JOIN cat_status_prod AS CSP ON CSP.idCatStatusProd = PPB.idCatStatusProd
    WHERE
		PPB.idProdProdFinalH = p_idProdProdFinalH
	;
	
SET SESSION TRANSACTION ISOLATION LEVEL REPEATABLE READ;
	
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getProdProdFinalDetalle` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getProdProdFinalDetalle`(
IN p_idProdProdFinalH BIGINT
)
BEGIN

SET SESSION TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;

    SELECT
	
    PPBD.idProdProdFinalDetalle
	, PPBD.idProductoFinal
	, CONCAT( IFNULL( CTP.abreviatura ,''), '-', CAST( P.idproductocategoria AS CHAR(12) ) , '-', IFNULL( CD.description ,''), ' ', REPLACE( CAST( P.valorMedida AS CHAR(12) ) , '.00', ''), ' ', IFNULL( UM.abreviatura ,'') ) AS articuloName
	, PPBD.cantidad
	, PPBD.costo
	, PPBD.costoTotal
    
	FROM prod_prod_final_detalle AS PPBD
	INNER JOIN productos AS P ON P.idProducto = PPBD.idProductoFinal
	INNER JOIN cat_tipo_producto AS CTP ON CTP.active = 1 AND CTP.idCatTipoProducto = P.idCatTipoProducto
	INNER JOIN cat_descripciones AS CD ON CD.active = 1 AND CD.idDescription = P.idDescription
	INNER JOIN cat_unidad_medida AS UM ON UM.active = 1 AND UM.idUnidadMedida = P.idUnidadMedida
    WHERE
		PPBD.idProdProdFinalH = p_idProdProdFinalH

	ORDER BY PPBD.idProdProdFinalDetalle ASC;
	
SET SESSION TRANSACTION ISOLATION LEVEL REPEATABLE READ;
	
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getProdProdFinalPaginado` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getProdProdFinalPaginado`(
IN p_startDate VARCHAR(50)
, IN p_endDate VARCHAR(50)
, IN p_search VARCHAR(500)
, IN p_start INT
, IN p_limiter INT
)
BEGIN

	DECLARE iRows INT DEFAULT 0;

    -- Contar filas
	SELECT
		COUNT(*)
		INTO
		iRows
	FROM prod_prod_final AS PPB
	INNER JOIN users AS U ON U.idUser = PPB.idCreateUser
	INNER JOIN cat_status_prod AS CSP ON CSP.idCatStatusProd = PPB.idCatStatusProd
	WHERE
		(
			p_search = ''
			OR CAST( PPB.idProdProdFinalH AS CHAR(12) ) LIKE CONCAT('%', p_search, '%')
			OR CSP.name LIKE CONCAT('%', p_search, '%')
		)
		AND
		(
			p_startDate = ''
			OR
			(
				CAST( PPB.createDate AS DATE ) >= CAST( p_startDate AS DATE )
				AND CAST( PPB.createDate AS DATE ) <= CAST( p_endDate AS DATE )
			)
		)
	;

    SELECT
	
        iRows AS iRows
        , PPB.idProdProdFinalH
        , DATE_FORMAT( PPB.createDate, '%d-%m-%Y') AS createDateDate
		, DATE_FORMAT( PPB.createDate, '%h:%i:%s %p') AS createDateHours
		
		, PPB.idCatStatusProd
		, CSP.name AS catStatusProdName
		
		, IFNULL( PPB.costoTotal ,2) AS costoTotal
		
		, PPB.idCreateUser
		, U.name AS createUserName
		, PPB.active
        
    FROM prod_prod_final AS PPB
	INNER JOIN users AS U ON U.idUser = PPB.idCreateUser
	INNER JOIN cat_status_prod AS CSP ON CSP.idCatStatusProd = PPB.idCatStatusProd
    WHERE
		(
			p_search = ''
			OR CAST( PPB.idProdProdFinalH AS CHAR(12) ) LIKE CONCAT('%', p_search, '%')
			OR CSP.name LIKE CONCAT('%', p_search, '%')
		)
		AND
		(
			p_startDate = ''
			OR
			(
				CAST( PPB.createDate AS DATE ) >= CAST( p_startDate AS DATE )
				AND CAST( PPB.createDate AS DATE ) <= CAST( p_endDate AS DATE )
			)
		)
		
    ORDER BY PPB.idProdProdFinalH DESC
    LIMIT p_start, p_limiter;
	
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getProductoByID` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getProductoByID`(IN p_idProducto BIGINT)
BEGIN

    SELECT
	
        P.idProducto
        , P.createDate
		, P.sku
        , P.idDescription
		, CD.description
		, CONCAT( IFNULL( CTP.abreviatura ,''), '-', CAST( P.idproductocategoria AS CHAR(12) ) , '-', IFNULL( CD.description ,''), ' ', REPLACE( CAST( P.valorMedida AS CHAR(12) ) , '.00', ''), ' ', IFNULL( UM.abreviatura ,'') ) AS articuloName
		, P.valorMedida
		, P.idUnidadMedida
		, IFNULL( UM.name ,'') AS unidadMedidaDesc
		, P.idCatTipoProducto
		, CTP.name AS catTipoProductoDesc
		, P.idProductoRelacion
		, CONCAT( IFNULL( CTPP.abreviatura ,''), '-', CAST( PP.idproductocategoria AS CHAR(12) ) , '-', IFNULL( CDP.description ,''), ' ', REPLACE( CAST( PP.valorMedida AS CHAR(12) ) , '.00', ''), ' ', IFNULL( UMP.abreviatura ,'') ) AS productoRelacionDesc
        , IFNULL( P.porcentajeRelation ,0) AS porcentajeRelation
		, P.idFamilia
		, CONCAT( IF( IFNULL( D.idDepartamento ,0) = 0, 'NONE', D.name ), ' - ', F.name ) AS familiaDesc
		, P.costo
		, P.precio
        , P.active
		, P.imageUrl
		, P.bEnvase
		, P.idproductocategoria
		, P.idcatcategoriaproducto
        
        , P.precioEcoAgr
        
        , P.porcentDineroElectronico
        
        , D.idDepartamento
        , IFNULL( D.name ,'') AS departamentoDesc
		
    FROM productos AS P
	INNER JOIN cat_tipo_producto AS CTP ON CTP.active = 1 AND CTP.idCatTipoProducto = P.idCatTipoProducto
	INNER JOIN cat_descripciones AS CD ON CD.active = 1 AND CD.idDescription = P.idDescription
	INNER JOIN cat_unidad_medida AS UM ON UM.active = 1 AND UM.idUnidadMedida = P.idUnidadMedida
	LEFT JOIN cat_familias AS F ON F.idFamilia = P.idFamilia
    LEFT JOIN cat_departamentos AS D ON D.idDepartamento = F.idDepartamento
	LEFT JOIN productos AS PP ON PP.idProducto = P.idProductoRelacion
	LEFT JOIN cat_tipo_producto AS CTPP ON CTPP.active = 1 AND CTPP.idCatTipoProducto = PP.idCatTipoProducto
	LEFT JOIN cat_descripciones AS CDP ON CDP.active = 1 AND CDP.idDescription = PP.idDescription
	LEFT JOIN cat_unidad_medida AS UMP ON UMP.active = 1 AND UMP.idUnidadMedida = PP.idUnidadMedida
    WHERE
		P.idProducto = p_idProducto;
        
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getProductoByIDCategoria` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getProductoByIDCategoria`(
IN p_idproductocategoria INT
, IN p_idcatcategoriaproducto INT
)
BEGIN

    SELECT
	
        P.idProducto
        , P.createDate
		, P.sku
        , P.idDescription
		, CD.description
		, CONCAT( IFNULL( CTP.abreviatura ,''), '-', CAST( P.idproductocategoria AS CHAR(12) ) , '-', IFNULL( CD.description ,''), ' ', REPLACE( CAST( P.valorMedida AS CHAR(12) ) , '.00', ''), ' ', IFNULL( UM.abreviatura ,'') ) AS articuloName
		, P.valorMedida
		, P.idUnidadMedida
		, IFNULL( UM.name ,'') AS unidadMedidaDesc
		, P.idCatTipoProducto
		, CTP.name AS catTipoProductoDesc
		, P.idProductoRelacion
		, CONCAT( IFNULL( CTPP.abreviatura ,''), '-', CAST( PP.idproductocategoria AS CHAR(12) ) , '-', IFNULL( CDP.description ,''), ' ', REPLACE( CAST( PP.valorMedida AS CHAR(12) ) , '.00', ''), ' ', IFNULL( UMP.abreviatura ,'') ) AS productoRelacionDesc
        , IFNULL( P.porcentajeRelation ,0) AS porcentajeRelation
		, P.idFamilia
		, CONCAT( IF( IFNULL( D.idDepartamento ,0) = 0, 'NONE', D.name ), ' - ', F.name ) AS familiaDesc
		, P.costo
		, P.precio
        , P.active
		, P.imageUrl
		, P.bEnvase
		, P.idproductocategoria
		, P.idcatcategoriaproducto
        
        , P.precioEcoAgr
        
        , P.porcentDineroElectronico
        , P.porcentDineroElectronicoEnvase
        
        , F.idDepartamento
        , IFNULL( D.name ,'') AS departamentoDesc
		, IFNULL( P.bDineroElectronico ,0) AS bDineroElectronico
		
    FROM productos AS P
	INNER JOIN cat_tipo_producto AS CTP ON CTP.active = 1 AND CTP.idCatTipoProducto = P.idCatTipoProducto
	INNER JOIN cat_descripciones AS CD ON CD.active = 1 AND CD.idDescription = P.idDescription
	INNER JOIN cat_unidad_medida AS UM ON UM.active = 1 AND UM.idUnidadMedida = P.idUnidadMedida
	LEFT JOIN cat_familias AS F ON F.idFamilia = P.idFamilia
    LEFT JOIN cat_departamentos AS D ON D.idDepartamento = F.idDepartamento
	LEFT JOIN productos AS PP ON PP.idProducto = P.idProductoRelacion
	LEFT JOIN cat_tipo_producto AS CTPP ON CTPP.active = 1 AND CTPP.idCatTipoProducto = PP.idCatTipoProducto
	LEFT JOIN cat_descripciones AS CDP ON CDP.active = 1 AND CDP.idDescription = PP.idDescription
	LEFT JOIN cat_unidad_medida AS UMP ON UMP.active = 1 AND UMP.idUnidadMedida = PP.idUnidadMedida
    WHERE
		P.idproductocategoria = p_idproductocategoria
		AND P.idcatcategoriaproducto = p_idcatcategoriaproducto
		;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getProductosPaginado` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getProductosPaginado`(
IN p_idFamilia INT
, IN p_idProducto BIGINT
, IN p_idUnidadMedida INT
, IN p_valorMedida VARCHAR(20)
, IN p_idDepartamento INT
, IN p_tipoProducto INT
, IN p_idcatcategoriaproducto INT

, IN p_start INT
, IN p_limiter INT
)
BEGIN

	DECLARE iRows INT DEFAULT 0;

    -- Contar filas
    SELECT COUNT(*) INTO iRows
    FROM productos AS P
	LEFT JOIN cat_familias AS F ON F.idFamilia = P.idFamilia
    WHERE
		(
			p_idFamilia = 0
			OR P.idFamilia = p_idFamilia
		)
		AND
		(
			p_idProducto = 0
			OR P.idProducto = p_idProducto
		)
        AND
		(
			p_idUnidadMedida = 0
			OR P.idUnidadMedida = p_idUnidadMedida
		)
        AND
		(
			p_valorMedida = ''
			OR P.valorMedida = p_valorMedida
		)
		AND
		(
			p_idDepartamento = 0
			OR F.idDepartamento = p_idDepartamento
		)
		AND
		(
			p_tipoProducto = 0
			OR P.idCatTipoProducto = p_tipoProducto
		)
		AND
		(
			p_idcatcategoriaproducto = 0
			OR P.idcatcategoriaproducto = p_idcatcategoriaproducto
		)
		;

    SELECT
	
		iRows AS iRows
		, P.idProducto
        , P.createDate
		, P.sku
        , P.idDescription
		, CD.description
		, CONCAT( IFNULL( CTP.abreviatura ,''), '-', CAST( P.idproductocategoria AS CHAR(12) ) , '-', IFNULL( CD.description ,''), ' ', REPLACE( CAST( P.valorMedida AS CHAR(12) ) , '.00', ''), ' ', IFNULL( UM.abreviatura ,'') ) AS articuloName
		, P.valorMedida
		, P.idUnidadMedida
		, IFNULL( UM.name ,'') AS unidadMedidaDesc
		, P.idCatTipoProducto
		, CTP.name AS catTipoProductoDesc
		, P.idProductoRelacion
		, CONCAT( IFNULL( CTPP.abreviatura ,''), '-', CAST( PP.idproductocategoria AS CHAR(12) ) , '-', IFNULL( CDP.description ,''), ' ', REPLACE( CAST( PP.valorMedida AS CHAR(12) ) , '.00', ''), ' ', IFNULL( UMP.abreviatura ,'') ) AS productoRelacionDesc
        , IFNULL( P.porcentajeRelation ,0) AS porcentajeRelation
		, P.idFamilia
		, CONCAT( IF( IFNULL( D.idDepartamento ,0) = 0, 'NONE', D.name ), ' - ', F.name ) AS familiaDesc
		, P.costo
		, P.precio
        , P.active
		, P.imageUrl
		, P.bEnvase
		, P.idproductocategoria
		, P.idcatcategoriaproducto
        
        , P.precioEcoAgr
        
        , P.porcentDineroElectronico
        
        , D.idDepartamento
        , IFNULL( D.name ,'') AS departamentoDesc
		
    FROM productos AS P
	INNER JOIN cat_tipo_producto AS CTP ON CTP.active = 1 AND CTP.idCatTipoProducto = P.idCatTipoProducto
	INNER JOIN cat_descripciones AS CD ON CD.active = 1 AND CD.idDescription = P.idDescription
	INNER JOIN cat_unidad_medida AS UM ON UM.active = 1 AND UM.idUnidadMedida = P.idUnidadMedida
	LEFT JOIN cat_familias AS F ON F.idFamilia = P.idFamilia
    LEFT JOIN cat_departamentos AS D ON D.idDepartamento = F.idDepartamento
	LEFT JOIN productos AS PP ON PP.idProducto = P.idProductoRelacion
	LEFT JOIN cat_tipo_producto AS CTPP ON CTPP.active = 1 AND CTPP.idCatTipoProducto = PP.idCatTipoProducto
	LEFT JOIN cat_descripciones AS CDP ON CDP.active = 1 AND CDP.idDescription = PP.idDescription
	LEFT JOIN cat_unidad_medida AS UMP ON UMP.active = 1 AND UMP.idUnidadMedida = PP.idUnidadMedida
    WHERE
		(
			p_idFamilia = 0
			OR P.idFamilia = p_idFamilia
		)
		AND
		(
			p_idProducto = 0
			OR P.idProducto = p_idProducto
		)
        AND
		(
			p_idUnidadMedida = 0
			OR P.idUnidadMedida = p_idUnidadMedida
		)
        AND
		(
			p_valorMedida = ''
			OR P.valorMedida = p_valorMedida
		)
		AND
		(
			p_idDepartamento = 0
			OR F.idDepartamento = p_idDepartamento
		)
		AND
		(
			p_tipoProducto = 0
			OR P.idCatTipoProducto = p_tipoProducto
		)
		AND
		(
			p_idcatcategoriaproducto = 0
			OR P.idcatcategoriaproducto = p_idcatcategoriaproducto
		)
	ORDER BY P.idProducto
	LIMIT p_start, p_limiter;
        
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getProspectosPaginado` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getProspectosPaginado`(
IN oGetDateNow DATETIME
, IN p_startDate VARCHAR(50)
, IN p_endDate VARCHAR(50)
, IN p_idVendedor BIGINT
, IN p_idZona INT
, IN p_idTipoCliente BIGINT
, IN p_bProspecto SMALLINT
, IN p_idGiro INT
, IN p_iSeguimiento INT
, IN p_idDepartamento INT
, IN p_active SMALLINT
, IN p_search VARCHAR(500)
, IN p_start INT
, IN p_limiter INT
)
BEGIN

    SET @iRows = 0;

    SET @iRows = (
					SELECT COUNT(*)
					FROM clientes AS C
					WHERE
					( IFNULL( p_startDate ,'') = '' OR CAST( C.createDate AS DATE ) >= p_startDate)
					AND ( IFNULL( p_endDate ,'') = '' OR CAST( C.createDate AS DATE ) <= p_endDate)
					AND
					(
						p_idVendedor = 0
						OR C.idVendedor = p_idVendedor
					)
					AND
                    (
						p_idZona = 0
                        OR C.idZona = p_idZona
                    )
                    AND
                    (
						p_idTipoCliente = 0
                        OR C.idTipoCliente = p_idTipoCliente
                    )
					AND
					(
						p_search = ''
						OR C.nombre LIKE CONCAT('%', p_search, '%')
						OR C.rfc LIKE CONCAT('%', p_search, '%')
					)
					AND
					(
						( p_bProspecto = 0 AND IFNULL( C.bProspecto ,0) = 0 )
						OR ( p_bProspecto = 1 AND ( IFNULL( C.bProspecto ,0) = 1 OR IFNULL( C.bFProspecto ,0) = 1 ) )
					)
					AND
                    (
						p_idGiro = 0
                        OR C.idGiro = p_idGiro
                    )
					AND
					(
						p_iSeguimiento = 0
						OR ( p_iSeguimiento = 1 AND IFNULL( C.bProspecto ,0) = 1 )
						OR ( p_iSeguimiento = 2 AND IFNULL( C.bProspecto ,0) = 0 AND IFNULL( C.bFProspecto ,0) = 1 )
					)
					AND
					(
						p_active = 0
						OR ( p_active = 1 AND C.active = 1 )
						OR ( p_active = 2 AND C.active = 0 )
					)
				  );

    SELECT
        @iRows AS iRows,
        C.idCliente,
        C.idVendedor,
        C.createDate,
        C.nombre,
        C.calle,
		C.entreCalles,
        C.codigocolonia,
        CO.nombre AS colonia,
        MU.nombre AS municipio,
        ES.nombre AS estado,
        CO.codigopostal,
        C.active,
        C.telefono,
        C.idTipoCliente,
        IFNULL( TC.name ,'') AS tipoClienteDesc,
		
		Z.idZona,
		Z.name AS zonaName,
        
        IFNULL( C.bProspecto ,0) AS bProspecto,
        IFNULL( C.bFProspecto ,0) AS bFProspecto,
		IFNULL( C.compraEstimada ,0) AS compraEstimada,
		DATE_FORMAT( C.clientDate, '%d/%m/%Y') AS clientDateDate,
		DATE_FORMAT( C.clientDate, '%h:%i:%s %p') AS clientDateHours,
		CONCAT( 'Se hizo cliente: ', DATE_FORMAT( C.clientDate, '%d/%m/%Y'), ' ', DATE_FORMAT( C.clientDate, '%h:%i:%s %p') ) AS clientDateDesc,
		IFNULL( C.idGiro ,0) AS idGiro,
		IFNULL( G.name ,'') AS giroDesc,
		
		IFNULL(
		(
			SELECT
			CONCAT( DATE_FORMAT( C.clientDate, '%d/%m/%Y'), ' - ', DATE_FORMAT( C.clientDate, '%h:%i:%s %p'), ': ', SP.description )
			FROM seguimiento_prospectos AS SP
			WHERE
				SP.idCliente = C.idCliente
			ORDER BY SP.idSeguimiento DESC
			LIMIT 1
		),'') AS lastSeguimiento,
		
		IFNULL(
		(
			SELECT
				SUM( VD.total ) AS total
			FROM ventas AS V
			INNER JOIN ventasdetalle AS VD ON VD.idVenta = V.idVenta
			INNER JOIN productos AS P ON P.idProducto = VD.idProducto
			INNER JOIN cat_familias AS F ON F.idFamilia = P.idFamilia
			WHERE
				V.active = 1
				AND V.idCliente = C.idCliente
				AND (p_idDepartamento = 0 OR F.idDepartamento = p_idDepartamento)
				AND CAST( V.createDate AS DATE )
					BETWEEN
						CAST( DATE_SUB( oGetDateNow, INTERVAL 1 MONTH) AS DATE )
					AND
						CAST( oGetDateNow AS DATE )

			GROUP BY V.idCliente
		)
		,0) AS compraMensualReal
    FROM clientes AS C
    LEFT JOIN cat_tipo_cliente AS TC ON C.idTipoCliente = TC.idTipoCliente
    LEFT JOIN colonias CO ON CO.codigocolonia = C.codigocolonia
    LEFT JOIN ciudades CD ON CD.codigomunicipio = CO.codigomunicipio AND CD.codigoestado = CO.codigoestado AND CD.codigociudad = CO.codigociudad
	LEFT JOIN municipios MU ON MU.codigomunicipio = CD.codigomunicipio AND MU.codigoestado = CD.codigoestado
	LEFT JOIN estados ES ON ES.codigoestado = MU.codigoestado
	LEFT JOIN zonas AS Z ON Z.idZona = C.idZona
	LEFT JOIN giros AS G ON G.idGiro = C.idGiro
    WHERE
	( IFNULL( p_startDate ,'') = '' OR CAST( C.createDate AS DATE ) >= p_startDate)
	AND ( IFNULL( p_endDate ,'') = '' OR CAST( C.createDate AS DATE ) <= p_endDate)
	AND
	(
		p_idVendedor = 0
		OR C.idVendedor = p_idVendedor
	)
	AND
	(
		p_idZona = 0
		OR C.idZona = p_idZona
	)
    AND
	(
		p_idTipoCliente = 0
		OR C.idTipoCliente = p_idTipoCliente
	)
	AND
	(
        p_search = ''
        OR C.nombre LIKE CONCAT('%', p_search, '%')
        OR C.rfc LIKE CONCAT('%', p_search, '%')
    )
	AND
	(
		( p_bProspecto = 0 AND IFNULL( C.bProspecto ,0) = 0 )
		OR ( p_bProspecto = 1 AND ( IFNULL( C.bProspecto ,0) = 1 OR IFNULL( C.bFProspecto ,0) = 1 ) )
	)
	AND
	(
		p_idGiro = 0
		OR C.idGiro = p_idGiro
	)
	AND
	(
		p_iSeguimiento = 0
		OR ( p_iSeguimiento = 1 AND IFNULL( C.bProspecto ,0) = 1 )
		OR ( p_iSeguimiento = 2 AND IFNULL( C.bProspecto ,0) = 0 AND IFNULL( C.bFProspecto ,0) = 1 )
	)
	AND
	(
		p_active = 0
		OR ( p_active = 1 AND C.active = 1 )
		OR ( p_active = 2 AND C.active = 0 )
	)
    ORDER BY C.idCliente DESC
    LIMIT p_start, p_limiter;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getProveedoresPaginado` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getProveedoresPaginado`(
IN p_search VARCHAR(500)
, IN p_start INT
, IN p_limiter INT
)
BEGIN

    SET @iRows = 0;

    SET @iRows = (
					SELECT COUNT(*)
					FROM proveedores AS C
					WHERE
                    C.active = 1
                    AND
					(
						p_search = ''
						OR C.nombre LIKE CONCAT('%', p_search, '%')
						OR C.rfc LIKE CONCAT('%', p_search, '%')
					)
				  );
                  

    SELECT
        @iRows AS iRows,
        C.idProveedor,
        C.createDate,
        C.nombre,
        C.calle,
		C.numExt,
		C.numInt,
		C.entreCalles,
        C.codigocolonia,
        CO.nombre AS colonia,
        MU.nombre AS municipio,
        ES.nombre AS estado,
		CD.nombre AS ciudad,
        CO.codigopostal,
		C.rfc,
		C.telefono,
		C.email,
        C.active
        
    FROM proveedores AS C
    LEFT JOIN colonias CO ON CO.codigocolonia = C.codigocolonia
    LEFT JOIN ciudades CD ON CD.codigomunicipio = CO.codigomunicipio AND CD.codigoestado = CO.codigoestado AND CD.codigociudad = CO.codigociudad
	LEFT JOIN municipios MU ON MU.codigomunicipio = CD.codigomunicipio AND MU.codigoestado = CD.codigoestado
	LEFT JOIN estados ES ON ES.codigoestado = MU.codigoestado
    WHERE
    C.active = 1
    AND
	(
        p_search = ''
        OR C.nombre LIKE CONCAT('%', p_search, '%')
        OR C.rfc LIKE CONCAT('%', p_search, '%')
    )
    ORDER BY C.idProveedor DESC
    LIMIT p_start, p_limiter;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getRolByID` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getRolByID`(
IN p_idRol INT
)
BEGIN

SET SESSION TRANSACTION ISOLATION LEVEL READ UNCOMMITTED ;
	
	SELECT
	R.idRol
	, R.createDate
	, R.name
	, R.description
	, R.active
	FROM roles as R
	WHERE R.idRol = p_idRol;

 SET SESSION TRANSACTION ISOLATION LEVEL REPEATABLE READ ;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getRolesByIdUser` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getRolesByIdUser`(
IN p_idUser BIGINT
)
BEGIN
	
	SELECT
	UR.createDate
	, R.idRol
	, R.name
	FROM roles as R
	LEFT JOIN user_roles AS UR ON R.idRol = UR.idRol
	WHERE
		R.active = 1
		AND UR.idUser = p_idUser
		
    ORDER BY UR.keyx DESC;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getRolesForAddUser` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getRolesForAddUser`(
IN p_search VARCHAR(500)
, IN p_idUser BIGINT

, IN p_idUserLogON BIGINT
)
BEGIN

SET SESSION TRANSACTION ISOLATION LEVEL READ UNCOMMITTED ;
	
	SELECT
	R.idRol AS id
	, R.name AS text
	FROM roles as R
	LEFT JOIN user_roles AS UR ON UR.idUser = p_idUser AND R.idRol = UR.idRol
	WHERE
		R.active = 1
		AND UR.keyx IS NULL
		AND
		(
			p_search = ''
			OR R.name LIKE CONCAT('%', p_search ,'%')
		)
    ORDER BY R.idRol DESC
	LIMIT 0, 5;

 SET SESSION TRANSACTION ISOLATION LEVEL REPEATABLE READ ;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getRolesListWithPage` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getRolesListWithPage`(
IN p_search VARCHAR(500)
, IN p_start INT
, IN p_limiter INT
)
BEGIN

SET SESSION TRANSACTION ISOLATION LEVEL READ UNCOMMITTED ;

	SET @iRows = 0;
	
	
	SET @iRows = ( SELECT
					COUNT(*)
					FROM roles as R
					WHERE
					(
						p_search = ''
						OR R.name LIKE CONCAT('%', p_search ,'%')
						OR R.description LIKE CONCAT('%', p_search ,'%')
					)
	);
	
	SELECT
	@iRows AS iRows
	, R.idRol
	, R.createDate
	, R.name
	, R.description
	, R.active
	FROM roles as R
	WHERE
	(
		p_search = ''
		OR R.name LIKE CONCAT('%', p_search ,'%')
		OR R.description LIKE CONCAT('%', p_search ,'%')
	)
    ORDER BY R.idRol DESC
	LIMIT p_start, p_limiter;

 SET SESSION TRANSACTION ISOLATION LEVEL REPEATABLE READ ;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getSeguimientoProspectos` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getSeguimientoProspectos`(
IN p_idCliente BIGINT
, IN p_start INT
, IN p_limiter INT
, IN p_idUserLogON BIGINT
)
BEGIN

	SET @iRows = 0;
	
	SET @iRows = ( SELECT
					COUNT(*)
					FROM seguimiento_prospectos AS SP
					INNER JOIN clientes AS C ON C.idCliente = SP.idCliente
					INNER JOIN users AS U ON U.idUser = SP.idUser
					WHERE
						SP.idCliente = p_idCliente
	);
	
	SELECT
	
        @iRows AS iRows
		, SP.idSeguimiento
        , DATE_FORMAT( SP.createDate, '%d-%m-%Y') AS createDateDate
		, DATE_FORMAT( SP.createDate, '%h:%i:%s %p') AS createDateHours
		, SP.idCliente
		
		, SP.idUser
		, U.name AS userName
		, IFNULL( SP.description ,'') AS description
        
    FROM seguimiento_prospectos AS SP
	INNER JOIN clientes AS C ON C.idCliente = SP.idCliente
	INNER JOIN users AS U ON U.idUser = SP.idUser
	WHERE
		SP.idCliente = p_idCliente
        
    ORDER BY SP.idSeguimiento DESC
	LIMIT p_start, p_limiter;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getSucursalByID` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getSucursalByID`(IN p_idSucursal BIGINT)
BEGIN

SET SESSION TRANSACTION ISOLATION LEVEL READ UNCOMMITTED ;
	
	SELECT
	S.idSucursal
	, S.createDate
	, S.name
	, S.calle
	, S.entreCalles
    , S.codigocolonia
	, CO.nombre AS colonia
	, MU.nombre AS municipio
	, ES.nombre AS estado
	, CO.codigopostal
	, S.telefono
	, S.email	
	, S.numExt
	, S.numInt
	, S.lat
	, S.long
	, S.active
	FROM sucursales AS S
	LEFT JOIN colonias CO ON CO.codigocolonia = S.codigocolonia
    LEFT JOIN municipios MU ON MU.codigomunicipio = CO.codigomunicipio AND MU.codigoestado = CO.codigoestado
    LEFT JOIN estados ES ON ES.codigoestado = CO.codigoestado
	WHERE S.idSucursal = p_idSucursal;

 SET SESSION TRANSACTION ISOLATION LEVEL REPEATABLE READ ;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getSucursalesByIdUser` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getSucursalesByIdUser`(
	IN p_idUser BIGINT
)
BEGIN

SET SESSION TRANSACTION ISOLATION LEVEL READ UNCOMMITTED ;
	
	SELECT
		SC.createDate
		, S.idSucursal
		, S.name
        , IFNULL( SC.bPrincipal ,0) AS bPrincipal
	FROM sucursales as S
	INNER JOIN sucursalesconfig AS SC ON S.idSucursal = SC.idSucursal
	WHERE
		S.active = 1
		AND SC.idUser = p_idUser
    ORDER BY SC.keyx DESC;

 SET SESSION TRANSACTION ISOLATION LEVEL REPEATABLE READ ;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getSucursalesForAddUser` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getSucursalesForAddUser`(
IN p_search VARCHAR(500)
, IN p_idUser BIGINT
)
BEGIN

SET SESSION TRANSACTION ISOLATION LEVEL READ UNCOMMITTED ;
	
	SELECT
	S.idSucursal AS id
	, S.name AS text
	FROM sucursales as S
	LEFT JOIN sucursalesconfig AS SC ON SC.idUser = p_idUser AND S.idSucursal = SC.idSucursal
	WHERE
		S.active = 1
		AND SC.keyx IS NULL
		AND
		(
			p_search = ''
			OR S.name LIKE CONCAT('%', p_search ,'%')
		)
    ORDER BY S.idSucursal DESC
	LIMIT 0, 5;

 SET SESSION TRANSACTION ISOLATION LEVEL REPEATABLE READ ;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getSucursalesListWithPage` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getSucursalesListWithPage`(IN p_search VARCHAR(500),IN p_start INT, IN p_limiter INT)
BEGIN

SET SESSION TRANSACTION ISOLATION LEVEL READ UNCOMMITTED ;

	SET @iRows = 0;
	
	
	SET @iRows = ( SELECT
					COUNT(*)
					FROM sucursales AS S
					WHERE
					(
						p_search = ''
						OR S.name LIKE CONCAT('%', p_search ,'%')
					)
	);
	
	SELECT
	@iRows AS iRows
	, S.idSucursal
	, S.createDate
	, S.name
	, S.calle
    , S.entreCalles
	, S.codigocolonia
	, CO.nombre AS colonia
    , CD.nombre AS ciudad
    , MU.nombre AS municipio
    , ES.nombre AS estado
    , CO.codigopostal
	, S.active
	FROM sucursales AS S
	LEFT JOIN colonias CO ON CO.codigocolonia = S.codigocolonia
    LEFT JOIN ciudades CD ON CD.codigomunicipio = CO.codigomunicipio AND CD.codigoestado = CO.codigoestado AND CD.codigociudad = CO.codigociudad
	LEFT JOIN municipios MU ON MU.codigomunicipio = CD.codigomunicipio AND MU.codigoestado = CD.codigoestado
	LEFT JOIN estados ES ON ES.codigoestado = MU.codigoestado
	WHERE
	(
		p_search = ''
		OR S.name LIKE CONCAT('%', p_search ,'%')
	)
    ORDER BY S.idSucursal DESC
	LIMIT p_start, p_limiter;

SET SESSION TRANSACTION ISOLATION LEVEL REPEATABLE READ ;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getSUMInventario` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getSUMInventario`(
IN p_idOrigen BIGINT
, IN p_idFamilia INT
, IN p_idProducto BIGINT
, IN p_idUnidadMedida INT
, IN p_valorMedida VARCHAR(20)
, IN p_idDepartamento INT
, IN p_idUserLogON BIGINT
)
BEGIN
	
	SELECT
	
		SUM( ROUND( S.cantidad * P.costo ,2) ) AS sumCostoTotal
		
		, SUM( ROUND( S.cantidad * P.precio ,2) ) AS sumPrecioTotal
        
    FROM stock AS S
	INNER JOIN origenes AS O ON O.idOrigen = S.idOrigen
    INNER JOIN cat_relacion_origen AS CRO ON CRO.idCatRelacionOrigen = O.idCatRelacionOrigen
	INNER JOIN productos AS P ON P.active = 1 AND P.idProducto = S.idProducto
	INNER JOIN cat_tipo_producto AS CTP ON CTP.active = 1 AND CTP.idCatTipoProducto = P.idCatTipoProducto
	INNER JOIN cat_descripciones AS CD ON CD.active = 1 AND CD.idDescription = P.idDescription
	INNER JOIN cat_unidad_medida AS UM ON UM.active = 1 AND UM.idUnidadMedida = P.idUnidadMedida
	LEFT JOIN cat_familias AS F ON F.idFamilia = P.idFamilia
    WHERE
		S.active = 1
		AND S.idOrigen = p_idOrigen
		AND
		(
			p_idFamilia = 0
			OR P.idFamilia = p_idFamilia
		)
		AND
		(
			p_idProducto = 0
			OR P.idProducto = p_idProducto
		)
		AND
		(
			p_idUnidadMedida = 0
			OR P.idUnidadMedida = p_idUnidadMedida
		)
        AND
		(
			p_valorMedida = ''
			OR P.valorMedida = p_valorMedida
		)
		AND
		(
			p_idDepartamento = 0
			OR F.idDepartamento = p_idDepartamento
		)
	;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getUserByID` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getUserByID`(IN p_idUser BIGINT)
BEGIN

SET SESSION TRANSACTION ISOLATION LEVEL READ UNCOMMITTED ;
	
	SELECT
	U.idUser
	, U.createDate
	, U.name
	, U.userName
	, U.pwd
    , CSU.idStatus
    , CSU.name AS statusUserDesc
	, U.active
	FROM users as U
    INNER JOIN cat_status_user CSU
		ON
			U.idStatus = CSU.idStatus
            
	WHERE U.idUser = p_idUser;

 SET SESSION TRANSACTION ISOLATION LEVEL REPEATABLE READ ;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getUserByUserName` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getUserByUserName`(
IN `p_userName` VARCHAR(45)
)
BEGIN

SET SESSION TRANSACTION ISOLATION LEVEL READ UNCOMMITTED ;
	
	SELECT
	U.idUser
	,U.createDate
	,U.name
	,U.username
	,U.pwd
	,U.active
	, IFNULL(
	(
		SELECT
        idSucursal
        FROM sucursales AS S
		INNER JOIN origenes O ON O.idCatRelacionOrigen = 1 AND O.idRelacion = S.idSucursal
		INNER JOIN origenes_config AS OC ON OC.idOrigen = O.idOrigen
        WHERE
			OC.bPrincipal = 1
            AND OC.idUser = U.idUser
		LIMIT 1
	)
	,0) AS idSucursalPrincipal
	
	, IFNULL(
	(
		SELECT
		COUNT(*)
		FROM origenes_config AS SC
		WHERE
			SC.idUser = U.idUser
	)
	,0) AS countSucursales
	
	FROM users AS U
	WHERE
		active = 1
		AND username = p_userName;

 SET SESSION TRANSACTION ISOLATION LEVEL REPEATABLE READ ;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getUsersListWithPage` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getUsersListWithPage`(IN p_search VARCHAR(500),IN p_start INT, IN p_limiter INT)
BEGIN

SET SESSION TRANSACTION ISOLATION LEVEL READ UNCOMMITTED ;

	SET @iRows = 0;
	
	
	SET @iRows = ( SELECT
					COUNT(*)
					FROM users as U
					WHERE
					(
						p_search = ''
						OR U.name LIKE CONCAT('%', p_search ,'%')
						OR U.userName LIKE CONCAT('%', p_search ,'%')
					)
	);
	
	SELECT
	@iRows AS iRows
	, U.idUser
	, U.createDate
	, U.name
	, U.userName
	,IFNULL(
	(
		SELECT GROUP_CONCAT( R.name )
		FROM user_roles AS RC
		INNER JOIN roles AS R ON RC.idRol = R.idRol
		WHERE RC.idUser = U.idUser
	), '') AS roles
    
    ,IFNULL(
	(
		SELECT GROUP_CONCAT( O.nombre )
		FROM origenes AS O
		INNER JOIN origenes_config AS OC ON OC.idOrigen = O.idOrigen
		WHERE OC.idUser = U.idUser
	), '') AS origenes
	, U.active
	FROM users as U
	WHERE
	(
		p_search = ''
		OR U.name LIKE CONCAT('%', p_search ,'%')
		OR U.userName LIKE CONCAT('%', p_search ,'%')
	)
    ORDER BY U.idUser DESC
	LIMIT p_start, p_limiter;

SET SESSION TRANSACTION ISOLATION LEVEL REPEATABLE READ ;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getVendedorByID` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getVendedorByID`(IN p_idVendedor BIGINT)
BEGIN

    SELECT
        V.idVendedor,
        V.createDate,
        V.nombre,
        V.fechaIngreso,
        V.fechaNacimiento,
        V.sexo,
        V.idUser,
        CONCAT( U.name, ' - ', U.userName ) AS userName,
        
        V.idStatusVendedor,
        CSV.name AS statusVendedorDesc,
        V.calle,
        V.numExt,
        V.numInt,
        V.entreCalle,
        V.codigocolonia,
        CO.nombre AS colonia,
        MU.nombre AS municipio,
        ES.nombre AS estado,
        CO.codigopostal,
        V.rfc,
        V.telefono,
        V.email,
        V.lat,
        V.long,
        V.active
    FROM vendedores AS V
    LEFT JOIN users AS U ON U.idUser = V.idUser
    LEFT JOIN colonias CO ON CO.codigocolonia = V.codigocolonia
    LEFT JOIN municipios MU ON MU.codigomunicipio = CO.codigomunicipio AND MU.codigoestado = CO.codigoestado
    LEFT JOIN estados ES ON ES.codigoestado = CO.codigoestado
    INNER JOIN cat_status_vendedor AS CSV
		ON
			CSV.idStatusVendedor = V.idStatusVendedor
    
    WHERE V.idVendedor = p_idVendedor;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getVendedoresListWithPage` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getVendedoresListWithPage`(IN p_search VARCHAR(500), IN p_start INT, IN p_limiter INT)
BEGIN
    SET SESSION TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;

    SET @iRows = 0;

    SET @iRows = (SELECT COUNT(*)
                  FROM vendedores AS V
                  WHERE
                  (
                      p_search = ''
                      OR V.nombre LIKE CONCAT('%', p_search, '%')
                      OR V.rfc LIKE CONCAT('%', p_search, '%')
                  ));

    SELECT
        @iRows AS iRows,
        V.idVendedor,
        V.createDate,
        V.nombre,
        V.calle,        
        V.entreCalle,
		V.codigocolonia,
        CO.nombre AS colonia,
        CD.nombre AS ciudad,
        MU.nombre AS municipio,
        ES.nombre AS estado,
        CO.codigopostal,
        V.active
    FROM vendedores AS V
	LEFT JOIN colonias CO ON CO.codigocolonia = V.codigocolonia
    LEFT JOIN ciudades CD ON CD.codigomunicipio = CO.codigomunicipio AND CD.codigoestado = CO.codigoestado AND CD.codigociudad = CO.codigociudad
	LEFT JOIN municipios MU ON MU.codigomunicipio = CD.codigomunicipio AND MU.codigoestado = CD.codigoestado
	LEFT JOIN estados ES ON ES.codigoestado = MU.codigoestado

    WHERE
    (
        p_search = ''
        OR V.nombre LIKE CONCAT('%', p_search, '%')
        OR V.rfc LIKE CONCAT('%', p_search, '%')
    )
    ORDER BY V.idVendedor DESC
    LIMIT p_start, p_limiter;

    SET SESSION TRANSACTION ISOLATION LEVEL REPEATABLE READ;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getVentaByID` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getVentaByID`(IN p_idVenta BIGINT)
BEGIN

	SELECT
	
        V.idVenta
        , V.createDate
		
		, DATE_FORMAT( V.createDate, '%d-%m-%Y') AS createDateDate
		, DATE_FORMAT( V.createDate, '%h:%i:%s %p') AS createDateHours
		
		, V.active
		
		, IFNULL( ROUND( V.subtotal ,2) ,0) AS subtotal
		, IFNULL( ROUND( V.descuento ,2) ,0) AS descuento
		, IFNULL( ROUND( V.iva ,2) ,0) AS iva
		, IFNULL( ROUND( V.total ,2) ,0) AS total
		
		, V.idCliente AS idClienteOld
		, V.idCliente
		, C.nombre AS clienteName
		, C.idTipoCliente
        , IFNULL( TC.name ,'') AS tipoClienteDesc
        , IF( C.active = 0, ' - INACTIVO', '' ) AS statusCliente
		
		, V.idSucursal
		, S.name AS sucursalName
		
		, V.idCaja
		
		, V.idTipoVenta AS idTipoVentaOld
		, V.idTipoVenta
		, CRV.name AS tipoVentaDesc
		
		, V.idVendedor
		, seller.nombre AS vendedorName
		
		, V.bClosed
		
		, IFNULL(
		(
			SELECT
			cantidad
			FROM ventas_envases AS PE
			WHERE
				PE.idVenta = V.idVenta
				AND PE.valorMedida = 20
			LIMIT 1
		)
		,0) AS cantEnvases
		
		, V.idCreateUser
		, U.name AS createUserName
        
        , V.idPedido
        , V.idOrigenVendedor
        
        , IFNULL( V.idClienteDiElect ,0) AS idClienteDiElect
        , IFNULL( V.dineroElectAcumulado ,0) AS dineroElectAcumulado
		
    FROM ventas AS V
	INNER JOIN clientes AS C ON C.idCliente = V.idCliente
	INNER JOIN sucursales AS S ON S.idSucursal = V.idSucursal
	LEFT JOIN cat_tipo_venta AS CRV ON CRV.idTipoVenta = V.idTipoVenta
	INNER JOIN vendedores AS seller ON seller.idVendedor = V.idVendedor
    LEFT JOIN cat_tipo_cliente AS TC ON TC.idTipoCliente = C.idTipoCliente
	INNER JOIN users AS U ON U.idUser = V.idCreateUser
	
    WHERE
		V.idVenta = p_idVenta
	;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getVentaDetalle` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getVentaDetalle`(
	IN p_idVenta BIGINT
	, IN p_idUserLogON BIGINT
)
BEGIN

	SET @idSucursal = 0;
	SET @idOrigen = 0;
    SET @idOrigenVendedor = 0;
	
	SELECT
	O.idOrigen, IFNULL( V.idOrigenVendedor ,0), V.idSucursal
		INTO
	@idOrigen, @idOrigenVendedor, @idSucursal
	FROM origenes AS O
	INNER JOIN ventas AS V ON V.idSucursal = O.idRelacion
	WHERE
		O.idCatRelacionOrigen = 1 -- SUCURSAL
		AND V.idVenta = p_idVenta
	LIMIT 1;
    
    SET @idOrigen = IF( @idOrigenVendedor > 0, @idOrigenVendedor, @idOrigen );

	SELECT
	
		VD.idVentaDetalle
		, VD.idVenta
        , P.idProducto
		, VD.descripcion AS articuloName
		, P.valorMedida
        , P.idUnidadMedida
		, VD.bEnvase
        , P.bEnvase AS bCanEnvase
		, ROUND( IFNULL( VD.cantidad ,0) ,0) AS cantidad
		, P.precio AS precioUnitarioOLD
        , VD.precioUnitario
		, VD.descuento
        , IFNULL( VD.precioConDescuento ,0) AS precioConDescuento
		, VD.total
        , IFNULL( VD.aplicaPromo ,0) AS aplicaPromo
        , IFNULL( VD.idPromocion ,0) AS idPromocion
        , IFNULL( VD.promoName ,'') AS promoName
        
        , IFNULL( P.idProductoRelacion ,0) AS idProductoRelacion
        , IFNULL( PR.precio ,0) AS productoRelacionPrecio
        , IFNULL( P.precioEcoAgr ,0) AS precioEcoAgr
        
        , IFNULL(
		(
            SELECT ROUND( IFNULL( SS.cantidad ,0) - IFNULL( SS.cantidadBlock ,0) ,2)
            FROM stock AS SS
            WHERE
				SS.idOrigen = @idOrigen
				AND SS.idProducto = P.idProducto
            LIMIT 1
		),
		0
        ) AS canInv
		
		, IF( ( VD.idPromocion = 0 OR P.bDineroElectronico = 1 ) , 1, 0) AS bAplicaDineroElectronico
        
    FROM ventasdetalle AS VD
	INNER JOIN productos AS P ON P.active = 1 AND P.idProducto = VD.idProducto
    LEFT JOIN productos AS PR ON PR.active = 1 AND PR.idProducto = P.idProductoRelacion
	INNER JOIN cat_tipo_producto AS CTP ON CTP.active = 1 AND CTP.idCatTipoProducto = P.idCatTipoProducto
	INNER JOIN cat_descripciones AS CD ON CD.active = 1 AND CD.idDescription = P.idDescription
	INNER JOIN cat_unidad_medida AS UM ON UM.active = 1 AND UM.idUnidadMedida = P.idUnidadMedida
	WHERE
		VD.idVenta = p_idVenta
		
    ORDER BY VD.idVentaDetalle DESC;
    
	DROP TEMPORARY TABLE IF EXISTS tmp_OtrosPedidosEnviados;
	DROP TEMPORARY TABLE IF EXISTS tmp_stockMenosElUsado;
	
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getVentasEnvases` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getVentasEnvases`(
	IN p_idVenta BIGINT
)
BEGIN

	SELECT
	
		idVentasEnvases
        , idVenta
		, cantidad
        , valorMedida
        
    FROM ventas_envases
	WHERE
		idVenta = p_idVenta;
	
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getZonaByID` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getZonaByID`(
IN p_idZona INT
)
BEGIN

	SELECT
	Z.idZona
	, Z.createDate
	, Z.name
	, Z.active
	FROM zonas AS Z
	WHERE Z.idZona = p_idZona;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getZonasPaginado` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getZonasPaginado`(
IN p_search VARCHAR(500)
, IN p_start INT
, IN p_limiter INT
)
BEGIN

	SET @iRows = 0;
	
	
	SET @iRows = ( SELECT
					COUNT(*)
					FROM zonas as Z
					WHERE
					(
						p_search = ''
						OR Z.name LIKE CONCAT('%', p_search ,'%')
					)
	);
	
	SELECT
	@iRows AS iRows
	, Z.idZona
	, Z.createDate
	, Z.name
	, Z.active
	FROM zonas as Z
	WHERE
	(
		p_search = ''
		OR Z.name LIKE CONCAT('%', p_search ,'%')
	)
    ORDER BY Z.idZona DESC
	LIMIT p_start, p_limiter;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `guardarEnvasesPedido` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `guardarEnvasesPedido`(
  IN p_idPedido BIGINT,
  IN p_valorMedida DECIMAL(18,2),
  IN p_cantidad INT,
  IN p_idUserLogON BIGINT
)
BEGIN
  IF EXISTS (SELECT 1 FROM pedidos_envases WHERE idPedido = p_idPedido AND valorMedida = p_valorMedida) THEN
    UPDATE pedidos_envases
      SET cantidad = p_cantidad
      WHERE idPedido = p_idPedido AND valorMedida = p_valorMedida;
  ELSE
    INSERT INTO pedidos_envases(idPedido, cantidad, valorMedida)
      VALUES (p_idPedido, p_cantidad, p_valorMedida);
  END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insertAction` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `insertAction`(
IN p_name VARCHAR(500)
, IN p_description VARCHAR(500)

, IN p_idUserC BIGINT
)
BEGIN

	INSERT INTO actions(
	createDate
	, name
	, description
	, active
	)
	SELECT
	NOW()
	,p_name
	,p_description
	,1;

	SELECT LAST_INSERT_ID() AS out_id;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insertActionByIdRelation` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `insertActionByIdRelation`(
IN p_relationType VARCHAR(5)
, IN p_idRelation BIGINT
, IN p_idAction BIGINT

, IN p_idUserC BIGINT
)
BEGIN

	SET @out_id = 0;
	SET @message = '';
	
	INSERT INTO actionsconf(
	createDate
	, relationType
	, idRelation
	, idAction
	, active
	)
	SELECT
	NOW()
	, p_relationType
	, p_idRelation
	, p_idAction
	, 1;
	
	SET @out_id = LAST_INSERT_ID();
	
	SET @message = 'Guardado con éxito';

	SELECT @out_id AS out_id
	, @message AS message;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `InsertarMateriaPrimaJSON` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertarMateriaPrimaJSON`(IN jsonData JSON)
BEGIN
    DECLARE i INT DEFAULT 0;
    DECLARE total INT;
    DECLARE idMateria INT;
    DECLARE nombre VARCHAR(100);
    DECLARE cantFormula DECIMAL(10,2);
    DECLARE cantXLitro DECIMAL(10,2);
    DECLARE cantNecesaria DECIMAL(10,2);
    
    -- Contar elementos en el JSON
    SET total = JSON_LENGTH(jsonData);

    -- Loop para recorrer los elementos del JSON
    WHILE i < total DO
        -- Extraer datos de cada objeto
        SET idMateria = JSON_UNQUOTE(JSON_EXTRACT(jsonData, CONCAT('$[', i, '].idMateriaPrima')));
        SET nombre = JSON_UNQUOTE(JSON_EXTRACT(jsonData, CONCAT('$[', i, '].materiaPrimaName')));
        SET cantFormula = JSON_EXTRACT(jsonData, CONCAT('$[', i, '].cantFormula'));
        SET cantXLitro = JSON_EXTRACT(jsonData, CONCAT('$[', i, '].cantFormulaXLitro'));
        SET cantNecesaria = JSON_EXTRACT(jsonData, CONCAT('$[', i, '].cantNecesaria'));

        -- Insertar en la tabla
        SELECT idMateria, nombre, cantFormula, cantXLitro, cantNecesaria;

        -- Incrementar contador
        SET i = i + 1;
    END WHILE;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insertMenuPermisoByIdRelation` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `insertMenuPermisoByIdRelation`(
IN p_relationType VARCHAR(5)
, IN p_idRelation BIGINT
, IN p_idMenu BIGINT

, IN p_idUserC BIGINT
)
BEGIN

	SET @out_id = 0;
	SET @message = '';
	
	INSERT INTO menupermisos(
	createDate
	, typeRelation
	, idRelation
	, idMenu
	, active
	)
	SELECT
	NOW()
	, p_relationType
	, p_idRelation
	, p_idMenu
	, 1;
	
	SET @out_id = LAST_INSERT_ID();
	
	SET @message = 'Guardado con éxito';

	SELECT @out_id AS out_id
	, @message AS message;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insertOrigenByIdUser` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `insertOrigenByIdUser`(
IN p_idUser BIGINT
, IN p_idOrigen BIGINT
, IN p_oGetDateNow DATETIME
)
BEGIN

	SET @out_id = 0;
	SET @message = '';

	IF
	(
		SELECT
		COUNT(*)
		FROM origenes_config
		WHERE idUser = p_idUser
		AND idOrigen = p_idOrigen
	) = 0
	THEN
	
		SET @bPrincipal = 0;
		
		-- SOLO CUANDO ES EL PRIMER ORIGEN QUE LE AGREGAN SE COMBIERTE EN LA PRINCIPAL
		SET @bPrincipal = IFNULL(
		(
			SELECT
			CASE WHEN COUNT(*) > 0 THEN 0 ELSE 1 END
			FROM origenes_config
			WHERE
				idUser = p_idUser
		)
		,0);
		
		INSERT INTO origenes_config(
		createDate
		, idUser
		, idOrigen
		, bPrincipal
		)
		SELECT
		p_oGetDateNow
		, p_idUser
		, p_idOrigen
		, @bPrincipal;
		
		SET @out_id = ( SELECT LAST_INSERT_ID() );
		
		SET @message = 'Guardado con éxito';
		
		
	ELSE
		SET @message = 'No se puede agregar dos veces el mismo origen';
	END IF;

	SELECT @out_id AS out_id
	, @message AS message;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insertOrinResponsable` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `insertOrinResponsable`(
IN p_oGetDateNow DATETIME
, IN p_idUser BIGINT
, IN p_idOrigen BIGINT
, IN p_idUserLogON BIGINT
)
BEGIN

	SET @out_id = 0;
	SET @message = '';

	IF
	(
		SELECT
		COUNT(*)
		FROM origenes_responsables AS SC
		WHERE idUser = p_idUser
		AND idOrigen = p_idOrigen
	) = 0
	THEN
	
		SET @bPrincipal = 0;
		
		-- SOLO CUANDO ES LA PRIMER SUCURSAL QUE LE AGREGAN SE COMBIERTE EN LA PRINCIPAL
		SET @bPrincipal = IFNULL(
		(
			SELECT
			CASE WHEN COUNT(*) > 0 THEN 0 ELSE 1 END
			FROM origenes_responsables AS SC
			WHERE
				idOrigen = p_idOrigen
		)
		,0);
		
		INSERT INTO origenes_responsables(
		createDate
		, idOrigen
		, idUser
		, bPrincipal
		, idCreateUser
		)
		SELECT
		p_oGetDateNow
		, p_idOrigen
		, p_idUser
		, @bPrincipal
		, p_idUserLogON
		;
		
		SET @out_id = ( SELECT LAST_INSERT_ID() );
		
		SET @message = 'Guardado con éxito';
		
		
	ELSE
		SET @message = 'No se puede agregar dos veces el mismo responsable';
	END IF;

	SELECT @out_id AS out_id
	, @message AS message;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insertProdProdAgranelStock` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `insertProdProdAgranelStock`(
	IN p_idProdProdAgranelDetalle BIGINT
	, IN jsonData JSON
)
BEGIN

	DECLARE mensaje_error TEXT;
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        -- Capturar el mensaje de error
        GET DIAGNOSTICS CONDITION 1 mensaje_error = MESSAGE_TEXT;
		SELECT 0 AS out_id, mensaje_error AS message;
    END;

    SET @i = 0;
    SET @total = 0;

    -- Obtener la cantidad de elementos en el JSON
    SET @total = JSON_LENGTH(jsonData);

    -- Recorrer el JSON e insertar directamente
    WHILE @i < @total DO
	
        INSERT INTO prod_prod_agranel_stock (
            idProdProdAgranelDetalle, idStock, cantidadConsumida, costoUnitario, costoTotal
        ) VALUES (
			p_idProdProdAgranelDetalle,
            JSON_EXTRACT(jsonData, CONCAT('$[', @i, '].idStock')),
            JSON_EXTRACT(jsonData, CONCAT('$[', @i, '].cantidadDisponible')),
            0,
            0
        );

        -- Incrementar contador
        SET @i = @i + 1;
		
    END WHILE;
		
	SELECT 1 AS out_id, 'Insertado con éxito.' AS message;
	
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insertProdProdBaseStock` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `insertProdProdBaseStock`(
	IN oGetDateNow DATETIME
	, IN p_articuloName VARCHAR(5000)
	, IN p_idProdProdBaseDetalle BIGINT
	, IN jsonData JSON
)
BEGIN

	DECLARE mensaje_error TEXT;
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        -- Capturar el mensaje de error
        GET DIAGNOSTICS CONDITION 1 mensaje_error = MESSAGE_TEXT;
		SELECT 0 AS out_id, mensaje_error AS message;
    END;
	
	DROP TEMPORARY TABLE IF EXISTS tmp_stock;
    -- Tabla temporal para Agranel
    CREATE TEMPORARY TABLE IF NOT EXISTS tmp_stock (
        idTmp INT AUTO_INCREMENT PRIMARY KEY,
        idOrigen BIGINT,
		idMateriaPrima BIGINT,
        cantidadConsumida DECIMAL(18,2)
    );

    -- Procesar jsonData
    SET @i = 0;
    SET @total = JSON_LENGTH(jsonData);

    WHILE @i < @total DO
        INSERT INTO tmp_stock (
            idOrigen, idMateriaPrima, cantidadConsumida
        ) VALUES (
            1,
            JSON_EXTRACT(jsonData, CONCAT('$[', @i, '].idMateriaPrima')),
            JSON_EXTRACT(jsonData, CONCAT('$[', @i, '].cantidadConsumida'))
        );
        SET @i = @i + 1;
    END WHILE;
	
	-- Insertar en stock_block_log para Agranel
    INSERT INTO stock_block_log (
        createDate,
        active,
        idOrigen,
        idProducto,
        cantidad,
        idRelation,
        relationType,
        motivoDesc
    )
    SELECT 
        oGetDateNow,
        1,
        idOrigen,
        idMateriaPrima,
        cantidadConsumida,
        p_idProdProdBaseDetalle,
        'ProdProdBase',
        CONCAT('Bloqueado por el base #', p_idProdProdBaseDetalle, ' Prod: ', p_articuloName)
    FROM tmp_stock;

    -- Actualizar stock para Agranel
    UPDATE stock s
    INNER JOIN tmp_stock AS pcd ON s.idProducto = pcd.idMateriaPrima AND s.idOrigen = pcd.idOrigen
    SET s.cantidadBlock = IFNULL(s.cantidadBlock, 0) + pcd.cantidadConsumida;

	UPDATE
		prod_prod_base_detalle
	SET
		costo = 0
		, costoTotal = 0
		, bOK = 1
	WHERE
		idProdProdBaseDetalle = p_idProdProdBaseDetalle
		;

    SELECT 1 AS out_id, 'Insertado con éxito.' AS message;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insertProdProdFinalInsumosStock` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `insertProdProdFinalInsumosStock`(
	IN p_idProdProdFinalDetalle BIGINT
	, IN jsonData JSON
)
BEGIN

	DECLARE mensaje_error TEXT;
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        -- Capturar el mensaje de error
        GET DIAGNOSTICS CONDITION 1 mensaje_error = MESSAGE_TEXT;
		SELECT 0 AS out_id, mensaje_error AS message;
    END;

    SET @i = 0;
    SET @total = 0;

    -- Obtener la cantidad de elementos en el JSON
    SET @total = JSON_LENGTH(jsonData);

    -- Recorrer el JSON e insertar directamente
    WHILE @i < @total DO
	
        INSERT INTO prod_prod_final_insumos_stock (
            idProdProdFinalDetalle, idStock, cantidadDisponible, cantidadConsumida, costoUnitario, costoTotal
        ) VALUES (
			p_idProdProdFinalDetalle,
            JSON_EXTRACT(jsonData, CONCAT('$[', @i, '].idStock')),
            JSON_EXTRACT(jsonData, CONCAT('$[', @i, '].cantidadDisp')),
			JSON_EXTRACT(jsonData, CONCAT('$[', @i, '].cantidadConsumida')),
            JSON_EXTRACT(jsonData, CONCAT('$[', @i, '].costoUnitario')),
            JSON_EXTRACT(jsonData, CONCAT('$[', @i, '].costoTotal'))
        );

        -- Incrementar contador
        SET @i = @i + 1;
		
    END WHILE;
		
	SELECT 1 AS out_id, 'Insertado con éxito.' AS message;
	
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insertProdProdFinalStock` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `insertProdProdFinalStock`(
    IN oGetDateNow DATETIME,
    IN p_idProdProdFinalH BIGINT,
	IN p_idProdProdFinalDetalle BIGINT,
	IN p_articuloName VARCHAR(5000),
    IN jsonDataAgranel JSON,
    IN jsonDataInsumos JSON
)
BEGIN

    DECLARE mensaje_error TEXT;
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS CONDITION 1 mensaje_error = MESSAGE_TEXT;
        SELECT 0 AS out_id, mensaje_error AS message;
    END;

	DROP TEMPORARY TABLE IF EXISTS tmp_stockAgranel;
    -- Tabla temporal para Agranel
    CREATE TEMPORARY TABLE IF NOT EXISTS tmp_stockAgranel (
        idTmp INT AUTO_INCREMENT PRIMARY KEY,
        idProdProdFinalH BIGINT,
        idProductoRelacion BIGINT,
        idOrigen BIGINT,
        cantidadConsumida DECIMAL(18,2)
    );

	DROP TEMPORARY TABLE IF EXISTS tmp_stockInsumos;
    -- Tabla temporal para Insumos
    CREATE TEMPORARY TABLE IF NOT EXISTS tmp_stockInsumos (
        idTmp INT AUTO_INCREMENT PRIMARY KEY,
        idProdProdFinalH BIGINT,
        idProductoRelacion BIGINT,
        idOrigen BIGINT,
        cantidadConsumida DECIMAL(18,2)
    );

    -- Procesar jsonDataAgranel
    SET @i = 0;
    SET @total = JSON_LENGTH(jsonDataAgranel);

    WHILE @i < @total DO
        INSERT INTO tmp_stockAgranel (
            idProdProdFinalH, idProductoRelacion, idOrigen, cantidadConsumida
        ) VALUES (
            p_idProdProdFinalH,
            JSON_EXTRACT(jsonDataAgranel, CONCAT('$[', @i, '].idProductoRelacion')),
            JSON_EXTRACT(jsonDataAgranel, CONCAT('$[', @i, '].idOrigen')),
            JSON_EXTRACT(jsonDataAgranel, CONCAT('$[', @i, '].cantidadConsumida'))
        );
        SET @i = @i + 1;
    END WHILE;

    -- Procesar jsonDataInsumos
    SET @j = 0;
    SET @totalInsumos = JSON_LENGTH(jsonDataInsumos);

    WHILE @j < @totalInsumos DO
        INSERT INTO tmp_stockInsumos (
            idProdProdFinalH, idProductoRelacion, idOrigen, cantidadConsumida
        ) VALUES (
            p_idProdProdFinalH,
            JSON_EXTRACT(jsonDataInsumos, CONCAT('$[', @j, '].idInsumo')),
            JSON_EXTRACT(jsonDataInsumos, CONCAT('$[', @j, '].idOrigen')),
            JSON_EXTRACT(jsonDataInsumos, CONCAT('$[', @j, '].cantidadConsumida'))
        );
        SET @j = @j + 1;
    END WHILE;

    -- Insertar en stock_block_log para Agranel
    INSERT INTO stock_block_log (
        createDate,
        active,
        idOrigen,
        idProducto,
        cantidad,
        idRelation,
        relationType,
        motivoDesc
    )
    SELECT 
        oGetDateNow,
        1,
        idOrigen,
        idProductoRelacion,
        SUM(cantidadConsumida),
        p_idProdProdFinalDetalle,
        'ProdProdF',
        CONCAT('Bloqueado por el envasado #', idProdProdFinalH, ' Prod: ', p_articuloName)
    FROM tmp_stockAgranel
    GROUP BY idProductoRelacion, idOrigen, idProdProdFinalH;

    -- Insertar en stock_block_log para Insumos
    INSERT INTO stock_block_log (
        createDate,
        active,
        idOrigen,
        idProducto,
        cantidad,
        idRelation,
        relationType,
        motivoDesc
    )
    SELECT 
        oGetDateNow,
        1,
        idOrigen,
        idProductoRelacion,
        SUM(cantidadConsumida),
        p_idProdProdFinalDetalle,
        'ProdProdF',
        CONCAT('Bloqueado por el envasado #', idProdProdFinalH, ' Prod: ', p_articuloName)
    FROM tmp_stockInsumos
    GROUP BY idProductoRelacion, idOrigen, idProdProdFinalH;

    -- Actualizar stock para Agranel
    UPDATE stock s
    JOIN (
        SELECT idOrigen, idProductoRelacion, SUM(cantidadConsumida) AS cantidadConsumida
        FROM tmp_stockAgranel
        GROUP BY idOrigen, idProductoRelacion
    ) pcd ON s.idProducto = pcd.idProductoRelacion AND s.idOrigen = pcd.idOrigen
    SET s.cantidadBlock = IFNULL(s.cantidadBlock, 0) + pcd.cantidadConsumida;

    -- Actualizar stock para Insumos
    UPDATE stock s
    JOIN (
        SELECT idOrigen, idProductoRelacion, SUM(cantidadConsumida) AS cantidadConsumida
        FROM tmp_stockInsumos
        GROUP BY idOrigen, idProductoRelacion
    ) pcd ON s.idProducto = pcd.idProductoRelacion AND s.idOrigen = pcd.idOrigen
    SET s.cantidadBlock = IFNULL(s.cantidadBlock, 0) + pcd.cantidadConsumida;

    SELECT 1 AS out_id, 'Insertado con éxito.' AS message;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insertRol` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `insertRol`(
IN p_oGetDateNow DATETIME
, IN p_name VARCHAR(500)
, IN p_description VARCHAR(500)

, IN p_idUserC BIGINT
)
BEGIN

	SET @idRol = 0;
	SET @out_id = 0;
	SET @message = '';
	
	SET @idRol = IFNULL(
	(
		SELECT
		idRol
		FROM roles
		WHERE name = p_name
		LIMIT 1
	)
	,0);
	
	IF @idRol = 0 THEN

		INSERT INTO roles(
		createDate
		, name
		, description
		, active
		)
		SELECT
		p_oGetDateNow
		, p_name
		, p_description
		, 1;
		
		SET @out_id = LAST_INSERT_ID();
		SET @message = 'Rol guardado con éxito.';
	
	ELSE
		SET @out_id = 0;
		SET @message = 'El nombre del rol ya se está utilizando.';
	END IF;

	SELECT @out_id AS out_id, @message AS message;
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insertRolByIdUser` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `insertRolByIdUser`(
IN p_idUser BIGINT
, IN p_idRol BIGINT
, IN p_oGetDateNow DATETIME
)
BEGIN

	SET @out_id = 0;
	SET @message = '';

	IF
	(
		SELECT
		COUNT(*)
		FROM user_roles AS UR
		WHERE idUser = p_idUser
		AND idRol = p_idRol
	) = 0
	THEN
		
		INSERT INTO user_roles(
		createDate
		, idUser
		, idRol
		)
		SELECT
		p_oGetDateNow
		, p_idUser
		, p_idRol;
		
		SET @out_id = ( SELECT LAST_INSERT_ID() );
		
		SET @message = 'Guardado con éxito';
		
	ELSE
		SET @message = 'No se puede agregar dos veces el mismo Rol';
	END IF;

	SELECT @out_id AS out_id
	, @message AS message;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insertSucursalByIdUser` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `insertSucursalByIdUser`(
IN p_idUser BIGINT
, IN p_idSucursal BIGINT
, IN p_oGetDateNow DATETIME
)
BEGIN

	SET @out_id = 0;
	SET @message = '';

	IF
	(
		SELECT
		COUNT(*)
		FROM sucursalesconfig AS SC
		WHERE idUser = p_idUser
		AND idSucursal = p_idSucursal
	) = 0
	THEN
	
		SET @bPrincipal = 0;
		
		-- SOLO CUANDO ES LA PRIMER SUCURSAL QUE LE AGREGAN SE COMBIERTE EN LA PRINCIPAL
		SET @bPrincipal = IFNULL(
		(
			SELECT
			CASE WHEN COUNT(*) > 0 THEN 0 ELSE 1 END
			FROM sucursalesconfig AS SC
			WHERE
				idUser = p_idUser
		)
		,0);
		
		INSERT INTO sucursalesconfig(
		createDate
		, idUser
		, idSucursal
		, bPrincipal
		)
		SELECT
		p_oGetDateNow
		, p_idUser
		, p_idSucursal
		, @bPrincipal;
		
		SET @out_id = ( SELECT LAST_INSERT_ID() );
		
		SET @message = 'Guardado con éxito';
		
		
	ELSE
		SET @message = 'No se puede agregar dos veces la misma sucursal';
	END IF;

	SELECT @out_id AS out_id
	, @message AS message;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insertUpdateAction` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `insertUpdateAction`(
IN oGetDateNow DATETIME
, IN p_idActionSection SMALLINT
, IN p_idAction BIGINT
, IN p_name VARCHAR(50)
, IN p_nameHtml VARCHAR(50)
, IN p_description VARCHAR(1000)
, IN p_active SMALLINT
)
BEGIN

	SET @out_id = 0;
	SET @message = '';
	
	IF p_idAction = 0 THEN

		INSERT INTO actions(
		createDate
		, idActionSection
		, name
		, nameHtml
		, description
		, active
		)
		SELECT
		oGetDateNow
		, p_idActionSection
		, p_name
		, p_nameHtml
		, p_description
		, p_active;
		
		SET @out_id = LAST_INSERT_ID();
		
	ELSE
	
		UPDATE
			actions
		SET
			name = p_name
			, nameHtml = p_nameHtml
			, description = p_description
			, active = p_active
		WHERE
			idAction = p_idAction
		;
			
		SET @out_id = p_idAction;
	END IF;
	
	SET @message = 'Guardado con éxito.';
	
	SELECT @out_id AS out_id, @message AS message;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insertUpdateActionsConf` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `insertUpdateActionsConf`(
    IN p_relationType VARCHAR(10),
    IN p_idRelation INT,
    IN p_jsonList JSON,
    IN p_idUserLogON INT
)
BEGIN
    DECLARE totalRows INT DEFAULT 0;
    DECLARE i INT DEFAULT 0;
    DECLARE v_idAction INT;
    DECLARE v_bPermissionAction INT;
	
	DECLARE mensaje_error TEXT;
    
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        -- Capturar el mensaje de error
        GET DIAGNOSTICS CONDITION 1 mensaje_error = MESSAGE_TEXT;
		SELECT 0 AS out_id, mensaje_error AS message;
    END;

    SET totalRows = IFNULL(JSON_LENGTH(p_jsonList), 0);
	
	SET @out_id = 0;
    SET @message = '';
	
	IF p_idRelation > 0 AND LENGTH(p_relationType) > 0 AND p_relationType IN('R','U') THEN

		WHILE i < totalRows DO
			SET v_idAction = IFNULL(CAST(JSON_UNQUOTE(JSON_EXTRACT(p_jsonList, CONCAT('$[', i, '].idAction'))) AS UNSIGNED), 0);
			SET v_bPermissionAction = IFNULL(CAST(JSON_UNQUOTE(JSON_EXTRACT(p_jsonList, CONCAT('$[', i, '].bPermissionAction'))) AS UNSIGNED), 0);

			IF v_bPermissionAction = 1 THEN
				-- Insertar si no existe
				IF NOT EXISTS (
					SELECT 1 FROM actionsconf
					WHERE relationType = p_relationType
					  AND idRelation = p_idRelation
					  AND idAction = v_idAction
					  AND active = 1
				) THEN
					INSERT INTO actionsconf (createDate, relationType, idRelation, idAction, active)
					VALUES (NOW(), p_relationType, p_idRelation, v_idAction, 1);
				END IF;
			ELSE
				-- Eliminar si existe y está activo
				DELETE FROM actionsconf
				WHERE relationType = p_relationType
				  AND idRelation = p_idRelation
				  AND idAction = v_idAction
				  AND active = 1;
			END IF;

			SET i = i + 1;
		END WHILE;
		
		SET @out_id = 1;
		SET @message = 'Guardado con éxito.';
	ELSE
		SET @out_id = 0;
		SET @message = 'No se pudo guardar.';
	END IF;
	
	SELECT @out_id AS out_id, @message AS message;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insertUpdateActionSection` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `insertUpdateActionSection`(
IN p_idActionSection SMALLINT
, IN p_sectionName VARCHAR(500)
, IN p_iLugar INT
, IN p_active SMALLINT
)
BEGIN

	SET @out_id = 0;
	SET @message = '';
	
	IF p_idActionSection = 0 THEN

		INSERT INTO actionsection(
		sectionName
		, iLugar
		, active
		)
		SELECT
		p_sectionName
		, p_iLugar
		, p_active;
		
		SET @out_id = LAST_INSERT_ID();
		
	ELSE
	
		UPDATE
			actionsection
		SET
			sectionName = p_sectionName
			, iLugar = p_iLugar
			, active = p_active
		WHERE
			idActionSection = p_idActionSection
		;
			
		SET @out_id = p_idActionSection;
	END IF;
	
	SET @message = 'Guardado con éxito.';
	
	SELECT @out_id AS out_id, @message AS message;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insertUpdateAlmacen` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `insertUpdateAlmacen`(
IN p_oGetDateNow DATETIME
, IN p_idAlmacen SMALLINT
, IN p_name VARCHAR(45)
, IN p_idCatRelacionOrigen SMALLINT
, IN p_calle VARCHAR(45)
, IN p_entreCalles VARCHAR(45)
, IN p_codigocolonia INT
, IN p_telefono VARCHAR(20)
, IN p_email VARCHAR(100)
, IN p_numExt VARCHAR(10)
, IN p_numInt VARCHAR(10)
, IN p_lat FLOAT
, IN p_long FLOAT
, IN p_active SMALLINT
)
BEGIN

	SET @out_id = 0;
	SET @message = '';
	
	SET @idCatRelacionOrigenOld = 0;
	
	IF p_idAlmacen = 0 THEN

		INSERT INTO `almacenes`
		(
			`createDate`
			,`name`
			,`idCatRelacionOrigen`
			,`calle`
			,`entreCalles`
            ,`codigocolonia`
			,`telefono`
			,`email`
			,`numExt`
			,`numInt`
			,`lat`
			,`long`
			,`active`
		)
		SELECT
		p_oGetDateNow
		, p_name
		, p_idCatRelacionOrigen
		, p_calle
		, p_entreCalles
        , p_codigocolonia
		, p_telefono
		, p_email
		, p_numExt
		, p_numInt
		, p_lat
		, p_long
		, p_active;
		
		SET @out_id = LAST_INSERT_ID();
		SET @idCatRelacionOrigenOld = p_idCatRelacionOrigen;
		
	ELSE
	
		SET @idCatRelacionOrigenOld = IFNULL(
		(
			SELECT
			idCatRelacionOrigen
			FROM almacenes
			WHERE
				idAlmacen = p_idAlmacen
		)
		,0);
	
		UPDATE
			`almacenes`
		SET
			`createDate` = p_oGetDateNow,
			`name` = p_name,
			`idCatRelacionOrigen` = p_idCatRelacionOrigen,
			`calle` = p_calle,
			`entreCalles` = p_entreCalles,
            `codigocolonia`= p_codigocolonia,	
			`telefono` = p_telefono,
			`email` = p_email,
			`numExt` = p_numExt,
			`numInt` = p_numInt,
			`lat` = p_lat,
			`long` = p_long,
			`active` = p_active
		WHERE 
			`idAlmacen` = p_idAlmacen
		;
			
		SET @out_id = p_idAlmacen;
	END IF;
    
	UPDATE
		origenes
	SET
		nombre = p_name
		, idCatRelacionOrigen = p_idCatRelacionOrigen
	WHERE
		idCatRelacionOrigen = @idCatRelacionOrigenOld
		AND idRelacion = @out_id
	;
	
	INSERT INTO origenes ( nombre, idRelacion, idCatRelacionOrigen, active )
	SELECT
	
		name
		, S.idAlmacen
		, p_idCatRelacionOrigen
		, 1
	
	FROM almacenes AS S
	LEFT JOIN origenes AS O
		ON
			O.idCatRelacionOrigen = p_idCatRelacionOrigen
			AND O.idRelacion = S.idAlmacen
	WHERE
		O.idOrigen IS NULL
		AND S.idAlmacen = @out_id
		;
	
	SET @message = 'Guardado con éxito.';
	
	SELECT @out_id AS out_id, @message AS message;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insertUpdateCliente` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `insertUpdateCliente`(
    IN p_oGetDateNow DATETIME,
    IN p_idCliente BIGINT,
    IN p_createDate DATETIME,
    IN p_idVendedor BIGINT,
    IN p_nombre VARCHAR(100),
    IN p_idTipoCliente INT,
    IN p_calle VARCHAR(100),
    IN p_numExt VARCHAR(45),
    IN p_numInt VARCHAR(45),
	IN p_entreCalles VARCHAR(45),
    IN p_codigocolonia INT,
    IN P_razonSocial VARCHAR(45),
    IN p_rfc VARCHAR(45),
    IN p_telefono VARCHAR(45),
    IN p_email VARCHAR(100),
    IN p_lat FLOAT,
    IN p_long FLOAT,
    IN p_active SMALLINT,
	IN p_bCredito SMALLINT,
	IN p_iDiasCredito INT,
	IN p_limiteCredito DECIMAL( 18, 2 ),
    IN p_bPuntoDVenta SMALLINT,
	IN p_bDineroElectronico SMALLINT,
    IN p_idZona INT,
	IN p_bProspecto SMALLINT,
	IN p_bFProspecto SMALLINT,
	IN p_compraEstimada DECIMAL( 18, 2 ),
	IN p_idGiro INT
)
BEGIN
    SET @out_id = 0;
    SET @message = '';

    IF p_idCliente = 0 THEN
		IF EXISTS (SELECT 1 FROM clientes WHERE telefono = p_telefono AND LENGTH( telefono ) > 0 ) THEN
			SET @out_id = 0;
			SET @message = 'No se puede repetir el número de teléfono, ya existe otro cliente con ese número.';
		ELSE
			INSERT INTO `clientes` (        
				`idVendedor`,
				`createDate`,
				`nombre`,
				`idTipoCliente`,
				`calle`,
				`numExt`,
				`numInt`,      
				`entreCalles`,
				`codigocolonia`,
				`razonSocial`,
				`rfc`,
				`telefono`,
				`email`,
				`lat`,
				`long`,
				`active`,
				`bCredito`,
				`iDiasCredito`,
				`limiteCredito`,
				`bPuntoDVenta`,
				`bDineroElectronico`,
                `idZona`,
				`bProspecto`,
				`bFProspecto`,
				`compraEstimada`,
				`idGiro`,
				`bCompraMin`
			)
			VALUES (
				p_idVendedor,
				p_createDate,
				TRIM( p_nombre ),
				p_idTipoCliente,
				p_calle,
				p_numExt,
				p_numInt,       
				p_entreCalles,
				p_codigocolonia,
				P_razonSocial,
				p_rfc,
				p_telefono,
				p_email,
				p_lat,
				p_long,
				p_active,
				p_bCredito,
				p_iDiasCredito,
				p_limiteCredito,
				p_bPuntoDVenta,
				p_bDineroElectronico,
                IF( IFNULL( p_idZona ,0) = 0, 1, p_idZona),
				p_bProspecto,
				p_bFProspecto,
				p_compraEstimada,
				IFNULL( p_idGiro ,0),
				IF( p_idTipoCliente = 2, 1, 0 ) -- SI ES UN CLIENTE NORMAL, YA TIENE ACTIVA LA COMPRA MINIMA
			);

			SET @out_id = LAST_INSERT_ID();
			SET @message = 'Guardado con éxito.';
			
		END IF;
    ELSE
		-- Validar que el teléfono no esté en otro cliente
		IF EXISTS (SELECT 1 FROM clientes WHERE telefono = p_telefono AND idCliente <> p_idCliente AND LENGTH( telefono ) > 0 ) THEN
			SET @out_id = 0;
			SET @message = 'No se puede repetir el número de teléfono, ya existe otro cliente con ese número.';
		ELSE
		
			SET @idTipoClienteOld = 0;
			SET @bCompraMinOld = 0;
			SET @bCompraMinNew = 0;
			
			SELECT
			
				idTipoCliente
				, bCompraMin
			INTO
				@idTipoClienteOld
				, @bCompraMinOld
				
			FROM clientes
			WHERE
				idCliente = p_idCliente
				;
				
			-- SI BAJA EL TIPO DE CLIENTE
			SET @bCompraMinNew =
			-- SI ERA D Emprendedor Premium Y SE BAJA A D Emprendedor, CLIENTE, D a Detalle, Cliente frecuente SE QUEDA COMO ESTABA
			CASE WHEN @idTipoClienteOld = 4 AND p_idTipoCliente IN( 3,2,6,5 ) THEN @bCompraMinOld
					-- SI ERA D Emprendedor Y SE BAJA A CLIENTE, D a Detalle, Cliente frecuente SE QUEDA COMO ESTABA
					WHEN @idTipoClienteOld = 3 AND p_idTipoCliente IN( 2,6,5 ) THEN @bCompraMinOld
					-- SI ERA D a Detalle Y SE BAJA Cliente frecuente SE QUEDA COMO ESTABA
					WHEN @idTipoClienteOld = 6 AND p_idTipoCliente IN( 5 ) THEN @bCompraMinOld
					-- SI NO CAMBIA ENTONCES SE QUEDA COMO ESTABA
                    WHEN @idTipoClienteOld = p_idTipoCliente THEN @bCompraMinOld
					ELSE 0 END
					;
		
			UPDATE `clientes`
			SET
				`idVendedor` = p_idVendedor,
				`createDate` = p_createDate,
				`nombre` = TRIM( p_nombre ),
				`idTipoCliente` = p_idTipoCliente,
				`calle` = p_calle,
				`numExt` = p_numExt,
				`numInt` = p_numInt,
				`entreCalles` = p_entreCalles,
				`codigocolonia`= p_codigocolonia,
				`razonSocial` = P_razonSocial,
				`rfc` = p_rfc,
				`telefono` = p_telefono,
				`email` = p_email,
				`lat` = p_lat,
				`long` = p_long,
				`active` = p_active,
				`bCredito` = p_bCredito,
				`iDiasCredito` = p_iDiasCredito,
				`limiteCredito` = p_limiteCredito,
				`bPuntoDVenta` = p_bPuntoDVenta,
				`bCompraMin` = @bCompraMinNew,
				`bDineroElectronico` = p_bDineroElectronico,
                `idZona` = IF( IFNULL( p_idZona ,0) = 0, 1, p_idZona),
				`bProspecto` = p_bProspecto,
				`bFProspecto` = p_bFProspecto,
				`compraEstimada` = p_compraEstimada,
				`idGiro` = p_idGiro
			WHERE `idCliente` = p_idCliente;

			SET @out_id = p_idCliente;
			SET @message = 'Guardado con éxito.';
			
		END IF;
		
    END IF;

    SELECT @out_id AS out_id, @message AS message;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insertUpdateCotizacion` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `insertUpdateCotizacion`(
    IN oGetDateNow DATETIME,
    IN p_idCotizacion BIGINT,
    IN p_idCliente BIGINT,
    IN p_idTipoVenta BIGINT,
    IN p_comments VARCHAR(5000),
    IN p_cantEnvases DECIMAL(20,2),
    
    IN p_idSucursal BIGINT,
    IN P_idUserLogON BIGINT
)
BEGIN

    SET @out_id = 0;
    SET @message = '';
    
    SET @idSucursal = IFNULL(p_idSucursal, 0);
    
    IF @idSucursal > 0 THEN
    
        IF p_idCotizacion = 0 THEN
        
            INSERT INTO cotizaciones
            (
                createDate
                , active
                , idSucursal
                , idCreateUser
                , idCliente
                , idCatStatusCotizaciones
                , idTipoVenta
                , comments
                , idCotizacionNuevo
            )
            SELECT
                oGetDateNow
                , 1
                , @idSucursal
                , P_idUserLogON
                , p_idCliente
                , 1
                , p_idTipoVenta
                , p_comments
                , 0
            ;
            
            SET p_idCotizacion = LAST_INSERT_ID();
            
        ELSE
        
            UPDATE cotizaciones
            SET
                idCliente = p_idCliente
                , idSucursal = @idSucursal
                , idTipoVenta = p_idTipoVenta
                , comments = p_comments
            WHERE
                idCotizacion = p_idCotizacion;
            
        END IF;
        
        SET @idProductoEnvase20LT = 0;
        
        SELECT
            `value`
        INTO
            @idProductoEnvase20LT
        FROM constantes
        WHERE
            `key` = 'envase20LT'
        ;
        
        IF p_cantEnvases > 0 AND @idProductoEnvase20LT > 0 THEN
        
            IF EXISTS (SELECT 1 FROM cotizaciones_envases WHERE idCotizacion = p_idCotizacion AND valorMedida = 20) THEN
                UPDATE cotizaciones_envases
                SET cantidad = p_cantEnvases
                WHERE idCotizacion = p_idCotizacion AND valorMedida = 20;
            ELSE
                INSERT INTO cotizaciones_envases(idCotizacion, idProducto, cantidad, valorMedida)
                VALUES (p_idCotizacion, @idProductoEnvase20LT, p_cantEnvases, 20);
            END IF;
        
        END IF;
        
        IF p_cantEnvases = 0 AND
        EXISTS (SELECT 1 FROM cotizaciones_envases WHERE idCotizacion = p_idCotizacion AND valorMedida = 20)
        THEN
        
            DELETE FROM cotizaciones_envases WHERE idCotizacion = p_idCotizacion AND valorMedida = 20;
        
        END IF;
        
        SET @out_id = p_idCotizacion;
        SET @message = 'Guardado con éxito.';
    
    ELSE
        
        SET @out_id = 0;
        SET @message = 'El usuario no tiene sucursal configurada.';
    
    END IF;

    SELECT @out_id AS id, @message AS message;
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insertUpdateCotizacionDetalle` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `insertUpdateCotizacionDetalle`(
    IN p_idCotizacion BIGINT,
	IN p_idCotizacionDetalle BIGINT,
    IN p_idProducto BIGINT,
    IN p_bEnvase SMALLINT,
    IN p_cantidad DECIMAL(18,2)
)
BEGIN
    -- Limpieza/Inicialización de variables
    SET @out_id = 0;
    SET @message = '';
    SET @precioUnitario = 0;
    SET @existe_id = NULL;
    SET @id_agrupado = NULL;
    SET @cantidad_agrupado = 0;

    -- Obtener precio unitario del producto
    SELECT precio
    INTO @precioUnitario
    FROM productos
    WHERE idProducto = p_idProducto
    LIMIT 1;

    IF p_idCotizacion > 0 AND p_idProducto > 0 THEN

        IF p_idCotizacionDetalle = 0 THEN
            -- Es nuevo registro, buscar si ya existe uno igual para agrupar
            SELECT idCotizacionDetalle
            INTO @existe_id
            FROM cotizaciones_detalle
            WHERE idCotizacion = p_idCotizacion
              AND idProducto = p_idProducto
              AND bEnvase = p_bEnvase
            LIMIT 1;

            IF @existe_id IS NOT NULL THEN
                -- Ya existe, sumar cantidad y total
                UPDATE cotizaciones_detalle
                SET cantidad = cantidad + p_cantidad,
                    total = ROUND(@precioUnitario * (cantidad + p_cantidad), 2)
                WHERE idCotizacionDetalle = @existe_id;

                SET @out_id = @existe_id;
                SET @message = 'Cantidad actualizada con éxito.';
            ELSE
                -- No existe, insertar nuevo
                INSERT INTO cotizaciones_detalle
                (
                    idCotizacion,
                    idProducto,
                    bEnvase,
                    cantidad,
                    precioUnitario,
                    descuento,
                    precioConDescuento,
                    total
                )
                VALUES
                (
                    p_idCotizacion,
                    p_idProducto,
                    p_bEnvase,
                    p_cantidad,
                    ROUND(@precioUnitario, 2),
                    0,
                    ROUND(@precioUnitario, 2),
                    ROUND(@precioUnitario * p_cantidad, 2)
                );

                SET @out_id = LAST_INSERT_ID();
                SET @message = 'Guardado con éxito.';
            END IF;

        ELSE
            -- Es edición: buscar si hay otro registro igual para agrupar
            SELECT idCotizacionDetalle, cantidad
            INTO @id_agrupado, @cantidad_agrupado
            FROM cotizaciones_detalle
            WHERE idCotizacion = p_idCotizacion
              AND idProducto = p_idProducto
              AND bEnvase = p_bEnvase
              AND idCotizacionDetalle <> p_idCotizacionDetalle
            LIMIT 1;

            IF @id_agrupado IS NOT NULL THEN
                -- Agrupar: sumar cantidades y totales en el otro registro
                UPDATE cotizaciones_detalle
                SET cantidad = @cantidad_agrupado + p_cantidad,
                    precioUnitario = ROUND(@precioUnitario, 2),
                    precioConDescuento = ROUND(@precioUnitario, 2),
                    total = ROUND(@precioUnitario * (@cantidad_agrupado + p_cantidad), 2)
                WHERE idCotizacionDetalle = @id_agrupado;

                -- Borrar el registro actual
                DELETE FROM cotizaciones_detalle WHERE idCotizacionDetalle = p_idCotizacionDetalle;

                SET @out_id = @id_agrupado;
                SET @message = 'Actualizado y agrupado con éxito.';
            ELSE
                -- No hay otro igual, solo actualizar el actual
                UPDATE cotizaciones_detalle
                SET idProducto = p_idProducto,
                    cantidad = p_cantidad,
                    bEnvase = p_bEnvase,
                    precioUnitario = ROUND(@precioUnitario, 2),
                    precioConDescuento = ROUND(@precioUnitario, 2),
                    total = ROUND(@precioUnitario * p_cantidad, 2)
                WHERE idCotizacionDetalle = p_idCotizacionDetalle;

                SET @out_id = p_idCotizacionDetalle;
                SET @message = 'Actualizado con éxito.';
            END IF;
        END IF;

    ELSE
        SET @message = 'Parámetros incorrectos.';
    END IF;

    SELECT @out_id AS id, @message AS message;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insertUpdateEntradaSalida` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `insertUpdateEntradaSalida`(
	IN oGetDateNow DATETIME,
    IN p_idEntradasSalidasH BIGINT,
	IN p_idCatMov BIGINT,
	IN p_idOrigenFrom BIGINT,
	IN p_idOrigenTo BIGINT,
	IN p_comments VARCHAR(1000),
	IN P_idUserLogON BIGINT
	
)
BEGIN

	SET @out_id = 0;
    SET @message = '';

    IF p_idEntradasSalidasH = 0 THEN
	
        INSERT INTO entradas_salidas_header
		(
			createDate
			, active
			, idCreateUser
			, idCatMov
            , idEntradaSalidaStatus
			, idOrigenFrom
			, idOrigenTo
			, comments
		)
        SELECT
		oGetDateNow
		, 1
		, P_idUserLogON
		, p_idCatMov
        , 1
		, p_idOrigenFrom
		, p_idOrigenTo
		, p_comments
		;
		
		SET @out_id = LAST_INSERT_ID();
		
    ELSE
	
        UPDATE entradas_salidas_header
        SET
			idCatMov = p_idCatMov
            , idOrigenFrom = p_idOrigenFrom
			, idOrigenTo = p_idOrigenTo
			, comments = p_comments
        WHERE
			idEntradasSalidasH = p_idEntradasSalidasH;
			
		SET @idCatTipoProducto = 0;
	
		SET @idCatTipoProducto = IFNULL(
		(
			SELECT
			CRO.idCatTipoProducto
			FROM cat_relacion_origen AS CRO
			INNER JOIN origenes AS O
				ON
					O.idCatRelacionOrigen = CRO.idCatRelacionOrigen
			WHERE
				O.idOrigen = p_idOrigenFrom
		)
		,0);
		
		-- CON ESTE DELETE VAMOS A CONTROLAR QUE NO SELECCIONEN UN ORIGEN DIFERENTE
		-- POR EJEMPLO SI TENGO PRODUCTOS BASE EN LA LISTA Y CAMBIAN EL ORIGEN A AUN ALMACEN DE INSUMOS
		-- NO ES LÓGICO DEJARLOS
		DELETE
			ESD
		FROM entradas_salidas_detalle AS ESD
		INNER JOIN entradas_salidas_header AS ESH
			ON
				ESH.idEntradasSalidasH = ESD.idEntradasSalidasH
		INNER JOIN productos AS P
			ON
				P.idProducto = ESD.idProducto
		WHERE
			ESH.idEntradasSalidasH = p_idEntradasSalidasH
			AND P.idCatTipoProducto != @idCatTipoProducto
		;
		
		SET @out_id = p_idEntradasSalidasH;
		
    END IF;
	
	SET @message = 'Guardado con éxito.';

    SELECT @out_id AS out_id, @message AS message;
	
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insertUpdateGiro` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `insertUpdateGiro`(
    IN p_oGetDateNow DATETIME,
    IN p_idGiro INT,
    IN p_name VARCHAR(500),
	IN p_active SMALLINT
)
BEGIN
    SET @out_id = 0;
    SET @message = '';

    IF p_idGiro = 0 THEN

		INSERT INTO `giros` (
				`createDate`,
				`name`,
				`active`
		)
		VALUES (
				p_oGetDateNow,
				p_name,
				p_active
		);

		SET @out_id = LAST_INSERT_ID();
		SET @message = 'Guardado con éxito.';

    ELSE

		UPDATE `giros`
		SET
				`name` = p_name,
				`active` = p_active
		WHERE `idGiro` = p_idGiro;

		SET @out_id = p_idGiro;
		SET @message = 'Guardado con éxito.';

    END IF;

    SELECT @out_id AS out_id, @message AS message;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insertUpdateInventarioFisico` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `insertUpdateInventarioFisico`(
	IN p_oGetDateNow DATETIME,
    IN p_idInventarioFisico BIGINT,
    IN p_idOrigen BIGINT,
    IN p_observaciones VARCHAR(500),
    IN p_idStatus INT,
    IN p_idUserLogON BIGINT
)
BEGIN
    DECLARE v_message VARCHAR(255);
    DECLARE v_out_id BIGINT DEFAULT 0;
    
    IF p_idInventarioFisico = 0 THEN
        -- Insertar nuevo
        INSERT INTO inventario_fisico (
            createDate,
            active,
            idCreateUser,
            idOrigen,
            fechaInicio,
            fechaCierre,
            idStatus,
            observaciones
        ) VALUES (
            p_oGetDateNow,
            1,
            p_idUserLogON,
            p_idOrigen,
            p_oGetDateNow,
            NULL,
            IFNULL(p_idStatus, 1),
            p_observaciones
        );
        
        SET v_out_id = LAST_INSERT_ID();
        SET v_message = 'Inventario físico creado correctamente';
    ELSE
        -- Actualizar existente
        UPDATE inventario_fisico SET
            observaciones = p_observaciones,
            idStatus = p_idStatus
        WHERE idInventarioFisico = p_idInventarioFisico;
        
        SET v_out_id = p_idInventarioFisico;
        SET v_message = 'Inventario físico actualizado correctamente';
    END IF;
    
    SELECT v_out_id AS out_id, v_message AS message;
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insertUpdateOrdenCompra` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `insertUpdateOrdenCompra`(
	IN oGetDateNow DATETIME,
    IN p_idOrdenDeCompra BIGINT,
	IN p_idProveedor BIGINT,
	IN p_numeroFactura VARCHAR(45),
	IN p_fechaPedido DATE,
	IN p_fechaRecepcion DATE,
    IN p_active SMALLINT,
	IN P_idUserLogON BIGINT
	
)
BEGIN

	SET @out_id = 0;
    SET @message = '';

    IF p_idOrdenDeCompra = 0 THEN
	
        INSERT INTO orden_compra
		(
			createDate
			, idProveedor
			, idOrdenCompraStatus
			, costoTotal
			, idCreateUser
			, numeroFactura
			, fechaPedido
			, fechaRecepcion
			, active
		)
        SELECT
		oGetDateNow
		, p_idProveedor
		, 1
		, 0
		, P_idUserLogON
		, p_numeroFactura
		, p_fechaPedido
		, p_fechaRecepcion
		, p_active;
		
		SET @out_id = LAST_INSERT_ID();
		
    ELSE
	
        UPDATE orden_compra
        SET
			idProveedor = p_idProveedor
			, numeroFactura = p_numeroFactura
			, fechaPedido = p_fechaPedido
			, fechaRecepcion = p_fechaRecepcion
            , active = p_active
        WHERE
			idOrdenDeCompra = p_idOrdenDeCompra;
		
		SET @out_id = p_idOrdenDeCompra;
		
    END IF;
	
	SET @message = 'Guardado con éxito.';

    SELECT @out_id AS out_id, @message AS message;
	
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insertUpdatePedidosClientes` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `insertUpdatePedidosClientes`(
	IN oGetDateNow DATETIME,
    IN p_idPedido BIGINT,
	IN p_idCliente BIGINT,
	IN p_idRepartidor BIGINT,
	IN p_idTipoVenta BIGINT,
	IN p_fechaEntrega VARCHAR(150),
	IN p_fechaEntregada VARCHAR(150),
	IN p_comments VARCHAR(5000),
	IN p_cantEnvases DECIMAL(20,2),
    
    IN p_idSucursal BIGINT,
	IN P_idUserLogON BIGINT
)
BEGIN

	SET @out_id = 0;
    SET @message = '';
	
	SET @idSucursal = IFNULL( p_idSucursal ,0);
	
	IF @idSucursal > 0 THEN
	
		IF p_idPedido = 0 THEN
	
			INSERT INTO pedidos_clientes
			(
				createDate
				, active
				, idSucursal
				, idCreateUser
				, idCliente
				, idCatStatusPedidosClientes
				, idRepartidor
				, idTipoVenta
				, fechaEntrega
                , idPedidoNuevo
			)
			SELECT
			oGetDateNow
			, 1
			, @idSucursal
			, P_idUserLogON
			, p_idCliente
			, 1
			, p_idRepartidor
			, p_idTipoVenta
			, CASE WHEN p_fechaEntrega = '' THEN NULL ELSE p_fechaEntrega END
            , 0
			;
			
			SET p_idPedido = LAST_INSERT_ID();
			
		ELSE
		
			UPDATE pedidos_clientes
			SET
				idCliente = p_idCliente
				, idSucursal = @idSucursal
				, idRepartidor = p_idRepartidor
				, idTipoVenta = p_idTipoVenta
				, fechaEntrega = CASE WHEN p_fechaEntrega = '' THEN NULL ELSE p_fechaEntrega END
				, fechaEntregada = CASE WHEN p_fechaEntregada = '' THEN NULL ELSE p_fechaEntregada END
				, comments = p_comments
			WHERE
				idPedido = p_idPedido;
			
		END IF;
		
		SET @idProductoEnvase20LT = 0;
		
		SELECT
			`value`
		INTO
			@idProductoEnvase20LT
		FROM constantes
		WHERE
			`key` = 'envase20LT'
		;
		
		IF p_cantEnvases > 0 AND @idProductoEnvase20LT > 0 THEN
		
			IF EXISTS (SELECT 1 FROM pedidos_envases WHERE idPedido = p_idPedido AND valorMedida = 20) THEN
				UPDATE pedidos_envases
				SET cantidad = p_cantEnvases
				WHERE idPedido = p_idPedido AND valorMedida = 20;
			ELSE
				INSERT INTO pedidos_envases(idPedido, idProducto, cantidad, valorMedida)
				VALUES (p_idPedido, @idProductoEnvase20LT, p_cantEnvases, 20);
			END IF;
		
		END IF;
		
		IF p_cantEnvases = 0 AND
		EXISTS (SELECT 1 FROM pedidos_envases WHERE idPedido = p_idPedido AND valorMedida = 20)
		THEN
		
			DELETE FROM pedidos_envases WHERE idPedido = p_idPedido AND valorMedida = 20;
		
		END IF;
		
		SET @out_id = p_idPedido;
		SET @message = 'Guardado con éxito.';
	
	ELSE
		
		SET @out_id = 0;
		SET @message = 'El usuario no tiene sucursal configurada.';
	
	END IF;

    SELECT @out_id AS out_id, @message AS message;
	
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insertUpdateProdProdAgranel` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `insertUpdateProdProdAgranel`(
	IN oGetDateNow DATETIME,
    IN p_idProdProdAgranelH BIGINT,
    IN p_active SMALLINT,
	IN P_idUserLogON BIGINT
)
BEGIN
	
	DECLARE mensaje_error TEXT;
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        -- Capturar el mensaje de error
        GET DIAGNOSTICS CONDITION 1 mensaje_error = MESSAGE_TEXT;
        
		SELECT 0 AS out_id, mensaje_error AS message;
        
    END;

	SET @out_id = 0;
    SET @message = '';

    IF p_idProdProdAgranelH = 0 THEN
	
        INSERT INTO prod_prod_agranel
		(
			createDate
			, idCreateUser
			, active
			, idCatStatusProd
			, costoTotal
		)
        SELECT
		oGetDateNow
		, P_idUserLogON
		, 1
		, 1
		, 0;
		
		SET @out_id = LAST_INSERT_ID();
		
    ELSE
	
        UPDATE prod_prod_agranel
        SET
            active = p_active
        WHERE
			idProdProdAgranelH = p_idProdProdAgranelH;
		
		SET @out_id = p_idProdProdAgranelH;
		
    END IF;
	
	SET @message = 'Guardado con éxito.';

    SELECT @out_id AS out_id, @message AS message;
	
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insertUpdateProdProdBase` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `insertUpdateProdProdBase`(
	IN oGetDateNow DATETIME,
    IN p_idProdProdBaseH BIGINT,
    IN p_active SMALLINT,
	IN P_idUserLogON BIGINT
	
)
BEGIN

	SET @out_id = 0;
    SET @message = '';

    IF p_idProdProdBaseH = 0 THEN
	
        INSERT INTO prod_prod_base
		(
			createDate
			, idCreateUser
			, active
			, idCatStatusProd
			, costoTotal
		)
        SELECT
		oGetDateNow
		, P_idUserLogON
		, 1
		, 1
		, 0;
		
		SET @out_id = LAST_INSERT_ID();
		
    ELSE
	
        UPDATE prod_prod_base
        SET
            active = p_active
        WHERE
			idProdProdBaseH = p_idProdProdBaseH;
		
		SET @out_id = p_idProdProdBaseH;
		
    END IF;
	
	SET @message = 'Guardado con éxito.';

    SELECT @out_id AS out_id, @message AS message;
	
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insertUpdateProdProdFinal` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `insertUpdateProdProdFinal`(
	IN oGetDateNow DATETIME,
    IN p_idProdProdFinalH BIGINT,
    IN p_active SMALLINT,
	IN P_idUserLogON BIGINT
	
)
BEGIN
	
	DECLARE mensaje_error TEXT;
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        -- Capturar el mensaje de error
        GET DIAGNOSTICS CONDITION 1 mensaje_error = MESSAGE_TEXT;
		SELECT 0 AS out_id, mensaje_error AS message;
    END;

	SET @out_id = 0;
    SET @message = '';

    IF p_idProdProdFinalH = 0 THEN
	
        INSERT INTO prod_prod_final
		(
			createDate
			, idCreateUser
			, active
			, idCatStatusProd
			, costoTotal
		)
        SELECT
		oGetDateNow
		, P_idUserLogON
		, 1
		, 1
		, 0;
		
		SET @out_id = LAST_INSERT_ID();
		
    ELSE
	
        UPDATE prod_prod_final
        SET
            active = p_active
        WHERE
			idProdProdFinalH = p_idProdProdFinalH;
		
		SET @out_id = p_idProdProdFinalH;
		
    END IF;
	
	SET @message = 'Guardado con éxito.';

    SELECT @out_id AS out_id, @message AS message;
	
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insertUpdateSeguimientoProspecto` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `insertUpdateSeguimientoProspecto`(
IN oGetDateNow DATETIME
, IN p_idSeguimiento BIGINT
, IN p_idCliente BIGINT
, IN p_description VARCHAR(5000)
, IN p_idUserLogON BIGINT
)
BEGIN

	SET @out_id = 0;
	SET @message = '';
	
	IF p_idSeguimiento = 0 THEN

		INSERT INTO seguimiento_prospectos(
		createDate
		, idCliente
		, idUser
		, description
		)
		SELECT
		oGetDateNow
		, p_idCliente
		, p_idUserLogON
		, p_description;
		
		SET @out_id = LAST_INSERT_ID();
		
	ELSE
	
		UPDATE
			seguimiento_prospectos
		SET
			description = p_description
		WHERE
			idSeguimiento = p_idSeguimiento
		;
			
		SET @out_id = p_idSeguimiento;
		
	END IF;
	
	SET @message = 'Guardado con éxito.';
	
	SELECT @out_id AS out_id, @message AS message;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insertUpdateSucursal` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `insertUpdateSucursal`(
IN p_oGetDateNow DATETIME
, IN p_idSucursal SMALLINT
, IN p_name VARCHAR(45)
, IN p_calle VARCHAR(45)
, IN p_entreCalles VARCHAR(45)
, IN p_codigocolonia INT
, IN p_telefono VARCHAR(20)
, IN p_email VARCHAR(100)
, IN p_numExt VARCHAR(10)
, IN p_numInt VARCHAR(10)
, IN p_lat FLOAT
, IN p_long FLOAT
, IN p_active SMALLINT
)
BEGIN

	SET @out_id = 0;
	SET @message = '';
	
	IF p_idSucursal = 0 THEN

		INSERT INTO `sucursales`
		(
			`createDate`
			,`name`
			,`calle`
			,`entreCalles`
            ,`codigocolonia`
			,`telefono`
			,`email`
			,`numExt`
			,`numInt`
			,`lat`
			,`long`
			,`active`
		)
		SELECT
		p_oGetDateNow
		, p_name
		, p_calle
		, p_entreCalles
        , p_codigocolonia
		, p_telefono
		, p_email
		, p_numExt
		, p_numInt
		, p_lat
		, p_long
		, p_active;
		
		SET @out_id = LAST_INSERT_ID();
		
	ELSE
	
		UPDATE
			`sucursales`
		SET
			`createDate` = p_oGetDateNow,
			`name` = p_name,
			`calle` = p_calle,
			`entreCalles` = p_entreCalles,
            `codigocolonia`= p_codigocolonia,	
			`telefono` = p_telefono,
			`email` = p_email,
			`numExt` = p_numExt,
			`numInt` = p_numInt,
			`lat` = p_lat,
			`long` = p_long,
			`active` = p_active
		WHERE 
			`idSucursal` = p_idSucursal
		;
			
		SET @out_id = p_idSucursal;
	END IF;
    
	UPDATE
		origenes
	SET
		nombre = p_name
	WHERE
		idCatRelacionOrigen = 1 -- SUCURSAL
		AND idRelacion = @out_id
	;
	
	INSERT INTO origenes ( nombre, idRelacion, idCatRelacionOrigen, active )
	SELECT
	
		name
		, S.idSucursal
		, 1 -- SUCURSAL
		, 1
	
	FROM sucursales AS S
	LEFT JOIN origenes AS O
		ON
			O.idCatRelacionOrigen = 1 -- SUCURSAL
			AND O.idRelacion = S.idSucursal
	WHERE
		O.idOrigen IS NULL
		AND S.idSucursal = @out_id
		;
	
	SET @message = 'Guardado con éxito.';
	
	SELECT @out_id AS out_id, @message AS message;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insertUpdateVendedor` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `insertUpdateVendedor`(
    IN p_oGetDateNow DATETIME,
    IN p_idVendedor BIGINT,
    IN p_nombre VARCHAR(100),
    IN p_fechaIngreso DATE,
    IN p_fechaNacimiento DATE,
    IN p_sexo VARCHAR(45),
    IN p_idUser BIGINT,
    IN p_idStatusVendedor SMALLINT,
    IN p_calle VARCHAR(100),
    IN p_numExt VARCHAR(45),
    IN p_numInt VARCHAR(45),
	IN p_entreCalle VARCHAR(45),
    IN p_codigocolonia INT,   
    IN p_rfc VARCHAR(45),
    IN p_telefono VARCHAR(45),
    IN p_email VARCHAR(100),
    IN p_lat FLOAT,
    IN p_long FLOAT,
    IN p_active SMALLINT
)
BEGIN
    SET @out_id = 0;
    SET @message = '';

    IF p_idVendedor = 0 THEN
        INSERT INTO `vendedores` (
            `createDate`,
            `nombre`,
            `fechaIngreso`,
            `fechaNacimiento`,
            `sexo`,
            `idUser`,
            `idStatusVendedor`,
            `calle`,
            `numExt`,
            `numInt`,
			`entreCalle`,
            `codigocolonia`,
            `rfc`,
            `telefono`,
            `email`,
            `lat`,
            `long`,
            `active`
        )
        VALUES (
            p_oGetDateNow,
            p_nombre,
            p_fechaIngreso,
            p_fechaNacimiento,
            p_sexo,
            p_idUser,
            p_idStatusVendedor,
            p_calle,
            p_numExt,
            p_numInt,
            p_entreCalle,
            p_codigocolonia,
            p_rfc,
            p_telefono,
            p_email,
            p_lat,
            p_long,
            p_active
        );

        SET @out_id = LAST_INSERT_ID();
    ELSE
        UPDATE `vendedores`
        SET
            `createDate` = p_oGetDateNow,
            `nombre` = p_nombre,
            `fechaIngreso` = p_fechaIngreso,
            `fechaNacimiento` = p_fechaNacimiento,
            `sexo` = p_sexo,
            `idUser` = p_idUser,
            `idStatusVendedor` = p_idStatusVendedor,
            `calle` = p_calle,
            `numExt` = p_numExt,
            `numInt` = p_numInt,
            `entreCalle` = p_entreCalle,
            `codigocolonia`= p_codigocolonia,	
            `rfc` = p_rfc,
            `telefono` = p_telefono,
            `email` = p_email,
            `lat` = p_lat,
            `long` = p_long,
            `active` = p_active
        WHERE `idVendedor` = p_idVendedor;

        SET @out_id = p_idVendedor;
    END IF;
    
    IF p_idVendedor != 1 THEN
	
		UPDATE
			origenes
		SET
			nombre = p_nombre
		WHERE
			idCatRelacionOrigen = 2 -- 1: SUCURSAL, 2: VENDEDOR
			AND idRelacion = @out_id
		;
		
		INSERT INTO origenes ( nombre, idRelacion, idCatRelacionOrigen, active )
		SELECT
		
			V.nombre
			, V.idVendedor
			, 2 -- 1: SUCURSAL, 2: VENDEDOR
			, 1
		
		FROM vendedores AS V
		LEFT JOIN origenes AS O
			ON
				O.idCatRelacionOrigen = 2 -- 1: SUCURSAL, 2: VENDEDOR
				AND O.idRelacion = V.idVendedor
		WHERE
			O.idOrigen IS NULL
			AND V.idVendedor = @out_id
			;
            
	END IF;

    SET @message = 'Guardado con éxito.';

    SELECT @out_id AS out_id, @message AS message;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insertUpdateVenta` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `insertUpdateVenta`(
	IN oGetDateNow DATETIME,
    IN p_idVenta BIGINT,
	IN p_idCliente BIGINT,
	IN p_idSucursal INT,
	IN p_idCaja INT,
	IN p_idTipoVenta INT,
	IN p_idVendedor BIGINT,
    IN p_idOrigenVendedor BIGINT,
	IN p_cantEnvases DECIMAL(20,2),
    IN p_idClienteDiElect BIGINT,
	IN P_idUserLogON BIGINT
)
BEGIN

	SET @out_id = 0;
    SET @message = '';

    IF p_idVenta = 0 THEN
	
        INSERT INTO ventas
		(
			createDate
			, active
			, idCreateUser
			, subtotal
			, descuento
			, iva
			, total
            , pendiente
			, idCliente
			, idSucursal
			, idCaja
            , idTipoVenta
			, idVendedor
			, bClosed
            , idPedido
            , idOrigenVendedor
            , idClienteDiElect
		)
        SELECT
		oGetDateNow
		, 1
		, P_idUserLogON
		, 0
		, 0
		, 0
		, 0
        , 0
		, p_idCliente
		, p_idSucursal
		, p_idCaja
		, p_idTipoVenta
		, p_idVendedor
		, 0
        , 0
        , p_idOrigenVendedor
        , p_idClienteDiElect
		;
		
		SET p_idVenta = LAST_INSERT_ID();
		
    ELSE
	
        UPDATE
			ventas
		SET
			idCliente = p_idCliente
			, idSucursal = p_idSucursal
			, idCaja = p_idCaja
            , idTipoVenta = p_idTipoVenta
			, idVendedor = p_idVendedor
            , idOrigenVendedor = p_idOrigenVendedor
            , idClienteDiElect = p_idClienteDiElect
		WHERE
			idVenta = p_idVenta
		;
		
    END IF;
    
    SET @idProductoEnvase20LT = 0;
		
	SELECT
		`value`
	INTO
		@idProductoEnvase20LT
	FROM constantes
	WHERE
		`key` = 'envase20LT'
	;
	
	IF p_cantEnvases > 0 AND @idProductoEnvase20LT > 0 THEN
	
		IF EXISTS (SELECT 1 FROM ventas_envases WHERE idVenta = p_idVenta AND valorMedida = 20) THEN
			UPDATE ventas_envases
			SET cantidad = p_cantEnvases
			WHERE idVenta = p_idVenta AND valorMedida = 20;
		ELSE
			INSERT INTO ventas_envases(idVenta, idProducto, cantidad, valorMedida)
			VALUES (p_idVenta, @idProductoEnvase20LT, p_cantEnvases, 20);
		END IF;
	
	END IF;
	
	IF p_cantEnvases = 0 AND
	EXISTS (SELECT 1 FROM ventas_envases WHERE idVenta = p_idVenta AND valorMedida = 20)
	THEN
	
		DELETE FROM ventas_envases WHERE idVenta = p_idVenta AND valorMedida = 20;
	
	END IF;
	
	SET @message = 'Guardado con éxito.';

    SELECT p_idVenta AS out_id, @message AS message;
	
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insertUpdateZona` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `insertUpdateZona`(
    IN p_oGetDateNow DATETIME,
    IN p_idZona INT,
    IN p_name VARCHAR(500),
	IN p_active SMALLINT
)
BEGIN
    SET @out_id = 0;
    SET @message = '';

    IF p_idZona = 0 THEN
			
		INSERT INTO `zonas` (
			`createDate`,
			`name`,
			`active`
		)
		VALUES (
			p_oGetDateNow,
			p_name,
			p_active
		);

		SET @out_id = LAST_INSERT_ID();
		SET @message = 'Guardado con éxito.';
			
    ELSE
		
		UPDATE `zonas`
		SET
			`name` = p_name,
			`active` = p_active
		WHERE `idZona` = p_idZona;

		SET @out_id = p_idZona;
		SET @message = 'Guardado con éxito.';
		
    END IF;

    SELECT @out_id AS out_id, @message AS message;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insertUser` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `insertUser`(
IN p_oGetDateNow DATETIME
, IN p_name VARCHAR(500)
, IN p_userName VARCHAR(500)
, IN p_pwd TEXT
, IN p_idStatus SMALLINT
, IN p_active SMALLINT

, IN p_idUserC BIGINT
)
BEGIN

	SET @idUser = 0;
	SET @out_id = 0;
	SET @message = '';
	
	SET @idUser = IFNULL(
	(
		SELECT
		idUser
		FROM users
		WHERE
			UPPER( userName ) = UPPER( p_userName )
		LIMIT 1
	)
	,0);
	
	IF @idUser = 0 THEN

		INSERT INTO users(
		createDate
		, updateDate
		, name
		, userName
		, pwd
		, idStatus
		, active
		)
		SELECT
		p_oGetDateNow
		, p_oGetDateNow
		, p_name
		, p_userName
		, p_pwd
		, p_idStatus
		, p_active;
		
		SET @out_id = LAST_INSERT_ID();
		SET @message = 'Usuario guardado con éxito.';
		
	ELSE
		SET @out_id = 0;
		SET @message = 'Ese usuario ya existe intente con otro.';
	END IF;
	
	SELECT @out_id AS out_id, @message AS message;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ObtenerCantidadesStockYLog` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ObtenerCantidadesStockYLog`(
    IN p_idProducto INT,
    IN p_idOrigen INT
)
BEGIN
    SELECT
        (SELECT cantidad FROM stock WHERE idProducto = p_idProducto AND idOrigen = p_idOrigen) AS cantidad_stock,
        (SELECT SUM(cantidad) FROM stocklog WHERE idProducto = p_idProducto AND idOrigen = p_idOrigen) AS cantidad_log;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `producirProdAgranel` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `producirProdAgranel`(
	IN oGetDateNow DATETIME
	, IN p_idProdProdAgranelH BIGINT
    , IN P_idUserLogON BIGINT
)
BEGIN

	DECLARE mensaje_error TEXT;
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        -- Capturar el mensaje de error
        GET DIAGNOSTICS CONDITION 1 mensaje_error = MESSAGE_TEXT;
		SELECT 0 AS out_id, mensaje_error AS message;
    END;

	SET SQL_SAFE_UPDATES = 0;
    
    DROP TABLE IF EXISTS ODataProdTemp;

	CREATE TEMPORARY TABLE ODataProdTemp (
		id BIGINT AUTO_INCREMENT,
		idProdProdAgranelDetalle BIGINT,
		idProductoAgranel BIGINT,
		cantidad DECIMAL(18,2),
		costo DECIMAL(18,2),
		costoTotal DECIMAL(18,2),
		PRIMARY KEY(id)
	) ENGINE=InnoDB;
	
	INSERT INTO ODataProdTemp ( idProdProdAgranelDetalle, idProductoAgranel, cantidad, costo, costoTotal )
	SELECT
		idProdProdAgranelDetalle, idProductoAgranel, cantidad, costo, costoTotal
	FROM prod_prod_agranel_detalle
	WHERE
		idProdProdAgranelH = p_idProdProdAgranelH;
        
	DROP TABLE IF EXISTS ODataTemp;

	CREATE TEMPORARY TABLE ODataTemp (
		id BIGINT AUTO_INCREMENT,
		idStock BIGINT,
		idProductoBase BIGINT,
		cantidadConsumida DECIMAL(18, 2),
		costoUnitario DECIMAL(18, 2),
		costoTotal DECIMAL(18, 2),
		PRIMARY KEY(id)
	) ENGINE=InnoDB;

    SET @i = 1;
    SET @total = 0;

    -- Obtener la cantidad de elementos para recorrer el while
    SET @total = ( SELECT COUNT(*) FROM ODataProdTemp );

    -- Recorrer el JSON e insertar directamente
    WHILE @i <= @total DO
	
		-- LIMPIO LA TABLA ANTES DE LLENARLA
		DELETE FROM ODataTemp;
	
		SET @idProdProdAgranelDetalle = 0;
		SET @idProductoAgranel = 0;
		SET @cantidad = 0;
		SET @costo = 0;
		SET @costoTotal = 0;
		SET @productoAgranelName = '';
		
		SET @idProdProdAgranelDetalle = ( SELECT idProdProdAgranelDetalle FROM ODataProdTemp WHERE id = @i );
		SET @idProductoAgranel = ( SELECT idProductoAgranel FROM ODataProdTemp WHERE id = @i );
		SET @cantidad = ( SELECT cantidad FROM ODataProdTemp WHERE id = @i );
		SET @costo = ( SELECT costo FROM ODataProdTemp WHERE id = @i );
		SET @costoTotal = ( SELECT costoTotal FROM ODataProdTemp WHERE id = @i );
		
		SET @productoAgranelName = (
		
			SELECT 
			
				CONCAT( IFNULL( CTP.abreviatura ,''), '-', CAST( P.idproductocategoria AS CHAR(12) ) , '-', IFNULL( CD.description ,''), ' ', REPLACE( CAST( P.valorMedida AS CHAR(12) ) , '.00', ''), ' ', IFNULL( UM.abreviatura ,'') )

			FROM productos AS P
			INNER JOIN cat_tipo_producto AS CTP ON CTP.active = 1 AND CTP.idCatTipoProducto = P.idCatTipoProducto
			INNER JOIN cat_descripciones AS CD ON CD.active = 1 AND CD.idDescription = P.idDescription
			INNER JOIN cat_unidad_medida AS UM ON UM.active = 1 AND UM.idUnidadMedida = P.idUnidadMedida
			WHERE
				P.idProducto = @idProductoAgranel
		
		);
	
        INSERT INTO ODataTemp (
            idStock, idProductoBase, cantidadConsumida, costoUnitario, costoTotal
        )
		SELECT
		
		PPBS.idStock
		, SL.idProducto AS idProductoBase
		, PPBS.cantidadConsumida
		, PPBS.costoUnitario
		, PPBS.costoTotal
		
		FROM prod_prod_agranel_stock AS PPBS
		INNER JOIN stocklog AS SL ON SL.idStock = PPBS.idStock
		WHERE
			PPBS.idProdProdAgranelDetalle = @idProdProdAgranelDetalle
		;
		
		-- BAJO EL INVENTARIO LOG
		INSERT INTO stocklog
		(
			createDate
			, active
			, idOrigen
			, idProducto
			, idCatMov
			, cantidad
			, costo
			, idStockFrom
			, idRelacionOperacion
			, comentarios
			, idCreateUser
			, motivoDesc
		)
		SELECT
		
		oGetDateNow
		, 1
		, 2 -- 1: AMP, 2: APB, 3: APA, 4: APT
		, idProductoBase
		, 2 -- 1: Orden de compra, 2: Producción, 3: Transferencia
		, cantidadConsumida * -1 -- LE QUITAMOS LO QUE SE CONSUMIÓ 
		, costoUnitario
		, idStock
		, 0
		, ''
		, P_idUserLogON
        , CONCAT( 'Salida por producción #',  p_idProdProdAgranelH,' de ', @productoAgranelName )
		
		FROM ODataTemp;
		
		-- HAGO UN UPDATE AL STOCK DEL PRODUCTO AGRANEL
		UPDATE
			stock AS S
			INNER JOIN
			(
				SELECT
				MPP.idProductoBase
				, SUM( MPP.cantidadConsumida ) AS cantidadConsumida
				FROM ODataTemp AS MPP
				GROUP BY MPP.idProductoBase
			) AS MP
				ON
					S.idOrigen = 2 -- 1: AMP, 2: APB, 3: APA, 4: APT
					AND S.idProducto = MP.idProductoBase
					
		SET
			S.cantidad = S.cantidad - MP.cantidadConsumida
		;
		
		-- LE AFECTO A LA PRODUCCIÓN
		IF
		(
			SELECT
			COUNT(*)
			FROM stock
			WHERE
				idOrigen = 3 -- 1: AMP, 2: APB, 3: APA, 4: APT
				AND idProducto = @idProductoAgranel
		) > 0
		THEN
		
			-- AHORA INSERTO EL INVENTARIO DEL PRODUCTO AGRANEL PRODUCIDO
			-- HAGO UN UPDATE AL STOCK POR SI EXISTE QUE LE SUME LA CANTIDAD
			-- SI NO EXISTE LO HACE EN EL INSERT DE ABAJO
			UPDATE
				stock
			SET
				cantidad = cantidad + @cantidad
				, costo = @costo
			WHERE
				idOrigen = 3 -- 1: AMP, 2: APB, 3: APA, 4: APT
				AND idProducto = @idProductoAgranel
			;
			
		ELSE
		
			-- EN CASO DE NO EXISTIR EL INVENTARIO DEL PRODUCTO AGRANEL, ENTONCES LO INSERTA
			INSERT INTO stock
			(
				createDate
				, active
				, idOrigen
				, idProducto
				, cantidad
				, costo
			)
			SELECT
			
			oGetDateNow
			, 1
			, 3 -- 1: AMP, 2: APB, 3: APA, 4: APT
			, @idProductoAgranel
			, @cantidad -- CANTIDAD PRODUCIDA
			, @costo -- COSTO UNITARIO
			;
		
		END IF;
		
		-- INSERTO EL LOG POSITIVO DE LA PRODUCCIÓN DEL PRODUCTO
		INSERT INTO stocklog
		(
			createDate
			, active
			, idOrigen
			, idProducto
			, idCatMov
			, cantidad
			, costo
			, idStockFrom
			, idRelacionOperacion
			, comentarios
			, idCreateUser
			, motivoDesc
		)
		SELECT
		
		oGetDateNow
		, 1
		, 3 -- 1: AMP, 2: APB, 3: APA, 4: APT
		, @idProductoAgranel
		, 2 -- 1: Orden de compra, 2: Producción, 3: Transferencia
		, @cantidad -- CANTIDAD PRODUCIDA
		, @costo -- COSTO UNITARIO
		, 0
		, 0
		, ''
		, P_idUserLogON
        , CONCAT( 'Entrada por producción PPA#' , p_idProdProdAgranelH )
        ;
		
        -- Incrementar contador
        SET @i = @i + 1;
		
    END WHILE;
    
    UPDATE
		prod_prod_agranel
	SET
		idCatStatusProd = 2 -- 1: BORRADOR, 2: COMPLETO
	WHERE
		idProdProdAgranelH = p_idProdProdAgranelH
	;
	
	SELECT 1 AS out_id, 'Producido con éxito.' AS message;
    
    SET SQL_SAFE_UPDATES = 1;
	
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `producirProdBase` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `producirProdBase`(
	IN oGetDateNow DATETIME
	, IN p_idProductoBase BIGINT
	, IN p_cantAProducir DECIMAL(18, 2)
	, IN p_costoTotal DECIMAL(18, 2)
	, IN jsonData JSON
)
BEGIN

	CREATE TEMPORARY TABLE ODataTemp (
		id BIGINT AUTO_INCREMENT,
		idStock BIGINT,
		idMateriaPrima BIGINT,
		cantidadConsumida DECIMAL(18, 2),
		costoUnitario DECIMAL(18, 2),
		costoTotal DECIMAL(18, 2),
		PRIMARY KEY(id)
	) ENGINE=InnoDB;

    SET @i = 0;
    SET @total = 0;

    -- Obtener la cantidad de elementos en el JSON
    SET @total = JSON_LENGTH(jsonData);

    -- Recorrer el JSON e insertar directamente
    WHILE @i < @total DO
	
        INSERT INTO ODataTemp (
            idStock, idMateriaPrima, cantidadConsumida, costoUnitario, costoTotal
        ) VALUES (
            JSON_EXTRACT(jsonData, CONCAT('$[', @i, '].idStock')),
            JSON_EXTRACT(jsonData, CONCAT('$[', @i, '].idMateriaPrima')),
            JSON_EXTRACT(jsonData, CONCAT('$[', @i, '].cantidadConsumida')),
            JSON_EXTRACT(jsonData, CONCAT('$[', @i, '].costoUnitario')),
            JSON_EXTRACT(jsonData, CONCAT('$[', @i, '].costoTotal'))
        );

        -- Incrementar contador
        SET @i = @i + 1;
		
    END WHILE;
	
    -- START TRANSACTION;
    
	-- BAJO EL INVENTARIO LOG
	INSERT INTO stocklog
	(
		createDate
		, active
		, idRelacion
		, idCatRelacionOrigen
		, idRelacionTipoProducto
		, idCatTipoProducto
		, cantidad
		, costo
		, idStockFrom
	)
	SELECT
	
	oGetDateNow
	, 1
	, 1 -- ALMACEN DE MATERIA PRIMA GLOBAL: AUN NO HAY UN CATALOGO PORQUE NO EXISTE OTRO
	, 3 -- 1: SUCURSAL, 2: VENDEDOR: 3: Materias Primas, 4: Productos Base, 5: Productos Agranel
	, idMateriaPrima
	, 2 -- 1: PRODUCTO, 2: MATERIA PRIMA, 3: PRODUCTO BASE, 4: PRODUCTO AGRANEL
	, cantidadConsumida * -1 -- LE QUITAMOS LO QUE SE CONSUMIÓ 
	, costoUnitario
	, idStock
	
	FROM ODataTemp;
	
	-- HAGO UN UPDATE AL STOCK DE LA MATERIA PRIMA
	UPDATE
		stock AS S
		INNER JOIN
		(
			SELECT
			MPP.idMateriaPrima
			, SUM( MPP.cantidadConsumida ) AS cantidadConsumida
			FROM ODataTemp AS MPP
			GROUP BY MPP.idMateriaPrima
		) AS MP
			ON
				S.idRelacion = 1 -- ALMACEN DE MATERIA PRIMA GLOBAL: AUN NO HAY UN CATALOGO PORQUE NO EXISTE OTRO
				AND S.idCatRelacionOrigen = 3 -- 1: SUCURSAL, 2: VENDEDOR: 3: Materias Primas, 4: Productos Base, 5: Productos Agranel
				AND S.idRelacionTipoProducto = MP.idMateriaPrima
				AND S.idCatTipoProducto = 2 -- 1: PRODUCTO, 2: MATERIA PRIMA, 3: PRODUCTO BASE, 4: PRODUCTO AGRANEL
	SET
		S.cantidad = S.cantidad - MP.cantidadConsumida
	;
	
	IF
	(
		SELECT
		COUNT(*)
		FROM stock
		WHERE
			idRelacion = 1 -- ALMACEN DE MATERIA PRIMA GLOBAL: AUN NO HAY UN CATALOGO PORQUE NO EXISTE OTRO
			AND idCatRelacionOrigen = 4 -- 1: SUCURSAL, 2: VENDEDOR: 3: Materias Primas, 4: Productos Base, 5: Productos Agranel
			AND idRelacionTipoProducto = p_idProductoBase
			AND idCatTipoProducto = 3 -- 1: PRODUCTO, 2: MATERIA PRIMA, 3: PRODUCTO BASE, 4: PRODUCTO AGRANEL
	) > 0
	THEN
	
		-- AHORA INSERTO EL INVENTARIO DEL PRODUCTO BASE PRODUCIDO
		-- HAGO UN UPDATE AL STOCK POR SI EXISTE QUE LE SUME LA CANTIDAD
		-- SI NO EXISTE LO HACE EN EL INSERT DE ABAJO
		UPDATE
			stock
		SET
			cantidad = cantidad + p_cantAProducir
			, costo = ROUND( p_costoTotal / p_cantAProducir ,2)
		WHERE
			idRelacion = 1 -- ALMACEN DE MATERIA PRIMA GLOBAL: AUN NO HAY UN CATALOGO PORQUE NO EXISTE OTRO
			AND idCatRelacionOrigen = 4 -- 1: SUCURSAL, 2: VENDEDOR: 3: Materias Primas, 4: Productos Base, 5: Productos Agranel
			AND idRelacionTipoProducto = p_idProductoBase
			AND idCatTipoProducto = 3 -- 1: PRODUCTO, 2: MATERIA PRIMA, 3: PRODUCTO BASE, 4: PRODUCTO AGRANEL
		;
		
	ELSE
	
		-- EN CASO DE NO EXISTIR EL INVENTARIO DE LA MATERIA PRIMA, ENTONCES LO INSERTA
		INSERT INTO stock
		(
			createDate
			, active
			, idRelacion
			, idCatRelacionOrigen
			, idRelacionTipoProducto
			, idCatTipoProducto
			, cantidad
			, costo
		)
		SELECT
		
		oGetDateNow
		, 1
		, 1 -- ALMACEN DE MATERIA PRIMA GLOBAL: AUN NO HAY UN CATALOGO PORQUE NO EXISTE OTRO
		, 4 -- 1: SUCURSAL, 2: VENDEDOR: 3: Materias Primas, 4: Productos Base, 5: Productos Agranel
		, p_idProductoBase
		, 3 -- 1: PRODUCTO, 2: MATERIA PRIMA, 3: PRODUCTO BASE, 4: PRODUCTO AGRANEL
		, p_cantAProducir -- CANTIDAD PRODUCIDA
		, ROUND( p_costoTotal / p_cantAProducir ,2) -- COSTO UNITARIO
		;
	
	END IF;
	
	-- EN CASO DE NO EXISTIR EL INVENTARIO DE LA MATERIA PRIMA, ENTONCES LO INSERTA
	INSERT INTO stocklog
	(
		createDate
		, active
		, idRelacion
		, idCatRelacionOrigen
		, idRelacionTipoProducto
		, idCatTipoProducto
		, cantidad
		, costo
	)
	SELECT
	
	oGetDateNow
	, 1
	, 1 -- ALMACEN DE MATERIA PRIMA GLOBAL: AUN NO HAY UN CATALOGO PORQUE NO EXISTE OTRO
	, 4 -- 1: SUCURSAL, 2: VENDEDOR: 3: Materias Primas, 4: Productos Base, 5: Productos Agranel
	, p_idProductoBase
	, 3 -- 1: PRODUCTO, 2: MATERIA PRIMA, 3: PRODUCTO BASE, 4: PRODUCTO AGRANEL
	, p_cantAProducir -- CANTIDAD PRODUCIDA
	, ROUND( p_costoTotal / p_cantAProducir ,2) -- COSTO UNITARIO
	;
    
    DROP TABLE ODataTemp;
    
    -- COMMIT;
	
	INSERT INTO producciones_prod ( createDate, idRelacionTipoProducto, idCatTipoProducto, cantidadProd, costoDProd )
	SELECT
	oGetDateNow
	, p_idProductoBase
	, 3 -- 1: PRODUCTO, 2: MATERIA PRIMA, 3: PRODUCTO BASE, 4: PRODUCTO AGRANEL
	, p_cantAProducir
	, ROUND( p_costoTotal ,2);
	
	
	SELECT 1 AS out_id, 'Producido con éxito.' AS message;
	
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `producirProdBase2` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `producirProdBase2`(
	IN oGetDateNow DATETIME
	, IN p_idProdProdBaseH BIGINT
    , IN P_idUserLogON BIGINT
)
BEGIN

	DECLARE mensaje_error TEXT;
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        -- Capturar el mensaje de error
        GET DIAGNOSTICS CONDITION 1 mensaje_error = MESSAGE_TEXT;
		SELECT 0 AS out_id, mensaje_error AS message;
    END;

	SET SQL_SAFE_UPDATES = 0;

	CREATE TEMPORARY TABLE ODataProdTemp (
		id BIGINT AUTO_INCREMENT,
		idProdProdBaseDetalle BIGINT,
		idProductoBase BIGINT,
		cantidad DECIMAL(18,2),
		costo DECIMAL(18,2),
		costoTotal DECIMAL(18,2),
		PRIMARY KEY(id)
	) ENGINE=InnoDB;
	
	INSERT INTO ODataProdTemp ( idProdProdBaseDetalle, idProductoBase, cantidad, costo, costoTotal )
	SELECT
		idProdProdBaseDetalle, idProductoBase, cantidad, costo, costoTotal
	FROM prod_prod_base_detalle
	WHERE
		idProdProdBaseH = p_idProdProdBaseH;

	CREATE TEMPORARY TABLE ODataTemp (
		id BIGINT AUTO_INCREMENT,
		idStock BIGINT,
		idMateriaPrima BIGINT,
		cantidadConsumida DECIMAL(18, 2),
		costoUnitario DECIMAL(18, 2),
		costoTotal DECIMAL(18, 2),
		PRIMARY KEY(id)
	) ENGINE=InnoDB;

    SET @i = 1;
    SET @total = 0;

    -- Obtener la cantidad de elementos para recorrer el while
    SET @total = ( SELECT COUNT(*) FROM ODataProdTemp );

    -- Recorrer el JSON e insertar directamente
    WHILE @i <= @total DO
	
		-- LIMPIO LA TABLA ANTES DE LLENARLA
		DELETE FROM ODataTemp;
	
		SET @idProdProdBaseDetalle = 0;
		SET @idProductoBase = 0;
		SET @cantidad = 0;
		SET @costo = 0;
		SET @costoTotal = 0;
		SET @productoBaseName = '';
		
		SET @idProdProdBaseDetalle = ( SELECT idProdProdBaseDetalle FROM ODataProdTemp WHERE id = @i );
		SET @idProductoBase = ( SELECT idProductoBase FROM ODataProdTemp WHERE id = @i );
		SET @cantidad = ( SELECT cantidad FROM ODataProdTemp WHERE id = @i );
		SET @costo = ( SELECT costo FROM ODataProdTemp WHERE id = @i );
		SET @costoTotal = ( SELECT costoTotal FROM ODataProdTemp WHERE id = @i );
		
		SET @productoBaseName = (
		
			SELECT 
			
				CONCAT( IFNULL( CTP.abreviatura ,''), '-', CAST( P.idproductocategoria AS CHAR(12) ) , '-', IFNULL( CD.description ,''), ' ', REPLACE( CAST( P.valorMedida AS CHAR(12) ) , '.00', ''), ' ', IFNULL( UM.abreviatura ,'') )

			FROM productos AS P
			INNER JOIN cat_tipo_producto AS CTP ON CTP.active = 1 AND CTP.idCatTipoProducto = P.idCatTipoProducto
			INNER JOIN cat_descripciones AS CD ON CD.active = 1 AND CD.idDescription = P.idDescription
			INNER JOIN cat_unidad_medida AS UM ON UM.active = 1 AND UM.idUnidadMedida = P.idUnidadMedida
			WHERE
				P.idProducto = @idProductoBase
		
		);
	
        INSERT INTO ODataTemp (
            idStock, idMateriaPrima, cantidadConsumida, costoUnitario, costoTotal
        )
		SELECT
		
		PPBS.idStock
		, SL.idProducto AS idMateriaPrima
		, PPBS.cantidadConsumida
		, PPBS.costoUnitario
		, PPBS.costoTotal
		
		FROM prod_prod_base_stock AS PPBS
		INNER JOIN stocklog AS SL ON SL.idStock = PPBS.idStock
		WHERE
			PPBS.idProdProdBaseDetalle = @idProdProdBaseDetalle
		;
		
		-- START TRANSACTION;
		
		-- BAJO EL INVENTARIO LOG
		INSERT INTO stocklog
		(
			createDate
			, active
			, idOrigen
			, idProducto
			, idCatMov
			, cantidad
			, costo
			, idStockFrom
			, idRelacionOperacion
			, comentarios
			, idCreateUser
			, motivoDesc
		)
		SELECT
		
		oGetDateNow
		, 1
		, 1 -- 1: AMP, 2: APB, 3: APA, 4: APT
		, idMateriaPrima
		, 2 -- 1: Orden de compra, 2: Producción, 3: Transferencia
		, cantidadConsumida * -1 -- LE QUITAMOS LO QUE SE CONSUMIÓ 
		, costoUnitario
		, idStock
		, 0
		, ''
		, P_idUserLogON
        , CONCAT( 'Salida por producción #',  p_idProdProdBaseH,' de ', @productoBaseName )
		
		FROM ODataTemp;
		
		-- HAGO UN UPDATE AL STOCK DE LA MATERIA PRIMA
		UPDATE
			stock AS S
			INNER JOIN
			(
				SELECT
				MPP.idMateriaPrima
				, SUM( MPP.cantidadConsumida ) AS cantidadConsumida
				FROM ODataTemp AS MPP
				GROUP BY MPP.idMateriaPrima
			) AS MP
				ON
					S.idOrigen = 1 -- 1: AMP, 2: APB, 3: APA, 4: APT
					AND S.idProducto = MP.idMateriaPrima
					
		SET
			S.cantidad = S.cantidad - MP.cantidadConsumida
		;
		
		IF
		(
			SELECT
			COUNT(*)
			FROM stock
			WHERE
				idOrigen = 2 -- 1: AMP, 2: APB, 3: APA, 4: APT
				AND idProducto = @idProductoBase
		) > 0
		THEN
		
			-- AHORA INSERTO EL INVENTARIO DEL PRODUCTO BASE PRODUCIDO
			-- HAGO UN UPDATE AL STOCK POR SI EXISTE QUE LE SUME LA CANTIDAD
			-- SI NO EXISTE LO HACE EN EL INSERT DE ABAJO
			UPDATE
				stock
			SET
				cantidad = cantidad + @cantidad
				, costo = @costo
			WHERE
				idOrigen = 2 -- 1: AMP, 2: APB, 3: APA, 4: APT
				AND idProducto = @idProductoBase
			;
			
		ELSE
		
			-- EN CASO DE NO EXISTIR EL INVENTARIO DE LA MATERIA PRIMA, ENTONCES LO INSERTA
			INSERT INTO stock
			(
				createDate
				, active
				, idOrigen
				, idProducto
				, cantidad
				, costo
			)
			SELECT
			
			oGetDateNow
			, 1
			, 2 -- 1: AMP, 2: APB, 3: APA, 4: APT
			, @idProductoBase
			, @cantidad -- CANTIDAD PRODUCIDA
			, @costo -- COSTO UNITARIO
			;
		
		END IF;
		
		-- INSERTO EL LOG POSITIVO DE LA PRODUCCIÓN DEL PRODUCTO
		INSERT INTO stocklog
		(
			createDate
			, active
			, idOrigen
			, idProducto
			, idCatMov
			, cantidad
			, costo
			, idStockFrom
			, idRelacionOperacion
			, comentarios
			, idCreateUser
			, motivoDesc
		)
		SELECT
		
		oGetDateNow
		, 1
		, 2 -- 1: AMP, 2: APB, 3: APA, 4: APT
		, @idProductoBase
		, 2 -- 1: Orden de compra, 2: Producción, 3: Transferencia
		, @cantidad -- CANTIDAD PRODUCIDA
		, @costo -- COSTO UNITARIO
		, 0
		, 0
		, ''
		, P_idUserLogON
		, CONCAT( 'Entrada por producción PPB#' , p_idProdProdBaseH )
        ;
		
		-- COMMIT;
		
        -- Incrementar contador
        SET @i = @i + 1;
		
    END WHILE;
    
    UPDATE
		prod_prod_base
	SET
		idCatStatusProd = 2 -- 1: BORRADOR, 2: COMPLETO
	WHERE
		idProdProdBaseH = p_idProdProdBaseH
	;
	
	SELECT 1 AS out_id, 'Producido con éxito.' AS message;
    
    DROP TABLE ODataProdTemp;
    DROP TABLE ODataTemp;
    
    SET SQL_SAFE_UPDATES = 1;
	
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `producirProdBaseJustInsert` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `producirProdBaseJustInsert`(
	IN oGetDateNow DATETIME
	, IN p_idProductoBase BIGINT
	, IN p_cantAProducir DECIMAL(18, 2)
	, IN p_costoTotal DECIMAL(18, 2)
	, IN jsonData JSON
)
BEGIN

	CREATE TEMPORARY TABLE ODataTemp (
		id BIGINT AUTO_INCREMENT,
		idStock BIGINT,
		idMateriaPrima BIGINT,
		cantidadConsumida DECIMAL(18, 2),
		costoUnitario DECIMAL(18, 2),
		costoTotal DECIMAL(18, 2),
		PRIMARY KEY(id)
	) ENGINE=InnoDB;

    SET @i = 0;
    SET @total = 0;

    -- Obtener la cantidad de elementos en el JSON
    SET @total = JSON_LENGTH(jsonData);

    -- Recorrer el JSON e insertar directamente
    WHILE @i < @total DO
	
        INSERT INTO ODataTemp (
            idStock, idMateriaPrima, cantidadConsumida, costoUnitario, costoTotal
        ) VALUES (
            JSON_EXTRACT(jsonData, CONCAT('$[', @i, '].idStock')),
            JSON_EXTRACT(jsonData, CONCAT('$[', @i, '].idMateriaPrima')),
            JSON_EXTRACT(jsonData, CONCAT('$[', @i, '].cantidadConsumida')),
            JSON_EXTRACT(jsonData, CONCAT('$[', @i, '].costoUnitario')),
            JSON_EXTRACT(jsonData, CONCAT('$[', @i, '].costoTotal'))
        );

        -- Incrementar contador
        SET @i = @i + 1;
		
    END WHILE;
	
    
	SELECT 1 AS out_id, 'Producido con éxito.' AS message;
	
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `producirProdFinal` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `producirProdFinal`(
	IN oGetDateNow DATETIME
	, IN p_idProdProdFinalH BIGINT
    , IN P_idUserLogON BIGINT
)
BEGIN

	DECLARE mensaje_error TEXT;
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        -- Capturar el mensaje de error
        GET DIAGNOSTICS CONDITION 1 mensaje_error = MESSAGE_TEXT;
		SELECT 0 AS out_id, mensaje_error AS message;
    END;

	SET SQL_SAFE_UPDATES = 0;
	
	DROP TABLE IF EXISTS ODataProdTemp;

	CREATE TEMPORARY TABLE ODataProdTemp (
		id BIGINT AUTO_INCREMENT,
		idProdProdFinalDetalle BIGINT,
		idProductoFinal BIGINT,
		cantidad DECIMAL(18,2),
		costo DECIMAL(18,2),
		costoTotal DECIMAL(18,2),
		PRIMARY KEY(id)
	) ENGINE=InnoDB;
	
	INSERT INTO ODataProdTemp ( idProdProdFinalDetalle, idProductoFinal, cantidad, costo, costoTotal )
	SELECT
		idProdProdFinalDetalle, idProductoFinal, cantidad, costo, costoTotal
	FROM prod_prod_final_detalle
	WHERE
		idProdProdFinalH = p_idProdProdFinalH;
		
    SET @i = 1;
    SET @total = 0;

    -- Obtener la cantidad de elementos para recorrer el while
    SET @total = ( SELECT COUNT(*) FROM ODataProdTemp );

    -- Recorrer el JSON e insertar directamente
    WHILE @i <= @total DO
	
		SET @idProdProdFinalDetalle = 0;
		SET @idProductoFinal = 0;
		SET @cantidad = 0;
		SET @costo = 0;
		SET @costoTotal = 0;
		SET @productoFinalName = '';
		
		SET @idProdProdFinalDetalle = ( SELECT idProdProdFinalDetalle FROM ODataProdTemp WHERE id = @i );
		SET @idProductoFinal = ( SELECT idProductoFinal FROM ODataProdTemp WHERE id = @i );
		SET @cantidad = ( SELECT cantidad FROM ODataProdTemp WHERE id = @i );
		
		SET @productoFinalName = (
		
			SELECT 
			
				CONCAT( IFNULL( CTP.abreviatura ,''), '-', CAST( P.idproductocategoria AS CHAR(12) ) , '-', IFNULL( CD.description ,''), ' ', REPLACE( CAST( P.valorMedida AS CHAR(12) ) , '.00', ''), ' ', IFNULL( UM.abreviatura ,'') )

			FROM productos AS P
			INNER JOIN cat_tipo_producto AS CTP ON CTP.active = 1 AND CTP.idCatTipoProducto = P.idCatTipoProducto
			INNER JOIN cat_descripciones AS CD ON CD.active = 1 AND CD.idDescription = P.idDescription
			INNER JOIN cat_unidad_medida AS UM ON UM.active = 1 AND UM.idUnidadMedida = P.idUnidadMedida
			WHERE
				P.idProducto = @idProductoFinal
		
		);
	
		-- START TRANSACTION;
		
		-- BAJO EL INVENTARIO LOG DEL PRODUCTO AGRANEL
		INSERT INTO stocklog
		(
			createDate
			, active
			, idOrigen
			, idProducto
			, idCatMov
			, cantidad
			, costo
			, idStockFrom
			, idRelacionOperacion
			, comentarios
			, idCreateUser
			, motivoDesc
		)
		SELECT
		
		oGetDateNow
		, 1
		, SBL.idOrigen -- 1: AMP, 2: APB, 3: APA, 4: APT
		, SBL.idProducto
		, 2 -- 1: Orden de compra, 2: Producción, 3: Transferencia
		-- SI ES AGRANEL LE BAJAMOS EL % DE PARTICIPACIÓN, SI NO PS NO JAJAJA
		, ( SUM( SBL.cantidad ) * -1 )
		, 0 -- costoUnitario
		, 0 -- idStock
		, 0
		, ''
		, P_idUserLogON
		, CONCAT( 'Salida por producción #',  p_idProdProdFinalH,' de ', @productoFinalName )
		
		FROM stock_block_log AS SBL
		INNER JOIN productos AS P
			ON
				P.active = 1
				AND P.idProducto = SBL.idProducto
		WHERE
			SBL.idRelation = @idProdProdFinalDetalle
			AND SBL.relationType = 'ProdProdF'
		GROUP BY SBL.idOrigen, SBL.idProducto
        ;
		
		-- HAGO UN UPDATE AL STOCK DEL PRODUCTO AGRANEL
		UPDATE
			stock AS S
			INNER JOIN
			(
				SELECT
				SBL.idOrigen
				, SBL.idProducto
				
				, SUM( SBL.cantidad ) AS cantidadConsumida
				FROM stock_block_log AS SBL
				INNER JOIN productos AS P
					ON
						P.active = 1
						AND P.idProducto = SBL.idProducto
				WHERE
					SBL.idRelation = @idProdProdFinalDetalle
					AND SBL.relationType = 'ProdProdF'
				GROUP BY SBL.idOrigen, SBL.idProducto
			) AS MP
				ON
					S.idOrigen = MP.idOrigen -- 1: AMP, 2: APB, 3: APA, 4: APT
					AND S.idProducto = MP.idProducto
					
		SET
			S.cantidad = S.cantidad - MP.cantidadConsumida
		;
		
		-- LE AFECTO A LA PRODUCCIÓN
		IF
		(
			SELECT
			COUNT(*)
			FROM stock
			WHERE
				idOrigen = 4 -- 1: AMP, 2: APB, 3: APA, 4: APT
				AND idProducto = @idProductoFinal
		) > 0
		THEN
		
			-- AHORA INSERTO EL INVENTARIO DEL PRODUCTO PRODUCIDO
			-- HAGO UN UPDATE AL STOCK POR SI EXISTE QUE LE SUME LA CANTIDAD
			-- SI NO EXISTE LO HACE EN EL INSERT DE ABAJO
			UPDATE
				stock
			SET
				cantidad = cantidad + @cantidad
				, costo = @costo
			WHERE
				idOrigen = 4 -- 1: AMP, 2: APB, 3: APA, 4: APT
				AND idProducto = @idProductoFinal
			;
			
		ELSE
		
			-- EN CASO DE NO EXISTIR EL INVENTARIO DEL PRODUCTO, ENTONCES LO INSERTA
			INSERT INTO stock
			(
				createDate
				, active
				, idOrigen
				, idProducto
				, cantidad
				, costo
			)
			SELECT
			
			oGetDateNow
			, 1
			, 4 -- 1: AMP, 2: APB, 3: APA, 4: APT
			, @idProductoFinal
			, @cantidad -- CANTIDAD PRODUCIDA
			, @costo -- COSTO UNITARIO
			;
		
		END IF;
		
		-- INSERTO EL LOG POSITIVO DE LA PRODUCCIÓN DEL PRODUCTO
		INSERT INTO stocklog
		(
			createDate
			, active
			, idOrigen
			, idProducto
			, idCatMov
			, cantidad
			, costo
			, idStockFrom
			, idRelacionOperacion
			, comentarios
			, idCreateUser
			, motivoDesc
		)
		SELECT
		
		oGetDateNow
		, 1
		, 4 -- 1: AMP, 2: APB, 3: APA, 4: APT
		, @idProductoFinal
		, 2 -- 1: Orden de compra, 2: Producción, 3: Transferencia
		, @cantidad -- CANTIDAD PRODUCIDA
		, @costo -- COSTO UNITARIO
		, 0
		, 0
		, ''
		, P_idUserLogON
        , CONCAT( 'Entrada por producción PPF#' , p_idProdProdFinalH )
        ;
        
        -- *******************************************************************************************************
		-- DESBLOQUEAR EL INVENTARIO
		
		-- 3. Actualiza stock restando cantidadBlock por producto
		UPDATE stock s
		JOIN (
			SELECT idOrigen, idProducto, SUM(cantidad) AS cantidad
			FROM stock_block_log
			WHERE
				idRelation = @idProdProdFinalDetalle
				AND relationType = 'ProdProdF'
			GROUP BY idOrigen, idProducto
		) pcd
			ON
				s.idProducto = pcd.idProducto
				AND s.idOrigen = pcd.idOrigen
				
		SET s.cantidadBlock = IFNULL(s.cantidadBlock, 0) - pcd.cantidad;
		
		DELETE FROM stock_block_log WHERE idStock > 0 AND idRelation = @idProdProdFinalDetalle AND relationType = 'ProdProdF';
		
        -- Incrementar contador
        SET @i = @i + 1;
		
    END WHILE;
    
    UPDATE
		prod_prod_final
	SET
		idCatStatusProd = 2 -- 1: BORRADOR, 2: COMPLETO
	WHERE
		idProdProdFinalH = p_idProdProdFinalH
	;
	
	SELECT 1 AS out_id, 'Producido con éxito.' AS message;
    
    SET SQL_SAFE_UPDATES = 1;
	
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `recalcular_costos_por_mp_insumo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `recalcular_costos_por_mp_insumo`(IN p_idProducto BIGINT)
BEGIN
  DECLARE v_idCatTipoProducto SMALLINT;
  DECLARE i INT DEFAULT 1;
  DECLARE total INT DEFAULT 0;
  DECLARE idAux BIGINT;

  -- Detecta tipo del producto
  SELECT idCatTipoProducto INTO v_idCatTipoProducto FROM productos WHERE idProducto = p_idProducto;

  -- Si es Materia Prima
  IF v_idCatTipoProducto = 2 THEN
    -- Tabla temporal para productos base
    CREATE TEMPORARY TABLE tmp_base (id INT AUTO_INCREMENT PRIMARY KEY, idProductoBase BIGINT);
    INSERT INTO tmp_base (idProductoBase)
      SELECT DISTINCT idProductoBase FROM formulas_prod_base WHERE idMateriaPrima = p_idProducto;
    SET total = (SELECT COUNT(*) FROM tmp_base);
    SET i = 1;
    WHILE i <= total DO
      SELECT idProductoBase INTO idAux FROM tmp_base WHERE id = i;
      CALL actualizar_costo_producto(idAux);

      -- Agranel por base
      CREATE TEMPORARY TABLE tmp_agranel (id INT AUTO_INCREMENT PRIMARY KEY, idProductoAgranel BIGINT);
      INSERT INTO tmp_agranel (idProductoAgranel)
        SELECT idProducto FROM productos WHERE idCatTipoProducto = 4 AND idProductoRelacion = idAux;
      SET @total2 = (SELECT COUNT(*) FROM tmp_agranel);
      SET @j = 1;
      WHILE @j <= @total2 DO
        SELECT idProductoAgranel INTO @idAgranel FROM tmp_agranel WHERE id = @j;
        CALL actualizar_costo_producto(@idAgranel);

        -- Final por agranel
        CREATE TEMPORARY TABLE tmp_final (id INT AUTO_INCREMENT PRIMARY KEY, idProductoFinal BIGINT);
        INSERT INTO tmp_final (idProductoFinal)
          SELECT idProducto FROM productos WHERE idCatTipoProducto = 1 AND idProductoRelacion = @idAgranel;
        SET @total3 = (SELECT COUNT(*) FROM tmp_final);
        SET @k = 1;
        WHILE @k <= @total3 DO
          SELECT idProductoFinal INTO @idFinal FROM tmp_final WHERE id = @k;
          CALL actualizar_costo_producto(@idFinal);
          SET @k = @k + 1;
        END WHILE;
        DROP TEMPORARY TABLE IF EXISTS tmp_final;
        SET @j = @j + 1;
      END WHILE;
      DROP TEMPORARY TABLE IF EXISTS tmp_agranel;
      SET i = i + 1;
    END WHILE;
    DROP TEMPORARY TABLE IF EXISTS tmp_base;
  END IF;

  -- Si es Insumo
  IF v_idCatTipoProducto = 5 THEN
    CREATE TEMPORARY TABLE tmp_final (id INT AUTO_INCREMENT PRIMARY KEY, idProductoFinal BIGINT);
    INSERT INTO tmp_final (idProductoFinal)
      SELECT DISTINCT idProducto FROM insumos_productos WHERE idInsumo = p_idProducto;
    SET total = (SELECT COUNT(*) FROM tmp_final);
    SET i = 1;
    WHILE i <= total DO
      SELECT idProductoFinal INTO idAux FROM tmp_final WHERE id = i;
      CALL actualizar_costo_producto(idAux);
      SET i = i + 1;
    END WHILE;
    DROP TEMPORARY TABLE IF EXISTS tmp_final;
  END IF;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `recalcular_todos_los_costos` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `recalcular_todos_los_costos`()
BEGIN
  SET @total = 0;
  SET @i = 1;

  -- Tabla temporal con todas las materias primas e insumos
  DROP TEMPORARY TABLE IF EXISTS tmp_mp_insumo;
  CREATE TEMPORARY TABLE tmp_mp_insumo (
    id INT AUTO_INCREMENT PRIMARY KEY,
    idProducto BIGINT
  );

  INSERT INTO tmp_mp_insumo (idProducto)
    SELECT idProducto FROM productos
    WHERE idCatTipoProducto IN (2, 5);

  SET @total = (SELECT COUNT(*) FROM tmp_mp_insumo);
  SELECT * from tmp_mp_insumo;
  SET @i = 1;
  WHILE @i <= @total DO
    SELECT idProducto INTO @p_idProducto FROM tmp_mp_insumo WHERE id = @i;
    CALL recalcular_costos_por_mp_insumo(@p_idProducto);
    SET @i = @i + 1;
  END WHILE;

  DROP TEMPORARY TABLE IF EXISTS tmp_mp_insumo;
  
  SELECT 'Todo OK';
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `recibirArticulosES` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `recibirArticulosES`(
	IN oGetDateNow DATETIME
	, IN jsonData JSON
	, IN p_idEntradasSalidasH BIGINT
	, IN p_idUserLogON BIGINT
)
BEGIN

	DROP TABLE IF EXISTS oTemp;

	CREATE TEMPORARY TABLE oTemp (
		id BIGINT AUTO_INCREMENT,
		idEntradasSalidasDetalle BIGINT,
		cantidadRecibida DECIMAL(18,2),
		PRIMARY KEY(id)
	) ENGINE=InnoDB;

    SET @i = 0;
    SET @total = 0;

    -- Obtener la cantidad de elementos en el JSON
    SET @total = JSON_LENGTH(jsonData);

    -- Recorrer el JSON e insertar directamente
    WHILE @i < @total DO
	
        INSERT INTO oTemp (
            idEntradasSalidasDetalle, cantidadRecibida
        ) VALUES (
            JSON_EXTRACT(jsonData, CONCAT('$[', @i, '].idEntradasSalidasDetalle')),
			JSON_EXTRACT(jsonData, CONCAT('$[', @i, '].cantidadRecibida'))
        );

        -- Incrementar contador
        SET @i = @i + 1;
		
    END WHILE;
	
	DROP TABLE IF EXISTS ODataProdTemp;

	CREATE TEMPORARY TABLE ODataProdTemp (
		id BIGINT AUTO_INCREMENT,
		idEntradasSalidasH BIGINT,
		idEntradasSalidasDetalle BIGINT,
		idOrigenFrom BIGINT,
		idOrigenTo BIGINT,
		idProducto BIGINT,
		cantidad DECIMAL(18,2),
		PRIMARY KEY(id)
	) ENGINE=InnoDB;
	
	INSERT INTO ODataProdTemp
	(
		idEntradasSalidasH
		, idEntradasSalidasDetalle
		, idOrigenFrom
		, idOrigenTo
		, idProducto
		, cantidad
	)
	SELECT
		ESH.idEntradasSalidasH
		, ESD.idEntradasSalidasDetalle
		, ESH.idOrigenFrom
		, ESH.idOrigenTo
		, ESD.idProducto
		, T.cantidadRecibida
	FROM entradas_salidas_detalle AS ESD
	INNER JOIN entradas_salidas_header AS ESH ON ESH.idEntradasSalidasH = ESD.idEntradasSalidasH
	INNER JOIN oTemp AS T ON T.idEntradasSalidasDetalle = ESD.idEntradasSalidasDetalle
	WHERE
		ESD.idStatusESDetalle = 1
	;
    
	UPDATE
		entradas_salidas_detalle AS PPBD
		INNER JOIN oTemp AS temp
			ON
				temp.idEntradasSalidasDetalle = PPBD.idEntradasSalidasDetalle
	SET
		-- SI LA CANTIDAD ES LA MISMA QUE LA QUE LLEGÓ SE CAMBIA A RECIBIDO, SI NO ENTONCES A ENREVISIÓN
		PPBD.idStatusESDetalle = ( CASE WHEN PPBD.cantidad = ( temp.cantidadRecibida + PPBD.cantidadRecibidaReal ) THEN 2 ELSE 3 END )
		-- TOMO LA CANTIDAD RECIBIDA REAL
        , PPBD.cantidadRecibidaReal = ( temp.cantidadRecibida + PPBD.cantidadRecibidaReal )
        , PPBD.cantidadEnviadaReal = 0
	WHERE
		PPBD.idStatusESDetalle = 1
	;
	
	SET SQL_SAFE_UPDATES = 0;
	
	SET @idOrigenFrom = 0;
	
	SET @idOrigenFrom = IFNULL(
	(
		SELECT
		ESH.idOrigenFrom
		FROM ODataProdTemp AS ESH
		LIMIT 1
	)
	,0);
	
	SET @idOrigenTo = 0;
	
	SET @idOrigenTo = IFNULL(
	(
		SELECT
		ESH.idOrigenTo
		FROM ODataProdTemp AS ESH
		LIMIT 1
	)
	,0);
	
	-- ***************************************************************
	-- BAJO AL idOrigenFrom
	
	-- BAJO EL INVENTARIO LOG
	INSERT INTO stocklog
	(
		createDate
		, active
		, idOrigen
		, idProducto
		, idCatMov
		, cantidad
		, costo
		, idStockFrom
		, idRelacionOperacion
		, comentarios
		, idCreateUser
		, motivoDesc
	)
	SELECT
	
	oGetDateNow
	, 1
	, tmp.idOrigenFrom -- 1: AMP, 2: APB, 3: APA, 4: APT
	, tmp.idProducto
	, 3 -- 1: Orden de compra, 2: Producción, 3: Transferencia
	, tmp.cantidad * -1 -- LE QUITAMOS LO QUE SE CONSUMIÓ 
	, 0 -- costoUnitario
	, 0 -- idStock
	, 0
	, ''
	, P_idUserLogON
	, CONCAT( 'Salida por Transferencia #', p_idEntradasSalidasH ,' a ', CONCAT( IFNULL( CROTo.abreviatura ,''), '-', CAST( OTo.idOrigen AS CHAR(12) ), '-', OTo.nombre ) )
	
	FROM ODataProdTemp AS tmp
	INNER JOIN origenes AS OTo ON OTo.idOrigen = tmp.idOrigenTo
	INNER JOIN cat_relacion_origen AS CROTo ON CROTo.idCatRelacionOrigen = OTo.idCatRelacionOrigen;
		
	-- HAGO UN UPDATE AL STOCK
	UPDATE
		stock AS S
		INNER JOIN
		(
			SELECT
			MPP.idProducto
			, SUM( MPP.cantidad ) AS cantidad
			FROM ODataProdTemp AS MPP
			GROUP BY MPP.idProducto
		) AS MP
			ON
				S.idOrigen = @idOrigenFrom -- 1: AMP, 2: APB, 3: APA, 4: APT
				AND S.idProducto = MP.idProducto
				
	SET
		S.cantidad = S.cantidad - MP.cantidad
	;
	-- ***************************************************************
	
	-- ***************************************************************
	-- LE SUBO AL idOrigenTo
	
	-- SUBO EL INVENTARIO LOG
	INSERT INTO stocklog
	(
		createDate
		, active
		, idOrigen
		, idProducto
		, idCatMov
		, cantidad
		, costo
		, idStockFrom
		, idRelacionOperacion
		, comentarios
		, idCreateUser
		, motivoDesc
	)
	SELECT
	
	oGetDateNow
	, 1
	, tmp.idOrigenTo -- 1: AMP, 2: APB, 3: APA, 4: APT
	, tmp.idProducto
	, 3 -- 1: Orden de compra, 2: Producción, 3: Transferencia
	, tmp.cantidad
	, 0 -- costoUnitario
	, 0 -- idStock
	, 0
	, ''
	, P_idUserLogON
	, CONCAT( 'Entrada por Transferencia #', p_idEntradasSalidasH ,' de ', CONCAT( IFNULL( CROFrom.abreviatura ,''), '-', CAST( OFrom.idOrigen AS CHAR(12) ), '-', OFrom.nombre ) )
	
	FROM ODataProdTemp AS tmp
	INNER JOIN origenes AS OFrom ON OFrom.idOrigen = tmp.idOrigenFrom
	INNER JOIN cat_relacion_origen AS CROFrom ON CROFrom.idCatRelacionOrigen = OFrom.idCatRelacionOrigen
    ;
		
	-- HAGO UN UPDATE AL STOCK
	UPDATE
		stock AS S
		INNER JOIN
		(
			SELECT
			MPP.idProducto
			, SUM( MPP.cantidad ) AS cantidad
			FROM ODataProdTemp AS MPP
			GROUP BY MPP.idProducto
		) AS MP
			ON
				S.idOrigen = @idOrigenTo -- 1: AMP, 2: APB, 3: APA, 4: APT
				AND S.idProducto = MP.idProducto
				
	SET
		S.cantidad = S.cantidad + MP.cantidad
	;
	
	-- EN CASO DE NO EXISTIR EL INVENTARIO, ENTONCES LO INSERTA
	INSERT INTO stock
	(
		createDate
		, active
		, idOrigen
		, idProducto
		, cantidad
		, costo
	)
	SELECT
	
	oGetDateNow
	, 1
	, tmp.idOrigenTo -- 1: AMP, 2: APB, 3: APA, 4: APT
	, tmp.idProducto
	, tmp.cantidad -- CANTIDAD PRODUCIDA
	, 0 -- COSTO UNITARIO
	FROM ODataProdTemp AS tmp
	LEFT JOIN stock AS S
		ON
			S.idOrigen = tmp.idOrigenTo
			AND S.idProducto = tmp.idProducto
	WHERE
		S.idStock IS NULL
	;
	-- ***************************************************************
	
	-- *******************************************************************************************************
	-- DESBLOQUEAR EL INVENTARIO
	
	-- 3. Actualiza stock restando cantidadBlock por producto
	UPDATE stock s
	JOIN (
		SELECT SBL.idOrigen, SBL.idProducto, SUM( SBL.cantidad ) AS cantidad
		FROM stock_block_log AS SBL
		INNER JOIN ODataProdTemp AS tmp ON tmp.idEntradasSalidasDetalle = SBL.idRelation
		WHERE
			relationType = 'ESTransfer'
		GROUP BY SBL.idOrigen, SBL.idProducto
	) pcd
		ON
			s.idProducto = pcd.idProducto
			AND s.idOrigen = pcd.idOrigen
			
	SET s.cantidadBlock = IFNULL(s.cantidadBlock, 0) - pcd.cantidad;
	
	-- BORRO EL BLOQUEO
	DELETE SBL FROM stock_block_log AS SBL
	INNER JOIN ODataProdTemp AS tmp ON tmp.idEntradasSalidasDetalle = SBL.idRelation
	WHERE
		SBL.relationType = 'ESTransfer'
		AND SBL.idStock > 0
	;
	
	-- *******************************************************************************************************
	
	-- SI YA SE RECIBIÓ TODO, ENTONCES SE CIERRA LA TRANSFERENCIA
	IF
	(
		SELECT
		SUM( ESD.cantidad - ESD.cantidadRecibidaReal )
		FROM entradas_salidas_detalle AS ESD
		WHERE
			ESD.idEntradasSalidasH = p_idEntradasSalidasH
	) = 0 THEN
	
		UPDATE
			entradas_salidas_header
		SET
			idEntradaSalidaStatus = 3 -- 1: Borrador, 2: En Proceso, 3: Completa
		WHERE
			idEntradasSalidasH = p_idEntradasSalidasH
		;
			
	END IF;
	
    
	SELECT 1 AS out_id, 'Recibido con éxito.' AS message;
		
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ReEnviarArticulosES` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ReEnviarArticulosES`(
	IN oGetDateNow DATETIME
	, IN jsonData JSON
	, IN p_idUserLogON BIGINT
)
BEGIN

	DROP TABLE IF EXISTS oTemp;

	CREATE TEMPORARY TABLE oTemp (
		id BIGINT AUTO_INCREMENT,
		idEntradasSalidasDetalle BIGINT,
		PRIMARY KEY(id)
	) ENGINE=InnoDB;

    SET @i = 0;
    SET @total = 0;

    -- Obtener la cantidad de elementos en el JSON
    SET @total = JSON_LENGTH(jsonData);

    -- Recorrer el JSON e insertar directamente
    WHILE @i < @total DO
	
        INSERT INTO oTemp (
            idEntradasSalidasDetalle
        ) VALUES (
            JSON_EXTRACT(jsonData, CONCAT('$[', @i, '].idEntradasSalidasDetalle'))
        );

        -- Incrementar contador
        SET @i = @i + 1;
		
    END WHILE;
    
	UPDATE
		entradas_salidas_detalle AS PPBD
		INNER JOIN oTemp AS temp
			ON
				temp.idEntradasSalidasDetalle = PPBD.idEntradasSalidasDetalle
	SET
		-- LE CAMBIO EL STATUS A ENVIADO
		PPBD.idStatusESDetalle = 1
	WHERE
		-- SOLO LOS QUE ESTABAN EN REVISIÓN, ESTE CANDADO ADICIONAL POR SI VIENE ALGUN OTRO QUE NO DEBE JAJAJA
		PPBD.idStatusESDetalle = 3
	;
    
	SELECT 1 AS out_id, 'Recibido con éxito.' AS message;
		
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `regresarPedido` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `regresarPedido`(
IN oGetDateNow DATETIME,
IN p_idPedido BIGINT,
IN p_idVenta BIGINT,

IN p_idUserLogON BIGINT
)
BEGIN

	DECLARE mensaje_error TEXT;
    
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        -- Capturar el mensaje de error
        GET DIAGNOSTICS CONDITION 1 mensaje_error = MESSAGE_TEXT;
		SELECT 0 AS out_id, mensaje_error AS message;
    END;
    
	-- SE REGRESA EL STATUS DEL PEDIDO
	UPDATE
		pedidos_clientes
	SET
		idCatStatusPedidosClientes = 3
	WHERE
		idPedido = p_idPedido;
	
	-- SE BORRA LOS ENVASES
	DELETE FROM ventas_envases
	WHERE
		idVenta = p_idVenta;
		
	-- SE BORRA EL DETALLE DE LA VENTA
	DELETE FROM ventasdetalle
	WHERE
		idVenta = p_idVenta;
		
	-- SE BORRA LA VENTA
	DELETE FROM ventas
	WHERE
		idVenta = p_idVenta;
		
	-- ********************************************************************************************
	-- SE BLOQUEA DE NUEVO EL PRODUCTO
	-- Obtener idOrigen
	SET @idOrigen = 0;
	SELECT O.idOrigen INTO @idOrigen
	FROM origenes AS O
	INNER JOIN pedidos_clientes AS PC ON PC.idSucursal = O.idRelacion
	WHERE O.idCatRelacionOrigen = 1 -- SUCURSAL
	  AND PC.idPedido = p_idPedido
	LIMIT 1;

	-- 2. Inserta en stock_block_log cada agrupación
	INSERT INTO stock_block_log (
		createDate,
		active,
		idOrigen,
		idProducto,
		cantidad,
		idRelation,
		relationType,
		motivoDesc
	)
	SELECT 
		oGetDateNow,
		1,
		@idOrigen,
		idProducto,
		SUM(cantidad),
		p_idPedido,
		'PedidoC',
		CONCAT('Bloqueado por el pedido regresado #', p_idPedido)
	FROM pedidos_clientes_detalle
	WHERE idPedido = p_idPedido
	GROUP BY idProducto;

	-- 3. Actualiza stock sumando cantidadBlock por producto
	UPDATE stock s
	JOIN (
		SELECT idProducto, SUM(cantidad) AS cantidad
		FROM pedidos_clientes_detalle
		WHERE idPedido = p_idPedido
		GROUP BY idProducto
	) pcd ON s.idProducto = pcd.idProducto AND s.idOrigen = @idOrigen
	SET s.cantidadBlock = IFNULL(s.cantidadBlock, 0) + pcd.cantidad;
	-- ********************************************************************************************

    SELECT p_idPedido AS out_id, 'Pedido regresado correctamente' AS message;
	
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `repClientesInactivos` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `repClientesInactivos`(
    IN p_startDate VARCHAR(50),
    IN p_endDate VARCHAR(50),
    IN p_idSucursal INT,
    IN p_idVendedor BIGINT,
    IN p_idCliente BIGINT,
    IN p_idTipoCliente INT,
    IN p_idProducto BIGINT,
    IN p_idTipoPromocion SMALLINT,
    IN p_idTipoVenta INT,
    IN p_startDateCliente VARCHAR(50),
    IN p_endDateCliente VARCHAR(50),
    IN p_idFamilia INT,
	IN p_idZona INT,
	IN p_idGiro INT,
    IN p_start INT,
    IN p_limiter INT
)
BEGIN
    DECLARE iRows INT DEFAULT 0;
	
	SELECT COUNT(*) INTO iRows
	FROM
	(
		SELECT
			C.idCliente
		FROM clientes AS C
		LEFT JOIN zonas AS Z ON Z.idZona = C.idZona
		LEFT JOIN
		(
			SELECT v.idCliente
			FROM ventas AS v
			INNER JOIN clientes AS C ON C.idCliente = v.idCliente
			LEFT JOIN zonas AS Z ON Z.idZona = C.idZona
			WHERE v.active = 1
				AND C.active = 1
				AND C.idTipoCliente IN( 2, 3, 4, 6 )
				AND ( IFNULL( p_startDate ,'') = '' OR CAST( v.createDate AS DATE ) >= p_startDate)
				AND ( p_idVendedor = 0 OR C.idVendedor = p_idVendedor )
				AND ( p_idTipoCliente = 0 OR C.idTipoCliente = p_idTipoCliente )
				AND ( p_idCliente = 0 OR C.idCliente = p_idCliente )
				AND ( p_idZona = 0 OR Z.idZona = p_idZona )
				AND ( p_idGiro = 0 OR C.idGiro = p_idGiro )
				GROUP BY v.idCliente
		) AS tc ON tc.idCliente = C.idCliente
		
		WHERE C.active = 1
			AND tc.idCliente IS NULL
			
			AND C.idTipoCliente IN( 2, 3, 4, 6 ) -- CLIENTE, EMPRENDEDOR, PREMIUM Y DETALLE
			AND ( p_idVendedor = 0 OR C.idVendedor = p_idVendedor )
			AND ( p_idTipoCliente = 0 OR C.idTipoCliente = p_idTipoCliente )
			AND ( p_idCliente = 0 OR C.idCliente = p_idCliente )
			AND ( p_idZona = 0 OR Z.idZona = p_idZona )
			AND ( p_idGiro = 0 OR C.idGiro = p_idGiro )
	)
	AS c
	;
	
	SELECT
		
		iRows AS iRows,
        C.idCliente,
        CONCAT( C.nombre, ' - ', CTC.name) AS clienteName,
		C.telefono,
		maxSale.idVenta,
		maxSale.createDate,
		DATE_FORMAT( maxSale.createDate, '%d/%m/%Y') AS createDateDate,
		DATE_FORMAT( maxSale.createDate, '%h:%i:%s %p') AS createDateHours,
		maxSale.total
		
	FROM clientes AS C
	INNER JOIN cat_tipo_cliente AS CTC ON CTC.idTipoCliente = C.idTipoCliente
	LEFT JOIN zonas AS Z ON Z.idZona = C.idZona
	LEFT JOIN
	(
		SELECT v.idCliente
		FROM ventas AS v
		INNER JOIN clientes AS C ON C.idCliente = v.idCliente
		LEFT JOIN zonas AS Z ON Z.idZona = C.idZona
		WHERE v.active = 1
			AND C.active = 1
			AND C.idTipoCliente IN( 2, 3, 4, 6 )
			AND ( IFNULL( p_startDate ,'') = '' OR CAST( v.createDate AS DATE ) >= p_startDate)
			AND ( p_idVendedor = 0 OR C.idVendedor = p_idVendedor )
			AND ( p_idTipoCliente = 0 OR C.idTipoCliente = p_idTipoCliente )
			AND ( p_idCliente = 0 OR C.idCliente = p_idCliente )
			AND ( p_idZona = 0 OR Z.idZona = p_idZona )
			AND ( p_idGiro = 0 OR C.idGiro = p_idGiro )
			GROUP BY v.idCliente
	) AS tc ON tc.idCliente = C.idCliente
	
	LEFT JOIN
	(
		SELECT
		v.idCliente
		, v.idVenta
		, v.createDate
		, v.total
		FROM ventas AS v
		INNER JOIN
		(
			-- máxima venta por cliente (solo ventas activas)
			SELECT
				v1.idCliente,
				MAX( v1.idVenta ) AS maxIdVenta
			FROM ventas v1
			WHERE v1.active = 1
				AND ( CAST( v1.createDate AS DATE ) < p_startDate )
				
			GROUP BY v1.idCliente
		) AS v2 ON v2.maxIdVenta = v.idVenta
    ) maxSale ON maxSale.idCliente = C.idCliente
	
	WHERE C.active = 1
		AND tc.idCliente IS NULL
		
		AND C.idTipoCliente IN( 2, 3, 4, 6 ) -- CLIENTE, EMPRENDEDOR, PREMIUM Y DETALLE
		AND ( p_idVendedor = 0 OR C.idVendedor = p_idVendedor )
		AND ( p_idTipoCliente = 0 OR C.idTipoCliente = p_idTipoCliente )
		AND ( p_idCliente = 0 OR C.idCliente = p_idCliente )
		AND ( p_idZona = 0 OR Z.idZona = p_idZona )
		AND ( p_idGiro = 0 OR C.idGiro = p_idGiro )
	ORDER BY C.nombre ASC
	LIMIT p_start, p_limiter
	;
	
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `repCreditosPag` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `repCreditosPag`(
    IN p_startDate VARCHAR(50),
    IN p_endDate VARCHAR(50),
    IN p_idSucursal INT,
    IN p_idVendedor BIGINT,
    IN p_idCliente BIGINT,
    IN p_statusFiltro INT, -- 0: pendientes, 1: pagados, 2: todos
    IN p_estatusCredito VARCHAR(20) -- Nuevo parámetro, ejemplo: 'por vencer'
)
BEGIN
    DECLARE iRows INT DEFAULT 0;
    DECLARE v_CURDATE DATE;
    DECLARE v_NOW DATETIME;
    
    SET v_CURDATE = CONVERT_TZ(NOW(), 'UTC', 'America/Mazatlan');
    SET v_NOW = CONVERT_TZ(NOW(), 'UTC', 'America/Mazatlan');

    -- Contar filas
    SELECT COUNT(*) INTO iRows
    FROM (
        SELECT v.idVenta,
            CASE
                WHEN (v.total - IFNULL(SUM(p.total), 0)) = 0 THEN 'pagado'
                WHEN DATEDIFF(v_CURDATE, CAST( v.createDate AS DATE ) ) + 1 > c.iDiasCredito THEN 'vencido'
                WHEN DATEDIFF(v_CURDATE, CAST( v.createDate AS DATE ) ) + 1 = c.iDiasCredito THEN 'por vencer'
                ELSE 'dentro del plazo'
            END AS estatus_credito
        FROM ventas v
        INNER JOIN clientes c ON c.idCliente = v.idCliente
        LEFT JOIN pagos p ON p.idVenta = v.idVenta AND p.active = 1
        WHERE v.active = 1
            AND v.idTipoVenta = 2 -- SOLO DE CREDITO
            AND ( IFNULL( p_startDate ,'') = '' OR CAST( v.createDate AS DATE ) >= p_startDate)
            AND ( IFNULL( p_endDate ,'') = '' OR CAST( v.createDate AS DATE ) <= p_endDate)
            AND (p_idSucursal = 0 OR v.idSucursal = p_idSucursal)
            AND (p_idVendedor = 0 OR v.idVendedor = p_idVendedor)
            AND (p_idCliente = 0 OR v.idCliente = p_idCliente)
        GROUP BY v.idVenta, v.createDate, c.nombre, v.total
        HAVING 
            (
                p_statusFiltro = 2
                OR (p_statusFiltro = 1 AND (v.total - IFNULL(SUM(p.total), 0)) = 0)
                OR (p_statusFiltro = 0 AND (v.total - IFNULL(SUM(p.total), 0)) > 0)
            )
            AND (IFNULL(p_estatusCredito, '') = '' OR estatus_credito = p_estatusCredito)
    ) AS sub;

    -- Consulta principal
    SELECT
        iRows AS iRows,
        v.idVenta,
        v.createDate,
        DATE_FORMAT( v.createDate, '%d/%m/%Y') AS createDateDate,
        DATE_FORMAT( v.createDate, '%h:%i:%s %p') AS createDateHours,
        c.nombre AS cliente,
        v.total,
        IFNULL(SUM(p.total), 0) AS pagado,
        v.total - IFNULL(SUM(p.total), 0) AS saldo,
        DATEDIFF(v_CURDATE, CAST( v.createDate AS DATE ) ) + 1  AS diasTranscurridos,
        v_CURDATE AS diaActualSQL,
        v_NOW AS diaActualSQL2,
        CASE
            WHEN (v.total - IFNULL(SUM(p.total), 0)) = 0 THEN 'pagado'
            WHEN DATEDIFF(v_CURDATE, CAST( v.createDate AS DATE ) ) + 1 > c.iDiasCredito THEN 'vencido'
            WHEN DATEDIFF(v_CURDATE, CAST( v.createDate AS DATE ) ) + 1 = c.iDiasCredito THEN 'por vencer'
            ELSE 'dentro del plazo'
        END AS estatus_credito
    FROM ventas v
    INNER JOIN clientes c ON c.idCliente = v.idCliente
    LEFT JOIN pagos p ON p.idVenta = v.idVenta AND p.active = 1
    WHERE v.active = 1
        AND v.idTipoVenta = 2
        AND ( IFNULL( p_startDate ,'') = '' OR CAST( v.createDate AS DATE ) >= p_startDate)
        AND ( IFNULL( p_endDate ,'') = '' OR CAST( v.createDate AS DATE ) <= p_endDate)
        AND (p_idSucursal = 0 OR v.idSucursal = p_idSucursal)
        AND (p_idVendedor = 0 OR v.idVendedor = p_idVendedor)
        AND (p_idCliente = 0 OR v.idCliente = p_idCliente)
    GROUP BY v.idVenta, v.createDate, c.nombre, v.total
    HAVING 
        (
            p_statusFiltro = 2
            OR (p_statusFiltro = 1 AND (v.total - IFNULL(SUM(p.total), 0)) = 0)
            OR (p_statusFiltro = 0 AND (v.total - IFNULL(SUM(p.total), 0)) > 0)
        )
        AND (IFNULL(p_estatusCredito, '') = '' OR estatus_credito = p_estatusCredito)
    ORDER BY v.createDate DESC;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `repCreditosSumarizado` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `repCreditosSumarizado`(
    IN p_startDate VARCHAR(50),
    IN p_endDate VARCHAR(50),
    IN p_idSucursal INT,
    IN p_idVendedor BIGINT,
    IN p_idCliente BIGINT,
    IN p_statusFiltro INT,
	IN p_estatusCredito VARCHAR(20)
)
BEGIN
	DECLARE v_total DECIMAL( 18, 2 ) DEFAULT 0;
    DECLARE v_totalPendiente DECIMAL( 18, 2 ) DEFAULT 0;
	
	DECLARE v_CURDATE DATE;
    DECLARE v_NOW DATETIME;
    
    SET v_CURDATE = CONVERT_TZ(NOW(), 'UTC', 'America/Mazatlan');
    SET v_NOW = CONVERT_TZ(NOW(), 'UTC', 'America/Mazatlan');
	
    -- Consulta principal
    
	SELECT
	
	SUM( total )
	, SUM( saldo )
	INTO
	v_total
	, v_totalPendiente
	
	FROM
	(
		SELECT
			
			v.idVenta
			, v.total
			, v.total - IFNULL(SUM(p.total), 0) AS saldo
			
			,CASE
                WHEN (v.total - IFNULL(SUM(p.total), 0)) = 0 THEN 'pagado'
                WHEN DATEDIFF(v_CURDATE, CAST( v.createDate AS DATE ) ) + 1 > c.iDiasCredito THEN 'vencido'
                WHEN DATEDIFF(v_CURDATE, CAST( v.createDate AS DATE ) ) + 1 = c.iDiasCredito THEN 'por vencer'
                ELSE 'dentro del plazo'
            END AS estatus_credito
			
		FROM ventas v
		INNER JOIN clientes c ON c.idCliente = v.idCliente
		LEFT JOIN pagos p ON p.idVenta = v.idVenta AND p.active = 1
		WHERE v.active = 1
			AND v.idTipoVenta = 2 -- SOLO DE CREDITO
			AND ( IFNULL( p_startDate ,'') = '' OR CAST( v.createDate AS DATE ) >= p_startDate)
			AND ( IFNULL( p_endDate ,'') = '' OR CAST( v.createDate AS DATE ) <= p_endDate)
			AND (p_idSucursal = 0 OR v.idSucursal = p_idSucursal)
			AND (p_idVendedor = 0 OR v.idVendedor = p_idVendedor)
			AND (p_idCliente = 0 OR v.idCliente = p_idCliente)
		GROUP BY v.idVenta, v.total
		HAVING 
			(
				p_statusFiltro = 2 -- todos
				OR (p_statusFiltro = 1 AND (v.total - IFNULL(SUM(p.total), 0)) = 0) -- pagados
				OR (p_statusFiltro = 0 AND (v.total - IFNULL(SUM(p.total), 0)) > 0) -- pendientes
			)
			AND (IFNULL(p_estatusCredito, '') = '' OR estatus_credito = p_estatusCredito)
    ) AS T
    ;
	
	SELECT v_totalPendiente AS totalPendiente, v_total AS total;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `repDineroElectronicoHist` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `repDineroElectronicoHist`(
    IN p_idCliente BIGINT,
	IN p_start INT,
	IN p_limiter INT
)
BEGIN
    DECLARE iRows INT DEFAULT 0;

    -- Contar filas
    SELECT COUNT(*) INTO iRows
    FROM dinero_electronico_log AS DEL
    WHERE
		DEL.idCliente = p_idCliente;

    -- Consulta principal
    SELECT
        iRows AS iRows
        , DEL.keyx
		, DEL.createDate
        , DATE_FORMAT( DEL.createDate, '%d/%m/%Y') AS createDateDate
		, DATE_FORMAT( DEL.createDate, '%h:%i:%s %p') AS createDateHours
		
        , DEL.monto
        , DEL.motivoDesc
		
		, IFNULL(
		(
			SELECT
				ROUND( SUM( SL.monto ) ,2)
			FROM dinero_electronico_log AS SL
			WHERE
				SL.idCliente = DEL.idCliente
				AND SL.keyx < DEL.keyx
		), 0) AS montoAntes
		
		, IFNULL(
		(
			SELECT
				ROUND( SUM( SL.monto ) ,2)
			FROM dinero_electronico_log AS SL
			WHERE
				SL.idCliente = DEL.idCliente
				AND SL.keyx <= DEL.keyx
		), 0) AS montoDespues
		
    FROM dinero_electronico_log AS DEL
    WHERE
		DEL.idCliente = p_idCliente
	ORDER BY DEL.keyx DESC
    LIMIT p_start, p_limiter;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `repEmprendedoresPremium` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `repEmprendedoresPremium`(
    IN p_startDate VARCHAR(50),
    IN p_endDate VARCHAR(50),
    IN p_idTipoCliente INT,
    IN p_idVendedor BIGINT,
	
	IN p_start INT,
    IN p_limiter INT
)
BEGIN
    DECLARE iRows INT DEFAULT 0;
	
	SELECT
        
		COUNT(*)
	INTO
		iRows
		
    FROM clientes c
	WHERE c.active = 1
		AND c.idTipoCliente IN( 3, 4, 6, 7 ) -- CLIENTE, EMPRENDEDOR, PREMIUM Y DETALLE, REVENDEDOR
		AND ( p_idTipoCliente = 0 OR c.idTipoCliente = p_idTipoCliente )
        AND ( p_idVendedor = 0 OR c.idVendedor = p_idVendedor )
	;

    -- Consulta principal
	SELECT
        
		iRows AS iRows
		, C.idCliente
		, CONCAT( C.nombre, ' - ', CTC.name) AS nombre
		, IFNULL( V.total ,0) AS total
        
        , DATE_FORMAT( C.createDate, '%d/%m/%Y') AS createDateDate
		, DATE_FORMAT( C.createDate, '%h:%i:%s %p') AS createDateHours
		
    FROM clientes AS C
	INNER JOIN cat_tipo_cliente AS CTC ON CTC.idTipoCliente = C.idTipoCliente
	LEFT JOIN
	(
	
		SELECT
	
		V.idCliente
		, SUM( V.total ) AS total
		
		FROM ventas AS V
		INNER JOIN clientes AS C ON V.idCliente = C.idCliente
		INNER JOIN cat_tipo_cliente AS CTC ON CTC.idTipoCliente = C.idTipoCliente
		WHERE C.active = 1
			AND C.idTipoCliente IN( 3, 4, 6, 7 ) -- CLIENTE, EMPRENDEDOR, PREMIUM Y DETALLE, REVENDEDOR
			AND ( p_idTipoCliente = 0 OR C.idTipoCliente = p_idTipoCliente )
			AND CAST( V.createDate AS DATE ) BETWEEN p_startDate AND p_endDate

		GROUP BY V.idCliente
	
	) AS V ON V.idCliente = C.idCliente
	WHERE C.active = 1
		AND C.idTipoCliente IN( 3, 4, 6, 7 ) -- CLIENTE, EMPRENDEDOR, PREMIUM Y DETALLE, REVENDEDOR
		AND ( p_idTipoCliente = 0 OR C.idTipoCliente = p_idTipoCliente )
        AND ( p_idVendedor = 0 OR C.idVendedor = p_idVendedor )
	ORDER BY V.total DESC, C.nombre ASC
	LIMIT p_start, p_limiter;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `repPagosFormaDPagoSumarizado` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `repPagosFormaDPagoSumarizado`(
    IN p_startDate VARCHAR(50),
    IN p_endDate VARCHAR(50),
    IN p_idSucursal INT,
    IN p_idVendedor BIGINT,
    IN p_idCliente BIGINT,
    IN p_folioVenta BIGINT, -- Nuevo parámetro
    IN p_tipoDeVenta INT,
    IN p_formaDePago INT
)
BEGIN
    
	-- Consulta principal
    SELECT
        
		ROUND( SUM( MPD.efectivo ) ,2) AS efectivo
        , ROUND( SUM( MPD.tarjeta ) ,2) AS tarjeta
        , ROUND( SUM( MPD.transferencia ) ,2) AS transferencia
        , ROUND( SUM( MPD.cheque ) ,2) AS cheque
        , ROUND( SUM( MPD.dineroElectronico ) ,2) AS dineroElectronico
        
    FROM ventas v
    INNER JOIN clientes c ON c.idCliente = v.idCliente
    INNER JOIN pagos AS P ON P.idVenta = v.idVenta
    INNER JOIN metodos_pago_detalle AS MPD ON MPD.idMetodosPagoDetalle = P.idMetodosPagoDetalle
    WHERE v.active = 1
		AND P.createDate IS NOT NULL
		AND (IFNULL(p_startDate, '') = '' OR CAST(P.createDate AS DATE) >= p_startDate)
		AND (IFNULL(p_endDate, '') = '' OR CAST(P.createDate AS DATE) <= p_endDate)
		AND (p_idSucursal = 0 OR v.idSucursal = p_idSucursal)
		AND (p_idVendedor = 0 OR v.idVendedor = p_idVendedor)
		AND (p_idCliente = 0 OR v.idCliente = p_idCliente)
		AND (p_folioVenta = 0 OR v.idVenta = p_folioVenta)
		AND
		(
			p_tipoDeVenta = 0
			OR v.idTipoVenta = p_tipoDeVenta --  0: Todo, 1: Contado, 2: Crédito
		)
		AND
		(
			p_formaDePago = 0
			OR ( p_formaDePago = 1 AND MPD.efectivo > 0 )
			OR ( p_formaDePago = 2 AND MPD.tarjeta > 0 )
			OR ( p_formaDePago = 3 AND MPD.transferencia > 0 )
			OR ( p_formaDePago = 4 AND MPD.cheque > 0 )
            OR ( p_formaDePago = 5 AND MPD.dineroElectronico > 0 )
		)
		;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `repPagosPorVenta` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `repPagosPorVenta`(
    IN p_startDate VARCHAR(50),
    IN p_endDate VARCHAR(50),
    IN p_idSucursal INT,
    IN p_idVendedor BIGINT,
    IN p_idCliente BIGINT,
    IN p_folioVenta BIGINT, -- Nuevo parámetro
    IN p_tipoDeVenta INT,
    IN p_formaDePago INT,
    IN p_start INT,
    IN p_limiter INT
)
BEGIN
    DECLARE iRows INT DEFAULT 0;

    -- Contar filas
    SELECT COUNT(*) INTO iRows
    FROM pagos p
    INNER JOIN ventas v ON v.idVenta = p.idVenta
    INNER JOIN clientes c ON c.idCliente = v.idCliente
    INNER JOIN metodos_pago_detalle AS MPD ON MPD.idMetodosPagoDetalle = p.idMetodosPagoDetalle
    WHERE p.active = 1
		AND v.active = 1
		AND (IFNULL(p_startDate, '') = '' OR CAST(p.createDate AS DATE) >= p_startDate)
		AND (IFNULL(p_endDate, '') = '' OR CAST(p.createDate AS DATE) <= p_endDate)
		AND (p_idSucursal = 0 OR v.idSucursal = p_idSucursal)
		AND (p_idVendedor = 0 OR v.idVendedor = p_idVendedor)
		AND (p_idCliente = 0 OR v.idCliente = p_idCliente)
		AND (p_folioVenta = 0 OR v.idVenta = p_folioVenta)
		AND
		(
			p_tipoDeVenta = 0
			OR v.idTipoVenta = p_tipoDeVenta --  0: Todo, 1: Contado, 2: Crédito
		)
		AND
		(
			p_formaDePago = 0
			OR ( p_formaDePago = 1 AND MPD.efectivo > 0 )
			OR ( p_formaDePago = 2 AND MPD.tarjeta > 0 )
			OR ( p_formaDePago = 3 AND MPD.transferencia > 0 )
            OR ( p_formaDePago = 4 AND MPD.cheque > 0 )
            OR ( p_formaDePago = 5 AND MPD.dineroElectronico > 0 )
		)
      ;

    -- Consulta principal
    SELECT
        iRows AS iRows,
        v.idVenta AS folioVenta,
        c.nombre AS cliente,
        pagos_ordenados.saldo_anterior,
        pagos_ordenados.abono,
        pagos_ordenados.saldo,
        pagos_ordenados.dias,
        pagos_ordenados.estatus,
        pagos_ordenados.fecha_pago,
		DATE_FORMAT( pagos_ordenados.fecha_pago, '%d/%m/%Y') AS fecha_pagoDate,
		DATE_FORMAT( pagos_ordenados.fecha_pago, '%h:%i:%s %p') AS fecha_pagoHours,
        
        MPD.efectivo,
        MPD.tarjeta,
        MPD.referenciaTarjeta,
        MPD.transferencia,
        MPD.referenciaTransferencia,
        DATE_FORMAT( MPD.fechaTransferencia, '%d-%m-%Y') AS fechaTransferencia,
        MPD.cheque,
        DATE_FORMAT( MPD.fechaDeposito, '%d-%m-%Y') AS fechaDeposito,
        MPD.dineroElectronico
        
    FROM ventas v
    INNER JOIN clientes c ON c.idCliente = v.idCliente
    INNER JOIN (
        SELECT
            p.idVenta,
            p.idPago,
            p.idMetodosPagoDetalle,
            p.createDate AS fecha_pago,
            v.total - IFNULL((
                SELECT SUM(p2.total)
                FROM pagos p2
                WHERE p2.idVenta = p.idVenta
                  AND p2.active = 1
                  AND p2.createDate < p.createDate
            ), 0) AS saldo_anterior,
            p.total AS abono,
            v.total - IFNULL((
                SELECT SUM(p2.total)
                FROM pagos p2
                WHERE p2.idVenta = p.idVenta
                  AND p2.active = 1
                  AND p2.createDate <= p.createDate
            ), 0) AS saldo,
            DATEDIFF(p.createDate, v.createDate) + 1 AS dias,
            CASE
                WHEN v.total - IFNULL((
                    SELECT SUM(p2.total)
                    FROM pagos p2
                    WHERE p2.idVenta = p.idVenta
                      AND p2.active = 1
                      AND p2.createDate <= p.createDate
                ), 0) = 0 THEN 'pagado'
                WHEN DATEDIFF(p.createDate, v.createDate) + 1 > c.iDiasCredito THEN 'vencido'
                WHEN DATEDIFF(p.createDate, v.createDate) + 1 = c.iDiasCredito THEN 'por vencer'
                ELSE 'dentro del plazo'
            END AS estatus
        FROM pagos p
        INNER JOIN ventas v ON v.idVenta = p.idVenta
        INNER JOIN clientes c ON c.idCliente = v.idCliente
        WHERE p.active = 1
    ) AS pagos_ordenados ON pagos_ordenados.idVenta = v.idVenta
    INNER JOIN metodos_pago_detalle AS MPD ON MPD.idMetodosPagoDetalle = pagos_ordenados.idMetodosPagoDetalle
    WHERE v.active = 1
		AND pagos_ordenados.fecha_pago IS NOT NULL
		AND (IFNULL(p_startDate, '') = '' OR CAST(pagos_ordenados.fecha_pago AS DATE) >= p_startDate)
		AND (IFNULL(p_endDate, '') = '' OR CAST(pagos_ordenados.fecha_pago AS DATE) <= p_endDate)
		AND (p_idSucursal = 0 OR v.idSucursal = p_idSucursal)
		AND (p_idVendedor = 0 OR v.idVendedor = p_idVendedor)
		AND (p_idCliente = 0 OR v.idCliente = p_idCliente)
		AND (p_folioVenta = 0 OR v.idVenta = p_folioVenta)
		AND
		(
			p_tipoDeVenta = 0
			OR v.idTipoVenta = p_tipoDeVenta --  0: Todo, 1: Contado, 2: Crédito
		)
		AND
		(
			p_formaDePago = 0
			OR ( p_formaDePago = 1 AND MPD.efectivo > 0 )
			OR ( p_formaDePago = 2 AND MPD.tarjeta > 0 )
			OR ( p_formaDePago = 3 AND MPD.transferencia > 0 )
			OR ( p_formaDePago = 4 AND MPD.cheque > 0 )
            OR ( p_formaDePago = 5 AND MPD.dineroElectronico > 0 )
		)
    ORDER BY pagos_ordenados.fecha_pago DESC
    LIMIT p_start, p_limiter;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `repPagosPorVentaHist` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `repPagosPorVentaHist`(
    IN p_folioVenta BIGINT,
	IN p_start INT,
	IN p_limiter INT
)
BEGIN
    DECLARE iRows INT DEFAULT 0;

    -- Contar filas
    SELECT COUNT(*) INTO iRows
    FROM pagos p
    INNER JOIN ventas v ON v.idVenta = p.idVenta
    INNER JOIN clientes c ON c.idCliente = v.idCliente
    WHERE p.active = 1
      AND v.active = 1
      AND v.idVenta = p_folioVenta;

    -- Consulta principal
    SELECT
        iRows AS iRows,
        v.idVenta AS folioVenta,
        c.nombre AS cliente,
        pagos_ordenados.saldo_anterior,
        pagos_ordenados.abono,
        pagos_ordenados.saldo,
        pagos_ordenados.dias,
        pagos_ordenados.estatus,
        pagos_ordenados.fecha_pago,
		DATE_FORMAT( pagos_ordenados.fecha_pago, '%d/%m/%Y') AS fecha_pagoDate,
		DATE_FORMAT( pagos_ordenados.fecha_pago, '%h:%i:%s %p') AS fecha_pagoHours
    FROM ventas v
    INNER JOIN clientes c ON c.idCliente = v.idCliente
    INNER JOIN (
        SELECT
            p.idVenta,
            p.idPago,
            p.createDate AS fecha_pago,
            v.total - IFNULL((
                SELECT SUM(p2.total)
                FROM pagos p2
                WHERE p2.idVenta = p.idVenta
                  AND p2.active = 1
                  AND p2.createDate < p.createDate
            ), 0) AS saldo_anterior,
            p.total AS abono,
            v.total - IFNULL((
                SELECT SUM(p2.total)
                FROM pagos p2
                WHERE p2.idVenta = p.idVenta
                  AND p2.active = 1
                  AND p2.createDate <= p.createDate
            ), 0) AS saldo,
            DATEDIFF( CAST( p.createDate AS DATE ) , CAST( v.createDate AS DATE ) ) + 1 AS dias,
            CASE
                WHEN v.total - IFNULL((
                    SELECT SUM(p2.total)
                    FROM pagos p2
                    WHERE p2.idVenta = p.idVenta
                      AND p2.active = 1
                      AND p2.createDate <= p.createDate
                ), 0) = 0 THEN 'pagado'
                WHEN DATEDIFF(CAST( p.createDate AS DATE ), CAST( v.createDate AS DATE ) ) + 1 > c.iDiasCredito THEN 'vencido'
                WHEN DATEDIFF(CAST( p.createDate AS DATE ), CAST( v.createDate AS DATE ) ) + 1 = c.iDiasCredito THEN 'por vencer'
                ELSE 'dentro del plazo'
            END AS estatus
        FROM pagos p
        INNER JOIN ventas v ON v.idVenta = p.idVenta
        INNER JOIN clientes c ON c.idCliente = v.idCliente
        WHERE p.active = 1
    ) AS pagos_ordenados ON pagos_ordenados.idVenta = v.idVenta
    WHERE v.active = 1
      AND pagos_ordenados.fecha_pago IS NOT NULL
	  AND v.idVenta = p_folioVenta
    ORDER BY v.idVenta, pagos_ordenados.fecha_pago
    LIMIT p_start, p_limiter;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `repStockBlockHistPag` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `repStockBlockHistPag`(
    IN p_idOrigen BIGINT,
    IN p_idProducto BIGINT,
    IN p_start INT,
    IN p_limiter INT
)
BEGIN
    DECLARE iRows INT DEFAULT 0;

    -- Contar filas
    SELECT COUNT(*) INTO iRows
    FROM stock_block_log AS S
    WHERE
		S.active = 1
		AND S.idOrigen = p_idOrigen
		AND S.idProducto = p_idProducto
      ;

    -- Consulta principal
    SELECT
        iRows AS iRows,
		DATE_FORMAT( S.createDate, '%d/%m/%Y') AS createDateDate,
		DATE_FORMAT( S.createDate, '%h:%i:%s %p') AS createDateHours,
        
        S.motivoDesc,
        S.cantidad
        
    FROM stock_block_log AS S
    WHERE
		S.active = 1
		AND S.idOrigen = p_idOrigen
		AND S.idProducto = p_idProducto
    ORDER BY S.idStock DESC
    LIMIT p_start, p_limiter;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `repVentasDeClienteFrecuentePag` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `repVentasDeClienteFrecuentePag`(
    IN p_startDate VARCHAR(50),
    IN p_endDate VARCHAR(50),
    IN p_idSucursal INT,
    IN p_idVendedor BIGINT,
    IN p_idCliente BIGINT,
    IN p_idTipoCliente INT,
    IN p_idProducto BIGINT,
    IN p_idTipoPromocion SMALLINT,
    IN p_idTipoVenta INT,
    IN p_startDateCliente VARCHAR(50),
    IN p_endDateCliente VARCHAR(50),
    IN p_idFamilia INT,
    IN p_idZona INT,
    IN p_idGiro INT,

    IN p_start INT,
    IN p_limiter INT
)
BEGIN
    DECLARE iRows INT DEFAULT 0;

    -- Contar filas
    SELECT COUNT(*) INTO iRows
    FROM (
        SELECT v.idVenta
        FROM ventas AS v
        INNER JOIN ventasdetalle AS VD ON VD.idVenta = v.idVenta
        INNER JOIN productos AS P ON P.idProducto = VD.idProducto
        INNER JOIN clientes c ON c.idCliente = IFNULL( v.idClienteDiElect ,0)
        LEFT JOIN zonas AS Z ON Z.idZona = c.idZona
        LEFT JOIN giros AS G ON G.idGiro = c.idGiro
        WHERE ( IFNULL( p_startDate ,'') = '' OR CAST( v.createDate AS DATE ) >= p_startDate)
            AND ( IFNULL( p_endDate ,'') = '' OR CAST( v.createDate AS DATE ) <= p_endDate)
            AND (p_idSucursal = 0 OR v.idSucursal = p_idSucursal)
            AND (p_idVendedor = 0 OR v.idVendedor = p_idVendedor)
            AND (p_idCliente = 0 OR IFNULL( v.idClienteDiElect ,0) = p_idCliente)
            AND (p_idTipoCliente = 0 OR c.idTipoCliente = p_idTipoCliente)
            AND (p_idProducto = 0 OR VD.idProducto = p_idProducto)
            AND
            (
                p_idTipoPromocion = 0
                OR ( p_idTipoPromocion = 1 AND VD.idPromocion > 0 )
                OR ( p_idTipoPromocion = 2 AND VD.idPromocion = 0 )
            )
            AND (p_idTipoVenta = 0 OR v.idTipoVenta = p_idTipoVenta)
            AND ( IFNULL( p_startDateCliente ,'') = '' OR CAST( c.createDate AS DATE ) >= p_startDateCliente)
            AND ( IFNULL( p_endDateCliente ,'') = '' OR CAST( c.createDate AS DATE ) <= p_endDateCliente)
            AND (p_idFamilia = 0 OR P.idFamilia = p_idFamilia)
            AND ( p_idZona = 0 OR Z.idZona = p_idZona )
            AND ( p_idGiro = 0 OR G.idGiro = p_idGiro )
        GROUP BY v.idVenta
    ) AS sub;

    -- Consulta principal
    SELECT
        iRows AS iRows,
        v.idVenta,
        v.createDate,
        DATE_FORMAT( v.createDate, '%d/%m/%Y') AS createDateDate,
        DATE_FORMAT( v.createDate, '%h:%i:%s %p') AS createDateHours,
        c.idCliente,
        c.nombre AS cliente,
        c.telefono AS telefono,
        ROUND( SUM( VD.precioUnitario * VD.cantidad ) ,2) AS subtotal,
        ROUND( SUM( VD.descuento * VD.cantidad ) ,2) AS descuento,
        ROUND( SUM( VD.total ) ,2) AS total,

        IFNULL(
            (
                SELECT
                IF( COUNT(*) > 0 , 1, 0 )
                FROM cortescaja AS CC
                WHERE
                    CC.idcajas = v.idCaja
                    AND CC.horacierre <= v.createDate
                LIMIT 1
            )
            ,0) AS bHaveCorte

        , v.active

        , IFNULL(
            (
                SELECT
                CONCAT( UU.name, ': ', DATE_FORMAT( VC.cancelDate, '%d/%m/%Y %h:%i:%s %p') )
                FROM ventas_canceladas AS VC
                INNER JOIN users AS UU ON UU.idUser = VC.idCancelUser
                WHERE
                    VC.idVenta = v.idVenta
                LIMIT 1
            )
            ,0) AS cancelDesc

        , IFNULL( ROUND( DE.monto ,2) ,0) AS montoDiElect

    FROM ventas AS v
        INNER JOIN ventasdetalle AS VD ON VD.idVenta = v.idVenta
        INNER JOIN productos AS P ON P.idProducto = VD.idProducto
        INNER JOIN clientes c ON c.idCliente = IFNULL( v.idClienteDiElect ,0)
        LEFT JOIN dinero_electronico AS DE ON DE.idCliente = c.idCliente
        LEFT JOIN zonas AS Z ON Z.idZona = c.idZona
        LEFT JOIN giros AS G ON G.idGiro = c.idGiro
        WHERE ( IFNULL( p_startDate ,'') = '' OR CAST( v.createDate AS DATE ) >= p_startDate)
                AND ( IFNULL( p_endDate ,'') = '' OR CAST( v.createDate AS DATE ) <= p_endDate)
                AND (p_idSucursal = 0 OR v.idSucursal = p_idSucursal)
                AND (p_idVendedor = 0 OR v.idVendedor = p_idVendedor)
                AND (p_idCliente = 0 OR IFNULL( v.idClienteDiElect ,0) = p_idCliente)
                AND (p_idTipoCliente = 0 OR c.idTipoCliente = p_idTipoCliente)
                AND (p_idProducto = 0 OR VD.idProducto = p_idProducto)
                AND
                (
                    p_idTipoPromocion = 0
                    OR ( p_idTipoPromocion = 1 AND VD.idPromocion > 0 )
                    OR ( p_idTipoPromocion = 2 AND VD.idPromocion = 0 )
                )
                AND (p_idTipoVenta = 0 OR v.idTipoVenta = p_idTipoVenta)
                AND ( IFNULL( p_startDateCliente ,'') = '' OR CAST( c.createDate AS DATE ) >= p_startDateCliente)
                AND ( IFNULL( p_endDateCliente ,'') = '' OR CAST( c.createDate AS DATE ) <= p_endDateCliente)
                AND (p_idFamilia = 0 OR P.idFamilia = p_idFamilia)
                AND ( p_idZona = 0 OR Z.idZona = p_idZona )
                AND ( p_idGiro = 0 OR G.idGiro = p_idGiro )
        GROUP BY
                v.idVenta,
                v.createDate,
                c.idCliente,
                c.nombre,
                c.telefono,
                v.descuento,
                v.total,
                v.active,
                DE.monto
        ORDER BY v.idVenta DESC
        LIMIT p_start, p_limiter
        ;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `repVentasDeClienteFrecuenteSumarizado` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `repVentasDeClienteFrecuenteSumarizado`(
    IN p_startDate VARCHAR(50),
    IN p_endDate VARCHAR(50),
    IN p_idSucursal INT,
    IN p_idVendedor BIGINT,
    IN p_idCliente BIGINT,
    IN p_idTipoCliente INT,
    IN p_idProducto BIGINT,
    IN p_idTipoPromocion SMALLINT,
    IN p_idTipoVenta INT,
    IN p_startDateCliente VARCHAR(50),
    IN p_endDateCliente VARCHAR(50),
    IN p_idFamilia INT,
    IN p_idZona INT,
    IN p_idGiro INT
)
BEGIN

    DECLARE v_subtotal DECIMAL( 18, 2 ) DEFAULT 0;
    DECLARE v_descuento DECIMAL( 18, 2 ) DEFAULT 0;
    DECLARE v_total DECIMAL( 18, 2 ) DEFAULT 0;

    SELECT

        ROUND( SUM( VD.precioUnitario * VD.cantidad ) ,2),
        ROUND( SUM( VD.descuento * VD.cantidad ) ,2),
        ROUND( SUM( VD.total ) ,2)
    INTO
        v_subtotal,
        v_descuento,
        v_total

    FROM ventas AS v
        INNER JOIN ventasdetalle AS VD ON VD.idVenta = v.idVenta
        INNER JOIN productos AS P ON P.active = 1 AND P.idProducto = VD.idProducto
        INNER JOIN sucursales AS S ON S.idSucursal = v.idSucursal
        INNER JOIN clientes c ON c.idCliente = IFNULL( v.idClienteDiElect ,0)
        LEFT JOIN zonas AS Z ON Z.idZona = c.idZona
        LEFT JOIN giros AS G ON G.idGiro = c.idGiro
        WHERE v.active = 1
                AND ( IFNULL( p_startDate ,'') = '' OR CAST( v.createDate AS DATE ) >= p_startDate)
                AND ( IFNULL( p_endDate ,'') = '' OR CAST( v.createDate AS DATE ) <= p_endDate)
                AND (p_idSucursal = 0 OR v.idSucursal = p_idSucursal)
                AND (p_idVendedor = 0 OR v.idVendedor = p_idVendedor)
                AND (p_idCliente = 0 OR IFNULL( v.idClienteDiElect ,0) = p_idCliente)
                AND (p_idTipoCliente = 0 OR c.idTipoCliente = p_idTipoCliente)
                AND (p_idProducto = 0 OR VD.idProducto = p_idProducto)
                AND
                (
                    p_idTipoPromocion = 0
                    OR ( p_idTipoPromocion = 1 AND VD.idPromocion > 0 )
                    OR ( p_idTipoPromocion = 2 AND VD.idPromocion = 0 )
                )
                AND (p_idTipoVenta = 0 OR v.idTipoVenta = p_idTipoVenta)
                AND ( IFNULL( p_startDateCliente ,'') = '' OR CAST( c.createDate AS DATE ) >= p_startDateCliente)
                AND ( IFNULL( p_endDateCliente ,'') = '' OR CAST( c.createDate AS DATE ) <= p_endDateCliente)
                AND (p_idFamilia = 0 OR P.idFamilia = p_idFamilia)
                AND ( p_idZona = 0 OR Z.idZona = p_idZona )
                AND ( p_idGiro = 0 OR G.idGiro = p_idGiro )
        ;

    SELECT v_subtotal AS subtotal, v_descuento AS descuento, v_total AS total;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `repVentasEfectividadPorVendedor` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `repVentasEfectividadPorVendedor`(
    IN p_startDate VARCHAR(50),
    IN p_endDate VARCHAR(50),
    IN p_idVendedor BIGINT,
	IN p_idCliente BIGINT,
	IN p_idTipoCliente INT,
	IN p_idZona INT,
	IN p_idGiro INT
)
BEGIN

	DECLARE v_totalClientes BIGINT DEFAULT 0;
	DECLARE v_clientesByFilters INT DEFAULT 0;
	DECLARE v_clientesInactivos INT DEFAULT 0;

    SELECT
        
		COUNT(*)
	INTO
		v_totalClientes
		
    FROM clientes c
	LEFT JOIN zonas AS Z ON Z.idZona = c.idZona
	WHERE c.active = 1
		AND c.idTipoCliente IN( 2, 3, 4, 6 ) -- CLIENTE, EMPRENDEDOR, PREMIUM Y DETALLE
		AND ( p_idVendedor = 0 OR c.idVendedor = p_idVendedor )
		AND ( p_idTipoCliente = 0 OR c.idTipoCliente = p_idTipoCliente )
		AND ( p_idCliente = 0 OR c.idCliente = p_idCliente )
		AND ( p_idZona = 0 OR Z.idZona = p_idZona )
		AND ( p_idGiro = 0 OR c.idGiro = p_idGiro )
	;
	
	SELECT
        
		COUNT(*)
	INTO
		v_clientesByFilters
	
	FROM
	(
		SELECT
			v.idCliente
		FROM ventas AS v
		INNER JOIN clientes c ON c.idCliente = v.idCliente
		LEFT JOIN zonas AS Z ON Z.idZona = c.idZona
		WHERE v.active = 1
			AND c.active = 1
            AND c.idTipoCliente IN( 2, 3, 4, 6 ) -- CLIENTE, EMPRENDEDOR, PREMIUM Y DETALLE
			AND ( IFNULL( p_startDate ,'') = '' OR CAST( v.createDate AS DATE ) >= p_startDate)
			AND ( IFNULL( p_endDate ,'') = '' OR CAST( v.createDate AS DATE ) <= p_endDate)
			AND ( p_idVendedor = 0 OR c.idVendedor = p_idVendedor )
			AND ( p_idTipoCliente = 0 OR c.idTipoCliente = p_idTipoCliente )
			AND ( p_idCliente = 0 OR c.idCliente = p_idCliente )
			AND ( p_idZona = 0 OR Z.idZona = p_idZona )
			AND ( p_idGiro = 0 OR c.idGiro = p_idGiro )
		GROUP BY v.idCliente
	) AS T
	;
	
	SELECT
        
		COUNT(*)
	INTO
		v_clientesInactivos
	
	FROM
	(
		SELECT
        C.idCliente
		FROM clientes AS C
		LEFT JOIN zonas AS Z ON Z.idZona = C.idZona
		LEFT JOIN
		(
			SELECT v.idCliente
			FROM ventas AS v
			INNER JOIN clientes AS C ON C.idCliente = v.idCliente
			LEFT JOIN zonas AS Z ON Z.idZona = C.idZona
			WHERE v.active = 1
				AND C.active = 1
				AND C.idTipoCliente IN( 2, 3, 4, 6 )
				AND ( IFNULL( p_startDate ,'') = '' OR CAST( v.createDate AS DATE ) >= p_startDate)
				AND ( p_idVendedor = 0 OR C.idVendedor = p_idVendedor )
				AND ( p_idTipoCliente = 0 OR C.idTipoCliente = p_idTipoCliente )
				AND ( p_idCliente = 0 OR C.idCliente = p_idCliente )
				AND ( p_idZona = 0 OR Z.idZona = p_idZona )
				AND ( p_idGiro = 0 OR C.idGiro = p_idGiro )
				GROUP BY v.idCliente
		) AS tc ON tc.idCliente = C.idCliente
		
		WHERE C.active = 1
			AND tc.idCliente IS NULL
			
			AND C.idTipoCliente IN( 2, 3, 4, 6 ) -- CLIENTE, EMPRENDEDOR, PREMIUM Y DETALLE
			AND ( p_idVendedor = 0 OR C.idVendedor = p_idVendedor )
			AND ( p_idTipoCliente = 0 OR C.idTipoCliente = p_idTipoCliente )
			AND ( p_idCliente = 0 OR C.idCliente = p_idCliente )
			AND ( p_idZona = 0 OR Z.idZona = p_idZona )
			AND ( p_idGiro = 0 OR C.idGiro = p_idGiro )
			
		GROUP BY C.idCliente
	) AS T
	;
	
	SELECT v_totalClientes AS totalClientes, v_clientesByFilters AS clientesByFilters, v_clientesInactivos AS clientesInactivos;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `repVentasPag` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `repVentasPag`(
    IN p_startDate VARCHAR(50),
    IN p_endDate VARCHAR(50),
    IN p_idSucursal INT,
    IN p_idVendedor BIGINT,
    IN p_idCliente BIGINT,
    IN p_idTipoCliente INT,
    IN p_idProducto BIGINT,
    IN p_idTipoPromocion SMALLINT,
    IN p_idTipoVenta INT,
    IN p_startDateCliente VARCHAR(50),
    IN p_endDateCliente VARCHAR(50),
    IN p_idFamilia INT,
    IN p_idDepartamento INT,
    IN p_idZona INT,
    IN p_idGiro INT,
    IN p_startDateCliReactivados VARCHAR(50),
    IN p_endDateCliReactivados VARCHAR(50),
    
    IN p_start INT,
    IN p_limiter INT
)
BEGIN

    DECLARE iRows INT DEFAULT 0;

    -- Contar filas
    SELECT COUNT(*) INTO iRows
    FROM (
        SELECT v.idVenta
        FROM ventas AS v
        INNER JOIN ventasdetalle AS VD ON VD.idVenta = v.idVenta
        INNER JOIN productos AS P ON P.idProducto = VD.idProducto
        INNER JOIN cat_familias AS F ON F.idFamilia = P.idFamilia
        INNER JOIN clientes c ON c.idCliente = v.idCliente
        LEFT JOIN zonas AS Z ON Z.idZona = c.idZona
        LEFT JOIN giros AS G ON G.idGiro = c.idGiro
        WHERE ( IFNULL( p_startDate ,'') = '' OR CAST( v.createDate AS DATE ) >= p_startDate)
                AND ( IFNULL( p_endDate ,'') = '' OR CAST( v.createDate AS DATE ) <= p_endDate)
                AND (p_idSucursal = 0 OR v.idSucursal = p_idSucursal)
                AND (p_idVendedor = 0 OR v.idVendedor = p_idVendedor)
                AND (p_idCliente = 0 OR v.idCliente = p_idCliente)
                AND (p_idTipoCliente = 0 OR c.idTipoCliente = p_idTipoCliente)
                AND (p_idProducto = 0 OR VD.idProducto = p_idProducto)
                AND
                (
                    p_idTipoPromocion = 0
                    OR ( p_idTipoPromocion = 1 AND VD.idPromocion > 0 )
                    OR ( p_idTipoPromocion = 2 AND VD.idPromocion = 0 )
                )
                AND (p_idTipoVenta = 0 OR v.idTipoVenta = p_idTipoVenta)
                AND ( IFNULL( p_startDateCliente ,'') = '' OR CAST( c.createDate AS DATE ) >= p_startDateCliente)
                AND ( IFNULL( p_endDateCliente ,'') = '' OR CAST( c.createDate AS DATE ) <= p_endDateCliente)
                AND (p_idFamilia = 0 OR P.idFamilia = p_idFamilia)
                AND (p_idDepartamento = 0 OR F.idDepartamento = p_idDepartamento)
                AND ( IFNULL( p_startDateCliReactivados ,'') = '' OR CAST( c.fechaReactivacion AS DATE ) >= p_startDateCliReactivados)
                AND ( IFNULL( p_endDateCliReactivados ,'') = '' OR CAST( c.fechaReactivacion AS DATE ) <= p_endDateCliReactivados)
                AND ( p_idZona = 0 OR Z.idZona = p_idZona )
                AND ( p_idGiro = 0 OR G.idGiro = p_idGiro )
        GROUP BY v.idVenta
    ) AS sub;

    -- Consulta principal
    SELECT
        iRows AS iRows,
        v.idVenta,
        v.createDate,
        DATE_FORMAT( v.createDate, '%d/%m/%Y') AS createDateDate,
        DATE_FORMAT( v.createDate, '%h:%i:%s %p') AS createDateHours,
        c.nombre AS cliente,
        ROUND( SUM( VD.precioUnitario * VD.cantidad ) ,2) AS subtotal,
        ROUND( SUM( VD.descuento * VD.cantidad ) ,2) AS descuento,
        ROUND( SUM( VD.total ) ,2) AS total,

        IFNULL(
            (
                SELECT
                IF( COUNT(*) > 0 , 1, 0 )
                FROM cortescaja AS CC
                WHERE
                    CC.idcajas = v.idCaja
                    AND CC.horacierre <= v.createDate
                LIMIT 1
            )
            ,0) AS bHaveCorte

        , v.active

        , IFNULL(
            (
                SELECT
                CONCAT( UU.name, ': ', DATE_FORMAT( VC.cancelDate, '%d/%m/%Y %h:%i:%s %p') )
                FROM ventas_canceladas AS VC
                INNER JOIN users AS UU ON UU.idUser = VC.idCancelUser
                WHERE
                    VC.idVenta = v.idVenta
                LIMIT 1
            )
            ,0) AS cancelDesc

    FROM ventas AS v
        INNER JOIN ventasdetalle AS VD ON VD.idVenta = v.idVenta
        INNER JOIN productos AS P ON P.idProducto = VD.idProducto
        INNER JOIN cat_familias AS F ON F.idFamilia = P.idFamilia
        INNER JOIN clientes c ON c.idCliente = v.idCliente
        LEFT JOIN zonas AS Z ON Z.idZona = c.idZona
        LEFT JOIN giros AS G ON G.idGiro = c.idGiro
        WHERE ( IFNULL( p_startDate ,'') = '' OR CAST( v.createDate AS DATE ) >= p_startDate)
                AND ( IFNULL( p_endDate ,'') = '' OR CAST( v.createDate AS DATE ) <= p_endDate)
                AND (p_idSucursal = 0 OR v.idSucursal = p_idSucursal)
                AND (p_idVendedor = 0 OR v.idVendedor = p_idVendedor)
                AND (p_idCliente = 0 OR v.idCliente = p_idCliente)
                AND (p_idTipoCliente = 0 OR c.idTipoCliente = p_idTipoCliente)
                AND (p_idProducto = 0 OR VD.idProducto = p_idProducto)
                AND
                (
                    p_idTipoPromocion = 0
                    OR ( p_idTipoPromocion = 1 AND VD.idPromocion > 0 )
                    OR ( p_idTipoPromocion = 2 AND VD.idPromocion = 0 )
                )
                AND (p_idTipoVenta = 0 OR v.idTipoVenta = p_idTipoVenta)
                AND ( IFNULL( p_startDateCliente ,'') = '' OR CAST( c.createDate AS DATE ) >= p_startDateCliente)
                AND ( IFNULL( p_endDateCliente ,'') = '' OR CAST( c.createDate AS DATE ) <= p_endDateCliente)
                AND (p_idFamilia = 0 OR P.idFamilia = p_idFamilia)
                AND (p_idDepartamento = 0 OR F.idDepartamento = p_idDepartamento)
                AND ( IFNULL( p_startDateCliReactivados ,'') = '' OR CAST( c.fechaReactivacion AS DATE ) >= p_startDateCliReactivados)
                AND ( IFNULL( p_endDateCliReactivados ,'') = '' OR CAST( c.fechaReactivacion AS DATE ) <= p_endDateCliReactivados)
                AND ( p_idZona = 0 OR Z.idZona = p_idZona )
                AND ( p_idGiro = 0 OR G.idGiro = p_idGiro )
        GROUP BY
                v.idVenta,
                v.createDate,
                c.nombre,
                v.descuento,
                v.total
        ORDER BY v.idVenta DESC
        LIMIT p_start, p_limiter
        ;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `repVentasPorCliente` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `repVentasPorCliente`(
    IN p_startDate VARCHAR(50),
    IN p_endDate VARCHAR(50),
    IN p_idSucursal INT,
    IN p_idVendedor BIGINT,
    IN p_idCliente BIGINT,
    IN p_idTipoCliente INT,
    IN p_idProducto BIGINT,
    IN p_idTipoPromocion SMALLINT,
    IN p_idTipoVenta INT,
    IN p_startDateCliente VARCHAR(50),
    IN p_endDateCliente VARCHAR(50),
    IN p_idFamilia INT,
    IN p_idDepartamento INT,
    IN p_idZona INT,
    IN p_idGiro INT,
    IN p_startDateCliReactivados VARCHAR(50),
    IN p_endDateCliReactivados VARCHAR(50),

    IN p_start INT,
    IN p_limiter INT
)
BEGIN

    DECLARE iRows INT DEFAULT 0;

    -- Contar filas
    SELECT COUNT(*) INTO iRows
    FROM (
        SELECT
        v.idCliente

        FROM ventas AS v
        INNER JOIN ventasdetalle AS VD ON VD.idVenta = v.idVenta
        INNER JOIN productos AS P ON P.active = 1 AND P.idProducto = VD.idProducto
        INNER JOIN cat_familias AS F ON F.idFamilia = P.idFamilia
        INNER JOIN clientes c ON c.idCliente = v.idCliente
        LEFT JOIN zonas AS Z ON Z.idZona = c.idZona
        LEFT JOIN giros AS G ON G.idGiro = c.idGiro
        WHERE v.active = 1
            AND ( IFNULL( p_startDate ,'') = '' OR CAST( v.createDate AS DATE ) >= p_startDate)
            AND ( IFNULL( p_endDate ,'') = '' OR CAST( v.createDate AS DATE ) <= p_endDate)
            AND (p_idSucursal = 0 OR v.idSucursal = p_idSucursal)
            AND (p_idVendedor = 0 OR v.idVendedor = p_idVendedor)
            AND (p_idCliente = 0 OR v.idCliente = p_idCliente)
            AND (p_idTipoCliente = 0 OR c.idTipoCliente = p_idTipoCliente)
            AND (p_idProducto = 0 OR VD.idProducto = p_idProducto)
            AND
            (
                p_idTipoPromocion = 0
                OR ( p_idTipoPromocion = 1 AND VD.idPromocion > 0 )
                OR ( p_idTipoPromocion = 2 AND VD.idPromocion = 0 )
            )
            AND (p_idTipoVenta = 0 OR v.idTipoVenta = p_idTipoVenta)
            AND ( IFNULL( p_startDateCliente ,'') = '' OR CAST( c.createDate AS DATE ) >= p_startDateCliente)
            AND ( IFNULL( p_endDateCliente ,'') = '' OR CAST( c.createDate AS DATE ) <= p_endDateCliente)
            AND (p_idFamilia = 0 OR P.idFamilia = p_idFamilia)
            AND (p_idDepartamento = 0 OR F.idDepartamento = p_idDepartamento)
            AND ( IFNULL( p_startDateCliReactivados ,'') = '' OR CAST( c.fechaReactivacion AS DATE ) >= p_startDateCliReactivados)
            AND ( IFNULL( p_endDateCliReactivados ,'') = '' OR CAST( c.fechaReactivacion AS DATE ) <= p_endDateCliReactivados)
            AND ( p_idZona = 0 OR Z.idZona = p_idZona )
            AND ( p_idGiro = 0 OR G.idGiro = p_idGiro )
        GROUP BY
            v.idCliente
    ) AS sub;

    SELECT
        iRows AS iRows,
        v.idCliente,
        c.nombre AS clienteName,
        ROUND( SUM( VD.precioUnitario * VD.cantidad ) ,2) AS subtotal,
        ROUND( SUM( VD.descuento * VD.cantidad ) ,2) AS descuento,
        ROUND( SUM( VD.total ) ,2) AS total

    FROM ventas AS v
        INNER JOIN ventasdetalle AS VD ON VD.idVenta = v.idVenta
        INNER JOIN productos AS P ON P.active = 1 AND P.idProducto = VD.idProducto
        INNER JOIN cat_familias AS F ON F.idFamilia = P.idFamilia
        INNER JOIN clientes c ON c.idCliente = v.idCliente
        LEFT JOIN zonas AS Z ON Z.idZona = c.idZona
        LEFT JOIN giros AS G ON G.idGiro = c.idGiro
        WHERE v.active = 1
                AND ( IFNULL( p_startDate ,'') = '' OR CAST( v.createDate AS DATE ) >= p_startDate)
                AND ( IFNULL( p_endDate ,'') = '' OR CAST( v.createDate AS DATE ) <= p_endDate)
                AND (p_idSucursal = 0 OR v.idSucursal = p_idSucursal)
                AND (p_idVendedor = 0 OR v.idVendedor = p_idVendedor)
                AND (p_idCliente = 0 OR v.idCliente = p_idCliente)
                AND (p_idTipoCliente = 0 OR c.idTipoCliente = p_idTipoCliente)
                AND (p_idProducto = 0 OR VD.idProducto = p_idProducto)
                AND
                (
                    p_idTipoPromocion = 0
                    OR ( p_idTipoPromocion = 1 AND VD.idPromocion > 0 )
                    OR ( p_idTipoPromocion = 2 AND VD.idPromocion = 0 )
                )
                AND (p_idTipoVenta = 0 OR v.idTipoVenta = p_idTipoVenta)
                AND ( IFNULL( p_startDateCliente ,'') = '' OR CAST( c.createDate AS DATE ) >= p_startDateCliente)
                AND ( IFNULL( p_endDateCliente ,'') = '' OR CAST( c.createDate AS DATE ) <= p_endDateCliente)
                AND (p_idFamilia = 0 OR P.idFamilia = p_idFamilia)
                AND (p_idDepartamento = 0 OR F.idDepartamento = p_idDepartamento)
                AND ( IFNULL( p_startDateCliReactivados ,'') = '' OR CAST( c.fechaReactivacion AS DATE ) >= p_startDateCliReactivados)
                AND ( IFNULL( p_endDateCliReactivados ,'') = '' OR CAST( c.fechaReactivacion AS DATE ) <= p_endDateCliReactivados)
                AND ( p_idZona = 0 OR Z.idZona = p_idZona )
                AND ( p_idGiro = 0 OR G.idGiro = p_idGiro )
        GROUP BY
                v.idCliente,
                c.nombre
        ORDER BY subtotal DESC
        LIMIT p_start, p_limiter
        ;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `repVentasPorDepartamento` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `repVentasPorDepartamento`(
    IN p_startDate VARCHAR(50),
    IN p_endDate VARCHAR(50),
    IN p_idSucursal INT,
    IN p_idVendedor BIGINT,
    IN p_idCliente BIGINT,
    IN p_idTipoCliente INT,
    IN p_idProducto BIGINT,
    IN p_idTipoPromocion SMALLINT,
    IN p_idTipoVenta INT,
    IN p_startDateCliente VARCHAR(50),
    IN p_endDateCliente VARCHAR(50),
    IN p_idFamilia INT,
    IN p_idDepartamento INT,
    IN p_idZona INT,
    IN p_idGiro INT,
    IN p_startDateCliReactivados VARCHAR(50),
    IN p_endDateCliReactivados VARCHAR(50)
)
BEGIN

    SELECT
        D.idDepartamento,
        D.name AS departamentoName,
        ROUND( SUM( VD.precioUnitario * VD.cantidad ) ,2) AS subtotal,
        ROUND( SUM( VD.descuento * VD.cantidad ) ,2) AS descuento,
        ROUND( SUM( VD.total ) ,2) AS total

    FROM ventas AS v
        INNER JOIN ventasdetalle AS VD ON VD.idVenta = v.idVenta
        INNER JOIN productos AS P ON P.active = 1 AND P.idProducto = VD.idProducto
        INNER JOIN cat_familias AS F ON F.idFamilia = P.idFamilia
        INNER JOIN cat_departamentos AS D ON D.idDepartamento = F.idDepartamento
        INNER JOIN clientes c ON c.idCliente = v.idCliente
        LEFT JOIN zonas AS Z ON Z.idZona = c.idZona
        LEFT JOIN giros AS G ON G.idGiro = c.idGiro
        WHERE v.active = 1
                AND ( IFNULL( p_startDate ,'') = '' OR CAST( v.createDate AS DATE ) >= p_startDate)
                AND ( IFNULL( p_endDate ,'') = '' OR CAST( v.createDate AS DATE ) <= p_endDate)
                AND (p_idSucursal = 0 OR v.idSucursal = p_idSucursal)
                AND (p_idVendedor = 0 OR v.idVendedor = p_idVendedor)
                AND (p_idCliente = 0 OR v.idCliente = p_idCliente)
                AND (p_idTipoCliente = 0 OR c.idTipoCliente = p_idTipoCliente)
                AND (p_idProducto = 0 OR VD.idProducto = p_idProducto)
                AND
                (
                    p_idTipoPromocion = 0
                    OR ( p_idTipoPromocion = 1 AND VD.idPromocion > 0 )
                    OR ( p_idTipoPromocion = 2 AND VD.idPromocion = 0 )
                )
                AND (p_idTipoVenta = 0 OR v.idTipoVenta = p_idTipoVenta)
                AND ( IFNULL( p_startDateCliente ,'') = '' OR CAST( c.createDate AS DATE ) >= p_startDateCliente)
                AND ( IFNULL( p_endDateCliente ,'') = '' OR CAST( c.createDate AS DATE ) <= p_endDateCliente)
                AND (p_idFamilia = 0 OR P.idFamilia = p_idFamilia)
                AND (p_idDepartamento = 0 OR F.idDepartamento = p_idDepartamento)
                AND ( IFNULL( p_startDateCliReactivados ,'') = '' OR CAST( c.fechaReactivacion AS DATE ) >= p_startDateCliReactivados)
                AND ( IFNULL( p_endDateCliReactivados ,'') = '' OR CAST( c.fechaReactivacion AS DATE ) <= p_endDateCliReactivados)
                AND ( p_idZona = 0 OR Z.idZona = p_idZona )
                AND ( p_idGiro = 0 OR G.idGiro = p_idGiro )
        GROUP BY
                D.idDepartamento,
                D.name
        ORDER BY D.idDepartamento DESC
        ;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `repVentasPorFamilia` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `repVentasPorFamilia`(
    IN p_startDate VARCHAR(50),
    IN p_endDate VARCHAR(50),
    IN p_idSucursal INT,
    IN p_idVendedor BIGINT,
    IN p_idCliente BIGINT,
    IN p_idTipoCliente INT,
    IN p_idProducto BIGINT,
    IN p_idTipoPromocion SMALLINT,
    IN p_idTipoVenta INT,
    IN p_startDateCliente VARCHAR(50),
    IN p_endDateCliente VARCHAR(50),
    IN p_idFamilia INT,
    IN p_idDepartamento INT,
    IN p_idZona INT,
    IN p_idGiro INT,
    IN p_startDateCliReactivados VARCHAR(50),
    IN p_endDateCliReactivados VARCHAR(50)
)
BEGIN

    SELECT
        P.idFamilia,
        F.name AS familiaName,
        ROUND( SUM( VD.precioUnitario * VD.cantidad ) ,2) AS subtotal,
        ROUND( SUM( VD.descuento * VD.cantidad ) ,2) AS descuento,
        ROUND( SUM( VD.total ) ,2) AS total

    FROM ventas AS v
        INNER JOIN ventasdetalle AS VD ON VD.idVenta = v.idVenta
        INNER JOIN productos AS P ON P.active = 1 AND P.idProducto = VD.idProducto
        INNER JOIN cat_familias AS F ON F.idFamilia = P.idFamilia
        INNER JOIN clientes c ON c.idCliente = v.idCliente
        LEFT JOIN zonas AS Z ON Z.idZona = c.idZona
        LEFT JOIN giros AS G ON G.idGiro = c.idGiro
        WHERE v.active = 1
                AND ( IFNULL( p_startDate ,'') = '' OR CAST( v.createDate AS DATE ) >= p_startDate)
                AND ( IFNULL( p_endDate ,'') = '' OR CAST( v.createDate AS DATE ) <= p_endDate)
                AND (p_idSucursal = 0 OR v.idSucursal = p_idSucursal)
                AND (p_idVendedor = 0 OR v.idVendedor = p_idVendedor)
                AND (p_idCliente = 0 OR v.idCliente = p_idCliente)
                AND (p_idTipoCliente = 0 OR c.idTipoCliente = p_idTipoCliente)
                AND (p_idProducto = 0 OR VD.idProducto = p_idProducto)
                AND
                (
                    p_idTipoPromocion = 0
                    OR ( p_idTipoPromocion = 1 AND VD.idPromocion > 0 )
                    OR ( p_idTipoPromocion = 2 AND VD.idPromocion = 0 )
                )
                AND (p_idTipoVenta = 0 OR v.idTipoVenta = p_idTipoVenta)
                AND ( IFNULL( p_startDateCliente ,'') = '' OR CAST( c.createDate AS DATE ) >= p_startDateCliente)
                AND ( IFNULL( p_endDateCliente ,'') = '' OR CAST( c.createDate AS DATE ) <= p_endDateCliente)
                AND (p_idFamilia = 0 OR P.idFamilia = p_idFamilia)
                AND (p_idDepartamento = 0 OR F.idDepartamento = p_idDepartamento)
                AND ( IFNULL( p_startDateCliReactivados ,'') = '' OR CAST( c.fechaReactivacion AS DATE ) >= p_startDateCliReactivados)
                AND ( IFNULL( p_endDateCliReactivados ,'') = '' OR CAST( c.fechaReactivacion AS DATE ) <= p_endDateCliReactivados)
                AND ( p_idZona = 0 OR Z.idZona = p_idZona )
                AND ( p_idGiro = 0 OR G.idGiro = p_idGiro )
        GROUP BY
                P.idFamilia,
                F.name
        ORDER BY subtotal DESC
        ;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `repVentasPorGiros` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `repVentasPorGiros`(
    IN p_startDate VARCHAR(50),
    IN p_endDate VARCHAR(50),
    IN p_idSucursal INT,
    IN p_idVendedor BIGINT,
    IN p_idCliente BIGINT,
	IN p_idTipoCliente INT,
	IN p_idProducto BIGINT,
	IN p_idTipoPromocion SMALLINT,
	IN p_idTipoVenta INT,
	IN p_startDateCliente VARCHAR(50),
    IN p_endDateCliente VARCHAR(50),
	IN p_idFamilia INT,
	IN p_idDepartamento INT,
	IN p_idZona INT,
	IN p_idGiro INT,
    IN p_startDateCliReactivados VARCHAR(50),
    IN p_endDateCliReactivados VARCHAR(50)
)
BEGIN

    SELECT
        G.idGiro,
		G.name AS giroName,
        ROUND( SUM( VD.precioUnitario * VD.cantidad ) ,2) AS subtotal,
		ROUND( SUM( VD.descuento * VD.cantidad ) ,2) AS descuento,
		ROUND( SUM( VD.total ) ,2) AS total
		
    FROM ventas AS v
	INNER JOIN ventasdetalle AS VD ON VD.idVenta = v.idVenta
	INNER JOIN productos AS P ON P.active = 1 AND P.idProducto = VD.idProducto
	INNER JOIN cat_familias AS F ON F.idFamilia = P.idFamilia
	INNER JOIN clientes AS c ON c.idCliente = v.idCliente
	INNER JOIN zonas AS Z ON Z.idZona = c.idZona
	INNER JOIN giros AS G ON G.idGiro = c.idGiro
	WHERE v.active = 1
		AND ( IFNULL( p_startDate ,'') = '' OR CAST( v.createDate AS DATE ) >= p_startDate)
		AND ( IFNULL( p_endDate ,'') = '' OR CAST( v.createDate AS DATE ) <= p_endDate)
		AND (p_idSucursal = 0 OR v.idSucursal = p_idSucursal)
		AND (p_idVendedor = 0 OR v.idVendedor = p_idVendedor)
		AND (p_idCliente = 0 OR v.idCliente = p_idCliente)
		AND (p_idTipoCliente = 0 OR c.idTipoCliente = p_idTipoCliente)
		AND (p_idProducto = 0 OR VD.idProducto = p_idProducto)
		AND
		(
			p_idTipoPromocion = 0
			OR ( p_idTipoPromocion = 1 AND VD.idPromocion > 0 )
			OR ( p_idTipoPromocion = 2 AND VD.idPromocion = 0 )
		)
		AND (p_idTipoVenta = 0 OR v.idTipoVenta = p_idTipoVenta)
		AND ( IFNULL( p_startDateCliente ,'') = '' OR CAST( c.createDate AS DATE ) >= p_startDateCliente)
		AND ( IFNULL( p_endDateCliente ,'') = '' OR CAST( c.createDate AS DATE ) <= p_endDateCliente)
		AND ( p_idFamilia = 0 OR P.idFamilia = p_idFamilia )
		AND ( p_idDepartamento = 0 OR F.idDepartamento = p_idDepartamento )
        AND ( IFNULL( p_startDateCliReactivados ,'') = '' OR CAST( c.fechaReactivacion AS DATE ) >= p_startDateCliReactivados)
		AND ( IFNULL( p_endDateCliReactivados ,'') = '' OR CAST( c.fechaReactivacion AS DATE ) <= p_endDateCliReactivados)
		AND ( p_idZona = 0 OR Z.idZona = p_idZona )
		AND ( p_idGiro = 0 OR G.idGiro = p_idGiro )
	GROUP BY
		G.idGiro,
		G.name
	ORDER BY subtotal DESC
	;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `repVentasPorProducto` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `repVentasPorProducto`(
    IN p_startDate VARCHAR(50),
    IN p_endDate VARCHAR(50),
    IN p_idSucursal INT,
    IN p_idVendedor BIGINT,
    IN p_idCliente BIGINT,
    IN p_idTipoCliente INT,
    IN p_idProducto BIGINT,
    IN p_idTipoPromocion SMALLINT,
    IN p_idTipoVenta INT,
    IN p_startDateCliente VARCHAR(50),
    IN p_endDateCliente VARCHAR(50),
    IN p_idFamilia INT,
    IN p_idDepartamento INT,
    IN p_idZona INT,
    IN p_idGiro INT,
    IN p_startDateCliReactivados VARCHAR(50),
    IN p_endDateCliReactivados VARCHAR(50),

    IN p_start INT,
    IN p_limiter INT
)
BEGIN

    DECLARE iRows INT DEFAULT 0;

    -- Contar filas
    SELECT COUNT(*) INTO iRows
    FROM (
        SELECT
            P.idProducto

        FROM ventas AS v
        INNER JOIN ventasdetalle AS VD ON VD.idVenta = v.idVenta
        INNER JOIN productos AS P ON P.active = 1 AND P.idProducto = VD.idProducto
        INNER JOIN cat_familias AS F ON F.idFamilia = P.idFamilia
        INNER JOIN clientes c ON c.idCliente = v.idCliente
        LEFT JOIN zonas AS Z ON Z.idZona = c.idZona
        LEFT JOIN giros AS G ON G.idGiro = c.idGiro
        WHERE v.active = 1
            AND ( IFNULL( p_startDate ,'') = '' OR CAST( v.createDate AS DATE ) >= p_startDate)
            AND ( IFNULL( p_endDate ,'') = '' OR CAST( v.createDate AS DATE ) <= p_endDate)
            AND (p_idSucursal = 0 OR v.idSucursal = p_idSucursal)
            AND (p_idVendedor = 0 OR v.idVendedor = p_idVendedor)
            AND (p_idCliente = 0 OR v.idCliente = p_idCliente)
            AND (p_idTipoCliente = 0 OR c.idTipoCliente = p_idTipoCliente)
            AND (p_idProducto = 0 OR VD.idProducto = p_idProducto)
            AND
            (
                p_idTipoPromocion = 0
                OR ( p_idTipoPromocion = 1 AND VD.idPromocion > 0 )
                OR ( p_idTipoPromocion = 2 AND VD.idPromocion = 0 )
            )
            AND (p_idTipoVenta = 0 OR v.idTipoVenta = p_idTipoVenta)
            AND ( IFNULL( p_startDateCliente ,'') = '' OR CAST( c.createDate AS DATE ) >= p_startDateCliente)
            AND ( IFNULL( p_endDateCliente ,'') = '' OR CAST( c.createDate AS DATE ) <= p_endDateCliente)
            AND (p_idFamilia = 0 OR P.idFamilia = p_idFamilia)
            AND (p_idDepartamento = 0 OR F.idDepartamento = p_idDepartamento)
            AND ( IFNULL( p_startDateCliReactivados ,'') = '' OR CAST( c.fechaReactivacion AS DATE ) >= p_startDateCliReactivados)
            AND ( IFNULL( p_endDateCliReactivados ,'') = '' OR CAST( c.fechaReactivacion AS DATE ) <= p_endDateCliReactivados)
            AND ( p_idZona = 0 OR Z.idZona = p_idZona )
            AND ( p_idGiro = 0 OR G.idGiro = p_idGiro )
        GROUP BY
            P.idProducto
    ) AS sub;

    SELECT
        iRows AS iRows,
        P.idProducto,
        SUM( VD.cantidad ) AS sumPza,
        CONCAT(
            CAST( P.idproductocategoria AS CHAR(12) )
            , '-', IFNULL( CD.description ,'')
            , ' ', REPLACE( CAST( P.valorMedida AS CHAR(12) ) , '.00', '')
            , ' ', IFNULL( UM.abreviatura ,'')
        ) AS articuloName,
        ROUND( SUM( VD.precioUnitario * VD.cantidad ) ,2) AS subtotal,
        ROUND( SUM( VD.descuento * VD.cantidad ) ,2) AS descuento,
        ROUND( SUM( VD.total ) ,2) AS total

    FROM ventas AS v
        INNER JOIN ventasdetalle AS VD ON VD.idVenta = v.idVenta
        INNER JOIN productos AS P ON P.active = 1 AND P.idProducto = VD.idProducto
        INNER JOIN cat_tipo_producto AS CTP ON CTP.active = 1 AND CTP.idCatTipoProducto = P.idCatTipoProducto
        INNER JOIN cat_descripciones AS CD ON CD.active = 1 AND CD.idDescription = P.idDescription
        INNER JOIN cat_unidad_medida AS UM ON UM.active = 1 AND UM.idUnidadMedida = P.idUnidadMedida
        INNER JOIN cat_familias AS F ON F.idFamilia = P.idFamilia
        INNER JOIN clientes c ON c.idCliente = v.idCliente
        LEFT JOIN zonas AS Z ON Z.idZona = c.idZona
        LEFT JOIN giros AS G ON G.idGiro = c.idGiro
        WHERE v.active = 1
                AND ( IFNULL( p_startDate ,'') = '' OR CAST( v.createDate AS DATE ) >= p_startDate)
                AND ( IFNULL( p_endDate ,'') = '' OR CAST( v.createDate AS DATE ) <= p_endDate)
                AND (p_idSucursal = 0 OR v.idSucursal = p_idSucursal)
                AND (p_idVendedor = 0 OR v.idVendedor = p_idVendedor)
                AND (p_idCliente = 0 OR v.idCliente = p_idCliente)
                AND (p_idTipoCliente = 0 OR c.idTipoCliente = p_idTipoCliente)
                AND (p_idProducto = 0 OR VD.idProducto = p_idProducto)
                AND
                (
                    p_idTipoPromocion = 0
                    OR ( p_idTipoPromocion = 1 AND VD.idPromocion > 0 )
                    OR ( p_idTipoPromocion = 2 AND VD.idPromocion = 0 )
                )
                AND (p_idTipoVenta = 0 OR v.idTipoVenta = p_idTipoVenta)
                AND ( IFNULL( p_startDateCliente ,'') = '' OR CAST( c.createDate AS DATE ) >= p_startDateCliente)
                AND ( IFNULL( p_endDateCliente ,'') = '' OR CAST( c.createDate AS DATE ) <= p_endDateCliente)
                AND (p_idFamilia = 0 OR P.idFamilia = p_idFamilia)
                AND (p_idDepartamento = 0 OR F.idDepartamento = p_idDepartamento)
                AND ( IFNULL( p_startDateCliReactivados ,'') = '' OR CAST( c.fechaReactivacion AS DATE ) >= p_startDateCliReactivados)
                AND ( IFNULL( p_endDateCliReactivados ,'') = '' OR CAST( c.fechaReactivacion AS DATE ) <= p_endDateCliReactivados)
                AND ( p_idZona = 0 OR Z.idZona = p_idZona )
                AND ( p_idGiro = 0 OR G.idGiro = p_idGiro )
        GROUP BY
                P.idProducto
                , P.idproductocategoria
                , CD.description
                , P.valorMedida
                , UM.abreviatura
        ORDER BY subtotal DESC
        LIMIT p_start, p_limiter
        ;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `repVentasPorSucursal` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `repVentasPorSucursal`(
    IN p_startDate VARCHAR(50),
    IN p_endDate VARCHAR(50),
    IN p_idSucursal INT,
    IN p_idVendedor BIGINT,
    IN p_idCliente BIGINT,
    IN p_idTipoCliente INT,
    IN p_idProducto BIGINT,
    IN p_idTipoPromocion SMALLINT,
    IN p_idTipoVenta INT,
    IN p_startDateCliente VARCHAR(50),
    IN p_endDateCliente VARCHAR(50),
    IN p_idFamilia INT,
    IN p_idDepartamento INT,
    IN p_idZona INT,
    IN p_idGiro INT,
    IN p_startDateCliReactivados VARCHAR(50),
    IN p_endDateCliReactivados VARCHAR(50)
)
BEGIN

    SELECT
        v.idSucursal,
        S.name AS sucursalName,
        ROUND( SUM( VD.precioUnitario * VD.cantidad ) ,2) AS subtotal,
        ROUND( SUM( VD.descuento * VD.cantidad ) ,2) AS descuento,
        ROUND( SUM( VD.total ) ,2) AS total

    FROM ventas AS v
        INNER JOIN ventasdetalle AS VD ON VD.idVenta = v.idVenta
        INNER JOIN productos AS P ON P.active = 1 AND P.idProducto = VD.idProducto
        INNER JOIN cat_familias AS F ON F.idFamilia = P.idFamilia
        INNER JOIN sucursales AS S ON S.idSucursal = v.idSucursal
        INNER JOIN clientes c ON c.idCliente = v.idCliente
        LEFT JOIN zonas AS Z ON Z.idZona = c.idZona
        LEFT JOIN giros AS G ON G.idGiro = c.idGiro
        WHERE v.active = 1
                AND ( IFNULL( p_startDate ,'') = '' OR CAST( v.createDate AS DATE ) >= p_startDate)
                AND ( IFNULL( p_endDate ,'') = '' OR CAST( v.createDate AS DATE ) <= p_endDate)
                AND (p_idSucursal = 0 OR v.idSucursal = p_idSucursal)
                AND (p_idVendedor = 0 OR v.idVendedor = p_idVendedor)
                AND (p_idCliente = 0 OR v.idCliente = p_idCliente)
                AND (p_idTipoCliente = 0 OR c.idTipoCliente = p_idTipoCliente)
                AND (p_idProducto = 0 OR VD.idProducto = p_idProducto)
                AND
                (
                    p_idTipoPromocion = 0
                    OR ( p_idTipoPromocion = 1 AND VD.idPromocion > 0 )
                    OR ( p_idTipoPromocion = 2 AND VD.idPromocion = 0 )
                )
                AND (p_idTipoVenta = 0 OR v.idTipoVenta = p_idTipoVenta)
                AND ( IFNULL( p_startDateCliente ,'') = '' OR CAST( c.createDate AS DATE ) >= p_startDateCliente)
                AND ( IFNULL( p_endDateCliente ,'') = '' OR CAST( c.createDate AS DATE ) <= p_endDateCliente)
                AND (p_idFamilia = 0 OR P.idFamilia = p_idFamilia)
                AND (p_idDepartamento = 0 OR F.idDepartamento = p_idDepartamento)
                AND ( IFNULL( p_startDateCliReactivados ,'') = '' OR CAST( c.fechaReactivacion AS DATE ) >= p_startDateCliReactivados)
                AND ( IFNULL( p_endDateCliReactivados ,'') = '' OR CAST( c.fechaReactivacion AS DATE ) <= p_endDateCliReactivados)
                AND ( p_idZona = 0 OR Z.idZona = p_idZona )
                AND ( p_idGiro = 0 OR G.idGiro = p_idGiro )
        GROUP BY
                v.idSucursal,
                S.name
        ORDER BY v.idSucursal DESC
        ;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `repVentasPorTipoClientes` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `repVentasPorTipoClientes`(
    IN p_startDate VARCHAR(50),
    IN p_endDate VARCHAR(50),
    IN p_idSucursal INT,
    IN p_idVendedor BIGINT,
    IN p_idCliente BIGINT,
    IN p_idTipoCliente INT,
    IN p_idProducto BIGINT,
    IN p_idTipoPromocion SMALLINT,
    IN p_idTipoVenta INT,
    IN p_startDateCliente VARCHAR(50),
    IN p_endDateCliente VARCHAR(50),
    IN p_idFamilia INT,
    IN p_idDepartamento INT,
    IN p_idZona INT,
    IN p_idGiro INT,
    IN p_startDateCliReactivados VARCHAR(50),
    IN p_endDateCliReactivados VARCHAR(50)
)
BEGIN

    SELECT
        c.idTipoCliente,
        CTC.name AS tipoClienteName,
        ROUND( SUM( VD.precioUnitario * VD.cantidad ) ,2) AS subtotal,
        ROUND( SUM( VD.descuento * VD.cantidad ) ,2) AS descuento,
        ROUND( SUM( VD.total ) ,2) AS total

    FROM ventas AS v
        INNER JOIN ventasdetalle AS VD ON VD.idVenta = v.idVenta
        INNER JOIN productos AS P ON P.active = 1 AND P.idProducto = VD.idProducto
        INNER JOIN cat_familias AS F ON F.idFamilia = P.idFamilia
        INNER JOIN clientes c ON c.idCliente = v.idCliente
        INNER JOIN cat_tipo_cliente AS CTC ON CTC.idTipoCliente = c.idTipoCliente
        LEFT JOIN zonas AS Z ON Z.idZona = c.idZona
        LEFT JOIN giros AS G ON G.idGiro = c.idGiro
        WHERE v.active = 1
                AND ( IFNULL( p_startDate ,'') = '' OR CAST( v.createDate AS DATE ) >= p_startDate)
                AND ( IFNULL( p_endDate ,'') = '' OR CAST( v.createDate AS DATE ) <= p_endDate)
                AND (p_idSucursal = 0 OR v.idSucursal = p_idSucursal)
                AND (p_idVendedor = 0 OR v.idVendedor = p_idVendedor)
                AND (p_idCliente = 0 OR v.idCliente = p_idCliente)
                AND (p_idTipoCliente = 0 OR c.idTipoCliente = p_idTipoCliente)
                AND (p_idProducto = 0 OR VD.idProducto = p_idProducto)
                AND
                (
                    p_idTipoPromocion = 0
                    OR ( p_idTipoPromocion = 1 AND VD.idPromocion > 0 )
                    OR ( p_idTipoPromocion = 2 AND VD.idPromocion = 0 )
                )
                AND (p_idTipoVenta = 0 OR v.idTipoVenta = p_idTipoVenta)
                AND ( IFNULL( p_startDateCliente ,'') = '' OR CAST( c.createDate AS DATE ) >= p_startDateCliente)
                AND ( IFNULL( p_endDateCliente ,'') = '' OR CAST( c.createDate AS DATE ) <= p_endDateCliente)
                AND (p_idFamilia = 0 OR P.idFamilia = p_idFamilia)
                AND (p_idDepartamento = 0 OR F.idDepartamento = p_idDepartamento)
                AND ( IFNULL( p_startDateCliReactivados ,'') = '' OR CAST( c.fechaReactivacion AS DATE ) >= p_startDateCliReactivados)
                AND ( IFNULL( p_endDateCliReactivados ,'') = '' OR CAST( c.fechaReactivacion AS DATE ) <= p_endDateCliReactivados)
                AND ( p_idZona = 0 OR Z.idZona = p_idZona )
                AND ( p_idGiro = 0 OR G.idGiro = p_idGiro )
        GROUP BY
                c.idTipoCliente,
                CTC.name
        ORDER BY c.idTipoCliente DESC
        ;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `repVentasPorVendedor` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `repVentasPorVendedor`(
    IN p_startDate VARCHAR(50),
    IN p_endDate VARCHAR(50),
    IN p_idSucursal INT,
    IN p_idVendedor BIGINT,
    IN p_idCliente BIGINT,
    IN p_idTipoCliente INT,
    IN p_idProducto BIGINT,
    IN p_idTipoPromocion SMALLINT,
    IN p_idTipoVenta INT,
    IN p_startDateCliente VARCHAR(50),
    IN p_endDateCliente VARCHAR(50),
    IN p_idFamilia INT,
    IN p_idDepartamento INT,
    IN p_idZona INT,
    IN p_idGiro INT,
    IN p_startDateCliReactivados VARCHAR(50),
    IN p_endDateCliReactivados VARCHAR(50),

    IN p_start INT,
    IN p_limiter INT
)
BEGIN

    DECLARE iRows INT DEFAULT 0;

    -- Contar filas
    SELECT COUNT(*) INTO iRows
    FROM (
        SELECT
        v.idVendedor

        FROM ventas AS v
        INNER JOIN ventasdetalle AS VD ON VD.idVenta = v.idVenta
        INNER JOIN productos AS P ON P.active = 1 AND P.idProducto = VD.idProducto
        INNER JOIN cat_familias AS F ON F.idFamilia = P.idFamilia
        INNER JOIN clientes c ON c.idCliente = v.idCliente
        LEFT JOIN zonas AS Z ON Z.idZona = c.idZona
        LEFT JOIN giros AS G ON G.idGiro = c.idGiro
        WHERE v.active = 1
            AND ( IFNULL( p_startDate ,'') = '' OR CAST( v.createDate AS DATE ) >= p_startDate)
            AND ( IFNULL( p_endDate ,'') = '' OR CAST( v.createDate AS DATE ) <= p_endDate)
            AND (p_idSucursal = 0 OR v.idSucursal = p_idSucursal)
            AND (p_idVendedor = 0 OR v.idVendedor = p_idVendedor)
            AND (p_idCliente = 0 OR v.idCliente = p_idCliente)
            AND (p_idTipoCliente = 0 OR c.idTipoCliente = p_idTipoCliente)
            AND (p_idProducto = 0 OR VD.idProducto = p_idProducto)
            AND
            (
                p_idTipoPromocion = 0
                OR ( p_idTipoPromocion = 1 AND VD.idPromocion > 0 )
                OR ( p_idTipoPromocion = 2 AND VD.idPromocion = 0 )
            )
            AND (p_idTipoVenta = 0 OR v.idTipoVenta = p_idTipoVenta)
            AND ( IFNULL( p_startDateCliente ,'') = '' OR CAST( c.createDate AS DATE ) >= p_startDateCliente)
            AND ( IFNULL( p_endDateCliente ,'') = '' OR CAST( c.createDate AS DATE ) <= p_endDateCliente)
            AND (p_idFamilia = 0 OR P.idFamilia = p_idFamilia)
            AND (p_idDepartamento = 0 OR F.idDepartamento = p_idDepartamento)
            AND ( IFNULL( p_startDateCliReactivados ,'') = '' OR CAST( c.fechaReactivacion AS DATE ) >= p_startDateCliReactivados)
            AND ( IFNULL( p_endDateCliReactivados ,'') = '' OR CAST( c.fechaReactivacion AS DATE ) <= p_endDateCliReactivados)
            AND ( p_idZona = 0 OR Z.idZona = p_idZona )
            AND ( p_idGiro = 0 OR G.idGiro = p_idGiro )
        GROUP BY
            v.idVendedor
    ) AS sub;

    SELECT
        iRows AS iRows,
        v.idVendedor,
        VV.nombre AS vendedorName,
        ROUND( SUM( VD.precioUnitario * VD.cantidad ) ,2) AS subtotal,
        ROUND( SUM( VD.descuento * VD.cantidad ) ,2) AS descuento,
        ROUND( SUM( VD.total ) ,2) AS total

    FROM ventas AS v
        INNER JOIN ventasdetalle AS VD ON VD.idVenta = v.idVenta
        INNER JOIN productos AS P ON P.active = 1 AND P.idProducto = VD.idProducto
        INNER JOIN cat_familias AS F ON F.idFamilia = P.idFamilia
        INNER JOIN clientes c ON c.idCliente = v.idCliente
        INNER JOIN vendedores AS VV ON VV.idVendedor = v.idVendedor
        LEFT JOIN zonas AS Z ON Z.idZona = c.idZona
        LEFT JOIN giros AS G ON G.idGiro = c.idGiro
        WHERE v.active = 1
                AND ( IFNULL( p_startDate ,'') = '' OR CAST( v.createDate AS DATE ) >= p_startDate)
                AND ( IFNULL( p_endDate ,'') = '' OR CAST( v.createDate AS DATE ) <= p_endDate)
                AND (p_idSucursal = 0 OR v.idSucursal = p_idSucursal)
                AND (p_idVendedor = 0 OR v.idVendedor = p_idVendedor)
                AND (p_idCliente = 0 OR v.idCliente = p_idCliente)
                AND (p_idTipoCliente = 0 OR c.idTipoCliente = p_idTipoCliente)
                AND (p_idProducto = 0 OR VD.idProducto = p_idProducto)
                AND
                (
                    p_idTipoPromocion = 0
                    OR ( p_idTipoPromocion = 1 AND VD.idPromocion > 0 )
                    OR ( p_idTipoPromocion = 2 AND VD.idPromocion = 0 )
                )
                AND (p_idTipoVenta = 0 OR v.idTipoVenta = p_idTipoVenta)
                AND ( IFNULL( p_startDateCliente ,'') = '' OR CAST( c.createDate AS DATE ) >= p_startDateCliente)
                AND ( IFNULL( p_endDateCliente ,'') = '' OR CAST( c.createDate AS DATE ) <= p_endDateCliente)
                AND (p_idFamilia = 0 OR P.idFamilia = p_idFamilia)
                AND (p_idDepartamento = 0 OR F.idDepartamento = p_idDepartamento)
                AND ( IFNULL( p_startDateCliReactivados ,'') = '' OR CAST( c.fechaReactivacion AS DATE ) >= p_startDateCliReactivados)
                AND ( IFNULL( p_endDateCliReactivados ,'') = '' OR CAST( c.fechaReactivacion AS DATE ) <= p_endDateCliReactivados)
                AND ( p_idZona = 0 OR Z.idZona = p_idZona )
                AND ( p_idGiro = 0 OR G.idGiro = p_idGiro )
        GROUP BY
                v.idVendedor,
                VV.nombre
        ORDER BY VV.nombre DESC
        LIMIT p_start, p_limiter
        ;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `repVentasPorZonas` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `repVentasPorZonas`(
    IN p_startDate VARCHAR(50),
    IN p_endDate VARCHAR(50),
    IN p_idSucursal INT,
    IN p_idVendedor BIGINT,
    IN p_idCliente BIGINT,
    IN p_idTipoCliente INT,
    IN p_idProducto BIGINT,
    IN p_idTipoPromocion SMALLINT,
    IN p_idTipoVenta INT,
    IN p_startDateCliente VARCHAR(50),
    IN p_endDateCliente VARCHAR(50),
    IN p_idFamilia INT,
    IN p_idDepartamento INT,
    IN p_idZona INT,
    IN p_idGiro INT,
    IN p_startDateCliReactivados VARCHAR(50),
    IN p_endDateCliReactivados VARCHAR(50)
)
BEGIN

    SELECT
        Z.idZona,
        Z.name AS zonaName,
        ROUND( SUM( VD.precioUnitario * VD.cantidad ) ,2) AS subtotal,
        ROUND( SUM( VD.descuento * VD.cantidad ) ,2) AS descuento,
        ROUND( SUM( VD.total ) ,2) AS total

    FROM ventas AS v
        INNER JOIN ventasdetalle AS VD ON VD.idVenta = v.idVenta
        INNER JOIN productos AS P ON P.active = 1 AND P.idProducto = VD.idProducto
        INNER JOIN cat_familias AS F ON F.idFamilia = P.idFamilia
        INNER JOIN clientes AS c ON c.idCliente = v.idCliente
        INNER JOIN zonas AS Z ON Z.idZona = c.idZona
        LEFT JOIN giros AS G ON G.idGiro = c.idGiro
        WHERE v.active = 1
                AND ( IFNULL( p_startDate ,'') = '' OR CAST( v.createDate AS DATE ) >= p_startDate)
                AND ( IFNULL( p_endDate ,'') = '' OR CAST( v.createDate AS DATE ) <= p_endDate)
                AND (p_idSucursal = 0 OR v.idSucursal = p_idSucursal)
                AND (p_idVendedor = 0 OR v.idVendedor = p_idVendedor)
                AND (p_idCliente = 0 OR v.idCliente = p_idCliente)
                AND (p_idTipoCliente = 0 OR c.idTipoCliente = p_idTipoCliente)
                AND (p_idProducto = 0 OR VD.idProducto = p_idProducto)
                AND
                (
                    p_idTipoPromocion = 0
                    OR ( p_idTipoPromocion = 1 AND VD.idPromocion > 0 )
                    OR ( p_idTipoPromocion = 2 AND VD.idPromocion = 0 )
                )
                AND (p_idTipoVenta = 0 OR v.idTipoVenta = p_idTipoVenta)
                AND ( IFNULL( p_startDateCliente ,'') = '' OR CAST( c.createDate AS DATE ) >= p_startDateCliente)
                AND ( IFNULL( p_endDateCliente ,'') = '' OR CAST( c.createDate AS DATE ) <= p_endDateCliente)
                AND ( p_idFamilia = 0 OR P.idFamilia = p_idFamilia )
                AND ( p_idDepartamento = 0 OR F.idDepartamento = p_idDepartamento )
                AND ( IFNULL( p_startDateCliReactivados ,'') = '' OR CAST( c.fechaReactivacion AS DATE ) >= p_startDateCliReactivados)
                AND ( IFNULL( p_endDateCliReactivados ,'') = '' OR CAST( c.fechaReactivacion AS DATE ) <= p_endDateCliReactivados)
                AND ( p_idZona = 0 OR Z.idZona = p_idZona )
                AND ( p_idGiro = 0 OR G.idGiro = p_idGiro )
        GROUP BY
                Z.idZona,
                Z.name
        ORDER BY subtotal DESC
        ;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `repVentasSumarizado` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `repVentasSumarizado`(
    IN p_startDate VARCHAR(50),
    IN p_endDate VARCHAR(50),
    IN p_idSucursal INT,
    IN p_idVendedor BIGINT,
    IN p_idCliente BIGINT,
	IN p_idTipoCliente INT,
	IN p_idProducto BIGINT,
	IN p_idTipoPromocion SMALLINT,
	IN p_idTipoVenta INT,
	IN p_startDateCliente VARCHAR(50),
    IN p_endDateCliente VARCHAR(50),
	IN p_idFamilia INT,
	IN p_idDepartamento INT,
	IN p_idZona INT,
	IN p_idGiro INT,
	IN p_startDateCliReactivados VARCHAR(50),
    IN p_endDateCliReactivados VARCHAR(50)
)
BEGIN

	DECLARE v_subtotal DECIMAL( 18, 2 ) DEFAULT 0;
	DECLARE v_descuento DECIMAL( 18, 2 ) DEFAULT 0;
	DECLARE v_total DECIMAL( 18, 2 ) DEFAULT 0;

    SELECT
        
		ROUND( SUM( VD.precioUnitario * VD.cantidad ) ,2),
		ROUND( SUM( VD.descuento * VD.cantidad ) ,2),
		ROUND( SUM( VD.total ) ,2)
	INTO
		v_subtotal,
		v_descuento,
		v_total
		
    FROM ventas AS v
	INNER JOIN ventasdetalle AS VD ON VD.idVenta = v.idVenta
	INNER JOIN productos AS P ON P.active = 1 AND P.idProducto = VD.idProducto
	INNER JOIN cat_familias AS F ON F.idFamilia = P.idFamilia
	INNER JOIN sucursales AS S ON S.idSucursal = v.idSucursal
	INNER JOIN clientes c ON c.idCliente = v.idCliente
	LEFT JOIN zonas AS Z ON Z.idZona = c.idZona
	WHERE v.active = 1
		AND ( IFNULL( p_startDate ,'') = '' OR CAST( v.createDate AS DATE ) >= p_startDate)
		AND ( IFNULL( p_endDate ,'') = '' OR CAST( v.createDate AS DATE ) <= p_endDate)
		AND (p_idSucursal = 0 OR v.idSucursal = p_idSucursal)
		AND (p_idVendedor = 0 OR v.idVendedor = p_idVendedor)
		AND (p_idCliente = 0 OR v.idCliente = p_idCliente)
		AND (p_idTipoCliente = 0 OR c.idTipoCliente = p_idTipoCliente)
		AND (p_idProducto = 0 OR VD.idProducto = p_idProducto)
		AND
		(
			p_idTipoPromocion = 0
			OR ( p_idTipoPromocion = 1 AND VD.idPromocion > 0 )
			OR ( p_idTipoPromocion = 2 AND VD.idPromocion = 0 )
		)
		AND (p_idTipoVenta = 0 OR v.idTipoVenta = p_idTipoVenta)
		AND ( IFNULL( p_startDateCliente ,'') = '' OR CAST( c.createDate AS DATE ) >= p_startDateCliente)
		AND ( IFNULL( p_endDateCliente ,'') = '' OR CAST( c.createDate AS DATE ) <= p_endDateCliente)
		AND (p_idFamilia = 0 OR P.idFamilia = p_idFamilia)
		AND (p_idDepartamento = 0 OR F.idDepartamento = p_idDepartamento)
		AND ( IFNULL( p_startDateCliReactivados ,'') = '' OR CAST( c.fechaReactivacion AS DATE ) >= p_startDateCliReactivados)
		AND ( IFNULL( p_endDateCliReactivados ,'') = '' OR CAST( c.fechaReactivacion AS DATE ) <= p_endDateCliReactivados)
		AND ( p_idZona = 0 OR Z.idZona = p_idZona )
		AND ( p_idGiro = 0 OR c.idGiro = p_idGiro )
	;
	
	SELECT v_subtotal AS subtotal, v_descuento AS descuento, v_total AS total;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `rep_InventarioHistPaginado` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `rep_InventarioHistPaginado`(
IN p_idOrigen BIGINT
, IN p_idProducto BIGINT
, IN p_start INT
, IN p_limiter INT
, IN p_idUserLogON BIGINT
)
BEGIN

SET SESSION TRANSACTION ISOLATION LEVEL READ UNCOMMITTED ;

	SET @iRows = 0;
	
	SET @iRows = ( SELECT
					COUNT(*)
					FROM stocklog AS S
					INNER JOIN users AS U ON U.idUser = S.idCreateUser
					INNER JOIN cat_mov_entrada_salida AS CMES ON CMES.active = 1 AND CMES.idCatMov = S.idCatMov
					INNER JOIN origenes AS O ON O.active = 1 AND O.idOrigen = S.idOrigen
					INNER JOIN cat_relacion_origen AS CRO ON CRO.active = 1 AND CRO.idCatRelacionOrigen = O.idCatRelacionOrigen
					INNER JOIN productos AS P ON P.active = 1 AND P.idProducto = S.idProducto
					INNER JOIN cat_tipo_producto AS CTP ON CTP.active = 1 AND CTP.idCatTipoProducto = P.idCatTipoProducto
					INNER JOIN cat_descripciones AS CD ON CD.active = 1 AND CD.idDescription = P.idDescription
					INNER JOIN cat_unidad_medida AS UM ON UM.active = 1 AND UM.idUnidadMedida = P.idUnidadMedida
					WHERE
						S.active = 1
						AND S.idOrigen = p_idOrigen
						AND P.idProducto = p_idProducto
	);
	
	SELECT
	
        @iRows AS iRows
		, S.idStock
        , DATE_FORMAT( S.createDate, '%d-%m-%Y') AS createDateDate
		, DATE_FORMAT( S.createDate, '%h:%i:%s %p') AS createDateHours
		, S.idProducto
		, CONCAT( IFNULL( CTP.abreviatura ,''), '-', CAST( P.idproductocategoria AS CHAR(12) ) , '-', IFNULL( CD.description ,''), ' ', REPLACE( CAST( P.valorMedida AS CHAR(12) ) , '.00', ''), ' ', IFNULL( UM.abreviatura ,'') ) AS articuloName
		
		, S.cantidad
		
		, P.costo
		, ROUND( S.cantidad * P.costo ,2) AS costoTotal
		
		, P.precio
		, ROUND( S.cantidad * P.precio ,2) AS precioTotal
        
        , S.idOrigen
        , CONCAT( IFNULL( CRO.abreviatura ,''), '-', O.nombre ) AS origenName
		
		, S.motivoDesc
        , S.comentarios
		
		, S.idCatMov
		, CMES.description AS catMotivoDesc
		
		, S.idCreateUser
		, U.name AS createUserName
		
		,IFNULL(
		(
			SELECT
				ROUND( SUM( SL.cantidad ) ,2)
			FROM stocklog AS SL
			WHERE
				SL.idOrigen = S.idOrigen
				AND SL.idProducto = S.idProducto
				AND SL.idStock < S.idStock
		), 0) AS cantAntes
		
		,IFNULL(
		(
			SELECT
				ROUND( SUM( SL.cantidad ) ,2)
			FROM stocklog AS SL
			WHERE
				SL.idOrigen = S.idOrigen
				AND SL.idProducto = S.idProducto
				AND SL.idStock <= S.idStock
		), 0) AS cantDespues
        
    FROM stocklog AS S
	INNER JOIN users AS U ON U.idUser = S.idCreateUser
	INNER JOIN cat_mov_entrada_salida AS CMES ON CMES.active = 1 AND CMES.idCatMov = S.idCatMov
	INNER JOIN origenes AS O ON O.active = 1 AND O.idOrigen = S.idOrigen
    INNER JOIN cat_relacion_origen AS CRO ON CRO.active = 1 AND CRO.idCatRelacionOrigen = O.idCatRelacionOrigen
	INNER JOIN productos AS P ON P.active = 1 AND P.idProducto = S.idProducto
	INNER JOIN cat_tipo_producto AS CTP ON CTP.active = 1 AND CTP.idCatTipoProducto = P.idCatTipoProducto
	INNER JOIN cat_descripciones AS CD ON CD.active = 1 AND CD.idDescription = P.idDescription
	INNER JOIN cat_unidad_medida AS UM ON UM.active = 1 AND UM.idUnidadMedida = P.idUnidadMedida
    WHERE
		S.active = 1
		AND S.idOrigen = p_idOrigen
		AND P.idProducto = p_idProducto
        
    ORDER BY S.idStock DESC
	LIMIT p_start, p_limiter;

 SET SESSION TRANSACTION ISOLATION LEVEL REPEATABLE READ ;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `rep_InventarioPaginado` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `rep_InventarioPaginado`(
 IN p_idOrigen BIGINT
, IN p_idFamilia INT
, IN p_idProducto BIGINT
, IN p_idUnidadMedida INT
, IN p_valorMedida VARCHAR(20)
, IN p_idDepartamento INT

, IN p_start INT
, IN p_limiter INT
, IN p_idUserLogON BIGINT
)
BEGIN

	DECLARE iRows INT DEFAULT 0;

    -- Contar filas
    SELECT COUNT(*) INTO iRows
    FROM stock AS S
	INNER JOIN origenes AS O ON O.idOrigen = S.idOrigen
    INNER JOIN cat_relacion_origen AS CRO ON CRO.idCatRelacionOrigen = O.idCatRelacionOrigen
	INNER JOIN productos AS P ON P.active = 1 AND P.idProducto = S.idProducto
	INNER JOIN cat_tipo_producto AS CTP ON CTP.active = 1 AND CTP.idCatTipoProducto = P.idCatTipoProducto
	INNER JOIN cat_descripciones AS CD ON CD.active = 1 AND CD.idDescription = P.idDescription
	INNER JOIN cat_unidad_medida AS UM ON UM.active = 1 AND UM.idUnidadMedida = P.idUnidadMedida
    LEFT JOIN cat_familias AS F ON F.idFamilia = P.idFamilia
    WHERE
		S.active = 1
		AND S.idOrigen = p_idOrigen
		AND
		(
			p_idFamilia = 0
			OR P.idFamilia = p_idFamilia
		)
		AND
		(
			p_idProducto = 0
			OR P.idProducto = p_idProducto
		)
		AND
		(
			p_idUnidadMedida = 0
			OR P.idUnidadMedida = p_idUnidadMedida
		)
        AND
		(
			p_valorMedida = ''
			OR P.valorMedida = p_valorMedida
		)
		AND
		(
			p_idDepartamento = 0
			OR F.idDepartamento = p_idDepartamento
		)
		;
	
	SELECT
	
        iRows AS iRows
		, S.idStock
		, S.idProducto
		, CONCAT( IFNULL( CTP.abreviatura ,''), '-', CAST( P.idproductocategoria AS CHAR(12) ) , '-', IFNULL( CD.description ,''), ' ', REPLACE( CAST( P.valorMedida AS CHAR(12) ) , '.00', ''), ' ', IFNULL( UM.abreviatura ,'') ) AS articuloName
		
        , ROUND( IFNULL( S.cantidad, 0) , 2) AS cantidad
        , ROUND( IFNULL( S.cantidadBlock, 0) , 2) AS cantidadBlock
        , ROUND( IFNULL( S.cantidad, 0) - IFNULL( S.cantidadBlock, 0) , 2) AS cantidadDisponible
		
		, IFNULL( P.costo ,0) AS costo
		, IFNULL( ROUND( S.cantidad * P.costo ,2) ,0) AS costoTotal
		
        , IFNULL( P.precio ,0) AS precio
		, IFNULL( ROUND( S.cantidad * P.precio ,2) ,0) AS precioTotal
        
        , S.idOrigen
        , CONCAT( IFNULL( CRO.abreviatura ,''), '-', O.nombre ) AS origenName
        
    FROM stock AS S
	INNER JOIN origenes AS O ON O.idOrigen = S.idOrigen
    INNER JOIN cat_relacion_origen AS CRO ON CRO.idCatRelacionOrigen = O.idCatRelacionOrigen
	INNER JOIN productos AS P ON P.active = 1 AND P.idProducto = S.idProducto
	INNER JOIN cat_tipo_producto AS CTP ON CTP.active = 1 AND CTP.idCatTipoProducto = P.idCatTipoProducto
	INNER JOIN cat_descripciones AS CD ON CD.active = 1 AND CD.idDescription = P.idDescription
	INNER JOIN cat_unidad_medida AS UM ON UM.active = 1 AND UM.idUnidadMedida = P.idUnidadMedida
    LEFT JOIN cat_familias AS F ON F.idFamilia = P.idFamilia
    WHERE
		S.active = 1
		AND S.idOrigen = p_idOrigen
		AND
		(
			p_idFamilia = 0
			OR P.idFamilia = p_idFamilia
		)
		AND
		(
			p_idProducto = 0
			OR P.idProducto = p_idProducto
		)
        AND
		(
			p_idUnidadMedida = 0
			OR P.idUnidadMedida = p_idUnidadMedida
		)
        AND
		(
			p_valorMedida = ''
			OR P.valorMedida = p_valorMedida
		)
		AND
		(
			p_idDepartamento = 0
			OR F.idDepartamento = p_idDepartamento
		)
		
    ORDER BY S.idStock DESC
	LIMIT p_start, p_limiter;
	
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `revisarPedidosPendientes` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `revisarPedidosPendientes`(
IN p_iOption INT
, IN p_idRelation BIGINT
)
BEGIN

	IF p_iOption = 1 THEN
	
		SELECT
			ESH.idEntradasSalidasH AS idHeader
			, P.idProducto
			, CONCAT(
				CAST( P.idproductocategoria AS CHAR(12) )
				, '-', IFNULL( CD.description ,'')
				, ' ', REPLACE( CAST( P.valorMedida AS CHAR(12) ) , '.00', '')
				, ' ', IFNULL( UM.abreviatura ,'')
				) AS articuloName
				
			, ESD.cantidad
		
		FROM entradas_salidas_header AS ESH
		INNER JOIN entradas_salidas_detalle AS ESD
			ON
				ESD.idStatusESDetalle IN( 1, 3, 4 ) -- 1: Enviado, 3: En Revisión, 4: Solicitado
				AND ESD.idEntradasSalidasH = ESH.idEntradasSalidasH
		INNER JOIN entradas_salidas_detalle AS ESDCurrent
			ON
				ESDCurrent.idProducto = ESD.idProducto
				AND ESDCurrent.idEntradasSalidasH <> ESD.idEntradasSalidasH
		INNER JOIN entradas_salidas_header AS ESHCurrent
			ON
				ESHCurrent.idEntradasSalidasH = ESDCurrent.idEntradasSalidasH
                AND ESHCurrent.idOrigenFrom = ESH.idOrigenFrom
                AND ESHCurrent.idOrigenTo = ESH.idOrigenTo
				AND ESHCurrent.idEntradasSalidasH = p_idRelation
			
		INNER JOIN productos AS P ON P.idProducto = ESD.idProducto
		INNER JOIN cat_tipo_producto AS CTP ON CTP.active = 1 AND CTP.idCatTipoProducto = P.idCatTipoProducto
		INNER JOIN cat_descripciones AS CD ON CD.active = 1 AND CD.idDescription = P.idDescription
		INNER JOIN cat_unidad_medida AS UM ON UM.active = 1 AND UM.idUnidadMedida = P.idUnidadMedida
		;
		
	ELSEIF p_iOption = 2 THEN
	
		SELECT
			PPBD.idProdProdBaseDetalle AS idHeader
			, P.idProducto
			, CONCAT(
				CAST( P.idproductocategoria AS CHAR(12) )
				, '-', IFNULL( CD.description ,'')
				, ' ', REPLACE( CAST( P.valorMedida AS CHAR(12) ) , '.00', '')
				, ' ', IFNULL( UM.abreviatura ,'')
				) AS articuloName
				
			, PPBD.cantidad
		
		FROM prod_prod_base_detalle AS PPBD
		INNER JOIN prod_prod_base_detalle AS PPBDCurrent
			ON
				PPBDCurrent.idProdProdBaseDetalle <> PPBD.idProdProdBaseDetalle -- OTRA PRODUCCION
				AND PPBDCurrent.idProductoBase = PPBD.idProductoBase -- MISMA BASE
				AND PPBDCurrent.idCreateUser = PPBD.idCreateUser -- MISMO CREADOR
		INNER JOIN productos AS P ON P.idProducto = PPBD.idProductoBase
		INNER JOIN cat_tipo_producto AS CTP ON CTP.active = 1 AND CTP.idCatTipoProducto = P.idCatTipoProducto
		INNER JOIN cat_descripciones AS CD ON CD.active = 1 AND CD.idDescription = P.idDescription
		INNER JOIN cat_unidad_medida AS UM ON UM.active = 1 AND UM.idUnidadMedida = P.idUnidadMedida
		WHERE
			PPBD.idStatus NOT IN( 5 ) -- MIENTRAS NO SE HAYA RECIBIDO
			AND PPBDCurrent.idProdProdBaseDetalle = p_idRelation
		;
        
	END IF;
		
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `rollbackTest` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `rollbackTest`()
BEGIN
    DECLARE mensaje_error TEXT;
    
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        -- Capturar el mensaje de error
        GET DIAGNOSTICS CONDITION 1 mensaje_error = MESSAGE_TEXT;
        
		SELECT 0 AS out_id, mensaje_error AS message;
        
        -- Hacer rollback de todo
        ROLLBACK;
    END;

    START TRANSACTION;
	
	INSERT INTO table2 (name) VALUES ('valor1');

    -- Tus operaciones
    INSERT INTO tabla1 (col1) VALUES ('valor1');
    UPDATE tabla2 SET col2 = 'nuevo_valor' WHERE id = 1;
	

    -- Si todo sale bien, se confirma
    COMMIT;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `savePagosCredito` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `savePagosCredito`(
	IN oGetDateNow DATETIME,
    IN p_idCliente BIGINT,
    IN p_abonos_json TEXT,
    IN p_metodosPago_json TEXT,
    IN p_idUserLogON BIGINT
)
BEGIN
    DECLARE v_idMetodosPagoDetalle BIGINT DEFAULT NULL;
    DECLARE v_efectivo DECIMAL(18,2) DEFAULT 0;
    DECLARE v_tarjeta DECIMAL(18,2) DEFAULT 0;
    DECLARE v_transferencia DECIMAL(18,2) DEFAULT 0;
	DECLARE v_cheque DECIMAL(18,2) DEFAULT 0;
	DECLARE v_fechaDeposito DATE DEFAULT NULL;
	DECLARE v_dineroElectronico DECIMAL(18,2) DEFAULT 0;
    DECLARE v_total DECIMAL(18,2) DEFAULT 0;
    DECLARE v_referenciaTarjeta VARCHAR(45) DEFAULT '';
    DECLARE v_referenciaTransferencia VARCHAR(45) DEFAULT '';
    DECLARE v_fechaTransferencia DATE DEFAULT NULL;
    DECLARE v_i INT DEFAULT 0;
    DECLARE v_totalAbonos INT DEFAULT 0;
    DECLARE v_idVenta BIGINT;
    DECLARE v_abono DECIMAL(18,2);

    -- Variables para diagnóstico de error
    DECLARE v_sqlstate CHAR(5) DEFAULT '';
    DECLARE v_errno INT DEFAULT 0;
    DECLARE v_message TEXT DEFAULT '';

    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS CONDITION 1
            v_sqlstate = RETURNED_SQLSTATE,
            v_errno = MYSQL_ERRNO,
            v_message = MESSAGE_TEXT;
        SELECT 0 AS out_id, 
               CONCAT('SQLSTATE: ', v_sqlstate, ' | ERRNO: ', v_errno, ' | MSG: ', v_message) AS message;
    END;

    -- Métodos de pago (manejo seguro de null)
    SET @efectivo_val = JSON_UNQUOTE(JSON_EXTRACT(p_metodosPago_json, '$.efectivo'));
    SET @tarjeta_val = JSON_UNQUOTE(JSON_EXTRACT(p_metodosPago_json, '$.tarjeta'));
    SET @transferencia_val = JSON_UNQUOTE(JSON_EXTRACT(p_metodosPago_json, '$.transferencia'));
	SET @cheque_val = JSON_UNQUOTE(JSON_EXTRACT(p_metodosPago_json, '$.cheque'));
	SET @dineroElectronico_val = JSON_UNQUOTE(JSON_EXTRACT(p_metodosPago_json, '$.dineroElectronico'));
	
    SET v_efectivo = IF(@efectivo_val IS NULL OR @efectivo_val = 'null', 0, CAST(@efectivo_val AS DECIMAL(18,2)));
    SET v_tarjeta = IF(@tarjeta_val IS NULL OR @tarjeta_val = 'null', 0, CAST(@tarjeta_val AS DECIMAL(18,2)));
    SET v_transferencia = IF(@transferencia_val IS NULL OR @transferencia_val = 'null', 0, CAST(@transferencia_val AS DECIMAL(18,2)));
	SET v_cheque = IF(@cheque_val IS NULL OR @cheque_val = 'null', 0, CAST(@cheque_val AS DECIMAL(18,2)));
	SET v_dineroElectronico = IF(@dineroElectronico_val IS NULL OR @dineroElectronico_val = 'null', 0, CAST(@dineroElectronico_val AS DECIMAL(18,2)));

    SET v_referenciaTarjeta = JSON_UNQUOTE(IFNULL(JSON_EXTRACT(p_metodosPago_json, '$.referenciaTarjeta'), ''));
    SET v_referenciaTransferencia = JSON_UNQUOTE(IFNULL(JSON_EXTRACT(p_metodosPago_json, '$.referenciaTransferencia'), ''));
    SET v_fechaTransferencia = IF( v_transferencia > 0, JSON_UNQUOTE(IFNULL(JSON_EXTRACT(p_metodosPago_json, '$.fechaTransferencia'), '')), null );
	SET v_fechaDeposito = IF( v_cheque > 0, JSON_UNQUOTE(IFNULL(JSON_EXTRACT(p_metodosPago_json, '$.fechaDeposito'), '')), null );
    SET v_total = v_efectivo + v_tarjeta + v_transferencia + v_cheque + v_dineroElectronico;

    -- 1. Insertar métodos de pago (pago maestro)
    INSERT INTO metodos_pago_detalle (
        efectivo,
        tarjeta,
        transferencia,
        total,
        referenciaTarjeta,
        referenciaTransferencia,
        fechaTransferencia,
		cheque,
		fechaDeposito,
		dineroElectronico
    ) VALUES (
        v_efectivo,
        v_tarjeta,
        v_transferencia,
        v_total,
        v_referenciaTarjeta,
        v_referenciaTransferencia,
        v_fechaTransferencia,
		v_cheque,
		v_fechaDeposito,
		v_dineroElectronico
    );
    SET v_idMetodosPagoDetalle = LAST_INSERT_ID();

    -- 2. Crear tabla temporal para los abonos
    CREATE TEMPORARY TABLE IF NOT EXISTS tmp_abonos (
        idVenta BIGINT,
        abono DECIMAL(18,2)
    );

    -- 3. Obtener el total de elementos en el JSON de abonos
    SET v_totalAbonos = JSON_LENGTH(p_abonos_json);

    -- 4. Volcar los abonos a la tabla temporal usando WHILE
    SET v_i = 0;
    WHILE v_i < v_totalAbonos DO
        SET v_idVenta = JSON_UNQUOTE(JSON_EXTRACT(p_abonos_json, CONCAT('$[', v_i, '].idVenta')));
        SET v_abono = JSON_UNQUOTE(JSON_EXTRACT(p_abonos_json, CONCAT('$[', v_i, '].abono')));
        IF v_abono > 0 THEN
            INSERT INTO tmp_abonos (idVenta, abono) VALUES (v_idVenta, v_abono);
        END IF;
        SET v_i = v_i + 1;
    END WHILE;

    -- 5. Insertar todos los abonos en la tabla pagos de una sola vez
    INSERT INTO pagos (
        createDate,
        active,
        idMetodosPagoDetalle,
        idVenta,
        idCreateUser,
        total
    )
    SELECT
        oGetDateNow,
        1,
        v_idMetodosPagoDetalle,
        idVenta,
        p_idUserLogON,
        abono
    FROM tmp_abonos;
	
	UPDATE ventas v
	INNER JOIN tmp_abonos t ON v.idVenta = t.idVenta
	SET 
	  v.pendiente = ROUND(v.pendiente - t.abono, 2);

    DROP TEMPORARY TABLE IF EXISTS tmp_abonos;

    SELECT 1 AS out_id, 'Pagos registrados correctamente' AS message;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SplitPalabras` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SplitPalabras`(IN cadena VARCHAR(500))
BEGIN
  DECLARE pos INT DEFAULT 0;
  DECLARE palabra VARCHAR(100);
  DECLARE str VARCHAR(500);

  SET str = cadena;

  -- Elimina espacios al inicio/final
  SET str = TRIM(str);
  
	DROP TEMPORARY TABLE IF EXISTS tmp_split;
	CREATE TEMPORARY TABLE IF NOT EXISTS tmp_split (
		texto VARCHAR(100)
	);

  WHILE LENGTH(str) > 0 DO
    SET pos = LOCATE(' ', str);
    IF pos > 0 THEN
      SET palabra = LEFT(str, pos - 1);
      INSERT INTO tmp_split(texto) VALUES(palabra);
      SET str = TRIM(SUBSTRING(str, pos + 1));
    ELSE
      INSERT INTO tmp_split(texto) VALUES(str);
      SET str = '';
    END IF;
  END WHILE;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `syncCotizacionDetalle` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `syncCotizacionDetalle`(
    IN p_idCotizacion BIGINT,
    IN jsonInsertUpdate JSON
)
BEGIN
    DECLARE i INT DEFAULT 0;
    DECLARE totalInsert INT DEFAULT 0;
    DECLARE v_idCotizacionDetalle BIGINT DEFAULT 0;
    DECLARE v_idProducto BIGINT DEFAULT 0;
    DECLARE v_bEnvase SMALLINT DEFAULT 0;
    DECLARE v_cantidad DECIMAL(18,2) DEFAULT 0;
    DECLARE v_precioUnitario DECIMAL(18,2) DEFAULT 0;
    DECLARE listaIds TEXT DEFAULT '';

    SET totalInsert = IFNULL(JSON_LENGTH(jsonInsertUpdate), 0);

    -- Construir la lista de idCotizacionDetalle recibidos SIN coma inicial
    SET i = 0;
    WHILE i < totalInsert DO
        SET v_idCotizacionDetalle = IFNULL(CAST(JSON_UNQUOTE(JSON_EXTRACT(jsonInsertUpdate, CONCAT('$[', i, '].idCotizacionDetalle'))) AS UNSIGNED), 0);
        IF v_idCotizacionDetalle > 0 THEN
            IF listaIds = '' THEN
                SET listaIds = CONCAT(v_idCotizacionDetalle);
            ELSE
                SET listaIds = CONCAT(listaIds, ',', v_idCotizacionDetalle);
            END IF;
        END IF;
        SET i = i + 1;
    END WHILE;

    -- Eliminar los detalles que no están en la lista recibida
    IF listaIds <> '' THEN
        SET @sql = CONCAT(
            'DELETE FROM cotizaciones_detalle WHERE idCotizacion = ', p_idCotizacion,
            ' AND idCotizacionDetalle NOT IN (', listaIds, ')'
        );
        PREPARE stmt FROM @sql;
        EXECUTE stmt;
        DEALLOCATE PREPARE stmt;
    ELSE
        DELETE FROM cotizaciones_detalle WHERE idCotizacion = p_idCotizacion;
    END IF;

    -- Procesar cada elemento del array
    SET i = 0;
    WHILE i < totalInsert DO
        SET v_idCotizacionDetalle = IFNULL(CAST(JSON_UNQUOTE(JSON_EXTRACT(jsonInsertUpdate, CONCAT('$[', i, '].idCotizacionDetalle'))) AS UNSIGNED), 0);
        SET v_idProducto          = IFNULL(CAST(JSON_UNQUOTE(JSON_EXTRACT(jsonInsertUpdate, CONCAT('$[', i, '].idProducto'))) AS UNSIGNED), 0);
        SET v_bEnvase             = IFNULL(CAST(JSON_UNQUOTE(JSON_EXTRACT(jsonInsertUpdate, CONCAT('$[', i, '].bEnvase'))) AS UNSIGNED), 0);
        SET v_cantidad            = IFNULL(CAST(JSON_UNQUOTE(JSON_EXTRACT(jsonInsertUpdate, CONCAT('$[', i, '].cantidad'))) AS DECIMAL(18,2)), 0);

        -- Obtener precio unitario actual
        SELECT precio INTO v_precioUnitario FROM productos WHERE idProducto = v_idProducto LIMIT 1;

        IF v_idCotizacionDetalle > 0 THEN
            -- Actualizar registro existente
            UPDATE cotizaciones_detalle
            SET idProducto = v_idProducto,
                bEnvase = v_bEnvase,
                cantidad = v_cantidad,
                precioUnitario = ROUND(v_precioUnitario, 2),
                descuento = 0,
                precioConDescuento = ROUND(v_precioUnitario, 2),
                total = ROUND(v_precioUnitario * v_cantidad, 2),
                aplicaPromo = 0,
                idPromocion = NULL,
                promoName = NULL
            WHERE idCotizacionDetalle = v_idCotizacionDetalle;
        ELSE
            -- Insertar nuevo registro
            INSERT INTO cotizaciones_detalle (
                idCotizacion,
                idProducto,
                bEnvase,
                cantidad,
                precioUnitario,
                descuento,
                precioConDescuento,
                total,
                aplicaPromo,
                idPromocion,
                promoName
            )
            VALUES (
                p_idCotizacion,
                v_idProducto,
                v_bEnvase,
                v_cantidad,
                ROUND(v_precioUnitario, 2),
                0,
                ROUND(v_precioUnitario, 2),
                ROUND(v_precioUnitario * v_cantidad, 2),
                0,
                NULL,
                NULL
            );
        END IF;

        SET i = i + 1;
    END WHILE;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `syncInventarioFisicoDetalle` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `syncInventarioFisicoDetalle`(
    IN p_idInventarioFisico BIGINT,
    IN jsonDetalle JSON,
    IN p_idUserLogON BIGINT,
    IN oGetDateNow DATETIME
)
BEGIN
    DECLARE i INT DEFAULT 0;
    DECLARE totalItems INT DEFAULT 0;
    DECLARE v_keyx BIGINT DEFAULT 0;
    DECLARE v_idProducto BIGINT DEFAULT 0;
    DECLARE v_cantidadSistema DECIMAL(18,2) DEFAULT 0;
    DECLARE v_cantidadFisica DECIMAL(18,2) DEFAULT 0;
    DECLARE v_diferencia DECIMAL(18,2) DEFAULT 0;
    DECLARE v_precioProducto DECIMAL(18,2) DEFAULT 0;
    DECLARE v_total DECIMAL(18,2) DEFAULT 0;
    DECLARE v_totalFisico DECIMAL(18,2) DEFAULT 0;
    DECLARE v_observaciones VARCHAR(500) DEFAULT '';
    
    DECLARE v_bFaltante SMALLINT DEFAULT 0;
    DECLARE v_bSobrante SMALLINT DEFAULT 0;
    DECLARE v_bAllOK SMALLINT DEFAULT 0;
    
    DECLARE mensaje_error TEXT;
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS CONDITION 1 mensaje_error = MESSAGE_TEXT;
        SELECT 0 AS out_id, mensaje_error AS message;
    END;

    SET totalItems = IFNULL(JSON_LENGTH(jsonDetalle), 0);

    -- Procesar cada elemento del array JSON
    SET i = 0;
    WHILE i < totalItems DO
        SET v_keyx               = IFNULL(CAST(JSON_UNQUOTE(JSON_EXTRACT(jsonDetalle, CONCAT('$[', i, '].keyx'))) AS UNSIGNED), 0);
        SET v_cantidadFisica     = IFNULL(CAST(JSON_UNQUOTE(JSON_EXTRACT(jsonDetalle, CONCAT('$[', i, '].cantidadFisica'))) AS DECIMAL(18,2)), 0);
        SET v_observaciones      = IFNULL(JSON_UNQUOTE(JSON_EXTRACT(jsonDetalle, CONCAT('$[', i, '].observaciones'))), '');
		
		SELECT
		
		IFD.idProducto, IFD.cantidadSistema
			INTO
		v_idProducto, v_cantidadSistema
		
		FROM inventario_fisico_detalle AS IFD
		WHERE
			IFD.keyx = v_keyx;
			
		SET v_diferencia = IFNULL( v_cantidadFisica ,0) - IFNULL( v_cantidadSistema ,0);

        -- Obtener el precio del producto
        SET v_precioProducto = 0;
        IF v_idProducto > 0 THEN
            SELECT IFNULL(precio, 0) INTO v_precioProducto
            FROM productos
            WHERE idProducto = v_idProducto
            LIMIT 1;
        END IF;
        
        -- Calcular los totales con el precio actualizado del producto
        SET v_total = v_cantidadSistema * v_precioProducto;
        SET v_totalFisico = v_cantidadFisica * v_precioProducto;

        -- Actualizar registro existente
        IF v_keyx > 0 THEN
            UPDATE inventario_fisico_detalle
            SET cantidadFisica = v_cantidadFisica,
                diferencia = v_diferencia,
                precio = v_precioProducto,
                total = v_total,
                totalFisico = v_totalFisico,
                observaciones = v_observaciones,
                fechaConteo = oGetDateNow
            WHERE `keyx` = v_keyx;
        END IF;

        SET i = i + 1;
    END WHILE;
    
    -- Actualizar las banderas en el inventario_fisico en un solo query
    UPDATE inventario_fisico
    SET bFaltante = (SELECT IF(COUNT(*) > 0, 1, 0) FROM inventario_fisico_detalle WHERE idInventarioFisico = p_idInventarioFisico AND active = 1 AND diferencia < 0),
        bSobrante = (SELECT IF(COUNT(*) > 0, 1, 0) FROM inventario_fisico_detalle WHERE idInventarioFisico = p_idInventarioFisico AND active = 1 AND diferencia > 0),
        bAllOK = (SELECT IF(COUNT(*) = 0, 1, 0) FROM inventario_fisico_detalle WHERE idInventarioFisico = p_idInventarioFisico AND active = 1 AND diferencia <> 0)
    WHERE idInventarioFisico = p_idInventarioFisico;
    
    SELECT 1 AS out_id, 'Se actualizó correctamente' AS message;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `syncPedidoClienteDetalle` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `syncPedidoClienteDetalle`(
    IN p_idPedido BIGINT,
    IN jsonInsertUpdate JSON
)
BEGIN
    DECLARE i INT DEFAULT 0;
    DECLARE totalInsert INT DEFAULT 0;
    DECLARE v_idPedidoDetalle BIGINT DEFAULT 0;
    DECLARE v_idProducto BIGINT DEFAULT 0;
    DECLARE v_bEnvase SMALLINT DEFAULT 0;
    DECLARE v_cantidad DECIMAL(18,2) DEFAULT 0;
    DECLARE v_precioUnitario DECIMAL(18,2) DEFAULT 0;
    DECLARE listaIds TEXT DEFAULT '';

    SET totalInsert = IFNULL(JSON_LENGTH(jsonInsertUpdate), 0);

    -- Construir la lista de idPedidoDetalle recibidos SIN coma inicial
    SET i = 0;
    WHILE i < totalInsert DO
        SET v_idPedidoDetalle = IFNULL(CAST(JSON_UNQUOTE(JSON_EXTRACT(jsonInsertUpdate, CONCAT('$[', i, '].idPedidoDetalle'))) AS UNSIGNED), 0);
        IF v_idPedidoDetalle > 0 THEN
            IF listaIds = '' THEN
                SET listaIds = CONCAT(v_idPedidoDetalle);
            ELSE
                SET listaIds = CONCAT(listaIds, ',', v_idPedidoDetalle);
            END IF;
        END IF;
        SET i = i + 1;
    END WHILE;

    -- Eliminar los detalles que no están en la lista recibida
    IF listaIds <> '' THEN
        SET @sql = CONCAT(
            'DELETE FROM pedidos_clientes_detalle WHERE idPedido = ', p_idPedido,
            ' AND idPedidoDetalle NOT IN (', listaIds, ')'
        );
        PREPARE stmt FROM @sql;
        EXECUTE stmt;
        DEALLOCATE PREPARE stmt;
    ELSE
        DELETE FROM pedidos_clientes_detalle WHERE idPedido = p_idPedido;
    END IF;

    -- Procesar cada elemento del array
    SET i = 0;
    WHILE i < totalInsert DO
        SET v_idPedidoDetalle = IFNULL(CAST(JSON_UNQUOTE(JSON_EXTRACT(jsonInsertUpdate, CONCAT('$[', i, '].idPedidoDetalle'))) AS UNSIGNED), 0);
        SET v_idProducto      = IFNULL(CAST(JSON_UNQUOTE(JSON_EXTRACT(jsonInsertUpdate, CONCAT('$[', i, '].idProducto'))) AS UNSIGNED), 0);
        SET v_bEnvase         = IFNULL(CAST(JSON_UNQUOTE(JSON_EXTRACT(jsonInsertUpdate, CONCAT('$[', i, '].bEnvase'))) AS UNSIGNED), 0);
        SET v_cantidad        = IFNULL(CAST(JSON_UNQUOTE(JSON_EXTRACT(jsonInsertUpdate, CONCAT('$[', i, '].cantidad'))) AS DECIMAL(18,2)), 0);

        -- Obtener precio unitario actual
        SELECT precio INTO v_precioUnitario FROM productos WHERE idProducto = v_idProducto LIMIT 1;

        IF v_idPedidoDetalle > 0 THEN
            -- Actualizar registro existente
            UPDATE pedidos_clientes_detalle
            SET idProducto = v_idProducto,
                bEnvase = v_bEnvase,
                cantidad = v_cantidad,
                precioUnitario = ROUND(v_precioUnitario, 2),
                descuento = 0,
                precioConDescuento = ROUND(v_precioUnitario, 2),
                total = ROUND(v_precioUnitario * v_cantidad, 2),
                aplicaPromo = 0,
                idPromocion = 0,
                promoName = ''
            WHERE idPedidoDetalle = v_idPedidoDetalle;
        ELSE
            -- Insertar nuevo registro
            INSERT INTO pedidos_clientes_detalle (
                idPedido,
                idProducto,
                bEnvase,
                cantidad,
                precioUnitario,
                descuento,
                precioConDescuento,
                total,
                aplicaPromo,
                idPromocion,
                promoName
            )
            VALUES (
                p_idPedido,
                v_idProducto,
                v_bEnvase,
                v_cantidad,
                ROUND(v_precioUnitario, 2),
                0,
                ROUND(v_precioUnitario, 2),
                ROUND(v_precioUnitario * v_cantidad, 2),
                0,
                0,
                ''
            );
        END IF;

        SET i = i + 1;
    END WHILE;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `syncVentaDetalle` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `syncVentaDetalle`(
    IN p_idVenta BIGINT,
    IN jsonInsertUpdate JSON
)
BEGIN
    DECLARE i INT DEFAULT 0;
    DECLARE totalInsert INT DEFAULT 0;
    DECLARE v_idVentaDetalle BIGINT DEFAULT 0;
    DECLARE v_idProducto BIGINT DEFAULT 0;
    DECLARE v_bEnvase SMALLINT DEFAULT 0;
    DECLARE v_cantidad DECIMAL(18,2) DEFAULT 0;
    DECLARE v_precioUnitario DECIMAL(18,2) DEFAULT 0;
    DECLARE v_descripcion VARCHAR(500) DEFAULT '';
    DECLARE listaIds TEXT DEFAULT '';

    SET totalInsert = IFNULL(JSON_LENGTH(jsonInsertUpdate), 0);

    -- Construir la lista de idVentaDetalle recibidos SIN coma inicial
    SET i = 0;
    WHILE i < totalInsert DO
        SET v_idVentaDetalle = IFNULL(CAST(JSON_UNQUOTE(JSON_EXTRACT(jsonInsertUpdate, CONCAT('$[', i, '].idVentaDetalle'))) AS UNSIGNED), 0);
        IF v_idVentaDetalle > 0 THEN
            IF listaIds = '' THEN
                SET listaIds = CONCAT(v_idVentaDetalle);
            ELSE
                SET listaIds = CONCAT(listaIds, ',', v_idVentaDetalle);
            END IF;
        END IF;
        SET i = i + 1;
    END WHILE;

    -- Eliminar los detalles que no están en la lista recibida
    IF listaIds <> '' THEN
        SET @sql = CONCAT(
            'DELETE FROM ventasdetalle WHERE idVenta = ', p_idVenta,
            ' AND idVentaDetalle NOT IN (', listaIds, ')'
        );
        PREPARE stmt FROM @sql;
        EXECUTE stmt;
        DEALLOCATE PREPARE stmt;
    ELSE
        DELETE FROM ventasdetalle WHERE idVenta = p_idVenta;
    END IF;

    -- Procesar cada elemento del array
    SET i = 0;
    WHILE i < totalInsert DO
        SET v_idVentaDetalle = IFNULL(CAST(JSON_UNQUOTE(JSON_EXTRACT(jsonInsertUpdate, CONCAT('$[', i, '].idVentaDetalle'))) AS UNSIGNED), 0);
        SET v_idProducto     = IFNULL(CAST(JSON_UNQUOTE(JSON_EXTRACT(jsonInsertUpdate, CONCAT('$[', i, '].idProducto'))) AS UNSIGNED), 0);
        SET v_bEnvase        = IFNULL(CAST(JSON_UNQUOTE(JSON_EXTRACT(jsonInsertUpdate, CONCAT('$[', i, '].bEnvase'))) AS UNSIGNED), 0);
        SET v_cantidad       = IFNULL(CAST(JSON_UNQUOTE(JSON_EXTRACT(jsonInsertUpdate, CONCAT('$[', i, '].cantidad'))) AS DECIMAL(18,2)), 0);

        -- Obtener precio unitario actual
        SELECT precio INTO v_precioUnitario FROM productos WHERE idProducto = v_idProducto LIMIT 1;

        -- Obtener descripción dinámica
        SELECT CONCAT(
            IFNULL(CTP.abreviatura, ''),
            '-', CAST(P.idproductocategoria AS CHAR(12)),
            '-', IFNULL(CD.description, ''),
            ' ', REPLACE(CAST(P.valorMedida AS CHAR(12)), '.00', ''),
            ' ', IFNULL(UM.abreviatura, '')
        ) INTO v_descripcion
        FROM productos AS P
        INNER JOIN cat_tipo_producto AS CTP ON CTP.active = 1 AND CTP.idCatTipoProducto = P.idCatTipoProducto
        INNER JOIN cat_descripciones AS CD ON CD.active = 1 AND CD.idDescription = P.idDescription
        INNER JOIN cat_unidad_medida AS UM ON UM.active = 1 AND UM.idUnidadMedida = P.idUnidadMedida
        WHERE P.idProducto = v_idProducto
        LIMIT 1;

        IF v_idVentaDetalle > 0 THEN
            -- Actualizar registro existente
            UPDATE ventasdetalle
            SET idProducto = v_idProducto,
                descripcion = v_descripcion,
                bEnvase = v_bEnvase,
                cantidad = v_cantidad,
                precioUnitario = ROUND(v_precioUnitario, 2),
                descuento = 0,
                precioConDescuento = ROUND(v_precioUnitario, 2),
                total = ROUND(v_precioUnitario * v_cantidad, 2),
                aplicaPromo = 0,
                idPromocion = 0,
                promoName = ''
            WHERE idVentaDetalle = v_idVentaDetalle;
        ELSE
            -- Insertar nuevo registro
            INSERT INTO ventasdetalle (
                idVenta,
                idProducto,
                descripcion,
                bEnvase,
                cantidad,
                precioUnitario,
                descuento,
                precioConDescuento,
                total,
                aplicaPromo,
                idPromocion,
                promoName
            )
            VALUES (
                p_idVenta,
                v_idProducto,
                v_descripcion,
                v_bEnvase,
                v_cantidad,
                ROUND(v_precioUnitario, 2),
                0,
                ROUND(v_precioUnitario, 2),
                ROUND(v_precioUnitario * v_cantidad, 2),
                0,
                0,
                ''
            );
        END IF;

        SET i = i + 1;
    END WHILE;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `updateCotizacionDetallePromos` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `updateCotizacionDetallePromos`(
    IN p_idCotizacion BIGINT,
    IN jsonDetalleActual JSON
)
BEGIN
    -- Variables locales
    DECLARE i INT DEFAULT 0;
    DECLARE totalRows INT DEFAULT 0;

    DECLARE v_idCotizacionDetalle BIGINT DEFAULT 0;
    DECLARE v_precioUnitario DECIMAL(18,2) DEFAULT 0;
    DECLARE v_descuento DECIMAL(18,2) DEFAULT 0;
    DECLARE v_precioConDescuento DECIMAL(18,2) DEFAULT 0;
    DECLARE v_total DECIMAL(18,2) DEFAULT 0;
    DECLARE v_aplicaPromo SMALLINT DEFAULT 0;
    DECLARE v_idPromocion BIGINT DEFAULT 0;
    DECLARE v_promoName VARCHAR(500) DEFAULT '';

    -- Cuántos registros vienen en el JSON
    SET totalRows = IFNULL(JSON_LENGTH(jsonDetalleActual), 0);
    SET i = 0;

    WHILE i < totalRows DO
        SET v_idCotizacionDetalle   = IFNULL(CAST(JSON_UNQUOTE(JSON_EXTRACT(jsonDetalleActual, CONCAT('$[', i, '].idCotizacionDetalle'))) AS UNSIGNED), 0);
        SET v_precioUnitario        = IFNULL(CAST(JSON_UNQUOTE(JSON_EXTRACT(jsonDetalleActual, CONCAT('$[', i, '].precioUnitario'))) AS DECIMAL(18,2)), 0);
        SET v_descuento             = IFNULL(CAST(JSON_UNQUOTE(JSON_EXTRACT(jsonDetalleActual, CONCAT('$[', i, '].descuento'))) AS DECIMAL(18,2)), 0);
        SET v_precioConDescuento    = IFNULL(CAST(JSON_UNQUOTE(JSON_EXTRACT(jsonDetalleActual, CONCAT('$[', i, '].precioConDescuento'))) AS DECIMAL(18,2)), 0);
        SET v_total                 = IFNULL(CAST(JSON_UNQUOTE(JSON_EXTRACT(jsonDetalleActual, CONCAT('$[', i, '].total'))) AS DECIMAL(18,2)), 0);
        SET v_aplicaPromo = 
          CASE 
            WHEN JSON_UNQUOTE(JSON_EXTRACT(jsonDetalleActual, CONCAT('$[', i, '].aplicaPromo'))) = 'true' THEN 1
            WHEN JSON_UNQUOTE(JSON_EXTRACT(jsonDetalleActual, CONCAT('$[', i, '].aplicaPromo'))) = 'false' THEN 0
            ELSE IFNULL(CAST(JSON_UNQUOTE(JSON_EXTRACT(jsonDetalleActual, CONCAT('$[', i, '].aplicaPromo'))) AS UNSIGNED), 0)
          END;
        SET v_idPromocion           = IFNULL(CAST(JSON_UNQUOTE(JSON_EXTRACT(jsonDetalleActual, CONCAT('$[', i, '].idPromocion'))) AS UNSIGNED), 0);
        SET v_promoName             = IFNULL(JSON_UNQUOTE(JSON_EXTRACT(jsonDetalleActual, CONCAT('$[', i, '].promoName'))), '');

        -- Actualiza solo si el cotizacionDetalle existe y pertenece a la cotización indicada
        IF v_idCotizacionDetalle > 0 THEN
            UPDATE cotizaciones_detalle
            SET 
                precioUnitario      = v_precioUnitario,
                descuento           = v_descuento,
                precioConDescuento  = v_precioConDescuento,
                total               = v_total,
                aplicaPromo         = v_aplicaPromo,
                idPromocion         = v_idPromocion,
                promoName           = v_promoName
            WHERE idCotizacionDetalle = v_idCotizacionDetalle AND idCotizacion = p_idCotizacion;
        END IF;

        SET i = i + 1;
    END WHILE;

    -- Actualiza los totales en la tabla cotizaciones sumando los valores de cotizaciones_detalle
    UPDATE cotizaciones
    SET
        subtotal = (SELECT IFNULL(SUM(precioUnitario * cantidad), 0) FROM cotizaciones_detalle WHERE idCotizacion = p_idCotizacion),
        descuento = (SELECT IFNULL(SUM(descuento * cantidad), 0) FROM cotizaciones_detalle WHERE idCotizacion = p_idCotizacion),
        total = (SELECT IFNULL(SUM(total), 0) FROM cotizaciones_detalle WHERE idCotizacion = p_idCotizacion),
        iva = 0 -- Ajusta si tienes lógica de IVA
    WHERE idCotizacion = p_idCotizacion;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `updateIdClienteDiElect` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `updateIdClienteDiElect`(IN p_idVenta BIGINT, IN p_idClienteDiElect BIGINT)
BEGIN

	UPDATE ventas SET idClienteDiElect = p_idClienteDiElect WHERE idVenta = p_idVenta;
	
	SELECT p_idVenta AS out_id, 'Cliente actualizado' AS message;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `updateObservacionesInventarioFisico` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `updateObservacionesInventarioFisico`(
    IN p_idInventarioFisico BIGINT,
    IN p_observaciones VARCHAR(500)
)
BEGIN
	-- Actualizar existente
	UPDATE inventario_fisico SET
		observaciones = p_observaciones
	WHERE idInventarioFisico = p_idInventarioFisico;
        
    SELECT 1 AS out_id, 'Se actualizó el comentario' AS message;
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `updatePedidoClienteDetallePromos` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `updatePedidoClienteDetallePromos`(
    IN p_idPedido BIGINT,
    IN jsonDetalleActual JSON
)
BEGIN
    -- Variables locales
    DECLARE i INT DEFAULT 0;
    DECLARE totalRows INT DEFAULT 0;

    DECLARE v_idPedidoDetalle BIGINT DEFAULT 0;
    DECLARE v_precioUnitario DECIMAL(18,2) DEFAULT 0;
    DECLARE v_descuento DECIMAL(18,2) DEFAULT 0;
    DECLARE v_precioConDescuento DECIMAL(18,2) DEFAULT 0;
    DECLARE v_total DECIMAL(18,2) DEFAULT 0;
    DECLARE v_aplicaPromo SMALLINT DEFAULT 0;
    DECLARE v_idPromocion BIGINT DEFAULT 0;
    DECLARE v_promoName VARCHAR(500) DEFAULT '';

    -- Cuántos registros vienen en el JSON
    SET totalRows = IFNULL(JSON_LENGTH(jsonDetalleActual), 0);
    SET i = 0;

    WHILE i < totalRows DO
        SET v_idPedidoDetalle       = IFNULL(CAST(JSON_UNQUOTE(JSON_EXTRACT(jsonDetalleActual, CONCAT('$[', i, '].idPedidoDetalle'))) AS UNSIGNED), 0);
        SET v_precioUnitario        = IFNULL(CAST(JSON_UNQUOTE(JSON_EXTRACT(jsonDetalleActual, CONCAT('$[', i, '].precioUnitario'))) AS DECIMAL(18,2)), 0);
        SET v_descuento             = IFNULL(CAST(JSON_UNQUOTE(JSON_EXTRACT(jsonDetalleActual, CONCAT('$[', i, '].descuento'))) AS DECIMAL(18,2)), 0);
        SET v_precioConDescuento    = IFNULL(CAST(JSON_UNQUOTE(JSON_EXTRACT(jsonDetalleActual, CONCAT('$[', i, '].precioConDescuento'))) AS DECIMAL(18,2)), 0);
        SET v_total                 = IFNULL(CAST(JSON_UNQUOTE(JSON_EXTRACT(jsonDetalleActual, CONCAT('$[', i, '].total'))) AS DECIMAL(18,2)), 0);
        SET v_aplicaPromo = 
          CASE 
            WHEN JSON_UNQUOTE(JSON_EXTRACT(jsonDetalleActual, CONCAT('$[', i, '].aplicaPromo'))) = 'true' THEN 1
            WHEN JSON_UNQUOTE(JSON_EXTRACT(jsonDetalleActual, CONCAT('$[', i, '].aplicaPromo'))) = 'false' THEN 0
            ELSE IFNULL(CAST(JSON_UNQUOTE(JSON_EXTRACT(jsonDetalleActual, CONCAT('$[', i, '].aplicaPromo'))) AS UNSIGNED), 0)
          END;
        SET v_idPromocion           = IFNULL(CAST(JSON_UNQUOTE(JSON_EXTRACT(jsonDetalleActual, CONCAT('$[', i, '].idPromocion'))) AS UNSIGNED), 0);
        SET v_promoName             = IFNULL(JSON_UNQUOTE(JSON_EXTRACT(jsonDetalleActual, CONCAT('$[', i, '].promoName'))), '');

        -- Actualiza solo si el pedidoDetalle existe y pertenece al pedido indicado
        IF v_idPedidoDetalle > 0 THEN
            UPDATE pedidos_clientes_detalle
            SET 
                precioUnitario      = v_precioUnitario,
                descuento           = v_descuento,
                precioConDescuento  = v_precioConDescuento,
                total               = v_total,
                aplicaPromo         = v_aplicaPromo,
                idPromocion         = v_idPromocion,
                promoName           = v_promoName
            WHERE idPedidoDetalle = v_idPedidoDetalle AND idPedido = p_idPedido;
        END IF;

        SET i = i + 1;
    END WHILE;

    -- Actualiza los totales en la tabla pedidos_clientes sumando los valores de pedidos_clientes_detalle
    UPDATE pedidos_clientes
    SET
		subtotal = (SELECT IFNULL(SUM(precioUnitario * cantidad), 0) FROM pedidos_clientes_detalle WHERE idPedido = p_idPedido),
        descuento = (SELECT IFNULL(SUM(descuento * cantidad), 0) FROM pedidos_clientes_detalle WHERE idPedido = p_idPedido),
        total = (SELECT IFNULL(SUM(total), 0) FROM pedidos_clientes_detalle WHERE idPedido = p_idPedido),
        iva = 0 -- Ajusta si tienes lógica de IVA
    WHERE idPedido = p_idPedido;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `updatePWD` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `updatePWD`(
IN p_idUser BIGINT
, IN p_pwd TEXT
)
BEGIN

	UPDATE
		users
	SET
		pwd = p_pwd
	WHERE
		idUser = p_idUser;

	SET @iRows = ( SELECT ROW_COUNT() );

	SELECT @iRows AS iRows;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `updateRol` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `updateRol`(
IN p_idRol INT
, IN p_name VARCHAR(500)
, IN p_description VARCHAR(500)
, IN p_active SMALLINT
)
BEGIN

	SET @idRol = 0;
	SET @out_id = 0;
	SET @message = '';
	
	SET @idRol = IFNULL(
	(
		SELECT
		idRol
		FROM roles
		WHERE name = p_name
		AND idRol <> p_idRol
		LIMIT 1
	)
	,0);
	
	IF @idRol = 0 THEN
	
		UPDATE
			roles
		SET
			name = p_name
			, description = p_description
			, active = p_active
		WHERE
			idRol = p_idRol;

		SET @out_id = p_idRol;
		
		SET @message = 'Rol actualizado con éxito.';
	
	ELSEIF @idRol > 0 THEN
		SET @out_id = 0;
		SET @message = 'El nombre del rol ya se está utilizando.';
	END IF;

	SELECT @out_id AS out_id, @message AS message;
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `updateStatusCotizacion` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `updateStatusCotizacion`(
    IN p_idCotizacion BIGINT,
    IN p_idCatStatusCotizaciones INT
)
BEGIN
    DECLARE mensaje_error TEXT;
    
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        -- Capturar el mensaje de error
        GET DIAGNOSTICS CONDITION 1 mensaje_error = MESSAGE_TEXT;
        SELECT 0 AS out_id, mensaje_error AS message;
    END;

    UPDATE cotizaciones
    SET idCatStatusCotizaciones = p_idCatStatusCotizaciones
    WHERE idCotizacion = p_idCotizacion;

    SELECT p_idCotizacion AS out_id, 'Estatus actualizado correctamente' AS message;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `updateStatusPedidoCliente` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `updateStatusPedidoCliente`(
IN oGetDateNow DATETIME
, IN p_idPedido BIGINT
, IN p_idCatStatusPedidosClientes BIGINT
)
BEGIN

	DECLARE v_idOrigen BIGINT DEFAULT 0;
	
	DECLARE mensaje_error TEXT;
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        -- Capturar el mensaje de error
        GET DIAGNOSTICS CONDITION 1 mensaje_error = MESSAGE_TEXT;
		SELECT 0 AS out_id, mensaje_error AS message;
    END;

	IF p_idCatStatusPedidosClientes = 3 THEN -- ENVIADO
	
		-- Obtener idOrigen
		SELECT O.idOrigen INTO v_idOrigen
		FROM origenes AS O
		INNER JOIN pedidos_clientes AS PC ON PC.idSucursal = O.idRelacion
		WHERE O.idCatRelacionOrigen = 1 -- SUCURSAL
		  AND PC.idPedido = p_idPedido
		LIMIT 1;
	
		-- VALIDO EL INVENTARIO RIGHT NOW
		IF
		(
			SELECT COUNT(*)
			FROM stock AS S
			INNER JOIN
			(
				SELECT PCD.idProducto, SUM(PCD.cantidad) AS cantidad
				FROM pedidos_clientes_detalle AS PCD
				WHERE
					PCD.idPedido = p_idPedido
				GROUP BY PCD.idProducto
			) AS P
				ON P.idProducto = S.idProducto
			WHERE
				S.idOrigen = v_idOrigen
				-- SI EL STOCK MENOS LO BLOQUEADO MENOS LA CANTIDAD NECESARIA ES MENOR A 0, QUIERE DECIR QUE NO HAY INV
				AND ( ROUND( IFNULL( S.cantidad ,0) - IFNULL( S.cantidadBlock ,0) - P.cantidad ,2) ) < 0
		) = 0 THEN
		
			-- 2. Inserta en stock_block_log cada agrupación
			INSERT INTO stock_block_log (
				createDate,
				active,
				idOrigen,
				idProducto,
				cantidad,
				idRelation,
				relationType,
				motivoDesc
			)
			SELECT 
				oGetDateNow,
				1,
				v_idOrigen,
				idProducto,
				SUM(cantidad),
				p_idPedido,
				'PedidoC',
				CONCAT('Bloqueado por el pedido #', p_idPedido)
			FROM pedidos_clientes_detalle
			WHERE idPedido = p_idPedido
			GROUP BY idProducto;

			-- 3. Actualiza stock sumando cantidadBlock por producto
			UPDATE stock s
			JOIN (
				SELECT idProducto, SUM(cantidad) AS cantidad
				FROM pedidos_clientes_detalle
				WHERE idPedido = p_idPedido
				GROUP BY idProducto
			) pcd ON s.idProducto = pcd.idProducto AND s.idOrigen = v_idOrigen
			SET s.cantidadBlock = IFNULL(s.cantidadBlock, 0) + pcd.cantidad;
			
			UPDATE
				pedidos_clientes
			SET
				idCatStatusPedidosClientes = p_idCatStatusPedidosClientes
			WHERE
				idPedido = p_idPedido;

			SELECT p_idPedido AS out_id, 'Actualizado correctamente' AS message;
			
		ELSE
		
			SELECT 0 AS out_id, 'No hay inventario suficiente' AS message;
		
		END IF;
		
		-- PARTE DONDE SE VALIDA LA PRIMER COMPRA
		
		SET @idCliente = 0;
		SET @idTipoCliente = 0;
		SET @bCompraMin = 0;
		SET @conf_valorType = '';
		SET @conf_valor = 0;
		SET @vv_cantidad = 0;
		SET @vv_total = 0;
		
		SELECT
			C.idCliente
			, IFNULL( C.idTipoCliente ,0)
			, IFNULL( C.bCompraMin ,0)
		INTO
			@idCliente
			, @idTipoCliente
			, @bCompraMin
		FROM clientes AS C
		INNER JOIN pedidos_clientes AS PC ON C.idCliente = PC.idCliente
		WHERE
			PC.idPedido = p_idPedido
		;
		
		-- 3	D Emprendedor
		-- 4	D Emprendedor Premium
		-- 6	D a Detalle
		IF @idTipoCliente IN( 3, 4, 6 ) AND @bCompraMin = 0 THEN
		
			SELECT
				C.valorType
				, C.valor
			INTO
				@conf_valorType
				, @conf_valor
			FROM conf_min_compra AS C
			WHERE
				C.idTipoCliente = @idTipoCliente
			;
			
			SELECT
				SUM( PCD.cantidad )
				, SUM( PCD.total )
			INTO
				@vv_cantidad
				, @vv_total
			FROM pedidos_clientes_detalle AS PCD
			INNER JOIN productos AS P ON P.idProducto = PCD.idProducto
			WHERE
				PCD.idPromocion > 0
				AND
				(
					@conf_valorType = 'montoVenta'
					-- SOLO LOS PRODUCTOS DE LITROS MEDIO, LITRO Y 4, ESTO PARA LAS PIEZAS
					OR ( P.idUnidadMedida = 2 && P.valorMedida IN( 0.5, 1, 4 ) )
				)
				AND PCD.idPedido = p_idPedido
			;
			
			UPDATE
				clientes
			SET
				bCompraMin =
				CASE WHEN @conf_valorType = 'cantidadUnidades' AND @vv_cantidad >= @conf_valor THEN 1
						WHEN @conf_valorType = 'montoVenta' AND @vv_total >= @conf_valor THEN 1
						ELSE 0 END
				
			WHERE idCliente = @idCliente;
			
		ELSE
			UPDATE clientes SET bCompraMin = 1 WHERE idCliente = @idCliente;
		END IF;
		
	ELSE
	
		UPDATE
			pedidos_clientes
		SET
			idCatStatusPedidosClientes = p_idCatStatusPedidosClientes
		WHERE
			idPedido = p_idPedido;

		SELECT p_idPedido AS out_id, 'Actualizado correctamente' AS message;
	
	END IF;
	
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `updateUser` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `updateUser`(
IN p_idUser BIGINT
, IN p_name VARCHAR(500)
, IN p_userName VARCHAR(500)
, IN p_idStatus SMALLINT
, IN p_active SMALLINT
)
BEGIN

	SET @idUserUserName = 0;
	SET @out_id = 0;
	SET @message = '';
	
	SET @idUserUserName = IFNULL(
	(
		SELECT
		idUser
		FROM users
		WHERE userName = p_userName
		AND idUser <> p_idUser
		LIMIT 1
	)
	,0);
	
	IF @idUserUserName = 0 THEN
	
		UPDATE
			users
		SET
			name = p_name
			, userName = p_userName
			, idStatus = p_idStatus
			, active = p_active
		WHERE
			idUser = p_idUser;

		SET @out_id = p_idUser;
		
		SET @message = 'Usuario actualizado con éxito.';
		
	ELSEIF @idUserUserName > 0 THEN
		SET @out_id = 0;
		SET @message = 'Ese usuario ya se está utilizando, intenta con otro.';
	END IF;

	SELECT @out_id AS out_id, @message AS message;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `updateVentaDetallePromos` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `updateVentaDetallePromos`(
    IN p_idVenta BIGINT,
    IN jsonDetalleActual JSON
)
BEGIN
    -- Variables locales
    DECLARE i INT DEFAULT 0;
    DECLARE totalRows INT DEFAULT 0;

    DECLARE v_idVentaDetalle BIGINT DEFAULT 0;
    DECLARE v_precioUnitario DECIMAL(18,2) DEFAULT 0;
    DECLARE v_descuento DECIMAL(18,2) DEFAULT 0;
    DECLARE v_precioConDescuento DECIMAL(18,2) DEFAULT 0;
    DECLARE v_total DECIMAL(18,2) DEFAULT 0;
    DECLARE v_aplicaPromo SMALLINT DEFAULT 0;
    DECLARE v_idPromocion BIGINT DEFAULT 0;
    DECLARE v_promoName VARCHAR(500) DEFAULT '';

    -- Cuántos registros vienen en el JSON
    SET totalRows = IFNULL(JSON_LENGTH(jsonDetalleActual), 0);
    SET i = 0;

    WHILE i < totalRows DO
        SET v_idVentaDetalle       = IFNULL(CAST(JSON_UNQUOTE(JSON_EXTRACT(jsonDetalleActual, CONCAT('$[', i, '].idVentaDetalle'))) AS UNSIGNED), 0);
        SET v_precioUnitario       = IFNULL(CAST(JSON_UNQUOTE(JSON_EXTRACT(jsonDetalleActual, CONCAT('$[', i, '].precioUnitario'))) AS DECIMAL(18,2)), 0);
        SET v_descuento            = IFNULL(CAST(JSON_UNQUOTE(JSON_EXTRACT(jsonDetalleActual, CONCAT('$[', i, '].descuento'))) AS DECIMAL(18,2)), 0);
        SET v_precioConDescuento   = IFNULL(CAST(JSON_UNQUOTE(JSON_EXTRACT(jsonDetalleActual, CONCAT('$[', i, '].precioConDescuento'))) AS DECIMAL(18,2)), 0);
        SET v_total                = IFNULL(CAST(JSON_UNQUOTE(JSON_EXTRACT(jsonDetalleActual, CONCAT('$[', i, '].total'))) AS DECIMAL(18,2)), 0);
        SET v_aplicaPromo = 
          CASE 
            WHEN JSON_UNQUOTE(JSON_EXTRACT(jsonDetalleActual, CONCAT('$[', i, '].aplicaPromo'))) = 'true' THEN 1
            WHEN JSON_UNQUOTE(JSON_EXTRACT(jsonDetalleActual, CONCAT('$[', i, '].aplicaPromo'))) = 'false' THEN 0
            ELSE IFNULL(CAST(JSON_UNQUOTE(JSON_EXTRACT(jsonDetalleActual, CONCAT('$[', i, '].aplicaPromo'))) AS UNSIGNED), 0)
          END;
        SET v_idPromocion          = IFNULL(CAST(JSON_UNQUOTE(JSON_EXTRACT(jsonDetalleActual, CONCAT('$[', i, '].idPromocion'))) AS UNSIGNED), 0);
        SET v_promoName            = IFNULL(JSON_UNQUOTE(JSON_EXTRACT(jsonDetalleActual, CONCAT('$[', i, '].promoName'))), '');

        -- Actualiza solo si el ventaDetalle existe y pertenece a la venta indicada
        IF v_idVentaDetalle > 0 THEN
            UPDATE ventasdetalle
            SET 
                precioUnitario      = v_precioUnitario,
                descuento           = v_descuento,
                precioConDescuento  = v_precioConDescuento,
                total               = v_total,
                aplicaPromo         = v_aplicaPromo,
                idPromocion         = v_idPromocion,
                promoName           = v_promoName
            WHERE idVentaDetalle = v_idVentaDetalle AND idVenta = p_idVenta;
        END IF;

        SET i = i + 1;
    END WHILE;

    -- Actualiza los totales en la tabla ventas sumando los valores de ventasdetalle
    UPDATE ventas
    SET
        subtotal = (SELECT IFNULL(SUM(precioUnitario * cantidad), 0) FROM ventasdetalle WHERE idVenta = p_idVenta),
        descuento = (SELECT IFNULL(SUM(descuento * cantidad), 0) FROM ventasdetalle WHERE idVenta = p_idVenta),
        total = (SELECT IFNULL(SUM(total), 0) FROM ventasdetalle WHERE idVenta = p_idVenta),
        pendiente = (SELECT IFNULL(SUM(total), 0) FROM ventasdetalle WHERE idVenta = p_idVenta),
        iva = 0 -- Ajusta si tienes lógica de IVA
    WHERE idVenta = p_idVenta;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-01-12 18:26:49
