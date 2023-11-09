/*
 Navicat MySQL Data Transfer

 Source Server         : java EE
 Source Server Type    : MySQL
 Source Server Version : 50528
 Source Host           : localhost:3306
 Source Schema         : wms

 Target Server Type    : MySQL
 Target Server Version : 50528
 File Encoding         : 65001

 Date: 09/11/2023 01:13:31
*/

SET NAMES utf8mb4;
SET
FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for goods
-- ----------------------------
DROP TABLE IF EXISTS `goods`;
CREATE TABLE `goods`
(
    `id`        int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
    `name`      varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '货名',
    `storage`   int(11) NOT NULL COMMENT '仓库',
    `goodsType` int(11) NOT NULL COMMENT '分类',
    `count`     int(11) NULL DEFAULT NULL COMMENT '数量',
    `remark`    varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of goods
-- ----------------------------
INSERT INTO `goods`
VALUES (1, '足球', 1, 3, 25, '好踢的足球');
INSERT INTO `goods`
VALUES (2, '篮球', 1, 3, 20, '好蹦的篮球');
INSERT INTO `goods`
VALUES (3, '果冻', 1, 1, 1084, '好吃的果冻');
INSERT INTO `goods`
VALUES (4, '座椅', 2, 2, 51, '舒适的座椅');

-- ----------------------------
-- Table structure for goodstype
-- ----------------------------
DROP TABLE IF EXISTS `goodstype`;
CREATE TABLE `goodstype`
(
    `id`     int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
    `name`   varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '分类名',
    `remark` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of goodstype
-- ----------------------------
INSERT INTO `goodstype`
VALUES (1, '食品类', '好吃的食品');
INSERT INTO `goodstype`
VALUES (2, '家具类', '优雅的家具');
INSERT INTO `goodstype`
VALUES (3, '文体类', '舒适的用品\n');

-- ----------------------------
-- Table structure for menu
-- ----------------------------
DROP TABLE IF EXISTS `menu`;
CREATE TABLE `menu`
(
    `id`             int(11) NOT NULL,
    `menuCode`       varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '菜单编码',
    `menuName`       varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '菜单名字',
    `menuLevel`      varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '菜单级别',
    `menuParentCode` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '菜单的父code',
    `menuClick`      varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '点击触发的函数',
    `menuRight`      varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '权限 0超级管理员，1表示管理员，2表示普通用户，可以用逗号组合使用',
    `menuComponent`  varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
    `menuIcon`       varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of menu
-- ----------------------------
INSERT INTO `menu`
VALUES (1, '001', '管理员管理', '1', NULL, 'Admin', '0', 'admin/AdminManage.vue', 'el-icon-s-custom');
INSERT INTO `menu`
VALUES (2, '002', '用户管理', '1', NULL, 'User', '0,1', 'user/UserManage.vue', 'el-icon-user-solid');
INSERT INTO `menu`
VALUES (3, '003', '仓库管理', '1', NULL, 'Storage', '0,1', 'storage/StorageManage', 'el-icon-office-building');
INSERT INTO `menu`
VALUES (4, '004', '物品分类管理', '1', NULL, 'Goodstype', '0,1', 'goodstype/GoodstypeManage', 'el-icon-menu');
INSERT INTO `menu`
VALUES (5, '005', '物品管理 ', '1', NULL, 'Goods', '0,1,2', 'goods/GoodsManage', 'el-icon-s-management');
INSERT INTO `menu`
VALUES (6, '006', '记录管理', '1', NULL, 'Record', '0,1,2', 'record/RecordManage', 'el-icon-s-order');

-- ----------------------------
-- Table structure for record
-- ----------------------------
DROP TABLE IF EXISTS `record`;
CREATE TABLE `record`
(
    `id`         int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
    `goods`      int(11) NOT NULL COMMENT '货品id',
    `userId`     int(11) NULL DEFAULT NULL COMMENT '取货人/补货人',
    `admin_id`   int(11) NULL DEFAULT NULL COMMENT '操作人id',
    `count`      int(11) NULL DEFAULT NULL COMMENT '数量',
    `createtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    `remark`     varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of record
-- ----------------------------
INSERT INTO `record`
VALUES (1, 4, 5, 1, 50, '2022-11-01 12:07:25', '管家常备');
INSERT INTO `record`
VALUES (2, 3, 4, 1, 999, '2022-11-01 12:08:09', '钞能力');
INSERT INTO `record`
VALUES (3, 3, 5, 1, -10, '2022-11-01 12:08:28', '蓝瓶的');
INSERT INTO `record`
VALUES (4, 3, 5, 3, -1, '2022-11-01 12:09:14', '果然好吃--jerry');
INSERT INTO `record`
VALUES (5, 3, 5, 2, -3, '2022-11-01 12:11:03', 'jerry说的没错，果然好吃');

-- ----------------------------
-- Table structure for storage
-- ----------------------------
DROP TABLE IF EXISTS `storage`;
CREATE TABLE `storage`
(
    `id`     int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
    `name`   varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '仓库名',
    `remark` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of storage
-- ----------------------------
INSERT INTO `storage`
VALUES (1, '仓库1', '小仓库');
INSERT INTO `storage`
VALUES (2, '仓库2', '大仓库');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`
(
    `id`       int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
    `no`       varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '账号',
    `name`     varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '名字',
    `password` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci  NOT NULL COMMENT '密码',
    `age`      int(11) NULL DEFAULT NULL,
    `sex`      int(11) NULL DEFAULT NULL COMMENT '性别',
    `phone`    varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '电话',
    `role_id`  int(11) NULL DEFAULT NULL COMMENT '角色 0超级管理员, 1管理员, 2普通账号',
    `isValid`  varchar(4) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'Y' COMMENT '是否有效, Y有效, 其他无效',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user`
VALUES (1, 'admin', '超级管理员', '123', 18, 1, '111', 0, 'Y');
INSERT INTO `user`
VALUES (2, 'tom', 'tom', 'tom', 20, 0, '00000000', 1, 'Y');
INSERT INTO `user`
VALUES (3, 'jerry', 'jerry', 'jerry', 19, 1, '11111111', 1, 'Y');
INSERT INTO `user`
VALUES (4, 'Batman', 'Bruce Wayne', 'Batman', 22, 1, '22222222', 2, 'Y');
INSERT INTO `user`
VALUES (5, 'Housekeeper', 'Alfred Pennyworth', '123456', 40, 0, '', 2, 'Y');

SET
FOREIGN_KEY_CHECKS = 1;
