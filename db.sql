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
  `product_id` int(11) DEFAULT NULL,
  `complaint` varchar(20) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `reply` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`c_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

/*Data for the table `complaint` */

insert  into `complaint`(`c_id`,`lid`,`product_id`,`complaint`,`date`,`reply`) values 
(1,0,0,'bad',NULL,NULL),
(3,0,0,'not gud',NULL,NULL),
(4,0,0,'best',NULL,NULL),
(5,0,0,'waste',NULL,NULL),
(6,0,0,'not long lasting',NULL,NULL),
(7,6,22,'not good','2021-05-15','saved details'),
(8,6,19,'not in good conditio','2021-05-19','pending'),
(9,8,36,'Does not have better','2021-05-28','Updated the product ');

/*Table structure for table `feedback` */

DROP TABLE IF EXISTS `feedback`;

CREATE TABLE `feedback` (
  `feed_id` int(11) NOT NULL AUTO_INCREMENT,
  `lid` int(11) DEFAULT NULL,
  `feedback` tinytext,
  `date` date DEFAULT NULL,
  PRIMARY KEY (`feed_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

/*Data for the table `feedback` */

insert  into `feedback`(`feed_id`,`lid`,`feedback`,`date`) values 
(1,6,'good website','2021-05-18'),
(2,6,'loved your website','2021-05-19'),
(3,6,'This Is a very useful website ','2021-05-19'),
(4,8,'Thanks for the service easy to judge products','2021-05-30');

/*Table structure for table `login` */

DROP TABLE IF EXISTS `login`;

