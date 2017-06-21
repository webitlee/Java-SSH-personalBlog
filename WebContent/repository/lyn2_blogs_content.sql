-- MySQL dump 10.13  Distrib 5.7.12, for Win64 (x86_64)
--
-- Host: ecs31.tomcats.pw    Database: lyn2
-- ------------------------------------------------------
-- Server version	5.5.28-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `blogs_content`
--

DROP TABLE IF EXISTS `blogs_content`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blogs_content` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `CONTENT` longtext,
  `BLOGS_ID` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `BLOGS_ID` (`BLOGS_ID`),
  KEY `FK7BB8B30B2320A162` (`BLOGS_ID`),
  CONSTRAINT `FK7BB8B30B2320A162` FOREIGN KEY (`BLOGS_ID`) REFERENCES `blogs` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blogs_content`
--

LOCK TABLES `blogs_content` WRITE;
/*!40000 ALTER TABLE `blogs_content` DISABLE KEYS */;
INSERT INTO `blogs_content` VALUES (1,'<p><img class=\"fr-fin\" data-fr-image-preview=\"false\" alt=\"Image title\" src=\"/myBlogs/image/1495090605137.jpg\" width=\"300\"></p><p><br></p>',1),(2,'<p>11111<img class=\"fr-fin\" data-fr-image-preview=\"false\" alt=\"Image title\" src=\"/myBlogs/image/1495090619231.jpg\" width=\"300\"></p><p><br></p>',2),(3,'<p>一.文件上传：SpringMVC为文件上传提供了直接的支持，这种支持通过即插即用的MultipartResolver实现的。<a href=\"http://lib.csdn.net/base/javaee\" target=\"_blank\" title=\"Java EE知识库\" style=\"line-height: 16.8px; background-color: rgb(255, 255, 255);\">spring</a>实现了一个MultipartResolver实现类,CommonsMultipartResovler。<br></p><pre><span data-fr-verified=\"true\">1.SpringMVC上下文中默认没有装配MultipartResolver,因此默认情况下不能处理文件的上传工作，如果想使用Spring的文件上传功能，需要在上下文中配置MultipartResolver<br>2.使用文件上传流程：<br>（1）导入commons-fileupload-1.3.2.jar及commons-io-2.5.jar<br>（2）springmvc.xml文件中加入如下配置：</span></pre><p><img class=\"fr-fin\" data-fr-image-preview=\"false\" alt=\"Image title\" src=\"/myBlogs/image/1495364178554.png\" width=\"300\"></p><p><br></p><p><br></p>',3);
/*!40000 ALTER TABLE `blogs_content` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-06-21  9:51:44
