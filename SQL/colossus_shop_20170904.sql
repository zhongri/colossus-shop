/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50713
Source Host           : localhost:3306
Source Database       : colossus_shop

Target Server Type    : MYSQL
Target Server Version : 50713
File Encoding         : 65001

Date: 2017-09-04 18:49:46
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for auth_filter
-- ----------------------------
DROP TABLE IF EXISTS `auth_filter`;
CREATE TABLE `auth_filter` (
  `url` varchar(255) DEFAULT NULL,
  `filter` varchar(255) DEFAULT NULL,
  `id` varchar(32) NOT NULL,
  `create_time` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `update_time` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of auth_filter
-- ----------------------------

-- ----------------------------
-- Table structure for auth_log
-- ----------------------------
DROP TABLE IF EXISTS `auth_log`;
CREATE TABLE `auth_log` (
  `id` varchar(32) NOT NULL COMMENT '编号',
  `description` varchar(100) DEFAULT NULL COMMENT '操作描述',
  `username` varchar(20) DEFAULT NULL COMMENT '操作用户',
  `opreate_time` datetime DEFAULT NULL COMMENT '操作时间',
  `spend_time` int(11) DEFAULT NULL COMMENT '消耗时间',
  `base_path` varchar(500) DEFAULT NULL COMMENT '根路径',
  `uri` varchar(500) DEFAULT NULL COMMENT 'URI',
  `url` varchar(500) DEFAULT NULL COMMENT 'URL',
  `method` varchar(10) DEFAULT NULL COMMENT '请求类型',
  `parameter` mediumtext,
  `user_agent` varchar(500) DEFAULT NULL COMMENT '用户标识',
  `ip` varchar(30) DEFAULT NULL COMMENT 'IP地址',
  `result` mediumtext,
  `permissions` varchar(100) DEFAULT NULL COMMENT '权限值',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='操作日志';

-- ----------------------------
-- Records of auth_log
-- ----------------------------

-- ----------------------------
-- Table structure for auth_organization
-- ----------------------------
DROP TABLE IF EXISTS `auth_organization`;
CREATE TABLE `auth_organization` (
  `id` varchar(32) NOT NULL COMMENT '编号',
  `parent_id` varchar(32) DEFAULT NULL COMMENT '所属上级',
  `name` varchar(20) DEFAULT NULL COMMENT '组织名称',
  `description` varchar(1000) DEFAULT NULL COMMENT '组织描述',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='组织';

-- ----------------------------
-- Records of auth_organization
-- ----------------------------
INSERT INTO `auth_organization` VALUES ('1', null, '总部', '北京总部', '2017-08-02 12:23:34', '2017-08-02 12:23:34');
INSERT INTO `auth_organization` VALUES ('4', null, '河北分部', '河北石家庄', '2017-08-02 12:23:34', '2017-08-02 12:23:34');
INSERT INTO `auth_organization` VALUES ('5', null, '河南分部', '河南郑州', '2017-08-02 12:23:34', '2017-08-02 12:23:34');
INSERT INTO `auth_organization` VALUES ('6', null, '湖北分部', '湖北武汉', '2017-08-02 12:23:34', '2017-08-02 12:23:34');
INSERT INTO `auth_organization` VALUES ('7', null, '湖南分部', '湖南长沙', '2017-08-02 12:23:34', '2017-08-02 12:23:34');

-- ----------------------------
-- Table structure for auth_permission
-- ----------------------------
DROP TABLE IF EXISTS `auth_permission`;
CREATE TABLE `auth_permission` (
  `id` varchar(32) NOT NULL COMMENT '编号',
  `system_id` varchar(32) NOT NULL COMMENT '所属系统',
  `parent_id` varchar(32) DEFAULT NULL COMMENT '所属上级',
  `name` varchar(20) DEFAULT NULL COMMENT '名称',
  `type` tinyint(4) DEFAULT NULL COMMENT '类型(1:目录,2:菜单,3:按钮)',
  `permission_value` varchar(50) DEFAULT NULL COMMENT '权限值',
  `uri` varchar(100) DEFAULT NULL COMMENT '路径',
  `icon` varchar(50) DEFAULT NULL COMMENT '图标',
  `status` tinyint(4) DEFAULT NULL COMMENT '状态(0:禁止,1:正常)',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `orders` bigint(20) DEFAULT NULL COMMENT '排序',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='权限';

-- ----------------------------
-- Records of auth_permission
-- ----------------------------
INSERT INTO `auth_permission` VALUES ('1', '1', '0', '系统组织管理', '1', '', '', 'zmdi zmdi-accounts-list', '1', '2017-08-02 12:23:34', '2017-08-02 12:23:34', '1');
INSERT INTO `auth_permission` VALUES ('12', '1', '0', '其他数据管理', '1', '', '', 'zmdi zmdi-more', '1', '2017-08-02 12:23:34', '2017-08-02 12:23:34', '12');
INSERT INTO `auth_permission` VALUES ('14', '1', '12', '会话管理', '2', 'upms:session:read', '/manage/session/index', '', '1', '2017-08-02 12:23:34', '2017-08-02 12:23:34', '14');
INSERT INTO `auth_permission` VALUES ('15', '1', '12', '日志记录', '2', 'upms:log:read', '/manage/log/index', '', '1', '2017-08-02 12:23:34', '2017-08-02 12:23:34', '15');
INSERT INTO `auth_permission` VALUES ('17', '2', '0', '标签类目管理', '1', null, null, 'zmdi zmdi-menu', '1', '2017-08-02 12:23:34', '2017-08-02 12:23:34', '17');
INSERT INTO `auth_permission` VALUES ('18', '2', '17', '标签管理', '2', 'cms:tag:read', '/manage/tag/index', null, '1', '2017-08-02 12:23:34', '2017-08-02 12:23:34', '18');
INSERT INTO `auth_permission` VALUES ('19', '2', '17', '类目管理', '2', 'cms:category:read', '/manage/category/index', null, '1', '2017-08-02 12:23:34', '2017-08-02 12:23:34', '19');
INSERT INTO `auth_permission` VALUES ('2', '1', '1', '系统管理', '2', 'upms:system:read', '/manage/system/index', '', '1', '2017-08-02 12:23:34', '2017-08-02 12:23:34', '2');
INSERT INTO `auth_permission` VALUES ('20', '2', '0', '文章评论管理', '1', null, null, 'zmdi zmdi-collection-text', '1', '2017-08-02 12:23:34', '2017-08-02 12:23:34', '20');
INSERT INTO `auth_permission` VALUES ('21', '2', '20', '文章管理', '2', 'cms:article:read', '/manage/article/index', null, '1', '2017-08-02 12:23:34', '2017-08-02 12:23:34', '21');
INSERT INTO `auth_permission` VALUES ('22', '2', '20', '回收管理', '2', 'cms:article:read', '/manage/article/recycle', null, '1', '2017-08-02 12:23:34', '2017-08-02 12:23:34', '22');
INSERT INTO `auth_permission` VALUES ('24', '1', '2', '新增系统', '3', 'upms:system:create', '/manage/system/create', 'zmdi zmdi-plus', '1', '2017-08-02 12:23:34', '2017-08-02 12:23:34', '24');
INSERT INTO `auth_permission` VALUES ('25', '1', '2', '编辑系统', '3', 'upms:system:update', '/manage/system/update', 'zmdi zmdi-edit', '1', '2017-08-02 12:23:34', '2017-08-02 12:23:34', '25');
INSERT INTO `auth_permission` VALUES ('26', '1', '2', '删除系统', '3', 'upms:system:delete', '/manage/system/delete', 'zmdi zmdi-close', '1', '2017-08-02 12:23:34', '2017-08-02 12:23:34', '26');
INSERT INTO `auth_permission` VALUES ('27', '1', '3', '新增组织', '3', 'upms:organization:create', '/manage/organization/create', 'zmdi zmdi-plus', '1', '2017-08-02 12:23:34', '2017-08-02 12:23:34', '27');
INSERT INTO `auth_permission` VALUES ('28', '1', '3', '编辑组织', '3', 'upms:organization:update', '/manage/organization/update', 'zmdi zmdi-edit', '1', '2017-08-02 12:23:34', '2017-08-02 12:23:34', '28');
INSERT INTO `auth_permission` VALUES ('29', '1', '3', '删除组织', '3', 'upms:organization:delete', '/manage/organization/delete', 'zmdi zmdi-close', '1', '2017-08-02 12:23:34', '2017-08-02 12:23:34', '29');
INSERT INTO `auth_permission` VALUES ('3', '1', '1', '组织管理', '2', 'upms:organization:read', '/manage/organization/index', '', '1', '2017-08-02 12:23:34', '2017-08-02 12:23:34', '3');
INSERT INTO `auth_permission` VALUES ('30', '1', '6', '新增用户', '3', 'upms:user:create', '/manage/user/create', 'zmdi zmdi-plus', '1', '2017-08-02 12:23:34', '2017-08-02 12:23:34', '30');
INSERT INTO `auth_permission` VALUES ('31', '1', '6', '编辑用户', '3', 'upms:user:update', '/manage/user/update', 'zmdi zmdi-edit', '1', '2017-08-02 12:23:34', '2017-08-02 12:23:34', '31');
INSERT INTO `auth_permission` VALUES ('32', '1', '6', '删除用户', '3', 'upms:user:delete', '/manage/user/delete', 'zmdi zmdi-close', '1', '2017-08-02 12:23:34', '2017-08-02 12:23:34', '32');
INSERT INTO `auth_permission` VALUES ('33', '1', '5', '新增角色', '3', 'upms:role:create', '/manage/role/create', 'zmdi zmdi-plus', '1', '2017-08-02 12:23:34', '2017-08-02 12:23:34', '33');
INSERT INTO `auth_permission` VALUES ('34', '1', '5', '编辑角色', '3', 'upms:role:update', '/manage/role/update', 'zmdi zmdi-edit', '1', '2017-08-02 12:23:34', '2017-08-02 12:23:34', '34');
INSERT INTO `auth_permission` VALUES ('35', '1', '5', '删除角色', '3', 'upms:role:delete', '/manage/role/delete', 'zmdi zmdi-close', '1', '2017-08-02 12:23:34', '2017-08-02 12:23:34', '35');
INSERT INTO `auth_permission` VALUES ('36', '1', '39', '新增权限', '3', 'upms:permission:create', '/manage/permission/create', 'zmdi zmdi-plus', '1', '2017-08-02 12:23:34', '2017-08-02 12:23:34', '36');
INSERT INTO `auth_permission` VALUES ('37', '1', '39', '编辑权限', '3', 'upms:permission:update', '/manage/permission/update', 'zmdi zmdi-edit', '1', '2017-08-02 12:23:34', '2017-08-02 12:23:34', '37');
INSERT INTO `auth_permission` VALUES ('38', '1', '39', '删除权限', '3', 'upms:permission:delete', '/manage/permission/delete', 'zmdi zmdi-close', '1', '2017-08-02 12:23:34', '2017-08-02 12:23:34', '38');
INSERT INTO `auth_permission` VALUES ('39', '1', '7', '权限管理', '2', 'upms:permission:read', '/manage/permission/index', null, '1', '2017-08-02 12:23:34', '2017-08-02 12:23:34', '39');
INSERT INTO `auth_permission` VALUES ('4', '1', '0', '角色用户管理', '1', '', '', 'zmdi zmdi-accounts', '1', '2017-08-02 12:23:34', '2017-08-02 12:23:34', '4');
INSERT INTO `auth_permission` VALUES ('46', '1', '5', '角色权限', '3', 'upms:role:permission', '/manage/role/permission', 'zmdi zmdi-key', '1', '2017-08-02 12:23:34', '2017-08-02 12:23:34', '1488091928257');
INSERT INTO `auth_permission` VALUES ('48', '1', '6', '用户组织', '3', 'upms:user:organization', '/manage/user/organization', 'zmdi zmdi-accounts-list', '1', '2017-08-02 12:23:34', '2017-08-02 12:23:34', '1488120011165');
INSERT INTO `auth_permission` VALUES ('5', '1', '4', '角色管理', '2', 'upms:role:read', '/manage/role/index', '', '1', '2017-08-02 12:23:34', '2017-08-02 12:23:34', '6');
INSERT INTO `auth_permission` VALUES ('50', '1', '6', '用户角色', '3', 'upms:user:role', '/manage/user/role', 'zmdi zmdi-accounts', '1', '2017-08-02 12:23:34', '2017-08-02 12:23:34', '1488120554175');
INSERT INTO `auth_permission` VALUES ('51', '1', '6', '用户权限', '3', 'upms:user:permission', '/manage/user/permission', 'zmdi zmdi-key', '1', '2017-08-02 12:23:34', '2017-08-02 12:23:34', '1488092013302');
INSERT INTO `auth_permission` VALUES ('53', '1', '14', '强制退出', '3', 'upms:session:forceout', '/manage/session/forceout', 'zmdi zmdi-run', '1', '2017-08-02 12:23:34', '2017-08-02 12:23:34', '1488379514715');
INSERT INTO `auth_permission` VALUES ('54', '2', '18', '新增标签', '3', 'cms:tag:create', '/manage/tag/create', 'zmdi zmdi-plus', '1', '2017-08-02 12:23:34', '2017-08-02 12:23:34', '1489417315159');
INSERT INTO `auth_permission` VALUES ('55', '2', '18', '编辑标签', '3', 'cms:tag:update', 'zmdi zmdi-edit', 'zmdi zmdi-widgets', '1', '2017-08-02 12:23:34', '2017-08-02 12:23:34', '1489417344931');
INSERT INTO `auth_permission` VALUES ('56', '2', '18', '删除标签', '3', 'cms:tag:delete', '/manage/tag/delete', 'zmdi zmdi-close', '1', '2017-08-02 12:23:34', '2017-08-02 12:23:34', '1489417372114');
INSERT INTO `auth_permission` VALUES ('57', '1', '15', '删除权限', '3', 'upms:log:delete', '/manage/log/delete', 'zmdi zmdi-close', '1', '2017-08-02 12:23:34', '2017-08-02 12:23:34', '1489503867909');
INSERT INTO `auth_permission` VALUES ('58', '2', '19', '编辑类目', '3', 'cms:category:update', '/manage/category/update', 'zmdi zmdi-edit', '1', '2017-08-02 12:23:34', '2017-08-02 12:23:34', '1489586600462');
INSERT INTO `auth_permission` VALUES ('59', '2', '19', '删除类目', '3', 'cms:category:delete', '/manage/category/delete', 'zmdi zmdi-close', '1', '2017-08-02 12:23:34', '2017-08-02 12:23:34', '1489586633059');
INSERT INTO `auth_permission` VALUES ('6', '1', '4', '用户管理', '2', 'upms:user:read', '/manage/user/index', '', '1', '2017-08-02 12:23:34', '2017-08-02 12:23:34', '5');
INSERT INTO `auth_permission` VALUES ('60', '2', '19', '新增类目', '3', 'cms:category:create', '/manage/category/create', 'zmdi zmdi-plus', '1', '2017-08-02 12:23:34', '2017-08-02 12:23:34', '1489590342089');
INSERT INTO `auth_permission` VALUES ('61', '2', '0', '其他数据管理', '1', '', '', 'zmdi zmdi-more', '1', '2017-08-02 12:23:34', '2017-08-02 12:23:34', '1489835455359');
INSERT INTO `auth_permission` VALUES ('7', '1', '0', '权限资源管理', '1', '', '', 'zmdi zmdi-lock-outline', '1', '2017-08-02 12:23:34', '2017-08-02 12:23:34', '7');

-- ----------------------------
-- Table structure for auth_role
-- ----------------------------
DROP TABLE IF EXISTS `auth_role`;
CREATE TABLE `auth_role` (
  `id` varchar(32) NOT NULL COMMENT '编号',
  `name` varchar(20) DEFAULT NULL COMMENT '角色名称',
  `title` varchar(20) DEFAULT NULL COMMENT '角色标题',
  `description` varchar(1000) DEFAULT NULL COMMENT '角色描述',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `orders` bigint(20) NOT NULL COMMENT '排序',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='角色';

-- ----------------------------
-- Records of auth_role
-- ----------------------------
INSERT INTO `auth_role` VALUES ('1', 'super', '超级管理员', '拥有所有权限', '2017-08-02 12:23:34', '2017-08-02 12:23:34', '1');
INSERT INTO `auth_role` VALUES ('2', 'admin', '管理员', '拥有除权限管理系统外的所有权限', '2017-08-02 12:23:34', '2017-08-02 12:23:34', '1487471013117');

-- ----------------------------
-- Table structure for auth_role_permission
-- ----------------------------
DROP TABLE IF EXISTS `auth_role_permission`;
CREATE TABLE `auth_role_permission` (
  `id` varchar(32) NOT NULL COMMENT '编号',
  `role_id` varchar(32) NOT NULL COMMENT '角色编号',
  `permission_id` varchar(32) NOT NULL COMMENT '权限编号',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `FK_Reference_23` (`role_id`),
  CONSTRAINT `FK_Reference_23` FOREIGN KEY (`role_id`) REFERENCES `auth_role` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='角色权限关联表';

-- ----------------------------
-- Records of auth_role_permission
-- ----------------------------
INSERT INTO `auth_role_permission` VALUES ('1', '1', '1', '2017-08-02 12:23:34', '2017-08-02 12:23:34');
INSERT INTO `auth_role_permission` VALUES ('100', '1', '76', '2017-08-02 12:23:34', '2017-08-02 12:23:34');
INSERT INTO `auth_role_permission` VALUES ('101', '1', '77', '2017-08-02 12:23:34', '2017-08-02 12:23:34');
INSERT INTO `auth_role_permission` VALUES ('102', '1', '76', '2017-08-02 12:23:34', '2017-08-02 12:23:34');
INSERT INTO `auth_role_permission` VALUES ('103', '1', '77', '2017-08-02 12:23:34', '2017-08-02 12:23:34');
INSERT INTO `auth_role_permission` VALUES ('105', '1', '79', '2017-08-02 12:23:34', '2017-08-02 12:23:34');
INSERT INTO `auth_role_permission` VALUES ('106', '1', '80', '2017-08-02 12:23:34', '2017-08-02 12:23:34');
INSERT INTO `auth_role_permission` VALUES ('107', '1', '81', '2017-08-02 12:23:34', '2017-08-02 12:23:34');
INSERT INTO `auth_role_permission` VALUES ('108', '1', '81', '2017-08-02 12:23:34', '2017-08-02 12:23:34');
INSERT INTO `auth_role_permission` VALUES ('109', '1', '82', '2017-08-02 12:23:34', '2017-08-02 12:23:34');
INSERT INTO `auth_role_permission` VALUES ('110', '1', '81', '2017-08-02 12:23:34', '2017-08-02 12:23:34');
INSERT INTO `auth_role_permission` VALUES ('111', '1', '82', '2017-08-02 12:23:34', '2017-08-02 12:23:34');
INSERT INTO `auth_role_permission` VALUES ('112', '1', '83', '2017-08-02 12:23:34', '2017-08-02 12:23:34');
INSERT INTO `auth_role_permission` VALUES ('113', '1', '84', '2017-08-02 12:23:34', '2017-08-02 12:23:34');
INSERT INTO `auth_role_permission` VALUES ('114', '1', '84', '2017-08-02 12:23:34', '2017-08-02 12:23:34');
INSERT INTO `auth_role_permission` VALUES ('115', '1', '85', '2017-08-02 12:23:34', '2017-08-02 12:23:34');
INSERT INTO `auth_role_permission` VALUES ('12', '1', '12', '2017-08-02 12:23:34', '2017-08-02 12:23:34');
INSERT INTO `auth_role_permission` VALUES ('121', '1', '78', '2017-08-02 12:23:34', '2017-08-02 12:23:34');
INSERT INTO `auth_role_permission` VALUES ('122', '1', '78', '2017-08-02 12:23:34', '2017-08-02 12:23:34');
INSERT INTO `auth_role_permission` VALUES ('124', '1', '25', '2017-08-02 12:23:34', '2017-08-02 12:23:34');
INSERT INTO `auth_role_permission` VALUES ('125', '1', '26', '2017-08-02 12:23:34', '2017-08-02 12:23:34');
INSERT INTO `auth_role_permission` VALUES ('14', '1', '14', '2017-08-02 12:23:34', '2017-08-02 12:23:34');
INSERT INTO `auth_role_permission` VALUES ('15', '1', '15', '2017-08-02 12:23:34', '2017-08-02 12:23:34');
INSERT INTO `auth_role_permission` VALUES ('17', '1', '17', '2017-08-02 12:23:34', '2017-08-02 12:23:34');
INSERT INTO `auth_role_permission` VALUES ('19', '1', '19', '2017-08-02 12:23:34', '2017-08-02 12:23:34');
INSERT INTO `auth_role_permission` VALUES ('2', '1', '2', '2017-08-02 12:23:34', '2017-08-02 12:23:34');
INSERT INTO `auth_role_permission` VALUES ('20', '1', '20', '2017-08-02 12:23:34', '2017-08-02 12:23:34');
INSERT INTO `auth_role_permission` VALUES ('21', '1', '21', '2017-08-02 12:23:34', '2017-08-02 12:23:34');
INSERT INTO `auth_role_permission` VALUES ('24', '1', '24', '2017-08-02 12:23:34', '2017-08-02 12:23:34');
INSERT INTO `auth_role_permission` VALUES ('27', '1', '27', '2017-08-02 12:23:34', '2017-08-02 12:23:34');
INSERT INTO `auth_role_permission` VALUES ('28', '1', '28', '2017-08-02 12:23:34', '2017-08-02 12:23:34');
INSERT INTO `auth_role_permission` VALUES ('29', '1', '29', '2017-08-02 12:23:34', '2017-08-02 12:23:34');
INSERT INTO `auth_role_permission` VALUES ('3', '1', '3', '2017-08-02 12:23:34', '2017-08-02 12:23:34');
INSERT INTO `auth_role_permission` VALUES ('30', '1', '30', '2017-08-02 12:23:34', '2017-08-02 12:23:34');
INSERT INTO `auth_role_permission` VALUES ('31', '1', '31', '2017-08-02 12:23:34', '2017-08-02 12:23:34');
INSERT INTO `auth_role_permission` VALUES ('32', '1', '32', '2017-08-02 12:23:34', '2017-08-02 12:23:34');
INSERT INTO `auth_role_permission` VALUES ('33', '1', '33', '2017-08-02 12:23:34', '2017-08-02 12:23:34');
INSERT INTO `auth_role_permission` VALUES ('34', '1', '34', '2017-08-02 12:23:34', '2017-08-02 12:23:34');
INSERT INTO `auth_role_permission` VALUES ('35', '1', '35', '2017-08-02 12:23:34', '2017-08-02 12:23:34');
INSERT INTO `auth_role_permission` VALUES ('36', '1', '36', '2017-08-02 12:23:34', '2017-08-02 12:23:34');
INSERT INTO `auth_role_permission` VALUES ('37', '1', '37', '2017-08-02 12:23:34', '2017-08-02 12:23:34');
INSERT INTO `auth_role_permission` VALUES ('38', '1', '38', '2017-08-02 12:23:34', '2017-08-02 12:23:34');
INSERT INTO `auth_role_permission` VALUES ('39', '1', '46', '2017-08-02 12:23:34', '2017-08-02 12:23:34');
INSERT INTO `auth_role_permission` VALUES ('4', '1', '4', '2017-08-02 12:23:34', '2017-08-02 12:23:34');
INSERT INTO `auth_role_permission` VALUES ('40', '1', '51', '2017-08-02 12:23:34', '2017-08-02 12:23:34');
INSERT INTO `auth_role_permission` VALUES ('44', '1', '48', '2017-08-02 12:23:34', '2017-08-02 12:23:34');
INSERT INTO `auth_role_permission` VALUES ('45', '1', '50', '2017-08-02 12:23:34', '2017-08-02 12:23:34');
INSERT INTO `auth_role_permission` VALUES ('47', '1', '53', '2017-08-02 12:23:34', '2017-08-02 12:23:34');
INSERT INTO `auth_role_permission` VALUES ('48', '1', '18', '2017-08-02 12:23:34', '2017-08-02 12:23:34');
INSERT INTO `auth_role_permission` VALUES ('49', '1', '54', '2017-08-02 12:23:34', '2017-08-02 12:23:34');
INSERT INTO `auth_role_permission` VALUES ('5', '1', '5', '2017-08-02 12:23:34', '2017-08-02 12:23:34');
INSERT INTO `auth_role_permission` VALUES ('50', '1', '54', '2017-08-02 12:23:34', '2017-08-02 12:23:34');
INSERT INTO `auth_role_permission` VALUES ('51', '1', '55', '2017-08-02 12:23:34', '2017-08-02 12:23:34');
INSERT INTO `auth_role_permission` VALUES ('52', '1', '54', '2017-08-02 12:23:34', '2017-08-02 12:23:34');
INSERT INTO `auth_role_permission` VALUES ('53', '1', '55', '2017-08-02 12:23:34', '2017-08-02 12:23:34');
INSERT INTO `auth_role_permission` VALUES ('54', '1', '56', '2017-08-02 12:23:34', '2017-08-02 12:23:34');
INSERT INTO `auth_role_permission` VALUES ('55', '1', '57', '2017-08-02 12:23:34', '2017-08-02 12:23:34');
INSERT INTO `auth_role_permission` VALUES ('56', '1', '58', '2017-08-02 12:23:34', '2017-08-02 12:23:34');
INSERT INTO `auth_role_permission` VALUES ('57', '1', '58', '2017-08-02 12:23:34', '2017-08-02 12:23:34');
INSERT INTO `auth_role_permission` VALUES ('58', '1', '59', '2017-08-02 12:23:34', '2017-08-02 12:23:34');
INSERT INTO `auth_role_permission` VALUES ('59', '1', '60', '2017-08-02 12:23:34', '2017-08-02 12:23:34');
INSERT INTO `auth_role_permission` VALUES ('6', '1', '6', '2017-08-02 12:23:34', '2017-08-02 12:23:34');
INSERT INTO `auth_role_permission` VALUES ('60', '1', '61', '2017-08-02 12:23:34', '2017-08-02 12:23:34');
INSERT INTO `auth_role_permission` VALUES ('61', '1', '62', '2017-08-02 12:23:34', '2017-08-02 12:23:34');
INSERT INTO `auth_role_permission` VALUES ('62', '1', '62', '2017-08-02 12:23:34', '2017-08-02 12:23:34');
INSERT INTO `auth_role_permission` VALUES ('63', '1', '63', '2017-08-02 12:23:34', '2017-08-02 12:23:34');
INSERT INTO `auth_role_permission` VALUES ('64', '1', '62', '2017-08-02 12:23:34', '2017-08-02 12:23:34');
INSERT INTO `auth_role_permission` VALUES ('65', '1', '63', '2017-08-02 12:23:34', '2017-08-02 12:23:34');
INSERT INTO `auth_role_permission` VALUES ('66', '1', '64', '2017-08-02 12:23:34', '2017-08-02 12:23:34');
INSERT INTO `auth_role_permission` VALUES ('67', '1', '62', '2017-08-02 12:23:34', '2017-08-02 12:23:34');
INSERT INTO `auth_role_permission` VALUES ('68', '1', '63', '2017-08-02 12:23:34', '2017-08-02 12:23:34');
INSERT INTO `auth_role_permission` VALUES ('69', '1', '64', '2017-08-02 12:23:34', '2017-08-02 12:23:34');
INSERT INTO `auth_role_permission` VALUES ('7', '1', '7', '2017-08-02 12:23:34', '2017-08-02 12:23:34');
INSERT INTO `auth_role_permission` VALUES ('70', '1', '65', '2017-08-02 12:23:34', '2017-08-02 12:23:34');
INSERT INTO `auth_role_permission` VALUES ('71', '1', '62', '2017-08-02 12:23:34', '2017-08-02 12:23:34');
INSERT INTO `auth_role_permission` VALUES ('72', '1', '63', '2017-08-02 12:23:34', '2017-08-02 12:23:34');
INSERT INTO `auth_role_permission` VALUES ('73', '1', '64', '2017-08-02 12:23:34', '2017-08-02 12:23:34');
INSERT INTO `auth_role_permission` VALUES ('74', '1', '65', '2017-08-02 12:23:34', '2017-08-02 12:23:34');
INSERT INTO `auth_role_permission` VALUES ('75', '1', '66', '2017-08-02 12:23:34', '2017-08-02 12:23:34');
INSERT INTO `auth_role_permission` VALUES ('76', '1', '62', '2017-08-02 12:23:34', '2017-08-02 12:23:34');
INSERT INTO `auth_role_permission` VALUES ('77', '1', '63', '2017-08-02 12:23:34', '2017-08-02 12:23:34');
INSERT INTO `auth_role_permission` VALUES ('78', '1', '64', '2017-08-02 12:23:34', '2017-08-02 12:23:34');
INSERT INTO `auth_role_permission` VALUES ('79', '1', '65', '2017-08-02 12:23:34', '2017-08-02 12:23:34');
INSERT INTO `auth_role_permission` VALUES ('8', '1', '39', '2017-08-02 12:23:34', '2017-08-02 12:23:34');
INSERT INTO `auth_role_permission` VALUES ('80', '1', '66', '2017-08-02 12:23:34', '2017-08-02 12:23:34');
INSERT INTO `auth_role_permission` VALUES ('81', '1', '67', '2017-08-02 12:23:34', '2017-08-02 12:23:34');
INSERT INTO `auth_role_permission` VALUES ('82', '1', '68', '2017-08-02 12:23:34', '2017-08-02 12:23:34');
INSERT INTO `auth_role_permission` VALUES ('83', '1', '69', '2017-08-02 12:23:34', '2017-08-02 12:23:34');
INSERT INTO `auth_role_permission` VALUES ('84', '1', '69', '2017-08-02 12:23:34', '2017-08-02 12:23:34');
INSERT INTO `auth_role_permission` VALUES ('85', '1', '70', '2017-08-02 12:23:34', '2017-08-02 12:23:34');
INSERT INTO `auth_role_permission` VALUES ('86', '1', '69', '2017-08-02 12:23:34', '2017-08-02 12:23:34');
INSERT INTO `auth_role_permission` VALUES ('87', '1', '70', '2017-08-02 12:23:34', '2017-08-02 12:23:34');
INSERT INTO `auth_role_permission` VALUES ('88', '1', '71', '2017-08-02 12:23:34', '2017-08-02 12:23:34');
INSERT INTO `auth_role_permission` VALUES ('89', '1', '72', '2017-08-02 12:23:34', '2017-08-02 12:23:34');
INSERT INTO `auth_role_permission` VALUES ('90', '1', '72', '2017-08-02 12:23:34', '2017-08-02 12:23:34');
INSERT INTO `auth_role_permission` VALUES ('91', '1', '73', '2017-08-02 12:23:34', '2017-08-02 12:23:34');
INSERT INTO `auth_role_permission` VALUES ('92', '1', '72', '2017-08-02 12:23:34', '2017-08-02 12:23:34');
INSERT INTO `auth_role_permission` VALUES ('93', '1', '73', '2017-08-02 12:23:34', '2017-08-02 12:23:34');
INSERT INTO `auth_role_permission` VALUES ('94', '1', '74', '2017-08-02 12:23:34', '2017-08-02 12:23:34');
INSERT INTO `auth_role_permission` VALUES ('95', '1', '72', '2017-08-02 12:23:34', '2017-08-02 12:23:34');
INSERT INTO `auth_role_permission` VALUES ('96', '1', '73', '2017-08-02 12:23:34', '2017-08-02 12:23:34');
INSERT INTO `auth_role_permission` VALUES ('97', '1', '74', '2017-08-02 12:23:34', '2017-08-02 12:23:34');
INSERT INTO `auth_role_permission` VALUES ('98', '1', '75', '2017-08-02 12:23:34', '2017-08-02 12:23:34');
INSERT INTO `auth_role_permission` VALUES ('99', '1', '76', '2017-08-02 12:23:34', '2017-08-02 12:23:34');

-- ----------------------------
-- Table structure for auth_system
-- ----------------------------
DROP TABLE IF EXISTS `auth_system`;
CREATE TABLE `auth_system` (
  `id` varchar(32) NOT NULL COMMENT '编号',
  `icon` varchar(50) DEFAULT NULL COMMENT '图标',
  `banner` varchar(150) DEFAULT NULL COMMENT '背景',
  `theme` varchar(50) DEFAULT NULL COMMENT '主题',
  `basepath` varchar(100) DEFAULT NULL COMMENT '根目录',
  `status` tinyint(4) DEFAULT NULL COMMENT '状态(-1:黑名单,1:正常)',
  `name` varchar(20) DEFAULT NULL COMMENT '系统名称',
  `title` varchar(20) DEFAULT NULL COMMENT '系统标题',
  `description` varchar(300) DEFAULT NULL COMMENT '系统描述',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `orders` bigint(20) DEFAULT NULL COMMENT '排序',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='系统';

-- ----------------------------
-- Records of auth_system
-- ----------------------------
INSERT INTO `auth_system` VALUES ('1', 'zmdi zmdi-shield-security', '/resources/zheng-admin/images/zheng-upms.png', '#29A176', 'http://upms.zhangshuzheng.cn:1111', '1', 'zheng-upms-server', '权限管理系统', '用户权限管理系统（RBAC细粒度用户权限、统一后台、单点登录、会话管理）', '2017-08-02 12:23:34', '2017-08-02 12:23:34', '1');
INSERT INTO `auth_system` VALUES ('2', 'zmdi zmdi-wikipedia', '/resources/zheng-admin/images/zheng-cms.png', '#455EC5', 'http://cms.zhangshuzheng.cn:2222', '1', 'zheng-cms-admin', '内容管理系统', '内容管理系统（门户、博客、论坛、问答等）', '2017-08-02 12:23:34', '2017-08-02 12:23:34', '2');
INSERT INTO `auth_system` VALUES ('3', 'zmdi zmdi-paypal-alt', '/resources/zheng-admin/images/zheng-pay.png', '#F06292', 'http://pay.zhangshuzheng.cn:3331', '1', 'zheng-pay-admin', '支付管理系统', '支付管理系统', '2017-08-02 12:23:34', '2017-08-02 12:23:34', '3');
INSERT INTO `auth_system` VALUES ('4', 'zmdi zmdi-account', '/resources/zheng-admin/images/zheng-ucenter.png', '#6539B4', 'http://ucenter.zhangshuzheng.cn:4441', '1', 'zheng-ucenter-home', '用户管理系统', '用户管理系统', '2017-08-02 12:23:34', '2017-08-02 12:23:34', '4');
INSERT INTO `auth_system` VALUES ('5', 'zmdi zmdi-cloud', '/resources/zheng-admin/images/zheng-oss.png', '#0B8DE5', 'http://oss.zhangshuzheng.cn:7771', '1', 'zheng-oss-web', '存储管理系统', '存储管理系统', '2017-08-02 12:23:34', '2017-08-02 12:23:34', '5');

-- ----------------------------
-- Table structure for auth_user
-- ----------------------------
DROP TABLE IF EXISTS `auth_user`;
CREATE TABLE `auth_user` (
  `id` varchar(32) NOT NULL COMMENT '编号',
  `username` varchar(20) NOT NULL COMMENT '帐号',
  `password` varchar(32) NOT NULL COMMENT '密码MD5(密码+盐)',
  `salt` varchar(32) DEFAULT NULL COMMENT '盐',
  `realname` varchar(20) DEFAULT NULL COMMENT '姓名',
  `avatar` varchar(150) DEFAULT NULL COMMENT '头像',
  `phone` varchar(20) DEFAULT NULL COMMENT '电话',
  `email` varchar(50) DEFAULT NULL COMMENT '邮箱',
  `sex` tinyint(4) DEFAULT NULL COMMENT '性别',
  `locked` tinyint(4) DEFAULT NULL COMMENT '状态(0:正常,1:锁定)',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='用户';

-- ----------------------------
-- Records of auth_user
-- ----------------------------
INSERT INTO `auth_user` VALUES ('1', 'admin', '3038D9CB63B3152A79B8153FB06C02F7', '66f1b370c660445a8657bf8bf1794486', '张恕征', '/resources/zheng-admin/images/avatar.jpg', '', '469741414@qq.com', '1', '0', '2017-08-02 12:23:34', '2017-08-02 12:23:34');
INSERT INTO `auth_user` VALUES ('2', 'test', '285C9762F5F9046F5893F752DFAF3476', 'd2d0d03310444ad388a8b290b0fe8564', '张恕征', '/resources/zheng-admin/images/avatar.jpg', '', '469741414@qq.com', '1', '1', '2017-08-02 12:23:34', '2017-08-02 12:23:34');

-- ----------------------------
-- Table structure for auth_user_addr
-- ----------------------------
DROP TABLE IF EXISTS `auth_user_addr`;
CREATE TABLE `auth_user_addr` (
  `id` varchar(32) NOT NULL COMMENT '地址ID',
  `user_id` varchar(32) NOT NULL COMMENT '用户ID',
  `receiver_name` varchar(20) DEFAULT NULL COMMENT '收货人全名',
  `receiver_phone` varchar(20) DEFAULT NULL COMMENT '固定电话',
  `receiver_mobile` varchar(30) DEFAULT NULL COMMENT '移动电话',
  `receiver_state` varchar(10) DEFAULT NULL COMMENT '省份',
  `receiver_city` varchar(10) DEFAULT NULL COMMENT '城市',
  `receiver_district` varchar(20) DEFAULT NULL COMMENT '区/县',
  `receiver_address` varchar(200) DEFAULT NULL COMMENT '收货地址，如：xx路xx号',
  `receiver_zip` varchar(6) DEFAULT NULL COMMENT '邮政编码,如：110000',
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_user_addr
-- ----------------------------

-- ----------------------------
-- Table structure for auth_user_organization
-- ----------------------------
DROP TABLE IF EXISTS `auth_user_organization`;
CREATE TABLE `auth_user_organization` (
  `id` varchar(32) NOT NULL COMMENT '编号',
  `user_id` varchar(32) NOT NULL COMMENT '用户编号',
  `organization_id` varchar(32) NOT NULL COMMENT '组织编号',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='用户组织关联表';

-- ----------------------------
-- Records of auth_user_organization
-- ----------------------------
INSERT INTO `auth_user_organization` VALUES ('19', '1', '1', '2017-08-02 12:23:34', '2017-08-02 12:23:34');
INSERT INTO `auth_user_organization` VALUES ('20', '1', '4', '2017-08-02 12:23:34', '2017-08-02 12:23:34');
INSERT INTO `auth_user_organization` VALUES ('21', '1', '5', '2017-08-02 12:23:34', '2017-08-02 12:23:34');
INSERT INTO `auth_user_organization` VALUES ('22', '1', '6', '2017-08-02 12:23:34', '2017-08-02 12:23:34');
INSERT INTO `auth_user_organization` VALUES ('23', '1', '7', '2017-08-02 12:23:34', '2017-08-02 12:23:34');

-- ----------------------------
-- Table structure for auth_user_permission
-- ----------------------------
DROP TABLE IF EXISTS `auth_user_permission`;
CREATE TABLE `auth_user_permission` (
  `id` varchar(32) NOT NULL COMMENT '编号',
  `user_id` varchar(32) NOT NULL COMMENT '用户编号',
  `permission_id` varchar(32) NOT NULL COMMENT '权限编号',
  `type` tinyint(4) NOT NULL COMMENT '权限类型(-1:减权限,1:增权限)',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='用户权限关联表';

-- ----------------------------
-- Records of auth_user_permission
-- ----------------------------
INSERT INTO `auth_user_permission` VALUES ('10', '2', '51', '-1', '2017-08-02 12:23:34', '2017-08-02 12:23:34');
INSERT INTO `auth_user_permission` VALUES ('11', '2', '48', '-1', '2017-08-02 12:23:34', '2017-08-02 12:23:34');
INSERT INTO `auth_user_permission` VALUES ('12', '2', '50', '-1', '2017-08-02 12:23:34', '2017-08-02 12:23:34');
INSERT INTO `auth_user_permission` VALUES ('13', '2', '35', '-1', '2017-08-02 12:23:34', '2017-08-02 12:23:34');
INSERT INTO `auth_user_permission` VALUES ('14', '2', '46', '-1', '2017-08-02 12:23:34', '2017-08-02 12:23:34');
INSERT INTO `auth_user_permission` VALUES ('15', '2', '37', '-1', '2017-08-02 12:23:34', '2017-08-02 12:23:34');
INSERT INTO `auth_user_permission` VALUES ('16', '2', '38', '-1', '2017-08-02 12:23:34', '2017-08-02 12:23:34');
INSERT INTO `auth_user_permission` VALUES ('17', '2', '57', '-1', '2017-08-02 12:23:34', '2017-08-02 12:23:34');
INSERT INTO `auth_user_permission` VALUES ('18', '2', '56', '-1', '2017-08-02 12:23:34', '2017-08-02 12:23:34');
INSERT INTO `auth_user_permission` VALUES ('19', '2', '59', '-1', '2017-08-02 12:23:34', '2017-08-02 12:23:34');
INSERT INTO `auth_user_permission` VALUES ('20', '2', '78', '-1', '2017-08-02 12:23:34', '2017-08-02 12:23:34');
INSERT INTO `auth_user_permission` VALUES ('21', '2', '67', '-1', '2017-08-02 12:23:34', '2017-08-02 12:23:34');
INSERT INTO `auth_user_permission` VALUES ('22', '2', '83', '-1', '2017-08-02 12:23:34', '2017-08-02 12:23:34');
INSERT INTO `auth_user_permission` VALUES ('23', '2', '71', '-1', '2017-08-02 12:23:34', '2017-08-02 12:23:34');
INSERT INTO `auth_user_permission` VALUES ('24', '2', '75', '-1', '2017-08-02 12:23:34', '2017-08-02 12:23:34');
INSERT INTO `auth_user_permission` VALUES ('3', '1', '22', '-1', '2017-08-02 12:23:34', '2017-08-02 12:23:34');
INSERT INTO `auth_user_permission` VALUES ('4', '1', '22', '1', '2017-08-02 12:23:34', '2017-08-02 12:23:34');
INSERT INTO `auth_user_permission` VALUES ('5', '2', '24', '-1', '2017-08-02 12:23:34', '2017-08-02 12:23:34');
INSERT INTO `auth_user_permission` VALUES ('6', '2', '26', '-1', '2017-08-02 12:23:34', '2017-08-02 12:23:34');
INSERT INTO `auth_user_permission` VALUES ('7', '2', '27', '-1', '2017-08-02 12:23:34', '2017-08-02 12:23:34');
INSERT INTO `auth_user_permission` VALUES ('8', '2', '29', '-1', '2017-08-02 12:23:34', '2017-08-02 12:23:34');
INSERT INTO `auth_user_permission` VALUES ('9', '2', '32', '-1', '2017-08-02 12:23:34', '2017-08-02 12:23:34');

-- ----------------------------
-- Table structure for auth_user_role
-- ----------------------------
DROP TABLE IF EXISTS `auth_user_role`;
CREATE TABLE `auth_user_role` (
  `id` varchar(32) NOT NULL COMMENT '编号',
  `user_id` varchar(32) NOT NULL COMMENT '用户编号',
  `role_id` varchar(32) DEFAULT NULL COMMENT '角色编号',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='用户角色关联表';

-- ----------------------------
-- Records of auth_user_role
-- ----------------------------
INSERT INTO `auth_user_role` VALUES ('4', '1', '1', '2017-08-02 12:23:34', '2017-08-02 12:23:34');
INSERT INTO `auth_user_role` VALUES ('5', '1', '2', '2017-08-02 12:23:34', '2017-08-02 12:23:34');
INSERT INTO `auth_user_role` VALUES ('6', '2', '1', '2017-08-02 12:23:34', '2017-08-02 12:23:34');
INSERT INTO `auth_user_role` VALUES ('7', '2', '2', '2017-08-02 12:23:34', '2017-08-02 12:23:34');

-- ----------------------------
-- Table structure for category
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category` (
  `id` varchar(32) NOT NULL,
  `name` varchar(200) DEFAULT NULL COMMENT '名字',
  `sort_order` int(4) NOT NULL DEFAULT '1' COMMENT '排列序号，表示同级类目的展现次序，如数值相等则按名称次序排列。取值范围:大于零的整数',
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `update_time` (`update_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of category
-- ----------------------------
INSERT INTO `category` VALUES ('a', '家用电器', '1', '2017-08-08 14:05:44', '2017-02-21 21:48:56');
INSERT INTO `category` VALUES ('b', '手机/运营商/数码', '1', '2017-02-14 23:09:29', '2017-02-14 23:09:31');
INSERT INTO `category` VALUES ('c', '电脑办公', '1', '2017-02-14 23:10:48', '2017-02-14 23:10:50');
INSERT INTO `category` VALUES ('d', '家居/家具/家装/厨具', '1', '2017-02-14 23:10:57', '2017-02-14 23:10:51');
INSERT INTO `category` VALUES ('e', ' 装/女装/童装/内衣', '1', '2017-02-14 23:10:59', '2017-02-14 23:10:53');
INSERT INTO `category` VALUES ('f', '个护化妆/清洁用品/宠物', '1', '2017-02-14 23:11:03', '2017-02-14 23:10:54');
INSERT INTO `category` VALUES ('g', '鞋靴/箱包/珠宝/奢侈品', '1', '2017-02-14 23:11:03', '2017-02-14 23:10:56');
INSERT INTO `category` VALUES ('h', '运动/户外/钟表', '1', '2017-02-14 23:11:05', '2017-02-14 23:11:18');
INSERT INTO `category` VALUES ('i', '汽车/汽车用品', '1', '2017-02-14 23:11:07', '2017-02-14 23:11:17');
INSERT INTO `category` VALUES ('j', '母婴/玩具乐器', '1', '2017-02-14 23:11:08', '2017-02-14 23:11:20');
INSERT INTO `category` VALUES ('k', '食品/酒类/生鲜/特产', '1', '2017-02-14 23:11:09', '2017-02-14 23:11:21');
INSERT INTO `category` VALUES ('l', '医药保健', '1', '2017-02-14 23:11:11', '2017-02-14 23:11:13');
INSERT INTO `category` VALUES ('m', '图书/音像/电子书', '1', '2017-02-14 23:11:27', '2017-02-14 23:11:22');
INSERT INTO `category` VALUES ('n', '机票/酒店/旅游/生活', '1', '2017-02-14 23:11:28', '2017-02-14 23:11:24');
INSERT INTO `category` VALUES ('o', '理财/众筹/白条/保险', '1', '2017-02-14 23:11:29', '2017-02-14 23:11:25');

-- ----------------------------
-- Table structure for category_image
-- ----------------------------
DROP TABLE IF EXISTS `category_image`;
CREATE TABLE `category_image` (
  `id` varchar(32) NOT NULL COMMENT '图片ID',
  `cid` varchar(5) NOT NULL COMMENT '分类id',
  `name` varchar(200) DEFAULT NULL COMMENT '名字',
  `url` varchar(200) DEFAULT NULL COMMENT '网址或网页id',
  `little_or_big` int(1) DEFAULT '1' COMMENT '状态。可选值:1(little),2(big)',
  `status` int(1) NOT NULL DEFAULT '1' COMMENT '状态。可选值:1(正常),2(删除)',
  `image_url` varchar(200) DEFAULT NULL COMMENT '图片路径',
  `sort_order` int(4) NOT NULL DEFAULT '1' COMMENT '排列序号，表示同级类目的展现次序，如数值相等则按名称次序排列。取值范围:大于零的整数',
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='分类图片';

-- ----------------------------
-- Records of category_image
-- ----------------------------
INSERT INTO `category_image` VALUES ('1', 'a', '美的', '//mall.jd.com/index-1000006726.html', '1', '1', 'group1/M00/00/01/wKh9hFihh6KAMMC_AAAFzyWT3dY052.jpg', '1', '2017-02-15 21:56:31', '2017-02-15 21:56:31');
INSERT INTO `category_image` VALUES ('10', 'a', '买一赠五', '//sale.jd.com/act/AIgrxFvoGhumOlt.html', '2', '1', 'group1/M00/00/01/wKh9hFihh6OAJB1MAAAKhOIxRZY479.jpg', '1', '2017-02-15 21:56:33', '2017-02-15 21:56:33');
INSERT INTO `category_image` VALUES ('100', 'j', '诺优能', '//mall.jd.com/index-1000002688.html', '1', '1', 'group1/M00/00/02/wKh9hFihh7OAY9aLAAAFvHDzLqs666.jpg', '1', '2017-02-15 21:56:49', '2017-02-15 21:56:49');
INSERT INTO `category_image` VALUES ('101', 'j', '2.13-2.19', '//sale.jd.com/act/tZyGlSK7qDeW3Vs.html', '2', '1', 'group1/M00/00/02/wKh9hFihh7SAFXvoAAAPF7Y1ehE130.jpg', '1', '2017-02-15 21:56:50', '2017-02-15 21:56:50');
INSERT INTO `category_image` VALUES ('102', 'j', '母婴会员', 'sale.jd.com/act/bdxgrycZWv.html', '2', '1', 'group1/M00/00/02/wKh9hFihh7SAVY5eAAAQFGNT5XU092.jpg', '1', '2017-02-15 21:56:50', '2017-02-15 21:56:50');
INSERT INTO `category_image` VALUES ('103', 'k', '促销活动', '//sale.jd.com/act/wCN5IMJiE7pD1ykx.html', '1', '1', 'group1/M00/00/02/wKh9hFihh7WAe0OSAAAJnNpGqKc534.jpg', '1', '2017-02-15 21:56:51', '2017-02-15 21:56:51');
INSERT INTO `category_image` VALUES ('104', 'k', '良品铺子', '//liangpinpuzizy.jd.com/', '1', '1', 'group1/M00/00/02/wKh9hFihh7aAc3aDAAAGwqA6psM364.jpg', '1', '2017-02-15 21:56:52', '2017-02-15 21:56:52');
INSERT INTO `category_image` VALUES ('105', 'k', '3', '//sale.jd.com/act/5IJBY8NU6o0qrpWv.html', '1', '1', 'group1/M00/00/02/wKh9hFihh7eAWRjZAAAFtIz6laQ713.jpg', '1', '2017-02-15 21:56:52', '2017-02-15 21:56:52');
INSERT INTO `category_image` VALUES ('106', 'k', '促销活动', '//mall.jd.com/index-1000078403.html', '1', '1', 'group1/M00/00/02/wKh9hFihh7eAB6pEAAAE2x_lsJM516.jpg', '1', '2017-02-15 21:56:53', '2017-02-15 21:56:53');
INSERT INTO `category_image` VALUES ('107', 'k', '蒙牛', '//mall.jd.com/index-1000014803.html', '1', '1', 'group1/M00/00/02/wKh9hFihh7eAfSgDAAAGrA6yZBw843.jpg', '1', '2017-02-15 21:56:53', '2017-02-15 21:56:53');
INSERT INTO `category_image` VALUES ('108', 'k', '洋河', '//sale.jd.com/act/AjMKY0b3FzS76O.html', '1', '1', 'group1/M00/00/02/wKh9hFihh7eAC0MoAAAFoLon4eg433.jpg', '1', '2017-02-15 21:56:53', '2017-02-15 21:56:53');
INSERT INTO `category_image` VALUES ('109', 'k', '1', '//sale.jd.com/act/2bFfABMjyQn.html', '2', '1', 'group1/M00/00/02/wKh9hFihh7mAGGaNAAAQIdsKy_s241.jpg', '1', '2017-02-15 21:56:55', '2017-02-15 21:56:55');
INSERT INTO `category_image` VALUES ('11', 'b', '苹果', 'mall.jd.com/index-1000000127.html', '1', '1', 'group1/M00/00/01/wKh9hFihh6SAXFA4AAAGiRRtBjM895.jpg', '1', '2017-02-15 21:56:34', '2017-02-15 21:56:34');
INSERT INTO `category_image` VALUES ('110', 'k', '食品', '//sale.jd.com/act/UldvF0yC76AHem.html?cpdad=1DLSUE', '2', '1', 'group1/M00/00/02/wKh9hFihh7qAVE00AAAUjP4E-RM597.jpg', '1', '2017-02-15 21:56:55', '2017-02-15 21:56:55');
INSERT INTO `category_image` VALUES ('111', 'l', '欧德凯', '//mall.jd.com/index-1000078962.html', '1', '1', 'group1/M00/00/02/wKh9hFihh7uACdqHAAAGc1hW4gk189.jpg', '1', '2017-02-15 21:56:56', '2017-02-15 21:56:56');
INSERT INTO `category_image` VALUES ('112', 'l', '汤恩倍健', '//mall.jd.com/index-1000001243.html', '1', '1', 'group1/M00/00/02/wKh9hFihh7uAJpPTAAAFw-UVkz8138.jpg', '1', '2017-02-15 21:56:57', '2017-02-15 21:56:57');
INSERT INTO `category_image` VALUES ('113', 'l', '正官庄', '//mall.jd.com/index-1000001351.html', '1', '1', 'group1/M00/00/02/wKh9hFihh7uAe2h4AAAGmOqTrsk409.jpg', '1', '2017-02-15 21:56:57', '2017-02-15 21:56:57');
INSERT INTO `category_image` VALUES ('114', 'l', '3M', '//yangshengtangyybj.jd.com/', '1', '1', 'group1/M00/00/02/wKh9hFihh7yAITIdAAAG3PK2fS4324.jpg', '1', '2017-02-15 21:56:58', '2017-02-15 21:56:58');
INSERT INTO `category_image` VALUES ('115', 'l', '冈本', '//item.yiyaojd.com/2808199.html', '1', '1', 'group1/M00/00/02/wKh9hFihh7yAc31gAAAE4mgolz0045.jpg', '1', '2017-02-15 21:56:58', '2017-02-15 21:56:58');
INSERT INTO `category_image` VALUES ('116', 'l', '氧精灵', '//scian.jd.com/', '1', '1', 'group1/M00/00/02/wKh9hFihh7yADhozAAAF2eYgcl4557.jpg', '1', '2017-02-15 21:56:58', '2017-02-15 21:56:58');
INSERT INTO `category_image` VALUES ('117', 'l', '善存', '//mall.jd.com/index-114026.html', '1', '1', 'group1/M00/00/02/wKh9hFihh7yAbAx3AAAFppcXPO4746.jpg', '1', '2017-02-15 21:56:58', '2017-02-15 21:56:58');
INSERT INTO `category_image` VALUES ('118', 'l', '杜蕾斯', '//mall.jd.com/index-1000001491.html', '1', '1', 'group1/M00/00/02/wKh9hFihh72AQdm_AAAFHI2D8nc152.jpg', '1', '2017-02-15 21:56:59', '2017-02-15 21:56:59');
INSERT INTO `category_image` VALUES ('119', 'l', '11', 'sale.jd.com/act/MuNYn3Uqly0d.html?cpdad=1DLSUE', '2', '1', 'group1/M00/00/02/wKh9hFihh72AejemAAAUZaCmx5I063.jpg', '1', '2017-02-15 21:56:59', '2017-02-15 21:56:59');
INSERT INTO `category_image` VALUES ('12', 'b', '魅族', '//meizu.jd.com/', '1', '1', 'group1/M00/00/01/wKh9hFihh6WAPKlsAAAGmuAC4J4056.jpg', '1', '2017-02-15 21:56:35', '2017-02-15 21:56:35');
INSERT INTO `category_image` VALUES ('120', 'l', '1', '//sale.jd.com/act/oDgO0zGlsM.html', '2', '1', 'group1/M00/00/02/wKh9hFihh7-Adg5cAAAK-fZk5RI116.jpg', '1', '2017-02-15 21:57:00', '2017-02-15 21:57:00');
INSERT INTO `category_image` VALUES ('121', 'm', '二十一世纪', '//21cccc.jd.com/', '1', '1', 'group1/M00/00/02/wKh9hFihh7-ATaGfAAAF8l1urbw535.jpg', '1', '2017-02-15 21:57:01', '2017-02-15 21:57:01');
INSERT INTO `category_image` VALUES ('122', 'm', '明天', '//mall.jd.com/index-1000005042.html', '1', '1', 'group1/M00/00/02/wKh9hFihh7-AR1pRAAAFDrQdXSw452.jpg', '1', '2017-02-15 21:57:01', '2017-02-15 21:57:01');
INSERT INTO `category_image` VALUES ('123', 'm', '新东方', '//xdfdy.jd.com/', '1', '1', 'group1/M00/00/02/wKh9hFihh7-AVrovAAAGGTz3JNU337.jpg', '1', '2017-02-15 21:57:01', '2017-02-15 21:57:01');
INSERT INTO `category_image` VALUES ('124', 'm', '博集天卷', '//mall.jd.com/index-1000005647.html', '1', '1', 'group1/M00/00/02/wKh9hFihh7-AKCe5AAAGDplipAo658.jpg', '1', '2017-02-15 21:57:01', '2017-02-15 21:57:01');
INSERT INTO `category_image` VALUES ('125', 'm', '磨铁', '//mtbook.jd.com/', '1', '1', 'group1/M00/00/02/wKh9hFihh7-AKvluAAAGKdzH_TA110.jpg', '1', '2017-02-15 21:57:01', '2017-02-15 21:57:01');
INSERT INTO `category_image` VALUES ('126', 'm', '清华', '//mall.jd.com/index-1000004111.html', '1', '1', 'group1/M00/00/02/wKh9hFihh7-AMSueAAAEgpqah9k832.jpg', '1', '2017-02-15 21:57:01', '2017-02-15 21:57:01');
INSERT INTO `category_image` VALUES ('127', 'm', '机工社', '//mall.jd.com/index-1000004052.html', '1', '1', 'group1/M00/00/02/wKh9hFihh7-AEzWKAAAFNGrHp0c116.jpg', '1', '2017-02-15 21:57:01', '2017-02-15 21:57:01');
INSERT INTO `category_image` VALUES ('128', 'm', '人邮社', '//mall.jd.com/index-1000004566.html', '1', '1', 'group1/M00/00/02/wKh9hFihh8CAXy3bAAAFEB7p-sI751.jpg', '1', '2017-02-15 21:57:02', '2017-02-15 21:57:02');
INSERT INTO `category_image` VALUES ('129', 'm', '1整合', '//book.jd.com/', '2', '1', 'group1/M00/00/02/wKh9hFihh8GACs4GAAAOatHx_cw771.jpg', '1', '2017-02-15 21:57:03', '2017-02-15 21:57:03');
INSERT INTO `category_image` VALUES ('13', 'b', 'jdphone', '//mi.jd.com/', '1', '1', 'group1/M00/00/01/wKh9hFihh6WAeXnPAAAGFe659Hg022.jpg', '1', '2017-02-15 21:56:35', '2017-02-15 21:56:35');
INSERT INTO `category_image` VALUES ('130', 'm', 'pop-图书', '//book.jd.com/popbook.html', '2', '1', 'group1/M00/00/02/wKh9hFihh8KANFykAAAOWjN-B_0483.jpg', '1', '2017-02-15 21:57:04', '2017-02-15 21:57:04');
INSERT INTO `category_image` VALUES ('131', 'n', '火车票', 'train.jd.com/', '1', '1', 'group1/M00/00/02/wKh9hFihh8KANwS7AAAFOc8Q8i0455.jpg', '1', '2017-02-15 21:57:04', '2017-02-15 21:57:04');
INSERT INTO `category_image` VALUES ('132', 'n', '机票', 'jipiao.jd.com/', '1', '1', 'group1/M00/00/02/wKh9hFihh8KAY9ooAAAGmaKtKGw712.jpg', '1', '2017-02-15 21:57:04', '2017-02-15 21:57:04');
INSERT INTO `category_image` VALUES ('133', 'n', '碧桂园', 'bgyhotel.jd.com/', '1', '1', 'group1/M00/00/02/wKh9hFihh8OANOp8AAAFcRdPkR8130.jpg', '1', '2017-02-15 21:57:05', '2017-02-15 21:57:05');
INSERT INTO `category_image` VALUES ('134', 'n', '途家', 'tujia.jd.com/', '1', '1', 'group1/M00/00/02/wKh9hFihh8OACKy3AAAEZO4E1Lw858.jpg', '1', '2017-02-15 21:57:05', '2017-02-15 21:57:05');
INSERT INTO `category_image` VALUES ('135', 'n', '国航', 'jipiao.jd.com/', '1', '1', 'group1/M00/00/02/wKh9hFihh8OAM5jAAAAE5b-Vr0w163.jpg', '1', '2017-02-15 21:57:05', '2017-02-15 21:57:05');
INSERT INTO `category_image` VALUES ('136', 'n', '南航', 'jipiao.jd.com/', '1', '1', 'group1/M00/00/02/wKh9hFihh8SAR4znAACftnohkOE756.jpg', '1', '2017-02-15 21:57:05', '2017-02-15 21:57:05');
INSERT INTO `category_image` VALUES ('137', 'n', '途牛', 'mall.jd.com/index-120386.html', '1', '1', 'group1/M00/00/02/wKh9hFihh8SAChnlAAAGxroYnmA407.jpg', '1', '2017-02-15 21:57:05', '2017-02-15 21:57:05');
INSERT INTO `category_image` VALUES ('138', 'n', '万众旅游', 'mall.jd.com/index-199278.html', '1', '1', 'group1/M00/00/02/wKh9hFihh8SAP8jjAAAFY28v41A266.jpg', '1', '2017-02-15 21:57:06', '2017-02-15 21:57:06');
INSERT INTO `category_image` VALUES ('139', 'n', '机票酒店', 'trip.jd.com', '2', '1', 'group1/M00/00/02/wKh9hFihh9KACu7EAAAVvhqP5J4481.jpg', '1', '2017-02-15 21:57:20', '2017-02-15 21:57:20');
INSERT INTO `category_image` VALUES ('14', 'b', '荣耀', '//honor.jd.com/', '1', '1', 'group1/M00/00/01/wKh9hFihh6WAAHxEAAAFaubsAYE223.jpg', '1', '2017-02-15 21:56:35', '2017-02-15 21:56:35');
INSERT INTO `category_image` VALUES ('140', 'n', '旅游度假', 'mall.jd.com/index-1000075966.html', '2', '1', 'group1/M00/00/02/wKh9hFihh9KAIlTMAAAVih2seyo709.jpg', '1', '2017-02-15 21:57:20', '2017-02-15 21:57:20');
INSERT INTO `category_image` VALUES ('141', 'o', '基金1', '//list.jr.jd.com/fundlist/1-11-112__嘉实基金官方旗舰店.htm', '1', '1', 'group1/M00/00/02/wKh9hFihh9KALHA3AAAGBdz_xlw136.jpg', '1', '2017-02-15 21:57:20', '2017-02-15 21:57:20');
INSERT INTO `category_image` VALUES ('142', 'o', '基金2', '//list.jr.jd.com/fundlist/1-11-112__鹏华基金官方旗舰店.htm', '1', '1', 'group1/M00/00/02/wKh9hFihh9SAMBQcAAAGUOshDs0410.jpg', '1', '2017-02-15 21:57:22', '2017-02-15 21:57:22');
INSERT INTO `category_image` VALUES ('143', 'o', '基金3', '//list.jr.jd.com/fundlist/1-11-112__易方达基金官方旗舰店.htm', '1', '1', 'group1/M00/00/02/wKh9hFihh9SAKWzIAAAFQumMJ9E422.jpg', '1', '2017-02-15 21:57:22', '2017-02-15 21:57:22');
INSERT INTO `category_image` VALUES ('144', 'o', '基金4', '//list.jr.jd.com/fundlist/1-11-112__招商基金官方旗舰店.htm', '1', '1', 'group1/M00/00/02/wKh9hFihh9SAdWDrAAAF1oUqm14790.jpg', '1', '2017-02-15 21:57:22', '2017-02-15 21:57:22');
INSERT INTO `category_image` VALUES ('145', 'o', '赛车', '//fund.jd.com/fundlist/1-11-112__%E5%8D%9A%E6%97%B6%E5%9F%BA%E9%87%91%E5%AE%98%E6%96%B9%E6%97%97%E8%88%B0%E5%BA%97.htm', '1', '1', 'group1/M00/00/02/wKh9hFihh9SANFJ8AAAFzC_dkug190.jpg', '1', '2017-02-15 21:57:22', '2017-02-15 21:57:22');
INSERT INTO `category_image` VALUES ('146', 'o', '基金6', '//sale.jd.com/act/X7YLEKkFPd5G26.html', '1', '1', 'group1/M00/00/02/wKh9hFihh9aAKYbCAAAG03q_bKg119.jpg', '1', '2017-02-15 21:57:23', '2017-02-15 21:57:23');
INSERT INTO `category_image` VALUES ('147', 'o', '基金7', '//list.jr.jd.com/fundlist/1-11-112__中邮创业基金旗舰店.htm', '1', '1', 'group1/M00/00/02/wKh9hFihh9aAFe2eAAAFuymYW2Q748.jpg', '1', '2017-02-15 21:57:24', '2017-02-15 21:57:24');
INSERT INTO `category_image` VALUES ('148', 'o', '基金8', '//list.jr.jd.com/fundlist/1-11-112__华商基金官方店铺.htm', '1', '1', 'group1/M00/00/02/wKh9hFihh9aAKrnwAAAFDs8i9Jo300.jpg', '1', '2017-02-15 21:57:24', '2017-02-15 21:57:24');
INSERT INTO `category_image` VALUES ('149', 'o', '大牌', '//jr.jd.com/buy/index?from=ydfc_01', '2', '1', 'group1/M00/00/02/wKh9hFihh9aALvixAAANaB570LY795.jpg', '1', '2017-02-15 21:57:24', '2017-02-15 21:57:24');
INSERT INTO `category_image` VALUES ('15', 'b', '索尼', '//mall.jd.com/index-1000000921.html', '1', '1', 'group1/M00/00/01/wKh9hFihh6WAWd-LAAAFOWTk-SQ375.jpg', '1', '2017-02-15 21:56:35', '2017-02-15 21:56:35');
INSERT INTO `category_image` VALUES ('150', 'o', '2-众筹测评', 'pingce.jd.com/?from=ydfc_01', '2', '1', 'group1/M00/00/02/wKh9hFihh9aAOsLLAAANbgxCdec796.jpg', '1', '2017-02-15 21:57:24', '2017-02-15 21:57:24');
INSERT INTO `category_image` VALUES ('16', 'b', '佳能', '//mall.jd.com/index-1000000877.html', '1', '1', 'group1/M00/00/01/wKh9hFihh6WAUVDvAAAGDsYJCUc926.jpg', '1', '2017-02-15 21:56:35', '2017-02-15 21:56:35');
INSERT INTO `category_image` VALUES ('17', 'b', '联想', '//lx.jd.com/', '1', '1', 'group1/M00/00/01/wKh9hFihh6WAf0EgAAAGT6Z-RZU492.jpg', '1', '2017-02-15 21:56:35', '2017-02-15 21:56:35');
INSERT INTO `category_image` VALUES ('18', 'b', '娱乐影音-B&O PLAY', '//mall.jd.com/index-1000000529.html', '1', '1', 'group1/M00/00/01/wKh9hFihh6WANtPvAAAFwnarxWI184.jpg', '1', '2017-02-15 21:56:35', '2017-02-15 21:56:35');
INSERT INTO `category_image` VALUES ('19', 'b', '【请记得延期】手机值得买', 'sale.jd.com/act/bLfxi0qoNgW4c.html', '2', '1', 'group1/M00/00/01/wKh9hFihh6WAEPdXAAAMIapNyZs297.jpg', '1', '2017-02-15 21:56:35', '2017-02-15 21:56:35');
INSERT INTO `category_image` VALUES ('2', 'a', '海尔', '//haier.jd.com/', '1', '1', 'group1/M00/00/01/wKh9hFihh6KAFa1eAAAGWBKHsLk349.jpg', '1', '2017-02-15 21:56:32', '2017-02-15 21:56:32');
INSERT INTO `category_image` VALUES ('20', 'b', '2.9-16 玩物尚志', '//sale.jd.com/act/4N8a0fkM3ZdV5.html', '2', '1', 'group1/M00/00/01/wKh9hFihh6WAUO8TAAAQGGVfoiw398.jpg', '1', '2017-02-15 21:56:35', '2017-02-15 21:56:35');
INSERT INTO `category_image` VALUES ('21', 'b', '【勿动】数码频道页', '//shuma.jd.com/', '2', '1', 'group1/M00/00/01/wKh9hFihh6aAAF0aAAAScxVLvsQ514.jpg', '1', '2017-02-15 21:56:36', '2017-02-15 21:56:36');
INSERT INTO `category_image` VALUES ('22', 'c', 'intel', '//mall.jd.com/index-1000007482.html', '1', '1', 'group1/M00/00/01/wKh9hFihh6aAebk5AAAE_4LnCps913.jpg', '1', '2017-02-15 21:56:36', '2017-02-15 21:56:36');
INSERT INTO `category_image` VALUES ('23', 'c', '苹果', '//apple.jd.com/', '1', '1', 'group1/M00/00/01/wKh9hFihh6eAdSeGAAAFNFR1mqg449.jpg', '1', '2017-02-15 21:56:36', '2017-02-15 21:56:36');
INSERT INTO `category_image` VALUES ('24', 'c', '联想', '//lenovo1.jd.com/', '1', '1', 'group1/M00/00/01/wKh9hFihh6eAadJqAAAIXK1DmHY306.jpg', '1', '2017-02-15 21:56:37', '2017-02-15 21:56:37');
INSERT INTO `category_image` VALUES ('25', 'c', '三星', '//mall.jd.com/index-1000000288.html', '1', '1', 'group1/M00/00/01/wKh9hFihh6eAaID6AAAFN-UmNaU192.jpg', '1', '2017-02-15 21:56:37', '2017-02-15 21:56:37');
INSERT INTO `category_image` VALUES ('26', 'c', '360', '//360smart.jd.com/', '1', '1', 'group1/M00/00/01/wKh9hFihh6eAdB5pAAAF6DqXqw0156.jpg', '1', '2017-02-15 21:56:37', '2017-02-15 21:56:37');
INSERT INTO `category_image` VALUES ('27', 'c', '台式机-dell', '//dell.jd.com/?cpdad=1DLSUE', '1', '1', 'group1/M00/00/01/wKh9hFihh6eATP6XAAAF5WmbeLg964.jpg', '1', '2017-02-15 21:56:37', '2017-02-15 21:56:37');
INSERT INTO `category_image` VALUES ('28', 'c', '罗技', '//logitech.jd.com/?cpdad=1DLSUE', '1', '1', 'group1/M00/00/01/wKh9hFihh6eAeuQcAAAFLQhS31I411.jpg', '1', '2017-02-15 21:56:37', '2017-02-15 21:56:37');
INSERT INTO `category_image` VALUES ('29', 'c', '办公-得力', '//deli.jd.com/', '1', '1', 'group1/M00/00/01/wKh9hFihh6eAPy9jAAAFV7tiSJc140.jpg', '1', '2017-02-15 21:56:37', '2017-02-15 21:56:37');
INSERT INTO `category_image` VALUES ('3', 'a', '西门子', '//mall.jd.com/index-1000001421.html', '1', '1', 'group1/M00/00/01/wKh9hFihh6OAJ9kUAAAE-a3CNDQ864.jpg', '1', '2017-02-15 21:56:33', '2017-02-15 21:56:33');
INSERT INTO `category_image` VALUES ('30', 'c', '整机', '//sale.jd.com/act/F5ZurL6zbcN.html', '2', '1', 'group1/M00/00/01/wKh9hFihh6eAU4ZzAAAQRwUu2OE066.jpg', '1', '2017-02-15 21:56:37', '2017-02-15 21:56:37');
INSERT INTO `category_image` VALUES ('31', 'c', '女神频道', '//sale.jd.com/act/5bZGpKtIqVv.html', '2', '1', 'group1/M00/00/01/wKh9hFihh6eAVFIhAAAMzKmk0WI770.jpg', '1', '2017-02-15 21:56:37', '2017-02-15 21:56:37');
INSERT INTO `category_image` VALUES ('32', 'd', '法恩莎', 'mall.jd.com/index-1000001635.html', '1', '1', 'group1/M00/00/01/wKh9hFihh6eADffdAAAEgVAWRPI733.jpg', '1', '2017-02-15 21:56:37', '2017-02-15 21:56:37');
INSERT INTO `category_image` VALUES ('33', 'd', '奥朵', 'mall.jd.com/index-56244.html', '1', '1', 'group1/M00/00/01/wKh9hFihh6eANE2oAAAFp9Cyf_g813.jpg', '1', '2017-02-15 21:56:37', '2017-02-15 21:56:37');
INSERT INTO `category_image` VALUES ('34', 'd', '水星家纺', 'mall.jd.com/index-1000002447.html', '1', '1', 'group1/M00/00/01/wKh9hFihh6iANqZyAAAFxmwj55o978.jpg', '1', '2017-02-15 21:56:37', '2017-02-15 21:56:37');
INSERT INTO `category_image` VALUES ('35', 'd', '罗莱家居', 'nmszs.jd.com', '1', '1', 'group1/M00/00/01/wKh9hFihh6iALzQAAAAH8J0cg0c660.jpg', '1', '2017-02-15 21:56:37', '2017-02-15 21:56:37');
INSERT INTO `category_image` VALUES ('36', 'd', '光明家具', 'mall.jd.com/index-57108.html', '1', '1', 'group1/M00/00/01/wKh9hFihh6iAQCAsAAAGHNG44rI983.jpg', '1', '2017-02-15 21:56:37', '2017-02-15 21:56:37');
INSERT INTO `category_image` VALUES ('37', 'd', '心心相印', 'mall.jd.com/index-96908.html', '1', '1', 'group1/M00/00/01/wKh9hFihh6iAPVIgAAAGL2-BKJg790.jpg', '1', '2017-02-15 21:56:37', '2017-02-15 21:56:37');
INSERT INTO `category_image` VALUES ('38', 'd', '双立人', 'mall.jd.com/index-1000001254.html', '1', '1', 'group1/M00/00/01/wKh9hFihh6iAPyXTAAAF9xkl9LM399.jpg', '1', '2017-02-15 21:56:37', '2017-02-15 21:56:37');
INSERT INTO `category_image` VALUES ('39', 'd', '有住', 'sale.jd.com/act/Etks7GRIpWXQD.html', '1', '1', 'group1/M00/00/01/wKh9hFihh6iAKZbmAAAFV1_Uymc183.jpg', '1', '2017-02-15 21:56:38', '2017-02-15 21:56:38');
INSERT INTO `category_image` VALUES ('4', 'a', '格力', '//mall.jd.com/index-1000003445.html', '1', '1', 'group1/M00/00/01/wKh9hFihh6OARr3aAAAGWIYGlTY908.jpg', '1', '2017-02-15 21:56:33', '2017-02-15 21:56:33');
INSERT INTO `category_image` VALUES ('40', 'd', '圣诞节18', 'isheji.jd.com', '2', '1', 'group1/M00/00/01/wKh9hFihh6iABGs4AAAO1aflQHI356.jpg', '1', '2017-02-15 21:56:38', '2017-02-15 21:56:38');
INSERT INTO `category_image` VALUES ('41', 'd', '2', '//sale.jd.com/act/4DX51Hqk3libVh.html', '2', '1', 'group1/M00/00/01/wKh9hFihh6iAOmrFAAAODQXcWDc984.jpg', '1', '2017-02-15 21:56:38', '2017-02-15 21:56:38');
INSERT INTO `category_image` VALUES ('42', 'e', '1', '//mall.jd.com/index-53379.html', '1', '1', 'group1/M00/00/01/wKh9hFihh6iAMZ4xAAAFEU-SJAU056.jpg', '1', '2017-02-15 21:56:38', '2017-02-15 21:56:38');
INSERT INTO `category_image` VALUES ('43', 'e', '2', '//mall.jd.com/index-56803.html', '1', '1', 'group1/M00/00/01/wKh9hFihh6iAXONFAAAFFc8hfwo707.jpg', '1', '2017-02-15 21:56:38', '2017-02-15 21:56:38');
INSERT INTO `category_image` VALUES ('44', 'e', '3', '//biaoda.jd.com/', '1', '1', 'group1/M00/00/01/wKh9hFihh6qAMQmpAAAGLHiQpAw295.jpg', '1', '2017-02-15 21:56:40', '2017-02-15 21:56:40');
INSERT INTO `category_image` VALUES ('45', 'e', '4', 'https://aimer.jd.com/', '1', '1', 'group1/M00/00/01/wKh9hFihh6qAH3IqAAAFMjQxG-0529.jpg', '1', '2017-02-15 21:56:40', '2017-02-15 21:56:40');
INSERT INTO `category_image` VALUES ('46', 'e', '5', '//deesha.jd.com/', '1', '1', 'group1/M00/00/01/wKh9hFihh6qAdYHMAAAF2cSTE08857.jpg', '1', '2017-02-15 21:56:40', '2017-02-15 21:56:40');
INSERT INTO `category_image` VALUES ('47', 'e', '6', 'https://handuyishe.jd.com/', '1', '1', 'group1/M00/00/01/wKh9hFihh6qAJYMqAAAHAUnRrA4081.jpg', '1', '2017-02-15 21:56:40', '2017-02-15 21:56:40');
INSERT INTO `category_image` VALUES ('48', 'e', '7', '//gxg.jd.com/', '1', '1', 'group1/M00/00/01/wKh9hFihh6qAKyrXAAAGOeTzvyM479.jpg', '1', '2017-02-15 21:56:40', '2017-02-15 21:56:40');
INSERT INTO `category_image` VALUES ('49', 'e', '8', '//gxgjeans.jd.com/', '1', '1', 'group1/M00/00/01/wKh9hFihh6qAEw5vAAAGaeuAmM8766.jpg', '1', '2017-02-15 21:56:40', '2017-02-15 21:56:40');
INSERT INTO `category_image` VALUES ('5', 'a', '九阳', '//mall.jd.com/index-1000001465.html', '1', '1', 'group1/M00/00/01/wKh9hFihh6OAGqC8AAAGwF22bbI221.jpg', '1', '2017-02-15 21:56:33', '2017-02-15 21:56:33');
INSERT INTO `category_image` VALUES ('50', 'e', 'moco', '//mall.jd.com/index-53379.html', '2', '1', 'group1/M00/00/01/wKh9hFihh6qAHqdGAAASGy3i1fc777.jpg', '1', '2017-02-15 21:56:40', '2017-02-15 21:56:40');
INSERT INTO `category_image` VALUES ('51', 'e', '情人节', 'https://sale.jd.com/act/kov0BKRdQh7cL1Zl.html', '2', '1', 'group1/M00/00/01/wKh9hFihh6qAJ2lWAAAObd75f3U678.jpg', '1', '2017-02-15 21:56:40', '2017-02-15 21:56:40');
INSERT INTO `category_image` VALUES ('52', 'f', '左1', '//sale.jd.com/act/xtJ3lmHqeskK.html', '1', '1', 'group1/M00/00/01/wKh9hFihh6uADNrDAAAGicjHMFw915.jpg', '1', '2017-02-15 21:56:41', '2017-02-15 21:56:41');
INSERT INTO `category_image` VALUES ('53', 'f', '右1', '//sale.jd.com/act/HPSwsaOycFGumklb.html', '1', '1', 'group1/M00/00/02/wKh9hFihh6uAOOHfAAAFkZ7eapc821.jpg', '1', '2017-02-15 21:56:41', '2017-02-15 21:56:41');
INSERT INTO `category_image` VALUES ('54', 'f', '后', '//mall.jd.com/index-1000007502.html', '1', '1', 'group1/M00/00/02/wKh9hFihh6uAFi1jAAAEk9JWtWc511.jpg', '1', '2017-02-15 21:56:41', '2017-02-15 21:56:41');
INSERT INTO `category_image` VALUES ('55', 'f', '右2', '//sale.jd.com/act/kj2pmwMuYCrGsK3g.html', '1', '1', 'group1/M00/00/02/wKh9hFihh6uABmTDAAAGUVX5RR0621.jpg', '1', '2017-02-15 21:56:41', '2017-02-15 21:56:41');
INSERT INTO `category_image` VALUES ('56', 'f', '右1', '//sale.jd.com/act/WfwZSMG6n3QpaP2.html', '1', '1', 'group1/M00/00/02/wKh9hFihh6uAX7oUAAAEqppiHfA667.jpg', '1', '2017-02-15 21:56:41', '2017-02-15 21:56:41');
INSERT INTO `category_image` VALUES ('57', 'f', '右3', '//sale.jd.com/act/c0AJyzFO3nR.html', '1', '1', 'group1/M00/00/02/wKh9hFihh6yAfaLQAAAEYP-6PKU099.jpg', '1', '2017-02-15 21:56:41', '2017-02-15 21:56:41');
INSERT INTO `category_image` VALUES ('58', 'f', '丝芙兰', '//sephora.jd.com/', '1', '1', 'group1/M00/00/02/wKh9hFihh6yAS6hBAAAFX7IoAr8089.jpg', '1', '2017-02-15 21:56:41', '2017-02-15 21:56:41');
INSERT INTO `category_image` VALUES ('59', 'f', '右4', '//sale.jd.com/act/YpbxW6P1IA7fM.html', '1', '1', 'group1/M00/00/02/wKh9hFihh6yAVT6EAAAFYp6YxyE814.jpg', '1', '2017-02-15 21:56:41', '2017-02-15 21:56:41');
INSERT INTO `category_image` VALUES ('6', 'a', '飞利浦', '//mall.jd.com/index-1000009041.html', '1', '1', 'group1/M00/00/01/wKh9hFihh6OAL9pjAAAFvGrboLE888.jpg', '1', '2017-02-15 21:56:33', '2017-02-15 21:56:33');
INSERT INTO `category_image` VALUES ('60', 'f', '清洁', '//sale.jd.com/act/avcNYjuP0b.html?cpdad=1DLSUE', '2', '1', 'group1/M00/00/02/wKh9hFihh6yAOZV_AAAT7y7GT24491.jpg', '1', '2017-02-15 21:56:42', '2017-02-15 21:56:42');
INSERT INTO `category_image` VALUES ('61', 'f', '2', '//sale.jd.com/act/PX3uYa0z5IGjo.html', '2', '1', 'group1/M00/00/02/wKh9hFihh6yAavPxAAAOmHRaTqU597.jpg', '1', '2017-02-15 21:56:42', '2017-02-15 21:56:42');
INSERT INTO `category_image` VALUES ('62', 'f', '待命替换', '//sale.jd.com/act/ahu4yHMg8RmZPL.html', '2', '1', 'group1/M00/00/02/wKh9hFihh6yAPZsZAAARKvBn77U146.jpg', '1', '2017-02-15 21:56:42', '2017-02-15 21:56:42');
INSERT INTO `category_image` VALUES ('63', 'g', '爱步', 'mall.jd.com/index-37727.html', '1', '1', 'group1/M00/00/02/wKh9hFihh62AC5lnAAAE0BOhwvg714.jpg', '1', '2017-02-15 21:56:42', '2017-02-15 21:56:42');
INSERT INTO `category_image` VALUES ('64', 'g', '骆驼', '//belle.jd.com/', '1', '1', 'group1/M00/00/02/wKh9hFihh62AV0PkAAAFbwVBOqk922.jpg', '1', '2017-02-15 21:56:43', '2017-02-15 21:56:43');
INSERT INTO `category_image` VALUES ('65', 'g', 'charleskeith', '//mall.jd.com/index-634780.html', '1', '1', 'group1/M00/00/02/wKh9hFihh62AH-1NAAAFaWsqIw4275.jpg', '1', '2017-02-15 21:56:43', '2017-02-15 21:56:43');
INSERT INTO `category_image` VALUES ('66', 'g', '达芙妮', 'mall.jd.com/index-174391.html', '1', '1', 'group1/M00/00/02/wKh9hFihh62ActIlAAAFljeG0F8487.jpg', '1', '2017-02-15 21:56:43', '2017-02-15 21:56:43');
INSERT INTO `category_image` VALUES ('67', 'g', '珂兰', 'ctf.jd.com/', '1', '1', 'group1/M00/00/02/wKh9hFihh62AOdkrAAAGcHn9XKw925.jpg', '1', '2017-02-15 21:56:43', '2017-02-15 21:56:43');
INSERT INTO `category_image` VALUES ('68', 'g', 'GILLIVO', '//guylaroche.jd.com/', '1', '1', 'group1/M00/00/02/wKh9hFihh62ATke9AAAErkoATt0107.jpg', '1', '2017-02-15 21:56:43', '2017-02-15 21:56:43');
INSERT INTO `category_image` VALUES ('69', 'g', '法国大使', '//mall.jd.com/index-143450.html', '1', '1', 'group1/M00/00/02/wKh9hFihh62AXkRwAAAE3MApkPU775.jpg', '1', '2017-02-15 21:56:43', '2017-02-15 21:56:43');
INSERT INTO `category_image` VALUES ('7', 'a', '老板', '//sale.jd.com/act/pN3dJoADOWHu2P.html', '1', '1', 'group1/M00/00/01/wKh9hFihh6OAPUptAAAFixGsBDU477.jpg', '1', '2017-02-15 21:56:33', '2017-02-15 21:56:33');
INSERT INTO `category_image` VALUES ('70', 'g', 'Zoppi', '//sale.jd.com/act/DMsLFIevNa6P7Th.html?cpdad=1DLSUE', '1', '1', 'group1/M00/00/02/wKh9hFihh66ACjo-AAAGG-6H2M8546.jpg', '1', '2017-02-15 21:56:44', '2017-02-15 21:56:44');
INSERT INTO `category_image` VALUES ('71', 'g', '1', 'sale.jd.com/act/uNY30AWITVmQzyJ.html', '2', '1', 'group1/M00/00/02/wKh9hFihh66AKUu5AAAR1an1kgQ937.jpg', '1', '2017-02-15 21:56:44', '2017-02-15 21:56:44');
INSERT INTO `category_image` VALUES ('72', 'g', '新年预热', '//sale.jd.com/act/2ANrcnwIazt.html', '2', '1', 'group1/M00/00/02/wKh9hFihh66AQQmkAAAND4FW8KM741.jpg', '1', '2017-02-15 21:56:44', '2017-02-15 21:56:44');
INSERT INTO `category_image` VALUES ('73', 'h', '耐克', '//channel.jd.com/sports.html', '1', '1', 'group1/M00/00/02/wKh9hFihh6-ANFc7AAAF_a3_MRI925.jpg', '1', '2017-02-15 21:56:45', '2017-02-15 21:56:45');
INSERT INTO `category_image` VALUES ('74', 'h', '阿迪', 'mall.jd.com/index-607805.html', '1', '1', 'group1/M00/00/02/wKh9hFihh6-AIU7rAAAEhVWmMfQ960.jpg', '1', '2017-02-15 21:56:45', '2017-02-15 21:56:45');
INSERT INTO `category_image` VALUES ('75', 'h', '新百伦', '//converse.jd.com', '1', '1', 'group1/M00/00/02/wKh9hFihh6-AT8H5AAAFLyR8e_Q317.jpg', '1', '2017-02-15 21:56:45', '2017-02-15 21:56:45');
INSERT INTO `category_image` VALUES ('76', 'h', 'ASICS', '//columbia.jd.com/', '1', '1', 'group1/M00/00/02/wKh9hFihh7CAYyCSAAAE8FuvaSE830.jpg', '1', '2017-02-15 21:56:46', '2017-02-15 21:56:46');
INSERT INTO `category_image` VALUES ('77', 'h', 'CB哥伦比亚', '//toead.jd.com/', '1', '1', 'group1/M00/00/02/wKh9hFihh7CARc8qAAAGAwJloMw570.jpg', '1', '2017-02-15 21:56:46', '2017-02-15 21:56:46');
INSERT INTO `category_image` VALUES ('78', 'h', '北面TNF', '//mall.jd.com/index-19995.html', '1', '1', 'group1/M00/00/02/wKh9hFihh7CAZNtkAAAGIUMTdsw104.jpg', '1', '2017-02-15 21:56:46', '2017-02-15 21:56:46');
INSERT INTO `category_image` VALUES ('79', 'h', '探路者', '//sale.jd.com/act/lMOjy4LIVCf1.html', '1', '1', 'group1/M00/00/02/wKh9hFihh7CALD6yAAAEvbjbPs8969.jpg', '1', '2017-02-15 21:56:46', '2017-02-15 21:56:46');
INSERT INTO `category_image` VALUES ('8', 'a', '海信电视', '//sale.jd.com/act/2z1RwfWVScyDv73.html', '1', '1', 'group1/M00/00/01/wKh9hFihh6OAMZwKAAAFxJkf_kI318.jpg', '1', '2017-02-15 21:56:33', '2017-02-15 21:56:33');
INSERT INTO `category_image` VALUES ('80', 'h', '狼爪', '//mall.jd.com/index-67067.html', '1', '1', 'group1/M00/00/02/wKh9hFihh7CAUdGuAAAEzwd3iLA237.jpg', '1', '2017-02-15 21:56:46', '2017-02-15 21:56:46');
INSERT INTO `category_image` VALUES ('81', 'h', '运动', '//sale.jd.com/act/S4zLxUpefZC.html', '2', '1', 'group1/M00/00/02/wKh9hFihh7CAYlM0AAARfH-VuDY723.jpg', '1', '2017-02-15 21:56:46', '2017-02-15 21:56:46');
INSERT INTO `category_image` VALUES ('82', 'h', '4', '//sale.jd.com/act/COLZQGP0eD.html', '2', '1', 'group1/M00/00/02/wKh9hFihh7CAdfQVAAATsuA_xGU341.jpg', '1', '2017-02-15 21:56:46', '2017-02-15 21:56:46');
INSERT INTO `category_image` VALUES ('83', 'i', '美孚', '//mall.jd.com/index-1000005670.html', '1', '1', 'group1/M00/00/02/wKh9hFihh7CAWkplAAAFjM5k-jg523.jpg', '1', '2017-02-15 21:56:46', '2017-02-15 21:56:46');
INSERT INTO `category_image` VALUES ('84', 'i', '道达尔', '//mall.jd.com/index-1000004784.html', '1', '1', 'group1/M00/00/02/wKh9hFihh7CAEZjIAAAFXs_F-mo376.jpg', '1', '2017-02-15 21:56:46', '2017-02-15 21:56:46');
INSERT INTO `category_image` VALUES ('85', 'i', '汉高', '//henkel.jd.com/', '1', '1', 'group1/M00/00/02/wKh9hFihh7GABDa8AAAFnENHGIQ801.jpg', '1', '2017-02-15 21:56:47', '2017-02-15 21:56:47');
INSERT INTO `category_image` VALUES ('86', 'i', '壳牌', '//sale.jd.com/act/SNh4GIPpVLlx.html', '1', '1', 'group1/M00/00/02/wKh9hFihh7GAMm9aAAAEnJKv834687.jpg', '1', '2017-02-15 21:56:47', '2017-02-15 21:56:47');
INSERT INTO `category_image` VALUES ('87', 'i', '固特异', '//sale.jd.com/act/FNxMOiej0akgwQZ.html', '1', '1', 'group1/M00/00/02/wKh9hFihh7GACDeMAAAFSpzR1BU491.jpg', '1', '2017-02-15 21:56:47', '2017-02-15 21:56:47');
INSERT INTO `category_image` VALUES ('88', 'i', '铁将军', 'mall.jd.com/index-1000003068.html', '1', '1', 'group1/M00/00/02/wKh9hFihh7GAXANyAAAI4tHN4Uw095.jpg', '1', '2017-02-15 21:56:47', '2017-02-15 21:56:47');
INSERT INTO `category_image` VALUES ('89', 'i', 'GiGi', '//mall.jd.com/index-1000001267.html', '1', '1', 'group1/M00/00/02/wKh9hFihh7GANZn5AAAGWN6e8zw331.jpg', '1', '2017-02-15 21:56:47', '2017-02-15 21:56:47');
INSERT INTO `category_image` VALUES ('9', 'a', '节能补贴', '//sale.jd.com/act/60NWaC1YKX.html', '2', '1', 'group1/M00/00/01/wKh9hFihh6OAIohXAAARjA-LhJ8254.jpg', '1', '2017-02-15 21:56:33', '2017-02-15 21:56:33');
INSERT INTO `category_image` VALUES ('90', 'i', '爱丽思', '//yumacp.jd.com/', '1', '1', 'group1/M00/00/02/wKh9hFihh7GAGsGgAAAEzWH_kqU740.jpg', '1', '2017-02-15 21:56:47', '2017-02-15 21:56:47');
INSERT INTO `category_image` VALUES ('91', 'i', '1', 'sale.jd.com/act/QBYHjtIxWhu.html?cpdad=1DLSUE', '2', '1', 'group1/M00/00/02/wKh9hFihh7GAZjmSAAAQYTtCwtg470.jpg', '1', '2017-02-15 21:56:47', '2017-02-15 21:56:47');
INSERT INTO `category_image` VALUES ('92', 'i', '1', '//sale.jd.com/act/f4cBoH5TNmA28ud.html', '2', '1', 'group1/M00/00/02/wKh9hFihh7KAdT0gAAAPL9Dj2Wk836.jpg', '1', '2017-02-15 21:56:48', '2017-02-15 21:56:48');
INSERT INTO `category_image` VALUES ('93', 'j', '好奇', '//sale.jd.com/act/hG3N4B2nt6XUCA.html', '1', '1', 'group1/M00/00/02/wKh9hFihh7KAboOJAAAFyns2xL8209.jpg', '1', '2017-02-15 21:56:48', '2017-02-15 21:56:48');
INSERT INTO `category_image` VALUES ('94', 'j', '雅培', '//sale.jd.com/act/WZfjBrnxu6Mp.html', '1', '1', 'group1/M00/00/02/wKh9hFihh7KARmjfAAAExA7Z-j0172.jpg', '1', '2017-02-15 21:56:48', '2017-02-15 21:56:48');
INSERT INTO `category_image` VALUES ('95', 'j', '花王', '//sale.jd.com/act/B5g3nLCFom1.html', '1', '1', 'group1/M00/00/02/wKh9hFihh7OAJ1__AAAErmm-6Gs252.jpg', '1', '2017-02-15 21:56:49', '2017-02-15 21:56:49');
INSERT INTO `category_image` VALUES ('96', 'j', '帮宝适', '//sale.jd.com/act/NH1kxKLPs0w.html', '1', '1', 'group1/M00/00/02/wKh9hFihh7OAdL2vAAAENwP0wc0490.jpg', '1', '2017-02-15 21:56:49', '2017-02-15 21:56:49');
INSERT INTO `category_image` VALUES ('97', 'j', '新安怡', '//sale.jd.com/act/toyRM6ZpND.html?t=1461660420892', '1', '1', 'group1/M00/00/02/wKh9hFihh7OAEuqnAAAFQJMIQQk102.jpg', '1', '2017-02-15 21:56:49', '2017-02-15 21:56:49');
INSERT INTO `category_image` VALUES ('98', 'j', 'pop', '//balabala.jd.com/', '1', '1', 'group1/M00/00/02/wKh9hFihh7OARB79AAAGQAIX-1Q712.jpg', '1', '2017-02-15 21:56:49', '2017-02-15 21:56:49');
INSERT INTO `category_image` VALUES ('99', 'j', 'POP', '//sale.jd.com/act/ibX7ydTluPtY1O.html', '1', '1', 'group1/M00/00/02/wKh9hFihh7OAYEj6AAAF1JVVHgE603.jpg', '1', '2017-02-15 21:56:49', '2017-02-15 21:56:49');

-- ----------------------------
-- Table structure for category_secondary
-- ----------------------------
DROP TABLE IF EXISTS `category_secondary`;
CREATE TABLE `category_secondary` (
  `id` varchar(32) NOT NULL COMMENT '类目ID',
  `cid` varchar(32) NOT NULL COMMENT '分类id',
  `parent_id` varchar(32) DEFAULT NULL COMMENT '父类目ID=0时，代表的是一级的类目 ID=-1时表示是cid上部分类',
  `name` varchar(200) DEFAULT NULL COMMENT '名字',
  `url` varchar(200) DEFAULT NULL COMMENT '网址或网页id',
  `status` int(1) DEFAULT '1' COMMENT '状态。可选值:1(正常),2(删除)',
  `sort_order` int(4) DEFAULT '1' COMMENT '排列序号，表示同级类目的展现次序，如数值相等则按名称次序排列。取值范围:大于零的整数',
  `is_parent` tinyint(1) DEFAULT '1' COMMENT '该类目是否为父类目，1为true，0为false',
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `parent_id` (`parent_id`,`status`) USING BTREE,
  KEY `sort_order` (`sort_order`),
  KEY `cid` (`cid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='次级分类';

-- ----------------------------
-- Records of category_secondary
-- ----------------------------
INSERT INTO `category_secondary` VALUES ('1', 'a', '0', '家用电器', 'jiadian.jd.com', '1', '1', '1', '2017-02-15 21:56:33', '2017-02-21 16:00:28');
INSERT INTO `category_secondary` VALUES ('10', 'a', '6', '空调配件', 'list.jd.com/list.html?cat=737,794,877&ev=2664_88741&trans=1&JL=3_%E9%85%8D%E4%BB%B6%E7%B1%BB%E5%9E%8B_%E7%A9%BA%E8%B0%83%E9%85%8D%E4%BB%B6#J_crumbsBar', '1', '1', '0', '2017-02-15 21:56:33', '2017-02-15 21:56:33');
INSERT INTO `category_secondary` VALUES ('100', 'a', '-1', '家电众筹馆', 'sale.jd.com/act/nRIkpl3KqwDU.html#?from=zctgw00050', '1', '1', '1', '2017-02-15 21:56:33', '2017-02-15 21:56:33');
INSERT INTO `category_secondary` VALUES ('1000', 'i', '995', '方向盘套', '6728-6745-13255', '1', '1', '0', '2017-02-15 21:56:48', '2017-02-15 21:56:48');
INSERT INTO `category_secondary` VALUES ('1001', 'i', '995', '头枕腰靠', '6728-6745-11887', '1', '1', '0', '2017-02-15 21:56:48', '2017-02-15 21:56:48');
INSERT INTO `category_secondary` VALUES ('1002', 'i', '995', '香水', '6728-6745-6785', '1', '1', '0', '2017-02-15 21:56:48', '2017-02-15 21:56:48');
INSERT INTO `category_secondary` VALUES ('1003', 'i', '995', '空气净化', '6728-6745-11886', '1', '1', '0', '2017-02-15 21:56:48', '2017-02-15 21:56:48');
INSERT INTO `category_secondary` VALUES ('1004', 'i', '995', '功能小件', '6728-6745-11889', '1', '1', '0', '2017-02-15 21:56:48', '2017-02-15 21:56:48');
INSERT INTO `category_secondary` VALUES ('1005', 'i', '995', '车衣', '6728-6745-6798', '1', '1', '0', '2017-02-15 21:56:48', '2017-02-15 21:56:48');
INSERT INTO `category_secondary` VALUES ('1006', 'i', '995', '挂件摆件', '6728-6745-11888', '1', '1', '0', '2017-02-15 21:56:48', '2017-02-15 21:56:48');
INSERT INTO `category_secondary` VALUES ('1007', 'i', '995', '车身装饰件', '6728-6745-11953', '1', '1', '0', '2017-02-15 21:56:48', '2017-02-15 21:56:48');
INSERT INTO `category_secondary` VALUES ('1008', 'i', '920', '安全自驾', '6728-6747', '1', '1', '1', '2017-02-15 21:56:48', '2017-02-15 21:56:48');
INSERT INTO `category_secondary` VALUES ('1009', 'i', '1008', '安全座椅', '6728-6747-6792', '1', '1', '0', '2017-02-15 21:56:48', '2017-02-15 21:56:48');
INSERT INTO `category_secondary` VALUES ('101', 'b', '0', '手机', 'shouji.jd.com/', '1', '1', '1', '2017-02-15 21:56:36', '2017-02-15 21:56:36');
INSERT INTO `category_secondary` VALUES ('1010', 'i', '1008', '胎压监测', '6728-6747-11954', '1', '1', '0', '2017-02-15 21:56:48', '2017-02-15 21:56:48');
INSERT INTO `category_secondary` VALUES ('1011', 'i', '1008', '充气泵', '6728-6747-12407', '1', '1', '0', '2017-02-15 21:56:48', '2017-02-15 21:56:48');
INSERT INTO `category_secondary` VALUES ('1012', 'i', '1008', '防盗设备', '6728-6747-11955', '1', '1', '0', '2017-02-15 21:56:48', '2017-02-15 21:56:48');
INSERT INTO `category_secondary` VALUES ('1013', 'i', '1008', '应急救援', '6728-6747-6796', '1', '1', '0', '2017-02-15 21:56:48', '2017-02-15 21:56:48');
INSERT INTO `category_secondary` VALUES ('1014', 'i', '1008', '保温箱', '6728-6747-6804', '1', '1', '0', '2017-02-15 21:56:48', '2017-02-15 21:56:48');
INSERT INTO `category_secondary` VALUES ('1015', 'i', '1008', '储物箱', '6728-6747-6801', '1', '1', '0', '2017-02-15 21:56:48', '2017-02-15 21:56:48');
INSERT INTO `category_secondary` VALUES ('1016', 'i', '1008', '自驾野营', '6728-6747-11898', '1', '1', '0', '2017-02-15 21:56:48', '2017-02-15 21:56:48');
INSERT INTO `category_secondary` VALUES ('1017', 'i', '1008', '摩托车装备', '6728-6747-9985', '1', '1', '0', '2017-02-15 21:56:48', '2017-02-15 21:56:48');
INSERT INTO `category_secondary` VALUES ('1018', 'i', '1008', '摩托车', '6728-6747-13270', '1', '1', '0', '2017-02-15 21:56:48', '2017-02-15 21:56:48');
INSERT INTO `category_secondary` VALUES ('1019', 'i', '920', '赛事改装', '6728-13256', '1', '1', '1', '2017-02-15 21:56:48', '2017-02-15 21:56:48');
INSERT INTO `category_secondary` VALUES ('102', 'b', '101', '手机通讯', 'shouji.jd.com', '1', '1', '1', '2017-02-15 21:56:36', '2017-02-15 21:56:36');
INSERT INTO `category_secondary` VALUES ('1020', 'i', '1019', '赛事服装', '6728-13256-13257', '1', '1', '0', '2017-02-15 21:56:48', '2017-02-15 21:56:48');
INSERT INTO `category_secondary` VALUES ('1021', 'i', '1019', '赛事用品', '6728-13256-13258', '1', '1', '0', '2017-02-15 21:56:48', '2017-02-15 21:56:48');
INSERT INTO `category_secondary` VALUES ('1022', 'i', '1019', '制动系统', '6728-13256-13259', '1', '1', '0', '2017-02-15 21:56:48', '2017-02-15 21:56:48');
INSERT INTO `category_secondary` VALUES ('1023', 'i', '1019', '悬挂系统', '6728-13256-13260', '1', '1', '0', '2017-02-15 21:56:48', '2017-02-15 21:56:48');
INSERT INTO `category_secondary` VALUES ('1024', 'i', '1019', '进气系统', '6728-13256-13261', '1', '1', '0', '2017-02-15 21:56:48', '2017-02-15 21:56:48');
INSERT INTO `category_secondary` VALUES ('1025', 'i', '1019', '排气系统', '6728-13256-13262', '1', '1', '0', '2017-02-15 21:56:48', '2017-02-15 21:56:48');
INSERT INTO `category_secondary` VALUES ('1026', 'i', '1019', '电子管理', '6728-13256-13263', '1', '1', '0', '2017-02-15 21:56:48', '2017-02-15 21:56:48');
INSERT INTO `category_secondary` VALUES ('1027', 'i', '1019', '车身强化', '6728-13256-13264', '1', '1', '0', '2017-02-15 21:56:48', '2017-02-15 21:56:48');
INSERT INTO `category_secondary` VALUES ('1028', 'i', '920', '汽车服务', '6728-12402', '1', '1', '1', '2017-02-15 21:56:48', '2017-02-15 21:56:48');
INSERT INTO `category_secondary` VALUES ('1029', 'i', '1028', '油卡充值', 'jiayouka.jd.com', '1', '1', '0', '2017-02-15 21:56:48', '2017-02-15 21:56:48');
INSERT INTO `category_secondary` VALUES ('103', 'b', '102', '手机', '9987-653-655', '1', '1', '0', '2017-02-15 21:56:36', '2017-02-15 21:56:36');
INSERT INTO `category_secondary` VALUES ('1030', 'i', '1028', '加油卡', '6728-12402-13242', '1', '1', '0', '2017-02-15 21:56:48', '2017-02-15 21:56:48');
INSERT INTO `category_secondary` VALUES ('1031', 'i', '1028', '保养维修', '6728-12402-12405', '1', '1', '0', '2017-02-15 21:56:48', '2017-02-15 21:56:48');
INSERT INTO `category_secondary` VALUES ('1032', 'i', '1028', '清洗美容', '6728-12402-12403', '1', '1', '0', '2017-02-15 21:56:48', '2017-02-15 21:56:48');
INSERT INTO `category_secondary` VALUES ('1033', 'i', '1028', '功能升级', '6728-12402-12404', '1', '1', '0', '2017-02-15 21:56:48', '2017-02-15 21:56:48');
INSERT INTO `category_secondary` VALUES ('1034', 'i', '1028', 'ETC', '6728-12402-13266', '1', '1', '0', '2017-02-15 21:56:48', '2017-02-15 21:56:48');
INSERT INTO `category_secondary` VALUES ('1035', 'i', '1028', '驾驶培训', '6728-12402-13267', '1', '1', '0', '2017-02-15 21:56:48', '2017-02-15 21:56:48');
INSERT INTO `category_secondary` VALUES ('1036', 'i', '0', '汽车用品', 'che.jd.com/', '1', '1', '0', '2017-02-15 21:56:48', '2017-02-15 21:56:48');
INSERT INTO `category_secondary` VALUES ('1037', 'i', '-1', '全新汽车', 'car.jd.com/', '1', '1', '1', '2017-02-15 21:56:48', '2017-02-15 21:56:48');
INSERT INTO `category_secondary` VALUES ('1038', 'i', '-1', '车管家', 'autobeta.jd.com/', '1', '1', '1', '2017-02-15 21:56:48', '2017-02-15 21:56:48');
INSERT INTO `category_secondary` VALUES ('1039', 'i', '-1', '旗舰店', 'car.jd.com/channel/', '1', '1', '1', '2017-02-15 21:56:48', '2017-02-15 21:56:48');
INSERT INTO `category_secondary` VALUES ('104', 'b', '102', '对讲机', '9987-653-659', '1', '1', '0', '2017-02-15 21:56:36', '2017-02-15 21:56:36');
INSERT INTO `category_secondary` VALUES ('1040', 'i', '-1', '二手车', 'car.jd.com/ershouche/', '1', '1', '1', '2017-02-15 21:56:48', '2017-02-15 21:56:48');
INSERT INTO `category_secondary` VALUES ('1041', 'i', '-1', '直营店', 'car.jd.com/mall/index.html', '1', '1', '1', '2017-02-15 21:56:48', '2017-02-15 21:56:48');
INSERT INTO `category_secondary` VALUES ('1042', 'i', '-1', '油卡充值', 'jiayouka.jd.com/', '1', '1', '1', '2017-02-15 21:56:48', '2017-02-15 21:56:48');
INSERT INTO `category_secondary` VALUES ('1043', 'j', '0', '母婴', 'baby.jd.com', '1', '1', '1', '2017-02-15 21:56:50', '2017-02-15 21:56:50');
INSERT INTO `category_secondary` VALUES ('1044', 'j', '1043', '奶粉', '1319-1523', '1', '1', '1', '2017-02-15 21:56:50', '2017-02-15 21:56:50');
INSERT INTO `category_secondary` VALUES ('1045', 'j', '1044', '1段', 'list.jd.com/list.html?cat=1319,1523,7052&ev=12212_121497&go=0&JL=2_1_0', '1', '1', '0', '2017-02-15 21:56:50', '2017-02-15 21:56:50');
INSERT INTO `category_secondary` VALUES ('1046', 'j', '1044', '2段', 'list.jd.com/list.html?cat=1319,1523,7052&ev=12212_121498&go=0&JL=2_1_0', '1', '1', '0', '2017-02-15 21:56:50', '2017-02-15 21:56:50');
INSERT INTO `category_secondary` VALUES ('1047', 'j', '1044', '3段', 'list.jd.com/list.html?cat=1319,1523,7052&ev=12212%5F121499&go=0&JL=2_1_0', '1', '1', '0', '2017-02-15 21:56:50', '2017-02-15 21:56:50');
INSERT INTO `category_secondary` VALUES ('1048', 'j', '1044', '4段', 'list.jd.com/list.html?cat=1319,1523,7052&ev=12212%5F121500&go=0&JL=2_1_0', '1', '1', '0', '2017-02-15 21:56:50', '2017-02-15 21:56:50');
INSERT INTO `category_secondary` VALUES ('1049', 'j', '1044', '孕妈奶粉', '1319-1523-7054', '1', '1', '0', '2017-02-15 21:56:50', '2017-02-15 21:56:50');
INSERT INTO `category_secondary` VALUES ('105', 'b', '102', '以旧换新', 'huishou.jd.com', '1', '1', '0', '2017-02-15 21:56:36', '2017-02-15 21:56:36');
INSERT INTO `category_secondary` VALUES ('1050', 'j', '1044', '特殊配方奶粉', 'list.jd.com/list.html?cat=1319,1523,7052&ev=115919%5F651826&go=0&JL=2_1_0', '1', '1', '0', '2017-02-15 21:56:50', '2017-02-15 21:56:50');
INSERT INTO `category_secondary` VALUES ('1051', 'j', '1044', '有机奶粉', 'list.jd.com/list.html?cat=1319,1523,7052&ev=115919%5F651825&go=0&JL=2_1_0', '1', '1', '0', '2017-02-15 21:56:50', '2017-02-15 21:56:50');
INSERT INTO `category_secondary` VALUES ('1052', 'j', '1043', '营养辅食', '1319-1524', '1', '1', '1', '2017-02-15 21:56:50', '2017-02-15 21:56:50');
INSERT INTO `category_secondary` VALUES ('1053', 'j', '1052', '米粉/菜粉', '1319-1524-1533', '1', '1', '0', '2017-02-15 21:56:50', '2017-02-15 21:56:50');
INSERT INTO `category_secondary` VALUES ('1054', 'j', '1052', '面条/粥', '1319-1524-9399', '1', '1', '0', '2017-02-15 21:56:50', '2017-02-15 21:56:50');
INSERT INTO `category_secondary` VALUES ('1055', 'j', '1052', '果泥/果汁', '1319-1524-1534', '1', '1', '0', '2017-02-15 21:56:50', '2017-02-15 21:56:50');
INSERT INTO `category_secondary` VALUES ('1056', 'j', '1052', '益生菌/初乳', '1319-1524-1537', '1', '1', '0', '2017-02-15 21:56:50', '2017-02-15 21:56:50');
INSERT INTO `category_secondary` VALUES ('1057', 'j', '1052', 'DHA', '1319-1524-7055', '1', '1', '0', '2017-02-15 21:56:50', '2017-02-15 21:56:50');
INSERT INTO `category_secondary` VALUES ('1058', 'j', '1052', '钙铁锌/维生素', '1319-1524-1538', '1', '1', '0', '2017-02-15 21:56:50', '2017-02-15 21:56:50');
INSERT INTO `category_secondary` VALUES ('1059', 'j', '1052', '清火/开胃', '1319-1524-1539', '1', '1', '0', '2017-02-15 21:56:50', '2017-02-15 21:56:50');
INSERT INTO `category_secondary` VALUES ('106', 'b', '102', '手机维修', 'weixiu.jd.com', '1', '1', '0', '2017-02-15 21:56:36', '2017-02-15 21:56:36');
INSERT INTO `category_secondary` VALUES ('1060', 'j', '1052', '宝宝零食', '1319-1524-12191', '1', '1', '0', '2017-02-15 21:56:50', '2017-02-15 21:56:50');
INSERT INTO `category_secondary` VALUES ('1061', 'j', '1043', '尿裤湿巾', '1319-1525', '1', '1', '1', '2017-02-15 21:56:50', '2017-02-15 21:56:50');
INSERT INTO `category_secondary` VALUES ('1062', 'j', '1061', 'NB', 'list.jd.com/list.html?cat=1319,1525,7057&ev=3495_16359&sort=sort_rank_asc&trans=1&JL=3_%E5%B0%BA%E7%A0%81_NB#J_crumbsBar', '1', '1', '0', '2017-02-15 21:56:50', '2017-02-15 21:56:50');
INSERT INTO `category_secondary` VALUES ('1063', 'j', '1061', 'S', 'list.jd.com/list.html?cat=1319,1525,7057&ev=3495_35498&sort=sort_rank_asc&trans=1&JL=3_%E5%B0%BA%E7%A0%81_S#J_crumbsBar', '1', '1', '0', '2017-02-15 21:56:50', '2017-02-15 21:56:50');
INSERT INTO `category_secondary` VALUES ('1064', 'j', '1061', 'M', 'list.jd.com/list.html?cat=1319,1525,7057&ev=3495_8338&sort=sort_rank_asc&trans=1&JL=3_%E5%B0%BA%E7%A0%81_M#J_crumbsBar', '1', '1', '0', '2017-02-15 21:56:50', '2017-02-15 21:56:50');
INSERT INTO `category_secondary` VALUES ('1065', 'j', '1061', 'L', 'list.jd.com/list.html?cat=1319,1525,7057&ev=3495_8339&sort=sort_rank_asc&trans=1&JL=3_%E5%B0%BA%E7%A0%81_L#J_crumbsBar', '1', '1', '0', '2017-02-15 21:56:50', '2017-02-15 21:56:50');
INSERT INTO `category_secondary` VALUES ('1066', 'j', '1061', 'XL', 'list.jd.com/list.html?cat=1319,1525,7057&ev=3495_70666&sort=sort_rank_asc&trans=1&JL=3_%E5%B0%BA%E7%A0%81_XL#J_crumbsBar', '1', '1', '0', '2017-02-15 21:56:50', '2017-02-15 21:56:50');
INSERT INTO `category_secondary` VALUES ('1067', 'j', '1061', 'XXL', 'list.jd.com/list.html?cat=1319,1525,7057&ev=3495_68295&sort=sort_rank_asc&trans=1&JL=3_%E5%B0%BA%E7%A0%81_XXL#J_crumbsBar', '1', '1', '0', '2017-02-15 21:56:50', '2017-02-15 21:56:50');
INSERT INTO `category_secondary` VALUES ('1068', 'j', '1061', '拉拉裤', '1319-1525-1546', '1', '1', '0', '2017-02-15 21:56:50', '2017-02-15 21:56:50');
INSERT INTO `category_secondary` VALUES ('1069', 'j', '1061', '成人尿裤', '1319-1525-7058', '1', '1', '0', '2017-02-15 21:56:50', '2017-02-15 21:56:50');
INSERT INTO `category_secondary` VALUES ('107', 'b', '101', '运营商', 'wt.jd.com', '1', '1', '1', '2017-02-15 21:56:36', '2017-02-15 21:56:36');
INSERT INTO `category_secondary` VALUES ('1070', 'j', '1061', '婴儿湿巾', '1319-1525-1548', '1', '1', '0', '2017-02-15 21:56:50', '2017-02-15 21:56:50');
INSERT INTO `category_secondary` VALUES ('1071', 'j', '1043', '喂养用品', '1319-1526', '1', '1', '1', '2017-02-15 21:56:50', '2017-02-15 21:56:50');
INSERT INTO `category_secondary` VALUES ('1072', 'j', '1071', '奶瓶奶嘴', '1319-1526-7060', '1', '1', '0', '2017-02-15 21:56:50', '2017-02-15 21:56:50');
INSERT INTO `category_secondary` VALUES ('1073', 'j', '1071', '吸奶器', '1319-1526-1550', '1', '1', '0', '2017-02-15 21:56:50', '2017-02-15 21:56:50');
INSERT INTO `category_secondary` VALUES ('1074', 'j', '1071', '暖奶消毒', '1319-1526-1551', '1', '1', '0', '2017-02-15 21:56:50', '2017-02-15 21:56:50');
INSERT INTO `category_secondary` VALUES ('1075', 'j', '1071', '辅食料理机', '1319-1526-12197', '1', '1', '0', '2017-02-15 21:56:50', '2017-02-15 21:56:50');
INSERT INTO `category_secondary` VALUES ('1076', 'j', '1071', '牙胶安抚', '1319-1526-1553', '1', '1', '0', '2017-02-15 21:56:50', '2017-02-15 21:56:50');
INSERT INTO `category_secondary` VALUES ('1077', 'j', '1071', '食物存储', '1319-1526-13287', '1', '1', '0', '2017-02-15 21:56:50', '2017-02-15 21:56:50');
INSERT INTO `category_secondary` VALUES ('1078', 'j', '1071', '儿童餐具', '1319-1526-1552', '1', '1', '0', '2017-02-15 21:56:50', '2017-02-15 21:56:50');
INSERT INTO `category_secondary` VALUES ('1079', 'j', '1071', '水壶/水杯', '1319-1526-7061', '1', '1', '0', '2017-02-15 21:56:50', '2017-02-15 21:56:50');
INSERT INTO `category_secondary` VALUES ('108', 'b', '107', '充话费/流量', 'chongzhi.jd.com/', '1', '1', '0', '2017-02-15 21:56:36', '2017-02-15 21:56:36');
INSERT INTO `category_secondary` VALUES ('1080', 'j', '1071', '围兜/防溅衣', '1319-1526-13286', '1', '1', '0', '2017-02-15 21:56:50', '2017-02-15 21:56:50');
INSERT INTO `category_secondary` VALUES ('1081', 'j', '1043', '洗护用品', '1319-1527', '1', '1', '1', '2017-02-15 21:56:50', '2017-02-15 21:56:50');
INSERT INTO `category_secondary` VALUES ('1082', 'j', '1081', '宝宝护肤', '1319-1527-1556', '1', '1', '0', '2017-02-15 21:56:50', '2017-02-15 21:56:50');
INSERT INTO `category_secondary` VALUES ('1083', 'j', '1081', '日常护理', '1319-1527-1559', '1', '1', '0', '2017-02-15 21:56:50', '2017-02-15 21:56:50');
INSERT INTO `category_secondary` VALUES ('1084', 'j', '1081', '洗发沐浴', '1319-1527-1555', '1', '1', '0', '2017-02-15 21:56:50', '2017-02-15 21:56:50');
INSERT INTO `category_secondary` VALUES ('1085', 'j', '1081', '洗澡用具', '1319-1527-13288', '1', '1', '0', '2017-02-15 21:56:50', '2017-02-15 21:56:50');
INSERT INTO `category_secondary` VALUES ('1086', 'j', '1081', '洗衣液/皂', '1319-1527-1557', '1', '1', '0', '2017-02-15 21:56:50', '2017-02-15 21:56:50');
INSERT INTO `category_secondary` VALUES ('1087', 'j', '1081', '理发器', '1319-1527-12341', '1', '1', '0', '2017-02-15 21:56:50', '2017-02-15 21:56:50');
INSERT INTO `category_secondary` VALUES ('1088', 'j', '1081', '婴儿口腔清洁', '1319-1527-13289', '1', '1', '0', '2017-02-15 21:56:50', '2017-02-15 21:56:50');
INSERT INTO `category_secondary` VALUES ('1089', 'j', '1081', '座便器', '1319-1527-1562', '1', '1', '0', '2017-02-15 21:56:50', '2017-02-15 21:56:50');
INSERT INTO `category_secondary` VALUES ('109', 'b', '107', '170选号', 'sale.jd.com/act/BLFcWDiTOrXYdP.html', '1', '1', '0', '2017-02-15 21:56:36', '2017-02-15 21:56:36');
INSERT INTO `category_secondary` VALUES ('1090', 'j', '1081', '驱蚊防晒', '1319-1527-1560', '1', '1', '0', '2017-02-15 21:56:50', '2017-02-15 21:56:50');
INSERT INTO `category_secondary` VALUES ('1091', 'j', '1043', '寝居服饰', '1319-6313', '1', '1', '1', '2017-02-15 21:56:50', '2017-02-15 21:56:50');
INSERT INTO `category_secondary` VALUES ('1092', 'j', '1091', '睡袋/抱被', '1319-6313-13290', '1', '1', '0', '2017-02-15 21:56:50', '2017-02-15 21:56:50');
INSERT INTO `category_secondary` VALUES ('1093', 'j', '1091', '家居床品', '1319-6313-6316', '1', '1', '0', '2017-02-15 21:56:50', '2017-02-15 21:56:50');
INSERT INTO `category_secondary` VALUES ('1094', 'j', '1091', '安全防护', '1319-6313-6317', '1', '1', '0', '2017-02-15 21:56:50', '2017-02-15 21:56:50');
INSERT INTO `category_secondary` VALUES ('1095', 'j', '1091', '爬行垫', '1319-6313-13291', '1', '1', '0', '2017-02-15 21:56:50', '2017-02-15 21:56:50');
INSERT INTO `category_secondary` VALUES ('1096', 'j', '1091', '婴儿内衣', '1319-6313-11234', '1', '1', '0', '2017-02-15 21:56:50', '2017-02-15 21:56:50');
INSERT INTO `category_secondary` VALUES ('1097', 'j', '1091', '婴儿礼盒', '1319-6313-11235', '1', '1', '0', '2017-02-15 21:56:50', '2017-02-15 21:56:50');
INSERT INTO `category_secondary` VALUES ('1098', 'j', '1091', '婴儿鞋帽袜', '1319-6313-6315', '1', '1', '0', '2017-02-15 21:56:50', '2017-02-15 21:56:50');
INSERT INTO `category_secondary` VALUES ('1099', 'j', '1091', '婴儿外出服', '1319-6313-6314', '1', '1', '0', '2017-02-15 21:56:50', '2017-02-15 21:56:50');
INSERT INTO `category_secondary` VALUES ('11', 'a', '1', '洗衣机', 'list.jd.com/list.html?cat=737,794,880', '1', '1', '1', '2017-02-15 21:56:33', '2017-02-15 21:56:33');
INSERT INTO `category_secondary` VALUES ('110', 'b', '107', '合约机', '9987-6880-6881', '1', '1', '0', '2017-02-15 21:56:36', '2017-02-15 21:56:36');
INSERT INTO `category_secondary` VALUES ('1100', 'j', '1043', '妈妈专区', '1319-4997', '1', '1', '1', '2017-02-15 21:56:50', '2017-02-15 21:56:50');
INSERT INTO `category_secondary` VALUES ('1101', 'j', '1100', '防辐射服', '1319-4997-4999', '1', '1', '0', '2017-02-15 21:56:50', '2017-02-15 21:56:50');
INSERT INTO `category_secondary` VALUES ('1102', 'j', '1100', '孕妈装', '1319-4997-4998', '1', '1', '0', '2017-02-15 21:56:50', '2017-02-15 21:56:50');
INSERT INTO `category_secondary` VALUES ('1103', 'j', '1100', '孕妇护肤', '1319-4997-5000', '1', '1', '0', '2017-02-15 21:56:50', '2017-02-15 21:56:50');
INSERT INTO `category_secondary` VALUES ('1104', 'j', '1100', '妈咪包/背婴带', '1319-4997-5002', '1', '1', '0', '2017-02-15 21:56:50', '2017-02-15 21:56:50');
INSERT INTO `category_secondary` VALUES ('1105', 'j', '1100', '待产护理', '1319-4997-12198', '1', '1', '0', '2017-02-15 21:56:50', '2017-02-15 21:56:50');
INSERT INTO `category_secondary` VALUES ('1106', 'j', '1100', '产后塑身', '1319-4997-5001', '1', '1', '0', '2017-02-15 21:56:50', '2017-02-15 21:56:50');
INSERT INTO `category_secondary` VALUES ('1107', 'j', '1100', '文胸/内裤', '1319-4997-7062', '1', '1', '0', '2017-02-15 21:56:50', '2017-02-15 21:56:50');
INSERT INTO `category_secondary` VALUES ('1108', 'j', '1100', '防溢乳垫', '1319-4997-13292', '1', '1', '0', '2017-02-15 21:56:50', '2017-02-15 21:56:50');
INSERT INTO `category_secondary` VALUES ('1109', 'j', '1100', '孕期营养', '1319-4997-6319', '1', '1', '0', '2017-02-15 21:56:50', '2017-02-15 21:56:50');
INSERT INTO `category_secondary` VALUES ('111', 'b', '107', '办套餐', 'sale.jd.com/act/mRZ4HLxoOews3.html', '1', '1', '0', '2017-02-15 21:56:36', '2017-02-15 21:56:36');
INSERT INTO `category_secondary` VALUES ('1110', 'j', '1043', '童车童床', '1319-1528', '1', '1', '1', '2017-02-15 21:56:50', '2017-02-15 21:56:50');
INSERT INTO `category_secondary` VALUES ('1111', 'j', '1110', '安全座椅', '1319-12193-12195', '1', '1', '0', '2017-02-15 21:56:50', '2017-02-15 21:56:50');
INSERT INTO `category_secondary` VALUES ('1112', 'j', '1110', '婴儿推车', '1319-1528-1563', '1', '1', '0', '2017-02-15 21:56:50', '2017-02-15 21:56:50');
INSERT INTO `category_secondary` VALUES ('1113', 'j', '1110', '婴儿床', '1319-1528-1564', '1', '1', '0', '2017-02-15 21:56:50', '2017-02-15 21:56:50');
INSERT INTO `category_secondary` VALUES ('1114', 'j', '1110', '婴儿床垫', '1319-1528-13293', '1', '1', '0', '2017-02-15 21:56:50', '2017-02-15 21:56:50');
INSERT INTO `category_secondary` VALUES ('1115', 'j', '1110', '餐椅', '1319-1528-1565', '1', '1', '0', '2017-02-15 21:56:50', '2017-02-15 21:56:50');
INSERT INTO `category_secondary` VALUES ('1116', 'j', '1110', '学步车', '1319-1528-1568', '1', '1', '0', '2017-02-15 21:56:50', '2017-02-15 21:56:50');
INSERT INTO `category_secondary` VALUES ('1117', 'j', '1110', '三轮车', '1319-1528-1569', '1', '1', '0', '2017-02-15 21:56:50', '2017-02-15 21:56:50');
INSERT INTO `category_secondary` VALUES ('1118', 'j', '1110', '自行车', '1319-1528-1566', '1', '1', '0', '2017-02-15 21:56:50', '2017-02-15 21:56:50');
INSERT INTO `category_secondary` VALUES ('1119', 'j', '1110', '扭扭车', '1319-1528-4702', '1', '1', '0', '2017-02-15 21:56:50', '2017-02-15 21:56:50');
INSERT INTO `category_secondary` VALUES ('112', 'b', '107', '选号码', 'number-eve.jd.com/npc/initPage', '1', '1', '0', '2017-02-15 21:56:36', '2017-02-15 21:56:36');
INSERT INTO `category_secondary` VALUES ('1120', 'j', '1110', '滑板车', '1319-1528-12192', '1', '1', '0', '2017-02-15 21:56:50', '2017-02-15 21:56:50');
INSERT INTO `category_secondary` VALUES ('1121', 'j', '1110', '电动车', '1319-1528-1567', '1', '1', '0', '2017-02-15 21:56:50', '2017-02-15 21:56:50');
INSERT INTO `category_secondary` VALUES ('1122', 'j', '1043', '玩具', 'toy.jd.com/', '1', '1', '1', '2017-02-15 21:56:50', '2017-02-15 21:56:50');
INSERT INTO `category_secondary` VALUES ('1123', 'j', '1122', '适用年龄', '6233-6234', '1', '1', '0', '2017-02-15 21:56:50', '2017-02-15 21:56:50');
INSERT INTO `category_secondary` VALUES ('1124', 'j', '1122', '遥控/电动', '6233-6235', '1', '1', '0', '2017-02-15 21:56:50', '2017-02-15 21:56:50');
INSERT INTO `category_secondary` VALUES ('1125', 'j', '1122', '益智玩具', '6233-6271', '1', '1', '0', '2017-02-15 21:56:50', '2017-02-15 21:56:50');
INSERT INTO `category_secondary` VALUES ('1126', 'j', '1122', '积木拼插', '6233-6275', '1', '1', '0', '2017-02-15 21:56:50', '2017-02-15 21:56:50');
INSERT INTO `category_secondary` VALUES ('1127', 'j', '1122', '动漫玩具', '6233-6264', '1', '1', '0', '2017-02-15 21:56:50', '2017-02-15 21:56:50');
INSERT INTO `category_secondary` VALUES ('1128', 'j', '1122', '毛绒布艺', '6233-6236', '1', '1', '0', '2017-02-15 21:56:50', '2017-02-15 21:56:50');
INSERT INTO `category_secondary` VALUES ('1129', 'j', '1122', '模型玩具', '6233-6253', '1', '1', '0', '2017-02-15 21:56:50', '2017-02-15 21:56:50');
INSERT INTO `category_secondary` VALUES ('113', 'b', '107', '固话宽带', 'list.jd.com/list.html?cat=9987,6880,12428', '1', '1', '0', '2017-02-15 21:56:36', '2017-02-15 21:56:36');
INSERT INTO `category_secondary` VALUES ('1130', 'j', '1122', '健身玩具', '6233-6260', '1', '1', '0', '2017-02-15 21:56:50', '2017-02-15 21:56:50');
INSERT INTO `category_secondary` VALUES ('1131', 'j', '1122', '娃娃玩具', '6233-6237', '1', '1', '0', '2017-02-15 21:56:50', '2017-02-15 21:56:50');
INSERT INTO `category_secondary` VALUES ('1132', 'j', '1122', 'DIY玩具', '6233-6279', '1', '1', '0', '2017-02-15 21:56:50', '2017-02-15 21:56:50');
INSERT INTO `category_secondary` VALUES ('1133', 'j', '1122', '创意减压', '6233-6289', '1', '1', '0', '2017-02-15 21:56:50', '2017-02-15 21:56:50');
INSERT INTO `category_secondary` VALUES ('1134', 'j', '1043', '乐器', '6233-6291', '1', '1', '1', '2017-02-15 21:56:50', '2017-02-15 21:56:50');
INSERT INTO `category_secondary` VALUES ('1135', 'j', '1134', '钢琴', '6233-6291-6294', '1', '1', '0', '2017-02-15 21:56:50', '2017-02-15 21:56:50');
INSERT INTO `category_secondary` VALUES ('1136', 'j', '1134', '电子琴/电钢琴', '6233-6291-6296', '1', '1', '0', '2017-02-15 21:56:50', '2017-02-15 21:56:50');
INSERT INTO `category_secondary` VALUES ('1137', 'j', '1134', '吉他/尤克里里', '6233-6291-6299', '1', '1', '0', '2017-02-15 21:56:50', '2017-02-15 21:56:50');
INSERT INTO `category_secondary` VALUES ('1138', 'j', '1134', '打击乐器', '6233-6291-6303', '1', '1', '0', '2017-02-15 21:56:50', '2017-02-15 21:56:50');
INSERT INTO `category_secondary` VALUES ('1139', 'j', '1134', '西洋管弦', '6233-6291-6301', '1', '1', '0', '2017-02-15 21:56:50', '2017-02-15 21:56:50');
INSERT INTO `category_secondary` VALUES ('114', 'b', '107', '京东通信', 'mobile.jd.com/', '1', '1', '0', '2017-02-15 21:56:36', '2017-02-15 21:56:36');
INSERT INTO `category_secondary` VALUES ('1140', 'j', '1134', '民族乐器', '6233-6291-6300', '1', '1', '0', '2017-02-15 21:56:50', '2017-02-15 21:56:50');
INSERT INTO `category_secondary` VALUES ('1141', 'j', '1134', '乐器配件', '6233-6291-6305', '1', '1', '0', '2017-02-15 21:56:50', '2017-02-15 21:56:50');
INSERT INTO `category_secondary` VALUES ('1142', 'j', '0', '玩具乐器', 'toy.jd.com/', '1', '1', '0', '2017-02-15 21:56:50', '2017-02-15 21:56:50');
INSERT INTO `category_secondary` VALUES ('1143', 'j', '-1', '母婴', 'baby.jd.com/', '1', '1', '1', '2017-02-15 21:56:50', '2017-02-15 21:56:50');
INSERT INTO `category_secondary` VALUES ('1144', 'j', '-1', '玩具乐器', 'channel.jd.com/toys.html', '1', '1', '1', '2017-02-15 21:56:50', '2017-02-15 21:56:50');
INSERT INTO `category_secondary` VALUES ('1145', 'j', '-1', '品牌街', 'sale.jd.com/act/agnAQUpvXGut.html', '1', '1', '1', '2017-02-15 21:56:50', '2017-02-15 21:56:50');
INSERT INTO `category_secondary` VALUES ('1146', 'j', '-1', '亲子馆', 'sale.jd.com/act/UOSVtjLbxND1aGZp.html?cpdad=1DLSUE', '1', '1', '1', '2017-02-15 21:56:50', '2017-02-15 21:56:50');
INSERT INTO `category_secondary` VALUES ('1147', 'j', '-1', '全球购母婴', 'sale.jd.hk/act/8XNYPWVuLF.html', '1', '1', '1', '2017-02-15 21:56:50', '2017-02-15 21:56:50');
INSERT INTO `category_secondary` VALUES ('1148', 'j', '-1', '大牌特卖', 'sale.jd.com/act/kjeYGCqtw7LK1.html', '1', '1', '1', '2017-02-15 21:56:50', '2017-02-15 21:56:50');
INSERT INTO `category_secondary` VALUES ('1149', 'k', '0', '食品', 'channel.jd.com/food.html', '1', '1', '1', '2017-02-15 21:56:55', '2017-02-15 21:56:55');
INSERT INTO `category_secondary` VALUES ('115', 'b', '107', '中国移动', '10086.jd.com', '1', '1', '0', '2017-02-15 21:56:36', '2017-02-15 21:56:36');
INSERT INTO `category_secondary` VALUES ('1150', 'k', '1149', '新鲜水果', 'fresh.jd.com/', '1', '1', '1', '2017-02-15 21:56:55', '2017-02-15 21:56:55');
INSERT INTO `category_secondary` VALUES ('1151', 'k', '1150', '进口水果', 'coll.jd.com/list.html?sub=4523', '1', '1', '0', '2017-02-15 21:56:55', '2017-02-15 21:56:55');
INSERT INTO `category_secondary` VALUES ('1152', 'k', '1150', '国产水果', 'coll.jd.com/list.html?sub=4520', '1', '1', '0', '2017-02-15 21:56:55', '2017-02-15 21:56:55');
INSERT INTO `category_secondary` VALUES ('1153', 'k', '1150', '苹果', '12218-12221-13554', '1', '1', '0', '2017-02-15 21:56:55', '2017-02-15 21:56:55');
INSERT INTO `category_secondary` VALUES ('1154', 'k', '1150', '奇异果', '12218-12221-13556', '1', '1', '0', '2017-02-15 21:56:55', '2017-02-15 21:56:55');
INSERT INTO `category_secondary` VALUES ('1155', 'k', '1150', '车厘子', '12218-12221-13557', '1', '1', '0', '2017-02-15 21:56:55', '2017-02-15 21:56:55');
INSERT INTO `category_secondary` VALUES ('1156', 'k', '1150', '橙子', '12218-12221-13555', '1', '1', '0', '2017-02-15 21:56:55', '2017-02-15 21:56:55');
INSERT INTO `category_secondary` VALUES ('1157', 'k', '1150', '牛油果', '12218-12221-13564', '1', '1', '0', '2017-02-15 21:56:55', '2017-02-15 21:56:55');
INSERT INTO `category_secondary` VALUES ('1158', 'k', '1150', '火龙果', '12218-12221-13560', '1', '1', '0', '2017-02-15 21:56:55', '2017-02-15 21:56:55');
INSERT INTO `category_secondary` VALUES ('1159', 'k', '1150', '榴莲', 'list.jd.com/list.html?cat=12218,12221,13571&ev=1107_71181&trans=1&JL=3_%E5%88%86%E7%B1%BB_%E6%A6%B4%E8%8E%B2#J_crumbsBar', '1', '1', '0', '2017-02-15 21:56:55', '2017-02-15 21:56:55');
INSERT INTO `category_secondary` VALUES ('116', 'b', '107', '中国联通', 'mall.jd.com/index-1000073123.html', '1', '1', '0', '2017-02-15 21:56:36', '2017-02-15 21:56:36');
INSERT INTO `category_secondary` VALUES ('1160', 'k', '1150', '柠檬', '12218-12221-13568', '1', '1', '0', '2017-02-15 21:56:55', '2017-02-15 21:56:55');
INSERT INTO `category_secondary` VALUES ('1161', 'k', '1150', '芒果', '12218-12221-13558', '1', '1', '0', '2017-02-15 21:56:55', '2017-02-15 21:56:55');
INSERT INTO `category_secondary` VALUES ('1162', 'k', '1150', '时令水果', 'coll.jd.com/list.html?sub=2481', '1', '1', '0', '2017-02-15 21:56:55', '2017-02-15 21:56:55');
INSERT INTO `category_secondary` VALUES ('1163', 'k', '1149', '海鲜水产', 'fresh.jd.com/', '1', '1', '1', '2017-02-15 21:56:55', '2017-02-15 21:56:55');
INSERT INTO `category_secondary` VALUES ('1164', 'k', '1163', '虾类', '12218-12222-12242', '1', '1', '0', '2017-02-15 21:56:55', '2017-02-15 21:56:55');
INSERT INTO `category_secondary` VALUES ('1165', 'k', '1163', '鱼类', '12218-12222-12241', '1', '1', '0', '2017-02-15 21:56:55', '2017-02-15 21:56:55');
INSERT INTO `category_secondary` VALUES ('1166', 'k', '1163', '蟹类', '12218-12222-12243', '1', '1', '0', '2017-02-15 21:56:55', '2017-02-15 21:56:55');
INSERT INTO `category_secondary` VALUES ('1167', 'k', '1163', '贝类', '12218-12222-12244', '1', '1', '0', '2017-02-15 21:56:55', '2017-02-15 21:56:55');
INSERT INTO `category_secondary` VALUES ('1168', 'k', '1163', '海参', '12218-12222-12240', '1', '1', '0', '2017-02-15 21:56:55', '2017-02-15 21:56:55');
INSERT INTO `category_secondary` VALUES ('1169', 'k', '1163', '海产干货', '12218-12222-12245', '1', '1', '0', '2017-02-15 21:56:55', '2017-02-15 21:56:55');
INSERT INTO `category_secondary` VALUES ('117', 'b', '107', '中国电信', 'channel.jd.com/telecom.html', '1', '1', '0', '2017-02-15 21:56:36', '2017-02-15 21:56:36');
INSERT INTO `category_secondary` VALUES ('1170', 'k', '1163', '三文鱼', 'list.jd.com/list.html?cat=12218,12222,12241&ev=118298_654244&go=0&JL=3_%E5%88%86%E7%B1%BB_%E4%B8%89%E6%96%87%E9%B1%BC', '1', '1', '0', '2017-02-15 21:56:55', '2017-02-15 21:56:55');
INSERT INTO `category_secondary` VALUES ('1171', 'k', '1163', '北极甜虾', 'list.jd.com/list.html?cat=12218,12222,12242&ev=118289_654181&go=0&JL=3_%E5%88%86%E7%B1%BB_%E5%8C%97%E6%9E%81%E7%94%9C%E8%99%BE', '1', '1', '0', '2017-02-15 21:56:55', '2017-02-15 21:56:55');
INSERT INTO `category_secondary` VALUES ('1172', 'k', '1163', '扇贝', 'list.jd.com/list.html?cat=12218,12222,12244&ev=118263_654058&go=0&JL=3_%E5%88%86%E7%B1%BB_%E6%89%87%E8%B4%9D', '1', '1', '0', '2017-02-15 21:56:55', '2017-02-15 21:56:55');
INSERT INTO `category_secondary` VALUES ('1173', 'k', '1163', '黄花鱼', 'list.jd.com/list.html?cat=12218,12222,12241&ev=1107_86492&trans=1&JL=3_%E5%88%86%E7%B1%BB_%E9%BB%84%E9%B1%BC#J_crumbsBar', '1', '1', '0', '2017-02-15 21:56:55', '2017-02-15 21:56:55');
INSERT INTO `category_secondary` VALUES ('1174', 'k', '1163', '大闸蟹', 'list.jd.com/list.html?cat=12218,12222,12243&ev=118272_654132&JL=3_%E5%88%86%E7%B1%BB_%E5%A4%A7%E9%97%B8%E8%9F%B9#J_crumbsBar', '1', '1', '0', '2017-02-15 21:56:55', '2017-02-15 21:56:55');
INSERT INTO `category_secondary` VALUES ('1175', 'k', '1163', '鲜活水产', 'coll.jd.com/list.html?sub=4685', '1', '1', '0', '2017-02-15 21:56:55', '2017-02-15 21:56:55');
INSERT INTO `category_secondary` VALUES ('1176', 'k', '1149', '肉禽蛋品', 'fresh.jd.com/', '1', '1', '1', '2017-02-15 21:56:55', '2017-02-15 21:56:55');
INSERT INTO `category_secondary` VALUES ('1177', 'k', '1176', '牛肉', '12218-13581-13582', '1', '1', '0', '2017-02-15 21:56:55', '2017-02-15 21:56:55');
INSERT INTO `category_secondary` VALUES ('1178', 'k', '1176', '猪肉', '12218-13581-12247', '1', '1', '0', '2017-02-15 21:56:55', '2017-02-15 21:56:55');
INSERT INTO `category_secondary` VALUES ('1179', 'k', '1176', '羊肉', '12218-13581-13583', '1', '1', '0', '2017-02-15 21:56:55', '2017-02-15 21:56:55');
INSERT INTO `category_secondary` VALUES ('118', 'b', '101', '手机配件', 'channel.jd.com/peijian.html', '1', '1', '1', '2017-02-15 21:56:36', '2017-02-15 21:56:36');
INSERT INTO `category_secondary` VALUES ('1180', 'k', '1176', '鸡肉', '12218-13586-13587', '1', '1', '0', '2017-02-15 21:56:55', '2017-02-15 21:56:55');
INSERT INTO `category_secondary` VALUES ('1181', 'k', '1176', '特色禽类', 'coll.jd.com/list.html?sub=4525', '1', '1', '0', '2017-02-15 21:56:55', '2017-02-15 21:56:55');
INSERT INTO `category_secondary` VALUES ('1182', 'k', '1176', '牛排', 'coll.jd.com/list.html?sub=5392', '1', '1', '0', '2017-02-15 21:56:55', '2017-02-15 21:56:55');
INSERT INTO `category_secondary` VALUES ('1183', 'k', '1176', '牛腩', 'list.jd.com/list.html?cat=12218,13581,13582&ev=118221_653903&go=0&JL=2_1_0', '1', '1', '0', '2017-02-15 21:56:55', '2017-02-15 21:56:55');
INSERT INTO `category_secondary` VALUES ('1184', 'k', '1176', '牛腱', 'list.jd.com/list.html?cat=12218,13581,13582&ev=118221_653904&go=0&JL=2_1_0', '1', '1', '0', '2017-02-15 21:56:55', '2017-02-15 21:56:55');
INSERT INTO `category_secondary` VALUES ('1185', 'k', '1176', '肋排', 'coll.jd.com/list.html?sub=4988', '1', '1', '0', '2017-02-15 21:56:55', '2017-02-15 21:56:55');
INSERT INTO `category_secondary` VALUES ('1186', 'k', '1176', '鸡翅', 'list.jd.com/list.html?cat=12218,13586,13587&ev=118228_653978&go=0&JL=3_%E9%83%A8%E4%BD%8D_%E9%B8%A1%E7%BF%85#J_crumbsBar', '1', '1', '0', '2017-02-15 21:56:55', '2017-02-15 21:56:55');
INSERT INTO `category_secondary` VALUES ('1187', 'k', '1176', '冷鲜肉', 'coll.jd.com/list.html?sub=4686', '1', '1', '0', '2017-02-15 21:56:55', '2017-02-15 21:56:55');
INSERT INTO `category_secondary` VALUES ('1188', 'k', '1176', '咸鸭蛋', 'list.jd.com/list.html?cat=12218,13586,12250&ev=1107_20255&trans=1&JL=3_%E5%88%86%E7%B1%BB_%E9%B8%AD%E8%9B%8B#J_crumbsBar', '1', '1', '0', '2017-02-15 21:56:55', '2017-02-15 21:56:55');
INSERT INTO `category_secondary` VALUES ('1189', 'k', '1176', '鸡蛋', 'list.jd.com/list.html?cat=12218,13586,12250&ev=1107_20254&trans=1&JL=3_%E5%88%86%E7%B1%BB_%E9%B8%A1%E8%9B%8B#J_crumbsBar', '1', '1', '0', '2017-02-15 21:56:55', '2017-02-15 21:56:55');
INSERT INTO `category_secondary` VALUES ('119', 'b', '118', '手机壳', '9987-830-866', '1', '1', '0', '2017-02-15 21:56:36', '2017-02-15 21:56:36');
INSERT INTO `category_secondary` VALUES ('1190', 'k', '1149', '新鲜蔬菜', 'fresh.jd.com/', '1', '1', '1', '2017-02-15 21:56:55', '2017-02-15 21:56:55');
INSERT INTO `category_secondary` VALUES ('1191', 'k', '1190', '根茎类', '12218-13553-13575', '1', '1', '0', '2017-02-15 21:56:55', '2017-02-15 21:56:55');
INSERT INTO `category_secondary` VALUES ('1192', 'k', '1190', '茄果瓜类', '12218-13553-13574', '1', '1', '0', '2017-02-15 21:56:55', '2017-02-15 21:56:55');
INSERT INTO `category_secondary` VALUES ('1193', 'k', '1190', '叶菜类', '12218-13553-13573', '1', '1', '0', '2017-02-15 21:56:55', '2017-02-15 21:56:55');
INSERT INTO `category_secondary` VALUES ('1194', 'k', '1190', '葱姜蒜椒', '12218-13553-13577', '1', '1', '0', '2017-02-15 21:56:55', '2017-02-15 21:56:55');
INSERT INTO `category_secondary` VALUES ('1195', 'k', '1190', '鲜菌菇', '12218-13553-13576', '1', '1', '0', '2017-02-15 21:56:55', '2017-02-15 21:56:55');
INSERT INTO `category_secondary` VALUES ('1196', 'k', '1190', '半加工蔬菜', '12218-13553-13578', '1', '1', '0', '2017-02-15 21:56:55', '2017-02-15 21:56:55');
INSERT INTO `category_secondary` VALUES ('1197', 'k', '1190', '西红柿', 'list.jd.com/list.html?cat=12218,13553,13574&ev=1107_89434&trans=1&JL=3_%E5%88%86%E7%B1%BB_%E8%A5%BF%E7%BA%A2%E6%9F%BF/%E5%9C%A3%E5%A5%B3%E6%9E%9C#J_crumbsBar', '1', '1', '0', '2017-02-15 21:56:55', '2017-02-15 21:56:55');
INSERT INTO `category_secondary` VALUES ('1198', 'k', '1190', '玉米', 'list.jd.com/list.html?cat=12218,13553,13574&ev=118314_654349&go=0&JL=3_%E5%88%86%E7%B1%BB_%E7%8E%89%E7%B1%B3#J_crumbsBar', '1', '1', '0', '2017-02-15 21:56:56', '2017-02-15 21:56:56');
INSERT INTO `category_secondary` VALUES ('1199', 'k', '1190', '山药', 'list.jd.com/list.html?cat=12218,13553,13575&ev=1107_85672&trans=1&JL=3_%E5%88%86%E7%B1%BB_%E5%B1%B1%E8%8D%AF#J_crumbsBar', '1', '1', '0', '2017-02-15 21:56:56', '2017-02-15 21:56:56');
INSERT INTO `category_secondary` VALUES ('12', 'a', '11', '滚筒洗衣机', 'list.jd.com/list.html?cat=737,794,880&ev=998_605429&JL=3_%E4%BA%A7%E5%93%81%E7%B1%BB%E5%9E%8B_%E6%BB%9A%E7%AD%92#J_crumbsBar', '1', '1', '0', '2017-02-15 21:56:33', '2017-02-15 21:56:33');
INSERT INTO `category_secondary` VALUES ('120', 'b', '118', '贴膜', '9987-830-867', '1', '1', '0', '2017-02-15 21:56:36', '2017-02-15 21:56:36');
INSERT INTO `category_secondary` VALUES ('1200', 'k', '1149', '冷饮冻食', 'fresh.jd.com', '1', '1', '1', '2017-02-15 21:56:56', '2017-02-15 21:56:56');
INSERT INTO `category_secondary` VALUES ('1201', 'k', '1200', '水饺', '12218-13591-13592', '1', '1', '0', '2017-02-15 21:56:56', '2017-02-15 21:56:56');
INSERT INTO `category_secondary` VALUES ('1202', 'k', '1200', '面点', '12218-13591-13594', '1', '1', '0', '2017-02-15 21:56:56', '2017-02-15 21:56:56');
INSERT INTO `category_secondary` VALUES ('1203', 'k', '1200', '速冻半成品', '12218-13591-13596', '1', '1', '0', '2017-02-15 21:56:56', '2017-02-15 21:56:56');
INSERT INTO `category_secondary` VALUES ('1204', 'k', '1200', '火锅丸串', '12218-13591-13595', '1', '1', '0', '2017-02-15 21:56:56', '2017-02-15 21:56:56');
INSERT INTO `category_secondary` VALUES ('1205', 'k', '1200', '奶酪/黄油', '12218-13591-13597', '1', '1', '0', '2017-02-15 21:56:56', '2017-02-15 21:56:56');
INSERT INTO `category_secondary` VALUES ('1206', 'k', '1200', '汤圆', '12218-13591-13593', '1', '1', '0', '2017-02-15 21:56:56', '2017-02-15 21:56:56');
INSERT INTO `category_secondary` VALUES ('1207', 'k', '1200', '冰淇淋', '12218-13598-13603', '1', '1', '0', '2017-02-15 21:56:56', '2017-02-15 21:56:56');
INSERT INTO `category_secondary` VALUES ('1208', 'k', '1200', '低温奶', 'coll.jd.com/list.html?sub=4987', '1', '1', '0', '2017-02-15 21:56:56', '2017-02-15 21:56:56');
INSERT INTO `category_secondary` VALUES ('1209', 'k', '1149', '中外名酒', 'channel.jd.com/wine.html', '1', '1', '1', '2017-02-15 21:56:56', '2017-02-15 21:56:56');
INSERT INTO `category_secondary` VALUES ('121', 'b', '118', '手机存储卡', '9987-830-1099', '1', '1', '0', '2017-02-15 21:56:36', '2017-02-15 21:56:36');
INSERT INTO `category_secondary` VALUES ('1210', 'k', '1209', '白酒', '12259-12260-9435', '1', '1', '0', '2017-02-15 21:56:56', '2017-02-15 21:56:56');
INSERT INTO `category_secondary` VALUES ('1211', 'k', '1209', '葡萄酒', '12259-12260-9438', '1', '1', '0', '2017-02-15 21:56:56', '2017-02-15 21:56:56');
INSERT INTO `category_secondary` VALUES ('1212', 'k', '1209', '洋酒', '12259-12260-9437', '1', '1', '0', '2017-02-15 21:56:56', '2017-02-15 21:56:56');
INSERT INTO `category_secondary` VALUES ('1213', 'k', '1209', '啤酒', '12259-12260-9439', '1', '1', '0', '2017-02-15 21:56:56', '2017-02-15 21:56:56');
INSERT INTO `category_secondary` VALUES ('1214', 'k', '1209', '黄酒/养生酒', '12259-12260-9436', '1', '1', '0', '2017-02-15 21:56:56', '2017-02-15 21:56:56');
INSERT INTO `category_secondary` VALUES ('1215', 'k', '1209', '收藏酒/陈年老酒', '12259-12260-12261', '1', '1', '0', '2017-02-15 21:56:56', '2017-02-15 21:56:56');
INSERT INTO `category_secondary` VALUES ('1216', 'k', '1149', '进口食品', '1320-5019', '1', '1', '1', '2017-02-15 21:56:56', '2017-02-15 21:56:56');
INSERT INTO `category_secondary` VALUES ('1217', 'k', '1216', '牛奶', '1320-5019-12215', '1', '1', '0', '2017-02-15 21:56:56', '2017-02-15 21:56:56');
INSERT INTO `category_secondary` VALUES ('1218', 'k', '1216', '饼干蛋糕', '1320-5019-5020', '1', '1', '0', '2017-02-15 21:56:56', '2017-02-15 21:56:56');
INSERT INTO `category_secondary` VALUES ('1219', 'k', '1216', '糖果/巧克力', '1320-5019-5021', '1', '1', '0', '2017-02-15 21:56:56', '2017-02-15 21:56:56');
INSERT INTO `category_secondary` VALUES ('122', 'b', '118', '数据线', '9987-830-13661', '1', '1', '0', '2017-02-15 21:56:36', '2017-02-15 21:56:36');
INSERT INTO `category_secondary` VALUES ('1220', 'k', '1216', '休闲零食', '1320-5019-5022', '1', '1', '0', '2017-02-15 21:56:56', '2017-02-15 21:56:56');
INSERT INTO `category_secondary` VALUES ('1221', 'k', '1216', '冲调饮品', '1320-5019-5023', '1', '1', '0', '2017-02-15 21:56:56', '2017-02-15 21:56:56');
INSERT INTO `category_secondary` VALUES ('1222', 'k', '1216', '粮油调味', '1320-5019-5024', '1', '1', '0', '2017-02-15 21:56:56', '2017-02-15 21:56:56');
INSERT INTO `category_secondary` VALUES ('1223', 'k', '1149', '休闲食品', '1320-1583', '1', '1', '1', '2017-02-15 21:56:56', '2017-02-15 21:56:56');
INSERT INTO `category_secondary` VALUES ('1224', 'k', '1223', '休闲零食', '1320-1583-1590', '1', '1', '0', '2017-02-15 21:56:56', '2017-02-15 21:56:56');
INSERT INTO `category_secondary` VALUES ('1225', 'k', '1223', '坚果炒货', '1320-1583-1591', '1', '1', '0', '2017-02-15 21:56:56', '2017-02-15 21:56:56');
INSERT INTO `category_secondary` VALUES ('1226', 'k', '1223', '肉干肉脯', '1320-1583-1592', '1', '1', '0', '2017-02-15 21:56:56', '2017-02-15 21:56:56');
INSERT INTO `category_secondary` VALUES ('1227', 'k', '1223', '熟食腊味', '1320-1583-13757', '1', '1', '0', '2017-02-15 21:56:56', '2017-02-15 21:56:56');
INSERT INTO `category_secondary` VALUES ('1228', 'k', '1223', '蜜饯果干', '1320-1583-1593', '1', '1', '0', '2017-02-15 21:56:56', '2017-02-15 21:56:56');
INSERT INTO `category_secondary` VALUES ('1229', 'k', '1223', '糖果/巧克力', '1320-1583-1594', '1', '1', '0', '2017-02-15 21:56:56', '2017-02-15 21:56:56');
INSERT INTO `category_secondary` VALUES ('123', 'b', '118', '充电器', '9987-830-13660', '1', '1', '0', '2017-02-15 21:56:36', '2017-02-15 21:56:36');
INSERT INTO `category_secondary` VALUES ('1230', 'k', '1223', '饼干蛋糕', '1320-1583-1595', '1', '1', '0', '2017-02-15 21:56:56', '2017-02-15 21:56:56');
INSERT INTO `category_secondary` VALUES ('1231', 'k', '1223', '无糖食品', '1320-1583-7121', '1', '1', '0', '2017-02-15 21:56:56', '2017-02-15 21:56:56');
INSERT INTO `category_secondary` VALUES ('1232', 'k', '1223', '年货礼盒', 'list.jd.com/list.html?tid=1000090', '1', '1', '0', '2017-02-15 21:56:56', '2017-02-15 21:56:56');
INSERT INTO `category_secondary` VALUES ('1233', 'k', '1149', '地方特产', 'china.jd.com', '1', '1', '1', '2017-02-15 21:56:56', '2017-02-15 21:56:56');
INSERT INTO `category_secondary` VALUES ('1234', 'k', '1233', '新疆', '1320-1581-1589', '1', '1', '0', '2017-02-15 21:56:56', '2017-02-15 21:56:56');
INSERT INTO `category_secondary` VALUES ('1235', 'k', '1233', '四川', '1320-1581-2669', '1', '1', '0', '2017-02-15 21:56:56', '2017-02-15 21:56:56');
INSERT INTO `category_secondary` VALUES ('1236', 'k', '1233', '云南', '1320-1581-2670', '1', '1', '0', '2017-02-15 21:56:56', '2017-02-15 21:56:56');
INSERT INTO `category_secondary` VALUES ('1237', 'k', '1233', '湖南', '1320-1581-2656', '1', '1', '0', '2017-02-15 21:56:56', '2017-02-15 21:56:56');
INSERT INTO `category_secondary` VALUES ('1238', 'k', '1233', '内蒙', '1320-1581-2648', '1', '1', '0', '2017-02-15 21:56:56', '2017-02-15 21:56:56');
INSERT INTO `category_secondary` VALUES ('1239', 'k', '1233', '北京', '1320-1581-2644', '1', '1', '0', '2017-02-15 21:56:56', '2017-02-15 21:56:56');
INSERT INTO `category_secondary` VALUES ('124', 'b', '118', '手机耳机', '9987-830-862', '1', '1', '0', '2017-02-15 21:56:36', '2017-02-15 21:56:36');
INSERT INTO `category_secondary` VALUES ('1240', 'k', '1233', '山西', '1320-1581-2647', '1', '1', '0', '2017-02-15 21:56:56', '2017-02-15 21:56:56');
INSERT INTO `category_secondary` VALUES ('1241', 'k', '1233', '福建', '1320-1581-2653', '1', '1', '0', '2017-02-15 21:56:56', '2017-02-15 21:56:56');
INSERT INTO `category_secondary` VALUES ('1242', 'k', '1233', '东北', '1320-1581-4693', '1', '1', '0', '2017-02-15 21:56:56', '2017-02-15 21:56:56');
INSERT INTO `category_secondary` VALUES ('1243', 'k', '1233', '其他', '1320-1581-12217', '1', '1', '0', '2017-02-15 21:56:56', '2017-02-15 21:56:56');
INSERT INTO `category_secondary` VALUES ('1244', 'k', '1149', '茗茶', '1320-12202', '1', '1', '1', '2017-02-15 21:56:56', '2017-02-15 21:56:56');
INSERT INTO `category_secondary` VALUES ('1245', 'k', '1244', '铁观音', '1320-12202-12203', '1', '1', '0', '2017-02-15 21:56:56', '2017-02-15 21:56:56');
INSERT INTO `category_secondary` VALUES ('1246', 'k', '1244', '普洱', '1320-12202-12204', '1', '1', '0', '2017-02-15 21:56:56', '2017-02-15 21:56:56');
INSERT INTO `category_secondary` VALUES ('1247', 'k', '1244', '龙井', '1320-12202-12205', '1', '1', '0', '2017-02-15 21:56:56', '2017-02-15 21:56:56');
INSERT INTO `category_secondary` VALUES ('1248', 'k', '1244', '绿茶', '1320-12202-12206', '1', '1', '0', '2017-02-15 21:56:56', '2017-02-15 21:56:56');
INSERT INTO `category_secondary` VALUES ('1249', 'k', '1244', '红茶', '1320-12202-12207', '1', '1', '0', '2017-02-15 21:56:56', '2017-02-15 21:56:56');
INSERT INTO `category_secondary` VALUES ('125', 'b', '118', '创意配件', '9987-830-868', '1', '1', '0', '2017-02-15 21:56:36', '2017-02-15 21:56:36');
INSERT INTO `category_secondary` VALUES ('1250', 'k', '1244', '乌龙茶', '1320-12202-12208', '1', '1', '0', '2017-02-15 21:56:56', '2017-02-15 21:56:56');
INSERT INTO `category_secondary` VALUES ('1251', 'k', '1244', '花草茶', '1320-12202-12209', '1', '1', '0', '2017-02-15 21:56:56', '2017-02-15 21:56:56');
INSERT INTO `category_secondary` VALUES ('1252', 'k', '1244', '花果茶', '1320-12202-12210', '1', '1', '0', '2017-02-15 21:56:56', '2017-02-15 21:56:56');
INSERT INTO `category_secondary` VALUES ('1253', 'k', '1244', '黑茶', '1320-12202-12212', '1', '1', '0', '2017-02-15 21:56:56', '2017-02-15 21:56:56');
INSERT INTO `category_secondary` VALUES ('1254', 'k', '1244', '白茶', '1320-12202-12213', '1', '1', '0', '2017-02-15 21:56:56', '2017-02-15 21:56:56');
INSERT INTO `category_secondary` VALUES ('1255', 'k', '1244', '养生茶', '1320-12202-12211', '1', '1', '0', '2017-02-15 21:56:56', '2017-02-15 21:56:56');
INSERT INTO `category_secondary` VALUES ('1256', 'k', '1244', '其他茶', '1320-12202-12214', '1', '1', '0', '2017-02-15 21:56:56', '2017-02-15 21:56:56');
INSERT INTO `category_secondary` VALUES ('1257', 'k', '1149', '饮料冲调', '1320-1585', '1', '1', '1', '2017-02-15 21:56:56', '2017-02-15 21:56:56');
INSERT INTO `category_secondary` VALUES ('1258', 'k', '1257', '牛奶乳品', '1320-1585-9434', '1', '1', '0', '2017-02-15 21:56:56', '2017-02-15 21:56:56');
INSERT INTO `category_secondary` VALUES ('1259', 'k', '1257', '饮料', '1320-1585-1602', '1', '1', '0', '2017-02-15 21:56:56', '2017-02-15 21:56:56');
INSERT INTO `category_secondary` VALUES ('126', 'b', '118', '手机饰品', '9987-830-11302', '1', '1', '0', '2017-02-15 21:56:36', '2017-02-15 21:56:36');
INSERT INTO `category_secondary` VALUES ('1260', 'k', '1257', '饮用水', '1320-1585-10975', '1', '1', '0', '2017-02-15 21:56:56', '2017-02-15 21:56:56');
INSERT INTO `category_secondary` VALUES ('1261', 'k', '1257', '咖啡/奶茶', '1320-1585-3986', '1', '1', '0', '2017-02-15 21:56:56', '2017-02-15 21:56:56');
INSERT INTO `category_secondary` VALUES ('1262', 'k', '1257', '蜂蜜/柚子茶', '1320-1585-12200', '1', '1', '0', '2017-02-15 21:56:56', '2017-02-15 21:56:56');
INSERT INTO `category_secondary` VALUES ('1263', 'k', '1257', '冲饮谷物', '1320-1585-1601', '1', '1', '0', '2017-02-15 21:56:56', '2017-02-15 21:56:56');
INSERT INTO `category_secondary` VALUES ('1264', 'k', '1257', '成人奶粉', '1320-1585-12201', '1', '1', '0', '2017-02-15 21:56:56', '2017-02-15 21:56:56');
INSERT INTO `category_secondary` VALUES ('1265', 'k', '1149', '粮油调味', '1320-1584', '1', '1', '1', '2017-02-15 21:56:56', '2017-02-15 21:56:56');
INSERT INTO `category_secondary` VALUES ('1266', 'k', '1265', '米面杂粮', '1320-1584-2675', '1', '1', '0', '2017-02-15 21:56:56', '2017-02-15 21:56:56');
INSERT INTO `category_secondary` VALUES ('1267', 'k', '1265', '食用油', '1320-1584-2676', '1', '1', '0', '2017-02-15 21:56:56', '2017-02-15 21:56:56');
INSERT INTO `category_secondary` VALUES ('1268', 'k', '1265', '调味品', '1320-1584-2677', '1', '1', '0', '2017-02-15 21:56:56', '2017-02-15 21:56:56');
INSERT INTO `category_secondary` VALUES ('1269', 'k', '1265', '南北干货', '1320-1584-2678', '1', '1', '0', '2017-02-15 21:56:56', '2017-02-15 21:56:56');
INSERT INTO `category_secondary` VALUES ('127', 'b', '118', '手机电池', '9987-830-13657', '1', '1', '0', '2017-02-15 21:56:36', '2017-02-15 21:56:36');
INSERT INTO `category_secondary` VALUES ('1270', 'k', '1265', '方便食品', '1320-1584-2679', '1', '1', '0', '2017-02-15 21:56:56', '2017-02-15 21:56:56');
INSERT INTO `category_secondary` VALUES ('1271', 'k', '1265', '烘焙原料', '1320-1584-13760', '1', '1', '0', '2017-02-15 21:56:56', '2017-02-15 21:56:56');
INSERT INTO `category_secondary` VALUES ('1272', 'k', '1265', '有机食品', '1320-1584-2680', '1', '1', '0', '2017-02-15 21:56:56', '2017-02-15 21:56:56');
INSERT INTO `category_secondary` VALUES ('1273', 'k', '0', '酒类', 'channel.jd.com/wine.html', '1', '1', '0', '2017-02-15 21:56:56', '2017-02-15 21:56:56');
INSERT INTO `category_secondary` VALUES ('1274', 'k', '0', '生鲜', 'fresh.jd.com', '1', '1', '0', '2017-02-15 21:56:56', '2017-02-15 21:56:56');
INSERT INTO `category_secondary` VALUES ('1275', 'k', '0', '特产', 'china.jd.com', '1', '1', '0', '2017-02-15 21:56:56', '2017-02-15 21:56:56');
INSERT INTO `category_secondary` VALUES ('1276', 'k', '-1', '生鲜', 'fresh.jd.com', '1', '1', '1', '2017-02-15 21:56:56', '2017-02-15 21:56:56');
INSERT INTO `category_secondary` VALUES ('1277', 'k', '-1', '食品饮料', 'channel.jd.com/food.html', '1', '1', '1', '2017-02-15 21:56:56', '2017-02-15 21:56:56');
INSERT INTO `category_secondary` VALUES ('1278', 'k', '-1', '酒类', 'channel.jd.com/wine.html', '1', '1', '1', '2017-02-15 21:56:56', '2017-02-15 21:56:56');
INSERT INTO `category_secondary` VALUES ('1279', 'k', '-1', '地方特产', 'china.jd.com', '1', '1', '1', '2017-02-15 21:56:56', '2017-02-15 21:56:56');
INSERT INTO `category_secondary` VALUES ('128', 'b', '118', '苹果周边', '9987-830-13659', '1', '1', '0', '2017-02-15 21:56:36', '2017-02-15 21:56:36');
INSERT INTO `category_secondary` VALUES ('1280', 'k', '-1', '全球购美食', 'sale.jd.com/act/pJ1PEkwL2dZ.html', '1', '1', '1', '2017-02-15 21:56:56', '2017-02-15 21:56:56');
INSERT INTO `category_secondary` VALUES ('1281', 'l', '0', '医药保健', 'health.jd.com', '1', '1', '1', '2017-02-15 21:57:00', '2017-02-15 21:57:00');
INSERT INTO `category_secondary` VALUES ('1282', 'l', '1281', '中西药品', 'yiyao.jd.com', '1', '1', '1', '2017-02-15 21:57:00', '2017-02-15 21:57:00');
INSERT INTO `category_secondary` VALUES ('1283', 'l', '1282', '感冒咳嗽', '9192-12632-12633', '1', '1', '0', '2017-02-15 21:57:00', '2017-02-15 21:57:00');
INSERT INTO `category_secondary` VALUES ('1284', 'l', '1282', '补肾壮阳', '9192-12632-12634', '1', '1', '0', '2017-02-15 21:57:00', '2017-02-15 21:57:00');
INSERT INTO `category_secondary` VALUES ('1285', 'l', '1282', '补气养血', '9192-12632-12635', '1', '1', '0', '2017-02-15 21:57:00', '2017-02-15 21:57:00');
INSERT INTO `category_secondary` VALUES ('1286', 'l', '1282', '止痛镇痛', '9192-12632-12636', '1', '1', '0', '2017-02-15 21:57:00', '2017-02-15 21:57:00');
INSERT INTO `category_secondary` VALUES ('1287', 'l', '1282', '耳鼻喉用药', '9192-12632-12637', '1', '1', '0', '2017-02-15 21:57:00', '2017-02-15 21:57:00');
INSERT INTO `category_secondary` VALUES ('1288', 'l', '1282', '眼科用药', '9192-12632-12638', '1', '1', '0', '2017-02-15 21:57:00', '2017-02-15 21:57:00');
INSERT INTO `category_secondary` VALUES ('1289', 'l', '1282', '口腔用药', '9192-12632-12639', '1', '1', '0', '2017-02-15 21:57:00', '2017-02-15 21:57:00');
INSERT INTO `category_secondary` VALUES ('129', 'b', '118', '移动电源', '9987-830-13658', '1', '1', '0', '2017-02-15 21:56:36', '2017-02-15 21:56:36');
INSERT INTO `category_secondary` VALUES ('1290', 'l', '1282', '皮肤用药', '9192-12632-12640', '1', '1', '0', '2017-02-15 21:57:00', '2017-02-15 21:57:00');
INSERT INTO `category_secondary` VALUES ('1291', 'l', '1282', '肠胃消化', '9192-12632-12641', '1', '1', '0', '2017-02-15 21:57:00', '2017-02-15 21:57:00');
INSERT INTO `category_secondary` VALUES ('1292', 'l', '1282', '风湿骨外伤', '9192-12632-12642', '1', '1', '0', '2017-02-15 21:57:00', '2017-02-15 21:57:00');
INSERT INTO `category_secondary` VALUES ('1293', 'l', '1282', '男科/泌尿', '9192-12632-12643', '1', '1', '0', '2017-02-15 21:57:00', '2017-02-15 21:57:00');
INSERT INTO `category_secondary` VALUES ('1294', 'l', '1282', '妇科用药', '9192-12632-12644', '1', '1', '0', '2017-02-15 21:57:00', '2017-02-15 21:57:00');
INSERT INTO `category_secondary` VALUES ('1295', 'l', '1282', '儿科用药', '9192-12632-12645', '1', '1', '0', '2017-02-15 21:57:00', '2017-02-15 21:57:00');
INSERT INTO `category_secondary` VALUES ('1296', 'l', '1282', '心脑血管', '9192-12632-12646', '1', '1', '0', '2017-02-15 21:57:00', '2017-02-15 21:57:00');
INSERT INTO `category_secondary` VALUES ('1297', 'l', '1282', '肝胆用药', '9192-12632-12647', '1', '1', '0', '2017-02-15 21:57:00', '2017-02-15 21:57:00');
INSERT INTO `category_secondary` VALUES ('1298', 'l', '1281', '营养健康', '9192-9193', '1', '1', '1', '2017-02-15 21:57:00', '2017-02-15 21:57:00');
INSERT INTO `category_secondary` VALUES ('1299', 'l', '1298', '调节免疫', '9192-9193-9201', '1', '1', '0', '2017-02-15 21:57:00', '2017-02-15 21:57:00');
INSERT INTO `category_secondary` VALUES ('13', 'a', '11', '洗烘一体机', 'list.jd.com/list.html?cat=737,794,880&ev=998_5006&JL=3_%E4%BA%A7%E5%93%81%E7%B1%BB%E5%9E%8B_%E6%B4%97%E7%83%98%E4%B8%80%E4%BD%93#J_crumbsBar', '1', '1', '0', '2017-02-15 21:56:33', '2017-02-15 21:56:33');
INSERT INTO `category_secondary` VALUES ('130', 'b', '118', '蓝牙耳机', '9987-830-863', '1', '1', '0', '2017-02-15 21:56:36', '2017-02-15 21:56:36');
INSERT INTO `category_secondary` VALUES ('1300', 'l', '1298', '调节三高', '9192-9193-9203', '1', '1', '0', '2017-02-15 21:57:00', '2017-02-15 21:57:00');
INSERT INTO `category_secondary` VALUES ('1301', 'l', '1298', '缓解疲劳', '9192-9193-12162', '1', '1', '0', '2017-02-15 21:57:00', '2017-02-15 21:57:00');
INSERT INTO `category_secondary` VALUES ('1302', 'l', '1298', '美体塑身', '9192-9193-12163', '1', '1', '0', '2017-02-15 21:57:00', '2017-02-15 21:57:00');
INSERT INTO `category_secondary` VALUES ('1303', 'l', '1298', '美容养颜', '9192-9193-9200', '1', '1', '0', '2017-02-15 21:57:00', '2017-02-15 21:57:00');
INSERT INTO `category_secondary` VALUES ('1304', 'l', '1298', '肝肾养护', '9192-9193-9208', '1', '1', '0', '2017-02-15 21:57:00', '2017-02-15 21:57:00');
INSERT INTO `category_secondary` VALUES ('1305', 'l', '1298', '肠胃养护', '9192-9193-9207', '1', '1', '0', '2017-02-15 21:57:00', '2017-02-15 21:57:00');
INSERT INTO `category_secondary` VALUES ('1306', 'l', '1298', '明目益智', '9192-9193-9205', '1', '1', '0', '2017-02-15 21:57:00', '2017-02-15 21:57:00');
INSERT INTO `category_secondary` VALUES ('1307', 'l', '1298', '骨骼健康', '9192-9193-9202', '1', '1', '0', '2017-02-15 21:57:00', '2017-02-15 21:57:00');
INSERT INTO `category_secondary` VALUES ('1308', 'l', '1298', '改善睡眠', '9192-9193-9209', '1', '1', '0', '2017-02-15 21:57:00', '2017-02-15 21:57:00');
INSERT INTO `category_secondary` VALUES ('1309', 'l', '1298', '抗氧化', '9192-9193-12164', '1', '1', '0', '2017-02-15 21:57:00', '2017-02-15 21:57:00');
INSERT INTO `category_secondary` VALUES ('131', 'b', '118', '手机支架', '9987-830-12811', '1', '1', '0', '2017-02-15 21:56:36', '2017-02-15 21:56:36');
INSERT INTO `category_secondary` VALUES ('1310', 'l', '1298', '耐缺氧', '9192-9193-12165', '1', '1', '0', '2017-02-15 21:57:00', '2017-02-15 21:57:00');
INSERT INTO `category_secondary` VALUES ('1311', 'l', '1281', '营养成分', '9192-9194', '1', '1', '1', '2017-02-15 21:57:00', '2017-02-15 21:57:00');
INSERT INTO `category_secondary` VALUES ('1312', 'l', '1311', '维生素/矿物质', '9192-9194-9216', '1', '1', '0', '2017-02-15 21:57:00', '2017-02-15 21:57:00');
INSERT INTO `category_secondary` VALUES ('1313', 'l', '1311', '蛋白质', '9192-9194-9215', '1', '1', '0', '2017-02-15 21:57:00', '2017-02-15 21:57:00');
INSERT INTO `category_secondary` VALUES ('1314', 'l', '1311', '鱼油/磷脂', '9192-9194-9221', '1', '1', '0', '2017-02-15 21:57:00', '2017-02-15 21:57:00');
INSERT INTO `category_secondary` VALUES ('1315', 'l', '1311', '螺旋藻', '9192-9194-9222', '1', '1', '0', '2017-02-15 21:57:00', '2017-02-15 21:57:00');
INSERT INTO `category_secondary` VALUES ('1316', 'l', '1311', '番茄红素', '9192-9194-9224', '1', '1', '0', '2017-02-15 21:57:00', '2017-02-15 21:57:00');
INSERT INTO `category_secondary` VALUES ('1317', 'l', '1311', '叶酸', '9192-9194-12171', '1', '1', '0', '2017-02-15 21:57:00', '2017-02-15 21:57:00');
INSERT INTO `category_secondary` VALUES ('1318', 'l', '1311', '葡萄籽', '9192-9194-9227', '1', '1', '0', '2017-02-15 21:57:00', '2017-02-15 21:57:00');
INSERT INTO `category_secondary` VALUES ('1319', 'l', '1311', '左旋肉碱', '9192-9194-9214', '1', '1', '0', '2017-02-15 21:57:00', '2017-02-15 21:57:00');
INSERT INTO `category_secondary` VALUES ('132', 'b', '118', '车载配件', '9987-830-864', '1', '1', '0', '2017-02-15 21:56:36', '2017-02-15 21:56:36');
INSERT INTO `category_secondary` VALUES ('1320', 'l', '1311', '辅酶Q10', '9192-9194-9226', '1', '1', '0', '2017-02-15 21:57:00', '2017-02-15 21:57:00');
INSERT INTO `category_secondary` VALUES ('1321', 'l', '1311', '益生菌', '9192-9194-12172', '1', '1', '0', '2017-02-15 21:57:00', '2017-02-15 21:57:00');
INSERT INTO `category_secondary` VALUES ('1322', 'l', '1311', '玛咖', '9192-9194-12173', '1', '1', '0', '2017-02-15 21:57:00', '2017-02-15 21:57:00');
INSERT INTO `category_secondary` VALUES ('1323', 'l', '1311', '膳食纤维', '9192-9194-12174', '1', '1', '0', '2017-02-15 21:57:00', '2017-02-15 21:57:00');
INSERT INTO `category_secondary` VALUES ('1324', 'l', '1311', '牛初乳', '9192-9194-12177', '1', '1', '0', '2017-02-15 21:57:00', '2017-02-15 21:57:00');
INSERT INTO `category_secondary` VALUES ('1325', 'l', '1311', '胶原蛋白', '9192-9194-9225', '1', '1', '0', '2017-02-15 21:57:00', '2017-02-15 21:57:00');
INSERT INTO `category_secondary` VALUES ('1326', 'l', '1311', '大豆异黄酮', '9192-9194-12175', '1', '1', '0', '2017-02-15 21:57:00', '2017-02-15 21:57:00');
INSERT INTO `category_secondary` VALUES ('1327', 'l', '1311', '芦荟提取', '9192-9194-12176', '1', '1', '0', '2017-02-15 21:57:00', '2017-02-15 21:57:00');
INSERT INTO `category_secondary` VALUES ('1328', 'l', '1311', '酵素', '9192-9194-12178', '1', '1', '0', '2017-02-15 21:57:00', '2017-02-15 21:57:00');
INSERT INTO `category_secondary` VALUES ('1329', 'l', '1281', '滋补养生', '9192-9195', '1', '1', '1', '2017-02-15 21:57:00', '2017-02-15 21:57:00');
INSERT INTO `category_secondary` VALUES ('133', 'b', '118', '拍照配件', '9987-830-12809', '1', '1', '0', '2017-02-15 21:56:36', '2017-02-15 21:56:36');
INSERT INTO `category_secondary` VALUES ('1330', 'l', '1329', '阿胶', '9192-9195-12180', '1', '1', '0', '2017-02-15 21:57:00', '2017-02-15 21:57:00');
INSERT INTO `category_secondary` VALUES ('1331', 'l', '1329', '蜂蜜/蜂产品', '9192-9195-12186', '1', '1', '0', '2017-02-15 21:57:00', '2017-02-15 21:57:00');
INSERT INTO `category_secondary` VALUES ('1332', 'l', '1329', '枸杞', '9192-9195-12612', '1', '1', '0', '2017-02-15 21:57:00', '2017-02-15 21:57:00');
INSERT INTO `category_secondary` VALUES ('1333', 'l', '1329', '燕窝', '9192-9195-12179', '1', '1', '0', '2017-02-15 21:57:00', '2017-02-15 21:57:00');
INSERT INTO `category_secondary` VALUES ('1334', 'l', '1329', '海参', '9192-9195-12181', '1', '1', '0', '2017-02-15 21:57:00', '2017-02-15 21:57:00');
INSERT INTO `category_secondary` VALUES ('1335', 'l', '1329', '冬虫夏草', '9192-9195-9229', '1', '1', '0', '2017-02-15 21:57:00', '2017-02-15 21:57:00');
INSERT INTO `category_secondary` VALUES ('1336', 'l', '1329', '人参/西洋参', '9192-9195-9230', '1', '1', '0', '2017-02-15 21:57:00', '2017-02-15 21:57:00');
INSERT INTO `category_secondary` VALUES ('1337', 'l', '1329', '三七', '9192-9195-12613', '1', '1', '0', '2017-02-15 21:57:00', '2017-02-15 21:57:00');
INSERT INTO `category_secondary` VALUES ('1338', 'l', '1329', '鹿茸', '9192-9195-12183', '1', '1', '0', '2017-02-15 21:57:00', '2017-02-15 21:57:00');
INSERT INTO `category_secondary` VALUES ('1339', 'l', '1329', '雪蛤', '9192-9195-12614', '1', '1', '0', '2017-02-15 21:57:00', '2017-02-15 21:57:00');
INSERT INTO `category_secondary` VALUES ('134', 'b', '101', '摄影摄像', '652-654', '1', '1', '1', '2017-02-15 21:56:36', '2017-02-15 21:56:36');
INSERT INTO `category_secondary` VALUES ('1340', 'l', '1329', '青钱柳', '9192-9195-12615', '1', '1', '0', '2017-02-15 21:57:00', '2017-02-15 21:57:00');
INSERT INTO `category_secondary` VALUES ('1341', 'l', '1329', '石斛/枫斗', '9192-9195-12616', '1', '1', '0', '2017-02-15 21:57:00', '2017-02-15 21:57:00');
INSERT INTO `category_secondary` VALUES ('1342', 'l', '1329', '灵芝/孢子粉', '9192-9195-12184', '1', '1', '0', '2017-02-15 21:57:00', '2017-02-15 21:57:00');
INSERT INTO `category_secondary` VALUES ('1343', 'l', '1329', '当归', '9192-9195-12617', '1', '1', '0', '2017-02-15 21:57:00', '2017-02-15 21:57:00');
INSERT INTO `category_secondary` VALUES ('1344', 'l', '1329', '养生茶饮', '9192-9195-12182', '1', '1', '0', '2017-02-15 21:57:00', '2017-02-15 21:57:00');
INSERT INTO `category_secondary` VALUES ('1345', 'l', '1329', '药食同源', '9192-9195-12185', '1', '1', '0', '2017-02-15 21:57:01', '2017-02-15 21:57:01');
INSERT INTO `category_secondary` VALUES ('1346', 'l', '1281', '成人用品', '9192-9196', '1', '1', '1', '2017-02-15 21:57:01', '2017-02-15 21:57:01');
INSERT INTO `category_secondary` VALUES ('1347', 'l', '1346', '安全避孕', '9192-9196-1502', '1', '1', '0', '2017-02-15 21:57:01', '2017-02-15 21:57:01');
INSERT INTO `category_secondary` VALUES ('1348', 'l', '1346', '验孕测孕', '9192-9196-1503', '1', '1', '0', '2017-02-15 21:57:01', '2017-02-15 21:57:01');
INSERT INTO `category_secondary` VALUES ('1349', 'l', '1346', '人体润滑', '9192-9196-1504', '1', '1', '0', '2017-02-15 21:57:01', '2017-02-15 21:57:01');
INSERT INTO `category_secondary` VALUES ('135', 'b', '134', '数码相机', '652-654-831', '1', '1', '0', '2017-02-15 21:56:36', '2017-02-15 21:56:36');
INSERT INTO `category_secondary` VALUES ('1350', 'l', '1346', '男用延时', '9192-9196-12609', '1', '1', '0', '2017-02-15 21:57:01', '2017-02-15 21:57:01');
INSERT INTO `category_secondary` VALUES ('1351', 'l', '1346', '男用器具', '9192-9196-1505', '1', '1', '0', '2017-02-15 21:57:01', '2017-02-15 21:57:01');
INSERT INTO `category_secondary` VALUES ('1352', 'l', '1346', '女用器具', '9192-9196-12610', '1', '1', '0', '2017-02-15 21:57:01', '2017-02-15 21:57:01');
INSERT INTO `category_secondary` VALUES ('1353', 'l', '1346', '情趣内衣', '9192-9196-1506', '1', '1', '0', '2017-02-15 21:57:01', '2017-02-15 21:57:01');
INSERT INTO `category_secondary` VALUES ('1354', 'l', '1281', '保健器械', '9192-9197', '1', '1', '1', '2017-02-15 21:57:01', '2017-02-15 21:57:01');
INSERT INTO `category_secondary` VALUES ('1355', 'l', '1354', '血压计', '9192-9197-12189', '1', '1', '0', '2017-02-15 21:57:01', '2017-02-15 21:57:01');
INSERT INTO `category_secondary` VALUES ('1356', 'l', '1354', '血糖仪', '9192-9197-12187', '1', '1', '0', '2017-02-15 21:57:01', '2017-02-15 21:57:01');
INSERT INTO `category_secondary` VALUES ('1357', 'l', '1354', '血氧仪', '9192-9197-12587', '1', '1', '0', '2017-02-15 21:57:01', '2017-02-15 21:57:01');
INSERT INTO `category_secondary` VALUES ('1358', 'l', '1354', '体温计', '9192-9197-12588', '1', '1', '0', '2017-02-15 21:57:01', '2017-02-15 21:57:01');
INSERT INTO `category_secondary` VALUES ('1359', 'l', '1354', '体重秤', '9192-9197-12589', '1', '1', '0', '2017-02-15 21:57:01', '2017-02-15 21:57:01');
INSERT INTO `category_secondary` VALUES ('136', 'b', '134', '单电/微单相机', '652-654-5012', '1', '1', '0', '2017-02-15 21:56:36', '2017-02-15 21:56:36');
INSERT INTO `category_secondary` VALUES ('1360', 'l', '1354', '胎心仪', '9192-9197-12590', '1', '1', '0', '2017-02-15 21:57:01', '2017-02-15 21:57:01');
INSERT INTO `category_secondary` VALUES ('1361', 'l', '1354', '呼吸制氧', '9192-9197-12188', '1', '1', '0', '2017-02-15 21:57:01', '2017-02-15 21:57:01');
INSERT INTO `category_secondary` VALUES ('1362', 'l', '1354', '雾化器', '9192-9197-12593', '1', '1', '0', '2017-02-15 21:57:01', '2017-02-15 21:57:01');
INSERT INTO `category_secondary` VALUES ('1363', 'l', '1354', '助听器', '9192-9197-12594', '1', '1', '0', '2017-02-15 21:57:01', '2017-02-15 21:57:01');
INSERT INTO `category_secondary` VALUES ('1364', 'l', '1354', '轮椅', '9192-9197-12595', '1', '1', '0', '2017-02-15 21:57:01', '2017-02-15 21:57:01');
INSERT INTO `category_secondary` VALUES ('1365', 'l', '1354', '拐杖', '9192-9197-12596', '1', '1', '0', '2017-02-15 21:57:01', '2017-02-15 21:57:01');
INSERT INTO `category_secondary` VALUES ('1366', 'l', '1354', '中医保健', '9192-9197-1509', '1', '1', '0', '2017-02-15 21:57:01', '2017-02-15 21:57:01');
INSERT INTO `category_secondary` VALUES ('1367', 'l', '1354', '养生器械', '9192-9197-1508', '1', '1', '0', '2017-02-15 21:57:01', '2017-02-15 21:57:01');
INSERT INTO `category_secondary` VALUES ('1368', 'l', '1354', '理疗仪', 'list.jd.com/list.html?cat=9192%2C9197%2C12591&go=0', '1', '1', '0', '2017-02-15 21:57:01', '2017-02-15 21:57:01');
INSERT INTO `category_secondary` VALUES ('1369', 'l', '1354', '家庭护理', '9192-9197-2687', '1', '1', '0', '2017-02-15 21:57:01', '2017-02-15 21:57:01');
INSERT INTO `category_secondary` VALUES ('137', 'b', '134', '单反相机', '652-654-832', '1', '1', '0', '2017-02-15 21:56:36', '2017-02-15 21:56:36');
INSERT INTO `category_secondary` VALUES ('1370', 'l', '1354', '智能健康', '9192-9197-12597', '1', '1', '0', '2017-02-15 21:57:01', '2017-02-15 21:57:01');
INSERT INTO `category_secondary` VALUES ('1371', 'l', '1281', '护理护具', '9192-12190', '1', '1', '1', '2017-02-15 21:57:01', '2017-02-15 21:57:01');
INSERT INTO `category_secondary` VALUES ('1372', 'l', '1371', '隐形眼镜', '9192-12190-12599', '1', '1', '0', '2017-02-15 21:57:01', '2017-02-15 21:57:01');
INSERT INTO `category_secondary` VALUES ('1373', 'l', '1371', '护理液', '9192-12190-12600', '1', '1', '0', '2017-02-15 21:57:01', '2017-02-15 21:57:01');
INSERT INTO `category_secondary` VALUES ('1374', 'l', '1371', '口罩', '9192-12190-1517', '1', '1', '0', '2017-02-15 21:57:01', '2017-02-15 21:57:01');
INSERT INTO `category_secondary` VALUES ('1375', 'l', '1371', '眼罩/耳塞', '9192-12190-12602', '1', '1', '0', '2017-02-15 21:57:01', '2017-02-15 21:57:01');
INSERT INTO `category_secondary` VALUES ('1376', 'l', '1371', '跌打损伤', '9192-12190-1514', '1', '1', '0', '2017-02-15 21:57:01', '2017-02-15 21:57:01');
INSERT INTO `category_secondary` VALUES ('1377', 'l', '1371', '暖贴', '9192-12190-12604', '1', '1', '0', '2017-02-15 21:57:01', '2017-02-15 21:57:01');
INSERT INTO `category_secondary` VALUES ('1378', 'l', '1371', '鼻喉护理', '9192-12190-12605', '1', '1', '0', '2017-02-15 21:57:01', '2017-02-15 21:57:01');
INSERT INTO `category_secondary` VALUES ('1379', 'l', '1371', '眼部保健', '9192-12190-1518', '1', '1', '0', '2017-02-15 21:57:01', '2017-02-15 21:57:01');
INSERT INTO `category_secondary` VALUES ('138', 'b', '134', '拍立得', '652-654-7170', '1', '1', '0', '2017-02-15 21:56:36', '2017-02-15 21:56:36');
INSERT INTO `category_secondary` VALUES ('1380', 'l', '1371', '美体护理', '9192-12190-12607', '1', '1', '0', '2017-02-15 21:57:01', '2017-02-15 21:57:01');
INSERT INTO `category_secondary` VALUES ('1381', 'l', '-1', '专科用药', 'pharma.jd.com', '1', '1', '1', '2017-02-15 21:57:01', '2017-02-15 21:57:01');
INSERT INTO `category_secondary` VALUES ('1382', 'l', '-1', '滋补养生', 'channel.jd.com/9192-9195.html', '1', '1', '1', '2017-02-15 21:57:01', '2017-02-15 21:57:01');
INSERT INTO `category_secondary` VALUES ('1383', 'l', '-1', '膳食补充', 'channel.jd.com/9192-9194.html', '1', '1', '1', '2017-02-15 21:57:01', '2017-02-15 21:57:01');
INSERT INTO `category_secondary` VALUES ('1384', 'l', '-1', '健康监测', 'channel.jd.com/9192-9197.html', '1', '1', '1', '2017-02-15 21:57:01', '2017-02-15 21:57:01');
INSERT INTO `category_secondary` VALUES ('1385', 'l', '-1', '两性情话', 'channel.jd.com/9192-9196.html', '1', '1', '1', '2017-02-15 21:57:01', '2017-02-15 21:57:01');
INSERT INTO `category_secondary` VALUES ('1386', 'l', '-1', '靓眼视界', 'sale.jd.com/act/QTq52MlHso.html', '1', '1', '1', '2017-02-15 21:57:01', '2017-02-15 21:57:01');
INSERT INTO `category_secondary` VALUES ('1387', 'm', '0', '图书', 'book.jd.com/', '1', '1', '1', '2017-02-15 21:57:04', '2017-02-15 21:57:04');
INSERT INTO `category_secondary` VALUES ('1388', 'm', '1387', '音像', 'mvd.jd.com', '1', '1', '1', '2017-02-15 21:57:04', '2017-02-15 21:57:04');
INSERT INTO `category_secondary` VALUES ('1389', 'm', '1388', '音乐', 'mvd.jd.com/music.html', '1', '1', '0', '2017-02-15 21:57:04', '2017-02-15 21:57:04');
INSERT INTO `category_secondary` VALUES ('139', 'b', '134', '运动相机', '652-654-12342', '1', '1', '0', '2017-02-15 21:56:36', '2017-02-15 21:56:36');
INSERT INTO `category_secondary` VALUES ('1390', 'm', '1388', '影视', 'mvd.jd.com/movie.html', '1', '1', '0', '2017-02-15 21:57:04', '2017-02-15 21:57:04');
INSERT INTO `category_secondary` VALUES ('1391', 'm', '1388', '教育音像', 'mvd.jd.com/education.html', '1', '1', '0', '2017-02-15 21:57:04', '2017-02-15 21:57:04');
INSERT INTO `category_secondary` VALUES ('1392', 'm', '1388', '游戏', 'mvd.jd.com/theme/4053-7.html', '1', '1', '0', '2017-02-15 21:57:04', '2017-02-15 21:57:04');
INSERT INTO `category_secondary` VALUES ('1393', 'm', '1388', '影视/动漫周边', 'mvd.jd.com/animation.html', '1', '1', '0', '2017-02-15 21:57:04', '2017-02-15 21:57:04');
INSERT INTO `category_secondary` VALUES ('1394', 'm', '1387', '少儿', 'book.jd.com/children.html', '1', '1', '1', '2017-02-15 21:57:04', '2017-02-15 21:57:04');
INSERT INTO `category_secondary` VALUES ('1395', 'm', '1394', '0-2岁', 'book.jd.com/children0-2.html', '1', '1', '0', '2017-02-15 21:57:04', '2017-02-15 21:57:04');
INSERT INTO `category_secondary` VALUES ('1396', 'm', '1394', '3-6岁', 'book.jd.com/children3-6.html', '1', '1', '0', '2017-02-15 21:57:04', '2017-02-15 21:57:04');
INSERT INTO `category_secondary` VALUES ('1397', 'm', '1394', '7-10岁', 'book.jd.com/children7-10.html', '1', '1', '0', '2017-02-15 21:57:04', '2017-02-15 21:57:04');
INSERT INTO `category_secondary` VALUES ('1398', 'm', '1394', '11-14岁', 'book.jd.com/children11-14.html', '1', '1', '0', '2017-02-15 21:57:04', '2017-02-15 21:57:04');
INSERT INTO `category_secondary` VALUES ('1399', 'm', '1394', '儿童文学', '1713-3263-3394', '1', '1', '0', '2017-02-15 21:57:04', '2017-02-15 21:57:04');
INSERT INTO `category_secondary` VALUES ('14', 'a', '11', '波轮洗衣机', 'list.jd.com/list.html?cat=737,794,880&ev=998_5005&JL=3_%E4%BA%A7%E5%93%81%E7%B1%BB%E5%9E%8B_%E6%B3%A2%E8%BD%AE#J_crumbsBar', '1', '1', '0', '2017-02-15 21:56:33', '2017-02-15 21:56:33');
INSERT INTO `category_secondary` VALUES ('140', 'b', '134', '摄像机', '652-654-833', '1', '1', '0', '2017-02-15 21:56:36', '2017-02-15 21:56:36');
INSERT INTO `category_secondary` VALUES ('1400', 'm', '1394', '绘本', '1713-3263-4761', '1', '1', '0', '2017-02-15 21:57:04', '2017-02-15 21:57:04');
INSERT INTO `category_secondary` VALUES ('1401', 'm', '1394', '科普', '1713-3263-3399', '1', '1', '0', '2017-02-15 21:57:04', '2017-02-15 21:57:04');
INSERT INTO `category_secondary` VALUES ('1402', 'm', '1394', '幼儿启蒙', '1713-3263-3395', '1', '1', '0', '2017-02-15 21:57:04', '2017-02-15 21:57:04');
INSERT INTO `category_secondary` VALUES ('1403', 'm', '1394', '手工游戏', '1713-3263-3396', '1', '1', '0', '2017-02-15 21:57:04', '2017-02-15 21:57:04');
INSERT INTO `category_secondary` VALUES ('1404', 'm', '1394', '智力开发', '1713-3263-3398', '1', '1', '0', '2017-02-15 21:57:04', '2017-02-15 21:57:04');
INSERT INTO `category_secondary` VALUES ('1405', 'm', '1387', '教育', 'book.jd.com/education.html', '1', '1', '1', '2017-02-15 21:57:04', '2017-02-15 21:57:04');
INSERT INTO `category_secondary` VALUES ('1406', 'm', '1405', '教材', '1713-11047', '1', '1', '0', '2017-02-15 21:57:04', '2017-02-15 21:57:04');
INSERT INTO `category_secondary` VALUES ('1407', 'm', '1405', '中小学教辅', '1713-3289', '1', '1', '0', '2017-02-15 21:57:04', '2017-02-15 21:57:04');
INSERT INTO `category_secondary` VALUES ('1408', 'm', '1405', '考试', '1713-3290', '1', '1', '0', '2017-02-15 21:57:04', '2017-02-15 21:57:04');
INSERT INTO `category_secondary` VALUES ('1409', 'm', '1405', '外语学习', '1713-3291', '1', '1', '0', '2017-02-15 21:57:04', '2017-02-15 21:57:04');
INSERT INTO `category_secondary` VALUES ('141', 'b', '134', '镜头', '652-654-834', '1', '1', '0', '2017-02-15 21:56:36', '2017-02-15 21:56:36');
INSERT INTO `category_secondary` VALUES ('1410', 'm', '1405', '字典词典', '1713-3294', '1', '1', '0', '2017-02-15 21:57:04', '2017-02-15 21:57:04');
INSERT INTO `category_secondary` VALUES ('1411', 'm', '1387', '文艺', 'channel.jd.com/p_wenxuezongheguan.html', '1', '1', '1', '2017-02-15 21:57:04', '2017-02-15 21:57:04');
INSERT INTO `category_secondary` VALUES ('1412', 'm', '1411', '小说', '1713-3258', '1', '1', '0', '2017-02-15 21:57:04', '2017-02-15 21:57:04');
INSERT INTO `category_secondary` VALUES ('1413', 'm', '1411', '文学', '1713-3259', '1', '1', '0', '2017-02-15 21:57:04', '2017-02-15 21:57:04');
INSERT INTO `category_secondary` VALUES ('1414', 'm', '1411', '青春文学', '1713-3260', '1', '1', '0', '2017-02-15 21:57:04', '2017-02-15 21:57:04');
INSERT INTO `category_secondary` VALUES ('1415', 'm', '1411', '传记', '1713-3261', '1', '1', '0', '2017-02-15 21:57:04', '2017-02-15 21:57:04');
INSERT INTO `category_secondary` VALUES ('1416', 'm', '1411', '动漫', '1713-3272', '1', '1', '0', '2017-02-15 21:57:04', '2017-02-15 21:57:04');
INSERT INTO `category_secondary` VALUES ('1417', 'm', '1411', '艺术', '1713-3262', '1', '1', '0', '2017-02-15 21:57:04', '2017-02-15 21:57:04');
INSERT INTO `category_secondary` VALUES ('1418', 'm', '1411', '摄影', '1713-12776', '1', '1', '0', '2017-02-15 21:57:04', '2017-02-15 21:57:04');
INSERT INTO `category_secondary` VALUES ('1419', 'm', '1411', '书法', 'list.jd.com/list.html?cat=1713,13627&go=0', '1', '1', '0', '2017-02-15 21:57:04', '2017-02-15 21:57:04');
INSERT INTO `category_secondary` VALUES ('142', 'b', '134', '户外器材', '652-654-12343', '1', '1', '0', '2017-02-15 21:56:36', '2017-02-15 21:56:36');
INSERT INTO `category_secondary` VALUES ('1420', 'm', '1411', '音乐', 'list.jd.com/list.html?cat=1713,13634&go=0', '1', '1', '0', '2017-02-15 21:57:04', '2017-02-15 21:57:04');
INSERT INTO `category_secondary` VALUES ('1421', 'm', '1411', '绘画', 'list.jd.com/list.html?cat=1713,12775&go=0', '1', '1', '0', '2017-02-15 21:57:04', '2017-02-15 21:57:04');
INSERT INTO `category_secondary` VALUES ('1422', 'm', '1387', '经管励志', 'channel.jd.com/p_Comprehensive.html', '1', '1', '1', '2017-02-15 21:57:04', '2017-02-15 21:57:04');
INSERT INTO `category_secondary` VALUES ('1423', 'm', '1422', '管理', '1713-3266', '1', '1', '0', '2017-02-15 21:57:04', '2017-02-15 21:57:04');
INSERT INTO `category_secondary` VALUES ('1424', 'm', '1422', '金融与投资', '1713-3265', '1', '1', '0', '2017-02-15 21:57:04', '2017-02-15 21:57:04');
INSERT INTO `category_secondary` VALUES ('1425', 'm', '1422', '经济', '1713-3264', '1', '1', '0', '2017-02-15 21:57:04', '2017-02-15 21:57:04');
INSERT INTO `category_secondary` VALUES ('1426', 'm', '1422', '励志与成功', '1713-3267', '1', '1', '0', '2017-02-15 21:57:04', '2017-02-15 21:57:04');
INSERT INTO `category_secondary` VALUES ('1427', 'm', '1387', '人文社科', 'book.jd.com/library/socialscience.html', '1', '1', '1', '2017-02-15 21:57:04', '2017-02-15 21:57:04');
INSERT INTO `category_secondary` VALUES ('1428', 'm', '1427', '历史', '1713-3273', '1', '1', '0', '2017-02-15 21:57:04', '2017-02-15 21:57:04');
INSERT INTO `category_secondary` VALUES ('1429', 'm', '1427', '心理学', '1713-3279', '1', '1', '0', '2017-02-15 21:57:04', '2017-02-15 21:57:04');
INSERT INTO `category_secondary` VALUES ('143', 'b', '134', '影棚器材', '652-654-12344', '1', '1', '0', '2017-02-15 21:56:36', '2017-02-15 21:56:36');
INSERT INTO `category_secondary` VALUES ('1430', 'm', '1427', '政治/军事', '1713-3276', '1', '1', '0', '2017-02-15 21:57:04', '2017-02-15 21:57:04');
INSERT INTO `category_secondary` VALUES ('1431', 'm', '1427', '国学/古籍', 'channel.jd.com/p_guoxueguji.html', '1', '1', '0', '2017-02-15 21:57:04', '2017-02-15 21:57:04');
INSERT INTO `category_secondary` VALUES ('1432', 'm', '1427', '哲学/宗教', 'channel.jd.com/p_zhexuezongjiao.html', '1', '1', '0', '2017-02-15 21:57:04', '2017-02-15 21:57:04');
INSERT INTO `category_secondary` VALUES ('1433', 'm', '1427', '社会科学', '1713-3281', '1', '1', '0', '2017-02-15 21:57:04', '2017-02-15 21:57:04');
INSERT INTO `category_secondary` VALUES ('1434', 'm', '1427', '法律', '1713-3277', '1', '1', '0', '2017-02-15 21:57:04', '2017-02-15 21:57:04');
INSERT INTO `category_secondary` VALUES ('1435', 'm', '1427', '文化', '1713-3280', '1', '1', '0', '2017-02-15 21:57:04', '2017-02-15 21:57:04');
INSERT INTO `category_secondary` VALUES ('1436', 'm', '1387', '生活', 'book.jd.com/library/life.html', '1', '1', '1', '2017-02-15 21:57:04', '2017-02-15 21:57:04');
INSERT INTO `category_secondary` VALUES ('1437', 'm', '1436', '育儿/家教', '1713-3270', '1', '1', '0', '2017-02-15 21:57:04', '2017-02-15 21:57:04');
INSERT INTO `category_secondary` VALUES ('1438', 'm', '1436', '孕产/胎教', 'list.jd.com/list.html?cat=1713,13613&go=0', '1', '1', '0', '2017-02-15 21:57:04', '2017-02-15 21:57:04');
INSERT INTO `category_secondary` VALUES ('1439', 'm', '1436', '健身保健', '1713-3269', '1', '1', '0', '2017-02-15 21:57:04', '2017-02-15 21:57:04');
INSERT INTO `category_secondary` VALUES ('144', 'b', '134', '冲印服务', '652-654-12415', '1', '1', '0', '2017-02-15 21:56:36', '2017-02-15 21:56:36');
INSERT INTO `category_secondary` VALUES ('1440', 'm', '1436', '旅游/地图', '1713-3271', '1', '1', '0', '2017-02-15 21:57:04', '2017-02-15 21:57:04');
INSERT INTO `category_secondary` VALUES ('1441', 'm', '1436', '美食', '1713-9278', '1', '1', '0', '2017-02-15 21:57:04', '2017-02-15 21:57:04');
INSERT INTO `category_secondary` VALUES ('1442', 'm', '1436', '时尚美妆', '1713-9291', '1', '1', '0', '2017-02-15 21:57:04', '2017-02-15 21:57:04');
INSERT INTO `category_secondary` VALUES ('1443', 'm', '1436', '家居', '1713-9301', '1', '1', '0', '2017-02-15 21:57:04', '2017-02-15 21:57:04');
INSERT INTO `category_secondary` VALUES ('1444', 'm', '1436', '手工DIY', '1713-9314-9315', '1', '1', '0', '2017-02-15 21:57:04', '2017-02-15 21:57:04');
INSERT INTO `category_secondary` VALUES ('1445', 'm', '1436', '两性', '1713-9309', '1', '1', '0', '2017-02-15 21:57:04', '2017-02-15 21:57:04');
INSERT INTO `category_secondary` VALUES ('1446', 'm', '1436', '体育', '1713-3288', '1', '1', '0', '2017-02-15 21:57:04', '2017-02-15 21:57:04');
INSERT INTO `category_secondary` VALUES ('1447', 'm', '1387', '科技', 'book.jd.com/library/science.html', '1', '1', '1', '2017-02-15 21:57:04', '2017-02-15 21:57:04');
INSERT INTO `category_secondary` VALUES ('1448', 'm', '1447', '计算机与互联网', '1713-3287', '1', '1', '0', '2017-02-15 21:57:04', '2017-02-15 21:57:04');
INSERT INTO `category_secondary` VALUES ('1449', 'm', '1447', '科普', 'book.jd.com/popscicence.html', '1', '1', '0', '2017-02-15 21:57:04', '2017-02-15 21:57:04');
INSERT INTO `category_secondary` VALUES ('145', 'b', '134', '数码相框', '652-654-844', '1', '1', '0', '2017-02-15 21:56:36', '2017-02-15 21:56:36');
INSERT INTO `category_secondary` VALUES ('1450', 'm', '1447', '建筑', '1713-3284', '1', '1', '0', '2017-02-15 21:57:04', '2017-02-15 21:57:04');
INSERT INTO `category_secondary` VALUES ('1451', 'm', '1447', '工业技术', '1713-3282', '1', '1', '0', '2017-02-15 21:57:04', '2017-02-15 21:57:04');
INSERT INTO `category_secondary` VALUES ('1452', 'm', '1447', '电子/通信', '1713-9351', '1', '1', '0', '2017-02-15 21:57:04', '2017-02-15 21:57:04');
INSERT INTO `category_secondary` VALUES ('1453', 'm', '1447', '医学', '1713-3285', '1', '1', '0', '2017-02-15 21:57:04', '2017-02-15 21:57:04');
INSERT INTO `category_secondary` VALUES ('1454', 'm', '1447', '科学与自然', '1713-3286', '1', '1', '0', '2017-02-15 21:57:04', '2017-02-15 21:57:04');
INSERT INTO `category_secondary` VALUES ('1455', 'm', '1447', '农林', '1713-9368', '1', '1', '0', '2017-02-15 21:57:04', '2017-02-15 21:57:04');
INSERT INTO `category_secondary` VALUES ('1456', 'm', '1387', '刊/原版', '', '1', '1', '1', '2017-02-15 21:57:04', '2017-02-15 21:57:04');
INSERT INTO `category_secondary` VALUES ('1457', 'm', '1456', '杂志/期刊', '1713-4758', '1', '1', '0', '2017-02-15 21:57:04', '2017-02-15 21:57:04');
INSERT INTO `category_secondary` VALUES ('1458', 'm', '1456', '英文原版书', '1713-4855', '1', '1', '0', '2017-02-15 21:57:04', '2017-02-15 21:57:04');
INSERT INTO `category_secondary` VALUES ('1459', 'm', '1456', '港台图书', '1713-6929', '1', '1', '0', '2017-02-15 21:57:04', '2017-02-15 21:57:04');
INSERT INTO `category_secondary` VALUES ('146', 'b', '101', '数码配件', 'sheyingpj.jd.com/', '1', '1', '1', '2017-02-15 21:56:36', '2017-02-15 21:56:36');
INSERT INTO `category_secondary` VALUES ('1460', 'm', '1387', '电子书', 'e.jd.com/ebook.html', '1', '1', '1', '2017-02-15 21:57:04', '2017-02-15 21:57:04');
INSERT INTO `category_secondary` VALUES ('1461', 'm', '1460', '畅读VIP', 'sale.jd.com/act/MypqiIJPYx.html', '1', '1', '0', '2017-02-15 21:57:04', '2017-02-15 21:57:04');
INSERT INTO `category_secondary` VALUES ('1462', 'm', '1460', '小说', 'e.jd.com/products/5272-5278.html', '1', '1', '0', '2017-02-15 21:57:04', '2017-02-15 21:57:04');
INSERT INTO `category_secondary` VALUES ('1463', 'm', '1460', '励志与成功', 'e.jd.com/products/5272-5287.html', '1', '1', '0', '2017-02-15 21:57:04', '2017-02-15 21:57:04');
INSERT INTO `category_secondary` VALUES ('1464', 'm', '1460', '经济金融', 'e.jd.com/products/5272-12438.html', '1', '1', '0', '2017-02-15 21:57:04', '2017-02-15 21:57:04');
INSERT INTO `category_secondary` VALUES ('1465', 'm', '1460', '文学', 'e.jd.com/products/5272-5279.html', '1', '1', '0', '2017-02-15 21:57:04', '2017-02-15 21:57:04');
INSERT INTO `category_secondary` VALUES ('1466', 'm', '1460', '社科', 'e.jd.com/products/5272-5301.html', '1', '1', '0', '2017-02-15 21:57:04', '2017-02-15 21:57:04');
INSERT INTO `category_secondary` VALUES ('1467', 'm', '1460', '婚恋两性', 'e.jd.com/products/5272-10884.html', '1', '1', '0', '2017-02-15 21:57:04', '2017-02-15 21:57:04');
INSERT INTO `category_secondary` VALUES ('1468', 'm', '1460', '外文原版', 'e.jd.com/products/5272-6828.html', '1', '1', '0', '2017-02-15 21:57:04', '2017-02-15 21:57:04');
INSERT INTO `category_secondary` VALUES ('1469', 'm', '1460', '免费', 'e.jd.com/products/5272-5276.html', '1', '1', '0', '2017-02-15 21:57:04', '2017-02-15 21:57:04');
INSERT INTO `category_secondary` VALUES ('147', 'b', '146', '存储卡', '652-829-845', '1', '1', '0', '2017-02-15 21:56:36', '2017-02-15 21:56:36');
INSERT INTO `category_secondary` VALUES ('1470', 'm', '1387', '数字音乐', 'music.jd.com', '1', '1', '1', '2017-02-15 21:57:04', '2017-02-15 21:57:04');
INSERT INTO `category_secondary` VALUES ('1471', 'm', '1470', '通俗流行', 'music.jd.com/category_1.html', '1', '1', '0', '2017-02-15 21:57:04', '2017-02-15 21:57:04');
INSERT INTO `category_secondary` VALUES ('1472', 'm', '1470', '古典音乐', 'music.jd.com/category_2.html', '1', '1', '0', '2017-02-15 21:57:04', '2017-02-15 21:57:04');
INSERT INTO `category_secondary` VALUES ('1473', 'm', '1470', '摇滚说唱', 'music.jd.com/category_3.html', '1', '1', '0', '2017-02-15 21:57:04', '2017-02-15 21:57:04');
INSERT INTO `category_secondary` VALUES ('1474', 'm', '1470', '爵士蓝调', 'music.jd.com/category_4.html', '1', '1', '0', '2017-02-15 21:57:04', '2017-02-15 21:57:04');
INSERT INTO `category_secondary` VALUES ('1475', 'm', '1470', '乡村民谣', 'music.jd.com/category_5.html', '1', '1', '0', '2017-02-15 21:57:04', '2017-02-15 21:57:04');
INSERT INTO `category_secondary` VALUES ('1476', 'm', '1470', '有声读物', 'music.jd.com/category_8.html', '1', '1', '0', '2017-02-15 21:57:04', '2017-02-15 21:57:04');
INSERT INTO `category_secondary` VALUES ('1477', 'm', '0', '音像', 'mvd.jd.com/', '1', '1', '0', '2017-02-15 21:57:04', '2017-02-15 21:57:04');
INSERT INTO `category_secondary` VALUES ('1478', 'm', '0', '电子书', 'e.jd.com/ebook.html', '1', '1', '0', '2017-02-15 21:57:04', '2017-02-15 21:57:04');
INSERT INTO `category_secondary` VALUES ('1479', 'm', '-1', '图书频道', 'book.jd.com/', '1', '1', '1', '2017-02-15 21:57:04', '2017-02-15 21:57:04');
INSERT INTO `category_secondary` VALUES ('148', 'b', '146', '三脚架/云台', '652-829-848', '1', '1', '0', '2017-02-15 21:56:36', '2017-02-15 21:56:36');
INSERT INTO `category_secondary` VALUES ('1480', 'm', '-1', '音像', 'mvd.jd.com/', '1', '1', '1', '2017-02-15 21:57:04', '2017-02-15 21:57:04');
INSERT INTO `category_secondary` VALUES ('1481', 'm', '-1', '电子书', 'e.jd.com/ebook.html', '1', '1', '1', '2017-02-15 21:57:04', '2017-02-15 21:57:04');
INSERT INTO `category_secondary` VALUES ('1482', 'm', '-1', '图书榜', '//book.jd.com/booktop/1713-0-0-0-10001-1.html', '1', '1', '1', '2017-02-15 21:57:04', '2017-02-15 21:57:04');
INSERT INTO `category_secondary` VALUES ('1483', 'm', '-1', '娱乐圈', 'yule.jd.com', '1', '1', '1', '2017-02-15 21:57:04', '2017-02-15 21:57:04');
INSERT INTO `category_secondary` VALUES ('1484', 'm', '-1', '文娱众筹馆', 'sale.jd.com/act/L56BxD8WIeR.html', '1', '1', '1', '2017-02-15 21:57:04', '2017-02-15 21:57:04');
INSERT INTO `category_secondary` VALUES ('1485', 'n', '0', '机票', 'jipiao.jd.com/', '1', '1', '1', '2017-02-15 21:57:20', '2017-02-15 21:57:20');
INSERT INTO `category_secondary` VALUES ('1486', 'n', '1485', '交通出行', 'jipiao.jd.com', '1', '1', '1', '2017-02-15 21:57:20', '2017-02-15 21:57:20');
INSERT INTO `category_secondary` VALUES ('1487', 'n', '1486', '国内机票', 'jipiao.jd.com', '1', '1', '0', '2017-02-15 21:57:20', '2017-02-15 21:57:20');
INSERT INTO `category_secondary` VALUES ('1488', 'n', '1486', '国际机票', 'ijipiao.jd.com', '1', '1', '0', '2017-02-15 21:57:20', '2017-02-15 21:57:20');
INSERT INTO `category_secondary` VALUES ('1489', 'n', '1486', '火车票', 'train.jd.com', '1', '1', '0', '2017-02-15 21:57:20', '2017-02-15 21:57:20');
INSERT INTO `category_secondary` VALUES ('149', 'b', '146', '相机包', '652-829-847', '1', '1', '0', '2017-02-15 21:56:36', '2017-02-15 21:56:36');
INSERT INTO `category_secondary` VALUES ('1490', 'n', '1486', '机场服务', '4938-4939-13234', '1', '1', '0', '2017-02-15 21:57:20', '2017-02-15 21:57:20');
INSERT INTO `category_secondary` VALUES ('1491', 'n', '1485', '酒店预订', 'hotel.jd.com', '1', '1', '1', '2017-02-15 21:57:20', '2017-02-15 21:57:20');
INSERT INTO `category_secondary` VALUES ('1492', 'n', '1491', '国内酒店', 'hotel.jd.com', '1', '1', '0', '2017-02-15 21:57:20', '2017-02-15 21:57:20');
INSERT INTO `category_secondary` VALUES ('1493', 'n', '1491', '国际酒店', 'ihotel.jd.com', '1', '1', '0', '2017-02-15 21:57:20', '2017-02-15 21:57:20');
INSERT INTO `category_secondary` VALUES ('1494', 'n', '1491', '超值精选酒店', 'hotel.jd.com/tehui', '1', '1', '0', '2017-02-15 21:57:20', '2017-02-15 21:57:20');
INSERT INTO `category_secondary` VALUES ('1495', 'n', '1485', '旅游度假', 'trip.jd.com', '1', '1', '1', '2017-02-15 21:57:20', '2017-02-15 21:57:20');
INSERT INTO `category_secondary` VALUES ('1496', 'n', '1495', '国内旅游', 'dujia.jd.com/search_complex/whole-all-0-%E4%B8%89%E4%BA%9A', '1', '1', '0', '2017-02-15 21:57:20', '2017-02-15 21:57:20');
INSERT INTO `category_secondary` VALUES ('1497', 'n', '1495', '出境旅游', 'dujia.jd.com/search_complex/whole-all-0-%E6%B3%B0%E5%9B%BD', '1', '1', '0', '2017-02-15 21:57:20', '2017-02-15 21:57:20');
INSERT INTO `category_secondary` VALUES ('1498', 'n', '1495', '全球签证', 'visa.jd.com/', '1', '1', '0', '2017-02-15 21:57:20', '2017-02-15 21:57:20');
INSERT INTO `category_secondary` VALUES ('1499', 'n', '1495', '景点门票', 'menpiao.jd.com/', '1', '1', '0', '2017-02-15 21:57:20', '2017-02-15 21:57:20');
INSERT INTO `category_secondary` VALUES ('15', 'a', '11', '迷你洗衣机', 'list.jd.com/list.html?cat=737,794,880&ev=998_77402&JL=3_%E4%BA%A7%E5%93%81%E7%B1%BB%E5%9E%8B_%E8%BF%B7%E4%BD%A0%E6%B4%97%E8%A1%A3%E6%9C%BA#J_crumbsBar', '1', '1', '0', '2017-02-15 21:56:33', '2017-02-15 21:56:33');
INSERT INTO `category_secondary` VALUES ('150', 'b', '146', '滤镜', '652-829-835', '1', '1', '0', '2017-02-15 21:56:36', '2017-02-15 21:56:36');
INSERT INTO `category_secondary` VALUES ('1500', 'n', '1495', '邮轮', 'youlun.jd.com/', '1', '1', '0', '2017-02-15 21:57:20', '2017-02-15 21:57:20');
INSERT INTO `category_secondary` VALUES ('1501', 'n', '1495', '旅行保险', 'bao.jd.com/travel', '1', '1', '0', '2017-02-15 21:57:20', '2017-02-15 21:57:20');
INSERT INTO `category_secondary` VALUES ('1502', 'n', '1485', '商旅服务', 'ct.jd.com', '1', '1', '1', '2017-02-15 21:57:20', '2017-02-15 21:57:20');
INSERT INTO `category_secondary` VALUES ('1503', 'n', '1502', '企业差旅', 'ct.jd.com', '1', '1', '0', '2017-02-15 21:57:20', '2017-02-15 21:57:20');
INSERT INTO `category_secondary` VALUES ('1504', 'n', '1502', '团队建设', '4938-12420-13755', '1', '1', '0', '2017-02-15 21:57:20', '2017-02-15 21:57:20');
INSERT INTO `category_secondary` VALUES ('1505', 'n', '1502', '奖励旅游', '4938-12420-12422', '1', '1', '0', '2017-02-15 21:57:20', '2017-02-15 21:57:20');
INSERT INTO `category_secondary` VALUES ('1506', 'n', '1502', '会议周边', '4938-12420-12423', '1', '1', '0', '2017-02-15 21:57:20', '2017-02-15 21:57:20');
INSERT INTO `category_secondary` VALUES ('1507', 'n', '1502', '会议展览', 'mice.jd.com/', '1', '1', '0', '2017-02-15 21:57:20', '2017-02-15 21:57:20');
INSERT INTO `category_secondary` VALUES ('1508', 'n', '1485', '演出票务', 'piao.jd.com', '1', '1', '1', '2017-02-15 21:57:20', '2017-02-15 21:57:20');
INSERT INTO `category_secondary` VALUES ('1509', 'n', '1508', '电影选座', 'movie.jd.com', '1', '1', '0', '2017-02-15 21:57:20', '2017-02-15 21:57:20');
INSERT INTO `category_secondary` VALUES ('151', 'b', '146', '闪光灯/手柄', '652-829-836', '1', '1', '0', '2017-02-15 21:56:36', '2017-02-15 21:56:36');
INSERT INTO `category_secondary` VALUES ('1510', 'n', '1508', '演唱会', 'piao.jd.com/yanchanghui', '1', '1', '0', '2017-02-15 21:57:20', '2017-02-15 21:57:20');
INSERT INTO `category_secondary` VALUES ('1511', 'n', '1508', '音乐会', 'piao.jd.com/yinyuehui', '1', '1', '0', '2017-02-15 21:57:20', '2017-02-15 21:57:20');
INSERT INTO `category_secondary` VALUES ('1512', 'n', '1508', '话剧歌剧', 'piao.jd.com/huajugeju', '1', '1', '0', '2017-02-15 21:57:20', '2017-02-15 21:57:20');
INSERT INTO `category_secondary` VALUES ('1513', 'n', '1508', '体育赛事', 'piao.jd.com/tiyusaishi', '1', '1', '0', '2017-02-15 21:57:20', '2017-02-15 21:57:20');
INSERT INTO `category_secondary` VALUES ('1514', 'n', '1508', '舞蹈芭蕾', 'piao.jd.com/wudaobalei', '1', '1', '0', '2017-02-15 21:57:20', '2017-02-15 21:57:20');
INSERT INTO `category_secondary` VALUES ('1515', 'n', '1508', '戏曲综艺', 'piao.jd.com/xiquzongyi', '1', '1', '0', '2017-02-15 21:57:20', '2017-02-15 21:57:20');
INSERT INTO `category_secondary` VALUES ('1516', 'n', '1485', '生活缴费', 'chongzhi.jd.com/index.action?bussType=3', '1', '1', '1', '2017-02-15 21:57:20', '2017-02-15 21:57:20');
INSERT INTO `category_secondary` VALUES ('1517', 'n', '1516', '水费', 'chongzhi.jd.com/index.action?bussType=3', '1', '1', '0', '2017-02-15 21:57:20', '2017-02-15 21:57:20');
INSERT INTO `category_secondary` VALUES ('1518', 'n', '1516', '电费', 'chongzhi.jd.com/index.action?bussType=3', '1', '1', '0', '2017-02-15 21:57:20', '2017-02-15 21:57:20');
INSERT INTO `category_secondary` VALUES ('1519', 'n', '1516', '煤气费', 'chongzhi.jd.com/index.action?bussType=3', '1', '1', '0', '2017-02-15 21:57:20', '2017-02-15 21:57:20');
INSERT INTO `category_secondary` VALUES ('152', 'b', '146', '相机清洁/贴膜', '652-829-851', '1', '1', '0', '2017-02-15 21:56:36', '2017-02-15 21:56:36');
INSERT INTO `category_secondary` VALUES ('1520', 'n', '1485', '生活服务', 'life.jd.com', '1', '1', '1', '2017-02-15 21:57:20', '2017-02-15 21:57:20');
INSERT INTO `category_secondary` VALUES ('1521', 'n', '1520', '外卖订座', 'life.jd.com/take/initTakeAway.do', '1', '1', '0', '2017-02-15 21:57:20', '2017-02-15 21:57:20');
INSERT INTO `category_secondary` VALUES ('1522', 'n', '1520', '家政保洁', '4938-11760-12374', '1', '1', '0', '2017-02-15 21:57:20', '2017-02-15 21:57:20');
INSERT INTO `category_secondary` VALUES ('1523', 'n', '1520', '休闲娱乐', '4938-11760-12373', '1', '1', '0', '2017-02-15 21:57:20', '2017-02-15 21:57:20');
INSERT INTO `category_secondary` VALUES ('1524', 'n', '1520', '医疗美容', '4938-11760-12372', '1', '1', '0', '2017-02-15 21:57:20', '2017-02-15 21:57:20');
INSERT INTO `category_secondary` VALUES ('1525', 'n', '1485', '教育培训', '4938-12316', '1', '1', '1', '2017-02-15 21:57:20', '2017-02-15 21:57:20');
INSERT INTO `category_secondary` VALUES ('1526', 'n', '1525', '早教幼教', '4938-12316-12317', '1', '1', '0', '2017-02-15 21:57:20', '2017-02-15 21:57:20');
INSERT INTO `category_secondary` VALUES ('1527', 'n', '1525', '中小学教育', '4938-12316-13111', '1', '1', '0', '2017-02-15 21:57:20', '2017-02-15 21:57:20');
INSERT INTO `category_secondary` VALUES ('1528', 'n', '1525', '语言/留学', '4938-12316-12319', '1', '1', '0', '2017-02-15 21:57:20', '2017-02-15 21:57:20');
INSERT INTO `category_secondary` VALUES ('1529', 'n', '1525', '学历教育', '4938-12316-13112', '1', '1', '0', '2017-02-15 21:57:20', '2017-02-15 21:57:20');
INSERT INTO `category_secondary` VALUES ('153', 'b', '146', '机身附件', '652-829-10971', '1', '1', '0', '2017-02-15 21:56:36', '2017-02-15 21:56:36');
INSERT INTO `category_secondary` VALUES ('1530', 'n', '1525', '职业技能', '4938-12316-13109', '1', '1', '0', '2017-02-15 21:57:20', '2017-02-15 21:57:20');
INSERT INTO `category_secondary` VALUES ('1531', 'n', '1525', '兴趣爱好', '4938-12316-13110', '1', '1', '0', '2017-02-15 21:57:20', '2017-02-15 21:57:20');
INSERT INTO `category_secondary` VALUES ('1532', 'n', '1485', '彩票', 'caipiao.jd.com', '1', '1', '1', '2017-02-15 21:57:20', '2017-02-15 21:57:20');
INSERT INTO `category_secondary` VALUES ('1533', 'n', '1532', '购彩中心', 'sale.jd.com/act/wzf51k8RX4reCD.html', '1', '1', '0', '2017-02-15 21:57:20', '2017-02-15 21:57:20');
INSERT INTO `category_secondary` VALUES ('1534', 'n', '1532', '开奖结果', 'caipiao.jd.com/notice/notice_list.html', '1', '1', '0', '2017-02-15 21:57:20', '2017-02-15 21:57:20');
INSERT INTO `category_secondary` VALUES ('1535', 'n', '1532', '数据图表', 'caipiao.jd.com', '1', '1', '0', '2017-02-15 21:57:20', '2017-02-15 21:57:20');
INSERT INTO `category_secondary` VALUES ('1536', 'n', '1532', '彩民服务', 'caipiao.jd.com', '1', '1', '0', '2017-02-15 21:57:20', '2017-02-15 21:57:20');
INSERT INTO `category_secondary` VALUES ('1537', 'n', '1485', '游戏', 'game.jd.com', '1', '1', '1', '2017-02-15 21:57:20', '2017-02-15 21:57:20');
INSERT INTO `category_secondary` VALUES ('1538', 'n', '1537', 'QQ充值', 'card.jd.com/?type=qq', '1', '1', '0', '2017-02-15 21:57:20', '2017-02-15 21:57:20');
INSERT INTO `category_secondary` VALUES ('1539', 'n', '1537', '游戏点卡', 'card.jd.com/', '1', '1', '0', '2017-02-15 21:57:20', '2017-02-15 21:57:20');
INSERT INTO `category_secondary` VALUES ('154', 'b', '146', '镜头附件', '652-829-10972', '1', '1', '0', '2017-02-15 21:56:36', '2017-02-15 21:56:36');
INSERT INTO `category_secondary` VALUES ('1540', 'n', '1537', '网页游戏', 'wan.jd.com', '1', '1', '0', '2017-02-15 21:57:20', '2017-02-15 21:57:20');
INSERT INTO `category_secondary` VALUES ('1541', 'n', '1537', '游戏周边', '4938-9394-9392', '1', '1', '0', '2017-02-15 21:57:20', '2017-02-15 21:57:20');
INSERT INTO `category_secondary` VALUES ('1542', 'n', '1537', '手机游戏', 'card.jd.com/?type=shouyou', '1', '1', '0', '2017-02-15 21:57:20', '2017-02-15 21:57:20');
INSERT INTO `category_secondary` VALUES ('1543', 'n', '1537', '单机游戏', '4938-9394-9393', '1', '1', '0', '2017-02-15 21:57:20', '2017-02-15 21:57:20');
INSERT INTO `category_secondary` VALUES ('1544', 'n', '1485', '海外生活', '', '1', '1', '1', '2017-02-15 21:57:20', '2017-02-15 21:57:20');
INSERT INTO `category_secondary` VALUES ('1545', 'n', '1544', '留学', 'liuxue.jd.com', '1', '1', '0', '2017-02-15 21:57:20', '2017-02-15 21:57:20');
INSERT INTO `category_secondary` VALUES ('1546', 'n', '1544', '留学后服务', '13678-13684-13688', '1', '1', '0', '2017-02-15 21:57:20', '2017-02-15 21:57:20');
INSERT INTO `category_secondary` VALUES ('1547', 'n', '1544', '游学', 'sale.jd.com/act/es4Yyv60fxX5G.html', '1', '1', '0', '2017-02-15 21:57:20', '2017-02-15 21:57:20');
INSERT INTO `category_secondary` VALUES ('1548', 'n', '1544', '海外房产', 'fangchan.jd.com/', '1', '1', '0', '2017-02-15 21:57:20', '2017-02-15 21:57:20');
INSERT INTO `category_secondary` VALUES ('1549', 'n', '0', '酒店', 'hotel.jd.com/', '1', '1', '0', '2017-02-15 21:57:20', '2017-02-15 21:57:20');
INSERT INTO `category_secondary` VALUES ('155', 'b', '146', '读卡器', '652-829-846', '1', '1', '0', '2017-02-15 21:56:36', '2017-02-15 21:56:36');
INSERT INTO `category_secondary` VALUES ('1550', 'n', '0', '旅游', 'trip.jd.com/', '1', '1', '0', '2017-02-15 21:57:20', '2017-02-15 21:57:20');
INSERT INTO `category_secondary` VALUES ('1551', 'n', '0', '生活', 'ish.jd.com/', '1', '1', '0', '2017-02-15 21:57:20', '2017-02-15 21:57:20');
INSERT INTO `category_secondary` VALUES ('1552', 'n', '-1', '一元抢宝', '1.jd.com/', '1', '1', '1', '2017-02-15 21:57:20', '2017-02-15 21:57:20');
INSERT INTO `category_secondary` VALUES ('1553', 'n', '-1', '电影票', 'movie.jd.com/index.html', '1', '1', '1', '2017-02-15 21:57:20', '2017-02-15 21:57:20');
INSERT INTO `category_secondary` VALUES ('1554', 'n', '-1', '机票', 'jipiao.jd.com/', '1', '1', '1', '2017-02-15 21:57:20', '2017-02-15 21:57:20');
INSERT INTO `category_secondary` VALUES ('1555', 'n', '-1', '火车票', 'train.jd.com/', '1', '1', '1', '2017-02-15 21:57:20', '2017-02-15 21:57:20');
INSERT INTO `category_secondary` VALUES ('1556', 'n', '-1', '特惠酒店', 'hotel.jd.com/tehui', '1', '1', '1', '2017-02-15 21:57:20', '2017-02-15 21:57:20');
INSERT INTO `category_secondary` VALUES ('1557', 'n', '-1', '企业差旅', 'ct.jd.com/', '1', '1', '1', '2017-02-15 21:57:20', '2017-02-15 21:57:20');
INSERT INTO `category_secondary` VALUES ('1558', 'o', '0', '理财', 'licai.jd.com/', '1', '1', '1', '2017-02-15 21:57:24', '2017-02-15 21:57:24');
INSERT INTO `category_secondary` VALUES ('1559', 'o', '1558', '理财', 'licai.jd.com', '1', '1', '1', '2017-02-15 21:57:24', '2017-02-15 21:57:24');
INSERT INTO `category_secondary` VALUES ('156', 'b', '146', '支架', '652-829-12810', '1', '1', '0', '2017-02-15 21:56:36', '2017-02-15 21:56:36');
INSERT INTO `category_secondary` VALUES ('1560', 'o', '1559', '京东小金库', 'xjk.jr.jd.com/index.htm', '1', '1', '0', '2017-02-15 21:57:24', '2017-02-15 21:57:24');
INSERT INTO `category_secondary` VALUES ('1561', 'o', '1559', '票据理财', 'bill.jr.jd.com/buy/list.htm', '1', '1', '0', '2017-02-15 21:57:24', '2017-02-15 21:57:24');
INSERT INTO `category_secondary` VALUES ('1562', 'o', '1559', '基金理财', 'fund.jd.com/', '1', '1', '0', '2017-02-15 21:57:24', '2017-02-15 21:57:24');
INSERT INTO `category_secondary` VALUES ('1563', 'o', '1559', '定期理财', 'dq.jd.com', '1', '1', '0', '2017-02-15 21:57:24', '2017-02-15 21:57:24');
INSERT INTO `category_secondary` VALUES ('1564', 'o', '1559', '固收理财', 'jdd.jr.jd.com/index.html', '1', '1', '0', '2017-02-15 21:57:24', '2017-02-15 21:57:24');
INSERT INTO `category_secondary` VALUES ('1565', 'o', '1559', '妈妈理财', 'jr.jd.com/mother/index.html', '1', '1', '0', '2017-02-15 21:57:24', '2017-02-15 21:57:24');
INSERT INTO `category_secondary` VALUES ('1566', 'o', '1559', '慧投理财', 'licaishi.jd.com/huitou/index', '1', '1', '0', '2017-02-15 21:57:24', '2017-02-15 21:57:24');
INSERT INTO `category_secondary` VALUES ('1567', 'o', '1558', '众筹', 'z.jd.com', '1', '1', '1', '2017-02-15 21:57:24', '2017-02-15 21:57:24');
INSERT INTO `category_secondary` VALUES ('1568', 'o', '1567', '智能硬件', 'z.jd.com/bigger/search.html?categoryId=10', '1', '1', '0', '2017-02-15 21:57:24', '2017-02-15 21:57:24');
INSERT INTO `category_secondary` VALUES ('1569', 'o', '1567', '流行文化', 'z.jd.com/bigger/search.html?categoryId=11', '1', '1', '0', '2017-02-15 21:57:24', '2017-02-15 21:57:24');
INSERT INTO `category_secondary` VALUES ('157', 'b', '146', '电池/充电器', '652-829-854', '1', '1', '0', '2017-02-15 21:56:36', '2017-02-15 21:56:36');
INSERT INTO `category_secondary` VALUES ('1570', 'o', '1567', '生活美学', 'z.jd.com/bigger/search.html?categoryId=12', '1', '1', '0', '2017-02-15 21:57:24', '2017-02-15 21:57:24');
INSERT INTO `category_secondary` VALUES ('1571', 'o', '1567', '公益', 'z.jd.com/bigger/search.html?categoryId=13', '1', '1', '0', '2017-02-15 21:57:24', '2017-02-15 21:57:24');
INSERT INTO `category_secondary` VALUES ('1572', 'o', '1567', '其他权益众筹', 'z.jd.com/bigger/search.html?categoryId=14', '1', '1', '0', '2017-02-15 21:57:24', '2017-02-15 21:57:24');
INSERT INTO `category_secondary` VALUES ('1573', 'o', '1558', '东家', 'dj.jd.com', '1', '1', '1', '2017-02-15 21:57:24', '2017-02-15 21:57:24');
INSERT INTO `category_secondary` VALUES ('1574', 'o', '1573', '私募股权', 'dj.jd.com', '1', '1', '0', '2017-02-15 21:57:24', '2017-02-15 21:57:24');
INSERT INTO `category_secondary` VALUES ('1575', 'o', '1558', '白条', 'baitiao.jd.com', '1', '1', '1', '2017-02-15 21:57:24', '2017-02-15 21:57:24');
INSERT INTO `category_secondary` VALUES ('1576', 'o', '1575', '京东白条', 'baitiao.jd.com', '1', '1', '0', '2017-02-15 21:57:24', '2017-02-15 21:57:24');
INSERT INTO `category_secondary` VALUES ('1577', 'o', '1575', '白条联名卡', 'bk.jd.com', '1', '1', '0', '2017-02-15 21:57:24', '2017-02-15 21:57:24');
INSERT INTO `category_secondary` VALUES ('1578', 'o', '1575', '京东钢镚', 'gb.jd.com', '1', '1', '0', '2017-02-15 21:57:24', '2017-02-15 21:57:24');
INSERT INTO `category_secondary` VALUES ('1579', 'o', '1575', '旅游白条', 'sfy.jd.com', '1', '1', '0', '2017-02-15 21:57:24', '2017-02-15 21:57:24');
INSERT INTO `category_secondary` VALUES ('158', 'b', '101', '影音娱乐', '652-828', '1', '1', '1', '2017-02-15 21:56:36', '2017-02-15 21:56:36');
INSERT INTO `category_secondary` VALUES ('1580', 'o', '1575', '安居白条', 'fang.jd.com', '1', '1', '0', '2017-02-15 21:57:24', '2017-02-15 21:57:24');
INSERT INTO `category_secondary` VALUES ('1581', 'o', '1575', '校园金融', 'edu.jd.com', '1', '1', '0', '2017-02-15 21:57:24', '2017-02-15 21:57:24');
INSERT INTO `category_secondary` VALUES ('1582', 'o', '1575', '京东金采', 'jincai.jd.com/apply/list.html', '1', '1', '0', '2017-02-15 21:57:24', '2017-02-15 21:57:24');
INSERT INTO `category_secondary` VALUES ('1583', 'o', '1558', '钱包', 'jdpay.com', '1', '1', '1', '2017-02-15 21:57:24', '2017-02-15 21:57:24');
INSERT INTO `category_secondary` VALUES ('1584', 'o', '1583', '京东钱包', 'jdpay.com', '1', '1', '0', '2017-02-15 21:57:24', '2017-02-15 21:57:24');
INSERT INTO `category_secondary` VALUES ('1585', 'o', '1558', '保险', 'bao.jd.com', '1', '1', '1', '2017-02-15 21:57:24', '2017-02-15 21:57:24');
INSERT INTO `category_secondary` VALUES ('1586', 'o', '1585', '车险', 'bao.jd.com/vehicle', '1', '1', '0', '2017-02-15 21:57:24', '2017-02-15 21:57:24');
INSERT INTO `category_secondary` VALUES ('1587', 'o', '1585', '健康险', 'bao.jd.com/health', '1', '1', '0', '2017-02-15 21:57:24', '2017-02-15 21:57:24');
INSERT INTO `category_secondary` VALUES ('1588', 'o', '1585', '意外险', 'bao.jd.com/accident', '1', '1', '0', '2017-02-15 21:57:24', '2017-02-15 21:57:24');
INSERT INTO `category_secondary` VALUES ('1589', 'o', '1585', '旅行险', 'bao.jd.com/travel', '1', '1', '0', '2017-02-15 21:57:24', '2017-02-15 21:57:24');
INSERT INTO `category_secondary` VALUES ('159', 'b', '158', '耳机/耳麦', '652-828-842', '1', '1', '0', '2017-02-15 21:56:36', '2017-02-15 21:56:36');
INSERT INTO `category_secondary` VALUES ('1590', 'o', '0', '众筹', 'z.jd.com/', '1', '1', '0', '2017-02-15 21:57:24', '2017-02-15 21:57:24');
INSERT INTO `category_secondary` VALUES ('1591', 'o', '0', '白条', 'baitiao.jd.com', '1', '1', '0', '2017-02-15 21:57:24', '2017-02-15 21:57:24');
INSERT INTO `category_secondary` VALUES ('1592', 'o', '0', '保险', 'bao.jd.com/', '1', '1', '0', '2017-02-15 21:57:24', '2017-02-15 21:57:24');
INSERT INTO `category_secondary` VALUES ('1593', 'o', '-1', '金融首页', 'jr.jd.com/', '1', '1', '1', '2017-02-15 21:57:24', '2017-02-15 21:57:24');
INSERT INTO `category_secondary` VALUES ('1594', 'o', '-1', '尖er货', 'sale.jd.com/act/w2kQpxmqCS.html', '1', '1', '1', '2017-02-15 21:57:24', '2017-02-15 21:57:24');
INSERT INTO `category_secondary` VALUES ('1595', 'o', '-1', '0元评测', 'pingce.jd.com/index.html', '1', '1', '1', '2017-02-15 21:57:24', '2017-02-15 21:57:24');
INSERT INTO `category_secondary` VALUES ('1596', 'o', '-1', 'In货推荐', 'jr.jd.com/buy/index', '1', '1', '1', '2017-02-15 21:57:24', '2017-02-15 21:57:24');
INSERT INTO `category_secondary` VALUES ('1597', 'o', '-1', '财发现', 'jr.jd.com/money', '1', '1', '1', '2017-02-15 21:57:24', '2017-02-15 21:57:24');
INSERT INTO `category_secondary` VALUES ('16', 'a', '11', '洗衣机配件', 'list.jd.com/list.html?cat=737,794,877&ev=2664_88742&trans=1&JL=2_1_0#J_crumbsBar', '1', '1', '0', '2017-02-15 21:56:33', '2017-02-15 21:56:33');
INSERT INTO `category_secondary` VALUES ('160', 'b', '158', '音箱/音响', '652-828-841', '1', '1', '0', '2017-02-15 21:56:36', '2017-02-15 21:56:36');
INSERT INTO `category_secondary` VALUES ('161', 'b', '158', '便携/无线音箱', '652-828-13662', '1', '1', '0', '2017-02-15 21:56:36', '2017-02-15 21:56:36');
INSERT INTO `category_secondary` VALUES ('162', 'b', '158', '收音机', '652-828-12808', '1', '1', '0', '2017-02-15 21:56:36', '2017-02-15 21:56:36');
INSERT INTO `category_secondary` VALUES ('163', 'b', '158', '麦克风', '652-828-869', '1', '1', '0', '2017-02-15 21:56:36', '2017-02-15 21:56:36');
INSERT INTO `category_secondary` VALUES ('164', 'b', '158', 'MP3/MP4', '652-828-837', '1', '1', '0', '2017-02-15 21:56:36', '2017-02-15 21:56:36');
INSERT INTO `category_secondary` VALUES ('165', 'b', '158', '专业音频', '652-828-962', '1', '1', '0', '2017-02-15 21:56:36', '2017-02-15 21:56:36');
INSERT INTO `category_secondary` VALUES ('166', 'b', '101', '智能设备', '652-12345', '1', '1', '1', '2017-02-15 21:56:36', '2017-02-15 21:56:36');
INSERT INTO `category_secondary` VALUES ('167', 'b', '166', '智能手环', '652-12345-12347', '1', '1', '0', '2017-02-15 21:56:36', '2017-02-15 21:56:36');
INSERT INTO `category_secondary` VALUES ('168', 'b', '166', '智能手表', '652-12345-12348', '1', '1', '0', '2017-02-15 21:56:36', '2017-02-15 21:56:36');
INSERT INTO `category_secondary` VALUES ('169', 'b', '166', '智能眼镜', '652-12345-12349', '1', '1', '0', '2017-02-15 21:56:36', '2017-02-15 21:56:36');
INSERT INTO `category_secondary` VALUES ('17', 'a', '1', '冰箱', 'list.jd.com/list.html?cat=737,794,878', '1', '1', '1', '2017-02-15 21:56:33', '2017-02-15 21:56:33');
INSERT INTO `category_secondary` VALUES ('170', 'b', '166', '智能机器人', '652-12345-12806', '1', '1', '0', '2017-02-15 21:56:36', '2017-02-15 21:56:36');
INSERT INTO `category_secondary` VALUES ('171', 'b', '166', '运动跟踪器', '652-12345-12350', '1', '1', '0', '2017-02-15 21:56:36', '2017-02-15 21:56:36');
INSERT INTO `category_secondary` VALUES ('172', 'b', '166', '健康监测', '652-12345-12351', '1', '1', '0', '2017-02-15 21:56:36', '2017-02-15 21:56:36');
INSERT INTO `category_secondary` VALUES ('173', 'b', '166', '智能配饰', '652-12345-12352', '1', '1', '0', '2017-02-15 21:56:36', '2017-02-15 21:56:36');
INSERT INTO `category_secondary` VALUES ('174', 'b', '166', '智能家居', '652-12345-12353', '1', '1', '0', '2017-02-15 21:56:36', '2017-02-15 21:56:36');
INSERT INTO `category_secondary` VALUES ('175', 'b', '166', '体感车', '652-12345-12354', '1', '1', '0', '2017-02-15 21:56:36', '2017-02-15 21:56:36');
INSERT INTO `category_secondary` VALUES ('176', 'b', '166', '无人机', '652-12345-12807', '1', '1', '0', '2017-02-15 21:56:36', '2017-02-15 21:56:36');
INSERT INTO `category_secondary` VALUES ('177', 'b', '166', '其他配件', '652-12345-12355', '1', '1', '0', '2017-02-15 21:56:36', '2017-02-15 21:56:36');
INSERT INTO `category_secondary` VALUES ('178', 'b', '101', '电子教育', '652-12346', '1', '1', '1', '2017-02-15 21:56:36', '2017-02-15 21:56:36');
INSERT INTO `category_secondary` VALUES ('179', 'b', '178', '学生平板', '652-12346-12358', '1', '1', '0', '2017-02-15 21:56:36', '2017-02-15 21:56:36');
INSERT INTO `category_secondary` VALUES ('18', 'a', '17', '多门', 'list.jd.com/list.html?cat=737,794,878&ev=1015_5131&sort=sort_totalsales15_desc&JL=3_%E9%97%A8%E6%AC%BE%E5%BC%8F_%E5%A4%9A%E9%97%A8#J_crumbsBar', '1', '1', '0', '2017-02-15 21:56:33', '2017-02-15 21:56:33');
INSERT INTO `category_secondary` VALUES ('180', 'b', '178', '点读机/笔', '652-12346-12357', '1', '1', '0', '2017-02-15 21:56:36', '2017-02-15 21:56:36');
INSERT INTO `category_secondary` VALUES ('181', 'b', '178', '早教益智', '652-12346-12359', '1', '1', '0', '2017-02-15 21:56:36', '2017-02-15 21:56:36');
INSERT INTO `category_secondary` VALUES ('182', 'b', '178', '录音笔', '652-12346-840', '1', '1', '0', '2017-02-15 21:56:36', '2017-02-15 21:56:36');
INSERT INTO `category_secondary` VALUES ('183', 'b', '178', '电纸书', '652-12346-1203', '1', '1', '0', '2017-02-15 21:56:36', '2017-02-15 21:56:36');
INSERT INTO `category_secondary` VALUES ('184', 'b', '178', '电子词典', '652-12346-838', '1', '1', '0', '2017-02-15 21:56:36', '2017-02-15 21:56:36');
INSERT INTO `category_secondary` VALUES ('185', 'b', '178', '复读机', '652-12346-12356', '1', '1', '0', '2017-02-15 21:56:36', '2017-02-15 21:56:36');
INSERT INTO `category_secondary` VALUES ('186', 'b', '0', '运营商', 'wt.jd.com', '1', '1', '0', '2017-02-15 21:56:36', '2017-02-15 21:56:36');
INSERT INTO `category_secondary` VALUES ('187', 'b', '0', '数码', 'shuma.jd.com/', '1', '1', '0', '2017-02-15 21:56:36', '2017-02-15 21:56:36');
INSERT INTO `category_secondary` VALUES ('188', 'b', '-1', '玩3C', '3c.jd.com', '1', '1', '1', '2017-02-15 21:56:36', '2017-02-15 21:56:36');
INSERT INTO `category_secondary` VALUES ('189', 'b', '-1', '手机频道', 'shouji.jd.com/', '1', '1', '1', '2017-02-15 21:56:36', '2017-02-15 21:56:36');
INSERT INTO `category_secondary` VALUES ('19', 'a', '17', '对开门', 'list.jd.com/list.html?cat=737,794,878&ev=1015_5130&sort=sort_totalsales15_desc&JL=3_%E9%97%A8%E6%AC%BE%E5%BC%8F_%E5%AF%B9%E5%BC%80%E9%97%A8#J_crumbsBar', '1', '1', '0', '2017-02-15 21:56:33', '2017-02-15 21:56:33');
INSERT INTO `category_secondary` VALUES ('190', 'b', '-1', '网上营业厅', 'wt.jd.com', '1', '1', '1', '2017-02-15 21:56:36', '2017-02-15 21:56:36');
INSERT INTO `category_secondary` VALUES ('191', 'b', '-1', '配件选购中心', 'kong.jd.com/mobile/accyCenter', '1', '1', '1', '2017-02-15 21:56:36', '2017-02-15 21:56:36');
INSERT INTO `category_secondary` VALUES ('192', 'b', '-1', '影像Club', 'yingxiang.jd.com', '1', '1', '1', '2017-02-15 21:56:36', '2017-02-15 21:56:36');
INSERT INTO `category_secondary` VALUES ('193', 'b', '-1', '以旧换新', 'sale.jd.com/act/02ZCO1Nqk7eALJw.html', '1', '1', '1', '2017-02-15 21:56:36', '2017-02-15 21:56:36');
INSERT INTO `category_secondary` VALUES ('194', 'c', '0', '电脑办公', 'diannao.jd.com/', '1', '1', '1', '2017-02-15 21:56:37', '2017-02-15 21:56:37');
INSERT INTO `category_secondary` VALUES ('195', 'c', '194', '电脑整机', '670-671', '1', '1', '1', '2017-02-15 21:56:37', '2017-02-15 21:56:37');
INSERT INTO `category_secondary` VALUES ('196', 'c', '195', '笔记本', '670-671-672', '1', '1', '0', '2017-02-15 21:56:37', '2017-02-15 21:56:37');
INSERT INTO `category_secondary` VALUES ('197', 'c', '195', '游戏本', '670-671-1105', '1', '1', '0', '2017-02-15 21:56:37', '2017-02-15 21:56:37');
INSERT INTO `category_secondary` VALUES ('198', 'c', '195', '平板电脑', '670-671-2694', '1', '1', '0', '2017-02-15 21:56:37', '2017-02-15 21:56:37');
INSERT INTO `category_secondary` VALUES ('199', 'c', '195', '平板电脑配件', '670-671-5146', '1', '1', '0', '2017-02-15 21:56:37', '2017-02-15 21:56:37');
INSERT INTO `category_secondary` VALUES ('2', 'a', '1', '电视', 'list.jd.com/list.html?cat=737,794,798', '1', '1', '1', '2017-02-15 21:56:33', '2017-02-15 21:56:33');
INSERT INTO `category_secondary` VALUES ('20', 'a', '17', '三门', 'list.jd.com/list.html?cat=737,794,878&ev=1015_5128&sort=sort_totalsales15_desc&JL=2_1_0#J_crumbsBar', '1', '1', '0', '2017-02-15 21:56:33', '2017-02-15 21:56:33');
INSERT INTO `category_secondary` VALUES ('200', 'c', '195', '台式机', '670-671-673', '1', '1', '0', '2017-02-15 21:56:37', '2017-02-15 21:56:37');
INSERT INTO `category_secondary` VALUES ('201', 'c', '195', '一体机', '670-671-12798', '1', '1', '0', '2017-02-15 21:56:37', '2017-02-15 21:56:37');
INSERT INTO `category_secondary` VALUES ('202', 'c', '195', '服务器/工作站', '670-671-674', '1', '1', '0', '2017-02-15 21:56:37', '2017-02-15 21:56:37');
INSERT INTO `category_secondary` VALUES ('203', 'c', '195', '笔记本配件', '670-671-675', '1', '1', '0', '2017-02-15 21:56:37', '2017-02-15 21:56:37');
INSERT INTO `category_secondary` VALUES ('204', 'c', '194', '电脑配件', '670-677', '1', '1', '1', '2017-02-15 21:56:37', '2017-02-15 21:56:37');
INSERT INTO `category_secondary` VALUES ('205', 'c', '204', '显示器', '670-677-688', '1', '1', '0', '2017-02-15 21:56:37', '2017-02-15 21:56:37');
INSERT INTO `category_secondary` VALUES ('206', 'c', '204', 'CPU', '670-677-678', '1', '1', '0', '2017-02-15 21:56:37', '2017-02-15 21:56:37');
INSERT INTO `category_secondary` VALUES ('207', 'c', '204', '主板', '670-677-681', '1', '1', '0', '2017-02-15 21:56:37', '2017-02-15 21:56:37');
INSERT INTO `category_secondary` VALUES ('208', 'c', '204', '显卡', '670-677-679', '1', '1', '0', '2017-02-15 21:56:37', '2017-02-15 21:56:37');
INSERT INTO `category_secondary` VALUES ('209', 'c', '204', '硬盘', '670-677-683', '1', '1', '0', '2017-02-15 21:56:37', '2017-02-15 21:56:37');
INSERT INTO `category_secondary` VALUES ('21', 'a', '17', '双门', 'list.jd.com/list.html?cat=737,794,878&ev=1015_5129&sort=sort_totalsales15_desc&JL=2_1_0#J_crumbsBar', '1', '1', '0', '2017-02-15 21:56:33', '2017-02-15 21:56:33');
INSERT INTO `category_secondary` VALUES ('210', 'c', '204', '内存', '670-677-680', '1', '1', '0', '2017-02-15 21:56:37', '2017-02-15 21:56:37');
INSERT INTO `category_secondary` VALUES ('211', 'c', '204', '机箱', '670-677-687', '1', '1', '0', '2017-02-15 21:56:37', '2017-02-15 21:56:37');
INSERT INTO `category_secondary` VALUES ('212', 'c', '204', '电源', '670-677-691', '1', '1', '0', '2017-02-15 21:56:37', '2017-02-15 21:56:37');
INSERT INTO `category_secondary` VALUES ('213', 'c', '204', '散热器', '670-677-682', '1', '1', '0', '2017-02-15 21:56:37', '2017-02-15 21:56:37');
INSERT INTO `category_secondary` VALUES ('214', 'c', '204', '刻录机/光驱', '670-677-684', '1', '1', '0', '2017-02-15 21:56:37', '2017-02-15 21:56:37');
INSERT INTO `category_secondary` VALUES ('215', 'c', '204', '声卡/扩展卡', '670-677-5008', '1', '1', '0', '2017-02-15 21:56:37', '2017-02-15 21:56:37');
INSERT INTO `category_secondary` VALUES ('216', 'c', '204', '装机配件', '670-677-5009', '1', '1', '0', '2017-02-15 21:56:37', '2017-02-15 21:56:37');
INSERT INTO `category_secondary` VALUES ('217', 'c', '204', 'SSD固态硬盘', '670-677-11303', '1', '1', '0', '2017-02-15 21:56:37', '2017-02-15 21:56:37');
INSERT INTO `category_secondary` VALUES ('218', 'c', '204', '组装电脑', '670-677-11762', '1', '1', '0', '2017-02-15 21:56:37', '2017-02-15 21:56:37');
INSERT INTO `category_secondary` VALUES ('219', 'c', '194', '外设产品', '670-686', '1', '1', '1', '2017-02-15 21:56:37', '2017-02-15 21:56:37');
INSERT INTO `category_secondary` VALUES ('22', 'a', '17', '冷柜/冰吧', '737-794-12392', '1', '1', '0', '2017-02-15 21:56:33', '2017-02-15 21:56:33');
INSERT INTO `category_secondary` VALUES ('220', 'c', '219', '鼠标', '670-686-690', '1', '1', '0', '2017-02-15 21:56:37', '2017-02-15 21:56:37');
INSERT INTO `category_secondary` VALUES ('221', 'c', '219', '键盘', '670-686-689', '1', '1', '0', '2017-02-15 21:56:37', '2017-02-15 21:56:37');
INSERT INTO `category_secondary` VALUES ('222', 'c', '219', '键鼠套装', 'list.jd.com/list.html?cat=670,686,689&ev=%40110485_632247&go=0&JL=3_%E7%B1%BB%E5%9E%8B_%E9%94%AE%E9%BC%A0%E5%A5%97%E8%A3%85', '1', '1', '0', '2017-02-15 21:56:37', '2017-02-15 21:56:37');
INSERT INTO `category_secondary` VALUES ('223', 'c', '219', '网络仪表仪器', '670-686-12799', '1', '1', '0', '2017-02-15 21:56:37', '2017-02-15 21:56:37');
INSERT INTO `category_secondary` VALUES ('224', 'c', '219', 'U盘', '670-686-694', '1', '1', '0', '2017-02-15 21:56:37', '2017-02-15 21:56:37');
INSERT INTO `category_secondary` VALUES ('225', 'c', '219', '移动硬盘', '670-686-693', '1', '1', '0', '2017-02-15 21:56:37', '2017-02-15 21:56:37');
INSERT INTO `category_secondary` VALUES ('226', 'c', '219', '鼠标垫', '670-686-826', '1', '1', '0', '2017-02-15 21:56:37', '2017-02-15 21:56:37');
INSERT INTO `category_secondary` VALUES ('227', 'c', '219', '摄像头', '670-686-692', '1', '1', '0', '2017-02-15 21:56:37', '2017-02-15 21:56:37');
INSERT INTO `category_secondary` VALUES ('228', 'c', '219', '线缆', '670-686-1049', '1', '1', '0', '2017-02-15 21:56:37', '2017-02-15 21:56:37');
INSERT INTO `category_secondary` VALUES ('229', 'c', '219', '手写板', '670-686-698', '1', '1', '0', '2017-02-15 21:56:37', '2017-02-15 21:56:37');
INSERT INTO `category_secondary` VALUES ('23', 'a', '17', '酒柜', '737-794-12401', '1', '1', '0', '2017-02-15 21:56:33', '2017-02-15 21:56:33');
INSERT INTO `category_secondary` VALUES ('230', 'c', '219', '硬盘盒', '670-686-695', '1', '1', '0', '2017-02-15 21:56:37', '2017-02-15 21:56:37');
INSERT INTO `category_secondary` VALUES ('231', 'c', '219', '电脑工具', '670-686-1050', '1', '1', '0', '2017-02-15 21:56:37', '2017-02-15 21:56:37');
INSERT INTO `category_secondary` VALUES ('232', 'c', '219', '电脑清洁', '670-686-1051', '1', '1', '0', '2017-02-15 21:56:37', '2017-02-15 21:56:37');
INSERT INTO `category_secondary` VALUES ('233', 'c', '219', 'UPS电源', '670-686-1048', '1', '1', '0', '2017-02-15 21:56:37', '2017-02-15 21:56:37');
INSERT INTO `category_secondary` VALUES ('234', 'c', '219', '插座', '670-686-1047', '1', '1', '0', '2017-02-15 21:56:37', '2017-02-15 21:56:37');
INSERT INTO `category_secondary` VALUES ('235', 'c', '194', '游戏设备', '670-12800', '1', '1', '1', '2017-02-15 21:56:37', '2017-02-15 21:56:37');
INSERT INTO `category_secondary` VALUES ('236', 'c', '235', '游戏机', '670-12800-12801', '1', '1', '0', '2017-02-15 21:56:37', '2017-02-15 21:56:37');
INSERT INTO `category_secondary` VALUES ('237', 'c', '235', '游戏耳机', '670-12800-12802', '1', '1', '0', '2017-02-15 21:56:37', '2017-02-15 21:56:37');
INSERT INTO `category_secondary` VALUES ('238', 'c', '235', '手柄/方向盘', '670-12800-12803', '1', '1', '0', '2017-02-15 21:56:37', '2017-02-15 21:56:37');
INSERT INTO `category_secondary` VALUES ('239', 'c', '235', '游戏软件', '670-12800-12804', '1', '1', '0', '2017-02-15 21:56:37', '2017-02-15 21:56:37');
INSERT INTO `category_secondary` VALUES ('24', 'a', '17', '冰箱配件', 'list.jd.com/list.html?cat=737,794,877&ev=2664_88743&trans=1&JL=2_1_0#J_crumbsBar', '1', '1', '0', '2017-02-15 21:56:33', '2017-02-15 21:56:33');
INSERT INTO `category_secondary` VALUES ('240', 'c', '235', '游戏周边', '670-12800-12805', '1', '1', '0', '2017-02-15 21:56:37', '2017-02-15 21:56:37');
INSERT INTO `category_secondary` VALUES ('241', 'c', '194', '网络产品', '670-699', '1', '1', '1', '2017-02-15 21:56:37', '2017-02-15 21:56:37');
INSERT INTO `category_secondary` VALUES ('242', 'c', '241', '路由器', '670-699-700', '1', '1', '0', '2017-02-15 21:56:37', '2017-02-15 21:56:37');
INSERT INTO `category_secondary` VALUES ('243', 'c', '241', '网络机顶盒', '670-699-11304', '1', '1', '0', '2017-02-15 21:56:37', '2017-02-15 21:56:37');
INSERT INTO `category_secondary` VALUES ('244', 'c', '241', '交换机', '670-699-702', '1', '1', '0', '2017-02-15 21:56:37', '2017-02-15 21:56:37');
INSERT INTO `category_secondary` VALUES ('245', 'c', '241', '网络存储', '670-699-983', '1', '1', '0', '2017-02-15 21:56:37', '2017-02-15 21:56:37');
INSERT INTO `category_secondary` VALUES ('246', 'c', '241', '网卡', '670-699-701', '1', '1', '0', '2017-02-15 21:56:37', '2017-02-15 21:56:37');
INSERT INTO `category_secondary` VALUES ('247', 'c', '241', '4G/3G上网', '670-699-1098', '1', '1', '0', '2017-02-15 21:56:37', '2017-02-15 21:56:37');
INSERT INTO `category_secondary` VALUES ('248', 'c', '241', '网络配件', '670-699-12370', '1', '1', '0', '2017-02-15 21:56:37', '2017-02-15 21:56:37');
INSERT INTO `category_secondary` VALUES ('249', 'c', '194', '办公设备', '670-716', '1', '1', '1', '2017-02-15 21:56:37', '2017-02-15 21:56:37');
INSERT INTO `category_secondary` VALUES ('25', 'a', '1', '厨卫大电', 'chuwei.jd.com/', '1', '1', '1', '2017-02-15 21:56:33', '2017-02-15 21:56:33');
INSERT INTO `category_secondary` VALUES ('250', 'c', '249', '投影机', '670-716-722', '1', '1', '0', '2017-02-15 21:56:37', '2017-02-15 21:56:37');
INSERT INTO `category_secondary` VALUES ('251', 'c', '249', '投影配件', '670-716-5010', '1', '1', '0', '2017-02-15 21:56:37', '2017-02-15 21:56:37');
INSERT INTO `category_secondary` VALUES ('252', 'c', '249', '多功能一体机', '670-716-720', '1', '1', '0', '2017-02-15 21:56:37', '2017-02-15 21:56:37');
INSERT INTO `category_secondary` VALUES ('253', 'c', '249', '打印机', '670-716-717', '1', '1', '0', '2017-02-15 21:56:37', '2017-02-15 21:56:37');
INSERT INTO `category_secondary` VALUES ('254', 'c', '249', '传真设备', '670-716-718', '1', '1', '0', '2017-02-15 21:56:37', '2017-02-15 21:56:37');
INSERT INTO `category_secondary` VALUES ('255', 'c', '249', '验钞/点钞机', '670-716-725', '1', '1', '0', '2017-02-15 21:56:37', '2017-02-15 21:56:37');
INSERT INTO `category_secondary` VALUES ('256', 'c', '249', '扫描设备', '670-716-721', '1', '1', '0', '2017-02-15 21:56:37', '2017-02-15 21:56:37');
INSERT INTO `category_secondary` VALUES ('257', 'c', '249', '复合机', '670-716-719', '1', '1', '0', '2017-02-15 21:56:37', '2017-02-15 21:56:37');
INSERT INTO `category_secondary` VALUES ('258', 'c', '249', '碎纸机', '670-716-723', '1', '1', '0', '2017-02-15 21:56:37', '2017-02-15 21:56:37');
INSERT INTO `category_secondary` VALUES ('259', 'c', '249', '考勤机', '670-716-724', '1', '1', '0', '2017-02-15 21:56:37', '2017-02-15 21:56:37');
INSERT INTO `category_secondary` VALUES ('26', 'a', '25', '油烟机', 'list.jd.com/list.html?cat=737,13297,1300&ev=%402047_584926&go=0&JL=3_%E4%BA%A7%E5%93%81%E7%B1%BB%E5%9E%8B_%E6%B2%B9%E7%83%9F%E6%9C%BA', '1', '1', '0', '2017-02-15 21:56:33', '2017-02-15 21:56:33');
INSERT INTO `category_secondary` VALUES ('260', 'c', '249', '收银机', '670-716-7373', '1', '1', '0', '2017-02-15 21:56:37', '2017-02-15 21:56:37');
INSERT INTO `category_secondary` VALUES ('261', 'c', '249', '会议音频视频', '670-716-7375', '1', '1', '0', '2017-02-15 21:56:37', '2017-02-15 21:56:37');
INSERT INTO `category_secondary` VALUES ('262', 'c', '249', '保险柜', '670-716-2601', '1', '1', '0', '2017-02-15 21:56:37', '2017-02-15 21:56:37');
INSERT INTO `category_secondary` VALUES ('263', 'c', '249', '装订/封装机', '670-716-4839', '1', '1', '0', '2017-02-15 21:56:37', '2017-02-15 21:56:37');
INSERT INTO `category_secondary` VALUES ('264', 'c', '249', '安防监控', '670-716-7374', '1', '1', '0', '2017-02-15 21:56:37', '2017-02-15 21:56:37');
INSERT INTO `category_secondary` VALUES ('265', 'c', '249', '办公家具', '670-716-11221', '1', '1', '0', '2017-02-15 21:56:37', '2017-02-15 21:56:37');
INSERT INTO `category_secondary` VALUES ('266', 'c', '249', '白板', '670-716-727', '1', '1', '0', '2017-02-15 21:56:37', '2017-02-15 21:56:37');
INSERT INTO `category_secondary` VALUES ('267', 'c', '194', '文具耗材', '670-729', '1', '1', '1', '2017-02-15 21:56:37', '2017-02-15 21:56:37');
INSERT INTO `category_secondary` VALUES ('268', 'c', '267', '硒鼓/墨粉', '670-729-730', '1', '1', '0', '2017-02-15 21:56:37', '2017-02-15 21:56:37');
INSERT INTO `category_secondary` VALUES ('269', 'c', '267', '墨盒', '670-729-731', '1', '1', '0', '2017-02-15 21:56:37', '2017-02-15 21:56:37');
INSERT INTO `category_secondary` VALUES ('27', 'a', '25', '燃气灶', '737-13297-13298', '1', '1', '0', '2017-02-15 21:56:33', '2017-02-15 21:56:33');
INSERT INTO `category_secondary` VALUES ('270', 'c', '267', '色带', '670-729-733', '1', '1', '0', '2017-02-15 21:56:37', '2017-02-15 21:56:37');
INSERT INTO `category_secondary` VALUES ('271', 'c', '267', '纸类', '670-729-736', '1', '1', '0', '2017-02-15 21:56:37', '2017-02-15 21:56:37');
INSERT INTO `category_secondary` VALUES ('272', 'c', '267', '办公文具', '670-729-4837', '1', '1', '0', '2017-02-15 21:56:37', '2017-02-15 21:56:37');
INSERT INTO `category_secondary` VALUES ('273', 'c', '267', '学生文具', '670-729-1449', '1', '1', '0', '2017-02-15 21:56:37', '2017-02-15 21:56:37');
INSERT INTO `category_secondary` VALUES ('274', 'c', '267', '文件管理', '670-729-4840', '1', '1', '0', '2017-02-15 21:56:37', '2017-02-15 21:56:37');
INSERT INTO `category_secondary` VALUES ('275', 'c', '267', '本册/便签', '670-729-7371', '1', '1', '0', '2017-02-15 21:56:37', '2017-02-15 21:56:37');
INSERT INTO `category_secondary` VALUES ('276', 'c', '267', '计算器', '670-729-728', '1', '1', '0', '2017-02-15 21:56:37', '2017-02-15 21:56:37');
INSERT INTO `category_secondary` VALUES ('277', 'c', '267', '笔类', '670-729-2603', '1', '1', '0', '2017-02-15 21:56:37', '2017-02-15 21:56:37');
INSERT INTO `category_secondary` VALUES ('278', 'c', '267', '画具画材', '670-729-12376', '1', '1', '0', '2017-02-15 21:56:37', '2017-02-15 21:56:37');
INSERT INTO `category_secondary` VALUES ('279', 'c', '267', '财会用品', '670-729-7372', '1', '1', '0', '2017-02-15 21:56:37', '2017-02-15 21:56:37');
INSERT INTO `category_secondary` VALUES ('28', 'a', '25', '烟灶套装', 'list.jd.com/list.html?cat=737,13297,1300&ev=%402047_15280&go=0&JL=3_%E4%BA%A7%E5%93%81%E7%B1%BB%E5%9E%8B_%E7%83%9F%E7%81%B6%E5%A5%97%E8%A3%85', '1', '1', '0', '2017-02-15 21:56:33', '2017-02-15 21:56:33');
INSERT INTO `category_secondary` VALUES ('280', 'c', '267', '刻录碟片/附件', '670-729-4838', '1', '1', '0', '2017-02-15 21:56:37', '2017-02-15 21:56:37');
INSERT INTO `category_secondary` VALUES ('281', 'c', '194', '服务产品', '670-703', '1', '1', '1', '2017-02-15 21:56:37', '2017-02-15 21:56:37');
INSERT INTO `category_secondary` VALUES ('282', 'c', '281', '延保服务', '670-703-10969', '1', '1', '0', '2017-02-15 21:56:37', '2017-02-15 21:56:37');
INSERT INTO `category_secondary` VALUES ('283', 'c', '281', '上门安装', '670-703-10011', '1', '1', '0', '2017-02-15 21:56:37', '2017-02-15 21:56:37');
INSERT INTO `category_secondary` VALUES ('284', 'c', '281', '维修保养', '670-703-12429', '1', '1', '0', '2017-02-15 21:56:37', '2017-02-15 21:56:37');
INSERT INTO `category_secondary` VALUES ('285', 'c', '281', '电脑软件', '670-703-5011', '1', '1', '0', '2017-02-15 21:56:37', '2017-02-15 21:56:37');
INSERT INTO `category_secondary` VALUES ('286', 'c', '-1', '玩3C', '3c.jd.com', '1', '1', '1', '2017-02-15 21:56:37', '2017-02-15 21:56:37');
INSERT INTO `category_secondary` VALUES ('287', 'c', '-1', '本周热卖', 'sale.jd.com/act/6hd0T3HtkcEmqjpM.html', '1', '1', '1', '2017-02-15 21:56:37', '2017-02-15 21:56:37');
INSERT INTO `category_secondary` VALUES ('288', 'c', '-1', '游戏部落', 'group.jd.com/index/20000001.htm', '1', '1', '1', '2017-02-15 21:56:37', '2017-02-15 21:56:37');
INSERT INTO `category_secondary` VALUES ('289', 'c', '-1', 'GAME+', '//gaming.jd.com/', '1', '1', '1', '2017-02-15 21:56:37', '2017-02-15 21:56:37');
INSERT INTO `category_secondary` VALUES ('29', 'a', '25', '消毒柜', '737-13297-1301', '1', '1', '0', '2017-02-15 21:56:33', '2017-02-15 21:56:33');
INSERT INTO `category_secondary` VALUES ('290', 'c', '-1', '装机大师', 'diy.jd.com/?cpdad=1DLSUE', '1', '1', '1', '2017-02-15 21:56:37', '2017-02-15 21:56:37');
INSERT INTO `category_secondary` VALUES ('291', 'c', '-1', '办公生活馆', 'bangong.jd.com', '1', '1', '1', '2017-02-15 21:56:37', '2017-02-15 21:56:37');
INSERT INTO `category_secondary` VALUES ('292', 'd', '0', '家居', 'channel.jd.com/home.html', '1', '1', '1', '2017-02-15 21:56:38', '2017-02-15 21:56:38');
INSERT INTO `category_secondary` VALUES ('293', 'd', '292', '厨具', 'channel.jd.com/kitchenware.html', '1', '1', '1', '2017-02-15 21:56:38', '2017-02-15 21:56:38');
INSERT INTO `category_secondary` VALUES ('294', 'd', '293', '烹饪锅具', '6196-6197', '1', '1', '0', '2017-02-15 21:56:38', '2017-02-15 21:56:38');
INSERT INTO `category_secondary` VALUES ('295', 'd', '293', '刀剪菜板', '6196-6198', '1', '1', '0', '2017-02-15 21:56:38', '2017-02-15 21:56:38');
INSERT INTO `category_secondary` VALUES ('296', 'd', '293', '厨房配件', '6196-6214', '1', '1', '0', '2017-02-15 21:56:38', '2017-02-15 21:56:38');
INSERT INTO `category_secondary` VALUES ('297', 'd', '293', '水具酒具', '6196-6219', '1', '1', '0', '2017-02-15 21:56:38', '2017-02-15 21:56:38');
INSERT INTO `category_secondary` VALUES ('298', 'd', '293', '餐具', '6196-6227', '1', '1', '0', '2017-02-15 21:56:38', '2017-02-15 21:56:38');
INSERT INTO `category_secondary` VALUES ('299', 'd', '293', '茶具/咖啡具', '6196-11143', '1', '1', '0', '2017-02-15 21:56:38', '2017-02-15 21:56:38');
INSERT INTO `category_secondary` VALUES ('3', 'a', '2', '合资品牌', 'list.jd.com/list.html?cat=737,794,798&ev=5305_7189&sort=sort_totalsales15_desc&trans=1&JL=3_%E5%93%81%E7%89%8C%E7%B1%BB%E5%9E%8B_%E5%90%88%E8%B5%84%E5%93%81%E7%89%8C#J_crumbsBar', '1', '1', '0', '2017-02-15 21:56:33', '2017-02-15 21:56:33');
INSERT INTO `category_secondary` VALUES ('30', 'a', '25', '洗碗机', '737-13297-13117', '1', '1', '0', '2017-02-15 21:56:33', '2017-02-15 21:56:33');
INSERT INTO `category_secondary` VALUES ('300', 'd', '293', '保温杯', '6196-6219-6223', '1', '1', '0', '2017-02-15 21:56:38', '2017-02-15 21:56:38');
INSERT INTO `category_secondary` VALUES ('301', 'd', '292', '家纺', '1620-1621', '1', '1', '1', '2017-02-15 21:56:38', '2017-02-15 21:56:38');
INSERT INTO `category_secondary` VALUES ('302', 'd', '301', '床品套件', '1620-1621-1626', '1', '1', '0', '2017-02-15 21:56:38', '2017-02-15 21:56:38');
INSERT INTO `category_secondary` VALUES ('303', 'd', '301', '被子', '1620-1621-1627', '1', '1', '0', '2017-02-15 21:56:38', '2017-02-15 21:56:38');
INSERT INTO `category_secondary` VALUES ('304', 'd', '301', '枕芯', '1620-1621-1628', '1', '1', '0', '2017-02-15 21:56:38', '2017-02-15 21:56:38');
INSERT INTO `category_secondary` VALUES ('305', 'd', '301', '蚊帐', '1620-1621-1632', '1', '1', '0', '2017-02-15 21:56:38', '2017-02-15 21:56:38');
INSERT INTO `category_secondary` VALUES ('306', 'd', '301', '凉席', '1620-1621-11963', '1', '1', '0', '2017-02-15 21:56:38', '2017-02-15 21:56:38');
INSERT INTO `category_secondary` VALUES ('307', 'd', '301', '毛巾浴巾', '1620-1621-1634', '1', '1', '0', '2017-02-15 21:56:38', '2017-02-15 21:56:38');
INSERT INTO `category_secondary` VALUES ('308', 'd', '301', '地毯地垫', '1620-11158-11160', '1', '1', '0', '2017-02-15 21:56:38', '2017-02-15 21:56:38');
INSERT INTO `category_secondary` VALUES ('309', 'd', '301', '床垫/床褥', '1620-1621-1631', '1', '1', '0', '2017-02-15 21:56:38', '2017-02-15 21:56:38');
INSERT INTO `category_secondary` VALUES ('31', 'a', '25', '电热水器', '737-13297-13690', '1', '1', '0', '2017-02-15 21:56:33', '2017-02-15 21:56:33');
INSERT INTO `category_secondary` VALUES ('310', 'd', '301', '毯子', '1620-1621-1630', '1', '1', '0', '2017-02-15 21:56:38', '2017-02-15 21:56:38');
INSERT INTO `category_secondary` VALUES ('311', 'd', '301', '抱枕靠垫', '1620-1621-1633', '1', '1', '0', '2017-02-15 21:56:38', '2017-02-15 21:56:38');
INSERT INTO `category_secondary` VALUES ('312', 'd', '301', '窗帘/窗纱', '1620-1621-4952', '1', '1', '0', '2017-02-15 21:56:38', '2017-02-15 21:56:38');
INSERT INTO `category_secondary` VALUES ('313', 'd', '301', '床单/床笠', '1620-1621-1629', '1', '1', '0', '2017-02-15 21:56:38', '2017-02-15 21:56:38');
INSERT INTO `category_secondary` VALUES ('314', 'd', '301', '被套', '1620-1621-13818', '1', '1', '0', '2017-02-15 21:56:38', '2017-02-15 21:56:38');
INSERT INTO `category_secondary` VALUES ('315', 'd', '301', '枕巾枕套', '1620-1621-13819', '1', '1', '0', '2017-02-15 21:56:38', '2017-02-15 21:56:38');
INSERT INTO `category_secondary` VALUES ('316', 'd', '301', '沙发垫套/椅垫', '1620-11158-11161', '1', '1', '0', '2017-02-15 21:56:38', '2017-02-15 21:56:38');
INSERT INTO `category_secondary` VALUES ('317', 'd', '301', '桌布/罩件', '1620-11158-11159', '1', '1', '0', '2017-02-15 21:56:38', '2017-02-15 21:56:38');
INSERT INTO `category_secondary` VALUES ('318', 'd', '301', '电热毯', '1620-1621-2688', '1', '1', '0', '2017-02-15 21:56:38', '2017-02-15 21:56:38');
INSERT INTO `category_secondary` VALUES ('319', 'd', '301', '布艺软饰', '1620-1621-11962', '1', '1', '0', '2017-02-15 21:56:38', '2017-02-15 21:56:38');
INSERT INTO `category_secondary` VALUES ('32', 'a', '25', '燃气热水器', '737-13297-13691', '1', '1', '0', '2017-02-15 21:56:33', '2017-02-15 21:56:33');
INSERT INTO `category_secondary` VALUES ('320', 'd', '292', '生活日用', '1620-1624', '1', '1', '1', '2017-02-15 21:56:38', '2017-02-15 21:56:38');
INSERT INTO `category_secondary` VALUES ('321', 'd', '320', '收纳用品', 'list.jd.com/list.html?cat=1620,13780', '1', '1', '0', '2017-02-15 21:56:38', '2017-02-15 21:56:38');
INSERT INTO `category_secondary` VALUES ('322', 'd', '320', '雨伞雨具', '1620-1624-1656', '1', '1', '0', '2017-02-15 21:56:38', '2017-02-15 21:56:38');
INSERT INTO `category_secondary` VALUES ('323', 'd', '320', '净化除味', '1620-1624-1661', '1', '1', '0', '2017-02-15 21:56:38', '2017-02-15 21:56:38');
INSERT INTO `category_secondary` VALUES ('324', 'd', '320', '浴室用品', '1620-1624-1657', '1', '1', '0', '2017-02-15 21:56:38', '2017-02-15 21:56:38');
INSERT INTO `category_secondary` VALUES ('325', 'd', '320', '洗晒/熨烫', '1620-1624-1660', '1', '1', '0', '2017-02-15 21:56:38', '2017-02-15 21:56:38');
INSERT INTO `category_secondary` VALUES ('326', 'd', '320', '缝纫/针织用品', '1620-1624-1658', '1', '1', '0', '2017-02-15 21:56:38', '2017-02-15 21:56:38');
INSERT INTO `category_secondary` VALUES ('327', 'd', '320', '清洁工具', '1620-1625-1667', '1', '1', '0', '2017-02-15 21:56:38', '2017-02-15 21:56:38');
INSERT INTO `category_secondary` VALUES ('328', 'd', '292', '家装软饰', '1620-11158', '1', '1', '1', '2017-02-15 21:56:38', '2017-02-15 21:56:38');
INSERT INTO `category_secondary` VALUES ('329', 'd', '328', '装饰字画', '1620-11158-11163', '1', '1', '0', '2017-02-15 21:56:38', '2017-02-15 21:56:38');
INSERT INTO `category_secondary` VALUES ('33', 'a', '25', '嵌入式厨电', 'coll.jd.com/list.html?sub=1661', '1', '1', '0', '2017-02-15 21:56:33', '2017-02-15 21:56:33');
INSERT INTO `category_secondary` VALUES ('330', 'd', '328', '装饰摆件', '1620-11158-11166', '1', '1', '0', '2017-02-15 21:56:38', '2017-02-15 21:56:38');
INSERT INTO `category_secondary` VALUES ('331', 'd', '328', '手工/十字绣', '1620-11158-11165', '1', '1', '0', '2017-02-15 21:56:38', '2017-02-15 21:56:38');
INSERT INTO `category_secondary` VALUES ('332', 'd', '328', '相框/照片墙', '1620-11158-11162', '1', '1', '0', '2017-02-15 21:56:38', '2017-02-15 21:56:38');
INSERT INTO `category_secondary` VALUES ('333', 'd', '328', '墙贴/装饰贴', '1620-11158-11965', '1', '1', '0', '2017-02-15 21:56:38', '2017-02-15 21:56:38');
INSERT INTO `category_secondary` VALUES ('334', 'd', '328', '花瓶花艺', '1620-11158-11967', '1', '1', '0', '2017-02-15 21:56:38', '2017-02-15 21:56:38');
INSERT INTO `category_secondary` VALUES ('335', 'd', '328', '香薰蜡烛', '1620-11158-11968', '1', '1', '0', '2017-02-15 21:56:38', '2017-02-15 21:56:38');
INSERT INTO `category_secondary` VALUES ('336', 'd', '328', '节庆饰品', '1620-11158-11164', '1', '1', '0', '2017-02-15 21:56:38', '2017-02-15 21:56:38');
INSERT INTO `category_secondary` VALUES ('337', 'd', '328', '钟饰', '1620-11158-11966', '1', '1', '0', '2017-02-15 21:56:38', '2017-02-15 21:56:38');
INSERT INTO `category_secondary` VALUES ('338', 'd', '328', '帘艺隔断', '1620-11158-11964', '1', '1', '0', '2017-02-15 21:56:38', '2017-02-15 21:56:38');
INSERT INTO `category_secondary` VALUES ('339', 'd', '328', '创意家居', '1620-11158-11969', '1', '1', '0', '2017-02-15 21:56:38', '2017-02-15 21:56:38');
INSERT INTO `category_secondary` VALUES ('34', 'a', '1', '厨房小电', '737-752', '1', '1', '1', '2017-02-15 21:56:33', '2017-02-15 21:56:33');
INSERT INTO `category_secondary` VALUES ('340', 'd', '328', '保暖防护', '1620-11158-11167', '1', '1', '0', '2017-02-15 21:56:38', '2017-02-15 21:56:38');
INSERT INTO `category_secondary` VALUES ('341', 'd', '292', '灯具', '9855-9856', '1', '1', '1', '2017-02-15 21:56:38', '2017-02-15 21:56:38');
INSERT INTO `category_secondary` VALUES ('342', 'd', '341', '吸顶灯', '9855-9856-9904', '1', '1', '0', '2017-02-15 21:56:38', '2017-02-15 21:56:38');
INSERT INTO `category_secondary` VALUES ('343', 'd', '341', '吊灯', '9855-9856-9906', '1', '1', '0', '2017-02-15 21:56:38', '2017-02-15 21:56:38');
INSERT INTO `category_secondary` VALUES ('344', 'd', '341', '台灯', '9855-9856-9898', '1', '1', '0', '2017-02-15 21:56:38', '2017-02-15 21:56:38');
INSERT INTO `category_secondary` VALUES ('345', 'd', '341', '筒灯射灯', '9855-9856-11949', '1', '1', '0', '2017-02-15 21:56:38', '2017-02-15 21:56:38');
INSERT INTO `category_secondary` VALUES ('346', 'd', '341', '装饰灯', '9855-9856-9900', '1', '1', '0', '2017-02-15 21:56:38', '2017-02-15 21:56:38');
INSERT INTO `category_secondary` VALUES ('347', 'd', '341', 'LED灯', '9855-9856-9903', '1', '1', '0', '2017-02-15 21:56:38', '2017-02-15 21:56:38');
INSERT INTO `category_secondary` VALUES ('348', 'd', '341', '氛围照明', '9855-9856-9905', '1', '1', '0', '2017-02-15 21:56:38', '2017-02-15 21:56:38');
INSERT INTO `category_secondary` VALUES ('349', 'd', '341', '落地灯', '9855-9856-9901', '1', '1', '0', '2017-02-15 21:56:38', '2017-02-15 21:56:38');
INSERT INTO `category_secondary` VALUES ('35', 'a', '34', '电饭煲', '737-752-753', '1', '1', '0', '2017-02-15 21:56:33', '2017-02-15 21:56:33');
INSERT INTO `category_secondary` VALUES ('350', 'd', '341', '庭院灯', '9855-9856-11950', '1', '1', '0', '2017-02-15 21:56:38', '2017-02-15 21:56:38');
INSERT INTO `category_secondary` VALUES ('351', 'd', '341', '应急灯/手电', '9855-9856-9902', '1', '1', '0', '2017-02-15 21:56:38', '2017-02-15 21:56:38');
INSERT INTO `category_secondary` VALUES ('352', 'd', '341', '节能灯', '9855-9856-9899', '1', '1', '0', '2017-02-15 21:56:38', '2017-02-15 21:56:38');
INSERT INTO `category_secondary` VALUES ('353', 'd', '292', '家具', 'channel.jd.com/furniture.html', '1', '1', '1', '2017-02-15 21:56:38', '2017-02-15 21:56:38');
INSERT INTO `category_secondary` VALUES ('354', 'd', '353', '卧室家具', '9847-9848', '1', '1', '0', '2017-02-15 21:56:38', '2017-02-15 21:56:38');
INSERT INTO `category_secondary` VALUES ('355', 'd', '353', '客厅家具', '9847-9849', '1', '1', '0', '2017-02-15 21:56:38', '2017-02-15 21:56:38');
INSERT INTO `category_secondary` VALUES ('356', 'd', '353', '餐厅家具', '9847-9850', '1', '1', '0', '2017-02-15 21:56:38', '2017-02-15 21:56:38');
INSERT INTO `category_secondary` VALUES ('357', 'd', '353', '书房家具', '9847-9851', '1', '1', '0', '2017-02-15 21:56:38', '2017-02-15 21:56:38');
INSERT INTO `category_secondary` VALUES ('358', 'd', '353', '儿童家具', 'list.jd.com/9847-13533.html', '1', '1', '0', '2017-02-15 21:56:38', '2017-02-15 21:56:38');
INSERT INTO `category_secondary` VALUES ('359', 'd', '353', '储物家具', '9847-9852', '1', '1', '0', '2017-02-15 21:56:38', '2017-02-15 21:56:38');
INSERT INTO `category_secondary` VALUES ('36', 'a', '34', '微波炉', '737-752-758', '1', '1', '0', '2017-02-15 21:56:33', '2017-02-15 21:56:33');
INSERT INTO `category_secondary` VALUES ('360', 'd', '353', '阳台/户外', '9847-9853', '1', '1', '0', '2017-02-15 21:56:38', '2017-02-15 21:56:38');
INSERT INTO `category_secondary` VALUES ('361', 'd', '353', '办公家具', '9847-9854', '1', '1', '0', '2017-02-15 21:56:38', '2017-02-15 21:56:38');
INSERT INTO `category_secondary` VALUES ('362', 'd', '353', '床', '9847-9848-9863', '1', '1', '0', '2017-02-15 21:56:38', '2017-02-15 21:56:38');
INSERT INTO `category_secondary` VALUES ('363', 'd', '353', '床垫', '9847-9848-9864', '1', '1', '0', '2017-02-15 21:56:38', '2017-02-15 21:56:38');
INSERT INTO `category_secondary` VALUES ('364', 'd', '353', '沙发', '9847-9849-9870', '1', '1', '0', '2017-02-15 21:56:38', '2017-02-15 21:56:38');
INSERT INTO `category_secondary` VALUES ('365', 'd', '353', '电脑椅', '9847-9851-9882', '1', '1', '0', '2017-02-15 21:56:38', '2017-02-15 21:56:38');
INSERT INTO `category_secondary` VALUES ('366', 'd', '353', '衣柜', '9847-9848-11972', '1', '1', '0', '2017-02-15 21:56:38', '2017-02-15 21:56:38');
INSERT INTO `category_secondary` VALUES ('367', 'd', '353', '茶几', '9847-9849-9872', '1', '1', '0', '2017-02-15 21:56:38', '2017-02-15 21:56:38');
INSERT INTO `category_secondary` VALUES ('368', 'd', '353', '电视柜', '9847-9849-9873', '1', '1', '0', '2017-02-15 21:56:38', '2017-02-15 21:56:38');
INSERT INTO `category_secondary` VALUES ('369', 'd', '353', '餐桌', '9847-9850-9877', '1', '1', '0', '2017-02-15 21:56:38', '2017-02-15 21:56:38');
INSERT INTO `category_secondary` VALUES ('37', 'a', '34', '电烤箱', '737-752-759', '1', '1', '0', '2017-02-15 21:56:33', '2017-02-15 21:56:33');
INSERT INTO `category_secondary` VALUES ('370', 'd', '353', '电脑桌', '9847-9851-11973', '1', '1', '0', '2017-02-15 21:56:38', '2017-02-15 21:56:38');
INSERT INTO `category_secondary` VALUES ('371', 'd', '353', '鞋架/衣帽架', '9847-9852-9885', '1', '1', '0', '2017-02-15 21:56:38', '2017-02-15 21:56:38');
INSERT INTO `category_secondary` VALUES ('372', 'd', '353', '儿童桌椅', '9847-13533-13540', '1', '1', '0', '2017-02-15 21:56:38', '2017-02-15 21:56:38');
INSERT INTO `category_secondary` VALUES ('373', 'd', '353', '儿童床', '9847-13533-13534', '1', '1', '0', '2017-02-15 21:56:38', '2017-02-15 21:56:38');
INSERT INTO `category_secondary` VALUES ('374', 'd', '353', '晾衣架', '9847-9853-9889', '1', '1', '0', '2017-02-15 21:56:38', '2017-02-15 21:56:38');
INSERT INTO `category_secondary` VALUES ('375', 'd', '292', '家装主材', '9855-9860', '1', '1', '1', '2017-02-15 21:56:38', '2017-02-15 21:56:38');
INSERT INTO `category_secondary` VALUES ('376', 'd', '375', '瓷砖', '9855-9860-9933', '1', '1', '0', '2017-02-15 21:56:38', '2017-02-15 21:56:38');
INSERT INTO `category_secondary` VALUES ('377', 'd', '375', '地板', '9855-9860-9934', '1', '1', '0', '2017-02-15 21:56:38', '2017-02-15 21:56:38');
INSERT INTO `category_secondary` VALUES ('378', 'd', '375', '油漆涂料', '9855-9860-9931', '1', '1', '0', '2017-02-15 21:56:38', '2017-02-15 21:56:38');
INSERT INTO `category_secondary` VALUES ('379', 'd', '375', '壁纸', '9855-9860-9932', '1', '1', '0', '2017-02-15 21:56:38', '2017-02-15 21:56:38');
INSERT INTO `category_secondary` VALUES ('38', 'a', '34', '电磁炉', '737-752-757', '1', '1', '0', '2017-02-15 21:56:33', '2017-02-15 21:56:33');
INSERT INTO `category_secondary` VALUES ('380', 'd', '375', '涂刷辅料', '9855-9860-11959', '1', '1', '0', '2017-02-15 21:56:38', '2017-02-15 21:56:38');
INSERT INTO `category_secondary` VALUES ('381', 'd', '292', '厨房卫浴', '9855-9857', '1', '1', '1', '2017-02-15 21:56:38', '2017-02-15 21:56:38');
INSERT INTO `category_secondary` VALUES ('382', 'd', '381', '水槽', '9855-9857-9913', '1', '1', '0', '2017-02-15 21:56:38', '2017-02-15 21:56:38');
INSERT INTO `category_secondary` VALUES ('383', 'd', '381', '龙头', '9855-9857-9909', '1', '1', '0', '2017-02-15 21:56:38', '2017-02-15 21:56:38');
INSERT INTO `category_secondary` VALUES ('384', 'd', '381', '淋浴花洒', '9855-9857-9907', '1', '1', '0', '2017-02-15 21:56:38', '2017-02-15 21:56:38');
INSERT INTO `category_secondary` VALUES ('385', 'd', '381', '马桶', '9855-9857-9910', '1', '1', '0', '2017-02-15 21:56:38', '2017-02-15 21:56:38');
INSERT INTO `category_secondary` VALUES ('386', 'd', '381', '智能马桶盖', '9855-9857-13754', '1', '1', '0', '2017-02-15 21:56:38', '2017-02-15 21:56:38');
INSERT INTO `category_secondary` VALUES ('387', 'd', '381', '厨卫挂件', '9855-9857-9908', '1', '1', '0', '2017-02-15 21:56:38', '2017-02-15 21:56:38');
INSERT INTO `category_secondary` VALUES ('388', 'd', '381', '浴室柜', '9855-9857-9911', '1', '1', '0', '2017-02-15 21:56:38', '2017-02-15 21:56:38');
INSERT INTO `category_secondary` VALUES ('389', 'd', '381', '浴霸/换气扇', '9855-9861-11960', '1', '1', '0', '2017-02-15 21:56:38', '2017-02-15 21:56:38');
INSERT INTO `category_secondary` VALUES ('39', 'a', '34', '电压力锅', '737-752-881', '1', '1', '0', '2017-02-15 21:56:33', '2017-02-15 21:56:33');
INSERT INTO `category_secondary` VALUES ('390', 'd', '292', '五金电工', 'wjdg.jd.com/', '1', '1', '1', '2017-02-15 21:56:38', '2017-02-15 21:56:38');
INSERT INTO `category_secondary` VALUES ('391', 'd', '390', '锁具', '9855-9858-9919', '1', '1', '0', '2017-02-15 21:56:38', '2017-02-15 21:56:38');
INSERT INTO `category_secondary` VALUES ('392', 'd', '390', '电动工具', '9855-9858-9922', '1', '1', '0', '2017-02-15 21:56:38', '2017-02-15 21:56:38');
INSERT INTO `category_secondary` VALUES ('393', 'd', '390', '手动工具', '9855-9858-9921', '1', '1', '0', '2017-02-15 21:56:38', '2017-02-15 21:56:38');
INSERT INTO `category_secondary` VALUES ('394', 'd', '390', '测量工具', '9855-9858-9923', '1', '1', '0', '2017-02-15 21:56:38', '2017-02-15 21:56:38');
INSERT INTO `category_secondary` VALUES ('395', 'd', '390', '劳防用品', '9855-9858-9924', '1', '1', '0', '2017-02-15 21:56:38', '2017-02-15 21:56:38');
INSERT INTO `category_secondary` VALUES ('396', 'd', '390', '开关插座', '9855-9859-9926', '1', '1', '0', '2017-02-15 21:56:38', '2017-02-15 21:56:38');
INSERT INTO `category_secondary` VALUES ('397', 'd', '390', '门铃', '9855-9859-13751', '1', '1', '0', '2017-02-15 21:56:38', '2017-02-15 21:56:38');
INSERT INTO `category_secondary` VALUES ('398', 'd', '390', '监控安防', '9855-9859-13752', '1', '1', '0', '2017-02-15 21:56:38', '2017-02-15 21:56:38');
INSERT INTO `category_secondary` VALUES ('399', 'd', '390', '配电箱/断路器', '9855-9859-9928', '1', '1', '0', '2017-02-15 21:56:38', '2017-02-15 21:56:38');
INSERT INTO `category_secondary` VALUES ('4', 'a', '2', '国产品牌', 'list.jd.com/list.html?cat=737,794,798&ev=5305_7188&sort=sort_totalsales15_desc&trans=1&JL=2_1_0#J_crumbsBar', '1', '1', '0', '2017-02-15 21:56:33', '2017-02-15 21:56:33');
INSERT INTO `category_secondary` VALUES ('40', 'a', '34', '豆浆机', '737-752-756', '1', '1', '0', '2017-02-15 21:56:33', '2017-02-15 21:56:33');
INSERT INTO `category_secondary` VALUES ('400', 'd', '292', '装修定制', '9855-9862', '1', '1', '1', '2017-02-15 21:56:38', '2017-02-15 21:56:38');
INSERT INTO `category_secondary` VALUES ('401', 'd', '400', '装修设计', '9855-9862-9943', '1', '1', '0', '2017-02-15 21:56:38', '2017-02-15 21:56:38');
INSERT INTO `category_secondary` VALUES ('402', 'd', '400', '装修施工', '9855-9862-9944', '1', '1', '0', '2017-02-15 21:56:38', '2017-02-15 21:56:38');
INSERT INTO `category_secondary` VALUES ('403', 'd', '400', '淋浴房', '9855-9857-11957', '1', '1', '0', '2017-02-15 21:56:38', '2017-02-15 21:56:38');
INSERT INTO `category_secondary` VALUES ('404', 'd', '400', '橱柜', '9855-9857-9915', '1', '1', '0', '2017-02-15 21:56:38', '2017-02-15 21:56:38');
INSERT INTO `category_secondary` VALUES ('405', 'd', '400', '集成吊顶', '9855-9861-9937', '1', '1', '0', '2017-02-15 21:56:38', '2017-02-15 21:56:38');
INSERT INTO `category_secondary` VALUES ('406', 'd', '400', '门', '9855-9861-9939', '1', '1', '0', '2017-02-15 21:56:38', '2017-02-15 21:56:38');
INSERT INTO `category_secondary` VALUES ('407', 'd', '400', '窗', '9855-9861-9940', '1', '1', '0', '2017-02-15 21:56:38', '2017-02-15 21:56:38');
INSERT INTO `category_secondary` VALUES ('408', 'd', '400', '壁挂炉', '9855-9861-11961', '1', '1', '0', '2017-02-15 21:56:38', '2017-02-15 21:56:38');
INSERT INTO `category_secondary` VALUES ('409', 'd', '400', '散热器', '9855-9861-9938', '1', '1', '0', '2017-02-15 21:56:38', '2017-02-15 21:56:38');
INSERT INTO `category_secondary` VALUES ('41', 'a', '34', '咖啡机', '737-752-761', '1', '1', '0', '2017-02-15 21:56:33', '2017-02-15 21:56:33');
INSERT INTO `category_secondary` VALUES ('410', 'd', '400', '安装服务', '9855-9862-9948', '1', '1', '0', '2017-02-15 21:56:38', '2017-02-15 21:56:38');
INSERT INTO `category_secondary` VALUES ('411', 'd', '0', '家具', 'channel.jd.com/furniture.html', '1', '1', '0', '2017-02-15 21:56:38', '2017-02-15 21:56:38');
INSERT INTO `category_secondary` VALUES ('412', 'd', '0', '家装', 'channel.jd.com/decoration.html', '1', '1', '0', '2017-02-15 21:56:38', '2017-02-15 21:56:38');
INSERT INTO `category_secondary` VALUES ('413', 'd', '0', '厨具', 'channel.jd.com/kitchenware.html', '1', '1', '0', '2017-02-15 21:56:38', '2017-02-15 21:56:38');
INSERT INTO `category_secondary` VALUES ('414', 'd', '-1', '家装城', 'channel.jd.com/jiazhuang.html', '1', '1', '1', '2017-02-15 21:56:38', '2017-02-15 21:56:38');
INSERT INTO `category_secondary` VALUES ('415', 'd', '-1', '居家日用', 'channel.jd.com/home.html', '1', '1', '1', '2017-02-15 21:56:38', '2017-02-15 21:56:38');
INSERT INTO `category_secondary` VALUES ('416', 'd', '-1', '精品家具', 'channel.jd.com/furniture.html', '1', '1', '1', '2017-02-15 21:56:38', '2017-02-15 21:56:38');
INSERT INTO `category_secondary` VALUES ('417', 'd', '-1', '家装建材', 'channel.jd.com/decoration.html', '1', '1', '1', '2017-02-15 21:56:38', '2017-02-15 21:56:38');
INSERT INTO `category_secondary` VALUES ('418', 'd', '-1', '厨房达人', 'channel.jd.com/kitchenware.html', '1', '1', '1', '2017-02-15 21:56:38', '2017-02-15 21:56:38');
INSERT INTO `category_secondary` VALUES ('419', 'd', '-1', '装修服务', 'channel.jd.com/9855-9862.html', '1', '1', '1', '2017-02-15 21:56:38', '2017-02-15 21:56:38');
INSERT INTO `category_secondary` VALUES ('42', 'a', '34', '面包机', '737-752-899', '1', '1', '0', '2017-02-15 21:56:33', '2017-02-15 21:56:33');
INSERT INTO `category_secondary` VALUES ('420', 'e', '0', '男装', 'channel.jd.com/1315-1342.html', '1', '1', '1', '2017-02-15 21:56:40', '2017-02-15 21:56:40');
INSERT INTO `category_secondary` VALUES ('421', 'e', '420', '女装', '1315-1343', '1', '1', '1', '2017-02-15 21:56:40', '2017-02-15 21:56:40');
INSERT INTO `category_secondary` VALUES ('422', 'e', '421', '商场同款', 'coll.jd.com/list.html?sub=11852', '1', '1', '0', '2017-02-15 21:56:40', '2017-02-15 21:56:40');
INSERT INTO `category_secondary` VALUES ('423', 'e', '421', '当季热卖', 'list.jd.com/list.html?tid=1001053', '1', '1', '0', '2017-02-15 21:56:40', '2017-02-15 21:56:40');
INSERT INTO `category_secondary` VALUES ('424', 'e', '421', '2017新品', 'list.jd.com/list.html?tid=1000145', '1', '1', '0', '2017-02-15 21:56:40', '2017-02-15 21:56:40');
INSERT INTO `category_secondary` VALUES ('425', 'e', '421', '时尚套装', 'list.jd.com/list.html?tid=1000144', '1', '1', '0', '2017-02-15 21:56:40', '2017-02-15 21:56:40');
INSERT INTO `category_secondary` VALUES ('426', 'e', '421', '毛呢大衣', '1315-1343-9706', '1', '1', '0', '2017-02-15 21:56:40', '2017-02-15 21:56:40');
INSERT INTO `category_secondary` VALUES ('427', 'e', '421', '羽绒服', '1315-1343-3983', '1', '1', '0', '2017-02-15 21:56:40', '2017-02-15 21:56:40');
INSERT INTO `category_secondary` VALUES ('428', 'e', '421', '连衣裙', '1315-1343-9719', '1', '1', '0', '2017-02-15 21:56:40', '2017-02-15 21:56:40');
INSERT INTO `category_secondary` VALUES ('429', 'e', '421', '针织衫', '1315-1343-1356', '1', '1', '0', '2017-02-15 21:56:40', '2017-02-15 21:56:40');
INSERT INTO `category_secondary` VALUES ('43', 'a', '34', '榨汁机', '737-752-13116', '1', '1', '0', '2017-02-15 21:56:33', '2017-02-15 21:56:33');
INSERT INTO `category_secondary` VALUES ('430', 'e', '421', '卫衣', '1315-1343-9710', '1', '1', '0', '2017-02-15 21:56:40', '2017-02-15 21:56:40');
INSERT INTO `category_secondary` VALUES ('431', 'e', '421', '牛仔裤', '1315-1343-9715', '1', '1', '0', '2017-02-15 21:56:40', '2017-02-15 21:56:40');
INSERT INTO `category_secondary` VALUES ('432', 'e', '421', '风衣', '1315-1343-9708', '1', '1', '0', '2017-02-15 21:56:40', '2017-02-15 21:56:40');
INSERT INTO `category_secondary` VALUES ('433', 'e', '421', 'T恤', '1315-1343-1355', '1', '1', '0', '2017-02-15 21:56:40', '2017-02-15 21:56:40');
INSERT INTO `category_secondary` VALUES ('434', 'e', '421', '衬衫', '1315-1343-1354', '1', '1', '0', '2017-02-15 21:56:40', '2017-02-15 21:56:40');
INSERT INTO `category_secondary` VALUES ('435', 'e', '421', '短外套', '1315-1343-9712', '1', '1', '0', '2017-02-15 21:56:40', '2017-02-15 21:56:40');
INSERT INTO `category_secondary` VALUES ('436', 'e', '421', '打底衫', '1315-1343-11985', '1', '1', '0', '2017-02-15 21:56:40', '2017-02-15 21:56:40');
INSERT INTO `category_secondary` VALUES ('437', 'e', '421', '打底裤', '1315-1343-9716', '1', '1', '0', '2017-02-15 21:56:40', '2017-02-15 21:56:40');
INSERT INTO `category_secondary` VALUES ('438', 'e', '421', '棉服', '1315-1343-9705', '1', '1', '0', '2017-02-15 21:56:40', '2017-02-15 21:56:40');
INSERT INTO `category_secondary` VALUES ('439', 'e', '421', '皮草', '1315-1343-11993', '1', '1', '0', '2017-02-15 21:56:40', '2017-02-15 21:56:40');
INSERT INTO `category_secondary` VALUES ('44', 'a', '34', '料理机', '737-752-755', '1', '1', '0', '2017-02-15 21:56:33', '2017-02-15 21:56:33');
INSERT INTO `category_secondary` VALUES ('440', 'e', '421', '羊毛衫', '1315-1343-11999', '1', '1', '0', '2017-02-15 21:56:40', '2017-02-15 21:56:40');
INSERT INTO `category_secondary` VALUES ('441', 'e', '421', '羊绒衫', '1315-1343-11989', '1', '1', '0', '2017-02-15 21:56:40', '2017-02-15 21:56:40');
INSERT INTO `category_secondary` VALUES ('442', 'e', '421', '真皮皮衣', '1315-1343-9707', '1', '1', '0', '2017-02-15 21:56:40', '2017-02-15 21:56:40');
INSERT INTO `category_secondary` VALUES ('443', 'e', '421', '小西装', '1315-1343-9711', '1', '1', '0', '2017-02-15 21:56:40', '2017-02-15 21:56:40');
INSERT INTO `category_secondary` VALUES ('444', 'e', '421', '休闲裤', '1315-1343-9717', '1', '1', '0', '2017-02-15 21:56:40', '2017-02-15 21:56:40');
INSERT INTO `category_secondary` VALUES ('445', 'e', '421', '大码女装', '1315-1343-9722', '1', '1', '0', '2017-02-15 21:56:40', '2017-02-15 21:56:40');
INSERT INTO `category_secondary` VALUES ('446', 'e', '421', '中老年女装', '1315-1343-9721', '1', '1', '0', '2017-02-15 21:56:40', '2017-02-15 21:56:40');
INSERT INTO `category_secondary` VALUES ('447', 'e', '421', '设计师/潮牌', 'coll.jd.com/list.html?sub=5956', '1', '1', '0', '2017-02-15 21:56:40', '2017-02-15 21:56:40');
INSERT INTO `category_secondary` VALUES ('448', 'e', '421', '半身裙', '1315-1343-9720', '1', '1', '0', '2017-02-15 21:56:40', '2017-02-15 21:56:40');
INSERT INTO `category_secondary` VALUES ('449', 'e', '421', '仿皮皮衣', '1315-1343-11998', '1', '1', '0', '2017-02-15 21:56:40', '2017-02-15 21:56:40');
INSERT INTO `category_secondary` VALUES ('45', 'a', '34', '电饼铛', '737-752-882', '1', '1', '0', '2017-02-15 21:56:33', '2017-02-15 21:56:33');
INSERT INTO `category_secondary` VALUES ('450', 'e', '421', '马甲', '1315-1343-9714', '1', '1', '0', '2017-02-15 21:56:40', '2017-02-15 21:56:40');
INSERT INTO `category_secondary` VALUES ('451', 'e', '421', '正装裤', '1315-1343-9718', '1', '1', '0', '2017-02-15 21:56:40', '2017-02-15 21:56:40');
INSERT INTO `category_secondary` VALUES ('452', 'e', '421', '加绒裤', '1315-1343-11987', '1', '1', '0', '2017-02-15 21:56:40', '2017-02-15 21:56:40');
INSERT INTO `category_secondary` VALUES ('453', 'e', '421', '婚纱', '1315-1343-9723', '1', '1', '0', '2017-02-15 21:56:40', '2017-02-15 21:56:40');
INSERT INTO `category_secondary` VALUES ('454', 'e', '421', '礼服', '1315-1343-11996', '1', '1', '0', '2017-02-15 21:56:40', '2017-02-15 21:56:40');
INSERT INTO `category_secondary` VALUES ('455', 'e', '421', '旗袍/唐装', '1315-1343-11986', '1', '1', '0', '2017-02-15 21:56:40', '2017-02-15 21:56:40');
INSERT INTO `category_secondary` VALUES ('456', 'e', '421', '雪纺衫', '1315-1343-9713', '1', '1', '0', '2017-02-15 21:56:40', '2017-02-15 21:56:40');
INSERT INTO `category_secondary` VALUES ('457', 'e', '421', '吊带/背心', '1315-1343-11988', '1', '1', '0', '2017-02-15 21:56:40', '2017-02-15 21:56:40');
INSERT INTO `category_secondary` VALUES ('458', 'e', '421', '短裤', '1315-1343-11991', '1', '1', '0', '2017-02-15 21:56:40', '2017-02-15 21:56:40');
INSERT INTO `category_secondary` VALUES ('459', 'e', '420', '男装', '1315-1342', '1', '1', '1', '2017-02-15 21:56:40', '2017-02-15 21:56:40');
INSERT INTO `category_secondary` VALUES ('46', 'a', '34', '养生壶/煎药壶', '737-752-12397', '1', '1', '0', '2017-02-15 21:56:33', '2017-02-15 21:56:33');
INSERT INTO `category_secondary` VALUES ('460', 'e', '459', '商场同款', 'coll.jd.com/list.html?sub=11850', '1', '1', '0', '2017-02-15 21:56:40', '2017-02-15 21:56:40');
INSERT INTO `category_secondary` VALUES ('461', 'e', '459', '当季热卖', 'list.jd.com/list.html?tid=1000157', '1', '1', '0', '2017-02-15 21:56:40', '2017-02-15 21:56:40');
INSERT INTO `category_secondary` VALUES ('462', 'e', '459', '2017新品', 'list.jd.com/list.html?tid=1000147', '1', '1', '0', '2017-02-15 21:56:40', '2017-02-15 21:56:40');
INSERT INTO `category_secondary` VALUES ('463', 'e', '459', '羽绒服', '1315-1342-3982', '1', '1', '0', '2017-02-15 21:56:40', '2017-02-15 21:56:40');
INSERT INTO `category_secondary` VALUES ('464', 'e', '459', '棉服', '1315-1342-9724', '1', '1', '0', '2017-02-15 21:56:40', '2017-02-15 21:56:40');
INSERT INTO `category_secondary` VALUES ('465', 'e', '459', '针织衫', '1315-1342-1350', '1', '1', '0', '2017-02-15 21:56:40', '2017-02-15 21:56:40');
INSERT INTO `category_secondary` VALUES ('466', 'e', '459', '夹克', '1315-1342-9730', '1', '1', '0', '2017-02-15 21:56:40', '2017-02-15 21:56:40');
INSERT INTO `category_secondary` VALUES ('467', 'e', '459', '羊毛衫', '1315-1342-12089', '1', '1', '0', '2017-02-15 21:56:40', '2017-02-15 21:56:40');
INSERT INTO `category_secondary` VALUES ('468', 'e', '459', '加绒裤', '1315-1342-12002', '1', '1', '0', '2017-02-15 21:56:40', '2017-02-15 21:56:40');
INSERT INTO `category_secondary` VALUES ('469', 'e', '459', '真皮皮衣', '1315-1342-12001', '1', '1', '0', '2017-02-15 21:56:40', '2017-02-15 21:56:40');
INSERT INTO `category_secondary` VALUES ('47', 'a', '34', '酸奶机', '737-752-762', '1', '1', '0', '2017-02-15 21:56:33', '2017-02-15 21:56:33');
INSERT INTO `category_secondary` VALUES ('470', 'e', '459', '卫衣', '1315-1342-9732', '1', '1', '0', '2017-02-15 21:56:40', '2017-02-15 21:56:40');
INSERT INTO `category_secondary` VALUES ('471', 'e', '459', 'T恤', '1315-1342-1349', '1', '1', '0', '2017-02-15 21:56:40', '2017-02-15 21:56:40');
INSERT INTO `category_secondary` VALUES ('472', 'e', '459', '马甲/背心', '1315-1342-9734', '1', '1', '0', '2017-02-15 21:56:40', '2017-02-15 21:56:40');
INSERT INTO `category_secondary` VALUES ('473', 'e', '459', '西服套装', '1315-1342-9738', '1', '1', '0', '2017-02-15 21:56:40', '2017-02-15 21:56:40');
INSERT INTO `category_secondary` VALUES ('474', 'e', '459', '牛仔裤', '1315-1342-9735', '1', '1', '0', '2017-02-15 21:56:40', '2017-02-15 21:56:40');
INSERT INTO `category_secondary` VALUES ('475', 'e', '459', '休闲裤', '1315-1342-9736', '1', '1', '0', '2017-02-15 21:56:40', '2017-02-15 21:56:40');
INSERT INTO `category_secondary` VALUES ('476', 'e', '459', '衬衫', '1315-1342-1348', '1', '1', '0', '2017-02-15 21:56:40', '2017-02-15 21:56:40');
INSERT INTO `category_secondary` VALUES ('477', 'e', '459', '毛呢大衣', '1315-1342-9729', '1', '1', '0', '2017-02-15 21:56:40', '2017-02-15 21:56:40');
INSERT INTO `category_secondary` VALUES ('478', 'e', '459', '风衣', '1315-1342-9728', '1', '1', '0', '2017-02-15 21:56:40', '2017-02-15 21:56:40');
INSERT INTO `category_secondary` VALUES ('479', 'e', '459', '仿皮皮衣', '1315-1342-9725', '1', '1', '0', '2017-02-15 21:56:40', '2017-02-15 21:56:40');
INSERT INTO `category_secondary` VALUES ('48', 'a', '34', '煮蛋器', '737-752-902', '1', '1', '0', '2017-02-15 21:56:33', '2017-02-15 21:56:33');
INSERT INTO `category_secondary` VALUES ('480', 'e', '459', '西服', '1315-1342-9731', '1', '1', '0', '2017-02-15 21:56:40', '2017-02-15 21:56:40');
INSERT INTO `category_secondary` VALUES ('481', 'e', '459', '西裤', '1315-1342-9737', '1', '1', '0', '2017-02-15 21:56:40', '2017-02-15 21:56:40');
INSERT INTO `category_secondary` VALUES ('482', 'e', '459', '卫裤/运动裤', '1315-1342-12003', '1', '1', '0', '2017-02-15 21:56:40', '2017-02-15 21:56:40');
INSERT INTO `category_secondary` VALUES ('483', 'e', '459', 'POLO衫', '1315-1342-9733', '1', '1', '0', '2017-02-15 21:56:40', '2017-02-15 21:56:40');
INSERT INTO `category_secondary` VALUES ('484', 'e', '459', '短裤', '1315-1342-12004', '1', '1', '0', '2017-02-15 21:56:40', '2017-02-15 21:56:40');
INSERT INTO `category_secondary` VALUES ('485', 'e', '459', '中老年男装', '1315-1342-9740', '1', '1', '0', '2017-02-15 21:56:40', '2017-02-15 21:56:40');
INSERT INTO `category_secondary` VALUES ('486', 'e', '459', '大码男装', '1315-1342-9739', '1', '1', '0', '2017-02-15 21:56:40', '2017-02-15 21:56:40');
INSERT INTO `category_secondary` VALUES ('487', 'e', '459', '羊绒衫', '1315-1342-9726', '1', '1', '0', '2017-02-15 21:56:40', '2017-02-15 21:56:40');
INSERT INTO `category_secondary` VALUES ('488', 'e', '459', '设计师/潮牌', '1315-1342-12005', '1', '1', '0', '2017-02-15 21:56:40', '2017-02-15 21:56:40');
INSERT INTO `category_secondary` VALUES ('489', 'e', '459', '工装', '1315-1342-9742', '1', '1', '0', '2017-02-15 21:56:40', '2017-02-15 21:56:40');
INSERT INTO `category_secondary` VALUES ('49', 'a', '34', '电水壶/热水瓶', '737-752-760', '1', '1', '0', '2017-02-15 21:56:33', '2017-02-15 21:56:33');
INSERT INTO `category_secondary` VALUES ('490', 'e', '459', '唐装/中山装', '1315-1342-9741', '1', '1', '0', '2017-02-15 21:56:40', '2017-02-15 21:56:40');
INSERT INTO `category_secondary` VALUES ('491', 'e', '420', '内衣', '1315-1345', '1', '1', '1', '2017-02-15 21:56:40', '2017-02-15 21:56:40');
INSERT INTO `category_secondary` VALUES ('492', 'e', '491', '保暖内衣', '1315-1345-1369', '1', '1', '0', '2017-02-15 21:56:40', '2017-02-15 21:56:40');
INSERT INTO `category_secondary` VALUES ('493', 'e', '491', '秋衣秋裤', '1315-1345-12015', '1', '1', '0', '2017-02-15 21:56:40', '2017-02-15 21:56:40');
INSERT INTO `category_secondary` VALUES ('494', 'e', '491', '男式内裤', '1315-1345-9744', '1', '1', '0', '2017-02-15 21:56:40', '2017-02-15 21:56:40');
INSERT INTO `category_secondary` VALUES ('495', 'e', '491', '女式内裤', '1315-1345-9743', '1', '1', '0', '2017-02-15 21:56:40', '2017-02-15 21:56:40');
INSERT INTO `category_secondary` VALUES ('496', 'e', '491', '休闲棉袜', '1315-1345-12010', '1', '1', '0', '2017-02-15 21:56:40', '2017-02-15 21:56:40');
INSERT INTO `category_secondary` VALUES ('497', 'e', '491', '商务男袜', '1315-1345-9745', '1', '1', '0', '2017-02-15 21:56:40', '2017-02-15 21:56:40');
INSERT INTO `category_secondary` VALUES ('498', 'e', '491', '吊带/背心', '1315-1345-1365', '1', '1', '0', '2017-02-15 21:56:40', '2017-02-15 21:56:40');
INSERT INTO `category_secondary` VALUES ('499', 'e', '491', '大码内衣', '1315-1345-12011', '1', '1', '0', '2017-02-15 21:56:40', '2017-02-15 21:56:40');
INSERT INTO `category_secondary` VALUES ('5', 'a', '2', '互联网品牌', 'list.jd.com/list.html?cat=737,794,798&ev=5305_89541&sort=sort_totalsales15_desc&trans=1&JL=2_1_0#J_crumbsBar', '1', '1', '0', '2017-02-15 21:56:33', '2017-02-15 21:56:33');
INSERT INTO `category_secondary` VALUES ('50', 'a', '34', '电炖锅', '737-752-9249', '1', '1', '0', '2017-02-15 21:56:33', '2017-02-15 21:56:33');
INSERT INTO `category_secondary` VALUES ('500', 'e', '491', '打底衫', '1315-1345-12014', '1', '1', '0', '2017-02-15 21:56:40', '2017-02-15 21:56:40');
INSERT INTO `category_secondary` VALUES ('501', 'e', '491', '睡衣/家居服', '1315-1345-1371', '1', '1', '0', '2017-02-15 21:56:40', '2017-02-15 21:56:40');
INSERT INTO `category_secondary` VALUES ('502', 'e', '491', '文胸', '1315-1345-1364', '1', '1', '0', '2017-02-15 21:56:40', '2017-02-15 21:56:40');
INSERT INTO `category_secondary` VALUES ('503', 'e', '491', '打底裤袜', '1315-1345-12013', '1', '1', '0', '2017-02-15 21:56:41', '2017-02-15 21:56:41');
INSERT INTO `category_secondary` VALUES ('504', 'e', '491', '连裤袜/丝袜', '1315-1345-9748', '1', '1', '0', '2017-02-15 21:56:41', '2017-02-15 21:56:41');
INSERT INTO `category_secondary` VALUES ('505', 'e', '491', '文胸套装', '1315-1345-12008', '1', '1', '0', '2017-02-15 21:56:41', '2017-02-15 21:56:41');
INSERT INTO `category_secondary` VALUES ('506', 'e', '491', '情侣睡衣', '1315-1345-12006', '1', '1', '0', '2017-02-15 21:56:41', '2017-02-15 21:56:41');
INSERT INTO `category_secondary` VALUES ('507', 'e', '491', '少女文胸', '1315-1345-12009', '1', '1', '0', '2017-02-15 21:56:41', '2017-02-15 21:56:41');
INSERT INTO `category_secondary` VALUES ('508', 'e', '491', '抹胸', '1315-1345-9751', '1', '1', '0', '2017-02-15 21:56:41', '2017-02-15 21:56:41');
INSERT INTO `category_secondary` VALUES ('509', 'e', '491', '内衣配件', '1315-1345-12012', '1', '1', '0', '2017-02-15 21:56:41', '2017-02-15 21:56:41');
INSERT INTO `category_secondary` VALUES ('51', 'a', '34', '多用途锅', '737-752-754', '1', '1', '0', '2017-02-15 21:56:33', '2017-02-15 21:56:33');
INSERT INTO `category_secondary` VALUES ('510', 'e', '491', '塑身美体', '1315-1345-9747', '1', '1', '0', '2017-02-15 21:56:41', '2017-02-15 21:56:41');
INSERT INTO `category_secondary` VALUES ('511', 'e', '491', '美腿袜', '1315-1345-9749', '1', '1', '0', '2017-02-15 21:56:41', '2017-02-15 21:56:41');
INSERT INTO `category_secondary` VALUES ('512', 'e', '491', '泳衣', '1315-1345-9753', '1', '1', '0', '2017-02-15 21:56:41', '2017-02-15 21:56:41');
INSERT INTO `category_secondary` VALUES ('513', 'e', '491', '情趣内衣', '1315-1345-1368', '1', '1', '0', '2017-02-15 21:56:41', '2017-02-15 21:56:41');
INSERT INTO `category_secondary` VALUES ('514', 'e', '420', '配饰', '1315-1346', '1', '1', '1', '2017-02-15 21:56:41', '2017-02-15 21:56:41');
INSERT INTO `category_secondary` VALUES ('515', 'e', '514', '女士丝巾/围巾/披肩', '1315-1346-12021', '1', '1', '0', '2017-02-15 21:56:41', '2017-02-15 21:56:41');
INSERT INTO `category_secondary` VALUES ('516', 'e', '514', '男士腰带/礼盒', '1315-1346-12029', '1', '1', '0', '2017-02-15 21:56:41', '2017-02-15 21:56:41');
INSERT INTO `category_secondary` VALUES ('517', 'e', '514', '太阳镜', '1315-1346-9790', '1', '1', '0', '2017-02-15 21:56:41', '2017-02-15 21:56:41');
INSERT INTO `category_secondary` VALUES ('518', 'e', '514', '光学镜架/镜片', '1315-1346-9789', '1', '1', '0', '2017-02-15 21:56:41', '2017-02-15 21:56:41');
INSERT INTO `category_secondary` VALUES ('519', 'e', '514', '防辐射眼镜', '1315-1346-12019', '1', '1', '0', '2017-02-15 21:56:41', '2017-02-15 21:56:41');
INSERT INTO `category_secondary` VALUES ('52', 'a', '34', '电烧烤炉', '737-752-13118', '1', '1', '0', '2017-02-15 21:56:33', '2017-02-15 21:56:33');
INSERT INTO `category_secondary` VALUES ('520', 'e', '514', '棒球帽', '1315-1346-9792', '1', '1', '0', '2017-02-15 21:56:41', '2017-02-15 21:56:41');
INSERT INTO `category_secondary` VALUES ('521', 'e', '514', '贝雷帽', '1315-1346-12024', '1', '1', '0', '2017-02-15 21:56:41', '2017-02-15 21:56:41');
INSERT INTO `category_secondary` VALUES ('522', 'e', '514', '鸭舌帽', '1315-1346-12023', '1', '1', '0', '2017-02-15 21:56:41', '2017-02-15 21:56:41');
INSERT INTO `category_secondary` VALUES ('523', 'e', '514', '男士丝巾/围巾', '1315-1346-12022', '1', '1', '0', '2017-02-15 21:56:41', '2017-02-15 21:56:41');
INSERT INTO `category_secondary` VALUES ('524', 'e', '514', '真皮手套', '1315-1346-12026', '1', '1', '0', '2017-02-15 21:56:41', '2017-02-15 21:56:41');
INSERT INTO `category_secondary` VALUES ('525', 'e', '514', '毛线手套', '1315-1346-12027', '1', '1', '0', '2017-02-15 21:56:41', '2017-02-15 21:56:41');
INSERT INTO `category_secondary` VALUES ('526', 'e', '514', '围巾/手套/帽子套装', '1315-1346-1376', '1', '1', '0', '2017-02-15 21:56:41', '2017-02-15 21:56:41');
INSERT INTO `category_secondary` VALUES ('527', 'e', '514', '老花镜', '1315-1346-12017', '1', '1', '0', '2017-02-15 21:56:41', '2017-02-15 21:56:41');
INSERT INTO `category_secondary` VALUES ('528', 'e', '514', '礼帽', '1315-1346-12025', '1', '1', '0', '2017-02-15 21:56:41', '2017-02-15 21:56:41');
INSERT INTO `category_secondary` VALUES ('529', 'e', '514', '遮阳帽', '1315-1346-9794', '1', '1', '0', '2017-02-15 21:56:41', '2017-02-15 21:56:41');
INSERT INTO `category_secondary` VALUES ('53', 'a', '34', '电热饭盒', '737-752-12398', '1', '1', '0', '2017-02-15 21:56:33', '2017-02-15 21:56:33');
INSERT INTO `category_secondary` VALUES ('530', 'e', '514', '口罩', '1315-1346-12035', '1', '1', '0', '2017-02-15 21:56:41', '2017-02-15 21:56:41');
INSERT INTO `category_secondary` VALUES ('531', 'e', '514', '游泳镜', '1315-1346-12020', '1', '1', '0', '2017-02-15 21:56:41', '2017-02-15 21:56:41');
INSERT INTO `category_secondary` VALUES ('532', 'e', '514', '毛线帽', '1315-1346-9793', '1', '1', '0', '2017-02-15 21:56:41', '2017-02-15 21:56:41');
INSERT INTO `category_secondary` VALUES ('533', 'e', '514', '女士腰带/礼盒', '1315-1346-12030', '1', '1', '0', '2017-02-15 21:56:41', '2017-02-15 21:56:41');
INSERT INTO `category_secondary` VALUES ('534', 'e', '514', '遮阳伞/雨伞', '1315-1346-12034', '1', '1', '0', '2017-02-15 21:56:41', '2017-02-15 21:56:41');
INSERT INTO `category_secondary` VALUES ('535', 'e', '514', '毛线/布面料', '1315-1346-12038', '1', '1', '0', '2017-02-15 21:56:41', '2017-02-15 21:56:41');
INSERT INTO `category_secondary` VALUES ('536', 'e', '514', '领带/领结/领带夹', '1315-1346-12039', '1', '1', '0', '2017-02-15 21:56:41', '2017-02-15 21:56:41');
INSERT INTO `category_secondary` VALUES ('537', 'e', '514', '耳罩/耳包', '1315-1346-12036', '1', '1', '0', '2017-02-15 21:56:41', '2017-02-15 21:56:41');
INSERT INTO `category_secondary` VALUES ('538', 'e', '514', '袖扣', '1315-1346-1378', '1', '1', '0', '2017-02-15 21:56:41', '2017-02-15 21:56:41');
INSERT INTO `category_secondary` VALUES ('539', 'e', '514', '钥匙扣', '1315-1346-12033', '1', '1', '0', '2017-02-15 21:56:41', '2017-02-15 21:56:41');
INSERT INTO `category_secondary` VALUES ('54', 'a', '34', '其它厨房电器', '737-752-803', '1', '1', '0', '2017-02-15 21:56:33', '2017-02-15 21:56:33');
INSERT INTO `category_secondary` VALUES ('540', 'e', '420', '童装童鞋', '1319-11842', '1', '1', '1', '2017-02-15 21:56:41', '2017-02-15 21:56:41');
INSERT INTO `category_secondary` VALUES ('541', 'e', '540', '羽绒服/棉服', '1319-11842-11226', '1', '1', '0', '2017-02-15 21:56:41', '2017-02-15 21:56:41');
INSERT INTO `category_secondary` VALUES ('542', 'e', '540', '套装', '1319-11842-11222', '1', '1', '0', '2017-02-15 21:56:41', '2017-02-15 21:56:41');
INSERT INTO `category_secondary` VALUES ('543', 'e', '540', '上衣', '1319-11842-11223', '1', '1', '0', '2017-02-15 21:56:41', '2017-02-15 21:56:41');
INSERT INTO `category_secondary` VALUES ('544', 'e', '540', '裤子', '1319-11842-11224', '1', '1', '0', '2017-02-15 21:56:41', '2017-02-15 21:56:41');
INSERT INTO `category_secondary` VALUES ('545', 'e', '540', '内衣', '1319-11842-11227', '1', '1', '0', '2017-02-15 21:56:41', '2017-02-15 21:56:41');
INSERT INTO `category_secondary` VALUES ('546', 'e', '540', '配饰', '1319-11842-3977', '1', '1', '0', '2017-02-15 21:56:41', '2017-02-15 21:56:41');
INSERT INTO `category_secondary` VALUES ('547', 'e', '540', '运动鞋', '1319-11842-11229', '1', '1', '0', '2017-02-15 21:56:41', '2017-02-15 21:56:41');
INSERT INTO `category_secondary` VALUES ('548', 'e', '540', '靴子', '1319-11842-11231', '1', '1', '0', '2017-02-15 21:56:41', '2017-02-15 21:56:41');
INSERT INTO `category_secondary` VALUES ('549', 'e', '540', '皮鞋/帆布鞋', '1319-11842-11230', '1', '1', '0', '2017-02-15 21:56:41', '2017-02-15 21:56:41');
INSERT INTO `category_secondary` VALUES ('55', 'a', '1', '生活电器', '737-738', '1', '1', '1', '2017-02-15 21:56:33', '2017-02-15 21:56:33');
INSERT INTO `category_secondary` VALUES ('550', 'e', '540', '功能鞋', '1319-11842-11233', '1', '1', '0', '2017-02-15 21:56:41', '2017-02-15 21:56:41');
INSERT INTO `category_secondary` VALUES ('551', 'e', '540', '亲子装', '1319-11842-4937', '1', '1', '0', '2017-02-15 21:56:41', '2017-02-15 21:56:41');
INSERT INTO `category_secondary` VALUES ('552', 'e', '540', '运动服', '1319-11842-11843', '1', '1', '0', '2017-02-15 21:56:41', '2017-02-15 21:56:41');
INSERT INTO `category_secondary` VALUES ('553', 'e', '540', '演出服', '1319-11842-11228', '1', '1', '0', '2017-02-15 21:56:41', '2017-02-15 21:56:41');
INSERT INTO `category_secondary` VALUES ('554', 'e', '540', '裙子', '1319-11842-11225', '1', '1', '0', '2017-02-15 21:56:41', '2017-02-15 21:56:41');
INSERT INTO `category_secondary` VALUES ('555', 'e', '540', '凉鞋', '1319-11842-11232', '1', '1', '0', '2017-02-15 21:56:41', '2017-02-15 21:56:41');
INSERT INTO `category_secondary` VALUES ('556', 'e', '0', '女装', 'channel.jd.com/1315-1343.html', '1', '1', '0', '2017-02-15 21:56:41', '2017-02-15 21:56:41');
INSERT INTO `category_secondary` VALUES ('557', 'e', '0', '童装', 'channel.jd.com/children.html', '1', '1', '0', '2017-02-15 21:56:41', '2017-02-15 21:56:41');
INSERT INTO `category_secondary` VALUES ('558', 'e', '0', '内衣', 'channel.jd.com/1315-1345.html', '1', '1', '0', '2017-02-15 21:56:41', '2017-02-15 21:56:41');
INSERT INTO `category_secondary` VALUES ('559', 'e', '-1', '男装', 'channel.jd.com/1315-1342.html', '1', '1', '1', '2017-02-15 21:56:41', '2017-02-15 21:56:41');
INSERT INTO `category_secondary` VALUES ('56', 'a', '55', '取暖电器', '737-738-747', '1', '1', '0', '2017-02-15 21:56:33', '2017-02-15 21:56:33');
INSERT INTO `category_secondary` VALUES ('560', 'e', '-1', '女装', 'channel.jd.com/1315-1343.html', '1', '1', '1', '2017-02-15 21:56:41', '2017-02-15 21:56:41');
INSERT INTO `category_secondary` VALUES ('561', 'e', '-1', '内衣', 'channel.jd.com/underwear.html', '1', '1', '1', '2017-02-15 21:56:41', '2017-02-15 21:56:41');
INSERT INTO `category_secondary` VALUES ('562', 'e', '-1', '童装童鞋', 'channel.jd.com/children.html', '1', '1', '1', '2017-02-15 21:56:41', '2017-02-15 21:56:41');
INSERT INTO `category_secondary` VALUES ('563', 'e', '-1', '国际品牌', 'sale.jd.com/act/lgVrqKBf5sON2.html', '1', '1', '1', '2017-02-15 21:56:41', '2017-02-15 21:56:41');
INSERT INTO `category_secondary` VALUES ('564', 'e', '-1', '自营服装', 'sale.jd.com/act/RmG6HOIc8nUi3E.html', '1', '1', '1', '2017-02-15 21:56:41', '2017-02-15 21:56:41');
INSERT INTO `category_secondary` VALUES ('565', 'f', '0', '个护化妆', 'channel.jd.com/beauty.html', '1', '1', '1', '2017-02-15 21:56:42', '2017-02-15 21:56:42');
INSERT INTO `category_secondary` VALUES ('566', 'f', '565', '面部护肤', '1316-1381', '1', '1', '1', '2017-02-15 21:56:42', '2017-02-15 21:56:42');
INSERT INTO `category_secondary` VALUES ('567', 'f', '566', '补水保湿', 'list.jd.com/list.html?tid=1000109', '1', '1', '0', '2017-02-15 21:56:42', '2017-02-15 21:56:42');
INSERT INTO `category_secondary` VALUES ('568', 'f', '566', '卸妆', '1316-1381-13544', '1', '1', '0', '2017-02-15 21:56:42', '2017-02-15 21:56:42');
INSERT INTO `category_secondary` VALUES ('569', 'f', '566', '洁面', '1316-1381-1389', '1', '1', '0', '2017-02-15 21:56:42', '2017-02-15 21:56:42');
INSERT INTO `category_secondary` VALUES ('57', 'a', '55', '吸尘器', '737-738-745', '1', '1', '0', '2017-02-15 21:56:33', '2017-02-15 21:56:33');
INSERT INTO `category_secondary` VALUES ('570', 'f', '566', '爽肤水', '1316-1381-1390', '1', '1', '0', '2017-02-15 21:56:42', '2017-02-15 21:56:42');
INSERT INTO `category_secondary` VALUES ('571', 'f', '566', '乳液面霜', '1316-1381-1391', '1', '1', '0', '2017-02-15 21:56:42', '2017-02-15 21:56:42');
INSERT INTO `category_secondary` VALUES ('572', 'f', '566', '精华', '1316-1381-13546', '1', '1', '0', '2017-02-15 21:56:42', '2017-02-15 21:56:42');
INSERT INTO `category_secondary` VALUES ('573', 'f', '566', '眼霜', '1316-1381-13547', '1', '1', '0', '2017-02-15 21:56:42', '2017-02-15 21:56:42');
INSERT INTO `category_secondary` VALUES ('574', 'f', '566', '防晒', '1316-1381-13548', '1', '1', '0', '2017-02-15 21:56:42', '2017-02-15 21:56:42');
INSERT INTO `category_secondary` VALUES ('575', 'f', '566', '面膜', '1316-1381-1392', '1', '1', '0', '2017-02-15 21:56:42', '2017-02-15 21:56:42');
INSERT INTO `category_secondary` VALUES ('576', 'f', '566', '剃须', '1316-1381-1416', '1', '1', '0', '2017-02-15 21:56:42', '2017-02-15 21:56:42');
INSERT INTO `category_secondary` VALUES ('577', 'f', '566', '套装', '1316-1381-1396', '1', '1', '0', '2017-02-15 21:56:42', '2017-02-15 21:56:42');
INSERT INTO `category_secondary` VALUES ('578', 'f', '565', '洗发护发', '1316-1386', '1', '1', '1', '2017-02-15 21:56:42', '2017-02-15 21:56:42');
INSERT INTO `category_secondary` VALUES ('579', 'f', '578', '洗发', '1316-1386-11922', '1', '1', '0', '2017-02-15 21:56:42', '2017-02-15 21:56:42');
INSERT INTO `category_secondary` VALUES ('58', 'a', '55', '净化器', '737-738-749', '1', '1', '0', '2017-02-15 21:56:33', '2017-02-15 21:56:33');
INSERT INTO `category_secondary` VALUES ('580', 'f', '578', '护发', '1316-1386-11923', '1', '1', '0', '2017-02-15 21:56:42', '2017-02-15 21:56:42');
INSERT INTO `category_secondary` VALUES ('581', 'f', '578', '染发', '1316-1386-11924', '1', '1', '0', '2017-02-15 21:56:42', '2017-02-15 21:56:42');
INSERT INTO `category_secondary` VALUES ('582', 'f', '578', '造型', '1316-1386-11925', '1', '1', '0', '2017-02-15 21:56:42', '2017-02-15 21:56:42');
INSERT INTO `category_secondary` VALUES ('583', 'f', '578', '假发', '1316-1386-4699', '1', '1', '0', '2017-02-15 21:56:42', '2017-02-15 21:56:42');
INSERT INTO `category_secondary` VALUES ('584', 'f', '578', '美发工具', '1316-1386-13550', '1', '1', '0', '2017-02-15 21:56:42', '2017-02-15 21:56:42');
INSERT INTO `category_secondary` VALUES ('585', 'f', '578', '套装', '1316-1386-6739', '1', '1', '0', '2017-02-15 21:56:42', '2017-02-15 21:56:42');
INSERT INTO `category_secondary` VALUES ('586', 'f', '565', '身体护理', '1316-1383', '1', '1', '1', '2017-02-15 21:56:42', '2017-02-15 21:56:42');
INSERT INTO `category_secondary` VALUES ('587', 'f', '586', '补水保湿', 'list.jd.com/list.html?tid=1000110', '1', '1', '0', '2017-02-15 21:56:42', '2017-02-15 21:56:42');
INSERT INTO `category_secondary` VALUES ('588', 'f', '586', '沐浴', '1316-1383-1401', '1', '1', '0', '2017-02-15 21:56:42', '2017-02-15 21:56:42');
INSERT INTO `category_secondary` VALUES ('589', 'f', '586', '润肤', '1316-1383-1404', '1', '1', '0', '2017-02-15 21:56:42', '2017-02-15 21:56:42');
INSERT INTO `category_secondary` VALUES ('59', 'a', '55', '扫地机器人', '737-738-12394', '1', '1', '0', '2017-02-15 21:56:33', '2017-02-15 21:56:33');
INSERT INTO `category_secondary` VALUES ('590', 'f', '586', '精油', '1316-1383-13551', '1', '1', '0', '2017-02-15 21:56:42', '2017-02-15 21:56:42');
INSERT INTO `category_secondary` VALUES ('591', 'f', '586', '颈部', '1316-1383-1394', '1', '1', '0', '2017-02-15 21:56:42', '2017-02-15 21:56:42');
INSERT INTO `category_secondary` VALUES ('592', 'f', '586', '手足', '1316-1383-2562', '1', '1', '0', '2017-02-15 21:56:42', '2017-02-15 21:56:42');
INSERT INTO `category_secondary` VALUES ('593', 'f', '586', '纤体塑形', '1316-1383-5164', '1', '1', '0', '2017-02-15 21:56:42', '2017-02-15 21:56:42');
INSERT INTO `category_secondary` VALUES ('594', 'f', '586', '美胸', '1316-1383-11928', '1', '1', '0', '2017-02-15 21:56:42', '2017-02-15 21:56:42');
INSERT INTO `category_secondary` VALUES ('595', 'f', '586', '套装', '1316-1383-11929', '1', '1', '0', '2017-02-15 21:56:42', '2017-02-15 21:56:42');
INSERT INTO `category_secondary` VALUES ('596', 'f', '565', '口腔护理', '1316-1384', '1', '1', '1', '2017-02-15 21:56:42', '2017-02-15 21:56:42');
INSERT INTO `category_secondary` VALUES ('597', 'f', '596', '牙膏/牙粉', '1316-1384-1405', '1', '1', '0', '2017-02-15 21:56:42', '2017-02-15 21:56:42');
INSERT INTO `category_secondary` VALUES ('598', 'f', '596', '牙刷/牙线', '1316-1384-1406', '1', '1', '0', '2017-02-15 21:56:42', '2017-02-15 21:56:42');
INSERT INTO `category_secondary` VALUES ('599', 'f', '596', '漱口水', '1316-1384-1407', '1', '1', '0', '2017-02-15 21:56:42', '2017-02-15 21:56:42');
INSERT INTO `category_secondary` VALUES ('6', 'a', '1', '空调', 'list.jd.com/list.html?cat=737,794,870', '1', '1', '1', '2017-02-15 21:56:33', '2017-02-15 21:56:33');
INSERT INTO `category_secondary` VALUES ('60', 'a', '55', '加湿器', '737-738-748', '1', '1', '0', '2017-02-15 21:56:33', '2017-02-15 21:56:33');
INSERT INTO `category_secondary` VALUES ('600', 'f', '596', '套装', '1316-1384-11930', '1', '1', '0', '2017-02-15 21:56:42', '2017-02-15 21:56:42');
INSERT INTO `category_secondary` VALUES ('601', 'f', '565', '女性护理', '1316-1385', '1', '1', '1', '2017-02-15 21:56:42', '2017-02-15 21:56:42');
INSERT INTO `category_secondary` VALUES ('602', 'f', '601', '卫生巾', '1316-1385-1408', '1', '1', '0', '2017-02-15 21:56:42', '2017-02-15 21:56:42');
INSERT INTO `category_secondary` VALUES ('603', 'f', '601', '卫生护垫', '1316-1385-1409', '1', '1', '0', '2017-02-15 21:56:42', '2017-02-15 21:56:42');
INSERT INTO `category_secondary` VALUES ('604', 'f', '601', '私密护理', '1316-1385-1410', '1', '1', '0', '2017-02-15 21:56:42', '2017-02-15 21:56:42');
INSERT INTO `category_secondary` VALUES ('605', 'f', '601', '脱毛膏', '1316-1385-5150', '1', '1', '0', '2017-02-15 21:56:42', '2017-02-15 21:56:42');
INSERT INTO `category_secondary` VALUES ('606', 'f', '565', '香水彩妆', '1316-1387', '1', '1', '1', '2017-02-15 21:56:42', '2017-02-15 21:56:42');
INSERT INTO `category_secondary` VALUES ('607', 'f', '606', 'BB霜', 'list.jd.com/list.html?tid=1000139', '1', '1', '0', '2017-02-15 21:56:42', '2017-02-15 21:56:42');
INSERT INTO `category_secondary` VALUES ('608', 'f', '606', '化妆棉', 'list.jd.com/list.html?tid=1000142', '1', '1', '0', '2017-02-15 21:56:42', '2017-02-15 21:56:42');
INSERT INTO `category_secondary` VALUES ('609', 'f', '606', '女士香水', 'list.jd.com/list.html?cat=1316,1387,11932&ev=2870%5F67911&go=0&trans=1&JL=2_1_0', '1', '1', '0', '2017-02-15 21:56:42', '2017-02-15 21:56:42');
INSERT INTO `category_secondary` VALUES ('61', 'a', '55', '挂烫机/熨斗', '737-738-1279', '1', '1', '0', '2017-02-15 21:56:33', '2017-02-15 21:56:33');
INSERT INTO `category_secondary` VALUES ('610', 'f', '606', '男士香水', 'list.jd.com/list.html?cat=1316,1387,11932&ev=2870%5F67908&go=0&trans=1&JL=2_1_0', '1', '1', '0', '2017-02-15 21:56:42', '2017-02-15 21:56:42');
INSERT INTO `category_secondary` VALUES ('611', 'f', '606', '底妆', '1316-1387-1420', '1', '1', '0', '2017-02-15 21:56:42', '2017-02-15 21:56:42');
INSERT INTO `category_secondary` VALUES ('612', 'f', '606', '眉笔', '1316-1387-1423', '1', '1', '0', '2017-02-15 21:56:42', '2017-02-15 21:56:42');
INSERT INTO `category_secondary` VALUES ('613', 'f', '606', '睫毛膏', '1316-1387-1424', '1', '1', '0', '2017-02-15 21:56:42', '2017-02-15 21:56:42');
INSERT INTO `category_secondary` VALUES ('614', 'f', '606', '眼线', '1316-1387-13549', '1', '1', '0', '2017-02-15 21:56:42', '2017-02-15 21:56:42');
INSERT INTO `category_secondary` VALUES ('615', 'f', '606', '眼影', '1316-1387-1422', '1', '1', '0', '2017-02-15 21:56:42', '2017-02-15 21:56:42');
INSERT INTO `category_secondary` VALUES ('616', 'f', '606', '唇膏/彩', '1316-1387-1425', '1', '1', '0', '2017-02-15 21:56:42', '2017-02-15 21:56:42');
INSERT INTO `category_secondary` VALUES ('617', 'f', '606', '腮红', '1316-1387-1421', '1', '1', '0', '2017-02-15 21:56:42', '2017-02-15 21:56:42');
INSERT INTO `category_secondary` VALUES ('618', 'f', '606', '美甲', '1316-1387-1428', '1', '1', '0', '2017-02-15 21:56:42', '2017-02-15 21:56:42');
INSERT INTO `category_secondary` VALUES ('619', 'f', '606', '美妆工具', '1316-1387-1429', '1', '1', '0', '2017-02-15 21:56:42', '2017-02-15 21:56:42');
INSERT INTO `category_secondary` VALUES ('62', 'a', '55', '电风扇', '737-738-751', '1', '1', '0', '2017-02-15 21:56:33', '2017-02-15 21:56:33');
INSERT INTO `category_secondary` VALUES ('620', 'f', '606', '套装', '1316-1387-1426', '1', '1', '0', '2017-02-15 21:56:42', '2017-02-15 21:56:42');
INSERT INTO `category_secondary` VALUES ('621', 'f', '565', '清洁用品', '1620-1625', '1', '1', '1', '2017-02-15 21:56:42', '2017-02-15 21:56:42');
INSERT INTO `category_secondary` VALUES ('622', 'f', '621', '纸品湿巾', '1316-1625-1671', '1', '1', '0', '2017-02-15 21:56:42', '2017-02-15 21:56:42');
INSERT INTO `category_secondary` VALUES ('623', 'f', '621', '衣物清洁', '1316-1625-1662', '1', '1', '0', '2017-02-15 21:56:42', '2017-02-15 21:56:42');
INSERT INTO `category_secondary` VALUES ('624', 'f', '621', '清洁工具', '1316-1625-1667', '1', '1', '0', '2017-02-15 21:56:42', '2017-02-15 21:56:42');
INSERT INTO `category_secondary` VALUES ('625', 'f', '621', '家庭清洁', '1316-1625-1663', '1', '1', '0', '2017-02-15 21:56:42', '2017-02-15 21:56:42');
INSERT INTO `category_secondary` VALUES ('626', 'f', '621', '一次性用品', '1316-1625-11970', '1', '1', '0', '2017-02-15 21:56:42', '2017-02-15 21:56:42');
INSERT INTO `category_secondary` VALUES ('627', 'f', '621', '驱虫用品', '1316-1625-1669', '1', '1', '0', '2017-02-15 21:56:42', '2017-02-15 21:56:42');
INSERT INTO `category_secondary` VALUES ('628', 'f', '621', '皮具护理', '1316-1625-1670', '1', '1', '0', '2017-02-15 21:56:42', '2017-02-15 21:56:42');
INSERT INTO `category_secondary` VALUES ('629', 'f', '565', '宠物生活', 'channel.jd.com/pet.html', '1', '1', '1', '2017-02-15 21:56:42', '2017-02-15 21:56:42');
INSERT INTO `category_secondary` VALUES ('63', 'a', '55', '冷风扇', '737-738-1278', '1', '1', '0', '2017-02-15 21:56:33', '2017-02-15 21:56:33');
INSERT INTO `category_secondary` VALUES ('630', 'f', '629', '水族用品', '6994-6998-7023', '1', '1', '0', '2017-02-15 21:56:42', '2017-02-15 21:56:42');
INSERT INTO `category_secondary` VALUES ('631', 'f', '629', '宠物主粮', '6994-6995', '1', '1', '0', '2017-02-15 21:56:42', '2017-02-15 21:56:42');
INSERT INTO `category_secondary` VALUES ('632', 'f', '629', '宠物零食', '6994-6996', '1', '1', '0', '2017-02-15 21:56:42', '2017-02-15 21:56:42');
INSERT INTO `category_secondary` VALUES ('633', 'f', '629', '猫砂/尿布', '6994-6998-7020', '1', '1', '0', '2017-02-15 21:56:42', '2017-02-15 21:56:42');
INSERT INTO `category_secondary` VALUES ('634', 'f', '629', '洗护美容', '6994-7001', '1', '1', '0', '2017-02-15 21:56:42', '2017-02-15 21:56:42');
INSERT INTO `category_secondary` VALUES ('635', 'f', '629', '家居日用', '6994-6998', '1', '1', '0', '2017-02-15 21:56:42', '2017-02-15 21:56:42');
INSERT INTO `category_secondary` VALUES ('636', 'f', '629', '医疗保健', '6994-6997', '1', '1', '0', '2017-02-15 21:56:42', '2017-02-15 21:56:42');
INSERT INTO `category_secondary` VALUES ('637', 'f', '629', '出行装备', '6994-7000', '1', '1', '0', '2017-02-15 21:56:42', '2017-02-15 21:56:42');
INSERT INTO `category_secondary` VALUES ('638', 'f', '629', '宠物玩具', '6994-6999', '1', '1', '0', '2017-02-15 21:56:42', '2017-02-15 21:56:42');
INSERT INTO `category_secondary` VALUES ('639', 'f', '629', '宠物牵引', '6994-7000-7028', '1', '1', '0', '2017-02-15 21:56:42', '2017-02-15 21:56:42');
INSERT INTO `category_secondary` VALUES ('64', 'a', '55', '插座', '737-738-1052', '1', '1', '0', '2017-02-15 21:56:33', '2017-02-15 21:56:33');
INSERT INTO `category_secondary` VALUES ('640', 'f', '629', '宠物驱虫', '6994-6997-7016', '1', '1', '0', '2017-02-15 21:56:42', '2017-02-15 21:56:42');
INSERT INTO `category_secondary` VALUES ('641', 'f', '0', '清洁用品', 'channel.jd.com/1620-1625.html', '1', '1', '0', '2017-02-15 21:56:42', '2017-02-15 21:56:42');
INSERT INTO `category_secondary` VALUES ('642', 'f', '0', '宠物', 'channel.jd.com/pet.html', '1', '1', '0', '2017-02-15 21:56:42', '2017-02-15 21:56:42');
INSERT INTO `category_secondary` VALUES ('643', 'f', '-1', '清洁用品', 'channel.jd.com/1620-1625.html', '1', '1', '1', '2017-02-15 21:56:42', '2017-02-15 21:56:42');
INSERT INTO `category_secondary` VALUES ('644', 'f', '-1', '美妆商城', 'channel.jd.com/beauty.html', '1', '1', '1', '2017-02-15 21:56:42', '2017-02-15 21:56:42');
INSERT INTO `category_secondary` VALUES ('645', 'f', '-1', '官方旗舰店', 'sale.jd.com/act/ahu4yHMg8RmZPL.html', '1', '1', '1', '2017-02-15 21:56:42', '2017-02-15 21:56:42');
INSERT INTO `category_secondary` VALUES ('646', 'f', '-1', '美妆特卖', 'channel.jd.com/beautysale.html', '1', '1', '1', '2017-02-15 21:56:42', '2017-02-15 21:56:42');
INSERT INTO `category_secondary` VALUES ('647', 'f', '-1', '妆比社', 'mei.jd.com', '1', '1', '1', '2017-02-15 21:56:42', '2017-02-15 21:56:42');
INSERT INTO `category_secondary` VALUES ('648', 'f', '-1', '全球购美妆', 'beauty.jd.hk/', '1', '1', '1', '2017-02-15 21:56:42', '2017-02-15 21:56:42');
INSERT INTO `category_secondary` VALUES ('649', 'g', '0', '鞋靴', 'channel.jd.com/shoes.html', '1', '1', '1', '2017-02-15 21:56:44', '2017-02-15 21:56:44');
INSERT INTO `category_secondary` VALUES ('65', 'a', '55', '电话机', '737-738-806', '1', '1', '0', '2017-02-15 21:56:33', '2017-02-15 21:56:33');
INSERT INTO `category_secondary` VALUES ('650', 'g', '649', '时尚女鞋', '11729-11731', '1', '1', '1', '2017-02-15 21:56:44', '2017-02-15 21:56:44');
INSERT INTO `category_secondary` VALUES ('651', 'g', '650', '2017新品', 'coll.jd.com/list.html?sub=11854', '1', '1', '0', '2017-02-15 21:56:44', '2017-02-15 21:56:44');
INSERT INTO `category_secondary` VALUES ('652', 'g', '650', '女靴', '11729-11731-9776', '1', '1', '0', '2017-02-15 21:56:44', '2017-02-15 21:56:44');
INSERT INTO `category_secondary` VALUES ('653', 'g', '650', '单鞋', '11729-11731-6914', '1', '1', '0', '2017-02-15 21:56:44', '2017-02-15 21:56:44');
INSERT INTO `category_secondary` VALUES ('654', 'g', '650', '休闲鞋', '11729-11731-6916', '1', '1', '0', '2017-02-15 21:56:44', '2017-02-15 21:56:44');
INSERT INTO `category_secondary` VALUES ('655', 'g', '650', '高跟鞋', '11729-11731-9772', '1', '1', '0', '2017-02-15 21:56:44', '2017-02-15 21:56:44');
INSERT INTO `category_secondary` VALUES ('656', 'g', '650', '内增高', '11729-11731-12063', '1', '1', '0', '2017-02-15 21:56:44', '2017-02-15 21:56:44');
INSERT INTO `category_secondary` VALUES ('657', 'g', '650', '坡跟鞋', '11729-11731-12061', '1', '1', '0', '2017-02-15 21:56:44', '2017-02-15 21:56:44');
INSERT INTO `category_secondary` VALUES ('658', 'g', '650', '松糕鞋', '11729-11731-12062', '1', '1', '0', '2017-02-15 21:56:44', '2017-02-15 21:56:44');
INSERT INTO `category_secondary` VALUES ('659', 'g', '650', '防水台', '11729-11731-12064', '1', '1', '0', '2017-02-15 21:56:44', '2017-02-15 21:56:44');
INSERT INTO `category_secondary` VALUES ('66', 'a', '55', '饮水机', '737-738-750', '1', '1', '0', '2017-02-15 21:56:33', '2017-02-15 21:56:33');
INSERT INTO `category_secondary` VALUES ('660', 'g', '650', '鱼嘴鞋', '11729-11731-6915', '1', '1', '0', '2017-02-15 21:56:44', '2017-02-15 21:56:44');
INSERT INTO `category_secondary` VALUES ('661', 'g', '650', '布鞋/绣花鞋', '11729-11731-6918', '1', '1', '0', '2017-02-15 21:56:44', '2017-02-15 21:56:44');
INSERT INTO `category_secondary` VALUES ('662', 'g', '650', '拖鞋/人字拖', '11729-11731-9775', '1', '1', '0', '2017-02-15 21:56:44', '2017-02-15 21:56:44');
INSERT INTO `category_secondary` VALUES ('663', 'g', '650', '马丁靴', '11729-11731-12060', '1', '1', '0', '2017-02-15 21:56:44', '2017-02-15 21:56:44');
INSERT INTO `category_secondary` VALUES ('664', 'g', '650', '踝靴', '11729-11731-9769', '1', '1', '0', '2017-02-15 21:56:44', '2017-02-15 21:56:44');
INSERT INTO `category_secondary` VALUES ('665', 'g', '650', '雪地靴', '11729-11731-6920', '1', '1', '0', '2017-02-15 21:56:44', '2017-02-15 21:56:44');
INSERT INTO `category_secondary` VALUES ('666', 'g', '650', '妈妈鞋', '11729-11731-9778', '1', '1', '0', '2017-02-15 21:56:44', '2017-02-15 21:56:44');
INSERT INTO `category_secondary` VALUES ('667', 'g', '650', '帆布鞋', '11729-11731-9774', '1', '1', '0', '2017-02-15 21:56:44', '2017-02-15 21:56:44');
INSERT INTO `category_secondary` VALUES ('668', 'g', '650', '雨鞋/雨靴', '11729-11731-9777', '1', '1', '0', '2017-02-15 21:56:44', '2017-02-15 21:56:44');
INSERT INTO `category_secondary` VALUES ('669', 'g', '650', '凉鞋', '11729-11731-6917', '1', '1', '0', '2017-02-15 21:56:44', '2017-02-15 21:56:44');
INSERT INTO `category_secondary` VALUES ('67', 'a', '55', '净水器', '737-738-898', '1', '1', '0', '2017-02-15 21:56:33', '2017-02-15 21:56:33');
INSERT INTO `category_secondary` VALUES ('670', 'g', '650', '鞋配件', '11729-11731-9779', '1', '1', '0', '2017-02-15 21:56:44', '2017-02-15 21:56:44');
INSERT INTO `category_secondary` VALUES ('671', 'g', '649', '流行男鞋', '11729-11730', '1', '1', '1', '2017-02-15 21:56:44', '2017-02-15 21:56:44');
INSERT INTO `category_secondary` VALUES ('672', 'g', '671', '2017新品', 'coll.jd.com/list.html?sub=11859', '1', '1', '0', '2017-02-15 21:56:44', '2017-02-15 21:56:44');
INSERT INTO `category_secondary` VALUES ('673', 'g', '671', '休闲鞋', '11729-11730-6908', '1', '1', '0', '2017-02-15 21:56:44', '2017-02-15 21:56:44');
INSERT INTO `category_secondary` VALUES ('674', 'g', '671', '商务休闲鞋', '11729-11730-6907', '1', '1', '0', '2017-02-15 21:56:44', '2017-02-15 21:56:44');
INSERT INTO `category_secondary` VALUES ('675', 'g', '671', '正装鞋', '11729-11730-6906', '1', '1', '0', '2017-02-15 21:56:44', '2017-02-15 21:56:44');
INSERT INTO `category_secondary` VALUES ('676', 'g', '671', '工装鞋', '11729-11730-12067', '1', '1', '0', '2017-02-15 21:56:44', '2017-02-15 21:56:44');
INSERT INTO `category_secondary` VALUES ('677', 'g', '671', '男靴', '11729-11730-6912', '1', '1', '0', '2017-02-15 21:56:44', '2017-02-15 21:56:44');
INSERT INTO `category_secondary` VALUES ('678', 'g', '671', '帆布鞋', '11729-11730-9783', '1', '1', '0', '2017-02-15 21:56:44', '2017-02-15 21:56:44');
INSERT INTO `category_secondary` VALUES ('679', 'g', '671', '功能鞋', '11729-11730-9781', '1', '1', '0', '2017-02-15 21:56:44', '2017-02-15 21:56:44');
INSERT INTO `category_secondary` VALUES ('68', 'a', '55', '除湿机', '737-738-1283', '1', '1', '0', '2017-02-15 21:56:33', '2017-02-15 21:56:33');
INSERT INTO `category_secondary` VALUES ('680', 'g', '671', '增高鞋', '11729-11730-12066', '1', '1', '0', '2017-02-15 21:56:44', '2017-02-15 21:56:44');
INSERT INTO `category_secondary` VALUES ('681', 'g', '671', '定制鞋', '11729-11730-12068', '1', '1', '0', '2017-02-15 21:56:44', '2017-02-15 21:56:44');
INSERT INTO `category_secondary` VALUES ('682', 'g', '671', '拖鞋/人字拖', '11729-11730-6911', '1', '1', '0', '2017-02-15 21:56:44', '2017-02-15 21:56:44');
INSERT INTO `category_secondary` VALUES ('683', 'g', '671', '凉鞋/沙滩鞋', '11729-11730-6909', '1', '1', '0', '2017-02-15 21:56:44', '2017-02-15 21:56:44');
INSERT INTO `category_secondary` VALUES ('684', 'g', '671', '雨鞋/雨靴', '11729-11730-9782', '1', '1', '0', '2017-02-15 21:56:44', '2017-02-15 21:56:44');
INSERT INTO `category_secondary` VALUES ('685', 'g', '671', '传统布鞋', '11729-11730-6910', '1', '1', '0', '2017-02-15 21:56:44', '2017-02-15 21:56:44');
INSERT INTO `category_secondary` VALUES ('686', 'g', '671', '鞋配件', '11729-11730-6913', '1', '1', '0', '2017-02-15 21:56:44', '2017-02-15 21:56:44');
INSERT INTO `category_secondary` VALUES ('687', 'g', '649', '潮流女包', '1672-2575', '1', '1', '1', '2017-02-15 21:56:44', '2017-02-15 21:56:44');
INSERT INTO `category_secondary` VALUES ('688', 'g', '687', '真皮包', 'list.jd.com/list.html?tid=51', '1', '1', '0', '2017-02-15 21:56:44', '2017-02-15 21:56:44');
INSERT INTO `category_secondary` VALUES ('689', 'g', '687', '水桶包', 'list.jd.com/list.html?tid=54', '1', '1', '0', '2017-02-15 21:56:44', '2017-02-15 21:56:44');
INSERT INTO `category_secondary` VALUES ('69', 'a', '55', '干衣机', '737-738-12395', '1', '1', '0', '2017-02-15 21:56:33', '2017-02-15 21:56:33');
INSERT INTO `category_secondary` VALUES ('690', 'g', '687', '单肩包', '1672-2575-5257', '1', '1', '0', '2017-02-15 21:56:44', '2017-02-15 21:56:44');
INSERT INTO `category_secondary` VALUES ('691', 'g', '687', '手提包', '1672-2575-5259', '1', '1', '0', '2017-02-15 21:56:44', '2017-02-15 21:56:44');
INSERT INTO `category_secondary` VALUES ('692', 'g', '687', '斜挎包', '1672-2575-5260', '1', '1', '0', '2017-02-15 21:56:44', '2017-02-15 21:56:44');
INSERT INTO `category_secondary` VALUES ('693', 'g', '687', '双肩包', '1672-2575-5258', '1', '1', '0', '2017-02-15 21:56:44', '2017-02-15 21:56:44');
INSERT INTO `category_secondary` VALUES ('694', 'g', '687', '钱包', '1672-2575-2580', '1', '1', '0', '2017-02-15 21:56:44', '2017-02-15 21:56:44');
INSERT INTO `category_secondary` VALUES ('695', 'g', '687', '手拿包', '1672-2575-5256', '1', '1', '0', '2017-02-15 21:56:44', '2017-02-15 21:56:44');
INSERT INTO `category_secondary` VALUES ('696', 'g', '687', '卡包/零钱包', '1672-2575-12070', '1', '1', '0', '2017-02-15 21:56:44', '2017-02-15 21:56:44');
INSERT INTO `category_secondary` VALUES ('697', 'g', '687', '帆布包', 'list.jd.com/list.html?tid=52', '1', '1', '0', '2017-02-15 21:56:44', '2017-02-15 21:56:44');
INSERT INTO `category_secondary` VALUES ('698', 'g', '687', '小方包', 'list.jd.com/list.html?tid=53', '1', '1', '0', '2017-02-15 21:56:44', '2017-02-15 21:56:44');
INSERT INTO `category_secondary` VALUES ('699', 'g', '687', '钥匙包', '1672-2575-12069', '1', '1', '0', '2017-02-15 21:56:44', '2017-02-15 21:56:44');
INSERT INTO `category_secondary` VALUES ('7', 'a', '6', '壁挂式空调', 'list.jd.com/list.html?cat=737,794,870&ev=1554_584893&JL=3_%E7%A9%BA%E8%B0%83%E7%B1%BB%E5%88%AB_%E5%A3%81%E6%8C%82%E5%BC%8F%E7%A9%BA%E8%B0%83#J_crumbsBar', '1', '1', '0', '2017-02-15 21:56:33', '2017-02-15 21:56:33');
INSERT INTO `category_secondary` VALUES ('70', 'a', '55', '清洁机', '737-738-897', '1', '1', '0', '2017-02-15 21:56:33', '2017-02-15 21:56:33');
INSERT INTO `category_secondary` VALUES ('700', 'g', '687', '链条包', 'list.jd.com/list.html?tid=62', '1', '1', '0', '2017-02-15 21:56:44', '2017-02-15 21:56:44');
INSERT INTO `category_secondary` VALUES ('701', 'g', '687', '贝壳包', 'list.jd.com/list.html?tid=56', '1', '1', '0', '2017-02-15 21:56:44', '2017-02-15 21:56:44');
INSERT INTO `category_secondary` VALUES ('702', 'g', '649', '精品男包', '1672-2576', '1', '1', '1', '2017-02-15 21:56:44', '2017-02-15 21:56:44');
INSERT INTO `category_secondary` VALUES ('703', 'g', '702', '男士钱包', '1672-2576-2584', '1', '1', '0', '2017-02-15 21:56:44', '2017-02-15 21:56:44');
INSERT INTO `category_secondary` VALUES ('704', 'g', '702', '单肩/斜挎包', '1672-2576-12072', '1', '1', '0', '2017-02-15 21:56:44', '2017-02-15 21:56:44');
INSERT INTO `category_secondary` VALUES ('705', 'g', '702', '商务公文包', '1672-2576-1455', '1', '1', '0', '2017-02-15 21:56:44', '2017-02-15 21:56:44');
INSERT INTO `category_secondary` VALUES ('706', 'g', '702', '双肩包', '1672-2576-12071', '1', '1', '0', '2017-02-15 21:56:44', '2017-02-15 21:56:44');
INSERT INTO `category_secondary` VALUES ('707', 'g', '702', '男士手包', '1672-2576-5262', '1', '1', '0', '2017-02-15 21:56:44', '2017-02-15 21:56:44');
INSERT INTO `category_secondary` VALUES ('708', 'g', '702', '卡包名片夹', '1672-2576-13542', '1', '1', '0', '2017-02-15 21:56:44', '2017-02-15 21:56:44');
INSERT INTO `category_secondary` VALUES ('709', 'g', '702', '钥匙包', '1672-2576-12073', '1', '1', '0', '2017-02-15 21:56:44', '2017-02-15 21:56:44');
INSERT INTO `category_secondary` VALUES ('71', 'a', '55', '收录/音机', '737-738-801', '1', '1', '0', '2017-02-15 21:56:33', '2017-02-15 21:56:33');
INSERT INTO `category_secondary` VALUES ('710', 'g', '649', '功能箱包', '1672-2577', '1', '1', '1', '2017-02-15 21:56:44', '2017-02-15 21:56:44');
INSERT INTO `category_secondary` VALUES ('711', 'g', '710', '拉杆箱', '1672-2577-2589', '1', '1', '0', '2017-02-15 21:56:44', '2017-02-15 21:56:44');
INSERT INTO `category_secondary` VALUES ('712', 'g', '710', '拉杆包', '1672-2577-13543', '1', '1', '0', '2017-02-15 21:56:44', '2017-02-15 21:56:44');
INSERT INTO `category_secondary` VALUES ('713', 'g', '710', '旅行包', '1672-2577-2588', '1', '1', '0', '2017-02-15 21:56:44', '2017-02-15 21:56:44');
INSERT INTO `category_secondary` VALUES ('714', 'g', '710', '电脑包', '1672-2577-3997', '1', '1', '0', '2017-02-15 21:56:44', '2017-02-15 21:56:44');
INSERT INTO `category_secondary` VALUES ('715', 'g', '710', '休闲运动包', '1672-2577-3998', '1', '1', '0', '2017-02-15 21:56:44', '2017-02-15 21:56:44');
INSERT INTO `category_secondary` VALUES ('716', 'g', '710', '书包', '1672-2577-5265', '1', '1', '0', '2017-02-15 21:56:44', '2017-02-15 21:56:44');
INSERT INTO `category_secondary` VALUES ('717', 'g', '710', '登山包', '1672-2577-2587', '1', '1', '0', '2017-02-15 21:56:44', '2017-02-15 21:56:44');
INSERT INTO `category_secondary` VALUES ('718', 'g', '710', '腰包/胸包', '1672-2577-12076', '1', '1', '0', '2017-02-15 21:56:44', '2017-02-15 21:56:44');
INSERT INTO `category_secondary` VALUES ('719', 'g', '710', '旅行配件', '1672-2577-4000', '1', '1', '0', '2017-02-15 21:56:44', '2017-02-15 21:56:44');
INSERT INTO `category_secondary` VALUES ('72', 'a', '55', '其它生活电器', '737-738-825', '1', '1', '0', '2017-02-15 21:56:33', '2017-02-15 21:56:33');
INSERT INTO `category_secondary` VALUES ('720', 'g', '710', '相机包', '1672-2577-12074', '1', '1', '0', '2017-02-15 21:56:44', '2017-02-15 21:56:44');
INSERT INTO `category_secondary` VALUES ('721', 'g', '710', '妈咪包', '1672-2577-5271', '1', '1', '0', '2017-02-15 21:56:44', '2017-02-15 21:56:44');
INSERT INTO `category_secondary` VALUES ('722', 'g', '649', '奢侈品', '1672-2615', '1', '1', '1', '2017-02-15 21:56:44', '2017-02-15 21:56:44');
INSERT INTO `category_secondary` VALUES ('723', 'g', '722', '箱包', '1672-2615-9186', '1', '1', '0', '2017-02-15 21:56:44', '2017-02-15 21:56:44');
INSERT INTO `category_secondary` VALUES ('724', 'g', '722', '钱包', '1672-2615-9187', '1', '1', '0', '2017-02-15 21:56:44', '2017-02-15 21:56:44');
INSERT INTO `category_secondary` VALUES ('725', 'g', '722', '服饰', '1672-2615-9188', '1', '1', '0', '2017-02-15 21:56:44', '2017-02-15 21:56:44');
INSERT INTO `category_secondary` VALUES ('726', 'g', '722', '腰带', '1672-2615-9189', '1', '1', '0', '2017-02-15 21:56:44', '2017-02-15 21:56:44');
INSERT INTO `category_secondary` VALUES ('727', 'g', '722', '鞋靴', '1672-2615-11934', '1', '1', '0', '2017-02-15 21:56:44', '2017-02-15 21:56:44');
INSERT INTO `category_secondary` VALUES ('728', 'g', '722', '太阳镜/眼镜框', '1672-2615-9190', '1', '1', '0', '2017-02-15 21:56:44', '2017-02-15 21:56:44');
INSERT INTO `category_secondary` VALUES ('729', 'g', '722', '饰品', '1672-2615-11935', '1', '1', '0', '2017-02-15 21:56:44', '2017-02-15 21:56:44');
INSERT INTO `category_secondary` VALUES ('73', 'a', '55', '生活电器配件', '737-738-12396', '1', '1', '0', '2017-02-15 21:56:33', '2017-02-15 21:56:33');
INSERT INTO `category_secondary` VALUES ('730', 'g', '722', '配件', '1672-2615-9191', '1', '1', '0', '2017-02-15 21:56:44', '2017-02-15 21:56:44');
INSERT INTO `category_secondary` VALUES ('731', 'g', '649', '精选大牌', '', '1', '1', '1', '2017-02-15 21:56:44', '2017-02-15 21:56:44');
INSERT INTO `category_secondary` VALUES ('732', 'g', '731', 'GUCCI', 'coll.jd.com/list.html?sub=3430', '1', '1', '0', '2017-02-15 21:56:44', '2017-02-15 21:56:44');
INSERT INTO `category_secondary` VALUES ('733', 'g', '731', 'COACH', 'coll.jd.com/list.html?sub=3432', '1', '1', '0', '2017-02-15 21:56:44', '2017-02-15 21:56:44');
INSERT INTO `category_secondary` VALUES ('734', 'g', '731', '雷朋', 'coll.jd.com/list.html?sub=3538', '1', '1', '0', '2017-02-15 21:56:44', '2017-02-15 21:56:44');
INSERT INTO `category_secondary` VALUES ('735', 'g', '731', '施华洛世奇', 'coll.jd.com/list.html?sub=7106', '1', '1', '0', '2017-02-15 21:56:44', '2017-02-15 21:56:44');
INSERT INTO `category_secondary` VALUES ('736', 'g', '731', 'MK', 'coll.jd.com/list.html?sub=7179', '1', '1', '0', '2017-02-15 21:56:44', '2017-02-15 21:56:44');
INSERT INTO `category_secondary` VALUES ('737', 'g', '731', '阿玛尼', 'coll.jd.com/list.html?sub=7188', '1', '1', '0', '2017-02-15 21:56:44', '2017-02-15 21:56:44');
INSERT INTO `category_secondary` VALUES ('738', 'g', '731', '菲拉格慕', 'coll.jd.com/list.html?sub=7182', '1', '1', '0', '2017-02-15 21:56:44', '2017-02-15 21:56:44');
INSERT INTO `category_secondary` VALUES ('739', 'g', '731', 'VERSACE', 'coll.jd.com/list.html?sub=9245', '1', '1', '0', '2017-02-15 21:56:44', '2017-02-15 21:56:44');
INSERT INTO `category_secondary` VALUES ('74', 'a', '1', '个护健康', '737-1276', '1', '1', '1', '2017-02-15 21:56:33', '2017-02-15 21:56:33');
INSERT INTO `category_secondary` VALUES ('740', 'g', '731', '普拉达', 'coll.jd.com/list.html?sub=7180', '1', '1', '0', '2017-02-15 21:56:44', '2017-02-15 21:56:44');
INSERT INTO `category_secondary` VALUES ('741', 'g', '731', '巴宝莉', 'coll.jd.com/list.html?sub=7183', '1', '1', '0', '2017-02-15 21:56:44', '2017-02-15 21:56:44');
INSERT INTO `category_secondary` VALUES ('742', 'g', '731', '万宝龙', 'coll.jd.com/list.html?sub=7186', '1', '1', '0', '2017-02-15 21:56:44', '2017-02-15 21:56:44');
INSERT INTO `category_secondary` VALUES ('743', 'g', '649', '礼品', '1672-2599', '1', '1', '1', '2017-02-15 21:56:44', '2017-02-15 21:56:44');
INSERT INTO `category_secondary` VALUES ('744', 'g', '743', '情人节礼物', 'coll.jd.com/list.html?sub=11928', '1', '1', '0', '2017-02-15 21:56:44', '2017-02-15 21:56:44');
INSERT INTO `category_secondary` VALUES ('745', 'g', '743', '电子烟', 'list.jd.com/list.html?cat=1672,2599,1440&ev=1107_10424%7C%7C85451%7C%7C89238', '1', '1', '0', '2017-02-15 21:56:44', '2017-02-15 21:56:44');
INSERT INTO `category_secondary` VALUES ('746', 'g', '743', '火机烟具', 'list.jd.com/list.html?cat=1672,2599,1440&ev=1107_9913%7C%7C85450%7C%7C9915%7C%7C9917%7C%7C9914%7C%7C9918%7C%7C9916%7C%7C33710%7C%7C89239', '1', '1', '0', '2017-02-15 21:56:44', '2017-02-15 21:56:44');
INSERT INTO `category_secondary` VALUES ('747', 'g', '743', '军刀军具', '1672-2599-1443', '1', '1', '0', '2017-02-15 21:56:44', '2017-02-15 21:56:44');
INSERT INTO `category_secondary` VALUES ('748', 'g', '743', '美妆礼品', '1672-2599-12078', '1', '1', '0', '2017-02-15 21:56:44', '2017-02-15 21:56:44');
INSERT INTO `category_secondary` VALUES ('749', 'g', '743', '工艺礼品', '1672-2599-1445', '1', '1', '0', '2017-02-15 21:56:44', '2017-02-15 21:56:44');
INSERT INTO `category_secondary` VALUES ('75', 'a', '74', '剃须刀', '737-1276-739', '1', '1', '0', '2017-02-15 21:56:33', '2017-02-15 21:56:33');
INSERT INTO `category_secondary` VALUES ('750', 'g', '743', '礼盒礼券', '1672-2599-1446', '1', '1', '0', '2017-02-15 21:56:44', '2017-02-15 21:56:44');
INSERT INTO `category_secondary` VALUES ('751', 'g', '743', '礼品文具', '1672-2599-1442', '1', '1', '0', '2017-02-15 21:56:44', '2017-02-15 21:56:44');
INSERT INTO `category_secondary` VALUES ('752', 'g', '743', '收藏品', '1672-2599-1444', '1', '1', '0', '2017-02-15 21:56:44', '2017-02-15 21:56:44');
INSERT INTO `category_secondary` VALUES ('753', 'g', '743', '古董文玩', '1672-2599-12080', '1', '1', '0', '2017-02-15 21:56:44', '2017-02-15 21:56:44');
INSERT INTO `category_secondary` VALUES ('754', 'g', '743', '礼品定制', '1672-2599-12079', '1', '1', '0', '2017-02-15 21:56:44', '2017-02-15 21:56:44');
INSERT INTO `category_secondary` VALUES ('755', 'g', '743', '创意礼品', '1672-2599-5266', '1', '1', '0', '2017-02-15 21:56:44', '2017-02-15 21:56:44');
INSERT INTO `category_secondary` VALUES ('756', 'g', '743', '电子礼品', '1672-2599-13665', '1', '1', '0', '2017-02-15 21:56:44', '2017-02-15 21:56:44');
INSERT INTO `category_secondary` VALUES ('757', 'g', '743', '婚庆节庆', '1672-2599-4942', '1', '1', '0', '2017-02-15 21:56:44', '2017-02-15 21:56:44');
INSERT INTO `category_secondary` VALUES ('758', 'g', '743', '鲜花', '1672-2599-4698', '1', '1', '0', '2017-02-15 21:56:44', '2017-02-15 21:56:44');
INSERT INTO `category_secondary` VALUES ('759', 'g', '743', '绿植', '1672-2599-13666', '1', '1', '0', '2017-02-15 21:56:44', '2017-02-15 21:56:44');
INSERT INTO `category_secondary` VALUES ('76', 'a', '74', '口腔护理', '737-1276-741', '1', '1', '0', '2017-02-15 21:56:33', '2017-02-15 21:56:33');
INSERT INTO `category_secondary` VALUES ('760', 'g', '743', '熏香', '1672-2599-13667', '1', '1', '0', '2017-02-15 21:56:44', '2017-02-15 21:56:44');
INSERT INTO `category_secondary` VALUES ('761', 'g', '743', '京东卡', '1672-2599-6980', '1', '1', '0', '2017-02-15 21:56:44', '2017-02-15 21:56:44');
INSERT INTO `category_secondary` VALUES ('762', 'g', '649', '珠宝首饰', 'channel.jd.com/jewellery.html', '1', '1', '1', '2017-02-15 21:56:44', '2017-02-15 21:56:44');
INSERT INTO `category_secondary` VALUES ('763', 'g', '762', '美饰送女友', 'coll.jd.com/list.html?sub=11926', '1', '1', '0', '2017-02-15 21:56:44', '2017-02-15 21:56:44');
INSERT INTO `category_secondary` VALUES ('764', 'g', '762', '黄金', 'channel.jd.com/huangjin.html', '1', '1', '0', '2017-02-15 21:56:44', '2017-02-15 21:56:44');
INSERT INTO `category_secondary` VALUES ('765', 'g', '762', 'K金', '6144-13062', '1', '1', '0', '2017-02-15 21:56:44', '2017-02-15 21:56:44');
INSERT INTO `category_secondary` VALUES ('766', 'g', '762', '时尚饰品', '6144-6182', '1', '1', '0', '2017-02-15 21:56:44', '2017-02-15 21:56:44');
INSERT INTO `category_secondary` VALUES ('767', 'g', '762', '钻石', '6144-6160', '1', '1', '0', '2017-02-15 21:56:44', '2017-02-15 21:56:44');
INSERT INTO `category_secondary` VALUES ('768', 'g', '762', '翡翠玉石', '6144-6167', '1', '1', '0', '2017-02-15 21:56:44', '2017-02-15 21:56:44');
INSERT INTO `category_secondary` VALUES ('769', 'g', '762', '银饰', '6144-6155', '1', '1', '0', '2017-02-15 21:56:44', '2017-02-15 21:56:44');
INSERT INTO `category_secondary` VALUES ('77', 'a', '74', '电吹风', '737-1276-740', '1', '1', '0', '2017-02-15 21:56:33', '2017-02-15 21:56:33');
INSERT INTO `category_secondary` VALUES ('770', 'g', '762', '水晶玛瑙', '6144-6172', '1', '1', '0', '2017-02-15 21:56:44', '2017-02-15 21:56:44');
INSERT INTO `category_secondary` VALUES ('771', 'g', '762', '彩宝', '6144-6174', '1', '1', '0', '2017-02-15 21:56:44', '2017-02-15 21:56:44');
INSERT INTO `category_secondary` VALUES ('772', 'g', '762', '铂金', '6144-12040', '1', '1', '0', '2017-02-15 21:56:44', '2017-02-15 21:56:44');
INSERT INTO `category_secondary` VALUES ('773', 'g', '762', '木手串/把件', 'channel.jd.com/mushouchuan.html', '1', '1', '0', '2017-02-15 21:56:44', '2017-02-15 21:56:44');
INSERT INTO `category_secondary` VALUES ('774', 'g', '762', '珍珠', '6144-12042', '1', '1', '0', '2017-02-15 21:56:44', '2017-02-15 21:56:44');
INSERT INTO `category_secondary` VALUES ('775', 'g', '649', '金银投资', 'channel.jd.com/jintiao.html', '1', '1', '1', '2017-02-15 21:56:44', '2017-02-15 21:56:44');
INSERT INTO `category_secondary` VALUES ('776', 'g', '775', '投资金', '6144-6146-6151', '1', '1', '0', '2017-02-15 21:56:44', '2017-02-15 21:56:44');
INSERT INTO `category_secondary` VALUES ('777', 'g', '775', '投资银', '6144-6146-6152', '1', '1', '0', '2017-02-15 21:56:44', '2017-02-15 21:56:44');
INSERT INTO `category_secondary` VALUES ('778', 'g', '775', '投资收藏', '6144-6146-13531', '1', '1', '0', '2017-02-15 21:56:44', '2017-02-15 21:56:44');
INSERT INTO `category_secondary` VALUES ('779', 'g', '775', '黄金托管', 'sale.jd.com/act/6EFTbkiZ1j4BUfdH.html', '1', '1', '0', '2017-02-15 21:56:44', '2017-02-15 21:56:44');
INSERT INTO `category_secondary` VALUES ('78', 'a', '74', '美容器', '737-1276-795', '1', '1', '0', '2017-02-15 21:56:33', '2017-02-15 21:56:33');
INSERT INTO `category_secondary` VALUES ('780', 'g', '0', '箱包', 'channel.jd.com/bag.html', '1', '1', '0', '2017-02-15 21:56:44', '2017-02-15 21:56:44');
INSERT INTO `category_secondary` VALUES ('781', 'g', '0', '珠宝', 'channel.jd.com/jewellery.html', '1', '1', '0', '2017-02-15 21:56:44', '2017-02-15 21:56:44');
INSERT INTO `category_secondary` VALUES ('782', 'g', '0', '奢侈品', 'channel.jd.com/1672-2615.html', '1', '1', '0', '2017-02-15 21:56:44', '2017-02-15 21:56:44');
INSERT INTO `category_secondary` VALUES ('783', 'g', '-1', '自营鞋靴', 'sale.jd.com/act/i2rN6zGYHQoDRp.html', '1', '1', '1', '2017-02-15 21:56:44', '2017-02-15 21:56:44');
INSERT INTO `category_secondary` VALUES ('784', 'g', '-1', '国际品牌', 'sale.jd.com/act/Psg6ERaQrvwH.html', '1', '1', '1', '2017-02-15 21:56:44', '2017-02-15 21:56:44');
INSERT INTO `category_secondary` VALUES ('785', 'g', '-1', '时尚期刊', 'sale.jd.com/act/jQGf1XHEsWq3iD.html', '1', '1', '1', '2017-02-15 21:56:44', '2017-02-15 21:56:44');
INSERT INTO `category_secondary` VALUES ('786', 'g', '-1', '国际珠宝馆', 'gjzhubao.jd.com', '1', '1', '1', '2017-02-15 21:56:44', '2017-02-15 21:56:44');
INSERT INTO `category_secondary` VALUES ('787', 'g', '-1', '奢侈品', 'channel.jd.com/luxury.html', '1', '1', '1', '2017-02-15 21:56:44', '2017-02-15 21:56:44');
INSERT INTO `category_secondary` VALUES ('788', 'g', '-1', '收藏投资', 'sale.jd.com/act/EA2eRvdXBrwq1f.html?t=1463132371173', '1', '1', '1', '2017-02-15 21:56:44', '2017-02-15 21:56:44');
INSERT INTO `category_secondary` VALUES ('789', 'h', '0', '运动', 'channel.jd.com/yundongcheng.html', '1', '1', '1', '2017-02-15 21:56:46', '2017-02-15 21:56:46');
INSERT INTO `category_secondary` VALUES ('79', 'a', '74', '卷/直发器', '737-1276-12400', '1', '1', '0', '2017-02-15 21:56:33', '2017-02-15 21:56:33');
INSERT INTO `category_secondary` VALUES ('790', 'h', '789', '运动鞋包', 'channel.jd.com/yundong.html', '1', '1', '1', '2017-02-15 21:56:46', '2017-02-15 21:56:46');
INSERT INTO `category_secondary` VALUES ('791', 'h', '790', '跑步鞋', '1318-12099-9756', '1', '1', '0', '2017-02-15 21:56:46', '2017-02-15 21:56:46');
INSERT INTO `category_secondary` VALUES ('792', 'h', '790', '休闲鞋', '1318-12099-9754', '1', '1', '0', '2017-02-15 21:56:46', '2017-02-15 21:56:46');
INSERT INTO `category_secondary` VALUES ('793', 'h', '790', '篮球鞋', '1318-12099-9757', '1', '1', '0', '2017-02-15 21:56:46', '2017-02-15 21:56:46');
INSERT INTO `category_secondary` VALUES ('794', 'h', '790', '帆布鞋', '1318-12099-9755', '1', '1', '0', '2017-02-15 21:56:46', '2017-02-15 21:56:46');
INSERT INTO `category_secondary` VALUES ('795', 'h', '790', '板鞋', '1318-12099-12100', '1', '1', '0', '2017-02-15 21:56:46', '2017-02-15 21:56:46');
INSERT INTO `category_secondary` VALUES ('796', 'h', '790', '拖鞋', '1318-12099-9761', '1', '1', '0', '2017-02-15 21:56:46', '2017-02-15 21:56:46');
INSERT INTO `category_secondary` VALUES ('797', 'h', '790', '运动包', '1318-12099-9768', '1', '1', '0', '2017-02-15 21:56:46', '2017-02-15 21:56:46');
INSERT INTO `category_secondary` VALUES ('798', 'h', '790', '足球鞋', '1318-12099-9758', '1', '1', '0', '2017-02-15 21:56:46', '2017-02-15 21:56:46');
INSERT INTO `category_secondary` VALUES ('799', 'h', '790', '乒羽网鞋', '1318-12099-9760', '1', '1', '0', '2017-02-15 21:56:46', '2017-02-15 21:56:46');
INSERT INTO `category_secondary` VALUES ('8', 'a', '6', '柜式空调', 'list.jd.com/list.html?cat=737,794,870&ev=1554_584894&JL=3_%E7%A9%BA%E8%B0%83%E7%B1%BB%E5%88%AB_%E7%AB%8B%E6%9F%9C%E5%BC%8F%E7%A9%BA%E8%B0%83#J_crumbsBar', '1', '1', '0', '2017-02-15 21:56:33', '2017-02-15 21:56:33');
INSERT INTO `category_secondary` VALUES ('80', 'a', '74', '理发器', '737-1276-1287', '1', '1', '0', '2017-02-15 21:56:33', '2017-02-15 21:56:33');
INSERT INTO `category_secondary` VALUES ('800', 'h', '790', '训练鞋', '1318-12099-9759', '1', '1', '0', '2017-02-15 21:56:46', '2017-02-15 21:56:46');
INSERT INTO `category_secondary` VALUES ('801', 'h', '790', '专项运动鞋', '1318-12099-12101', '1', '1', '0', '2017-02-15 21:56:46', '2017-02-15 21:56:46');
INSERT INTO `category_secondary` VALUES ('802', 'h', '789', '运动服饰', '1318-12102', '1', '1', '1', '2017-02-15 21:56:46', '2017-02-15 21:56:46');
INSERT INTO `category_secondary` VALUES ('803', 'h', '802', 'T恤', '1318-12102-9765', '1', '1', '0', '2017-02-15 21:56:46', '2017-02-15 21:56:46');
INSERT INTO `category_secondary` VALUES ('804', 'h', '802', '运动裤', '1318-12102-9766', '1', '1', '0', '2017-02-15 21:56:46', '2017-02-15 21:56:46');
INSERT INTO `category_secondary` VALUES ('805', 'h', '802', '健身服', '1318-12102-12107', '1', '1', '0', '2017-02-15 21:56:46', '2017-02-15 21:56:46');
INSERT INTO `category_secondary` VALUES ('806', 'h', '802', '运动套装', '1318-12102-9767', '1', '1', '0', '2017-02-15 21:56:46', '2017-02-15 21:56:46');
INSERT INTO `category_secondary` VALUES ('807', 'h', '802', '运动背心', '1318-12102-12108', '1', '1', '0', '2017-02-15 21:56:46', '2017-02-15 21:56:46');
INSERT INTO `category_secondary` VALUES ('808', 'h', '802', '羽绒服', '1318-12102-12104', '1', '1', '0', '2017-02-15 21:56:46', '2017-02-15 21:56:46');
INSERT INTO `category_secondary` VALUES ('809', 'h', '802', '卫衣/套头衫', '1318-12102-9764', '1', '1', '0', '2017-02-15 21:56:46', '2017-02-15 21:56:46');
INSERT INTO `category_secondary` VALUES ('81', 'a', '74', '剃/脱毛器', '737-1276-742', '1', '1', '0', '2017-02-15 21:56:33', '2017-02-15 21:56:33');
INSERT INTO `category_secondary` VALUES ('810', 'h', '802', '棉服', '1318-12102-9762', '1', '1', '0', '2017-02-15 21:56:46', '2017-02-15 21:56:46');
INSERT INTO `category_secondary` VALUES ('811', 'h', '802', '夹克/风衣', '1318-12102-9763', '1', '1', '0', '2017-02-15 21:56:46', '2017-02-15 21:56:46');
INSERT INTO `category_secondary` VALUES ('812', 'h', '802', '运动配饰', '1318-12102-12103', '1', '1', '0', '2017-02-15 21:56:46', '2017-02-15 21:56:46');
INSERT INTO `category_secondary` VALUES ('813', 'h', '802', '乒羽网服', '1318-12102-12106', '1', '1', '0', '2017-02-15 21:56:46', '2017-02-15 21:56:46');
INSERT INTO `category_secondary` VALUES ('814', 'h', '802', '毛衫/线衫', '1318-12102-12105', '1', '1', '0', '2017-02-15 21:56:46', '2017-02-15 21:56:46');
INSERT INTO `category_secondary` VALUES ('815', 'h', '789', '健身训练', '1318-1463', '1', '1', '1', '2017-02-15 21:56:46', '2017-02-15 21:56:46');
INSERT INTO `category_secondary` VALUES ('816', 'h', '815', '跑步机', '1318-1463-1484', '1', '1', '0', '2017-02-15 21:56:46', '2017-02-15 21:56:46');
INSERT INTO `category_secondary` VALUES ('817', 'h', '815', '健身车/动感单车', '1318-1463-1483', '1', '1', '0', '2017-02-15 21:56:46', '2017-02-15 21:56:46');
INSERT INTO `category_secondary` VALUES ('818', 'h', '815', '哑铃', '1318-1463-12111', '1', '1', '0', '2017-02-15 21:56:46', '2017-02-15 21:56:46');
INSERT INTO `category_secondary` VALUES ('819', 'h', '815', '仰卧板/收腹机', '1318-1463-12112', '1', '1', '0', '2017-02-15 21:56:46', '2017-02-15 21:56:46');
INSERT INTO `category_secondary` VALUES ('82', 'a', '74', '足浴盆', '737-1276-963', '1', '1', '0', '2017-02-15 21:56:33', '2017-02-15 21:56:33');
INSERT INTO `category_secondary` VALUES ('820', 'h', '815', '甩脂机', '1318-1463-12858', '1', '1', '0', '2017-02-15 21:56:46', '2017-02-15 21:56:46');
INSERT INTO `category_secondary` VALUES ('821', 'h', '815', '踏步机', '1318-1463-12859', '1', '1', '0', '2017-02-15 21:56:46', '2017-02-15 21:56:46');
INSERT INTO `category_secondary` VALUES ('822', 'h', '815', '运动护具', '1318-1463-1487', '1', '1', '0', '2017-02-15 21:56:46', '2017-02-15 21:56:46');
INSERT INTO `category_secondary` VALUES ('823', 'h', '815', '瑜伽舞蹈', '1318-1463-12114', '1', '1', '0', '2017-02-15 21:56:46', '2017-02-15 21:56:46');
INSERT INTO `category_secondary` VALUES ('824', 'h', '815', '武术搏击', '1318-1463-5153', '1', '1', '0', '2017-02-15 21:56:46', '2017-02-15 21:56:46');
INSERT INTO `category_secondary` VALUES ('825', 'h', '815', '综合训练器', '1318-1463-12109', '1', '1', '0', '2017-02-15 21:56:46', '2017-02-15 21:56:46');
INSERT INTO `category_secondary` VALUES ('826', 'h', '815', '其他大型器械', '1318-1463-12110', '1', '1', '0', '2017-02-15 21:56:46', '2017-02-15 21:56:46');
INSERT INTO `category_secondary` VALUES ('827', 'h', '815', '其他中小型器材', '1318-1463-12113', '1', '1', '0', '2017-02-15 21:56:46', '2017-02-15 21:56:46');
INSERT INTO `category_secondary` VALUES ('828', 'h', '789', '骑行运动', '1318-12115', '1', '1', '1', '2017-02-15 21:56:46', '2017-02-15 21:56:46');
INSERT INTO `category_secondary` VALUES ('829', 'h', '828', '山地车/公路车', '1318-12115-12117', '1', '1', '0', '2017-02-15 21:56:46', '2017-02-15 21:56:46');
INSERT INTO `category_secondary` VALUES ('83', 'a', '74', '健康秤/厨房秤', '737-1276-1289', '1', '1', '0', '2017-02-15 21:56:33', '2017-02-15 21:56:33');
INSERT INTO `category_secondary` VALUES ('830', 'h', '828', '折叠车', '1318-12115-12116', '1', '1', '0', '2017-02-15 21:56:46', '2017-02-15 21:56:46');
INSERT INTO `category_secondary` VALUES ('831', 'h', '828', '电动车', '1318-12115-12118', '1', '1', '0', '2017-02-15 21:56:46', '2017-02-15 21:56:46');
INSERT INTO `category_secondary` VALUES ('832', 'h', '828', '平衡车', '1318-12115-12861', '1', '1', '0', '2017-02-15 21:56:46', '2017-02-15 21:56:46');
INSERT INTO `category_secondary` VALUES ('833', 'h', '828', '其他整车', '1318-12115-12119', '1', '1', '0', '2017-02-15 21:56:46', '2017-02-15 21:56:46');
INSERT INTO `category_secondary` VALUES ('834', 'h', '828', '骑行装备', '1318-12115-12121', '1', '1', '0', '2017-02-15 21:56:46', '2017-02-15 21:56:46');
INSERT INTO `category_secondary` VALUES ('835', 'h', '828', '骑行服', '1318-12115-12120', '1', '1', '0', '2017-02-15 21:56:46', '2017-02-15 21:56:46');
INSERT INTO `category_secondary` VALUES ('836', 'h', '789', '体育用品', '1318-1466', '1', '1', '1', '2017-02-15 21:56:46', '2017-02-15 21:56:46');
INSERT INTO `category_secondary` VALUES ('837', 'h', '836', '乒乓球', '1318-1466-1694', '1', '1', '0', '2017-02-15 21:56:46', '2017-02-15 21:56:46');
INSERT INTO `category_secondary` VALUES ('838', 'h', '836', '羽毛球', '1318-1466-1695', '1', '1', '0', '2017-02-15 21:56:46', '2017-02-15 21:56:46');
INSERT INTO `category_secondary` VALUES ('839', 'h', '836', '篮球', '1318-1466-1698', '1', '1', '0', '2017-02-15 21:56:46', '2017-02-15 21:56:46');
INSERT INTO `category_secondary` VALUES ('84', 'a', '74', '按摩器', '737-1276-967', '1', '1', '0', '2017-02-15 21:56:33', '2017-02-15 21:56:33');
INSERT INTO `category_secondary` VALUES ('840', 'h', '836', '足球', '1318-1466-1697', '1', '1', '0', '2017-02-15 21:56:46', '2017-02-15 21:56:46');
INSERT INTO `category_secondary` VALUES ('841', 'h', '836', '轮滑滑板', '1318-1466-12122', '1', '1', '0', '2017-02-15 21:56:46', '2017-02-15 21:56:46');
INSERT INTO `category_secondary` VALUES ('842', 'h', '836', '网球', '1318-1466-1696', '1', '1', '0', '2017-02-15 21:56:46', '2017-02-15 21:56:46');
INSERT INTO `category_secondary` VALUES ('843', 'h', '836', '高尔夫', '1318-1466-1700', '1', '1', '0', '2017-02-15 21:56:46', '2017-02-15 21:56:46');
INSERT INTO `category_secondary` VALUES ('844', 'h', '836', '台球', '1318-1466-1701', '1', '1', '0', '2017-02-15 21:56:46', '2017-02-15 21:56:46');
INSERT INTO `category_secondary` VALUES ('845', 'h', '836', '排球', '1318-1466-1699', '1', '1', '0', '2017-02-15 21:56:46', '2017-02-15 21:56:46');
INSERT INTO `category_secondary` VALUES ('846', 'h', '836', '棋牌麻将', '1318-1466-5155', '1', '1', '0', '2017-02-15 21:56:46', '2017-02-15 21:56:46');
INSERT INTO `category_secondary` VALUES ('847', 'h', '836', '其它', '1318-1466-5156', '1', '1', '0', '2017-02-15 21:56:46', '2017-02-15 21:56:46');
INSERT INTO `category_secondary` VALUES ('848', 'h', '789', '户外鞋服', '1318-2628', '1', '1', '1', '2017-02-15 21:56:46', '2017-02-15 21:56:46');
INSERT INTO `category_secondary` VALUES ('849', 'h', '848', '户外风衣', '1318-2628-12131', '1', '1', '0', '2017-02-15 21:56:46', '2017-02-15 21:56:46');
INSERT INTO `category_secondary` VALUES ('85', 'a', '74', '按摩椅', '737-1276-1291', '1', '1', '0', '2017-02-15 21:56:33', '2017-02-15 21:56:33');
INSERT INTO `category_secondary` VALUES ('850', 'h', '848', '徒步鞋', '1318-2628-12136', '1', '1', '0', '2017-02-15 21:56:46', '2017-02-15 21:56:46');
INSERT INTO `category_secondary` VALUES ('851', 'h', '848', 'T恤', '1318-2628-12130', '1', '1', '0', '2017-02-15 21:56:46', '2017-02-15 21:56:46');
INSERT INTO `category_secondary` VALUES ('852', 'h', '848', '冲锋衣裤', '1318-2628-12123', '1', '1', '0', '2017-02-15 21:56:46', '2017-02-15 21:56:46');
INSERT INTO `category_secondary` VALUES ('853', 'h', '848', '速干衣裤', '1318-2628-12124', '1', '1', '0', '2017-02-15 21:56:46', '2017-02-15 21:56:46');
INSERT INTO `category_secondary` VALUES ('854', 'h', '848', '越野跑鞋', '1318-2628-12137', '1', '1', '0', '2017-02-15 21:56:46', '2017-02-15 21:56:46');
INSERT INTO `category_secondary` VALUES ('855', 'h', '848', '滑雪服', '1318-2628-12125', '1', '1', '0', '2017-02-15 21:56:46', '2017-02-15 21:56:46');
INSERT INTO `category_secondary` VALUES ('856', 'h', '848', '羽绒服/棉服', '1318-2628-12126', '1', '1', '0', '2017-02-15 21:56:46', '2017-02-15 21:56:46');
INSERT INTO `category_secondary` VALUES ('857', 'h', '848', '休闲衣裤', '1318-2628-12127', '1', '1', '0', '2017-02-15 21:56:46', '2017-02-15 21:56:46');
INSERT INTO `category_secondary` VALUES ('858', 'h', '848', '抓绒衣裤', '1318-2628-12128', '1', '1', '0', '2017-02-15 21:56:46', '2017-02-15 21:56:46');
INSERT INTO `category_secondary` VALUES ('859', 'h', '848', '溯溪鞋', '1318-2628-12140', '1', '1', '0', '2017-02-15 21:56:46', '2017-02-15 21:56:46');
INSERT INTO `category_secondary` VALUES ('86', 'a', '74', '计步器/脂肪检测仪', '737-1276-968', '1', '1', '0', '2017-02-15 21:56:33', '2017-02-15 21:56:33');
INSERT INTO `category_secondary` VALUES ('860', 'h', '848', '沙滩/凉拖', '1318-2628-12141', '1', '1', '0', '2017-02-15 21:56:46', '2017-02-15 21:56:46');
INSERT INTO `category_secondary` VALUES ('861', 'h', '848', '休闲鞋', '1318-2628-12138', '1', '1', '0', '2017-02-15 21:56:46', '2017-02-15 21:56:46');
INSERT INTO `category_secondary` VALUES ('862', 'h', '848', '软壳衣裤', '1318-2628-12129', '1', '1', '0', '2017-02-15 21:56:46', '2017-02-15 21:56:46');
INSERT INTO `category_secondary` VALUES ('863', 'h', '848', '功能内衣', '1318-2628-12132', '1', '1', '0', '2017-02-15 21:56:46', '2017-02-15 21:56:46');
INSERT INTO `category_secondary` VALUES ('864', 'h', '848', '军迷服饰', '1318-2628-12133', '1', '1', '0', '2017-02-15 21:56:46', '2017-02-15 21:56:46');
INSERT INTO `category_secondary` VALUES ('865', 'h', '848', '登山鞋', '1318-2628-12134', '1', '1', '0', '2017-02-15 21:56:46', '2017-02-15 21:56:46');
INSERT INTO `category_secondary` VALUES ('866', 'h', '848', '工装鞋', '1318-2628-12139', '1', '1', '0', '2017-02-15 21:56:46', '2017-02-15 21:56:46');
INSERT INTO `category_secondary` VALUES ('867', 'h', '848', '户外袜', '1318-2628-12142', '1', '1', '0', '2017-02-15 21:56:46', '2017-02-15 21:56:46');
INSERT INTO `category_secondary` VALUES ('868', 'h', '789', '户外装备', '1318-1462', '1', '1', '1', '2017-02-15 21:56:46', '2017-02-15 21:56:46');
INSERT INTO `category_secondary` VALUES ('869', 'h', '868', '帐篷/垫子', '1318-1462-1473', '1', '1', '0', '2017-02-15 21:56:46', '2017-02-15 21:56:46');
INSERT INTO `category_secondary` VALUES ('87', 'a', '74', '其它健康电器', '737-1276-1290', '1', '1', '0', '2017-02-15 21:56:33', '2017-02-15 21:56:33');
INSERT INTO `category_secondary` VALUES ('870', 'h', '868', '望远镜', '1318-1462-1480', '1', '1', '0', '2017-02-15 21:56:46', '2017-02-15 21:56:46');
INSERT INTO `category_secondary` VALUES ('871', 'h', '868', '野餐烧烤', '1318-1462-1477', '1', '1', '0', '2017-02-15 21:56:46', '2017-02-15 21:56:46');
INSERT INTO `category_secondary` VALUES ('872', 'h', '868', '便携桌椅床', '1318-1462-1478', '1', '1', '0', '2017-02-15 21:56:46', '2017-02-15 21:56:46');
INSERT INTO `category_secondary` VALUES ('873', 'h', '868', '背包', '1318-1462-1472', '1', '1', '0', '2017-02-15 21:56:46', '2017-02-15 21:56:46');
INSERT INTO `category_secondary` VALUES ('874', 'h', '868', '户外配饰', '1318-1462-2629', '1', '1', '0', '2017-02-15 21:56:46', '2017-02-15 21:56:46');
INSERT INTO `category_secondary` VALUES ('875', 'h', '868', '军迷用品', '1318-1462-5152', '1', '1', '0', '2017-02-15 21:56:46', '2017-02-15 21:56:46');
INSERT INTO `category_secondary` VALUES ('876', 'h', '868', '睡袋/吊床', '1318-1462-1474', '1', '1', '0', '2017-02-15 21:56:46', '2017-02-15 21:56:46');
INSERT INTO `category_secondary` VALUES ('877', 'h', '868', '救援装备', '1318-1462-12143', '1', '1', '0', '2017-02-15 21:56:46', '2017-02-15 21:56:46');
INSERT INTO `category_secondary` VALUES ('878', 'h', '868', '户外照明', '1318-1462-1476', '1', '1', '0', '2017-02-15 21:56:46', '2017-02-15 21:56:46');
INSERT INTO `category_secondary` VALUES ('879', 'h', '868', '旅游用品', '1318-1462-2691', '1', '1', '0', '2017-02-15 21:56:46', '2017-02-15 21:56:46');
INSERT INTO `category_secondary` VALUES ('88', 'a', '1', '家庭影音', 'coll.jd.com/list.html?sub=4932', '1', '1', '1', '2017-02-15 21:56:33', '2017-02-15 21:56:33');
INSERT INTO `category_secondary` VALUES ('880', 'h', '868', '户外工具', '1318-1462-1479', '1', '1', '0', '2017-02-15 21:56:46', '2017-02-15 21:56:46');
INSERT INTO `category_secondary` VALUES ('881', 'h', '868', '户外仪表', '1318-1462-2631', '1', '1', '0', '2017-02-15 21:56:46', '2017-02-15 21:56:46');
INSERT INTO `category_secondary` VALUES ('882', 'h', '868', '登山攀岩', '1318-1462-1475', '1', '1', '0', '2017-02-15 21:56:46', '2017-02-15 21:56:46');
INSERT INTO `category_secondary` VALUES ('883', 'h', '868', '极限户外', '1318-1462-12145', '1', '1', '0', '2017-02-15 21:56:46', '2017-02-15 21:56:46');
INSERT INTO `category_secondary` VALUES ('884', 'h', '868', '冲浪潜水', '1318-1462-12146', '1', '1', '0', '2017-02-15 21:56:46', '2017-02-15 21:56:46');
INSERT INTO `category_secondary` VALUES ('885', 'h', '868', '滑雪装备', '1318-1462-12144', '1', '1', '0', '2017-02-15 21:56:46', '2017-02-15 21:56:46');
INSERT INTO `category_secondary` VALUES ('886', 'h', '789', '垂钓用品', '1318-12147', '1', '1', '1', '2017-02-15 21:56:46', '2017-02-15 21:56:46');
INSERT INTO `category_secondary` VALUES ('887', 'h', '886', '鱼竿鱼线', '1318-12147-12148', '1', '1', '0', '2017-02-15 21:56:46', '2017-02-15 21:56:46');
INSERT INTO `category_secondary` VALUES ('888', 'h', '886', '浮漂鱼饵', '1318-12147-12149', '1', '1', '0', '2017-02-15 21:56:46', '2017-02-15 21:56:46');
INSERT INTO `category_secondary` VALUES ('889', 'h', '886', '钓鱼桌椅', '1318-12147-12150', '1', '1', '0', '2017-02-15 21:56:46', '2017-02-15 21:56:46');
INSERT INTO `category_secondary` VALUES ('89', 'a', '88', '家庭影院', '737-794-823', '1', '1', '0', '2017-02-15 21:56:33', '2017-02-15 21:56:33');
INSERT INTO `category_secondary` VALUES ('890', 'h', '886', '钓鱼配件', '1318-12147-12151', '1', '1', '0', '2017-02-15 21:56:46', '2017-02-15 21:56:46');
INSERT INTO `category_secondary` VALUES ('891', 'h', '886', '钓箱鱼包', '1318-12147-12152', '1', '1', '0', '2017-02-15 21:56:46', '2017-02-15 21:56:46');
INSERT INTO `category_secondary` VALUES ('892', 'h', '886', '其它', '1318-12147-12153', '1', '1', '0', '2017-02-15 21:56:46', '2017-02-15 21:56:46');
INSERT INTO `category_secondary` VALUES ('893', 'h', '789', '游泳用品', '1318-12154', '1', '1', '1', '2017-02-15 21:56:46', '2017-02-15 21:56:46');
INSERT INTO `category_secondary` VALUES ('894', 'h', '893', '泳镜', '1318-12154-12155', '1', '1', '0', '2017-02-15 21:56:46', '2017-02-15 21:56:46');
INSERT INTO `category_secondary` VALUES ('895', 'h', '893', '男士泳衣', '1318-12154-12159', '1', '1', '0', '2017-02-15 21:56:46', '2017-02-15 21:56:46');
INSERT INTO `category_secondary` VALUES ('896', 'h', '893', '女士泳衣', '1318-12154-12158', '1', '1', '0', '2017-02-15 21:56:46', '2017-02-15 21:56:46');
INSERT INTO `category_secondary` VALUES ('897', 'h', '893', '比基尼', '1318-12154-12160', '1', '1', '0', '2017-02-15 21:56:46', '2017-02-15 21:56:46');
INSERT INTO `category_secondary` VALUES ('898', 'h', '893', '泳帽', '1318-12154-12156', '1', '1', '0', '2017-02-15 21:56:46', '2017-02-15 21:56:46');
INSERT INTO `category_secondary` VALUES ('899', 'h', '893', '游泳包防水包', '1318-12154-12157', '1', '1', '0', '2017-02-15 21:56:46', '2017-02-15 21:56:46');
INSERT INTO `category_secondary` VALUES ('9', 'a', '6', '中央空调', '737-794-13701', '1', '1', '0', '2017-02-15 21:56:33', '2017-02-15 21:56:33');
INSERT INTO `category_secondary` VALUES ('90', 'a', '88', '迷你音响', '737-794-1199', '1', '1', '0', '2017-02-15 21:56:33', '2017-02-15 21:56:33');
INSERT INTO `category_secondary` VALUES ('900', 'h', '893', '其它', '1318-12154-12161', '1', '1', '0', '2017-02-15 21:56:46', '2017-02-15 21:56:46');
INSERT INTO `category_secondary` VALUES ('901', 'h', '789', '钟表', 'channel.jd.com/watch.html', '1', '1', '1', '2017-02-15 21:56:46', '2017-02-15 21:56:46');
INSERT INTO `category_secondary` VALUES ('902', 'h', '901', '瑞表', '5025-5026-13673', '1', '1', '0', '2017-02-15 21:56:46', '2017-02-15 21:56:46');
INSERT INTO `category_secondary` VALUES ('903', 'h', '901', '国表', '5025-5026-13674', '1', '1', '0', '2017-02-15 21:56:46', '2017-02-15 21:56:46');
INSERT INTO `category_secondary` VALUES ('904', 'h', '901', '日韩表', '5025-5026-13669', '1', '1', '0', '2017-02-15 21:56:46', '2017-02-15 21:56:46');
INSERT INTO `category_secondary` VALUES ('905', 'h', '901', '欧美表', '5025-5026-13668', '1', '1', '0', '2017-02-15 21:56:46', '2017-02-15 21:56:46');
INSERT INTO `category_secondary` VALUES ('906', 'h', '901', '德表', '5025-5026-13672', '1', '1', '0', '2017-02-15 21:56:46', '2017-02-15 21:56:46');
INSERT INTO `category_secondary` VALUES ('907', 'h', '901', '儿童手表', 'coll.jd.com/list.html?sub=4683', '1', '1', '0', '2017-02-15 21:56:46', '2017-02-15 21:56:46');
INSERT INTO `category_secondary` VALUES ('908', 'h', '901', '智能手表', '652-12345-12348', '1', '1', '0', '2017-02-15 21:56:46', '2017-02-15 21:56:46');
INSERT INTO `category_secondary` VALUES ('909', 'h', '901', '闹钟', '5025-5026-13670', '1', '1', '0', '2017-02-15 21:56:46', '2017-02-15 21:56:46');
INSERT INTO `category_secondary` VALUES ('91', 'a', '88', 'DVD', '737-794-965', '1', '1', '0', '2017-02-15 21:56:33', '2017-02-15 21:56:33');
INSERT INTO `category_secondary` VALUES ('910', 'h', '901', '座钟挂钟', '5025-5026-12094', '1', '1', '0', '2017-02-15 21:56:46', '2017-02-15 21:56:46');
INSERT INTO `category_secondary` VALUES ('911', 'h', '901', '钟表配件', '5025-5026-13671', '1', '1', '0', '2017-02-15 21:56:46', '2017-02-15 21:56:46');
INSERT INTO `category_secondary` VALUES ('912', 'h', '0', '户外', 'channel.jd.com/outdoor.html', '1', '1', '0', '2017-02-15 21:56:46', '2017-02-15 21:56:46');
INSERT INTO `category_secondary` VALUES ('913', 'h', '0', '钟表', 'channel.jd.com/watch.html', '1', '1', '0', '2017-02-15 21:56:46', '2017-02-15 21:56:46');
INSERT INTO `category_secondary` VALUES ('914', 'h', '-1', '赛事', 'saishi.jd.com', '1', '1', '1', '2017-02-15 21:56:46', '2017-02-15 21:56:46');
INSERT INTO `category_secondary` VALUES ('915', 'h', '-1', '运动城', 'channel.jd.com/yundong.html', '1', '1', '1', '2017-02-15 21:56:46', '2017-02-15 21:56:46');
INSERT INTO `category_secondary` VALUES ('916', 'h', '-1', '户外馆', 'channel.jd.com/outdoor.html', '1', '1', '1', '2017-02-15 21:56:46', '2017-02-15 21:56:46');
INSERT INTO `category_secondary` VALUES ('917', 'h', '-1', '健身房', 'channel.jd.com/1318-1463.html', '1', '1', '1', '2017-02-15 21:56:46', '2017-02-15 21:56:46');
INSERT INTO `category_secondary` VALUES ('918', 'h', '-1', '骑行馆', 'channel.jd.com/1318-12115.html', '1', '1', '1', '2017-02-15 21:56:46', '2017-02-15 21:56:46');
INSERT INTO `category_secondary` VALUES ('919', 'h', '-1', '钟表城', 'channel.jd.com/watch.html', '1', '1', '1', '2017-02-15 21:56:46', '2017-02-15 21:56:46');
INSERT INTO `category_secondary` VALUES ('92', 'a', '88', '电视影音配件', 'list.jd.com/list.html?cat=737,794,877&ev=2664_88744&trans=1&JL=3_%E9%85%8D%E4%BB%B6%E7%B1%BB%E5%9E%8B_%E7%94%B5%E8%A7%86%E5%BD%B1%E9%9F%B3%E9%85%8D%E4%BB%B6#J_crumbsBar', '1', '1', '0', '2017-02-15 21:56:33', '2017-02-15 21:56:33');
INSERT INTO `category_secondary` VALUES ('920', 'i', '0', '汽车', 'car.jd.com/', '1', '1', '1', '2017-02-15 21:56:48', '2017-02-15 21:56:48');
INSERT INTO `category_secondary` VALUES ('921', 'i', '920', '汽车车型', 'car.jd.com/hmc/select/', '1', '1', '1', '2017-02-15 21:56:48', '2017-02-15 21:56:48');
INSERT INTO `category_secondary` VALUES ('922', 'i', '921', '微型车', 'car.jd.com/hmc/select/321', '1', '1', '0', '2017-02-15 21:56:48', '2017-02-15 21:56:48');
INSERT INTO `category_secondary` VALUES ('923', 'i', '921', '小型车', 'car.jd.com/hmc/select/338', '1', '1', '0', '2017-02-15 21:56:48', '2017-02-15 21:56:48');
INSERT INTO `category_secondary` VALUES ('924', 'i', '921', '紧凑型车', 'car.jd.com/hmc/select/339', '1', '1', '0', '2017-02-15 21:56:48', '2017-02-15 21:56:48');
INSERT INTO `category_secondary` VALUES ('925', 'i', '921', '中型车', 'car.jd.com/hmc/select/340', '1', '1', '0', '2017-02-15 21:56:48', '2017-02-15 21:56:48');
INSERT INTO `category_secondary` VALUES ('926', 'i', '921', '中大型车', 'car.jd.com/hmc/select/341', '1', '1', '0', '2017-02-15 21:56:48', '2017-02-15 21:56:48');
INSERT INTO `category_secondary` VALUES ('927', 'i', '921', '豪华车', 'car.jd.com/hmc/select/342', '1', '1', '0', '2017-02-15 21:56:48', '2017-02-15 21:56:48');
INSERT INTO `category_secondary` VALUES ('928', 'i', '921', 'MPV', 'car.jd.com/hmc/select/425', '1', '1', '0', '2017-02-15 21:56:48', '2017-02-15 21:56:48');
INSERT INTO `category_secondary` VALUES ('929', 'i', '921', 'SUV', 'car.jd.com/hmc/select/424', '1', '1', '0', '2017-02-15 21:56:48', '2017-02-15 21:56:48');
INSERT INTO `category_secondary` VALUES ('93', 'a', '1', '进口电器', 'jiadian.jd.com', '1', '1', '1', '2017-02-15 21:56:33', '2017-02-15 21:56:33');
INSERT INTO `category_secondary` VALUES ('930', 'i', '921', '跑车', 'car.jd.com/hmc/select/426', '1', '1', '0', '2017-02-15 21:56:48', '2017-02-15 21:56:48');
INSERT INTO `category_secondary` VALUES ('931', 'i', '920', '汽车价格', 'car.jd.com/hmc/select/', '1', '1', '1', '2017-02-15 21:56:48', '2017-02-15 21:56:48');
INSERT INTO `category_secondary` VALUES ('932', 'i', '931', '5万以下', 'car.jd.com/hmc/select/0-5', '1', '1', '0', '2017-02-15 21:56:48', '2017-02-15 21:56:48');
INSERT INTO `category_secondary` VALUES ('933', 'i', '931', '5-8万', 'car.jd.com/hmc/select/5-8', '1', '1', '0', '2017-02-15 21:56:48', '2017-02-15 21:56:48');
INSERT INTO `category_secondary` VALUES ('934', 'i', '931', '8-10万', 'car.jd.com/hmc/select/8-10', '1', '1', '0', '2017-02-15 21:56:48', '2017-02-15 21:56:48');
INSERT INTO `category_secondary` VALUES ('935', 'i', '931', '10-15万', 'car.jd.com/hmc/select/10-15', '1', '1', '0', '2017-02-15 21:56:48', '2017-02-15 21:56:48');
INSERT INTO `category_secondary` VALUES ('936', 'i', '931', '15-25万', 'car.jd.com/hmc/select/15-25', '1', '1', '0', '2017-02-15 21:56:48', '2017-02-15 21:56:48');
INSERT INTO `category_secondary` VALUES ('937', 'i', '931', '25-40万', 'car.jd.com/hmc/select/25-40', '1', '1', '0', '2017-02-15 21:56:48', '2017-02-15 21:56:48');
INSERT INTO `category_secondary` VALUES ('938', 'i', '931', '40万以上', 'car.jd.com/hmc/select/40-_', '1', '1', '0', '2017-02-15 21:56:48', '2017-02-15 21:56:48');
INSERT INTO `category_secondary` VALUES ('939', 'i', '920', '汽车品牌', 'car.jd.com/channel/', '1', '1', '1', '2017-02-15 21:56:48', '2017-02-15 21:56:48');
INSERT INTO `category_secondary` VALUES ('94', 'a', '93', '进口电器', 'coll.jd.com/list.html?sub=5061', '1', '1', '0', '2017-02-15 21:56:33', '2017-02-15 21:56:33');
INSERT INTO `category_secondary` VALUES ('940', 'i', '939', '宝马', 'mall.jd.com/index-201417.html', '1', '1', '0', '2017-02-15 21:56:48', '2017-02-15 21:56:48');
INSERT INTO `category_secondary` VALUES ('941', 'i', '939', '上汽大众', 'mall.jd.com/index-160109.html', '1', '1', '0', '2017-02-15 21:56:48', '2017-02-15 21:56:48');
INSERT INTO `category_secondary` VALUES ('942', 'i', '939', '陆风', 'mall.jd.com/index-144691.html', '1', '1', '0', '2017-02-15 21:56:48', '2017-02-15 21:56:48');
INSERT INTO `category_secondary` VALUES ('943', 'i', '939', '一汽奔腾', 'mall.jd.com/index-143184.html', '1', '1', '0', '2017-02-15 21:56:48', '2017-02-15 21:56:48');
INSERT INTO `category_secondary` VALUES ('944', 'i', '939', '东风标致', 'mall.jd.com/index-127277.html', '1', '1', '0', '2017-02-15 21:56:48', '2017-02-15 21:56:48');
INSERT INTO `category_secondary` VALUES ('945', 'i', '939', '比亚迪', 'mall.jd.com/index-214303.html', '1', '1', '0', '2017-02-15 21:56:48', '2017-02-15 21:56:48');
INSERT INTO `category_secondary` VALUES ('946', 'i', '939', '华晨汽车', 'mall.jd.com/index-180979.html', '1', '1', '0', '2017-02-15 21:56:48', '2017-02-15 21:56:48');
INSERT INTO `category_secondary` VALUES ('947', 'i', '920', '维修保养', '6728-6742', '1', '1', '1', '2017-02-15 21:56:48', '2017-02-15 21:56:48');
INSERT INTO `category_secondary` VALUES ('948', 'i', '947', '机油', '6728-6742-11849', '1', '1', '0', '2017-02-15 21:56:48', '2017-02-15 21:56:48');
INSERT INTO `category_secondary` VALUES ('949', 'i', '947', '轮胎', '6728-6742-9248', '1', '1', '0', '2017-02-15 21:56:48', '2017-02-15 21:56:48');
INSERT INTO `category_secondary` VALUES ('95', 'a', '-1', '家电城', 'jiadian.jd.com/', '1', '1', '1', '2017-02-15 21:56:33', '2017-02-15 21:56:33');
INSERT INTO `category_secondary` VALUES ('950', 'i', '947', '添加剂', '6728-6742-11850', '1', '1', '0', '2017-02-15 21:56:48', '2017-02-15 21:56:48');
INSERT INTO `category_secondary` VALUES ('951', 'i', '947', '防冻液', '6728-6742-6756', '1', '1', '0', '2017-02-15 21:56:48', '2017-02-15 21:56:48');
INSERT INTO `category_secondary` VALUES ('952', 'i', '947', '滤清器', '6728-6742-11852', '1', '1', '0', '2017-02-15 21:56:48', '2017-02-15 21:56:48');
INSERT INTO `category_secondary` VALUES ('953', 'i', '947', '火花塞', '6728-6742-6767', '1', '1', '0', '2017-02-15 21:56:48', '2017-02-15 21:56:48');
INSERT INTO `category_secondary` VALUES ('954', 'i', '947', '雨刷', '6728-6742-6766', '1', '1', '0', '2017-02-15 21:56:48', '2017-02-15 21:56:48');
INSERT INTO `category_secondary` VALUES ('955', 'i', '947', '车灯', '6728-6742-6768', '1', '1', '0', '2017-02-15 21:56:48', '2017-02-15 21:56:48');
INSERT INTO `category_secondary` VALUES ('956', 'i', '947', '减震器', '6728-6742-13243', '1', '1', '0', '2017-02-15 21:56:48', '2017-02-15 21:56:48');
INSERT INTO `category_secondary` VALUES ('957', 'i', '947', '轮毂', '6728-6742-11951', '1', '1', '0', '2017-02-15 21:56:48', '2017-02-15 21:56:48');
INSERT INTO `category_secondary` VALUES ('958', 'i', '947', '刹车片/盘', '6728-6742-11859', '1', '1', '0', '2017-02-15 21:56:48', '2017-02-15 21:56:48');
INSERT INTO `category_secondary` VALUES ('959', 'i', '947', '维修配件', '6728-6742-6769', '1', '1', '0', '2017-02-15 21:56:48', '2017-02-15 21:56:48');
INSERT INTO `category_secondary` VALUES ('96', 'a', '-1', '品牌日', '//sale.jd.com/act/QGKqdHvopWietx.html', '1', '1', '1', '2017-02-15 21:56:33', '2017-02-15 21:56:33');
INSERT INTO `category_secondary` VALUES ('960', 'i', '947', '蓄电池', '6728-6742-9971', '1', '1', '0', '2017-02-15 21:56:48', '2017-02-15 21:56:48');
INSERT INTO `category_secondary` VALUES ('961', 'i', '947', '底盘装甲/护板', '6728-6742-9964', '1', '1', '0', '2017-02-15 21:56:48', '2017-02-15 21:56:48');
INSERT INTO `category_secondary` VALUES ('962', 'i', '947', '贴膜', '6728-6742-6770', '1', '1', '0', '2017-02-15 21:56:48', '2017-02-15 21:56:48');
INSERT INTO `category_secondary` VALUES ('963', 'i', '947', '汽修工具', '6728-6742-6795', '1', '1', '0', '2017-02-15 21:56:48', '2017-02-15 21:56:48');
INSERT INTO `category_secondary` VALUES ('964', 'i', '947', '改装配件', '6728-6742-12406', '1', '1', '0', '2017-02-15 21:56:48', '2017-02-15 21:56:48');
INSERT INTO `category_secondary` VALUES ('965', 'i', '947', '正时皮带', '6728-6742-13244', '1', '1', '0', '2017-02-15 21:56:48', '2017-02-15 21:56:48');
INSERT INTO `category_secondary` VALUES ('966', 'i', '947', '汽车喇叭', '6728-6742-13245', '1', '1', '0', '2017-02-15 21:56:48', '2017-02-15 21:56:48');
INSERT INTO `category_secondary` VALUES ('967', 'i', '947', '汽车玻璃', '6728-13256-13246', '1', '1', '0', '2017-02-15 21:56:48', '2017-02-15 21:56:48');
INSERT INTO `category_secondary` VALUES ('968', 'i', '920', '车载电器', '6728-6740', '1', '1', '1', '2017-02-15 21:56:48', '2017-02-15 21:56:48');
INSERT INTO `category_secondary` VALUES ('969', 'i', '968', '行车记录仪', '6728-6740-6964', '1', '1', '0', '2017-02-15 21:56:48', '2017-02-15 21:56:48');
INSERT INTO `category_secondary` VALUES ('97', 'a', '-1', '智能生活馆', '//smarthome.jd.com/', '1', '1', '1', '2017-02-15 21:56:33', '2017-02-15 21:56:33');
INSERT INTO `category_secondary` VALUES ('970', 'i', '968', '导航仪', '6728-6740-11867', '1', '1', '0', '2017-02-15 21:56:48', '2017-02-15 21:56:48');
INSERT INTO `category_secondary` VALUES ('971', 'i', '968', '电源', '6728-6740-6749', '1', '1', '0', '2017-02-15 21:56:48', '2017-02-15 21:56:48');
INSERT INTO `category_secondary` VALUES ('972', 'i', '968', '电器配件', '6728-6740-13247', '1', '1', '0', '2017-02-15 21:56:48', '2017-02-15 21:56:48');
INSERT INTO `category_secondary` VALUES ('973', 'i', '968', '净化器', '6728-6740-6807', '1', '1', '0', '2017-02-15 21:56:48', '2017-02-15 21:56:48');
INSERT INTO `category_secondary` VALUES ('974', 'i', '968', '车载影音', '6728-6740-6965', '1', '1', '0', '2017-02-15 21:56:48', '2017-02-15 21:56:48');
INSERT INTO `category_secondary` VALUES ('975', 'i', '968', '冰箱', '6728-6740-6753', '1', '1', '0', '2017-02-15 21:56:48', '2017-02-15 21:56:48');
INSERT INTO `category_secondary` VALUES ('976', 'i', '968', '安全预警仪', '6728-6740-9959', '1', '1', '0', '2017-02-15 21:56:48', '2017-02-15 21:56:48');
INSERT INTO `category_secondary` VALUES ('977', 'i', '968', '倒车雷达', '6728-6740-9961', '1', '1', '0', '2017-02-15 21:56:48', '2017-02-15 21:56:48');
INSERT INTO `category_secondary` VALUES ('978', 'i', '968', '蓝牙设备', '6728-6740-9962', '1', '1', '0', '2017-02-15 21:56:48', '2017-02-15 21:56:48');
INSERT INTO `category_secondary` VALUES ('979', 'i', '968', '智能驾驶', '6728-6740-12408', '1', '1', '0', '2017-02-15 21:56:48', '2017-02-15 21:56:48');
INSERT INTO `category_secondary` VALUES ('98', 'a', '-1', '京东净化馆', '//sale.jd.com/act/rSRFscLklGhxXW2H.html', '1', '1', '1', '2017-02-15 21:56:33', '2017-02-15 21:56:33');
INSERT INTO `category_secondary` VALUES ('980', 'i', '968', '车载电台', '6728-6740-12409', '1', '1', '0', '2017-02-15 21:56:48', '2017-02-15 21:56:48');
INSERT INTO `category_secondary` VALUES ('981', 'i', '968', '吸尘器', '6728-6740-6752', '1', '1', '0', '2017-02-15 21:56:48', '2017-02-15 21:56:48');
INSERT INTO `category_secondary` VALUES ('982', 'i', '968', '智能车机', '6728-6740-13248', '1', '1', '0', '2017-02-15 21:56:48', '2017-02-15 21:56:48');
INSERT INTO `category_secondary` VALUES ('983', 'i', '968', '汽车音响', '6728-6740-13249', '1', '1', '0', '2017-02-15 21:56:48', '2017-02-15 21:56:48');
INSERT INTO `category_secondary` VALUES ('984', 'i', '968', '车载生活电器', '6728-6740-13250', '1', '1', '0', '2017-02-15 21:56:48', '2017-02-15 21:56:48');
INSERT INTO `category_secondary` VALUES ('985', 'i', '920', '美容清洗', '6728-6743', '1', '1', '1', '2017-02-15 21:56:48', '2017-02-15 21:56:48');
INSERT INTO `category_secondary` VALUES ('986', 'i', '985', '车蜡', '6728-6743-11875', '1', '1', '0', '2017-02-15 21:56:48', '2017-02-15 21:56:48');
INSERT INTO `category_secondary` VALUES ('987', 'i', '985', '镀晶镀膜', '6728-6743-13251', '1', '1', '0', '2017-02-15 21:56:48', '2017-02-15 21:56:48');
INSERT INTO `category_secondary` VALUES ('988', 'i', '985', '补漆笔', '6728-6743-9974', '1', '1', '0', '2017-02-15 21:56:48', '2017-02-15 21:56:48');
INSERT INTO `category_secondary` VALUES ('989', 'i', '985', '玻璃水', '6728-6743-6757', '1', '1', '0', '2017-02-15 21:56:48', '2017-02-15 21:56:48');
INSERT INTO `category_secondary` VALUES ('99', 'a', '-1', '京东帮服务店', '//sale.jd.com/act/eRszkp8fyiS3Yt.html', '1', '1', '1', '2017-02-15 21:56:33', '2017-02-15 21:56:33');
INSERT INTO `category_secondary` VALUES ('990', 'i', '985', '清洁剂', '6728-6743-11878', '1', '1', '0', '2017-02-15 21:56:48', '2017-02-15 21:56:48');
INSERT INTO `category_secondary` VALUES ('991', 'i', '985', '洗车机', '6728-6743-13252', '1', '1', '0', '2017-02-15 21:56:48', '2017-02-15 21:56:48');
INSERT INTO `category_secondary` VALUES ('992', 'i', '985', '洗车水枪', '6728-6743-13253', '1', '1', '0', '2017-02-15 21:56:48', '2017-02-15 21:56:48');
INSERT INTO `category_secondary` VALUES ('993', 'i', '985', '洗车配件', '6728-6743-11880', '1', '1', '0', '2017-02-15 21:56:48', '2017-02-15 21:56:48');
INSERT INTO `category_secondary` VALUES ('994', 'i', '985', '毛巾掸子', '6728-6743-13254', '1', '1', '0', '2017-02-15 21:56:48', '2017-02-15 21:56:48');
INSERT INTO `category_secondary` VALUES ('995', 'i', '920', '汽车装饰', '6728-6745', '1', '1', '1', '2017-02-15 21:56:48', '2017-02-15 21:56:48');
INSERT INTO `category_secondary` VALUES ('996', 'i', '995', '脚垫', '6728-6745-11883', '1', '1', '0', '2017-02-15 21:56:48', '2017-02-15 21:56:48');
INSERT INTO `category_secondary` VALUES ('997', 'i', '995', '座垫', '6728-6745-11881', '1', '1', '0', '2017-02-15 21:56:48', '2017-02-15 21:56:48');
INSERT INTO `category_secondary` VALUES ('998', 'i', '995', '座套', '6728-6745-11882', '1', '1', '0', '2017-02-15 21:56:48', '2017-02-15 21:56:48');
INSERT INTO `category_secondary` VALUES ('999', 'i', '995', '后备箱垫', '6728-6745-6972', '1', '1', '0', '2017-02-15 21:56:48', '2017-02-15 21:56:48');

-- ----------------------------
-- Table structure for content
-- ----------------------------
DROP TABLE IF EXISTS `content`;
CREATE TABLE `content` (
  `id` varchar(32) NOT NULL,
  `category_id` varchar(32) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `sub_title` varchar(255) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `pic` varchar(255) DEFAULT NULL,
  `pic2` varchar(255) DEFAULT NULL,
  `content` varchar(3000) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `update_time` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of content
-- ----------------------------

-- ----------------------------
-- Table structure for hot_words
-- ----------------------------
DROP TABLE IF EXISTS `hot_words`;
CREATE TABLE `hot_words` (
  `id` varchar(32) NOT NULL,
  `category` varchar(32) DEFAULT NULL COMMENT '热门词分类 1-加红 2-搜索框显示 null-正常',
  `name` varchar(200) DEFAULT NULL COMMENT '热门词',
  `url` varchar(100) DEFAULT NULL COMMENT '跳转网页',
  `search` tinyint(4) NOT NULL DEFAULT '1' COMMENT '热门词状态，1-搜索，2-指定网页',
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `update_time` (`update_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of hot_words
-- ----------------------------
INSERT INTO `hot_words` VALUES ('1', '1', '2件5折', 'https://sale.jd.com/act/ckZVrEFYRyUtneS5.html?spm=1.1.0', '2', '2017-02-15 13:48:31', '2017-02-15 13:48:33');
INSERT INTO `hot_words` VALUES ('10', '2', '礼遇情人节', '//sale.jd.com/act/PXbAxE4wr7.html?spm=1.1.9', '2', '2017-02-15 13:52:13', '2017-02-15 13:52:15');
INSERT INTO `hot_words` VALUES ('11', '2', '平板电脑', 'www.jd.com?spm=1.1.10', '2', '2017-02-15 13:53:00', '2017-02-15 13:53:01');
INSERT INTO `hot_words` VALUES ('12', '2', '路由器', 'www.jd.com?spm=1.1.10', '2', '2017-02-15 13:54:38', '2017-02-15 13:54:37');
INSERT INTO `hot_words` VALUES ('13', '2', '耳机', 'www.jd.com?spm=1.1.10', '2', '2017-02-15 13:54:35', '2017-02-15 13:54:36');
INSERT INTO `hot_words` VALUES ('14', '2', '单反相机', 'www.jd.com?spm=1.1.10', '2', '2017-02-15 13:54:40', '2017-02-15 13:54:40');
INSERT INTO `hot_words` VALUES ('15', '2', '智能手环', 'www.jd.com?spm=1.1.10', '2', '2017-02-15 13:54:44', '2017-02-15 13:54:42');
INSERT INTO `hot_words` VALUES ('16', '2', '智能家居', 'www.jd.com?spm=1.1.10', '2', '2017-02-15 13:54:46', '2017-02-15 13:54:57');
INSERT INTO `hot_words` VALUES ('17', '2', '微单', 'www.jd.com?spm=1.1.10', '2', '2017-02-15 13:54:48', '2017-02-15 13:54:55');
INSERT INTO `hot_words` VALUES ('18', '2', '鲜花', 'www.jd.com?spm=1.1.10', '2', '2017-02-15 13:54:49', '2017-02-15 13:54:54');
INSERT INTO `hot_words` VALUES ('19', '2', '连衣裙', 'www.jd.com?spm=1.1.10', '2', '2017-02-15 13:54:51', '2017-02-15 13:54:51');
INSERT INTO `hot_words` VALUES ('2', null, '手机专卖', 'sale.jd.com/act/RAFzjtCQdos.html?spm=1.1.1', '2', '2017-02-15 13:49:20', '2017-02-15 13:49:21');
INSERT INTO `hot_words` VALUES ('3', null, '单身狗粮', 'https://sale.jd.com/act/8VEI7OTgX4HUaqt.html?spm=1.1.2', '2', '2017-02-15 13:49:42', '2017-02-15 13:49:44');
INSERT INTO `hot_words` VALUES ('4', null, '鲜花99元', '//sale.jd.com/act/cU0mdPTFOZ8l.html?spm=1.1.3', '2', '2017-02-15 13:50:10', '2017-02-15 13:50:11');
INSERT INTO `hot_words` VALUES ('5', null, '买一赠五', '//sale.jd.com/act/AIgrxFvoGhumOlt.html?spm=1.1.4', '2', '2017-02-15 13:50:31', '2017-02-15 13:50:33');
INSERT INTO `hot_words` VALUES ('6', null, '蓝牙键盘', null, '1', '2017-02-15 13:50:43', '2017-02-15 13:50:44');
INSERT INTO `hot_words` VALUES ('7', null, '除湿机', null, '1', '2017-02-15 13:51:02', '2017-02-15 13:51:03');
INSERT INTO `hot_words` VALUES ('8', null, '巧克力', 'https://sale.jd.com/act/ZnDo10XW3q.html?spm=1.1.7', '2', '2017-02-15 13:51:22', '2017-02-15 13:51:23');
INSERT INTO `hot_words` VALUES ('9', null, '韩都衣舍', null, '1', '2017-02-15 13:51:33', '2017-02-15 13:51:35');

-- ----------------------------
-- Table structure for index_slide_ad
-- ----------------------------
DROP TABLE IF EXISTS `index_slide_ad`;
CREATE TABLE `index_slide_ad` (
  `id` varchar(32) NOT NULL COMMENT 'ID',
  `alt` varchar(5) DEFAULT NULL COMMENT '提示',
  `clog` varchar(100) DEFAULT NULL COMMENT 'log号',
  `ext1` varchar(5) DEFAULT NULL COMMENT '无',
  `href` varchar(500) DEFAULT NULL COMMENT '网址',
  `logV` varchar(5) DEFAULT NULL COMMENT 'log等级',
  `src` varchar(200) DEFAULT NULL COMMENT '大图片',
  `srcB` varchar(200) DEFAULT NULL COMMENT '小图片',
  `status` int(1) DEFAULT '1' COMMENT '状态。可选值:1(正常),2(删除)',
  `sort_order` int(4) DEFAULT '1' COMMENT '排序',
  `logDomain` varchar(200) DEFAULT NULL COMMENT 'log记录网址前缀',
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='首页轮播广告';

-- ----------------------------
-- Records of index_slide_ad
-- ----------------------------
INSERT INTO `index_slide_ad` VALUES ('1', null, '17582.110981.353958.1.571_1792_8539', null, '//c-nfa.jd.com/adclick?keyStr=6PQwtwh0f06syGHwQVvROzh5ulIgMw7+jmnFGWIVTm44Gmviryu3zCBj1jUmRPsw+MxoJ6z6IkKLVUpQcEO39tEve2EQwiIV7yRAE/iGYRpmvv0njbc4UEZ9ZbbJfoMV4fLWlvRBkxoM4QrINBB7LdPAaEyBkf1VGLUKoy/qqOjiaUxF4gV+tYntLn3RUSsIPg/5lcwJ9ODRALR4zzW6KndBYMCVFxlbZRUKij7Z92358nvVR6ukal9j8UOUAB7XX2eOVm6BWJgL+STwEf7TGxhRUJO1SzbN9ghEGFXB7f90eAcCcxt4/aYpXclWi6Ay4kZYtET9oANOMTk0wDstKw==&cv=2.0&url=//sale.jd.com/act/iklG3xhS1LRcQqNJ.html', '1.0', 'group1/M00/00/00/wKh9hFihda2APp18AADMtl76XFQ883.jpg', 'group1/M00/00/00/wKh9hFihda2AR9tRAACv1SGwieE529.jpg', '1', '0', '//localhost:8106/log?info=', '2017-02-15 20:39:55', '2017-02-15 20:39:55');
INSERT INTO `index_slide_ad` VALUES ('10', null, '17440.110990.352897.1.571_1792_8541', null, '//c-nfa.jd.com/adclick?keyStr=6PQwtwh0f06syGHwQVvROzh5ulIgMw7+jmnFGWIVTm4ZWC0NjoFIWiTH/zN3o+/WIT01g/rW8RhuO2MiDeYSHedsyKwPnxzxPaHOMOsH92+M/gv72Sthrgx+Rpmsshy49VEKOHcOEXc2lnu6+dkNEAdylumdUO7NLmGc1YSiIceizxfmnaxQCzQ3DsxHIXQ7PcADfOydEgb3r/t/IOD6jebwKAFQoJNlTkPYqRWHa7QpodVXpEL15gIhF7tS9XGTIH/3PVpFk1yWjCKplUWsYiZkUIzjmhlPlHv4wTLvUHI6PS3e2iAxIftN/cIOoqdkLMz+Zwh2Sv2uEPtOqU+3QA==&cv=2.0&url=//sale.jd.com/act/cU0mdPTFOZ8l.html', '1.0', 'group1/M00/00/01/wKh9hFihda-ATDNaAACjI2aDgD0196.jpg', 'group1/M00/00/01/wKh9hFihda-AZHnmAACHWlVh0mg984.jpg', '1', '1', '//localhost:8106/log?info=', '2017-02-15 20:39:57', '2017-02-15 20:39:57');
INSERT INTO `index_slide_ad` VALUES ('11', null, '9749.110991.354676.1.571_1792_8541', null, '//c-nfa.jd.com/adclick?keyStr=6PQwtwh0f06syGHwQVvROzh5ulIgMw7+jmnFGWIVTm47vj5+CkXlwPF90YrTKWEyoV3JNCVGQmpBbMj305QoZ1ZIwStLnbJUpTWEEkh+STCUBHXgWvvcHQfkzuH/hhVHPZZgSFZMk58ZxUj0tzg1W6AxOy7flCIpzIstfmjE2XoFmxJwnpD0lc8TYe2JzvDPU0hghmAR+RikswyU2883JjvJAfrEs0ktHVlaasdvO4yzJ0EYy1/C3q7guQ0LtsMAylwZ/+F8n2QZKmQ769HUarGAIZsUZgaCEqVTRcmUVy+GvvPdpzqLP9GkkZ3+r2zJn/Ry3g4qURwCpuL3HzflNSihVOqlWJGBG60dfIhJICA=&cv=2.0&url=//sale.jd.com/act/En5eVSGc2sY.html?from=jdsj_01_4', '1.0', 'group1/M00/00/01/wKh9hFihda-AOXQIAAB2cx3htKQ131.jpg', 'group1/M00/00/01/wKh9hFihda-ASdwhAABqdFniHv4433.jpg', '1', '2', '//localhost:8106/log?info=', '2017-02-15 20:39:57', '2017-02-15 20:39:57');
INSERT INTO `index_slide_ad` VALUES ('12', null, '17427.110992.353562.1.571_1792_8541', null, '//c-nfa.jd.com/adclick?keyStr=6PQwtwh0f06syGHwQVvROzh5ulIgMw7+jmnFGWIVTm4ZWC0NjoFIWiTH/zN3o+/WiJrHxZmm04qPvYVovttjJ8FP2Q8lOeZB8K+pjaw+gYnoDPHqMr2aoLNpQKllcq2o4fLWlvRBkxoM4QrINBB7LVc0Ahle6pZYHtzQRuXHKtKmiXyDNnF2SMiUDj8j3hFjPcADfOydEgb3r/t/IOD6jebwKAFQoJNlTkPYqRWHa7QpodVXpEL15gIhF7tS9XGTIH/3PVpFk1yWjCKplUWsYiZkUIzjmhlPlHv4wTLvUHI6PS3e2iAxIftN/cIOoqdkLMz+Zwh2Sv2uEPtOqU+3QA==&cv=2.0&url=//sale.jd.com/act/m2UDe4KZwJA.html', '1.0', 'group1/M00/00/01/wKh9hFihda-ACgDtAACmtC5IGZI359.jpg', 'group1/M00/00/01/wKh9hFihda-AflswAAB_MfAS5ao867.jpg', '1', '3', '//localhost:8106/log?info=', '2017-02-15 20:39:57', '2017-02-15 20:39:57');
INSERT INTO `index_slide_ad` VALUES ('13', null, '17670.110993.353634.1.571_1792_8542', null, '//c-nfa.jd.com/adclick?keyStr=6PQwtwh0f06syGHwQVvROzh5ulIgMw7+jmnFGWIVTm7EeFi71zBrYwAhrV6xPLxlgWHEFITwf0p3om7PthjbXXJEX7KyaZ1Hs439PYBZQSz5T7a5pPLztwDErGmYRGvq4fLWlvRBkxoM4QrINBB7LcA6brOW7g52KZxRVa76UpTSw5YWvcFvSDatZtD+4aseu2BmbCvyoxxYim9CMtcJXz3AA3zsnRIG96/7fyDg+o3m8CgBUKCTZU5D2KkVh2u0KaHVV6RC9eYCIRe7UvVxkyB/9z1aRZNclowiqZVFrGImZFCM45oZT5R7+MEy71ByOj0t3togMSH7Tf3CDqKnZCzM/mcIdkr9rhD7TqlPt0A=&cv=2.0&url=//sale.jd.com/act/ZcgQ1d56mUAS.html?from=jdsc_sj_1', '1.0', 'group1/M00/00/01/wKh9hFihda-AFF3IAACjmiMk5QQ151.jpg', 'group1/M00/00/01/wKh9hFihda-AVK1CAACJQD8--tw787.jpg', '1', '0', '//localhost:8106/log?info=', '2017-02-15 20:39:57', '2017-02-15 20:39:57');
INSERT INTO `index_slide_ad` VALUES ('14', null, '17684.110994.354189.1.571_1792_8542', null, '//c-nfa.jd.com/adclick?keyStr=6PQwtwh0f06syGHwQVvROzh5ulIgMw7+jmnFGWIVTm7EeFi71zBrYwAhrV6xPLxliiGDFoUx9sNsYS/j/CL2EdWykOOSL3E+oMJEn2PD7T92KDq2Vg6tkip7IW0t2fxr4fLWlvRBkxoM4QrINBB7Lf9C3t3TxkpXl0RpASlbNy89MkBkCZ3OwGVlQwsCZYABqg7lBKMNaPUH7HUwVbi2CBd0Hr7Fi8hVunvZC4tPYiigwBDdtxSPU3z8cp50sfgiF1pAhcXBWv+zgtdSUzgYBEGXVSM3evs0GIN7W0oIHYZuynqN4iTv4/b1f66WBNE0YyuRuUC5Ueuy0w4BtYM9ig==&cv=2.0&url=//sale.jd.com/act/BRTSO1o3MFn7.html', '1.0', 'group1/M00/00/01/wKh9hFihda-ABUN0AACp49kGSd4883.jpg', 'group1/M00/00/01/wKh9hFihda-AdGdKAAB5t6ihLpU363.jpg', '1', '1', '//localhost:8106/log?info=', '2017-02-15 20:39:57', '2017-02-15 20:39:57');
INSERT INTO `index_slide_ad` VALUES ('15', null, '17712.110995.353502.1.571_1792_8542', null, '//c-nfa.jd.com/adclick?keyStr=6PQwtwh0f06syGHwQVvROzh5ulIgMw7+jmnFGWIVTm7EeFi71zBrYwAhrV6xPLxlxJTRlMxjABBCtD8YbN0axb2BhW+kLUuv+vJ23qpIS/WxFm5pB5XfANMj1RTXCyHV9VEKOHcOEXc2lnu6+dkNENNtUGNb6S87oGbbah5uEOK+g2z0tzj6yyV8RRTcpjexAkuOIdHLRtkW/q4CIdzM/gKe2acHG0Ajuj9L8JXxidE+hmSpgLz9xmR1xEiObDPEY2cXhMASnNvmSUyLnxgFsxMv49nQdfWafuMVCtVmz8qXOlcppL6VE6XAjxQTKJJ8WOo1bdnPYgppNB+nDWfC8A==&cv=2.0&url=//sale.jd.com/act/gZ0vFYnUNXj.html', '1.0', 'group1/M00/00/01/wKh9hFihda-ACWkjAACCVWadLDE175.jpg', 'group1/M00/00/01/wKh9hFihda-AaJSvAABdMD2er0E136.jpg', '1', '2', '//localhost:8106/log?info=', '2017-02-15 20:39:57', '2017-02-15 20:39:57');
INSERT INTO `index_slide_ad` VALUES ('16', null, '17732.110996.353901.1.571_1792_8542', null, '//c-nfa.jd.com/adclick?keyStr=6PQwtwh0f06syGHwQVvROzh5ulIgMw7+jmnFGWIVTm7EeFi71zBrYwAhrV6xPLxlNGOxnzdKZU6vh3V9yEnUch3cNhcbcS2VwbWptaWYhWZQwP5IRVRmajGhispXGsx84fLWlvRBkxoM4QrINBB7LV5cEPRbVAHD3rIJSkgUZE+9cDwRFCt2+idhH8y8tvREPg/5lcwJ9ODRALR4zzW6KndBYMCVFxlbZRUKij7Z92358nvVR6ukal9j8UOUAB7XX2eOVm6BWJgL+STwEf7TGxhRUJO1SzbN9ghEGFXB7f90eAcCcxt4/aYpXclWi6Ay4kZYtET9oANOMTk0wDstKw==&cv=2.0&url=//sale.jd.com/act/3TkU6etZ2icwSGz7.html', '1.0', 'group1/M00/00/01/wKh9hFihda-AS9CXAACyETI4XvI661.jpg', 'group1/M00/00/01/wKh9hFihda-AWYvfAACWXb6JrVo423.jpg', '1', '3', '//localhost:8106/log?info=', '2017-02-15 20:39:57', '2017-02-15 20:39:57');
INSERT INTO `index_slide_ad` VALUES ('17', null, '17519.110997.354123.1.571_1792_8543', null, '//c-nfa.jd.com/adclick?keyStr=6PQwtwh0f06syGHwQVvROzh5ulIgMw7+jmnFGWIVTm5negws9Nr657HKBfKMPWBCQ6eMwLTz+cqLRgJj0OCzarDI6kAFcvjBQ5HcvZKVTq3OSiyg1oBk3ivrvgpP5k7n9VEKOHcOEXc2lnu6+dkNECDF1RtD3wgiK1ho48YPqaJ43/RD4Cxc+fMIGAK8IAbOjnSIFtrxkX4xkYbQvHViCGKnFtB6rhrxWO1MpkcMG5SoRUSOdb56zrttLfl8vNBFcptr0poJNKZrfeMvuWRplv4bRbtDQshzWfMXyqdyQxyNrmP1wRDLNloYOL46zk6YpGgD9f7DD80JI2OBqrgiZA==&cv=2.0&url=//sale.jd.com/act/AIgrxFvoGhumOlt.html', '1.0', 'group1/M00/00/01/wKh9hFihda-AblapAACDO5V42RM674.jpg', 'group1/M00/00/01/wKh9hFihdbCAUsfFAABttpifnfk920.jpg', '1', '0', '//localhost:8106/log?info=', '2017-02-15 20:39:57', '2017-02-15 20:39:57');
INSERT INTO `index_slide_ad` VALUES ('18', null, '17440.110998.353801.1.571_1792_8543', null, '//c-nfa.jd.com/adclick?keyStr=6PQwtwh0f06syGHwQVvROzh5ulIgMw7+jmnFGWIVTm5negws9Nr657HKBfKMPWBCIT01g/rW8RhuO2MiDeYSHVzNCGuA8XOYj/zd5Mtg233p/kPR4QSHXjnRBZBTeN504fLWlvRBkxoM4QrINBB7LXACtExHOcjqw6HpNnvNbPmP6u/LfHherGHW+dJ12dl/jnSIFtrxkX4xkYbQvHViCGKnFtB6rhrxWO1MpkcMG5SoRUSOdb56zrttLfl8vNBFcptr0poJNKZrfeMvuWRplv4bRbtDQshzWfMXyqdyQxyNrmP1wRDLNloYOL46zk6YpGgD9f7DD80JI2OBqrgiZA==&cv=2.0&url=//sale.jd.com/act/DltBQ1rqfKaJMy.html', '1.0', 'group1/M00/00/01/wKh9hFihdbCAOAWYAACDHAntcTk725.jpg', 'group1/M00/00/01/wKh9hFihdbCACjsFAABuQAzwJN4720.jpg', '1', '1', '//localhost:8106/log?info=', '2017-02-15 20:39:58', '2017-02-15 20:39:58');
INSERT INTO `index_slide_ad` VALUES ('19', null, '0.110999.315659.1.571_1792_8543', null, '//c-nfa.jd.com/adclick?keyStr=6PQwtwh0f06syGHwQVvROzh5ulIgMw7+jmnFGWIVTm5gQgjTL7ilQDuCTKPhNDhbmq26gr70Q3LuDuE241+2uUc3BmFNSK8e3oqQZUYwgB1HWmoByPeXmwN+vPPmAue8nPRVaxDTMvb4FGTgPthaki9Piyvb7Md5kp+CGyDQStyFWlBsKk2m076zZIgo94+zQod+KYxCPcjDhX1RouGJvWWX8sgBMRRsCf+zfYrDghP7Yf0/1mWhQd/EwOPW33yN6Y76pEUjnWhXnKNVdZJvVXCZyfP4uMqYgQ3v+5kk/jcO2L9Q0Zc72tSD7laS1JfwqCGCSkwWB0UZE/clm1+XfA==&cv=2.0&url=//sale.jd.com/act/BvZwPWeJG40.html', '1.0', 'group1/M00/00/01/wKh9hFihdbCAUeMiAABsRmBRz0Y517.jpg', 'group1/M00/00/01/wKh9hFihdbCAROdOAABfKXqhrp0650.jpg', '1', '2', '//localhost:8106/log?info=', '2017-02-15 20:39:58', '2017-02-15 20:39:58');
INSERT INTO `index_slide_ad` VALUES ('2', null, '17584.110982.354168.1.571_1792_8539', null, '//c-nfa.jd.com/adclick?keyStr=6PQwtwh0f06syGHwQVvROzh5ulIgMw7+jmnFGWIVTm44Gmviryu3zCBj1jUmRPswXc6c9SO3ggznYcsNMsRI3pDU4OrWWKf82WPE7aQ/cv2U92pIDZMv6xzGLbBZGoDA4fLWlvRBkxoM4QrINBB7LT1bb6aNbCq3eqheAhqoJbXKjkqwzU1W8gnmYJSGwMgsjnSIFtrxkX4xkYbQvHViCGKnFtB6rhrxWO1MpkcMG5SoRUSOdb56zrttLfl8vNBFcptr0poJNKZrfeMvuWRplv4bRbtDQshzWfMXyqdyQxyNrmP1wRDLNloYOL46zk6YpGgD9f7DD80JI2OBqrgiZA==&cv=2.0&url=//sale.jd.com/act/70bS4xGUcq3AmV.html', '1.0', 'group1/M00/00/00/wKh9hFihda2AR770AAChKkKB7hQ661.jpg', 'group1/M00/00/00/wKh9hFihda2AXK9DAAB6g6jemGI545.jpg', '1', '1', '//localhost:8106/log?info=', '2017-02-15 20:39:55', '2017-02-15 20:39:55');
INSERT INTO `index_slide_ad` VALUES ('20', null, '17519.111000.354119.1.571_1792_8543', null, '//c-nfa.jd.com/adclick?keyStr=6PQwtwh0f06syGHwQVvROzh5ulIgMw7+jmnFGWIVTm5negws9Nr657HKBfKMPWBCp9g8zduGPWNrn/1Wn09o+vGSwZDiLAGGVgPl/URSavU1HFvP2hxcCorbit50pliD9VEKOHcOEXc2lnu6+dkNEN6ole0cGoffJv4NaLVFZ6+JUTQ2M0Xic/OxX3aouGEbqg7lBKMNaPUH7HUwVbi2CBd0Hr7Fi8hVunvZC4tPYiigwBDdtxSPU3z8cp50sfgiF1pAhcXBWv+zgtdSUzgYBEGXVSM3evs0GIN7W0oIHYZuynqN4iTv4/b1f66WBNE0YyuRuUC5Ueuy0w4BtYM9ig==&cv=2.0&url=//sale.jd.com/act/X3lhfZkCID0Hm.html', '1.0', 'group1/M00/00/01/wKh9hFihdbCADDdJAACWHv8AI6w453.jpg', 'group1/M00/00/01/wKh9hFihdbCAExR5AACIfcjLtoU787.jpg', '1', '3', '//localhost:8106/log?info=', '2017-02-15 20:39:58', '2017-02-15 20:39:58');
INSERT INTO `index_slide_ad` VALUES ('21', null, '17440.111001.354169.1.571_1792_8544', null, '//c-nfa.jd.com/adclick?keyStr=6PQwtwh0f06syGHwQVvROzh5ulIgMw7+jmnFGWIVTm5/+Q6kSQOF21lpm773NgeAF7GqQf4A7IheNcAyMGXSjy4aq9OhfvWVwLWhnQ4kxy9TnjRC7WzdpzM5FkvJ9F1G4fLWlvRBkxoM4QrINBB7LQcR68X7MSVvcE3SiI0gy6ujnqV5KQT5u02ECvc0otqYOZclZQy8tD8SmJfRl65s2HRNPXO1OlOnpjSdsgyn3tv6IKGIVG5f8/1M7NcIo0ve8lA8M70Lq8BMrlEVc8b+NjlXCtVJy736rNTlDFJujSIZ0bHb+XoB0DH51Ye094LFe10Ui55Dmr3ucUl7esusJg==&cv=2.0&url=//sale.jd.com/act/SMPUcntZ8Vfjq.html', '1.0', 'group1/M00/00/01/wKh9hFihdbCAQumGAACS_51bHqY705.jpg', 'group1/M00/00/01/wKh9hFihdbCAc4YmAAB_R9IfxZA343.jpg', '1', '0', '//localhost:8106/log?info=', '2017-02-15 20:39:58', '2017-02-15 20:39:58');
INSERT INTO `index_slide_ad` VALUES ('22', null, '17440.111002.353490.1.571_1792_8544', null, '//c-nfa.jd.com/adclick?keyStr=6PQwtwh0f06syGHwQVvROzh5ulIgMw7+jmnFGWIVTm5/+Q6kSQOF21lpm773NgeAF7GqQf4A7IheNcAyMGXSj8HPDpgj0N2AUXK/TbbccMGDB9lN5pQJCH1wwwMscwlp9VEKOHcOEXc2lnu6+dkNEHZE1cuocZAOP4HWCPvBCwgUE5r+7drRtiZKtzSrxx0FZzMI/FNcIyqPvs7l7kzfgqwuiHO85wBSyA1FPeT/jgXBkyxapGKK0bayuRsyF1CjSHY0JSwCJdCXubq2wQCesktkSSOFA1pdGE/Iy7jQSEYQlCt5qtzWUNQR7nMClgnfA8pekfb4uNQnqgcfk9CP5w==&cv=2.0&url=//sale.jd.com/act/COLZQGP0eD.html', '1.0', 'group1/M00/00/01/wKh9hFihdbCAb5IZAAChFp2txZE307.jpg', 'group1/M00/00/01/wKh9hFihdbCAfnzGAACHS_SwuYM458.jpg', '1', '1', '//localhost:8106/log?info=', '2017-02-15 20:39:58', '2017-02-15 20:39:58');
INSERT INTO `index_slide_ad` VALUES ('23', null, '9740.111003.354503.1.571_1792_8544', null, '//c-nfa.jd.com/adclick?keyStr=6PQwtwh0f06syGHwQVvROzh5ulIgMw7+jmnFGWIVTm46ZwCWnNwtj1B/F03nvQgpQHb6acZMTLl5a8oOdH3WPkve9h4xqywZsVGDvdQfVbEpBs9guUxNRruWzjMZaW8fdErwU+9B2rqhu+mEbUvhPMEUpYWtujz4yJHhtl+/FHVUESWDXTRBgK3npDaW/9CKZzMI/FNcIyqPvs7l7kzfgqwuiHO85wBSyA1FPeT/jgXBkyxapGKK0bayuRsyF1CjSHY0JSwCJdCXubq2wQCesktkSSOFA1pdGE/Iy7jQSEYQlCt5qtzWUNQR7nMClgnfA8pekfb4uNQnqgcfk9CP5w==&cv=2.0&url=//sale.jd.com/act/ZnDo10XW3q.html', '1.0', 'group1/M00/00/01/wKh9hFihdbCASx54AADIOkUzfPg288.jpg', 'group1/M00/00/01/wKh9hFihdbCAXGHbAACYhsfyFRs390.jpg', '1', '2', '//localhost:8106/log?info=', '2017-02-15 20:39:58', '2017-02-15 20:39:58');
INSERT INTO `index_slide_ad` VALUES ('24', null, '17440.111004.354485.1.571_1792_8544', null, '//c-nfa.jd.com/adclick?keyStr=6PQwtwh0f06syGHwQVvROzh5ulIgMw7+jmnFGWIVTm5/+Q6kSQOF21lpm773NgeAF7GqQf4A7IheNcAyMGXSj72jBFb/Kwim0/xHmVGXAECIH6d+xPZEWQjoBrz/eGh64fLWlvRBkxoM4QrINBB7Lc7K3LJuB3N53VQsqrn84yC/VyfkwxLUPNUi+6EaTvU4PcADfOydEgb3r/t/IOD6jebwKAFQoJNlTkPYqRWHa7QpodVXpEL15gIhF7tS9XGTIH/3PVpFk1yWjCKplUWsYiZkUIzjmhlPlHv4wTLvUHI6PS3e2iAxIftN/cIOoqdkLMz+Zwh2Sv2uEPtOqU+3QA==&cv=2.0&url=//sale.jd.com/act/QBYHjtIxWhu.html', '1.0', 'group1/M00/00/01/wKh9hFihdbCABhgBAACSCzwM5xA005.jpg', 'group1/M00/00/01/wKh9hFihdbGAaLDAAABi-kfI-VI550.jpg', '1', '3', '//localhost:8106/log?info=', '2017-02-15 20:39:58', '2017-02-15 20:39:58');
INSERT INTO `index_slide_ad` VALUES ('25', null, '0.111206.316499.1.571_1792_8616', null, '//c-nfa.jd.com/adclick?keyStr=6PQwtwh0f06syGHwQVvROzh5ulIgMw7+jmnFGWIVTm7aEhyJbPklrRIgQXmScvrAA4KBle48K5EbCop6rGkqfV3FNLAVHD/eSzGRY32UHZJHWmoByPeXmwN+vPPmAue8nPRVaxDTMvb4FGTgPthaktn8gPOpqe+7/VxjbRwcMt3bLwU0UDTaLz6VMhnMX54zQBm0Myq73ZmTaMYtfetTW8ZG+bOJzueASAX30AkC+BJM7KhKAzacsw4AdWt8CpsTWGOQzs6c6SvsrASo0uZP0+sMmgEhkY9EeMVx6X1nDXuTWk+LdBAe6AGHS3ze5vGalrw0VRUczI/aZKUbzeydkA==&cv=2.0&url=//sale.jd.com/act/jPbZs6QhNV.html', '1.0', 'group1/M00/00/01/wKh9hFihdbGAUu1OAACel-kS18A537.jpg', 'group1/M00/00/01/wKh9hFihdbGAXlz2AACCtuDE_R0335.jpg', '1', '0', '//localhost:8106/log?info=', '2017-02-15 20:39:58', '2017-02-15 20:39:58');
INSERT INTO `index_slide_ad` VALUES ('26', null, '0.111207.316498.1.571_1792_8616', null, '//c-nfa.jd.com/adclick?keyStr=6PQwtwh0f06syGHwQVvROzh5ulIgMw7+jmnFGWIVTm7aEhyJbPklrRIgQXmScvrAKyehk0ScOhxbqaSFKuwr5Ya7SF2QAJUAtLZ6rGg6X1pHWmoByPeXmwN+vPPmAue8nPRVaxDTMvb4FGTgPthaktn8gPOpqe+7/VxjbRwcMt3bLwU0UDTaLz6VMhnMX54zQBm0Myq73ZmTaMYtfetTW8ZG+bOJzueASAX30AkC+BJM7KhKAzacsw4AdWt8CpsTWGOQzs6c6SvsrASo0uZP0+sMmgEhkY9EeMVx6X1nDXuTWk+LdBAe6AGHS3ze5vGalrw0VRUczI/aZKUbzeydkA==&cv=2.0&url=//sale.jd.com/act/jPbZs6QhNV.html', '1.0', 'group1/M00/00/01/wKh9hFihdbGAZSq6AACel-kS18A266.jpg', 'group1/M00/00/01/wKh9hFihdbGATjf0AACCtuDE_R0465.jpg', '1', '1', '//localhost:8106/log?info=', '2017-02-15 20:39:59', '2017-02-15 20:39:59');
INSERT INTO `index_slide_ad` VALUES ('27', null, '0.111208.316497.1.571_1792_8616', null, '//c-nfa.jd.com/adclick?keyStr=6PQwtwh0f06syGHwQVvROzh5ulIgMw7+jmnFGWIVTm7aEhyJbPklrRIgQXmScvrAjuACbp+WOIXNOUOwl586yHngZtyAac/5BsgNSkPmlI1HWmoByPeXmwN+vPPmAue8nPRVaxDTMvb4FGTgPthaktn8gPOpqe+7/VxjbRwcMt3bLwU0UDTaLz6VMhnMX54zQBm0Myq73ZmTaMYtfetTW8ZG+bOJzueASAX30AkC+BJM7KhKAzacsw4AdWt8CpsTWGOQzs6c6SvsrASo0uZP0+sMmgEhkY9EeMVx6X1nDXuTWk+LdBAe6AGHS3ze5vGalrw0VRUczI/aZKUbzeydkA==&cv=2.0&url=//sale.jd.com/act/jPbZs6QhNV.html', '1.0', 'group1/M00/00/01/wKh9hFihdbGAYymdAACel-kS18A963.jpg', 'group1/M00/00/01/wKh9hFihdbGAbzK6AACCtuDE_R0155.jpg', '1', '2', '//localhost:8106/log?info=', '2017-02-15 20:39:59', '2017-02-15 20:39:59');
INSERT INTO `index_slide_ad` VALUES ('28', null, '0.111209.315710.1.571_1792_8616', null, '//c-nfa.jd.com/adclick?keyStr=6PQwtwh0f06syGHwQVvROzh5ulIgMw7+jmnFGWIVTm7aEhyJbPklrRIgQXmScvrAKM14xpjP3lwgVSuVRLSHK6xuA50z2VWIowEILojfbWhHWmoByPeXmwN+vPPmAue8nPRVaxDTMvb4FGTgPthaktn8gPOpqe+7/VxjbRwcMt3bLwU0UDTaLz6VMhnMX54zQBm0Myq73ZmTaMYtfetTW8ZG+bOJzueASAX30AkC+BJM7KhKAzacsw4AdWt8CpsTWGOQzs6c6SvsrASo0uZP0+sMmgEhkY9EeMVx6X1nDXuTWk+LdBAe6AGHS3ze5vGalrw0VRUczI/aZKUbzeydkA==&cv=2.0&url=//sale.jd.com/act/jPbZs6QhNV.html', '1.0', 'group1/M00/00/01/wKh9hFihdbGAQ8jNAACel-kS18A639.jpg', 'group1/M00/00/01/wKh9hFihdbGAADMHAACCtuDE_R0970.jpg', '1', '3', '//localhost:8106/log?info=', '2017-02-15 20:39:59', '2017-02-15 20:39:59');
INSERT INTO `index_slide_ad` VALUES ('3', null, '17605.110983.353555.1.571_1792_8539', null, '//c-nfa.jd.com/adclick?keyStr=6PQwtwh0f06syGHwQVvROzh5ulIgMw7+jmnFGWIVTm44Gmviryu3zCBj1jUmRPswHMj4Rf2/7rVHbQqHOc6cazPIf4sU5ibba1uFZsUzQOSFfi5ZgiBN7M8ipnj5kwf84fLWlvRBkxoM4QrINBB7La36nOQJiBduqzjK+D2fkmxDLYi2QDOCvXjX/fr108RDPg/5lcwJ9ODRALR4zzW6KndBYMCVFxlbZRUKij7Z92358nvVR6ukal9j8UOUAB7XX2eOVm6BWJgL+STwEf7TGxhRUJO1SzbN9ghEGFXB7f90eAcCcxt4/aYpXclWi6Ay4kZYtET9oANOMTk0wDstKw==&cv=2.0&url=//sale.jd.com/act/3wUs2doMIBCSvkjt.html', '1.0', 'group1/M00/00/00/wKh9hFihda2AeOjJAAB_q_m-wNk923.jpg', 'group1/M00/00/00/wKh9hFihda2AZs8aAABluGLv5PE728.jpg', '1', '2', '//localhost:8106/log?info=', '2017-02-15 20:39:55', '2017-02-15 20:39:55');
INSERT INTO `index_slide_ad` VALUES ('4', null, 'cn.binux.linked17606.110984.354239.1.571_1792_8539', null, '//c-nfa.jd.com/adclick?keyStr=6PQwtwh0f06syGHwQVvROzh5ulIgMw7+jmnFGWIVTm44Gmviryu3zCBj1jUmRPswhGqzsCsN0Zl6C3rQNuljXJbzC8XkslgEzjAvp+g18rdIh3lby3ZZ+jcf7k4MHLu29VEKOHcOEXc2lnu6+dkNEE0iW2dHgTVhCAzBBp//pMeUNbo4V+uOcWwyszvHkYbnAkuOIdHLRtkW/q4CIdzM/gKe2acHG0Ajuj9L8JXxidE+hmSpgLz9xmR1xEiObDPEY2cXhMASnNvmSUyLnxgFsxMv49nQdfWafuMVCtVmz8qXOlcppL6VE6XAjxQTKJJ8WOo1bdnPYgppNB+nDWfC8A==&cv=2.0&url=//sale.jd.com/act/OW3XkAGxYjh.html', '1.0', 'group1/M00/00/00/wKh9hFihda6AB9iKAADl5rC1Z5Q688.jpg', 'group1/M00/00/00/wKh9hFihda6AWTHsAAC2ERUbpzQ331.jpg', '1', '3', '//localhost:8106/log?info=', '2017-02-15 20:39:55', '2017-02-15 20:39:55');
INSERT INTO `index_slide_ad` VALUES ('5', null, '17618.110985.353520.1.571_1792_8540', null, '//c-nfa.jd.com/adclick?keyStr=6PQwtwh0f06syGHwQVvROzh5ulIgMw7+jmnFGWIVTm6MDBRrl7GYdZm+AWRos+yFdVu/Bw6FgiX7O9cW8L8FUe5k4x4REReti3NErMP1LlTwRcVebuF0WK0Nv2A518xb4fLWlvRBkxoM4QrINBB7LcIIvsgZL6F+7QBWX7vS8izDPVQYXy0hWrkpygUm+i47PcADfOydEgb3r/t/IOD6jebwKAFQoJNlTkPYqRWHa7QpodVXpEL15gIhF7tS9XGTIH/3PVpFk1yWjCKplUWsYiZkUIzjmhlPlHv4wTLvUHI6PS3e2iAxIftN/cIOoqdkLMz+Zwh2Sv2uEPtOqU+3QA==&cv=2.0&url=//sale.jd.com/act/kLtQS2A1VpR.html', '1.0', 'group1/M00/00/01/wKh9hFihda6AYRxrAAB-BYuDR2Y464.jpg', 'group1/M00/00/01/wKh9hFihda6AcoGVAABv40IZrvs710.jpg', '1', '0', '//localhost:8106/log?info=', '2017-02-15 20:39:56', '2017-02-15 20:39:56');
INSERT INTO `index_slide_ad` VALUES ('6', null, '17643.110986.353610.1.571_1792_8540', null, '//c-nfa.jd.com/adclick?keyStr=6PQwtwh0f06syGHwQVvROzh5ulIgMw7+jmnFGWIVTm6MDBRrl7GYdZm+AWRos+yFhh+RiYJnCeu86NAZk10jj8EtfoUePrxiIMNupOowcKyn/i37YWLDHDgEHrvoPCt74fLWlvRBkxoM4QrINBB7LQXArjbcMNOWSkG4sUZV0sVKdZOESUJN+I53hQeA3zTCv/7SSe9q7ZBCXWwxjFHP/r6uO37CY0Gpq2F6VJodSxa+LcM/29HoFWRR+IS3JwzGX9Bp73GHZ79P1hYK54ixq3JUyYon4u6OguV+SYB+YpNilRuhHxyLJHkfid7fVu5mhiN6+Mc28apMMzd+icNrBA==&cv=2.0&url=//sale.jd.com/act/sa2MIlbdx6rLnhw.html', '1.0', 'group1/M00/00/01/wKh9hFihda6AMwSWAAC3vKUf_fM048.jpg', 'group1/M00/00/01/wKh9hFihda6AAbh_AACUgIyZYUE511.jpg', '1', '1', '//localhost:8106/log?info=', '2017-02-15 20:39:56', '2017-02-15 20:39:56');
INSERT INTO `index_slide_ad` VALUES ('7', null, '17658.110987.354556.1.571_1792_8540', null, '//c-nfa.jd.com/adclick?keyStr=6PQwtwh0f06syGHwQVvROzh5ulIgMw7+jmnFGWIVTm6MDBRrl7GYdZm+AWRos+yFeNKypGy3aKtyANdEYnjxxAPPJtEkI+N+i7DBr3g/qYaGHZ+maUSx4qWCQDgdBSPU4fLWlvRBkxoM4QrINBB7Lb1cA7PPaZEZkwZxO+ZlZxRlfriiVmeYYW9T+RPIhrsQOZclZQy8tD8SmJfRl65s2HRNPXO1OlOnpjSdsgyn3tv6IKGIVG5f8/1M7NcIo0ve8lA8M70Lq8BMrlEVc8b+NjlXCtVJy736rNTlDFJujSIZ0bHb+XoB0DH51Ye094LFe10Ui55Dmr3ucUl7esusJg==&cv=2.0&url=//sale.jd.com/act/65okab2TQfFqX.html', '1.0', 'group1/M00/00/01/wKh9hFihda6AAnzCAACP622ZLho910.jpg', 'group1/M00/00/01/wKh9hFihda6ACZLmAABtHosFAIk007.jpg', '1', '2', '//localhost:8106/log?info=', '2017-02-15 20:39:56', '2017-02-15 20:39:56');
INSERT INTO `index_slide_ad` VALUES ('8', null, '17661.110988.354549.1.571_1792_8540', null, '//c-nfa.jd.com/adclick?keyStr=6PQwtwh0f06syGHwQVvROzh5ulIgMw7+jmnFGWIVTm6MDBRrl7GYdZm+AWRos+yFa8r3WTh5WsnmZHZ4AxFWfw1KWH52opcDRcOmEJ1/1l4acTdNv7CGz9Yoj3le+xoo4fLWlvRBkxoM4QrINBB7LRSLC7Qw1v+3i5NLvr8ym4Hp7TjeposSnLR+Hf/FbvdHqg7lBKMNaPUH7HUwVbi2CBd0Hr7Fi8hVunvZC4tPYiigwBDdtxSPU3z8cp50sfgiF1pAhcXBWv+zgtdSUzgYBEGXVSM3evs0GIN7W0oIHYZuynqN4iTv4/b1f66WBNE0YyuRuUC5Ueuy0w4BtYM9ig==&cv=2.0&url=//sale.jd.com/act/sQrT1OmdK8u2.html', '1.0', 'group1/M00/00/01/wKh9hFihda6AAJxIAAC3QswzsN0372.jpg', 'group1/M00/00/01/wKh9hFihda6AO8QpAACI4xGAhjE084.jpg', '1', '3', '//localhost:8106/log?info=', '2017-02-15 20:39:56', '2017-02-15 20:39:56');
INSERT INTO `index_slide_ad` VALUES ('9', null, '9739.110989.354538.1.571_1792_8541', null, '//c-nfa.jd.com/adclick?keyStr=6PQwtwh0f06syGHwQVvROzh5ulIgMw7+jmnFGWIVTm47vj5+CkXlwPF90YrTKWEy111iyXFGWqtpPQSl9iZ2S0tznxABlmXda6LHKYjH4aHlpmCJu4F8LfcbxPufmI1IdErwU+9B2rqhu+mEbUvhPMfTrBwm2KfUXuilCScHq7/in90T9PH8aNDNA92LFpr/v/7SSe9q7ZBCXWwxjFHP/r6uO37CY0Gpq2F6VJodSxa+LcM/29HoFWRR+IS3JwzGX9Bp73GHZ79P1hYK54ixq3JUyYon4u6OguV+SYB+YpNilRuhHxyLJHkfid7fVu5mhiN6+Mc28apMMzd+icNrBA==&cv=2.0&url=//sale.jd.com/act/ckZVrEFYRyUtneS5.html', '1.0', 'group1/M00/00/01/wKh9hFihda-Ab4dqAACUjbehDaE140.jpg', 'group1/M00/00/01/wKh9hFihda-ABaGBAABsfrPAfvE979.jpg', '1', '0', '//localhost:8106/log?info=', '2017-02-15 20:39:57', '2017-02-15 20:39:57');

-- ----------------------------
-- Table structure for item
-- ----------------------------
DROP TABLE IF EXISTS `item`;
CREATE TABLE `item` (
  `id` varchar(32) NOT NULL COMMENT '商品id，同时也是商品编号',
  `title` varchar(100) NOT NULL COMMENT '商品标题',
  `sell_point` varchar(500) DEFAULT NULL COMMENT '商品卖点',
  `price` bigint(20) NOT NULL COMMENT '商品价格，单位为：分',
  `num` int(10) NOT NULL COMMENT '库存数量',
  `barcode` varchar(30) DEFAULT NULL COMMENT '商品条形码',
  `image` varchar(500) DEFAULT NULL COMMENT '商品图片',
  `cid` bigint(10) NOT NULL COMMENT '所属类目，叶子类目',
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '商品状态，1-正常，2-下架，3-删除',
  `weight` int(10) NOT NULL COMMENT '重量',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime NOT NULL COMMENT '更新时间',
  `colour` varchar(10) NOT NULL COMMENT '颜色',
  `size` varchar(10) NOT NULL COMMENT '尺寸',
  PRIMARY KEY (`id`),
  KEY `cid` (`cid`),
  KEY `status` (`status`),
  KEY `update_time` (`update_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='商品表';

-- ----------------------------
-- Records of item
-- ----------------------------
INSERT INTO `item` VALUES ('148630639229938', 'Apple iPhone 7 (A1660) 32G 黑色 移动联通电信4G手机', '<div class=\"item hide\" id=\"p-ad\" clstag=\"shangpin|keycount|product|slogana\" data-hook=\"hide\" style=\"display: block;\" title=\"2017就要iPhone！开年大促就等你来！\">2017就要iPhone<a href=\"http://sale.jd.com/act/4VRdmG362EbLpIx.html\" target=\"_blank\">开年大促就等你来!</a></div><div class=\"item hide\" id=\"p-ad-phone\" clstag=\"shangpin|keycount|product|sloganb\" data-hook=\"hide\" style=\"display: block;\" title=\"推荐选择下方的移动、联通、电信优惠购，套餐有优惠，还有话费返还。\">推荐选择下方的移动、联通、电信优惠购，套餐有优惠，还有话费返还。</div>', '519900', '1000', '100000000000', 'http://192.168.125.132/group1/M00/00/00/wKh9hFiMy4eAV5lwAAB25IS6WjM274.jpg,http://192.168.125.132/group1/M00/00/00/wKh9hFiMy4iAZJdbAABuOI_BXnU784.jpg,http://192.168.125.132/group1/M00/00/00/wKh9hFiMy4iALMfdAAAgiIWd6u4269.jpg,http://192.168.125.132/group1/M00/00/00/wKh9hFiMy4iAYlnPAAAUJlSoifY942.jpg,http://192.168.125.132/group1/M00/00/00/wKh9hFiMy4iAKoaiAABqNZxUhNc780.jpg', '560', '1', '300', '2017-02-05 22:53:12', '2017-02-05 22:53:12', '亮黑色', '128GB');
INSERT INTO `item` VALUES ('148630831972863', 'Apple MacBook Pro 15.4英寸笔记本电脑 深空灰色（Multi-Touch Bar/Core i7/16GB/512GB MLH42CH/A）', '新款MacBook Pro！速度更快，性能更强，身形更纤薄！新春钜惠！白条分期3期免息！下单送内胆包等多重惊喜！更多活动点击', '2148800', '1000', '100000001', 'http://192.168.125.132/group1/M00/00/00/wKh9hFiM0l-AQuvEAABmx7u5QSA128.jpg,http://192.168.125.132/group1/M00/00/00/wKh9hFiM0l-ABW9lAABFmC1XpSo537.jpg,http://192.168.125.132/group1/M00/00/00/wKh9hFiM0l-AdmOmAAA2-J-BdLk387.jpg', '163', '1', '2500', '2017-02-05 23:25:20', '2017-02-05 23:25:20', '银灰色', '256GB');

-- ----------------------------
-- Table structure for item_desc
-- ----------------------------
DROP TABLE IF EXISTS `item_desc`;
CREATE TABLE `item_desc` (
  `id` varchar(32) NOT NULL,
  `item_id` varchar(32) NOT NULL COMMENT '商品ID',
  `item_desc` text COMMENT '商品描述',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='商品描述表';

-- ----------------------------
-- Records of item_desc
-- ----------------------------

-- ----------------------------
-- Table structure for item_param
-- ----------------------------
DROP TABLE IF EXISTS `item_param`;
CREATE TABLE `item_param` (
  `id` varchar(32) NOT NULL,
  `item_cat_id` varchar(32) DEFAULT NULL COMMENT '商品类目ID',
  `param_data` text COMMENT '参数数据，格式为json格式',
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `item_cat_id` (`item_cat_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='商品规则参数';

-- ----------------------------
-- Records of item_param
-- ----------------------------
INSERT INTO `item_param` VALUES ('1', '3', '[{\"group\":\"组名1\",\"params\":[\"组员1\",\"组员2\"]},{\"group\":\"组名2\",\"params\":[\"组员1\",\"组员2\"]},{\"group\":\"组名3\",\"params\":[\"组员1\",\"组员2\",\"组员3\",\"组员4\"]}]', '2015-04-03 10:21:22', '2015-04-03 10:21:22');
INSERT INTO `item_param` VALUES ('2', '560', '[{\"group\":\"主体\",\"params\":[\"品牌\",\"型号\",\"颜色\",\"上市年份\"]},{\"group\":\"网络\",\"params\":[\"4G网络制式\",\"3G网络制式\",\"2G网络制式\"]},{\"group\":\"存储\",\"params\":[\"机身内存\",\"储存卡类型\"]}]', '2015-04-03 10:40:12', '2015-04-03 10:40:12');
INSERT INTO `item_param` VALUES ('21', '440', '[{\"group\":\"1\",\"params\":[\"2w\"]},{\"group\":\"2\",\"params\":[\"1\"]},{\"group\":\"3\",\"params\":[\"1\"]},{\"group\":\"4\",\"params\":[\"1\"]}]', '2015-06-05 12:04:41', '2015-06-05 12:04:41');
INSERT INTO `item_param` VALUES ('22', '298', '[{\"group\":\"f1\",\"params\":[\"1\"]},{\"group\":\"f2\",\"params\":[\"2\"]}]', '2015-06-05 12:08:07', '2015-06-05 12:08:07');
INSERT INTO `item_param` VALUES ('23', '257', '[{\"group\":\"12\",\"params\":[\"12\"]}]', '2015-06-05 12:10:45', '2015-06-05 12:10:45');
INSERT INTO `item_param` VALUES ('24', '443', '[{\"group\":\"股氯气\",\"params\":[\"撒旦法\"]}]', '2015-06-05 12:11:16', '2015-06-05 12:11:16');
INSERT INTO `item_param` VALUES ('25', '298', '[{\"group\":\"1\",\"params\":[\"1\"]}]', '2015-06-05 12:21:01', '2015-06-05 12:21:01');
INSERT INTO `item_param` VALUES ('26', '582', '[{\"group\":\"分组1\",\"params\":[\"参数1\",\"参数2\",\"参数3\",\"参数4\",\"参数5\"]},{\"group\":\"分组2\",\"params\":[\"参数21\",\"参数22\",\"参数23\",\"参数24\"]}]', '2015-07-23 16:44:32', '2015-07-23 16:44:32');
INSERT INTO `item_param` VALUES ('3', '298', '[{\"group\":\"g1\",\"params\":[\"aa\",\"bb\",\"cc\"]},{\"group\":\"g2\",\"params\":[\"ad\",\"sd\"]},{\"group\":\"g3\",\"params\":[\"sdd\",\"sdfs\",\"dfg\"]}]', '2015-06-05 11:59:45', '2015-06-05 11:59:45');

-- ----------------------------
-- Table structure for item_param_item
-- ----------------------------
DROP TABLE IF EXISTS `item_param_item`;
CREATE TABLE `item_param_item` (
  `id` varchar(32) NOT NULL,
  `item_id` varchar(32) DEFAULT NULL COMMENT '商品ID',
  `param_data` text COMMENT '参数数据，格式为json格式',
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `item_id` (`item_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='商品规格和商品的关系表';

-- ----------------------------
-- Records of item_param_item
-- ----------------------------
INSERT INTO `item_param_item` VALUES ('1', '48', '[{\"group\":\"主体\",\"params\":[{\"k\":\"品牌\",\"v\":\"苹果（Apple）\"},{\"k\":\"型号\",\"v\":\"iPhone 6 A1586\"},{\"k\":\"颜色\",\"v\":\"金色\"},{\"k\":\"上市年份\",\"v\":\"2014\"}]},{\"group\":\"网络\",\"params\":[{\"k\":\"4G网络制式\",\"v\":\"移动4G(TD-LTE)/联通4G(FDD-LTE)/电信4G(FDD-LTE)\"},{\"k\":\"3G网络制式\",\"v\":\"移动3G(TD-SCDMA)/联通3G(WCDMA)/电信3G（CDMA2000）\"},{\"k\":\"2G网络制式\",\"v\":\"移动2G/联通2G(GSM)/电信2G(CDMA)\"}]},{\"group\":\"存储\",\"params\":[{\"k\":\"机身内存\",\"v\":\"16GB ROM\"},{\"k\":\"储存卡类型\",\"v\":\"不支持\"}]}]', '2015-04-03 10:52:55', '2015-04-03 10:52:55');
INSERT INTO `item_param_item` VALUES ('2', '1188043', '[{\"group\":\"主体\",\"params\":[{\"k\":\"品牌\",\"v\":\"锤子\"},{\"k\":\"型号\",\"v\":\"T1(SM705)\"},{\"k\":\"颜色\",\"v\":\"黑色\"},{\"k\":\"上市年份\",\"v\":\"2014年\"}]},{\"group\":\"网络\",\"params\":[{\"k\":\"4G网络制式\",\"v\":\"移动4G（TD-LTE）/联通4G（FDD-LTE）\"},{\"k\":\"3G网络制式\",\"v\":\"移动3G(TD-SCDMA)/联通3G(WCDMA)\"},{\"k\":\"2G网络制式\",\"v\":\"移动2G/联通2G(GSM)\"}]},{\"group\":\"存储\",\"params\":[{\"k\":\"机身内存\",\"v\":\"32GB ROM\"},{\"k\":\"储存卡类型\",\"v\":\"2GB RAM\"}]}]', '2015-04-06 11:24:10', '2015-04-06 11:24:10');
INSERT INTO `item_param_item` VALUES ('3', '1433500495290', '[{\"group\":\"主体\",\"params\":[{\"k\":\"品牌\",\"v\":\"1\"},{\"k\":\"型号\",\"v\":\"2\"},{\"k\":\"颜色\",\"v\":\"3\"},{\"k\":\"上市年份\",\"v\":\"4\"}]},{\"group\":\"网络\",\"params\":[{\"k\":\"4G网络制式\",\"v\":\"a\"},{\"k\":\"3G网络制式\",\"v\":\"b\"},{\"k\":\"2G网络制式\",\"v\":\"c\"}]},{\"group\":\"存储\",\"params\":[{\"k\":\"机身内存\",\"v\":\"de\"},{\"k\":\"储存卡类型\",\"v\":\"ef\"}]}]', '2015-06-05 18:34:52', '2015-06-05 18:34:52');
INSERT INTO `item_param_item` VALUES ('4', '1001434271015869', '[{\"group\":\"主体\",\"params\":[{\"k\":\"品牌\",\"v\":\"华为（HUAWEI）\"},{\"k\":\"型号\",\"v\":\"P8\"},{\"k\":\"颜色\",\"v\":\"皓月银\"},{\"k\":\"上市年份\",\"v\":\"2015年\"}]},{\"group\":\"网络\",\"params\":[{\"k\":\"4G网络制式\",\"v\":\"移动4G(TDD-LTE)/联通4G(TDD-LTE/FDD-LTE)\"},{\"k\":\"3G网络制式\",\"v\":\"移动3G(TD-SCDMA)/联通3G(WCDMA)\"},{\"k\":\"2G网络制式\",\"v\":\"移动2G/联通2G(GSM)\"}]},{\"group\":\"存储\",\"params\":[{\"k\":\"机身内存\",\"v\":\"16GB ROM\"},{\"k\":\"储存卡类型\",\"v\":\"MicroSD(TF)\"}]}]', '2015-06-14 16:36:55', '2015-06-14 16:36:55');
INSERT INTO `item_param_item` VALUES ('5', '101434521126763', '[{\"group\":\"组名1\",\"params\":[{\"k\":\"组员1\",\"v\":\"a\"},{\"k\":\"组员2\",\"v\":\"a\"}]},{\"group\":\"组名2\",\"params\":[{\"k\":\"组员1\",\"v\":\"sd\"},{\"k\":\"组员2\",\"v\":\"ss\"}]},{\"group\":\"组名3\",\"params\":[{\"k\":\"组员1\",\"v\":\"sd\"},{\"k\":\"组员2\",\"v\":\"sd\"},{\"k\":\"组员3\",\"v\":\"sd\"},{\"k\":\"组员4\",\"v\":\"sda\"}]}]', '2015-06-17 14:05:26', '2015-06-17 14:05:26');
INSERT INTO `item_param_item` VALUES ('8', '143771131488369', '[{\"group\":\"主体\",\"params\":[{\"k\":\"品牌\",\"v\":\"1\"},{\"k\":\"型号\",\"v\":\"1\"},{\"k\":\"颜色\",\"v\":\"2\"},{\"k\":\"上市年份\",\"v\":\"3\"}]},{\"group\":\"网络\",\"params\":[{\"k\":\"4G网络制式\",\"v\":\"1\"},{\"k\":\"3G网络制式\",\"v\":\"2\"},{\"k\":\"2G网络制式\",\"v\":\"3\"}]},{\"group\":\"存储\",\"params\":[{\"k\":\"机身内存\",\"v\":\"4\"},{\"k\":\"储存卡类型\",\"v\":\"2\"}]}]', '2015-07-24 12:15:14', '2015-07-24 12:15:14');

-- ----------------------------
-- Table structure for manage_user
-- ----------------------------
DROP TABLE IF EXISTS `manage_user`;
CREATE TABLE `manage_user` (
  `id` varchar(32) NOT NULL,
  `username` varchar(50) NOT NULL COMMENT '用户名',
  `name` varchar(50) NOT NULL COMMENT '姓名',
  `password` varchar(32) NOT NULL COMMENT '密码，加密存储',
  `phone` varchar(20) DEFAULT NULL COMMENT '注册手机号',
  `email` varchar(50) DEFAULT NULL COMMENT '注册邮箱',
  `job` varchar(50) DEFAULT NULL COMMENT '工作',
  `create_time` datetime NOT NULL,
  `update_time` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`) USING BTREE,
  UNIQUE KEY `phone` (`phone`) USING BTREE,
  UNIQUE KEY `email` (`email`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='后台用户表';

-- ----------------------------
-- Records of manage_user
-- ----------------------------

-- ----------------------------
-- Table structure for order
-- ----------------------------
DROP TABLE IF EXISTS `order`;
CREATE TABLE `order` (
  `id` varchar(32) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '订单id',
  `user_id` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '用户id',
  `addr_id` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '地址id',
  `payment` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '实付金额。精确到2位小数;单位:元。如:200.07，表示:200元7分',
  `payment_type` int(2) DEFAULT NULL COMMENT '支付类型，1、货到付款，2、在线支付，3、微信支付，4、支付宝支付',
  `post_fee` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '邮费。精确到2位小数;单位:元。如:200.07，表示:200元7分',
  `status` int(10) DEFAULT NULL COMMENT '状态：1、未付款，2、已付款，3、未发货，4、已发货，5、交易成功，6、交易关闭',
  `shipping_name` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '物流名称',
  `shipping_code` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '物流单号',
  `no_annoyance` varchar(10) COLLATE utf8_bin DEFAULT NULL COMMENT '退换无忧',
  `service_price` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '服务费',
  `return_price` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '返现',
  `total_weight` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '订单总重 单位/克',
  `buyer_rate` int(2) DEFAULT NULL COMMENT '买家是否已经评价',
  `close_time` datetime DEFAULT NULL COMMENT '交易关闭时间',
  `end_time` datetime DEFAULT NULL COMMENT '交易完成时间',
  `payment_time` datetime DEFAULT NULL COMMENT '付款时间',
  `consign_time` datetime DEFAULT NULL COMMENT '发货时间',
  `create_time` datetime DEFAULT NULL COMMENT '订单创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '订单更新时间',
  PRIMARY KEY (`id`),
  KEY `create_time` (`create_time`),
  KEY `buyer_nick` (`addr_id`),
  KEY `status` (`status`),
  KEY `payment_type` (`payment_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of order
-- ----------------------------
INSERT INTO `order` VALUES ('12047608109420037', '37', '1', '519900', '1', '0', '1', '顺丰速运', null, '0', '0', '0', null, '6', null, null, null, null, '2017-04-02 16:08:25', null);
INSERT INTO `order` VALUES ('13060403403290037', '37', '1', '15041600', '1', '0', '1', '顺丰速运', null, '0', '0', '0', null, '6', null, null, null, null, '2017-03-03 16:46:46', null);
INSERT INTO `order` VALUES ('17208483627260037', '37', '1', '519900', '1', '0', '1', '顺丰速运', null, '0', '0', '0', null, '6', null, null, null, null, '2017-03-20 09:08:17', null);

-- ----------------------------
-- Table structure for order_item
-- ----------------------------
DROP TABLE IF EXISTS `order_item`;
CREATE TABLE `order_item` (
  `id` varchar(32) COLLATE utf8_bin NOT NULL,
  `item_id` varchar(32) COLLATE utf8_bin NOT NULL COMMENT '商品id',
  `order_id` varchar(32) COLLATE utf8_bin NOT NULL COMMENT '订单id',
  `num` int(10) DEFAULT NULL COMMENT '商品购买数量',
  `title` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '商品标题',
  `price` bigint(50) DEFAULT NULL COMMENT '商品单价',
  `total_fee` bigint(50) DEFAULT NULL COMMENT '商品总金额',
  `pic_path` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '商品图片地址',
  `weights` varchar(30) COLLATE utf8_bin DEFAULT NULL COMMENT '总重量 单位/克',
  `create_time` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `update_time` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `item_id` (`item_id`),
  KEY `order_id` (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of order_item
-- ----------------------------
INSERT INTO `order_item` VALUES ('201703038058255181', '148630831972863', '13060403403290037', '7', 'Apple MacBook Pro 15.4英寸笔记本电脑 深空灰色（Multi-Touch Bar/Core i7/16GB/512GB MLH42CH/A）', '2148800', '15041600', 'http://192.168.125.132/group1/M00/00/00/wKh9hFiM0l-AQuvEAABmx7u5QSA128.jpg', 'null', null, null);
INSERT INTO `order_item` VALUES ('201703200974296817', '148630639229938', '17208483627260037', '1', 'Apple iPhone 7 (A1660) 32G 黑色 移动联通电信4G手机', '519900', '519900', 'http://192.168.125.132/group1/M00/00/00/wKh9hFiMy4eAV5lwAAB25IS6WjM274.jpg', 'null', null, null);
INSERT INTO `order_item` VALUES ('201704025045880695', '148630639229938', '12047608109420037', '1', 'Apple iPhone 7 (A1660) 32G 黑色 移动联通电信4G手机', '519900', '519900', 'http://192.168.125.132/group1/M00/00/00/wKh9hFiMy4eAV5lwAAB25IS6WjM274.jpg', 'null', null, null);

-- ----------------------------
-- Table structure for transaction_message
-- ----------------------------
DROP TABLE IF EXISTS `transaction_message`;
CREATE TABLE `transaction_message` (
  `id` varchar(32) NOT NULL DEFAULT '' COMMENT '主键ID',
  `version` int(11) NOT NULL DEFAULT '0' COMMENT '版本号',
  `editor` varchar(100) DEFAULT NULL COMMENT '修改者',
  `creater` varchar(100) DEFAULT NULL COMMENT '创建者',
  `edit_time` datetime DEFAULT NULL COMMENT '最后修改时间',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `message_id` varchar(50) NOT NULL DEFAULT '' COMMENT '消息ID',
  `message_body` longtext NOT NULL COMMENT '消息内容',
  `message_data_type` varchar(50) DEFAULT NULL COMMENT '消息数据类型',
  `consumer_queue` varchar(100) NOT NULL DEFAULT '' COMMENT '消费队列',
  `message_send_times` smallint(6) NOT NULL DEFAULT '0' COMMENT '消息重发次数',
  `areadly_dead` varchar(20) NOT NULL DEFAULT '' COMMENT '是否死亡',
  `status` varchar(20) NOT NULL DEFAULT '' COMMENT '状态',
  `remark` varchar(200) DEFAULT NULL COMMENT '备注',
  `field1` varchar(200) DEFAULT NULL COMMENT '扩展字段1',
  `field2` varchar(200) DEFAULT NULL COMMENT '扩展字段2',
  `field3` varchar(200) DEFAULT NULL COMMENT '扩展字段3',
  `update_time` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `AK_Key_2` (`message_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of transaction_message
-- ----------------------------
