-- phpMyAdmin SQL Dump
-- version 4.6.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: 2016-10-20 05:24:25
-- 服务器版本： 5.7.14
-- PHP Version: 5.6.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `dmt`
--
CREATE DATABASE IF NOT EXISTS `dmt` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `dmt`;

-- --------------------------------------------------------

--
-- 表的结构 `dmt_ad`
--

DROP TABLE IF EXISTS `dmt_ad`;
CREATE TABLE `dmt_ad` (
  `ad_id` bigint(20) NOT NULL COMMENT '广告id',
  `ad_name` varchar(255) NOT NULL COMMENT '广告名称',
  `ad_content` text COMMENT '广告内容',
  `status` int(2) NOT NULL DEFAULT '1' COMMENT '状态，1显示，0不显示'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `dmt_asset`
--

DROP TABLE IF EXISTS `dmt_asset`;
CREATE TABLE `dmt_asset` (
  `aid` bigint(20) NOT NULL,
  `uid` int(11) NOT NULL DEFAULT '0' COMMENT '用户 id',
  `key` varchar(50) NOT NULL COMMENT '资源 key',
  `filename` varchar(50) DEFAULT NULL COMMENT '文件名',
  `filesize` int(11) DEFAULT NULL COMMENT '文件大小,单位Byte',
  `filepath` varchar(200) NOT NULL COMMENT '文件路径，相对于 upload 目录，可以为 url',
  `uploadtime` int(11) NOT NULL COMMENT '上传时间',
  `status` int(2) NOT NULL DEFAULT '1' COMMENT '状态，1：可用，0：删除，不可用',
  `meta` text COMMENT '其它详细信息，JSON格式',
  `suffix` varchar(50) DEFAULT NULL COMMENT '文件后缀名，不包括点',
  `download_times` int(11) NOT NULL DEFAULT '0' COMMENT '下载次数'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='资源表';

-- --------------------------------------------------------

--
-- 表的结构 `dmt_auth_access`
--

DROP TABLE IF EXISTS `dmt_auth_access`;
CREATE TABLE `dmt_auth_access` (
  `role_id` mediumint(8) UNSIGNED NOT NULL COMMENT '角色',
  `rule_name` varchar(255) NOT NULL COMMENT '规则唯一英文标识,全小写',
  `type` varchar(30) DEFAULT NULL COMMENT '权限规则分类，请加应用前缀,如admin_'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='权限授权表';

--
-- 转存表中的数据 `dmt_auth_access`
--

INSERT INTO `dmt_auth_access` (`role_id`, `rule_name`, `type`) VALUES
(2, 'portal/adminpost/index', 'admin_url'),
(2, 'comment/commentadmin/check', 'admin_url'),
(2, 'comment/commentadmin/delete', 'admin_url'),
(2, 'comment/commentadmin/index', 'admin_url'),
(2, 'api/guestbookadmin/delete', 'admin_url'),
(2, 'api/guestbookadmin/index', 'admin_url'),
(2, 'admin/content/default', 'admin_url'),
(2, 'portal/adminpost/listorders', 'admin_url'),
(2, 'portal/adminpost/top', 'admin_url'),
(2, 'portal/adminpost/recommend', 'admin_url'),
(2, 'portal/adminpost/move', 'admin_url'),
(2, 'portal/adminpost/check', 'admin_url'),
(2, 'portal/adminpost/delete', 'admin_url'),
(2, 'portal/adminpost/edit', 'admin_url'),
(2, 'portal/adminpost/edit_post', 'admin_url'),
(2, 'portal/adminpost/add', 'admin_url'),
(2, 'portal/adminpost/add_post', 'admin_url'),
(2, 'portal/adminpost/copy', 'admin_url'),
(2, 'portal/adminterm/index', 'admin_url'),
(2, 'portal/adminterm/listorders', 'admin_url'),
(2, 'portal/adminterm/delete', 'admin_url'),
(2, 'portal/adminterm/edit', 'admin_url'),
(2, 'portal/adminterm/edit_post', 'admin_url'),
(2, 'portal/adminterm/add', 'admin_url'),
(2, 'portal/adminterm/add_post', 'admin_url'),
(2, 'portal/adminpage/index', 'admin_url'),
(2, 'portal/adminpage/listorders', 'admin_url'),
(2, 'portal/adminpage/delete', 'admin_url'),
(2, 'portal/adminpage/edit', 'admin_url'),
(2, 'portal/adminpage/edit_post', 'admin_url'),
(2, 'portal/adminpage/add', 'admin_url'),
(2, 'portal/adminpage/add_post', 'admin_url'),
(2, 'admin/recycle/default', 'admin_url'),
(2, 'portal/adminpost/recyclebin', 'admin_url'),
(2, 'portal/adminpost/restore', 'admin_url'),
(2, 'portal/adminpost/clean', 'admin_url'),
(2, 'portal/adminpage/recyclebin', 'admin_url'),
(2, 'portal/adminpage/clean', 'admin_url'),
(2, 'portal/adminpage/restore', 'admin_url'),
(2, 'multimedia/default/default', 'admin_url'),
(2, 'multimedia/campus/index', 'admin_url'),
(2, 'multimedia/building/index', 'admin_url'),
(2, 'multimedia/device/index', 'admin_url'),
(2, 'multimedia/orders/default', 'admin_url'),
(2, 'multimedia/orders/index', 'admin_url'),
(2, 'multimedia/orders/notfix', 'admin_url'),
(2, 'multimedia/orders/fixed', 'admin_url'),
(2, 'multimedia/orders/notorder', 'admin_url'),
(2, 'multimedia/orders/ordered', 'admin_url'),
(3, 'admin/route/ban', 'admin_url'),
(3, 'admin/route/delete', 'admin_url'),
(3, 'admin/route/edit_post', 'admin_url'),
(3, 'admin/route/edit', 'admin_url'),
(3, 'admin/route/add_post', 'admin_url'),
(3, 'admin/route/add', 'admin_url'),
(3, 'admin/route/index', 'admin_url'),
(3, 'admin/setting/site_post', 'admin_url'),
(3, 'admin/setting/site', 'admin_url'),
(3, 'admin/setting/password_post', 'admin_url'),
(3, 'admin/setting/password', 'admin_url'),
(3, 'admin/user/userinfo_post', 'admin_url'),
(3, 'admin/user/userinfo', 'admin_url'),
(3, 'admin/setting/userdefault', 'admin_url'),
(3, 'admin/setting/default', 'admin_url'),
(3, 'admin/menu/getactions', 'admin_url'),
(3, 'admin/menu/restore_menu', 'admin_url'),
(3, 'admin/menu/export_menu_lang', 'admin_url'),
(3, 'admin/menu/backup_menu', 'admin_url'),
(3, 'admin/menu/lists', 'admin_url'),
(3, 'admin/menu/delete', 'admin_url'),
(3, 'admin/menu/edit_post', 'admin_url'),
(3, 'admin/menu/edit', 'admin_url'),
(3, 'admin/menu/export_menu', 'admin_url'),
(3, 'admin/menu/listorders', 'admin_url'),
(3, 'admin/menu/add_post', 'admin_url'),
(3, 'admin/menu/add', 'admin_url'),
(3, 'admin/menu/index', 'admin_url'),
(3, 'admin/navcat/add_post', 'admin_url'),
(3, 'admin/navcat/add', 'admin_url'),
(3, 'admin/navcat/edit_post', 'admin_url'),
(3, 'admin/navcat/edit', 'admin_url'),
(3, 'admin/navcat/delete', 'admin_url'),
(3, 'admin/navcat/index', 'admin_url'),
(3, 'admin/nav/add_post', 'admin_url'),
(3, 'admin/nav/add', 'admin_url'),
(3, 'admin/nav/edit_post', 'admin_url'),
(3, 'admin/nav/edit', 'admin_url'),
(3, 'admin/nav/delete', 'admin_url'),
(3, 'admin/nav/listorders', 'admin_url'),
(3, 'admin/nav/index', 'admin_url'),
(3, 'admin/navcat/default1', 'admin_url'),
(3, 'admin/menu/default', 'admin_url'),
(3, 'api/oauthadmin/setting_post', 'admin_url'),
(3, 'api/oauthadmin/setting', 'admin_url'),
(3, 'admin/link/add_post', 'admin_url'),
(3, 'admin/link/add', 'admin_url'),
(3, 'admin/link/edit_post', 'admin_url'),
(3, 'admin/link/edit', 'admin_url'),
(3, 'admin/link/delete', 'admin_url'),
(3, 'admin/link/toggle', 'admin_url'),
(3, 'admin/link/listorders', 'admin_url'),
(3, 'admin/link/index', 'admin_url'),
(3, 'admin/ad/add_post', 'admin_url'),
(3, 'admin/ad/add', 'admin_url'),
(3, 'admin/ad/edit_post', 'admin_url'),
(3, 'admin/ad/edit', 'admin_url'),
(3, 'admin/ad/delete', 'admin_url'),
(3, 'admin/ad/toggle', 'admin_url'),
(3, 'admin/ad/index', 'admin_url'),
(3, 'admin/slidecat/add_post', 'admin_url'),
(3, 'admin/slidecat/add', 'admin_url'),
(3, 'admin/slidecat/edit_post', 'admin_url'),
(3, 'admin/slidecat/edit', 'admin_url'),
(3, 'admin/slidecat/delete', 'admin_url'),
(3, 'admin/slidecat/index', 'admin_url'),
(3, 'admin/slide/cancelban', 'admin_url'),
(3, 'admin/slide/ban', 'admin_url'),
(3, 'admin/slide/add_post', 'admin_url'),
(3, 'admin/slide/add', 'admin_url'),
(3, 'admin/slide/edit_post', 'admin_url'),
(3, 'admin/slide/edit', 'admin_url'),
(3, 'admin/slide/delete', 'admin_url'),
(3, 'admin/slide/toggle', 'admin_url'),
(3, 'admin/slide/listorders', 'admin_url'),
(3, 'admin/slide/index', 'admin_url'),
(3, 'admin/slide/default', 'admin_url'),
(3, 'admin/plugin/update', 'admin_url'),
(3, 'admin/plugin/uninstall', 'admin_url'),
(3, 'admin/plugin/install', 'admin_url'),
(3, 'admin/plugin/setting_post', 'admin_url'),
(3, 'admin/plugin/setting', 'admin_url'),
(3, 'admin/plugin/toggle', 'admin_url'),
(3, 'admin/plugin/index', 'admin_url'),
(3, 'admin/backup/import', 'admin_url'),
(3, 'admin/backup/del_backup', 'admin_url'),
(3, 'admin/backup/download', 'admin_url'),
(3, 'admin/backup/index_post', 'admin_url'),
(3, 'admin/backup/index', 'admin_url'),
(3, 'admin/backup/restore', 'admin_url'),
(3, 'admin/backup/default', 'admin_url'),
(3, 'admin/extension/default', 'admin_url'),
(3, 'portal/adminpage/restore', 'admin_url'),
(3, 'portal/adminpage/clean', 'admin_url'),
(3, 'portal/adminpage/recyclebin', 'admin_url'),
(3, 'portal/adminpost/clean', 'admin_url'),
(3, 'portal/adminpost/restore', 'admin_url'),
(3, 'portal/adminpost/recyclebin', 'admin_url'),
(3, 'admin/recycle/default', 'admin_url'),
(3, 'portal/adminpage/add_post', 'admin_url'),
(3, 'portal/adminpage/add', 'admin_url'),
(3, 'portal/adminpage/edit_post', 'admin_url'),
(3, 'portal/adminpage/edit', 'admin_url'),
(3, 'portal/adminpage/delete', 'admin_url'),
(3, 'portal/adminpage/listorders', 'admin_url'),
(3, 'portal/adminpage/index', 'admin_url'),
(3, 'portal/adminterm/add_post', 'admin_url'),
(3, 'portal/adminterm/add', 'admin_url'),
(3, 'portal/adminterm/edit_post', 'admin_url'),
(3, 'portal/adminterm/edit', 'admin_url'),
(3, 'portal/adminterm/delete', 'admin_url'),
(3, 'portal/adminterm/listorders', 'admin_url'),
(3, 'portal/adminterm/index', 'admin_url'),
(3, 'portal/adminpost/copy', 'admin_url'),
(3, 'portal/adminpost/add_post', 'admin_url'),
(3, 'portal/adminpost/add', 'admin_url'),
(3, 'portal/adminpost/edit_post', 'admin_url'),
(3, 'portal/adminpost/edit', 'admin_url'),
(3, 'portal/adminpost/delete', 'admin_url'),
(3, 'portal/adminpost/check', 'admin_url'),
(3, 'portal/adminpost/move', 'admin_url'),
(3, 'portal/adminpost/recommend', 'admin_url'),
(3, 'portal/adminpost/top', 'admin_url'),
(3, 'portal/adminpost/listorders', 'admin_url'),
(3, 'portal/adminpost/index', 'admin_url'),
(3, 'comment/commentadmin/check', 'admin_url'),
(3, 'comment/commentadmin/delete', 'admin_url'),
(3, 'comment/commentadmin/index', 'admin_url'),
(3, 'api/guestbookadmin/delete', 'admin_url'),
(3, 'api/guestbookadmin/index', 'admin_url'),
(3, 'admin/content/default', 'admin_url'),
(3, 'admin/route/open', 'admin_url'),
(3, 'admin/route/listorders', 'admin_url'),
(3, 'admin/mailer/default', 'admin_url'),
(3, 'admin/mailer/index', 'admin_url'),
(3, 'admin/mailer/index_post', 'admin_url'),
(3, 'admin/mailer/test', 'admin_url'),
(3, 'admin/mailer/active', 'admin_url'),
(3, 'admin/mailer/active_post', 'admin_url'),
(3, 'admin/setting/clearcache', 'admin_url'),
(3, 'admin/storage/index', 'admin_url'),
(3, 'admin/storage/setting_post', 'admin_url'),
(3, 'admin/setting/upload', 'admin_url'),
(3, 'admin/setting/upload_post', 'admin_url'),
(3, 'user/indexadmin/default', 'admin_url'),
(3, 'user/indexadmin/default1', 'admin_url'),
(3, 'user/indexadmin/index', 'admin_url'),
(3, 'user/indexadmin/ban', 'admin_url'),
(3, 'user/indexadmin/cancelban', 'admin_url'),
(3, 'user/oauthadmin/index', 'admin_url'),
(3, 'user/oauthadmin/delete', 'admin_url'),
(3, 'user/indexadmin/default3', 'admin_url'),
(3, 'admin/rbac/index', 'admin_url'),
(3, 'admin/rbac/member', 'admin_url'),
(3, 'admin/rbac/authorize', 'admin_url'),
(3, 'admin/rbac/authorize_post', 'admin_url'),
(3, 'admin/rbac/roleedit', 'admin_url'),
(3, 'admin/rbac/roleedit_post', 'admin_url'),
(3, 'admin/rbac/roledelete', 'admin_url'),
(3, 'admin/rbac/roleadd', 'admin_url'),
(3, 'admin/rbac/roleadd_post', 'admin_url'),
(3, 'admin/user/index', 'admin_url'),
(3, 'admin/user/delete', 'admin_url'),
(3, 'admin/user/edit', 'admin_url'),
(3, 'admin/user/edit_post', 'admin_url'),
(3, 'admin/user/add', 'admin_url'),
(3, 'admin/user/add_post', 'admin_url'),
(3, 'admin/user/ban', 'admin_url'),
(3, 'admin/user/cancelban', 'admin_url'),
(3, 'multimedia/orders/default', 'admin_url'),
(3, 'multimedia/campus/index', 'admin_url'),
(3, 'multimedia/building/index', 'admin_url'),
(3, 'multimedia/device/index', 'admin_url'),
(3, 'multimedia/orders/default', 'admin_url'),
(3, 'multimedia/orders/index', 'admin_url'),
(3, 'multimedia/orders/orders_ok', 'admin_url'),
(3, 'multimedia/orders/notfix', 'admin_url'),
(3, 'multimedia/orders/fixed', 'admin_url'),
(3, 'multimedia/orders/notorder', 'admin_url'),
(3, 'multimedia/orders/ordered', 'admin_url'),
(4, 'admin/route/listorders', 'admin_url'),
(4, 'admin/route/open', 'admin_url'),
(4, 'admin/route/ban', 'admin_url'),
(4, 'admin/route/edit_post', 'admin_url'),
(4, 'admin/route/delete', 'admin_url'),
(4, 'admin/route/add_post', 'admin_url'),
(4, 'admin/route/edit', 'admin_url'),
(4, 'admin/route/add', 'admin_url'),
(4, 'admin/route/index', 'admin_url'),
(4, 'admin/setting/site_post', 'admin_url'),
(4, 'admin/setting/site', 'admin_url'),
(4, 'admin/setting/password_post', 'admin_url'),
(4, 'admin/setting/password', 'admin_url'),
(4, 'admin/user/userinfo_post', 'admin_url'),
(4, 'admin/user/userinfo', 'admin_url'),
(4, 'admin/setting/userdefault', 'admin_url'),
(4, 'admin/setting/default', 'admin_url'),
(4, 'admin/menu/getactions', 'admin_url'),
(4, 'admin/menu/restore_menu', 'admin_url'),
(4, 'admin/menu/export_menu_lang', 'admin_url'),
(4, 'admin/menu/backup_menu', 'admin_url'),
(4, 'admin/menu/lists', 'admin_url'),
(4, 'admin/menu/delete', 'admin_url'),
(4, 'admin/menu/edit_post', 'admin_url'),
(4, 'admin/menu/edit', 'admin_url'),
(4, 'admin/menu/export_menu', 'admin_url'),
(4, 'admin/menu/listorders', 'admin_url'),
(4, 'admin/menu/add_post', 'admin_url'),
(4, 'admin/menu/add', 'admin_url'),
(4, 'admin/menu/index', 'admin_url'),
(4, 'admin/navcat/add_post', 'admin_url'),
(4, 'admin/navcat/add', 'admin_url'),
(4, 'admin/navcat/edit_post', 'admin_url'),
(4, 'admin/navcat/edit', 'admin_url'),
(4, 'admin/navcat/delete', 'admin_url'),
(4, 'admin/navcat/index', 'admin_url'),
(4, 'admin/nav/add_post', 'admin_url'),
(4, 'admin/nav/add', 'admin_url'),
(4, 'admin/nav/edit_post', 'admin_url'),
(4, 'admin/nav/edit', 'admin_url'),
(4, 'admin/nav/delete', 'admin_url'),
(4, 'admin/nav/listorders', 'admin_url'),
(4, 'admin/nav/index', 'admin_url'),
(4, 'admin/navcat/default1', 'admin_url'),
(4, 'admin/menu/default', 'admin_url'),
(4, 'api/oauthadmin/setting_post', 'admin_url'),
(4, 'api/oauthadmin/setting', 'admin_url'),
(4, 'admin/link/add_post', 'admin_url'),
(4, 'admin/link/add', 'admin_url'),
(4, 'admin/link/edit_post', 'admin_url'),
(4, 'admin/link/edit', 'admin_url'),
(4, 'admin/link/delete', 'admin_url'),
(4, 'admin/link/toggle', 'admin_url'),
(4, 'admin/link/listorders', 'admin_url'),
(4, 'admin/link/index', 'admin_url'),
(4, 'admin/ad/add_post', 'admin_url'),
(4, 'admin/ad/add', 'admin_url'),
(4, 'admin/ad/edit_post', 'admin_url'),
(4, 'admin/ad/edit', 'admin_url'),
(4, 'admin/ad/delete', 'admin_url'),
(4, 'admin/ad/toggle', 'admin_url'),
(4, 'admin/ad/index', 'admin_url'),
(4, 'admin/slidecat/add_post', 'admin_url'),
(4, 'admin/slidecat/add', 'admin_url'),
(4, 'admin/slidecat/edit_post', 'admin_url'),
(4, 'admin/slidecat/edit', 'admin_url'),
(4, 'admin/slidecat/delete', 'admin_url'),
(4, 'admin/slidecat/index', 'admin_url'),
(4, 'admin/slide/cancelban', 'admin_url'),
(4, 'admin/slide/ban', 'admin_url'),
(4, 'admin/slide/add_post', 'admin_url'),
(4, 'admin/slide/add', 'admin_url'),
(4, 'admin/slide/edit_post', 'admin_url'),
(4, 'admin/slide/edit', 'admin_url'),
(4, 'admin/slide/delete', 'admin_url'),
(4, 'admin/slide/toggle', 'admin_url'),
(4, 'admin/slide/listorders', 'admin_url'),
(4, 'admin/slide/index', 'admin_url'),
(4, 'admin/slide/default', 'admin_url'),
(4, 'admin/plugin/update', 'admin_url'),
(4, 'admin/plugin/uninstall', 'admin_url'),
(4, 'admin/plugin/install', 'admin_url'),
(4, 'admin/plugin/setting_post', 'admin_url'),
(4, 'admin/plugin/setting', 'admin_url'),
(4, 'admin/plugin/toggle', 'admin_url'),
(4, 'admin/plugin/index', 'admin_url'),
(4, 'admin/backup/import', 'admin_url'),
(4, 'admin/backup/del_backup', 'admin_url'),
(4, 'admin/backup/download', 'admin_url'),
(4, 'admin/backup/index_post', 'admin_url'),
(4, 'admin/backup/index', 'admin_url'),
(4, 'admin/backup/restore', 'admin_url'),
(4, 'admin/backup/default', 'admin_url'),
(4, 'admin/extension/default', 'admin_url'),
(4, 'portal/adminpage/restore', 'admin_url'),
(4, 'portal/adminpage/clean', 'admin_url'),
(4, 'portal/adminpage/recyclebin', 'admin_url'),
(4, 'portal/adminpost/clean', 'admin_url'),
(4, 'portal/adminpost/restore', 'admin_url'),
(4, 'portal/adminpost/recyclebin', 'admin_url'),
(4, 'admin/recycle/default', 'admin_url'),
(4, 'portal/adminpage/add_post', 'admin_url'),
(4, 'portal/adminpage/add', 'admin_url'),
(4, 'portal/adminpage/edit_post', 'admin_url'),
(4, 'portal/adminpage/edit', 'admin_url'),
(4, 'portal/adminpage/delete', 'admin_url'),
(4, 'portal/adminpage/listorders', 'admin_url'),
(4, 'portal/adminpage/index', 'admin_url'),
(4, 'portal/adminterm/add_post', 'admin_url'),
(4, 'portal/adminterm/add', 'admin_url'),
(4, 'portal/adminterm/edit_post', 'admin_url'),
(4, 'portal/adminterm/edit', 'admin_url'),
(4, 'portal/adminterm/delete', 'admin_url'),
(4, 'portal/adminterm/listorders', 'admin_url'),
(4, 'portal/adminterm/index', 'admin_url'),
(4, 'portal/adminpost/copy', 'admin_url'),
(4, 'portal/adminpost/add_post', 'admin_url'),
(4, 'portal/adminpost/add', 'admin_url'),
(4, 'portal/adminpost/edit_post', 'admin_url'),
(4, 'portal/adminpost/edit', 'admin_url'),
(4, 'portal/adminpost/delete', 'admin_url'),
(4, 'portal/adminpost/check', 'admin_url'),
(4, 'portal/adminpost/move', 'admin_url'),
(4, 'portal/adminpost/recommend', 'admin_url'),
(4, 'portal/adminpost/top', 'admin_url'),
(4, 'portal/adminpost/listorders', 'admin_url'),
(4, 'portal/adminpost/index', 'admin_url'),
(4, 'comment/commentadmin/check', 'admin_url'),
(4, 'comment/commentadmin/delete', 'admin_url'),
(4, 'comment/commentadmin/index', 'admin_url'),
(4, 'api/guestbookadmin/delete', 'admin_url'),
(4, 'api/guestbookadmin/index', 'admin_url'),
(4, 'admin/content/default', 'admin_url'),
(4, 'admin/mailer/default', 'admin_url'),
(4, 'admin/mailer/index', 'admin_url'),
(4, 'admin/mailer/index_post', 'admin_url'),
(4, 'admin/mailer/test', 'admin_url'),
(4, 'admin/mailer/active', 'admin_url'),
(4, 'admin/mailer/active_post', 'admin_url'),
(4, 'admin/setting/clearcache', 'admin_url'),
(4, 'admin/storage/index', 'admin_url'),
(4, 'admin/storage/setting_post', 'admin_url'),
(4, 'admin/setting/upload', 'admin_url'),
(4, 'admin/setting/upload_post', 'admin_url'),
(4, 'user/indexadmin/default', 'admin_url'),
(4, 'user/indexadmin/default1', 'admin_url'),
(4, 'user/indexadmin/index', 'admin_url'),
(4, 'user/indexadmin/ban', 'admin_url'),
(4, 'user/indexadmin/cancelban', 'admin_url'),
(4, 'user/oauthadmin/index', 'admin_url'),
(4, 'user/oauthadmin/delete', 'admin_url'),
(4, 'user/indexadmin/default3', 'admin_url'),
(4, 'admin/rbac/index', 'admin_url'),
(4, 'admin/rbac/member', 'admin_url'),
(4, 'admin/rbac/authorize', 'admin_url'),
(4, 'admin/rbac/authorize_post', 'admin_url'),
(4, 'admin/rbac/roleedit', 'admin_url'),
(4, 'admin/rbac/roleedit_post', 'admin_url'),
(4, 'admin/rbac/roledelete', 'admin_url'),
(4, 'admin/rbac/roleadd', 'admin_url'),
(4, 'admin/rbac/roleadd_post', 'admin_url'),
(4, 'admin/user/index', 'admin_url'),
(4, 'admin/user/delete', 'admin_url'),
(4, 'admin/user/edit', 'admin_url'),
(4, 'admin/user/edit_post', 'admin_url'),
(4, 'admin/user/add', 'admin_url'),
(4, 'admin/user/add_post', 'admin_url'),
(4, 'admin/user/ban', 'admin_url'),
(4, 'admin/user/cancelban', 'admin_url'),
(4, 'multimedia/orders/default', 'admin_url'),
(4, 'multimedia/campus/index', 'admin_url'),
(4, 'multimedia/building/index', 'admin_url'),
(4, 'multimedia/device/index', 'admin_url'),
(4, 'multimedia/orders/default', 'admin_url'),
(4, 'multimedia/orders/index', 'admin_url'),
(4, 'multimedia/orders/orders_ok', 'admin_url'),
(4, 'multimedia/orders/notfix', 'admin_url'),
(4, 'multimedia/orders/fixed', 'admin_url'),
(4, 'multimedia/orders/notorder', 'admin_url'),
(4, 'multimedia/orders/ordered', 'admin_url'),
(5, 'multimedia/orders/fix_save', 'admin_url'),
(5, 'multimedia/orders/fix_edit', 'admin_url'),
(5, 'multimedia/orders/fix', 'admin_url'),
(5, 'multimedia/orders/delete', 'admin_url'),
(5, 'multimedia/orders/ordered', 'admin_url'),
(5, 'multimedia/orders/notorder', 'admin_url'),
(5, 'multimedia/orders/fixed', 'admin_url'),
(5, 'multimedia/orders/notfix', 'admin_url'),
(5, 'multimedia/orders/orders_ok', 'admin_url'),
(5, 'multimedia/orders/index', 'admin_url'),
(5, 'multimedia/orders/edit', 'admin_url'),
(5, 'multimedia/orders/default', 'admin_url'),
(5, 'multimedia/device/edit_post', 'admin_url'),
(5, 'multimedia/device/add_post', 'admin_url'),
(5, 'multimedia/device/add', 'admin_url'),
(5, 'multimedia/device/delete', 'admin_url'),
(5, 'multimedia/device/index', 'admin_url'),
(5, 'multimedia/device/edit', 'admin_url'),
(5, 'multimedia/building/add_post', 'admin_url'),
(5, 'multimedia/building/edit_post', 'admin_url'),
(5, 'multimedia/building/add', 'admin_url'),
(5, 'multimedia/building/delete', 'admin_url'),
(5, 'multimedia/building/edit', 'admin_url'),
(5, 'multimedia/building/index', 'admin_url'),
(5, 'multimedia/campus/add_post', 'admin_url'),
(5, 'multimedia/campus/edit_post', 'admin_url'),
(5, 'multimedia/campus/add', 'admin_url'),
(5, 'multimedia/campus/delete', 'admin_url'),
(5, 'multimedia/campus/edit', 'admin_url'),
(5, 'multimedia/campus/index', 'admin_url'),
(5, 'multimedia/orders/default', 'admin_url'),
(5, 'admin/setting/password_post', 'admin_url'),
(5, 'admin/setting/password', 'admin_url'),
(5, 'admin/user/userinfo_post', 'admin_url'),
(5, 'admin/user/userinfo', 'admin_url'),
(5, 'admin/setting/userdefault', 'admin_url'),
(5, 'admin/setting/default', 'admin_url');

-- --------------------------------------------------------

--
-- 表的结构 `dmt_auth_rule`
--

DROP TABLE IF EXISTS `dmt_auth_rule`;
CREATE TABLE `dmt_auth_rule` (
  `id` mediumint(8) UNSIGNED NOT NULL COMMENT '规则id,自增主键',
  `module` varchar(20) NOT NULL COMMENT '规则所属module',
  `type` varchar(30) NOT NULL DEFAULT '1' COMMENT '权限规则分类，请加应用前缀,如admin_',
  `name` varchar(255) NOT NULL DEFAULT '' COMMENT '规则唯一英文标识,全小写',
  `param` varchar(255) DEFAULT NULL COMMENT '额外url参数',
  `title` varchar(20) NOT NULL DEFAULT '' COMMENT '规则中文描述',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否有效(0:无效,1:有效)',
  `condition` varchar(300) NOT NULL DEFAULT '' COMMENT '规则附加条件'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='权限规则表';

--
-- 转存表中的数据 `dmt_auth_rule`
--

INSERT INTO `dmt_auth_rule` (`id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition`) VALUES
(1, 'Admin', 'admin_url', 'admin/content/default', NULL, '内容管理', 1, ''),
(2, 'Api', 'admin_url', 'api/guestbookadmin/index', NULL, '所有留言', 1, ''),
(3, 'Api', 'admin_url', 'api/guestbookadmin/delete', NULL, '删除网站留言', 1, ''),
(4, 'Comment', 'admin_url', 'comment/commentadmin/index', NULL, '评论管理', 1, ''),
(5, 'Comment', 'admin_url', 'comment/commentadmin/delete', NULL, '删除评论', 1, ''),
(6, 'Comment', 'admin_url', 'comment/commentadmin/check', NULL, '评论审核', 1, ''),
(7, 'Portal', 'admin_url', 'portal/adminpost/index', NULL, '文章管理', 1, ''),
(8, 'Portal', 'admin_url', 'portal/adminpost/listorders', NULL, '文章排序', 1, ''),
(9, 'Portal', 'admin_url', 'portal/adminpost/top', NULL, '文章置顶', 1, ''),
(10, 'Portal', 'admin_url', 'portal/adminpost/recommend', NULL, '文章推荐', 1, ''),
(11, 'Portal', 'admin_url', 'portal/adminpost/move', NULL, '批量移动', 1, ''),
(12, 'Portal', 'admin_url', 'portal/adminpost/check', NULL, '文章审核', 1, ''),
(13, 'Portal', 'admin_url', 'portal/adminpost/delete', NULL, '删除文章', 1, ''),
(14, 'Portal', 'admin_url', 'portal/adminpost/edit', NULL, '编辑文章', 1, ''),
(15, 'Portal', 'admin_url', 'portal/adminpost/edit_post', NULL, '提交编辑', 1, ''),
(16, 'Portal', 'admin_url', 'portal/adminpost/add', NULL, '添加文章', 1, ''),
(17, 'Portal', 'admin_url', 'portal/adminpost/add_post', NULL, '提交添加', 1, ''),
(18, 'Portal', 'admin_url', 'portal/adminterm/index', NULL, '分类管理', 1, ''),
(19, 'Portal', 'admin_url', 'portal/adminterm/listorders', NULL, '文章分类排序', 1, ''),
(20, 'Portal', 'admin_url', 'portal/adminterm/delete', NULL, '删除分类', 1, ''),
(21, 'Portal', 'admin_url', 'portal/adminterm/edit', NULL, '编辑分类', 1, ''),
(22, 'Portal', 'admin_url', 'portal/adminterm/edit_post', NULL, '提交编辑', 1, ''),
(23, 'Portal', 'admin_url', 'portal/adminterm/add', NULL, '添加分类', 1, ''),
(24, 'Portal', 'admin_url', 'portal/adminterm/add_post', NULL, '提交添加', 1, ''),
(25, 'Portal', 'admin_url', 'portal/adminpage/index', NULL, '页面管理', 1, ''),
(26, 'Portal', 'admin_url', 'portal/adminpage/listorders', NULL, '页面排序', 1, ''),
(27, 'Portal', 'admin_url', 'portal/adminpage/delete', NULL, '删除页面', 1, ''),
(28, 'Portal', 'admin_url', 'portal/adminpage/edit', NULL, '编辑页面', 1, ''),
(29, 'Portal', 'admin_url', 'portal/adminpage/edit_post', NULL, '提交编辑', 1, ''),
(30, 'Portal', 'admin_url', 'portal/adminpage/add', NULL, '添加页面', 1, ''),
(31, 'Portal', 'admin_url', 'portal/adminpage/add_post', NULL, '提交添加', 1, ''),
(32, 'Admin', 'admin_url', 'admin/recycle/default', NULL, '回收站', 1, ''),
(33, 'Portal', 'admin_url', 'portal/adminpost/recyclebin', NULL, '文章回收', 1, ''),
(34, 'Portal', 'admin_url', 'portal/adminpost/restore', NULL, '文章还原', 1, ''),
(35, 'Portal', 'admin_url', 'portal/adminpost/clean', NULL, '彻底删除', 1, ''),
(36, 'Portal', 'admin_url', 'portal/adminpage/recyclebin', NULL, '页面回收', 1, ''),
(37, 'Portal', 'admin_url', 'portal/adminpage/clean', NULL, '彻底删除', 1, ''),
(38, 'Portal', 'admin_url', 'portal/adminpage/restore', NULL, '页面还原', 1, ''),
(39, 'Admin', 'admin_url', 'admin/extension/default', NULL, '扩展工具', 1, ''),
(40, 'Admin', 'admin_url', 'admin/backup/default', NULL, '备份管理', 1, ''),
(41, 'Admin', 'admin_url', 'admin/backup/restore', NULL, '数据还原', 1, ''),
(42, 'Admin', 'admin_url', 'admin/backup/index', NULL, '数据备份', 1, ''),
(43, 'Admin', 'admin_url', 'admin/backup/index_post', NULL, '提交数据备份', 1, ''),
(44, 'Admin', 'admin_url', 'admin/backup/download', NULL, '下载备份', 1, ''),
(45, 'Admin', 'admin_url', 'admin/backup/del_backup', NULL, '删除备份', 1, ''),
(46, 'Admin', 'admin_url', 'admin/backup/import', NULL, '数据备份导入', 1, ''),
(47, 'Admin', 'admin_url', 'admin/plugin/index', NULL, '插件管理', 1, ''),
(48, 'Admin', 'admin_url', 'admin/plugin/toggle', NULL, '插件启用切换', 1, ''),
(49, 'Admin', 'admin_url', 'admin/plugin/setting', NULL, '插件设置', 1, ''),
(50, 'Admin', 'admin_url', 'admin/plugin/setting_post', NULL, '插件设置提交', 1, ''),
(51, 'Admin', 'admin_url', 'admin/plugin/install', NULL, '插件安装', 1, ''),
(52, 'Admin', 'admin_url', 'admin/plugin/uninstall', NULL, '插件卸载', 1, ''),
(53, 'Admin', 'admin_url', 'admin/slide/default', NULL, '幻灯片', 1, ''),
(54, 'Admin', 'admin_url', 'admin/slide/index', NULL, '幻灯片管理', 1, ''),
(55, 'Admin', 'admin_url', 'admin/slide/listorders', NULL, '幻灯片排序', 1, ''),
(56, 'Admin', 'admin_url', 'admin/slide/toggle', NULL, '幻灯片显示切换', 1, ''),
(57, 'Admin', 'admin_url', 'admin/slide/delete', NULL, '删除幻灯片', 1, ''),
(58, 'Admin', 'admin_url', 'admin/slide/edit', NULL, '编辑幻灯片', 1, ''),
(59, 'Admin', 'admin_url', 'admin/slide/edit_post', NULL, '提交编辑', 1, ''),
(60, 'Admin', 'admin_url', 'admin/slide/add', NULL, '添加幻灯片', 1, ''),
(61, 'Admin', 'admin_url', 'admin/slide/add_post', NULL, '提交添加', 1, ''),
(62, 'Admin', 'admin_url', 'admin/slidecat/index', NULL, '幻灯片分类', 1, ''),
(63, 'Admin', 'admin_url', 'admin/slidecat/delete', NULL, '删除分类', 1, ''),
(64, 'Admin', 'admin_url', 'admin/slidecat/edit', NULL, '编辑分类', 1, ''),
(65, 'Admin', 'admin_url', 'admin/slidecat/edit_post', NULL, '提交编辑', 1, ''),
(66, 'Admin', 'admin_url', 'admin/slidecat/add', NULL, '添加分类', 1, ''),
(67, 'Admin', 'admin_url', 'admin/slidecat/add_post', NULL, '提交添加', 1, ''),
(68, 'Admin', 'admin_url', 'admin/ad/index', NULL, '网站广告', 1, ''),
(69, 'Admin', 'admin_url', 'admin/ad/toggle', NULL, '广告显示切换', 1, ''),
(70, 'Admin', 'admin_url', 'admin/ad/delete', NULL, '删除广告', 1, ''),
(71, 'Admin', 'admin_url', 'admin/ad/edit', NULL, '编辑广告', 1, ''),
(72, 'Admin', 'admin_url', 'admin/ad/edit_post', NULL, '提交编辑', 1, ''),
(73, 'Admin', 'admin_url', 'admin/ad/add', NULL, '添加广告', 1, ''),
(74, 'Admin', 'admin_url', 'admin/ad/add_post', NULL, '提交添加', 1, ''),
(75, 'Admin', 'admin_url', 'admin/link/index', NULL, '友情链接', 1, ''),
(76, 'Admin', 'admin_url', 'admin/link/listorders', NULL, '友情链接排序', 1, ''),
(77, 'Admin', 'admin_url', 'admin/link/toggle', NULL, '友链显示切换', 1, ''),
(78, 'Admin', 'admin_url', 'admin/link/delete', NULL, '删除友情链接', 1, ''),
(79, 'Admin', 'admin_url', 'admin/link/edit', NULL, '编辑友情链接', 1, ''),
(80, 'Admin', 'admin_url', 'admin/link/edit_post', NULL, '提交编辑', 1, ''),
(81, 'Admin', 'admin_url', 'admin/link/add', NULL, '添加友情链接', 1, ''),
(82, 'Admin', 'admin_url', 'admin/link/add_post', NULL, '提交添加', 1, ''),
(83, 'Api', 'admin_url', 'api/oauthadmin/setting', NULL, '第三方登陆', 1, ''),
(84, 'Api', 'admin_url', 'api/oauthadmin/setting_post', NULL, '提交设置', 1, ''),
(85, 'Admin', 'admin_url', 'admin/menu/default', NULL, '菜单管理', 1, ''),
(86, 'Admin', 'admin_url', 'admin/navcat/default1', NULL, '前台菜单', 1, ''),
(87, 'Admin', 'admin_url', 'admin/nav/index', NULL, '菜单管理', 1, ''),
(88, 'Admin', 'admin_url', 'admin/nav/listorders', NULL, '前台导航排序', 1, ''),
(89, 'Admin', 'admin_url', 'admin/nav/delete', NULL, '删除菜单', 1, ''),
(90, 'Admin', 'admin_url', 'admin/nav/edit', NULL, '编辑菜单', 1, ''),
(91, 'Admin', 'admin_url', 'admin/nav/edit_post', NULL, '提交编辑', 1, ''),
(92, 'Admin', 'admin_url', 'admin/nav/add', NULL, '添加菜单', 1, ''),
(93, 'Admin', 'admin_url', 'admin/nav/add_post', NULL, '提交添加', 1, ''),
(94, 'Admin', 'admin_url', 'admin/navcat/index', NULL, '菜单分类', 1, ''),
(95, 'Admin', 'admin_url', 'admin/navcat/delete', NULL, '删除分类', 1, ''),
(96, 'Admin', 'admin_url', 'admin/navcat/edit', NULL, '编辑分类', 1, ''),
(97, 'Admin', 'admin_url', 'admin/navcat/edit_post', NULL, '提交编辑', 1, ''),
(98, 'Admin', 'admin_url', 'admin/navcat/add', NULL, '添加分类', 1, ''),
(99, 'Admin', 'admin_url', 'admin/navcat/add_post', NULL, '提交添加', 1, ''),
(100, 'Admin', 'admin_url', 'admin/menu/index', NULL, '后台菜单', 1, ''),
(101, 'Admin', 'admin_url', 'admin/menu/add', NULL, '添加菜单', 1, ''),
(102, 'Admin', 'admin_url', 'admin/menu/add_post', NULL, '提交添加', 1, ''),
(103, 'Admin', 'admin_url', 'admin/menu/listorders', NULL, '后台菜单排序', 1, ''),
(104, 'Admin', 'admin_url', 'admin/menu/export_menu', NULL, '菜单备份', 1, ''),
(105, 'Admin', 'admin_url', 'admin/menu/edit', NULL, '编辑菜单', 1, ''),
(106, 'Admin', 'admin_url', 'admin/menu/edit_post', NULL, '提交编辑', 1, ''),
(107, 'Admin', 'admin_url', 'admin/menu/delete', NULL, '删除菜单', 1, ''),
(108, 'Admin', 'admin_url', 'admin/menu/lists', NULL, '所有菜单', 1, ''),
(109, 'Admin', 'admin_url', 'admin/setting/default', NULL, '设置', 1, ''),
(110, 'Admin', 'admin_url', 'admin/setting/userdefault', NULL, '个人信息', 1, ''),
(111, 'Admin', 'admin_url', 'admin/user/userinfo', NULL, '修改信息', 1, ''),
(112, 'Admin', 'admin_url', 'admin/user/userinfo_post', NULL, '修改信息提交', 1, ''),
(113, 'Admin', 'admin_url', 'admin/setting/password', NULL, '修改密码', 1, ''),
(114, 'Admin', 'admin_url', 'admin/setting/password_post', NULL, '提交修改', 1, ''),
(115, 'Admin', 'admin_url', 'admin/setting/site', NULL, '网站信息', 1, ''),
(116, 'Admin', 'admin_url', 'admin/setting/site_post', NULL, '提交修改', 1, ''),
(117, 'Admin', 'admin_url', 'admin/route/index', NULL, '路由列表', 1, ''),
(118, 'Admin', 'admin_url', 'admin/route/add', NULL, '路由添加', 1, ''),
(119, 'Admin', 'admin_url', 'admin/route/add_post', NULL, '路由添加提交', 1, ''),
(120, 'Admin', 'admin_url', 'admin/route/edit', NULL, '路由编辑', 1, ''),
(121, 'Admin', 'admin_url', 'admin/route/edit_post', NULL, '路由编辑提交', 1, ''),
(122, 'Admin', 'admin_url', 'admin/route/delete', NULL, '路由删除', 1, ''),
(123, 'Admin', 'admin_url', 'admin/route/ban', NULL, '路由禁止', 1, ''),
(124, 'Admin', 'admin_url', 'admin/route/open', NULL, '路由启用', 1, ''),
(125, 'Admin', 'admin_url', 'admin/route/listorders', NULL, '路由排序', 1, ''),
(126, 'Admin', 'admin_url', 'admin/mailer/default', NULL, '邮箱配置', 1, ''),
(127, 'Admin', 'admin_url', 'admin/mailer/index', NULL, 'SMTP配置', 1, ''),
(128, 'Admin', 'admin_url', 'admin/mailer/index_post', NULL, '提交配置', 1, ''),
(129, 'Admin', 'admin_url', 'admin/mailer/active', NULL, '注册邮件模板', 1, ''),
(130, 'Admin', 'admin_url', 'admin/mailer/active_post', NULL, '提交模板', 1, ''),
(131, 'Admin', 'admin_url', 'admin/setting/clearcache', NULL, '清除缓存', 1, ''),
(132, 'User', 'admin_url', 'user/indexadmin/default', NULL, '用户管理', 1, ''),
(133, 'User', 'admin_url', 'user/indexadmin/default1', NULL, '用户组', 1, ''),
(134, 'User', 'admin_url', 'user/indexadmin/index', NULL, '本站用户', 1, ''),
(135, 'User', 'admin_url', 'user/indexadmin/ban', NULL, '拉黑会员', 1, ''),
(136, 'User', 'admin_url', 'user/indexadmin/cancelban', NULL, '启用会员', 1, ''),
(137, 'User', 'admin_url', 'user/oauthadmin/index', NULL, '第三方用户', 1, ''),
(138, 'User', 'admin_url', 'user/oauthadmin/delete', NULL, '第三方用户解绑', 1, ''),
(139, 'User', 'admin_url', 'user/indexadmin/default3', NULL, '管理组', 1, ''),
(140, 'Admin', 'admin_url', 'admin/rbac/index', NULL, '角色管理', 1, ''),
(141, 'Admin', 'admin_url', 'admin/rbac/member', NULL, '成员管理', 1, ''),
(142, 'Admin', 'admin_url', 'admin/rbac/authorize', NULL, '权限设置', 1, ''),
(143, 'Admin', 'admin_url', 'admin/rbac/authorize_post', NULL, '提交设置', 1, ''),
(144, 'Admin', 'admin_url', 'admin/rbac/roleedit', NULL, '编辑角色', 1, ''),
(145, 'Admin', 'admin_url', 'admin/rbac/roleedit_post', NULL, '提交编辑', 1, ''),
(146, 'Admin', 'admin_url', 'admin/rbac/roledelete', NULL, '删除角色', 1, ''),
(147, 'Admin', 'admin_url', 'admin/rbac/roleadd', NULL, '添加角色', 1, ''),
(148, 'Admin', 'admin_url', 'admin/rbac/roleadd_post', NULL, '提交添加', 1, ''),
(149, 'Admin', 'admin_url', 'admin/user/index', NULL, '管理员', 1, ''),
(150, 'Admin', 'admin_url', 'admin/user/delete', NULL, '删除管理员', 1, ''),
(151, 'Admin', 'admin_url', 'admin/user/edit', NULL, '管理员编辑', 1, ''),
(152, 'Admin', 'admin_url', 'admin/user/edit_post', NULL, '编辑提交', 1, ''),
(153, 'Admin', 'admin_url', 'admin/user/add', NULL, '管理员添加', 1, ''),
(154, 'Admin', 'admin_url', 'admin/user/add_post', NULL, '添加提交', 1, ''),
(155, 'Admin', 'admin_url', 'admin/plugin/update', NULL, '插件更新', 1, ''),
(156, 'Admin', 'admin_url', 'admin/storage/index', NULL, '文件存储', 1, ''),
(157, 'Admin', 'admin_url', 'admin/storage/setting_post', NULL, '文件存储设置提交', 1, ''),
(158, 'Admin', 'admin_url', 'admin/slide/ban', NULL, '禁用幻灯片', 1, ''),
(159, 'Admin', 'admin_url', 'admin/slide/cancelban', NULL, '启用幻灯片', 1, ''),
(160, 'Admin', 'admin_url', 'admin/user/ban', NULL, '禁用管理员', 1, ''),
(161, 'Admin', 'admin_url', 'admin/user/cancelban', NULL, '启用管理员', 1, ''),
(162, 'Demo', 'admin_url', 'demo/adminindex/index', NULL, '', 1, ''),
(163, 'Demo', 'admin_url', 'demo/adminindex/last', NULL, '', 1, ''),
(166, 'Admin', 'admin_url', 'admin/mailer/test', NULL, '测试邮件', 1, ''),
(167, 'Admin', 'admin_url', 'admin/setting/upload', NULL, '上传设置', 1, ''),
(168, 'Admin', 'admin_url', 'admin/setting/upload_post', NULL, '上传设置提交', 1, ''),
(169, 'Portal', 'admin_url', 'portal/adminpost/copy', NULL, '文章批量复制', 1, ''),
(170, 'Admin', 'admin_url', 'admin/menu/backup_menu', NULL, '备份菜单', 1, ''),
(171, 'Admin', 'admin_url', 'admin/menu/export_menu_lang', NULL, '导出后台菜单多语言包', 1, ''),
(172, 'Admin', 'admin_url', 'admin/menu/restore_menu', NULL, '还原菜单', 1, ''),
(173, 'Admin', 'admin_url', 'admin/menu/getactions', NULL, '导入新菜单', 1, ''),
(174, 'Multimedia', 'admin_url', 'multimedia/default/default', NULL, '多媒体报修单', 1, ''),
(175, 'Multimedia', 'admin_url', 'multimedia/campus/index', NULL, '校区管理', 1, ''),
(176, 'Multimedia', 'admin_url', 'multimedia/building/index', NULL, '区域管理', 1, ''),
(177, 'Multimedia', 'admin_url', 'multimedia/device/index', NULL, '故障设备管理', 1, ''),
(178, 'Multimedia', 'admin_url', 'multimedia/orders/default', NULL, '报修列表', 1, ''),
(179, 'Multimedia', 'admin_url', 'multimedia/orders/index', NULL, '全部', 1, ''),
(180, 'Multimedia', 'admin_url', 'multimedia/orders/notfix', NULL, '未处理', 1, ''),
(181, 'Multimedia', 'admin_url', 'multimedia/orders/fixed', NULL, '已处理', 1, ''),
(182, 'Multimedia', 'admin_url', 'multimedia/orders/notorder', NULL, '未接单', 1, ''),
(183, 'Multimedia', 'admin_url', 'multimedia/orders/ordered', NULL, '已接单', 1, ''),
(184, 'Multimedia', 'admin_url', 'multimedia/orders/orders_ok', NULL, '接单', 1, ''),
(185, 'Multimedia', 'admin_url', 'multimedia/orders/edit', NULL, '编辑维护情况', 1, ''),
(186, 'Multimedia', 'admin_url', 'multimedia/orders/delete', NULL, '删除', 1, ''),
(187, 'Multimedia', 'admin_url', 'multimedia/orders/fix', NULL, '处理', 1, ''),
(188, 'Multimedia', 'admin_url', 'multimedia/orders/fix_edit', NULL, '保存', 1, ''),
(189, 'Multimedia', 'admin_url', 'multimedia/orders/fix_save', NULL, '保存', 1, ''),
(190, 'Multimedia', 'admin_url', 'multimedia/campus/edit', NULL, '编辑', 1, ''),
(191, 'Multimedia', 'admin_url', 'multimedia/campus/delete', NULL, '删除', 1, ''),
(192, 'Multimedia', 'admin_url', 'multimedia/campus/add', NULL, '添加校区', 1, ''),
(193, 'Multimedia', 'admin_url', 'multimedia/campus/edit_post', NULL, '保存', 1, ''),
(194, 'Multimedia', 'admin_url', 'multimedia/campus/add_post', NULL, '保存', 1, ''),
(195, 'Multimedia', 'admin_url', 'multimedia/building/edit', NULL, '编辑', 1, ''),
(196, 'Multimedia', 'admin_url', 'multimedia/building/delete', NULL, '删除', 1, ''),
(197, 'Multimedia', 'admin_url', 'multimedia/building/add', NULL, '添加区域', 1, ''),
(198, 'Multimedia', 'admin_url', 'multimedia/building/edit_post', NULL, '保存', 1, ''),
(199, 'Multimedia', 'admin_url', 'multimedia/building/add_post', NULL, '保存', 1, ''),
(200, 'Multimedia', 'admin_url', 'multimedia/device/edit', NULL, '编辑', 1, ''),
(201, 'Multimedia', 'admin_url', 'multimedia/device/delete', NULL, '删除', 1, ''),
(202, 'Multimedia', 'admin_url', 'multimedia/device/add', NULL, '添加故障设备', 1, ''),
(203, 'Multimedia', 'admin_url', 'multimedia/device/add_post', NULL, '保存', 1, ''),
(204, 'Multimedia', 'admin_url', 'multimedia/device/edit_post', NULL, '保存', 1, '');

-- --------------------------------------------------------

--
-- 表的结构 `dmt_building`
--

DROP TABLE IF EXISTS `dmt_building`;
CREATE TABLE `dmt_building` (
  `id` int(10) UNSIGNED NOT NULL COMMENT '主键',
  `campus_id` int(10) UNSIGNED NOT NULL COMMENT '校区id',
  `title` varchar(100) NOT NULL COMMENT '区域名称',
  `room_number` text NOT NULL COMMENT '区域包含的房号'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='区域表';

--
-- 转存表中的数据 `dmt_building`
--

INSERT INTO `dmt_building` (`id`, `campus_id`, `title`, `room_number`) VALUES
(1, 2, '1号教学楼', '[ "101", "102", "103" ]'),
(2, 2, '2号教学楼', '[ "101", "102", "103" ]');

-- --------------------------------------------------------

--
-- 表的结构 `dmt_campus`
--

DROP TABLE IF EXISTS `dmt_campus`;
CREATE TABLE `dmt_campus` (
  `id` int(10) UNSIGNED NOT NULL COMMENT '主键',
  `title` varchar(50) NOT NULL COMMENT '校区名称'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `dmt_campus`
--

INSERT INTO `dmt_campus` (`id`, `title`) VALUES
(1, '里建校区'),
(2, '长堽校区');

-- --------------------------------------------------------

--
-- 表的结构 `dmt_comments`
--

DROP TABLE IF EXISTS `dmt_comments`;
CREATE TABLE `dmt_comments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `post_table` varchar(100) NOT NULL COMMENT '评论内容所在表，不带表前缀',
  `post_id` int(11) UNSIGNED NOT NULL DEFAULT '0' COMMENT '评论内容 id',
  `url` varchar(255) DEFAULT NULL COMMENT '原文地址',
  `uid` int(11) NOT NULL DEFAULT '0' COMMENT '发表评论的用户id',
  `to_uid` int(11) NOT NULL DEFAULT '0' COMMENT '被评论的用户id',
  `full_name` varchar(50) DEFAULT NULL COMMENT '评论者昵称',
  `email` varchar(255) DEFAULT NULL COMMENT '评论者邮箱',
  `createtime` datetime NOT NULL DEFAULT '2000-01-01 00:00:00' COMMENT '评论时间',
  `content` text NOT NULL COMMENT '评论内容',
  `type` smallint(1) NOT NULL DEFAULT '1' COMMENT '评论类型；1实名评论',
  `parentid` bigint(20) UNSIGNED NOT NULL DEFAULT '0' COMMENT '被回复的评论id',
  `path` varchar(500) DEFAULT NULL,
  `status` smallint(1) NOT NULL DEFAULT '1' COMMENT '状态，1已审核，0未审核'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='评论表';

-- --------------------------------------------------------

--
-- 表的结构 `dmt_common_action_log`
--

DROP TABLE IF EXISTS `dmt_common_action_log`;
CREATE TABLE `dmt_common_action_log` (
  `id` int(11) NOT NULL,
  `user` bigint(20) DEFAULT '0' COMMENT '用户id',
  `object` varchar(100) DEFAULT NULL COMMENT '访问对象的id,格式：不带前缀的表名+id;如posts1表示xx_posts表里id为1的记录',
  `action` varchar(50) DEFAULT NULL COMMENT '操作名称；格式规定为：应用名+控制器+操作名；也可自己定义格式只要不发生冲突且惟一；',
  `count` int(11) DEFAULT '0' COMMENT '访问次数',
  `last_time` int(11) DEFAULT '0' COMMENT '最后访问的时间戳',
  `ip` varchar(15) DEFAULT NULL COMMENT '访问者最后访问ip'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='访问记录表';

-- --------------------------------------------------------

--
-- 表的结构 `dmt_device`
--

DROP TABLE IF EXISTS `dmt_device`;
CREATE TABLE `dmt_device` (
  `id` int(10) UNSIGNED NOT NULL COMMENT '主键',
  `title` varchar(100) NOT NULL COMMENT '故障设备名称'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='故障设备表';

--
-- 转存表中的数据 `dmt_device`
--

INSERT INTO `dmt_device` (`id`, `title`) VALUES
(1, '电脑'),
(3, '投影机');

-- --------------------------------------------------------

--
-- 表的结构 `dmt_guestbook`
--

DROP TABLE IF EXISTS `dmt_guestbook`;
CREATE TABLE `dmt_guestbook` (
  `id` int(11) NOT NULL,
  `full_name` varchar(50) NOT NULL COMMENT '留言者姓名',
  `email` varchar(100) NOT NULL COMMENT '留言者邮箱',
  `title` varchar(255) DEFAULT NULL COMMENT '留言标题',
  `msg` text NOT NULL COMMENT '留言内容',
  `createtime` datetime NOT NULL COMMENT '留言时间',
  `status` smallint(2) NOT NULL DEFAULT '1' COMMENT '留言状态，1：正常，0：删除'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='留言表';

-- --------------------------------------------------------

--
-- 表的结构 `dmt_links`
--

DROP TABLE IF EXISTS `dmt_links`;
CREATE TABLE `dmt_links` (
  `link_id` bigint(20) UNSIGNED NOT NULL,
  `link_url` varchar(255) NOT NULL COMMENT '友情链接地址',
  `link_name` varchar(255) NOT NULL COMMENT '友情链接名称',
  `link_image` varchar(255) DEFAULT NULL COMMENT '友情链接图标',
  `link_target` varchar(25) NOT NULL DEFAULT '_blank' COMMENT '友情链接打开方式',
  `link_description` text NOT NULL COMMENT '友情链接描述',
  `link_status` int(2) NOT NULL DEFAULT '1' COMMENT '状态，1显示，0不显示',
  `link_rating` int(11) NOT NULL DEFAULT '0' COMMENT '友情链接评级',
  `link_rel` varchar(255) DEFAULT NULL COMMENT '链接与网站的关系',
  `listorder` int(10) NOT NULL DEFAULT '0' COMMENT '排序'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='友情链接表';

--
-- 转存表中的数据 `dmt_links`
--

INSERT INTO `dmt_links` (`link_id`, `link_url`, `link_name`, `link_image`, `link_target`, `link_description`, `link_status`, `link_rating`, `link_rel`, `listorder`) VALUES
(1, 'http://www.thinkcmf.com', 'ThinkCMF', '', '_blank', '', 1, 0, '', 0);

-- --------------------------------------------------------

--
-- 表的结构 `dmt_menu`
--

DROP TABLE IF EXISTS `dmt_menu`;
CREATE TABLE `dmt_menu` (
  `id` smallint(6) UNSIGNED NOT NULL,
  `parentid` smallint(6) UNSIGNED NOT NULL DEFAULT '0',
  `app` varchar(30) NOT NULL DEFAULT '' COMMENT '应用名称app',
  `model` varchar(30) NOT NULL DEFAULT '' COMMENT '控制器',
  `action` varchar(50) NOT NULL DEFAULT '' COMMENT '操作名称',
  `data` varchar(50) NOT NULL DEFAULT '' COMMENT '额外参数',
  `type` tinyint(1) NOT NULL DEFAULT '0' COMMENT '菜单类型  1：权限认证+菜单；0：只作为菜单',
  `status` tinyint(1) UNSIGNED NOT NULL DEFAULT '0' COMMENT '状态，1显示，0不显示',
  `name` varchar(50) NOT NULL COMMENT '菜单名称',
  `icon` varchar(50) DEFAULT NULL COMMENT '菜单图标',
  `remark` varchar(255) NOT NULL DEFAULT '' COMMENT '备注',
  `listorder` smallint(6) UNSIGNED NOT NULL DEFAULT '0' COMMENT '排序ID'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='后台菜单表';

--
-- 转存表中的数据 `dmt_menu`
--

INSERT INTO `dmt_menu` (`id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder`) VALUES
(1, 0, 'Admin', 'Content', 'default', '', 0, 1, '内容管理', 'th', '', 30),
(2, 1, 'Api', 'Guestbookadmin', 'index', '', 1, 1, '所有留言', '', '', 0),
(3, 2, 'Api', 'Guestbookadmin', 'delete', '', 1, 0, '删除网站留言', '', '', 0),
(4, 1, 'Comment', 'Commentadmin', 'index', '', 1, 1, '评论管理', '', '', 0),
(5, 4, 'Comment', 'Commentadmin', 'delete', '', 1, 0, '删除评论', '', '', 0),
(6, 4, 'Comment', 'Commentadmin', 'check', '', 1, 0, '评论审核', '', '', 0),
(7, 1, 'Portal', 'AdminPost', 'index', '', 1, 1, '文章管理', '', '', 1),
(8, 7, 'Portal', 'AdminPost', 'listorders', '', 1, 0, '文章排序', '', '', 0),
(9, 7, 'Portal', 'AdminPost', 'top', '', 1, 0, '文章置顶', '', '', 0),
(10, 7, 'Portal', 'AdminPost', 'recommend', '', 1, 0, '文章推荐', '', '', 0),
(11, 7, 'Portal', 'AdminPost', 'move', '', 1, 0, '批量移动', '', '', 1000),
(12, 7, 'Portal', 'AdminPost', 'check', '', 1, 0, '文章审核', '', '', 1000),
(13, 7, 'Portal', 'AdminPost', 'delete', '', 1, 0, '删除文章', '', '', 1000),
(14, 7, 'Portal', 'AdminPost', 'edit', '', 1, 0, '编辑文章', '', '', 1000),
(15, 14, 'Portal', 'AdminPost', 'edit_post', '', 1, 0, '提交编辑', '', '', 0),
(16, 7, 'Portal', 'AdminPost', 'add', '', 1, 0, '添加文章', '', '', 1000),
(17, 16, 'Portal', 'AdminPost', 'add_post', '', 1, 0, '提交添加', '', '', 0),
(18, 1, 'Portal', 'AdminTerm', 'index', '', 0, 1, '分类管理', '', '', 2),
(19, 18, 'Portal', 'AdminTerm', 'listorders', '', 1, 0, '文章分类排序', '', '', 0),
(20, 18, 'Portal', 'AdminTerm', 'delete', '', 1, 0, '删除分类', '', '', 1000),
(21, 18, 'Portal', 'AdminTerm', 'edit', '', 1, 0, '编辑分类', '', '', 1000),
(22, 21, 'Portal', 'AdminTerm', 'edit_post', '', 1, 0, '提交编辑', '', '', 0),
(23, 18, 'Portal', 'AdminTerm', 'add', '', 1, 0, '添加分类', '', '', 1000),
(24, 23, 'Portal', 'AdminTerm', 'add_post', '', 1, 0, '提交添加', '', '', 0),
(25, 1, 'Portal', 'AdminPage', 'index', '', 1, 1, '页面管理', '', '', 3),
(26, 25, 'Portal', 'AdminPage', 'listorders', '', 1, 0, '页面排序', '', '', 0),
(27, 25, 'Portal', 'AdminPage', 'delete', '', 1, 0, '删除页面', '', '', 1000),
(28, 25, 'Portal', 'AdminPage', 'edit', '', 1, 0, '编辑页面', '', '', 1000),
(29, 28, 'Portal', 'AdminPage', 'edit_post', '', 1, 0, '提交编辑', '', '', 0),
(30, 25, 'Portal', 'AdminPage', 'add', '', 1, 0, '添加页面', '', '', 1000),
(31, 30, 'Portal', 'AdminPage', 'add_post', '', 1, 0, '提交添加', '', '', 0),
(32, 1, 'Admin', 'Recycle', 'default', '', 1, 1, '回收站', '', '', 4),
(33, 32, 'Portal', 'AdminPost', 'recyclebin', '', 1, 1, '文章回收', '', '', 0),
(34, 33, 'Portal', 'AdminPost', 'restore', '', 1, 0, '文章还原', '', '', 1000),
(35, 33, 'Portal', 'AdminPost', 'clean', '', 1, 0, '彻底删除', '', '', 1000),
(36, 32, 'Portal', 'AdminPage', 'recyclebin', '', 1, 1, '页面回收', '', '', 1),
(37, 36, 'Portal', 'AdminPage', 'clean', '', 1, 0, '彻底删除', '', '', 1000),
(38, 36, 'Portal', 'AdminPage', 'restore', '', 1, 0, '页面还原', '', '', 1000),
(39, 0, 'Admin', 'Extension', 'default', '', 0, 1, '扩展工具', 'cloud', '', 40),
(40, 39, 'Admin', 'Backup', 'default', '', 1, 0, '备份管理', '', '', 0),
(41, 40, 'Admin', 'Backup', 'restore', '', 1, 1, '数据还原', '', '', 0),
(42, 40, 'Admin', 'Backup', 'index', '', 1, 1, '数据备份', '', '', 0),
(43, 42, 'Admin', 'Backup', 'index_post', '', 1, 0, '提交数据备份', '', '', 0),
(44, 40, 'Admin', 'Backup', 'download', '', 1, 0, '下载备份', '', '', 1000),
(45, 40, 'Admin', 'Backup', 'del_backup', '', 1, 0, '删除备份', '', '', 1000),
(46, 40, 'Admin', 'Backup', 'import', '', 1, 0, '数据备份导入', '', '', 1000),
(47, 39, 'Admin', 'Plugin', 'index', '', 1, 1, '插件管理', '', '', 0),
(48, 47, 'Admin', 'Plugin', 'toggle', '', 1, 0, '插件启用切换', '', '', 0),
(49, 47, 'Admin', 'Plugin', 'setting', '', 1, 0, '插件设置', '', '', 0),
(50, 49, 'Admin', 'Plugin', 'setting_post', '', 1, 0, '插件设置提交', '', '', 0),
(51, 47, 'Admin', 'Plugin', 'install', '', 1, 0, '插件安装', '', '', 0),
(52, 47, 'Admin', 'Plugin', 'uninstall', '', 1, 0, '插件卸载', '', '', 0),
(53, 39, 'Admin', 'Slide', 'default', '', 1, 1, '幻灯片', '', '', 1),
(54, 53, 'Admin', 'Slide', 'index', '', 1, 1, '幻灯片管理', '', '', 0),
(55, 54, 'Admin', 'Slide', 'listorders', '', 1, 0, '幻灯片排序', '', '', 0),
(56, 54, 'Admin', 'Slide', 'toggle', '', 1, 0, '幻灯片显示切换', '', '', 0),
(57, 54, 'Admin', 'Slide', 'delete', '', 1, 0, '删除幻灯片', '', '', 1000),
(58, 54, 'Admin', 'Slide', 'edit', '', 1, 0, '编辑幻灯片', '', '', 1000),
(59, 58, 'Admin', 'Slide', 'edit_post', '', 1, 0, '提交编辑', '', '', 0),
(60, 54, 'Admin', 'Slide', 'add', '', 1, 0, '添加幻灯片', '', '', 1000),
(61, 60, 'Admin', 'Slide', 'add_post', '', 1, 0, '提交添加', '', '', 0),
(62, 53, 'Admin', 'Slidecat', 'index', '', 1, 1, '幻灯片分类', '', '', 0),
(63, 62, 'Admin', 'Slidecat', 'delete', '', 1, 0, '删除分类', '', '', 1000),
(64, 62, 'Admin', 'Slidecat', 'edit', '', 1, 0, '编辑分类', '', '', 1000),
(65, 64, 'Admin', 'Slidecat', 'edit_post', '', 1, 0, '提交编辑', '', '', 0),
(66, 62, 'Admin', 'Slidecat', 'add', '', 1, 0, '添加分类', '', '', 1000),
(67, 66, 'Admin', 'Slidecat', 'add_post', '', 1, 0, '提交添加', '', '', 0),
(68, 39, 'Admin', 'Ad', 'index', '', 1, 1, '网站广告', '', '', 2),
(69, 68, 'Admin', 'Ad', 'toggle', '', 1, 0, '广告显示切换', '', '', 0),
(70, 68, 'Admin', 'Ad', 'delete', '', 1, 0, '删除广告', '', '', 1000),
(71, 68, 'Admin', 'Ad', 'edit', '', 1, 0, '编辑广告', '', '', 1000),
(72, 71, 'Admin', 'Ad', 'edit_post', '', 1, 0, '提交编辑', '', '', 0),
(73, 68, 'Admin', 'Ad', 'add', '', 1, 0, '添加广告', '', '', 1000),
(74, 73, 'Admin', 'Ad', 'add_post', '', 1, 0, '提交添加', '', '', 0),
(75, 39, 'Admin', 'Link', 'index', '', 0, 1, '友情链接', '', '', 3),
(76, 75, 'Admin', 'Link', 'listorders', '', 1, 0, '友情链接排序', '', '', 0),
(77, 75, 'Admin', 'Link', 'toggle', '', 1, 0, '友链显示切换', '', '', 0),
(78, 75, 'Admin', 'Link', 'delete', '', 1, 0, '删除友情链接', '', '', 1000),
(79, 75, 'Admin', 'Link', 'edit', '', 1, 0, '编辑友情链接', '', '', 1000),
(80, 79, 'Admin', 'Link', 'edit_post', '', 1, 0, '提交编辑', '', '', 0),
(81, 75, 'Admin', 'Link', 'add', '', 1, 0, '添加友情链接', '', '', 1000),
(82, 81, 'Admin', 'Link', 'add_post', '', 1, 0, '提交添加', '', '', 0),
(83, 39, 'Api', 'Oauthadmin', 'setting', '', 1, 1, '第三方登陆', 'leaf', '', 4),
(84, 83, 'Api', 'Oauthadmin', 'setting_post', '', 1, 0, '提交设置', '', '', 0),
(85, 0, 'Admin', 'Menu', 'default', '', 1, 1, '菜单管理', 'list', '', 20),
(86, 85, 'Admin', 'Navcat', 'default1', '', 1, 1, '前台菜单', '', '', 0),
(87, 86, 'Admin', 'Nav', 'index', '', 1, 1, '菜单管理', '', '', 0),
(88, 87, 'Admin', 'Nav', 'listorders', '', 1, 0, '前台导航排序', '', '', 0),
(89, 87, 'Admin', 'Nav', 'delete', '', 1, 0, '删除菜单', '', '', 1000),
(90, 87, 'Admin', 'Nav', 'edit', '', 1, 0, '编辑菜单', '', '', 1000),
(91, 90, 'Admin', 'Nav', 'edit_post', '', 1, 0, '提交编辑', '', '', 0),
(92, 87, 'Admin', 'Nav', 'add', '', 1, 0, '添加菜单', '', '', 1000),
(93, 92, 'Admin', 'Nav', 'add_post', '', 1, 0, '提交添加', '', '', 0),
(94, 86, 'Admin', 'Navcat', 'index', '', 1, 1, '菜单分类', '', '', 0),
(95, 94, 'Admin', 'Navcat', 'delete', '', 1, 0, '删除分类', '', '', 1000),
(96, 94, 'Admin', 'Navcat', 'edit', '', 1, 0, '编辑分类', '', '', 1000),
(97, 96, 'Admin', 'Navcat', 'edit_post', '', 1, 0, '提交编辑', '', '', 0),
(98, 94, 'Admin', 'Navcat', 'add', '', 1, 0, '添加分类', '', '', 1000),
(99, 98, 'Admin', 'Navcat', 'add_post', '', 1, 0, '提交添加', '', '', 0),
(100, 85, 'Admin', 'Menu', 'index', '', 1, 1, '后台菜单', '', '', 0),
(101, 100, 'Admin', 'Menu', 'add', '', 1, 0, '添加菜单', '', '', 0),
(102, 101, 'Admin', 'Menu', 'add_post', '', 1, 0, '提交添加', '', '', 0),
(103, 100, 'Admin', 'Menu', 'listorders', '', 1, 0, '后台菜单排序', '', '', 0),
(104, 100, 'Admin', 'Menu', 'export_menu', '', 1, 0, '菜单备份', '', '', 1000),
(105, 100, 'Admin', 'Menu', 'edit', '', 1, 0, '编辑菜单', '', '', 1000),
(106, 105, 'Admin', 'Menu', 'edit_post', '', 1, 0, '提交编辑', '', '', 0),
(107, 100, 'Admin', 'Menu', 'delete', '', 1, 0, '删除菜单', '', '', 1000),
(108, 100, 'Admin', 'Menu', 'lists', '', 1, 0, '所有菜单', '', '', 1000),
(109, 0, 'Admin', 'Setting', 'default', '', 0, 1, '设置', 'cogs', '', 50),
(110, 109, 'Admin', 'Setting', 'userdefault', '', 0, 1, '个人信息', '', '', 0),
(111, 110, 'Admin', 'User', 'userinfo', '', 1, 1, '修改信息', '', '', 0),
(112, 111, 'Admin', 'User', 'userinfo_post', '', 1, 0, '修改信息提交', '', '', 0),
(113, 110, 'Admin', 'Setting', 'password', '', 1, 1, '修改密码', '', '', 0),
(114, 113, 'Admin', 'Setting', 'password_post', '', 1, 0, '提交修改', '', '', 0),
(115, 109, 'Admin', 'Setting', 'site', '', 1, 1, '网站信息', '', '', 0),
(116, 115, 'Admin', 'Setting', 'site_post', '', 1, 0, '提交修改', '', '', 0),
(117, 115, 'Admin', 'Route', 'index', '', 1, 0, '路由列表', '', '', 0),
(118, 115, 'Admin', 'Route', 'add', '', 1, 0, '路由添加', '', '', 0),
(119, 118, 'Admin', 'Route', 'add_post', '', 1, 0, '路由添加提交', '', '', 0),
(120, 115, 'Admin', 'Route', 'edit', '', 1, 0, '路由编辑', '', '', 0),
(121, 120, 'Admin', 'Route', 'edit_post', '', 1, 0, '路由编辑提交', '', '', 0),
(122, 115, 'Admin', 'Route', 'delete', '', 1, 0, '路由删除', '', '', 0),
(123, 115, 'Admin', 'Route', 'ban', '', 1, 0, '路由禁止', '', '', 0),
(124, 115, 'Admin', 'Route', 'open', '', 1, 0, '路由启用', '', '', 0),
(125, 115, 'Admin', 'Route', 'listorders', '', 1, 0, '路由排序', '', '', 0),
(126, 109, 'Admin', 'Mailer', 'default', '', 1, 1, '邮箱配置', '', '', 0),
(127, 126, 'Admin', 'Mailer', 'index', '', 1, 1, 'SMTP配置', '', '', 0),
(128, 127, 'Admin', 'Mailer', 'index_post', '', 1, 0, '提交配置', '', '', 0),
(129, 126, 'Admin', 'Mailer', 'active', '', 1, 1, '注册邮件模板', '', '', 0),
(130, 129, 'Admin', 'Mailer', 'active_post', '', 1, 0, '提交模板', '', '', 0),
(131, 109, 'Admin', 'Setting', 'clearcache', '', 1, 1, '清除缓存', '', '', 1),
(132, 0, 'User', 'Indexadmin', 'default', '', 1, 1, '用户管理', 'group', '', 10),
(133, 132, 'User', 'Indexadmin', 'default1', '', 1, 1, '用户组', '', '', 0),
(134, 133, 'User', 'Indexadmin', 'index', '', 1, 1, '本站用户', 'leaf', '', 0),
(135, 134, 'User', 'Indexadmin', 'ban', '', 1, 0, '拉黑会员', '', '', 0),
(136, 134, 'User', 'Indexadmin', 'cancelban', '', 1, 0, '启用会员', '', '', 0),
(137, 133, 'User', 'Oauthadmin', 'index', '', 1, 1, '第三方用户', 'leaf', '', 0),
(138, 137, 'User', 'Oauthadmin', 'delete', '', 1, 0, '第三方用户解绑', '', '', 0),
(139, 132, 'User', 'Indexadmin', 'default3', '', 1, 1, '管理组', '', '', 0),
(140, 139, 'Admin', 'Rbac', 'index', '', 1, 1, '角色管理', '', '', 0),
(141, 140, 'Admin', 'Rbac', 'member', '', 1, 0, '成员管理', '', '', 1000),
(142, 140, 'Admin', 'Rbac', 'authorize', '', 1, 0, '权限设置', '', '', 1000),
(143, 142, 'Admin', 'Rbac', 'authorize_post', '', 1, 0, '提交设置', '', '', 0),
(144, 140, 'Admin', 'Rbac', 'roleedit', '', 1, 0, '编辑角色', '', '', 1000),
(145, 144, 'Admin', 'Rbac', 'roleedit_post', '', 1, 0, '提交编辑', '', '', 0),
(146, 140, 'Admin', 'Rbac', 'roledelete', '', 1, 1, '删除角色', '', '', 1000),
(147, 140, 'Admin', 'Rbac', 'roleadd', '', 1, 1, '添加角色', '', '', 1000),
(148, 147, 'Admin', 'Rbac', 'roleadd_post', '', 1, 0, '提交添加', '', '', 0),
(149, 139, 'Admin', 'User', 'index', '', 1, 1, '管理员', '', '', 0),
(150, 149, 'Admin', 'User', 'delete', '', 1, 0, '删除管理员', '', '', 1000),
(151, 149, 'Admin', 'User', 'edit', '', 1, 0, '管理员编辑', '', '', 1000),
(152, 151, 'Admin', 'User', 'edit_post', '', 1, 0, '编辑提交', '', '', 0),
(153, 149, 'Admin', 'User', 'add', '', 1, 0, '管理员添加', '', '', 1000),
(154, 153, 'Admin', 'User', 'add_post', '', 1, 0, '添加提交', '', '', 0),
(155, 47, 'Admin', 'Plugin', 'update', '', 1, 0, '插件更新', '', '', 0),
(156, 109, 'Admin', 'Storage', 'index', '', 1, 1, '文件存储', '', '', 0),
(157, 156, 'Admin', 'Storage', 'setting_post', '', 1, 0, '文件存储设置提交', '', '', 0),
(158, 54, 'Admin', 'Slide', 'ban', '', 1, 0, '禁用幻灯片', '', '', 0),
(159, 54, 'Admin', 'Slide', 'cancelban', '', 1, 0, '启用幻灯片', '', '', 0),
(160, 149, 'Admin', 'User', 'ban', '', 1, 0, '禁用管理员', '', '', 0),
(161, 149, 'Admin', 'User', 'cancelban', '', 1, 0, '启用管理员', '', '', 0),
(166, 127, 'Admin', 'Mailer', 'test', '', 1, 0, '测试邮件', '', '', 0),
(167, 109, 'Admin', 'Setting', 'upload', '', 1, 1, '上传设置', '', '', 0),
(168, 167, 'Admin', 'Setting', 'upload_post', '', 1, 0, '上传设置提交', '', '', 0),
(169, 7, 'Portal', 'AdminPost', 'copy', '', 1, 0, '文章批量复制', '', '', 0),
(174, 100, 'Admin', 'Menu', 'backup_menu', '', 1, 0, '备份菜单', '', '', 0),
(175, 100, 'Admin', 'Menu', 'export_menu_lang', '', 1, 0, '导出后台菜单多语言包', '', '', 0),
(176, 100, 'Admin', 'Menu', 'restore_menu', '', 1, 0, '还原菜单', '', '', 0),
(177, 100, 'Admin', 'Menu', 'getactions', '', 1, 0, '导入新菜单', '', '', 0),
(187, 0, 'Multimedia', 'Orders', 'default', '', 0, 1, '多媒体报修单', '', '', 0),
(188, 187, 'Multimedia', 'Campus', 'index', '', 1, 1, '校区管理', '', '', 10),
(198, 191, 'Multimedia', 'Orders', 'edit', '', 1, 0, '编辑维护情况', '', '', 0),
(189, 187, 'Multimedia', 'Building', 'index', '', 1, 1, '区域管理', '', '', 20),
(190, 187, 'Multimedia', 'Device', 'index', '', 1, 1, '故障设备管理', '', '', 30),
(191, 187, 'Multimedia', 'Orders', 'default', '', 1, 1, '报修列表', '', '', 0),
(192, 191, 'Multimedia', 'Orders', 'index', '', 1, 1, '全部', '', '', 0),
(197, 191, 'Multimedia', 'Orders', 'orders_ok', '', 1, 0, '接单', '', '', 0),
(193, 191, 'Multimedia', 'Orders', 'notFix', '', 1, 1, '未处理', '', '', 20),
(194, 191, 'Multimedia', 'Orders', 'fixed', '', 1, 1, '已处理', '', '', 30),
(195, 191, 'Multimedia', 'Orders', 'notOrder', '', 1, 1, '未接单', '', '', 0),
(196, 191, 'Multimedia', 'Orders', 'ordered', '', 1, 0, '已接单', '', '', 10),
(199, 191, 'Multimedia', 'Orders', 'delete', '', 1, 0, '删除', '', '', 0),
(200, 191, 'Multimedia', 'Orders', 'fix', '', 1, 0, '处理', '', '', 0),
(201, 191, 'Multimedia', 'Orders', 'fix_edit', '', 1, 0, '保存', '', '', 0),
(202, 191, 'Multimedia', 'Orders', 'fix_save', '', 1, 0, '保存', '', '', 0),
(203, 188, 'Multimedia', 'Campus', 'edit', '', 1, 0, '编辑', '', '', 0),
(204, 188, 'Multimedia', 'Campus', 'delete', '', 1, 0, '删除', '', '', 0),
(205, 188, 'Multimedia', 'Campus', 'add', '', 1, 0, '添加校区', '', '', 0),
(206, 188, 'Multimedia', 'Campus', 'edit_post', '', 1, 0, '保存', '', '', 0),
(207, 188, 'Multimedia', 'Campus', 'add_post', '', 1, 0, '保存', '', '', 0),
(208, 189, 'Multimedia', 'Building', 'edit', '', 1, 0, '编辑', '', '', 0),
(209, 189, 'Multimedia', 'Building', 'delete', '', 1, 0, '删除', '', '', 0),
(210, 189, 'Multimedia', 'Building', 'add', '', 1, 0, '添加区域', '', '', 0),
(211, 189, 'Multimedia', 'Building', 'edit_post', '', 1, 0, '保存', '', '', 0),
(212, 189, 'Multimedia', 'Building', 'add_post', '', 1, 0, '保存', '', '', 0),
(213, 190, 'Multimedia', 'Device', 'edit', '', 1, 0, '编辑', '', '', 0),
(214, 190, 'Multimedia', 'Device', 'delete', '', 1, 0, '删除', '', '', 0),
(215, 190, 'Multimedia', 'Device', 'add', '', 1, 0, '添加故障设备', '', '', 0),
(216, 190, 'Multimedia', 'Device', 'add_post', '', 1, 0, '保存', '', '', 0),
(217, 190, 'Multimedia', 'Device', 'edit_post', '', 1, 0, '保存', '', '', 0);

-- --------------------------------------------------------

--
-- 表的结构 `dmt_nav`
--

DROP TABLE IF EXISTS `dmt_nav`;
CREATE TABLE `dmt_nav` (
  `id` int(11) NOT NULL,
  `cid` int(11) NOT NULL COMMENT '导航分类 id',
  `parentid` int(11) NOT NULL COMMENT '导航父 id',
  `label` varchar(255) NOT NULL COMMENT '导航标题',
  `target` varchar(50) DEFAULT NULL COMMENT '打开方式',
  `href` varchar(255) NOT NULL COMMENT '导航链接',
  `icon` varchar(255) NOT NULL COMMENT '导航图标',
  `status` int(2) NOT NULL DEFAULT '1' COMMENT '状态，1显示，0不显示',
  `listorder` int(6) DEFAULT '0' COMMENT '排序',
  `path` varchar(255) NOT NULL DEFAULT '0' COMMENT '层级关系'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='前台导航表';

--
-- 转存表中的数据 `dmt_nav`
--

INSERT INTO `dmt_nav` (`id`, `cid`, `parentid`, `label`, `target`, `href`, `icon`, `status`, `listorder`, `path`) VALUES
(1, 1, 0, '首页', '', 'home', '', 1, 0, '0-1'),
(2, 1, 0, '列表演示', '', 'a:2:{s:6:"action";s:17:"Portal/List/index";s:5:"param";a:1:{s:2:"id";s:1:"1";}}', '', 1, 0, '0-2'),
(3, 1, 0, '瀑布流', '', 'a:2:{s:6:"action";s:17:"Portal/List/index";s:5:"param";a:1:{s:2:"id";s:1:"2";}}', '', 1, 0, '0-3');

-- --------------------------------------------------------

--
-- 表的结构 `dmt_nav_cat`
--

DROP TABLE IF EXISTS `dmt_nav_cat`;
CREATE TABLE `dmt_nav_cat` (
  `navcid` int(11) NOT NULL,
  `name` varchar(255) NOT NULL COMMENT '导航分类名',
  `active` int(1) NOT NULL DEFAULT '1' COMMENT '是否为主菜单，1是，0不是',
  `remark` text COMMENT '备注'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='前台导航分类表';

--
-- 转存表中的数据 `dmt_nav_cat`
--

INSERT INTO `dmt_nav_cat` (`navcid`, `name`, `active`, `remark`) VALUES
(1, '主导航', 1, '主导航');

-- --------------------------------------------------------

--
-- 表的结构 `dmt_oauth_user`
--

DROP TABLE IF EXISTS `dmt_oauth_user`;
CREATE TABLE `dmt_oauth_user` (
  `id` int(20) NOT NULL,
  `from` varchar(20) NOT NULL COMMENT '用户来源key',
  `name` varchar(30) NOT NULL COMMENT '第三方昵称',
  `head_img` varchar(200) NOT NULL COMMENT '头像',
  `uid` int(20) NOT NULL COMMENT '关联的本站用户id',
  `create_time` datetime NOT NULL COMMENT '绑定时间',
  `last_login_time` datetime NOT NULL COMMENT '最后登录时间',
  `last_login_ip` varchar(16) NOT NULL COMMENT '最后登录ip',
  `login_times` int(6) NOT NULL COMMENT '登录次数',
  `status` tinyint(2) NOT NULL,
  `access_token` varchar(512) NOT NULL,
  `expires_date` int(11) NOT NULL COMMENT 'access_token过期时间',
  `openid` varchar(40) NOT NULL COMMENT '第三方用户id'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='第三方用户表';

-- --------------------------------------------------------

--
-- 表的结构 `dmt_options`
--

DROP TABLE IF EXISTS `dmt_options`;
CREATE TABLE `dmt_options` (
  `option_id` bigint(20) UNSIGNED NOT NULL,
  `option_name` varchar(64) NOT NULL COMMENT '配置名',
  `option_value` longtext NOT NULL COMMENT '配置值',
  `autoload` int(2) NOT NULL DEFAULT '1' COMMENT '是否自动加载'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='全站配置表';

--
-- 转存表中的数据 `dmt_options`
--

INSERT INTO `dmt_options` (`option_id`, `option_name`, `option_value`, `autoload`) VALUES
(1, 'member_email_active', '{"title":"ThinkCMF\\u90ae\\u4ef6\\u6fc0\\u6d3b\\u901a\\u77e5.","template":"<p>\\u672c\\u90ae\\u4ef6\\u6765\\u81ea<a href=\\"http:\\/\\/www.thinkcmf.com\\">ThinkCMF<\\/a><br\\/><br\\/>&nbsp; &nbsp;<strong>---------------<strong style=\\"white-space: normal;\\">---<\\/strong><\\/strong><br\\/>&nbsp; &nbsp;<strong>\\u5e10\\u53f7\\u6fc0\\u6d3b\\u8bf4\\u660e<\\/strong><br\\/>&nbsp; &nbsp;<strong>---------------<strong style=\\"white-space: normal;\\">---<\\/strong><\\/strong><br\\/><br\\/>&nbsp; &nbsp; \\u5c0a\\u656c\\u7684<span style=\\"FONT-SIZE: 16px; FONT-FAMILY: Arial; COLOR: rgb(51,51,51); LINE-HEIGHT: 18px; BACKGROUND-COLOR: rgb(255,255,255)\\">#username#\\uff0c\\u60a8\\u597d\\u3002<\\/span>\\u5982\\u679c\\u60a8\\u662fThinkCMF\\u7684\\u65b0\\u7528\\u6237\\uff0c\\u6216\\u5728\\u4fee\\u6539\\u60a8\\u7684\\u6ce8\\u518cEmail\\u65f6\\u4f7f\\u7528\\u4e86\\u672c\\u5730\\u5740\\uff0c\\u6211\\u4eec\\u9700\\u8981\\u5bf9\\u60a8\\u7684\\u5730\\u5740\\u6709\\u6548\\u6027\\u8fdb\\u884c\\u9a8c\\u8bc1\\u4ee5\\u907f\\u514d\\u5783\\u573e\\u90ae\\u4ef6\\u6216\\u5730\\u5740\\u88ab\\u6ee5\\u7528\\u3002<br\\/>&nbsp; &nbsp; \\u60a8\\u53ea\\u9700\\u70b9\\u51fb\\u4e0b\\u9762\\u7684\\u94fe\\u63a5\\u5373\\u53ef\\u6fc0\\u6d3b\\u60a8\\u7684\\u5e10\\u53f7\\uff1a<br\\/>&nbsp; &nbsp; <a title=\\"\\" href=\\"http:\\/\\/#link#\\" target=\\"_self\\">http:\\/\\/#link#<\\/a><br\\/>&nbsp; &nbsp; (\\u5982\\u679c\\u4e0a\\u9762\\u4e0d\\u662f\\u94fe\\u63a5\\u5f62\\u5f0f\\uff0c\\u8bf7\\u5c06\\u8be5\\u5730\\u5740\\u624b\\u5de5\\u7c98\\u8d34\\u5230\\u6d4f\\u89c8\\u5668\\u5730\\u5740\\u680f\\u518d\\u8bbf\\u95ee)<br\\/>&nbsp; &nbsp; \\u611f\\u8c22\\u60a8\\u7684\\u8bbf\\u95ee\\uff0c\\u795d\\u60a8\\u4f7f\\u7528\\u6109\\u5feb\\uff01<br\\/><br\\/>&nbsp; &nbsp; \\u6b64\\u81f4<br\\/>&nbsp; &nbsp; ThinkCMF \\u7ba1\\u7406\\u56e2\\u961f.<\\/p>"}', 1),
(6, 'site_options', '            {\r\n            		"site_name":"多媒体教室报修",\r\n            		"site_host":"http://localhost/",\r\n            		"site_root":"",\r\n            		"site_icp":"",\r\n            		"site_admin_email":"admin@qq.com",\r\n            		"site_tongji":"",\r\n            		"site_copyright":"",\r\n            		"site_seo_title":"多媒体教室报修",\r\n            		"site_seo_keywords":"多媒体教室报修",\r\n            		"site_seo_description":"多媒体教室报修"\r\n        }', 1);

-- --------------------------------------------------------

--
-- 表的结构 `dmt_orders`
--

DROP TABLE IF EXISTS `dmt_orders`;
CREATE TABLE `dmt_orders` (
  `id` int(10) UNSIGNED NOT NULL COMMENT '主键',
  `name` varchar(100) NOT NULL COMMENT '姓名',
  `phone` varchar(20) NOT NULL COMMENT '手机号码',
  `campus_id` int(10) UNSIGNED NOT NULL COMMENT '校区id',
  `building_id` int(10) UNSIGNED NOT NULL COMMENT '区域id',
  `room_number` varchar(10) NOT NULL COMMENT '房号',
  `device_id` int(10) UNSIGNED NOT NULL,
  `description` text NOT NULL COMMENT '描述',
  `createtime` int(10) UNSIGNED NOT NULL COMMENT '创建时间',
  `user_id` int(10) UNSIGNED DEFAULT '0',
  `status` text,
  `order_time` int(10) UNSIGNED DEFAULT NULL,
  `fix_status` int(11) DEFAULT '0',
  `order_status` int(11) DEFAULT '0',
  `fix_time` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `dmt_orders`
--

INSERT INTO `dmt_orders` (`id`, `name`, `phone`, `campus_id`, `building_id`, `room_number`, `device_id`, `description`, `createtime`, `user_id`, `status`, `order_time`, `fix_status`, `order_status`, `fix_time`) VALUES
(2, '萨答复', '12345678912', 2, 1, '101', 1, '321456', 1476685765, 2, NULL, 1476899268, 0, 1, NULL),
(3, '123', '13245678912', 2, 1, '102', 1, '51654', 1476685875, 2, NULL, 1476899293, 0, 1, NULL),
(4, '123123', '12345687912', 2, 1, '102', 1, '321', 1476685975, 2, NULL, 1476898432, 0, 1, NULL),
(5, '1231', '12345678912', 2, 1, '102', 1, '213123', 1476686052, 2, NULL, 1476897171, 0, 1, NULL),
(6, '麦青强', '12345678912', 2, 1, '101', 1, '213456', 1476686213, 2, NULL, 1476897229, 0, 1, NULL),
(7, '1231', '12345678912', 2, 1, '103', 1, '123456', 1476686267, 2, '564564544654', 1476896884, 0, 2, 1476899401),
(8, '麦青强', '12345678912', 2, 1, '101', 1, '123456', 1476686314, 2, '4545644564564', 1476895585, 0, 2, 1476899320),
(9, '21', '12345678912', 2, 1, '103', 1, '12313', 1476686392, 2, NULL, 1476895582, 0, 1, NULL),
(10, '123', '12345678912', 2, 1, '103', 1, '123456', 1476686433, 2, NULL, 1476895577, 0, 1, NULL),
(19, '123', '13212313212', 2, 2, '103', 3, '123', 1476708662, 1, '4564654', 1476889166, 0, 2, 1476899275),
(20, '麦青强', '13416659522', 2, 1, '103', 1, '电脑不能开机', 1476904099, 0, NULL, NULL, 0, 0, NULL),
(21, '麦青强', '12345678912', 2, 1, '103', 3, '1231654654', 1476939892, 0, NULL, NULL, 0, 0, NULL),
(22, '麦青强', '12345678912', 2, 1, '103', 3, '4564654', 1476940470, 0, NULL, NULL, 0, 0, NULL);

-- --------------------------------------------------------

--
-- 表的结构 `dmt_plugins`
--

DROP TABLE IF EXISTS `dmt_plugins`;
CREATE TABLE `dmt_plugins` (
  `id` int(11) UNSIGNED NOT NULL COMMENT '自增id',
  `name` varchar(50) NOT NULL COMMENT '插件名，英文',
  `title` varchar(50) NOT NULL DEFAULT '' COMMENT '插件名称',
  `description` text COMMENT '插件描述',
  `type` tinyint(2) DEFAULT '0' COMMENT '插件类型, 1:网站；8;微信',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态；1开启；',
  `config` text COMMENT '插件配置',
  `hooks` varchar(255) DEFAULT NULL COMMENT '实现的钩子;以“，”分隔',
  `has_admin` tinyint(2) DEFAULT '0' COMMENT '插件是否有后台管理界面',
  `author` varchar(50) DEFAULT '' COMMENT '插件作者',
  `version` varchar(20) DEFAULT '' COMMENT '插件版本号',
  `createtime` int(11) UNSIGNED NOT NULL DEFAULT '0' COMMENT '插件安装时间',
  `listorder` smallint(6) NOT NULL DEFAULT '0' COMMENT '排序'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='插件表';

-- --------------------------------------------------------

--
-- 表的结构 `dmt_posts`
--

DROP TABLE IF EXISTS `dmt_posts`;
CREATE TABLE `dmt_posts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `post_author` bigint(20) UNSIGNED DEFAULT '0' COMMENT '发表者id',
  `post_keywords` varchar(150) NOT NULL COMMENT 'seo keywords',
  `post_source` varchar(150) DEFAULT NULL COMMENT '转载文章的来源',
  `post_date` datetime DEFAULT '2000-01-01 00:00:00' COMMENT 'post发布日期',
  `post_content` longtext COMMENT 'post内容',
  `post_title` text COMMENT 'post标题',
  `post_excerpt` text COMMENT 'post摘要',
  `post_status` int(2) DEFAULT '1' COMMENT 'post状态，1已审核，0未审核,3删除',
  `comment_status` int(2) DEFAULT '1' COMMENT '评论状态，1允许，0不允许',
  `post_modified` datetime DEFAULT '2000-01-01 00:00:00' COMMENT 'post更新时间，可在前台修改，显示给用户',
  `post_content_filtered` longtext,
  `post_parent` bigint(20) UNSIGNED DEFAULT '0' COMMENT 'post的父级post id,表示post层级关系',
  `post_type` int(2) DEFAULT '1' COMMENT 'post类型，1文章,2页面',
  `post_mime_type` varchar(100) DEFAULT '',
  `comment_count` bigint(20) DEFAULT '0',
  `smeta` text COMMENT 'post的扩展字段，保存相关扩展属性，如缩略图；格式为json',
  `post_hits` int(11) DEFAULT '0' COMMENT 'post点击数，查看数',
  `post_like` int(11) DEFAULT '0' COMMENT 'post赞数',
  `istop` tinyint(1) NOT NULL DEFAULT '0' COMMENT '置顶 1置顶； 0不置顶',
  `recommended` tinyint(1) NOT NULL DEFAULT '0' COMMENT '推荐 1推荐 0不推荐'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Portal文章表';

-- --------------------------------------------------------

--
-- 表的结构 `dmt_role`
--

DROP TABLE IF EXISTS `dmt_role`;
CREATE TABLE `dmt_role` (
  `id` int(11) UNSIGNED NOT NULL,
  `name` varchar(20) NOT NULL COMMENT '角色名称',
  `pid` smallint(6) DEFAULT NULL COMMENT '父角色ID',
  `status` tinyint(1) UNSIGNED DEFAULT NULL COMMENT '状态',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `create_time` int(11) UNSIGNED NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) UNSIGNED NOT NULL DEFAULT '0' COMMENT '更新时间',
  `listorder` int(3) NOT NULL DEFAULT '0' COMMENT '排序字段'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='角色表';

--
-- 转存表中的数据 `dmt_role`
--

INSERT INTO `dmt_role` (`id`, `name`, `pid`, `status`, `remark`, `create_time`, `update_time`, `listorder`) VALUES
(1, '超级管理员', 0, 1, '拥有网站最高管理员权限！', 1329633709, 1329633709, 0),
(5, '维护人员', NULL, 1, '维护人员', 1476897133, 1476897327, 0);

-- --------------------------------------------------------

--
-- 表的结构 `dmt_role_user`
--

DROP TABLE IF EXISTS `dmt_role_user`;
CREATE TABLE `dmt_role_user` (
  `role_id` int(11) UNSIGNED DEFAULT '0' COMMENT '角色 id',
  `user_id` int(11) DEFAULT '0' COMMENT '用户id'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='用户角色对应表';

--
-- 转存表中的数据 `dmt_role_user`
--

INSERT INTO `dmt_role_user` (`role_id`, `user_id`) VALUES
(5, 2),
(5, 3);

-- --------------------------------------------------------

--
-- 表的结构 `dmt_route`
--

DROP TABLE IF EXISTS `dmt_route`;
CREATE TABLE `dmt_route` (
  `id` int(11) NOT NULL COMMENT '路由id',
  `full_url` varchar(255) DEFAULT NULL COMMENT '完整url， 如：portal/list/index?id=1',
  `url` varchar(255) DEFAULT NULL COMMENT '实际显示的url',
  `listorder` int(5) DEFAULT '0' COMMENT '排序，优先级，越小优先级越高',
  `status` tinyint(1) DEFAULT '1' COMMENT '状态，1：启用 ;0：不启用'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='url路由表';

-- --------------------------------------------------------

--
-- 表的结构 `dmt_slide`
--

DROP TABLE IF EXISTS `dmt_slide`;
CREATE TABLE `dmt_slide` (
  `slide_id` bigint(20) UNSIGNED NOT NULL,
  `slide_cid` int(11) NOT NULL COMMENT '幻灯片分类 id',
  `slide_name` varchar(255) NOT NULL COMMENT '幻灯片名称',
  `slide_pic` varchar(255) DEFAULT NULL COMMENT '幻灯片图片',
  `slide_url` varchar(255) DEFAULT NULL COMMENT '幻灯片链接',
  `slide_des` varchar(255) DEFAULT NULL COMMENT '幻灯片描述',
  `slide_content` text COMMENT '幻灯片内容',
  `slide_status` int(2) NOT NULL DEFAULT '1' COMMENT '状态，1显示，0不显示',
  `listorder` int(10) DEFAULT '0' COMMENT '排序'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='幻灯片表';

-- --------------------------------------------------------

--
-- 表的结构 `dmt_slide_cat`
--

DROP TABLE IF EXISTS `dmt_slide_cat`;
CREATE TABLE `dmt_slide_cat` (
  `cid` int(11) NOT NULL,
  `cat_name` varchar(255) NOT NULL COMMENT '幻灯片分类',
  `cat_idname` varchar(255) NOT NULL COMMENT '幻灯片分类标识',
  `cat_remark` text COMMENT '分类备注',
  `cat_status` int(2) NOT NULL DEFAULT '1' COMMENT '状态，1显示，0不显示'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='幻灯片分类表';

-- --------------------------------------------------------

--
-- 表的结构 `dmt_terms`
--

DROP TABLE IF EXISTS `dmt_terms`;
CREATE TABLE `dmt_terms` (
  `term_id` bigint(20) UNSIGNED NOT NULL COMMENT '分类id',
  `name` varchar(200) DEFAULT NULL COMMENT '分类名称',
  `slug` varchar(200) DEFAULT '',
  `taxonomy` varchar(32) DEFAULT NULL COMMENT '分类类型',
  `description` longtext COMMENT '分类描述',
  `parent` bigint(20) UNSIGNED DEFAULT '0' COMMENT '分类父id',
  `count` bigint(20) DEFAULT '0' COMMENT '分类文章数',
  `path` varchar(500) DEFAULT NULL COMMENT '分类层级关系路径',
  `seo_title` varchar(500) DEFAULT NULL,
  `seo_keywords` varchar(500) DEFAULT NULL,
  `seo_description` varchar(500) DEFAULT NULL,
  `list_tpl` varchar(50) DEFAULT NULL COMMENT '分类列表模板',
  `one_tpl` varchar(50) DEFAULT NULL COMMENT '分类文章页模板',
  `listorder` int(5) NOT NULL DEFAULT '0' COMMENT '排序',
  `status` int(2) NOT NULL DEFAULT '1' COMMENT '状态，1发布，0不发布'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Portal 文章分类表';

--
-- 转存表中的数据 `dmt_terms`
--

INSERT INTO `dmt_terms` (`term_id`, `name`, `slug`, `taxonomy`, `description`, `parent`, `count`, `path`, `seo_title`, `seo_keywords`, `seo_description`, `list_tpl`, `one_tpl`, `listorder`, `status`) VALUES
(1, '列表演示', '', 'article', '', 0, 0, '0-1', '', '', '', 'list', 'article', 0, 1),
(2, '瀑布流', '', 'article', '', 0, 0, '0-2', '', '', '', 'list_masonry', 'article', 0, 1);

-- --------------------------------------------------------

--
-- 表的结构 `dmt_term_relationships`
--

DROP TABLE IF EXISTS `dmt_term_relationships`;
CREATE TABLE `dmt_term_relationships` (
  `tid` bigint(20) NOT NULL,
  `object_id` bigint(20) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'posts表里文章id',
  `term_id` bigint(20) UNSIGNED NOT NULL DEFAULT '0' COMMENT '分类id',
  `listorder` int(10) NOT NULL DEFAULT '0' COMMENT '排序',
  `status` int(2) NOT NULL DEFAULT '1' COMMENT '状态，1发布，0不发布'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Portal 文章分类对应表';

-- --------------------------------------------------------

--
-- 表的结构 `dmt_users`
--

DROP TABLE IF EXISTS `dmt_users`;
CREATE TABLE `dmt_users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_login` varchar(60) NOT NULL DEFAULT '' COMMENT '用户名',
  `user_pass` varchar(64) NOT NULL DEFAULT '' COMMENT '登录密码；sp_password加密',
  `user_nicename` varchar(50) NOT NULL DEFAULT '' COMMENT '用户美名',
  `user_email` varchar(100) NOT NULL DEFAULT '' COMMENT '登录邮箱',
  `user_url` varchar(100) NOT NULL DEFAULT '' COMMENT '用户个人网站',
  `avatar` varchar(255) DEFAULT NULL COMMENT '用户头像，相对于upload/avatar目录',
  `sex` smallint(1) DEFAULT '0' COMMENT '性别；0：保密，1：男；2：女',
  `birthday` date DEFAULT NULL COMMENT '生日',
  `signature` varchar(255) DEFAULT NULL COMMENT '个性签名',
  `last_login_ip` varchar(16) DEFAULT NULL COMMENT '最后登录ip',
  `last_login_time` datetime NOT NULL DEFAULT '2000-01-01 00:00:00' COMMENT '最后登录时间',
  `create_time` datetime NOT NULL DEFAULT '2000-01-01 00:00:00' COMMENT '注册时间',
  `user_activation_key` varchar(60) NOT NULL DEFAULT '' COMMENT '激活码',
  `user_status` int(11) NOT NULL DEFAULT '1' COMMENT '用户状态 0：禁用； 1：正常 ；2：未验证',
  `score` int(11) NOT NULL DEFAULT '0' COMMENT '用户积分',
  `user_type` smallint(1) DEFAULT '1' COMMENT '用户类型，1:admin ;2:会员',
  `coin` int(11) NOT NULL DEFAULT '0' COMMENT '金币',
  `mobile` varchar(20) NOT NULL DEFAULT '' COMMENT '手机号'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='用户表';

--
-- 转存表中的数据 `dmt_users`
--

INSERT INTO `dmt_users` (`id`, `user_login`, `user_pass`, `user_nicename`, `user_email`, `user_url`, `avatar`, `sex`, `birthday`, `signature`, `last_login_ip`, `last_login_time`, `create_time`, `user_activation_key`, `user_status`, `score`, `user_type`, `coin`, `mobile`) VALUES
(1, 'admin', '###2d34991547bfdabe86378f128a8856d7', 'admin', 'admin@qq.com', '', NULL, 0, NULL, NULL, '0.0.0.0', '2016-10-20 01:46:34', '2016-10-15 10:26:05', '', 1, 0, 1, 0, ''),
(2, '江诚敏', '###6515585c105ed6548a708288d0ce7a8e', '', '867@qq.com', '', NULL, 0, NULL, NULL, '0.0.0.0', '2016-10-20 01:47:10', '2016-10-19 23:10:28', '', 1, 0, 1, 0, '12345678912'),
(3, '秦章斌', '###6515585c105ed6548a708288d0ce7a8e', '', '', '', NULL, 0, NULL, NULL, '0.0.0.0', '2016-10-20 00:25:06', '2016-10-19 23:10:51', '', 1, 0, 1, 0, '12345687913');

-- --------------------------------------------------------

--
-- 表的结构 `dmt_user_favorites`
--

DROP TABLE IF EXISTS `dmt_user_favorites`;
CREATE TABLE `dmt_user_favorites` (
  `id` int(11) NOT NULL,
  `uid` bigint(20) DEFAULT NULL COMMENT '用户 id',
  `title` varchar(255) DEFAULT NULL COMMENT '收藏内容的标题',
  `url` varchar(255) DEFAULT NULL COMMENT '收藏内容的原文地址，不带域名',
  `description` varchar(500) DEFAULT NULL COMMENT '收藏内容的描述',
  `table` varchar(50) DEFAULT NULL COMMENT '收藏实体以前所在表，不带前缀',
  `object_id` int(11) DEFAULT NULL COMMENT '收藏内容原来的主键id',
  `createtime` int(11) DEFAULT NULL COMMENT '收藏时间'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='用户收藏表';

--
-- Indexes for dumped tables
--

--
-- Indexes for table `dmt_ad`
--
ALTER TABLE `dmt_ad`
  ADD PRIMARY KEY (`ad_id`),
  ADD KEY `ad_name` (`ad_name`);

--
-- Indexes for table `dmt_asset`
--
ALTER TABLE `dmt_asset`
  ADD PRIMARY KEY (`aid`);

--
-- Indexes for table `dmt_auth_access`
--
ALTER TABLE `dmt_auth_access`
  ADD KEY `role_id` (`role_id`),
  ADD KEY `rule_name` (`rule_name`) USING BTREE;

--
-- Indexes for table `dmt_auth_rule`
--
ALTER TABLE `dmt_auth_rule`
  ADD PRIMARY KEY (`id`),
  ADD KEY `module` (`module`,`status`,`type`);

--
-- Indexes for table `dmt_building`
--
ALTER TABLE `dmt_building`
  ADD PRIMARY KEY (`id`),
  ADD KEY `campus_id` (`campus_id`);

--
-- Indexes for table `dmt_campus`
--
ALTER TABLE `dmt_campus`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `dmt_comments`
--
ALTER TABLE `dmt_comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `comment_post_ID` (`post_id`),
  ADD KEY `comment_approved_date_gmt` (`status`),
  ADD KEY `comment_parent` (`parentid`),
  ADD KEY `table_id_status` (`post_table`,`post_id`,`status`),
  ADD KEY `createtime` (`createtime`);

--
-- Indexes for table `dmt_common_action_log`
--
ALTER TABLE `dmt_common_action_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_object_action` (`user`,`object`,`action`),
  ADD KEY `user_object_action_ip` (`user`,`object`,`action`,`ip`);

--
-- Indexes for table `dmt_device`
--
ALTER TABLE `dmt_device`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `dmt_guestbook`
--
ALTER TABLE `dmt_guestbook`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `dmt_links`
--
ALTER TABLE `dmt_links`
  ADD PRIMARY KEY (`link_id`),
  ADD KEY `link_visible` (`link_status`);

--
-- Indexes for table `dmt_menu`
--
ALTER TABLE `dmt_menu`
  ADD PRIMARY KEY (`id`),
  ADD KEY `status` (`status`),
  ADD KEY `parentid` (`parentid`),
  ADD KEY `model` (`model`);

--
-- Indexes for table `dmt_nav`
--
ALTER TABLE `dmt_nav`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `dmt_nav_cat`
--
ALTER TABLE `dmt_nav_cat`
  ADD PRIMARY KEY (`navcid`);

--
-- Indexes for table `dmt_oauth_user`
--
ALTER TABLE `dmt_oauth_user`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `dmt_options`
--
ALTER TABLE `dmt_options`
  ADD PRIMARY KEY (`option_id`),
  ADD UNIQUE KEY `option_name` (`option_name`);

--
-- Indexes for table `dmt_orders`
--
ALTER TABLE `dmt_orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `building_id` (`building_id`) USING BTREE,
  ADD KEY `campus_id` (`campus_id`) USING BTREE,
  ADD KEY `device_id` (`device_id`);

--
-- Indexes for table `dmt_plugins`
--
ALTER TABLE `dmt_plugins`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `dmt_posts`
--
ALTER TABLE `dmt_posts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `type_status_date` (`post_type`,`post_status`,`post_date`,`id`),
  ADD KEY `post_parent` (`post_parent`),
  ADD KEY `post_author` (`post_author`),
  ADD KEY `post_date` (`post_date`) USING BTREE;

--
-- Indexes for table `dmt_role`
--
ALTER TABLE `dmt_role`
  ADD PRIMARY KEY (`id`),
  ADD KEY `parentId` (`pid`),
  ADD KEY `status` (`status`);

--
-- Indexes for table `dmt_role_user`
--
ALTER TABLE `dmt_role_user`
  ADD KEY `group_id` (`role_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `dmt_route`
--
ALTER TABLE `dmt_route`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `dmt_slide`
--
ALTER TABLE `dmt_slide`
  ADD PRIMARY KEY (`slide_id`),
  ADD KEY `slide_cid` (`slide_cid`);

--
-- Indexes for table `dmt_slide_cat`
--
ALTER TABLE `dmt_slide_cat`
  ADD PRIMARY KEY (`cid`),
  ADD KEY `cat_idname` (`cat_idname`);

--
-- Indexes for table `dmt_terms`
--
ALTER TABLE `dmt_terms`
  ADD PRIMARY KEY (`term_id`);

--
-- Indexes for table `dmt_term_relationships`
--
ALTER TABLE `dmt_term_relationships`
  ADD PRIMARY KEY (`tid`),
  ADD KEY `term_taxonomy_id` (`term_id`);

--
-- Indexes for table `dmt_users`
--
ALTER TABLE `dmt_users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_login_key` (`user_login`),
  ADD KEY `user_nicename` (`user_nicename`);

--
-- Indexes for table `dmt_user_favorites`
--
ALTER TABLE `dmt_user_favorites`
  ADD PRIMARY KEY (`id`),
  ADD KEY `uid` (`uid`);

--
-- 在导出的表使用AUTO_INCREMENT
--

--
-- 使用表AUTO_INCREMENT `dmt_ad`
--
ALTER TABLE `dmt_ad`
  MODIFY `ad_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '广告id';
--
-- 使用表AUTO_INCREMENT `dmt_asset`
--
ALTER TABLE `dmt_asset`
  MODIFY `aid` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `dmt_auth_rule`
--
ALTER TABLE `dmt_auth_rule`
  MODIFY `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '规则id,自增主键', AUTO_INCREMENT=205;
--
-- 使用表AUTO_INCREMENT `dmt_building`
--
ALTER TABLE `dmt_building`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键', AUTO_INCREMENT=3;
--
-- 使用表AUTO_INCREMENT `dmt_campus`
--
ALTER TABLE `dmt_campus`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键', AUTO_INCREMENT=3;
--
-- 使用表AUTO_INCREMENT `dmt_comments`
--
ALTER TABLE `dmt_comments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `dmt_common_action_log`
--
ALTER TABLE `dmt_common_action_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `dmt_device`
--
ALTER TABLE `dmt_device`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键', AUTO_INCREMENT=4;
--
-- 使用表AUTO_INCREMENT `dmt_guestbook`
--
ALTER TABLE `dmt_guestbook`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `dmt_links`
--
ALTER TABLE `dmt_links`
  MODIFY `link_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- 使用表AUTO_INCREMENT `dmt_menu`
--
ALTER TABLE `dmt_menu`
  MODIFY `id` smallint(6) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=218;
--
-- 使用表AUTO_INCREMENT `dmt_nav`
--
ALTER TABLE `dmt_nav`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- 使用表AUTO_INCREMENT `dmt_nav_cat`
--
ALTER TABLE `dmt_nav_cat`
  MODIFY `navcid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- 使用表AUTO_INCREMENT `dmt_oauth_user`
--
ALTER TABLE `dmt_oauth_user`
  MODIFY `id` int(20) NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `dmt_options`
--
ALTER TABLE `dmt_options`
  MODIFY `option_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- 使用表AUTO_INCREMENT `dmt_orders`
--
ALTER TABLE `dmt_orders`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键', AUTO_INCREMENT=23;
--
-- 使用表AUTO_INCREMENT `dmt_plugins`
--
ALTER TABLE `dmt_plugins`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增id';
--
-- 使用表AUTO_INCREMENT `dmt_posts`
--
ALTER TABLE `dmt_posts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `dmt_role`
--
ALTER TABLE `dmt_role`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- 使用表AUTO_INCREMENT `dmt_route`
--
ALTER TABLE `dmt_route`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '路由id';
--
-- 使用表AUTO_INCREMENT `dmt_slide`
--
ALTER TABLE `dmt_slide`
  MODIFY `slide_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `dmt_slide_cat`
--
ALTER TABLE `dmt_slide_cat`
  MODIFY `cid` int(11) NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `dmt_terms`
--
ALTER TABLE `dmt_terms`
  MODIFY `term_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '分类id', AUTO_INCREMENT=3;
--
-- 使用表AUTO_INCREMENT `dmt_term_relationships`
--
ALTER TABLE `dmt_term_relationships`
  MODIFY `tid` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `dmt_users`
--
ALTER TABLE `dmt_users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- 使用表AUTO_INCREMENT `dmt_user_favorites`
--
ALTER TABLE `dmt_user_favorites`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- 限制导出的表
--

--
-- 限制表 `dmt_building`
--
ALTER TABLE `dmt_building`
  ADD CONSTRAINT `dmt_building_ibfk_1` FOREIGN KEY (`campus_id`) REFERENCES `dmt_campus` (`id`) ON UPDATE CASCADE;

--
-- 限制表 `dmt_orders`
--
ALTER TABLE `dmt_orders`
  ADD CONSTRAINT `dmt_orders_ibfk_1` FOREIGN KEY (`building_id`) REFERENCES `dmt_building` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `dmt_orders_ibfk_2` FOREIGN KEY (`campus_id`) REFERENCES `dmt_campus` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `dmt_orders_ibfk_3` FOREIGN KEY (`device_id`) REFERENCES `dmt_device` (`id`) ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
