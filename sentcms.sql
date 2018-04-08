-- phpMyAdmin SQL Dump
-- version phpStudy 2014
-- http://www.phpmyadmin.net
--
-- 主机: localhost
-- 生成日期: 2018 �?04 �?08 �?08:35
-- 服务器版本: 5.7.17
-- PHP 版本: 5.5.38

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- 数据库: `sentcms`
--

-- --------------------------------------------------------

--
-- 表的结构 `sent_action`
--

CREATE TABLE IF NOT EXISTS `sent_action` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` char(30) NOT NULL DEFAULT '' COMMENT '行为唯一标识',
  `title` char(80) NOT NULL DEFAULT '' COMMENT '行为说明',
  `remark` char(140) NOT NULL DEFAULT '' COMMENT '行为描述',
  `rule` text COMMENT '行为规则',
  `log` text COMMENT '日志规则',
  `type` tinyint(2) unsigned NOT NULL DEFAULT '1' COMMENT '类型',
  `status` tinyint(2) NOT NULL DEFAULT '0' COMMENT '状态',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='系统行为表' AUTO_INCREMENT=13 ;

--
-- 转存表中的数据 `sent_action`
--

INSERT INTO `sent_action` (`id`, `name`, `title`, `remark`, `rule`, `log`, `type`, `status`, `update_time`) VALUES
(1, 'user_login', '用户登录', '积分+10，每天一次', 'table:member|field:score|condition:uid={$self} AND status>-1|rule:score+10|cycle:24|max:1;', '[user|get_nickname]在[time|time_format]登录了后台', 1, 1, 1387181220),
(2, 'add_article', '发布文章', '积分+5，每天上限5次', 'table:member|field:score|condition:uid={$self}|rule:score+5|cycle:24|max:5', '', 2, 1, 1380173180),
(3, 'review', '评论', '评论积分+1，无限制', 'table:member|field:score|condition:uid={$self}|rule:score+1', '', 2, 1, 1383285646),
(4, 'add_document', '发表文档', '积分+10，每天上限5次', 'table:member|field:score|condition:uid={$self}|rule:score+10|cycle:24|max:5', '[user|get_nickname]在[time|time_format]发表了一篇文章。\r\n表[model]，记录编号[record]。', 2, 1, 1386139726),
(5, 'add_document_topic', '发表讨论', '积分+5，每天上限10次', 'table:member|field:score|condition:uid={$self}|rule:score+5|cycle:24|max:10', '', 2, 1, 1383285551),
(6, 'update_config', '更新配置', '新增或修改或删除配置', '', '', 1, 1, 1383294988),
(7, 'update_model', '更新模型', '新增或修改模型', '', '', 1, 1, 1383295057),
(8, 'update_attribute', '更新属性', '新增或更新或删除属性', '', '', 1, 1, 1383295963),
(9, 'update_channel', '更新导航', '新增或修改或删除导航', '', '', 1, 1, 1383296301),
(10, 'update_menu', '更新菜单', '新增或修改或删除菜单', '', '', 1, 1, 1383296392),
(11, 'update_category', '更新分类', '新增或修改或删除分类.', '', '', 1, 1, 1383296765);

-- --------------------------------------------------------

--
-- 表的结构 `sent_action_log`
--

CREATE TABLE IF NOT EXISTS `sent_action_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `action_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '行为id',
  `user_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '执行用户id',
  `action_ip` bigint(20) NOT NULL COMMENT '执行行为者ip',
  `model` varchar(50) NOT NULL DEFAULT '' COMMENT '触发行为的表',
  `record_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '触发行为的数据id',
  `remark` varchar(255) NOT NULL DEFAULT '' COMMENT '日志备注',
  `status` tinyint(2) NOT NULL DEFAULT '1' COMMENT '状态',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '执行行为的时间',
  PRIMARY KEY (`id`),
  KEY `action_ip_ix` (`action_ip`),
  KEY `action_id_ix` (`action_id`),
  KEY `user_id_ix` (`user_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='行为日志表' AUTO_INCREMENT=26 ;

--
-- 转存表中的数据 `sent_action_log`
--

INSERT INTO `sent_action_log` (`id`, `action_id`, `user_id`, `action_ip`, `model`, `record_id`, `remark`, `status`, `create_time`) VALUES
(1, 9, 1, 0, 'channel', 2, '操作url：/sentcms/admin/channel/edit/id/2/pid/0.html', 1, 1517296760),
(2, 10, 1, 0, 'Menu', 2, '操作url：/sentcms/admin/menu/edit/id/2.html', 1, 1517296888),
(3, 11, 1, 0, 'category', 1, '操作url：/sentcms/admin/category/edit.html', 1, 1517297060),
(4, 11, 1, 0, 'category', 2, '操作url：/sentcms/admin/category/edit.html', 1, 1517297198),
(5, 11, 1, 0, 'category', 3, '操作url：/sentcms/admin/category/edit.html', 1, 1517297217),
(6, 7, 1, 0, 'model', 3, '操作url：/sentcms/admin/model/update.html', 1, 1517298705),
(7, 10, 1, 0, 'Menu', 1, '操作url：/sentcms/admin/menu/add/pid/3.html', 1, 1517299423),
(8, 10, 1, 0, 'Menu', 28, '操作url：/sentcms/admin/menu/edit/id/28.html', 1, 1517299519),
(9, 10, 1, 0, 'Menu', 28, '操作url：/sentcms/admin/menu/edit/id/28.html', 1, 1517299579),
(10, 10, 1, 0, 'Menu', 28, '操作url：/sentcms/admin/menu/edit/id/28.html', 1, 1517299635),
(11, 10, 1, 0, 'Menu', 28, '操作url：/sentcms/admin/menu/edit/id/28.html', 1, 1517299930),
(12, 10, 1, 0, 'Menu', 28, '操作url：/sentcms/admin/menu/edit/id/28.html', 1, 1517302156),
(13, 11, 1, 0, 'category', 1, '操作url：/sentcms/admin/code/add.html', 1, 1517305995),
(14, 11, 1, 0, 'category', 1, '操作url：/sentcms/admin/code/add.html', 1, 1517306081),
(15, 11, 1, 0, 'category', 1, '操作url：/sentcms/admin/code/add.html', 1, 1517306132),
(16, 11, 1, 0, 'category', 1, '操作url：/sentcms/admin/code/add.html', 1, 1517306214),
(17, 11, 1, 0, 'category', 1, '操作url：/sentcms/admin/code/add.html', 1, 1517361597),
(18, 9, 1, 0, 'channel', 2, '操作url：/sentcms/admin/channel/edit/id/2/pid/0.html', 1, 1517384347),
(19, 10, 1, 0, 'Menu', 1, '操作url：/sentcms/admin/menu/add/pid/0.html', 1, 1517475242),
(20, 10, 1, 0, 'Menu', 28, '操作url：/sentcms/admin/menu/edit/id/28.html', 1, 1517475264),
(21, 10, 1, 0, 'Menu', 29, '操作url：/sentcms/admin/menu/edit/id/29.html', 1, 1517475307),
(22, 10, 1, 0, 'Menu', 29, '操作url：/sentcms/admin/menu/edit/id/29.html', 1, 1517475370),
(23, 11, 1, 0, 'category', 1, '操作url：/sentcms/admin/code/add.html', 1, 1518075680),
(24, 10, 1, 0, 'Menu', 5, '操作url：/sentcms/admin/menu/edit/id/5.html', 1, 1523166939),
(25, 10, 1, 0, 'Menu', 5, '操作url：/sentcms/admin/menu/edit/id/5.html', 1, 1523167142);

-- --------------------------------------------------------

--
-- 表的结构 `sent_ad`
--

CREATE TABLE IF NOT EXISTS `sent_ad` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `place_id` int(11) DEFAULT NULL COMMENT '广告位ID',
  `title` varchar(150) DEFAULT NULL COMMENT '广告名称',
  `cover_id` int(11) DEFAULT NULL COMMENT '广告图片',
  `photolist` varchar(20) NOT NULL COMMENT '辅助图片',
  `url` varchar(150) DEFAULT NULL COMMENT '广告链接',
  `listurl` varchar(255) DEFAULT NULL COMMENT '辅助链接',
  `background` varchar(150) DEFAULT NULL COMMENT '广告背景',
  `content` text COMMENT '广告描述',
  `create_time` int(11) NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '广告位状态',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='广告表' AUTO_INCREMENT=6 ;

--
-- 转存表中的数据 `sent_ad`
--

INSERT INTO `sent_ad` (`id`, `place_id`, `title`, `cover_id`, `photolist`, `url`, `listurl`, `background`, `content`, `create_time`, `update_time`, `status`) VALUES
(1, 1, '与入网企业签订合法有效的手续,保证所有防伪码的真实有效性.', 6, '', '', '', '', '与入网企业签订合法有效的手续,保证所有防伪码的真实有效性.', 1440433466, 1523167336, 1),
(2, 1, '系统架设在阿里云服务器集群中,更安全,更高效的为您提供查询服务', 7, '', '', '', '', '系统架设在阿里云服务器集群中,更安全,更高效的为您提供查询服务', 1440433531, 1523167362, 1),
(3, 1, '提供技术领先的,方式多样化的系统查询服务', 8, '', '', '', '', '提供技术领先的,方式多样化的系统查询服务', 1440433554, 1523167391, 1);

-- --------------------------------------------------------

--
-- 表的结构 `sent_addons`
--

CREATE TABLE IF NOT EXISTS `sent_addons` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(40) NOT NULL COMMENT '插件名或标识',
  `title` varchar(20) NOT NULL DEFAULT '' COMMENT '中文名',
  `description` text COMMENT '插件描述',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态',
  `config` text COMMENT '配置',
  `author` varchar(40) DEFAULT '' COMMENT '作者',
  `version` varchar(20) DEFAULT '' COMMENT '版本号',
  `isinstall` int(10) DEFAULT '0' COMMENT '是否安装',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '安装时间',
  `has_adminlist` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否有后台列表',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='插件表' AUTO_INCREMENT=4 ;

--
-- 转存表中的数据 `sent_addons`
--

INSERT INTO `sent_addons` (`id`, `name`, `title`, `description`, `status`, `config`, `author`, `version`, `isinstall`, `create_time`, `has_adminlist`) VALUES
(1, 'Devteam', '开发团队信息', '开发团队成员信息', 1, '', 'molong', '0.1', 1, 0, 0),
(2, 'Sitestat', '站点统计信息', '统计站点的基础信息', 1, '', 'thinkphp', '0.2', 1, 0, 0),
(3, 'Systeminfo', '系统环境信息', '用于显示一些服务器的信息', 1, '', 'molong', '0.1', 1, 0, 0);

-- --------------------------------------------------------

--
-- 表的结构 `sent_ad_place`
--

CREATE TABLE IF NOT EXISTS `sent_ad_place` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `title` varchar(150) DEFAULT NULL COMMENT '广告位名称',
  `name` varchar(20) NOT NULL COMMENT '调用名称',
  `show_type` int(11) NOT NULL DEFAULT '5' COMMENT '广告位类型',
  `show_num` int(11) NOT NULL DEFAULT '5' COMMENT '显示条数',
  `start_time` int(11) NOT NULL DEFAULT '0' COMMENT '开始时间',
  `end_time` int(11) NOT NULL DEFAULT '0' COMMENT '结束时间',
  `create_time` int(11) NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) NOT NULL DEFAULT '0' COMMENT '更新时间',
  `template` varchar(150) DEFAULT NULL COMMENT '广告位模板',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '广告位状态',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='广告位表' AUTO_INCREMENT=3 ;

--
-- 转存表中的数据 `sent_ad_place`
--

INSERT INTO `sent_ad_place` (`id`, `title`, `name`, `show_type`, `show_num`, `start_time`, `end_time`, `create_time`, `update_time`, `template`, `status`) VALUES
(1, '首页幻灯片', 'banner', 1, 5, 0, 0, 1440433367, 1440433367, '', 1);

-- --------------------------------------------------------

--
-- 表的结构 `sent_attachment`
--

