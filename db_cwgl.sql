/*
Navicat MySQL Data Transfer

Source Server         : Herb
Source Server Version : 50527
Source Host           : localhost:3306
Source Database       : db_cwgl

Target Server Type    : MYSQL
Target Server Version : 50527
File Encoding         : 65001

Date: 2018-05-17 15:55:26
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `t_admin`
-- ----------------------------
DROP TABLE IF EXISTS `t_admin`;
CREATE TABLE `t_admin` (
  `userId` int(11) NOT NULL,
  `userName` varchar(50) DEFAULT NULL,
  `userPw` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_admin
-- ----------------------------
INSERT INTO `t_admin` VALUES ('1', 'a', 'q');

-- ----------------------------
-- Table structure for `t_bumen`
-- ----------------------------
DROP TABLE IF EXISTS `t_bumen`;
CREATE TABLE `t_bumen` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `mingcheng` varchar(50) DEFAULT NULL,
  `renshu` varchar(50) DEFAULT NULL,
  `xishu` varchar(50) DEFAULT NULL,
  `del` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_bumen
-- ----------------------------
INSERT INTO `t_bumen` VALUES ('1', '财务部', '5', '0.8', 'no');
INSERT INTO `t_bumen` VALUES ('2', '营销部', '5', '0.8', 'no');

-- ----------------------------
-- Table structure for `t_catelog`
-- ----------------------------
DROP TABLE IF EXISTS `t_catelog`;
CREATE TABLE `t_catelog` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `del` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_catelog
-- ----------------------------
INSERT INTO `t_catelog` VALUES ('1', '少儿读物', 'no');
INSERT INTO `t_catelog` VALUES ('2', '励志文学', 'no');
INSERT INTO `t_catelog` VALUES ('3', '历史奇闻', 'no');
INSERT INTO `t_catelog` VALUES ('4', '欧美文学', 'no');
INSERT INTO `t_catelog` VALUES ('5', '散文诗歌', 'no');

-- ----------------------------
-- Table structure for `t_feiyong`
-- ----------------------------
DROP TABLE IF EXISTS `t_feiyong`;
CREATE TABLE `t_feiyong` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `mingcheng` varchar(50) DEFAULT NULL,
  `shijian` varchar(50) DEFAULT NULL,
  `feiyong` decimal(8,2) DEFAULT NULL,
  `leixing` int(4) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_feiyong
-- ----------------------------
INSERT INTO `t_feiyong` VALUES ('2', '2018-4销售额', '2018-04-16', '15000.00', '0');
INSERT INTO `t_feiyong` VALUES ('3', '2018-4支出额', '2018-04-16', '5000.00', '1');

-- ----------------------------
-- Table structure for `t_gongzi`
-- ----------------------------
DROP TABLE IF EXISTS `t_gongzi`;
CREATE TABLE `t_gongzi` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `zhigong_id` int(4) DEFAULT NULL,
  `jiben` decimal(8,2) DEFAULT NULL,
  `gongling` decimal(8,2) DEFAULT NULL,
  `zhiwu` decimal(8,2) DEFAULT NULL,
  `butie` decimal(8,2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_gongzi
-- ----------------------------
INSERT INTO `t_gongzi` VALUES ('1', '1', '2000.00', '300.00', '150.00', '220.00');
INSERT INTO `t_gongzi` VALUES ('2', '2', '2000.00', '50.00', '50.00', '200.00');

-- ----------------------------
-- Table structure for `t_jingying`
-- ----------------------------
DROP TABLE IF EXISTS `t_jingying`;
CREATE TABLE `t_jingying` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `mingcheng` varchar(50) DEFAULT NULL,
  `riqi` varchar(50) DEFAULT NULL,
  `touru` decimal(8,2) DEFAULT NULL,
  `shouyi` decimal(8,2) DEFAULT NULL,
  `lirun` decimal(8,2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_jingying
-- ----------------------------
INSERT INTO `t_jingying` VALUES ('1', '少儿读物', '2018-05-16', '5000.00', '3200.00', '-1800.00');
INSERT INTO `t_jingying` VALUES ('2', '历史奇闻', '2018-05-16', '3000.00', '5000.00', '2000.00');

-- ----------------------------
-- Table structure for `t_zhigong`
-- ----------------------------
DROP TABLE IF EXISTS `t_zhigong`;
CREATE TABLE `t_zhigong` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `bumen_id` int(4) DEFAULT '2',
  `bianhao` varchar(50) DEFAULT NULL,
  `loginpw` varchar(50) DEFAULT NULL,
  `xingming` varchar(50) DEFAULT NULL,
  `xingbie` varchar(50) DEFAULT NULL,
  `ruzhi` varchar(50) DEFAULT NULL,
  `del` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_zhigong
-- ----------------------------
INSERT INTO `t_zhigong` VALUES ('1', '1', '201301', '0', '赵磊', '男', '2018-05-16', 'no');
INSERT INTO `t_zhigong` VALUES ('2', '1', '201302', '0', '韩俊', '男', '2018-05-16', 'no');
INSERT INTO `t_zhigong` VALUES ('3', '2', '201303', '0', '王朋', '男', '2018-05-16', 'no');
INSERT INTO `t_zhigong` VALUES ('7', '2', '201304', '654321', '老何', '男', '2018-05-02', 'no');
INSERT INTO `t_zhigong` VALUES ('8', '2', '2014131607', '654321', '小王', '男', '2018-05-17', 'yes');
INSERT INTO `t_zhigong` VALUES ('9', '2', '201305', '0', '何波', '男', '2018-05-17', 'no');
INSERT INTO `t_zhigong` VALUES ('10', '2', '201306', '654321', '何波', '男', '2018-05-17', 'yes');

-- ----------------------------
-- Table structure for `t_zichan`
-- ----------------------------
DROP TABLE IF EXISTS `t_zichan`;
CREATE TABLE `t_zichan` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `catelog_id` int(4) DEFAULT NULL,
  `bianhao` varchar(50) DEFAULT NULL,
  `mingcheng` varchar(50) DEFAULT NULL,
  `shijian` varchar(50) DEFAULT NULL,
  `jiazhi` varchar(50) DEFAULT NULL,
  `type` int(4) DEFAULT NULL,
  `fangshi` int(4) DEFAULT '2',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_zichan
-- ----------------------------
INSERT INTO `t_zichan` VALUES ('1', '1', '001', '2018-4销售额', '2018-04-01', '8000', '0', '2');
INSERT INTO `t_zichan` VALUES ('2', '1', '002', '2018-5销售额', '2018-05-16', '5000', '0', '2');
INSERT INTO `t_zichan` VALUES ('3', '2', '003', '2018-4销售额', '2018-04-16', '6000', '1', '2');
INSERT INTO `t_zichan` VALUES ('4', '3', '004', '2018-4销售额', '2018-04-16', '5000', '0', '2');
INSERT INTO `t_zichan` VALUES ('5', '4', '005', '2018-4销售额', '2018-04-16', '5930', '0', '2');
INSERT INTO `t_zichan` VALUES ('6', '4', '006', '2018-5销售额', '2018-05-16', '9600', '0', '2');
INSERT INTO `t_zichan` VALUES ('7', '3', '007', '2018-5销售额', '2018-05-16', '3200', '1', '2');
