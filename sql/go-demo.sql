/*
Navicat MySQL Data Transfer

Source Server         : 114.115.217.74-中网
Source Server Version : 50640
Source Host           : 114.115.217.74:3306
Source Database       : go-demo

Target Server Type    : MYSQL
Target Server Version : 50640
File Encoding         : 65001

Date: 2019-09-05 09:35:27
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
INSERT INTO `oauth_token` VALUES ('', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJhcHBpZCI6IiIsImV4cCI6MTU2NzU5MDYzOX0.RTHcHZ7mASc1h6HVYbIG-aZ89uVCFHpEwPA9gU1xjTI', '1567590639', '2019-09-04 16:50:39');
INSERT INTO `oauth_token` VALUES ('AZICOnu9cyUFFvBp3xi1AA==', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJhcHBpZCI6IkFaSUNPbnU5Y3lVRkZ2QnAzeGkxQUE9PSIsImV4cCI6MTU2NzY1MDE1MiwiaXNzIjoiQVpJQ09udTljeVVGRnZCcDN4aTFBQT09In0.im796mCls8_SsqnAXi-fxZ2xkNAfGU1Q1Y4AT_N21GM', '1567650152', '2019-09-05 09:22:32');
INSERT INTO `oauth_token` VALUES ('ISMvKXpXpadDiUoOSoAfww=1111111=', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJhcHBpZCI6IklTTXZLWHBYcGFkRGlVb09Tb0Fmd3c9MTExMTExMT0iLCJleHAiOjE1Njc1MjA2ODAsImlzcyI6IklTTXZLWHBYcGFkRGlVb09Tb0Fmd3c9MTExMTExMT0ifQ.5gsKYG68LJe36UhduSs-wRnFRbL3drvmmKoQjOCl5wI', '1567520680', '2019-09-03 21:24:40');
INSERT INTO `oauth_token` VALUES ('ISMvKXpXpadDiUoOSoAfww=1=', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJhcHBpZCI6IklTTXZLWHBYcGFkRGlVb09Tb0Fmd3c9MT0iLCJleHAiOjE1Njc1MjA2NzUsImlzcyI6IklTTXZLWHBYcGFkRGlVb09Tb0Fmd3c9MT0ifQ.6W7fqu0_tAQVY4NRANmiX6mkkxqJDnnhpJQgvqp4mPU', '1567520675', '2019-09-03 21:24:35');
INSERT INTO `oauth_token` VALUES ('ISMvKXpXpadDiUoOSoAfww==', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJhcHBpZCI6IklTTXZLWHBYcGFkRGlVb09Tb0Fmd3c9PSIsImV4cCI6MTU2NzY0OTEzOSwiaXNzIjoiSVNNdktYcFhwYWREaVVvT1NvQWZ3dz09In0.X1QKk-8mpf3hrUPm8breXCwWmsmePhm5XYc80KMzDAE', '1567649139', '2019-09-05 09:05:39');

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
  `role_id` varchar(255) DEFAULT NULL,
  `secret` varchar(255) DEFAULT NULL,
  `appid` varchar(255) DEFAULT NULL,
  `salt` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of oauth_user
-- ----------------------------
INSERT INTO `oauth_user` VALUES ('1', 'admin', '2019-09-02 22:03:52', '664cea0aacb6171a5f547ce8b86f83d7af00caa0d142d9eb3a83a8a0fad912ce17ec2b2df43f88021c6c4763edf5d3019d014a8a967e5082e5ffd5f2467d8b43', '123@qq.com', '1', '1', 'SH+HUF9hm/nqCPJrs0+BGA==', 'ISMvKXpXpadDiUoOSoAfww==', '5dc074c3a99a7393da5baf07dcc0ff62136ac6cc5cf9a2bc2bd55045324d6e1554f9562197443df4f6acd8d559a81d364ec37e80e902eca7ac54e4bbcac8745b', null);
INSERT INTO `oauth_user` VALUES ('6', 'admin123', '2019-09-05 09:19:53', 'b602636d5866a7d53f2b18414b1fc514f4d3330be7eff51a9190834e6b80eb6c91a9366d4322962e9303e9c19b89211d022d2e894ffba3e6b635b875eec49a78', '123123@qq.com', '1', '1', '1S8/43UfVcQUngShZSGKWg==', 'AZICOnu9cyUFFvBp3xi1AA==', '57a6298d00cc5786fdd039435dabcccf7e670770ee408c60b776557b3b7294b65c86df7c2971cafe545b085a5bca20e43b590838f148276b7b68578ccd84ae0f', null);

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
