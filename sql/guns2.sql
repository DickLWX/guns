/*
Navicat MySQL Data Transfer

Source Server         : local
Source Server Version : 50615
Source Host           : localhost:3306
Source Database       : guns

Target Server Type    : MYSQL
Target Server Version : 50615
File Encoding         : 65001

Date: 2019-01-30 20:49:32
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for code_dbinfo
-- ----------------------------
DROP TABLE IF EXISTS `code_dbinfo`;
CREATE TABLE `code_dbinfo` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(20) DEFAULT NULL COMMENT '别名',
  `db_driver` varchar(100) NOT NULL COMMENT '数据库驱动',
  `db_url` varchar(200) NOT NULL COMMENT '数据库地址',
  `db_user_name` varchar(100) NOT NULL COMMENT '数据库账户',
  `db_password` varchar(100) NOT NULL COMMENT '连接密码',
  `db_type` varchar(10) DEFAULT NULL COMMENT '数据库类型',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='数据库链接信息';

-- ----------------------------
-- Records of code_dbinfo
-- ----------------------------

-- ----------------------------
-- Table structure for sys_applyordernum
-- ----------------------------
DROP TABLE IF EXISTS `sys_applyordernum`;
CREATE TABLE `sys_applyordernum` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '接单人申请接单数申请表主键id',
  `userid` int(11) DEFAULT NULL COMMENT '申请人id',
  `mobile` varchar(20) DEFAULT NULL COMMENT '手机号',
  `applynum` int(20) DEFAULT NULL COMMENT '申请接单数',
  `adminid` int(11) DEFAULT NULL COMMENT '审核人id',
  `status` int(11) DEFAULT '0' COMMENT '审核状态0：未通过 1：通过',
  `createdate` timestamp NULL DEFAULT NULL COMMENT '申请时间',
  `reviewdate` timestamp NULL DEFAULT NULL COMMENT '审核时间',
  `deleteflag` int(5) DEFAULT '0' COMMENT '删除标记0：未删除 1:删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='接单人申请接单数表';

-- ----------------------------
-- Records of sys_applyordernum
-- ----------------------------

-- ----------------------------
-- Table structure for sys_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE `sys_dept` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `num` int(11) DEFAULT NULL COMMENT '排序',
  `pid` int(11) DEFAULT NULL COMMENT '父部门id',
  `pids` varchar(255) DEFAULT NULL COMMENT '父级ids',
  `simplename` varchar(45) DEFAULT NULL COMMENT '简称',
  `fullname` varchar(255) DEFAULT NULL COMMENT '全称',
  `tips` varchar(255) DEFAULT NULL COMMENT '提示',
  `version` int(11) DEFAULT NULL COMMENT '版本（乐观锁保留字段）',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8 COMMENT='部门表';

-- ----------------------------
-- Records of sys_dept
-- ----------------------------
INSERT INTO `sys_dept` VALUES ('24', '1', '0', '[0],', '超级管理员', '超级管理员', '', null);
INSERT INTO `sys_dept` VALUES ('25', '2', '24', '[0],[24],', '普通用户', '普通用户', '', null);
INSERT INTO `sys_dept` VALUES ('26', '3', '24', '[0],[24],', '接单人', '接单人', '', null);
INSERT INTO `sys_dept` VALUES ('27', '4', '24', '[0],[24],', '快递点', '快递点', '', null);

-- ----------------------------
-- Table structure for sys_dict
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict`;
CREATE TABLE `sys_dict` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `num` int(11) DEFAULT NULL COMMENT '排序',
  `pid` int(11) DEFAULT NULL COMMENT '父级字典',
  `name` varchar(255) DEFAULT NULL COMMENT '名称',
  `tips` varchar(255) DEFAULT NULL COMMENT '提示',
  `code` varchar(255) DEFAULT NULL COMMENT '值',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=60 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='字典表';

-- ----------------------------
-- Records of sys_dict
-- ----------------------------
INSERT INTO `sys_dict` VALUES ('50', '0', '0', '性别', null, 'sys_sex');
INSERT INTO `sys_dict` VALUES ('51', '1', '50', '男', null, '1');
INSERT INTO `sys_dict` VALUES ('52', '2', '50', '女', null, '2');
INSERT INTO `sys_dict` VALUES ('53', '0', '0', '状态', null, 'sys_state');
INSERT INTO `sys_dict` VALUES ('54', '1', '53', '启用', null, '1');
INSERT INTO `sys_dict` VALUES ('55', '2', '53', '禁用', null, '2');
INSERT INTO `sys_dict` VALUES ('56', '0', '0', '账号状态', null, 'account_state');
INSERT INTO `sys_dict` VALUES ('57', '1', '56', '启用', null, '1');
INSERT INTO `sys_dict` VALUES ('58', '2', '56', '冻结', null, '2');
INSERT INTO `sys_dict` VALUES ('59', '3', '56', '已删除', null, '3');

-- ----------------------------
-- Table structure for sys_expense
-- ----------------------------
DROP TABLE IF EXISTS `sys_expense`;
CREATE TABLE `sys_expense` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `money` decimal(20,2) DEFAULT NULL COMMENT '报销金额',
  `desc` varchar(255) DEFAULT '' COMMENT '描述',
  `createtime` datetime DEFAULT NULL COMMENT '创建时间',
  `state` int(11) DEFAULT NULL COMMENT '状态: 1.待提交  2:待审核   3.审核通过 4:驳回',
  `userid` int(11) DEFAULT NULL COMMENT '用户id',
  `processId` varchar(255) DEFAULT NULL COMMENT '流程定义id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='报销表';

-- ----------------------------
-- Records of sys_expense
-- ----------------------------

-- ----------------------------
-- Table structure for sys_feedback
-- ----------------------------
DROP TABLE IF EXISTS `sys_feedback`;
CREATE TABLE `sys_feedback` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `userid` int(11) DEFAULT NULL COMMENT '用户Id',
  `content` text COMMENT '反馈内容',
  `adminId` int(11) DEFAULT NULL COMMENT '处理人id',
  `reviewcontent` text COMMENT '回复内容',
  `createdate` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `reviewdate` timestamp NULL DEFAULT NULL COMMENT '回复时间',
  `deleteflag` int(5) unsigned zerofill DEFAULT '00000' COMMENT '0:未删除 1：删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户反馈表';

-- ----------------------------
-- Records of sys_feedback
-- ----------------------------

-- ----------------------------
-- Table structure for sys_getorder
-- ----------------------------
DROP TABLE IF EXISTS `sys_getorder`;
CREATE TABLE `sys_getorder` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '接单人表主键id',
  `userid` int(11) DEFAULT NULL COMMENT '用户Id',
  `reputationscore` int(20) DEFAULT NULL COMMENT '信誉积分',
  `ordernum` int(20) DEFAULT NULL COMMENT '接单数',
  `grade` int(5) DEFAULT NULL COMMENT '信誉值',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='接单人表';

-- ----------------------------
-- Records of sys_getorder
-- ----------------------------

-- ----------------------------
-- Table structure for sys_getplace
-- ----------------------------
DROP TABLE IF EXISTS `sys_getplace`;
CREATE TABLE `sys_getplace` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `placeid` int(11) DEFAULT NULL COMMENT '快递点id',
  `userid` int(11) DEFAULT NULL COMMENT '用户id',
  `status` int(5) DEFAULT '0' COMMENT '状态  0:未通过 1:通过',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='接单人，快递点申请对应表';

-- ----------------------------
-- Records of sys_getplace
-- ----------------------------

-- ----------------------------
-- Table structure for sys_login_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_login_log`;
CREATE TABLE `sys_login_log` (
  `id` int(65) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `logname` varchar(255) DEFAULT NULL COMMENT '日志名称',
  `userid` int(65) DEFAULT NULL COMMENT '管理员id',
  `createtime` datetime DEFAULT NULL COMMENT '创建时间',
  `succeed` varchar(255) DEFAULT NULL COMMENT '是否执行成功',
  `message` text COMMENT '具体消息',
  `ip` varchar(255) DEFAULT NULL COMMENT '登录ip',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=301 DEFAULT CHARSET=utf8 COMMENT='登录记录';

-- ----------------------------
-- Records of sys_login_log
-- ----------------------------
INSERT INTO `sys_login_log` VALUES ('217', '登录失败日志', null, '2018-11-04 15:19:47', '成功', '账号:admin,账号密码错误', '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('218', '登录失败日志', null, '2018-11-04 15:19:56', '成功', '账号:admin,账号密码错误', '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('219', '登录日志', '1', '2018-11-04 15:22:16', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('220', '登录日志', '1', '2018-11-04 16:16:09', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('221', '登录日志', '1', '2018-11-12 20:00:48', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('222', '退出日志', '1', '2018-11-12 20:16:18', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('223', '登录日志', '1', '2018-11-12 20:16:24', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('224', '登录日志', '1', '2018-11-12 20:18:05', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('225', '登录日志', '1', '2018-11-12 20:23:09', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('226', '登录日志', '1', '2018-11-12 20:27:32', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('227', '登录日志', '1', '2018-11-12 20:33:21', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('228', '登录日志', '1', '2018-11-12 21:15:50', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('229', '登录日志', '1', '2018-11-12 21:26:32', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('230', '登录日志', '1', '2018-11-18 09:43:30', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('231', '登录日志', '1', '2018-11-18 13:10:46', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('232', '登录日志', '1', '2018-11-18 13:13:03', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('233', '登录日志', '1', '2018-11-18 13:13:49', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('234', '登录日志', '1', '2018-11-18 13:14:14', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('235', '登录日志', '1', '2018-11-18 13:15:22', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('236', '登录日志', '1', '2018-11-18 13:17:48', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('237', '登录日志', '1', '2018-11-18 14:14:41', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('238', '登录日志', '1', '2018-11-18 14:37:27', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('239', '登录日志', '1', '2018-12-01 12:02:32', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('240', '登录日志', '1', '2018-12-01 12:59:40', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('241', '登录日志', '1', '2018-12-01 13:17:27', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('242', '登录日志', '1', '2018-12-01 13:19:12', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('243', '登录日志', '1', '2018-12-01 14:47:09', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('244', '登录日志', '1', '2018-12-01 14:55:00', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('245', '登录日志', '1', '2018-12-01 14:56:55', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('246', '登录日志', '1', '2018-12-01 15:05:13', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('247', '登录日志', '1', '2018-12-01 15:08:52', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('248', '登录日志', '1', '2018-12-01 15:11:40', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('249', '登录日志', '1', '2018-12-01 15:12:16', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('250', '登录日志', '1', '2018-12-01 22:45:27', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('251', '登录日志', '1', '2018-12-01 22:56:58', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('252', '登录失败日志', null, '2018-12-25 21:06:31', '成功', '账号:admin,账号密码错误', '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('253', '登录日志', '1', '2018-12-25 21:06:38', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('254', '登录日志', '1', '2018-12-28 20:57:36', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('255', '登录日志', '1', '2018-12-30 09:37:24', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('256', '登录日志', '1', '2018-12-30 09:39:19', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('257', '登录日志', '1', '2018-12-30 09:40:42', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('258', '退出日志', '1', '2018-12-30 10:31:22', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('259', '登录日志', '1', '2018-12-30 10:31:28', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('260', '登录日志', '1', '2018-12-30 14:41:28', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('261', '登录日志', '1', '2018-12-30 14:44:32', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('262', '登录日志', '1', '2018-12-30 14:50:13', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('263', '登录日志', '1', '2018-12-30 15:05:59', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('264', '退出日志', '1', '2018-12-30 15:08:37', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('265', '登录日志', '1', '2018-12-30 15:08:46', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('266', '退出日志', '1', '2018-12-30 15:10:29', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('267', '登录日志', '1', '2018-12-30 15:10:36', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('268', '登录失败日志', null, '2018-12-30 15:16:45', '成功', '账号:admin,账号密码错误', '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('269', '登录日志', '1', '2018-12-30 15:16:53', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('270', '退出日志', '1', '2018-12-30 15:22:23', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('271', '登录日志', '1', '2018-12-30 15:22:29', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('272', '登录日志', '1', '2018-12-30 15:22:58', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('273', '退出日志', '1', '2018-12-30 15:24:33', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('274', '登录日志', '1', '2018-12-30 15:24:38', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('275', '退出日志', '1', '2018-12-30 15:25:14', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('276', '登录日志', '1', '2018-12-30 15:25:19', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('277', '登录失败日志', null, '2018-12-31 09:26:08', '成功', '账号:admin,验证码错误', '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('278', '登录日志', '1', '2018-12-31 09:26:33', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('279', '登录失败日志', null, '2018-12-31 10:22:53', '成功', '账号:admin,验证码错误', '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('280', '登录日志', '1', '2018-12-31 10:23:37', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('281', '登录失败日志', null, '2019-01-03 21:37:56', '成功', '账号:prism,账号密码错误', '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('282', '登录失败日志', null, '2019-01-03 21:39:11', '成功', '账号:prism,账号密码错误', '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('283', '登录失败日志', null, '2019-01-03 21:39:58', '成功', '账号:prism,账号密码错误', '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('284', '登录失败日志', null, '2019-01-03 21:43:17', '成功', '账号:prism,账号密码错误', '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('285', '登录失败日志', null, '2019-01-03 21:43:31', '成功', '账号:qdsaD,账号密码错误', '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('286', '登录失败日志', null, '2019-01-21 09:54:19', '成功', '账号:admin,账号密码错误', '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('287', '登录日志', '1', '2019-01-21 09:54:26', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('288', '登录日志', '1', '2019-01-21 11:25:34', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('289', '登录日志', '49', '2019-01-21 11:29:41', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('290', '登录日志', '49', '2019-01-21 11:31:02', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('291', '登录日志', '1', '2019-01-21 11:35:12', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('292', '登录日志', '49', '2019-01-23 09:36:42', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('293', '退出日志', '49', '2019-01-23 09:38:26', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('294', '登录日志', '1', '2019-01-23 09:38:31', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('295', '退出日志', '1', '2019-01-23 09:42:26', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('296', '登录日志', '49', '2019-01-23 09:42:34', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('297', '登录日志', '49', '2019-01-23 09:44:04', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('298', '登录日志', '49', '2019-01-23 09:46:25', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('299', '登录日志', '1', '2019-01-23 09:47:32', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('300', '登录日志', '1', '2019-01-23 09:57:04', '成功', null, '0:0:0:0:0:0:0:1');

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `code` varchar(255) DEFAULT NULL COMMENT '菜单编号',
  `pcode` varchar(255) DEFAULT NULL COMMENT '菜单父编号',
  `pcodes` varchar(255) DEFAULT NULL COMMENT '当前菜单的所有父菜单编号',
  `name` varchar(255) DEFAULT NULL COMMENT '菜单名称',
  `icon` varchar(255) DEFAULT NULL COMMENT '菜单图标',
  `url` varchar(255) DEFAULT NULL COMMENT 'url地址',
  `num` int(65) DEFAULT NULL COMMENT '菜单排序号',
  `levels` int(65) DEFAULT NULL COMMENT '菜单层级',
  `ismenu` int(11) DEFAULT NULL COMMENT '是否是菜单（1：是  0：不是）',
  `tips` varchar(255) DEFAULT NULL COMMENT '备注',
  `status` int(65) DEFAULT NULL COMMENT '菜单状态 :  1:启用   0:不启用',
  `isopen` int(11) DEFAULT NULL COMMENT '是否打开:    1:打开   0:不打开',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=176 DEFAULT CHARSET=utf8 COMMENT='菜单表';

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES ('105', 'system', '0', '[0],', '系统管理', 'fa-user', '#', '4', '1', '1', null, '1', '1');
INSERT INTO `sys_menu` VALUES ('106', 'mgr', 'system', '[0],[system],', '用户管理', '', '/mgr', '1', '2', '1', null, '1', '0');
INSERT INTO `sys_menu` VALUES ('107', 'mgr_add', 'mgr', '[0],[system],[mgr],', '添加用户', null, '/mgr/add', '1', '3', '0', null, '1', '0');
INSERT INTO `sys_menu` VALUES ('108', 'mgr_edit', 'mgr', '[0],[system],[mgr],', '修改用户', null, '/mgr/edit', '2', '3', '0', null, '1', '0');
INSERT INTO `sys_menu` VALUES ('109', 'mgr_delete', 'mgr', '[0],[system],[mgr],', '删除用户', null, '/mgr/delete', '3', '3', '0', null, '1', '0');
INSERT INTO `sys_menu` VALUES ('110', 'mgr_reset', 'mgr', '[0],[system],[mgr],', '重置密码', null, '/mgr/reset', '4', '3', '0', null, '1', '0');
INSERT INTO `sys_menu` VALUES ('111', 'mgr_freeze', 'mgr', '[0],[system],[mgr],', '冻结用户', null, '/mgr/freeze', '5', '3', '0', null, '1', '0');
INSERT INTO `sys_menu` VALUES ('112', 'mgr_unfreeze', 'mgr', '[0],[system],[mgr],', '解除冻结用户', null, '/mgr/unfreeze', '6', '3', '0', null, '1', '0');
INSERT INTO `sys_menu` VALUES ('113', 'mgr_setRole', 'mgr', '[0],[system],[mgr],', '分配角色', null, '/mgr/setRole', '7', '3', '0', null, '1', '0');
INSERT INTO `sys_menu` VALUES ('114', 'role', 'system', '[0],[system],', '角色管理', null, '/role', '2', '2', '1', null, '1', '0');
INSERT INTO `sys_menu` VALUES ('115', 'role_add', 'role', '[0],[system],[role],', '添加角色', null, '/role/add', '1', '3', '0', null, '1', '0');
INSERT INTO `sys_menu` VALUES ('116', 'role_edit', 'role', '[0],[system],[role],', '修改角色', null, '/role/edit', '2', '3', '0', null, '1', '0');
INSERT INTO `sys_menu` VALUES ('117', 'role_remove', 'role', '[0],[system],[role],', '删除角色', null, '/role/remove', '3', '3', '0', null, '1', '0');
INSERT INTO `sys_menu` VALUES ('118', 'role_setAuthority', 'role', '[0],[system],[role],', '配置权限', null, '/role/setAuthority', '4', '3', '0', null, '1', '0');
INSERT INTO `sys_menu` VALUES ('119', 'menu', 'system', '[0],[system],', '菜单管理', null, '/menu', '4', '2', '1', null, '1', '0');
INSERT INTO `sys_menu` VALUES ('120', 'menu_add', 'menu', '[0],[system],[menu],', '添加菜单', null, '/menu/add', '1', '3', '0', null, '1', '0');
INSERT INTO `sys_menu` VALUES ('121', 'menu_edit', 'menu', '[0],[system],[menu],', '修改菜单', null, '/menu/edit', '2', '3', '0', null, '1', '0');
INSERT INTO `sys_menu` VALUES ('122', 'menu_remove', 'menu', '[0],[system],[menu],', '删除菜单', null, '/menu/remove', '3', '3', '0', null, '1', '0');
INSERT INTO `sys_menu` VALUES ('128', 'log', 'system', '[0],[system],', '业务日志', null, '/log', '6', '2', '1', null, '1', '0');
INSERT INTO `sys_menu` VALUES ('130', 'druid', 'system', '[0],[system],', '监控管理', null, '/druid', '7', '2', '1', null, '1', null);
INSERT INTO `sys_menu` VALUES ('131', 'dept', 'system', '[0],[system],', '部门管理', null, '/dept', '3', '2', '1', null, '1', null);
INSERT INTO `sys_menu` VALUES ('132', 'dict', 'system', '[0],[system],', '字典管理', null, '/dict', '4', '2', '1', null, '1', null);
INSERT INTO `sys_menu` VALUES ('133', 'loginLog', 'system', '[0],[system],', '登录日志', null, '/loginLog', '6', '2', '1', null, '1', null);
INSERT INTO `sys_menu` VALUES ('134', 'log_clean', 'log', '[0],[system],[log],', '清空日志', null, '/log/delLog', '3', '3', '0', null, '1', null);
INSERT INTO `sys_menu` VALUES ('135', 'dept_add', 'dept', '[0],[system],[dept],', '添加部门', null, '/dept/add', '1', '3', '0', null, '1', null);
INSERT INTO `sys_menu` VALUES ('136', 'dept_update', 'dept', '[0],[system],[dept],', '修改部门', null, '/dept/update', '1', '3', '0', null, '1', null);
INSERT INTO `sys_menu` VALUES ('137', 'dept_delete', 'dept', '[0],[system],[dept],', '删除部门', null, '/dept/delete', '1', '3', '0', null, '1', null);
INSERT INTO `sys_menu` VALUES ('138', 'dict_add', 'dict', '[0],[system],[dict],', '添加字典', null, '/dict/add', '1', '3', '0', null, '1', null);
INSERT INTO `sys_menu` VALUES ('139', 'dict_update', 'dict', '[0],[system],[dict],', '修改字典', null, '/dict/update', '1', '3', '0', null, '1', null);
INSERT INTO `sys_menu` VALUES ('140', 'dict_delete', 'dict', '[0],[system],[dict],', '删除字典', null, '/dict/delete', '1', '3', '0', null, '1', null);
INSERT INTO `sys_menu` VALUES ('141', 'notice', 'system', '[0],[system],', '通知管理', null, '/notice', '9', '2', '1', null, '1', null);
INSERT INTO `sys_menu` VALUES ('142', 'notice_add', 'notice', '[0],[system],[notice],', '添加通知', null, '/notice/add', '1', '3', '0', null, '1', null);
INSERT INTO `sys_menu` VALUES ('143', 'notice_update', 'notice', '[0],[system],[notice],', '修改通知', null, '/notice/update', '2', '3', '0', null, '1', null);
INSERT INTO `sys_menu` VALUES ('144', 'notice_delete', 'notice', '[0],[system],[notice],', '删除通知', null, '/notice/delete', '3', '3', '0', null, '1', null);
INSERT INTO `sys_menu` VALUES ('145', 'hello', '0', '[0],', '通知', 'fa-rocket', '/notice/hello', '1', '1', '1', null, '1', null);
INSERT INTO `sys_menu` VALUES ('148', 'code', '0', '[0],', '代码生成', 'fa-code', '/code', '3', '1', '1', null, '1', null);
INSERT INTO `sys_menu` VALUES ('149', 'api_mgr', '0', '[0],', '接口文档', 'fa-leaf', '/swagger-ui.html', '2', '1', '1', null, '1', null);
INSERT INTO `sys_menu` VALUES ('150', 'to_menu_edit', 'menu', '[0],[system],[menu],', '菜单编辑跳转', '', '/menu/menu_edit', '4', '3', '0', null, '1', null);
INSERT INTO `sys_menu` VALUES ('151', 'menu_list', 'menu', '[0],[system],[menu],', '菜单列表', '', '/menu/list', '5', '3', '0', null, '1', null);
INSERT INTO `sys_menu` VALUES ('152', 'to_dept_update', 'dept', '[0],[system],[dept],', '修改部门跳转', '', '/dept/dept_update', '4', '3', '0', null, '1', null);
INSERT INTO `sys_menu` VALUES ('153', 'dept_list', 'dept', '[0],[system],[dept],', '部门列表', '', '/dept/list', '5', '3', '0', null, '1', null);
INSERT INTO `sys_menu` VALUES ('154', 'dept_detail', 'dept', '[0],[system],[dept],', '部门详情', '', '/dept/detail', '6', '3', '0', null, '1', null);
INSERT INTO `sys_menu` VALUES ('155', 'to_dict_edit', 'dict', '[0],[system],[dict],', '修改菜单跳转', '', '/dict/dict_edit', '4', '3', '0', null, '1', null);
INSERT INTO `sys_menu` VALUES ('156', 'dict_list', 'dict', '[0],[system],[dict],', '字典列表', '', '/dict/list', '5', '3', '0', null, '1', null);
INSERT INTO `sys_menu` VALUES ('157', 'dict_detail', 'dict', '[0],[system],[dict],', '字典详情', '', '/dict/detail', '6', '3', '0', null, '1', null);
INSERT INTO `sys_menu` VALUES ('158', 'log_list', 'log', '[0],[system],[log],', '日志列表', '', '/log/list', '2', '3', '0', null, '1', null);
INSERT INTO `sys_menu` VALUES ('159', 'log_detail', 'log', '[0],[system],[log],', '日志详情', '', '/log/detail', '3', '3', '0', null, '1', null);
INSERT INTO `sys_menu` VALUES ('160', 'del_login_log', 'loginLog', '[0],[system],[loginLog],', '清空登录日志', '', '/loginLog/delLoginLog', '1', '3', '0', null, '1', null);
INSERT INTO `sys_menu` VALUES ('161', 'login_log_list', 'loginLog', '[0],[system],[loginLog],', '登录日志列表', '', '/loginLog/list', '2', '3', '0', null, '1', null);
INSERT INTO `sys_menu` VALUES ('162', 'to_role_edit', 'role', '[0],[system],[role],', '修改角色跳转', '', '/role/role_edit', '5', '3', '0', null, '1', null);
INSERT INTO `sys_menu` VALUES ('163', 'to_role_assign', 'role', '[0],[system],[role],', '角色分配跳转', '', '/role/role_assign', '6', '3', '0', null, '1', null);
INSERT INTO `sys_menu` VALUES ('164', 'role_list', 'role', '[0],[system],[role],', '角色列表', '', '/role/list', '7', '3', '0', null, '1', null);
INSERT INTO `sys_menu` VALUES ('165', 'to_assign_role', 'mgr', '[0],[system],[mgr],', '分配角色跳转', '', '/mgr/role_assign', '8', '3', '0', null, '1', null);
INSERT INTO `sys_menu` VALUES ('166', 'to_user_edit', 'mgr', '[0],[system],[mgr],', '编辑用户跳转', '', '/mgr/user_edit', '9', '3', '0', null, '1', null);
INSERT INTO `sys_menu` VALUES ('167', 'mgr_list', 'mgr', '[0],[system],[mgr],', '用户列表', '', '/mgr/list', '10', '3', '0', null, '1', null);
INSERT INTO `sys_menu` VALUES ('168', 'placeapply', 'delivery', '[0],[delivery],', '快递点申请', '', '/placeapply', '10', '2', '1', null, '1', '0');
INSERT INTO `sys_menu` VALUES ('169', 'placeapply_list', 'placeapply', '[0],[system],[placeapply],', '快递点申请列表', '', '/placeapply/list', '1', '3', '0', null, '1', '0');
INSERT INTO `sys_menu` VALUES ('170', 'placeapply_add', 'placeapply', '[0],[system],[placeapply],', '快递点申请添加', '', '/placeapply/add', '2', '3', '0', null, '1', '0');
INSERT INTO `sys_menu` VALUES ('171', 'placeapply_update', 'placeapply', '[0],[system],[placeapply],', '快递点申请通过', '', '/placeapply/update', '3', '3', '0', null, '1', '0');
INSERT INTO `sys_menu` VALUES ('172', 'placeapply_delete', 'placeapply', '[0],[system],[placeapply],', '快递点申请删除', '', '/placeapply/delete', '4', '3', '0', null, '1', '0');
INSERT INTO `sys_menu` VALUES ('173', 'placeapply_detail', 'placeapply', '[0],[system],[placeapply],', '快递点申请详情', '', '/placeapply/detail', '5', '3', '0', null, '1', '0');
INSERT INTO `sys_menu` VALUES ('174', 'placeapply_refuse', 'placeapply', '[0],[system],[placeapply],', '快递点申请拒绝', '', '/placeapply/refuse', '6', '3', '0', null, '1', null);
INSERT INTO `sys_menu` VALUES ('175', 'delivery', '0', '[0],', '快递代拿', 'fa-user', '#', '5', '1', '1', null, '1', null);

-- ----------------------------
-- Table structure for sys_notice
-- ----------------------------
DROP TABLE IF EXISTS `sys_notice`;
CREATE TABLE `sys_notice` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `title` varchar(255) DEFAULT NULL COMMENT '标题',
  `type` int(11) DEFAULT NULL COMMENT '类型',
  `content` text COMMENT '内容',
  `createtime` datetime DEFAULT NULL COMMENT '创建时间',
  `creater` int(11) DEFAULT NULL COMMENT '创建人',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COMMENT='通知表';

-- ----------------------------
-- Records of sys_notice
-- ----------------------------
INSERT INTO `sys_notice` VALUES ('6', '世界', '10', '欢迎使用Guns管理系统', '2017-01-11 08:53:20', '1');
INSERT INTO `sys_notice` VALUES ('8', '你好', null, '你好', '2017-05-10 19:28:57', '1');

-- ----------------------------
-- Table structure for sys_operation_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_operation_log`;
CREATE TABLE `sys_operation_log` (
  `id` int(65) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `logtype` varchar(255) DEFAULT NULL COMMENT '日志类型',
  `logname` varchar(255) DEFAULT NULL COMMENT '日志名称',
  `userid` int(65) DEFAULT NULL COMMENT '用户id',
  `classname` varchar(255) DEFAULT NULL COMMENT '类名称',
  `method` text COMMENT '方法名称',
  `createtime` datetime DEFAULT NULL COMMENT '创建时间',
  `succeed` varchar(255) DEFAULT NULL COMMENT '是否成功',
  `message` text COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8 COMMENT='操作日志';

-- ----------------------------
-- Records of sys_operation_log
-- ----------------------------
INSERT INTO `sys_operation_log` VALUES ('1', '业务日志', '修改角色', '1', 'cn.stylefeng.guns.modular.system.controller.RoleController', 'edit', '2018-11-12 21:18:44', '成功', '角色名称=普通用户;;;字段名称:角色名称,旧值:临时,新值:普通用户;;;字段名称:部门名称,旧值:接单人,新值:普通用户;;;字段名称:备注,旧值:temp,新值:client');
INSERT INTO `sys_operation_log` VALUES ('2', '业务日志', '添加角色', '1', 'cn.stylefeng.guns.modular.system.controller.RoleController', 'add', '2018-11-12 21:19:57', '成功', '角色名称=接单人');
INSERT INTO `sys_operation_log` VALUES ('3', '业务日志', '添加角色', '1', 'cn.stylefeng.guns.modular.system.controller.RoleController', 'add', '2018-11-12 21:20:30', '成功', '角色名称=快递点');
INSERT INTO `sys_operation_log` VALUES ('4', '业务日志', '修改角色', '1', 'cn.stylefeng.guns.modular.system.controller.RoleController', 'edit', '2018-11-12 21:20:40', '成功', '角色名称=快递点;;;');
INSERT INTO `sys_operation_log` VALUES ('5', '业务日志', '修改角色', '1', 'cn.stylefeng.guns.modular.system.controller.RoleController', 'edit', '2018-11-12 21:20:46', '成功', '角色名称=快递点;;;字段名称:角色的父级,旧值:--,新值:超级管理员');
INSERT INTO `sys_operation_log` VALUES ('6', '业务日志', '菜单新增', '1', 'cn.stylefeng.guns.modular.system.controller.MenuController', 'add', '2018-11-12 21:24:06', '成功', '菜单名称=申请信息');
INSERT INTO `sys_operation_log` VALUES ('7', '业务日志', '修改菜单', '1', 'cn.stylefeng.guns.modular.system.controller.MenuController', 'edit', '2018-11-12 21:25:55', '成功', '菜单名称=申请信息;;;字段名称:url地址,旧值:#,新值:/code');
INSERT INTO `sys_operation_log` VALUES ('8', '业务日志', '修改菜单', '1', 'cn.stylefeng.guns.modular.system.controller.MenuController', 'edit', '2018-11-12 21:27:19', '成功', '菜单名称=代码生成;;;字段名称:null,旧值:1,新值:0');
INSERT INTO `sys_operation_log` VALUES ('9', '业务日志', '修改菜单', '1', 'cn.stylefeng.guns.modular.system.controller.MenuController', 'edit', '2018-11-12 21:27:52', '成功', '菜单名称=代码生成;;;字段名称:null,旧值:0,新值:1');
INSERT INTO `sys_operation_log` VALUES ('10', '业务日志', '配置权限', '1', 'cn.stylefeng.guns.modular.system.controller.RoleController', 'setAuthority', '2018-11-12 21:30:23', '成功', '角色名称=超级管理员,资源名称=系统管理,用户管理,添加用户,修改用户,删除用户,重置密码,冻结用户,解除冻结用户,分配角色,分配角色跳转,编辑用户跳转,用户列表,角色管理,添加角色,修改角色,删除角色,配置权限,修改角色跳转,角色分配跳转,角色列表,菜单管理,添加菜单,修改菜单,删除菜单,菜单编辑跳转,菜单列表,业务日志,清空日志,日志列表,日志详情,监控管理,部门管理,添加部门,修改部门,删除部门,修改部门跳转,部门列表,部门详情,字典管理,添加字典,修改字典,删除字典,修改菜单跳转,字典列表,字典详情,登录日志,清空登录日志,登录日志列表,通知管理,添加通知,修改通知,删除通知,通知,代码生成,接口文档,申请信息');
INSERT INTO `sys_operation_log` VALUES ('11', '业务日志', '修改菜单', '1', 'cn.stylefeng.guns.modular.system.controller.MenuController', 'edit', '2018-11-18 09:44:57', '成功', '菜单名称=申请信息;;;字段名称:url地址,旧值:/code,新值:#');
INSERT INTO `sys_operation_log` VALUES ('12', '业务日志', '配置权限', '1', 'cn.stylefeng.guns.modular.system.controller.RoleController', 'setAuthority', '2018-11-18 09:59:21', '成功', '角色名称=超级管理员,资源名称=系统管理,用户管理,添加用户,修改用户,删除用户,重置密码,冻结用户,解除冻结用户,分配角色,分配角色跳转,编辑用户跳转,用户列表,角色管理,添加角色,修改角色,删除角色,配置权限,修改角色跳转,角色分配跳转,角色列表,菜单管理,添加菜单,修改菜单,删除菜单,菜单编辑跳转,菜单列表,业务日志,清空日志,日志列表,日志详情,监控管理,部门管理,添加部门,修改部门,删除部门,修改部门跳转,部门列表,部门详情,字典管理,添加字典,修改字典,删除字典,修改菜单跳转,字典列表,字典详情,登录日志,清空登录日志,登录日志列表,通知管理,添加通知,修改通知,删除通知,通知,代码生成,接口文档');
INSERT INTO `sys_operation_log` VALUES ('13', '业务日志', '删除菜单', '1', 'cn.stylefeng.guns.modular.system.controller.MenuController', 'remove', '2018-11-18 09:59:37', '成功', '菜单id=168');
INSERT INTO `sys_operation_log` VALUES ('14', '业务日志', '配置权限', '1', 'cn.stylefeng.guns.modular.system.controller.RoleController', 'setAuthority', '2018-11-18 10:10:58', '成功', '角色名称=超级管理员,资源名称=系统管理,用户管理,添加用户,修改用户,删除用户,重置密码,冻结用户,解除冻结用户,分配角色,分配角色跳转,编辑用户跳转,用户列表,角色管理,添加角色,修改角色,删除角色,配置权限,修改角色跳转,角色分配跳转,角色列表,菜单管理,添加菜单,修改菜单,删除菜单,菜单编辑跳转,菜单列表,业务日志,清空日志,日志列表,日志详情,监控管理,部门管理,添加部门,修改部门,删除部门,修改部门跳转,部门列表,部门详情,字典管理,添加字典,修改字典,删除字典,修改菜单跳转,字典列表,字典详情,登录日志,清空登录日志,登录日志列表,通知管理,添加通知,修改通知,删除通知,快递点申请,快递点申请列表,快递点申请添加,快递点申请更新,快递点申请删除,快递点申请详情,通知,代码生成,接口文档');
INSERT INTO `sys_operation_log` VALUES ('15', '业务日志', '分配角色', '1', 'cn.stylefeng.guns.modular.system.controller.UserMgrController', 'setRole', '2018-11-18 13:23:53', '成功', '账号=接单人,角色名称集合=接单人');
INSERT INTO `sys_operation_log` VALUES ('16', '业务日志', '分配角色', '1', 'cn.stylefeng.guns.modular.system.controller.UserMgrController', 'setRole', '2018-11-18 13:24:06', '成功', '账号=快递点,角色名称集合=快递点');
INSERT INTO `sys_operation_log` VALUES ('17', '异常日志', '', '1', null, null, '2018-11-18 13:27:02', '失败', 'cn.stylefeng.roses.kernel.model.exception.ServiceException: 不能修改超级管理员角色\r\n	at cn.stylefeng.guns.modular.system.controller.UserMgrController.setRole(UserMgrController.java:346)\r\n	at cn.stylefeng.guns.modular.system.controller.UserMgrControllerTTFastClassBySpringCGLIBTT7c4c2edf.invoke(<generated>)\r\n	at org.springframework.cglib.proxy.MethodProxy.invoke(MethodProxy.java:204)\r\n	at org.springframework.aop.framework.CglibAopProxyTCglibMethodInvocation.invokeJoinpoint(CglibAopProxy.java:747)\r\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:163)\r\n	at org.springframework.aop.aspectj.MethodInvocationProceedingJoinPoint.proceed(MethodInvocationProceedingJoinPoint.java:89)\r\n	at cn.stylefeng.guns.core.interceptor.SessionHolderInterceptor.sessionKit(SessionHolderInterceptor.java:44)\r\n	at sun.reflect.GeneratedMethodAccessor105.invoke(Unknown Source)\r\n	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\r\n	at java.lang.reflect.Method.invoke(Method.java:498)\r\n	at org.springframework.aop.aspectj.AbstractAspectJAdvice.invokeAdviceMethodWithGivenArgs(AbstractAspectJAdvice.java:644)\r\n	at org.springframework.aop.aspectj.AbstractAspectJAdvice.invokeAdviceMethod(AbstractAspectJAdvice.java:633)\r\n	at org.springframework.aop.aspectj.AspectJAroundAdvice.invoke(AspectJAroundAdvice.java:70)\r\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:185)\r\n	at org.springframework.aop.aspectj.MethodInvocationProceedingJoinPoint.proceed(MethodInvocationProceedingJoinPoint.java:89)\r\n	at cn.stylefeng.guns.core.aop.LogAop.recordSysLog(LogAop.java:60)\r\n	at sun.reflect.NativeMethodAccessorImpl.invoke0(Native Method)\r\n	at sun.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:62)\r\n	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\r\n	at java.lang.reflect.Method.invoke(Method.java:498)\r\n	at org.springframework.aop.aspectj.AbstractAspectJAdvice.invokeAdviceMethodWithGivenArgs(AbstractAspectJAdvice.java:644)\r\n	at org.springframework.aop.aspectj.AbstractAspectJAdvice.invokeAdviceMethod(AbstractAspectJAdvice.java:633)\r\n	at org.springframework.aop.aspectj.AspectJAroundAdvice.invoke(AspectJAroundAdvice.java:70)\r\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:174)\r\n	at org.springframework.aop.aspectj.MethodInvocationProceedingJoinPoint.proceed(MethodInvocationProceedingJoinPoint.java:89)\r\n	at cn.stylefeng.guns.core.aop.PermissionAop.doPermission(PermissionAop.java:72)\r\n	at sun.reflect.GeneratedMethodAccessor135.invoke(Unknown Source)\r\n	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\r\n	at java.lang.reflect.Method.invoke(Method.java:498)\r\n	at org.springframework.aop.aspectj.AbstractAspectJAdvice.invokeAdviceMethodWithGivenArgs(AbstractAspectJAdvice.java:644)\r\n	at org.springframework.aop.aspectj.AbstractAspectJAdvice.invokeAdviceMethod(AbstractAspectJAdvice.java:633)\r\n	at org.springframework.aop.aspectj.AspectJAroundAdvice.invoke(AspectJAroundAdvice.java:70)\r\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:174)\r\n	at org.springframework.aop.interceptor.ExposeInvocationInterceptor.invoke(ExposeInvocationInterceptor.java:92)\r\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:185)\r\n	at org.springframework.aop.framework.CglibAopProxyTDynamicAdvisedInterceptor.intercept(CglibAopProxy.java:689)\r\n	at cn.stylefeng.guns.modular.system.controller.UserMgrControllerTTEnhancerBySpringCGLIBTT61556c05.setRole(<generated>)\r\n	at sun.reflect.NativeMethodAccessorImpl.invoke0(Native Method)\r\n	at sun.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:62)\r\n	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\r\n	at java.lang.reflect.Method.invoke(Method.java:498)\r\n	at org.springframework.web.method.support.InvocableHandlerMethod.doInvoke(InvocableHandlerMethod.java:209)\r\n	at org.springframework.web.method.support.InvocableHandlerMethod.invokeForRequest(InvocableHandlerMethod.java:136)\r\n	at org.springframework.web.servlet.mvc.method.annotation.ServletInvocableHandlerMethod.invokeAndHandle(ServletInvocableHandlerMethod.java:102)\r\n	at org.springframework.web.servlet.mvc.method.annotation.RequestMappingHandlerAdapter.invokeHandlerMethod(RequestMappingHandlerAdapter.java:877)\r\n	at org.springframework.web.servlet.mvc.method.annotation.RequestMappingHandlerAdapter.handleInternal(RequestMappingHandlerAdapter.java:783)\r\n	at org.springframework.web.servlet.mvc.method.AbstractHandlerMethodAdapter.handle(AbstractHandlerMethodAdapter.java:87)\r\n	at org.springframework.web.servlet.DispatcherServlet.doDispatch(DispatcherServlet.java:991)\r\n	at org.springframework.web.servlet.DispatcherServlet.doService(DispatcherServlet.java:925)\r\n	at org.springframework.web.servlet.FrameworkServlet.processRequest(FrameworkServlet.java:974)\r\n	at org.springframework.web.servlet.FrameworkServlet.doPost(FrameworkServlet.java:877)\r\n	at javax.servlet.http.HttpServlet.service(HttpServlet.java:661)\r\n	at org.springframework.web.servlet.FrameworkServlet.service(FrameworkServlet.java:851)\r\n	at javax.servlet.http.HttpServlet.service(HttpServlet.java:742)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:231)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at org.apache.tomcat.websocket.server.WsFilter.doFilter(WsFilter.java:52)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at org.apache.shiro.web.servlet.ProxiedFilterChain.doFilter(ProxiedFilterChain.java:61)\r\n	at org.apache.shiro.web.servlet.AdviceFilter.executeChain(AdviceFilter.java:108)\r\n	at org.apache.shiro.web.servlet.AdviceFilter.doFilterInternal(AdviceFilter.java:137)\r\n	at org.apache.shiro.web.servlet.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:125)\r\n	at org.apache.shiro.web.servlet.ProxiedFilterChain.doFilter(ProxiedFilterChain.java:66)\r\n	at org.apache.shiro.web.servlet.AbstractShiroFilter.executeChain(AbstractShiroFilter.java:449)\r\n	at org.apache.shiro.web.servlet.AbstractShiroFilterT1.call(AbstractShiroFilter.java:365)\r\n	at org.apache.shiro.subject.support.SubjectCallable.doCall(SubjectCallable.java:90)\r\n	at org.apache.shiro.subject.support.SubjectCallable.call(SubjectCallable.java:83)\r\n	at org.apache.shiro.subject.support.DelegatingSubject.execute(DelegatingSubject.java:387)\r\n	at org.apache.shiro.web.servlet.AbstractShiroFilter.doFilterInternal(AbstractShiroFilter.java:362)\r\n	at org.apache.shiro.web.servlet.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:125)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at cn.stylefeng.roses.core.xss.XssFilter.doFilter(XssFilter.java:31)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at com.alibaba.druid.support.http.WebStatFilter.doFilter(WebStatFilter.java:123)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at org.springframework.web.filter.RequestContextFilter.doFilterInternal(RequestContextFilter.java:99)\r\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:107)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at org.springframework.web.filter.HttpPutFormContentFilter.doFilterInternal(HttpPutFormContentFilter.java:109)\r\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:107)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at org.springframework.web.filter.HiddenHttpMethodFilter.doFilterInternal(HiddenHttpMethodFilter.java:81)\r\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:107)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at org.springframework.web.filter.CharacterEncodingFilter.doFilterInternal(CharacterEncodingFilter.java:200)\r\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:107)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at org.apache.catalina.core.StandardWrapperValve.invoke(StandardWrapperValve.java:198)\r\n	at org.apache.catalina.core.StandardContextValve.invoke(StandardContextValve.java:96)\r\n	at org.apache.catalina.authenticator.AuthenticatorBase.invoke(AuthenticatorBase.java:496)\r\n	at org.apache.catalina.core.StandardHostValve.invoke(StandardHostValve.java:140)\r\n	at org.apache.catalina.valves.ErrorReportValve.invoke(ErrorReportValve.java:81)\r\n	at org.apache.catalina.core.StandardEngineValve.invoke(StandardEngineValve.java:87)\r\n	at org.apache.catalina.connector.CoyoteAdapter.service(CoyoteAdapter.java:342)\r\n	at org.apache.coyote.http11.Http11Processor.service(Http11Processor.java:803)\r\n	at org.apache.coyote.AbstractProcessorLight.process(AbstractProcessorLight.java:66)\r\n	at org.apache.coyote.AbstractProtocolTConnectionHandler.process(AbstractProtocol.java:790)\r\n	at org.apache.tomcat.util.net.NioEndpointTSocketProcessor.doRun(NioEndpoint.java:1459)\r\n	at org.apache.tomcat.util.net.SocketProcessorBase.run(SocketProcessorBase.java:49)\r\n	at java.util.concurrent.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1149)\r\n	at java.util.concurrent.ThreadPoolExecutorTWorker.run(ThreadPoolExecutor.java:624)\r\n	at org.apache.tomcat.util.threads.TaskThreadTWrappingRunnable.run(TaskThread.java:61)\r\n	at java.lang.Thread.run(Thread.java:748)\r\n');
INSERT INTO `sys_operation_log` VALUES ('18', '业务日志', '分配角色', '1', 'cn.stylefeng.guns.modular.system.controller.UserMgrController', 'setRole', '2018-11-18 13:31:55', '成功', '账号=接单人,角色名称集合=快递点');
INSERT INTO `sys_operation_log` VALUES ('19', '业务日志', '分配角色', '1', 'cn.stylefeng.guns.modular.system.controller.UserMgrController', 'setRole', '2018-11-18 13:33:28', '成功', '账号=接单人,角色名称集合=接单人');
INSERT INTO `sys_operation_log` VALUES ('20', '业务日志', '配置权限', '1', 'cn.stylefeng.guns.modular.system.controller.RoleController', 'setAuthority', '2018-12-30 10:28:17', '成功', '角色名称=超级管理员,资源名称=系统管理,用户管理,添加用户,修改用户,删除用户,重置密码,冻结用户,解除冻结用户,分配角色,分配角色跳转,编辑用户跳转,用户列表,角色管理,添加角色,修改角色,删除角色,配置权限,修改角色跳转,角色分配跳转,角色列表,菜单管理,添加菜单,修改菜单,删除菜单,菜单编辑跳转,菜单列表,业务日志,清空日志,日志列表,日志详情,监控管理,部门管理,添加部门,修改部门,删除部门,修改部门跳转,部门列表,部门详情,字典管理,添加字典,修改字典,删除字典,修改菜单跳转,字典列表,字典详情,登录日志,清空登录日志,登录日志列表,通知管理,添加通知,修改通知,删除通知,快递点申请,快递点申请列表,快递点申请通过,通知,代码生成,接口文档');
INSERT INTO `sys_operation_log` VALUES ('21', '业务日志', '配置权限', '1', 'cn.stylefeng.guns.modular.system.controller.RoleController', 'setAuthority', '2018-12-30 10:30:56', '成功', '角色名称=超级管理员,资源名称=系统管理,用户管理,添加用户,修改用户,删除用户,重置密码,冻结用户,解除冻结用户,分配角色,分配角色跳转,编辑用户跳转,用户列表,角色管理,添加角色,修改角色,删除角色,配置权限,修改角色跳转,角色分配跳转,角色列表,菜单管理,添加菜单,修改菜单,删除菜单,菜单编辑跳转,菜单列表,业务日志,清空日志,日志列表,日志详情,监控管理,部门管理,添加部门,修改部门,删除部门,修改部门跳转,部门列表,部门详情,字典管理,添加字典,修改字典,删除字典,修改菜单跳转,字典列表,字典详情,登录日志,清空登录日志,登录日志列表,通知管理,添加通知,修改通知,删除通知,快递点申请,快递点申请列表,快递点申请通过,快递点申请删除,快递点申请详情,通知,代码生成,接口文档');
INSERT INTO `sys_operation_log` VALUES ('22', '业务日志', '配置权限', '1', 'cn.stylefeng.guns.modular.system.controller.RoleController', 'setAuthority', '2018-12-30 10:38:08', '成功', '角色名称=超级管理员,资源名称=系统管理,用户管理,添加用户,修改用户,删除用户,重置密码,冻结用户,解除冻结用户,分配角色,分配角色跳转,编辑用户跳转,用户列表,角色管理,添加角色,修改角色,删除角色,配置权限,修改角色跳转,角色分配跳转,角色列表,菜单管理,添加菜单,修改菜单,删除菜单,菜单编辑跳转,菜单列表,业务日志,清空日志,日志列表,日志详情,监控管理,部门管理,添加部门,修改部门,删除部门,修改部门跳转,部门列表,部门详情,字典管理,添加字典,修改字典,删除字典,修改菜单跳转,字典列表,字典详情,登录日志,清空登录日志,登录日志列表,通知管理,添加通知,修改通知,删除通知,快递点申请,快递点申请列表,快递点申请通过,快递点申请删除,通知,代码生成,接口文档');
INSERT INTO `sys_operation_log` VALUES ('23', '业务日志', '配置权限', '1', 'cn.stylefeng.guns.modular.system.controller.RoleController', 'setAuthority', '2018-12-30 15:08:31', '成功', '角色名称=超级管理员,资源名称=系统管理,用户管理,添加用户,修改用户,删除用户,重置密码,冻结用户,解除冻结用户,分配角色,分配角色跳转,编辑用户跳转,用户列表,角色管理,添加角色,修改角色,删除角色,配置权限,修改角色跳转,角色分配跳转,角色列表,菜单管理,添加菜单,修改菜单,删除菜单,菜单编辑跳转,菜单列表,业务日志,清空日志,日志列表,日志详情,监控管理,部门管理,添加部门,修改部门,删除部门,修改部门跳转,部门列表,部门详情,字典管理,添加字典,修改字典,删除字典,修改菜单跳转,字典列表,字典详情,登录日志,清空登录日志,登录日志列表,通知管理,添加通知,修改通知,删除通知,快递点申请,快递点申请列表,快递点申请通过,快递点申请删除,快递点申请拒绝,通知,代码生成,接口文档');
INSERT INTO `sys_operation_log` VALUES ('24', '业务日志', '修改菜单', '1', 'cn.stylefeng.guns.modular.system.controller.MenuController', 'edit', '2018-12-30 15:10:23', '成功', '菜单名称=快递点申请拒绝;;;字段名称:菜单编号,旧值:placeapply_refus,新值:placeapply_refuse;;;字段名称:url地址,旧值:/placeapply/refus,新值:/placeapply/refuse');
INSERT INTO `sys_operation_log` VALUES ('25', '业务日志', '菜单新增', '1', 'cn.stylefeng.guns.modular.system.controller.MenuController', 'add', '2018-12-30 15:21:53', '成功', '菜单名称=快递代拿');
INSERT INTO `sys_operation_log` VALUES ('26', '业务日志', '修改菜单', '1', 'cn.stylefeng.guns.modular.system.controller.MenuController', 'edit', '2018-12-30 15:22:20', '成功', '菜单名称=快递代拿;;;字段名称:菜单图标,旧值:,新值:fa-user');
INSERT INTO `sys_operation_log` VALUES ('27', '业务日志', '修改菜单', '1', 'cn.stylefeng.guns.modular.system.controller.MenuController', 'edit', '2018-12-30 15:24:06', '成功', '菜单名称=快递点申请;;;字段名称:菜单父编号,旧值:105,新值:175');
INSERT INTO `sys_operation_log` VALUES ('28', '业务日志', '配置权限', '1', 'cn.stylefeng.guns.modular.system.controller.RoleController', 'setAuthority', '2018-12-30 15:25:11', '成功', '角色名称=超级管理员,资源名称=系统管理,用户管理,添加用户,修改用户,删除用户,重置密码,冻结用户,解除冻结用户,分配角色,分配角色跳转,编辑用户跳转,用户列表,角色管理,添加角色,修改角色,删除角色,配置权限,修改角色跳转,角色分配跳转,角色列表,菜单管理,添加菜单,修改菜单,删除菜单,菜单编辑跳转,菜单列表,业务日志,清空日志,日志列表,日志详情,监控管理,部门管理,添加部门,修改部门,删除部门,修改部门跳转,部门列表,部门详情,字典管理,添加字典,修改字典,删除字典,修改菜单跳转,字典列表,字典详情,登录日志,清空登录日志,登录日志列表,通知管理,添加通知,修改通知,删除通知,通知,代码生成,接口文档,快递代拿,快递点申请,快递点申请列表,快递点申请通过,快递点申请删除,快递点申请详情,快递点申请拒绝');
INSERT INTO `sys_operation_log` VALUES ('29', '业务日志', '分配角色', '1', 'cn.stylefeng.guns.modular.system.controller.UserMgrController', 'setRole', '2019-01-21 10:05:34', '成功', '账号=wenxuanli,角色名称集合=普通用户');
INSERT INTO `sys_operation_log` VALUES ('30', '业务日志', '配置权限', '1', 'cn.stylefeng.guns.modular.system.controller.RoleController', 'setAuthority', '2019-01-21 11:30:34', '成功', '角色名称=普通用户,资源名称=快递代拿,快递点申请,快递点申请列表');
INSERT INTO `sys_operation_log` VALUES ('31', '业务日志', '修改管理员', '49', 'cn.stylefeng.guns.modular.system.controller.UserMgrController', 'edit', '2019-01-21 11:31:50', '成功', '账号=wenxuanli;;;字段名称:null,旧值:fb41c7c91a8a5551626e0016b11eed01,新值:');
INSERT INTO `sys_operation_log` VALUES ('32', '业务日志', '修改管理员', '49', 'cn.stylefeng.guns.modular.system.controller.UserMgrController', 'edit', '2019-01-21 11:32:07', '成功', '账号=wenxuanli;;;字段名称:null,旧值:fb41c7c91a8a5551626e0016b11eed01,新值:');
INSERT INTO `sys_operation_log` VALUES ('33', '业务日志', '修改管理员', '1', 'cn.stylefeng.guns.modular.system.controller.UserMgrController', 'edit', '2019-01-21 11:37:33', '成功', '账号=admin;;;字段名称:null,旧值:ecfadcde9305f8891bcfe5a1e28c253e,新值:');
INSERT INTO `sys_operation_log` VALUES ('34', '业务日志', '分配角色', '1', 'cn.stylefeng.guns.modular.system.controller.UserMgrController', 'setRole', '2019-01-21 11:40:04', '成功', '账号=快递点,角色名称集合=接单人');
INSERT INTO `sys_operation_log` VALUES ('35', '业务日志', '分配角色', '1', 'cn.stylefeng.guns.modular.system.controller.UserMgrController', 'setRole', '2019-01-21 11:40:18', '成功', '账号=快递点,角色名称集合=快递点');

-- ----------------------------
-- Table structure for sys_order
-- ----------------------------
DROP TABLE IF EXISTS `sys_order`;
CREATE TABLE `sys_order` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '订单表主键Id',
  `userid` int(11) DEFAULT NULL COMMENT '发单人id',
  `placeid` int(11) DEFAULT NULL COMMENT '快递点Id',
  `getid` int(11) DEFAULT NULL COMMENT '接单人id',
  `mobile` varchar(20) DEFAULT NULL COMMENT '手机号',
  `address` varchar(20) DEFAULT NULL COMMENT '送达地址',
  `score` int(20) DEFAULT NULL COMMENT '悬赏积分',
  `size` int(5) DEFAULT NULL COMMENT '货物尺寸',
  `name` varchar(20) DEFAULT NULL COMMENT '收件人名字',
  `weight` int(5) DEFAULT NULL COMMENT '货物重量',
  `reputation` int(20) DEFAULT NULL COMMENT '所需信誉积分',
  `createdate` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `limitdate` timestamp NULL DEFAULT NULL COMMENT '最迟期限',
  `finishdate` timestamp NULL DEFAULT NULL COMMENT '订单完成时间',
  `grade` int(11) DEFAULT NULL COMMENT '信誉分',
  `content` text COMMENT '评论',
  `status` int(5) DEFAULT '0' COMMENT '订单状态0：未被接单 1：已接单 2：完成 3：超时',
  `deleteflag` int(5) DEFAULT '0' COMMENT '删除标记0:未删除 1:已删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='订单表';

-- ----------------------------
-- Records of sys_order
-- ----------------------------

-- ----------------------------
-- Table structure for sys_orderapply
-- ----------------------------
DROP TABLE IF EXISTS `sys_orderapply`;
CREATE TABLE `sys_orderapply` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `placeid` int(5) DEFAULT NULL COMMENT '快递点id',
  `userid` int(11) DEFAULT NULL COMMENT '申请人id',
  `introduction` text COMMENT '申请说明',
  `mobile` varchar(20) DEFAULT NULL COMMENT '手机号',
  `status` int(5) DEFAULT '0' COMMENT '状态0：未通过1：通过',
  `adminid` int(11) DEFAULT NULL COMMENT '管理员id',
  `createdate` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `reviewdate` timestamp NULL DEFAULT NULL COMMENT '审核时间',
  `deleteflag` int(5) DEFAULT '0' COMMENT '删除标志0：未删除1：删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='申请成为接单人';

-- ----------------------------
-- Records of sys_orderapply
-- ----------------------------

-- ----------------------------
-- Table structure for sys_place
-- ----------------------------
DROP TABLE IF EXISTS `sys_place`;
CREATE TABLE `sys_place` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键Id',
  `userid` int(11) DEFAULT NULL COMMENT '用户id',
  `address` varchar(20) DEFAULT NULL COMMENT '快递点地址',
  `description` text COMMENT '快递点描述',
  `createdate` timestamp NULL DEFAULT NULL COMMENT '快递点创建时间',
  `deleteflag` int(11) DEFAULT '0' COMMENT '删除标记0：删除 1：未删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='快递点信息表';

-- ----------------------------
-- Records of sys_place
-- ----------------------------

-- ----------------------------
-- Table structure for sys_placeapply
-- ----------------------------
DROP TABLE IF EXISTS `sys_placeapply`;
CREATE TABLE `sys_placeapply` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键Id',
  `userid` int(11) DEFAULT NULL COMMENT '申请人id',
  `address` varchar(20) DEFAULT NULL COMMENT '快递点地址',
  `description` text COMMENT '快递点描述',
  `mobile` varchar(20) DEFAULT NULL COMMENT '手机号',
  `introduction` text COMMENT '申请说明',
  `createdate` timestamp NULL DEFAULT NULL COMMENT '申请时间',
  `adminid` int(11) DEFAULT NULL COMMENT '管理员id',
  `reviewdate` timestamp NULL DEFAULT NULL COMMENT '审核时间',
  `status` int(5) DEFAULT '0' COMMENT '状态0: 为审核 1:未通过 2：通过',
  `deleteflag` int(5) DEFAULT '0' COMMENT '删除标记0：未删除1：删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='快递点申请表';

-- ----------------------------
-- Records of sys_placeapply
-- ----------------------------
INSERT INTO `sys_placeapply` VALUES ('1', '46', '一食堂', '一食堂菜鸟驿站', '110', '一食堂菜鸟驿站', '2018-11-18 14:15:42', '1', '2018-12-30 15:17:09', '1', '0');

-- ----------------------------
-- Table structure for sys_relation
-- ----------------------------
DROP TABLE IF EXISTS `sys_relation`;
CREATE TABLE `sys_relation` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `menuid` bigint(11) DEFAULT NULL COMMENT '菜单id',
  `roleid` int(11) DEFAULT NULL COMMENT '角色id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4266 DEFAULT CHARSET=utf8 COMMENT='角色和菜单关联表';

-- ----------------------------
-- Records of sys_relation
-- ----------------------------
INSERT INTO `sys_relation` VALUES ('4201', '105', '1');
INSERT INTO `sys_relation` VALUES ('4202', '106', '1');
INSERT INTO `sys_relation` VALUES ('4203', '107', '1');
INSERT INTO `sys_relation` VALUES ('4204', '108', '1');
INSERT INTO `sys_relation` VALUES ('4205', '109', '1');
INSERT INTO `sys_relation` VALUES ('4206', '110', '1');
INSERT INTO `sys_relation` VALUES ('4207', '111', '1');
INSERT INTO `sys_relation` VALUES ('4208', '112', '1');
INSERT INTO `sys_relation` VALUES ('4209', '113', '1');
INSERT INTO `sys_relation` VALUES ('4210', '165', '1');
INSERT INTO `sys_relation` VALUES ('4211', '166', '1');
INSERT INTO `sys_relation` VALUES ('4212', '167', '1');
INSERT INTO `sys_relation` VALUES ('4213', '114', '1');
INSERT INTO `sys_relation` VALUES ('4214', '115', '1');
INSERT INTO `sys_relation` VALUES ('4215', '116', '1');
INSERT INTO `sys_relation` VALUES ('4216', '117', '1');
INSERT INTO `sys_relation` VALUES ('4217', '118', '1');
INSERT INTO `sys_relation` VALUES ('4218', '162', '1');
INSERT INTO `sys_relation` VALUES ('4219', '163', '1');
INSERT INTO `sys_relation` VALUES ('4220', '164', '1');
INSERT INTO `sys_relation` VALUES ('4221', '119', '1');
INSERT INTO `sys_relation` VALUES ('4222', '120', '1');
INSERT INTO `sys_relation` VALUES ('4223', '121', '1');
INSERT INTO `sys_relation` VALUES ('4224', '122', '1');
INSERT INTO `sys_relation` VALUES ('4225', '150', '1');
INSERT INTO `sys_relation` VALUES ('4226', '151', '1');
INSERT INTO `sys_relation` VALUES ('4227', '128', '1');
INSERT INTO `sys_relation` VALUES ('4228', '134', '1');
INSERT INTO `sys_relation` VALUES ('4229', '158', '1');
INSERT INTO `sys_relation` VALUES ('4230', '159', '1');
INSERT INTO `sys_relation` VALUES ('4231', '130', '1');
INSERT INTO `sys_relation` VALUES ('4232', '131', '1');
INSERT INTO `sys_relation` VALUES ('4233', '135', '1');
INSERT INTO `sys_relation` VALUES ('4234', '136', '1');
INSERT INTO `sys_relation` VALUES ('4235', '137', '1');
INSERT INTO `sys_relation` VALUES ('4236', '152', '1');
INSERT INTO `sys_relation` VALUES ('4237', '153', '1');
INSERT INTO `sys_relation` VALUES ('4238', '154', '1');
INSERT INTO `sys_relation` VALUES ('4239', '132', '1');
INSERT INTO `sys_relation` VALUES ('4240', '138', '1');
INSERT INTO `sys_relation` VALUES ('4241', '139', '1');
INSERT INTO `sys_relation` VALUES ('4242', '140', '1');
INSERT INTO `sys_relation` VALUES ('4243', '155', '1');
INSERT INTO `sys_relation` VALUES ('4244', '156', '1');
INSERT INTO `sys_relation` VALUES ('4245', '157', '1');
INSERT INTO `sys_relation` VALUES ('4246', '133', '1');
INSERT INTO `sys_relation` VALUES ('4247', '160', '1');
INSERT INTO `sys_relation` VALUES ('4248', '161', '1');
INSERT INTO `sys_relation` VALUES ('4249', '141', '1');
INSERT INTO `sys_relation` VALUES ('4250', '142', '1');
INSERT INTO `sys_relation` VALUES ('4251', '143', '1');
INSERT INTO `sys_relation` VALUES ('4252', '144', '1');
INSERT INTO `sys_relation` VALUES ('4253', '145', '1');
INSERT INTO `sys_relation` VALUES ('4254', '148', '1');
INSERT INTO `sys_relation` VALUES ('4255', '149', '1');
INSERT INTO `sys_relation` VALUES ('4256', '175', '1');
INSERT INTO `sys_relation` VALUES ('4257', '168', '1');
INSERT INTO `sys_relation` VALUES ('4258', '169', '1');
INSERT INTO `sys_relation` VALUES ('4259', '171', '1');
INSERT INTO `sys_relation` VALUES ('4260', '172', '1');
INSERT INTO `sys_relation` VALUES ('4261', '173', '1');
INSERT INTO `sys_relation` VALUES ('4262', '174', '1');
INSERT INTO `sys_relation` VALUES ('4263', '175', '5');
INSERT INTO `sys_relation` VALUES ('4264', '168', '5');
INSERT INTO `sys_relation` VALUES ('4265', '169', '5');

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `num` int(11) DEFAULT NULL COMMENT '序号',
  `pid` int(11) DEFAULT NULL COMMENT '父角色id',
  `name` varchar(255) DEFAULT NULL COMMENT '角色名称',
  `deptid` int(11) DEFAULT NULL COMMENT '部门名称',
  `tips` varchar(255) DEFAULT NULL COMMENT '提示',
  `version` int(11) DEFAULT NULL COMMENT '保留字段(暂时没用）',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COMMENT='角色表';

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES ('1', '1', '0', '超级管理员', '24', 'administrator', '1');
INSERT INTO `sys_role` VALUES ('5', '2', '1', '普通用户', '25', 'client', null);
INSERT INTO `sys_role` VALUES ('6', '3', '1', '接单人', '26', 'getOrder', null);
INSERT INTO `sys_role` VALUES ('7', '4', '1', '快递点', '27', 'place', null);

-- ----------------------------
-- Table structure for sys_statistics
-- ----------------------------
DROP TABLE IF EXISTS `sys_statistics`;
CREATE TABLE `sys_statistics` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '统计表主键Id',
  `statisticsdate` timestamp NULL DEFAULT NULL COMMENT '统计时间',
  `cycledate` varchar(20) DEFAULT NULL COMMENT '统计周期',
  `dayorder` int(20) DEFAULT NULL COMMENT '日单数',
  `monthorder` int(20) DEFAULT NULL COMMENT '月单数',
  `yearorder` int(20) DEFAULT NULL COMMENT '年单数',
  `usernum` int(20) DEFAULT NULL COMMENT '用户数',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='统计表';

-- ----------------------------
-- Records of sys_statistics
-- ----------------------------

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `avatar` varchar(255) DEFAULT NULL COMMENT '头像',
  `account` varchar(45) DEFAULT NULL COMMENT '账号',
  `password` varchar(45) DEFAULT NULL COMMENT '密码',
  `salt` varchar(45) DEFAULT NULL COMMENT 'md5密码盐',
  `name` varchar(45) DEFAULT NULL COMMENT '名字',
  `birthday` datetime DEFAULT NULL COMMENT '生日',
  `sex` int(11) DEFAULT NULL COMMENT '性别（1：男 2：女）',
  `email` varchar(45) DEFAULT NULL COMMENT '电子邮件',
  `phone` varchar(45) DEFAULT NULL COMMENT '电话',
  `roleid` varchar(255) DEFAULT NULL COMMENT '角色id',
  `deptid` int(11) DEFAULT NULL COMMENT '部门id',
  `status` int(11) DEFAULT NULL COMMENT '状态(1：启用  2：冻结  3：删除）',
  `createtime` datetime DEFAULT NULL COMMENT '创建时间',
  `version` int(11) DEFAULT NULL COMMENT '保留字段',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8 COMMENT='管理员表';

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES ('1', 'girl.gif', 'admin', 'ecfadcde9305f8891bcfe5a1e28c253e', '8pgby', '张三', '2017-05-05 00:00:00', '2', 'sn93@qq.com1', '18200000000', '1', '24', '1', '2016-01-29 08:49:53', '25');
INSERT INTO `sys_user` VALUES ('45', 'girl.gif', '接单人', '71887a5ad666a18f709e1d4e693d5a35', '1f7bf', '接单人', '2017-12-04 00:00:00', '1', '', '', '6', '26', '1', '2017-12-04 22:24:02', null);
INSERT INTO `sys_user` VALUES ('46', 'girl.gif', '快递点', 'b53cac62e7175637d4beb3b16b2f7915', 'j3cs9', '快递点', '2017-12-04 00:00:00', '1', '', '', '7', '27', '1', '2017-12-04 22:24:24', null);
INSERT INTO `sys_user` VALUES ('49', null, 'wenxuanli', 'fb41c7c91a8a5551626e0016b11eed01', '8mym1', 'wenxuanli', '2019-01-21 00:00:00', '1', '1076252166@qq.com', '15058123291', '5', '25', '1', '2019-01-03 21:51:34', null);

-- ----------------------------
-- Table structure for sys_userscore
-- ----------------------------
DROP TABLE IF EXISTS `sys_userscore`;
CREATE TABLE `sys_userscore` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `userid` int(11) DEFAULT NULL COMMENT '用户id',
  `score` int(20) DEFAULT NULL COMMENT '用户积分',
  `tempscore` int(20) DEFAULT NULL COMMENT '用户缓存积分',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户积分表';

-- ----------------------------
-- Records of sys_userscore
-- ----------------------------

-- ----------------------------
-- Table structure for test
-- ----------------------------
DROP TABLE IF EXISTS `test`;
CREATE TABLE `test` (
  `aaa` int(11) NOT NULL AUTO_INCREMENT,
  `bbb` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`aaa`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of test
-- ----------------------------
