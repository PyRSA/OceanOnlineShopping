/*
 Navicat Premium Data Transfer

 Source Server         : root
 Source Server Type    : MySQL
 Source Server Version : 50725
 Source Host           : localhost:3306
 Source Schema         : ocean_online_shopping

 Target Server Type    : MySQL
 Target Server Version : 50725
 File Encoding         : 65001

 Date: 07/04/2022 14:56:16
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for cart
-- ----------------------------
DROP TABLE IF EXISTS `cart`;
CREATE TABLE `cart` (
  `id` int NOT NULL AUTO_INCREMENT,
  `dressid` int NOT NULL,
  `userid` int NOT NULL,
  `booknum` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK2E7B20B68FF963` (`userid`),
  CONSTRAINT `FK2E7B20B68FF963` FOREIGN KEY (`userid`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cart
-- ----------------------------
BEGIN;
INSERT INTO `cart` VALUES (1, 5, 14, 1);
INSERT INTO `cart` VALUES (2, 6, 14, 1);
INSERT INTO `cart` VALUES (3, 8, 14, 1);
INSERT INTO `cart` VALUES (5, 8, 11, 1);
COMMIT;

-- ----------------------------
-- Table structure for comment
-- ----------------------------
DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment` (
  `id` int NOT NULL AUTO_INCREMENT,
  `orderid` int DEFAULT NULL COMMENT '商品id',
  `comments` varchar(255) DEFAULT NULL COMMENT '评语',
  `dressid` int NOT NULL,
  `score` int NOT NULL COMMENT '评分',
  `userid` int NOT NULL,
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
BEGIN;
INSERT INTO `comment` VALUES (1, NULL, '还好了', 1, 80, 14, '2018-11-26 17:13:09', NULL);
INSERT INTO `comment` VALUES (2, NULL, '不错,下次再来买', 1, 90, 14, '2018-11-26 17:13:19', NULL);
INSERT INTO `comment` VALUES (3, NULL, '一般般啦', 1, 70, 14, '2018-11-26 17:13:39', NULL);
COMMIT;

-- ----------------------------
-- Table structure for dress
-- ----------------------------
DROP TABLE IF EXISTS `dress`;
CREATE TABLE `dress` (
  `dressid` int DEFAULT NULL,
  `dressname` varchar(50) DEFAULT NULL,
  `category` varchar(50) DEFAULT NULL,
  `price` double DEFAULT NULL,
  `quantity` int DEFAULT NULL,
  `imgurl` varchar(100) DEFAULT NULL,
  `description` varchar(100) DEFAULT NULL,
  `sales` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dress
-- ----------------------------
BEGIN;
INSERT INTO `dress` VALUES (1, '女裙1', '女装', 200, 99, 'img/female/t38.jpg', NULL, 1);
INSERT INTO `dress` VALUES (2, '女裙2', '女装', 300, 99, 'img/female/t21.jpg', NULL, 1);
INSERT INTO `dress` VALUES (3, '女裙3', '女装', 280, 98, 'img/female/t22.jpg', NULL, 2);
INSERT INTO `dress` VALUES (15, '女裙15', '女装', 288, 100, 'img/female/t23.jpg', NULL, 0);
INSERT INTO `dress` VALUES (16, '西装', '男装', 600, 100, 'img/female/t24.jpg', NULL, 0);
INSERT INTO `dress` VALUES (17, '公主裙', '童装', 200, 100, 'img/female/t25.jpg', NULL, 0);
INSERT INTO `dress` VALUES (4, '女裙4', '女装', 300, 100, 'img/female/t26.jpg', NULL, 0);
INSERT INTO `dress` VALUES (5, '女裙5', '女装', 400, 98, 'img/female/t27.jpg', NULL, 2);
INSERT INTO `dress` VALUES (6, '女裙6', '女装', 210, 100, 'img/female/t28.jpg', NULL, 0);
INSERT INTO `dress` VALUES (8, '女裙8', '女装', 235, 100, 'img/female/t30.jpg', NULL, 0);
INSERT INTO `dress` VALUES (9, '女裙9', '女装', 235, 100, 'img/female/t31.jpg', NULL, 0);
INSERT INTO `dress` VALUES (10, '女裙10', '女装', 235, 100, 'img/female/t32.jpg', NULL, 0);
INSERT INTO `dress` VALUES (11, '女裙11', '女装', 235, 100, 'img/female/t33.jpg', NULL, 0);
INSERT INTO `dress` VALUES (12, '女裙12', '女装', 235, 100, 'img/female/t34.jpg', NULL, 0);
INSERT INTO `dress` VALUES (13, '女裙13', '女装', 235, 100, 'img/female/t35.jpg', NULL, 0);
INSERT INTO `dress` VALUES (7, '女裙7', '女装', 235, 100, 'img/female/t29.jpg', NULL, 0);
INSERT INTO `dress` VALUES (14, '女裙14', '女装', 580, 100, 'img/female/t36.jpg', NULL, 0);
INSERT INTO `dress` VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
COMMIT;

-- ----------------------------
-- Table structure for orderitem
-- ----------------------------
DROP TABLE IF EXISTS `orderitem`;
CREATE TABLE `orderitem` (
  `orderid` int NOT NULL COMMENT '订单id',
  `dressid` varchar(100) NOT NULL COMMENT '产品表',
  `buynum` int DEFAULT NULL COMMENT '订单购买数量',
  `id` int NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`),
  KEY `FKE8B2AB6127C924DD` (`dressid`),
  KEY `FKE8B2AB6174895891` (`orderid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='订单\r\n';

-- ----------------------------
-- Records of orderitem
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for orders
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders` (
  `id` int NOT NULL AUTO_INCREMENT,
  `money` double DEFAULT NULL,
  `receiverAddress` varchar(255) DEFAULT NULL,
  `receiverName` varchar(20) DEFAULT NULL,
  `receiverPhone` varchar(20) DEFAULT NULL,
  `paystate` int DEFAULT NULL,
  `ordertime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `userid` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKC3DF62E5B68FF963` (`userid`),
  CONSTRAINT `FKC3DF62E5B68FF963` FOREIGN KEY (`userid`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=114 DEFAULT CHARSET=utf8 COMMENT='订单\r\n';

-- ----------------------------
-- Records of orders
-- ----------------------------
BEGIN;
INSERT INTO `orders` VALUES (98, 73, '广东省广州市天河区微微威武', 'summer', '15899973632', 1, '2022-04-07 10:36:55', 14);
INSERT INTO `orders` VALUES (99, 182, '广东省广州市天河区中山大道', 'summer', '15899973632', 1, '2022-04-07 10:36:55', 14);
INSERT INTO `orders` VALUES (100, 50, '广东省广州市天河区中山大道', 'summer', '15899973632', 1, '2022-04-07 10:36:55', 14);
INSERT INTO `orders` VALUES (101, 279, '广东省广州市天河区中山大道', 'summer', '15899973632', 0, '2022-04-07 10:36:55', 14);
INSERT INTO `orders` VALUES (102, 55, '广东省广州市天河区中山大道', 'summer', '15899973632', 0, '2022-04-07 10:36:55', 14);
INSERT INTO `orders` VALUES (103, 73, '广东省广州市天河区中山大道', 'summer', '15899973632', 0, '2022-04-07 10:36:55', 14);
INSERT INTO `orders` VALUES (104, 869, '广东省广州市天河区中山大道', 'summer', '15899973632', 1, '2022-04-07 10:36:55', 14);
INSERT INTO `orders` VALUES (105, 1093, '广东省广州市天河区中山大道', 'summer', '15899973632', 1, '2022-04-07 10:36:55', 14);
INSERT INTO `orders` VALUES (106, 1203, '广东省广州市天河区中山大道', 'summer', '15899973632', 1, '2022-04-07 10:36:55', 14);
INSERT INTO `orders` VALUES (107, 590, '广东省广州市天河区中山大道', 'summer', '15899973632', 1, '2022-04-07 10:36:55', 14);
INSERT INTO `orders` VALUES (108, 334, '广东省广州市天河区中山大道', 'summer', '15899973632', 1, '2022-04-07 10:36:55', 14);
INSERT INTO `orders` VALUES (109, 279, '广东省广州市天河区中山大道', 'summer', '15899973632', 1, '2022-04-07 10:36:55', 14);
INSERT INTO `orders` VALUES (110, 334, '广东省广州市天河区中山大道', 'summer', '15899973632', 1, '2022-04-07 10:36:55', 14);
INSERT INTO `orders` VALUES (111, 334, '广东省广州市天河区中山大道', 'summer', '15899973632', 1, '2022-04-07 10:36:55', 14);
INSERT INTO `orders` VALUES (112, 78, '广东省广州市天河区中山大道', 'summer', '135465465', 1, '2022-04-07 10:36:55', 14);
INSERT INTO `orders` VALUES (113, 500, '广东省广州市天河区中山大道', 'admin', '13750114256', 1, '2022-04-07 10:36:55', 9);
COMMIT;

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int NOT NULL AUTO_INCREMENT,
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
BEGIN;
INSERT INTO `user` VALUES (1, 'user', '123', 'm', '1638075649@163.com', '13750114256', 'wule55', 'vip', '2022-04-07 10:10:15', '广东清远1231=1375011425=', '飞鸟和蝉鸣', 'img/userheadimg/1.jpg');
INSERT INTO `user` VALUES (9, 'admin', '123456', 'f', '1638075649@qq.com', '13750114256', '-', 'admin', '2022-04-07 10:10:15', '广东省广州市天河区中山大道', '海风', 'img/userheadimg/2.jpg');
INSERT INTO `user` VALUES (11, 'summer', '123456', 'm', '1366692070@qq.com', '15899973632', '-', 'vip', '2022-04-07 10:10:15', '广东省广州市天河区中山大道', '夏青柠', 'img/userheadimg/0.jpg');
INSERT INTO `user` VALUES (12, 'qinqi', '123456', 'm', '1638075649@qq.com', '13750114764', '-', 'admin', '2022-04-07 10:10:15', '广东省广州市天河区中山大道', '林芹琪', 'img/userheadimg/3.jpg');
INSERT INTO `user` VALUES (14, 'heidy', '123', 'm', '1638075649@qq.com', '13546543465', '-', 'vip', '2022-04-07 10:10:15', '广东省广州市天河区中山大道', '浩婷', 'img/userheadimg/4.jpg');
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
