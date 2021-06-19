/*
Navicat MySQL Data Transfer

Source Server         : 127
Source Server Version : 50548
Source Host           : localhost:3306
Source Database       : system_admin

Target Server Type    : MYSQL
Target Server Version : 50548
File Encoding         : 65001

Date: 2021-06-19 10:47:47
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for catalogue
-- ----------------------------
DROP TABLE IF EXISTS `catalogue`;
CREATE TABLE `catalogue` (
  `id` int(11) NOT NULL COMMENT 'id',
  `pid` int(11) DEFAULT NULL COMMENT '父ID',
  `name` varchar(255) DEFAULT NULL COMMENT '目录名',
  `path` varchar(255) DEFAULT NULL COMMENT '路径',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='目录表';

-- ----------------------------
-- Records of catalogue
-- ----------------------------
INSERT INTO `catalogue` VALUES ('1', '0', '目录', null);
INSERT INTO `catalogue` VALUES ('2', '1', '添加目录', null);
INSERT INTO `catalogue` VALUES ('3', '1', '修改目录', null);
INSERT INTO `catalogue` VALUES ('4', '1', '删除目录', null);

-- ----------------------------
-- Table structure for profession
-- ----------------------------
DROP TABLE IF EXISTS `profession`;
CREATE TABLE `profession` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL COMMENT '工种名称',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of profession
-- ----------------------------

-- ----------------------------
-- Table structure for staff
-- ----------------------------
DROP TABLE IF EXISTS `staff`;
CREATE TABLE `staff` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '员工表',
  `name` varchar(255) DEFAULT NULL COMMENT '姓名',
  `sex` varchar(4) DEFAULT NULL COMMENT '性别',
  `phone` varchar(255) DEFAULT NULL COMMENT '电话',
  `profession` varchar(255) DEFAULT NULL COMMENT '工种',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of staff
-- ----------------------------
INSERT INTO `staff` VALUES ('1', '王洋', '男', '183XXXXXXXX', '开发工程师');
INSERT INTO `staff` VALUES ('2', '王洋洋', '男', '132XXXXXXXX', '软件工程师');
INSERT INTO `staff` VALUES ('3', '里ii', '女', '1111111', '2');
INSERT INTO `staff` VALUES ('4', '李佳家', '女', '1111111', '发');

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES ('1', 'admin', '123');
INSERT INTO `sys_user` VALUES ('2', '程建飞', '111');

-- ----------------------------
-- Table structure for worktable
-- ----------------------------
DROP TABLE IF EXISTS `worktable`;
CREATE TABLE `worktable` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '编号',
  `name` varchar(20) NOT NULL COMMENT '姓名',
  `workplace` varchar(50) DEFAULT NULL COMMENT '工作地点',
  `month` int(11) NOT NULL COMMENT '月份',
  `_1` double(255,2) DEFAULT NULL COMMENT '天',
  `_2` double(255,2) DEFAULT NULL COMMENT '天',
  `_3` double(255,2) DEFAULT NULL COMMENT '天',
  `_4` double(255,2) DEFAULT NULL COMMENT '天',
  `_5` double(255,2) DEFAULT NULL COMMENT '天',
  `_6` double(255,2) DEFAULT NULL COMMENT '天',
  `_7` double(255,2) DEFAULT NULL COMMENT '天',
  `_8` double(255,2) DEFAULT NULL COMMENT '天',
  `_9` double(255,2) DEFAULT NULL COMMENT '天',
  `_10` double(255,2) DEFAULT NULL COMMENT '天',
  `_11` double(255,2) DEFAULT NULL COMMENT '天',
  `_12` double(255,2) DEFAULT NULL COMMENT '天',
  `_13` double(255,2) DEFAULT NULL COMMENT '天',
  `_14` double(255,2) DEFAULT NULL COMMENT '天',
  `_15` double(255,2) DEFAULT NULL COMMENT '天',
  `_16` double(255,2) DEFAULT NULL COMMENT '天',
  `_17` double(255,2) DEFAULT NULL COMMENT '天',
  `_18` double(255,2) DEFAULT NULL COMMENT '天',
  `_19` double(255,2) DEFAULT NULL COMMENT '天',
  `_20` double(255,2) DEFAULT NULL COMMENT '天',
  `_21` double(255,2) DEFAULT NULL COMMENT '天',
  `_22` double(255,2) DEFAULT NULL COMMENT '天',
  `_23` double(255,2) DEFAULT NULL COMMENT '天',
  `_24` double(255,2) DEFAULT NULL COMMENT '天',
  `_25` double(255,2) DEFAULT NULL COMMENT '天',
  `_26` double(255,2) DEFAULT NULL COMMENT '天',
  `_27` double(255,2) DEFAULT NULL COMMENT '天',
  `_28` double(255,2) DEFAULT NULL COMMENT '天',
  `_29` double(255,2) DEFAULT NULL COMMENT '天',
  `_30` double(255,2) DEFAULT NULL COMMENT '天',
  `_31` double(255,2) DEFAULT NULL COMMENT '天',
  `beonduty` double(255,2) NOT NULL COMMENT '上班时长',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of worktable
-- ----------------------------

-- ----------------------------
-- Table structure for year_work_table
-- ----------------------------
DROP TABLE IF EXISTS `year_work_table`;
CREATE TABLE `year_work_table` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `_1` double(11,2) DEFAULT NULL,
  `_2` double(11,2) DEFAULT NULL,
  `_3` double(11,2) DEFAULT NULL,
  `_4` double(11,2) DEFAULT NULL,
  `_5` double(11,2) DEFAULT NULL,
  `_6` double(11,2) DEFAULT NULL,
  `_7` double(11,2) DEFAULT NULL,
  `_8` double(11,2) DEFAULT NULL,
  `_9` double(11,2) DEFAULT NULL,
  `_10` double(11,2) DEFAULT NULL,
  `_11` double(11,2) DEFAULT NULL,
  `_12` double(11,2) DEFAULT NULL,
  `beonduty` double(11,2) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of year_work_table
-- ----------------------------
INSERT INTO `year_work_table` VALUES ('1', '程建飞', null, null, null, null, null, null, null, null, null, null, null, null, '1.00', null);