CREATE TABLE `login` (
  `lid` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  `utype` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`lid`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

/*Data for the table `login` */

insert  into `login`(`lid`,`username`,`password`,`utype`) values 
(1,'admin','admin','admin'),
(6,'abcd@gmail.com','abcd','user'),
(8,'devika@gmail.com','devika','user'),
(9,'cat@gmail.com','riya','user');

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
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=latin1;

/*Data for the table `product` */

insert  into `product`(`pid`,`product_name`,`image`,`quantity`,`description`,`price`,`fliplink`,`amazonlink`) values 
(22,'boAt Speakers','boat-stone.jpeg','5','Can offer up to 8 hours of playback.',3500,'https://www.flipkart.com/boat-stone-grenade-5-w-portable-bluetooth-speaker/product-reviews/itm0f38c2f530da5?pid=ACCFDBFR9ZCZTDGJ&lid=LSTACCFDBFR9ZCZTDGJUKDA7E&marketplace=FLIPKART','https://www.amazon.in/Boat-Stone-250-Bluetooth-Speaker/product-reviews/B08SMJT55F/ref=cm_cr_dp_d_show_all_btm?ie=UTF8&reviewerType=all_reviews'),
(32,'Titan Analog Watch','download.jpg','2','Genuine Titan product',5000,'https://www.flipkart.com/titan-nn2608wm01-raga-viva-2-analog-watch-women/product-reviews/itm989ab6a49a2a4?pid=WATF8AA7FSAY4GGU&lid=LSTWATF8AA7FSAY4GGURZXM8Q&marketplace=FLIPKART','https://www.amazon.in/Titan-Karishma-Analog-Champagne-Watch-2598YM01/product-reviews/B07CR1JQBY/ref=cm_cr_dp_d_show_all_btm?ie=UTF8&reviewerType=all_reviews'),
(36,'Whirlpool  Star Split Inverter AC','ac.jpeg','1','Advanced inverter technology adapts to your cooling needs, while saving on energy.',34000,'https://www.flipkart.com/whirlpool-1-5-ton-5-star-split-inverter-ac-white/product-reviews/itmf8fb8a675505d?pid=ACNFU3XZGH3MDEWP&lid=LSTACNFU3XZGH3MDEWPN0JQZ2&marketplace=FLIPKART','https://www.amazon.in/Whirlpool-1-5T-MAGICOOL-PRO-COPR/product-reviews/B07P6FV9XV/ref=cm_cr_dp_d_show_all_btm?ie=UTF8&reviewerType=all_reviews'),
(41,'Philips  Hair Dryer','dryer.jpg','1','Advanced concentrator technology with quick-heat head.',1540,'https://www.flipkart.com/philips-hp8100-46-hair-dryer/product-reviews/itmfhbrgkk38zkfz?pid=HDRDW3SEFGZ6BCTG&lid=LSTHDRDW3SEFGZ6BCTGRVLUMQ&marketplace=FLIPKART','https://www.amazon.in/Philips-HP8100-46-Dryer-Purple/product-reviews/B00KCD8NFY/ref=cm_cr_dp_d_show_all_btm?ie=UTF8&reviewerType=all_reviews'),
(58,'Home Gym Dumbbell','dumbell.jpeg','4','20 KG PVC-DM COMBO16 (3KG X 4 Plates + 2KG X 4 Plates) Home Gym, Black',2730,'https://www.flipkart.com/krx-20-kg-pvc-dm-combo16-3kg-x-4-plates-2kg-plates-home-gym-adjustable-dumbbell/product-reviews/itm01efb4edb0981?pid=DBLFVMH7JTZKFWHH&lid=LSTDBLFVMH7JTZKFWHHBJNYEC&marketplace=FLIPKART','https://www.amazon.in/Kore-20-KG-PVC-DM-Dumbbells/product-reviews/B08DS5SC8H/ref=cm_cr_dp_d_show_all_btm?ie=UTF8&reviewerType=all_reviews'),
(59,'Zebrronics USB Gaming Keyboard','Gaming_Board.jpeg','1','German-made Cherry MX RGB Mechanical Key Switches that Deliver Satisfying Mechanical Feel with Optimal Actuation – The Choice of Professional Gamers and Enthusiasts',14555,'https://www.flipkart.com/zebronics-mechanical-max-plus-wired-usb-gaming-keyboard/product-reviews/itmeyyfbhhahpd8e?pid=ACCEXVWCSWNBPSHN&lid=LSTACCEXVWCSWNBPSHNQT8LZT&marketplace=FLIPKART','https://www.amazon.in/ZEBRONICS-MaxPlus-Gaming-KeyBoard-Black/product-reviews/B0758FZJ2J/ref=cm_cr_dp_d_show_all_btm?ie=UTF8&reviewerType=all_reviews'),
(60,'Samsung Galaxy M21','samsung-galaxy-m21.jpeg','1','8MP (F2.0) Main Camera +8MP (F2.2) Ultra Wide Camera +5MP(F2.2) Depth Camera | 20MP (F2.2) front facing camera 16.21 centimeters (6.4-inch) FHD+ capacitive touchscreen with 2340 x 1080 pixels resolution 16M color support Memory',14832,'https://www.flipkart.com/samsung-galaxy-m21-raven-black-64-gb/product-reviews/itm771ab543df368?pid=MOBFSF867ET7DDMZ&lid=LSTMOBFSF867ET7DDMZH9SHSE&marketplace=FLIPKART','https://www.amazon.in/Samsung-Galaxy-Midnight-Blue-Storage/product-reviews/B07HGJJ559/ref=cm_cr_dp_d_show_all_btm?ie=UTF8&reviewerType=all_reviews');

/*Table structure for table `registration` */

DROP TABLE IF EXISTS `registration`;

CREATE TABLE `registration` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lid` int(11) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `phone` bigint(20) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

/*Data for the table `registration` */

insert  into `registration`(`id`,`lid`,`name`,`phone`,`email`) values 
(1,2,'cat',9946540378,'cat@gmail.com'),
(5,6,'abcd',9946540378,'abcd@gmail.com'),
(6,8,'Devika',9988774455,'devika@gmail.com'),
(7,9,'riya.d.k',9946540378,'cat@gmail.com');

/*Table structure for table `review` */

DROP TABLE IF EXISTS `review`;

CREATE TABLE `review` (
  `review_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) DEFAULT NULL,
  `review` text,
  `rating` float DEFAULT NULL,
  PRIMARY KEY (`review_id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=latin1;

/*Data for the table `review` */

insert  into `review`(`review_id`,`product_id`,`review`,`rating`) values 
(1,19,'             Very Nice Mobile good all         ',2.5),
(2,19,'I trust always on  Samsung  phone but this time not happy ...  handset not work as per my expectation.',3),
(3,22,'             What i have to say ,its boat and it must be good.         ',3.625),
(4,22,'Its better than i imagine, but sound could be little higher, but over all its a great deal, and a perfect product for movies and music, overall its a good deal, i can can recommend you',4.66),
(5,32,'             Watch is good. But one thing disappoint me that there is an black patch on back side of lock, and it looks like it was broken or fake item. Very disappointed.         ',0.74),
(7,36,'             I have been using this for couole of months, the power consumption is very minimal.Cooling is good.Noise level is also low.I use ac with cieling fan at same time.Dont waste your money running towards brands. Perfect in budget and great value.My friends were shocked to see my power bill coming very low even though i use this ac for 12hrs in full day at least. You might be embarrassed to tell ur friends that u bought whirlpool ac instead of bigbrand names.Trust me they will change their opinion soon. Whirlpool ac is perfect.Stabilizer mandatory.Installation is 500 only. Installation done on 2nd day after calling and booking thru amazon.Rating 5/5 for totak experience....         ',3.145),
(8,36,'Good ac..worth absolutely the money..I use it in my 12 by 10 room, gets pretty chilling in few minutes, keeping at 25 gives perfect temperature. Cooling is linear not immediate but that is due to inverter doing its job in regulating power. Installation was free and great from Whirlpool.',3.865),
(9,41,'             This product is worth for money. It is just amazing it so cute and portable I can carry it anywhere. LOVED IT ??????????         ',4.655),
(10,41,'It is very good product but its packing is not too good and its not give you a warranty card but product is very good',4.185),
(22,58,'Good quality product',2.96),
(23,59,'good quality product. awesome keyboard light. amazing function. heavy weight and noisy.',2.635),
(24,60,'I trust always on  Samsung  phone but this time not happy ...  handset not work as per my expectation.',1.6);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
