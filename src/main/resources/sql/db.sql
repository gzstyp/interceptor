/*
 Navicat Premium Data Transfer

 Source Server         : 123.57.215.3_12587
 Source Server Type    : MySQL
 Source Server Version : 80019
 Source Host           : 123.57.215.3:12587
 Source Schema         : jwt

 Target Server Type    : MySQL
 Target Server Version : 80019
 File Encoding         : 65001

 Date: 24/02/2020 03:14:50
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for sys_auth_filter
-- ----------------------------
DROP TABLE IF EXISTS `sys_auth_filter`;
CREATE TABLE `sys_auth_filter`  (
  `kid` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '主键',
  `url` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'url地址(唯一)',
  `permission` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '过滤器类型(具备的权限)',
  `sort_order` smallint(0) UNSIGNED NOT NULL COMMENT '排序',
  `remark` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`kid`) USING BTREE,
  UNIQUE INDEX `index_url`(`url`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = 'shiro的过滤器' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_auth_filter
-- ----------------------------
INSERT INTO `sys_auth_filter` VALUES ('0000000025d379a2ffffffffb2a5104f', '/error', 'anon', 4, '错误页|未登录或未授权的跳转的url');
INSERT INTO `sys_auth_filter` VALUES ('111fffffbd911aa0ffffffffd5637fff', '/images/**', 'anon', 11, '图片');
INSERT INTO `sys_auth_filter` VALUES ('111fffffd3d10c7400000000696dc111', '/user/authError', 'anon', 12, '认证错误提示');
INSERT INTO `sys_auth_filter` VALUES ('ffffffff8b81a680000000002065fa64', '\"\"', 'anon', 1, '首页');
INSERT INTO `sys_auth_filter` VALUES ('ffffffff9bfe2adf00000000339b9a0a', '/', 'anon', 2, '首页');
INSERT INTO `sys_auth_filter` VALUES ('ffffffffa04bd3da000000001490cc0e', '/login', 'anon', 5, '登录页面');
INSERT INTO `sys_auth_filter` VALUES ('ffffffffa73811e90000000040a506f9', '/user/login', 'anon', 6, '登录接口');
INSERT INTO `sys_auth_filter` VALUES ('ffffffffbd911aa0ffffffffd5637367', '/*.ico', 'anon', 7, '图标');
INSERT INTO `sys_auth_filter` VALUES ('ffffffffc527a3bcffffffffae55bbb5', '/index', 'anon', 3, '首页');
INSERT INTO `sys_auth_filter` VALUES ('ffffffffc5e3d2cbffffffffb6cb91d9', '/*.html', 'anon', 8, '静态页面');
INSERT INTO `sys_auth_filter` VALUES ('ffffffffc6bc47ec0000000075f2376b', '/css/**', 'anon', 9, 'css样式');
INSERT INTO `sys_auth_filter` VALUES ('ffffffffd3d10c7400000000696dcc08', '/js/**', 'anon', 10, 'js脚本');
INSERT INTO `sys_auth_filter` VALUES ('fffffffff3b5807e000000003f2ca237', '/**', 'authc', 88, '需要认证');

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu`  (
  `kid` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'id主键',
  `menu_name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '菜单名称',
  `url` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '菜单路径url',
  `flag` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '权限标识',
  PRIMARY KEY (`kid`) USING BTREE,
  UNIQUE INDEX `index_menu_flag`(`flag`) USING BTREE,
  UNIQUE INDEX `index_menu_url`(`url`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '菜单' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES ('00000000001290f20000000007f82b30', '添加', '/user/add', 'user:add');
INSERT INTO `sys_menu` VALUES ('000000004c5571bfffffffffebe10fd9', '删除', '/user/del', 'user:del');
INSERT INTO `sys_menu` VALUES ('ffffffff91ff5a0b0000000069fb007c', '部门组织', '/dep/list', 'dep:list');
INSERT INTO `sys_menu` VALUES ('ffffffffa409a9a40000000021676974', '首页', '/index', 'index');
INSERT INTO `sys_menu` VALUES ('ffffffffae19be8effffffffff1903eb', '编辑', '/user/edit', 'user:edit');
INSERT INTO `sys_menu` VALUES ('ffffffffc403c4eaffffffffbaf23dac', '菜单权限', '/menu/role', 'menu:role');
INSERT INTO `sys_menu` VALUES ('ffffffffd342cdd30000000043ffdff0', '系统账号', '/user/list', 'user:list');
INSERT INTO `sys_menu` VALUES ('ffffffffd9789089ffffffffd61b3d21', '角色管理', '/role/list', 'role:list');

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role`  (
  `kid` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'id主键',
  `name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '角色名称',
  PRIMARY KEY (`kid`) USING BTREE,
  UNIQUE INDEX `index_role_name`(`name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '角色' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES ('fffffffeb97ed04ffffffff8faaaaff1', 'hgl');
INSERT INTO `sys_role` VALUES ('ffffffffc403c4eaffffffffbaf23dac', '操作员');
INSERT INTO `sys_role` VALUES ('ffffffff8c468a55ffffffff8f59d635', '管理员');
INSERT INTO `sys_role` VALUES ('ffffffffae19be8effffffffff1903eb', '超级管理员');

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu`  (
  `kid` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'id主键',
  `role_id` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '角色的id(sys_role.kid)',
  `menu_id` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '菜单的id(sys_menu.kid)',
  PRIMARY KEY (`kid`) USING BTREE,
  INDEX `index_role_permission`(`role_id`, `menu_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '角色权限[菜单]' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES ('fff0000030832489ffffffff9bff12d1', 'fffffffeb97ed04ffffffff8faaaaff1', '00000000001290f20000000007f82b30');
INSERT INTO `sys_role_menu` VALUES ('ffffffffc403c4eaffffffffbaf23dac', 'ffffffff8c468a55ffffffff8f59d635', '00000000001290f20000000007f82b30');
INSERT INTO `sys_role_menu` VALUES ('ffffffffd9789089ffffffffd61b3d21', 'ffffffff8c468a55ffffffff8f59d635', '000000004c5571bfffffffffebe10fd9');
INSERT INTO `sys_role_menu` VALUES ('ffffffffa409a9a40000000021676974', 'ffffffff8c468a55ffffffff8f59d635', 'ffffffff91ff5a0b0000000069fb007c');
INSERT INTO `sys_role_menu` VALUES ('ffffffffd342cdd30000000043ffdff0', 'ffffffff8c468a55ffffffff8f59d635', 'ffffffffae19be8effffffffff1903eb');
INSERT INTO `sys_role_menu` VALUES ('0000000041995b09000000004f9b8132', 'ffffffffae19be8effffffffff1903eb', '00000000001290f20000000007f82b30');
INSERT INTO `sys_role_menu` VALUES ('00000000748004f10000000064dc0271', 'ffffffffae19be8effffffffff1903eb', '000000004c5571bfffffffffebe10fd9');
INSERT INTO `sys_role_menu` VALUES ('ffffffffae19be8effffffffff1903eb', 'ffffffffae19be8effffffffff1903eb', 'ffffffff91ff5a0b0000000069fb007c');
INSERT INTO `sys_role_menu` VALUES ('ffffffff91ff5a0b0000000069fb007c', 'ffffffffae19be8effffffffff1903eb', 'ffffffffa409a9a40000000021676974');
INSERT INTO `sys_role_menu` VALUES ('000000006d172f20000000000cbc04f6', 'ffffffffae19be8effffffffff1903eb', 'ffffffffae19be8effffffffff1903eb');
INSERT INTO `sys_role_menu` VALUES ('00000000001290f20000000007f82b30', 'ffffffffae19be8effffffffff1903eb', 'ffffffffc403c4eaffffffffbaf23dac');
INSERT INTO `sys_role_menu` VALUES ('0000000030832489ffffffff9bff12d5', 'ffffffffae19be8effffffffff1903eb', 'ffffffffd342cdd30000000043ffdff0');
INSERT INTO `sys_role_menu` VALUES ('00000000486c43f7000000003312108c', 'ffffffffae19be8effffffffff1903eb', 'ffffffffd9789089ffffffffd61b3d21');
INSERT INTO `sys_role_menu` VALUES ('0000000077ead031000000007cd02707', 'ffffffffc403c4eaffffffffbaf23dac', 'ffffffff91ff5a0b0000000069fb007c');
INSERT INTO `sys_role_menu` VALUES ('ffffffff8c468a55ffffffff8f59d635', 'ffffffffc403c4eaffffffffbaf23dac', 'ffffffffa409a9a40000000021676974');
INSERT INTO `sys_role_menu` VALUES ('fffffffff73049d4000000007230f548', 'ffffffffc403c4eaffffffffbaf23dac', 'ffffffffc403c4eaffffffffbaf23dac');
INSERT INTO `sys_role_menu` VALUES ('000000007c1ae3d30000000078922d7b', 'ffffffffc403c4eaffffffffbaf23dac', 'ffffffffd342cdd30000000043ffdff0');
INSERT INTO `sys_role_menu` VALUES ('000000004c5571bfffffffffebe10fd9', 'ffffffffc403c4eaffffffffbaf23dac', 'ffffffffd9789089ffffffffd61b3d21');

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`  (
  `kid` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'id主键',
  `user_name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户名|账号',
  `type` smallint(0) UNSIGNED NOT NULL DEFAULT 1 COMMENT '用户名|账号类型(1系统账号;2app账号)',
  PRIMARY KEY (`kid`) USING BTREE,
  UNIQUE INDEX `index_user_name`(`user_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES ('11ffffffeb97ed04ffffffff8faaaaff', 'hgl', 1);
INSERT INTO `sys_user` VALUES ('ffffffffaba5eb89fffffffffa7de8ea', 'typ', 1);
INSERT INTO `sys_user` VALUES ('ffffffffae19be8effffffffff1903eb', 'gzstyp', 1);
INSERT INTO `sys_user` VALUES ('ffffffffeb97ed04ffffffff8faaaa64', 'admin', 1);

-- ----------------------------
-- Table structure for sys_user_password
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_password`;
CREATE TABLE `sys_user_password`  (
  `user_id` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'user主键(sys_user.kid)',
  `user_password` char(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户账号密码',
  PRIMARY KEY (`user_id`) USING BTREE,
  UNIQUE INDEX `index_user_name`(`user_password`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户密码' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user_password
-- ----------------------------
INSERT INTO `sys_user_password` VALUES ('ffffffffaba5eb89fffffffffa7de8ea', '1ef17ff0e2ef0167ec1d9e36bd1c1bcb25855f94');
INSERT INTO `sys_user_password` VALUES ('11ffffffeb97ed04ffffffff8faaaaff', '241a655533d10d1f2d902072f758ca94927dd4bb');
INSERT INTO `sys_user_password` VALUES ('ffffffffeb97ed04ffffffff8faaaa64', '36b33b6d56dfcba5ed342f36d166680430ba8150');
INSERT INTO `sys_user_password` VALUES ('ffffffffae19be8effffffffff1903eb', '7902b095f08e11ef49ea08597a42b9b0af0516cc');

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role`  (
  `kid` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'id主键',
  `user_id` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户名|账号的id(sys_user.kid)',
  `role_id` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '角色的id(sys_role.kid)',
  PRIMARY KEY (`kid`) USING BTREE,
  UNIQUE INDEX `index_user_role`(`user_id`, `role_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户角色' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES ('00000000001290f20000000007f82b30', 'ffffffffaba5eb89fffffffffa7de8ea', 'ffffffffc403c4eaffffffffbaf23dac');
INSERT INTO `sys_user_role` VALUES ('0000000030832489ffffffff9bff12d5', 'ffffffffae19be8effffffffff1903eb', 'ffffffff8c468a55ffffffff8f59d635');
INSERT INTO `sys_user_role` VALUES ('ffffffffae19be8effffffffff1903eb', 'ffffffffeb97ed04ffffffff8faaaa64', 'ffffffff8c468a55ffffffff8f59d635');
INSERT INTO `sys_user_role` VALUES ('00000000486c43f7000000003312108c', 'ffffffffeb97ed04ffffffff8faaaa64', 'ffffffffae19be8effffffffff1903eb');
INSERT INTO `sys_user_role` VALUES ('ffffffffaba5eb89fffffffffa7de8ea', 'ffffffffeb97ed04ffffffff8faaaa64', 'ffffffffc403c4eaffffffffbaf23dac');

SET FOREIGN_KEY_CHECKS = 1;
