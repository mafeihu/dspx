/*
 Navicat Premium Data Transfer

 Source Server         : 139.196.178.64
 Source Server Type    : MySQL
 Source Server Version : 100028
 Source Host           : 139.196.178.64
 Source Database       : dspx

 Target Server Type    : MySQL
 Target Server Version : 100028
 File Encoding         : utf-8

 Date: 09/21/2017 14:10:45 PM
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
--  Table structure for `m_about_us`
-- ----------------------------
DROP TABLE IF EXISTS `m_about_us`;
CREATE TABLE `m_about_us` (
  `about_us_id` int(11) NOT NULL AUTO_INCREMENT,
  `imgs` varchar(500) NOT NULL COMMENT '图片',
  `mobile` varchar(50) NOT NULL COMMENT '官方客服',
  `email` varchar(50) NOT NULL COMMENT '官方邮箱',
  `qq` varchar(20) NOT NULL COMMENT '官方qq',
  `clause` text NOT NULL COMMENT '隐私服务条款',
  `intime` int(11) NOT NULL,
  `xieyi` text NOT NULL COMMENT '用户协议',
  `agreement` text NOT NULL COMMENT '充值协议',
  `withdraw_dis` text NOT NULL COMMENT '提现说明',
  PRIMARY KEY (`about_us_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='关于我们';

-- ----------------------------
--  Table structure for `m_alipay`
-- ----------------------------
DROP TABLE IF EXISTS `m_alipay`;
CREATE TABLE `m_alipay` (
  `alipay_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL COMMENT '用户id',
  `phone` varchar(11) NOT NULL COMMENT '手机号',
  `alipay` varchar(50) NOT NULL COMMENT '支付宝账号  / 银行卡账号',
  `relname` varchar(30) NOT NULL COMMENT '真实姓名',
  `intime` int(11) NOT NULL,
  `uptime` int(11) NOT NULL,
  `type` tinyint(2) NOT NULL DEFAULT '1' COMMENT '1:支付宝   2：银行卡',
  `where_it_is` varchar(200) NOT NULL COMMENT '开户行',
  PRIMARY KEY (`alipay_id`)
) ENGINE=InnoDB AUTO_INCREMENT=147 DEFAULT CHARSET=utf8 COMMENT='用户绑定支付宝表';

-- ----------------------------
--  Table structure for `m_areas`
-- ----------------------------
DROP TABLE IF EXISTS `m_areas`;
CREATE TABLE `m_areas` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `pid` int(11) NOT NULL,
  `pinyin` varchar(100) NOT NULL,
  `level` int(11) NOT NULL,
  `center` varchar(255) NOT NULL,
  `shouzimu` varchar(100) DEFAULT NULL COMMENT '首字母',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `m_band_card_where`
-- ----------------------------
DROP TABLE IF EXISTS `m_band_card_where`;
CREATE TABLE `m_band_card_where` (
  `band_card_where_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL COMMENT '名称',
  `intime` int(11) NOT NULL,
  `uptime` int(11) NOT NULL,
  `remark` int(11) NOT NULL COMMENT '排序',
  PRIMARY KEY (`band_card_where_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COMMENT='开户行表';

-- ----------------------------
--  Table structure for `m_banned`
-- ----------------------------
DROP TABLE IF EXISTS `m_banned`;
CREATE TABLE `m_banned` (
  `banned_id` int(11) NOT NULL AUTO_INCREMENT,
  `live_id` int(11) NOT NULL COMMENT '直播间id',
  `user_id` int(11) NOT NULL COMMENT '主播id',
  `user_id2` int(11) NOT NULL COMMENT '被禁言的用户id',
  `intime` int(11) NOT NULL COMMENT '时间',
  PRIMARY KEY (`banned_id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8 COMMENT='禁言记录表';

-- ----------------------------
--  Table structure for `m_banned_date`
-- ----------------------------
DROP TABLE IF EXISTS `m_banned_date`;
CREATE TABLE `m_banned_date` (
  `banned_date_id` int(11) NOT NULL AUTO_INCREMENT,
  `date` varchar(20) NOT NULL COMMENT '禁播时间',
  `intime` int(11) NOT NULL,
  `uptime` int(11) NOT NULL,
  PRIMARY KEY (`banned_date_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COMMENT='禁播时间段表';

-- ----------------------------
--  Table structure for `m_banned_record`
-- ----------------------------
DROP TABLE IF EXISTS `m_banned_record`;
CREATE TABLE `m_banned_record` (
  `banned_record_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL COMMENT '用户id',
  `start_time` int(11) NOT NULL COMMENT '开始时间',
  `end_time` int(11) NOT NULL COMMENT '结束时间',
  `intime` int(11) NOT NULL,
  `dis` varchar(200) NOT NULL COMMENT '说明',
  `type` tinyint(2) NOT NULL COMMENT '1:禁播  2：封号',
  PRIMARY KEY (`banned_record_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COMMENT='禁播、封号记录';

-- ----------------------------
--  Table structure for `m_banner`
-- ----------------------------
DROP TABLE IF EXISTS `m_banner`;
CREATE TABLE `m_banner` (
  `b_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `b_img` varchar(200) NOT NULL COMMENT '图片',
  `b_type` tinyint(3) NOT NULL COMMENT '1:url   2:直播  3：用户',
  `b_intime` int(11) NOT NULL COMMENT '时间',
  `url` varchar(500) NOT NULL COMMENT '外链地址',
  `remark` int(11) NOT NULL COMMENT '排序',
  `content` text NOT NULL COMMENT '内容',
  `pc_tuijian` int(3) NOT NULL COMMENT '使用的端：1:pc;2:app',
  `pc_location` int(3) NOT NULL COMMENT 'pc端定位参数（1首页右侧，2首页底部，3直播间右侧，4直播间中部，5他人主页）',
  `uptime` int(11) NOT NULL,
  `title` varchar(30) NOT NULL COMMENT '标题',
  `is_audit` tinyint(2) NOT NULL DEFAULT '1' COMMENT 'ios审核  1：正常  2：ios审核期间读取',
  PRIMARY KEY (`b_id`)
) ENGINE=InnoDB AUTO_INCREMENT=75 DEFAULT CHARSET=utf8 COMMENT='banner';

-- ----------------------------
--  Table structure for `m_category`
-- ----------------------------
DROP TABLE IF EXISTS `m_category`;
CREATE TABLE `m_category` (
  `category_id` int(11) NOT NULL AUTO_INCREMENT,
  `img` varchar(300) NOT NULL COMMENT '图片',
  `name` varchar(50) NOT NULL COMMENT '名称',
  `intime` int(11) NOT NULL,
  `uptime` int(11) NOT NULL,
  `is_del` tinyint(2) NOT NULL DEFAULT '1' COMMENT '是否删除  1：正常  2：删除',
  `remark` int(11) NOT NULL DEFAULT '0' COMMENT '排序',
  `tuijian_pc` tinyint(2) NOT NULL DEFAULT '1' COMMENT '是否推荐Pc首页  1：否  2：是',
  `location` int(11) NOT NULL COMMENT '推荐位置',
  PRIMARY KEY (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=utf8 COMMENT='分类表';

-- ----------------------------
--  Table structure for `m_collection`
-- ----------------------------
DROP TABLE IF EXISTS `m_collection`;
CREATE TABLE `m_collection` (
  `collection_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL COMMENT '收藏者id',
  `type` tinyint(2) NOT NULL COMMENT 'l:资讯  2：视频',
  `about_id` int(11) NOT NULL COMMENT '被收藏的id',
  `intime` int(11) NOT NULL COMMENT '时间',
  PRIMARY KEY (`collection_id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8 COMMENT='收藏表（视频、资讯）';

-- ----------------------------
--  Table structure for `m_convert`
-- ----------------------------
DROP TABLE IF EXISTS `m_convert`;
CREATE TABLE `m_convert` (
  `convert_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL COMMENT '用户',
  `k` int(11) NOT NULL COMMENT '兑换的龙票',
  `meters` int(11) NOT NULL COMMENT '兑换的钻石',
  `intime` int(11) NOT NULL,
  `date` varchar(20) NOT NULL COMMENT '日期',
  PRIMARY KEY (`convert_id`)
) ENGINE=InnoDB AUTO_INCREMENT=198 DEFAULT CHARSET=utf8 COMMENT='用户龙票兑换钻石记录表';

-- ----------------------------
--  Table structure for `m_convert_scale`
-- ----------------------------
DROP TABLE IF EXISTS `m_convert_scale`;
CREATE TABLE `m_convert_scale` (
  `convert_scale_id` int(11) NOT NULL AUTO_INCREMENT,
  `k` int(11) NOT NULL COMMENT '龙票',
  `meters` int(11) NOT NULL COMMENT '可兑换的钻石',
  `intime` int(11) NOT NULL,
  `uptime` int(11) NOT NULL,
  PRIMARY KEY (`convert_scale_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='兑换比例表';

-- ----------------------------
--  Table structure for `m_feedback`
-- ----------------------------
DROP TABLE IF EXISTS `m_feedback`;
CREATE TABLE `m_feedback` (
  `feedback_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL COMMENT '反馈的用户id',
  `content` varchar(300) NOT NULL COMMENT '反馈内容',
  `intime` int(11) NOT NULL COMMENT '时间',
  PRIMARY KEY (`feedback_id`)
) ENGINE=InnoDB AUTO_INCREMENT=68 DEFAULT CHARSET=utf8 COMMENT='反馈表';

-- ----------------------------
--  Table structure for `m_follow`
-- ----------------------------
DROP TABLE IF EXISTS `m_follow`;
CREATE TABLE `m_follow` (
  `follow_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` int(11) NOT NULL COMMENT '关注人id',
  `user_id2` int(11) NOT NULL COMMENT '被关注的id',
  `intime` int(11) NOT NULL COMMENT '关注时间',
  `is_remind` tinyint(11) NOT NULL DEFAULT '1' COMMENT '开播提醒  1：开启 2：关闭',
  `uptime` int(11) NOT NULL,
  PRIMARY KEY (`follow_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2727 DEFAULT CHARSET=utf8 COMMENT='关注表';

-- ----------------------------
--  Table structure for `m_gift`
-- ----------------------------
DROP TABLE IF EXISTS `m_gift`;
CREATE TABLE `m_gift` (
  `gift_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `img` varchar(300) NOT NULL,
  `price` int(11) NOT NULL,
  `experience` int(11) NOT NULL COMMENT '经验',
  `num_norms` varchar(50) DEFAULT '' COMMENT '礼物数量列表',
  `intime` int(11) NOT NULL,
  `uptime` int(11) DEFAULT NULL,
  `is_running` tinyint(1) NOT NULL DEFAULT '1' COMMENT '点击连续 1不连续；2连续',
  PRIMARY KEY (`gift_id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `m_gift_number`
-- ----------------------------
DROP TABLE IF EXISTS `m_gift_number`;
CREATE TABLE `m_gift_number` (
  `num_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `num` int(11) NOT NULL COMMENT '送礼数量',
  `uptime` int(11) NOT NULL,
  PRIMARY KEY (`num_id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COMMENT='礼物数量表';

-- ----------------------------
--  Table structure for `m_give_free`
-- ----------------------------
DROP TABLE IF EXISTS `m_give_free`;
CREATE TABLE `m_give_free` (
  `give_free_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL COMMENT '用户id',
  `free_num` int(11) NOT NULL COMMENT '送的钻石数',
  `intime` int(11) NOT NULL,
  `date` varchar(20) NOT NULL,
  PRIMARY KEY (`give_free_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6541 DEFAULT CHARSET=utf8 COMMENT='每天送免费钻石记录表';

-- ----------------------------
--  Table structure for `m_give_gift`
-- ----------------------------
DROP TABLE IF EXISTS `m_give_gift`;
CREATE TABLE `m_give_gift` (
  `give_gift_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL COMMENT '送礼用户id',
  `live_id` int(11) NOT NULL COMMENT '直播间id',
  `user_id2` int(11) NOT NULL COMMENT '主播id',
  `gift_id` int(11) NOT NULL COMMENT '礼物id',
  `intime` int(11) NOT NULL COMMENT '时间戳',
  `date` date NOT NULL COMMENT '日期',
  `jewel` int(11) NOT NULL COMMENT '价格',
  `experience` int(11) NOT NULL COMMENT '经验',
  PRIMARY KEY (`give_gift_id`)
) ENGINE=InnoDB AUTO_INCREMENT=20441 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `m_information`
-- ----------------------------
DROP TABLE IF EXISTS `m_information`;
CREATE TABLE `m_information` (
  `information_id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL COMMENT '标题',
  `lebel` varchar(30) NOT NULL COMMENT '标签',
  `img` varchar(300) NOT NULL COMMENT '图片',
  `content` text NOT NULL COMMENT '内容',
  `source` varchar(50) NOT NULL COMMENT '来源',
  `watch_nums` int(11) NOT NULL DEFAULT '0' COMMENT '点击数',
  `collection` int(11) NOT NULL DEFAULT '0' COMMENT '收藏数',
  `comments` int(11) NOT NULL DEFAULT '0' COMMENT '评论数',
  `share` int(11) NOT NULL DEFAULT '0' COMMENT '分享数',
  `intime` int(11) NOT NULL,
  `date` varchar(20) NOT NULL COMMENT '日期',
  `uptime` int(11) NOT NULL,
  PRIMARY KEY (`information_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COMMENT='资讯表';

-- ----------------------------
--  Table structure for `m_information_comments`
-- ----------------------------
DROP TABLE IF EXISTS `m_information_comments`;
CREATE TABLE `m_information_comments` (
  `information_comments_id` int(11) NOT NULL AUTO_INCREMENT,
  `information_id` int(11) NOT NULL COMMENT '资讯id',
  `user_id` int(11) NOT NULL COMMENT '评论者id',
  `fid` int(11) NOT NULL COMMENT '父级id',
  `type` tinyint(2) NOT NULL DEFAULT '1' COMMENT '1:评论动态  2：回复评论',
  `intime` int(11) NOT NULL COMMENT '时间',
  `zan` int(11) NOT NULL DEFAULT '0' COMMENT '赞',
  `content` text NOT NULL COMMENT '评论内容',
  PRIMARY KEY (`information_comments_id`)
) ENGINE=InnoDB AUTO_INCREMENT=98 DEFAULT CHARSET=utf8 COMMENT='资讯评论表';

-- ----------------------------
--  Table structure for `m_information_comments_zan`
-- ----------------------------
DROP TABLE IF EXISTS `m_information_comments_zan`;
CREATE TABLE `m_information_comments_zan` (
  `information_comments_zan_id` int(11) NOT NULL AUTO_INCREMENT,
  `information_comments_id` int(11) NOT NULL COMMENT '评论id',
  `user_id` int(11) NOT NULL COMMENT '用户id',
  `intime` int(11) NOT NULL COMMENT '时间',
  PRIMARY KEY (`information_comments_zan_id`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8 COMMENT='评论点赞表';

-- ----------------------------
--  Table structure for `m_lebel`
-- ----------------------------
DROP TABLE IF EXISTS `m_lebel`;
CREATE TABLE `m_lebel` (
  `lebel_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL COMMENT '标签名称',
  `intime` int(11) NOT NULL,
  `uptime` int(11) NOT NULL,
  `remark` int(11) NOT NULL DEFAULT '0' COMMENT '排序',
  PRIMARY KEY (`lebel_id`)
) ENGINE=InnoDB AUTO_INCREMENT=80 DEFAULT CHARSET=utf8 COMMENT='标签表';

-- ----------------------------
--  Table structure for `m_level`
-- ----------------------------
DROP TABLE IF EXISTS `m_level`;
CREATE TABLE `m_level` (
  `level_id` int(11) NOT NULL AUTO_INCREMENT,
  `level` int(11) NOT NULL COMMENT '等级',
  `experience` int(11) NOT NULL COMMENT '经验',
  `intime` int(11) NOT NULL,
  `uptime` int(11) NOT NULL,
  PRIMARY KEY (`level_id`)
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8 COMMENT='等级表';

-- ----------------------------
--  Table structure for `m_live`
-- ----------------------------
DROP TABLE IF EXISTS `m_live`;
CREATE TABLE `m_live` (
  `live_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL COMMENT '用户id',
  `play_img` varchar(300) NOT NULL COMMENT '直播封面',
  `title` varchar(50) NOT NULL COMMENT '直播标题',
  `lebel` varchar(100) NOT NULL COMMENT '标签（选择多个，以'',''隔开）',
  `push_flow_address` varchar(500) NOT NULL COMMENT '推流地址',
  `play_address` varchar(500) NOT NULL COMMENT '播放地址',
  `play_address_m3u8` varchar(500) NOT NULL COMMENT '播放地址 m3u8',
  `start_time` int(11) NOT NULL COMMENT '直播开始时间',
  `end_time` int(11) NOT NULL COMMENT '直播结束时间',
  `stream_key` varchar(150) NOT NULL COMMENT '直播streamKey',
  `live_status` tinyint(3) NOT NULL COMMENT '1是在线； 2不在线',
  `live_time` int(11) NOT NULL COMMENT '按home键时间',
  `room_id` varchar(20) NOT NULL COMMENT '环信房间id',
  `nums` int(11) NOT NULL DEFAULT '0' COMMENT '直播人数',
  `watch_nums` int(11) NOT NULL DEFAULT '0' COMMENT '直播间观看人数',
  `light_up_count` int(11) NOT NULL DEFAULT '0' COMMENT '点亮',
  `intime` int(11) NOT NULL COMMENT '添加时间',
  `date` varchar(20) NOT NULL COMMENT '日期',
  `uptime` int(11) NOT NULL,
  `is_offline` tinyint(2) NOT NULL DEFAULT '1' COMMENT '是否是后台强制下线  1：否  2：是',
  `share` int(11) NOT NULL COMMENT '分享数',
  `zan` int(11) NOT NULL COMMENT '赞',
  `qrcode_path` varchar(500) NOT NULL COMMENT '二维码路径',
  `log` double NOT NULL COMMENT '经度',
  `lag` double NOT NULL COMMENT '纬度',
  `sheng` varchar(50) NOT NULL COMMENT '省',
  `shi` varchar(50) NOT NULL COMMENT '市',
  `qu` varchar(50) NOT NULL COMMENT '区',
  `livewindow_type` int(2) NOT NULL DEFAULT '1' COMMENT '直播窗口',
  `address` varchar(300) NOT NULL COMMENT '具体位置',
  `category_id` int(11) NOT NULL COMMENT '分类id',
  `qiniu_room_id` varchar(20) NOT NULL COMMENT '七牛直播间房间id',
  `qiniu_room_name` varchar(30) NOT NULL COMMENT '七牛直播间房间名称',
  `qiniu_token` varchar(300) NOT NULL COMMENT 'token',
  `is_normal_exit` tinyint(2) NOT NULL COMMENT '是否正常结束  1：正常  2：非正常',
  `tuijian_pc` tinyint(2) NOT NULL DEFAULT '1' COMMENT '是否推荐到pc端  1：否  2：是',
  `location` int(11) NOT NULL COMMENT '推荐位置',
  `pc_nums` int(11) NOT NULL COMMENT 'pc观看总人数',
  `pc_watch_nums` int(11) NOT NULL COMMENT 'pc当前观看人数',
  PRIMARY KEY (`live_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4935 DEFAULT CHARSET=utf8 COMMENT='直播表';

-- ----------------------------
--  Table structure for `m_live_kicking`
-- ----------------------------
DROP TABLE IF EXISTS `m_live_kicking`;
CREATE TABLE `m_live_kicking` (
  `live_kicking_id` int(11) NOT NULL AUTO_INCREMENT,
  `live_id` int(11) NOT NULL COMMENT '直播间id',
  `user_id` int(11) NOT NULL COMMENT '被踢用户id',
  `intime` int(11) NOT NULL,
  `date` varchar(20) NOT NULL,
  PRIMARY KEY (`live_kicking_id`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8 COMMENT='直播间踢人记录表';

-- ----------------------------
--  Table structure for `m_live_light_up`
-- ----------------------------
DROP TABLE IF EXISTS `m_live_light_up`;
CREATE TABLE `m_live_light_up` (
  `live_light_up_id` int(11) NOT NULL AUTO_INCREMENT,
  `live_id` int(11) NOT NULL COMMENT '直播id',
  `user_id` int(11) NOT NULL COMMENT '点亮的用户id',
  `user_id2` int(11) NOT NULL COMMENT '主播id',
  `intime` int(11) NOT NULL COMMENT '时间',
  PRIMARY KEY (`live_light_up_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='点亮记录表';

-- ----------------------------
--  Table structure for `m_live_management`
-- ----------------------------
DROP TABLE IF EXISTS `m_live_management`;
CREATE TABLE `m_live_management` (
  `live_management_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL COMMENT '主播id',
  `user_id2` int(11) NOT NULL COMMENT '管理id',
  `intime` int(11) NOT NULL,
  PRIMARY KEY (`live_management_id`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8 COMMENT='直播间管理员表';

-- ----------------------------
--  Table structure for `m_live_number`
-- ----------------------------
DROP TABLE IF EXISTS `m_live_number`;
CREATE TABLE `m_live_number` (
  `live_number_id` int(11) NOT NULL AUTO_INCREMENT,
  `live_id` int(11) NOT NULL COMMENT '直播id',
  `user_id` int(11) NOT NULL COMMENT '主播id',
  `user_id2` int(11) NOT NULL COMMENT '用户id',
  `intime` int(11) NOT NULL,
  PRIMARY KEY (`live_number_id`)
) ENGINE=InnoDB AUTO_INCREMENT=355358 DEFAULT CHARSET=utf8 COMMENT='进入直播间记录表';

-- ----------------------------
--  Table structure for `m_live_store`
-- ----------------------------
DROP TABLE IF EXISTS `m_live_store`;
CREATE TABLE `m_live_store` (
  `live_store_id` int(11) NOT NULL AUTO_INCREMENT,
  `live_id` int(11) NOT NULL COMMENT '直播间id',
  `user_id` int(11) NOT NULL COMMENT '主播id',
  `play_img` varchar(255) NOT NULL COMMENT '封面',
  `title` varchar(255) NOT NULL COMMENT '标题',
  `url` varchar(255) NOT NULL COMMENT '视频地址',
  `play_number` int(11) NOT NULL DEFAULT '0' COMMENT '观看次数',
  `live_time` int(11) NOT NULL COMMENT '开启直播时间',
  `stream_key` varchar(255) NOT NULL DEFAULT '0' COMMENT '直播流',
  `intime` int(11) NOT NULL,
  `livewindow_type` int(2) NOT NULL DEFAULT '1' COMMENT '播放窗口',
  `room_id` varchar(255) NOT NULL,
  `is_tuijian` tinyint(2) NOT NULL DEFAULT '1' COMMENT '是否被推荐到咨询 1：否 2：是',
  `date` varchar(20) NOT NULL COMMENT '日期',
  `collection` int(11) NOT NULL DEFAULT '0' COMMENT '收藏数',
  `lebel` varchar(100) NOT NULL COMMENT '标签（选择多个，以',
  `is_del` tinyint(2) NOT NULL DEFAULT '1' COMMENT '1:正常   2：删除',
  `is_audit` tinyint(2) NOT NULL DEFAULT '1' COMMENT 'ios审核  1：正常  2：ios审核期间读取',
  PRIMARY KEY (`live_store_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2324 DEFAULT CHARSET=utf8 COMMENT='直播视频表';

-- ----------------------------
--  Table structure for `m_live_store_report`
-- ----------------------------
DROP TABLE IF EXISTS `m_live_store_report`;
CREATE TABLE `m_live_store_report` (
  `live_store_report_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL COMMENT '举报用户id',
  `live_store_id` int(11) NOT NULL COMMENT '录播id',
  `intime` int(11) NOT NULL,
  `date` varbinary(20) NOT NULL,
  PRIMARY KEY (`live_store_report_id`)
) ENGINE=InnoDB AUTO_INCREMENT=95 DEFAULT CHARSET=utf8 COMMENT='录播举报记录表';

-- ----------------------------
--  Table structure for `m_login_hostroy`
-- ----------------------------
DROP TABLE IF EXISTS `m_login_hostroy`;
CREATE TABLE `m_login_hostroy` (
  `login_hostroy` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL COMMENT '用户id',
  `log` double NOT NULL COMMENT '经度',
  `lag` double NOT NULL COMMENT '纬度',
  `area` varchar(20) NOT NULL COMMENT '城市',
  `address` varchar(100) NOT NULL COMMENT '地址',
  `intime` int(11) NOT NULL,
  `date` varchar(20) NOT NULL COMMENT '日期',
  PRIMARY KEY (`login_hostroy`)
) ENGINE=InnoDB AUTO_INCREMENT=984 DEFAULT CHARSET=utf8 COMMENT='登录记录表';

-- ----------------------------
--  Table structure for `m_member`
-- ----------------------------
DROP TABLE IF EXISTS `m_member`;
CREATE TABLE `m_member` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `roleid` int(11) DEFAULT NULL,
  `username` varchar(150) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `update_time` varchar(20) DEFAULT NULL,
  `create_time` varchar(20) DEFAULT NULL,
  `last_login_date` varchar(20) DEFAULT NULL,
  `status` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `username` (`username`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `m_menus`
-- ----------------------------
DROP TABLE IF EXISTS `m_menus`;
CREATE TABLE `m_menus` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(50) DEFAULT NULL,
  `url` varchar(100) DEFAULT NULL COMMENT '点击该菜单时的跳转地址',
  `status` tinyint(3) unsigned DEFAULT NULL,
  `creater` varchar(20) DEFAULT NULL,
  `create_time` varchar(20) DEFAULT NULL,
  `updater` varchar(20) DEFAULT NULL,
  `update_time` varchar(20) DEFAULT NULL,
  `orderby` smallint(5) unsigned DEFAULT '0',
  `pid` smallint(5) unsigned DEFAULT NULL,
  `level` tinyint(3) unsigned DEFAULT NULL,
  `memo` varchar(255) DEFAULT NULL,
  `px` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`status`,`pid`)
) ENGINE=InnoDB AUTO_INCREMENT=459 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `m_message`
-- ----------------------------
DROP TABLE IF EXISTS `m_message`;
CREATE TABLE `m_message` (
  `message_id` int(11) NOT NULL AUTO_INCREMENT,
  `type` tinyint(10) NOT NULL COMMENT '1:系统消息  2：评论回复  3:点赞消息',
  `user_id` int(11) NOT NULL COMMENT '提示方',
  `user_id2` int(11) NOT NULL COMMENT '被提示方',
  `content` varchar(500) NOT NULL COMMENT '消息内容',
  `state` tinyint(3) NOT NULL DEFAULT '1' COMMENT '1:未查看  2：已查看',
  `intime` int(11) NOT NULL COMMENT '添加时间',
  `uptime` int(11) NOT NULL,
  `date` varchar(20) NOT NULL COMMENT '日期',
  `video_comments_id` int(11) NOT NULL COMMENT '评论id',
  `video_id` int(11) NOT NULL COMMENT '点赞视频id,评论视频id',
  `status` tinyint(2) NOT NULL COMMENT '如果是type =2   1：评论视频   2：回复评论',
  PRIMARY KEY (`message_id`),
  KEY `user_id2` (`user_id2`),
  KEY `content` (`content`(255))
) ENGINE=InnoDB AUTO_INCREMENT=199298 DEFAULT CHARSET=utf8 COMMENT='消息通知表';

-- ----------------------------
--  Table structure for `m_mobile_sms`
-- ----------------------------
DROP TABLE IF EXISTS `m_mobile_sms`;
CREATE TABLE `m_mobile_sms` (
  `mobile_sms_id` int(11) NOT NULL AUTO_INCREMENT,
  `mobile` varchar(11) NOT NULL COMMENT '手机号',
  `code` varchar(11) NOT NULL COMMENT '验证码',
  `state` tinyint(2) NOT NULL COMMENT '1:有效 2：失效',
  `date` varchar(20) NOT NULL COMMENT '日期',
  `intime` int(11) NOT NULL COMMENT '时间',
  `uptime` int(11) DEFAULT NULL,
  PRIMARY KEY (`mobile_sms_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3216 DEFAULT CHARSET=utf8 COMMENT='短信验证码表';

-- ----------------------------
--  Table structure for `m_music`
-- ----------------------------
DROP TABLE IF EXISTS `m_music`;
CREATE TABLE `m_music` (
  `music_id` int(11) NOT NULL AUTO_INCREMENT,
  `path` varchar(400) NOT NULL COMMENT '路径',
  `song_name` varchar(100) NOT NULL COMMENT '歌名',
  `singer` varbinary(30) NOT NULL COMMENT '歌手',
  `time` varchar(10) NOT NULL COMMENT '时长',
  `size` varchar(20) NOT NULL COMMENT '大小   B',
  `intime` int(11) NOT NULL,
  `date` varchar(20) NOT NULL,
  `uptime` int(11) NOT NULL,
  PRIMARY KEY (`music_id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COMMENT='歌曲表';

-- ----------------------------
--  Table structure for `m_notice`
-- ----------------------------
DROP TABLE IF EXISTS `m_notice`;
CREATE TABLE `m_notice` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `content` tinytext NOT NULL COMMENT '发送内容',
  `is_del` int(2) DEFAULT '1' COMMENT '删除状态：1正常，2删除',
  `status` int(11) NOT NULL DEFAULT '1' COMMENT '是否发送:1未发送;2已发送',
  `ctime` int(11) DEFAULT NULL COMMENT '创建时间',
  `stime` int(10) unsigned DEFAULT NULL COMMENT '发送时间',
  `state` tinyint(2) NOT NULL DEFAULT '1' COMMENT '1:即时消息  2：新注册消息',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=110 DEFAULT CHARSET=utf8 COMMENT='系统消息';

-- ----------------------------
--  Table structure for `m_pay_user`
-- ----------------------------
DROP TABLE IF EXISTS `m_pay_user`;
CREATE TABLE `m_pay_user` (
  `pay_user_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL COMMENT '用户id',
  `openid` varchar(100) NOT NULL COMMENT '支付宝openid',
  `intime` int(11) NOT NULL,
  `date` varchar(20) NOT NULL,
  PRIMARY KEY (`pay_user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='绑定支付宝记录（支付宝一键绑定）';

-- ----------------------------
--  Table structure for `m_prevue`
-- ----------------------------
DROP TABLE IF EXISTS `m_prevue`;
CREATE TABLE `m_prevue` (
  `prevue_id` int(11) NOT NULL AUTO_INCREMENT,
  `img` varchar(300) NOT NULL COMMENT '图片',
  `user_id` int(11) NOT NULL COMMENT '主播id',
  `lebel` varchar(30) NOT NULL COMMENT '标签',
  `content` text NOT NULL COMMENT '直播内容',
  `time_dis` varchar(50) NOT NULL COMMENT '直播时间说明',
  `start_time` int(11) NOT NULL COMMENT '直播时间',
  `sign_up_count` int(11) NOT NULL DEFAULT '0' COMMENT '报名人数',
  `intime` int(11) NOT NULL COMMENT '时间',
  `date` varchar(20) NOT NULL COMMENT '日期',
  `uptime` int(11) NOT NULL,
  PRIMARY KEY (`prevue_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='预报表';

-- ----------------------------
--  Table structure for `m_prevue_sign_up`
-- ----------------------------
DROP TABLE IF EXISTS `m_prevue_sign_up`;
CREATE TABLE `m_prevue_sign_up` (
  `prevue_sign_up_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL COMMENT '报名的用户id',
  `prevue_id` int(11) NOT NULL COMMENT '预告id',
  `intime` int(11) NOT NULL COMMENT '时间',
  PRIMARY KEY (`prevue_sign_up_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COMMENT='预告报名表';

-- ----------------------------
--  Table structure for `m_price`
-- ----------------------------
DROP TABLE IF EXISTS `m_price`;
CREATE TABLE `m_price` (
  `price_id` int(11) NOT NULL AUTO_INCREMENT,
  `price` float(10,2) NOT NULL COMMENT '价格',
  `meters` varchar(11) NOT NULL COMMENT '钻石',
  `intime` int(11) NOT NULL,
  `uptime` int(11) DEFAULT NULL,
  `give` int(11) NOT NULL COMMENT '赠送',
  `apple_id` varchar(45) NOT NULL,
  PRIMARY KEY (`price_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COMMENT='价格表';

-- ----------------------------
--  Table structure for `m_production`
-- ----------------------------
DROP TABLE IF EXISTS `m_production`;
CREATE TABLE `m_production` (
  `production_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL COMMENT '用户id',
  `title` varchar(50) NOT NULL COMMENT '名称',
  `dis` varchar(50) NOT NULL COMMENT '简介',
  `address` varchar(50) NOT NULL COMMENT '地点',
  `role` varchar(50) NOT NULL COMMENT '担任的角色',
  `intime` int(11) NOT NULL,
  `date` varchar(20) NOT NULL COMMENT '日期',
  `uptime` int(11) NOT NULL,
  `zan` int(11) NOT NULL DEFAULT '0' COMMENT '点赞数',
  `comments` int(11) NOT NULL DEFAULT '0' COMMENT '评论数',
  `share` int(11) NOT NULL DEFAULT '0' COMMENT '分享数',
  PRIMARY KEY (`production_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COMMENT='作品表';

-- ----------------------------
--  Table structure for `m_production_comments`
-- ----------------------------
DROP TABLE IF EXISTS `m_production_comments`;
CREATE TABLE `m_production_comments` (
  `production_comments_id` int(11) NOT NULL AUTO_INCREMENT,
  `production_id` int(11) NOT NULL COMMENT '作品id',
  `user_id` int(11) NOT NULL COMMENT '评论者id',
  `fid` int(11) NOT NULL COMMENT '父级id',
  `type` tinyint(2) NOT NULL DEFAULT '1' COMMENT '1:评论作品  2：回复评论',
  `intime` int(11) NOT NULL,
  `zan` int(11) NOT NULL COMMENT '点赞数',
  `content` text COMMENT '内容',
  PRIMARY KEY (`production_comments_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='作品评论表';

-- ----------------------------
--  Table structure for `m_production_comments_zan`
-- ----------------------------
DROP TABLE IF EXISTS `m_production_comments_zan`;
CREATE TABLE `m_production_comments_zan` (
  `production_comments_zan_id` int(11) NOT NULL AUTO_INCREMENT,
  `production_comments_id` int(11) NOT NULL COMMENT '作品评论id',
  `user_id` int(11) NOT NULL COMMENT '点赞用户id',
  `intime` int(11) NOT NULL,
  PRIMARY KEY (`production_comments_zan_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='作品评论点赞记录表';

-- ----------------------------
--  Table structure for `m_production_imgs`
-- ----------------------------
DROP TABLE IF EXISTS `m_production_imgs`;
CREATE TABLE `m_production_imgs` (
  `production_imgs_id` int(11) NOT NULL AUTO_INCREMENT,
  `production_id` int(11) NOT NULL COMMENT '作品id',
  `img` varchar(500) NOT NULL COMMENT '图片',
  `content` varchar(500) NOT NULL COMMENT '介绍',
  `intime` int(11) NOT NULL,
  PRIMARY KEY (`production_imgs_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='作品图片表';

-- ----------------------------
--  Table structure for `m_production_zan`
-- ----------------------------
DROP TABLE IF EXISTS `m_production_zan`;
CREATE TABLE `m_production_zan` (
  `production_zan_id` int(11) NOT NULL AUTO_INCREMENT,
  `production_id` int(11) NOT NULL COMMENT '作品id',
  `user_id` int(11) NOT NULL COMMENT '点赞用户id',
  `intime` int(11) NOT NULL,
  PRIMARY KEY (`production_zan_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='作品点赞记录表';

-- ----------------------------
--  Table structure for `m_push_record`
-- ----------------------------
DROP TABLE IF EXISTS `m_push_record`;
CREATE TABLE `m_push_record` (
  `push_record_id` int(11) NOT NULL AUTO_INCREMENT,
  `live_id` int(11) NOT NULL COMMENT '直播间id',
  `user_id` int(11) NOT NULL COMMENT '推送的用户id',
  `intime` int(11) NOT NULL,
  PRIMARY KEY (`push_record_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8357 DEFAULT CHARSET=utf8 COMMENT='直播推送记录表';

-- ----------------------------
--  Table structure for `m_recharge_record`
-- ----------------------------
DROP TABLE IF EXISTS `m_recharge_record`;
CREATE TABLE `m_recharge_record` (
  `recharge_record_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` int(11) NOT NULL COMMENT '用户id',
  `pay_number` varchar(20) NOT NULL COMMENT '编号',
  `amount` decimal(10,2) NOT NULL COMMENT '充值金额',
  `meters` int(11) NOT NULL COMMENT '充值钻石',
  `pay_on` varchar(25) NOT NULL COMMENT '支付编号',
  `pay_type` varchar(10) NOT NULL COMMENT '支付类型',
  `pay_return` text NOT NULL COMMENT '支付成功返回数据',
  `intime` int(11) NOT NULL COMMENT '时间',
  `uptime` int(11) NOT NULL,
  PRIMARY KEY (`recharge_record_id`),
  UNIQUE KEY `pay_number` (`pay_number`)
) ENGINE=InnoDB AUTO_INCREMENT=258 DEFAULT CHARSET=utf8 COMMENT='充值记录表';

-- ----------------------------
--  Table structure for `m_recharge_ticket`
-- ----------------------------
DROP TABLE IF EXISTS `m_recharge_ticket`;
CREATE TABLE `m_recharge_ticket` (
  `recharge_ticket_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL COMMENT '用户id',
  `ticket` int(11) NOT NULL COMMENT '充值度票数',
  `dis` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '说明',
  `intime` int(11) NOT NULL,
  PRIMARY KEY (`recharge_ticket_id`)
) ENGINE=InnoDB AUTO_INCREMENT=455 DEFAULT CHARSET=utf8 COMMENT='后台充值度票记录表';

-- ----------------------------
--  Table structure for `m_recommend`
-- ----------------------------
DROP TABLE IF EXISTS `m_recommend`;
CREATE TABLE `m_recommend` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `recommend_id` int(11) NOT NULL DEFAULT '0' COMMENT '推荐人user_id',
  `rank` tinyint(2) NOT NULL DEFAULT '0' COMMENT '推荐级别',
  `amount` int(5) NOT NULL DEFAULT '0' COMMENT '充值金额',
  `earnings` int(5) NOT NULL DEFAULT '0' COMMENT '收益金额',
  `intime` int(11) NOT NULL,
  `uptime` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=74 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `m_report`
-- ----------------------------
DROP TABLE IF EXISTS `m_report`;
CREATE TABLE `m_report` (
  `report_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL COMMENT '举报用户id',
  `live_id` int(11) NOT NULL COMMENT '直播间id',
  `user_id2` int(11) NOT NULL COMMENT '被举报主播id',
  `intime` int(11) NOT NULL COMMENT '时间',
  `why` varchar(30) NOT NULL COMMENT '原因',
  `type` tinyint(2) NOT NULL COMMENT '1:直播间举报  2：用户举报',
  PRIMARY KEY (`report_id`)
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=utf8 COMMENT='直播举报表';

-- ----------------------------
--  Table structure for `m_report_why`
-- ----------------------------
DROP TABLE IF EXISTS `m_report_why`;
CREATE TABLE `m_report_why` (
  `report_why_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL COMMENT '名称',
  `type` tinyint(2) NOT NULL COMMENT '1:直播间举报类型  2：用户举报类型',
  `intime` int(11) NOT NULL,
  `uptime` int(11) NOT NULL,
  PRIMARY KEY (`report_why_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COMMENT='举报原因表';

-- ----------------------------
--  Table structure for `m_res`
-- ----------------------------
DROP TABLE IF EXISTS `m_res`;
CREATE TABLE `m_res` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `url` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `createtime` varchar(255) DEFAULT NULL,
  `updatetime` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `m_role`
-- ----------------------------
DROP TABLE IF EXISTS `m_role`;
CREATE TABLE `m_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `create_time` varchar(255) DEFAULT NULL,
  `update_time` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `m_role_menu`
-- ----------------------------
DROP TABLE IF EXISTS `m_role_menu`;
CREATE TABLE `m_role_menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `roleid` int(11) NOT NULL,
  `menuid` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=211 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `m_role_res`
-- ----------------------------
DROP TABLE IF EXISTS `m_role_res`;
CREATE TABLE `m_role_res` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `roleid` int(11) DEFAULT NULL,
  `resid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `m_screen`
-- ----------------------------
DROP TABLE IF EXISTS `m_screen`;
CREATE TABLE `m_screen` (
  `screen_id` int(11) NOT NULL AUTO_INCREMENT,
  `live_id` int(11) NOT NULL COMMENT '直播间id',
  `user_id` int(11) NOT NULL COMMENT '主播id',
  `user_id2` int(11) NOT NULL COMMENT '发送弹幕的用户',
  `intime` int(11) NOT NULL,
  PRIMARY KEY (`screen_id`)
) ENGINE=InnoDB AUTO_INCREMENT=695 DEFAULT CHARSET=utf8 COMMENT='弹幕记录表';

-- ----------------------------
--  Table structure for `m_search`
-- ----------------------------
DROP TABLE IF EXISTS `m_search`;
CREATE TABLE `m_search` (
  `search_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL COMMENT '用户id',
  `keywords` varchar(50) NOT NULL COMMENT '搜索的关键词',
  `intime` int(11) NOT NULL,
  `date` varchar(20) NOT NULL COMMENT '日期',
  PRIMARY KEY (`search_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='搜索记录表';

-- ----------------------------
--  Table structure for `m_shield`
-- ----------------------------
DROP TABLE IF EXISTS `m_shield`;
CREATE TABLE `m_shield` (
  `shield_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL COMMENT '用户id',
  `user_id2` int(11) NOT NULL COMMENT '被拉黑的用户id',
  `intime` int(11) NOT NULL,
  PRIMARY KEY (`shield_id`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8 COMMENT='拉黑记录表';

-- ----------------------------
--  Table structure for `m_system`
-- ----------------------------
DROP TABLE IF EXISTS `m_system`;
CREATE TABLE `m_system` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `url` varchar(255) DEFAULT '' COMMENT '详情页根地址',
  `wx_name` varchar(255) DEFAULT '' COMMENT '微信公众号名称',
  `wx_account` varchar(255) DEFAULT '' COMMENT '微信账号',
  `wx_type` int(11) DEFAULT '1' COMMENT '微信类别',
  `wx_qrcode` varchar(255) DEFAULT '' COMMENT '微信二维码',
  `appid` varchar(255) DEFAULT '' COMMENT '微信appid',
  `appsecret` varchar(255) DEFAULT '' COMMENT '微信appsecret',
  `title` varchar(255) DEFAULT '' COMMENT '后台名称',
  `apiid` varchar(255) DEFAULT '' COMMENT 'ping++',
  `secretkey` varchar(255) DEFAULT '' COMMENT 'ping++',
  `jg_appkey` varchar(255) DEFAULT NULL COMMENT '极光appkey',
  `jg_secret` varchar(255) DEFAULT NULL COMMENT '极光Master Secret',
  `hx_client_id` varchar(255) DEFAULT NULL COMMENT '环信client_id',
  `hx_secret` varchar(255) DEFAULT NULL COMMENT '环信Secret',
  `hx_appkey_1` varchar(30) DEFAULT NULL COMMENT '用户',
  `hx_appkey_2` varchar(30) DEFAULT NULL COMMENT '用户',
  `baidu_apikey` varchar(255) DEFAULT NULL COMMENT '百度apikey',
  `activity_number` int(11) NOT NULL DEFAULT '1' COMMENT '显示的活动个数',
  `ak` varchar(255) DEFAULT NULL COMMENT '七牛appkey',
  `sk` varchar(255) DEFAULT NULL COMMENT '七牛Secret',
  `ios_version` varchar(64) DEFAULT NULL COMMENT 'ios版本号',
  `android_version` varchar(64) DEFAULT NULL COMMENT '安卓版本号',
  `ry_appkey` varchar(255) DEFAULT NULL COMMENT '融云appky',
  `ry_secret` varchar(255) DEFAULT NULL COMMENT '融云Secret',
  `sensitive_word` text COMMENT '敏感词',
  `about_us` text COMMENT '关于我们',
  `uptime` int(11) DEFAULT NULL,
  `zhutong_username` varchar(20) DEFAULT NULL COMMENT '助通账号',
  `zhutong_password` varchar(30) DEFAULT NULL COMMENT '助通密码',
  `code_volidity` int(11) DEFAULT NULL COMMENT '短信验证码有效期（分钟）',
  `publishurl` varchar(300) DEFAULT NULL COMMENT '七牛推流地址',
  `playurl` varchar(300) DEFAULT NULL COMMENT '七牛播放地址',
  `screen_price` int(11) NOT NULL DEFAULT '0' COMMENT '弹幕价格',
  `experience` int(11) NOT NULL DEFAULT '0' COMMENT '弹幕返经验值',
  `tengxun_appid` varchar(20) DEFAULT NULL COMMENT '腾讯云短信appid',
  `tengxun_appkey` varchar(100) DEFAULT NULL COMMENT '腾讯云短信appkey',
  `hubName` varchar(50) DEFAULT NULL COMMENT '气牛hubName',
  `lowest_limit` int(11) NOT NULL DEFAULT '0' COMMENT '提现最低多少火力可提现',
  `convert_scale3` int(11) NOT NULL DEFAULT '0' COMMENT '龙票提现金额   （convert_scale3/convert_scale4）',
  `convert_scale4` int(11) NOT NULL DEFAULT '0' COMMENT '龙票提现金额',
  `convert_scale1` int(11) NOT NULL DEFAULT '0' COMMENT '龙票兑换钻石  （convert_scale1/convert_scale2）',
  `convert_scale2` int(11) NOT NULL DEFAULT '0',
  `switch` tinyint(2) NOT NULL DEFAULT '1' COMMENT '每天登陆免费送钻石 1:开启 2：关闭',
  `fir_distribution` tinyint(3) NOT NULL DEFAULT '0' COMMENT '一级收益奖励比例',
  `sec_distribution` tinyint(3) NOT NULL DEFAULT '0' COMMENT '二级收益奖励比例',
  `free_num` int(11) NOT NULL COMMENT '免费票数',
  `approve_switch` tinyint(2) NOT NULL COMMENT 'approve_switch',
  `live_most_num` int(11) NOT NULL COMMENT '直播间人数限制（人数达到这个现在，不再添加机器人）',
  `one_minutes_num` int(11) NOT NULL COMMENT '每分钟添加机器人',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `m_user_authen`
-- ----------------------------
DROP TABLE IF EXISTS `m_user_authen`;
CREATE TABLE `m_user_authen` (
  `user_authen_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL COMMENT '会员id',
  `realname` varchar(30) NOT NULL COMMENT '真实姓名',
  `idcard` varchar(20) NOT NULL COMMENT '身份证号',
  `mobile` varchar(11) NOT NULL COMMENT '手机号',
  `idcard_img` varchar(500) NOT NULL COMMENT '身份证照片',
  `band_card_where` varchar(50) NOT NULL COMMENT '银行卡开户行',
  `band_card` varchar(50) NOT NULL COMMENT '银行卡号',
  `status` tinyint(2) NOT NULL DEFAULT '1' COMMENT '1:审核中  2： 通过  3:失败',
  `intime` int(11) NOT NULL,
  `uptime` int(11) NOT NULL,
  `why` varchar(100) NOT NULL COMMENT '失败原因',
  `authen_time` int(11) NOT NULL COMMENT '审核时间',
  `is_del` tinyint(2) DEFAULT '1' COMMENT '是否删除  1：正常 2：删除',
  PRIMARY KEY (`user_authen_id`)
) ENGINE=InnoDB AUTO_INCREMENT=161 DEFAULT CHARSET=utf8 COMMENT='会员提交的审核信息表';

-- ----------------------------
--  Table structure for `m_user_zan`
-- ----------------------------
DROP TABLE IF EXISTS `m_user_zan`;
CREATE TABLE `m_user_zan` (
  `user_zan_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL COMMENT '点赞者',
  `user_id2` int(11) NOT NULL COMMENT '被点赞者',
  `intime` int(11) NOT NULL COMMENT '时间',
  PRIMARY KEY (`user_zan_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `m_video`
-- ----------------------------
DROP TABLE IF EXISTS `m_video`;
CREATE TABLE `m_video` (
  `video_id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(200) NOT NULL COMMENT '标题',
  `user_id` int(11) NOT NULL COMMENT '用户id',
  `video_img` varchar(500) NOT NULL COMMENT '视频封面',
  `url` varchar(500) NOT NULL COMMENT '视频地址',
  `watch_nums` int(11) NOT NULL DEFAULT '0' COMMENT '观看数',
  `tuijian` int(11) NOT NULL DEFAULT '0' COMMENT '1表示推荐0未推荐',
  `comments` int(11) NOT NULL DEFAULT '0' COMMENT '评论数',
  `uptime` int(11) NOT NULL,
  `date` varchar(20) NOT NULL COMMENT '日期',
  `share` int(11) NOT NULL DEFAULT '0' COMMENT '分享数',
  `zan` int(11) NOT NULL DEFAULT '0' COMMENT '点赞数',
  `intime` int(11) NOT NULL,
  `is_del` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否删除  1：正常  2：删除',
  `category_id` varchar(30) NOT NULL COMMENT '分类id,已,隔开',
  `is_shenhe` tinyint(3) NOT NULL DEFAULT '1' COMMENT '1:待审核  2：审核通过  3：失败',
  `why` varchar(200) NOT NULL COMMENT '审核失败原因',
  PRIMARY KEY (`video_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1373 DEFAULT CHARSET=utf8 COMMENT='视频表';

-- ----------------------------
--  Table structure for `m_video_comments`
-- ----------------------------
DROP TABLE IF EXISTS `m_video_comments`;
CREATE TABLE `m_video_comments` (
  `video_comments_id` int(11) NOT NULL AUTO_INCREMENT,
  `video_id` int(11) NOT NULL COMMENT '视频id',
  `user_id` int(11) NOT NULL COMMENT '评论者id',
  `fid` int(11) NOT NULL COMMENT '父级id',
  `type` tinyint(2) NOT NULL DEFAULT '1' COMMENT '1:评论视频  2：回复评论',
  `zan` int(11) NOT NULL COMMENT '赞数',
  `content` text NOT NULL COMMENT '评论内容',
  `intime` int(11) NOT NULL,
  PRIMARY KEY (`video_comments_id`)
) ENGINE=InnoDB AUTO_INCREMENT=67 DEFAULT CHARSET=utf8 COMMENT='视频评论表';

-- ----------------------------
--  Table structure for `m_video_comments_zan`
-- ----------------------------
DROP TABLE IF EXISTS `m_video_comments_zan`;
CREATE TABLE `m_video_comments_zan` (
  `video_comments_zan_id` int(11) NOT NULL AUTO_INCREMENT,
  `video_comments_id` int(11) NOT NULL COMMENT '评论id',
  `user_id` int(11) NOT NULL COMMENT '点赞用户id',
  `intime` int(11) NOT NULL COMMENT '时间',
  PRIMARY KEY (`video_comments_zan_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='评论点赞记录表';

-- ----------------------------
--  Table structure for `m_video_zan`
-- ----------------------------
DROP TABLE IF EXISTS `m_video_zan`;
CREATE TABLE `m_video_zan` (
  `video_zan_id` int(11) NOT NULL AUTO_INCREMENT,
  `video_id` int(11) NOT NULL COMMENT '视频id',
  `user_id` int(11) NOT NULL COMMENT '点赞用户id',
  `intime` int(11) NOT NULL,
  PRIMARY KEY (`video_zan_id`)
) ENGINE=InnoDB AUTO_INCREMENT=62 DEFAULT CHARSET=utf8 COMMENT='视频点赞记录表';

-- ----------------------------
--  Table structure for `m_withdraw`
-- ----------------------------
DROP TABLE IF EXISTS `m_withdraw`;
CREATE TABLE `m_withdraw` (
  `withdraw_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `k` int(11) NOT NULL COMMENT '提现的龙票',
  `money` decimal(10,2) NOT NULL COMMENT '获得的金额',
  `status` tinyint(3) NOT NULL DEFAULT '1' COMMENT '提现状态:1申请中，2驳回，3已返现',
  `relname` varchar(255) DEFAULT '' COMMENT '账号用户的真实姓名',
  `withdraw_type` varchar(30) NOT NULL COMMENT '提现到那儿',
  `withdraw_way` varchar(30) NOT NULL COMMENT '提现账号',
  `intime` int(11) NOT NULL,
  `date` varchar(20) NOT NULL,
  `uptime` int(11) NOT NULL,
  `cash_time` int(11) NOT NULL COMMENT '返现时间',
  PRIMARY KEY (`withdraw_id`)
) ENGINE=InnoDB AUTO_INCREMENT=267 DEFAULT CHARSET=utf8 COMMENT='提现记录表';

-- ----------------------------
--  Table structure for `th_user`
-- ----------------------------
DROP TABLE IF EXISTS `th_user`;
CREATE TABLE `th_user` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `token` varchar(255) NOT NULL DEFAULT '' COMMENT 'token值',
  `token1` varchar(255) NOT NULL COMMENT 'pc端登陆',
  `phone` varchar(11) NOT NULL COMMENT '账号',
  `pwd` varchar(50) NOT NULL COMMENT '密码',
  `img` varchar(255) NOT NULL COMMENT '用户头像',
  `sex` tinyint(1) NOT NULL COMMENT '性别，1男2女',
  `type` int(11) NOT NULL COMMENT '1:普通用户  2:官方用户',
  `username` varchar(30) NOT NULL DEFAULT '' COMMENT '名称',
  `company` varchar(50) NOT NULL COMMENT '公司',
  `duty` varchar(300) NOT NULL COMMENT '负责什么',
  `autograph` varchar(150) NOT NULL DEFAULT '' COMMENT '介绍',
  `ID` int(11) NOT NULL COMMENT 'ID',
  `intime` int(11) NOT NULL COMMENT '注册时间',
  `uptime` int(11) NOT NULL COMMENT '修改时间',
  `is_del` tinyint(2) NOT NULL DEFAULT '1' COMMENT '是否删除  1：正常 2：已删除',
  `del_time` int(11) NOT NULL COMMENT '删除时间',
  `alias` varchar(50) NOT NULL COMMENT '别名',
  `hx_username` varchar(50) NOT NULL COMMENT '环信用户名',
  `hx_password` varchar(30) NOT NULL COMMENT '环信密码',
  `province` varchar(50) NOT NULL COMMENT '省',
  `city` varchar(50) NOT NULL COMMENT '市',
  `area` varchar(64) NOT NULL DEFAULT '' COMMENT '地区',
  `address` varchar(200) NOT NULL COMMENT '具体地址',
  `zan` int(11) NOT NULL DEFAULT '0' COMMENT '赞',
  `openid` varchar(200) NOT NULL DEFAULT '' COMMENT '微信openid',
  `qq_openid` varchar(200) NOT NULL DEFAULT '' COMMENT 'qqopenid',
  `weibo` varchar(200) NOT NULL DEFAULT '' COMMENT '微博',
  `money` int(11) NOT NULL DEFAULT '0' COMMENT '钻石',
  `experience` int(11) NOT NULL DEFAULT '0' COMMENT '送礼获得的经验值',
  `ticket` int(11) NOT NULL DEFAULT '0' COMMENT '龙票数量',
  `get_money` int(11) NOT NULL DEFAULT '0' COMMENT '直播送的',
  `url` varchar(300) NOT NULL COMMENT '分享链接',
  `is_fans` tinyint(2) NOT NULL DEFAULT '1' COMMENT '是否是僵尸粉   1：不是  2：是',
  `grade` int(11) NOT NULL DEFAULT '1' COMMENT '等级   默认1级',
  `birth_day` varchar(20) NOT NULL COMMENT '生日',
  `is_remind` tinyint(2) NOT NULL DEFAULT '1' COMMENT '开播提醒  1：开启 2：关闭',
  `is_banned` tinyint(3) NOT NULL DEFAULT '1' COMMENT '1:正常  2：禁播（时间段）   3：永久封禁',
  `banned_start_time` int(11) NOT NULL COMMENT '禁播开始时间',
  `banned_end_time` int(11) NOT NULL COMMENT '禁播结束时间',
  `banned_dis` varchar(300) NOT NULL COMMENT '禁播说明',
  `is_wheat` tinyint(2) NOT NULL DEFAULT '1' COMMENT '是否连麦 1：开启 2：关闭',
  `category_id` varchar(20) NOT NULL COMMENT '类型id',
  `is_show` tinyint(2) NOT NULL DEFAULT '1' COMMENT '是否显示在专家列表  1：是  2：否',
  `phpqrcode` varchar(255) NOT NULL DEFAULT '' COMMENT '分享二维码',
  `recommend_id` int(11) NOT NULL DEFAULT '0' COMMENT '推荐人user_id',
  PRIMARY KEY (`user_id`),
  KEY `red_net_id` (`ID`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=8234 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='会员表';

-- ----------------------------
--  Table structure for `tst_activity`
-- ----------------------------
DROP TABLE IF EXISTS `tst_activity`;
CREATE TABLE `tst_activity` (
  `activity_id` int(11) NOT NULL AUTO_INCREMENT,
  `activity_name` varchar(255) DEFAULT NULL COMMENT '活动名称',
  `activity_desc` varchar(255) DEFAULT NULL COMMENT '活动描述',
  `activity_img` varchar(255) DEFAULT NULL COMMENT '活动图标',
  `activity_url` varchar(255) DEFAULT NULL COMMENT '活动介绍地址',
  `activity_type` varchar(255) DEFAULT 'reduce' COMMENT '满减类型：reduce',
  `sort` int(11) DEFAULT NULL COMMENT '权重',
  `is_delete` varchar(255) DEFAULT '0',
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `reduce_need_price` decimal(10,2) DEFAULT NULL COMMENT '满多少减免',
  `reduce_price` decimal(10,2) DEFAULT NULL COMMENT '减免金额',
  `is_add` varchar(255) DEFAULT '0' COMMENT '是否叠加',
  PRIMARY KEY (`activity_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
--  Table structure for `tst_advice`
-- ----------------------------
DROP TABLE IF EXISTS `tst_advice`;
CREATE TABLE `tst_advice` (
  `advice_id` int(11) NOT NULL AUTO_INCREMENT,
  `advice_title` varchar(255) DEFAULT NULL,
  `advice_desc` varchar(500) DEFAULT NULL,
  `member_id` varchar(50) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `advice_type` varchar(255) DEFAULT NULL COMMENT 'advice:建议  complaint:投诉',
  `is_delete` int(11) DEFAULT '0',
  `advice_name` varchar(255) DEFAULT NULL,
  `advice_mobile` varchar(255) DEFAULT NULL,
  `advice_assessment` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`advice_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='用户反馈意见表';

-- ----------------------------
--  Table structure for `tst_advice_img`
-- ----------------------------
DROP TABLE IF EXISTS `tst_advice_img`;
CREATE TABLE `tst_advice_img` (
  `advice_img_id` int(11) NOT NULL AUTO_INCREMENT,
  `advice_id` varchar(255) DEFAULT NULL,
  `advice_img` varchar(255) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `is_delete` int(11) DEFAULT '0',
  PRIMARY KEY (`advice_img_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户反馈记录关联图片表';

-- ----------------------------
--  Table structure for `tst_banner`
-- ----------------------------
DROP TABLE IF EXISTS `tst_banner`;
CREATE TABLE `tst_banner` (
  `banner_id` int(11) NOT NULL AUTO_INCREMENT,
  `banner_title` varchar(50) DEFAULT NULL,
  `banner_img` varchar(255) DEFAULT '',
  `banner_url` varchar(255) DEFAULT '',
  `banner_type` varchar(11) DEFAULT 'common' COMMENT 'common:普通 goods:商品',
  `banner_desc` varchar(1000) DEFAULT '',
  `create_time` datetime DEFAULT '0000-00-00 00:00:00',
  `sort` int(11) DEFAULT '1' COMMENT '排序',
  `is_delete` int(11) DEFAULT '0' COMMENT '1:删除',
  `banner_position` varchar(255) DEFAULT 'home' COMMENT 'banner的展示位置   home:首页  gift:礼物   fresh:生鲜 baby:母婴  lady：女士  feature：特色   import：进口  promotion:促销 is_pre:预售',
  `goods_name` varchar(255) DEFAULT NULL,
  `goods_id` varchar(255) DEFAULT NULL,
  `merchants_id` int(11) DEFAULT NULL COMMENT '批发商id',
  `goods_uuid` varchar(255) DEFAULT NULL,
  `goods_class_name` varchar(255) DEFAULT NULL,
  `chain_url` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`banner_id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COMMENT='平台广告表';

-- ----------------------------
--  Table structure for `tst_city`
-- ----------------------------
DROP TABLE IF EXISTS `tst_city`;
CREATE TABLE `tst_city` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `parent_id` varchar(12) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `is_delete` int(11) DEFAULT '0' COMMENT '1删除',
  `full_pinyin` varchar(50) DEFAULT NULL,
  `first_pingyin` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3234 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `tst_distributor`
-- ----------------------------
DROP TABLE IF EXISTS `tst_distributor`;
CREATE TABLE `tst_distributor` (
  `distributor_id` int(11) NOT NULL AUTO_INCREMENT,
  `member_id` int(11) DEFAULT NULL COMMENT '哪个用户申请的',
  `distributor_name` varchar(255) DEFAULT NULL COMMENT '分销商名称',
  `distributor_sex` varchar(255) DEFAULT 'm' COMMENT '性别  m:男 w:女',
  `distributor_img` varchar(255) DEFAULT NULL COMMENT '图标',
  `distributor_duty` varchar(255) DEFAULT NULL COMMENT '职位',
  `distributor_weixin` varchar(255) DEFAULT NULL COMMENT '微信号',
  `distributor_province` varchar(255) DEFAULT NULL COMMENT '省',
  `distributor_city` varchar(255) DEFAULT NULL COMMENT '市',
  `distributor_country` varchar(255) DEFAULT NULL COMMENT '区',
  `distributor_email` varchar(255) DEFAULT NULL COMMENT '邮箱',
  `distributor_type` varchar(255) DEFAULT '-1' COMMENT '分销类型  1:平台 2:用户申请',
  `contact_mobile` varchar(255) DEFAULT NULL COMMENT '联系电话',
  `is_delete` varchar(255) DEFAULT '0',
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `recommed_name` varchar(255) DEFAULT NULL COMMENT '推荐人',
  `is_weixin_group` varchar(255) DEFAULT '0' COMMENT '是否微信社群群主',
  `is_sales` varchar(255) DEFAULT NULL COMMENT '是否有销售经验',
  `apply_channel` varchar(255) DEFAULT NULL COMMENT '申请渠道',
  `apply_desc` varchar(255) DEFAULT NULL COMMENT '申请描述',
  `apply_state` varchar(255) DEFAULT NULL COMMENT '申请状态 wait_review:等待审核 accept:接受 refuse:拒绝',
  `legal_img` varchar(255) DEFAULT NULL COMMENT '上半身照',
  `legal_face_img` varchar(255) DEFAULT NULL COMMENT '正面照',
  `legal_opposite_img` varchar(255) DEFAULT NULL COMMENT '反面照',
  `legal_hand_img` varchar(255) DEFAULT NULL COMMENT '手持身份证照',
  PRIMARY KEY (`distributor_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COMMENT='平台分销商';

-- ----------------------------
--  Table structure for `tst_distributor_goods`
-- ----------------------------
DROP TABLE IF EXISTS `tst_distributor_goods`;
CREATE TABLE `tst_distributor_goods` (
  `distributor_goods_id` int(11) NOT NULL AUTO_INCREMENT,
  `member_id` int(11) DEFAULT NULL COMMENT '用户id',
  `distributor_id` int(11) DEFAULT NULL COMMENT '分销商id',
  `goods_id` int(11) DEFAULT NULL,
  `distributor_state` varchar(255) DEFAULT NULL COMMENT '1上架 0下架',
  `is_delete` varchar(255) DEFAULT '0',
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`distributor_goods_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
--  Table structure for `tst_exchange_code`
-- ----------------------------
DROP TABLE IF EXISTS `tst_exchange_code`;
CREATE TABLE `tst_exchange_code` (
  `exchange_code` varchar(13) NOT NULL COMMENT '兑换码',
  `exchange_type` varchar(255) DEFAULT NULL COMMENT '公司代码',
  `exchange_state` varchar(255) DEFAULT '0' COMMENT '0未使用  1使用',
  `exchange_mobile` varchar(255) DEFAULT NULL COMMENT '兑换手机',
  `exchange_phone` varchar(255) DEFAULT NULL,
  `exchange_name` varchar(255) DEFAULT NULL COMMENT '姓名',
  `exchange_province` varchar(255) DEFAULT NULL COMMENT '省',
  `exchange_city` varchar(255) DEFAULT NULL COMMENT '市',
  `exchange_country` varchar(255) DEFAULT NULL COMMENT '区',
  `exchange_address` varchar(255) DEFAULT NULL COMMENT '详细地址',
  `is_delete` varchar(255) DEFAULT '0',
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `start_time` datetime DEFAULT NULL,
  `end_time` datetime DEFAULT NULL,
  PRIMARY KEY (`exchange_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
--  Table structure for `tst_exchange_type`
-- ----------------------------
DROP TABLE IF EXISTS `tst_exchange_type`;
CREATE TABLE `tst_exchange_type` (
  `exchange_type_id` int(11) NOT NULL AUTO_INCREMENT,
  `exchange_type` varchar(255) DEFAULT NULL COMMENT '值',
  `exchange_name` varchar(255) DEFAULT NULL COMMENT '公司名',
  `is_delete` varchar(255) DEFAULT '0',
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `exchange_gift` varchar(255) DEFAULT NULL COMMENT '礼物',
  PRIMARY KEY (`exchange_type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
--  Table structure for `tst_goods`
-- ----------------------------
DROP TABLE IF EXISTS `tst_goods`;
CREATE TABLE `tst_goods` (
  `goods_id` int(11) NOT NULL AUTO_INCREMENT,
  `merchants_id` int(11) DEFAULT NULL,
  `goods_num` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '商品编码',
  `goods_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '名称',
  `goods_img` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '图片',
  `goods_origin_price` decimal(10,2) DEFAULT NULL COMMENT '原价',
  `goods_pc_price` decimal(10,0) DEFAULT NULL COMMENT 'pc价格',
  `goods_now_price` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '现价',
  `goods_desc` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '商品简介',
  `goods_url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '详情web地址',
  `total_sales` int(11) DEFAULT '0' COMMENT '总销量',
  `month_sales` int(11) DEFAULT '0' COMMENT '月销量',
  `day_sales` int(11) DEFAULT '0' COMMENT '日销量',
  `goods_stock` int(11) DEFAULT '0' COMMENT '库存',
  `goods_star1` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '5',
  `goods_star2` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '5',
  `goods_star3` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '5',
  `goods_address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '产地',
  `assessment_count` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '0' COMMENT '评价数量',
  `goods_state` int(11) DEFAULT '1' COMMENT '状态1上架0下架',
  `goods_position` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '商品展示位置  class:分类下推荐展示',
  `is_group` int(11) DEFAULT '1' COMMENT '是否加入团购',
  `is_delete` int(11) DEFAULT '0',
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `is_give_integral` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT '0' COMMENT '是否赠送积分',
  `give_integral_value` int(11) DEFAULT '0' COMMENT '赠送积分值',
  `temp_img` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '临时用下',
  PRIMARY KEY (`goods_id`)
) ENGINE=InnoDB AUTO_INCREMENT=73 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
--  Table structure for `tst_goods_class`
-- ----------------------------
DROP TABLE IF EXISTS `tst_goods_class`;
CREATE TABLE `tst_goods_class` (
  `class_id` int(11) NOT NULL AUTO_INCREMENT,
  `class_name` varchar(255) DEFAULT NULL COMMENT '分类名称',
  `class_desc` varchar(255) DEFAULT NULL COMMENT '分类描述',
  `class_state` varchar(255) DEFAULT '1' COMMENT '分类状态 0:下架 1:上架',
  `class_img` varchar(255) DEFAULT NULL COMMENT '分类图标',
  `class_color` varchar(255) DEFAULT NULL,
  `class_url` varchar(255) DEFAULT NULL,
  `class_type` varchar(255) DEFAULT 'class' COMMENT '分类类型 具体项目 具体定义  class:正常分类',
  `parent_id` varchar(255) DEFAULT NULL COMMENT '父id',
  `class_uuid` varchar(255) DEFAULT NULL,
  `class_parent_uuid` varchar(8000) DEFAULT NULL,
  `sort` int(255) DEFAULT '1' COMMENT '权重',
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `is_delete` int(11) DEFAULT '0' COMMENT '是否删除',
  `is_recommend` varchar(255) DEFAULT '0' COMMENT '是否首页推荐',
  PRIMARY KEY (`class_id`)
) ENGINE=InnoDB AUTO_INCREMENT=96 DEFAULT CHARSET=utf8 COMMENT='商品分类表';

-- ----------------------------
--  Table structure for `tst_goods_group`
-- ----------------------------
DROP TABLE IF EXISTS `tst_goods_group`;
CREATE TABLE `tst_goods_group` (
  `goods_group_id` int(11) NOT NULL AUTO_INCREMENT,
  `goods_id` int(11) DEFAULT NULL COMMENT '商品id',
  `group_name` varchar(255) DEFAULT NULL COMMENT '团购名称',
  `group_price` varchar(100) DEFAULT NULL COMMENT '团购价',
  `group_need_time` varchar(255) DEFAULT NULL COMMENT '团购等待时间（单位分钟）',
  `group_need_count` int(11) DEFAULT '0' COMMENT '团购需要人数',
  `sort` int(11) DEFAULT '1' COMMENT '权重',
  `is_delete` int(11) DEFAULT '0',
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`goods_group_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
--  Table structure for `tst_goods_group_specification`
-- ----------------------------
DROP TABLE IF EXISTS `tst_goods_group_specification`;
CREATE TABLE `tst_goods_group_specification` (
  `group_specification_id` int(11) NOT NULL AUTO_INCREMENT,
  `goods_group_id` int(11) DEFAULT NULL COMMENT '团购id',
  `specification_id` int(11) DEFAULT NULL COMMENT '规格id',
  `group_price` decimal(10,2) DEFAULT NULL COMMENT '团购价',
  `group_stock` int(255) DEFAULT NULL COMMENT '库存',
  `is_delete` varchar(255) DEFAULT '0',
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`group_specification_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
--  Table structure for `tst_goods_img`
-- ----------------------------
DROP TABLE IF EXISTS `tst_goods_img`;
CREATE TABLE `tst_goods_img` (
  `goods_img_id` int(11) NOT NULL AUTO_INCREMENT,
  `goods_id` varchar(50) DEFAULT NULL,
  `goods_img` varchar(50) DEFAULT NULL,
  `sort` int(255) NOT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `is_delete` varchar(255) DEFAULT '0',
  PRIMARY KEY (`goods_img_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8130 DEFAULT CHARSET=utf8 COMMENT='商品关联图片表';

-- ----------------------------
--  Table structure for `tst_goods_relation_class`
-- ----------------------------
DROP TABLE IF EXISTS `tst_goods_relation_class`;
CREATE TABLE `tst_goods_relation_class` (
  `goods_class_id` int(11) NOT NULL AUTO_INCREMENT,
  `class_id` int(11) DEFAULT NULL,
  `goods_id` int(11) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `is_delete` varchar(255) DEFAULT '0',
  `uuid` varchar(255) DEFAULT NULL,
  `parent_uuid` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`goods_class_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1807 DEFAULT CHARSET=utf8 COMMENT='分类关联商品表';

-- ----------------------------
--  Table structure for `tst_goods_relation_specification`
-- ----------------------------
DROP TABLE IF EXISTS `tst_goods_relation_specification`;
CREATE TABLE `tst_goods_relation_specification` (
  `specification_id` int(11) NOT NULL AUTO_INCREMENT,
  `goods_id` int(11) DEFAULT NULL,
  `specification_state` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '1' COMMENT '0:下架 1:上架',
  `specification_sku` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '规格sku',
  `specification_ids` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '规格组合',
  `specification_names` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '规格名称组合',
  `specification_sales` int(11) DEFAULT '0' COMMENT '销量',
  `specification_stock` int(11) DEFAULT '0' COMMENT '库存',
  `specification_img` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '图片',
  `specification_price` decimal(30,2) DEFAULT '0.00' COMMENT '价格',
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `is_delete` int(11) DEFAULT '0',
  PRIMARY KEY (`specification_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
--  Table structure for `tst_goods_shop_car`
-- ----------------------------
DROP TABLE IF EXISTS `tst_goods_shop_car`;
CREATE TABLE `tst_goods_shop_car` (
  `car_id` int(11) NOT NULL AUTO_INCREMENT,
  `member_id` varchar(50) DEFAULT NULL,
  `goods_id` varchar(50) DEFAULT NULL COMMENT 'car_type 为goods则是商品ID  promotion:促销Id',
  `goods_name` varchar(255) DEFAULT NULL COMMENT '商品名称',
  `goods_img` varchar(255) DEFAULT NULL COMMENT '商品图片',
  `merchants_id` varchar(50) DEFAULT NULL,
  `specification_id` int(11) DEFAULT NULL COMMENT '规格id',
  `specification_ids` varchar(255) DEFAULT NULL COMMENT '规格数组',
  `specification_names` varchar(255) DEFAULT NULL COMMENT '规格名称数组',
  `goods_num` varchar(50) DEFAULT NULL COMMENT '数量',
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `is_delete` int(11) DEFAULT '0' COMMENT '1删除',
  PRIMARY KEY (`car_id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COMMENT='购物车';

-- ----------------------------
--  Table structure for `tst_goods_specification`
-- ----------------------------
DROP TABLE IF EXISTS `tst_goods_specification`;
CREATE TABLE `tst_goods_specification` (
  `specification_id` int(11) NOT NULL AUTO_INCREMENT,
  `specification_value` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parent_id` int(11) DEFAULT '-1' COMMENT '父id',
  `sort` int(11) DEFAULT '1' COMMENT '权重',
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `is_delete` int(11) DEFAULT '0',
  PRIMARY KEY (`specification_id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
--  Table structure for `tst_goods_welfare`
-- ----------------------------
DROP TABLE IF EXISTS `tst_goods_welfare`;
CREATE TABLE `tst_goods_welfare` (
  `goods_welfare_id` int(11) NOT NULL AUTO_INCREMENT,
  `goods_id` int(11) DEFAULT NULL COMMENT '商品id',
  `welfare_id` int(11) DEFAULT NULL COMMENT '公益id',
  `percent_value` decimal(10,2) DEFAULT NULL COMMENT '收取交易金额的百分比',
  `goods_welfare_state` varchar(10) DEFAULT '1' COMMENT '上下架状态',
  `is_delete` varchar(10) DEFAULT '0',
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`goods_welfare_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
--  Table structure for `tst_home_activity`
-- ----------------------------
DROP TABLE IF EXISTS `tst_home_activity`;
CREATE TABLE `tst_home_activity` (
  `activity_id` int(11) NOT NULL AUTO_INCREMENT,
  `activity_name` varchar(255) DEFAULT NULL,
  `activity_img` varchar(255) DEFAULT NULL COMMENT '图片',
  `activity_url` varchar(255) DEFAULT NULL COMMENT '链接',
  `activity_type` varchar(255) DEFAULT '1' COMMENT '1:分类活动',
  `is_delete` varchar(255) DEFAULT '0',
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`activity_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COMMENT='首页活动展示';

-- ----------------------------
--  Table structure for `tst_home_activity_class`
-- ----------------------------
DROP TABLE IF EXISTS `tst_home_activity_class`;
CREATE TABLE `tst_home_activity_class` (
  `activity_class_id` int(11) NOT NULL AUTO_INCREMENT,
  `activity_id` int(11) DEFAULT NULL,
  `class_id` varchar(255) DEFAULT NULL,
  `is_delete` varchar(255) DEFAULT '0',
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`activity_class_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COMMENT='分类活动下 分类列表';

-- ----------------------------
--  Table structure for `tst_live_gift`
-- ----------------------------
DROP TABLE IF EXISTS `tst_live_gift`;
CREATE TABLE `tst_live_gift` (
  `gift_id` int(11) NOT NULL AUTO_INCREMENT,
  `gift_name` varchar(255) DEFAULT NULL COMMENT '礼物名称',
  `gift_img` varchar(255) DEFAULT NULL COMMENT '礼物图标',
  `gift_price` decimal(10,2) DEFAULT NULL COMMENT '礼物单价',
  `gift_price_unit_img` varchar(255) DEFAULT NULL COMMENT '礼物单位图标',
  `gift_state` varchar(255) DEFAULT '1' COMMENT '0:下架 1:上架',
  `sort` int(11) DEFAULT NULL COMMENT '权重',
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `is_delete` varchar(255) DEFAULT '0',
  PRIMARY KEY (`gift_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
--  Table structure for `tst_member`
-- ----------------------------
DROP TABLE IF EXISTS `tst_member`;
CREATE TABLE `tst_member` (
  `member_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `room_id` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '房间号  直播用',
  `member_open_id` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '微信openid',
  `member_account` varchar(11) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '账号',
  `member_password` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '密码',
  `member_token` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '用户token',
  `member_real_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '真实姓名',
  `member_nick_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '昵称',
  `member_phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '手机号',
  `member_head_image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '/images/member/default.png' COMMENT '头像图片路径',
  `member_sex` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT 'm' COMMENT '性别 m:男 w:女',
  `member_age` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '0' COMMENT '年龄',
  `member_birthday` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '生日',
  `member_pay_password` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '用户支付密码',
  `member_type` int(11) DEFAULT '1' COMMENT '用户类型（具体项目 具体定义）1:普通用户 2:商家 3:分销商',
  `invitation_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '自己的邀请码',
  `fill_invitation_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '填写的邀请码',
  `member_create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `member_update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `is_delete` int(11) DEFAULT '0' COMMENT '是否删除',
  `hx_account` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '环信账号',
  `hx_password` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '环信密码',
  `hx_nick_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '环信昵称',
  `tengxun_im_account` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '腾讯im账号',
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `integral_value` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT '0' COMMENT '积分值',
  PRIMARY KEY (`member_id`)
) ENGINE=InnoDB AUTO_INCREMENT=516 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='用户信息表';

-- ----------------------------
--  Table structure for `tst_member_address`
-- ----------------------------
DROP TABLE IF EXISTS `tst_member_address`;
CREATE TABLE `tst_member_address` (
  `address_id` int(11) NOT NULL AUTO_INCREMENT,
  `member_id` varchar(10) DEFAULT NULL,
  `address_mobile` varchar(50) DEFAULT NULL COMMENT '手机号',
  `address_name` varchar(50) DEFAULT NULL COMMENT '姓名',
  `address_province` varchar(50) DEFAULT NULL COMMENT '省',
  `address_city` varchar(50) DEFAULT NULL COMMENT '市',
  `address_country` varchar(50) DEFAULT NULL COMMENT '区',
  `address_detailed` varchar(100) DEFAULT NULL COMMENT '详情地址',
  `address_road` varchar(255) DEFAULT NULL COMMENT '街道',
  `address_zip_code` varchar(10) DEFAULT NULL COMMENT '邮编',
  `address_longitude` varchar(255) DEFAULT NULL,
  `address_latitude` varchar(255) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `is_default` varchar(10) DEFAULT '0',
  `is_delete` int(10) DEFAULT '0',
  PRIMARY KEY (`address_id`)
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8 COMMENT='用户地址管理表';

-- ----------------------------
--  Table structure for `tst_member_collection`
-- ----------------------------
DROP TABLE IF EXISTS `tst_member_collection`;
CREATE TABLE `tst_member_collection` (
  `collection_id` int(11) NOT NULL AUTO_INCREMENT,
  `member_id` int(11) DEFAULT NULL COMMENT '用户id',
  `collection_type` varchar(255) DEFAULT NULL COMMENT 'goods:收藏商品   merchants:收藏商家  user:收藏用户(主播)',
  `goods_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL COMMENT '关注用户id',
  `merchants_id` int(11) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `is_delete` varchar(255) DEFAULT '0',
  PRIMARY KEY (`collection_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
--  Table structure for `tst_member_group`
-- ----------------------------
DROP TABLE IF EXISTS `tst_member_group`;
CREATE TABLE `tst_member_group` (
  `member_group_id` int(11) NOT NULL AUTO_INCREMENT,
  `member_id` int(11) DEFAULT NULL,
  `goods_id` int(11) DEFAULT NULL,
  `goods_group_id` int(11) DEFAULT NULL COMMENT '商品关联规格',
  `group_need_count` int(11) DEFAULT NULL COMMENT '需要人数',
  `group_now_count` int(11) DEFAULT '0' COMMENT '现在人数',
  `group_need_time` varchar(255) DEFAULT NULL COMMENT '团购等待时间（单位分钟）',
  `group_state` varchar(255) DEFAULT '0' COMMENT '0:未支付 1:支付 2:满了 3:过期了',
  `end_time` datetime DEFAULT NULL COMMENT '团购等待结束时间',
  `qrcode_img` varchar(255) DEFAULT NULL COMMENT '二维码',
  `is_delete` varchar(255) DEFAULT '0',
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `ping_refund_no` varchar(255) DEFAULT NULL,
  `ping_refund_charge` varchar(2000) DEFAULT NULL,
  PRIMARY KEY (`member_group_id`)
) ENGINE=InnoDB AUTO_INCREMENT=650 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
--  Table structure for `tst_member_integral`
-- ----------------------------
DROP TABLE IF EXISTS `tst_member_integral`;
CREATE TABLE `tst_member_integral` (
  `integral_id` int(11) NOT NULL AUTO_INCREMENT,
  `member_id` int(11) DEFAULT NULL,
  `integral_value` varchar(255) DEFAULT NULL,
  `integral_type` varchar(255) DEFAULT 'order' COMMENT 'order:订单',
  `order_id` int(11) DEFAULT NULL,
  `order_no` varchar(255) DEFAULT NULL,
  `goods_name` varchar(255) DEFAULT NULL,
  `is_delete` varchar(255) DEFAULT '0',
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`integral_id`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
--  Table structure for `tst_member_live`
-- ----------------------------
DROP TABLE IF EXISTS `tst_member_live`;
CREATE TABLE `tst_member_live` (
  `live_id` int(11) NOT NULL AUTO_INCREMENT,
  `member_id` int(11) DEFAULT NULL COMMENT '用户id',
  `stream_id` varchar(255) DEFAULT NULL COMMENT '直播码 标示事件源于哪一条直播流',
  `room_id` varchar(255) DEFAULT NULL COMMENT '房间号',
  `live_title` varchar(255) DEFAULT NULL COMMENT '直播标题',
  `live_img` varchar(255) DEFAULT NULL COMMENT '直播封面',
  `live_push_url` varchar(255) DEFAULT NULL COMMENT '直播推流地址',
  `live_play_rtmp_url` varchar(255) DEFAULT NULL COMMENT '直播播放地址(RTMP)',
  `live_play_flv_url` varchar(255) DEFAULT NULL COMMENT '直播播放地址(FLV)',
  `live_play_hls_url` varchar(255) DEFAULT NULL COMMENT '直播播放地址(HLS)',
  `live_longitude` varchar(255) DEFAULT NULL COMMENT '主播经度',
  `live_latitude` varchar(255) DEFAULT NULL COMMENT '主播维度',
  `live_state` varchar(255) DEFAULT '0' COMMENT '直播状态 0:关闭 1:直播中',
  `create_time` datetime DEFAULT NULL,
  `is_delete` varchar(255) DEFAULT '0',
  `live_start_time` datetime DEFAULT NULL COMMENT '直播开始时间',
  `live_end_time` datetime DEFAULT NULL COMMENT '直播结束时间',
  `goods_id` varchar(255) DEFAULT NULL COMMENT '置顶商品',
  `goods_ids` varchar(255) DEFAULT NULL COMMENT '商品列表',
  PRIMARY KEY (`live_id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
--  Table structure for `tst_member_welfare_share`
-- ----------------------------
DROP TABLE IF EXISTS `tst_member_welfare_share`;
CREATE TABLE `tst_member_welfare_share` (
  `share_id` int(11) NOT NULL AUTO_INCREMENT,
  `member_id` int(11) DEFAULT NULL,
  `goods_id` varchar(11) DEFAULT NULL,
  `welfare_id` int(11) DEFAULT NULL,
  `welfare_price` decimal(10,0) DEFAULT NULL,
  `is_delete` varchar(10) DEFAULT '0',
  `create_time` datetime DEFAULT NULL,
  PRIMARY KEY (`share_id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
--  Table structure for `tst_merchants`
-- ----------------------------
DROP TABLE IF EXISTS `tst_merchants`;
CREATE TABLE `tst_merchants` (
  `merchants_id` int(11) NOT NULL AUTO_INCREMENT,
  `member_id` varchar(255) DEFAULT NULL,
  `merchants_name` varchar(50) DEFAULT NULL COMMENT '店铺名称',
  `merchants_star1` varchar(50) DEFAULT '5' COMMENT '星级1',
  `merchants_star2` varchar(50) DEFAULT '5' COMMENT '星级2',
  `merchants_star3` varchar(50) DEFAULT '5' COMMENT '星级3',
  `assessment_count` varchar(255) DEFAULT '0' COMMENT '评价数',
  `merchants_type` varchar(50) DEFAULT '1' COMMENT '1:店铺',
  `contact_name` varchar(255) DEFAULT NULL COMMENT '联系人姓名',
  `contact_mobile` varchar(255) DEFAULT NULL COMMENT '联系电话',
  `merchants_address` varchar(255) DEFAULT NULL COMMENT '详细地址',
  `merchants_state` varchar(255) DEFAULT '0' COMMENT '供应商开启状态 0：关闭 1：开启  ',
  `merchants_province` varchar(255) DEFAULT NULL COMMENT '省',
  `merchants_city` varchar(255) DEFAULT NULL COMMENT '属于市',
  `merchants_country` varchar(255) DEFAULT NULL COMMENT '区',
  `company_mobile` varchar(255) DEFAULT NULL COMMENT '公司电话',
  `company_name` varchar(255) DEFAULT NULL COMMENT '公司名称',
  `is_delete` int(11) DEFAULT '0',
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `apply_state` varchar(255) DEFAULT '0' COMMENT '0:审核中 1：接受 2：拒绝 ',
  `pay_state` varchar(255) DEFAULT '0' COMMENT '0:未付款 1：付款',
  `refuse_remark` varchar(255) DEFAULT NULL COMMENT '拒绝理由',
  `hx_account` varchar(255) DEFAULT NULL COMMENT '环信账号',
  `hx_password` varchar(255) DEFAULT NULL COMMENT '环信密码',
  `hx_custom_id` varchar(255) DEFAULT NULL COMMENT '环信客服ID',
  `legal_img` varchar(255) DEFAULT NULL COMMENT '法人照片',
  `legal_face_img` varchar(255) DEFAULT NULL COMMENT '身份证正面照',
  `legal_opposite_img` varchar(255) DEFAULT NULL COMMENT '身份证反面照',
  `legal_hand_img` varchar(255) DEFAULT NULL COMMENT '手持身份证照',
  `business_img1` varchar(255) DEFAULT NULL COMMENT '营业执照1',
  `business_img2` varchar(255) DEFAULT NULL COMMENT '营业执照2',
  `business_img3` varchar(255) DEFAULT NULL COMMENT '营业执照3',
  `merchants_position` varchar(255) DEFAULT '' COMMENT '展示位置  home:首页',
  PRIMARY KEY (`merchants_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='商家表';

-- ----------------------------
--  Table structure for `tst_order`
-- ----------------------------
DROP TABLE IF EXISTS `tst_order`;
CREATE TABLE `tst_order` (
  `order_id` int(11) NOT NULL AUTO_INCREMENT,
  `merchants_id` int(11) DEFAULT NULL COMMENT '商家id',
  `member_id` int(11) DEFAULT NULL COMMENT '下单用户id',
  `order_no` varchar(20) DEFAULT NULL COMMENT '订单号',
  `address_id` varchar(11) DEFAULT NULL COMMENT '地址id',
  `address_mobile` varchar(50) DEFAULT NULL COMMENT '地址--手机号',
  `address_name` varchar(50) DEFAULT NULL COMMENT '地址--姓名',
  `address_province` varchar(50) DEFAULT NULL COMMENT '地址--省',
  `address_city` varchar(50) DEFAULT NULL COMMENT '地址--市',
  `address_country` varchar(50) DEFAULT NULL COMMENT '地址--区',
  `address_detailed` varchar(50) DEFAULT NULL COMMENT '地址--详情地址',
  `address_road` varchar(50) DEFAULT NULL COMMENT '地址--街道',
  `address_zip_code` varchar(50) DEFAULT NULL COMMENT '地址--邮编',
  `address_longitude` varchar(50) DEFAULT NULL COMMENT '地址--',
  `address_latitude` varchar(50) DEFAULT NULL COMMENT '地址--',
  `order_total_price` decimal(10,2) DEFAULT NULL COMMENT '订单总价',
  `order_actual_price` decimal(10,2) DEFAULT NULL COMMENT '订单实际支付价格',
  `order_type` varchar(255) DEFAULT 'goods' COMMENT 'goods:正常商品下单   group:团购下单',
  `order_state` varchar(50) DEFAULT NULL COMMENT '订单状态  cancel：取消  wait_pay:待付款  wait_send:带发货  wait_receive：待确认收货 wait_assessment：待评价 end：已结束  wait_group：等待团购人数满',
  `order_remark` varchar(255) DEFAULT NULL COMMENT '订单备注',
  `is_deduct_integral` varchar(255) DEFAULT NULL COMMENT '是否抵扣积分',
  `deduct_integral_value` varchar(255) DEFAULT NULL COMMENT '抵扣多少积分',
  `deduct_integral_price` varchar(255) DEFAULT NULL COMMENT '抵扣积分',
  `deduct_integral_percent` varchar(255) DEFAULT NULL COMMENT '抵扣现金的百分比',
  `custom_remark` text COMMENT '后台客服做备注',
  `create_time` datetime DEFAULT NULL COMMENT '下单时间',
  `update_time` datetime DEFAULT NULL,
  `cancel_end_time` varchar(255) DEFAULT NULL COMMENT '自动取消的结束时间',
  `cancel_time` datetime DEFAULT NULL COMMENT '取消时间',
  `pay_time` datetime DEFAULT NULL COMMENT '付款时间',
  `send_time` datetime DEFAULT NULL COMMENT '发货时间',
  `receive_time` datetime DEFAULT NULL COMMENT '收货时间',
  `assessment_time` datetime DEFAULT NULL COMMENT '评价时间',
  `is_delete` int(11) DEFAULT '0' COMMENT '是否删除 0：未  1：删除',
  `pay_way` varchar(255) DEFAULT NULL COMMENT '付款方式',
  `pay_no` varchar(255) DEFAULT NULL COMMENT '付款订单号',
  `pay_charge` varchar(1000) DEFAULT NULL COMMENT '付款凭证',
  `ping_no` varchar(255) DEFAULT NULL COMMENT 'ping++订单号',
  `member_group_id` varchar(10) DEFAULT NULL COMMENT '用户开团主键',
  `is_give_integral` varchar(255) DEFAULT '0',
  `give_integral_value` varchar(255) DEFAULT NULL,
  `logistics_no` varchar(255) DEFAULT NULL COMMENT '快递单号',
  `logistics_name` varchar(255) DEFAULT NULL COMMENT '快递公司名称',
  `logistics_pinyin` varchar(255) DEFAULT NULL COMMENT '快递公司简写',
  PRIMARY KEY (`order_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1020 DEFAULT CHARSET=utf8 COMMENT='订单表';

-- ----------------------------
--  Table structure for `tst_order_assessment`
-- ----------------------------
DROP TABLE IF EXISTS `tst_order_assessment`;
CREATE TABLE `tst_order_assessment` (
  `assessment_id` int(11) NOT NULL AUTO_INCREMENT,
  `member_id` int(11) DEFAULT NULL COMMENT '用户id',
  `order_id` int(11) DEFAULT NULL COMMENT '订单id',
  `order_no` varchar(20) DEFAULT NULL COMMENT '订单号',
  `assessment_desc` varchar(255) DEFAULT NULL COMMENT '评价内容',
  `assessment_type` varchar(50) DEFAULT '' COMMENT 'goods:评价订单商品  merchants:评价订单商家',
  `assessment_star1` varchar(50) DEFAULT NULL COMMENT '星级1',
  `assessment_star2` varchar(50) DEFAULT NULL COMMENT '星级2',
  `assessment_star3` varchar(50) DEFAULT NULL COMMENT '星级3',
  `merchants_id` int(11) DEFAULT NULL COMMENT '商家id',
  `goods_id` int(11) DEFAULT NULL COMMENT '商品id',
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `is_delete` varchar(10) DEFAULT '0',
  PRIMARY KEY (`assessment_id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
--  Table structure for `tst_order_assessment_img`
-- ----------------------------
DROP TABLE IF EXISTS `tst_order_assessment_img`;
CREATE TABLE `tst_order_assessment_img` (
  `assessment_img_id` int(11) NOT NULL AUTO_INCREMENT,
  `assessment_id` int(11) DEFAULT NULL,
  `assessment_img` varchar(255) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `is_delete` varchar(255) DEFAULT '0',
  PRIMARY KEY (`assessment_img_id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
--  Table structure for `tst_order_distribution`
-- ----------------------------
DROP TABLE IF EXISTS `tst_order_distribution`;
CREATE TABLE `tst_order_distribution` (
  `distribution_id` int(11) NOT NULL AUTO_INCREMENT,
  `member_id` varchar(255) DEFAULT NULL COMMENT '分销得到钱的人  -1代表平台',
  `order_id` varchar(255) DEFAULT NULL COMMENT '订单号',
  `distribution_relation` varchar(255) DEFAULT NULL COMMENT '下单的人 和 的钱的人 之间的关系 vip1：1级分销  vip2:2级分销',
  `distribution_price` varchar(255) DEFAULT NULL COMMENT '分销得到的钱',
  `distribution_percent` varchar(255) DEFAULT NULL COMMENT '订单总额的提成',
  `create_time` datetime DEFAULT NULL,
  `is_delete` varchar(255) DEFAULT '0',
  `distribution_type` varchar(255) DEFAULT NULL COMMENT 'order:订单购买所得  ',
  `user_id` varchar(255) DEFAULT NULL COMMENT '这次充值的用户id',
  `distribution_state` varchar(255) DEFAULT NULL COMMENT 'wait_pay:等待付款  wait_end:等待结束  end:结束',
  PRIMARY KEY (`distribution_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='订单收益表';

-- ----------------------------
--  Table structure for `tst_order_goods`
-- ----------------------------
DROP TABLE IF EXISTS `tst_order_goods`;
CREATE TABLE `tst_order_goods` (
  `order_goods_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` varchar(50) DEFAULT NULL,
  `goods_id` varchar(50) DEFAULT NULL,
  `goods_num` varchar(50) DEFAULT NULL,
  `goods_name` varchar(200) DEFAULT NULL,
  `goods_img` varchar(250) DEFAULT NULL,
  `specification_id` varchar(50) DEFAULT NULL,
  `specification_ids` varchar(50) DEFAULT NULL,
  `specification_names` varchar(50) DEFAULT NULL,
  `specification_stock` varchar(50) DEFAULT NULL,
  `specification_img` varchar(50) DEFAULT NULL,
  `specification_price` decimal(10,2) DEFAULT NULL,
  `is_delete` varchar(10) DEFAULT '0',
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `goods_group_id` int(11) DEFAULT NULL COMMENT '团购主键id',
  `group_specification_id` int(11) DEFAULT NULL COMMENT '团购关联规格主键',
  `group_price` decimal(10,2) DEFAULT NULL COMMENT '团购价',
  `group_stock` varchar(255) DEFAULT NULL COMMENT '团购库存',
  `goods_welfare_id` varchar(11) DEFAULT NULL,
  `welfare_id` varchar(11) DEFAULT NULL,
  `welfare_percent_value` decimal(10,2) DEFAULT NULL COMMENT '给公益的金钱百分比',
  `is_give_integral` varchar(255) DEFAULT NULL,
  `give_integral_value` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`order_goods_id`)
) ENGINE=InnoDB AUTO_INCREMENT=496 DEFAULT CHARSET=utf8 COMMENT='订单关联商品表';

-- ----------------------------
--  Table structure for `tst_order_logistics`
-- ----------------------------
DROP TABLE IF EXISTS `tst_order_logistics`;
CREATE TABLE `tst_order_logistics` (
  `logistics_id` int(11) NOT NULL AUTO_INCREMENT,
  `logistics_name` varchar(255) DEFAULT NULL,
  `logistics_pinyin` varchar(255) DEFAULT NULL,
  `is_delete` int(11) DEFAULT '0',
  `create_time` datetime DEFAULT NULL,
  PRIMARY KEY (`logistics_id`)
) ENGINE=InnoDB AUTO_INCREMENT=123 DEFAULT CHARSET=utf8 COMMENT='订单物流表';

-- ----------------------------
--  Table structure for `tst_order_logistics_detail`
-- ----------------------------
DROP TABLE IF EXISTS `tst_order_logistics_detail`;
CREATE TABLE `tst_order_logistics_detail` (
  `logistics_id` int(11) NOT NULL AUTO_INCREMENT,
  `logistics_time` datetime DEFAULT NULL,
  `logistics_context` varchar(255) DEFAULT NULL,
  `cretate_time` datetime DEFAULT NULL,
  `is_delete` varchar(255) DEFAULT '0',
  `logistics_no` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`logistics_id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `tst_order_refund`
-- ----------------------------
DROP TABLE IF EXISTS `tst_order_refund`;
CREATE TABLE `tst_order_refund` (
  `refund_id` int(11) NOT NULL AUTO_INCREMENT,
  `member_id` varchar(255) DEFAULT NULL,
  `order_id` varchar(255) DEFAULT NULL,
  `order_no` varchar(30) DEFAULT NULL,
  `order_goods_id` varchar(255) DEFAULT NULL,
  `refund_type` varchar(255) DEFAULT '1' COMMENT '1:待发货 退款订单 2:已发货 补发订单',
  `refund_no` varchar(255) DEFAULT NULL COMMENT '退款号',
  `refund_count` varchar(255) DEFAULT NULL COMMENT '退货数量',
  `refund_desc` varchar(255) DEFAULT NULL COMMENT '退货原因描述',
  `refund_state` varchar(255) DEFAULT NULL COMMENT 'wait_review：等待审核  accept:接受 refuse：拒绝  end:退款成功',
  `refund_price` varchar(255) DEFAULT NULL COMMENT '退款金额',
  `refund_reason_id` varchar(255) DEFAULT NULL COMMENT '拒绝理由id',
  `reason_name` varchar(255) DEFAULT NULL COMMENT '拒绝理由内容',
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `is_delete` varchar(10) DEFAULT '0',
  PRIMARY KEY (`refund_id`)
) ENGINE=InnoDB AUTO_INCREMENT=209 DEFAULT CHARSET=utf8 COMMENT='订单退款申请';

-- ----------------------------
--  Table structure for `tst_order_refund_img`
-- ----------------------------
DROP TABLE IF EXISTS `tst_order_refund_img`;
CREATE TABLE `tst_order_refund_img` (
  `refund_img_id` int(11) NOT NULL AUTO_INCREMENT,
  `refund_id` varchar(255) DEFAULT NULL,
  `refund_img` varchar(255) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `is_delete` int(11) DEFAULT '0',
  PRIMARY KEY (`refund_img_id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8 COMMENT='退款申请关联图片表';

-- ----------------------------
--  Table structure for `tst_order_refund_reason`
-- ----------------------------
DROP TABLE IF EXISTS `tst_order_refund_reason`;
CREATE TABLE `tst_order_refund_reason` (
  `refund_reason_id` int(11) NOT NULL AUTO_INCREMENT,
  `reason_name` varchar(255) DEFAULT '',
  `create_time` datetime DEFAULT NULL,
  `is_delete` int(11) DEFAULT '0',
  `sort` int(255) DEFAULT NULL,
  PRIMARY KEY (`refund_reason_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='退款原因表';

-- ----------------------------
--  Table structure for `tst_system_list_type`
-- ----------------------------
DROP TABLE IF EXISTS `tst_system_list_type`;
CREATE TABLE `tst_system_list_type` (
  `type_id` int(11) NOT NULL AUTO_INCREMENT,
  `type_name` varchar(255) DEFAULT NULL,
  `type_value` varchar(255) DEFAULT NULL,
  `is_delete` int(11) DEFAULT '0',
  `create_time` datetime DEFAULT NULL,
  `type_type` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COMMENT='列表配置类型表';

-- ----------------------------
--  Table structure for `tst_system_platform`
-- ----------------------------
DROP TABLE IF EXISTS `tst_system_platform`;
CREATE TABLE `tst_system_platform` (
  `platform_id` int(11) NOT NULL AUTO_INCREMENT,
  `platform_url` varchar(255) DEFAULT NULL COMMENT '域名',
  `platform_abbreviation` varchar(255) DEFAULT 'base' COMMENT '公司缩写',
  `platform_type` varchar(255) DEFAULT '1' COMMENT '类型',
  PRIMARY KEY (`platform_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
--  Table structure for `tst_system_tengxun_im`
-- ----------------------------
DROP TABLE IF EXISTS `tst_system_tengxun_im`;
CREATE TABLE `tst_system_tengxun_im` (
  `im_id` int(11) NOT NULL AUTO_INCREMENT,
  `private_key` varchar(1000) DEFAULT NULL COMMENT '私钥',
  `public_key` varchar(1000) DEFAULT NULL COMMENT '公钥',
  `sdk_appid` varchar(255) DEFAULT NULL,
  `identifier` varchar(255) DEFAULT NULL,
  `im_type` varchar(255) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `is_delete` varchar(255) DEFAULT '0',
  PRIMARY KEY (`im_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
--  Table structure for `tst_system_tengxun_live`
-- ----------------------------
DROP TABLE IF EXISTS `tst_system_tengxun_live`;
CREATE TABLE `tst_system_tengxun_live` (
  `live_id` int(11) NOT NULL AUTO_INCREMENT,
  `live_push_url` varchar(255) DEFAULT NULL COMMENT '推流直播域名',
  `live_play_rtmp_url` varchar(255) DEFAULT NULL COMMENT '播放直播地址（RTMP）',
  `live_play_flv_url` varchar(255) DEFAULT NULL COMMENT '播放直播地址（FLV）',
  `live_play_hls_url` varchar(255) DEFAULT NULL COMMENT '播放直播地址（HLS）',
  `live_key` varchar(255) DEFAULT NULL COMMENT '直播key',
  `live_bizid` varchar(255) DEFAULT NULL COMMENT '直播码',
  `live_type` varchar(255) DEFAULT NULL,
  `crete_time` datetime DEFAULT NULL,
  `is_delete` varchar(255) DEFAULT '0',
  PRIMARY KEY (`live_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
--  Table structure for `tst_system_weixin`
-- ----------------------------
DROP TABLE IF EXISTS `tst_system_weixin`;
CREATE TABLE `tst_system_weixin` (
  `weixin_id` int(11) NOT NULL AUTO_INCREMENT,
  `weixin_appid` varchar(255) DEFAULT NULL,
  `weixin_secret` varchar(255) DEFAULT NULL,
  `weixin_type` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`weixin_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='微信配置表';

-- ----------------------------
--  Table structure for `tst_verification_code`
-- ----------------------------
DROP TABLE IF EXISTS `tst_verification_code`;
CREATE TABLE `tst_verification_code` (
  `code_id` int(11) NOT NULL AUTO_INCREMENT,
  `mobile` varchar(50) DEFAULT NULL COMMENT '手机号',
  `code` varchar(50) DEFAULT NULL COMMENT '验证码',
  `code_type` varchar(50) DEFAULT NULL COMMENT '验证码类型   member_register:用户注册 ',
  `code_desc` varchar(200) DEFAULT NULL COMMENT '描述',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `effective_time` datetime DEFAULT NULL COMMENT '有效时间',
  `is_delete` int(11) DEFAULT '0' COMMENT '1删除',
  PRIMARY KEY (`code_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5326 DEFAULT CHARSET=utf8 COMMENT='平台发送短信表';

-- ----------------------------
--  Table structure for `tst_verification_setting`
-- ----------------------------
DROP TABLE IF EXISTS `tst_verification_setting`;
CREATE TABLE `tst_verification_setting` (
  `verification_id` int(11) NOT NULL AUTO_INCREMENT,
  `verification_url` varchar(255) DEFAULT NULL,
  `verification_account` varchar(255) DEFAULT NULL,
  `verification_password` varchar(255) DEFAULT NULL,
  `verification_content` varchar(255) DEFAULT NULL,
  `key_account` varchar(255) DEFAULT NULL,
  `key_mobile` varchar(255) DEFAULT NULL,
  `key_password` varchar(255) DEFAULT NULL,
  `key_content` varchar(255) DEFAULT NULL,
  `effective_time` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`verification_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='短信配置表';

-- ----------------------------
--  Table structure for `tst_welfare`
-- ----------------------------
DROP TABLE IF EXISTS `tst_welfare`;
CREATE TABLE `tst_welfare` (
  `welfare_id` int(11) NOT NULL AUTO_INCREMENT,
  `welfare_name` varchar(255) DEFAULT NULL COMMENT '公益名称',
  `welfare_img` varchar(255) DEFAULT NULL COMMENT '公益图标',
  `welfare_desc_img` varchar(255) DEFAULT NULL,
  `welfare_desc` varchar(255) DEFAULT NULL COMMENT '公益描述',
  `welfare_need_price` decimal(10,2) DEFAULT NULL COMMENT '目标金额',
  `welfare_finish_price` decimal(10,2) DEFAULT NULL COMMENT '完成金额',
  `finish_join_count` varchar(255) DEFAULT '0' COMMENT '参与人数',
  `welfare_start_time` datetime DEFAULT NULL COMMENT '公益开始时间',
  `welfare_end_time` datetime DEFAULT NULL COMMENT '公益结束时间',
  `welfare_state` varchar(255) DEFAULT '1' COMMENT '上下架状态',
  `welfare_status` varchar(255) DEFAULT '0' COMMENT '完成情况 0:未完成 1:完成',
  `is_recommend` varchar(255) DEFAULT '0' COMMENT '是否推荐',
  `is_delete` varchar(255) DEFAULT '0',
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`welfare_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COMMENT='公益活动';

-- ----------------------------
--  Table structure for `tst_welfare_progress`
-- ----------------------------
DROP TABLE IF EXISTS `tst_welfare_progress`;
CREATE TABLE `tst_welfare_progress` (
  `progress_id` int(11) NOT NULL AUTO_INCREMENT,
  `welfare_id` int(11) DEFAULT NULL,
  `progress_title` varchar(255) DEFAULT NULL,
  `progress_desc` varchar(255) DEFAULT NULL,
  `progress_state` varchar(255) DEFAULT '1' COMMENT '0:下线 1:上线',
  `is_delete` varchar(255) DEFAULT '0',
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`progress_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
--  Table structure for `tst_welfare_progress_img`
-- ----------------------------
DROP TABLE IF EXISTS `tst_welfare_progress_img`;
CREATE TABLE `tst_welfare_progress_img` (
  `img_id` int(11) NOT NULL AUTO_INCREMENT,
  `progress_id` varchar(255) DEFAULT NULL,
  `progress_img` varchar(255) DEFAULT NULL,
  `is_delete` varchar(255) DEFAULT '0',
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`img_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4;

SET FOREIGN_KEY_CHECKS = 1;