CREATE TABLE IF NOT EXISTS `sent_attachment` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `title` char(30) NOT NULL DEFAULT '' COMMENT '附件显示名',
  `type` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '附件类型',
  `source` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '资源ID',
  `record_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '关联记录ID',
  `download` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '下载次数',
  `size` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '附件大小',
  `dir` int(12) unsigned NOT NULL DEFAULT '0' COMMENT '上级目录ID',
  `sort` int(8) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '状态',
  PRIMARY KEY (`id`),
  KEY `idx_record_status` (`record_id`,`status`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='附件表' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `sent_attribute`
--

CREATE TABLE IF NOT EXISTS `sent_attribute` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL DEFAULT '' COMMENT '字段名',
  `title` varchar(100) NOT NULL DEFAULT '' COMMENT '字段注释',
  `length` varchar(100) NOT NULL DEFAULT '' COMMENT '字段定义',
  `type` varchar(20) NOT NULL DEFAULT '' COMMENT '数据类型',
  `value` varchar(100) NOT NULL DEFAULT '' COMMENT '字段默认值',
  `remark` varchar(100) NOT NULL DEFAULT '' COMMENT '备注',
  `is_show` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '是否显示',
  `extra` varchar(255) NOT NULL DEFAULT '' COMMENT '参数',
  `model_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '模型id',
  `is_must` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否必填',
  `status` tinyint(2) NOT NULL DEFAULT '0' COMMENT '状态',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `validate_rule` varchar(255) NOT NULL DEFAULT '',
  `validate_time` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `error_info` varchar(100) NOT NULL DEFAULT '',
  `validate_type` varchar(25) NOT NULL DEFAULT '',
  `auto_rule` varchar(100) NOT NULL DEFAULT '',
  `auto_time` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `auto_type` varchar(25) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `model_id` (`model_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='模型属性表' AUTO_INCREMENT=56 ;

--
-- 转存表中的数据 `sent_attribute`
--

INSERT INTO `sent_attribute` (`id`, `name`, `title`, `length`, `type`, `value`, `remark`, `is_show`, `extra`, `model_id`, `is_must`, `status`, `update_time`, `create_time`, `validate_rule`, `validate_time`, `error_info`, `validate_type`, `auto_rule`, `auto_time`, `auto_type`) VALUES
(1, 'uid', '用户ID', '10', 'num', '0', '', 0, '', 1, 0, 1, 1384508362, 1383891233, '', 0, '', '', '', 0, ''),
(2, 'name', '标识', '40', 'string', '', '同一根节点下标识不重复', 0, '', 1, 0, 1, 1517362683, 1383891233, '', 0, '', '0', '', 0, '0'),
(3, 'title', '标题', '80', 'string', '', '文档标题', 1, '', 1, 0, 1, 1383894778, 1383891233, '', 0, '', '', '', 0, ''),
(4, 'category_id', '所属分类', '10', 'bind', '', '', 1, 'category', 1, 0, 1, 1384508336, 1383891233, '', 0, '', '', '', 0, ''),
(5, 'description', '描述', '140', 'textarea', '', '', 1, '', 1, 0, 1, 1383894927, 1383891233, '', 0, '', '', '', 0, ''),
(8, 'model_id', '内容模型ID', '3', 'num', '0', '该文档所对应的模型', 0, '', 1, 0, 1, 1384508350, 1383891233, '', 0, '', '', '', 0, ''),
(10, 'position', '推荐位', '5', 'select', '0', '多个推荐则将其推荐值相加', 1, '[DOCUMENT_POSITION]', 1, 0, 1, 1383895640, 1383891233, '', 0, '', '', '', 0, ''),
(11, 'link_id', '外链', '10', 'num', '0', '0-非外链，大于0-外链ID,需要函数进行链接与编号的转换', 1, '', 1, 0, 1, 1383895757, 1383891233, '', 0, '', '', '', 0, ''),
(12, 'cover_id', '封面', '10', 'image', '0', '0-无封面，大于0-封面图片ID，需要函数处理', 1, '', 1, 0, 1, 1384147827, 1383891233, '', 0, '', '', '', 0, ''),
(13, 'display', '可见性', '3', 'bool', '1', '', 1, '0:不可见\r\n1:所有人可见', 1, 0, 1, 1386662271, 1383891233, '', 0, '', 'regex', '', 0, 'function'),
(14, 'deadline', '截至时间', '10', 'datetime', '0', '0-永久有效', 1, '', 1, 0, 1, 1387163248, 1383891233, '', 0, '', 'regex', '', 0, 'function'),
(15, 'attach', '附件数量', '3', 'num', '0', '', 0, '', 1, 0, 1, 1387260355, 1383891233, '', 0, '', 'regex', '', 0, 'function'),
(16, 'view', '浏览量', '10', 'num', '0', '', 1, '', 1, 0, 1, 1383895835, 1383891233, '', 0, '', '', '', 0, ''),
(17, 'comment', '评论数', '10', 'num', '0', '', 1, '', 1, 0, 1, 1383895846, 1383891233, '', 0, '', '', '', 0, ''),
(18, 'extend', '扩展统计字段', '10', 'num', '0', '根据需求自行使用', 0, '', 1, 0, 1, 1384508264, 1383891233, '', 0, '', '', '', 0, ''),
(19, 'level', '优先级', '10', 'num', '0', '越高排序越靠前', 1, '', 1, 0, 1, 1453278679, 1383891233, '', 0, '', '0', '', 0, '0'),
(20, 'create_time', '创建时间', '10', 'datetime', '0', '', 1, '', 1, 0, 1, 1383895903, 1383891233, '', 0, '', '', '', 0, ''),
(21, 'update_time', '更新时间', '10', 'text', '0', '', 0, '', 1, 0, 1, 1453278665, 1383891233, '', 0, '', '0', '', 0, '0'),
(22, 'status', '数据状态', '4', 'select', '1', '状态', 0, '-1:删除\r\n0:禁用\r\n1:正常\r\n2:待审核\r\n3:草稿', 1, 1, 1, 1517369368, 1383891233, '', 0, '', '0', '', 0, '0'),
(24, 'content', '内容', '', 'editor', '', '', 1, '', 2, 0, 1, 1453859207, 1453859207, '', 0, '', '0', '', 0, '0'),
(25, 'tags', '标签', '20', 'tags', '', '', 1, '', 2, 0, 1, 1453881165, 1453881107, '', 0, '', '0', '', 0, '0'),
(26, 'photo_list', '图片列表', '50', 'images', '', '', 1, '', 3, 0, 1, 1454052339, 1454052339, '', 0, '', '0', '', 0, '0'),
(27, 'content', '内容', '', 'editor', '', '', 1, '', 3, 0, 1, 1454052355, 1454052355, '', 0, '', '0', '', 0, '0'),
(28, 'title', '标题', '200', 'text', '', '', 1, '', 4, 0, 0, 0, 0, '', 0, '', '0', '', 0, '0'),
(29, 'model_id', '模型ID', '11', 'num', '', '', 0, '', 4, 1, 0, 0, 0, '', 0, '', '0', '', 0, '0'),
(30, 'cover_id', '封面', '11', 'image', '0', '', 1, '', 4, 0, 0, 0, 0, '', 0, '', '0', '', 0, '0'),
(31, 'content', '内容', '', 'editor', '', '', 1, '', 4, 0, 0, 0, 0, '', 0, '', '0', '', 0, '0'),
(32, 'create_time', '创建时间', '11', 'datetime', '', '', 1, '', 4, 0, 0, 0, 0, '', 0, '', '0', '', 0, '0'),
(33, 'update_time', '更新时间', '11', 'datetime', '', '', 1, '', 4, 0, 0, 0, 0, '', 0, '', '0', '', 0, '0'),
(34, 'is_top', '是否置顶', '1', 'bool', '0', '111', 0, '0:否\r\n1:是', 1, 0, 0, 1517362603, 1466041226, '', 0, '', '0', '', 0, '0'),
(55, 'code', '防伪码', '16', 'text', '', '防伪码为16位纯数字', 1, '', 3, 1, 0, 1517364059, 1517362781, '', 0, '', '0', '', 0, '0');

-- --------------------------------------------------------

--
-- 表的结构 `sent_auth_extend`
--

CREATE TABLE IF NOT EXISTS `sent_auth_extend` (
  `group_id` mediumint(10) unsigned NOT NULL COMMENT '用户id',
  `extend_id` mediumint(8) unsigned NOT NULL COMMENT '扩展表中数据的id',
  `type` tinyint(1) unsigned NOT NULL COMMENT '扩展类型标识 1:栏目分类权限;2:模型权限',
  UNIQUE KEY `group_extend_type` (`group_id`,`extend_id`,`type`),
  KEY `uid` (`group_id`),
  KEY `group_id` (`extend_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='用户组与分类的对应关系表';

-- --------------------------------------------------------

--
-- 表的结构 `sent_auth_group`
--

CREATE TABLE IF NOT EXISTS `sent_auth_group` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '用户组id,自增主键',
  `module` varchar(20) NOT NULL DEFAULT '' COMMENT '用户组所属模块',
  `type` varchar(10) NOT NULL DEFAULT '' COMMENT '组类型',
  `title` char(20) NOT NULL DEFAULT '' COMMENT '用户组中文名称',
  `description` varchar(80) NOT NULL DEFAULT '' COMMENT '描述信息',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '用户组状态：为1正常，为0禁用,-1为删除',
  `rules` varchar(500) NOT NULL DEFAULT '' COMMENT '用户组拥有的规则id，多个规则 , 隔开',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- 转存表中的数据 `sent_auth_group`
--

INSERT INTO `sent_auth_group` (`id`, `module`, `type`, `title`, `description`, `status`, `rules`) VALUES
(1, 'admin', '1', '网站编辑', '网站编辑，针对内容进行管理', 1, '24,23,22,20,1'),
(2, 'admin', '1', '网站运营', '针对网站SEO进行管理', 1, '21,20,14,12,3,19,18,17,16,15,13,1');

-- --------------------------------------------------------

--
-- 表的结构 `sent_auth_group_access`
--

CREATE TABLE IF NOT EXISTS `sent_auth_group_access` (
  `uid` int(10) unsigned NOT NULL COMMENT '用户id',
  `group_id` mediumint(8) unsigned NOT NULL COMMENT '用户组id',
  UNIQUE KEY `uid_group_id` (`uid`,`group_id`),
  KEY `uid` (`uid`),
  KEY `group_id` (`group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `sent_auth_group_access`
--

INSERT INTO `sent_auth_group_access` (`uid`, `group_id`) VALUES
(1, 2),
(2, 1),
(14, 2);

-- --------------------------------------------------------

--
-- 表的结构 `sent_auth_rule`
--

CREATE TABLE IF NOT EXISTS `sent_auth_rule` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '规则id,自增主键',
  `module` varchar(20) NOT NULL COMMENT '规则所属module',
  `type` tinyint(2) NOT NULL DEFAULT '1' COMMENT '1-url;2-主菜单',
  `name` char(80) NOT NULL DEFAULT '' COMMENT '规则唯一英文标识',
  `title` char(20) NOT NULL DEFAULT '' COMMENT '规则中文描述',
  `group` char(20) NOT NULL DEFAULT '' COMMENT '权限节点分组',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否有效(0:无效,1:有效)',
  `condition` varchar(300) NOT NULL DEFAULT '' COMMENT '规则附加条件',
  PRIMARY KEY (`id`),
  KEY `module` (`module`,`status`,`type`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=34 ;

--
-- 转存表中的数据 `sent_auth_rule`
--

INSERT INTO `sent_auth_rule` (`id`, `module`, `type`, `name`, `title`, `group`, `status`, `condition`) VALUES
(1, 'admin', 2, 'admin/index/index', '后台首页', '首页管理', 1, ''),
(2, 'admin', 2, 'admin/form/index', '自定义表单', '运营管理', 1, ''),
(3, 'admin', 2, 'admin/addons/hooks', '钩子列表', '扩展管理', 1, ''),
(4, 'admin', 2, 'admin/addons/index', '插件列表', '扩展管理', 1, ''),
(5, 'admin', 2, 'admin/ad/index', '广告管理', '运营管理', 1, ''),
(6, 'admin', 2, 'admin/link/index', '友链管理', '运营管理', 1, ''),
(7, 'admin', 2, 'admin/action/log', '行为日志', '会员管理', 1, ''),
(8, 'admin', 2, 'admin/action/index', '行为列表', '会员管理', 1, ''),
(9, 'admin', 2, 'admin/group/access', '权限列表', '会员管理', 1, ''),
(10, 'admin', 2, 'admin/group/index', '用户组表', '会员管理', 1, ''),
(11, 'admin', 2, 'admin/user/index', '用户列表', '会员管理', 1, ''),
(12, 'admin', 2, 'admin/model/index', '模型管理', '内容管理', 1, ''),
(13, 'admin', 2, 'admin/category/index', '栏目管理', '内容管理', 1, ''),
(14, 'admin', 2, 'admin/seo/index', 'SEO设置', '系统管理', 1, ''),
(15, 'admin', 2, 'admin/database/index?type=import', '数据恢复', '系统管理', 1, ''),
(16, 'admin', 2, 'admin/database/index?type=export', '数据备份', '系统管理', 1, ''),
(17, 'admin', 2, 'admin/channel/index', '导航管理', '系统管理', 1, ''),
(18, 'admin', 2, 'admin/menu/index', '菜单管理', '系统管理', 1, ''),
(19, 'admin', 2, 'admin/config/group', '配置管理', '系统管理', 1, ''),
(20, 'admin', 2, 'admin/index/clear', '更新缓存', '首页管理', 1, ''),
(21, 'admin', 1, 'admin/config/add', '配置添加', '系统管理', 1, ''),
(22, 'admin', 2, 'admin/content/index', '内容列表', '内容管理', 1, ''),
(23, 'admin', 2, 'admin/content/add', '内容添加', '内容管理', 1, ''),
(24, 'admin', 1, 'admin/content/edit', '内容编辑', '内容管理', 1, ''),
(25, 'admin', 1, 'admin/content/del', '内容删除', '内容管理', 1, ''),
(26, 'admin', 1, 'admin/content/status', '内容设置状态', '内容管理', 1, ''),
(27, 'admin', 1, 'admin/category/add', '栏目添加', '内容管理', 1, ''),
(28, 'admin', 1, 'admin/category/edit', '栏目编辑', '内容管理', 1, ''),
(29, 'admin', 1, 'admin/category/editable', '栏目单字编辑', '内容管理', 1, ''),
(30, 'admin', 1, 'admin/category/remove', '栏目删除', '内容管理', 1, ''),
(31, 'admin', 1, 'admin/category/merge', '栏目合并', '内容管理', 1, ''),
(32, 'admin', 1, 'admin/category/move', '栏目移动', '内容管理', 1, ''),
(33, 'admin', 1, 'admin/category/status', '栏目状态', '内容管理', 1, '');

-- --------------------------------------------------------

--
-- 表的结构 `sent_category`
--

CREATE TABLE IF NOT EXISTS `sent_category` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '分类ID',
  `name` varchar(30) NOT NULL COMMENT '标志',
  `title` varchar(50) NOT NULL COMMENT '标题',
  `pid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '上级分类ID',
  `sort` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '排序（同级有效）',
  `list_row` tinyint(3) unsigned NOT NULL DEFAULT '10' COMMENT '列表每页行数',
  `meta_title` varchar(50) NOT NULL DEFAULT '' COMMENT 'SEO的网页标题',
  `keywords` varchar(255) NOT NULL DEFAULT '' COMMENT '关键字',
  `description` varchar(255) NOT NULL DEFAULT '' COMMENT '描述',
  `template_index` varchar(100) NOT NULL DEFAULT '' COMMENT '频道页模板',
  `template_lists` varchar(100) NOT NULL DEFAULT '' COMMENT '列表页模板',
  `template_detail` varchar(100) NOT NULL DEFAULT '' COMMENT '详情页模板',
  `template_edit` varchar(100) NOT NULL DEFAULT '' COMMENT '编辑页模板',
  `model` varchar(100) NOT NULL DEFAULT '' COMMENT '列表绑定模型',
  `model_sub` varchar(100) NOT NULL DEFAULT '' COMMENT '子文档绑定模型',
  `type` varchar(100) NOT NULL DEFAULT '' COMMENT '允许发布的内容类型',
  `link_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '外链',
  `allow_publish` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '是否允许发布内容',
  `display` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '可见性',
  `reply` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '是否允许回复',
  `check` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '发布的文章是否需要审核',
  `reply_model` varchar(100) NOT NULL DEFAULT '',
  `extend` text COMMENT '扩展设置',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '数据状态',
  `icon` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '分类图标',
  `groups` varchar(255) NOT NULL DEFAULT '' COMMENT '分组定义',
  PRIMARY KEY (`id`),
  KEY `pid` (`pid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='分类表' AUTO_INCREMENT=8 ;

--
-- 转存表中的数据 `sent_category`
--

INSERT INTO `sent_category` (`id`, `name`, `title`, `pid`, `sort`, `list_row`, `meta_title`, `keywords`, `description`, `template_index`, `template_lists`, `template_detail`, `template_edit`, `model`, `model_sub`, `type`, `link_id`, `allow_publish`, `display`, `reply`, `check`, `reply_model`, `extend`, `create_time`, `update_time`, `status`, `icon`, `groups`) VALUES
(1, 'product', '标签', 0, 0, 10, '', '', '', '', '', '', '', '', '2', '2,1', 0, 0, 1, 0, 0, '1', 'null', 1379474947, 1517297060, 1, 0, ''),
(2, 'biaoqian', '防伪标签', 1, 1, 10, '', '', '', '', '', '', '', '2,3', '2', '2,1,3', 0, 1, 1, 0, 1, '1', '', 1379475028, 1517297198, 1, 0, ''),
(3, 'guaguaka', '防伪刮刮卡', 1, 2, 10, '', '', '', '', '', '', '', '', '', '', 0, 1, 1, 0, 0, '', '', 0, 1517297217, 1, 0, '');

-- --------------------------------------------------------

--
-- 表的结构 `sent_channel`
--

CREATE TABLE IF NOT EXISTS `sent_channel` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '频道ID',
  `pid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '上级频道ID',
  `title` char(30) NOT NULL COMMENT '频道标题',
  `url` char(100) NOT NULL COMMENT '频道连接',
  `type` int(2) NOT NULL DEFAULT '0' COMMENT '导航类型',
  `sort` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '导航排序',
  `icon` varchar(20) DEFAULT NULL COMMENT '图标',
  `color` varchar(20) DEFAULT NULL COMMENT '导航颜色',
  `band_color` varchar(20) DEFAULT NULL COMMENT '标识点颜色',
  `band_text` varchar(30) DEFAULT NULL COMMENT '标志点文字',
  `active` char(100) NOT NULL DEFAULT '' COMMENT '当前链接',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态',
  `target` tinyint(2) unsigned NOT NULL DEFAULT '0' COMMENT '新窗口打开',
  PRIMARY KEY (`id`),
  KEY `pid` (`pid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=21 ;

--
-- 转存表中的数据 `sent_channel`
--

INSERT INTO `sent_channel` (`id`, `pid`, `title`, `url`, `type`, `sort`, `icon`, `color`, `band_color`, `band_text`, `active`, `create_time`, `update_time`, `status`, `target`) VALUES
(1, 0, '网站首页', 'index/index/index', 0, 1, 'home', '', '', '', 'home', 1379475111, 1464490544, 1, 0),
(2, 0, '产品中心', 'photo/list/1', 1, 1, 'article', '', '', '', 'article', 1379475111, 1517384347, 1, 0);

-- --------------------------------------------------------

--
-- 表的结构 `sent_code`
--

CREATE TABLE IF NOT EXISTS `sent_code` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL COMMENT '名称',
  `content` text NOT NULL COMMENT '码段',
  `num` int(11) NOT NULL COMMENT '数量',
  `sort` int(6) NOT NULL DEFAULT '0' COMMENT '排序',
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '状态',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=8 ;

--
-- 转存表中的数据 `sent_code`
--

INSERT INTO `sent_code` (`id`, `name`, `content`, `num`, `sort`, `status`) VALUES
(1, '标签', '151730343281954,151730343293559,151730343263272,151730343240006,151730343222573 ', 5, 0, 1),
(2, '测试', '151730599510170', 1, 0, 1),
(3, '测试2', '151730608042780,151730608097132', 2, 0, 1),
(4, '测试3', '151730613269059', 1, 0, 1),
(5, '测试4', '151730621336575,151730621388807,151730621365662', 3, 0, 1),
(6, '大客户', '151736159744527,151736159768161,151736159794773,151736159746535,151736159757787,151736159779180,151736159719000,151736159727935,151736159738528,151736159755571,151736159738677,151736159763300,151736159751437,151736159728270,151736159715990,151736159771067,151736159726202,151736159773215,151736159738127,151736159714674,151736159727509,151736159741343,151736159757276,151736159782559,151736159775047,151736159798593,151736159770625,151736159758158,151736159753503,151736159795902,151736159730360,151736159739910,151736159772564,151736159719206,151736159723669,151736159781251,151736159716918,151736159779444,151736159792740,151736159710620,151736159786253,151736159782553,151736159754761,151736159761454,151736159775256,151736159759471,151736159741918,151736159762190,151736159793614,151736159786135,151736159751399,151736159766266,151736159726015,151736159713482,151736159735392,151736159782119,151736159772146,151736159797451,151736159781084,151736159773187,151736159726696,151736159798978,151736159750663,151736159747908,151736159789351,151736159794001,151736159731316,151736159759718,151736159754799,151736159723458,151736159765231,151736159727056,151736159732727,151736159753286,151736159759595,151736159793358,151736159787824,151736159734422,151736159756595,151736159787063,151736159759776,151736159742805,151736159753420,151736159761608,151736159713271,151736159719371,151736159792257,151736159725430,151736159757996,151736159740058,151736159780293,151736159731967,151736159778639,151736159745804,151736159759715,151736159789656,151736159794888,151736159722546,151736159727712,151736159771935,151736159781430,151736159791221,151736159726471,151736159777241,151736159757952,151736159757768,151736159753179,151736159769013,151736159789142,151736159743123,151736159760023,151736159755686,151736159714688,151736159733225,151736159744192,151736159790700,151736159779277,151736159759010,151736159747872,151736159792490,151736159732596,151736159716416,151736159768252,151736159724496,151736159729333,151736159726380,151736159757518,151736159775154,151736159789175,151736159774841,151736159712859,151736159727902,151736159796811,151736159712735,151736159766461,151736159771177,151736159771927,151736159796000,151736159735513,151736159778417,151736159779211,151736159785574,151736159752201,151736159758059,151736159748350,151736159757395,151736159723713,151736159763541,151736159744032,151736159742398,151736159782237,151736159713301,151736159785945,151736159726523,151736159744961,151736159750775,151736159758776,151736159740706,151736159744071,151736159794402,151736159772212,151736159770886,151736159776755,151736159717619,151736159710942,151736159757999,151736159795201,151736159798862,151736159774651,151736159777983,151736159796596,151736159731571,151736159758029,151736159771776,151736159733128,151736159794182,151736159770762,151736159725314,151736159781985,151736159770133,151736159787538,151736159759537,151736159715353,151736159757861,151736159738045,151736159770380,151736159710420,151736159720805,151736159776969,151736159788782,151736159719374,151736159757400,151736159743999,151736159710681,151736159739402,151736159741085,151736159793822,151736159747012,151736159722691,151736159770298,151736159766126,151736159793715,151736159756430,151736159718475,151736159725597,151736159791727,151736159792806,151736159774055,151736159781924,151736159726984,151736159739006,151736159720475,151736159729794,151736159720426,151736159727218,151736159746172,151736159768894,151736159757988,151736159754629,151736159724584,151736159783913,151736159780609,151736159773426,151736159754148,151736159794537,151736159774226,151736159780798,151736159798302,151736159775453,151736159769776,151736159728932,151736159775484,151736159746351,151736159753198,151736159795014,151736159739130,151736159771916,151736159755428,151736159751234,151736159787678,151736159781836,151736159762404,151736159774778,151736159794567,151736159750800,151736159715064,151736159727833,151736159768233,151736159788494,151736159779345,151736159787588,151736159762113,151736159779606,151736159716185,151736159726229,151736159784646,151736159743824,151736159781520,151736159720945,151736159799269,151736159745834,151736159736290,151736159723922,151736159724419,151736159715325,151736159746430,151736159732348,151736159793534,151736159716984,151736159752879,151736159788412,151736159745051,151736159770498,151736159741574,151736159799299,151736159722409,151736159760556,151736159743453,151736159717198,151736159734043,151736159796844,151736159744453,151736159719297,151736159743392,151736159764049,151736159775511,151736159757782,151736159758894,151736159771861,151736159732565,151736159739841,151736159743986,151736159794965,151736159736553,151736159797662,151736159797105,151736159763050,151736159773413,151736159748432,151736159791688,151736159740802,151736159784080,151736159724339,151736159736174,151736159747911,151736159754494,151736159722571,151736159774000,151736159759062,151736159715592,151736159785314,151736159733604,151736159793943,151736159743310,151736159729756,151736159758422,151736159737243,151736159778587,151736159778085,151736159766892,151736159788648,151736159717360,151736159747488,151736159722453,151736159742846,151736159770567,151736159770152,151736159723540,151736159799524,151736159744145,151736159753266,151736159733593,151736159753371,151736159759031,151736159739017,151736159761047,151736159714073,151736159711164,151736159724592,151736159769342,151736159746318,151736159721480,151736159752179,151736159766914,151736159779793,151736159775917,151736159728965,151736159717201,151736159789186,151736159725413,151736159787137,151736159718640,151736159794185,151736159735905,151736159743884,151736159734669,151736159769477,151736159748331,151736159731393,151736159773726,151736159734749,151736159748627,151736159746850,151736159799247,151736159754689,151736159767733,151736159742445,151736159729671,151736159758985,151736159791584,151736159715364,151736159798434,151736159722323,151736159761119,151736159797794,151736159743975,151736159754393,151736159752275,151736159716924,151736159799730,151736159739880,151736159795989,151736159784940,151736159794138,151736159788472,151736159788200,151736159729031,151736159780636,151736159784858,151736159759844,151736159771383,151736159767661,151736159748724,151736159786860,151736159729184,151736159718651,151736159744757,151736159720184,151736159734623,151736159732044,151736159792647,151736159725754,151736159784885,151736159771276,151736159777079,151736159744508,151736159742159,151736159754785,151736159717742,151736159762382,151736159783633,151736159736010,151736159769323,151736159720316,151736159771493,151736159723386,151736159771509,151736159784245,151736159792927,151736159770353,151736159788988,151736159715108,151736159710123,151736159795347,151736159751448,151736159768842,151736159790268,151736159761806,151736159723576,151736159796385,151736159715550,151736159768167,151736159725059,151736159783674,151736159753157,151736159777868,151736159730585,151736159761646,151736159765274,151736159799346,151736159759842,151736159716240,151736159749092,151736159796039,151736159787516,151736159768392,151736159746795,151736159776384,151736159743296,151736159724040,151736159755574,151736159793820,151736159781869,151736159794122,151736159727613,151736159766782,151736159742923,151736159784575,151736159750102,151736159748710,151736159781144,151736159726336,151736159775228,151736159748040,151736159736221,151736159785344,151736159710178,151736159728209,151736159762841,151736159722535,151736159777140,151736159787656,151736159790691,151736159793847,151736159793301,151736159799818,151736159794460,151736159760218,151736159710848,151736159773132,151736159793833,151736159787585,151736159796970,151736159761036,151736159763500,151736159726885,151736159733854,151736159771968,151736159723147,151736159744057,151736159788686,151736159769364,151736159737463,151736159780037,151736159733656,151736159761663,151736159736133,151736159730764,151736159745950,151736159712301,151736159783847,151736159717174,151736159777755,151736159719717,151736159720291,151736159725205,151736159736260,151736159747348,151736159790153,151736159785794,151736159753651,151736159713630,151736159743121,151736159794880,151736159737117,151736159762003,151736159733881,151736159783399,151736159728844,151736159720903,151736159782122,151736159737290,151736159726020,151736159733768,151736159772531,151736159777489,151736159770834,151736159719036,151736159724795,151736159799934,151736159770471,151736159730143,151736159793603,151736159745562,151736159767120,151736159775527,151736159728641,151736159780312,151736159757969,151736159728627,151736159774596,151736159755120,151736159785204,151736159777879,151736159771158,151736159745925,151736159756013,151736159796720,151736159783012,151736159783663,151736159712584,151736159793589,151736159739847,151736159764272,151736159742104,151736159731923,151736159796349,151736159718690,151736159796761,151736159710159,151736159792207,151736159722854,151736159783742,151736159781735,151736159792109,151736159717701,151736159745235,151736159775088,151736159725740,151736159779169,151736159768428,151736159743656,151736159747790,151736159758197,151736159715506,151736159785877,151736159787945,151736159730720,151736159763659,151736159775187,151736159730893,151736159727677,151736159775074,151736159720025,151736159776321,151736159735004,151736159746938,151736159763827,151736159718918,151736159783641,151736159721439,151736159735032,151736159758370,151736159769523,151736159785764,151736159777077,151736159779364,151736159723590,151736159712101,151736159718399,151736159711590,151736159721777,151736159767637,151736159792435,151736159799733,151736159795023,151736159724559,151736159737625,151736159793482,151736159749265,151736159760056,151736159787404,151736159757524,151736159795440,151736159736315,151736159770210,151736159711546,151736159739487,151736159740522,151736159739481,151736159720236,151736159792342,151736159724867,151736159793655,151736159713282,151736159759943,151736159776535,151736159716168,151736159755370,151736159763228,151736159757716,151736159785459,151736159776189,151736159788134,151736159755596,151736159784965,151736159750426,151736159775599,151736159722362,151736159723123,151736159787769,151736159711560,151736159745202,151736159743370,151736159772904,151736159716954,151736159776305,151736159764146,151736159725520,151736159777719,151736159722856,151736159748886,151736159710304,151736159744793,151736159717044,151736159796028,151736159746944,151736159784113,151736159756057,151736159779010,151736159720126,151736159746617,151736159792081,151736159796270,151736159739539,151736159798242,151736159732304,151736159721244,151736159779870,151736159789925,151736159798915,151736159742371,151736159770806,151736159797604,151736159719099,151736159733087,151736159777035,151736159762218,151736159715045,151736159791831,151736159728245,151736159759702,151736159783940,151736159792040,151736159779123,151736159730994,151736159787972,151736159742151,151736159769356,151736159752033,151736159724328,151736159785602,151736159763632,151736159763756,151736159725196,151736159750830,151736159781639,151736159752099,151736159787763,151736159781273,151736159798063,151736159748001,151736159774217,151736159795369,151736159742593,151736159737399,151736159771745,151736159756554,151736159769916,151736159751231,151736159732535,151736159763267,151736159719720,151736159775434,151736159743774,151736159778944,151736159746691,151736159750946,151736159757650,151736159722024,151736159780518,151736159753703,151736159771350,151736159735944,151736159795888,151736159724644,151736159737062,151736159739141,151736159722488,151736159739707,151736159741972,151736159785053,151736159715007,151736159739827,151736159738270,151736159792117,151736159793130,151736159710944,151736159723142,151736159723771,151736159751547,151736159773995,151736159738775,151736159768452,151736159789944,151736159734916,151736159782358,151736159799598,151736159793009,151736159714647,151736159716078,151736159735647,151736159780430,151736159789123,151736159717121,151736159720036,151736159726894,151736159719283,151736159737677,151736159761201,151736159742088,151736159761064,151736159774931,151736159732582,151736159710700,151736159765404,151736159781073,151736159732615,151736159742417,151736159718239,151736159753288,151736159724738,151736159721928,151736159740509,151736159733766,151736159717388,151736159758919,151736159728149,151736159719692,151736159764003,151736159738078,151736159712098,151736159753255,151736159783020,151736159769092,151736159768293,151736159741643,151736159737877,151736159736650,151736159747672,151736159727042,151736159727012,151736159750437,151736159726171,151736159796640,151736159713861,151736159785143,151736159734730,151736159722626,151736159796863,151736159770455,151736159759284,151736159772185,151736159759454,151736159771059,151736159740772,151736159717506,151736159790073,151736159716643,151736159755131,151736159735776,151736159762157,151736159761896,151736159743299,151736159779183,151736159774143,151736159746504,151736159781213,151736159754914,151736159789469,151736159735155,151736159719810,151736159795157,151736159726572,151736159747537,151736159725029,151736159717099,151736159728890,151736159758337,151736159737806,151736159742928,151736159714861,151736159787242,151736159744079,151736159779831,151736159737921,151736159718940,151736159774786,151736159779996,151736159716509,151736159753118,151736159725864,151736159740610,151736159794061,151736159774465,151736159718250,151736159793861,151736159799016,151736159712666,151736159737883,151736159756936,151736159784811,151736159722411,151736159725699,151736159762023,151736159759883,151736159733387,151736159757636,151736159716308,151736159777670,151736159720280,151736159774632,151736159751981,151736159756609,151736159792779,151736159762624,151736159776228,151736159750138,151736159745570,151736159752550,151736159741236,151736159766694,151736159778343,151736159730346,151736159734194,151736159769716,151736159775783,151736159726951,151736159797289,151736159767639,151736159757579,151736159728303,151736159747707,151736159723903,151736159788417,151736159765338,151736159717638,151736159736943,151736159797986,151736159733994,151736159794267,151736159770199,151736159760973,151736159755208,151736159749784,151736159742107,151736159787066,151736159724919,151736159761374,151736159796105,151736159760951,151736159764063,151736159781227,151736159760630,151736159792317,151736159768579,151736159716528,151736159779120,151736159765851,151736159769403,151736159789466,151736159770012,151736159791241,151736159752473,151736159727229,151736159786744,151736159753173,151736159748726,151736159752003,151736159747754,151736159761336,151736159744101,151736159770976,151736159796478,151736159790417,151736159769534,151736159736336,151736159761355,151736159770103,151736159720964,151736159735271,151736159785822,151736159765082,151736159719327,151736159719967,151736159788316,151736159795042,151736159750561,151736159777612,151736159732274,151736159744670,151736159755604,151736159770394,151736159716135,151736159723653,151736159720393,151736159785500,151736159793336,151736159796679,151736159765865,151736159775118,151736159792315,151736159713435,151736159787958,151736159736435,151736159766508,151736159718610,151736159727611,151736159711639,151736159724353,151736159741890,151736159750759,151736159787917,151736159719288,151736159757963,151736159798341,151736159737457,151736159759751,151736159786517,151736159766293,151736159737446,151736159719179,151736159712238,151736159775555,151736159740072,151736159786008,151736159734815,151736159722062,151736159742522,151736159743678,151736159738935,151736159726754,151736159786983,151736159780625,151736159744285,151736159775566,151736159780644,151736159770287,151736159725553,151736159719437,151736159765692,151736159721101,151736159792427,151736159724304,151736159739314,151736159776505,151736159739594,151736159731104,151736159743697,151736159764937', 1000, 0, 1),
(7, '香烟', '1518075679465625,1518075679697354,1518075679523989,1518075679703451,1518075679662582,1518075679415252,1518075679248617,1518075679979702,1518075679627398,1518075679708532', 10, 0, 1);

-- --------------------------------------------------------

--
-- 表的结构 `sent_config`
--

CREATE TABLE IF NOT EXISTS `sent_config` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '配置ID',
  `name` varchar(30) NOT NULL DEFAULT '' COMMENT '配置名称',
  `type` varchar(10) NOT NULL DEFAULT 'text' COMMENT '配置类型',
  `title` varchar(50) NOT NULL DEFAULT '' COMMENT '配置说明',
  `group` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '配置分组',
  `extra` varchar(255) NOT NULL DEFAULT '' COMMENT '配置值',
  `remark` varchar(100) NOT NULL DEFAULT '' COMMENT '配置说明',
  `icon` varchar(50) NOT NULL DEFAULT '' COMMENT '小图标',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态',
  `value` text COMMENT '配置值',
  `sort` smallint(3) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  PRIMARY KEY (`id`),
  KEY `type` (`type`),
  KEY `group` (`group`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=44 ;

--
-- 转存表中的数据 `sent_config`
--

INSERT INTO `sent_config` (`id`, `name`, `type`, `title`, `group`, `extra`, `remark`, `icon`, `create_time`, `update_time`, `status`, `value`, `sort`) VALUES
(1, 'config_group_list', 'textarea', '配置分组', 99, '', '', '', 1447305542, 1452323143, 1, '1:基本\r\n2:会员\r\n3:邮件\r\n4:微信\r\n99:系统', 0),
(2, 'hooks_type', 'textarea', '钩子的类型', 99, '', '类型 1-用于扩展显示内容，2-用于扩展业务处理', '', 1379313397, 1379313407, 1, '1:视图\r\n2:控制器', 6),
(3, 'auth_config', 'textarea', 'Auth配置', 99, '', '自定义Auth.class.php类配置', '', 1379409310, 1379409564, 1, 'AUTH_ON:1\r\nAUTH_TYPE:2', 8),
(5, 'data_backup_path', 'text', '数据库备份根路径', 99, '', '路径必须以 / 结尾', '', 1381482411, 1381482411, 1, './data/backup/', 5),
(6, 'data_backup_part_size', 'text', '数据库备份卷大小', 99, '', '该值用于限制压缩后的分卷最大长度。单位：B；建议设置20M', '', 1381482488, 1381729564, 1, '20971520', 7),
(7, 'data_backup_compress', 'bool', '数据库备份文件是否启用压缩', 99, '0:不压缩\r\n1:启用压缩', '压缩备份文件需要PHP环境支持gzopen,gzwrite函数', '', 1381713345, 1447306018, 1, '1', 9),
(8, 'data_backup_compress_level', 'select', '数据库备份文件压缩级别', 99, '1:普通\r\n4:一般\r\n9:最高', '数据库备份文件的压缩级别，该配置在开启压缩时生效', '', 1381713408, 1447305979, 1, '9', 10),
(9, 'develop_mode', 'bool', '开启开发者模式', 99, '0:关闭\r\n1:开启', '是否开启开发者模式', '', 1383105995, 1447305960, 1, '1', 11),
(10, 'allow_visit', 'textarea', '不受限控制器方法', 99, '', '', '', 1386644047, 1438075615, 1, '0:article/draftbox\r\n1:article/mydocument\r\n2:Category/tree\r\n3:Index/verify\r\n4:file/upload\r\n5:file/download\r\n6:user/updatePassword\r\n7:user/updateNickname\r\n8:user/submitPassword\r\n9:user/submitNickname\r\n10:file/uploadpicture', 0),
(11, 'deny_visit', 'textarea', '超管专限控制器方法', 99, '', '仅超级管理员可访问的控制器方法', '', 1386644141, 1438075628, 1, '0:Addons/addhook\r\n1:Addons/edithook\r\n2:Addons/delhook\r\n3:Addons/updateHook\r\n4:Admin/getMenus\r\n5:Admin/recordList\r\n6:AuthManager/updateRules\r\n7:AuthManager/tree', 0),
(12, 'admin_allow_ip', 'text', '后台允许访问IP', 99, '', '多个用逗号分隔，如果不配置表示不限制IP访问', '', 1387165454, 1452307198, 1, '', 12),
(13, 'app_debug', 'bool', '是否调试模式', 99, '0:关闭\r\n1:开启', '是否调试模式', '', 1387165685, 1481539829, 1, '0', 6),
(14, 'web_site_title', 'text', '网站标题', 1, '', '网站标题前台显示标题', '', 1378898976, 1379235274, 1, '中国商品信息验证中心', 0),
(15, 'web_site_url', 'text', '网站URL', 1, '', '网站网址', '', 1378898976, 1379235274, 1, 'http://localhost/sentcms/', 1),
(16, 'web_site_description', 'textarea', '网站描述', 1, '', '网站搜索引擎描述', '', 1378898976, 1379235841, 1, '中国商品信息验证中心官方唯一查询网站,码上查,知天下门户网站', 3),
(17, 'web_site_keyword', 'textarea', '网站关键字', 1, '', '网站搜索引擎关键字', '', 1378898976, 1381390100, 1, '中国商品信息验证中心,防伪查询,4006276315,4006637315,8007076315,china3-15,15850787315,中文防伪查询,商品防伪,防伪码查询,防伪标签,产品真假,码上查,二维码防伪,防伪验证,码上查', 6),
(18, 'web_site_close', 'bool', '关闭站点', 1, '0:否,1:是', '站点关闭后其他用户不能访问，管理员可以正常访问', '', 1378898976, 1447321395, 1, '0', 4),
(19, 'web_site_icp', 'text', '网站备案号', 1, '', '设置在网站底部显示的备案号，如“赣ICP备13006622号', '', 1378900335, 1379235859, 1, '渝ICP备13006622号', 7),
(20, 'open_mobile_site', 'bool', '开启手机站', 1, '0:关闭\r\n1:开启', '', '', 1440901307, 1440901543, 1, '0', 4),
(21, 'list_rows', 'num', '列表条数', 99, '', '', '', 1448937662, 1448937662, 1, '20', 10),
(22, 'user_allow_register', 'bool', '是否可注册', 2, '1:是\r\n0:否', '', '', 1449043544, 1449043586, 1, '1', 0),
(23, 'user_group_type', 'textarea', '会员分组类别', 2, '', '', '', 1449196835, 1449196835, 1, 'admin:系统管理员\r\nfront:会员等级', 1),
(24, 'config_type_list', 'textarea', '字段类型', 99, '', '', '', 1459136529, 1459136529, 1, 'text:单行文本:varchar\r\nstring:字符串:int\r\npassword:密码:varchar\r\ntextarea:文本框:text\r\nbool:布尔型:int\r\nselect:选择:varchar\r\nnum:数字:int\r\ndecimal:金额:decimal\r\ntags:标签:varchar\r\ndatetime:时间控件:int\r\ndate:日期控件:varchar\r\neditor:编辑器:text\r\nbind:模型绑定:int\r\nimage:图片上传:int\r\nimages:多图上传:varchar\r\nattach:文件上传:varchar', 0),
(25, 'document_position', 'textarea', '文档推荐位', 99, '', '', '', 1453449698, 1453449698, 1, '1:首页推荐\r\n2:列表推荐', 0),
(26, 'mail_host', 'text', 'smtp服务器的名称', 3, '', 'smtp服务器的名称', '', 1455690530, 1455690556, 1, 'smtp.163.com', 0),
(27, 'mail_smtpauth', 'select', '启用smtp认证', 3, '0:否,1:是', '启用smtp认证', '', 1455690641, 1455690689, 1, '1', 0),
(28, 'mail_username', 'text', '邮件发送用户名', 3, '', '邮件发送用户名', '', 1455690771, 1455690771, 1, '你的邮箱账号', 0),
(29, 'mail_password', 'text', '邮箱密码', 3, '', '邮箱密码，如果是qq邮箱，则填安全密码', '', 1455690802, 1455690802, 1, '你的邮箱密码', 0),
(30, 'mail_fromname', 'text', '发件人姓名', 3, '', '发件人姓名', '', 1455690838, 1455690838, 1, '发件人姓名', 0),
(31, 'mail_ishtml', 'select', '是否HTML格式邮件', 3, '0:否,1:是', '是否HTML格式邮件', '', 1455690888, 1455690888, 1, '1', 0),
(32, 'mail_charset', 'text', '邮件编码', 3, '', '设置发送邮件的编码', '', 1455690920, 1455690920, 1, 'UTF8', 0),
(33, 'wechat_name', 'text', '微信名称', 4, '', '填写微信名称', '', 1459136529, 1461898406, 1, '', 0),
(41, 'pc_themes', 'text', 'PC站模板', 0, '', '', '', 1480043043, 1480043043, 1, 'default', 0),
(42, 'mobile_themes', 'text', '手机站模板', 0, '', '', '', 1480043066, 1480043066, 1, '', 0),
(43, 'nav_type_list', 'textarea', '导航分类', 99, '', '', '', 1481539756, 1481539801, 1, '1:顶部\r\n2:底部', 1);

-- --------------------------------------------------------

--
-- 表的结构 `sent_district`
--

CREATE TABLE IF NOT EXISTS `sent_district` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `level` tinyint(4) unsigned NOT NULL DEFAULT '0',
  `upid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='中国省市区乡镇数据表' AUTO_INCREMENT=45052 ;

--
-- 转存表中的数据 `sent_district`
--

INSERT INTO `sent_district` (`id`, `name`, `level`, `upid`) VALUES
(1, '北京市', 1, 0),
(2, '天津市', 1, 0),
(3, '河北省', 1, 0),
(4, '山西省', 1, 0),
(5, '内蒙古自治区', 1, 0),
(6, '辽宁省', 1, 0),
(7, '吉林省', 1, 0),
(8, '黑龙江省', 1, 0),
(9, '上海市', 1, 0),
(10, '江苏省', 1, 0),
(11, '浙江省', 1, 0),
(12, '安徽省', 1, 0),
(13, '福建省', 1, 0),
(14, '江西省', 1, 0),
(15, '山东省', 1, 0),
(16, '河南省', 1, 0),
(17, '湖北省', 1, 0),
(18, '湖南省', 1, 0),
(19, '广东省', 1, 0),
(20, '广西壮族自治区', 1, 0),
(21, '海南省', 1, 0),
(22, '重庆市', 1, 0),
(23, '四川省', 1, 0),
(24, '贵州省', 1, 0),
(25, '云南省', 1, 0),
(26, '西藏自治区', 1, 0),
(27, '陕西省', 1, 0),
(28, '甘肃省', 1, 0),
(29, '青海省', 1, 0),
(30, '宁夏回族自治区', 1, 0),
(31, '新疆维吾尔自治区', 1, 0),
(32, '台湾省', 1, 0),
(33, '香港特别行政区', 1, 0),
(34, '澳门特别行政区', 1, 0),
(35, '海外', 1, 0),
(36, '其他', 1, 0),
(37, '东城区', 2, 1),
(38, '西城区', 2, 1),
(39, '崇文区', 2, 1),
(40, '宣武区', 2, 1),
(41, '朝阳区', 2, 1),
(42, '丰台区', 2, 1),
(43, '石景山区', 2, 1),
(44, '海淀区', 2, 1),
(45, '门头沟区', 2, 1),
(46, '房山区', 2, 1),
(47, '通州区', 2, 1),
(48, '顺义区', 2, 1),
(49, '昌平区', 2, 1),
(50, '大兴区', 2, 1),
(51, '怀柔区', 2, 1),
(52, '平谷区', 2, 1),
(53, '密云县', 2, 1),
(54, '延庆县', 2, 1),
(55, '和平区', 2, 2),
(56, '河东区', 2, 2),
(57, '河西区', 2, 2),
(58, '南开区', 2, 2),
(59, '河北区', 2, 2),
(60, '红桥区', 2, 2),
(61, '塘沽区', 2, 2),
(62, '汉沽区', 2, 2),
(63, '大港区', 2, 2),
(64, '东丽区', 2, 2),
(65, '西青区', 2, 2),
(66, '津南区', 2, 2),
(67, '北辰区', 2, 2),
(68, '武清区', 2, 2),
(69, '宝坻区', 2, 2),
(70, '宁河县', 2, 2),
(71, '静海县', 2, 2),
(72, '蓟县', 2, 2),
(73, '石家庄市', 2, 3),
(74, '唐山市', 2, 3),
(75, '秦皇岛市', 2, 3),
(76, '邯郸市', 2, 3),
(77, '邢台市', 2, 3),
(78, '保定市', 2, 3),
(79, '张家口市', 2, 3),
(80, '承德市', 2, 3),
(81, '衡水市', 2, 3),
(82, '廊坊市', 2, 3),
(83, '沧州市', 2, 3),
(84, '太原市', 2, 4),
(85, '大同市', 2, 4),
(86, '阳泉市', 2, 4),
(87, '长治市', 2, 4),
(88, '晋城市', 2, 4),
(89, '朔州市', 2, 4),
(90, '晋中市', 2, 4),
(91, '运城市', 2, 4),
(92, '忻州市', 2, 4),
(93, '临汾市', 2, 4),
(94, '吕梁市', 2, 4),
(95, '呼和浩特市', 2, 5),
(96, '包头市', 2, 5),
(97, '乌海市', 2, 5),
(98, '赤峰市', 2, 5),
(99, '通辽市', 2, 5),
(100, '鄂尔多斯市', 2, 5),
(101, '呼伦贝尔市', 2, 5),
(102, '巴彦淖尔市', 2, 5),
(103, '乌兰察布市', 2, 5),
(104, '兴安盟', 2, 5),
(105, '锡林郭勒盟', 2, 5),
(106, '阿拉善盟', 2, 5),
(107, '沈阳市', 2, 6),
(108, '大连市', 2, 6),
(109, '鞍山市', 2, 6),
(110, '抚顺市', 2, 6),
(111, '本溪市', 2, 6),
(112, '丹东市', 2, 6),
(113, '锦州市', 2, 6),
(114, '营口市', 2, 6),
(115, '阜新市', 2, 6),
(116, '辽阳市', 2, 6),
(117, '盘锦市', 2, 6),
(118, '铁岭市', 2, 6),
(119, '朝阳市', 2, 6),
(120, '葫芦岛市', 2, 6),
(121, '长春市', 2, 7),
(122, '吉林市', 2, 7),
(123, '四平市', 2, 7),
(124, '辽源市', 2, 7),
(125, '通化市', 2, 7),
(126, '白山市', 2, 7),
(127, '松原市', 2, 7),
(128, '白城市', 2, 7),
(129, '延边朝鲜族自治州', 2, 7),
(130, '哈尔滨市', 2, 8),
(131, '齐齐哈尔市', 2, 8),
(132, '鸡西市', 2, 8),
(133, '鹤岗市', 2, 8),
(134, '双鸭山市', 2, 8),
(135, '大庆市', 2, 8),
(136, '伊春市', 2, 8),
(137, '佳木斯市', 2, 8),
(138, '七台河市', 2, 8),
(139, '牡丹江市', 2, 8),
(140, '黑河市', 2, 8),
(141, '绥化市', 2, 8),
(142, '大兴安岭地区', 2, 8),
(143, '黄浦区', 2, 9),
(144, '卢湾区', 2, 9),
(145, '徐汇区', 2, 9),
(146, '长宁区', 2, 9),
(147, '静安区', 2, 9),
(148, '普陀区', 2, 9),
(149, '闸北区', 2, 9),
(150, '虹口区', 2, 9),
(151, '杨浦区', 2, 9),
(152, '闵行区', 2, 9),
(153, '宝山区', 2, 9),
(154, '嘉定区', 2, 9),
(155, '浦东新区', 2, 9),
(156, '金山区', 2, 9),
(157, '松江区', 2, 9),
(158, '青浦区', 2, 9),
(159, '南汇区', 2, 9),
(160, '奉贤区', 2, 9),
(161, '崇明县', 2, 9),
(162, '南京市', 2, 10),
(163, '无锡市', 2, 10),
(164, '徐州市', 2, 10),
(165, '常州市', 2, 10),
(166, '苏州市', 2, 10),
(167, '南通市', 2, 10),
(168, '连云港市', 2, 10),
(169, '淮安市', 2, 10),
(170, '盐城市', 2, 10),
(171, '扬州市', 2, 10),
(172, '镇江市', 2, 10),
(173, '泰州市', 2, 10),
(174, '宿迁市', 2, 10),
(175, '杭州市', 2, 11),
(176, '宁波市', 2, 11),
(177, '温州市', 2, 11),
(178, '嘉兴市', 2, 11),
(179, '湖州市', 2, 11),
(180, '绍兴市', 2, 11),
(181, '舟山市', 2, 11),
(182, '衢州市', 2, 11),
(183, '金华市', 2, 11),
(184, '台州市', 2, 11),
(185, '丽水市', 2, 11),
(186, '合肥市', 2, 12),
(187, '芜湖市', 2, 12),
(188, '蚌埠市', 2, 12),
(189, '淮南市', 2, 12),
(190, '马鞍山市', 2, 12),
(191, '淮北市', 2, 12),
(192, '铜陵市', 2, 12),
(193, '安庆市', 2, 12),
(194, '黄山市', 2, 12),
(195, '滁州市', 2, 12),
(196, '阜阳市', 2, 12),
(197, '宿州市', 2, 12),
(198, '巢湖市', 2, 12),
(199, '六安市', 2, 12),
(200, '亳州市', 2, 12),
(201, '池州市', 2, 12),
(202, '宣城市', 2, 12),
(203, '福州市', 2, 13),
(204, '厦门市', 2, 13),
(205, '莆田市', 2, 13),
(206, '三明市', 2, 13),
(207, '泉州市', 2, 13),
(208, '漳州市', 2, 13),
(209, '南平市', 2, 13),
(210, '龙岩市', 2, 13),
(211, '宁德市', 2, 13),
(212, '南昌市', 2, 14),
(213, '景德镇市', 2, 14),
(214, '萍乡市', 2, 14),
(215, '九江市', 2, 14),
(216, '新余市', 2, 14),
(217, '鹰潭市', 2, 14),
(218, '赣州市', 2, 14),
(219, '吉安市', 2, 14),
(220, '宜春市', 2, 14),
(221, '抚州市', 2, 14),
(222, '上饶市', 2, 14),
(223, '济南市', 2, 15),
(224, '青岛市', 2, 15),
(225, '淄博市', 2, 15),
(226, '枣庄市', 2, 15),
(227, '东营市', 2, 15),
(228, '烟台市', 2, 15),
(229, '潍坊市', 2, 15),
(230, '济宁市', 2, 15),
(231, '泰安市', 2, 15),
(232, '威海市', 2, 15),
(233, '日照市', 2, 15),
(234, '莱芜市', 2, 15),
(235, '临沂市', 2, 15),
(236, '德州市', 2, 15),
(237, '聊城市', 2, 15),
(238, '滨州市', 2, 15),
(239, '菏泽市', 2, 15),
(240, '郑州市', 2, 16),
(241, '开封市', 2, 16),
(242, '洛阳市', 2, 16),
(243, '平顶山市', 2, 16),
(244, '安阳市', 2, 16),
(245, '鹤壁市', 2, 16),
(246, '新乡市', 2, 16),
(247, '焦作市', 2, 16),
(248, '濮阳市', 2, 16),
(249, '许昌市', 2, 16),
(250, '漯河市', 2, 16),
(251, '三门峡市', 2, 16),
(252, '南阳市', 2, 16),
(253, '商丘市', 2, 16),
(254, '信阳市', 2, 16),
(255, '周口市', 2, 16),
(256, '驻马店市', 2, 16),
(257, '济源市', 2, 16),
(258, '武汉市', 2, 17),
(259, '黄石市', 2, 17),
(260, '十堰市', 2, 17),
(261, '宜昌市', 2, 17),
(262, '襄樊市', 2, 17),
(263, '鄂州市', 2, 17),
(264, '荆门市', 2, 17),
(265, '孝感市', 2, 17),
(266, '荆州市', 2, 17),
(267, '黄冈市', 2, 17),
(268, '咸宁市', 2, 17),
(269, '随州市', 2, 17),
(270, '恩施土家族苗族自治州', 2, 17),
(271, '仙桃市', 2, 17),
(272, '潜江市', 2, 17),
(273, '天门市', 2, 17),
(274, '神农架林区', 2, 17),
(275, '长沙市', 2, 18),
(276, '株洲市', 2, 18),
(277, '湘潭市', 2, 18),
(278, '衡阳市', 2, 18),
(279, '邵阳市', 2, 18),
(280, '岳阳市', 2, 18),
(281, '常德市', 2, 18),
(282, '张家界市', 2, 18),
(283, '益阳市', 2, 18),
(284, '郴州市', 2, 18),
(285, '永州市', 2, 18),
(286, '怀化市', 2, 18),
(287, '娄底市', 2, 18),
(288, '湘西土家族苗族自治州', 2, 18),
(289, '广州市', 2, 19),
(290, '韶关市', 2, 19),
(291, '深圳市', 2, 19),
(292, '珠海市', 2, 19),
(293, '汕头市', 2, 19),
(294, '佛山市', 2, 19),
(295, '江门市', 2, 19),
(296, '湛江市', 2, 19),
(297, '茂名市', 2, 19),
(298, '肇庆市', 2, 19),
(299, '惠州市', 2, 19),
(300, '梅州市', 2, 19),
(301, '汕尾市', 2, 19),
(302, '河源市', 2, 19),
(303, '阳江市', 2, 19),
(304, '清远市', 2, 19),
(305, '东莞市', 2, 19),
(306, '中山市', 2, 19),
(307, '潮州市', 2, 19),
(308, '揭阳市', 2, 19),
(309, '云浮市', 2, 19),
(310, '南宁市', 2, 20),
(311, '柳州市', 2, 20),
(312, '桂林市', 2, 20),
(313, '梧州市', 2, 20),
(314, '北海市', 2, 20),
(315, '防城港市', 2, 20),
(316, '钦州市', 2, 20),
(317, '贵港市', 2, 20),
(318, '玉林市', 2, 20),
(319, '百色市', 2, 20),
(320, '贺州市', 2, 20),
(321, '河池市', 2, 20),
(322, '来宾市', 2, 20),
(323, '崇左市', 2, 20),
(324, '海口市', 2, 21),
(325, '三亚市', 2, 21),
(326, '五指山市', 2, 21),
(327, '琼海市', 2, 21),
(328, '儋州市', 2, 21),
(329, '文昌市', 2, 21),
(330, '万宁市', 2, 21),
(331, '东方市', 2, 21),
(332, '定安县', 2, 21),
(333, '屯昌县', 2, 21),
(334, '澄迈县', 2, 21),
(335, '临高县', 2, 21),
(336, '白沙黎族自治县', 2, 21),
(337, '昌江黎族自治县', 2, 21),
(338, '乐东黎族自治县', 2, 21),
(339, '陵水黎族自治县', 2, 21),
(340, '保亭黎族苗族自治县', 2, 21),
(341, '琼中黎族苗族自治县', 2, 21),
(342, '西沙群岛', 2, 21),
(343, '南沙群岛', 2, 21),
(344, '中沙群岛的岛礁及其海域', 2, 21),
(345, '万州区', 2, 22),
(346, '涪陵区', 2, 22),
(347, '渝中区', 2, 22),
(348, '大渡口区', 2, 22),
(349, '江北区', 2, 22),
(350, '沙坪坝区', 2, 22),
(351, '九龙坡区', 2, 22),
(352, '南岸区', 2, 22),
(353, '北碚区', 2, 22),
(354, '双桥区', 2, 22),
(355, '万盛区', 2, 22),
(356, '渝北区', 2, 22),
(357, '巴南区', 2, 22),
(358, '黔江区', 2, 22),
(359, '长寿区', 2, 22),
(360, '綦江县', 2, 22),
(361, '潼南县', 2, 22),
(362, '铜梁县', 2, 22),
(363, '大足县', 2, 22),
(364, '荣昌县', 2, 22),
(365, '璧山县', 2, 22),
(366, '梁平县', 2, 22),
(367, '城口县', 2, 22),
(368, '丰都县', 2, 22),
(369, '垫江县', 2, 22),
(370, '武隆县', 2, 22),
(371, '忠县', 2, 22),
(372, '开县', 2, 22),
(373, '云阳县', 2, 22),
(374, '奉节县', 2, 22),
(375, '巫山县', 2, 22),
(376, '巫溪县', 2, 22),
(377, '石柱土家族自治县', 2, 22),
(378, '秀山土家族苗族自治县', 2, 22),
(379, '酉阳土家族苗族自治县', 2, 22),
(380, '彭水苗族土家族自治县', 2, 22),
(381, '江津市', 2, 22),
(382, '合川市', 2, 22),
(383, '永川市', 2, 22),
(384, '南川市', 2, 22),
(385, '成都市', 2, 23),
(386, '自贡市', 2, 23),
(387, '攀枝花市', 2, 23),
(388, '泸州市', 2, 23),
(389, '德阳市', 2, 23),
(390, '绵阳市', 2, 23),
(391, '广元市', 2, 23),
(392, '遂宁市', 2, 23),
(393, '内江市', 2, 23),
(394, '乐山市', 2, 23),
(395, '南充市', 2, 23),
(396, '眉山市', 2, 23),
(397, '宜宾市', 2, 23),
(398, '广安市', 2, 23),
(399, '达州市', 2, 23),
(400, '雅安市', 2, 23),
(401, '巴中市', 2, 23),
(402, '资阳市', 2, 23),
(403, '阿坝藏族羌族自治州', 2, 23),
(404, '甘孜藏族自治州', 2, 23),
(405, '凉山彝族自治州', 2, 23),
(406, '贵阳市', 2, 24),
(407, '六盘水市', 2, 24),
(408, '遵义市', 2, 24),
(409, '安顺市', 2, 24),
(410, '铜仁地区', 2, 24),
(411, '黔西南布依族苗族自治州', 2, 24),
(412, '毕节地区', 2, 24),
(413, '黔东南苗族侗族自治州', 2, 24),
(414, '黔南布依族苗族自治州', 2, 24),
(415, '昆明市', 2, 25),
(416, '曲靖市', 2, 25),
(417, '玉溪市', 2, 25),
(418, '保山市', 2, 25),
(419, '昭通市', 2, 25),
(420, '丽江市', 2, 25),
(421, '思茅市', 2, 25),
(422, '临沧市', 2, 25),
(423, '楚雄彝族自治州', 2, 25),
(424, '红河哈尼族彝族自治州', 2, 25),
(425, '文山壮族苗族自治州', 2, 25),
(426, '西双版纳傣族自治州', 2, 25),
(427, '大理白族自治州', 2, 25),
(428, '德宏傣族景颇族自治州', 2, 25),
(429, '怒江傈僳族自治州', 2, 25),
(430, '迪庆藏族自治州', 2, 25),
(431, '拉萨市', 2, 26),
(432, '昌都地区', 2, 26),
(433, '山南地区', 2, 26),
(434, '日喀则地区', 2, 26),
(435, '那曲地区', 2, 26),
(436, '阿里地区', 2, 26),
(437, '林芝地区', 2, 26),
(438, '西安市', 2, 27),
(439, '铜川市', 2, 27),
(440, '宝鸡市', 2, 27),
(441, '咸阳市', 2, 27),
(442, '渭南市', 2, 27),
(443, '延安市', 2, 27),
(444, '汉中市', 2, 27),
(445, '榆林市', 2, 27),
(446, '安康市', 2, 27),
(447, '商洛市', 2, 27),
(448, '兰州市', 2, 28),
(449, '嘉峪关市', 2, 28),
(450, '金昌市', 2, 28),
(451, '白银市', 2, 28),
(452, '天水市', 2, 28),
(453, '武威市', 2, 28),
(454, '张掖市', 2, 28),
(455, '平凉市', 2, 28),
(456, '酒泉市', 2, 28),
(457, '庆阳市', 2, 28),
(458, '定西市', 2, 28),
(459, '陇南市', 2, 28),
(460, '临夏回族自治州', 2, 28),
(461, '甘南藏族自治州', 2, 28),
(462, '西宁市', 2, 29),
(463, '海东地区', 2, 29),
(464, '海北藏族自治州', 2, 29),
(465, '黄南藏族自治州', 2, 29),
(466, '海南藏族自治州', 2, 29),
(467, '果洛藏族自治州', 2, 29),
(468, '玉树藏族自治州', 2, 29),
(469, '海西蒙古族藏族自治州', 2, 29),
(470, '银川市', 2, 30),
(471, '石嘴山市', 2, 30),
(472, '吴忠市', 2, 30),
(473, '固原市', 2, 30),
(474, '中卫市', 2, 30),
(475, '乌鲁木齐市', 2, 31),
(476, '克拉玛依市', 2, 31),
(477, '吐鲁番地区', 2, 31),
(478, '哈密地区', 2, 31),
(479, '昌吉回族自治州', 2, 31),
(480, '博尔塔拉蒙古自治州', 2, 31),
(481, '巴音郭楞蒙古自治州', 2, 31),
(482, '阿克苏地区', 2, 31),
(483, '克孜勒苏柯尔克孜自治州', 2, 31),
(484, '喀什地区', 2, 31),
(485, '和田地区', 2, 31),
(486, '伊犁哈萨克自治州', 2, 31),
(487, '塔城地区', 2, 31),
(488, '阿勒泰地区', 2, 31),
(489, '石河子市', 2, 31),
(490, '阿拉尔市', 2, 31),
(491, '图木舒克市', 2, 31),
(492, '五家渠市', 2, 31),
(493, '台北市', 2, 32),
(494, '高雄市', 2, 32),
(495, '基隆市', 2, 32),
(496, '台中市', 2, 32),
(497, '台南市', 2, 32),
(498, '新竹市', 2, 32),
(499, '嘉义市', 2, 32),
(500, '台北县', 2, 32),
(501, '宜兰县', 2, 32),
(502, '桃园县', 2, 32),
(503, '新竹县', 2, 32),
(504, '苗栗县', 2, 32),
(505, '台中县', 2, 32),
(506, '彰化县', 2, 32),
(507, '南投县', 2, 32),
(508, '云林县', 2, 32),
(509, '嘉义县', 2, 32),
(510, '台南县', 2, 32),
(511, '高雄县', 2, 32),
(512, '屏东县', 2, 32),
(513, '澎湖县', 2, 32),
(514, '台东县', 2, 32),
(515, '花莲县', 2, 32),
(516, '中西区', 2, 33),
(517, '东区', 2, 33),
(518, '九龙城区', 2, 33),
(519, '观塘区', 2, 33),
(520, '南区', 2, 33),
(521, '深水埗区', 2, 33),
(522, '黄大仙区', 2, 33),
(523, '湾仔区', 2, 33);

-- --------------------------------------------------------

--
-- 表的结构 `sent_document`
--

CREATE TABLE IF NOT EXISTS `sent_document` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '文档ID',
  `uid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `name` char(40) NOT NULL DEFAULT '' COMMENT '标识',
  `title` char(80) NOT NULL DEFAULT '' COMMENT '标题',
  `category_id` int(10) unsigned NOT NULL COMMENT '所属分类',
  `description` char(140) NOT NULL DEFAULT '' COMMENT '描述',
  `model_id` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '内容模型ID',
  `position` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '推荐位',
  `link_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '外链',
  `cover_id` int(10) unsigned DEFAULT NULL COMMENT '封面',
  `display` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '可见性',
  `deadline` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '截至时间',
  `attach` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '附件数量',
  `view` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '浏览量',
  `comment` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '评论数',
  `extend` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '扩展统计字段',
  `level` int(10) NOT NULL DEFAULT '0' COMMENT '优先级',
  `is_top` int(1) DEFAULT '0' COMMENT '111',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` varchar(4) NOT NULL COMMENT '状态',
  PRIMARY KEY (`id`),
  KEY `idx_category_status` (`category_id`,`status`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='文档模型基础表' AUTO_INCREMENT=22 ;

--
-- 转存表中的数据 `sent_document`
--

INSERT INTO `sent_document` (`id`, `uid`, `name`, `title`, `category_id`, `description`, `model_id`, `position`, `link_id`, `cover_id`, `display`, `deadline`, `attach`, `view`, `comment`, `extend`, `level`, `is_top`, `create_time`, `update_time`, `status`) VALUES
(13, 1, '', '防伪标签 防转移花刀', 2, '', 3, 1, 0, 1, 0, 1517362858, 0, 0, 0, 0, 0, 0, 1517362858, 1517364070, '1'),
(14, 1, '', '动态可变二维码', 2, '', 3, 1, 0, 2, 0, 1517364258, 0, 0, 0, 0, 0, 0, 1517364258, 1517364334, '1'),
(15, 1, '', '测试', 2, '', 3, 1, 0, 3, 0, 1517364514, 0, 0, 0, 0, 0, 0, 1517364514, 1517369316, '1'),
(16, 1, '', '测试1', 2, '', 3, 1, 0, 4, 0, 1517365394, 0, 0, 0, 0, 0, 0, 1517365394, 1517365418, '1'),
(17, 1, '', '标签1', 2, '', 3, 1, 0, 5, 0, 1517366002, 0, 0, 0, 0, 0, 0, 1517366002, 1517366041, '1'),
(18, 1, '', '31231231', 2, '', 3, 1, 0, 0, 0, 1517368040, 0, 0, 0, 0, 0, 0, 1517368040, 1517369455, '1'),
(19, 1, '', '232131', 2, '', 3, 1, 0, 0, 0, 1517368622, 0, 0, 0, 0, 0, 0, 1517368622, 1517369299, '1'),
(20, 1, '', '5435', 1, '', 3, 1, 0, 0, 0, 1517369330, 0, 0, 0, 0, 0, 0, 1517369330, 1517369342, '1'),
(21, 1, '', '突然突然', 1, '', 3, 1, 0, 0, 0, 1517369374, 0, 1, 0, 0, 0, 0, 1517369374, 1517390698, '1');

-- --------------------------------------------------------

--
-- 表的结构 `sent_document_article`
--

CREATE TABLE IF NOT EXISTS `sent_document_article` (
  `doc_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `content` text,
  `tags` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`doc_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='文章' AUTO_INCREMENT=13 ;

--
-- 转存表中的数据 `sent_document_article`
--

INSERT INTO `sent_document_article` (`doc_id`, `content`, `tags`) VALUES
(2, '<p>我校辅导员赴天津观摩全国辅导员职业技能大赛第一赛区复赛</p>', ''),
(8, '<p>市场陈列</p>', '');

-- --------------------------------------------------------

--
-- 表的结构 `sent_document_photo`
--

CREATE TABLE IF NOT EXISTS `sent_document_photo` (
  `doc_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `photo_list` varchar(50) DEFAULT NULL,
  `content` text,
  `code` varchar(16) NOT NULL COMMENT '防伪码为16位纯数字',
  PRIMARY KEY (`doc_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='图片' AUTO_INCREMENT=22 ;

--
-- 转存表中的数据 `sent_document_photo`
--

INSERT INTO `sent_document_photo` (`doc_id`, `photo_list`, `content`, `code`) VALUES
(13, '', '<p style="padding: 0px; margin-top: 0px; margin-bottom: 0px; font-family: "><span style="padding: 0px; margin: 0px; font-size: 18px; line-height: 2;"><strong style="padding: 0px; margin: 0px;">防转移花刀产品特点</strong></span><span style="padding: 0px; margin: 0px; line-height: 2;"><strong style="padding: 0px; margin: 0px;">：</strong></span></p><p style="padding: 0px; margin-top: 0px; margin-bottom: 0px; font-family: "><span style="padding: 0px; margin: 0px; font-size: 18px; line-height: 2;">假冒伪劣产品严重影响了消费者的生活和企业权益，造成国家市场的混乱，所以能够防伪标签深受大家喜爱和推崇。但是道高一尺魔高一丈，现在市场上经常会有假冒伪劣产品贴着真的防伪标签，消费者难以辨认，厂家更是苦不堪言，百口莫辩啊。 所以，在标签印刷的过程中利用激光切割技术，在标识的表面留有相应的S、X或其他刀痕有效的防止标签被二次使用。在使用中标签一旦粘贴了再揭起时已经被破坏掉了，真正起到防揭起、防转移的作用。</span></p><p><br/></p>', '151730343281954'),
(14, '', '<p>标签设计：表面可放置公司名称、logo等可定制内容</p><p>工艺要求：表面可覆光膜（比较光亮）或镭色膜（光照下散发彩虹效果）等</p><p>通过公司的核心防伪技术信息化编码/解码，为每件产品生成唯一的防伪码及具体每一位防伪码的颜色，(具体有 红 、橙、黄、绿、青、 兰 、紫 、 黑等颜色)。</p><p><br/></p>', '1'),
(15, '', '<p>231232132323113<br/></p>', '123'),
(16, '', '<p>111111111111</p>', '111111'),
(17, '', '<p>撒打算打算打算</p>', '111'),
(18, '', '<p>1231111111111111</p>', '111111'),
(19, '', '<p>1231111111</p>', '111'),
(20, '', '<p>3434</p>', '3333'),
(21, '', '<p>二恶</p>', '1517303432819541');

-- --------------------------------------------------------

--
-- 表的结构 `sent_file`
--

CREATE TABLE IF NOT EXISTS `sent_file` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '文件ID',
  `name` varchar(300) NOT NULL DEFAULT '' COMMENT '原始文件名',
  `savename` varchar(100) NOT NULL DEFAULT '' COMMENT '保存名称',
  `savepath` varchar(100) NOT NULL DEFAULT '' COMMENT '文件保存路径',
  `ext` char(5) NOT NULL DEFAULT '' COMMENT '文件后缀',
  `mime` char(40) NOT NULL DEFAULT '' COMMENT '文件mime类型',
  `size` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '文件大小',
  `md5` char(32) NOT NULL DEFAULT '' COMMENT '文件md5',
  `sha1` char(40) NOT NULL DEFAULT '' COMMENT '文件 sha1编码',
  `location` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '文件保存位置',
  `url` varchar(255) NOT NULL DEFAULT '' COMMENT '远程地址',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '上传时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='文件表' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `sent_hooks`
--

CREATE TABLE IF NOT EXISTS `sent_hooks` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(40) NOT NULL DEFAULT '' COMMENT '钩子名称',
  `description` text COMMENT '描述',
  `type` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '类型',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `addons` varchar(255) NOT NULL DEFAULT '' COMMENT '钩子挂载的插件 ''，''分割',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=18 ;

--
-- 转存表中的数据 `sent_hooks`
--

INSERT INTO `sent_hooks` (`id`, `name`, `description`, `type`, `update_time`, `addons`, `status`) VALUES
(1, 'pageHeader', '页面header钩子，一般用于加载插件CSS文件和代码', 1, 0, '', 1),
(2, 'pageFooter', '页面footer钩子，一般用于加载插件JS文件和JS代码', 1, 0, '', 1),
(3, 'documentEditForm', '添加编辑表单的 扩展内容钩子', 1, 0, '', 1),
(4, 'documentDetailAfter', '文档末尾显示', 1, 0, '', 1),
(5, 'documentDetailBefore', '页面内容前显示用钩子', 1, 0, '', 1),
(6, 'documentSaveComplete', '保存文档数据后的扩展钩子', 2, 0, '', 1),
(7, 'documentEditFormContent', '添加编辑表单的内容显示钩子', 1, 0, '', 1),
(8, 'adminArticleEdit', '后台内容编辑页编辑器', 1, 1378982734, '', 1),
(13, 'AdminIndex', '首页小格子个性化显示', 1, 1382596073, 'Sitestat,Devteam,Systeminfo', 1),
(14, 'topicComment', '评论提交方式扩展钩子。', 1, 1380163518, '', 1),
(16, 'app_begin', '应用开始', 2, 1384481614, '', 1),
(17, 'J_China_City', '每个系统都需要的一个中国省市区三级联动插件。', 1, 1455877345, '', 1);

-- --------------------------------------------------------

--
-- 表的结构 `sent_link`
--

CREATE TABLE IF NOT EXISTS `sent_link` (
  `id` int(5) NOT NULL AUTO_INCREMENT COMMENT '标识ID',
  `ftype` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0:友情链接 1:合作单位',
  `title` varchar(30) NOT NULL DEFAULT '' COMMENT '标题',
  `url` varchar(150) NOT NULL DEFAULT '' COMMENT '链接地址',
  `cover_id` int(11) NOT NULL DEFAULT '0' COMMENT '封面图片ID',
  `descrip` varchar(255) NOT NULL DEFAULT '' COMMENT '备注信息',
  `sort` int(10) NOT NULL DEFAULT '0' COMMENT '排序',
  `hits` tinyint(7) NOT NULL DEFAULT '0' COMMENT '点击率',
  `update_time` int(10) NOT NULL DEFAULT '0' COMMENT '更新时间',
  `uid` int(7) NOT NULL DEFAULT '0' COMMENT '用户ID ',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=21 ;

--
-- 转存表中的数据 `sent_link`
--

INSERT INTO `sent_link` (`id`, `ftype`, `title`, `url`, `cover_id`, `descrip`, `sort`, `hits`, `update_time`, `uid`, `status`) VALUES
(1, 1, '腾速科技', 'http://www.tensent.cn', 0, '', 0, 0, 1462496026, 0, 1);

-- --------------------------------------------------------

--
-- 表的结构 `sent_member`
--

CREATE TABLE IF NOT EXISTS `sent_member` (
  `uid` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `username` varchar(32) NOT NULL DEFAULT '' COMMENT '用户名',
  `password` varchar(64) NOT NULL DEFAULT '' COMMENT '用户密码',
  `nickname` char(16) NOT NULL DEFAULT '' COMMENT '昵称',
  `email` varchar(100) DEFAULT NULL COMMENT '邮箱地址',
  `mobile` varchar(20) DEFAULT NULL COMMENT '手机号码',
  `sex` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '性别',
  `birthday` date NOT NULL DEFAULT '0000-00-00' COMMENT '生日',
  `qq` char(10) NOT NULL DEFAULT '' COMMENT 'qq号',
  `score` mediumint(8) NOT NULL DEFAULT '0' COMMENT '用户积分',
  `signature` text COMMENT '用户签名',
  `pos_province` int(11) DEFAULT '0' COMMENT '用户所在省份',
  `pos_city` int(11) DEFAULT '0' COMMENT '用户所在城市',
  `pos_district` int(11) DEFAULT '0' COMMENT '用户所在县城',
  `pos_community` int(11) DEFAULT '0' COMMENT '用户所在区域',
  `salt` varchar(255) NOT NULL DEFAULT '' COMMENT '密码盐值',
  `login` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '登录次数',
  `reg_ip` bigint(20) NOT NULL DEFAULT '0' COMMENT '注册IP',
  `reg_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '注册时间',
  `last_login_ip` bigint(20) NOT NULL DEFAULT '0' COMMENT '最后登录IP',
  `last_login_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '最后登录时间',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '会员状态',
  PRIMARY KEY (`uid`),
  KEY `status` (`status`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='会员表' AUTO_INCREMENT=3 ;

--
-- 转存表中的数据 `sent_member`
--

INSERT INTO `sent_member` (`uid`, `username`, `password`, `nickname`, `email`, `mobile`, `sex`, `birthday`, `qq`, `score`, `signature`, `pos_province`, `pos_city`, `pos_district`, `pos_community`, `salt`, `login`, `reg_ip`, `reg_time`, `last_login_ip`, `last_login_time`, `status`) VALUES
(1, 'admin', '9d98696a650b7bd9c90f057023951aa3', 'admin', 'admin@admin.com', NULL, 0, '0000-00-00', '', 0, NULL, 0, 0, 0, 0, 'nPdbMU', 11, 0, 1489650033, 0, 1523166538, 1),
(2, 'ceshi', '752d0bd64c95ea46c88e45830b196017', '', 'ceshi@qq.com', NULL, 0, '0000-00-00', '', 0, NULL, 0, 0, 0, 0, 'LuFkta', 0, 0, 1517294633, 0, 1517294633, 1);

-- --------------------------------------------------------

--
-- 表的结构 `sent_member_extend`
--

CREATE TABLE IF NOT EXISTS `sent_member_extend` (
  `uid` int(11) NOT NULL COMMENT '用户UID',
  `education` int(10) DEFAULT '0',
  PRIMARY KEY (`uid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `sent_member_extend`
--

INSERT INTO `sent_member_extend` (`uid`, `education`) VALUES
(1, 0),
(2, 0);

-- --------------------------------------------------------

--
-- 表的结构 `sent_member_extend_group`
--

CREATE TABLE IF NOT EXISTS `sent_member_extend_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `name` varchar(50) NOT NULL COMMENT '分组数据表',
  `profile_name` varchar(25) NOT NULL COMMENT '扩展分组名称',
  `createTime` int(11) NOT NULL COMMENT '创建时间',
  `sort` int(11) NOT NULL COMMENT '排序',
  `visiable` tinyint(4) NOT NULL DEFAULT '1' COMMENT '是否可见，1可见，0不可见',
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '字段状态',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- 转存表中的数据 `sent_member_extend_group`
--

INSERT INTO `sent_member_extend_group` (`id`, `name`, `profile_name`, `createTime`, `sort`, `visiable`, `status`) VALUES
(1, 'member_extend', '个人资料', 1403847366, 0, 1, 1);

-- --------------------------------------------------------

--
-- 表的结构 `sent_member_extend_setting`
--

CREATE TABLE IF NOT EXISTS `sent_member_extend_setting` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL DEFAULT '' COMMENT '字段名',
  `title` varchar(100) NOT NULL DEFAULT '' COMMENT '字段注释',
  `length` varchar(100) NOT NULL DEFAULT '' COMMENT '字段定义',
  `type` varchar(20) NOT NULL DEFAULT '' COMMENT '数据类型',
  `value` varchar(100) NOT NULL DEFAULT '' COMMENT '字段默认值',
  `remark` varchar(100) NOT NULL DEFAULT '' COMMENT '备注',
  `is_show` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '是否显示',
  `extra` varchar(255) NOT NULL DEFAULT '' COMMENT '参数',
  `is_must` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否必填',
  `status` tinyint(2) NOT NULL DEFAULT '0' COMMENT '状态',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='会员字段表' AUTO_INCREMENT=2 ;

--
-- 转存表中的数据 `sent_member_extend_setting`
--

INSERT INTO `sent_member_extend_setting` (`id`, `name`, `title`, `length`, `type`, `value`, `remark`, `is_show`, `extra`, `is_must`, `status`, `update_time`, `create_time`) VALUES
(1, 'education', '学历', '10', 'select', '', '', 1, '1:小学\r\n2:初中\r\n3:高中', 0, 1, 1455930923, 1455930787);

-- --------------------------------------------------------

--
-- 表的结构 `sent_menu`
--

CREATE TABLE IF NOT EXISTS `sent_menu` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '文档ID',
  `title` varchar(50) NOT NULL DEFAULT '' COMMENT '标题',
  `type` varchar(10) NOT NULL DEFAULT 'admin' COMMENT '菜单类别（admin后台，user会员中心）',
  `icon` varchar(20) NOT NULL DEFAULT '' COMMENT '分类图标',
  `pid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '上级分类ID',
  `sort` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '排序（同级有效）',
  `url` char(255) NOT NULL DEFAULT '' COMMENT '链接地址',
  `hide` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否隐藏',
  `tip` varchar(255) NOT NULL DEFAULT '' COMMENT '提示',
  `group` varchar(50) DEFAULT '' COMMENT '分组',
  `is_dev` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否仅开发者模式可见',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '状态',
  PRIMARY KEY (`id`),
  KEY `pid` (`pid`),
  KEY `status` (`status`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=30 ;

--
-- 转存表中的数据 `sent_menu`
--

INSERT INTO `sent_menu` (`id`, `title`, `type`, `icon`, `pid`, `sort`, `url`, `hide`, `tip`, `group`, `is_dev`, `status`) VALUES
(1, '首页', 'admin', 'home', 0, 0, 'admin/index/index', 0, '', '', 0, 0),
(2, '系统', 'admin', 'laptop', 0, 1, 'admin/menu/index', 0, '', '', 0, 0),
(3, '内容', 'admin', 'list', 0, 4, 'admin/category/index', 0, '', '', 0, 0),
(4, '会员', 'admin', 'user', 0, 2, 'admin/user/index', 0, '', '', 0, 0),
(5, '运营', 'admin', 'th', 0, 3, 'admin/ad/index', 0, '', '', 0, 0),
(6, '扩展', 'admin', 'tags', 0, 55, 'admin/addons/index', 1, '', '', 0, 0),
(21, '友链管理', 'admin', 'link', 5, 0, 'admin/link/index', 1, '', '运营管理', 0, 0),
(7, '更新缓存', 'admin', 'refresh', 1, 0, 'admin/index/clear', 0, '', '后台首页', 0, 0),
(8, '配置管理', 'admin', 'cog', 2, 0, 'admin/config/group', 0, '', '系统配置', 0, 0),
(9, '菜单管理', 'admin', 'book', 2, 0, 'admin/menu/index', 0, '', '系统配置', 0, 0),
(10, '导航管理', 'admin', 'map-marker', 2, 0, 'admin/channel/index', 0, '', '系统配置', 0, 0),
(11, '数据备份', 'admin', 'exchange', 2, 0, 'admin/database/index?type=export', 1, '', '数据库管理', 0, 0),
(12, '数据恢复', 'admin', 'table', 2, 0, 'admin/database/index?type=import', 1, '', '数据库管理', 0, 0),
(13, 'SEO设置', 'admin', 'anchor', 2, 0, 'admin/seo/index', 1, '', '优化设置', 0, 0),
(14, '产品分类管理', 'admin', 'list-ol', 3, 1, 'admin/category/index', 0, '', '内容配置', 0, 0),
(15, '模型管理', 'admin', 'th-list', 3, 0, 'admin/model/index', 0, '', '内容配置', 0, 0),
(16, '用户列表', 'admin', 'user', 4, 0, 'admin/user/index', 0, '', '用户管理', 0, 0),
(17, '用户组表', 'admin', 'users', 4, 0, 'admin/group/index', 0, '', '用户管理', 0, 0),
(18, '权限列表', 'admin', 'paw', 4, 0, 'admin/group/access', 0, '', '用户管理', 0, 0),
(19, '行为列表', 'admin', 'file-text', 4, 0, 'admin/action/index', 1, '', '行为管理', 0, 0),
(20, '行为日志', 'admin', 'clipboard', 4, 0, 'admin/action/log', 1, '', '行为管理', 0, 0),
(22, '广告管理', 'admin', 'cc', 5, 0, 'admin/ad/index', 0, '', '运营管理', 0, 0),
(23, '插件列表', 'admin', 'usb', 6, 0, 'admin/addons/index', 0, '', '插件管理', 0, 0),
(24, '钩子列表', 'admin', 'code', 6, 0, 'admin/addons/hooks', 0, '', '插件管理', 0, 0),
(25, '自定义表单', 'admin', 'object-group', 5, 0, 'admin/form/index', 1, '', '运营管理', 0, 0),
(26, '伪静态规则', 'admin', 'magnet', 2, 0, 'admin/seo/rewrite', 1, '', '优化设置', 0, 0),
(27, '主题管理', 'admin', 'heartbeat', 2, 0, 'admin/config/themes', 1, '', '系统配置', 0, 0),
(29, '码段', 'admin', 'fa fa-cc', 0, 5, 'admin/code/index', 0, '', '', 0, 0),
(28, '防伪码分类', 'admin', 'cc', 29, 0, 'admin/code/index', 0, '', '防伪码管理', 0, 0);

-- --------------------------------------------------------

--
-- 表的结构 `sent_model`
--

CREATE TABLE IF NOT EXISTS `sent_model` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '模型ID',
  `name` char(30) NOT NULL DEFAULT '' COMMENT '模型标识',
  `title` char(30) NOT NULL DEFAULT '' COMMENT '模型名称',
  `extend` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '继承的模型',
  `icon` varchar(20) NOT NULL COMMENT '模型图标',
  `relation` varchar(30) NOT NULL DEFAULT '' COMMENT '继承与被继承模型的关联字段',
  `is_user_show` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否会员中心显示',
  `need_pk` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '新建表时是否需要主键字段',
  `field_sort` text COMMENT '表单字段排序',
  `field_group` varchar(255) NOT NULL DEFAULT '1:基础' COMMENT '字段分组',
  `field_list` text COMMENT '字段列表',
  `attribute_list` text COMMENT '属性列表（表的字段）',
  `attribute_alias` varchar(255) NOT NULL DEFAULT '' COMMENT '属性别名定义',
  `list_grid` text COMMENT '列表定义',
  `list_row` smallint(2) unsigned NOT NULL DEFAULT '10' COMMENT '列表数据长度',
  `search_key` varchar(50) NOT NULL DEFAULT '' COMMENT '默认搜索字段',
  `search_list` varchar(255) NOT NULL DEFAULT '' COMMENT '高级搜索的字段',
  `template_list` varchar(255) NOT NULL DEFAULT '' COMMENT '列表显示模板',
  `template_add` varchar(255) NOT NULL DEFAULT '' COMMENT '新增模板',
  `template_edit` varchar(255) NOT NULL DEFAULT '' COMMENT '编辑模板',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '状态',
  `engine_type` varchar(25) NOT NULL DEFAULT 'MyISAM' COMMENT '数据库引擎',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='文档模型表' AUTO_INCREMENT=11 ;

--
-- 转存表中的数据 `sent_model`
--

INSERT INTO `sent_model` (`id`, `name`, `title`, `extend`, `icon`, `relation`, `is_user_show`, `need_pk`, `field_sort`, `field_group`, `field_list`, `attribute_list`, `attribute_alias`, `list_grid`, `list_row`, `search_key`, `search_list`, `template_list`, `template_add`, `template_edit`, `create_time`, `update_time`, `status`, `engine_type`) VALUES
(1, 'document', '通用模型', 0, '', '', 1, 1, '{"1":["17","16","19","20","14","13","4","3","2","5","12","11","10"]}', '1:基础,2:扩展', '1,7,8,9,10,2,11,12,13,3,4,14,25,15,5,6,23,22,24', '', '', 'id:ID\r\ntitle:标题\r\nuid:发布人|get_username\r\ncreate_time:创建时间|time_format\r\nupdate_time:更新时间|time_format\r\nstatus:状态|get_content_status', 10, '', '', '', '', '', 1450088499, 1454054412, 1, 'MyISAM'),
(2, 'article', '文章', 1, 'file-word-o', '', 0, 1, '{"1":["3","2","4","25","12","5","24","55"],"2":["11","10","13","19","17","16","14","20"]}', '1:基础,2:扩展', '', '', '', 'id:ID\r\ntitle:标题\r\nuid:发布人|get_username\r\ncreate_time:创建时间|time_format\r\nupdate_time:更新时间|time_format\r\nstatus:状态|get_content_status', 10, '', '', '', '', '', 1453859167, 1467019566, 0, 'MyISAM'),
(3, 'photo', '产品', 1, 'file-image-o', '', 0, 1, '{"1":["34","3","2","4","12","26","5","27"],"2":["11","10","19","13","16","17","14","20"]}', '1:基础,2:扩展', '', '', '', 'id:ID\r\ntitle:标题\r\nuid:发布人|get_username\r\ncreate_time:创建时间|time_format\r\nupdate_time:更新时间|time_format\r\nstatus:状态|get_content_status', 10, '', '', '', '', '', 1454052310, 1517298705, 1, 'MyISAM'),
(4, 'page', '单页', 2, 'file-text-o', '', 0, 1, '{"1":["28","55","30","31","32","33"]}', '1:基础', '', '', '', 'id:ID\r\ntitle:标题\r\nupdate_time:更新时间|time_format', 10, '', '', '', '', '', 1456296668, 1470240568, 1, 'MyISAM');

-- --------------------------------------------------------

--
-- 表的结构 `sent_page`
--

CREATE TABLE IF NOT EXISTS `sent_page` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `uid` int(11) NOT NULL DEFAULT '0' COMMENT '用户uid',
  `title` varchar(200) DEFAULT NULL,
  `model_id` int(11) NOT NULL,
  `cover_id` int(11) DEFAULT '0',
  `content` text,
  `create_time` int(11) DEFAULT NULL,
  `update_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='单页' AUTO_INCREMENT=8 ;

--
-- 转存表中的数据 `sent_page`
--

INSERT INTO `sent_page` (`id`, `uid`, `title`, `model_id`, `cover_id`, `content`, `create_time`, `update_time`) VALUES
(1, 0, 'logo', 4, 9, '', 1523169891, 1523169913),
(2, 0, '电话查询', 4, 0, '<p><span style="font-size: 12px; font-family: 微软雅黑, &quot;Microsoft YaHei&quot;;">使用手机(或座机)拨打4006361315、4006826315查询号码,根据语音提示依次输入将要查询的防伪编码.</span></p>', 1523172687, 1523173096),
(3, 0, '短信查询', 4, 0, '<p>编缉短信内容400800#防伪编码发送至12114验证商品真伪.<br/>(由运营商收取每条0.1元/条信息费)</p>', 1523173732, 1523173844),
(4, 0, '二维码查询', 4, 0, '<p>使用智能手机中的扫描二维码APP应用程序扫描标签标识上的二维码验证商品真伪.<br/>(需开启数据网络或WiFi环境下)</p>', 1523173850, 1523173877),
(5, 0, '微信查询', 4, 0, '<p>点击微信中的添加好友,搜索公众号 ChaFangWei 添加为好友,然后直接回复防伪编码验证商品真伪</p>', 1523173888, 1523173901),
(6, 0, '底部版权', 4, 0, '<p>CopyRight © 2018 中国商品信息验证中心<br/>渝ICP备11038931号</p>', 1523174228, 1523174364),
(7, 0, '右侧悬浮', 4, 10, '<p class="mt10"><strong>投诉举报</strong><br/>\r\n &nbsp; &nbsp; &nbsp;4008462315<br/></p><p class="mt10"><strong>服务时间</strong><br/>\r\n &nbsp; &nbsp; &nbsp; &nbsp;8:00-22:00<br/></p>', 1523174458, 1523174555);

-- --------------------------------------------------------

--
-- 表的结构 `sent_picture`
--

CREATE TABLE IF NOT EXISTS `sent_picture` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键id自增',
  `path` varchar(255) NOT NULL DEFAULT '' COMMENT '路径',
  `url` varchar(255) NOT NULL DEFAULT '' COMMENT '图片链接',
  `md5` char(32) NOT NULL DEFAULT '' COMMENT '文件md5',
  `sha1` char(40) NOT NULL DEFAULT '' COMMENT '文件 sha1编码',
  `status` tinyint(2) NOT NULL DEFAULT '0' COMMENT '状态',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=11 ;

--
-- 转存表中的数据 `sent_picture`
--

INSERT INTO `sent_picture` (`id`, `path`, `url`, `md5`, `sha1`, `status`, `create_time`) VALUES
(1, '/uploads/picture/20180131/fc3c193ec57e7e67c2eb238c23173993.jpg', '/uploads/picture/20180131/fc3c193ec57e7e67c2eb238c23173993.jpg', '2be8d7f6ef8dbcabe77df6563cc7c0e6', 'c6a84003279c5fe426ba18bba774af63530173f2', 1, 1517363650),
(2, '/uploads/picture/20180131/abc3ddea5e082478a3f8c097eff4a299.jpg', '/uploads/picture/20180131/abc3ddea5e082478a3f8c097eff4a299.jpg', '2be8d7f6ef8dbcabe77df6563cc7c0e6', 'c6a84003279c5fe426ba18bba774af63530173f2', 1, 1517364311),
(3, '/uploads/picture/20180131/9f0826fd17634adc0c7fc34383c814ed.jpg', '/uploads/picture/20180131/9f0826fd17634adc0c7fc34383c814ed.jpg', '2be8d7f6ef8dbcabe77df6563cc7c0e6', 'c6a84003279c5fe426ba18bba774af63530173f2', 1, 1517364790),
(4, '/uploads/picture/20180131/3ac71804e77c914e0c0da08c2f50aaf5.jpg', '/uploads/picture/20180131/3ac71804e77c914e0c0da08c2f50aaf5.jpg', '2be8d7f6ef8dbcabe77df6563cc7c0e6', 'c6a84003279c5fe426ba18bba774af63530173f2', 1, 1517365413),
(5, '/uploads/picture/20180131/827cb2bbcd2563fa20c4f45b924e0849.jpg', '/uploads/picture/20180131/827cb2bbcd2563fa20c4f45b924e0849.jpg', '2be8d7f6ef8dbcabe77df6563cc7c0e6', 'c6a84003279c5fe426ba18bba774af63530173f2', 1, 1517366032),
(6, '/uploads/picture/20180408/46912c043df4538dc1d88777b11e5194.png', '/uploads/picture/20180408/46912c043df4538dc1d88777b11e5194.png', '386bc11f91055a45577a0dacc0eb0d7a', '7a563ef75697dcfb0a37820d3102aadd06312322', 1, 1523167329),
(7, '/uploads/picture/20180408/4ea163b4a3247f46cbbb4ad4f1e67de5.png', '/uploads/picture/20180408/4ea163b4a3247f46cbbb4ad4f1e67de5.png', '7a0d87b66af2e5eaa3d74aded033d71a', 'fd0a79964db74d5abcf56e9e61f16276b4755af8', 1, 1523167359),
(8, '/uploads/picture/20180408/6bbe7d73cc2ee2cde2c87d8dd2b9c0fb.png', '/uploads/picture/20180408/6bbe7d73cc2ee2cde2c87d8dd2b9c0fb.png', '97ed9a07276c0f38e83d5d228ec342c4', '67b1a653f83fc8b02cdaebc640da7576e72d2461', 1, 1523167384),
(9, '/uploads/picture/20180408/bb6ea731979dbe7e36af6bb70839e944.png', '/uploads/picture/20180408/bb6ea731979dbe7e36af6bb70839e944.png', 'e4d54d7b064ec2768e2d6991247079fc', '2b89153a6812b9ad285b266810d9d1025710dc01', 1, 1523169909),
(10, '/uploads/picture/20180408/580100d6903dc746fc894923c26726b5.jpg', '/uploads/picture/20180408/580100d6903dc746fc894923c26726b5.jpg', '63a5aee184783fdb6b2138f3c6e48128', 'b340a7e6c5f88b9ba67ec09e4858fc252ede186b', 1, 1523174550);

-- --------------------------------------------------------

--
-- 表的结构 `sent_rewrite`
--

CREATE TABLE IF NOT EXISTS `sent_rewrite` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键id自增',
  `rule` varchar(255) NOT NULL DEFAULT '' COMMENT '规则',
  `url` varchar(255) NOT NULL DEFAULT '' COMMENT 'url',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='伪静态表' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `sent_seo_rule`
--

CREATE TABLE IF NOT EXISTS `sent_seo_rule` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '唯一标识',
  `title` text NOT NULL COMMENT '规则标题',
  `app` varchar(40) DEFAULT NULL,
  `controller` varchar(40) DEFAULT NULL,
  `action` varchar(40) DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '状态',
  `seo_title` text NOT NULL COMMENT 'SEO标题',
  `seo_keywords` text NOT NULL COMMENT 'SEO关键词',
  `seo_description` text NOT NULL COMMENT 'SEO描述',
  `sort` int(11) NOT NULL DEFAULT '0' COMMENT '排序',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- 转存表中的数据 `sent_seo_rule`
--

INSERT INTO `sent_seo_rule` (`id`, `title`, `app`, `controller`, `action`, `status`, `seo_title`, `seo_keywords`, `seo_description`, `sort`) VALUES
(1, '整站标题', '', '', '', 1, 'SentCMS网站管理系统', 'SentCMS网站管理系统', 'SentCMS网站管理系统', 7);

-- --------------------------------------------------------

--
-- 表的结构 `sent_sync_login`
--

CREATE TABLE IF NOT EXISTS `sent_sync_login` (
  `uid` int(11) NOT NULL,
  `openid` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL,
  `access_token` varchar(255) NOT NULL,
  `refresh_token` varchar(255) NOT NULL,
  `status` tinyint(4) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
