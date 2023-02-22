/*
Navicat MySQL Data Transfer

Source Server         : java_web
Source Server Version : 80028
Source Host           : localhost:3306
Source Database       : malldatabase

Target Server Type    : MYSQL
Target Server Version : 80028
File Encoding         : 65001

Date: 2022-08-26 11:07:00
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for auth_group
-- ----------------------------
DROP TABLE IF EXISTS `auth_group`;
CREATE TABLE `auth_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Records of auth_group
-- ----------------------------

-- ----------------------------
-- Table structure for auth_group_permissions
-- ----------------------------
DROP TABLE IF EXISTS `auth_group_permissions`;
CREATE TABLE `auth_group_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Records of auth_group_permissions
-- ----------------------------

-- ----------------------------
-- Table structure for auth_permission
-- ----------------------------
DROP TABLE IF EXISTS `auth_permission`;
CREATE TABLE `auth_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Records of auth_permission
-- ----------------------------
INSERT INTO `auth_permission` VALUES ('1', 'Can add log entry', '1', 'add_logentry');
INSERT INTO `auth_permission` VALUES ('2', 'Can change log entry', '1', 'change_logentry');
INSERT INTO `auth_permission` VALUES ('3', 'Can delete log entry', '1', 'delete_logentry');
INSERT INTO `auth_permission` VALUES ('4', 'Can view log entry', '1', 'view_logentry');
INSERT INTO `auth_permission` VALUES ('5', 'Can add permission', '2', 'add_permission');
INSERT INTO `auth_permission` VALUES ('6', 'Can change permission', '2', 'change_permission');
INSERT INTO `auth_permission` VALUES ('7', 'Can delete permission', '2', 'delete_permission');
INSERT INTO `auth_permission` VALUES ('8', 'Can view permission', '2', 'view_permission');
INSERT INTO `auth_permission` VALUES ('9', 'Can add group', '3', 'add_group');
INSERT INTO `auth_permission` VALUES ('10', 'Can change group', '3', 'change_group');
INSERT INTO `auth_permission` VALUES ('11', 'Can delete group', '3', 'delete_group');
INSERT INTO `auth_permission` VALUES ('12', 'Can view group', '3', 'view_group');
INSERT INTO `auth_permission` VALUES ('13', 'Can add user', '4', 'add_user');
INSERT INTO `auth_permission` VALUES ('14', 'Can change user', '4', 'change_user');
INSERT INTO `auth_permission` VALUES ('15', 'Can delete user', '4', 'delete_user');
INSERT INTO `auth_permission` VALUES ('16', 'Can view user', '4', 'view_user');
INSERT INTO `auth_permission` VALUES ('17', 'Can add content type', '5', 'add_contenttype');
INSERT INTO `auth_permission` VALUES ('18', 'Can change content type', '5', 'change_contenttype');
INSERT INTO `auth_permission` VALUES ('19', 'Can delete content type', '5', 'delete_contenttype');
INSERT INTO `auth_permission` VALUES ('20', 'Can view content type', '5', 'view_contenttype');
INSERT INTO `auth_permission` VALUES ('21', 'Can add session', '6', 'add_session');
INSERT INTO `auth_permission` VALUES ('22', 'Can change session', '6', 'change_session');
INSERT INTO `auth_permission` VALUES ('23', 'Can delete session', '6', 'delete_session');
INSERT INTO `auth_permission` VALUES ('24', 'Can view session', '6', 'view_session');
INSERT INTO `auth_permission` VALUES ('25', 'Can add goods', '7', 'add_goods');
INSERT INTO `auth_permission` VALUES ('26', 'Can change goods', '7', 'change_goods');
INSERT INTO `auth_permission` VALUES ('27', 'Can delete goods', '7', 'delete_goods');
INSERT INTO `auth_permission` VALUES ('28', 'Can view goods', '7', 'view_goods');
INSERT INTO `auth_permission` VALUES ('29', 'Can add image', '8', 'add_image');
INSERT INTO `auth_permission` VALUES ('30', 'Can change image', '8', 'change_image');
INSERT INTO `auth_permission` VALUES ('31', 'Can delete image', '8', 'delete_image');
INSERT INTO `auth_permission` VALUES ('32', 'Can view image', '8', 'view_image');
INSERT INTO `auth_permission` VALUES ('33', 'Can add item', '9', 'add_item');
INSERT INTO `auth_permission` VALUES ('34', 'Can change item', '9', 'change_item');
INSERT INTO `auth_permission` VALUES ('35', 'Can delete item', '9', 'delete_item');
INSERT INTO `auth_permission` VALUES ('36', 'Can view item', '9', 'view_item');
INSERT INTO `auth_permission` VALUES ('37', 'Can add user', '10', 'add_user');
INSERT INTO `auth_permission` VALUES ('38', 'Can change user', '10', 'change_user');
INSERT INTO `auth_permission` VALUES ('39', 'Can delete user', '10', 'delete_user');
INSERT INTO `auth_permission` VALUES ('40', 'Can view user', '10', 'view_user');
INSERT INTO `auth_permission` VALUES ('41', 'Can add item_ goods', '11', 'add_item_goods');
INSERT INTO `auth_permission` VALUES ('42', 'Can change item_ goods', '11', 'change_item_goods');
INSERT INTO `auth_permission` VALUES ('43', 'Can delete item_ goods', '11', 'delete_item_goods');
INSERT INTO `auth_permission` VALUES ('44', 'Can view item_ goods', '11', 'view_item_goods');
INSERT INTO `auth_permission` VALUES ('45', 'Can add address', '12', 'add_address');
INSERT INTO `auth_permission` VALUES ('46', 'Can change address', '12', 'change_address');
INSERT INTO `auth_permission` VALUES ('47', 'Can delete address', '12', 'delete_address');
INSERT INTO `auth_permission` VALUES ('48', 'Can view address', '12', 'view_address');
INSERT INTO `auth_permission` VALUES ('49', 'Can add remark', '13', 'add_remark');
INSERT INTO `auth_permission` VALUES ('50', 'Can change remark', '13', 'change_remark');
INSERT INTO `auth_permission` VALUES ('51', 'Can delete remark', '13', 'delete_remark');
INSERT INTO `auth_permission` VALUES ('52', 'Can view remark', '13', 'view_remark');

-- ----------------------------
-- Table structure for auth_user
-- ----------------------------
DROP TABLE IF EXISTS `auth_user`;
CREATE TABLE `auth_user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Records of auth_user
-- ----------------------------

-- ----------------------------
-- Table structure for auth_user_groups
-- ----------------------------
DROP TABLE IF EXISTS `auth_user_groups`;
CREATE TABLE `auth_user_groups` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Records of auth_user_groups
-- ----------------------------

-- ----------------------------
-- Table structure for auth_user_user_permissions
-- ----------------------------
DROP TABLE IF EXISTS `auth_user_user_permissions`;
CREATE TABLE `auth_user_user_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Records of auth_user_user_permissions
-- ----------------------------

-- ----------------------------
-- Table structure for django_admin_log
-- ----------------------------
DROP TABLE IF EXISTS `django_admin_log`;
CREATE TABLE `django_admin_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `django_admin_log_chk_1` CHECK ((`action_flag` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Records of django_admin_log
-- ----------------------------

-- ----------------------------
-- Table structure for django_content_type
-- ----------------------------
DROP TABLE IF EXISTS `django_content_type`;
CREATE TABLE `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Records of django_content_type
-- ----------------------------
INSERT INTO `django_content_type` VALUES ('1', 'admin', 'logentry');
INSERT INTO `django_content_type` VALUES ('3', 'auth', 'group');
INSERT INTO `django_content_type` VALUES ('2', 'auth', 'permission');
INSERT INTO `django_content_type` VALUES ('4', 'auth', 'user');
INSERT INTO `django_content_type` VALUES ('5', 'contenttypes', 'contenttype');
INSERT INTO `django_content_type` VALUES ('12', 'Mall', 'address');
INSERT INTO `django_content_type` VALUES ('7', 'Mall', 'goods');
INSERT INTO `django_content_type` VALUES ('8', 'Mall', 'image');
INSERT INTO `django_content_type` VALUES ('9', 'Mall', 'item');
INSERT INTO `django_content_type` VALUES ('11', 'Mall', 'item_goods');
INSERT INTO `django_content_type` VALUES ('13', 'Mall', 'remark');
INSERT INTO `django_content_type` VALUES ('10', 'Mall', 'user');
INSERT INTO `django_content_type` VALUES ('6', 'sessions', 'session');

-- ----------------------------
-- Table structure for django_migrations
-- ----------------------------
DROP TABLE IF EXISTS `django_migrations`;
CREATE TABLE `django_migrations` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Records of django_migrations
-- ----------------------------
INSERT INTO `django_migrations` VALUES ('1', 'contenttypes', '0001_initial', '2022-08-21 12:48:27.582980');
INSERT INTO `django_migrations` VALUES ('2', 'auth', '0001_initial', '2022-08-21 12:48:36.150775');
INSERT INTO `django_migrations` VALUES ('3', 'admin', '0001_initial', '2022-08-21 12:48:38.324970');
INSERT INTO `django_migrations` VALUES ('4', 'admin', '0002_logentry_remove_auto_add', '2022-08-21 12:48:38.390152');
INSERT INTO `django_migrations` VALUES ('5', 'admin', '0003_logentry_add_action_flag_choices', '2022-08-21 12:48:38.462983');
INSERT INTO `django_migrations` VALUES ('6', 'contenttypes', '0002_remove_content_type_name', '2022-08-21 12:48:39.798052');
INSERT INTO `django_migrations` VALUES ('7', 'auth', '0002_alter_permission_name_max_length', '2022-08-21 12:48:40.670628');
INSERT INTO `django_migrations` VALUES ('8', 'auth', '0003_alter_user_email_max_length', '2022-08-21 12:48:41.468305');
INSERT INTO `django_migrations` VALUES ('9', 'auth', '0004_alter_user_username_opts', '2022-08-21 12:48:41.532875');
INSERT INTO `django_migrations` VALUES ('10', 'auth', '0005_alter_user_last_login_null', '2022-08-21 12:48:42.300840');
INSERT INTO `django_migrations` VALUES ('11', 'auth', '0006_require_contenttypes_0002', '2022-08-21 12:48:42.359795');
INSERT INTO `django_migrations` VALUES ('12', 'auth', '0007_alter_validators_add_error_messages', '2022-08-21 12:48:42.413263');
INSERT INTO `django_migrations` VALUES ('13', 'auth', '0008_alter_user_username_max_length', '2022-08-21 12:48:43.385294');
INSERT INTO `django_migrations` VALUES ('14', 'auth', '0009_alter_user_last_name_max_length', '2022-08-21 12:48:44.182244');
INSERT INTO `django_migrations` VALUES ('15', 'auth', '0010_alter_group_name_max_length', '2022-08-21 12:48:45.042962');
INSERT INTO `django_migrations` VALUES ('16', 'auth', '0011_update_proxy_permissions', '2022-08-21 12:48:45.107939');
INSERT INTO `django_migrations` VALUES ('17', 'auth', '0012_alter_user_first_name_max_length', '2022-08-21 12:48:45.975104');
INSERT INTO `django_migrations` VALUES ('18', 'Mall', '0001_initial', '2022-08-21 12:48:51.463163');
INSERT INTO `django_migrations` VALUES ('19', 'sessions', '0001_initial', '2022-08-21 12:48:52.138663');
INSERT INTO `django_migrations` VALUES ('20', 'Mall', '0002_auto_20220821_2058', '2022-08-21 12:58:41.146775');
INSERT INTO `django_migrations` VALUES ('21', 'Mall', '0003_auto_20220822_1308', '2022-08-22 05:08:37.875941');
INSERT INTO `django_migrations` VALUES ('22', 'Mall', '0004_remark', '2022-08-25 09:03:19.754084');

-- ----------------------------
-- Table structure for django_session
-- ----------------------------
DROP TABLE IF EXISTS `django_session`;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Records of django_session
-- ----------------------------

-- ----------------------------
-- Table structure for mall_address
-- ----------------------------
DROP TABLE IF EXISTS `mall_address`;
CREATE TABLE `mall_address` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `receiver` varchar(20) NOT NULL,
  `tel` varchar(15) NOT NULL,
  `zipCode` varchar(20) NOT NULL,
  `userID_id` int NOT NULL,
  `city` varchar(20) NOT NULL,
  `detail` varchar(100) NOT NULL,
  `province` varchar(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `Mall_address_userID_id_819fe190_fk_Mall_user_userID` (`userID_id`),
  CONSTRAINT `Mall_address_userID_id_819fe190_fk_Mall_user_userID` FOREIGN KEY (`userID_id`) REFERENCES `mall_user` (`userID`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Records of mall_address
-- ----------------------------
INSERT INTO `mall_address` VALUES ('1', '123', '213', '123', '1', '', '', '');
INSERT INTO `mall_address` VALUES ('2', '123', '123', '123', '1', '', '', '');
INSERT INTO `mall_address` VALUES ('9', '开封菜', '4008823823', '266000', '5', '青岛', '中国海洋大学崂山校区', '山东');
INSERT INTO `mall_address` VALUES ('10', 'haha', '234', '234', '5', '123', '123', '234');
INSERT INTO `mall_address` VALUES ('12', 'lalala', '123', '123', '5', 'b', 'c', 'a');

-- ----------------------------
-- Table structure for mall_goods
-- ----------------------------
DROP TABLE IF EXISTS `mall_goods`;
CREATE TABLE `mall_goods` (
  `goodsID` int NOT NULL AUTO_INCREMENT,
  `goodsName` varchar(100) NOT NULL,
  `modelNum` varchar(100) NOT NULL,
  `price` double NOT NULL,
  `description` varchar(1000) NOT NULL,
  `url` varchar(1000) NOT NULL,
  PRIMARY KEY (`goodsID`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Records of mall_goods
-- ----------------------------
INSERT INTO `mall_goods` VALUES ('1', '拯救者 R7000 15.6英寸游戏笔记本 幻影黑', '拯救者 R7000', '5999', 'AMD Ryzen 5 5600H/Windows 11 家庭中文版/15.6英寸/16G/512G SSD/ GeForce RTX 3050 4G独显/幻影黑', 'http://localhost:8000/media/Goods/1.jpg');
INSERT INTO `mall_goods` VALUES ('2', '021款 小新 Pro 16 锐龙版16.0英寸全面屏轻薄笔记本 深空灰', '小新 Pro 16', '6999', 'AMD Ryzen 7 5800H/Windows 11 家庭中文版/16.0英寸/16GB/512G SSD/Geforce RTX 3050 4G独显/深空灰', 'http://localhost:8000/media/Goods/2.jpg');
INSERT INTO `mall_goods` VALUES ('3', '小新 Air 14 2021酷睿版 14.0英寸全面屏轻薄笔记本电脑 亮银', '小新 Air 14', '4399', '第11代英特尔酷睿i5-1155G7/Windows 11 家庭中文版/14.0英寸/16G/512G SSD/集成显卡/亮银', 'http://localhost:8000/media/Goods/3.jpg');
INSERT INTO `mall_goods` VALUES ('4', 'YOGA 13s 2021款 锐龙版 13.3英寸全面屏超轻薄笔记本电脑 深灰色', 'YOGA 13s', '4799', 'AMD Ryzen5 5600U/Windows 11 家庭中文版/13.3英寸/16GB/512G SSD/集成显卡/深灰色', 'http://localhost:8000/media/Goods/4.jpg');
INSERT INTO `mall_goods` VALUES ('5', '小新 Air14Plus 2021 14.0英寸全面屏轻薄笔记本电脑 深空灰', '小新 Air14Plus', '4999', '第11代英特尔酷睿标压i5-11320H/Windows 11 家庭中文版/14.0英寸/16GB/512G SSD/2.8K 90Hz 低蓝光护眼/集成显卡/亮银', 'http://localhost:8000/media/Goods/5.jpg');
INSERT INTO `mall_goods` VALUES ('6', '联想小新 Pro14 英特尔Evo平台 超能轻薄本酷睿i5笔记本电脑 亮银', '小新 Pro14', '5299', '第11代英特尔酷睿标压i5-11320H/Windows 11 家庭中文版/14.0英寸/16GB/512G SSD/2.8K 90Hz 低蓝光护眼/集成显卡/亮银', 'http://localhost:8000/media/Goods/6.jpg');
INSERT INTO `mall_goods` VALUES ('7', '拯救者 Y7000P 2021款 英特尔酷睿i5 15.6英寸游戏笔记本 幻影黑', '拯救者 Y7000P', '7899', '第11代英特尔®酷睿™i5-11400H/Windows 10 家庭中文版/15.6英寸/16G/512G SSD/ GeForce RTX™ 3050Ti 4G独显/幻影黑【win10/win11随机发货】', 'http://localhost:8000/media/Goods/7.jpg');
INSERT INTO `mall_goods` VALUES ('8', 'YOGA 14c 2021款 锐龙版 14英寸全面屏超轻薄笔记本电脑 深空灰', 'YOGA 14c', '5999', 'AMD Ryzen 7 5800U/Windows 11 家庭中文版/14.0英寸/16G/512G SSD/集成显卡/深空灰', 'http://localhost:8000/media/Goods/8.jpg');
INSERT INTO `mall_goods` VALUES ('9', 'ideapad 14s 英特尔酷睿i3 14.0英寸笔记本 银色', 'ideapad 14s', '3199', '第十代英特尔酷睿i3-1005G1/Windows 11 家庭中文版/14.0英寸/8G/512G SSD/集成显卡/银色', 'http://localhost:8000/media/Goods/9.jpg');

-- ----------------------------
-- Table structure for mall_item
-- ----------------------------
DROP TABLE IF EXISTS `mall_item`;
CREATE TABLE `mall_item` (
  `addressID` int NOT NULL,
  `itemID` int NOT NULL AUTO_INCREMENT,
  `payment` double NOT NULL,
  `status` varchar(9) NOT NULL,
  `userID_id` int NOT NULL,
  PRIMARY KEY (`itemID`),
  KEY `Mall_item_userID_id_e4a392a9_fk_Mall_user_userID` (`userID_id`),
  CONSTRAINT `Mall_item_userID_id_e4a392a9_fk_Mall_user_userID` FOREIGN KEY (`userID_id`) REFERENCES `mall_user` (`userID`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Records of mall_item
-- ----------------------------
INSERT INTO `mall_item` VALUES ('9', '10', '12998', 'finishing', '5');
INSERT INTO `mall_item` VALUES ('9', '11', '12998', 'pending', '5');
INSERT INTO `mall_item` VALUES ('9', '14', '11998', 'pending', '5');
INSERT INTO `mall_item` VALUES ('12', '15', '44790', 'pending', '5');
INSERT INTO `mall_item` VALUES ('9', '16', '5999', 'pending', '5');

-- ----------------------------
-- Table structure for mall_item_goods
-- ----------------------------
DROP TABLE IF EXISTS `mall_item_goods`;
CREATE TABLE `mall_item_goods` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `total` int NOT NULL,
  `goodsID_id` int NOT NULL,
  `itemID_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `Mall_item_good_goodsID_id_0a3644ab_fk_ovolenMal` (`goodsID_id`),
  KEY `Mall_item_good_itemID_id_ed19df5e_fk_ovolenMal` (`itemID_id`),
  CONSTRAINT `Mall_item_good_goodsID_id_0a3644ab_fk_ovolenMal` FOREIGN KEY (`goodsID_id`) REFERENCES `mall_goods` (`goodsID`),
  CONSTRAINT `Mall_item_good_itemID_id_ed19df5e_fk_ovolenMal` FOREIGN KEY (`itemID_id`) REFERENCES `mall_item` (`itemID`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Records of mall_item_goods
-- ----------------------------
INSERT INTO `mall_item_goods` VALUES ('12', '1', '1', '10');
INSERT INTO `mall_item_goods` VALUES ('13', '1', '2', '10');
INSERT INTO `mall_item_goods` VALUES ('14', '1', '2', '11');
INSERT INTO `mall_item_goods` VALUES ('15', '1', '1', '11');
INSERT INTO `mall_item_goods` VALUES ('18', '2', '1', '14');
INSERT INTO `mall_item_goods` VALUES ('19', '8', '3', '15');
INSERT INTO `mall_item_goods` VALUES ('20', '2', '4', '15');
INSERT INTO `mall_item_goods` VALUES ('21', '1', '1', '16');

-- ----------------------------
-- Table structure for mall_remark
-- ----------------------------
DROP TABLE IF EXISTS `mall_remark`;
CREATE TABLE `mall_remark` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `rate` int NOT NULL,
  `content` varchar(1000) NOT NULL,
  `goodsID_id` int NOT NULL,
  `userID_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `Mall_remark_goodsID_id_636cb8a2_fk_ovolenMal` (`goodsID_id`),
  KEY `Mall_remark_userID_id_3f517853_fk_Mall_user_userID` (`userID_id`),
  CONSTRAINT `Mall_remark_goodsID_id_636cb8a2_fk_ovolenMal` FOREIGN KEY (`goodsID_id`) REFERENCES `mall_goods` (`goodsID`),
  CONSTRAINT `Mall_remark_userID_id_3f517853_fk_Mall_user_userID` FOREIGN KEY (`userID_id`) REFERENCES `mall_user` (`userID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Records of mall_remark
-- ----------------------------
INSERT INTO `mall_remark` VALUES ('1', '1', '非常好的电脑，爱来自CN', '1', '5');
INSERT INTO `mall_remark` VALUES ('2', '5', '默认好评！', '1', '5');
INSERT INTO `mall_remark` VALUES ('3', '3', 'hahahshahs', '1', '5');
INSERT INTO `mall_remark` VALUES ('4', '5', '666666', '1', '5');

-- ----------------------------
-- Table structure for mall_user
-- ----------------------------
DROP TABLE IF EXISTS `mall_user`;
CREATE TABLE `mall_user` (
  `username` varchar(15) NOT NULL,
  `pwd` varchar(20) NOT NULL,
  `tel` varchar(15) NOT NULL,
  `userID` int NOT NULL AUTO_INCREMENT,
  `email` varchar(30) NOT NULL,
  `sex` varchar(7) NOT NULL,
  `balance` double NOT NULL,
  `url` varchar(1000) NOT NULL,
  PRIMARY KEY (`userID`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Records of mall_user
-- ----------------------------
INSERT INTO `mall_user` VALUES ('abc', '123', '123', '1', 'abc', '', '0', '');
INSERT INTO `mall_user` VALUES ('fs', '123', '123', '2', 'furthersky', '', '0', '');
INSERT INTO `mall_user` VALUES ('zz', '123', '123', '3', 'zz', '', '0', '');
INSERT INTO `mall_user` VALUES ('qq', '123', '123', '4', 'qq', '', '0', '');
INSERT INTO `mall_user` VALUES ('heimiao', '1', '1', '5', '1', 'male', '68773', 'http://localhost:8000/media/Avatar/5QQ图片20220809234759.jpg');
