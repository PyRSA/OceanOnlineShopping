/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50714
Source Host           : localhost:3306
Source Database       : dressdb

Target Server Type    : MYSQL
Target Server Version : 50714
File Encoding         : 65001

Date: 2019-11-15 12:31:59
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `cart`
-- ----------------------------
DROP TABLE IF EXISTS `cart`;
CREATE TABLE `cart` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `dressid` int(20) NOT NULL,
  `userid` int(20) NOT NULL,
  `booknum` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK2E7B20B68FF963` (`userid`),
  CONSTRAINT `FK2E7B20B68FF963` FOREIGN KEY (`userid`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cart
-- ----------------------------
INSERT INTO `cart` VALUES ('1', '5', '14', '1');
INSERT INTO `cart` VALUES ('2', '6', '14', '1');
INSERT INTO `cart` VALUES ('3', '8', '14', '1');

-- ----------------------------
-- Table structure for `comment`
-- ----------------------------
DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `orderid` int(20) DEFAULT NULL COMMENT '商品id',
  `comments` varchar(255) DEFAULT NULL COMMENT '评语',
  `dressid` int(20) NOT NULL,
  `score` int(1) NOT NULL COMMENT '评分',
  `userid` int(20) NOT NULL,
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `imgurl` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_evaluation_orders` (`orderid`),
  KEY `FK_evaluation_user` (`userid`),
  CONSTRAINT `FK_evaluation_orders` FOREIGN KEY (`orderid`) REFERENCES `orders` (`id`),
  CONSTRAINT `FK_evaluation_user` FOREIGN KEY (`userid`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of comment
-- ----------------------------
INSERT INTO `comment` VALUES ('1', null, '还好了', '1', '80', '14', '2018-11-26 17:13:09', null);
INSERT INTO `comment` VALUES ('2', null, '不错,下次再来买', '1', '90', '14', '2018-11-26 17:13:19', null);
INSERT INTO `comment` VALUES ('3', null, '一般般啦', '1', '70', '14', '2018-11-26 17:13:39', null);

-- ----------------------------
-- Table structure for `dress`
-- ----------------------------
DROP TABLE IF EXISTS `dress`;
CREATE TABLE `dress` (
  `dressid` int(11) DEFAULT NULL,
  `dressname` varchar(50) DEFAULT NULL,
  `category` varchar(50) DEFAULT NULL,
  `price` double DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `imgurl` varchar(100) DEFAULT NULL,
  `description` varchar(100) DEFAULT NULL,
  `sales` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dress
-- ----------------------------
INSERT INTO `dress` VALUES ('1', '女裙1', '女装', '200', '99', 'img/female/t38.jpg', null, '1');
INSERT INTO `dress` VALUES ('2', '女裙2', '女装', '300', '99', 'img/female/t21.jpg', null, '1');
INSERT INTO `dress` VALUES ('3', '女裙3', '女装', '280', '98', 'img/female/t22.jpg', null, '2');
INSERT INTO `dress` VALUES ('15', '女裙15', '女装', '288', '100', 'img/female/t23.jpg', null, '0');
INSERT INTO `dress` VALUES ('16', '西装', '男装', '600', '100', 'img/female/t24.jpg', null, '0');
INSERT INTO `dress` VALUES ('17', '公主裙', '童装', '200', '100', 'img/female/t25.jpg', null, '0');
INSERT INTO `dress` VALUES ('4', '女裙4', '女装', '300', '100', 'img/female/t26.jpg', null, '0');
INSERT INTO `dress` VALUES ('5', '女裙5', '女装', '400', '98', 'img/female/t27.jpg', null, '2');
INSERT INTO `dress` VALUES ('6', '女裙6', '女装', '210', '100', 'img/female/t28.jpg', null, '0');
INSERT INTO `dress` VALUES ('8', '女裙8', '女装', '235', '100', 'img/female/t30.jpg', null, '0');
INSERT INTO `dress` VALUES ('9', '女裙9', '女装', '235', '100', 'img/female/t31.jpg', null, '0');
INSERT INTO `dress` VALUES ('10', '女裙10', '女装', '235', '100', 'img/female/t32.jpg', null, '0');
INSERT INTO `dress` VALUES ('11', '女裙11', '女装', '235', '100', 'img/female/t33.jpg', null, '0');
INSERT INTO `dress` VALUES ('12', '女裙12', '女装', '235', '100', 'img/female/t34.jpg', null, '0');
INSERT INTO `dress` VALUES ('13', '女裙13', '女装', '235', '100', 'img/female/t35.jpg', null, '0');
INSERT INTO `dress` VALUES ('7', '女裙7', '女装', '235', '100', 'img/female/t29.jpg', null, '0');
INSERT INTO `dress` VALUES ('14', '女裙14', '女装', '580', '100', 'img/female/t36.jpg', null, '0');
INSERT INTO `dress` VALUES (null, null, null, null, null, null, null, null);

-- ----------------------------
-- Table structure for `orderitem`
-- ----------------------------
DROP TABLE IF EXISTS `orderitem`;
CREATE TABLE `orderitem` (
  `orderid` int(100) NOT NULL COMMENT '订单id',
  `dressid` varchar(100) NOT NULL COMMENT '产品表',
  `buynum` int(11) DEFAULT NULL COMMENT '订单购买数量',
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`),
  KEY `FKE8B2AB6127C924DD` (`dressid`),
  KEY `FKE8B2AB6174895891` (`orderid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='订单\r\n';

-- ----------------------------
-- Records of orderitem
-- ----------------------------

-- ----------------------------
-- Table structure for `orders`
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders` (
  `id` int(100) NOT NULL AUTO_INCREMENT,
  `money` double DEFAULT NULL,
  `receiverAddress` varchar(255) DEFAULT NULL,
  `receiverName` varchar(20) DEFAULT NULL,
  `receiverPhone` varchar(20) DEFAULT NULL,
  `paystate` int(11) DEFAULT NULL,
  `ordertime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `userid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKC3DF62E5B68FF963` (`userid`),
  CONSTRAINT `FKC3DF62E5B68FF963` FOREIGN KEY (`userid`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=114 DEFAULT CHARSET=utf8 COMMENT='订单\r\n';

-- ----------------------------
-- Records of orders
-- ----------------------------
INSERT INTO `orders` VALUES ('98', '73', '广东省广州市天河区微微威武', 'user3', '135465465', '1', '2018-06-05 12:09:27', '14');
INSERT INTO `orders` VALUES ('99', '182', '广东省广州市天河区中山大道', 'user3', '135465465', '1', '2018-06-07 14:33:11', '14');
INSERT INTO `orders` VALUES ('100', '50', '广东省广州市天河区中山大道', 'user3', '135465465', '1', '2018-06-07 14:41:09', '14');
INSERT INTO `orders` VALUES ('101', '279', '广东省广州市天河区中山大道', 'user3', '135465465', '0', '2018-06-30 16:13:33', '14');
INSERT INTO `orders` VALUES ('102', '55', '广东省广州市天河区中山大道', 'user3', '135465465', '0', '2018-06-30 16:21:29', '14');
INSERT INTO `orders` VALUES ('103', '73', '广东省广州市天河区中山大道', 'user3', '135465465', '0', '2018-07-04 12:16:42', '14');
INSERT INTO `orders` VALUES ('104', '869', '广东省广州市天河区中山大道', 'user3', '135465465', '1', '2018-07-04 12:28:33', '14');
INSERT INTO `orders` VALUES ('105', '1093', '广东省广州市天河区中山大道', 'user3', '135465465', '1', '2018-09-26 10:49:21', '14');
INSERT INTO `orders` VALUES ('106', '1203', '广东省广州市天河区中山大道', 'user3', '135465465', '1', '2018-09-27 14:25:39', '14');
INSERT INTO `orders` VALUES ('107', '590', '广东省广州市天河区中山大道', 'user3', '135465465', '1', '2018-09-27 14:40:40', '14');
INSERT INTO `orders` VALUES ('108', '334', '广东省广州市天河区中山大道', 'user3', '135465465', '1', '2018-09-27 15:20:06', '14');
INSERT INTO `orders` VALUES ('109', '279', '广东省广州市天河区中山大道', 'user3', '135465465', '1', '2018-09-27 15:45:41', '14');
INSERT INTO `orders` VALUES ('110', '334', '广东省广州市天河区中山大道', 'user3', '135465465', '1', '2018-09-27 16:00:55', '14');
INSERT INTO `orders` VALUES ('111', '334', '广东省广州市天河区中山大道', 'user3', '135465465', '1', '2018-09-27 16:18:37', '14');
INSERT INTO `orders` VALUES ('112', '78', '广东省广州市天河区中山大道', 'user3', '135465465', '1', '2018-10-26 17:18:18', '14');
INSERT INTO `orders` VALUES ('113', '500', '广东省广州市天河区中山大道', 'admin', '137501142566', '1', '2018-11-27 10:44:19', '9');

-- ----------------------------
-- Table structure for `user`
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(20) NOT NULL,
  `password` varchar(20) NOT NULL,
  `gender` varchar(10) DEFAULT NULL,
  `email` varchar(50) NOT NULL,
  `telephone` varchar(20) NOT NULL,
  `introduce` varchar(100) DEFAULT NULL,
  `role` varchar(10) NOT NULL DEFAULT 'ordinary',
  `registTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `shippingAddress` varchar(1000) DEFAULT NULL,
  `name` varchar(20) NOT NULL,
  `headimg` varchar(255) NOT NULL DEFAULT 'img/userheadimg/0.jpg',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', 'user1', '123', 'm', '1638075649@163.com', '1375011425', 'wule55', 'vip', '2018-11-26 17:11:46', '广东清远1231=1375011425=', '李白', 'img/userheadimg/3c02bc40-b64f-48fb-8061-df2c8803828e.jpg');
INSERT INTO `user` VALUES ('9', 'admin', '123456', 'f', '1638075649@qq.com', '137501142566', '-', 'admin', '2018-11-26 11:25:46', '广东省广州市天河区中山大道', '李白', 'img/userheadimg/a254b3b7-b45e-46da-9fe1-778c8169506b.jpg');
INSERT INTO `user` VALUES ('11', '333', '123456', 'm', '1366692070@qq.com', '15899973632', '-', 'vip', '2018-06-05 15:33:10', '广东省广州市天河区中山大道', '李白', 'img/userheadimg/0.jpg');
INSERT INTO `user` VALUES ('12', 'abcd', '123456', 'm', '1638075649@qq.com', '137501140000', '-', 'admin', '2018-06-05 15:33:13', '广东省广州市天河区中山大道', '李白', 'img/userheadimg/3ca11c64-7209-400a-ae32-f62c64d8f4b7.jpg');
INSERT INTO `user` VALUES ('14', 'user3', '123', 'm', '1638075649@qq.com', '135465465', '-', 'vip', '2018-11-26 09:40:01', '广东省广州市天河区中山大道', '李白', 'img/userheadimg/2b3d4f52-9e00-404a-809a-522b3b2faad4.jpg');
