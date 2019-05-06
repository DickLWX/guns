/*
Navicat MySQL Data Transfer

Source Server         : local
Source Server Version : 50615
Source Host           : localhost:3306
Source Database       : guns

Target Server Type    : MYSQL
Target Server Version : 50615
File Encoding         : 65001

Date: 2019-05-06 23:49:49
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
-- Table structure for qrtz_blob_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_blob_triggers`;
CREATE TABLE `qrtz_blob_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `BLOB_DATA` blob,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `qrtz_blob_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_blob_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_calendars
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_calendars`;
CREATE TABLE `qrtz_calendars` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `CALENDAR_NAME` varchar(200) NOT NULL,
  `CALENDAR` blob NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`CALENDAR_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_calendars
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_cron_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_cron_triggers`;
CREATE TABLE `qrtz_cron_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `CRON_EXPRESSION` varchar(200) NOT NULL,
  `TIME_ZONE_ID` varchar(80) DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `qrtz_cron_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_cron_triggers
-- ----------------------------
INSERT INTO `qrtz_cron_triggers` VALUES ('quartzScheduler1', 'triggerName.deliveryService.orderManager', 'DEFAULT', '*/15 * * * * ?', 'Asia/Shanghai');

-- ----------------------------
-- Table structure for qrtz_fired_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_fired_triggers`;
CREATE TABLE `qrtz_fired_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `ENTRY_ID` varchar(95) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `INSTANCE_NAME` varchar(200) NOT NULL,
  `FIRED_TIME` bigint(13) NOT NULL,
  `SCHED_TIME` bigint(13) NOT NULL,
  `PRIORITY` int(11) NOT NULL,
  `STATE` varchar(16) NOT NULL,
  `JOB_NAME` varchar(200) DEFAULT NULL,
  `JOB_GROUP` varchar(200) DEFAULT NULL,
  `IS_NONCONCURRENT` varchar(1) DEFAULT NULL,
  `REQUESTS_RECOVERY` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`,`ENTRY_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_fired_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_job_details
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_job_details`;
CREATE TABLE `qrtz_job_details` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `JOB_NAME` varchar(200) NOT NULL,
  `JOB_GROUP` varchar(200) NOT NULL,
  `DESCRIPTION` varchar(250) DEFAULT NULL,
  `JOB_CLASS_NAME` varchar(250) NOT NULL,
  `IS_DURABLE` varchar(1) NOT NULL,
  `IS_NONCONCURRENT` varchar(1) NOT NULL,
  `IS_UPDATE_DATA` varchar(1) NOT NULL,
  `REQUESTS_RECOVERY` varchar(1) NOT NULL,
  `JOB_DATA` blob,
  PRIMARY KEY (`SCHED_NAME`,`JOB_NAME`,`JOB_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_job_details
-- ----------------------------
INSERT INTO `qrtz_job_details` VALUES ('quartzScheduler1', 'jobName.deliveryService.orderManager', 'DEFAULT', '', 'com.cnc.cloud.quartz.cluster.job.DynamicQuartzJob', '0', '1', '1', '0', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787000737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F40000000000010770800000010000000007800);

-- ----------------------------
-- Table structure for qrtz_locks
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_locks`;
CREATE TABLE `qrtz_locks` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `LOCK_NAME` varchar(40) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`LOCK_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_locks
-- ----------------------------
INSERT INTO `qrtz_locks` VALUES ('quartzScheduler1', 'STATE_ACCESS');
INSERT INTO `qrtz_locks` VALUES ('quartzScheduler1', 'TRIGGER_ACCESS');

-- ----------------------------
-- Table structure for qrtz_paused_trigger_grps
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_paused_trigger_grps`;
CREATE TABLE `qrtz_paused_trigger_grps` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_paused_trigger_grps
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_scheduler_state
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_scheduler_state`;
CREATE TABLE `qrtz_scheduler_state` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `INSTANCE_NAME` varchar(200) NOT NULL,
  `LAST_CHECKIN_TIME` bigint(13) NOT NULL,
  `CHECKIN_INTERVAL` bigint(13) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`INSTANCE_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_scheduler_state
-- ----------------------------
INSERT INTO `qrtz_scheduler_state` VALUES ('quartzScheduler1', 'DESKTOP-CKGINI51557157624792', '1557157665974', '20000');
INSERT INTO `qrtz_scheduler_state` VALUES ('quartzScheduler1', 'DESKTOP-CKGINI51557157690757', '1557157691962', '20000');

-- ----------------------------
-- Table structure for qrtz_simple_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simple_triggers`;
CREATE TABLE `qrtz_simple_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `REPEAT_COUNT` bigint(7) NOT NULL,
  `REPEAT_INTERVAL` bigint(12) NOT NULL,
  `TIMES_TRIGGERED` bigint(10) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `qrtz_simple_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_simple_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_simprop_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simprop_triggers`;
CREATE TABLE `qrtz_simprop_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `STR_PROP_1` varchar(512) DEFAULT NULL,
  `STR_PROP_2` varchar(512) DEFAULT NULL,
  `STR_PROP_3` varchar(512) DEFAULT NULL,
  `INT_PROP_1` int(11) DEFAULT NULL,
  `INT_PROP_2` int(11) DEFAULT NULL,
  `LONG_PROP_1` bigint(20) DEFAULT NULL,
  `LONG_PROP_2` bigint(20) DEFAULT NULL,
  `DEC_PROP_1` decimal(13,4) DEFAULT NULL,
  `DEC_PROP_2` decimal(13,4) DEFAULT NULL,
  `BOOL_PROP_1` varchar(1) DEFAULT NULL,
  `BOOL_PROP_2` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `qrtz_simprop_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_simprop_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_triggers`;
CREATE TABLE `qrtz_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `JOB_NAME` varchar(200) NOT NULL,
  `JOB_GROUP` varchar(200) NOT NULL,
  `DESCRIPTION` varchar(250) DEFAULT NULL,
  `NEXT_FIRE_TIME` bigint(13) DEFAULT NULL,
  `PREV_FIRE_TIME` bigint(13) DEFAULT NULL,
  `PRIORITY` int(11) DEFAULT NULL,
  `TRIGGER_STATE` varchar(16) NOT NULL,
  `TRIGGER_TYPE` varchar(8) NOT NULL,
  `START_TIME` bigint(13) NOT NULL,
  `END_TIME` bigint(13) DEFAULT NULL,
  `CALENDAR_NAME` varchar(200) DEFAULT NULL,
  `MISFIRE_INSTR` smallint(2) DEFAULT NULL,
  `JOB_DATA` blob,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  KEY `SCHED_NAME` (`SCHED_NAME`,`JOB_NAME`,`JOB_GROUP`),
  CONSTRAINT `qrtz_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`) REFERENCES `qrtz_job_details` (`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_triggers
-- ----------------------------
INSERT INTO `qrtz_triggers` VALUES ('quartzScheduler1', 'triggerName.deliveryService.orderManager', 'DEFAULT', 'jobName.deliveryService.orderManager', 'DEFAULT', null, '1557157695000', '1557157680000', '5', 'WAITING', 'CRON', '1557157239000', '0', null, '0', '');

-- ----------------------------
-- Table structure for schedule_job
-- ----------------------------
DROP TABLE IF EXISTS `schedule_job`;
CREATE TABLE `schedule_job` (
  `schedule_job_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `job_name` varchar(255) DEFAULT NULL,
  `alias_name` varchar(255) DEFAULT NULL,
  `job_group` varchar(255) DEFAULT NULL,
  `job_trigger` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `cron_expression` varchar(255) DEFAULT NULL,
  `is_sync` varchar(1) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `gmt_create` timestamp NULL DEFAULT NULL,
  `gmt_modify` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`schedule_job_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of schedule_job
-- ----------------------------
INSERT INTO `schedule_job` VALUES ('11', 'test', 'a', 'group', null, '1', '0/15 * * * * ?', '0', '我就是测试一下而已', null, null);

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
  `status` int(11) DEFAULT '0' COMMENT '审核状态0：审核中 1：拒绝 2  通过  ',
  `createdate` timestamp NULL DEFAULT NULL COMMENT '申请时间',
  `reviewdate` timestamp NULL DEFAULT NULL COMMENT '审核时间',
  `deleteflag` int(5) DEFAULT '0' COMMENT '删除标记0：未删除 1:删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='接单人申请接单数表';

-- ----------------------------
-- Records of sys_applyordernum
-- ----------------------------
INSERT INTO `sys_applyordernum` VALUES ('1', '56', '15058123291', '10', '1', '2', '2019-03-26 22:36:13', '2019-03-26 22:39:40', '0');

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
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8 COMMENT='部门表';

-- ----------------------------
-- Records of sys_dept
-- ----------------------------
INSERT INTO `sys_dept` VALUES ('25', '2', '24', '[0],[24],', '普通用户', '普通用户', '', null);
INSERT INTO `sys_dept` VALUES ('26', '3', '24', '[0],[24],', '接单人', '接单人', '', null);
INSERT INTO `sys_dept` VALUES ('27', '4', '24', '[0],[24],', '快递点', '快递点', '', null);
INSERT INTO `sys_dept` VALUES ('28', '5', '1', null, '测试', '测试fullname', '测试tips', '1');

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
) ENGINE=InnoDB AUTO_INCREMENT=63 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='字典表';

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
INSERT INTO `sys_dict` VALUES ('60', '0', '0', '字典测试', '这是一个字典测试', 'test');
INSERT INTO `sys_dict` VALUES ('61', '1', '60', '测试1', null, '1');
INSERT INTO `sys_dict` VALUES ('62', '2', '60', '测试2', null, '2');

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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='用户反馈表';

-- ----------------------------
-- Records of sys_feedback
-- ----------------------------
INSERT INTO `sys_feedback` VALUES ('1', '57', '你好啊，我要反馈一下内容', '1', '1111', '2019-03-24 19:33:50', null, '00000');
INSERT INTO `sys_feedback` VALUES ('2', '57', '我要干**', '1', '我不想干**', '2019-04-28 22:17:33', null, '00000');
INSERT INTO `sys_feedback` VALUES ('3', '57', '我要干**', null, null, '2019-04-29 09:20:44', null, '00000');

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
  `flag` int(10) NOT NULL DEFAULT '0' COMMENT '最大可接单数是否申请通过0：否 1：是',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='接单人表';

