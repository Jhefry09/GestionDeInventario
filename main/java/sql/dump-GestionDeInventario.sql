-- MySQL dump 10.13  Distrib 8.4.5, for Linux (x86_64)
--
-- Host: 127.0.0.1    Database: GestionDeInventario
-- ------------------------------------------------------
-- Server version	9.3.0

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `Administradores`
--

DROP TABLE IF EXISTS `Administradores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Administradores` (
  `id_administradores` int NOT NULL,
  `nombre_administrador` varchar(100) DEFAULT NULL,
  `apellido_administrador` varchar(100) DEFAULT NULL,
  `login_administrador` varchar(100) DEFAULT NULL,
  `contraseña_administrador` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id_administradores`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Administradores`
--

LOCK TABLES `Administradores` WRITE;
/*!40000 ALTER TABLE `Administradores` DISABLE KEYS */;
INSERT INTO `Administradores` VALUES (1,'jhefry','cabanillas','jhefry','0306');
/*!40000 ALTER TABLE `Administradores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Almacenamiento`
--

DROP TABLE IF EXISTS `Almacenamiento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Almacenamiento` (
  `id_almac` int NOT NULL AUTO_INCREMENT,
  `descrip_almace` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `cate_id` int DEFAULT NULL,
  `capac_almac_id` int DEFAULT NULL,
  `tipo_almac_id` int DEFAULT NULL,
  `precio_almac` int DEFAULT NULL,
  PRIMARY KEY (`id_almac`),
  KEY `Almacenamiento_Almacenamiento_capacidad_FK` (`capac_almac_id`),
  KEY `Almacenamiento_Almacenamiento_tipo_FK` (`tipo_almac_id`),
  KEY `Almacenamiento_Categoria_FK` (`cate_id`),
  CONSTRAINT `Almacenamiento_Almacenamiento_capacidad_FK` FOREIGN KEY (`capac_almac_id`) REFERENCES `Almacenamiento_capacidad` (`id_capaci_almac`),
  CONSTRAINT `Almacenamiento_Almacenamiento_tipo_FK` FOREIGN KEY (`tipo_almac_id`) REFERENCES `Almacenamiento_tipo` (`id_almacenamiento_tipo`),
  CONSTRAINT `Almacenamiento_Categoria_FK` FOREIGN KEY (`cate_id`) REFERENCES `Categoria` (`id_categoria`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Almacenamiento`
--

LOCK TABLES `Almacenamiento` WRITE;
/*!40000 ALTER TABLE `Almacenamiento` DISABLE KEYS */;
INSERT INTO `Almacenamiento` VALUES (1,'Disco Duro Seagate Barracuda 1TB 7200RPM',6,4,1,180),(2,'SSD Kingston A400 240GB SATA III',6,2,2,230),(3,'SSD Crucial BX500 500GB SATA III',6,3,2,280),(4,'Disco Duro Western Digital Blue 2TB',6,5,1,250),(5,'SSD M.2 NVMe WD Black SN770 1TB',6,4,3,460),(6,'SSD M.2 Kingston NV2 250GB',6,2,3,270),(7,'SSD Samsung 870 EVO 1TB',6,4,2,420),(8,'Disco Duro Toshiba 4TB 5400RPM',6,6,1,300),(9,'SSD M.2 Samsung 980 500GB',6,3,3,380),(10,'SSD Crucial P3 Plus 1TB M.2',6,4,3,440);
/*!40000 ALTER TABLE `Almacenamiento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Almacenamiento_capacidad`
--

DROP TABLE IF EXISTS `Almacenamiento_capacidad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Almacenamiento_capacidad` (
  `id_capaci_almac` int NOT NULL AUTO_INCREMENT,
  `desc_capac_almac` int DEFAULT NULL,
  `uni_almac_id` int DEFAULT NULL,
  PRIMARY KEY (`id_capaci_almac`),
  KEY `Almacenamiento_capacidad_Unid_almace_FK` (`uni_almac_id`),
  CONSTRAINT `Almacenamiento_capacidad_Unid_almace_FK` FOREIGN KEY (`uni_almac_id`) REFERENCES `Almacenamiento_unidades` (`id_unid`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Almacenamiento_capacidad`
--

LOCK TABLES `Almacenamiento_capacidad` WRITE;
/*!40000 ALTER TABLE `Almacenamiento_capacidad` DISABLE KEYS */;
INSERT INTO `Almacenamiento_capacidad` VALUES (1,128,1),(2,250,1),(3,500,1),(4,1,2),(5,2,2),(6,4,2);
/*!40000 ALTER TABLE `Almacenamiento_capacidad` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Almacenamiento_tipo`
--

DROP TABLE IF EXISTS `Almacenamiento_tipo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Almacenamiento_tipo` (
  `id_almacenamiento_tipo` int NOT NULL AUTO_INCREMENT,
  `desc_tipo_almac` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id_almacenamiento_tipo`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Almacenamiento_tipo`
--

LOCK TABLES `Almacenamiento_tipo` WRITE;
/*!40000 ALTER TABLE `Almacenamiento_tipo` DISABLE KEYS */;
INSERT INTO `Almacenamiento_tipo` VALUES (1,'HDD'),(2,'SSD'),(3,'M.2');
/*!40000 ALTER TABLE `Almacenamiento_tipo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Almacenamiento_unidades`
--

DROP TABLE IF EXISTS `Almacenamiento_unidades`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Almacenamiento_unidades` (
  `id_unid` int NOT NULL,
  `nombre_unid` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id_unid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Almacenamiento_unidades`
--

LOCK TABLES `Almacenamiento_unidades` WRITE;
/*!40000 ALTER TABLE `Almacenamiento_unidades` DISABLE KEYS */;
INSERT INTO `Almacenamiento_unidades` VALUES (1,'GB'),(2,'TB');
/*!40000 ALTER TABLE `Almacenamiento_unidades` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Categoria`
--

DROP TABLE IF EXISTS `Categoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Categoria` (
  `id_categoria` int NOT NULL AUTO_INCREMENT,
  `nom_cate` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id_categoria`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Categoria`
--

LOCK TABLES `Categoria` WRITE;
/*!40000 ALTER TABLE `Categoria` DISABLE KEYS */;
INSERT INTO `Categoria` VALUES (1,'laptop'),(2,'Perifericos'),(3,'Memoria Ram'),(4,'Procesador Intel'),(5,'Procesador AMD'),(6,'Almacenamiento'),(7,'Monitor'),(8,'Placa Base'),(9,'Fuente'),(10,'Disipador'),(11,'Tarjeta grafica AMD'),(12,'Tarjeta grafica Nvidia');
/*!40000 ALTER TABLE `Categoria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Disipador`
--

DROP TABLE IF EXISTS `Disipador`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Disipador` (
  `id_disipador` int NOT NULL AUTO_INCREMENT,
  `descrip_disip` varchar(100) DEFAULT NULL,
  `cate_id` int DEFAULT NULL,
  `tipo_disip_id` int DEFAULT NULL,
  `precio` int DEFAULT NULL,
  PRIMARY KEY (`id_disipador`),
  KEY `Disipador_Categoria_FK` (`cate_id`),
  KEY `Disipador_Disipador_tipo_FK` (`tipo_disip_id`),
  CONSTRAINT `Disipador_Categoria_FK` FOREIGN KEY (`cate_id`) REFERENCES `Categoria` (`id_categoria`),
  CONSTRAINT `Disipador_Disipador_tipo_FK` FOREIGN KEY (`tipo_disip_id`) REFERENCES `Disipador_tipo` (`id_disip_tipo`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Disipador`
--

LOCK TABLES `Disipador` WRITE;
/*!40000 ALTER TABLE `Disipador` DISABLE KEYS */;
INSERT INTO `Disipador` VALUES (1,'Cooler Master Hyper 212',10,2,35),(2,'Noctua NH-D15',10,2,90),(3,'Corsair H100i RGB',10,1,120),(4,'DeepCool Castle 360EX',10,1,140),(5,'be quiet! Pure Rock 2',10,2,50);
/*!40000 ALTER TABLE `Disipador` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Disipador_tipo`
--

DROP TABLE IF EXISTS `Disipador_tipo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Disipador_tipo` (
  `id_disip_tipo` int NOT NULL AUTO_INCREMENT,
  `tipo_disipador` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id_disip_tipo`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Disipador_tipo`
--

LOCK TABLES `Disipador_tipo` WRITE;
/*!40000 ALTER TABLE `Disipador_tipo` DISABLE KEYS */;
INSERT INTO `Disipador_tipo` VALUES (1,'Refrigeracion liquida'),(2,'Refrigeracion por viento');
/*!40000 ALTER TABLE `Disipador_tipo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Fuente_capacidad`
--

DROP TABLE IF EXISTS `Fuente_capacidad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Fuente_capacidad` (
  `id_capacidad_fuente` int NOT NULL AUTO_INCREMENT,
  `watts` int DEFAULT NULL,
  PRIMARY KEY (`id_capacidad_fuente`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Fuente_capacidad`
--

LOCK TABLES `Fuente_capacidad` WRITE;
/*!40000 ALTER TABLE `Fuente_capacidad` DISABLE KEYS */;
INSERT INTO `Fuente_capacidad` VALUES (1,500),(2,550),(3,600),(4,650),(5,700),(6,750),(7,800),(8,850),(9,900),(10,950),(11,1000);
/*!40000 ALTER TABLE `Fuente_capacidad` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Fuente_certificacion`
--

DROP TABLE IF EXISTS `Fuente_certificacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Fuente_certificacion` (
  `id_fuente_certificacion` int NOT NULL AUTO_INCREMENT,
  `certificacion` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id_fuente_certificacion`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Fuente_certificacion`
--

LOCK TABLES `Fuente_certificacion` WRITE;
/*!40000 ALTER TABLE `Fuente_certificacion` DISABLE KEYS */;
INSERT INTO `Fuente_certificacion` VALUES (1,'80 Plus'),(2,'80 Plus Bronze'),(3,'80 Plus Silver'),(4,'80 Plus Gold'),(5,'80 Plus Platinium'),(6,'80 Plus Titanium');
/*!40000 ALTER TABLE `Fuente_certificacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Fuente_de_Energia`
--

DROP TABLE IF EXISTS `Fuente_de_Energia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Fuente_de_Energia` (
  `id_fuente` int NOT NULL AUTO_INCREMENT,
  `descripcion_fuente` varchar(100) DEFAULT NULL,
  `cate_id` int DEFAULT NULL,
  `capacidad_fuente_id` int DEFAULT NULL,
  `certificado_fuente_id` int DEFAULT NULL,
  `precio_fuente` int DEFAULT NULL,
  `Stock_fuente` int DEFAULT NULL,
  PRIMARY KEY (`id_fuente`),
  KEY `Fuente_de_Energia_Categoria_FK` (`cate_id`),
  KEY `Fuente_de_Energia_fuente_capacidad_FK` (`capacidad_fuente_id`),
  KEY `Fuente_de_Energia_fuente_certificacion_FK` (`certificado_fuente_id`),
  CONSTRAINT `Fuente_de_Energia_Categoria_FK` FOREIGN KEY (`cate_id`) REFERENCES `Categoria` (`id_categoria`),
  CONSTRAINT `Fuente_de_Energia_fuente_capacidad_FK` FOREIGN KEY (`capacidad_fuente_id`) REFERENCES `Fuente_capacidad` (`id_capacidad_fuente`),
  CONSTRAINT `Fuente_de_Energia_fuente_certificacion_FK` FOREIGN KEY (`certificado_fuente_id`) REFERENCES `Fuente_certificacion` (`id_fuente_certificacion`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Fuente_de_Energia`
--

LOCK TABLES `Fuente_de_Energia` WRITE;
/*!40000 ALTER TABLE `Fuente_de_Energia` DISABLE KEYS */;
INSERT INTO `Fuente_de_Energia` VALUES (1,'EVGA 600W Bronze',9,3,2,55,10),(2,'Corsair RM750 Gold',9,6,4,110,8),(3,'Cooler Master 500W',9,1,1,45,15),(4,'Seasonic Focus 850W Platinum',9,8,5,160,5),(5,'Thermaltake Smart 700W',9,5,2,70,7);
/*!40000 ALTER TABLE `Fuente_de_Energia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Gama_intel`
--

DROP TABLE IF EXISTS `Gama_intel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Gama_intel` (
  `id_gama_intel` int NOT NULL AUTO_INCREMENT,
  `nom_gama_intel` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id_gama_intel`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Gama_intel`
--

LOCK TABLES `Gama_intel` WRITE;
/*!40000 ALTER TABLE `Gama_intel` DISABLE KEYS */;
INSERT INTO `Gama_intel` VALUES (1,'I3'),(2,'I5'),(3,'I7'),(4,'I9');
/*!40000 ALTER TABLE `Gama_intel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Gama_proce_amd`
--

DROP TABLE IF EXISTS `Gama_proce_amd`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Gama_proce_amd` (
  `id_gama_proce_amd` int NOT NULL AUTO_INCREMENT,
  `nom_gama_proc_amd` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id_gama_proce_amd`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Gama_proce_amd`
--

LOCK TABLES `Gama_proce_amd` WRITE;
/*!40000 ALTER TABLE `Gama_proce_amd` DISABLE KEYS */;
INSERT INTO `Gama_proce_amd` VALUES (1,'Ryzen 3'),(2,'Ryzen 5'),(3,'Ryzen 7'),(4,'Ryzen 9');
/*!40000 ALTER TABLE `Gama_proce_amd` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Generacion_proces_amd`
--

DROP TABLE IF EXISTS `Generacion_proces_amd`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Generacion_proces_amd` (
  `id_generacion_proce_amd` int NOT NULL AUTO_INCREMENT,
  `nom_gene_proce_amd` varchar(100) DEFAULT NULL,
  `nom_clave_gene_amd` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id_generacion_proce_amd`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Generacion_proces_amd`
--

LOCK TABLES `Generacion_proces_amd` WRITE;
/*!40000 ALTER TABLE `Generacion_proces_amd` DISABLE KEYS */;
INSERT INTO `Generacion_proces_amd` VALUES (1,'Segunda','Zen 2'),(2,'Tercera','Zen 3'),(3,'Cuarta','Zen 4'),(4,'Quinta','Zen 5');
/*!40000 ALTER TABLE `Generacion_proces_amd` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Generacion_procs_intel`
--

DROP TABLE IF EXISTS `Generacion_procs_intel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Generacion_procs_intel` (
  `id_gene_proc_intel` int NOT NULL AUTO_INCREMENT,
  `nombre_gene_intel` varchar(100) DEFAULT NULL,
  `nombre_clave_gene_intel` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id_gene_proc_intel`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Generacion_procs_intel`
--

LOCK TABLES `Generacion_procs_intel` WRITE;
/*!40000 ALTER TABLE `Generacion_procs_intel` DISABLE KEYS */;
INSERT INTO `Generacion_procs_intel` VALUES (1,'Decimoprimera ','Rocket Lake'),(2,'Decimosegunda','	Alder Lake'),(3,'Decimotercera','Raptor Lake'),(4,'Decimocuarta','	Raptor Lake Refresh'),(5,'Decimoquinta','	Arrow Lake');
/*!40000 ALTER TABLE `Generacion_procs_intel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Grafica_amd`
--

DROP TABLE IF EXISTS `Grafica_amd`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Grafica_amd` (
  `id_grafica_amd` int NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(100) DEFAULT NULL,
  `generacion_grafi_amd_id` int DEFAULT NULL,
  `gama_grafi_amd_id` int DEFAULT NULL,
  `cate_id` int DEFAULT NULL,
  `stock_grafi_amd` int DEFAULT NULL,
  `precio_grafi_amd` int DEFAULT NULL,
  PRIMARY KEY (`id_grafica_amd`),
  KEY `Grafica_amd_Categoria_FK` (`cate_id`),
  KEY `Grafica_amd_Grafica_amd_gama_FK` (`gama_grafi_amd_id`),
  KEY `Grafica_amd_Grafica_amd_generacion_FK` (`generacion_grafi_amd_id`),
  CONSTRAINT `Grafica_amd_Categoria_FK` FOREIGN KEY (`cate_id`) REFERENCES `Categoria` (`id_categoria`),
  CONSTRAINT `Grafica_amd_Grafica_amd_gama_FK` FOREIGN KEY (`gama_grafi_amd_id`) REFERENCES `Grafica_amd_gama` (`id_gama_amd_grafica`),
  CONSTRAINT `Grafica_amd_Grafica_amd_generacion_FK` FOREIGN KEY (`generacion_grafi_amd_id`) REFERENCES `Grafica_amd_generacion` (`id_gene_grafi_amd`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Grafica_amd`
--

LOCK TABLES `Grafica_amd` WRITE;
/*!40000 ALTER TABLE `Grafica_amd` DISABLE KEYS */;
INSERT INTO `Grafica_amd` VALUES (1,'Radeon RX 5500 XT',1,1,11,25,179),(2,'Radeon RX 5600 XT',1,2,11,20,229),(3,'Radeon RX 6600',2,2,11,18,299),(4,'Radeon RX 6700 XT',2,3,11,12,399),(5,'Radeon RX 7600',3,3,11,10,329);
/*!40000 ALTER TABLE `Grafica_amd` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Grafica_amd_gama`
--

DROP TABLE IF EXISTS `Grafica_amd_gama`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Grafica_amd_gama` (
  `id_gama_amd_grafica` int NOT NULL AUTO_INCREMENT,
  `gama_descrip` int DEFAULT NULL,
  PRIMARY KEY (`id_gama_amd_grafica`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Grafica_amd_gama`
--

LOCK TABLES `Grafica_amd_gama` WRITE;
/*!40000 ALTER TABLE `Grafica_amd_gama` DISABLE KEYS */;
INSERT INTO `Grafica_amd_gama` VALUES (1,500),(2,600),(3,700),(4,800),(5,900);
/*!40000 ALTER TABLE `Grafica_amd_gama` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Grafica_amd_generacion`
--

DROP TABLE IF EXISTS `Grafica_amd_generacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Grafica_amd_generacion` (
  `id_gene_grafi_amd` int NOT NULL AUTO_INCREMENT,
  `descrip_gene_grafi_amd` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id_gene_grafi_amd`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Grafica_amd_generacion`
--

LOCK TABLES `Grafica_amd_generacion` WRITE;
/*!40000 ALTER TABLE `Grafica_amd_generacion` DISABLE KEYS */;
INSERT INTO `Grafica_amd_generacion` VALUES (1,'RDNA 1'),(2,'RDNA 2'),(3,'RDNA 3');
/*!40000 ALTER TABLE `Grafica_amd_generacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Grafica_nvidia`
--

DROP TABLE IF EXISTS `Grafica_nvidia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Grafica_nvidia` (
  `id_grafica_nvidia` int NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(100) DEFAULT NULL,
  `generacion_grafi_nvidia_id` int DEFAULT NULL,
  `gama_grafi_nvidia_id` int DEFAULT NULL,
  `cate_id` int DEFAULT NULL,
  `stock_grafi_nvidia` int DEFAULT NULL,
  `precio_grafi_nvidia` int DEFAULT NULL,
  PRIMARY KEY (`id_grafica_nvidia`),
  KEY `Grafica_nvidia_Categoria_FK` (`cate_id`),
  KEY `Grafica_nvidia_Grafica_nvidia_gama_FK` (`gama_grafi_nvidia_id`),
  KEY `Grafica_nvidia_Grafica_nvidia_generacion_FK` (`generacion_grafi_nvidia_id`),
  CONSTRAINT `Grafica_nvidia_Categoria_FK` FOREIGN KEY (`cate_id`) REFERENCES `Categoria` (`id_categoria`),
  CONSTRAINT `Grafica_nvidia_Grafica_nvidia_gama_FK` FOREIGN KEY (`gama_grafi_nvidia_id`) REFERENCES `Grafica_nvidia_gama` (`id_gama_nvidia_grafica`),
  CONSTRAINT `Grafica_nvidia_Grafica_nvidia_generacion_FK` FOREIGN KEY (`generacion_grafi_nvidia_id`) REFERENCES `Grafica_nvidia_generacion` (`id_gene_grafi_nvidia`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Grafica_nvidia`
--

LOCK TABLES `Grafica_nvidia` WRITE;
/*!40000 ALTER TABLE `Grafica_nvidia` DISABLE KEYS */;
INSERT INTO `Grafica_nvidia` VALUES (1,'GeForce RTX 3050',1,1,12,20,229),(2,'GeForce RTX 3060',1,2,12,18,329),(3,'GeForce RTX 4060 Ti',2,2,12,15,399),(4,'GeForce RTX 4070',2,3,12,12,599),(5,'GeForce RTX 4080',2,4,12,8,999),(6,'GeForce RTX 5090',3,5,12,5,1499);
/*!40000 ALTER TABLE `Grafica_nvidia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Grafica_nvidia_gama`
--

DROP TABLE IF EXISTS `Grafica_nvidia_gama`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Grafica_nvidia_gama` (
  `id_gama_nvidia_grafica` int NOT NULL AUTO_INCREMENT,
  `gama_descrip_nvidia` int DEFAULT NULL,
  PRIMARY KEY (`id_gama_nvidia_grafica`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Grafica_nvidia_gama`
--

LOCK TABLES `Grafica_nvidia_gama` WRITE;
/*!40000 ALTER TABLE `Grafica_nvidia_gama` DISABLE KEYS */;
INSERT INTO `Grafica_nvidia_gama` VALUES (1,50),(2,60),(3,70),(4,80),(5,90);
/*!40000 ALTER TABLE `Grafica_nvidia_gama` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Grafica_nvidia_generacion`
--

DROP TABLE IF EXISTS `Grafica_nvidia_generacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Grafica_nvidia_generacion` (
  `id_gene_grafi_nvidia` int NOT NULL AUTO_INCREMENT,
  `descrip_gene_grafi_nvidia` int DEFAULT NULL,
  PRIMARY KEY (`id_gene_grafi_nvidia`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Grafica_nvidia_generacion`
--

LOCK TABLES `Grafica_nvidia_generacion` WRITE;
/*!40000 ALTER TABLE `Grafica_nvidia_generacion` DISABLE KEYS */;
INSERT INTO `Grafica_nvidia_generacion` VALUES (1,30),(2,40),(3,50);
/*!40000 ALTER TABLE `Grafica_nvidia_generacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Perifericos`
--

DROP TABLE IF EXISTS `Perifericos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Perifericos` (
  `id_perifericos` int NOT NULL,
  `descripc_perifericos` varchar(100) DEFAULT NULL,
  `tipo_perifericos_id` int DEFAULT NULL,
  `precio_perifericos` int DEFAULT NULL,
  `cate_id` int DEFAULT NULL,
  PRIMARY KEY (`id_perifericos`),
  KEY `Perifericos_Categoria_FK` (`cate_id`),
  KEY `Perifericos_Perifericos_tipo_FK` (`tipo_perifericos_id`),
  CONSTRAINT `Perifericos_Categoria_FK` FOREIGN KEY (`cate_id`) REFERENCES `Categoria` (`id_categoria`),
  CONSTRAINT `Perifericos_Perifericos_tipo_FK` FOREIGN KEY (`tipo_perifericos_id`) REFERENCES `Perifericos_tipo` (`id_tipo_perifericos`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Perifericos`
--

LOCK TABLES `Perifericos` WRITE;
/*!40000 ALTER TABLE `Perifericos` DISABLE KEYS */;
INSERT INTO `Perifericos` VALUES (1,'Audífonos Logitech G432 7.1',1,230,2),(2,'Mouse Razer DeathAdder V2',2,180,2),(3,'Teclado Redragon Kumara K552 RGB',3,150,2),(4,'Mando Xbox Series X Inalámbrico',4,280,2),(5,'Parlantes Logitech Z313 2.1',5,200,2),(6,'Cámara Logitech C920 HD Pro',6,250,2),(7,'Audífonos HyperX Cloud II',1,300,2),(8,'Mouse Logitech G203 Lightsync',2,120,2),(9,'Teclado Corsair K55 RGB PRO',3,190,2),(10,'Mando PS5 DualSense',4,270,2),(11,'Parlantes Creative Pebble V3',5,160,2),(12,'Cámara Razer Kiyo con anillo de luz',6,350,2);
/*!40000 ALTER TABLE `Perifericos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Perifericos_tipo`
--

DROP TABLE IF EXISTS `Perifericos_tipo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Perifericos_tipo` (
  `id_tipo_perifericos` int NOT NULL AUTO_INCREMENT,
  `descrip_tipo_perifericos` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  PRIMARY KEY (`id_tipo_perifericos`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Perifericos_tipo`
--

LOCK TABLES `Perifericos_tipo` WRITE;
/*!40000 ALTER TABLE `Perifericos_tipo` DISABLE KEYS */;
INSERT INTO `Perifericos_tipo` VALUES (1,'Audifonos'),(2,'Maus'),(3,'Teclado'),(4,'Mando'),(5,'Parlantes'),(6,'Camara');
/*!40000 ALTER TABLE `Perifericos_tipo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PlacaBase`
--

DROP TABLE IF EXISTS `PlacaBase`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `PlacaBase` (
  `id_placa_base` int NOT NULL AUTO_INCREMENT,
  `descri_placa_base` varchar(100) DEFAULT NULL,
  `gene_ram_id` int DEFAULT NULL,
  `cate_id` int DEFAULT NULL,
  `precio_placa_base` int DEFAULT NULL,
  `stock_placa_base` int DEFAULT NULL,
  PRIMARY KEY (`id_placa_base`),
  KEY `PlacaBase_Ram_generacion_FK` (`gene_ram_id`),
  KEY `PlacaBase_Categoria_FK` (`cate_id`),
  CONSTRAINT `PlacaBase_Categoria_FK` FOREIGN KEY (`cate_id`) REFERENCES `Categoria` (`id_categoria`),
  CONSTRAINT `PlacaBase_Ram_generacion_FK` FOREIGN KEY (`gene_ram_id`) REFERENCES `Ram_generacion` (`id_gener_ram_nom`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PlacaBase`
--

LOCK TABLES `PlacaBase` WRITE;
/*!40000 ALTER TABLE `PlacaBase` DISABLE KEYS */;
INSERT INTO `PlacaBase` VALUES (1,'ASUS Prime B460M-A',1,8,100,15),(2,'MSI B450M PRO-VDH MAX',1,8,90,10),(3,'Gigabyte B550 AORUS Elite',1,8,130,8),(4,'ASUS ROG STRIX B660-F',2,8,180,6),(5,'MSI MAG Z690 TOMAHAWK',2,8,250,5),(6,'Gigabyte Z790 AORUS Elite',2,8,290,4);
/*!40000 ALTER TABLE `PlacaBase` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ProcesadorAMD`
--

DROP TABLE IF EXISTS `ProcesadorAMD`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ProcesadorAMD` (
  `id_proce_AMD` int NOT NULL AUTO_INCREMENT,
  `categoria_id` int DEFAULT NULL,
  `gama_AMD_id` int DEFAULT NULL,
  `gener_proce_AMD_id` int DEFAULT NULL,
  `precio_proce_AMD` int DEFAULT NULL,
  `stock_proce_amd` int DEFAULT NULL,
  PRIMARY KEY (`id_proce_AMD`),
  KEY `ProcesadorAMD_Categoria_FK` (`categoria_id`),
  KEY `ProcesadorAMD_Gama_proce_amd_FK` (`gama_AMD_id`),
  KEY `ProcesadorAMD_Generacion_proces_amd_FK` (`gener_proce_AMD_id`),
  CONSTRAINT `ProcesadorAMD_Categoria_FK` FOREIGN KEY (`categoria_id`) REFERENCES `Categoria` (`id_categoria`),
  CONSTRAINT `ProcesadorAMD_Gama_proce_amd_FK` FOREIGN KEY (`gama_AMD_id`) REFERENCES `Gama_proce_amd` (`id_gama_proce_amd`),
  CONSTRAINT `ProcesadorAMD_Generacion_proces_amd_FK` FOREIGN KEY (`gener_proce_AMD_id`) REFERENCES `Generacion_proces_amd` (`id_generacion_proce_amd`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ProcesadorAMD`
--

LOCK TABLES `ProcesadorAMD` WRITE;
/*!40000 ALTER TABLE `ProcesadorAMD` DISABLE KEYS */;
INSERT INTO `ProcesadorAMD` VALUES (1,5,1,1,300,10),(2,5,2,2,450,15),(3,5,3,3,600,8),(4,5,4,4,850,5),(5,5,2,3,500,12);
/*!40000 ALTER TABLE `ProcesadorAMD` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ProcesadorIntel`
--

DROP TABLE IF EXISTS `ProcesadorIntel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ProcesadorIntel` (
  `id_proce_intel` int NOT NULL AUTO_INCREMENT,
  `categoria_id` int DEFAULT NULL,
  `gama_intel_id` int DEFAULT NULL,
  `gener_proce_intel_id` int DEFAULT NULL,
  `precio_proce_intel` int DEFAULT NULL,
  `stock_proc_intel` int DEFAULT NULL,
  PRIMARY KEY (`id_proce_intel`),
  KEY `ProcesadorIntel_Categoria_FK` (`categoria_id`),
  KEY `ProcesadorIntel_Gama_intel_FK` (`gama_intel_id`),
  KEY `ProcesadorIntel_Generacion_procs_intel_FK` (`gener_proce_intel_id`),
  CONSTRAINT `ProcesadorIntel_Categoria_FK` FOREIGN KEY (`categoria_id`) REFERENCES `Categoria` (`id_categoria`),
  CONSTRAINT `ProcesadorIntel_Gama_intel_FK` FOREIGN KEY (`gama_intel_id`) REFERENCES `Gama_intel` (`id_gama_intel`),
  CONSTRAINT `ProcesadorIntel_Generacion_procs_intel_FK` FOREIGN KEY (`gener_proce_intel_id`) REFERENCES `Generacion_procs_intel` (`id_gene_proc_intel`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ProcesadorIntel`
--

LOCK TABLES `ProcesadorIntel` WRITE;
/*!40000 ALTER TABLE `ProcesadorIntel` DISABLE KEYS */;
INSERT INTO `ProcesadorIntel` VALUES (1,4,1,1,280,10),(2,4,2,2,420,20),(3,4,3,3,570,12),(4,4,4,4,800,6),(5,4,2,5,490,9);
/*!40000 ALTER TABLE `ProcesadorIntel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Ram`
--

DROP TABLE IF EXISTS `Ram`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Ram` (
  `id_ram` int NOT NULL AUTO_INCREMENT,
  `descrip_ram` varchar(100) DEFAULT NULL,
  `capaci_ram_id` int DEFAULT NULL,
  `genera_ram_id` int DEFAULT NULL,
  `cate_id` int DEFAULT NULL,
  `precio_ram` int DEFAULT NULL,
  PRIMARY KEY (`id_ram`),
  KEY `Ram_Categoria_FK` (`cate_id`),
  KEY `Ram_Ram_capacidad_FK` (`capaci_ram_id`),
  KEY `Ram_Ram_generacion_FK` (`genera_ram_id`),
  CONSTRAINT `Ram_Categoria_FK` FOREIGN KEY (`cate_id`) REFERENCES `Categoria` (`id_categoria`),
  CONSTRAINT `Ram_Ram_capacidad_FK` FOREIGN KEY (`capaci_ram_id`) REFERENCES `Ram_capacidad` (`id_ram_capac`),
  CONSTRAINT `Ram_Ram_generacion_FK` FOREIGN KEY (`genera_ram_id`) REFERENCES `Ram_generacion` (`id_gener_ram_nom`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Ram`
--

LOCK TABLES `Ram` WRITE;
/*!40000 ALTER TABLE `Ram` DISABLE KEYS */;
INSERT INTO `Ram` VALUES (1,'Corsair Vengeance',2,1,3,70),(2,'Kingston Fury',3,1,3,90),(3,'G.Skill Trident Z',4,2,3,140),(4,'HyperX Predator',5,2,3,190),(5,'TeamGroup T-Force',3,2,3,95);
/*!40000 ALTER TABLE `Ram` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Ram_capacidad`
--

DROP TABLE IF EXISTS `Ram_capacidad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Ram_capacidad` (
  `id_ram_capac` int NOT NULL AUTO_INCREMENT,
  `capacidad_gb` int DEFAULT NULL,
  PRIMARY KEY (`id_ram_capac`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Ram_capacidad`
--

LOCK TABLES `Ram_capacidad` WRITE;
/*!40000 ALTER TABLE `Ram_capacidad` DISABLE KEYS */;
INSERT INTO `Ram_capacidad` VALUES (1,4),(2,8),(3,16),(4,32),(5,64),(6,128);
/*!40000 ALTER TABLE `Ram_capacidad` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Ram_generacion`
--

DROP TABLE IF EXISTS `Ram_generacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Ram_generacion` (
  `id_gener_ram_nom` int NOT NULL,
  `gener_ram_nom` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id_gener_ram_nom`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Ram_generacion`
--

LOCK TABLES `Ram_generacion` WRITE;
/*!40000 ALTER TABLE `Ram_generacion` DISABLE KEYS */;
INSERT INTO `Ram_generacion` VALUES (1,'DDR4'),(2,'DDR5');
/*!40000 ALTER TABLE `Ram_generacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'GestionDeInventario'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-07-02 23:14:41
