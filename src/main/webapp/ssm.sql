/*
SQLyog Ultimate v12.09 (64 bit)
MySQL - 8.0.17 : Database - ssm
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`ssm` /*!40100 DEFAULT CHARACTER SET utf8 */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `ssm`;

/*Table structure for table `cart` */

DROP TABLE IF EXISTS `cart`;

CREATE TABLE `cart` (
  `uid` int(3) DEFAULT NULL,
  `cid` int(3) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`cid`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

/*Data for the table `cart` */

insert  into `cart`(`uid`,`cid`) values (17,5);

/*Table structure for table `cart_item` */

DROP TABLE IF EXISTS `cart_item`;

CREATE TABLE `cart_item` (
  `cid` int(3) NOT NULL,
  `pid` int(5) DEFAULT NULL,
  `quntity` int(2) DEFAULT NULL,
  PRIMARY KEY (`cid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `cart_item` */

/*Table structure for table `category_` */

DROP TABLE IF EXISTS `category_`;

CREATE TABLE `category_` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

/*Data for the table `category_` */

insert  into `category_`(`id`,`name`) values (1,'category1'),(2,'category2'),(3,'category3'),(4,'category4'),(5,'category5');

/*Table structure for table `oder` */

DROP TABLE IF EXISTS `oder`;

CREATE TABLE `oder` (
  `uid` int(3) NOT NULL,
  `pid` int(5) DEFAULT NULL,
  `quantity` int(2) DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `oder` */

/*Table structure for table `product` */

DROP TABLE IF EXISTS `product`;

CREATE TABLE `product` (
  `pid` int(5) NOT NULL AUTO_INCREMENT,
  `name` varchar(60) DEFAULT NULL,
  `price` int(10) DEFAULT NULL,
  `stock` int(10) DEFAULT NULL,
  `sales` int(10) DEFAULT NULL,
  PRIMARY KEY (`pid`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

/*Data for the table `product` */

insert  into `product`(`pid`,`name`,`price`,`stock`,`sales`) values (1,'puma彪马官方儿童休闲鞋 儿童潮鞋',99,NULL,NULL),(2,'瑞士米高micro g-bike+ chopper儿童平衡车二轮自行车',99,NULL,NULL),(3,'李宁休闲鞋2019新款男子经典休闲鞋潮流低帮板鞋小白鞋',99,NULL,NULL),(4,'男鞋秋季潮鞋2019新款韩版潮流板鞋运动休闲鞋个性百搭鞋子男潮鞋',99,NULL,NULL);

/*Table structure for table `review` */

DROP TABLE IF EXISTS `review`;

CREATE TABLE `review` (
  `pid` int(5) NOT NULL,
  `cid` int(3) DEFAULT NULL,
  `content` varchar(200) DEFAULT NULL,
  `date` date DEFAULT NULL,
  PRIMARY KEY (`pid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `review` */

/*Table structure for table `student` */

DROP TABLE IF EXISTS `student`;

CREATE TABLE `student` (
  `stuno` int(20) NOT NULL,
  `stuname` varchar(20) DEFAULT NULL,
  `stuage` int(10) DEFAULT NULL,
  PRIMARY KEY (`stuno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `student` */

/*Table structure for table `user` */

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `uid` int(3) NOT NULL AUTO_INCREMENT,
  `username` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `pwd` varchar(20) DEFAULT NULL,
  `admin` int(1) DEFAULT '0',
  PRIMARY KEY (`uid`,`username`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

/*Data for the table `user` */

insert  into `user`(`uid`,`username`,`pwd`,`admin`) values (1,'zs','23',0),(3,'ls','24',0),(17,'ll','26',0);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
