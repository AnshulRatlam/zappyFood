/*
SQLyog Ultimate v9.02 
MySQL - 5.0.24-community-nt : Database - foodecom
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`foodecom` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `foodecom`;

/*Table structure for table `admin` */

DROP TABLE IF EXISTS `admin`;

CREATE TABLE `admin` (
  `aid` varchar(255) NOT NULL,
  `pasw` varchar(255) default NULL,
  PRIMARY KEY  (`aid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `admin` */

insert  into `admin`(`aid`,`pasw`) values ('admin','admin');

/*Table structure for table `cust_signup` */

DROP TABLE IF EXISTS `cust_signup`;

CREATE TABLE `cust_signup` (
  `cust_id` int(11) NOT NULL auto_increment,
  `fname` varchar(255) default NULL,
  `lname` varchar(255) default NULL,
  `pass` varchar(255) default NULL,
  `mobile` bigint(20) default NULL,
  `email` varchar(255) default NULL,
  `adress` varchar(255) default NULL,
  PRIMARY KEY  (`cust_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `cust_signup` */

insert  into `cust_signup`(`cust_id`,`fname`,`lname`,`pass`,`mobile`,`email`,`adress`) values (1,'chyan','nagar','ujjain',9090909090,'chyan@gmail.com','ujjain'),(2,'Chayan','Nagar','chayan1234',99109100101,'chayan@gmail.com','Ujjan');

/*Table structure for table `itemcollection` */

DROP TABLE IF EXISTS `itemcollection`;

CREATE TABLE `itemcollection` (
  `Sno` int(11) NOT NULL auto_increment,
  `Category` varchar(255) default NULL,
  `Product_name` varchar(255) default NULL,
  `price` double default NULL,
  `Discription` text,
  `image` varchar(255) default NULL,
  PRIMARY KEY  (`Sno`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `itemcollection` */

insert  into `itemcollection`(`Sno`,`Category`,`Product_name`,`price`,`Discription`,`image`) values (7,'ready to cook','BROWNIE',199,' Nothing beats the blues better than the good ol? chocolate brownie. And when it is a Zappy brownie, joy knows no bounds. Soft, chocolaty and yummy... what more can you want from life! ','68142pro (25).png'),(8,'ready to cook','METHI THEPLA',45,'From Fafda jalebi to undhiyu and thepla, Gujrati delicacies are loved throughout the world. Zappy brings you Methi Thepla right from the flavour of Gujrat. The thoughtful combination of flour, methi, and spices gives it an inviting aroma and an irresistible flavour and texture. You have to try it to believe it.','86305pro (7).png'),(9,'ready to drink','NARIYAL PAANI',10,'Till now the only way you drank coconut water was from a coconut. Well, we made it into something even better. Presenting, Zappy Nariyal Paani, it?s just like drinking from a real coconut!','37745Coconut.png'),(10,'ready to drink','AAM PANNA',10,'A chilled glass of Aam Panna, that?s how people from north India beat the heat. Thankfully you don?t have to wait for summer, just open a Zappy Aam Panna pack and enjoy it whenever you want!   ','68241pro (23).png'),(11,'ready to drink','GANNE KA RAS',10,'Sweet and delicious, the Zappy Ganne Ka Ras is something that you will enjoy till the last drop. Made with real sugarcane, you won?t believe it until you try it!','91229pro (31).png'),(12,'ready to drink','NIMBU PAANI',10,'When the day is too hot to carry on, keep calm and open a Zappy Nimbu Paani pack. A single sip and you?ll feel refreshed the whole day.','70143nimbu-paani.png'),(13,'ready to eat','indori-poha-detail',30,'A perfect balance of spices, flavored with fennel, jeweled with pomegranate and a hint of sweetness lends a unique touch to this dish. Try Zappy Instant Poha Mix with sev and jeeravan and it will work almost like a magic!','59157pro (1).png'),(14,'ready to cook','CHOCOLATE CAKE',99,'Chocolate and Zappy... is a match made in heaven. Soft, rich and creamy Chocolate Cake that simply melts in the mouth with every bite.','97518pro (26).png'),(15,'ready to cook','DAHI VADA',75,'When your tongue tickles for some excitement, treat it to Zappy?s chatpata Dahi Vada. Sweet and sour, with a sprinkling of spice?. this delicious snack is a foodie?s delight!','86077pro (29).png'),(16,'ready to cook','KHAMAN DHOKLA',40,'One bite of the delicious Zappy Khaman Dhokla and you\'ll be singing Dholida Dholida in sheer delight. Soft, spongy and tasty Dhoklas in minutes; serve it with love and enjoy the compliments.','78820pro (2).png'),(17,'ready to cook','Masala Idli',45,'Zappy Masala Idli is an interesting variation of the South Indian breakfast with veggies, spices and seasoning soft, spongy, steamed food that can be made in an instant and taste the best ever.','56353pro (6).png'),(18,'ready to eat','MANGO CHUTNEY',20,'Mango lovers? rejoice! You can now enjoy your Aam Chutney in any season and for any reason. Sweet and tangy Zappy Aam Chutney is as yummy as it looks.','72638pro (4).png'),(19,'ready to eat','Upma',30,'Ready in a jiffy, Zappy Upma is a healthy snack you can whip up for breakfast, supper, or just any time of the day. The combination of Semolina, Vegetables and spices will linger in your taste buds, making your meal all the more interesting.','84050Upma_0x170.png'),(20,'ready to eat','Sabudana Khichdi',30,'Looking for something that fills your tummy and enrgises you for the rest of the day then you should try Zappy Sabudana Khichdi. The Sago (Sabudana) with nutty peanuts, the slight sweet-spicy combo from the sugar and chilies, a light tanginess from the lemon and abundant of freshness from the herbs makes up for a satisfying meal.','54068pro (18).png'),(21,'ready to eat','Multigrain Sweet Daliya',30,'A light Indian breakfast and multigrain-nutrient meal that is loaded with the sweetness without any compromise on taste. Zappy Sweet Dalia is sure to fill your tummy anytime and energise you for the rest of the day.','44431pro (5).png');

/*Table structure for table `orderplace` */

DROP TABLE IF EXISTS `orderplace`;

CREATE TABLE `orderplace` (
  `oid` int(11) NOT NULL auto_increment,
  `pid` int(11) default NULL,
  `quantity` int(11) default NULL,
  `price` bigint(20) default NULL,
  `user` varchar(255) default NULL,
  `address` text,
  `status` int(11) default '0',
  `Date` varchar(255) default NULL,
  PRIMARY KEY  (`oid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `orderplace` */

insert  into `orderplace`(`oid`,`pid`,`quantity`,`price`,`user`,`address`,`status`,`Date`) values (58,14,1,99,'chyan','ratlam',0,'2019-01-17:11-44-20'),(59,15,1,75,'chyan','ratlam',0,'2019/01/17-11:46:02'),(60,14,3,99,'Anshul','hhh',2,'2019/01/17-12:46:03'),(62,14,1,99,'chyan','Ujjain',1,'2019/01/17-13:31:24');

/*Table structure for table `view_cart` */

DROP TABLE IF EXISTS `view_cart`;

CREATE TABLE `view_cart` (
  `cid` int(11) NOT NULL auto_increment,
  `pid` int(11) default NULL,
  `quantity` int(11) default NULL,
  `user` varchar(255) default NULL,
  PRIMARY KEY  (`cid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `view_cart` */

insert  into `view_cart`(`cid`,`pid`,`quantity`,`user`) values (8,14,1,'admin'),(19,14,1,'chyan'),(20,15,1,'chyan');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
