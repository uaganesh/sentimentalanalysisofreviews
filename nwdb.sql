/*
SQLyog Community v13.0.1 (64 bit)
MySQL - 5.5.20-log : Database - productreview
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`productreview` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `productreview`;

/*Table structure for table `complaint` */

DROP TABLE IF EXISTS `complaint`;

CREATE TABLE `complaint` (
  `c_id` int(11) NOT NULL AUTO_INCREMENT,
  `lid` int(11) DEFAULT NULL,
  `complaint` varchar(20) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `reply` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`c_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

/*Data for the table `complaint` */

insert  into `complaint`(`c_id`,`lid`,`complaint`,`date`,`reply`) values 
(1,6,'issues detected...','2022-05-08','pending'),
(2,6,'issues found','2022-05-09','pending');

/*Table structure for table `feedback` */

DROP TABLE IF EXISTS `feedback`;

CREATE TABLE `feedback` (
  `feed_id` int(11) NOT NULL AUTO_INCREMENT,
  `lid` int(11) DEFAULT NULL,
  `feedback` tinytext,
  `date` date DEFAULT NULL,
  PRIMARY KEY (`feed_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

/*Data for the table `feedback` */

insert  into `feedback`(`feed_id`,`lid`,`feedback`,`date`) values 
(1,6,'Awesome!!!!\r\nGood working','2022-05-08'),
(2,6,'good','2022-05-09');

/*Table structure for table `login` */

DROP TABLE IF EXISTS `login`;

CREATE TABLE `login` (
  `lid` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  `utype` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`lid`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

/*Data for the table `login` */

insert  into `login`(`lid`,`username`,`password`,`utype`) values 
(1,'admin','admin','admin'),
(6,'abcd@gmail.com','abcd','user'),
(7,'sree@gmail.com','sree','user');

/*Table structure for table `product` */

DROP TABLE IF EXISTS `product`;

CREATE TABLE `product` (
  `pid` int(11) NOT NULL AUTO_INCREMENT,
  `product_name` varchar(50) DEFAULT NULL,
  `image` varchar(50) DEFAULT NULL,
  `quantity` varchar(50) DEFAULT NULL,
  `description` tinytext,
  `price` int(11) DEFAULT NULL,
  `fliplink` text,
  `amazonlink` text,
  PRIMARY KEY (`pid`)
) ENGINE=InnoDB AUTO_INCREMENT=69 DEFAULT CHARSET=latin1;

/*Data for the table `product` */

insert  into `product`(`pid`,`product_name`,`image`,`quantity`,`description`,`price`,`fliplink`,`amazonlink`) values 
(19,'Samsung Galaxy M21','samsung-galaxy-m21.jpeg','2','48MP Main Camera,20MP front facing camera, capacitive touchscreen',14000,'https://www.flipkart.com/samsung-galaxy-m21-raven-black-64-gb/product-reviews/itm771ab543df368?pid=MOBFSF867ET7DDMZ&lid=LSTMOBFSF867ET7DDMZH9SHSE&marketplace=FLIPKART','https://www.amazon.in/Samsung-Galaxy-Raven-Black-Storage/product-reviews/B07HGH8D2R/ref=cm_cr_dp_d_show_all_btm?ie=UTF8&reviewerType=all_reviews'),
(22,'boAt Speakers','boat-stone.jpeg','2','Can offer up to 8 hours of playback.',3500,'https://www.flipkart.com/boat-stone-grenade-5-w-portable-bluetooth-speaker/product-reviews/itm0f38c2f530da5?pid=ACCFDBFR9ZCZTDGJ&lid=LSTACCFDBFR9ZCZTDGJUKDA7E&marketplace=FLIPKART','https://www.amazon.in/Boat-Stone-250-Bluetooth-Speaker/product-reviews/B08SMJT55F/ref=cm_cr_dp_d_show_all_btm?ie=UTF8&reviewerType=all_reviews'),
(32,'Titan Analog Watch','download.jpg','2','Genuine Titan product',5000,'https://www.flipkart.com/titan-nn2608wm01-raga-viva-2-analog-watch-women/product-reviews/itm989ab6a49a2a4?pid=WATF8AA7FSAY4GGU&lid=LSTWATF8AA7FSAY4GGURZXM8Q&marketplace=FLIPKART','https://www.amazon.in/Titan-Karishma-Analog-Champagne-Watch-2598YM01/product-reviews/B07CR1JQBY/ref=cm_cr_dp_d_show_all_btm?ie=UTF8&reviewerType=all_reviews'),
(36,'Whirlpool  Star Split Inverter AC','ac.jpeg','1','Advanced inverter technology adapts to your cooling needs, while saving on energy.',34000,'https://www.flipkart.com/whirlpool-1-5-ton-5-star-split-inverter-ac-white/product-reviews/itmf8fb8a675505d?pid=ACNFU3XZGH3MDEWP&lid=LSTACNFU3XZGH3MDEWPN0JQZ2&marketplace=FLIPKART','https://www.amazon.in/Whirlpool-1-5T-MAGICOOL-PRO-COPR/product-reviews/B07P6FV9XV/ref=cm_cr_dp_d_show_all_btm?ie=UTF8&reviewerType=all_reviews'),
(41,'Philips  Hair Dryer','dryer.jpg','1','Advanced concentrator technology with quick-heat head.',1540,'https://www.flipkart.com/philips-hp8100-46-hair-dryer/product-reviews/itmfhbrgkk38zkfz?pid=HDRDW3SEFGZ6BCTG&lid=LSTHDRDW3SEFGZ6BCTGRVLUMQ&marketplace=FLIPKART','https://www.amazon.in/Philips-HP8100-46-Dryer-Purple/product-reviews/B00KCD8NFY/ref=cm_cr_dp_d_show_all_btm?ie=UTF8&reviewerType=all_reviews'),
(45,'BP Checking instrument','bpmonitor.jpg','1','Latest digital blood pressure machine',1749,'https://www.flipkart.com/carent-bp-71-fully-automatic-upper-arm-digital-bp-checking-instrument-blood-pressure-machine-doctor-home-use-monitor-usb-port/product-reviews/itm6b3013608e25b?pid=BPMFST5EQYBKSUDB&lid=LSTBPMFST5EQYBKSUDBNURVAL&marketplace=FLIPKART','https://www.amazon.in/BPL-Medical-Technologies-120-B18/product-reviews/B084CHM6Y7/ref=cm_cr_dp_d_show_all_btm?ie=UTF8&reviewerType=all_reviews'),
(52,'Computer Accessories','router.jpg','1','enjoy high-speed connection while you are browsing the Internet, streaming HD videos or playing online games.',900,'https://www.flipkart.com/tp-link-tl-wr841n-300mbps-wireless-n-router/product-reviews/itmf48vgyfyx8m4f?pid=RTRD7HN3JJYF6WN2&lid=LSTRTRD7HN3JJYF6WN20ZITXQ&marketplace=FLIPKART','https://www.amazon.in/Resonate-RouterUPS-CRU12V2-Backup-Router/product-reviews/B017NC2IPM/ref=cm_cr_dp_d_show_all_btm?ie=UTF8&reviewerType=all_reviews'),
(56,'zeaaa','yy.jpg','2','vbcxcbx',1000,'https://www.flipkart.com/daevish-women-maxi-maroon-dress/product-reviews/itm5fcd27174ed11?pid=DREG89K72K3NTF3J&lid=LSTDREG89K72K3NTF3JEV9XOA&marketplace=FLIPKART','https://www.amazon.in/VIER-Womens-Maroon-Cotton-T-Shirt/product-reviews/B097LSLRFW/ref=cm_cr_dp_d_show_all_btm?ie=UTF8&reviewerType=all_reviews'),
(57,'maxy dress','aa.jpg','3','aDAW',2333,'https://www.flipkart.com/daevish-women-maxi-maroon-dress/product-reviews/itm5fcd27174ed11?pid=DREG89K72K3NTF3J&lid=LSTDREG89K72K3NTF3JEV9XOA&marketplace=FLIPKART','https://www.amazon.in/VIER-Womens-Maroon-Cotton-T-Shirt/product-reviews/B097LSLRFW/ref=cm_cr_dp_d_show_all_btm?ie=UTF8&reviewerType=all_reviews'),
(58,'Q','abb.jpeg','2','WEQ',30000,'https://www.flipkart.com/daevish-women-maxi-maroon-dress/product-reviews/itm5fcd27174ed11?pid=DREG89K72K3NTF3J&lid=LSTDREG89K72K3NTF3JEV9XOA&marketplace=FLIPKART','https://www.amazon.in/VIER-Womens-Maroon-Cotton-T-Shirt/product-reviews/B097LSLRFW/ref=cm_cr_dp_d_show_all_btm?ie=UTF8&reviewerType=all_reviews'),
(59,'hgfg','yy.jpg','2','asda',2333,'https://www.flipkart.com/daevish-women-maxi-maroon-dress/product-reviews/itm5fcd27174ed11?pid=DREG89K72K3NTF3J&lid=LSTDREG89K72K3NTF3JEV9XOA&marketplace=FLIPKART','https://www.flipkart.com/daevish-women-maxi-maroon-dress/product-reviews/itm5fcd27174ed11?pid=DREG89K72K3NTF3J&lid=LSTDREG89K72K3NTF3JEV9XOA&marketplace=FLIPKART'),
(61,'watchhhh','b.png','2','asdas',2333,'https://www.flipkart.com/samsung-galaxy-m21-raven-black-64-gb/product-reviews/itm771ab543df368?pid=MOBFSF867ET7DDMZ&lid=LSTMOBFSF867ET7DDMZH9SHSE&marketplace=FLIPKART','https://www.flipkart.com/samsung-galaxy-m21-raven-black-64-gb/product-reviews/itm771ab543df368?pid=MOBFSF867ET7DDMZ&lid=LSTMOBFSF867ET7DDMZH9SHSE&marketplace=FLIPKART'),
(63,'yooop','ax.webp','3','gfhg',2333,'https://www.flipkart.com/samsung-galaxy-m21-raven-black-64-gb/product-reviews/itm771ab543df368?pid=MOBFSF867ET7DDMZ&lid=LSTMOBFSF867ET7DDMZH9SHSE&marketplace=FLIPKART','https://www.flipkart.com/samsung-galaxy-m21-raven-black-64-gb/product-reviews/itm771ab543df368?pid=MOBFSF867ET7DDMZ&lid=LSTMOBFSF867ET7DDMZH9SHSE&marketplace=FLIPKART'),
(64,'sdfsdf','yy.jpg','4','asdfasf',234,'https://www.flipkart.com/samsung-galaxy-m21-raven-black-64-gb/product-reviews/itm771ab543df368?pid=MOBFSF867ET7DDMZ&lid=LSTMOBFSF867ET7DDMZH9SHSE&marketplace=FLIPKART','https://www.flipkart.com/samsung-galaxy-m21-raven-black-64-gb/product-reviews/itm771ab543df368?pid=MOBFSF867ET7DDMZ&lid=LSTMOBFSF867ET7DDMZH9SHSE&marketplace=FLIPKART'),
(65,'adeasd','aa.jpg','5','asdfas',555,'https://www.flipkart.com/boat-stone-grenade-5-w-portable-bluetooth-speaker/product-reviews/itm0f38c2f530da5?pid=ACCFDBFR9ZCZTDGJ&lid=LSTACCFDBFR9ZCZTDGJUKDA7E&marketplace=FLIPKART','https://www.flipkart.com/boat-stone-grenade-5-w-portable-bluetooth-speaker/product-reviews/itm0f38c2f530da5?pid=ACCFDBFR9ZCZTDGJ&lid=LSTACCFDBFR9ZCZTDGJUKDA7E&marketplace=FLIPKART'),
(66,'sdfsd','icon.jpg','5','sefsd',343,'https://www.flipkart.com/samsung-galaxy-m21-raven-black-64-gb/product-reviews/itm771ab543df368?pid=MOBFSF867ET7DDMZ&lid=LSTMOBFSF867ET7DDMZH9SHSE&marketplace=FLIPKART','https://www.flipkart.com/samsung-galaxy-m21-raven-black-64-gb/product-reviews/itm771ab543df368?pid=MOBFSF867ET7DDMZ&lid=LSTMOBFSF867ET7DDMZH9SHSE&marketplace=FLIPKART'),
(67,'aaaa','abc.jpg','2','sdas',345,'https://www.flipkart.com/samsung-galaxy-m21-raven-black-64-gb/product-reviews/itm771ab543df368?pid=MOBFSF867ET7DDMZ&lid=LSTMOBFSF867ET7DDMZH9SHSE&marketplace=FLIPKART','https://www.flipkart.com/samsung-galaxy-m21-raven-black-64-gb/product-reviews/itm771ab543df368?pid=MOBFSF867ET7DDMZ&lid=LSTMOBFSF867ET7DDMZH9SHSE&marketplace=FLIPKART'),
(68,'neema','aaa.webp','5','ghfhgf',890,'https://www.flipkart.com/samsung-galaxy-m21-raven-black-64-gb/product-reviews/itm771ab543df368?pid=MOBFSF867ET7DDMZ&lid=LSTMOBFSF867ET7DDMZH9SHSE&marketplace=FLIPKART','https://www.flipkart.com/samsung-galaxy-m21-raven-black-64-gb/product-reviews/itm771ab543df368?pid=MOBFSF867ET7DDMZ&lid=LSTMOBFSF867ET7DDMZH9SHSE&marketplace=FLIPKART');

/*Table structure for table `product_url` */

DROP TABLE IF EXISTS `product_url`;

CREATE TABLE `product_url` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product` text,
  `url` text,
  `uid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

/*Data for the table `product_url` */

insert  into `product_url`(`id`,`product`,`url`,`uid`) values 
(1,'Samsung Galaxy M21','https://www.flipkart.com/samsung-galaxy-m21-raven-black-64-gb/product-reviews/itm771ab543df368?pid=MOBFSF867ET7DDMZ&lid=LSTMOBFSF867ET7DDMZH9SHSE&marketplace=FLIPKART',0),
(2,'Samsung Galaxy M21','https://www.flipkart.com/samsung-galaxy-m21-raven-black-64-gb/product-reviews/itm771ab543df368?pid=MOBFSF867ET7DDMZ&lid=LSTMOBFSF867ET7DDMZH9SHSE&marketplace=FLIPKART',6),
(3,'boAt Speakers','https://www.flipkart.com/boat-stone-grenade-5-w-portable-bluetooth-speaker/product-reviews/itm0f38c2f530da5?pid=ACCFDBFR9ZCZTDGJ&lid=LSTACCFDBFR9ZCZTDGJUKDA7E&marketplace=FLIPKART',6);

/*Table structure for table `recommendation` */

DROP TABLE IF EXISTS `recommendation`;

CREATE TABLE `recommendation` (
  `rec_id` int(11) NOT NULL AUTO_INCREMENT,
  `c_id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`rec_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `recommendation` */

/*Table structure for table `registration` */

DROP TABLE IF EXISTS `registration`;

CREATE TABLE `registration` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lid` int(11) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `phone` bigint(20) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

/*Data for the table `registration` */

insert  into `registration`(`id`,`lid`,`name`,`phone`,`email`) values 
(1,2,'cat',9946540378,'cat@gmail.com'),
(5,6,'abcd',9946540378,'abcd@gmail.com'),
(6,7,'sree',9978909087,'sree@gmail.com');

/*Table structure for table `review` */

DROP TABLE IF EXISTS `review`;

CREATE TABLE `review` (
  `review_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) DEFAULT NULL,
  `review` text,
  `rating` float DEFAULT NULL,
  PRIMARY KEY (`review_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

/*Data for the table `review` */

insert  into `review`(`review_id`,`product_id`,`review`,`rating`) values 
(1,1,'GoodmobileandbatteryperformanceisbetterCameraqualityisalsogoodbutnoSiliconecaseintheboxandtherearenophonewithmobileGOODMOBILE',3.905),
(2,2,'GoodmobileandbatteryperformanceisbetterCameraqualityisalsogoodbutnoSiliconecaseintheboxandtherearenophonewithmobileGOODMOBILE',3.905),
(3,3,'OneofthebestproductinthispricesoundqualityisawesomeandlovelypanchibassIloveboAtproduct',2.605);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
