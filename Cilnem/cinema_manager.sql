/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 80019
 Source Host           : localhost:3306
 Source Schema         : cinema_manager

 Target Server Type    : MySQL
 Target Server Version : 80019
 File Encoding         : 65001

 Date: 07/07/2024 19:14:05
*/

SET NAMES utf8;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for sys_bill
-- ----------------------------
DROP TABLE IF EXISTS `sys_bill`;
CREATE TABLE `sys_bill`  (
  `bill_id` bigint(0) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '订单编号',
  `pay_state` tinyint(0) NOT NULL DEFAULT 0 COMMENT '支付状态，0未支付，1已支付',
  `cancel_state` tinyint(0) NOT NULL DEFAULT 0 COMMENT '取消状态，0未取消，1取消',
  `user_id` bigint(0) UNSIGNED NOT NULL COMMENT '用户编号',
  `session_id` bigint(0) UNSIGNED NOT NULL COMMENT '场次编号',
  `seats` varchar(1600) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '购买的座位号，可能为多个，使用varchar(1600)传输',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `deadline` datetime NULL DEFAULT NULL COMMENT '失效时间',
  `cancel_time` datetime NULL DEFAULT NULL COMMENT '取消时间，标志用户取消订单，非系统超时取消',
  PRIMARY KEY (`bill_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 78 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_bill
-- ----------------------------
INSERT INTO `sys_bill` VALUES (1, 1, 0, 2, 1, '[\"1排3座\", \"1排4座\", \"1排5座\", \"1排6座\", \"1排7座\"]', '2024-07-08 12:28:37', '2023-07-08 12:43:34', NULL);
INSERT INTO `sys_bill` VALUES (77, 1, 0, 2, 1, '[\"2排9座\", \"2排10座\"]', '2024-07-08 14:28:59', '2024-07-08 14:43:57', NULL);

-- ----------------------------
-- Table structure for sys_cinema
-- ----------------------------
DROP TABLE IF EXISTS `sys_cinema`;
CREATE TABLE `sys_cinema`  (
  `cinema_id` bigint(0) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '影院编号',
  `cinema_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '影院名称',
  `hall_category_list` varchar(1600) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '拥有影厅类别',
  `cinema_picture` varchar(1600) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '影院图片，varchar(1600)类型存储多张图片',
  `cinema_phone` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '影院电话',
  `cinema_address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '影院地址',
  `work_start_time` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '开始营业时间',
  `work_end_time` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '结束营业时间',
  PRIMARY KEY (`cinema_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_cinema
-- ----------------------------
INSERT INTO `sys_cinema` VALUES (1, '超猫影院', '[\"N号激光厅\", \"IMAX巨幕厅\"]', '[\"/images/cinema/2023/07/03/92084bfd162a4a4698b77332c83700a0.jpg\"]', '888-8888-8888', '青岛市黄岛区', '00:00', '23:59');

-- ----------------------------
-- Table structure for sys_hall
-- ----------------------------
DROP TABLE IF EXISTS `sys_hall`;
CREATE TABLE `sys_hall`  (
  `hall_id` bigint(0) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '影厅编号',
  `cinema_id` bigint(0) UNSIGNED NOT NULL DEFAULT 1 COMMENT '影院编号',
  `hall_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '影厅名称',
  `hall_category` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '影厅类别',
  `row_start` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '1' COMMENT '排开始编号，如1排/A排，默认1排',
  `row_nums` smallint(0) UNSIGNED NOT NULL DEFAULT 10 COMMENT '总排数，默认10',
  `seat_nums_row` smallint(0) UNSIGNED NOT NULL DEFAULT 18 COMMENT '每排的座位数，默认18',
  `seat_nums` smallint(0) UNSIGNED NOT NULL DEFAULT 180 COMMENT '总可用座位数，用于判断影厅是否做满，默认180',
  `seat_state` varchar(1600) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '所有座位的状态，0表示可用，1表示禁用，2表示售出，在场次表中体现',
  `del_state` tinyint(0) NOT NULL DEFAULT 0 COMMENT '删除标记，0未删除，1删除，默认0',
  PRIMARY KEY (`hall_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 39 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_hall
-- ----------------------------
INSERT INTO `sys_hall` VALUES (1, 1, '激光1号厅', 'N号激光厅', '1', 10, 10, 100, '{\"1\": [0, 0, 0, 0, 0, 0, 0, 0, 0, 0], \"2\": [0, 0, 0, 0, 0, 0, 0, 0, 0, 0], \"3\": [0, 0, 0, 0, 0, 0, 0, 0, 0, 0], \"4\": [0, 0, 0, 0, 0, 0, 0, 0, 0, 0], \"5\": [0, 0, 0, 0, 0, 0, 0, 0, 0, 0], \"6\": [0, 0, 0, 0, 0, 0, 0, 0, 0, 0], \"7\": [0, 0, 0, 0, 0, 0, 0, 0, 0, 0], \"8\": [0, 0, 0, 0, 0, 0, 0, 0, 0, 0], \"9\": [0, 0, 0, 0, 0, 0, 0, 0, 0, 0], \"10\": [0, 0, 0, 0, 0, 0, 0, 0, 0, 0]}', 0);
INSERT INTO `sys_hall` VALUES (2, 1, '激光2号厅', 'N号激光厅', '1', 10, 10, 100, '{\"1\": [0, 0, 0, 0, 0, 0, 0, 0, 0, 0], \"2\": [0, 0, 0, 0, 0, 0, 0, 0, 0, 0], \"3\": [0, 0, 0, 0, 0, 0, 0, 0, 0, 0], \"4\": [0, 0, 0, 0, 0, 0, 0, 0, 0, 0], \"5\": [0, 0, 0, 0, 0, 0, 0, 0, 0, 0], \"6\": [0, 0, 0, 0, 0, 0, 0, 0, 0, 0], \"7\": [0, 0, 0, 0, 0, 0, 0, 0, 0, 0], \"8\": [0, 0, 0, 0, 0, 0, 0, 0, 0, 0], \"9\": [0, 0, 0, 0, 0, 0, 0, 0, 0, 0], \"10\": [0, 0, 0, 0, 0, 0, 0, 0, 0, 0]}', 0);
INSERT INTO `sys_hall` VALUES (3, 1, '激光3号厅', 'N号激光厅', '1', 10, 10, 100, '{\"1\": [0, 0, 0, 0, 0, 0, 0, 0, 0, 0], \"2\": [0, 0, 0, 0, 0, 0, 0, 0, 0, 0], \"3\": [0, 0, 0, 0, 0, 0, 0, 0, 0, 0], \"4\": [0, 0, 0, 0, 0, 0, 0, 0, 0, 0], \"5\": [0, 0, 0, 0, 0, 0, 0, 0, 0, 0], \"6\": [0, 0, 0, 0, 0, 0, 0, 0, 0, 0], \"7\": [0, 0, 0, 0, 0, 0, 0, 0, 0, 0], \"8\": [0, 0, 0, 0, 0, 0, 0, 0, 0, 0], \"9\": [0, 0, 0, 0, 0, 0, 0, 0, 0, 0], \"10\": [0, 0, 0, 0, 0, 0, 0, 0, 0, 0]}', 0);
INSERT INTO `sys_hall` VALUES (4, 1, '巨幕1号厅', 'IMAX巨幕厅', '1', 20, 20, 400, '{\"1\": [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], \"2\": [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], \"3\": [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], \"4\": [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], \"5\": [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], \"6\": [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], \"7\": [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], \"8\": [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], \"9\": [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], \"10\": [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], \"11\": [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], \"12\": [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], \"13\": [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], \"14\": [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], \"15\": [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], \"16\": [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], \"17\": [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], \"18\": [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], \"19\": [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], \"20\": [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]}', 0);
INSERT INTO `sys_hall` VALUES (5, 1, '巨幕2号厅', 'IMAX巨幕厅', '1', 20, 20, 400, '{\"1\": [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], \"2\": [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], \"3\": [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], \"4\": [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], \"5\": [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], \"6\": [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], \"7\": [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], \"8\": [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], \"9\": [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], \"10\": [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], \"11\": [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], \"12\": [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], \"13\": [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], \"14\": [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], \"15\": [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], \"16\": [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], \"17\": [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], \"18\": [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], \"19\": [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], \"20\": [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]}', 0);

-- ----------------------------
-- Table structure for sys_movie
-- ----------------------------
DROP TABLE IF EXISTS `sys_movie`;
CREATE TABLE `sys_movie`  (
  `movie_id` bigint(0) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '电影编号',
  `movie_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '电影名称',
  `movie_length` int(0) NULL DEFAULT NULL COMMENT '电影时长(单位: 分钟)',
  `movie_poster` varchar(1600) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '电影海报',
  `movie_area` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '电影区域',
  `release_date` datetime NULL DEFAULT NULL COMMENT '上映时间',
  `movie_box_office` decimal(20, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '电影总票房',
  `movie_introduction` varchar(1600) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '电影简介',
  `movie_pictures` varchar(1600) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '电影图集',
  `del_state` tinyint(0) NOT NULL DEFAULT 0 COMMENT '删除标记，0未删除，1删除，默认0',
  PRIMARY KEY (`movie_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 31 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_movie
-- ----------------------------
INSERT INTO `sys_movie` VALUES (1, '默杀', 120, '[\"/images/movie/2024(1)/07/07(1)/11.jpg\"]', '中国大陆', '2024-07-03 13:00:00', 266.00, '　初中女生惠君（徐娇 饰）长期遭校园霸凌高处坠亡，暴行非但没有停止，甚至祸延到闺蜜小彤（王圣迪 饰）身上。然而，霸凌者也接连殒命于重锤之下。在连环杀人案的背后，难脱嫌疑的众人逐一浮出水面：小彤的母亲（张钧甯 饰）目睹女儿被胶水封嘴却闭口不言，校工林在福看似知晓内情却冷漠疏离，暗中窥探的神秘男吴望（黄明昊 饰）看似身陷险境却面露笑容……杀害霸凌者的雨夜屠夫究竟是他们其中的何人？调查案件的警官戴国栋（吴镇宇 饰）似乎被假象蒙蔽，探秘过程中，宗宗藏污纳垢的旧事被揭开，所有人都被推到了风口浪尖。善恶有报罪恶难逃，真相即将揭晓……', '[\"/images/movie/2024(1)/07/07(1)/12.jpg\", \"/images/movie/2024(1)/07/07(1)/13.jpg\", \"/images/movie/2024(1)/07/07(1)/14.jpg\"]', 0);
INSERT INTO `sys_movie` VALUES (2, '伞少女', 95, '[\"/images/movie/2024(1)/07/07(1)/21.jpg\"]', '中国大陆', '2024-07-06 9:00:00', 0.00, '前朝公主镜折在亡国之后将自己心爱的青罗伞送至念物阁珍藏，临行前她希望青罗伞可以一直陪伴着前朝将军的黑玉剑，可这“一伞一剑”注定了会被命运的锁链拉向截然不同的方向，在命运的十字路口，他们究竟会如何抉择？在预告中更有许多可爱的小物灵们迫不及待现身，他们穿着各式各样的绚烂服装，衣摆飘飘，飞翔在空中萌态十足。', '[\"/images/movie/2024(1)/07/07(1)/22.jpg\", \"/images/movie/2024(1)/07/07(1)/23.jpg\", \"/images/movie/2024(1)/07/07(1)/24.jpg\"]', 0);
INSERT INTO `sys_movie` VALUES (3, '欢迎来到我身边', 102, '[\"/images/movie/2024(1)/07/07(1)/31.jpg\"]', '中国大陆', '2024-07-05 09:00:00', 0.00, '陈小舟（于适 饰）失恋后遭遇了一场意外，从那以后他经常看到大群“嘎嘎”叫的橡皮鸭子，这给陈小舟的生活带来了巨大的阻碍。直到一位名叫冯佳楠（王影璐 饰）的女孩的出现，陈小舟惊讶地发现只要和冯佳楠在一起，鸭子就不会跑出来捣乱，一场啼笑皆非的浪漫之旅就此展开……', '[\"/images/movie/2024(1)/07/07(1)/32.jpg\", \"/images/movie/2024(1)/07/07(1)/33.jpg\", \"/images/movie/2024(1)/07/07(1)/34.jpg\"]', 0);
INSERT INTO `sys_movie` VALUES (4, '头脑特工队', 97, '[\"/images/movie/2024(1)/07/07(1)/41.jpg\"]', '中国大陆', '2024-06-21 12:00:00', 0.00, '《头脑特工队》还是个童话，快乐在经历了一连串的冒险后，肯定了忧郁的价值，帮助她找到了自己的定位。从此之后，每段记忆都不再是单一的颜色，而变成了一颗颗“彩虹”；从此以后，莱莉的人生有了完整地情绪；从此以后，童年的虚拟伙伴就这样消失了，记忆深处的广告歌却时不时的出来凑热闹。', '[\"/images/movie/2024(1)/07/07(1)/42.jpg\", \"/images/movie/2024(1)/07/07(1)/43.jpg\", \"/images/movie/2024(1)/07/07(1)/44.jpg\"]', 0);
INSERT INTO `sys_movie` VALUES (5, '传说', 129, '[\"/images/movie/2024(1)/07/07(1)/51.jpg\"]', '中国大陆', '2024-07-12 10:00:00', 0.00, '前世情缘，梦中寻觅。家国太平，英雄铸成！影片是《神话》的姊妹篇，讲述房教授（成龙 饰）在考古时挖掘出神秘的萨满古玉，它引领着房教授和助手王靖（张艺兴 饰）梦回西汉，化身骁勇善战的汉军将领，征战于无垠的河西草原，率骑兵抗击匈奴守护家国，并与匈奴公主梦云（娜扎 饰)展开一段跨越千年的前世情缘。为寻真相，房教授和助手邀请好友雷振（李晨 饰）深入万年冰川中找寻祭天圣地，欲揭开这段不为人知、横跨千古的传奇故事，却遭萨满专家赫伯尔（李治廷 饰）的阻挠……', '[\"/images/movie/2024(1)/07/07(1)/51.jpg\", \"/images/movie/2024(1)/07/07(1)/52.jpg\"]', 0);
INSERT INTO `sys_movie` VALUES (6, '云边有个小卖部', 131, '[\"/images/movie/2024(1)/07/07(1)/61.jpg\"]', '中国大陆', '2024-06-22 10:00:00', 0.00, '《云边小卖部》的故事很简单，关于云边镇的故事。彭昱畅饰演的刘十三在城市里屡屡不得志，爱情事业双输，还和同事打赌要卖出去1000份保险。一觉醒来，他被相依为命的姥姥用拖拉机驼回到老家云边的小镇。在这里，他重逢童年好友程霜（周也），并和程霜一起开拓保险事业。', '[\"/images/movie/2024(1)/07/07(1)/62.jpg\", \"/images/movie/2024(1)/07/07(1)/63.jpg\", \"/images/movie/2024(1)/07/07(1)/64.jpg\"]', 0);
INSERT INTO `sys_movie` VALUES (7, ' 来福大酒店', 130, '[\"/images/movie/2024(1)/07/07(1)/71.jpg\"]', '中国大陆', '2024-06-28 12:25:49', 0.00, '本片围绕着一家名为“来福大酒店”的病友之家展开讲述这段感人的故事。在这个小小的房子里，柳岩饰演的老板娘在身负压力的情况下仍接纳着形形色色的身患重病的病人和陪他们来就诊的家人。', '[\"/images/movie/2024(1)/07/07(1)/72.jpg\", \"/images/movie/2024(1)/07/07(1)/73.jpg\", \"/images/movie/2024(1)/07/07(1)/74.jpg\"]', 0);
INSERT INTO `sys_movie` VALUES (8, '海关战线', 140, '[\"/images/movie/2024(1)/07/07(1)/81.jpg\"]', '中国大陆', '2024-06-28 12:25:56', 0.00, '香港海关在一次例行海上巡逻中，查获一艘藏有大批杀伤力武器的货船，调查过程中遭遇一群海外势力轰炸抢夺。为追查走私真相，张允南（张学友 饰）派出下属周正礼（谢霆锋 饰）与国际刑警一同远赴海外，辗转庞大而复杂的军火黑市，顶着漫天炮火追查线索的周正礼刚有眉目，噩耗却突然从香港传来，原来军火失窃另有隐情……', '[\"/images/movie/2024(1)/07/07(1)/82.jpg\", \"/images/movie/2024(1)/07/07(1)/83.jpg\", \"/images/movie/2024(1)/07/07(1)/84.jpg\"]', 0);
INSERT INTO `sys_movie` VALUES (9, '加菲猫家族', 140, '[\"/images/movie/2024(1)/07/07(1)/91.jpg\"]', '美国', '2024-6-01 00:02:00', 0.00, '这次的《加菲猫家族》观影到最后，直接就被出现在大屏幕的猫猫各种meme给迷倒了，我是没想到在动画里还给你整这么写爆款短视频呢。那我都给片方宣发想好了，与自己家里的猫猫合影上传到平台，然后再和加菲猫这样的动画形象形成同框，那可不得又火起来呢？', '[\"/images/movie/2024(1)/07/07(1)/92.jpg\", \"/images/movie/2024(1)/07/07(1)/93.jpg\", \"/images/movie/2024(1)/07/07(1)/94.jpg\"]', 0);
INSERT INTO `sys_movie` VALUES (10, '神偷奶爸', 200, '[\"/images/movie/2024(1)/07/07(1)/101.jpg\"]', '美国', '2024-10-15 00:00:00', 0.00, '新反派恶霸麦斯（威尔·法瑞尔 Will Ferrell 配音）和他既致命危险又美丽性感的女友瓦伦蒂娜（索菲娅·维加拉 Sofía Vergara 配音）来势汹汹，格鲁一家面临未知危险。此时，全新超级小黄人重磅亮相，成为帮助格鲁一家度过这次危机的“秘密武器”。一场惊险刺激、笑料百出的全新冒险即将展开。', '[\"/images/movie/2024(1)/07/07(1)/102.jpg\", \"/images/movie/2024(1)/07/07(1)/103.jpg\", \"/images/movie/2024(1)/07/07(1)/104.jpg\"]', 0);
INSERT INTO `sys_movie` VALUES (11, '二郎神之深海蛟龙', 100, '[\"/images/movie/2024(1)/07/07(1)/111.jpg\"]', '中国大陆', '2024-07-13 00:00:00', 0.00, '上古时期，神工与鬼斧合力将祸害人间的海域统领蛟魔王囚禁于江海交汇处。为束缚住强大的蛟魔王，鬼斧牺牲肉身化作元神，注入神工所打造的用于囚禁蛟魔王的法器中。封神大战结束，墨麒麟和小蛟龙屡次触碰囚禁法器企图释放蛟魔王。于是在姜子牙的推荐下，玉帝决定启用曾经的战神二郎神来执行缉拿墨麒麟的任务。可在捉拿的过程中，二郎神却陷入了一场巨大的惊天阴谋中。', '[\"/images/movie/2024(1)/07/07(1)/112.jpg\", \"/images/movie/2024(1)/07/07(1)/113.jpg\", \"/images/movie/2024(1)/07/07(1)/114.jpg\"]', 0);
INSERT INTO `sys_movie` VALUES (12, '间谍过家家 代号白', 140, '[\"/images/movie/2024(1)/07/07(1)/121.jpg\"]', '日本', '2024-10-24 00:00:00', 0.00, '整部影片的故事脉络非常简单——赫赫有名的出色间谍“黄昏”接到了一个代号为“枭”的任务，为了顺利完成任务并掩人耳目，他化身为心理医生“劳埃德·福杰”，与小女孩“阿尼亚”、美女“约尔”组成了一个“伪装家庭”；', '[\"/images/movie/2024(1)/07/07(1)/122.jpg\", \"/images/movie/2024(1)/07/07(1)/123.jpg\", \"/images/movie/2024(1)/07/07(1)/124.jpg\"]', 0);

-- ----------------------------
-- Table structure for sys_movie_category
-- ----------------------------
DROP TABLE IF EXISTS `sys_movie_category`;
CREATE TABLE `sys_movie_category`  (
  `movie_category_id` bigint(0) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '电影类别编号',
  `movie_category_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '电影类别名称',
  PRIMARY KEY (`movie_category_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 30 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_movie_category
-- ----------------------------
INSERT INTO `sys_movie_category` VALUES (1, '爱情');
INSERT INTO `sys_movie_category` VALUES (2, '喜剧');
INSERT INTO `sys_movie_category` VALUES (3, '动画');
INSERT INTO `sys_movie_category` VALUES (4, '剧情');
INSERT INTO `sys_movie_category` VALUES (5, '恐怖');
INSERT INTO `sys_movie_category` VALUES (6, '动作');
INSERT INTO `sys_movie_category` VALUES (7, '科幻');
INSERT INTO `sys_movie_category` VALUES (8, '悬疑');
INSERT INTO `sys_movie_category` VALUES (9, '惊悚');
INSERT INTO `sys_movie_category` VALUES (10, '犯罪');
INSERT INTO `sys_movie_category` VALUES (11, '冒险');
INSERT INTO `sys_movie_category` VALUES (12, '战争');
INSERT INTO `sys_movie_category` VALUES (13, '奇幻');
INSERT INTO `sys_movie_category` VALUES (14, '运动');
INSERT INTO `sys_movie_category` VALUES (15, '家庭');
INSERT INTO `sys_movie_category` VALUES (16, '古装');
INSERT INTO `sys_movie_category` VALUES (17, '武侠');
INSERT INTO `sys_movie_category` VALUES (18, '西部');
INSERT INTO `sys_movie_category` VALUES (19, '历史');
INSERT INTO `sys_movie_category` VALUES (20, '传记');
INSERT INTO `sys_movie_category` VALUES (21, '歌舞');
INSERT INTO `sys_movie_category` VALUES (22, '黑色电影');
INSERT INTO `sys_movie_category` VALUES (23, '短片');
INSERT INTO `sys_movie_category` VALUES (24, '纪录片');
INSERT INTO `sys_movie_category` VALUES (25, '其他');
INSERT INTO `sys_movie_category` VALUES (26, '历史');

-- ----------------------------
-- Table structure for sys_movie_to_category
-- ----------------------------
DROP TABLE IF EXISTS `sys_movie_to_category`;
CREATE TABLE `sys_movie_to_category`  (
  `movie_id` bigint(0) UNSIGNED NOT NULL COMMENT '电影编号',
  `movie_category_id` bigint(0) UNSIGNED NOT NULL COMMENT '电影类别编号',
  PRIMARY KEY (`movie_id`, `movie_category_id`) USING BTREE,
  INDEX `movie_category_id`(`movie_category_id`) USING BTREE,
  CONSTRAINT `sys_movie_to_category_ibfk_1` FOREIGN KEY (`movie_category_id`) REFERENCES `sys_movie_category` (`movie_category_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_movie_to_category
-- ----------------------------
INSERT INTO `sys_movie_to_category` VALUES (1, 1);
INSERT INTO `sys_movie_to_category` VALUES (3, 1);
INSERT INTO `sys_movie_to_category` VALUES (4, 1);
INSERT INTO `sys_movie_to_category` VALUES (20, 1);
INSERT INTO `sys_movie_to_category` VALUES (23, 1);
INSERT INTO `sys_movie_to_category` VALUES (31, 1);
INSERT INTO `sys_movie_to_category` VALUES (1, 2);
INSERT INTO `sys_movie_to_category` VALUES (8, 2);
INSERT INTO `sys_movie_to_category` VALUES (9, 2);
INSERT INTO `sys_movie_to_category` VALUES (12, 2);
INSERT INTO `sys_movie_to_category` VALUES (16, 2);
INSERT INTO `sys_movie_to_category` VALUES (18, 2);
INSERT INTO `sys_movie_to_category` VALUES (20, 2);
INSERT INTO `sys_movie_to_category` VALUES (31, 2);
INSERT INTO `sys_movie_to_category` VALUES (1, 3);
INSERT INTO `sys_movie_to_category` VALUES (4, 3);
INSERT INTO `sys_movie_to_category` VALUES (5, 3);
INSERT INTO `sys_movie_to_category` VALUES (15, 3);
INSERT INTO `sys_movie_to_category` VALUES (16, 3);
INSERT INTO `sys_movie_to_category` VALUES (17, 3);
INSERT INTO `sys_movie_to_category` VALUES (20, 3);
INSERT INTO `sys_movie_to_category` VALUES (23, 3);
INSERT INTO `sys_movie_to_category` VALUES (31, 3);
INSERT INTO `sys_movie_to_category` VALUES (1, 4);
INSERT INTO `sys_movie_to_category` VALUES (2, 4);
INSERT INTO `sys_movie_to_category` VALUES (5, 4);
INSERT INTO `sys_movie_to_category` VALUES (9, 4);
INSERT INTO `sys_movie_to_category` VALUES (17, 4);
INSERT INTO `sys_movie_to_category` VALUES (19, 4);
INSERT INTO `sys_movie_to_category` VALUES (10, 5);
INSERT INTO `sys_movie_to_category` VALUES (3, 6);
INSERT INTO `sys_movie_to_category` VALUES (8, 6);
INSERT INTO `sys_movie_to_category` VALUES (10, 6);
INSERT INTO `sys_movie_to_category` VALUES (11, 6);
INSERT INTO `sys_movie_to_category` VALUES (14, 6);
INSERT INTO `sys_movie_to_category` VALUES (15, 6);
INSERT INTO `sys_movie_to_category` VALUES (16, 6);
INSERT INTO `sys_movie_to_category` VALUES (18, 6);
INSERT INTO `sys_movie_to_category` VALUES (6, 7);
INSERT INTO `sys_movie_to_category` VALUES (11, 7);
INSERT INTO `sys_movie_to_category` VALUES (18, 7);
INSERT INTO `sys_movie_to_category` VALUES (2, 8);
INSERT INTO `sys_movie_to_category` VALUES (4, 8);
INSERT INTO `sys_movie_to_category` VALUES (20, 8);
INSERT INTO `sys_movie_to_category` VALUES (2, 9);
INSERT INTO `sys_movie_to_category` VALUES (20, 9);
INSERT INTO `sys_movie_to_category` VALUES (8, 10);
INSERT INTO `sys_movie_to_category` VALUES (14, 10);
INSERT INTO `sys_movie_to_category` VALUES (16, 10);
INSERT INTO `sys_movie_to_category` VALUES (20, 10);
INSERT INTO `sys_movie_to_category` VALUES (7, 11);
INSERT INTO `sys_movie_to_category` VALUES (14, 11);
INSERT INTO `sys_movie_to_category` VALUES (5, 13);
INSERT INTO `sys_movie_to_category` VALUES (6, 13);
INSERT INTO `sys_movie_to_category` VALUES (7, 14);
INSERT INTO `sys_movie_to_category` VALUES (12, 15);
INSERT INTO `sys_movie_to_category` VALUES (6, 19);
INSERT INTO `sys_movie_to_category` VALUES (13, 23);
INSERT INTO `sys_movie_to_category` VALUES (13, 24);

-- ----------------------------
-- Table structure for sys_resource
-- ----------------------------
DROP TABLE IF EXISTS `sys_resource`;
CREATE TABLE `sys_resource`  (
  `resource_id` bigint(0) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '资源编号',
  `resource_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '菜单名称',
  `path` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '菜单路径，用于保存页面地址',
  `level` int(0) UNSIGNED NOT NULL DEFAULT 1 COMMENT '资源权限等级,1表示该资源为最高级权限',
  `parent_id` bigint(0) UNSIGNED NOT NULL DEFAULT 0 COMMENT '当前菜单父菜单编号',
  PRIMARY KEY (`resource_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 623 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_resource
-- ----------------------------
INSERT INTO `sys_resource` VALUES (1, '影院信息', 'cinema', 1, 0);
INSERT INTO `sys_resource` VALUES (2, '影片管理', 'movie', 1, 0);
INSERT INTO `sys_resource` VALUES (3, '影厅管理', 'room', 1, 0);
INSERT INTO `sys_resource` VALUES (4, '订单管理', 'order', 1, 0);
INSERT INTO `sys_resource` VALUES (5, '用户管理', 'user', 1, 0);
INSERT INTO `sys_resource` VALUES (6, '角色权限管理', 'permission', 1, 0);
INSERT INTO `sys_resource` VALUES (11, '影院信息管理', 'cinema', 2, 1);
INSERT INTO `sys_resource` VALUES (21, '电影信息管理', 'movie', 2, 2);
INSERT INTO `sys_resource` VALUES (22, '电影类别管理', 'movieCategory', 2, 2);
INSERT INTO `sys_resource` VALUES (31, '影厅信息管理', 'hall', 2, 3);
INSERT INTO `sys_resource` VALUES (32, '场次信息管理', 'session', 2, 3);
INSERT INTO `sys_resource` VALUES (41, '订单信息管理', 'bill', 2, 4);
INSERT INTO `sys_resource` VALUES (51, '用户信息管理', 'user', 2, 5);
INSERT INTO `sys_resource` VALUES (61, '角色信息管理', 'role', 2, 6);
INSERT INTO `sys_resource` VALUES (62, '权限信息管理', 'resource', 2, 6);
INSERT INTO `sys_resource` VALUES (111, '查询影院信息权限', '', 3, 11);
INSERT INTO `sys_resource` VALUES (112, '修改影院信息权限', '', 3, 11);
INSERT INTO `sys_resource` VALUES (211, '查询电影信息权限', '', 3, 21);
INSERT INTO `sys_resource` VALUES (212, '修改电影信息权限', '', 3, 21);
INSERT INTO `sys_resource` VALUES (221, '查询电影类别权限', '', 3, 22);
INSERT INTO `sys_resource` VALUES (222, '修改电影类别权限', '', 3, 22);
INSERT INTO `sys_resource` VALUES (311, '查询影厅信息权限', '', 3, 31);
INSERT INTO `sys_resource` VALUES (312, '修改影厅信息权限', '', 3, 31);
INSERT INTO `sys_resource` VALUES (321, '查询场次信息权限', '', 3, 32);
INSERT INTO `sys_resource` VALUES (322, '修改场次信息权限', '', 3, 32);
INSERT INTO `sys_resource` VALUES (411, '查询订单信息权限', '', 3, 41);
INSERT INTO `sys_resource` VALUES (412, '修改订单信息权限', '', 3, 41);
INSERT INTO `sys_resource` VALUES (511, '查询用户信息权限', '', 3, 51);
INSERT INTO `sys_resource` VALUES (512, '修改用户信息权限', '', 3, 51);
INSERT INTO `sys_resource` VALUES (611, '查询角色信息权限', '', 3, 61);
INSERT INTO `sys_resource` VALUES (612, '修改角色信息权限', '', 3, 61);
INSERT INTO `sys_resource` VALUES (621, '查询资源信息权限', '', 3, 62);
INSERT INTO `sys_resource` VALUES (622, '修改资源信息权限', '', 3, 62);

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role`  (
  `role_id` bigint(0) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '角色编号',
  `role_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '角色名称',
  `role_desc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '角色描述',
  PRIMARY KEY (`role_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES (1, '系统管理员', '管理整个影院在线售票系统');
INSERT INTO `sys_role` VALUES (2, '用户', '用户，仅能使用前台浏览相关信息、下单、修改个人信息等功能');

-- ----------------------------
-- Table structure for sys_role_resource
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_resource`;
CREATE TABLE `sys_role_resource`  (
  `role_id` bigint(0) UNSIGNED NOT NULL COMMENT '角色编号',
  `resource_id` bigint(0) UNSIGNED NOT NULL COMMENT '资源编号，只以3级权限作为权限判断的依据',
  PRIMARY KEY (`role_id`, `resource_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role_resource
-- ----------------------------
INSERT INTO `sys_role_resource` VALUES (1, 111);
INSERT INTO `sys_role_resource` VALUES (1, 112);
INSERT INTO `sys_role_resource` VALUES (1, 211);
INSERT INTO `sys_role_resource` VALUES (1, 212);
INSERT INTO `sys_role_resource` VALUES (1, 221);
INSERT INTO `sys_role_resource` VALUES (1, 222);
INSERT INTO `sys_role_resource` VALUES (1, 311);
INSERT INTO `sys_role_resource` VALUES (1, 312);
INSERT INTO `sys_role_resource` VALUES (1, 321);
INSERT INTO `sys_role_resource` VALUES (1, 322);
INSERT INTO `sys_role_resource` VALUES (1, 411);
INSERT INTO `sys_role_resource` VALUES (1, 412);
INSERT INTO `sys_role_resource` VALUES (1, 511);
INSERT INTO `sys_role_resource` VALUES (1, 512);
INSERT INTO `sys_role_resource` VALUES (1, 611);
INSERT INTO `sys_role_resource` VALUES (1, 612);
INSERT INTO `sys_role_resource` VALUES (1, 621);
INSERT INTO `sys_role_resource` VALUES (1, 622);
INSERT INTO `sys_role_resource` VALUES (2, 211);
INSERT INTO `sys_role_resource` VALUES (2, 221);
INSERT INTO `sys_role_resource` VALUES (2, 231);
INSERT INTO `sys_role_resource` VALUES (2, 241);
INSERT INTO `sys_role_resource` VALUES (2, 251);
INSERT INTO `sys_role_resource` VALUES (2, 261);
INSERT INTO `sys_role_resource` VALUES (2, 311);
INSERT INTO `sys_role_resource` VALUES (2, 312);
INSERT INTO `sys_role_resource` VALUES (2, 321);
INSERT INTO `sys_role_resource` VALUES (2, 411);
INSERT INTO `sys_role_resource` VALUES (2, 412);
INSERT INTO `sys_role_resource` VALUES (2, 511);
INSERT INTO `sys_role_resource` VALUES (2, 621);
INSERT INTO `sys_role_resource` VALUES (10, 621);
INSERT INTO `sys_role_resource` VALUES (10, 622);

-- ----------------------------
-- Table structure for sys_session
-- ----------------------------
DROP TABLE IF EXISTS `sys_session`;
CREATE TABLE `sys_session`  (
  `session_id` bigint(0) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '场次编号',
  `hall_id` bigint(0) UNSIGNED NOT NULL COMMENT '影厅编号',
  `language_version` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '语言版本',
  `movie_id` bigint(0) UNSIGNED NOT NULL COMMENT '电影编号',
  `play_time` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '播放时间',
  `end_time` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '散场时间',
  `deadline` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '检测到的截止时间，没过这个时间不能删电影、影厅信息',
  `session_date` date NOT NULL COMMENT '场次日期',
  `session_price` decimal(10, 2) NOT NULL COMMENT '票价',
  `session_tips` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '影厅提示(如是否需要戴口罩，有什么福利，显示在选座购票位置的影厅后边，格式类似：6号Barco厅-（戴口罩勿饮食）凭票领券免费停车3小时)',
  `session_seats` varchar(1600) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '座位信息，采用{key: [], key: []}存储每一个座位的状态，其中key表示排，数组(下标+1)表示几号座，存储的值为0表示可选，1表示空(无座位)，值为2表示已选择，值为3表示已售出，',
  `seat_nums` smallint(0) UNSIGNED NULL DEFAULT 0 COMMENT '总座位数',
  `sall_nums` smallint(0) NOT NULL DEFAULT 0 COMMENT '售出座位数',
  `del_state` tinyint(0) NOT NULL DEFAULT 0 COMMENT '删除标记，0未删除，1删除，默认0',
  PRIMARY KEY (`session_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 59 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_session
-- ----------------------------
INSERT INTO `sys_session` VALUES (1, 1, '国语', 1, '12:26', '14:26', '2024-07-08 14:46:00', '2024-07-08', 38.00, '独家首映', '{\"1\": [0, 0, 3, 3, 3, 3, 3, 0, 0, 0], \"2\": [0, 0, 0, 0, 0, 0, 0, 0, 3, 3], \"3\": [0, 0, 0, 0, 0, 0, 0, 0, 0, 0], \"4\": [0, 0, 0, 0, 0, 0, 0, 0, 0, 0], \"5\": [0, 0, 0, 0, 0, 0, 0, 0, 0, 0], \"6\": [0, 0, 0, 0, 0, 0, 0, 0, 0, 0], \"7\": [0, 0, 0, 0, 0, 0, 0, 0, 0, 0], \"8\": [0, 0, 0, 0, 0, 0, 0, 0, 0, 0], \"9\": [0, 0, 0, 0, 0, 0, 0, 0, 0, 0], \"10\": [0, 0, 0, 0, 0, 0, 0, 0, 0, 0]}', 100, 7, 0);
INSERT INTO `sys_session` VALUES (2, 3, '国语', 2, '12:32', '14:32', '2024-07-08 14:52:00', '2024-07-08', 40.00, NULL, '{\"1\": [0, 0, 0, 0, 0, 0, 0, 0, 0, 0], \"2\": [0, 0, 0, 0, 0, 0, 0, 0, 0, 0], \"3\": [0, 0, 0, 0, 0, 0, 0, 0, 0, 0], \"4\": [0, 0, 0, 0, 0, 0, 0, 0, 0, 0], \"5\": [0, 0, 0, 0, 0, 0, 0, 0, 0, 0], \"6\": [0, 0, 0, 0, 0, 0, 0, 0, 0, 0], \"7\": [0, 0, 0, 0, 0, 0, 0, 0, 0, 0], \"8\": [0, 0, 0, 0, 0, 0, 0, 0, 0, 0], \"9\": [0, 0, 0, 0, 0, 0, 0, 0, 0, 0], \"10\": [0, 0, 0, 0, 0, 0, 0, 0, 0, 0]}', 100, 0, 0);
INSERT INTO `sys_session` VALUES (3, 4, '英语', 7, '12:32', '14:42', '2024-07-07 15:02:00', '2024-07-07', 35.00, NULL, '{\"1\": [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], \"2\": [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], \"3\": [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], \"4\": [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], \"5\": [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], \"6\": [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], \"7\": [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], \"8\": [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], \"9\": [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], \"10\": [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], \"11\": [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], \"12\": [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], \"13\": [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], \"14\": [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], \"15\": [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], \"16\": [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], \"17\": [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], \"18\": [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], \"19\": [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], \"20\": [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]}', 400, 0, 0);
INSERT INTO `sys_session` VALUES (4, 5, '国语', 4, '12:32', '14:32', '2024-07-08 14:52:00', '2024-07-08', 50.00, NULL, '{\"1\": [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], \"2\": [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], \"3\": [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], \"4\": [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], \"5\": [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], \"6\": [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], \"7\": [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], \"8\": [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], \"9\": [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], \"10\": [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], \"11\": [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], \"12\": [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], \"13\": [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], \"14\": [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], \"15\": [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], \"16\": [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], \"17\": [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], \"18\": [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], \"19\": [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], \"20\": [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]}', 400, 0, 0);
INSERT INTO `sys_session` VALUES (5, 3, '国语', 6, '14:25', '16:25', '2024-07-07 16:45:00', '2024-07-07', 60.00, NULL, '{\"1\": [0, 0, 0, 0, 0, 0, 0, 0, 0, 0], \"2\": [0, 0, 0, 0, 0, 0, 0, 0, 0, 0], \"3\": [0, 0, 0, 0, 0, 0, 0, 0, 0, 0], \"4\": [0, 0, 0, 0, 0, 0, 0, 0, 0, 0], \"5\": [0, 0, 0, 0, 0, 0, 0, 0, 0, 0], \"6\": [0, 0, 0, 0, 0, 0, 0, 0, 0, 0], \"7\": [0, 0, 0, 0, 0, 0, 0, 0, 0, 0], \"8\": [0, 0, 0, 0, 0, 0, 0, 0, 0, 0], \"9\": [0, 0, 0, 0, 0, 0, 0, 0, 0, 0], \"10\": [0, 0, 0, 0, 0, 0, 0, 0, 0, 0]}', 100, 0, 0);
INSERT INTO `sys_session` VALUES (6, 3, '英语', 12, '14:25', '16:45', '2024-12-05 17:05:00', '2024-12-05', 70.00, NULL, '{\"1\": [0, 0, 0, 0, 0, 0, 0, 0, 0, 0], \"2\": [0, 0, 0, 0, 0, 0, 0, 0, 0, 0], \"3\": [0, 0, 0, 0, 0, 0, 0, 0, 0, 0], \"4\": [0, 0, 0, 0, 0, 0, 0, 0, 0, 0], \"5\": [0, 0, 0, 0, 0, 0, 0, 0, 0, 0], \"6\": [0, 0, 0, 0, 0, 0, 0, 0, 0, 0], \"7\": [0, 0, 0, 0, 0, 0, 0, 0, 0, 0], \"8\": [0, 0, 0, 0, 0, 0, 0, 0, 0, 0], \"9\": [0, 0, 0, 0, 0, 0, 0, 0, 0, 0], \"10\": [0, 0, 0, 0, 0, 0, 0, 0, 0, 0]}', 100, 0, 0);
INSERT INTO `sys_session` VALUES (7, 2, '国语', 1, '14:25', '16:25', '2024-05-07 16:45:00', '2024-05-07', 60.00, NULL, '{\"1\": [0, 0, 0, 0, 0, 0, 0, 0, 0, 0], \"2\": [0, 0, 0, 0, 0, 0, 0, 0, 0, 0], \"3\": [0, 0, 0, 0, 0, 0, 0, 0, 0, 0], \"4\": [0, 0, 0, 0, 0, 0, 0, 0, 0, 0], \"5\": [0, 0, 0, 0, 0, 0, 0, 0, 0, 0], \"6\": [0, 0, 0, 0, 0, 0, 0, 0, 0, 0], \"7\": [0, 0, 0, 0, 0, 0, 0, 0, 0, 0], \"8\": [0, 0, 0, 0, 0, 0, 0, 0, 0, 0], \"9\": [0, 0, 0, 0, 0, 0, 0, 0, 0, 0], \"10\": [0, 0, 0, 0, 0, 0, 0, 0, 0, 0]}', 100, 0, 0);
INSERT INTO `sys_session` VALUES (8, 4, '国语', 2, '14:25', '16:25', '2024-12-29 16:45:00', '2024-12-29', 40.00, NULL, '{\"1\": [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], \"2\": [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], \"3\": [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], \"4\": [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], \"5\": [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], \"6\": [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], \"7\": [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], \"8\": [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], \"9\": [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], \"10\": [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], \"11\": [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], \"12\": [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], \"13\": [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], \"14\": [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], \"15\": [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], \"16\": [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], \"17\": [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], \"18\": [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], \"19\": [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], \"20\": [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]}', 400, 0, 0);
INSERT INTO `sys_session` VALUES (9, 3, '英语', 7, '14:25', '16:35', '2024-12-04 16:55:00', '2024-12-04', 80.00, NULL, '{\"1\": [0, 0, 0, 0, 0, 0, 0, 0, 0, 0], \"2\": [0, 0, 0, 0, 0, 0, 0, 0, 0, 0], \"3\": [0, 0, 0, 0, 0, 0, 0, 0, 0, 0], \"4\": [0, 0, 0, 0, 0, 0, 0, 0, 0, 0], \"5\": [0, 0, 0, 0, 0, 0, 0, 0, 0, 0], \"6\": [0, 0, 0, 0, 0, 0, 0, 0, 0, 0], \"7\": [0, 0, 0, 0, 0, 0, 0, 0, 0, 0], \"8\": [0, 0, 0, 0, 0, 0, 0, 0, 0, 0], \"9\": [0, 0, 0, 0, 0, 0, 0, 0, 0, 0], \"10\": [0, 0, 0, 0, 0, 0, 0, 0, 0, 0]}', 100, 0, 0);

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`  (
  `user_id` bigint(0) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '用户编号',
  `user_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户名称(用于登录，添加时验证唯一性)',
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户密码(密文存储)',
  `salt` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '盐',
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户邮箱，记录个人信息和发送通知',
  `phone_number` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户电话号码，用于注册和发送通知',
  `sex` tinyint(0) UNSIGNED NOT NULL COMMENT '用户性别，1为男性0为女性',
  `user_picture` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户头像',
  `role_id` bigint(0) UNSIGNED NOT NULL DEFAULT 3 COMMENT '角色编号',
  `birthday` date NULL DEFAULT NULL COMMENT '生日',
  `autograph` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '个性签名',
  `del_state` tinyint(0) NOT NULL DEFAULT 0 COMMENT '删除标记，0未删除，1删除，默认0',
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 30 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES (1, 'admin', '2f6b5c3044b271f5c07545aa862cf35c', '0v#C4w&i', '1617855952@qq.com', '18388496879', 1, '[\"/images/user/2021/05/19/2b1e80fb2b4746aa8fd21feab6088679.png\"]', 1, '2001-12-21', '爱拼才会赢123', 0);
INSERT INTO `sys_user` VALUES (2, 'user', 'de24bcd64d58e024b252268641a672de', 'DIm1GWgN', '123@qq.com', '13333333333', 1, '[\"/images/user/2023/07/08/b7d88e8b54d84818826f1c1f87de835e.jpg\"]', 3, '2024-07-11', NULL, 0);

SET FOREIGN_KEY_CHECKS = 1;
