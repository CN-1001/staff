/*
Navicat MySQL Data Transfer

Source Server         : 本地
Source Server Version : 50548
Source Host           : localhost:3306
Source Database       : system_admin

Target Server Type    : MYSQL
Target Server Version : 50548
File Encoding         : 65001

Date: 2021-07-03 08:44:37
*/

SET
FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for catalogue
-- ----------------------------
DROP TABLE IF EXISTS `catalogue`;
CREATE TABLE `catalogue`
(
    `id`   varchar(255) NOT NULL COMMENT 'id',
    `pid`  varchar(255) DEFAULT NULL COMMENT '父ID',
    `name` varchar(255) DEFAULT NULL COMMENT '目录名',
    `path` varchar(255) DEFAULT NULL COMMENT '路径',
    PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='目录表';

-- ----------------------------
-- Records of catalogue
-- ----------------------------
INSERT INTO `catalogue`
VALUES ('1', '0', '目录', null);
INSERT INTO `catalogue`
VALUES ('1624187463088', '0', 'Staff', ' ');
INSERT INTO `catalogue`
VALUES ('1624259309315', '1624187463088', 'Staff添加', '/staff/add');
INSERT INTO `catalogue`
VALUES ('1624263022000', '1624187463088', 'Staff', '/staff/list');
INSERT INTO `catalogue`
VALUES ('1624501059132', '0', '考勤', '//');
INSERT INTO `catalogue`
VALUES ('1624501264140', '1624501059132', '添加考勤', '/checking-in/add');
INSERT INTO `catalogue`
VALUES ('1624766471767', '1624501059132', '考勤列表', '/checking-in/list');
INSERT INTO `catalogue`
VALUES ('2', '1', '添加目录', '/ml/insert');
INSERT INTO `catalogue`
VALUES ('3', '1', '修改目录', '/ml/list');
INSERT INTO `catalogue`
VALUES ('4', '1', '删除目录', '/ml/list');

-- ----------------------------
-- Table structure for place
-- ----------------------------
DROP TABLE IF EXISTS `place`;
CREATE TABLE `place`
(
    `id`   int(11) NOT NULL AUTO_INCREMENT,
    `name` varchar(255) DEFAULT NULL,
    PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='地方';

-- ----------------------------
-- Records of place
-- ----------------------------
INSERT INTO `place`
VALUES ('1', '北环');
INSERT INTO `place`
VALUES ('2', '南环');
INSERT INTO `place`
VALUES ('3', '东环');

-- ----------------------------
-- Table structure for profession
-- ----------------------------
DROP TABLE IF EXISTS `profession`;
CREATE TABLE `profession`
(
    `id`   int(11) NOT NULL AUTO_INCREMENT,
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
CREATE TABLE `staff`
(
    `id`         int(11) NOT NULL AUTO_INCREMENT COMMENT '员工表',
    `name`       varchar(255) NOT NULL COMMENT '姓名',
    `sex`        varchar(4)   DEFAULT NULL COMMENT '性别',
    `phone`      varchar(255) DEFAULT NULL COMMENT '电话',
    `profession` varchar(255) DEFAULT NULL COMMENT '工种',
    PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of staff
-- ----------------------------
INSERT INTO `staff`
VALUES ('25', '张三', '男', '15231832770', '');
INSERT INTO `staff`
VALUES ('27', '李四', '男', '15233803336', '');

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`
(
    `id`       int(10) NOT NULL AUTO_INCREMENT,
    `username` varchar(255) DEFAULT NULL,
    `password` varchar(255) DEFAULT NULL,
    PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user`
VALUES ('2', '程建飞', '111');
INSERT INTO `sys_user`
VALUES ('3', 'admin', '123');

-- ----------------------------
-- Table structure for worktable
-- ----------------------------
DROP TABLE IF EXISTS `worktable`;
CREATE TABLE `worktable`
(
    `id`        varchar(100) NOT NULL COMMENT '编号',
    `name`      varchar(20)  NOT NULL COMMENT '姓名',
    `workplace` varchar(50)  NOT NULL COMMENT '工作地点',
    `month`     int(11) NOT NULL COMMENT '月份',
    `w_1`       varchar(255) DEFAULT '0' COMMENT '天',
    `w_2`       varchar(255) DEFAULT '0' COMMENT '天',
    `w_3`       varchar(255) DEFAULT NULL COMMENT '天',
    `w_4`       varchar(200) DEFAULT NULL COMMENT '天',
    `w_5`       varchar(200) DEFAULT NULL COMMENT '天',
    `w_6`       varchar(200) DEFAULT NULL COMMENT '天',
    `w_7`       varchar(200) DEFAULT NULL COMMENT '天',
    `w_8`       varchar(200) DEFAULT NULL COMMENT '天',
    `w_9`       varchar(200) DEFAULT NULL COMMENT '天',
    `w_10`      varchar(250) DEFAULT NULL COMMENT '天',
    `w_11`      varchar(200) DEFAULT NULL COMMENT '天',
    `w_12`      varchar(200) DEFAULT NULL COMMENT '天',
    `w_13`      varchar(200) DEFAULT NULL COMMENT '天',
    `w_14`      varchar(200) DEFAULT NULL COMMENT '天',
    `w_15`      varchar(200) DEFAULT NULL COMMENT '天',
    `w_16`      varchar(200) DEFAULT NULL COMMENT '天',
    `w_17`      varchar(200) DEFAULT NULL COMMENT '天',
    `w_18`      varchar(210) DEFAULT NULL COMMENT '天',
    `w_19`      varchar(210) DEFAULT NULL COMMENT '天',
    `w_20`      varchar(210) DEFAULT NULL COMMENT '天',
    `w_21`      varchar(210) DEFAULT NULL COMMENT '天',
    `w_22`      varchar(210) DEFAULT NULL COMMENT '天',
    `w_23`      varchar(120) DEFAULT NULL COMMENT '天',
    `w_24`      varchar(210) DEFAULT NULL COMMENT '天',
    `w_25`      varchar(210) DEFAULT NULL COMMENT '天',
    `w_26`      varchar(210) DEFAULT NULL COMMENT '天',
    `w_27`      varchar(210) DEFAULT NULL COMMENT '天',
    `w_28`      varchar(210) DEFAULT NULL COMMENT '天',
    `w_29`      varchar(210) DEFAULT NULL COMMENT '天',
    `w_30`      varchar(210) DEFAULT NULL COMMENT '天',
    `w_31`      varchar(210) DEFAULT NULL COMMENT '天',
    `beonduty`  varchar(120) DEFAULT NULL COMMENT '上班时长',
    PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of worktable
-- ----------------------------
INSERT INTO `worktable`
VALUES ('1625106786001', '李四', '1', '1', '1.00', '1.00', '1.00', '1.00', '1.00', '1.00', '5.00', '68.00', '7.00',
        '7.00', '6.00', '15.00', '54.00', '5.00', '7.00', '7.00', '6.00', '6.00', '4.00', '6.00', '7.00', '7.00',
        '4.00', '4.00', '5.00', '6.00', '5.00', '6.00', '5.00', '4.00', '4.00', '0.00');
INSERT INTO `worktable`
VALUES ('1625108430617', 'wangwu ', '1', '1', '23.00', '34.00', '43.00', '0.00', '0.00', '0.00', '1.00', '43.00',
        '34.00', '0.00', '0.00', '0.00', '0.00', '0.00', '345.00', '0.00', '0.00', '0.00', '4.00', '3.00', '43.00',
        '0.00', '0.00', '0.00', '54.00', '543.00', '0.00', '0.00', '0.00', '0.00', '43.00', null);
INSERT INTO `worktable`
VALUES ('1625191544761', '李四', '1', '2', null, null, null, null, null, null, null, null, null, null, null, null, null,
        null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null,
        null);
INSERT INTO `worktable`
VALUES ('1625192155373', '測試', '1', '1', null, null, null, null, null, null, null, null, null, null, null, null, null,
        null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null,
        null);
INSERT INTO `worktable`
VALUES ('1625192272889', '測試2', '1', '1', null, null, null, null, null, null, null, null, null, null, null, null, null,
        null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null,
        null);
INSERT INTO `worktable`
VALUES ('1625192334081', '測試3', '1', '1', null, null, null, null, null, null, null, null, null, null, null, null, null,
        null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null,
        null);
INSERT INTO `worktable`
VALUES ('2', '张三', '1', '1', '3.00', '3.00', '3.00', '3.00', '3.00', '3.00', '3.00', '3.00', '3.00', '3.00', '3.00',
        '3.00', '3.00', '3.00', '3.00', '3.00', '3.00', '3.00', '3.00', '3.00', '3.00', '3.00', '3.00', '3.00', '3.00',
        '5.00', '5.00', '5.00', '5.00', '5.00', '5.00', '0.00');

-- ----------------------------
-- Table structure for year_work_table
-- ----------------------------
DROP TABLE IF EXISTS `year_work_table`;
CREATE TABLE `year_work_table`
(
    `id`   int(11) NOT NULL AUTO_INCREMENT,
    `name` varchar(255) DEFAULT NULL,
    `_1`   double(11, 2
) DEFAULT NULL,
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
INSERT INTO `year_work_table`
VALUES ('1', '程建飞', null, null, null, null, null, null, null, null, null, null, null, null, '1.00', null);
