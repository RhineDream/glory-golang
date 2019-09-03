/*
Navicat MySQL Data Transfer

Source Server         : 114.115.217.74
Source Server Version : 50640
Source Host           : 114.115.217.74:3306
Source Database       : go-demo

Target Server Type    : MYSQL
Target Server Version : 50640
File Encoding         : 65001

Date: 2019-09-03 22:28:42
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for oauth_modelid
-- ----------------------------
DROP TABLE IF EXISTS `oauth_modelid`;
CREATE TABLE `oauth_modelid` (
  `id` varchar(255) NOT NULL,
  `app_name` varchar(255) DEFAULT NULL,
  `app_remark` varchar(255) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `rewrite_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of oauth_modelid
-- ----------------------------

-- ----------------------------
-- Table structure for oauth_roleid
-- ----------------------------
DROP TABLE IF EXISTS `oauth_roleid`;
CREATE TABLE `oauth_roleid` (
  `id` int(11) NOT NULL,
  `app_id` varchar(11) DEFAULT NULL,
  `zone_id` varchar(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of oauth_roleid
-- ----------------------------

-- ----------------------------
-- Table structure for oauth_token
-- ----------------------------
DROP TABLE IF EXISTS `oauth_token`;
CREATE TABLE `oauth_token` (
  `id` varchar(100) NOT NULL COMMENT 'appid',
  `token` varchar(255) DEFAULT NULL,
  `express_in` varchar(255) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of oauth_token
-- ----------------------------
INSERT INTO `oauth_token` VALUES ('', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJhcHBpZCI6IiIsImV4cCI6MTU2NzUyMDAyN30.cqc3peSkMfohFbEdZWwUaLxCg_50QUGTm2OLarUoJcQ', '1567520027', '2019-09-03 21:13:47');
INSERT INTO `oauth_token` VALUES ('ISMvKXpXpadDiUoOSoAfww=1111111=', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJhcHBpZCI6IklTTXZLWHBYcGFkRGlVb09Tb0Fmd3c9MTExMTExMT0iLCJleHAiOjE1Njc1MjA2ODAsImlzcyI6IklTTXZLWHBYcGFkRGlVb09Tb0Fmd3c9MTExMTExMT0ifQ.5gsKYG68LJe36UhduSs-wRnFRbL3drvmmKoQjOCl5wI', '1567520680', '2019-09-03 21:24:40');
INSERT INTO `oauth_token` VALUES ('ISMvKXpXpadDiUoOSoAfww=1=', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJhcHBpZCI6IklTTXZLWHBYcGFkRGlVb09Tb0Fmd3c9MT0iLCJleHAiOjE1Njc1MjA2NzUsImlzcyI6IklTTXZLWHBYcGFkRGlVb09Tb0Fmd3c9MT0ifQ.6W7fqu0_tAQVY4NRANmiX6mkkxqJDnnhpJQgvqp4mPU', '1567520675', '2019-09-03 21:24:35');
INSERT INTO `oauth_token` VALUES ('ISMvKXpXpadDiUoOSoAfww==', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJhcHBpZCI6IklTTXZLWHBYcGFkRGlVb09Tb0Fmd3c9PSIsImV4cCI6MTU2NzUyMzg3MiwiaXNzIjoiSVNNdktYcFhwYWREaVVvT1NvQWZ3dz09In0.ijhKfb_3QoKbpjPx0CrNCoP6A3-F-wP7ucEcPHcQhho', '1567523872', '2019-09-03 22:17:52');

-- ----------------------------
-- Table structure for oauth_user
-- ----------------------------
DROP TABLE IF EXISTS `oauth_user`;
CREATE TABLE `oauth_user` (
  `id` int(64) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `passwd` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `role_id` int(11) DEFAULT NULL,
  `secrec` varchar(255) DEFAULT NULL,
  `appid` varchar(255) DEFAULT NULL,
  `salt` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of oauth_user
-- ----------------------------
INSERT INTO `oauth_user` VALUES ('1', 'admin', '2019-09-02 22:03:52', '664cea0aacb6171a5f547ce8b86f83d7af00caa0d142d9eb3a83a8a0fad912ce17ec2b2df43f88021c6c4763edf5d3019d014a8a967e5082e5ffd5f2467d8b43', '123@qq.com', '1', '1', 'SH+HUF9hm/nqCPJrs0+BGA==', 'ISMvKXpXpadDiUoOSoAfww==', '5dc074c3a99a7393da5baf07dcc0ff62136ac6cc5cf9a2bc2bd55045324d6e1554f9562197443df4f6acd8d559a81d364ec37e80e902eca7ac54e4bbcac8745b', null);
INSERT INTO `oauth_user` VALUES ('2', 'admin22', '2019-09-02 22:03:52', 'f56fae5d8aec27accdc69179c1ff909e118441262aeb71bfec5a7f03d6d9ed4b0e1724c7641b02a0a1820774564f8043058a8f163744f7a7a5a4513c9ce34ce4', '123@qq.com', '1', '1', 'SH+HUF9hm/nqCPJrs0+BGA==', 'ISMvKXpXpadDiUoOSoAfww==', '5dc074c3a99a7393da5baf07dcc0ff62136ac6cc5cf9a2bc2bd55045324d6e1554f9562197443df4f6acd8d559a81d364ec37e80e902eca7ac54e4bbcac8745b', '');

-- ----------------------------
-- Table structure for oauth_zone
-- ----------------------------
DROP TABLE IF EXISTS `oauth_zone`;
CREATE TABLE `oauth_zone` (
  `id` varchar(255) NOT NULL,
  `zone_name` varchar(255) DEFAULT NULL,
  `zone_remark` varchar(255) DEFAULT NULL,
  `rewrite_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of oauth_zone
-- ----------------------------

-- ----------------------------
-- Table structure for roles
-- ----------------------------
DROP TABLE IF EXISTS `roles`;
CREATE TABLE `roles` (
  `id` bigint(20) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `reg_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of roles
-- ----------------------------
INSERT INTO `roles` VALUES ('1', 'admin', 'admin', '2019-09-02 19:51:06');
INSERT INTO `roles` VALUES ('2', '15735801173', 'admin', '2019-09-02 20:23:52');
