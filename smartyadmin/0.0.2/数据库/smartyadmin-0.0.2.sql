-- --------------------------------------------------------
-- 主机:                           127.0.0.1
-- 服务器版本:                        5.7.30-log - MySQL Community Server (GPL)
-- 服务器操作系统:                      Win64
-- HeidiSQL 版本:                  9.5.0.5196
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- 导出 smartyadmin 的数据库结构
CREATE DATABASE IF NOT EXISTS `smartyadmin` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;
USE `smartyadmin`;

-- 导出  表 smartyadmin.admin 结构
CREATE TABLE IF NOT EXISTS `admin` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL COMMENT '用户名',
  `avatar` varchar(255) NOT NULL DEFAULT '' COMMENT '头像',
  `gender` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '性别：0 未知，1 男，2 女',
  `password` varchar(255) NOT NULL COMMENT '密码',
  `auth_group_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '所属组',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '状态：1 正常，2 停用',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COMMENT='管理员表';

-- 正在导出表  smartyadmin.admin 的数据：~6 rows (大约)
/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
INSERT INTO `admin` (`id`, `name`, `avatar`, `gender`, `password`, `auth_group_id`, `status`, `create_time`, `update_time`) VALUES
	(1, 'admin', '', 0, '$2y$10$3RtE7uID0oX6kclR986EhuK5MKNROxv22JmC4G4SMtWyxq4veHh7u', 0, 1, '2021-01-19 10:41:42', '2021-01-19 10:42:48');
/*!40000 ALTER TABLE `admin` ENABLE KEYS */;

-- 导出  表 smartyadmin.auth_group 结构
CREATE TABLE IF NOT EXISTS `auth_group` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL COMMENT '组名',
  `pid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '上级角色',
  `rules` tinytext NOT NULL COMMENT '菜单规则id，多个逗号分隔',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '状态：1 正常，2 停用',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COMMENT='规则组表';


-- 导出  表 smartyadmin.auth_rule 结构
CREATE TABLE IF NOT EXISTS `auth_rule` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `url` varchar(255) DEFAULT NULL COMMENT '链接',
  `name` varchar(255) NOT NULL COMMENT '规则名',
  `icon` varchar(255) NOT NULL DEFAULT '' COMMENT '规则图标',
  `pid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '上级规则',
  `is_menu` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '是否为菜单：1 是，2 不是',
  `sort_num` int(10) unsigned NOT NULL DEFAULT '1' COMMENT '排序，越小则越靠前',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '状态：1 正常，2 停用',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `url` (`url`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COMMENT='规则表';

-- 正在导出表  smartyadmin.auth_rule 的数据：~21 rows (大约)
/*!40000 ALTER TABLE `auth_rule` DISABLE KEYS */;
INSERT INTO `auth_rule` (`id`, `url`, `name`, `icon`, `pid`, `is_menu`, `sort_num`, `status`, `create_time`, `update_time`) VALUES
	(1, 'admin/home', '控制台', 'fas fa-tachometer-alt', 0, 1, 1, 1, '2021-01-19 10:44:09', '2021-01-19 10:47:50'),
	(2, NULL, '常规管理', 'fas fa-cogs', 0, 1, 2, 1, '2021-01-19 10:45:37', '2021-01-19 10:46:04'),
	(3, 'admin/profile', '个人资料', 'fas fa-user-circle', 2, 1, 1, 1, '2021-01-19 10:46:47', '2021-01-19 10:48:02'),
	(4, 'log/index', '登录日志', 'fas fa-list-alt', 2, 1, 2, 1, '2021-01-19 10:47:19', '2021-01-19 10:49:09'),
	(5, NULL, '权限管理', 'fas fa-user-cog', 0, 1, 3, 1, '2021-01-19 10:49:32', '2021-01-19 10:49:40'),
	(6, 'admin/index', '管理员列表', 'fas fa-users', 5, 1, 1, 1, '2021-01-19 10:49:58', '2021-01-19 10:50:12'),
	(7, 'auth_group/index', '角色组', 'fas fa-users-cog', 5, 1, 2, 1, '2021-01-19 10:50:29', '2021-01-20 16:17:07'),
	(8, 'auth_rule/index', '菜单列表', 'fas fa-bars', 5, 1, 3, 1, '2021-01-19 10:50:48', '2021-01-21 11:34:36'),
	(9, 'admin/phpinfo', 'phpinfo()', '', 1, 2, 1, 1, '2021-01-19 10:52:18', '2021-01-19 10:52:36'),
	(10, 'admin/update_profile', '更新个人资料', '', 3, 2, 1, 1, '2021-01-19 10:53:03', '2021-01-19 10:53:12'),
	(11, 'admin/add', '添加', '', 6, 2, 1, 1, '2021-01-20 15:47:19', '2021-01-20 16:20:23'),
	(12, 'admin/edit', '编辑', '', 6, 2, 2, 1, '2021-01-20 15:48:12', '2021-01-20 16:20:25'),
	(13, 'admin/delete', '删除', '', 6, 2, 3, 1, '2021-01-20 15:48:28', '2021-01-20 16:20:27'),
	(14, 'auth_group/add', '添加', '', 7, 2, 1, 1, '2021-01-20 16:58:35', '2021-01-20 16:58:37'),
	(15, 'auth_group/edit', '编辑', '', 7, 2, 2, 1, '2021-01-20 16:58:58', '2021-01-20 16:58:58'),
	(16, 'auth_group/delete', '删除', '', 7, 2, 3, 1, '2021-01-20 16:59:21', '2021-01-20 16:59:21'),
	(17, 'auth_rule/add', '添加', '', 8, 2, 1, 1, '2021-01-21 11:35:01', '2021-01-21 11:35:01'),
	(18, 'auth_rule/edit', '编辑', '', 8, 2, 2, 1, '2021-01-21 11:35:31', '2021-01-21 11:35:31'),
	(19, 'auth_rule/delete', '删除', '', 8, 2, 3, 1, '2021-01-21 11:35:45', '2021-01-21 11:35:51');
/*!40000 ALTER TABLE `auth_rule` ENABLE KEYS */;

-- 导出  表 smartyadmin.login_log 结构
CREATE TABLE IF NOT EXISTS `login_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `admin_id` int(10) unsigned NOT NULL COMMENT '管理员id',
  `ip` varchar(255) NOT NULL COMMENT '登录IP',
  `user_agent` varchar(255) NOT NULL COMMENT '浏览器user agent',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '状态：1 成功，2 失败',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COMMENT='登录日志表';