-- ----------------------------
-- Records of sys_getorder
-- ----------------------------
INSERT INTO `sys_getorder` VALUES ('1', '56', null, null, '-2', '1');

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
) ENGINE=InnoDB AUTO_INCREMENT=827 DEFAULT CHARSET=utf8 COMMENT='登录记录';

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
INSERT INTO `sys_login_log` VALUES ('301', '登录日志', '1', '2019-01-31 15:38:15', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('302', '登录日志', '1', '2019-02-02 09:50:24', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('303', '登录日志', '1', '2019-02-02 18:28:46', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('304', '登录日志', '1', '2019-02-02 18:33:40', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('305', '登录日志', '1', '2019-02-02 18:41:15', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('306', '登录日志', '1', '2019-02-03 14:28:25', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('307', '登录日志', '1', '2019-02-03 14:32:08', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('308', '退出日志', '1', '2019-02-03 14:32:30', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('309', '登录日志', '1', '2019-02-03 14:32:36', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('310', '登录日志', '1', '2019-02-03 15:34:03', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('311', '登录日志', '1', '2019-02-03 16:02:58', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('312', '登录日志', '1', '2019-02-03 16:04:04', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('313', '登录日志', '1', '2019-02-03 16:07:30', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('314', '登录日志', '1', '2019-02-04 10:32:03', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('315', '登录日志', '1', '2019-02-04 10:44:02', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('316', '登录日志', '1', '2019-02-04 10:50:46', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('317', '登录日志', '1', '2019-02-07 13:01:40', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('318', '登录日志', '1', '2019-02-07 13:11:18', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('319', '登录日志', '1', '2019-02-07 13:27:47', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('320', '登录日志', '1', '2019-02-07 13:34:41', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('321', '登录日志', '1', '2019-02-07 13:36:42', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('322', '登录日志', '1', '2019-02-07 13:40:53', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('323', '登录日志', '1', '2019-02-07 13:57:20', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('324', '登录日志', '1', '2019-02-07 14:03:02', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('325', '登录日志', '1', '2019-02-07 16:49:28', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('326', '登录日志', '1', '2019-02-07 16:53:13', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('327', '登录日志', '1', '2019-02-07 16:58:07', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('328', '登录日志', '1', '2019-02-07 18:05:40', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('329', '登录日志', '1', '2019-02-07 18:18:47', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('330', '登录日志', '1', '2019-02-07 18:21:10', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('331', '登录日志', '1', '2019-02-07 18:36:04', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('332', '登录日志', '1', '2019-02-07 18:39:26', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('333', '登录日志', '1', '2019-02-08 13:25:32', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('334', '登录日志', '1', '2019-02-08 13:43:41', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('335', '登录日志', '1', '2019-02-08 14:00:54', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('336', '登录日志', '1', '2019-02-08 14:03:55', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('337', '登录日志', '1', '2019-02-08 14:06:18', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('338', '登录日志', '1', '2019-02-08 14:09:27', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('339', '登录日志', '1', '2019-02-12 09:58:49', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('340', '登录日志', '1', '2019-02-12 15:47:16', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('341', '退出日志', '1', '2019-02-12 15:48:24', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('342', '登录日志', '1', '2019-02-12 15:48:35', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('343', '退出日志', '1', '2019-02-12 15:50:20', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('344', '登录日志', '1', '2019-02-12 15:50:25', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('345', '登录日志', '1', '2019-02-12 15:57:44', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('346', '登录日志', '1', '2019-02-12 16:50:21', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('347', '登录日志', '1', '2019-02-12 16:52:23', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('348', '登录日志', '1', '2019-02-12 16:55:46', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('349', '登录日志', '1', '2019-02-13 16:20:04', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('350', '登录日志', '1', '2019-02-13 16:23:09', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('351', '登录日志', '1', '2019-02-14 09:32:12', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('352', '登录日志', '1', '2019-02-14 09:43:54', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('353', '退出日志', '1', '2019-02-14 09:45:45', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('354', '登录日志', '1', '2019-02-14 09:45:50', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('355', '登录日志', '1', '2019-02-14 09:54:14', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('356', '登录日志', '1', '2019-02-14 09:59:08', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('357', '登录日志', '1', '2019-02-14 10:00:27', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('358', '登录日志', '1', '2019-02-14 13:05:17', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('359', '退出日志', '1', '2019-02-14 13:07:49', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('360', '登录失败日志', null, '2019-02-14 13:08:12', '成功', '账号:31501089,账号密码错误', '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('361', '登录失败日志', null, '2019-02-14 13:08:43', '成功', '账号:31501089,账号密码错误', '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('362', '登录日志', '49', '2019-02-14 13:08:53', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('363', '退出日志', '49', '2019-02-14 13:08:55', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('364', '登录失败日志', null, '2019-02-14 13:09:10', '成功', '账号:31501089,账号密码错误', '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('365', '登录失败日志', null, '2019-02-14 13:09:21', '成功', '账号:31501089,账号密码错误', '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('366', '登录日志', '51', '2019-02-14 13:09:57', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('367', '登录日志', '1', '2019-02-14 13:19:53', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('368', '登录日志', '51', '2019-02-14 13:20:15', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('369', '登录日志', '1', '2019-02-14 14:28:53', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('370', '登录日志', '1', '2019-02-14 14:36:15', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('371', '退出日志', '1', '2019-02-14 14:37:00', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('372', '登录日志', '49', '2019-02-14 14:37:28', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('373', '退出日志', '49', '2019-02-14 14:38:11', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('374', '登录日志', '49', '2019-02-14 14:38:20', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('375', '登录日志', '1', '2019-02-14 16:24:42', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('376', '登录日志', '1', '2019-02-28 15:56:30', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('377', '登录失败日志', null, '2019-03-09 13:58:02', '成功', '账号:31501089,账号密码错误', '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('378', '登录失败日志', null, '2019-03-09 13:58:09', '成功', '账号:31501089,账号密码错误', '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('379', '登录失败日志', null, '2019-03-09 13:58:49', '成功', '账号:31501089,账号密码错误', '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('380', '登录失败日志', null, '2019-03-09 13:58:54', '成功', '账号:31501089,账号密码错误', '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('381', '登录日志', '51', '2019-03-09 13:59:03', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('382', '退出日志', '51', '2019-03-09 14:06:13', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('383', '登录日志', '49', '2019-03-09 14:06:25', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('384', '登录日志', '51', '2019-03-10 17:46:12', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('385', '退出日志', '51', '2019-03-10 17:46:25', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('386', '登录日志', '49', '2019-03-10 17:46:33', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('387', '退出日志', '49', '2019-03-10 18:01:14', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('388', '登录日志', '49', '2019-03-10 18:01:31', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('389', '登录日志', '51', '2019-03-10 18:06:10', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('390', '登录日志', '49', '2019-03-10 18:36:28', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('391', '退出日志', '49', '2019-03-10 18:36:43', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('392', '登录日志', '51', '2019-03-10 18:36:51', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('393', '退出日志', '51', '2019-03-10 18:39:52', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('394', '登录日志', '1', '2019-03-10 18:40:03', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('395', '登录日志', '49', '2019-03-11 11:06:19', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('396', '登录日志', '49', '2019-03-11 12:54:51', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('397', '登录日志', '49', '2019-03-11 13:00:11', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('398', '登录日志', '1', '2019-03-11 13:12:31', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('399', '退出日志', '1', '2019-03-11 13:12:49', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('400', '登录日志', '49', '2019-03-11 13:13:04', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('401', '登录日志', '49', '2019-03-11 22:21:38', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('402', '登录日志', '49', '2019-03-11 22:26:28', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('403', '登录失败日志', null, '2019-03-11 22:31:40', '成功', '账号:wenxunli,账号密码错误', '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('404', '登录日志', '49', '2019-03-11 22:31:52', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('405', '登录日志', '49', '2019-03-11 22:36:51', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('406', '登录日志', '49', '2019-03-11 22:38:41', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('407', '登录日志', '49', '2019-03-11 22:39:51', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('408', '登录日志', '49', '2019-03-11 22:42:08', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('409', '登录日志', '51', '2019-03-12 21:07:07', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('410', '登录日志', '49', '2019-03-13 20:39:10', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('411', '退出日志', '49', '2019-03-13 20:51:48', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('412', '登录日志', '1', '2019-03-13 20:51:56', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('413', '登录失败日志', null, '2019-03-15 17:09:07', '成功', '账号:admin,账号密码错误', '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('414', '登录日志', '1', '2019-03-15 17:09:14', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('415', '退出日志', '1', '2019-03-15 17:12:07', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('416', '登录日志', '52', '2019-03-15 17:12:35', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('417', '登录日志', '52', '2019-03-15 17:18:13', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('418', '登录日志', '52', '2019-03-15 17:20:09', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('419', '退出日志', '52', '2019-03-15 17:20:40', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('420', '登录日志', '1', '2019-03-15 17:20:47', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('421', '退出日志', '1', '2019-03-15 17:21:16', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('422', '登录日志', '1', '2019-03-15 17:21:22', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('423', '退出日志', '1', '2019-03-15 17:29:36', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('424', '登录日志', '1', '2019-03-15 17:29:42', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('425', '登录日志', '1', '2019-03-15 17:32:46', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('426', '登录日志', '1', '2019-03-15 18:20:00', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('427', '退出日志', '1', '2019-03-15 18:20:34', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('428', '登录日志', '1', '2019-03-15 18:20:40', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('429', '登录日志', '1', '2019-03-16 14:26:30', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('430', '退出日志', '1', '2019-03-16 14:26:46', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('431', '登录日志', '52', '2019-03-16 14:26:58', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('432', '登录日志', '52', '2019-03-16 14:35:29', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('433', '登录日志', '1', '2019-03-16 14:36:11', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('434', '退出日志', '1', '2019-03-16 14:37:25', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('435', '登录日志', '52', '2019-03-16 14:37:34', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('436', '登录日志', '52', '2019-03-16 14:43:29', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('437', '登录日志', '52', '2019-03-17 09:54:35', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('438', '登录日志', '52', '2019-03-17 10:09:18', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('439', '登录日志', '52', '2019-03-17 10:12:08', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('440', '登录日志', '52', '2019-03-17 10:14:41', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('441', '登录日志', '52', '2019-03-17 10:18:10', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('442', '登录日志', '52', '2019-03-17 10:25:56', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('443', '登录日志', '52', '2019-03-17 10:30:47', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('444', '登录日志', '52', '2019-03-17 10:32:50', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('445', '登录日志', '52', '2019-03-17 10:35:50', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('446', '登录日志', '52', '2019-03-17 10:52:24', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('447', '退出日志', '52', '2019-03-17 10:55:30', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('448', '登录日志', '1', '2019-03-17 10:55:37', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('449', '退出日志', '1', '2019-03-17 11:00:55', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('450', '登录日志', '52', '2019-03-17 11:01:04', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('451', '退出日志', '52', '2019-03-17 11:03:49', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('452', '登录日志', '1', '2019-03-17 11:03:55', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('453', '登录日志', '52', '2019-03-17 11:22:43', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('454', '退出日志', '52', '2019-03-17 11:23:29', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('455', '登录日志', '1', '2019-03-17 11:23:34', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('456', '登录日志', '1', '2019-03-17 11:37:10', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('457', '退出日志', '1', '2019-03-17 11:38:27', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('458', '登录日志', '52', '2019-03-17 11:38:32', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('459', '登录日志', '52', '2019-03-17 14:18:13', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('460', '登录日志', '52', '2019-03-17 19:49:26', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('461', '登录日志', '52', '2019-03-17 19:51:32', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('462', '退出日志', '52', '2019-03-17 19:51:59', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('463', '登录日志', '1', '2019-03-17 19:52:04', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('464', '退出日志', '1', '2019-03-17 20:11:09', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('465', '登录日志', '52', '2019-03-17 20:57:53', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('466', '退出日志', '52', '2019-03-17 20:58:39', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('467', '登录日志', '1', '2019-03-17 20:58:44', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('468', '退出日志', '1', '2019-03-17 21:00:29', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('469', '登录日志', '52', '2019-03-17 21:00:35', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('470', '退出日志', '52', '2019-03-17 21:01:17', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('471', '登录日志', '1', '2019-03-17 21:01:23', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('472', '退出日志', '1', '2019-03-17 21:01:31', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('473', '登录失败日志', null, '2019-03-17 21:02:27', '成功', '账号:jiedanren,账号密码错误', '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('474', '登录日志', '56', '2019-03-17 21:03:40', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('475', '退出日志', '56', '2019-03-17 21:05:12', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('476', '登录日志', '1', '2019-03-17 21:05:20', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('477', '退出日志', '1', '2019-03-17 21:06:46', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('478', '登录日志', '56', '2019-03-17 21:06:59', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('479', '登录日志', '56', '2019-03-17 21:16:31', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('480', '退出日志', '56', '2019-03-17 21:16:46', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('481', '登录日志', '1', '2019-03-17 21:16:52', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('482', '退出日志', '1', '2019-03-17 21:33:13', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('483', '登录日志', '56', '2019-03-17 21:33:27', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('484', '登录日志', '56', '2019-03-18 08:51:53', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('485', '登录日志', '52', '2019-03-18 08:59:14', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('486', '登录日志', '56', '2019-03-18 08:59:57', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('487', '登录日志', '56', '2019-03-18 09:02:12', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('488', '登录日志', '1', '2019-03-18 10:08:18', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('489', '登录日志', '1', '2019-03-18 10:50:56', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('490', '退出日志', '1', '2019-03-18 10:51:51', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('491', '登录日志', '56', '2019-03-18 10:52:02', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('492', '登录日志', '56', '2019-03-18 10:55:06', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('493', '登录日志', '56', '2019-03-18 10:55:45', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('494', '登录日志', '56', '2019-03-18 10:57:38', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('495', '登录日志', '56', '2019-03-18 11:02:25', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('496', '登录日志', '56', '2019-03-18 11:04:16', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('497', '登录日志', '56', '2019-03-18 11:05:42', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('498', '登录日志', '52', '2019-03-18 21:07:09', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('499', '登录日志', '56', '2019-03-20 20:00:26', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('500', '登录日志', '56', '2019-03-20 20:05:19', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('501', '登录日志', '52', '2019-03-23 08:20:08', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('502', '登录日志', '52', '2019-03-23 08:38:50', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('503', '退出日志', '52', '2019-03-23 08:54:31', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('504', '登录日志', '57', '2019-03-23 08:54:42', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('505', '退出日志', '57', '2019-03-23 08:57:15', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('506', '登录日志', '1', '2019-03-23 08:57:22', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('507', '退出日志', '1', '2019-03-23 09:00:39', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('508', '登录日志', '57', '2019-03-23 09:00:48', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('509', '登录日志', '57', '2019-03-23 14:58:28', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('510', '登录日志', '57', '2019-03-23 15:06:41', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('511', '登录日志', '57', '2019-03-23 15:15:04', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('512', '登录日志', '57', '2019-03-23 15:25:41', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('513', '登录日志', '57', '2019-03-23 15:35:09', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('514', '登录失败日志', null, '2019-03-23 15:36:50', '成功', '账号:dafan,账号密码错误', '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('515', '登录日志', '57', '2019-03-23 15:36:58', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('516', '登录日志', '57', '2019-03-23 15:44:03', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('517', '登录日志', '57', '2019-03-23 15:47:32', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('518', '登录日志', '57', '2019-03-23 15:53:49', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('519', '登录日志', '57', '2019-03-23 16:04:18', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('520', '登录日志', '57', '2019-03-23 16:29:06', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('521', '登录日志', '57', '2019-03-23 16:51:55', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('522', '登录日志', '56', '2019-03-23 18:32:41', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('523', '登录日志', '57', '2019-03-23 18:38:09', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('524', '退出日志', '57', '2019-03-23 18:39:03', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('525', '登录日志', '56', '2019-03-23 18:39:21', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('526', '登录日志', '57', '2019-03-23 19:40:37', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('527', '退出日志', '57', '2019-03-23 19:41:51', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('528', '登录日志', '56', '2019-03-23 19:41:59', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('529', '登录日志', '57', '2019-03-23 19:47:47', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('530', '退出日志', '57', '2019-03-23 19:48:28', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('531', '登录日志', '56', '2019-03-23 19:48:36', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('532', '登录日志', '56', '2019-03-23 19:57:41', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('533', '登录日志', '56', '2019-03-23 20:06:22', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('534', '登录日志', '56', '2019-03-23 20:08:09', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('535', '登录日志', '56', '2019-03-23 20:11:03', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('536', '登录日志', '56', '2019-03-23 20:14:33', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('537', '登录日志', '56', '2019-03-23 20:17:38', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('538', '登录日志', '56', '2019-03-23 20:19:32', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('539', '登录日志', '56', '2019-03-24 07:42:23', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('540', '退出日志', '56', '2019-03-24 07:42:34', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('541', '登录日志', '56', '2019-03-24 07:43:01', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('542', '登录日志', '56', '2019-03-24 07:51:05', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('543', '退出日志', '56', '2019-03-24 07:51:41', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('544', '登录日志', '57', '2019-03-24 07:51:50', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('545', '登录日志', '57', '2019-03-24 07:56:15', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('546', '登录日志', '57', '2019-03-24 08:00:00', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('547', '登录日志', '57', '2019-03-24 08:01:13', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('548', '登录日志', '1', '2019-03-24 09:43:15', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('549', '登录日志', '1', '2019-03-24 09:56:10', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('550', '登录日志', '1', '2019-03-24 10:00:46', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('551', '登录日志', '1', '2019-03-24 10:03:40', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('552', '登录日志', '1', '2019-03-24 10:04:27', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('553', '登录日志', '1', '2019-03-24 10:05:30', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('554', '登录日志', '57', '2019-03-24 10:07:35', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('555', '登录日志', '1', '2019-03-24 10:25:39', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('556', '登录日志', '57', '2019-03-24 14:34:26', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('557', '登录日志', '57', '2019-03-24 14:38:00', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('558', '登录日志', '57', '2019-03-24 14:38:14', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('559', '登录日志', '57', '2019-03-24 14:42:42', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('560', '登录日志', '57', '2019-03-24 14:44:22', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('561', '登录日志', '57', '2019-03-24 14:49:36', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('562', '登录日志', '57', '2019-03-24 14:55:14', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('563', '登录日志', '57', '2019-03-24 14:56:52', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('564', '登录日志', '57', '2019-03-24 14:59:57', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('565', '登录日志', '57', '2019-03-24 15:02:33', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('566', '登录日志', '56', '2019-03-24 15:03:44', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('567', '登录日志', '57', '2019-03-24 15:04:10', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('568', '登录日志', '57', '2019-03-24 15:12:05', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('569', '登录日志', '57', '2019-03-24 15:23:22', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('570', '登录日志', '57', '2019-03-24 18:04:59', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('571', '登录日志', '57', '2019-03-24 18:13:52', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('572', '登录日志', '57', '2019-03-24 18:16:12', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('573', '登录日志', '57', '2019-03-24 18:19:26', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('574', '登录日志', '57', '2019-03-24 18:21:34', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('575', '登录日志', '57', '2019-03-24 18:38:51', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('576', '登录日志', '57', '2019-03-24 18:42:16', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('577', '登录日志', '57', '2019-03-24 18:49:43', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('578', '登录日志', '1', '2019-03-24 18:58:36', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('579', '登录日志', '1', '2019-03-24 19:02:31', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('580', '登录日志', '57', '2019-03-24 19:15:13', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('581', '退出日志', '57', '2019-03-24 19:15:37', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('582', '登录日志', '1', '2019-03-24 19:15:43', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('583', '退出日志', '1', '2019-03-24 19:18:23', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('584', '登录日志', '57', '2019-03-24 19:18:28', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('585', '登录日志', '1', '2019-03-24 19:32:30', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('586', '退出日志', '1', '2019-03-24 19:33:23', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('587', '登录日志', '57', '2019-03-24 19:33:28', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('588', '登录日志', '57', '2019-03-24 19:59:52', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('589', '退出日志', '57', '2019-03-24 20:00:06', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('590', '登录日志', '1', '2019-03-24 20:00:12', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('591', '登录日志', '1', '2019-03-24 20:07:43', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('592', '登录日志', '1', '2019-03-24 20:13:29', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('593', '登录日志', '1', '2019-03-24 20:21:04', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('594', '登录日志', '1', '2019-03-24 20:23:21', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('595', '登录日志', '1', '2019-03-24 20:24:45', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('596', '退出日志', '1', '2019-03-24 20:25:00', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('597', '登录日志', '57', '2019-03-24 20:25:05', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('598', '登录日志', '1', '2019-03-26 21:09:42', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('599', '退出日志', '1', '2019-03-26 21:18:28', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('600', '登录日志', '56', '2019-03-26 21:18:40', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('601', '退出日志', '56', '2019-03-26 21:24:10', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('602', '登录日志', '1', '2019-03-26 21:24:16', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('603', '登录日志', '1', '2019-03-26 21:25:53', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('604', '退出日志', '1', '2019-03-26 21:28:14', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('605', '登录日志', '57', '2019-03-26 21:28:21', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('606', '退出日志', '57', '2019-03-26 21:28:34', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('607', '登录日志', '56', '2019-03-26 21:28:40', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('608', '退出日志', '56', '2019-03-26 21:29:03', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('609', '登录日志', '1', '2019-03-26 21:29:10', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('610', '退出日志', '1', '2019-03-26 21:29:56', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('611', '登录日志', '56', '2019-03-26 21:30:04', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('612', '退出日志', '56', '2019-03-26 21:30:19', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('613', '登录日志', '1', '2019-03-26 21:30:25', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('614', '登录日志', '56', '2019-03-26 21:34:23', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('615', '登录日志', '56', '2019-03-26 21:34:41', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('616', '退出日志', '56', '2019-03-26 21:35:02', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('617', '登录日志', '1', '2019-03-26 21:35:46', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('618', '退出日志', '1', '2019-03-26 21:36:19', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('619', '登录日志', '56', '2019-03-26 21:36:24', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('620', '登录日志', '56', '2019-03-26 21:45:33', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('621', '登录日志', '56', '2019-03-26 22:34:05', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('622', '退出日志', '56', '2019-03-26 22:36:49', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('623', '登录日志', '1', '2019-03-26 22:36:57', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('624', '登录日志', '1', '2019-03-26 22:38:30', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('625', '登录日志', '1', '2019-04-14 09:02:39', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('626', '登录日志', '1', '2019-04-14 15:07:55', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('627', '登录日志', '1', '2019-04-14 16:13:13', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('628', '退出日志', '1', '2019-04-14 16:52:18', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('629', '登录日志', '1', '2019-04-14 16:52:25', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('630', '退出日志', '1', '2019-04-14 16:57:21', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('631', '登录日志', '52', '2019-04-14 16:57:35', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('632', '退出日志', '52', '2019-04-14 16:59:02', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('633', '登录日志', '56', '2019-04-14 16:59:15', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('634', '登录日志', '2', '2019-04-14 19:20:35', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('635', '退出日志', '2', '2019-04-14 19:24:46', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('636', '登录日志', '52', '2019-04-14 19:25:05', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('637', '退出日志', '52', '2019-04-14 19:38:07', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('638', '登录日志', '56', '2019-04-14 19:38:14', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('639', '退出日志', '56', '2019-04-14 19:44:46', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('640', '登录日志', '57', '2019-04-14 19:44:54', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('641', '退出日志', '57', '2019-04-14 19:49:22', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('642', '登录日志', '56', '2019-04-14 19:49:29', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('643', '退出日志', '56', '2019-04-14 19:54:57', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('644', '登录日志', '56', '2019-04-14 19:55:05', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('645', '退出日志', '56', '2019-04-14 20:22:31', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('646', '登录日志', '1', '2019-04-14 20:22:40', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('647', '退出日志', '1', '2019-04-14 20:28:12', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('648', '登录日志', '56', '2019-04-14 20:28:21', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('649', '退出日志', '56', '2019-04-14 20:28:51', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('650', '登录日志', '57', '2019-04-14 20:28:57', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('651', '登录日志', '57', '2019-04-14 20:35:53', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('652', '退出日志', '57', '2019-04-14 20:38:59', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('653', '登录日志', '1', '2019-04-14 20:39:05', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('654', '登录日志', '1', '2019-04-14 22:02:18', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('655', '登录日志', '1', '2019-04-17 21:04:43', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('656', '登录日志', '1', '2019-04-17 21:07:21', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('657', '登录日志', '1', '2019-04-17 21:08:48', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('658', '退出日志', '1', '2019-04-17 21:09:23', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('659', '登录日志', '1', '2019-04-17 21:09:28', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('660', '退出日志', '1', '2019-04-17 21:11:15', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('661', '登录日志', '1', '2019-04-17 21:11:20', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('662', '登录失败日志', null, '2019-04-20 19:22:23', '成功', '账号:admin,账号密码错误', '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('663', '登录日志', '1', '2019-04-20 19:22:31', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('664', '登录日志', '57', '2019-04-21 11:09:43', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('665', '登录日志', '52', '2019-04-21 14:28:12', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('666', '登录日志', '1', '2019-04-21 20:12:26', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('667', '登录失败日志', null, '2019-04-27 20:39:40', '成功', '账号:admin,账号密码错误', '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('668', '登录日志', '1', '2019-04-27 20:39:46', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('669', '登录日志', '1', '2019-04-27 20:44:30', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('670', '登录日志', '1', '2019-04-27 21:51:22', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('671', '登录日志', '56', '2019-04-27 23:05:50', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('672', '登录日志', '56', '2019-04-27 23:06:00', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('673', '登录日志', '1', '2019-04-27 23:06:08', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('674', '登录日志', '1', '2019-04-27 23:06:39', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('675', '登录日志', '57', '2019-04-27 23:12:45', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('676', '退出日志', '57', '2019-04-27 23:12:55', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('677', '登录日志', '56', '2019-04-27 23:13:01', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('678', '登录日志', '1', '2019-04-28 09:30:46', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('679', '登录日志', '1', '2019-04-28 10:00:00', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('680', '登录日志', '1', '2019-04-28 10:00:50', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('681', '登录日志', '1', '2019-04-28 10:04:54', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('682', '退出日志', '1', '2019-04-28 10:11:39', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('683', '登录日志', '1', '2019-04-28 10:11:45', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('684', '登录日志', '1', '2019-04-28 10:21:44', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('685', '登录日志', '1', '2019-04-28 10:47:44', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('686', '登录日志', '1', '2019-04-28 10:56:15', '成功', null, '127.0.0.1');
INSERT INTO `sys_login_log` VALUES ('687', '退出日志', '1', '2019-04-28 10:56:20', '成功', null, '127.0.0.1');
INSERT INTO `sys_login_log` VALUES ('688', '登录日志', '1', '2019-04-28 10:56:30', '成功', null, '127.0.0.1');
INSERT INTO `sys_login_log` VALUES ('689', '登录日志', '57', '2019-04-28 14:15:25', '成功', null, '127.0.0.1');
INSERT INTO `sys_login_log` VALUES ('690', '退出日志', '57', '2019-04-28 14:16:43', '成功', null, '127.0.0.1');
INSERT INTO `sys_login_log` VALUES ('691', '登录日志', '57', '2019-04-28 14:16:49', '成功', null, '127.0.0.1');
INSERT INTO `sys_login_log` VALUES ('692', '退出日志', '57', '2019-04-28 14:17:28', '成功', null, '127.0.0.1');
INSERT INTO `sys_login_log` VALUES ('693', '登录日志', '57', '2019-04-28 14:17:36', '成功', null, '127.0.0.1');
INSERT INTO `sys_login_log` VALUES ('694', '退出日志', '57', '2019-04-28 14:18:48', '成功', null, '127.0.0.1');
INSERT INTO `sys_login_log` VALUES ('695', '登录日志', '57', '2019-04-28 14:18:54', '成功', null, '127.0.0.1');
INSERT INTO `sys_login_log` VALUES ('696', '退出日志', '57', '2019-04-28 14:19:37', '成功', null, '127.0.0.1');
INSERT INTO `sys_login_log` VALUES ('697', '登录日志', '57', '2019-04-28 14:19:43', '成功', null, '127.0.0.1');
INSERT INTO `sys_login_log` VALUES ('698', '登录日志', '57', '2019-04-28 17:52:50', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('699', '登录日志', '57', '2019-04-28 17:55:38', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('700', '登录日志', '57', '2019-04-28 18:04:14', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('701', '登录日志', '57', '2019-04-28 18:06:03', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('702', '登录日志', '57', '2019-04-28 18:08:28', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('703', '登录日志', '57', '2019-04-28 18:09:59', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('704', '登录日志', '57', '2019-04-28 21:30:23', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('705', '登录日志', '57', '2019-04-28 21:33:27', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('706', '登录日志', '57', '2019-04-28 21:35:01', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('707', '登录日志', '57', '2019-04-28 22:17:26', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('708', '退出日志', '57', '2019-04-28 22:17:36', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('709', '登录日志', '1', '2019-04-28 22:17:42', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('710', '登录日志', '57', '2019-04-29 09:20:24', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('711', '登录日志', '1', '2019-05-02 14:45:29', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('712', '登录日志', '57', '2019-05-04 09:12:10', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('713', '登录日志', '1', '2019-05-04 10:16:57', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('714', '退出日志', '1', '2019-05-04 10:17:10', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('715', '登录日志', '57', '2019-05-04 10:17:17', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('716', '退出日志', '57', '2019-05-04 10:38:35', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('717', '登录日志', '56', '2019-05-04 10:38:43', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('718', '登录日志', '57', '2019-05-04 13:52:56', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('719', '登录日志', '57', '2019-05-04 13:54:47', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('720', '退出日志', '57', '2019-05-04 13:55:00', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('721', '登录失败日志', null, '2019-05-04 13:55:08', '成功', '账号:jiedan,账号密码错误', '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('722', '登录日志', '56', '2019-05-04 13:55:17', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('723', '登录日志', '57', '2019-05-04 13:57:48', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('724', '登录日志', '57', '2019-05-04 15:29:21', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('725', '登录日志', '57', '2019-05-04 15:34:34', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('726', '登录日志', '57', '2019-05-04 15:36:28', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('727', '登录日志', '57', '2019-05-04 15:37:35', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('728', '登录日志', '57', '2019-05-04 15:38:32', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('729', '登录日志', '57', '2019-05-04 15:41:32', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('730', '登录日志', '57', '2019-05-04 15:42:56', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('731', '登录日志', '57', '2019-05-04 15:50:36', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('732', '登录日志', '57', '2019-05-04 15:52:27', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('733', '登录日志', '56', '2019-05-04 19:33:53', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('734', '退出日志', '56', '2019-05-04 19:36:04', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('735', '登录日志', '57', '2019-05-04 19:36:12', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('736', '登录日志', '57', '2019-05-04 19:47:08', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('737', '登录日志', '57', '2019-05-04 20:02:08', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('738', '登录日志', '57', '2019-05-04 20:04:34', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('739', '登录日志', '57', '2019-05-04 20:04:59', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('740', '退出日志', '57', '2019-05-04 20:05:15', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('741', '登录日志', '56', '2019-05-04 20:05:22', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('742', '退出日志', '56', '2019-05-04 20:05:32', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('743', '登录日志', '57', '2019-05-04 20:05:45', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('744', '退出日志', '57', '2019-05-04 20:06:08', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('745', '登录日志', '56', '2019-05-04 20:06:18', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('746', '退出日志', '56', '2019-05-04 20:10:37', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('747', '登录日志', '57', '2019-05-04 20:10:45', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('748', '登录日志', '57', '2019-05-04 21:00:13', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('749', '登录日志', '57', '2019-05-04 21:04:35', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('750', '退出日志', '57', '2019-05-04 21:15:30', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('751', '登录日志', '57', '2019-05-04 21:15:44', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('752', '退出日志', '57', '2019-05-04 21:18:05', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('753', '登录日志', '56', '2019-05-04 21:18:13', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('754', '登录日志', '56', '2019-05-04 21:20:26', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('755', '退出日志', '56', '2019-05-04 21:21:11', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('756', '登录日志', '52', '2019-05-04 21:21:20', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('757', '退出日志', '52', '2019-05-04 21:24:14', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('758', '登录日志', '1', '2019-05-04 21:24:22', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('759', '退出日志', '1', '2019-05-04 21:27:57', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('760', '登录日志', '1', '2019-05-04 21:28:05', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('761', '退出日志', '1', '2019-05-04 21:29:20', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('762', '登录日志', '1', '2019-05-04 21:29:24', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('763', '退出日志', '1', '2019-05-04 21:33:55', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('764', '登录日志', '57', '2019-05-04 21:34:45', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('765', '退出日志', '57', '2019-05-04 21:35:02', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('766', '登录日志', '56', '2019-05-04 21:35:08', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('767', '登录日志', '56', '2019-05-04 21:36:57', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('768', '登录日志', '56', '2019-05-04 21:38:46', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('769', '登录日志', '56', '2019-05-04 21:39:31', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('770', '退出日志', '56', '2019-05-04 21:39:37', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('771', '登录日志', '57', '2019-05-04 21:39:46', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('772', '退出日志', '57', '2019-05-04 21:39:53', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('773', '登录日志', '1', '2019-05-04 21:39:58', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('774', '退出日志', '1', '2019-05-04 21:45:36', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('775', '登录日志', '1', '2019-05-04 21:45:42', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('776', '退出日志', '1', '2019-05-04 22:01:07', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('777', '登录日志', '57', '2019-05-04 22:01:18', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('778', '登录日志', '57', '2019-05-04 22:02:42', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('779', '登录日志', '1', '2019-05-05 09:38:06', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('780', '登录日志', '1', '2019-05-05 11:20:08', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('781', '登录日志', '1', '2019-05-05 14:13:22', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('782', '登录日志', '1', '2019-05-05 14:30:26', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('783', '登录日志', '1', '2019-05-05 14:32:25', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('784', '登录日志', '1', '2019-05-05 14:38:27', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('785', '登录日志', '1', '2019-05-05 14:41:45', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('786', '登录日志', '1', '2019-05-05 14:43:28', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('787', '退出日志', '1', '2019-05-05 14:43:48', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('788', '登录日志', '1', '2019-05-05 14:44:17', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('789', '登录日志', '1', '2019-05-05 14:47:18', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('790', '退出日志', '1', '2019-05-05 14:47:59', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('791', '登录日志', '1', '2019-05-05 14:48:27', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('792', '退出日志', '1', '2019-05-05 14:49:31', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('793', '登录日志', '1', '2019-05-05 14:49:36', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('794', '登录日志', '1', '2019-05-05 14:51:20', '成功', null, '127.0.0.1');
INSERT INTO `sys_login_log` VALUES ('795', '退出日志', '1', '2019-05-05 15:20:45', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('796', '登录日志', '1', '2019-05-05 15:20:51', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('797', '登录日志', '1', '2019-05-05 15:21:33', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('798', '登录日志', '56', '2019-05-05 15:26:56', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('799', '登录日志', '56', '2019-05-05 15:27:52', '成功', null, '127.0.0.1');
INSERT INTO `sys_login_log` VALUES ('800', '登录日志', '56', '2019-05-05 15:35:03', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('801', '登录日志', '56', '2019-05-05 15:42:10', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('802', '退出日志', '56', '2019-05-05 15:42:58', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('803', '登录日志', '1', '2019-05-05 15:43:03', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('804', '登录日志', '57', '2019-05-05 15:54:20', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('805', '登录日志', '56', '2019-05-05 16:00:01', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('806', '登录日志', '57', '2019-05-05 16:00:16', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('807', '登录日志', '57', '2019-05-05 16:02:36', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('808', '登录日志', '57', '2019-05-05 16:04:21', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('809', '登录日志', '57', '2019-05-05 16:05:07', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('810', '退出日志', '57', '2019-05-05 16:10:49', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('811', '登录日志', '56', '2019-05-05 16:10:56', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('812', '退出日志', '56', '2019-05-05 16:22:12', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('813', '登录日志', '52', '2019-05-05 16:22:20', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('814', '退出日志', '52', '2019-05-05 16:33:26', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('815', '登录日志', '1', '2019-05-05 16:33:33', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('816', '登录日志', '57', '2019-05-05 21:38:58', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('817', '登录日志', '57', '2019-05-05 21:40:36', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('818', '登录日志', '57', '2019-05-05 22:03:06', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('819', '登录日志', '57', '2019-05-05 22:07:55', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('820', '登录日志', '57', '2019-05-06 22:57:09', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('821', '退出日志', '57', '2019-05-06 22:58:15', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('822', '登录日志', '57', '2019-05-06 23:45:19', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('823', '退出日志', '57', '2019-05-06 23:46:08', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('824', '登录日志', '56', '2019-05-06 23:46:14', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('825', '退出日志', '56', '2019-05-06 23:47:44', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('826', '登录日志', '57', '2019-05-06 23:47:49', '成功', null, '0:0:0:0:0:0:0:1');

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
) ENGINE=InnoDB AUTO_INCREMENT=1110533601151250439 DEFAULT CHARSET=utf8 COMMENT='菜单表';

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
INSERT INTO `sys_menu` VALUES ('168', 'placeapply', 'delivery', '[0],[delivery],', '快递点申请', '', '/placeapply', '8', '2', '1', null, '1', '0');
INSERT INTO `sys_menu` VALUES ('169', 'placeapply_list', 'placeapply', '[0],[delivery],[placeapply],', '快递点申请列表', '', '/placeapply/list', '1', '3', '0', null, '1', '0');
INSERT INTO `sys_menu` VALUES ('170', 'placeapply_add', 'delivery', '[0],[delivery],', '快递点申请添加', '', '/placeapply/add', '2', '3', '0', null, '1', '0');
INSERT INTO `sys_menu` VALUES ('171', 'placeapply_update', 'placeapply', '[0],[delivery],[placeapply],', '快递点申请通过', '', '/placeapply/update', '3', '3', '0', null, '1', '0');
INSERT INTO `sys_menu` VALUES ('172', 'placeapply_delete', 'placeapply', '[0],[delivery],[placeapply],', '快递点申请删除', '', '/placeapply/delete', '4', '3', '0', null, '1', '0');
INSERT INTO `sys_menu` VALUES ('173', 'placeapply_detail', 'placeapply', '[0],[delivery],[placeapply],', '快递点申请详情', '', '/placeapply/detail', '5', '3', '0', null, '1', '0');
INSERT INTO `sys_menu` VALUES ('174', 'placeapply_refuse', 'placeapply', '[0],[delivery],[placeapply],', '快递点申请拒绝', '', '/placeapply/refuse', '6', '3', '0', null, '1', null);
INSERT INTO `sys_menu` VALUES ('175', 'delivery', '0', '[0],', '快递代拿', 'fa-user', '#', '5', '1', '1', null, '1', null);
INSERT INTO `sys_menu` VALUES ('176', 'place', 'delivery', '[0],[delivery],', '快递点查看', '', '/placeapply/place', '2', '2', '1', null, '1', null);
INSERT INTO `sys_menu` VALUES ('177', 'orderapplylist', 'delivery', '[0],[delivery],', '接单人列表', null, '/orderapply/getorder', '1', '2', '1', null, '1', null);
INSERT INTO `sys_menu` VALUES ('178', 'getorderlist', 'delivery', '[0],[delivery],', '已经接的单', null, '/order/getOrderListHtml', '5', '2', '1', null, '1', '0');
INSERT INTO `sys_menu` VALUES ('179', 'publishorderlist', 'delivery', '[0],[delivery],', '发布的订单', null, '/order/getPubilshOrderListHtml', '3', '2', '1', null, '1', '0');
INSERT INTO `sys_menu` VALUES ('180', 'placeapplylist', 'delivery', '[0],[delivery],', '已申请的快递点', null, '/placeapply/placeapplylist', '7', '2', '1', null, '1', '0');
INSERT INTO `sys_menu` VALUES ('181', 'orderapplylist', 'delivery', '[0],[delivery],', '已申请的接单人', null, '/orderapply/orderapplytolist', '8', '2', '1', null, '1', '0');
INSERT INTO `sys_menu` VALUES ('1091946857313107970', 'order', 'delivery', '[0],[delivery],', '订单广场', '', '/order', '1', '2', '1', null, '1', '0');
INSERT INTO `sys_menu` VALUES ('1091946857313107971', 'order_list', 'order', '[0],[delivery],[order],', '订单列表', '', '/order/list', '99', '3', '0', null, '1', '0');
INSERT INTO `sys_menu` VALUES ('1091946857313107972', 'order_add', 'order', '[0],[delivery],[order],', '订单添加', '', '/order/add', '99', '3', '0', null, '1', '0');
INSERT INTO `sys_menu` VALUES ('1091946857313107973', 'order_update', 'order', '[0],[delivery],[order],', '接单', '', '/order/update', '99', '3', '0', null, '1', '0');
INSERT INTO `sys_menu` VALUES ('1091946857313107974', 'order_delete', 'order', '[0],[delivery],[order],', '订单删除', '', '/order/delete', '99', '3', '0', null, '1', '0');
INSERT INTO `sys_menu` VALUES ('1091946857313107975', 'order_detail', 'order', '[0],[delivery],[order],', '订单详情', '', '/order/detail', '99', '3', '0', null, '1', '0');
INSERT INTO `sys_menu` VALUES ('1095859184412397569', 'orderapply', 'delivery', '[0],[delivery],', '接单人申请', '', '/orderapply', '6', '2', '1', null, '1', '0');
INSERT INTO `sys_menu` VALUES ('1095859184412397570', 'orderapply_list', 'orderapply', '[0],[delivery],[orderapply],', '接单人申请列表', '', '/orderapply/list', '99', '3', '0', null, '1', '0');
INSERT INTO `sys_menu` VALUES ('1095859184412397571', 'orderapply_add', 'delivery', '[0],[delivery],', '接单人申请添加', '', '/orderapply/add', '99', '3', '0', null, '1', '0');
INSERT INTO `sys_menu` VALUES ('1095859184412397572', 'orderapply_update', 'orderapply', '[0],[delivery],[orderapply],', '接单人申请更新', '', '/orderapply/update', '99', '3', '0', null, '1', '0');
INSERT INTO `sys_menu` VALUES ('1095859184412397573', 'orderapply_delete', 'orderapply', '[0],[delivery],[orderapply],', '接单人申请删除', '', '/orderapply/delete', '99', '3', '0', null, '1', '0');
INSERT INTO `sys_menu` VALUES ('1095859184412397574', 'orderapply_detail', 'orderapply', '[0],[delivery],[orderapply],', '接单人申请详情', '', '/orderapply/detail', '99', '3', '0', null, '1', '0');
INSERT INTO `sys_menu` VALUES ('1095859184412397575', 'orderapply_pass', 'orderapply', '[0],[delivery],[orderapply],', '接单人申请通过或者拒绝', null, '/orderapply/pass', '99', '3', '0', null, '1', '0');
INSERT INTO `sys_menu` VALUES ('1109771682136006658', 'feedback', 'delivery', '[0],[delivery],[order],', '意见反馈', '', '/feedback', '9', '2', '1', null, '1', '0');
INSERT INTO `sys_menu` VALUES ('1109771682136006659', 'feedback_list', 'feedback', '[0],[delivery],[feedback],', '意见反馈列表', '', '/feedback/list', '99', '3', '0', null, '1', '0');
INSERT INTO `sys_menu` VALUES ('1109771682136006660', 'feedback_add', 'feedback', '[0],[delivery],[feedback],', '意见反馈添加', '', '/feedback/add', '99', '3', '0', null, '1', '0');
INSERT INTO `sys_menu` VALUES ('1109771682136006661', 'feedback_update', 'feedback', '[0],[delivery],[feedback],', '意见反馈更新', '', '/feedback/update', '99', '3', '0', null, '1', '0');
INSERT INTO `sys_menu` VALUES ('1109771682136006662', 'feedback_delete', 'feedback', '[0],[delivery],[feedback],', '意见反馈删除', '', '/feedback/delete', '99', '3', '0', null, '1', '0');
INSERT INTO `sys_menu` VALUES ('1109771682136006663', 'feedback_detail', 'feedback', '[0],[delivery],[feedback],', '意见反馈详情', '', '/feedback/detail', '99', '3', '0', null, '1', '0');
INSERT INTO `sys_menu` VALUES ('1110533601151250433', 'applyordernum', 'delivery', '[0],[delivery],', '接单数申请', '', '/applyordernum', '5', '2', '1', null, '1', '0');
INSERT INTO `sys_menu` VALUES ('1110533601151250434', 'applyordernum_list', 'applyordernum', '[0],[delivery],[applyordernum],', '接单数申请列表', '', '/applyordernum/list', '99', '3', '0', null, '1', '0');
INSERT INTO `sys_menu` VALUES ('1110533601151250435', 'applyordernum_add', 'applyordernum', '[0],[delivery],[applyordernum],', '接单数申请添加', '', '/applyordernum/add', '99', '3', '0', null, '1', '0');
INSERT INTO `sys_menu` VALUES ('1110533601151250436', 'applyordernum_update', 'applyordernum', '[0],[delivery],[applyordernum],', '接单数申请更新', '', '/applyordernum/update', '99', '3', '0', null, '1', '0');
INSERT INTO `sys_menu` VALUES ('1110533601151250437', 'applyordernum_delete', 'applyordernum', '[0],[delivery],[applyordernum],', '接单数申请删除', '', '/applyordernum/delete', '99', '3', '0', null, '1', '0');
INSERT INTO `sys_menu` VALUES ('1110533601151250438', 'applyordernum_detail', 'applyordernum', '[0],[delivery],[applyordernum],', '接单数申请详情', '', '/applyordernum/detail', '99', '3', '0', null, '1', '0');

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
  `aim` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COMMENT='通知表';

-- ----------------------------
-- Records of sys_notice
-- ----------------------------
INSERT INTO `sys_notice` VALUES ('6', '世界', '10', '欢迎使用', '2018-12-01 08:53:20', '1', '0');
INSERT INTO `sys_notice` VALUES ('8', '你好', null, '你好', '2018-12-01 19:28:57', '1', '0');
INSERT INTO `sys_notice` VALUES ('9', '订单过期', null, '您的订单已过期，快去看看吧', '2019-05-06 23:44:00', '0', '57');
INSERT INTO `sys_notice` VALUES ('10', '订单已被接收', null, '您的订单已被接取，快去看看吧！', '2019-05-06 23:46:34', '0', '57');
INSERT INTO `sys_notice` VALUES ('11', '订单超时', null, '您接订单未在最迟期限前送到', '2019-05-06 23:47:06', '0', '56');
INSERT INTO `sys_notice` VALUES ('12', '订单超时', null, '您的订单已超时，以对接单人做出惩罚', '2019-05-06 23:47:06', '0', '57');

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
) ENGINE=InnoDB AUTO_INCREMENT=140 DEFAULT CHARSET=utf8 COMMENT='操作日志';

-- ----------------------------
-- Records of sys_operation_log
-- ----------------------------
INSERT INTO `sys_operation_log` VALUES ('127', '业务日志', '清空业务日志', '1', 'cn.stylefeng.guns.modular.system.controller.LogController', 'delLog', '2019-05-02 14:48:50', '成功', '主键id=null');
INSERT INTO `sys_operation_log` VALUES ('128', '异常日志', '', '57', null, null, '2019-05-04 09:12:18', '失败', 'java.lang.ArithmeticException: / by zero\r\n	at cn.stylefeng.guns.modular.system.controller.FeedbackController.add(FeedbackController.java:85)\r\n	at cn.stylefeng.guns.modular.system.controller.FeedbackControllerTTFastClassBySpringCGLIBTT8d496aab.invoke(<generated>)\r\n	at org.springframework.cglib.proxy.MethodProxy.invoke(MethodProxy.java:204)\r\n	at org.springframework.aop.framework.CglibAopProxyTCglibMethodInvocation.invokeJoinpoint(CglibAopProxy.java:747)\r\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:163)\r\n	at org.springframework.aop.aspectj.MethodInvocationProceedingJoinPoint.proceed(MethodInvocationProceedingJoinPoint.java:89)\r\n	at cn.stylefeng.guns.core.interceptor.SessionHolderInterceptor.sessionKit(SessionHolderInterceptor.java:44)\r\n	at sun.reflect.NativeMethodAccessorImpl.invoke0(Native Method)\r\n	at sun.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:62)\r\n	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\r\n	at java.lang.reflect.Method.invoke(Method.java:498)\r\n	at org.springframework.aop.aspectj.AbstractAspectJAdvice.invokeAdviceMethodWithGivenArgs(AbstractAspectJAdvice.java:644)\r\n	at org.springframework.aop.aspectj.AbstractAspectJAdvice.invokeAdviceMethod(AbstractAspectJAdvice.java:633)\r\n	at org.springframework.aop.aspectj.AspectJAroundAdvice.invoke(AspectJAroundAdvice.java:70)\r\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:185)\r\n	at org.springframework.aop.interceptor.ExposeInvocationInterceptor.invoke(ExposeInvocationInterceptor.java:92)\r\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:185)\r\n	at org.springframework.aop.framework.CglibAopProxyTDynamicAdvisedInterceptor.intercept(CglibAopProxy.java:689)\r\n	at cn.stylefeng.guns.modular.system.controller.FeedbackControllerTTEnhancerBySpringCGLIBTT630bf0c2.add(<generated>)\r\n	at sun.reflect.NativeMethodAccessorImpl.invoke0(Native Method)\r\n	at sun.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:62)\r\n	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\r\n	at java.lang.reflect.Method.invoke(Method.java:498)\r\n	at org.springframework.web.method.support.InvocableHandlerMethod.doInvoke(InvocableHandlerMethod.java:209)\r\n	at org.springframework.web.method.support.InvocableHandlerMethod.invokeForRequest(InvocableHandlerMethod.java:136)\r\n	at org.springframework.web.servlet.mvc.method.annotation.ServletInvocableHandlerMethod.invokeAndHandle(ServletInvocableHandlerMethod.java:102)\r\n	at org.springframework.web.servlet.mvc.method.annotation.RequestMappingHandlerAdapter.invokeHandlerMethod(RequestMappingHandlerAdapter.java:877)\r\n	at org.springframework.web.servlet.mvc.method.annotation.RequestMappingHandlerAdapter.handleInternal(RequestMappingHandlerAdapter.java:783)\r\n	at org.springframework.web.servlet.mvc.method.AbstractHandlerMethodAdapter.handle(AbstractHandlerMethodAdapter.java:87)\r\n	at org.springframework.web.servlet.DispatcherServlet.doDispatch(DispatcherServlet.java:991)\r\n	at org.springframework.web.servlet.DispatcherServlet.doService(DispatcherServlet.java:925)\r\n	at org.springframework.web.servlet.FrameworkServlet.processRequest(FrameworkServlet.java:974)\r\n	at org.springframework.web.servlet.FrameworkServlet.doPost(FrameworkServlet.java:877)\r\n	at javax.servlet.http.HttpServlet.service(HttpServlet.java:661)\r\n	at org.springframework.web.servlet.FrameworkServlet.service(FrameworkServlet.java:851)\r\n	at javax.servlet.http.HttpServlet.service(HttpServlet.java:742)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:231)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at org.apache.tomcat.websocket.server.WsFilter.doFilter(WsFilter.java:52)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at org.apache.shiro.web.servlet.ProxiedFilterChain.doFilter(ProxiedFilterChain.java:61)\r\n	at org.apache.shiro.web.servlet.AdviceFilter.executeChain(AdviceFilter.java:108)\r\n	at org.apache.shiro.web.servlet.AdviceFilter.doFilterInternal(AdviceFilter.java:137)\r\n	at org.apache.shiro.web.servlet.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:125)\r\n	at org.apache.shiro.web.servlet.ProxiedFilterChain.doFilter(ProxiedFilterChain.java:66)\r\n	at org.apache.shiro.web.servlet.AbstractShiroFilter.executeChain(AbstractShiroFilter.java:449)\r\n	at org.apache.shiro.web.servlet.AbstractShiroFilterT1.call(AbstractShiroFilter.java:365)\r\n	at org.apache.shiro.subject.support.SubjectCallable.doCall(SubjectCallable.java:90)\r\n	at org.apache.shiro.subject.support.SubjectCallable.call(SubjectCallable.java:83)\r\n	at org.apache.shiro.subject.support.DelegatingSubject.execute(DelegatingSubject.java:387)\r\n	at org.apache.shiro.web.servlet.AbstractShiroFilter.doFilterInternal(AbstractShiroFilter.java:362)\r\n	at org.apache.shiro.web.servlet.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:125)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at cn.stylefeng.roses.core.xss.XssFilter.doFilter(XssFilter.java:31)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at com.alibaba.druid.support.http.WebStatFilter.doFilter(WebStatFilter.java:123)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at org.springframework.web.filter.RequestContextFilter.doFilterInternal(RequestContextFilter.java:99)\r\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:107)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at org.springframework.web.filter.HttpPutFormContentFilter.doFilterInternal(HttpPutFormContentFilter.java:109)\r\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:107)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at org.springframework.web.filter.HiddenHttpMethodFilter.doFilterInternal(HiddenHttpMethodFilter.java:81)\r\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:107)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at org.springframework.web.filter.CharacterEncodingFilter.doFilterInternal(CharacterEncodingFilter.java:200)\r\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:107)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at org.apache.catalina.core.StandardWrapperValve.invoke(StandardWrapperValve.java:198)\r\n	at org.apache.catalina.core.StandardContextValve.invoke(StandardContextValve.java:96)\r\n	at org.apache.catalina.authenticator.AuthenticatorBase.invoke(AuthenticatorBase.java:496)\r\n	at org.apache.catalina.core.StandardHostValve.invoke(StandardHostValve.java:140)\r\n	at org.apache.catalina.valves.ErrorReportValve.invoke(ErrorReportValve.java:81)\r\n	at org.apache.catalina.core.StandardEngineValve.invoke(StandardEngineValve.java:87)\r\n	at org.apache.catalina.connector.CoyoteAdapter.service(CoyoteAdapter.java:342)\r\n	at org.apache.coyote.http11.Http11Processor.service(Http11Processor.java:803)\r\n	at org.apache.coyote.AbstractProcessorLight.process(AbstractProcessorLight.java:66)\r\n	at org.apache.coyote.AbstractProtocolTConnectionHandler.process(AbstractProtocol.java:790)\r\n	at org.apache.tomcat.util.net.NioEndpointTSocketProcessor.doRun(NioEndpoint.java:1459)\r\n	at org.apache.tomcat.util.net.SocketProcessorBase.run(SocketProcessorBase.java:49)\r\n	at java.util.concurrent.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1149)\r\n	at java.util.concurrent.ThreadPoolExecutorTWorker.run(ThreadPoolExecutor.java:624)\r\n	at org.apache.tomcat.util.threads.TaskThreadTWrappingRunnable.run(TaskThread.java:61)\r\n	at java.lang.Thread.run(Thread.java:748)\r\n');
INSERT INTO `sys_operation_log` VALUES ('129', '异常日志', '', '57', null, null, '2019-05-04 13:53:55', '失败', 'org.springframework.jdbc.BadSqlGrammarException: \r\n### Error querying database.  Cause: java.sql.SQLSyntaxErrorException: Unknown column \'uerid\' in \'where clause\'\r\n### The error may exist in cn/stylefeng/guns/modular/system/dao/OrderapplyMapper.java (best guess)\r\n### The error may involve cn.stylefeng.guns.modular.system.dao.OrderapplyMapper.countOrderApplyByAddressAndUserId-Inline\r\n### The error occurred while setting parameters\r\n### SQL: select count(1) from sys_orderapply where uerid = ? and placeid = ? and status = 2\r\n### Cause: java.sql.SQLSyntaxErrorException: Unknown column \'uerid\' in \'where clause\'\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: Unknown column \'uerid\' in \'where clause\'\r\n	at org.springframework.jdbc.support.SQLErrorCodeSQLExceptionTranslator.doTranslate(SQLErrorCodeSQLExceptionTranslator.java:234)\r\n	at org.springframework.jdbc.support.AbstractFallbackSQLExceptionTranslator.translate(AbstractFallbackSQLExceptionTranslator.java:72)\r\n	at org.mybatis.spring.MyBatisExceptionTranslator.translateExceptionIfPossible(MyBatisExceptionTranslator.java:73)\r\n	at org.mybatis.spring.SqlSessionTemplateTSqlSessionInterceptor.invoke(SqlSessionTemplate.java:446)\r\n	at com.sun.proxy.TProxy91.selectOne(Unknown Source)\r\n	at org.mybatis.spring.SqlSessionTemplate.selectOne(SqlSessionTemplate.java:166)\r\n	at org.apache.ibatis.binding.MapperMethod.execute(MapperMethod.java:83)\r\n	at org.apache.ibatis.binding.MapperProxy.invoke(MapperProxy.java:59)\r\n	at com.sun.proxy.TProxy114.countOrderApplyByAddressAndUserId(Unknown Source)\r\n	at cn.stylefeng.guns.modular.system.service.impl.OrderapplyServiceImpl.countOrderApplyByAddressAndUserId(OrderapplyServiceImpl.java:69)\r\n	at cn.stylefeng.guns.modular.system.service.impl.OrderapplyServiceImplTTFastClassBySpringCGLIBTT8445d3e8.invoke(<generated>)\r\n	at org.springframework.cglib.proxy.MethodProxy.invoke(MethodProxy.java:204)\r\n	at org.springframework.aop.framework.CglibAopProxyTCglibMethodInvocation.invokeJoinpoint(CglibAopProxy.java:747)\r\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:163)\r\n	at com.alibaba.druid.support.spring.stat.DruidStatInterceptor.invoke(DruidStatInterceptor.java:72)\r\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:185)\r\n	at org.springframework.aop.framework.CglibAopProxyTDynamicAdvisedInterceptor.intercept(CglibAopProxy.java:689)\r\n	at cn.stylefeng.guns.modular.system.service.impl.OrderapplyServiceImplTTEnhancerBySpringCGLIBTT85fa2bea.countOrderApplyByAddressAndUserId(<generated>)\r\n	at cn.stylefeng.guns.modular.system.controller.OrderapplyController.add(OrderapplyController.java:151)\r\n	at cn.stylefeng.guns.modular.system.controller.OrderapplyControllerTTFastClassBySpringCGLIBTT4f1463c6.invoke(<generated>)\r\n	at org.springframework.cglib.proxy.MethodProxy.invoke(MethodProxy.java:204)\r\n	at org.springframework.aop.framework.CglibAopProxyTCglibMethodInvocation.invokeJoinpoint(CglibAopProxy.java:747)\r\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:163)\r\n	at org.springframework.aop.aspectj.MethodInvocationProceedingJoinPoint.proceed(MethodInvocationProceedingJoinPoint.java:89)\r\n	at cn.stylefeng.guns.core.interceptor.SessionHolderInterceptor.sessionKit(SessionHolderInterceptor.java:44)\r\n	at sun.reflect.NativeMethodAccessorImpl.invoke0(Native Method)\r\n	at sun.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:62)\r\n	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\r\n	at java.lang.reflect.Method.invoke(Method.java:498)\r\n	at org.springframework.aop.aspectj.AbstractAspectJAdvice.invokeAdviceMethodWithGivenArgs(AbstractAspectJAdvice.java:644)\r\n	at org.springframework.aop.aspectj.AbstractAspectJAdvice.invokeAdviceMethod(AbstractAspectJAdvice.java:633)\r\n	at org.springframework.aop.aspectj.AspectJAroundAdvice.invoke(AspectJAroundAdvice.java:70)\r\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:185)\r\n	at org.springframework.aop.interceptor.ExposeInvocationInterceptor.invoke(ExposeInvocationInterceptor.java:92)\r\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:185)\r\n	at org.springframework.aop.framework.CglibAopProxyTDynamicAdvisedInterceptor.intercept(CglibAopProxy.java:689)\r\n	at cn.stylefeng.guns.modular.system.controller.OrderapplyControllerTTEnhancerBySpringCGLIBTT7773237b.add(<generated>)\r\n	at sun.reflect.NativeMethodAccessorImpl.invoke0(Native Method)\r\n	at sun.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:62)\r\n	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\r\n	at java.lang.reflect.Method.invoke(Method.java:498)\r\n	at org.springframework.web.method.support.InvocableHandlerMethod.doInvoke(InvocableHandlerMethod.java:209)\r\n	at org.springframework.web.method.support.InvocableHandlerMethod.invokeForRequest(InvocableHandlerMethod.java:136)\r\n	at org.springframework.web.servlet.mvc.method.annotation.ServletInvocableHandlerMethod.invokeAndHandle(ServletInvocableHandlerMethod.java:102)\r\n	at org.springframework.web.servlet.mvc.method.annotation.RequestMappingHandlerAdapter.invokeHandlerMethod(RequestMappingHandlerAdapter.java:877)\r\n	at org.springframework.web.servlet.mvc.method.annotation.RequestMappingHandlerAdapter.handleInternal(RequestMappingHandlerAdapter.java:783)\r\n	at org.springframework.web.servlet.mvc.method.AbstractHandlerMethodAdapter.handle(AbstractHandlerMethodAdapter.java:87)\r\n	at org.springframework.web.servlet.DispatcherServlet.doDispatch(DispatcherServlet.java:991)\r\n	at org.springframework.web.servlet.DispatcherServlet.doService(DispatcherServlet.java:925)\r\n	at org.springframework.web.servlet.FrameworkServlet.processRequest(FrameworkServlet.java:974)\r\n	at org.springframework.web.servlet.FrameworkServlet.doPost(FrameworkServlet.java:877)\r\n	at javax.servlet.http.HttpServlet.service(HttpServlet.java:661)\r\n	at org.springframework.web.servlet.FrameworkServlet.service(FrameworkServlet.java:851)\r\n	at javax.servlet.http.HttpServlet.service(HttpServlet.java:742)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:231)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at org.apache.tomcat.websocket.server.WsFilter.doFilter(WsFilter.java:52)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at org.apache.shiro.web.servlet.ProxiedFilterChain.doFilter(ProxiedFilterChain.java:61)\r\n	at org.apache.shiro.web.servlet.AdviceFilter.executeChain(AdviceFilter.java:108)\r\n	at org.apache.shiro.web.servlet.AdviceFilter.doFilterInternal(AdviceFilter.java:137)\r\n	at org.apache.shiro.web.servlet.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:125)\r\n	at org.apache.shiro.web.servlet.ProxiedFilterChain.doFilter(ProxiedFilterChain.java:66)\r\n	at org.apache.shiro.web.servlet.AbstractShiroFilter.executeChain(AbstractShiroFilter.java:449)\r\n	at org.apache.shiro.web.servlet.AbstractShiroFilterT1.call(AbstractShiroFilter.java:365)\r\n	at org.apache.shiro.subject.support.SubjectCallable.doCall(SubjectCallable.java:90)\r\n	at org.apache.shiro.subject.support.SubjectCallable.call(SubjectCallable.java:83)\r\n	at org.apache.shiro.subject.support.DelegatingSubject.execute(DelegatingSubject.java:387)\r\n	at org.apache.shiro.web.servlet.AbstractShiroFilter.doFilterInternal(AbstractShiroFilter.java:362)\r\n	at org.apache.shiro.web.servlet.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:125)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at cn.stylefeng.roses.core.xss.XssFilter.doFilter(XssFilter.java:31)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at com.alibaba.druid.support.http.WebStatFilter.doFilter(WebStatFilter.java:123)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at org.springframework.web.filter.RequestContextFilter.doFilterInternal(RequestContextFilter.java:99)\r\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:107)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at org.springframework.web.filter.HttpPutFormContentFilter.doFilterInternal(HttpPutFormContentFilter.java:109)\r\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:107)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at org.springframework.web.filter.HiddenHttpMethodFilter.doFilterInternal(HiddenHttpMethodFilter.java:81)\r\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:107)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at org.springframework.web.filter.CharacterEncodingFilter.doFilterInternal(CharacterEncodingFilter.java:200)\r\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:107)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at org.apache.catalina.core.StandardWrapperValve.invoke(StandardWrapperValve.java:198)\r\n	at org.apache.catalina.core.StandardContextValve.invoke(StandardContextValve.java:96)\r\n	at org.apache.catalina.authenticator.AuthenticatorBase.invoke(AuthenticatorBase.java:496)\r\n	at org.apache.catalina.core.StandardHostValve.invoke(StandardHostValve.java:140)\r\n	at org.apache.catalina.valves.ErrorReportValve.invoke(ErrorReportValve.java:81)\r\n	at org.apache.catalina.core.StandardEngineValve.invoke(StandardEngineValve.java:87)\r\n	at org.apache.catalina.connector.CoyoteAdapter.service(CoyoteAdapter.java:342)\r\n	at org.apache.coyote.http11.Http11Processor.service(Http11Processor.java:803)\r\n	at org.apache.coyote.AbstractProcessorLight.process(AbstractProcessorLight.java:66)\r\n	at org.apache.coyote.AbstractProtocolTConnectionHandler.process(AbstractProtocol.java:790)\r\n	at org.apache.tomcat.util.net.NioEndpointTSocketProcessor.doRun(NioEndpoint.java:1459)\r\n	at org.apache.tomcat.util.net.SocketProcessorBase.run(SocketProcessorBase.java:49)\r\n	at java.util.concurrent.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1149)\r\n	at java.util.concurrent.ThreadPoolExecutorTWorker.run(ThreadPoolExecutor.java:624)\r\n	at org.apache.tomcat.util.threads.TaskThreadTWrappingRunnable.run(TaskThread.java:61)\r\n	at java.lang.Thread.run(Thread.java:748)\r\nCaused by: java.sql.SQLSyntaxErrorException: Unknown column \'uerid\' in \'where clause\'\r\n	at com.mysql.cj.jdbc.exceptions.SQLError.createSQLException(SQLError.java:118)\r\n	at com.mysql.cj.jdbc.exceptions.SQLError.createSQLException(SQLError.java:95)\r\n	at com.mysql.cj.jdbc.exceptions.SQLExceptionsMapping.translateException(SQLExceptionsMapping.java:122)\r\n	at com.mysql.cj.jdbc.ClientPreparedStatement.executeInternal(ClientPreparedStatement.java:960)\r\n	at com.mysql.cj.jdbc.ClientPreparedStatement.execute(ClientPreparedStatement.java:388)\r\n	at com.alibaba.druid.filter.FilterChainImpl.preparedStatement_execute(FilterChainImpl.java:3409)\r\n	at com.alibaba.druid.filter.FilterEventAdapter.preparedStatement_execute(FilterEventAdapter.java:440)\r\n	at com.alibaba.druid.filter.FilterChainImpl.preparedStatement_execute(FilterChainImpl.java:3407)\r\n	at com.alibaba.druid.wall.WallFilter.preparedStatement_execute(WallFilter.java:619)\r\n	at com.alibaba.druid.filter.FilterChainImpl.preparedStatement_execute(FilterChainImpl.java:3407)\r\n	at com.alibaba.druid.proxy.jdbc.PreparedStatementProxyImpl.execute(PreparedStatementProxyImpl.java:167)\r\n	at com.alibaba.druid.pool.DruidPooledPreparedStatement.execute(DruidPooledPreparedStatement.java:498)\r\n	at sun.reflect.NativeMethodAccessorImpl.invoke0(Native Method)\r\n	at sun.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:62)\r\n	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\r\n	at java.lang.reflect.Method.invoke(Method.java:498)\r\n	at org.apache.ibatis.logging.jdbc.PreparedStatementLogger.invoke(PreparedStatementLogger.java:59)\r\n	at com.sun.proxy.TProxy130.execute(Unknown Source)\r\n	at org.apache.ibatis.executor.statement.PreparedStatementHandler.query(PreparedStatementHandler.java:63)\r\n	at org.apache.ibatis.executor.statement.RoutingStatementHandler.query(RoutingStatementHandler.java:79)\r\n	at sun.reflect.GeneratedMethodAccessor85.invoke(Unknown Source)\r\n	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\r\n	at java.lang.reflect.Method.invoke(Method.java:498)\r\n	at org.apache.ibatis.plugin.Plugin.invoke(Plugin.java:63)\r\n	at com.sun.proxy.TProxy127.query(Unknown Source)\r\n	at sun.reflect.GeneratedMethodAccessor85.invoke(Unknown Source)\r\n	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\r\n	at java.lang.reflect.Method.invoke(Method.java:498)\r\n	at org.apache.ibatis.plugin.Plugin.invoke(Plugin.java:63)\r\n	at com.sun.proxy.TProxy127.query(Unknown Source)\r\n	at org.apache.ibatis.executor.SimpleExecutor.doQuery(SimpleExecutor.java:63)\r\n	at org.apache.ibatis.executor.BaseExecutor.queryFromDatabase(BaseExecutor.java:326)\r\n	at org.apache.ibatis.executor.BaseExecutor.query(BaseExecutor.java:156)\r\n	at org.apache.ibatis.executor.CachingExecutor.query(CachingExecutor.java:109)\r\n	at org.apache.ibatis.executor.CachingExecutor.query(CachingExecutor.java:83)\r\n	at sun.reflect.NativeMethodAccessorImpl.invoke0(Native Method)\r\n	at sun.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:62)\r\n	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\r\n	at java.lang.reflect.Method.invoke(Method.java:498)\r\n	at org.apache.ibatis.plugin.Plugin.invoke(Plugin.java:63)\r\n	at com.sun.proxy.TProxy126.query(Unknown Source)\r\n	at org.apache.ibatis.session.defaults.DefaultSqlSession.selectList(DefaultSqlSession.java:148)\r\n	at org.apache.ibatis.session.defaults.DefaultSqlSession.selectList(DefaultSqlSession.java:141)\r\n	at org.apache.ibatis.session.defaults.DefaultSqlSession.selectOne(DefaultSqlSession.java:77)\r\n	at sun.reflect.NativeMethodAccessorImpl.invoke0(Native Method)\r\n	at sun.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:62)\r\n	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\r\n	at java.lang.reflect.Method.invoke(Method.java:498)\r\n	at org.mybatis.spring.SqlSessionTemplateTSqlSessionInterceptor.invoke(SqlSessionTemplate.java:433)\r\n	... 107 more\r\n');
INSERT INTO `sys_operation_log` VALUES ('130', '异常日志', '', '57', null, null, '2019-05-04 15:46:36', '失败', 'org.apache.ibatis.binding.BindingException: Mapper method \'cn.stylefeng.guns.modular.system.dao.OrderMapper.selectGrade attempted to return null from a method with a primitive return type (int).\r\n	at org.apache.ibatis.binding.MapperMethod.execute(MapperMethod.java:94)\r\n	at org.apache.ibatis.binding.MapperProxy.invoke(MapperProxy.java:59)\r\n	at com.sun.proxy.TProxy115.selectGrade(Unknown Source)\r\n	at cn.stylefeng.guns.modular.system.service.impl.OrderServiceImpl.selectGrade(OrderServiceImpl.java:50)\r\n	at cn.stylefeng.guns.modular.system.service.impl.OrderServiceImplTTFastClassBySpringCGLIBTTad9547f4.invoke(<generated>)\r\n	at org.springframework.cglib.proxy.MethodProxy.invoke(MethodProxy.java:204)\r\n	at org.springframework.aop.framework.CglibAopProxyTCglibMethodInvocation.invokeJoinpoint(CglibAopProxy.java:747)\r\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:163)\r\n	at com.alibaba.druid.support.spring.stat.DruidStatInterceptor.invoke(DruidStatInterceptor.java:72)\r\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:185)\r\n	at org.springframework.aop.framework.CglibAopProxyTDynamicAdvisedInterceptor.intercept(CglibAopProxy.java:689)\r\n	at cn.stylefeng.guns.modular.system.service.impl.OrderServiceImplTTEnhancerBySpringCGLIBTT8ad4636f.selectGrade(<generated>)\r\n	at cn.stylefeng.guns.modular.system.controller.OrderController.getOrder(OrderController.java:130)\r\n	at cn.stylefeng.guns.modular.system.controller.OrderControllerTTFastClassBySpringCGLIBTT8d30cc20.invoke(<generated>)\r\n	at org.springframework.cglib.proxy.MethodProxy.invoke(MethodProxy.java:204)\r\n	at org.springframework.aop.framework.CglibAopProxyTCglibMethodInvocation.invokeJoinpoint(CglibAopProxy.java:747)\r\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:163)\r\n	at org.springframework.aop.aspectj.MethodInvocationProceedingJoinPoint.proceed(MethodInvocationProceedingJoinPoint.java:89)\r\n	at cn.stylefeng.guns.core.interceptor.SessionHolderInterceptor.sessionKit(SessionHolderInterceptor.java:44)\r\n	at sun.reflect.GeneratedMethodAccessor100.invoke(Unknown Source)\r\n	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\r\n	at java.lang.reflect.Method.invoke(Method.java:498)\r\n	at org.springframework.aop.aspectj.AbstractAspectJAdvice.invokeAdviceMethodWithGivenArgs(AbstractAspectJAdvice.java:644)\r\n	at org.springframework.aop.aspectj.AbstractAspectJAdvice.invokeAdviceMethod(AbstractAspectJAdvice.java:633)\r\n	at org.springframework.aop.aspectj.AspectJAroundAdvice.invoke(AspectJAroundAdvice.java:70)\r\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:185)\r\n	at org.springframework.aop.interceptor.ExposeInvocationInterceptor.invoke(ExposeInvocationInterceptor.java:92)\r\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:185)\r\n	at org.springframework.aop.framework.CglibAopProxyTDynamicAdvisedInterceptor.intercept(CglibAopProxy.java:689)\r\n	at cn.stylefeng.guns.modular.system.controller.OrderControllerTTEnhancerBySpringCGLIBTTe28360ee.getOrder(<generated>)\r\n	at sun.reflect.NativeMethodAccessorImpl.invoke0(Native Method)\r\n	at sun.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:62)\r\n	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\r\n	at java.lang.reflect.Method.invoke(Method.java:498)\r\n	at org.springframework.web.method.support.InvocableHandlerMethod.doInvoke(InvocableHandlerMethod.java:209)\r\n	at org.springframework.web.method.support.InvocableHandlerMethod.invokeForRequest(InvocableHandlerMethod.java:136)\r\n	at org.springframework.web.servlet.mvc.method.annotation.ServletInvocableHandlerMethod.invokeAndHandle(ServletInvocableHandlerMethod.java:102)\r\n	at org.springframework.web.servlet.mvc.method.annotation.RequestMappingHandlerAdapter.invokeHandlerMethod(RequestMappingHandlerAdapter.java:877)\r\n	at org.springframework.web.servlet.mvc.method.annotation.RequestMappingHandlerAdapter.handleInternal(RequestMappingHandlerAdapter.java:783)\r\n	at org.springframework.web.servlet.mvc.method.AbstractHandlerMethodAdapter.handle(AbstractHandlerMethodAdapter.java:87)\r\n	at org.springframework.web.servlet.DispatcherServlet.doDispatch(DispatcherServlet.java:991)\r\n	at org.springframework.web.servlet.DispatcherServlet.doService(DispatcherServlet.java:925)\r\n	at org.springframework.web.servlet.FrameworkServlet.processRequest(FrameworkServlet.java:974)\r\n	at org.springframework.web.servlet.FrameworkServlet.doPost(FrameworkServlet.java:877)\r\n	at javax.servlet.http.HttpServlet.service(HttpServlet.java:661)\r\n	at org.springframework.web.servlet.FrameworkServlet.service(FrameworkServlet.java:851)\r\n	at javax.servlet.http.HttpServlet.service(HttpServlet.java:742)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:231)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at org.apache.tomcat.websocket.server.WsFilter.doFilter(WsFilter.java:52)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at org.apache.shiro.web.servlet.ProxiedFilterChain.doFilter(ProxiedFilterChain.java:61)\r\n	at org.apache.shiro.web.servlet.AdviceFilter.executeChain(AdviceFilter.java:108)\r\n	at org.apache.shiro.web.servlet.AdviceFilter.doFilterInternal(AdviceFilter.java:137)\r\n	at org.apache.shiro.web.servlet.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:125)\r\n	at org.apache.shiro.web.servlet.ProxiedFilterChain.doFilter(ProxiedFilterChain.java:66)\r\n	at org.apache.shiro.web.servlet.AbstractShiroFilter.executeChain(AbstractShiroFilter.java:449)\r\n	at org.apache.shiro.web.servlet.AbstractShiroFilterT1.call(AbstractShiroFilter.java:365)\r\n	at org.apache.shiro.subject.support.SubjectCallable.doCall(SubjectCallable.java:90)\r\n	at org.apache.shiro.subject.support.SubjectCallable.call(SubjectCallable.java:83)\r\n	at org.apache.shiro.subject.support.DelegatingSubject.execute(DelegatingSubject.java:387)\r\n	at org.apache.shiro.web.servlet.AbstractShiroFilter.doFilterInternal(AbstractShiroFilter.java:362)\r\n	at org.apache.shiro.web.servlet.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:125)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at cn.stylefeng.roses.core.xss.XssFilter.doFilter(XssFilter.java:31)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at com.alibaba.druid.support.http.WebStatFilter.doFilter(WebStatFilter.java:123)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at org.springframework.web.filter.RequestContextFilter.doFilterInternal(RequestContextFilter.java:99)\r\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:107)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at org.springframework.web.filter.HttpPutFormContentFilter.doFilterInternal(HttpPutFormContentFilter.java:109)\r\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:107)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at org.springframework.web.filter.HiddenHttpMethodFilter.doFilterInternal(HiddenHttpMethodFilter.java:81)\r\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:107)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at org.springframework.web.filter.CharacterEncodingFilter.doFilterInternal(CharacterEncodingFilter.java:200)\r\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:107)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at org.apache.catalina.core.StandardWrapperValve.invoke(StandardWrapperValve.java:198)\r\n	at org.apache.catalina.core.StandardContextValve.invoke(StandardContextValve.java:96)\r\n	at org.apache.catalina.authenticator.AuthenticatorBase.invoke(AuthenticatorBase.java:496)\r\n	at org.apache.catalina.core.StandardHostValve.invoke(StandardHostValve.java:140)\r\n	at org.apache.catalina.valves.ErrorReportValve.invoke(ErrorReportValve.java:81)\r\n	at org.apache.catalina.core.StandardEngineValve.invoke(StandardEngineValve.java:87)\r\n	at org.apache.catalina.connector.CoyoteAdapter.service(CoyoteAdapter.java:342)\r\n	at org.apache.coyote.http11.Http11Processor.service(Http11Processor.java:803)\r\n	at org.apache.coyote.AbstractProcessorLight.process(AbstractProcessorLight.java:66)\r\n	at org.apache.coyote.AbstractProtocolTConnectionHandler.process(AbstractProtocol.java:790)\r\n	at org.apache.tomcat.util.net.NioEndpointTSocketProcessor.doRun(NioEndpoint.java:1459)\r\n	at org.apache.tomcat.util.net.SocketProcessorBase.run(SocketProcessorBase.java:49)\r\n	at java.util.concurrent.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1149)\r\n	at java.util.concurrent.ThreadPoolExecutorTWorker.run(ThreadPoolExecutor.java:624)\r\n	at org.apache.tomcat.util.threads.TaskThreadTWrappingRunnable.run(TaskThread.java:61)\r\n	at java.lang.Thread.run(Thread.java:748)\r\n');
INSERT INTO `sys_operation_log` VALUES ('131', '异常日志', '', '57', null, null, '2019-05-04 15:50:41', '失败', 'org.apache.ibatis.binding.BindingException: Mapper method \'cn.stylefeng.guns.modular.system.dao.OrderMapper.selectGrade attempted to return null from a method with a primitive return type (int).\r\n	at org.apache.ibatis.binding.MapperMethod.execute(MapperMethod.java:94)\r\n	at org.apache.ibatis.binding.MapperProxy.invoke(MapperProxy.java:59)\r\n	at com.sun.proxy.TProxy115.selectGrade(Unknown Source)\r\n	at cn.stylefeng.guns.modular.system.service.impl.OrderServiceImpl.selectGrade(OrderServiceImpl.java:50)\r\n	at cn.stylefeng.guns.modular.system.service.impl.OrderServiceImplTTFastClassBySpringCGLIBTTad9547f4.invoke(<generated>)\r\n	at org.springframework.cglib.proxy.MethodProxy.invoke(MethodProxy.java:204)\r\n	at org.springframework.aop.framework.CglibAopProxyTCglibMethodInvocation.invokeJoinpoint(CglibAopProxy.java:747)\r\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:163)\r\n	at com.alibaba.druid.support.spring.stat.DruidStatInterceptor.invoke(DruidStatInterceptor.java:72)\r\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:185)\r\n	at org.springframework.aop.framework.CglibAopProxyTDynamicAdvisedInterceptor.intercept(CglibAopProxy.java:689)\r\n	at cn.stylefeng.guns.modular.system.service.impl.OrderServiceImplTTEnhancerBySpringCGLIBTT7d5f0cb0.selectGrade(<generated>)\r\n	at cn.stylefeng.guns.modular.system.controller.OrderController.getOrder(OrderController.java:130)\r\n	at cn.stylefeng.guns.modular.system.controller.OrderControllerTTFastClassBySpringCGLIBTT8d30cc20.invoke(<generated>)\r\n	at org.springframework.cglib.proxy.MethodProxy.invoke(MethodProxy.java:204)\r\n	at org.springframework.aop.framework.CglibAopProxyTCglibMethodInvocation.invokeJoinpoint(CglibAopProxy.java:747)\r\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:163)\r\n	at org.springframework.aop.aspectj.MethodInvocationProceedingJoinPoint.proceed(MethodInvocationProceedingJoinPoint.java:89)\r\n	at cn.stylefeng.guns.core.interceptor.SessionHolderInterceptor.sessionKit(SessionHolderInterceptor.java:44)\r\n	at sun.reflect.NativeMethodAccessorImpl.invoke0(Native Method)\r\n	at sun.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:62)\r\n	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\r\n	at java.lang.reflect.Method.invoke(Method.java:498)\r\n	at org.springframework.aop.aspectj.AbstractAspectJAdvice.invokeAdviceMethodWithGivenArgs(AbstractAspectJAdvice.java:644)\r\n	at org.springframework.aop.aspectj.AbstractAspectJAdvice.invokeAdviceMethod(AbstractAspectJAdvice.java:633)\r\n	at org.springframework.aop.aspectj.AspectJAroundAdvice.invoke(AspectJAroundAdvice.java:70)\r\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:185)\r\n	at org.springframework.aop.interceptor.ExposeInvocationInterceptor.invoke(ExposeInvocationInterceptor.java:92)\r\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:185)\r\n	at org.springframework.aop.framework.CglibAopProxyTDynamicAdvisedInterceptor.intercept(CglibAopProxy.java:689)\r\n	at cn.stylefeng.guns.modular.system.controller.OrderControllerTTEnhancerBySpringCGLIBTTb3e96163.getOrder(<generated>)\r\n	at sun.reflect.NativeMethodAccessorImpl.invoke0(Native Method)\r\n	at sun.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:62)\r\n	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\r\n	at java.lang.reflect.Method.invoke(Method.java:498)\r\n	at org.springframework.web.method.support.InvocableHandlerMethod.doInvoke(InvocableHandlerMethod.java:209)\r\n	at org.springframework.web.method.support.InvocableHandlerMethod.invokeForRequest(InvocableHandlerMethod.java:136)\r\n	at org.springframework.web.servlet.mvc.method.annotation.ServletInvocableHandlerMethod.invokeAndHandle(ServletInvocableHandlerMethod.java:102)\r\n	at org.springframework.web.servlet.mvc.method.annotation.RequestMappingHandlerAdapter.invokeHandlerMethod(RequestMappingHandlerAdapter.java:877)\r\n	at org.springframework.web.servlet.mvc.method.annotation.RequestMappingHandlerAdapter.handleInternal(RequestMappingHandlerAdapter.java:783)\r\n	at org.springframework.web.servlet.mvc.method.AbstractHandlerMethodAdapter.handle(AbstractHandlerMethodAdapter.java:87)\r\n	at org.springframework.web.servlet.DispatcherServlet.doDispatch(DispatcherServlet.java:991)\r\n	at org.springframework.web.servlet.DispatcherServlet.doService(DispatcherServlet.java:925)\r\n	at org.springframework.web.servlet.FrameworkServlet.processRequest(FrameworkServlet.java:974)\r\n	at org.springframework.web.servlet.FrameworkServlet.doPost(FrameworkServlet.java:877)\r\n	at javax.servlet.http.HttpServlet.service(HttpServlet.java:661)\r\n	at org.springframework.web.servlet.FrameworkServlet.service(FrameworkServlet.java:851)\r\n	at javax.servlet.http.HttpServlet.service(HttpServlet.java:742)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:231)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at org.apache.tomcat.websocket.server.WsFilter.doFilter(WsFilter.java:52)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at org.apache.shiro.web.servlet.ProxiedFilterChain.doFilter(ProxiedFilterChain.java:61)\r\n	at org.apache.shiro.web.servlet.AdviceFilter.executeChain(AdviceFilter.java:108)\r\n	at org.apache.shiro.web.servlet.AdviceFilter.doFilterInternal(AdviceFilter.java:137)\r\n	at org.apache.shiro.web.servlet.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:125)\r\n	at org.apache.shiro.web.servlet.ProxiedFilterChain.doFilter(ProxiedFilterChain.java:66)\r\n	at org.apache.shiro.web.servlet.AbstractShiroFilter.executeChain(AbstractShiroFilter.java:449)\r\n	at org.apache.shiro.web.servlet.AbstractShiroFilterT1.call(AbstractShiroFilter.java:365)\r\n	at org.apache.shiro.subject.support.SubjectCallable.doCall(SubjectCallable.java:90)\r\n	at org.apache.shiro.subject.support.SubjectCallable.call(SubjectCallable.java:83)\r\n	at org.apache.shiro.subject.support.DelegatingSubject.execute(DelegatingSubject.java:387)\r\n	at org.apache.shiro.web.servlet.AbstractShiroFilter.doFilterInternal(AbstractShiroFilter.java:362)\r\n	at org.apache.shiro.web.servlet.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:125)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at cn.stylefeng.roses.core.xss.XssFilter.doFilter(XssFilter.java:31)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at com.alibaba.druid.support.http.WebStatFilter.doFilter(WebStatFilter.java:123)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at org.springframework.web.filter.RequestContextFilter.doFilterInternal(RequestContextFilter.java:99)\r\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:107)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at org.springframework.web.filter.HttpPutFormContentFilter.doFilterInternal(HttpPutFormContentFilter.java:109)\r\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:107)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at org.springframework.web.filter.HiddenHttpMethodFilter.doFilterInternal(HiddenHttpMethodFilter.java:81)\r\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:107)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at org.springframework.web.filter.CharacterEncodingFilter.doFilterInternal(CharacterEncodingFilter.java:200)\r\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:107)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at org.apache.catalina.core.StandardWrapperValve.invoke(StandardWrapperValve.java:198)\r\n	at org.apache.catalina.core.StandardContextValve.invoke(StandardContextValve.java:96)\r\n	at org.apache.catalina.authenticator.AuthenticatorBase.invoke(AuthenticatorBase.java:496)\r\n	at org.apache.catalina.core.StandardHostValve.invoke(StandardHostValve.java:140)\r\n	at org.apache.catalina.valves.ErrorReportValve.invoke(ErrorReportValve.java:81)\r\n	at org.apache.catalina.core.StandardEngineValve.invoke(StandardEngineValve.java:87)\r\n	at org.apache.catalina.connector.CoyoteAdapter.service(CoyoteAdapter.java:342)\r\n	at org.apache.coyote.http11.Http11Processor.service(Http11Processor.java:803)\r\n	at org.apache.coyote.AbstractProcessorLight.process(AbstractProcessorLight.java:66)\r\n	at org.apache.coyote.AbstractProtocolTConnectionHandler.process(AbstractProtocol.java:790)\r\n	at org.apache.tomcat.util.net.NioEndpointTSocketProcessor.doRun(NioEndpoint.java:1459)\r\n	at org.apache.tomcat.util.net.SocketProcessorBase.run(SocketProcessorBase.java:49)\r\n	at java.util.concurrent.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1149)\r\n	at java.util.concurrent.ThreadPoolExecutorTWorker.run(ThreadPoolExecutor.java:624)\r\n	at org.apache.tomcat.util.threads.TaskThreadTWrappingRunnable.run(TaskThread.java:61)\r\n	at java.lang.Thread.run(Thread.java:748)\r\n');
INSERT INTO `sys_operation_log` VALUES ('132', '异常日志', '', '57', null, null, '2019-05-04 15:52:31', '失败', 'java.lang.NullPointerException\r\n	at cn.stylefeng.guns.modular.system.controller.OrderController.getOrder(OrderController.java:139)\r\n	at cn.stylefeng.guns.modular.system.controller.OrderControllerTTFastClassBySpringCGLIBTT8d30cc20.invoke(<generated>)\r\n	at org.springframework.cglib.proxy.MethodProxy.invoke(MethodProxy.java:204)\r\n	at org.springframework.aop.framework.CglibAopProxyTCglibMethodInvocation.invokeJoinpoint(CglibAopProxy.java:747)\r\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:163)\r\n	at org.springframework.aop.aspectj.MethodInvocationProceedingJoinPoint.proceed(MethodInvocationProceedingJoinPoint.java:89)\r\n	at cn.stylefeng.guns.core.interceptor.SessionHolderInterceptor.sessionKit(SessionHolderInterceptor.java:44)\r\n	at sun.reflect.NativeMethodAccessorImpl.invoke0(Native Method)\r\n	at sun.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:62)\r\n	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\r\n	at java.lang.reflect.Method.invoke(Method.java:498)\r\n	at org.springframework.aop.aspectj.AbstractAspectJAdvice.invokeAdviceMethodWithGivenArgs(AbstractAspectJAdvice.java:644)\r\n	at org.springframework.aop.aspectj.AbstractAspectJAdvice.invokeAdviceMethod(AbstractAspectJAdvice.java:633)\r\n	at org.springframework.aop.aspectj.AspectJAroundAdvice.invoke(AspectJAroundAdvice.java:70)\r\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:185)\r\n	at org.springframework.aop.interceptor.ExposeInvocationInterceptor.invoke(ExposeInvocationInterceptor.java:92)\r\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:185)\r\n	at org.springframework.aop.framework.CglibAopProxyTDynamicAdvisedInterceptor.intercept(CglibAopProxy.java:689)\r\n	at cn.stylefeng.guns.modular.system.controller.OrderControllerTTEnhancerBySpringCGLIBTTf279d947.getOrder(<generated>)\r\n	at sun.reflect.NativeMethodAccessorImpl.invoke0(Native Method)\r\n	at sun.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:62)\r\n	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\r\n	at java.lang.reflect.Method.invoke(Method.java:498)\r\n	at org.springframework.web.method.support.InvocableHandlerMethod.doInvoke(InvocableHandlerMethod.java:209)\r\n	at org.springframework.web.method.support.InvocableHandlerMethod.invokeForRequest(InvocableHandlerMethod.java:136)\r\n	at org.springframework.web.servlet.mvc.method.annotation.ServletInvocableHandlerMethod.invokeAndHandle(ServletInvocableHandlerMethod.java:102)\r\n	at org.springframework.web.servlet.mvc.method.annotation.RequestMappingHandlerAdapter.invokeHandlerMethod(RequestMappingHandlerAdapter.java:877)\r\n	at org.springframework.web.servlet.mvc.method.annotation.RequestMappingHandlerAdapter.handleInternal(RequestMappingHandlerAdapter.java:783)\r\n	at org.springframework.web.servlet.mvc.method.AbstractHandlerMethodAdapter.handle(AbstractHandlerMethodAdapter.java:87)\r\n	at org.springframework.web.servlet.DispatcherServlet.doDispatch(DispatcherServlet.java:991)\r\n	at org.springframework.web.servlet.DispatcherServlet.doService(DispatcherServlet.java:925)\r\n	at org.springframework.web.servlet.FrameworkServlet.processRequest(FrameworkServlet.java:974)\r\n	at org.springframework.web.servlet.FrameworkServlet.doPost(FrameworkServlet.java:877)\r\n	at javax.servlet.http.HttpServlet.service(HttpServlet.java:661)\r\n	at org.springframework.web.servlet.FrameworkServlet.service(FrameworkServlet.java:851)\r\n	at javax.servlet.http.HttpServlet.service(HttpServlet.java:742)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:231)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at org.apache.tomcat.websocket.server.WsFilter.doFilter(WsFilter.java:52)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at org.apache.shiro.web.servlet.ProxiedFilterChain.doFilter(ProxiedFilterChain.java:61)\r\n	at org.apache.shiro.web.servlet.AdviceFilter.executeChain(AdviceFilter.java:108)\r\n	at org.apache.shiro.web.servlet.AdviceFilter.doFilterInternal(AdviceFilter.java:137)\r\n	at org.apache.shiro.web.servlet.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:125)\r\n	at org.apache.shiro.web.servlet.ProxiedFilterChain.doFilter(ProxiedFilterChain.java:66)\r\n	at org.apache.shiro.web.servlet.AbstractShiroFilter.executeChain(AbstractShiroFilter.java:449)\r\n	at org.apache.shiro.web.servlet.AbstractShiroFilterT1.call(AbstractShiroFilter.java:365)\r\n	at org.apache.shiro.subject.support.SubjectCallable.doCall(SubjectCallable.java:90)\r\n	at org.apache.shiro.subject.support.SubjectCallable.call(SubjectCallable.java:83)\r\n	at org.apache.shiro.subject.support.DelegatingSubject.execute(DelegatingSubject.java:387)\r\n	at org.apache.shiro.web.servlet.AbstractShiroFilter.doFilterInternal(AbstractShiroFilter.java:362)\r\n	at org.apache.shiro.web.servlet.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:125)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at cn.stylefeng.roses.core.xss.XssFilter.doFilter(XssFilter.java:31)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at com.alibaba.druid.support.http.WebStatFilter.doFilter(WebStatFilter.java:123)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at org.springframework.web.filter.RequestContextFilter.doFilterInternal(RequestContextFilter.java:99)\r\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:107)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at org.springframework.web.filter.HttpPutFormContentFilter.doFilterInternal(HttpPutFormContentFilter.java:109)\r\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:107)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at org.springframework.web.filter.HiddenHttpMethodFilter.doFilterInternal(HiddenHttpMethodFilter.java:81)\r\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:107)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at org.springframework.web.filter.CharacterEncodingFilter.doFilterInternal(CharacterEncodingFilter.java:200)\r\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:107)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at org.apache.catalina.core.StandardWrapperValve.invoke(StandardWrapperValve.java:198)\r\n	at org.apache.catalina.core.StandardContextValve.invoke(StandardContextValve.java:96)\r\n	at org.apache.catalina.authenticator.AuthenticatorBase.invoke(AuthenticatorBase.java:496)\r\n	at org.apache.catalina.core.StandardHostValve.invoke(StandardHostValve.java:140)\r\n	at org.apache.catalina.valves.ErrorReportValve.invoke(ErrorReportValve.java:81)\r\n	at org.apache.catalina.core.StandardEngineValve.invoke(StandardEngineValve.java:87)\r\n	at org.apache.catalina.connector.CoyoteAdapter.service(CoyoteAdapter.java:342)\r\n	at org.apache.coyote.http11.Http11Processor.service(Http11Processor.java:803)\r\n	at org.apache.coyote.AbstractProcessorLight.process(AbstractProcessorLight.java:66)\r\n	at org.apache.coyote.AbstractProtocolTConnectionHandler.process(AbstractProtocol.java:790)\r\n	at org.apache.tomcat.util.net.NioEndpointTSocketProcessor.doRun(NioEndpoint.java:1459)\r\n	at org.apache.tomcat.util.net.SocketProcessorBase.run(SocketProcessorBase.java:49)\r\n	at java.util.concurrent.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1149)\r\n	at java.util.concurrent.ThreadPoolExecutorTWorker.run(ThreadPoolExecutor.java:624)\r\n	at org.apache.tomcat.util.threads.TaskThreadTWrappingRunnable.run(TaskThread.java:61)\r\n	at java.lang.Thread.run(Thread.java:748)\r\n');
INSERT INTO `sys_operation_log` VALUES ('133', '业务日志', '新增通知', '1', 'cn.stylefeng.guns.modular.system.controller.NoticeController', 'add', '2019-05-05 14:14:43', '成功', '标题=测试通知');
INSERT INTO `sys_operation_log` VALUES ('134', '异常日志', '', '1', null, null, '2019-05-05 14:30:34', '失败', 'java.lang.ClassCastException: java.sql.Timestamp cannot be cast to java.lang.String\r\n	at cn.stylefeng.guns.modular.system.warpper.NoticeWrapper.wrapTheMap(NoticeWrapper.java:54)\r\n	at cn.stylefeng.roses.core.base.warpper.BaseControllerWrapper.wrap(BaseControllerWrapper.java:73)\r\n	at cn.stylefeng.roses.core.base.controller.BaseController.warpObject(BaseController.java:77)\r\n	at cn.stylefeng.guns.modular.system.controller.NoticeController.list(NoticeController.java:110)\r\n	at cn.stylefeng.guns.modular.system.controller.NoticeControllerTTFastClassBySpringCGLIBTTec17acbe.invoke(<generated>)\r\n	at org.springframework.cglib.proxy.MethodProxy.invoke(MethodProxy.java:204)\r\n	at org.springframework.aop.framework.CglibAopProxyTCglibMethodInvocation.invokeJoinpoint(CglibAopProxy.java:747)\r\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:163)\r\n	at org.springframework.aop.aspectj.MethodInvocationProceedingJoinPoint.proceed(MethodInvocationProceedingJoinPoint.java:89)\r\n	at cn.stylefeng.guns.core.interceptor.SessionHolderInterceptor.sessionKit(SessionHolderInterceptor.java:44)\r\n	at sun.reflect.NativeMethodAccessorImpl.invoke0(Native Method)\r\n	at sun.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:62)\r\n	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\r\n	at java.lang.reflect.Method.invoke(Method.java:498)\r\n	at org.springframework.aop.aspectj.AbstractAspectJAdvice.invokeAdviceMethodWithGivenArgs(AbstractAspectJAdvice.java:644)\r\n	at org.springframework.aop.aspectj.AbstractAspectJAdvice.invokeAdviceMethod(AbstractAspectJAdvice.java:633)\r\n	at org.springframework.aop.aspectj.AspectJAroundAdvice.invoke(AspectJAroundAdvice.java:70)\r\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:185)\r\n	at org.springframework.aop.interceptor.ExposeInvocationInterceptor.invoke(ExposeInvocationInterceptor.java:92)\r\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:185)\r\n	at org.springframework.aop.framework.CglibAopProxyTDynamicAdvisedInterceptor.intercept(CglibAopProxy.java:689)\r\n	at cn.stylefeng.guns.modular.system.controller.NoticeControllerTTEnhancerBySpringCGLIBTTb0a6018b.list(<generated>)\r\n	at sun.reflect.NativeMethodAccessorImpl.invoke0(Native Method)\r\n	at sun.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:62)\r\n	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\r\n	at java.lang.reflect.Method.invoke(Method.java:498)\r\n	at org.springframework.web.method.support.InvocableHandlerMethod.doInvoke(InvocableHandlerMethod.java:209)\r\n	at org.springframework.web.method.support.InvocableHandlerMethod.invokeForRequest(InvocableHandlerMethod.java:136)\r\n	at org.springframework.web.servlet.mvc.method.annotation.ServletInvocableHandlerMethod.invokeAndHandle(ServletInvocableHandlerMethod.java:102)\r\n	at org.springframework.web.servlet.mvc.method.annotation.RequestMappingHandlerAdapter.invokeHandlerMethod(RequestMappingHandlerAdapter.java:877)\r\n	at org.springframework.web.servlet.mvc.method.annotation.RequestMappingHandlerAdapter.handleInternal(RequestMappingHandlerAdapter.java:783)\r\n	at org.springframework.web.servlet.mvc.method.AbstractHandlerMethodAdapter.handle(AbstractHandlerMethodAdapter.java:87)\r\n	at org.springframework.web.servlet.DispatcherServlet.doDispatch(DispatcherServlet.java:991)\r\n	at org.springframework.web.servlet.DispatcherServlet.doService(DispatcherServlet.java:925)\r\n	at org.springframework.web.servlet.FrameworkServlet.processRequest(FrameworkServlet.java:974)\r\n	at org.springframework.web.servlet.FrameworkServlet.doPost(FrameworkServlet.java:877)\r\n	at javax.servlet.http.HttpServlet.service(HttpServlet.java:661)\r\n	at org.springframework.web.servlet.FrameworkServlet.service(FrameworkServlet.java:851)\r\n	at javax.servlet.http.HttpServlet.service(HttpServlet.java:742)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:231)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at org.apache.tomcat.websocket.server.WsFilter.doFilter(WsFilter.java:52)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at org.apache.shiro.web.servlet.ProxiedFilterChain.doFilter(ProxiedFilterChain.java:61)\r\n	at org.apache.shiro.web.servlet.AdviceFilter.executeChain(AdviceFilter.java:108)\r\n	at org.apache.shiro.web.servlet.AdviceFilter.doFilterInternal(AdviceFilter.java:137)\r\n	at org.apache.shiro.web.servlet.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:125)\r\n	at org.apache.shiro.web.servlet.ProxiedFilterChain.doFilter(ProxiedFilterChain.java:66)\r\n	at org.apache.shiro.web.servlet.AbstractShiroFilter.executeChain(AbstractShiroFilter.java:449)\r\n	at org.apache.shiro.web.servlet.AbstractShiroFilterT1.call(AbstractShiroFilter.java:365)\r\n	at org.apache.shiro.subject.support.SubjectCallable.doCall(SubjectCallable.java:90)\r\n	at org.apache.shiro.subject.support.SubjectCallable.call(SubjectCallable.java:83)\r\n	at org.apache.shiro.subject.support.DelegatingSubject.execute(DelegatingSubject.java:387)\r\n	at org.apache.shiro.web.servlet.AbstractShiroFilter.doFilterInternal(AbstractShiroFilter.java:362)\r\n	at org.apache.shiro.web.servlet.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:125)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at cn.stylefeng.roses.core.xss.XssFilter.doFilter(XssFilter.java:31)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at com.alibaba.druid.support.http.WebStatFilter.doFilter(WebStatFilter.java:123)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at org.springframework.web.filter.RequestContextFilter.doFilterInternal(RequestContextFilter.java:99)\r\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:107)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at org.springframework.web.filter.HttpPutFormContentFilter.doFilterInternal(HttpPutFormContentFilter.java:109)\r\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:107)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at org.springframework.web.filter.HiddenHttpMethodFilter.doFilterInternal(HiddenHttpMethodFilter.java:81)\r\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:107)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at org.springframework.web.filter.CharacterEncodingFilter.doFilterInternal(CharacterEncodingFilter.java:200)\r\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:107)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at org.apache.catalina.core.StandardWrapperValve.invoke(StandardWrapperValve.java:198)\r\n	at org.apache.catalina.core.StandardContextValve.invoke(StandardContextValve.java:96)\r\n	at org.apache.catalina.authenticator.AuthenticatorBase.invoke(AuthenticatorBase.java:496)\r\n	at org.apache.catalina.core.StandardHostValve.invoke(StandardHostValve.java:140)\r\n	at org.apache.catalina.valves.ErrorReportValve.invoke(ErrorReportValve.java:81)\r\n	at org.apache.catalina.core.StandardEngineValve.invoke(StandardEngineValve.java:87)\r\n	at org.apache.catalina.connector.CoyoteAdapter.service(CoyoteAdapter.java:342)\r\n	at org.apache.coyote.http11.Http11Processor.service(Http11Processor.java:803)\r\n	at org.apache.coyote.AbstractProcessorLight.process(AbstractProcessorLight.java:66)\r\n	at org.apache.coyote.AbstractProtocolTConnectionHandler.process(AbstractProtocol.java:790)\r\n	at org.apache.tomcat.util.net.NioEndpointTSocketProcessor.doRun(NioEndpoint.java:1459)\r\n	at org.apache.tomcat.util.net.SocketProcessorBase.run(SocketProcessorBase.java:49)\r\n	at java.util.concurrent.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1149)\r\n	at java.util.concurrent.ThreadPoolExecutorTWorker.run(ThreadPoolExecutor.java:624)\r\n	at org.apache.tomcat.util.threads.TaskThreadTWrappingRunnable.run(TaskThread.java:61)\r\n	at java.lang.Thread.run(Thread.java:748)\r\n');
INSERT INTO `sys_operation_log` VALUES ('135', '异常日志', '', '1', null, null, '2019-05-05 14:30:46', '失败', 'java.lang.ClassCastException: java.sql.Timestamp cannot be cast to java.lang.String\r\n	at cn.stylefeng.guns.modular.system.warpper.NoticeWrapper.wrapTheMap(NoticeWrapper.java:54)\r\n	at cn.stylefeng.roses.core.base.warpper.BaseControllerWrapper.wrap(BaseControllerWrapper.java:73)\r\n	at cn.stylefeng.roses.core.base.controller.BaseController.warpObject(BaseController.java:77)\r\n	at cn.stylefeng.guns.modular.system.controller.NoticeController.list(NoticeController.java:110)\r\n	at cn.stylefeng.guns.modular.system.controller.NoticeControllerTTFastClassBySpringCGLIBTTec17acbe.invoke(<generated>)\r\n	at org.springframework.cglib.proxy.MethodProxy.invoke(MethodProxy.java:204)\r\n	at org.springframework.aop.framework.CglibAopProxyTCglibMethodInvocation.invokeJoinpoint(CglibAopProxy.java:747)\r\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:163)\r\n	at org.springframework.aop.aspectj.MethodInvocationProceedingJoinPoint.proceed(MethodInvocationProceedingJoinPoint.java:89)\r\n	at cn.stylefeng.guns.core.interceptor.SessionHolderInterceptor.sessionKit(SessionHolderInterceptor.java:44)\r\n	at sun.reflect.NativeMethodAccessorImpl.invoke0(Native Method)\r\n	at sun.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:62)\r\n	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\r\n	at java.lang.reflect.Method.invoke(Method.java:498)\r\n	at org.springframework.aop.aspectj.AbstractAspectJAdvice.invokeAdviceMethodWithGivenArgs(AbstractAspectJAdvice.java:644)\r\n	at org.springframework.aop.aspectj.AbstractAspectJAdvice.invokeAdviceMethod(AbstractAspectJAdvice.java:633)\r\n	at org.springframework.aop.aspectj.AspectJAroundAdvice.invoke(AspectJAroundAdvice.java:70)\r\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:185)\r\n	at org.springframework.aop.interceptor.ExposeInvocationInterceptor.invoke(ExposeInvocationInterceptor.java:92)\r\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:185)\r\n	at org.springframework.aop.framework.CglibAopProxyTDynamicAdvisedInterceptor.intercept(CglibAopProxy.java:689)\r\n	at cn.stylefeng.guns.modular.system.controller.NoticeControllerTTEnhancerBySpringCGLIBTTb0a6018b.list(<generated>)\r\n	at sun.reflect.NativeMethodAccessorImpl.invoke0(Native Method)\r\n	at sun.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:62)\r\n	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\r\n	at java.lang.reflect.Method.invoke(Method.java:498)\r\n	at org.springframework.web.method.support.InvocableHandlerMethod.doInvoke(InvocableHandlerMethod.java:209)\r\n	at org.springframework.web.method.support.InvocableHandlerMethod.invokeForRequest(InvocableHandlerMethod.java:136)\r\n	at org.springframework.web.servlet.mvc.method.annotation.ServletInvocableHandlerMethod.invokeAndHandle(ServletInvocableHandlerMethod.java:102)\r\n	at org.springframework.web.servlet.mvc.method.annotation.RequestMappingHandlerAdapter.invokeHandlerMethod(RequestMappingHandlerAdapter.java:877)\r\n	at org.springframework.web.servlet.mvc.method.annotation.RequestMappingHandlerAdapter.handleInternal(RequestMappingHandlerAdapter.java:783)\r\n	at org.springframework.web.servlet.mvc.method.AbstractHandlerMethodAdapter.handle(AbstractHandlerMethodAdapter.java:87)\r\n	at org.springframework.web.servlet.DispatcherServlet.doDispatch(DispatcherServlet.java:991)\r\n	at org.springframework.web.servlet.DispatcherServlet.doService(DispatcherServlet.java:925)\r\n	at org.springframework.web.servlet.FrameworkServlet.processRequest(FrameworkServlet.java:974)\r\n	at org.springframework.web.servlet.FrameworkServlet.doPost(FrameworkServlet.java:877)\r\n	at javax.servlet.http.HttpServlet.service(HttpServlet.java:661)\r\n	at org.springframework.web.servlet.FrameworkServlet.service(FrameworkServlet.java:851)\r\n	at javax.servlet.http.HttpServlet.service(HttpServlet.java:742)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:231)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at org.apache.tomcat.websocket.server.WsFilter.doFilter(WsFilter.java:52)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at org.apache.shiro.web.servlet.ProxiedFilterChain.doFilter(ProxiedFilterChain.java:61)\r\n	at org.apache.shiro.web.servlet.AdviceFilter.executeChain(AdviceFilter.java:108)\r\n	at org.apache.shiro.web.servlet.AdviceFilter.doFilterInternal(AdviceFilter.java:137)\r\n	at org.apache.shiro.web.servlet.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:125)\r\n	at org.apache.shiro.web.servlet.ProxiedFilterChain.doFilter(ProxiedFilterChain.java:66)\r\n	at org.apache.shiro.web.servlet.AbstractShiroFilter.executeChain(AbstractShiroFilter.java:449)\r\n	at org.apache.shiro.web.servlet.AbstractShiroFilterT1.call(AbstractShiroFilter.java:365)\r\n	at org.apache.shiro.subject.support.SubjectCallable.doCall(SubjectCallable.java:90)\r\n	at org.apache.shiro.subject.support.SubjectCallable.call(SubjectCallable.java:83)\r\n	at org.apache.shiro.subject.support.DelegatingSubject.execute(DelegatingSubject.java:387)\r\n	at org.apache.shiro.web.servlet.AbstractShiroFilter.doFilterInternal(AbstractShiroFilter.java:362)\r\n	at org.apache.shiro.web.servlet.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:125)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at cn.stylefeng.roses.core.xss.XssFilter.doFilter(XssFilter.java:31)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at com.alibaba.druid.support.http.WebStatFilter.doFilter(WebStatFilter.java:123)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at org.springframework.web.filter.RequestContextFilter.doFilterInternal(RequestContextFilter.java:99)\r\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:107)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at org.springframework.web.filter.HttpPutFormContentFilter.doFilterInternal(HttpPutFormContentFilter.java:109)\r\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:107)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at org.springframework.web.filter.HiddenHttpMethodFilter.doFilterInternal(HiddenHttpMethodFilter.java:81)\r\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:107)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at org.springframework.web.filter.CharacterEncodingFilter.doFilterInternal(CharacterEncodingFilter.java:200)\r\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:107)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at org.apache.catalina.core.StandardWrapperValve.invoke(StandardWrapperValve.java:198)\r\n	at org.apache.catalina.core.StandardContextValve.invoke(StandardContextValve.java:96)\r\n	at org.apache.catalina.authenticator.AuthenticatorBase.invoke(AuthenticatorBase.java:496)\r\n	at org.apache.catalina.core.StandardHostValve.invoke(StandardHostValve.java:140)\r\n	at org.apache.catalina.valves.ErrorReportValve.invoke(ErrorReportValve.java:81)\r\n	at org.apache.catalina.core.StandardEngineValve.invoke(StandardEngineValve.java:87)\r\n	at org.apache.catalina.connector.CoyoteAdapter.service(CoyoteAdapter.java:342)\r\n	at org.apache.coyote.http11.Http11Processor.service(Http11Processor.java:803)\r\n	at org.apache.coyote.AbstractProcessorLight.process(AbstractProcessorLight.java:66)\r\n	at org.apache.coyote.AbstractProtocolTConnectionHandler.process(AbstractProtocol.java:790)\r\n	at org.apache.tomcat.util.net.NioEndpointTSocketProcessor.doRun(NioEndpoint.java:1459)\r\n	at org.apache.tomcat.util.net.SocketProcessorBase.run(SocketProcessorBase.java:49)\r\n	at java.util.concurrent.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1149)\r\n	at java.util.concurrent.ThreadPoolExecutorTWorker.run(ThreadPoolExecutor.java:624)\r\n	at org.apache.tomcat.util.threads.TaskThreadTWrappingRunnable.run(TaskThread.java:61)\r\n	at java.lang.Thread.run(Thread.java:748)\r\n');
INSERT INTO `sys_operation_log` VALUES ('136', '异常日志', '', '56', null, null, '2019-05-05 15:27:14', '失败', 'java.lang.ArithmeticException: / by zero\r\n	at cn.stylefeng.guns.modular.system.controller.FeedbackController.add(FeedbackController.java:86)\r\n	at cn.stylefeng.guns.modular.system.controller.FeedbackControllerTTFastClassBySpringCGLIBTT8d496aab.invoke(<generated>)\r\n	at org.springframework.cglib.proxy.MethodProxy.invoke(MethodProxy.java:204)\r\n	at org.springframework.aop.framework.CglibAopProxyTCglibMethodInvocation.invokeJoinpoint(CglibAopProxy.java:747)\r\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:163)\r\n	at org.springframework.aop.aspectj.MethodInvocationProceedingJoinPoint.proceed(MethodInvocationProceedingJoinPoint.java:89)\r\n	at cn.stylefeng.guns.core.interceptor.SessionHolderInterceptor.sessionKit(SessionHolderInterceptor.java:44)\r\n	at sun.reflect.NativeMethodAccessorImpl.invoke0(Native Method)\r\n	at sun.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:62)\r\n	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\r\n	at java.lang.reflect.Method.invoke(Method.java:498)\r\n	at org.springframework.aop.aspectj.AbstractAspectJAdvice.invokeAdviceMethodWithGivenArgs(AbstractAspectJAdvice.java:644)\r\n	at org.springframework.aop.aspectj.AbstractAspectJAdvice.invokeAdviceMethod(AbstractAspectJAdvice.java:633)\r\n	at org.springframework.aop.aspectj.AspectJAroundAdvice.invoke(AspectJAroundAdvice.java:70)\r\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:185)\r\n	at org.springframework.aop.interceptor.ExposeInvocationInterceptor.invoke(ExposeInvocationInterceptor.java:92)\r\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:185)\r\n	at org.springframework.aop.framework.CglibAopProxyTDynamicAdvisedInterceptor.intercept(CglibAopProxy.java:689)\r\n	at cn.stylefeng.guns.modular.system.controller.FeedbackControllerTTEnhancerBySpringCGLIBTT998e3cea.add(<generated>)\r\n	at sun.reflect.NativeMethodAccessorImpl.invoke0(Native Method)\r\n	at sun.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:62)\r\n	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\r\n	at java.lang.reflect.Method.invoke(Method.java:498)\r\n	at org.springframework.web.method.support.InvocableHandlerMethod.doInvoke(InvocableHandlerMethod.java:209)\r\n	at org.springframework.web.method.support.InvocableHandlerMethod.invokeForRequest(InvocableHandlerMethod.java:136)\r\n	at org.springframework.web.servlet.mvc.method.annotation.ServletInvocableHandlerMethod.invokeAndHandle(ServletInvocableHandlerMethod.java:102)\r\n	at org.springframework.web.servlet.mvc.method.annotation.RequestMappingHandlerAdapter.invokeHandlerMethod(RequestMappingHandlerAdapter.java:877)\r\n	at org.springframework.web.servlet.mvc.method.annotation.RequestMappingHandlerAdapter.handleInternal(RequestMappingHandlerAdapter.java:783)\r\n	at org.springframework.web.servlet.mvc.method.AbstractHandlerMethodAdapter.handle(AbstractHandlerMethodAdapter.java:87)\r\n	at org.springframework.web.servlet.DispatcherServlet.doDispatch(DispatcherServlet.java:991)\r\n	at org.springframework.web.servlet.DispatcherServlet.doService(DispatcherServlet.java:925)\r\n	at org.springframework.web.servlet.FrameworkServlet.processRequest(FrameworkServlet.java:974)\r\n	at org.springframework.web.servlet.FrameworkServlet.doPost(FrameworkServlet.java:877)\r\n	at javax.servlet.http.HttpServlet.service(HttpServlet.java:661)\r\n	at org.springframework.web.servlet.FrameworkServlet.service(FrameworkServlet.java:851)\r\n	at javax.servlet.http.HttpServlet.service(HttpServlet.java:742)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:231)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at org.apache.tomcat.websocket.server.WsFilter.doFilter(WsFilter.java:52)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at org.apache.shiro.web.servlet.ProxiedFilterChain.doFilter(ProxiedFilterChain.java:61)\r\n	at org.apache.shiro.web.servlet.AdviceFilter.executeChain(AdviceFilter.java:108)\r\n	at org.apache.shiro.web.servlet.AdviceFilter.doFilterInternal(AdviceFilter.java:137)\r\n	at org.apache.shiro.web.servlet.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:125)\r\n	at org.apache.shiro.web.servlet.ProxiedFilterChain.doFilter(ProxiedFilterChain.java:66)\r\n	at org.apache.shiro.web.servlet.AbstractShiroFilter.executeChain(AbstractShiroFilter.java:449)\r\n	at org.apache.shiro.web.servlet.AbstractShiroFilterT1.call(AbstractShiroFilter.java:365)\r\n	at org.apache.shiro.subject.support.SubjectCallable.doCall(SubjectCallable.java:90)\r\n	at org.apache.shiro.subject.support.SubjectCallable.call(SubjectCallable.java:83)\r\n	at org.apache.shiro.subject.support.DelegatingSubject.execute(DelegatingSubject.java:387)\r\n	at org.apache.shiro.web.servlet.AbstractShiroFilter.doFilterInternal(AbstractShiroFilter.java:362)\r\n	at org.apache.shiro.web.servlet.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:125)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at cn.stylefeng.roses.core.xss.XssFilter.doFilter(XssFilter.java:31)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at com.alibaba.druid.support.http.WebStatFilter.doFilter(WebStatFilter.java:123)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at org.springframework.web.filter.RequestContextFilter.doFilterInternal(RequestContextFilter.java:99)\r\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:107)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at org.springframework.web.filter.HttpPutFormContentFilter.doFilterInternal(HttpPutFormContentFilter.java:109)\r\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:107)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at org.springframework.web.filter.HiddenHttpMethodFilter.doFilterInternal(HiddenHttpMethodFilter.java:81)\r\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:107)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at org.springframework.web.filter.CharacterEncodingFilter.doFilterInternal(CharacterEncodingFilter.java:200)\r\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:107)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at org.apache.catalina.core.StandardWrapperValve.invoke(StandardWrapperValve.java:198)\r\n	at org.apache.catalina.core.StandardContextValve.invoke(StandardContextValve.java:96)\r\n	at org.apache.catalina.authenticator.AuthenticatorBase.invoke(AuthenticatorBase.java:496)\r\n	at org.apache.catalina.core.StandardHostValve.invoke(StandardHostValve.java:140)\r\n	at org.apache.catalina.valves.ErrorReportValve.invoke(ErrorReportValve.java:81)\r\n	at org.apache.catalina.core.StandardEngineValve.invoke(StandardEngineValve.java:87)\r\n	at org.apache.catalina.connector.CoyoteAdapter.service(CoyoteAdapter.java:342)\r\n	at org.apache.coyote.http11.Http11Processor.service(Http11Processor.java:803)\r\n	at org.apache.coyote.AbstractProcessorLight.process(AbstractProcessorLight.java:66)\r\n	at org.apache.coyote.AbstractProtocolTConnectionHandler.process(AbstractProtocol.java:790)\r\n	at org.apache.tomcat.util.net.NioEndpointTSocketProcessor.doRun(NioEndpoint.java:1459)\r\n	at org.apache.tomcat.util.net.SocketProcessorBase.run(SocketProcessorBase.java:49)\r\n	at java.util.concurrent.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1149)\r\n	at java.util.concurrent.ThreadPoolExecutorTWorker.run(ThreadPoolExecutor.java:624)\r\n	at org.apache.tomcat.util.threads.TaskThreadTWrappingRunnable.run(TaskThread.java:61)\r\n	at java.lang.Thread.run(Thread.java:748)\r\n');
INSERT INTO `sys_operation_log` VALUES ('137', '异常日志', '', '56', null, null, '2019-05-05 15:28:08', '失败', 'java.lang.NullPointerException\r\n	at cn.stylefeng.guns.core.util.NoticeUtil.InsertNotice(NoticeUtil.java:12)\r\n	at cn.stylefeng.guns.modular.system.controller.FeedbackController.add(FeedbackController.java:93)\r\n	at cn.stylefeng.guns.modular.system.controller.FeedbackControllerTTFastClassBySpringCGLIBTT8d496aab.invoke(<generated>)\r\n	at org.springframework.cglib.proxy.MethodProxy.invoke(MethodProxy.java:204)\r\n	at org.springframework.aop.framework.CglibAopProxyTCglibMethodInvocation.invokeJoinpoint(CglibAopProxy.java:747)\r\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:163)\r\n	at org.springframework.aop.aspectj.MethodInvocationProceedingJoinPoint.proceed(MethodInvocationProceedingJoinPoint.java:89)\r\n	at cn.stylefeng.guns.core.interceptor.SessionHolderInterceptor.sessionKit(SessionHolderInterceptor.java:44)\r\n	at sun.reflect.NativeMethodAccessorImpl.invoke0(Native Method)\r\n	at sun.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:62)\r\n	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\r\n	at java.lang.reflect.Method.invoke(Method.java:498)\r\n	at org.springframework.aop.aspectj.AbstractAspectJAdvice.invokeAdviceMethodWithGivenArgs(AbstractAspectJAdvice.java:644)\r\n	at org.springframework.aop.aspectj.AbstractAspectJAdvice.invokeAdviceMethod(AbstractAspectJAdvice.java:633)\r\n	at org.springframework.aop.aspectj.AspectJAroundAdvice.invoke(AspectJAroundAdvice.java:70)\r\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:185)\r\n	at org.springframework.aop.interceptor.ExposeInvocationInterceptor.invoke(ExposeInvocationInterceptor.java:92)\r\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:185)\r\n	at org.springframework.aop.framework.CglibAopProxyTDynamicAdvisedInterceptor.intercept(CglibAopProxy.java:689)\r\n	at cn.stylefeng.guns.modular.system.controller.FeedbackControllerTTEnhancerBySpringCGLIBTT97ae97a7.add(<generated>)\r\n	at sun.reflect.NativeMethodAccessorImpl.invoke0(Native Method)\r\n	at sun.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:62)\r\n	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\r\n	at java.lang.reflect.Method.invoke(Method.java:498)\r\n	at org.springframework.web.method.support.InvocableHandlerMethod.doInvoke(InvocableHandlerMethod.java:209)\r\n	at org.springframework.web.method.support.InvocableHandlerMethod.invokeForRequest(InvocableHandlerMethod.java:136)\r\n	at org.springframework.web.servlet.mvc.method.annotation.ServletInvocableHandlerMethod.invokeAndHandle(ServletInvocableHandlerMethod.java:102)\r\n	at org.springframework.web.servlet.mvc.method.annotation.RequestMappingHandlerAdapter.invokeHandlerMethod(RequestMappingHandlerAdapter.java:877)\r\n	at org.springframework.web.servlet.mvc.method.annotation.RequestMappingHandlerAdapter.handleInternal(RequestMappingHandlerAdapter.java:783)\r\n	at org.springframework.web.servlet.mvc.method.AbstractHandlerMethodAdapter.handle(AbstractHandlerMethodAdapter.java:87)\r\n	at org.springframework.web.servlet.DispatcherServlet.doDispatch(DispatcherServlet.java:991)\r\n	at org.springframework.web.servlet.DispatcherServlet.doService(DispatcherServlet.java:925)\r\n	at org.springframework.web.servlet.FrameworkServlet.processRequest(FrameworkServlet.java:974)\r\n	at org.springframework.web.servlet.FrameworkServlet.doPost(FrameworkServlet.java:877)\r\n	at javax.servlet.http.HttpServlet.service(HttpServlet.java:661)\r\n	at org.springframework.web.servlet.FrameworkServlet.service(FrameworkServlet.java:851)\r\n	at javax.servlet.http.HttpServlet.service(HttpServlet.java:742)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:231)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at org.apache.tomcat.websocket.server.WsFilter.doFilter(WsFilter.java:52)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at org.apache.shiro.web.servlet.ProxiedFilterChain.doFilter(ProxiedFilterChain.java:61)\r\n	at org.apache.shiro.web.servlet.AdviceFilter.executeChain(AdviceFilter.java:108)\r\n	at org.apache.shiro.web.servlet.AdviceFilter.doFilterInternal(AdviceFilter.java:137)\r\n	at org.apache.shiro.web.servlet.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:125)\r\n	at org.apache.shiro.web.servlet.ProxiedFilterChain.doFilter(ProxiedFilterChain.java:66)\r\n	at org.apache.shiro.web.servlet.AbstractShiroFilter.executeChain(AbstractShiroFilter.java:449)\r\n	at org.apache.shiro.web.servlet.AbstractShiroFilterT1.call(AbstractShiroFilter.java:365)\r\n	at org.apache.shiro.subject.support.SubjectCallable.doCall(SubjectCallable.java:90)\r\n	at org.apache.shiro.subject.support.SubjectCallable.call(SubjectCallable.java:83)\r\n	at org.apache.shiro.subject.support.DelegatingSubject.execute(DelegatingSubject.java:387)\r\n	at org.apache.shiro.web.servlet.AbstractShiroFilter.doFilterInternal(AbstractShiroFilter.java:362)\r\n	at org.apache.shiro.web.servlet.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:125)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at cn.stylefeng.roses.core.xss.XssFilter.doFilter(XssFilter.java:31)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at com.alibaba.druid.support.http.WebStatFilter.doFilter(WebStatFilter.java:123)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at org.springframework.web.filter.RequestContextFilter.doFilterInternal(RequestContextFilter.java:99)\r\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:107)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at org.springframework.web.filter.HttpPutFormContentFilter.doFilterInternal(HttpPutFormContentFilter.java:109)\r\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:107)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at org.springframework.web.filter.HiddenHttpMethodFilter.doFilterInternal(HiddenHttpMethodFilter.java:81)\r\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:107)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at org.springframework.web.filter.CharacterEncodingFilter.doFilterInternal(CharacterEncodingFilter.java:200)\r\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:107)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at org.apache.catalina.core.StandardWrapperValve.invoke(StandardWrapperValve.java:198)\r\n	at org.apache.catalina.core.StandardContextValve.invoke(StandardContextValve.java:96)\r\n	at org.apache.catalina.authenticator.AuthenticatorBase.invoke(AuthenticatorBase.java:496)\r\n	at org.apache.catalina.core.StandardHostValve.invoke(StandardHostValve.java:140)\r\n	at org.apache.catalina.valves.ErrorReportValve.invoke(ErrorReportValve.java:81)\r\n	at org.apache.catalina.core.StandardEngineValve.invoke(StandardEngineValve.java:87)\r\n	at org.apache.catalina.connector.CoyoteAdapter.service(CoyoteAdapter.java:342)\r\n	at org.apache.coyote.http11.Http11Processor.service(Http11Processor.java:803)\r\n	at org.apache.coyote.AbstractProcessorLight.process(AbstractProcessorLight.java:66)\r\n	at org.apache.coyote.AbstractProtocolTConnectionHandler.process(AbstractProtocol.java:790)\r\n	at org.apache.tomcat.util.net.NioEndpointTSocketProcessor.doRun(NioEndpoint.java:1459)\r\n	at org.apache.tomcat.util.net.SocketProcessorBase.run(SocketProcessorBase.java:49)\r\n	at java.util.concurrent.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1149)\r\n	at java.util.concurrent.ThreadPoolExecutorTWorker.run(ThreadPoolExecutor.java:624)\r\n	at org.apache.tomcat.util.threads.TaskThreadTWrappingRunnable.run(TaskThread.java:61)\r\n	at java.lang.Thread.run(Thread.java:748)\r\n');
INSERT INTO `sys_operation_log` VALUES ('138', '异常日志', '', '56', null, null, '2019-05-05 15:35:49', '失败', 'java.lang.NullPointerException\r\n	at cn.stylefeng.guns.core.util.NoticeUtil.InsertNotice(NoticeUtil.java:13)\r\n	at cn.stylefeng.guns.modular.system.controller.FeedbackController.add(FeedbackController.java:93)\r\n	at cn.stylefeng.guns.modular.system.controller.FeedbackControllerTTFastClassBySpringCGLIBTT8d496aab.invoke(<generated>)\r\n	at org.springframework.cglib.proxy.MethodProxy.invoke(MethodProxy.java:204)\r\n	at org.springframework.aop.framework.CglibAopProxyTCglibMethodInvocation.invokeJoinpoint(CglibAopProxy.java:747)\r\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:163)\r\n	at org.springframework.aop.aspectj.MethodInvocationProceedingJoinPoint.proceed(MethodInvocationProceedingJoinPoint.java:89)\r\n	at cn.stylefeng.guns.core.interceptor.SessionHolderInterceptor.sessionKit(SessionHolderInterceptor.java:44)\r\n	at sun.reflect.NativeMethodAccessorImpl.invoke0(Native Method)\r\n	at sun.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:62)\r\n	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\r\n	at java.lang.reflect.Method.invoke(Method.java:498)\r\n	at org.springframework.aop.aspectj.AbstractAspectJAdvice.invokeAdviceMethodWithGivenArgs(AbstractAspectJAdvice.java:644)\r\n	at org.springframework.aop.aspectj.AbstractAspectJAdvice.invokeAdviceMethod(AbstractAspectJAdvice.java:633)\r\n	at org.springframework.aop.aspectj.AspectJAroundAdvice.invoke(AspectJAroundAdvice.java:70)\r\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:185)\r\n	at org.springframework.aop.interceptor.ExposeInvocationInterceptor.invoke(ExposeInvocationInterceptor.java:92)\r\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:185)\r\n	at org.springframework.aop.framework.CglibAopProxyTDynamicAdvisedInterceptor.intercept(CglibAopProxy.java:689)\r\n	at cn.stylefeng.guns.modular.system.controller.FeedbackControllerTTEnhancerBySpringCGLIBTT44434142.add(<generated>)\r\n	at sun.reflect.NativeMethodAccessorImpl.invoke0(Native Method)\r\n	at sun.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:62)\r\n	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\r\n	at java.lang.reflect.Method.invoke(Method.java:498)\r\n	at org.springframework.web.method.support.InvocableHandlerMethod.doInvoke(InvocableHandlerMethod.java:209)\r\n	at org.springframework.web.method.support.InvocableHandlerMethod.invokeForRequest(InvocableHandlerMethod.java:136)\r\n	at org.springframework.web.servlet.mvc.method.annotation.ServletInvocableHandlerMethod.invokeAndHandle(ServletInvocableHandlerMethod.java:102)\r\n	at org.springframework.web.servlet.mvc.method.annotation.RequestMappingHandlerAdapter.invokeHandlerMethod(RequestMappingHandlerAdapter.java:877)\r\n	at org.springframework.web.servlet.mvc.method.annotation.RequestMappingHandlerAdapter.handleInternal(RequestMappingHandlerAdapter.java:783)\r\n	at org.springframework.web.servlet.mvc.method.AbstractHandlerMethodAdapter.handle(AbstractHandlerMethodAdapter.java:87)\r\n	at org.springframework.web.servlet.DispatcherServlet.doDispatch(DispatcherServlet.java:991)\r\n	at org.springframework.web.servlet.DispatcherServlet.doService(DispatcherServlet.java:925)\r\n	at org.springframework.web.servlet.FrameworkServlet.processRequest(FrameworkServlet.java:974)\r\n	at org.springframework.web.servlet.FrameworkServlet.doPost(FrameworkServlet.java:877)\r\n	at javax.servlet.http.HttpServlet.service(HttpServlet.java:661)\r\n	at org.springframework.web.servlet.FrameworkServlet.service(FrameworkServlet.java:851)\r\n	at javax.servlet.http.HttpServlet.service(HttpServlet.java:742)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:231)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at org.apache.tomcat.websocket.server.WsFilter.doFilter(WsFilter.java:52)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at org.apache.shiro.web.servlet.ProxiedFilterChain.doFilter(ProxiedFilterChain.java:61)\r\n	at org.apache.shiro.web.servlet.AdviceFilter.executeChain(AdviceFilter.java:108)\r\n	at org.apache.shiro.web.servlet.AdviceFilter.doFilterInternal(AdviceFilter.java:137)\r\n	at org.apache.shiro.web.servlet.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:125)\r\n	at org.apache.shiro.web.servlet.ProxiedFilterChain.doFilter(ProxiedFilterChain.java:66)\r\n	at org.apache.shiro.web.servlet.AbstractShiroFilter.executeChain(AbstractShiroFilter.java:449)\r\n	at org.apache.shiro.web.servlet.AbstractShiroFilterT1.call(AbstractShiroFilter.java:365)\r\n	at org.apache.shiro.subject.support.SubjectCallable.doCall(SubjectCallable.java:90)\r\n	at org.apache.shiro.subject.support.SubjectCallable.call(SubjectCallable.java:83)\r\n	at org.apache.shiro.subject.support.DelegatingSubject.execute(DelegatingSubject.java:387)\r\n	at org.apache.shiro.web.servlet.AbstractShiroFilter.doFilterInternal(AbstractShiroFilter.java:362)\r\n	at org.apache.shiro.web.servlet.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:125)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at cn.stylefeng.roses.core.xss.XssFilter.doFilter(XssFilter.java:31)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at com.alibaba.druid.support.http.WebStatFilter.doFilter(WebStatFilter.java:123)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at org.springframework.web.filter.RequestContextFilter.doFilterInternal(RequestContextFilter.java:99)\r\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:107)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at org.springframework.web.filter.HttpPutFormContentFilter.doFilterInternal(HttpPutFormContentFilter.java:109)\r\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:107)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at org.springframework.web.filter.HiddenHttpMethodFilter.doFilterInternal(HiddenHttpMethodFilter.java:81)\r\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:107)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at org.springframework.web.filter.CharacterEncodingFilter.doFilterInternal(CharacterEncodingFilter.java:200)\r\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:107)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at org.apache.catalina.core.StandardWrapperValve.invoke(StandardWrapperValve.java:198)\r\n	at org.apache.catalina.core.StandardContextValve.invoke(StandardContextValve.java:96)\r\n	at org.apache.catalina.authenticator.AuthenticatorBase.invoke(AuthenticatorBase.java:496)\r\n	at org.apache.catalina.core.StandardHostValve.invoke(StandardHostValve.java:140)\r\n	at org.apache.catalina.valves.ErrorReportValve.invoke(ErrorReportValve.java:81)\r\n	at org.apache.catalina.core.StandardEngineValve.invoke(StandardEngineValve.java:87)\r\n	at org.apache.catalina.connector.CoyoteAdapter.service(CoyoteAdapter.java:342)\r\n	at org.apache.coyote.http11.Http11Processor.service(Http11Processor.java:803)\r\n	at org.apache.coyote.AbstractProcessorLight.process(AbstractProcessorLight.java:66)\r\n	at org.apache.coyote.AbstractProtocolTConnectionHandler.process(AbstractProtocol.java:790)\r\n	at org.apache.tomcat.util.net.NioEndpointTSocketProcessor.doRun(NioEndpoint.java:1459)\r\n	at org.apache.tomcat.util.net.SocketProcessorBase.run(SocketProcessorBase.java:49)\r\n	at java.util.concurrent.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1149)\r\n	at java.util.concurrent.ThreadPoolExecutorTWorker.run(ThreadPoolExecutor.java:624)\r\n	at org.apache.tomcat.util.threads.TaskThreadTWrappingRunnable.run(TaskThread.java:61)\r\n	at java.lang.Thread.run(Thread.java:748)\r\n');
INSERT INTO `sys_operation_log` VALUES ('139', '异常日志', '', '57', null, null, '2019-05-05 22:03:53', '失败', 'org.springframework.jdbc.BadSqlGrammarException: \r\n### Error updating database.  Cause: java.sql.SQLSyntaxErrorException: Unknown column \'orderId\' in \'where clause\'\r\n### The error may involve cn.stylefeng.guns.modular.system.dao.OrderMapper.deleteOrder-Inline\r\n### The error occurred while setting parameters\r\n### SQL: update sys_order set deleteflag = 1 where id = orderId\r\n### Cause: java.sql.SQLSyntaxErrorException: Unknown column \'orderId\' in \'where clause\'\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: Unknown column \'orderId\' in \'where clause\'\r\n	at org.springframework.jdbc.support.SQLErrorCodeSQLExceptionTranslator.doTranslate(SQLErrorCodeSQLExceptionTranslator.java:234)\r\n	at org.springframework.jdbc.support.AbstractFallbackSQLExceptionTranslator.translate(AbstractFallbackSQLExceptionTranslator.java:72)\r\n	at org.mybatis.spring.MyBatisExceptionTranslator.translateExceptionIfPossible(MyBatisExceptionTranslator.java:73)\r\n	at org.mybatis.spring.SqlSessionTemplateTSqlSessionInterceptor.invoke(SqlSessionTemplate.java:446)\r\n	at com.sun.proxy.TProxy91.update(Unknown Source)\r\n	at org.mybatis.spring.SqlSessionTemplate.update(SqlSessionTemplate.java:294)\r\n	at org.apache.ibatis.binding.MapperMethod.execute(MapperMethod.java:63)\r\n	at org.apache.ibatis.binding.MapperProxy.invoke(MapperProxy.java:59)\r\n	at com.sun.proxy.TProxy115.deleteOrder(Unknown Source)\r\n	at cn.stylefeng.guns.modular.system.service.impl.OrderServiceImpl.deleteOrder(OrderServiceImpl.java:131)\r\n	at cn.stylefeng.guns.modular.system.service.impl.OrderServiceImplTTFastClassBySpringCGLIBTTad9547f4.invoke(<generated>)\r\n	at org.springframework.cglib.proxy.MethodProxy.invoke(MethodProxy.java:204)\r\n	at org.springframework.aop.framework.CglibAopProxyTCglibMethodInvocation.invokeJoinpoint(CglibAopProxy.java:747)\r\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:163)\r\n	at com.alibaba.druid.support.spring.stat.DruidStatInterceptor.invoke(DruidStatInterceptor.java:72)\r\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:185)\r\n	at org.springframework.aop.framework.CglibAopProxyTDynamicAdvisedInterceptor.intercept(CglibAopProxy.java:689)\r\n	at cn.stylefeng.guns.modular.system.service.impl.OrderServiceImplTTEnhancerBySpringCGLIBTTb434fe35.deleteOrder(<generated>)\r\n	at cn.stylefeng.guns.modular.system.controller.OrderController.cancel(OrderController.java:256)\r\n	at cn.stylefeng.guns.modular.system.controller.OrderControllerTTFastClassBySpringCGLIBTT8d30cc20.invoke(<generated>)\r\n	at org.springframework.cglib.proxy.MethodProxy.invoke(MethodProxy.java:204)\r\n	at org.springframework.aop.framework.CglibAopProxyTCglibMethodInvocation.invokeJoinpoint(CglibAopProxy.java:747)\r\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:163)\r\n	at org.springframework.aop.aspectj.MethodInvocationProceedingJoinPoint.proceed(MethodInvocationProceedingJoinPoint.java:89)\r\n	at cn.stylefeng.guns.core.interceptor.SessionHolderInterceptor.sessionKit(SessionHolderInterceptor.java:44)\r\n	at sun.reflect.NativeMethodAccessorImpl.invoke0(Native Method)\r\n	at sun.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:62)\r\n	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\r\n	at java.lang.reflect.Method.invoke(Method.java:498)\r\n	at org.springframework.aop.aspectj.AbstractAspectJAdvice.invokeAdviceMethodWithGivenArgs(AbstractAspectJAdvice.java:644)\r\n	at org.springframework.aop.aspectj.AbstractAspectJAdvice.invokeAdviceMethod(AbstractAspectJAdvice.java:633)\r\n	at org.springframework.aop.aspectj.AspectJAroundAdvice.invoke(AspectJAroundAdvice.java:70)\r\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:185)\r\n	at org.springframework.aop.interceptor.ExposeInvocationInterceptor.invoke(ExposeInvocationInterceptor.java:92)\r\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:185)\r\n	at org.springframework.aop.framework.CglibAopProxyTDynamicAdvisedInterceptor.intercept(CglibAopProxy.java:689)\r\n	at cn.stylefeng.guns.modular.system.controller.OrderControllerTTEnhancerBySpringCGLIBTT3e3fe912.cancel(<generated>)\r\n	at sun.reflect.NativeMethodAccessorImpl.invoke0(Native Method)\r\n	at sun.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:62)\r\n	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\r\n	at java.lang.reflect.Method.invoke(Method.java:498)\r\n	at org.springframework.web.method.support.InvocableHandlerMethod.doInvoke(InvocableHandlerMethod.java:209)\r\n	at org.springframework.web.method.support.InvocableHandlerMethod.invokeForRequest(InvocableHandlerMethod.java:136)\r\n	at org.springframework.web.servlet.mvc.method.annotation.ServletInvocableHandlerMethod.invokeAndHandle(ServletInvocableHandlerMethod.java:102)\r\n	at org.springframework.web.servlet.mvc.method.annotation.RequestMappingHandlerAdapter.invokeHandlerMethod(RequestMappingHandlerAdapter.java:877)\r\n	at org.springframework.web.servlet.mvc.method.annotation.RequestMappingHandlerAdapter.handleInternal(RequestMappingHandlerAdapter.java:783)\r\n	at org.springframework.web.servlet.mvc.method.AbstractHandlerMethodAdapter.handle(AbstractHandlerMethodAdapter.java:87)\r\n	at org.springframework.web.servlet.DispatcherServlet.doDispatch(DispatcherServlet.java:991)\r\n	at org.springframework.web.servlet.DispatcherServlet.doService(DispatcherServlet.java:925)\r\n	at org.springframework.web.servlet.FrameworkServlet.processRequest(FrameworkServlet.java:974)\r\n	at org.springframework.web.servlet.FrameworkServlet.doPost(FrameworkServlet.java:877)\r\n	at javax.servlet.http.HttpServlet.service(HttpServlet.java:661)\r\n	at org.springframework.web.servlet.FrameworkServlet.service(FrameworkServlet.java:851)\r\n	at javax.servlet.http.HttpServlet.service(HttpServlet.java:742)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:231)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at org.apache.tomcat.websocket.server.WsFilter.doFilter(WsFilter.java:52)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at org.apache.shiro.web.servlet.ProxiedFilterChain.doFilter(ProxiedFilterChain.java:61)\r\n	at org.apache.shiro.web.servlet.AdviceFilter.executeChain(AdviceFilter.java:108)\r\n	at org.apache.shiro.web.servlet.AdviceFilter.doFilterInternal(AdviceFilter.java:137)\r\n	at org.apache.shiro.web.servlet.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:125)\r\n	at org.apache.shiro.web.servlet.ProxiedFilterChain.doFilter(ProxiedFilterChain.java:66)\r\n	at org.apache.shiro.web.servlet.AbstractShiroFilter.executeChain(AbstractShiroFilter.java:449)\r\n	at org.apache.shiro.web.servlet.AbstractShiroFilterT1.call(AbstractShiroFilter.java:365)\r\n	at org.apache.shiro.subject.support.SubjectCallable.doCall(SubjectCallable.java:90)\r\n	at org.apache.shiro.subject.support.SubjectCallable.call(SubjectCallable.java:83)\r\n	at org.apache.shiro.subject.support.DelegatingSubject.execute(DelegatingSubject.java:387)\r\n	at org.apache.shiro.web.servlet.AbstractShiroFilter.doFilterInternal(AbstractShiroFilter.java:362)\r\n	at org.apache.shiro.web.servlet.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:125)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at cn.stylefeng.roses.core.xss.XssFilter.doFilter(XssFilter.java:31)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at com.alibaba.druid.support.http.WebStatFilter.doFilter(WebStatFilter.java:123)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at org.springframework.web.filter.RequestContextFilter.doFilterInternal(RequestContextFilter.java:99)\r\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:107)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at org.springframework.web.filter.HttpPutFormContentFilter.doFilterInternal(HttpPutFormContentFilter.java:109)\r\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:107)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at org.springframework.web.filter.HiddenHttpMethodFilter.doFilterInternal(HiddenHttpMethodFilter.java:81)\r\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:107)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at org.springframework.web.filter.CharacterEncodingFilter.doFilterInternal(CharacterEncodingFilter.java:200)\r\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:107)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at org.apache.catalina.core.StandardWrapperValve.invoke(StandardWrapperValve.java:198)\r\n	at org.apache.catalina.core.StandardContextValve.invoke(StandardContextValve.java:96)\r\n	at org.apache.catalina.authenticator.AuthenticatorBase.invoke(AuthenticatorBase.java:496)\r\n	at org.apache.catalina.core.StandardHostValve.invoke(StandardHostValve.java:140)\r\n	at org.apache.catalina.valves.ErrorReportValve.invoke(ErrorReportValve.java:81)\r\n	at org.apache.catalina.core.StandardEngineValve.invoke(StandardEngineValve.java:87)\r\n	at org.apache.catalina.connector.CoyoteAdapter.service(CoyoteAdapter.java:342)\r\n	at org.apache.coyote.http11.Http11Processor.service(Http11Processor.java:803)\r\n	at org.apache.coyote.AbstractProcessorLight.process(AbstractProcessorLight.java:66)\r\n	at org.apache.coyote.AbstractProtocolTConnectionHandler.process(AbstractProtocol.java:790)\r\n	at org.apache.tomcat.util.net.NioEndpointTSocketProcessor.doRun(NioEndpoint.java:1459)\r\n	at org.apache.tomcat.util.net.SocketProcessorBase.run(SocketProcessorBase.java:49)\r\n	at java.util.concurrent.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1149)\r\n	at java.util.concurrent.ThreadPoolExecutorTWorker.run(ThreadPoolExecutor.java:624)\r\n	at org.apache.tomcat.util.threads.TaskThreadTWrappingRunnable.run(TaskThread.java:61)\r\n	at java.lang.Thread.run(Thread.java:748)\r\nCaused by: java.sql.SQLSyntaxErrorException: Unknown column \'orderId\' in \'where clause\'\r\n	at com.mysql.cj.jdbc.exceptions.SQLError.createSQLException(SQLError.java:118)\r\n	at com.mysql.cj.jdbc.exceptions.SQLError.createSQLException(SQLError.java:95)\r\n	at com.mysql.cj.jdbc.exceptions.SQLExceptionsMapping.translateException(SQLExceptionsMapping.java:122)\r\n	at com.mysql.cj.jdbc.ClientPreparedStatement.executeInternal(ClientPreparedStatement.java:960)\r\n	at com.mysql.cj.jdbc.ClientPreparedStatement.execute(ClientPreparedStatement.java:388)\r\n	at com.alibaba.druid.filter.FilterChainImpl.preparedStatement_execute(FilterChainImpl.java:3409)\r\n	at com.alibaba.druid.filter.FilterEventAdapter.preparedStatement_execute(FilterEventAdapter.java:440)\r\n	at com.alibaba.druid.filter.FilterChainImpl.preparedStatement_execute(FilterChainImpl.java:3407)\r\n	at com.alibaba.druid.wall.WallFilter.preparedStatement_execute(WallFilter.java:619)\r\n	at com.alibaba.druid.filter.FilterChainImpl.preparedStatement_execute(FilterChainImpl.java:3407)\r\n	at com.alibaba.druid.proxy.jdbc.PreparedStatementProxyImpl.execute(PreparedStatementProxyImpl.java:167)\r\n	at com.alibaba.druid.pool.DruidPooledPreparedStatement.execute(DruidPooledPreparedStatement.java:498)\r\n	at sun.reflect.GeneratedMethodAccessor91.invoke(Unknown Source)\r\n	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\r\n	at java.lang.reflect.Method.invoke(Method.java:498)\r\n	at org.apache.ibatis.logging.jdbc.PreparedStatementLogger.invoke(PreparedStatementLogger.java:59)\r\n	at com.sun.proxy.TProxy130.execute(Unknown Source)\r\n	at org.apache.ibatis.executor.statement.PreparedStatementHandler.update(PreparedStatementHandler.java:46)\r\n	at org.apache.ibatis.executor.statement.RoutingStatementHandler.update(RoutingStatementHandler.java:74)\r\n	at sun.reflect.NativeMethodAccessorImpl.invoke0(Native Method)\r\n	at sun.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:62)\r\n	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\r\n	at java.lang.reflect.Method.invoke(Method.java:498)\r\n	at org.apache.ibatis.plugin.Plugin.invoke(Plugin.java:63)\r\n	at com.sun.proxy.TProxy127.update(Unknown Source)\r\n	at sun.reflect.NativeMethodAccessorImpl.invoke0(Native Method)\r\n	at sun.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:62)\r\n	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\r\n	at java.lang.reflect.Method.invoke(Method.java:498)\r\n	at org.apache.ibatis.plugin.Plugin.invoke(Plugin.java:63)\r\n	at com.sun.proxy.TProxy127.update(Unknown Source)\r\n	at org.apache.ibatis.executor.SimpleExecutor.doUpdate(SimpleExecutor.java:50)\r\n	at org.apache.ibatis.executor.BaseExecutor.update(BaseExecutor.java:117)\r\n	at org.apache.ibatis.executor.CachingExecutor.update(CachingExecutor.java:76)\r\n	at sun.reflect.NativeMethodAccessorImpl.invoke0(Native Method)\r\n	at sun.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:62)\r\n	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\r\n	at java.lang.reflect.Method.invoke(Method.java:498)\r\n	at org.apache.ibatis.plugin.Invocation.proceed(Invocation.java:49)\r\n	at com.baomidou.mybatisplus.plugins.OptimisticLockerInterceptor.intercept(OptimisticLockerInterceptor.java:155)\r\n	at org.apache.ibatis.plugin.Plugin.invoke(Plugin.java:61)\r\n	at com.sun.proxy.TProxy126.update(Unknown Source)\r\n	at org.apache.ibatis.session.defaults.DefaultSqlSession.update(DefaultSqlSession.java:198)\r\n	at sun.reflect.NativeMethodAccessorImpl.invoke0(Native Method)\r\n	at sun.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:62)\r\n	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\r\n	at java.lang.reflect.Method.invoke(Method.java:498)\r\n	at org.mybatis.spring.SqlSessionTemplateTSqlSessionInterceptor.invoke(SqlSessionTemplate.java:433)\r\n	... 107 more\r\n');

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
  `size` varchar(20) DEFAULT NULL COMMENT '货物尺寸',
  `name` varchar(20) DEFAULT NULL COMMENT '收件人名字',
  `weight` int(5) DEFAULT NULL COMMENT '货物重量',
  `reputation` int(20) DEFAULT NULL COMMENT '所需保证积分',
  `createdate` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `limitdate` timestamp NULL DEFAULT NULL COMMENT '最迟期限',
  `finishdate` timestamp NULL DEFAULT NULL COMMENT '订单完成时间',
  `grade` int(11) DEFAULT NULL COMMENT '信誉分',
  `content` text COMMENT '评论',
  `status` int(5) DEFAULT '0' COMMENT '订单状态0：未被接单 1：已接单 2：完成 3：超时 4：订单过期',
  `deleteflag` int(5) DEFAULT '0' COMMENT '删除标记0:未删除 1:已删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COMMENT='订单表';

-- ----------------------------
-- Records of sys_order
-- ----------------------------
INSERT INTO `sys_order` VALUES ('11', '57', '3', '56', '15058123291', '杭州', '5', '小', 'LI', '5', '2', '2019-03-23 19:48:27', '2019-03-31 00:00:00', '2019-03-24 18:49:54', '1', '极差', '2', '0');
INSERT INTO `sys_order` VALUES ('12', '57', '3', '56', '15058123291', '求真楼', '10', '中', 'prism', '3', '20', '2019-05-04 15:46:20', '2019-05-08 00:00:00', '2019-05-04 20:06:01', '1', '极好', '2', '0');
INSERT INTO `sys_order` VALUES ('13', '57', '3', null, '15058123291', '测试', '10', '小', '111', '5', '10', '2019-05-05 21:39:37', '2020-05-31 00:00:00', null, '1', null, '0', '1');
INSERT INTO `sys_order` VALUES ('14', '57', '3', '56', '15058123291', '定时任务测试', '5', '小', '定时任务测试', '5', '10', '2019-05-06 22:57:59', '2019-04-01 00:00:00', '2019-05-06 23:47:06', '1', '', '3', '0');

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
  `status` int(5) DEFAULT '0' COMMENT '状态0：未通过1：拒绝 2：通过',
  `adminid` int(11) DEFAULT NULL COMMENT '管理员id',
  `createdate` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `reviewdate` timestamp NULL DEFAULT NULL COMMENT '审核时间',
  `deleteflag` int(5) DEFAULT '0' COMMENT '删除标志0：未删除1：删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='申请成为接单人';

-- ----------------------------
-- Records of sys_orderapply
-- ----------------------------
INSERT INTO `sys_orderapply` VALUES ('2', '3', '56', '我想要工作', '15058123291', '0', null, '2019-03-18 08:53:25', null, '0');
INSERT INTO `sys_orderapply` VALUES ('3', '3', '56', '我真的想要找一个工作', '15058123291', '2', '52', '2019-03-18 09:03:05', '2019-03-23 08:41:54', '0');
INSERT INTO `sys_orderapply` VALUES ('4', '3', '57', '我这个是测试', '15058123291', '0', null, '2019-03-23 15:27:38', null, '0');

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
  `deleteflag` int(11) DEFAULT '0' COMMENT '删除标记0：未删除 1：删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='快递点信息表';

-- ----------------------------
-- Records of sys_place
-- ----------------------------
INSERT INTO `sys_place` VALUES ('3', '52', '一食堂', '这里是一食堂', '2019-03-17 21:01:28', '0');

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
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COMMENT='快递点申请表';

-- ----------------------------
-- Records of sys_placeapply
-- ----------------------------
INSERT INTO `sys_placeapply` VALUES ('5', '52', '一食堂', '这里是一食堂', '15058123291', '这里是一食堂哒！', '2019-03-17 20:58:30', '1', '2019-03-17 20:58:50', '1', '0');
INSERT INTO `sys_placeapply` VALUES ('6', '52', '一食堂', '这里是一食堂', '15058123291', '这里是一食堂哒！', '2019-03-17 21:01:10', '1', '2019-03-17 21:01:28', '2', '0');
INSERT INTO `sys_placeapply` VALUES ('7', '57', '二食堂', '千万别同意', '15058123291', '请拒绝wo', '2019-05-04 20:11:31', null, null, '0', '0');

-- ----------------------------
-- Table structure for sys_relation
-- ----------------------------
DROP TABLE IF EXISTS `sys_relation`;
CREATE TABLE `sys_relation` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `menuid` bigint(11) DEFAULT NULL COMMENT '菜单id',
  `roleid` int(11) DEFAULT NULL COMMENT '角色id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6591 DEFAULT CHARSET=utf8 COMMENT='角色和菜单关联表';

-- ----------------------------
-- Records of sys_relation
-- ----------------------------
INSERT INTO `sys_relation` VALUES ('6489', '105', '1');
INSERT INTO `sys_relation` VALUES ('6490', '106', '1');
INSERT INTO `sys_relation` VALUES ('6491', '107', '1');
INSERT INTO `sys_relation` VALUES ('6492', '108', '1');
INSERT INTO `sys_relation` VALUES ('6493', '109', '1');
INSERT INTO `sys_relation` VALUES ('6494', '110', '1');
INSERT INTO `sys_relation` VALUES ('6495', '111', '1');
INSERT INTO `sys_relation` VALUES ('6496', '112', '1');
INSERT INTO `sys_relation` VALUES ('6497', '113', '1');
INSERT INTO `sys_relation` VALUES ('6498', '165', '1');
INSERT INTO `sys_relation` VALUES ('6499', '166', '1');
INSERT INTO `sys_relation` VALUES ('6500', '167', '1');
INSERT INTO `sys_relation` VALUES ('6501', '114', '1');
INSERT INTO `sys_relation` VALUES ('6502', '115', '1');
INSERT INTO `sys_relation` VALUES ('6503', '116', '1');
INSERT INTO `sys_relation` VALUES ('6504', '117', '1');
INSERT INTO `sys_relation` VALUES ('6505', '118', '1');
INSERT INTO `sys_relation` VALUES ('6506', '162', '1');
INSERT INTO `sys_relation` VALUES ('6507', '163', '1');
INSERT INTO `sys_relation` VALUES ('6508', '164', '1');
INSERT INTO `sys_relation` VALUES ('6509', '119', '1');
INSERT INTO `sys_relation` VALUES ('6510', '120', '1');
INSERT INTO `sys_relation` VALUES ('6511', '121', '1');
INSERT INTO `sys_relation` VALUES ('6512', '122', '1');
INSERT INTO `sys_relation` VALUES ('6513', '150', '1');
INSERT INTO `sys_relation` VALUES ('6514', '151', '1');
INSERT INTO `sys_relation` VALUES ('6515', '128', '1');
INSERT INTO `sys_relation` VALUES ('6516', '134', '1');
INSERT INTO `sys_relation` VALUES ('6517', '158', '1');
INSERT INTO `sys_relation` VALUES ('6518', '159', '1');
INSERT INTO `sys_relation` VALUES ('6519', '133', '1');
INSERT INTO `sys_relation` VALUES ('6520', '160', '1');
INSERT INTO `sys_relation` VALUES ('6521', '161', '1');
INSERT INTO `sys_relation` VALUES ('6522', '141', '1');
INSERT INTO `sys_relation` VALUES ('6523', '142', '1');
INSERT INTO `sys_relation` VALUES ('6524', '143', '1');
INSERT INTO `sys_relation` VALUES ('6525', '144', '1');
INSERT INTO `sys_relation` VALUES ('6526', '145', '1');
INSERT INTO `sys_relation` VALUES ('6527', '175', '1');
INSERT INTO `sys_relation` VALUES ('6528', '168', '1');
INSERT INTO `sys_relation` VALUES ('6529', '169', '1');
INSERT INTO `sys_relation` VALUES ('6530', '171', '1');
INSERT INTO `sys_relation` VALUES ('6531', '172', '1');
INSERT INTO `sys_relation` VALUES ('6532', '173', '1');
INSERT INTO `sys_relation` VALUES ('6533', '174', '1');
INSERT INTO `sys_relation` VALUES ('6534', '176', '1');
INSERT INTO `sys_relation` VALUES ('6535', '1091946857313107970', '1');
INSERT INTO `sys_relation` VALUES ('6536', '1091946857313107971', '1');
INSERT INTO `sys_relation` VALUES ('6537', '1109771682136006658', '1');
INSERT INTO `sys_relation` VALUES ('6538', '1109771682136006659', '1');
INSERT INTO `sys_relation` VALUES ('6539', '1109771682136006661', '1');
INSERT INTO `sys_relation` VALUES ('6540', '145', '5');
INSERT INTO `sys_relation` VALUES ('6541', '175', '5');
INSERT INTO `sys_relation` VALUES ('6542', '170', '5');
INSERT INTO `sys_relation` VALUES ('6543', '176', '5');
INSERT INTO `sys_relation` VALUES ('6544', '179', '5');
INSERT INTO `sys_relation` VALUES ('6545', '180', '5');
INSERT INTO `sys_relation` VALUES ('6546', '181', '5');
INSERT INTO `sys_relation` VALUES ('6547', '1091946857313107970', '5');
INSERT INTO `sys_relation` VALUES ('6548', '1091946857313107971', '5');
INSERT INTO `sys_relation` VALUES ('6549', '1091946857313107972', '5');
INSERT INTO `sys_relation` VALUES ('6550', '1091946857313107974', '5');
INSERT INTO `sys_relation` VALUES ('6551', '1091946857313107975', '5');
INSERT INTO `sys_relation` VALUES ('6552', '1095859184412397571', '5');
INSERT INTO `sys_relation` VALUES ('6553', '1109771682136006658', '5');
INSERT INTO `sys_relation` VALUES ('6554', '1109771682136006660', '5');
INSERT INTO `sys_relation` VALUES ('6555', '145', '6');
INSERT INTO `sys_relation` VALUES ('6556', '175', '6');
INSERT INTO `sys_relation` VALUES ('6557', '176', '6');
INSERT INTO `sys_relation` VALUES ('6558', '178', '6');
INSERT INTO `sys_relation` VALUES ('6559', '179', '6');
INSERT INTO `sys_relation` VALUES ('6560', '181', '6');
INSERT INTO `sys_relation` VALUES ('6561', '1091946857313107970', '6');
INSERT INTO `sys_relation` VALUES ('6562', '1091946857313107971', '6');
INSERT INTO `sys_relation` VALUES ('6563', '1091946857313107972', '6');
INSERT INTO `sys_relation` VALUES ('6564', '1091946857313107973', '6');
INSERT INTO `sys_relation` VALUES ('6565', '1091946857313107974', '6');
INSERT INTO `sys_relation` VALUES ('6566', '1091946857313107975', '6');
INSERT INTO `sys_relation` VALUES ('6567', '1095859184412397571', '6');
INSERT INTO `sys_relation` VALUES ('6568', '1109771682136006658', '6');
INSERT INTO `sys_relation` VALUES ('6569', '1109771682136006660', '6');
INSERT INTO `sys_relation` VALUES ('6570', '1110533601151250433', '6');
INSERT INTO `sys_relation` VALUES ('6571', '1110533601151250434', '6');
INSERT INTO `sys_relation` VALUES ('6572', '1110533601151250435', '6');
INSERT INTO `sys_relation` VALUES ('6573', '145', '7');
INSERT INTO `sys_relation` VALUES ('6574', '175', '7');
INSERT INTO `sys_relation` VALUES ('6575', '176', '7');
INSERT INTO `sys_relation` VALUES ('6576', '177', '7');
INSERT INTO `sys_relation` VALUES ('6577', '179', '7');
INSERT INTO `sys_relation` VALUES ('6578', '180', '7');
INSERT INTO `sys_relation` VALUES ('6579', '1091946857313107970', '7');
INSERT INTO `sys_relation` VALUES ('6580', '1091946857313107971', '7');
INSERT INTO `sys_relation` VALUES ('6581', '1091946857313107972', '7');
INSERT INTO `sys_relation` VALUES ('6582', '1091946857313107974', '7');
INSERT INTO `sys_relation` VALUES ('6583', '1091946857313107975', '7');
INSERT INTO `sys_relation` VALUES ('6584', '1095859184412397569', '7');
INSERT INTO `sys_relation` VALUES ('6585', '1095859184412397570', '7');
INSERT INTO `sys_relation` VALUES ('6586', '1095859184412397573', '7');
INSERT INTO `sys_relation` VALUES ('6587', '1095859184412397574', '7');
INSERT INTO `sys_relation` VALUES ('6588', '1095859184412397575', '7');
INSERT INTO `sys_relation` VALUES ('6589', '1109771682136006658', '7');
INSERT INTO `sys_relation` VALUES ('6590', '1109771682136006660', '7');

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
) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=utf8 COMMENT='管理员表';

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES ('1', '4569ec22-570e-46fa-b7b9-89dbda7b00b6.jpg', 'admin', 'ce038bda20b6d1628289957b43e02919', 'eqf9z', '李四', '2017-05-05 00:00:00', '2', 'sn93@qq.com1', '18200000000', '1', '24', '1', '2016-01-29 08:49:53', '25');
INSERT INTO `sys_user` VALUES ('2', 'girl.gif', '接单人', '71887a5ad666a18f709e1d4e693d5a35', '1f7bf', '接单人', '2017-12-04 00:00:00', '1', '', '', '6', '26', '1', '2017-12-04 22:24:02', null);
INSERT INTO `sys_user` VALUES ('3', 'girl.gif', '快递点', 'b53cac62e7175637d4beb3b16b2f7915', 'j3cs9', '快递点', '2017-12-04 00:00:00', '1', '', '', '7', '27', '1', '2017-12-04 22:24:24', null);
INSERT INTO `sys_user` VALUES ('52', null, 'kuaididian', 'd06ba9b915eeda75b51b41fb8428b50d', 'vnhpo', 'kuaididian', null, '1', null, null, '7', '25', '1', '2019-03-15 17:12:24', null);
INSERT INTO `sys_user` VALUES ('56', null, 'jiedanren', 'c1ec2ca6beb262d4f04c5f49a2f5143b', 'cgazu', 'jiedanren', null, '1', null, null, '6', '25', '1', '2019-03-17 21:03:10', null);
INSERT INTO `sys_user` VALUES ('57', null, 'fadan', '1a29a783a909557e1ddd07fd77e85ed3', 'f0hzn', 'fadan', null, '1', null, null, '5', '25', '1', '2019-03-17 21:03:30', null);

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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='用户积分表';

-- ----------------------------
-- Records of sys_userscore
-- ----------------------------
INSERT INTO `sys_userscore` VALUES ('4', '52', '100', '100');
INSERT INTO `sys_userscore` VALUES ('5', '56', '105', '105');
INSERT INTO `sys_userscore` VALUES ('6', '57', '95', '95');

-- ----------------------------
-- Table structure for test
-- ----------------------------
DROP TABLE IF EXISTS `test`;
CREATE TABLE `test` (
  `aaa` int(11) NOT NULL AUTO_INCREMENT,
  `bbb` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`aaa`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of test
-- ----------------------------
INSERT INTO `test` VALUES ('1', 'gunsTest');
INSERT INTO `test` VALUES ('2', 'bizTest');
