/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50506
Source Host           : localhost:3306
Source Database       : wetrip

Target Server Type    : MYSQL
Target Server Version : 50506
File Encoding         : 65001

Date: 2019-01-01 12:48:19
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `wt_cart`
-- ----------------------------
DROP TABLE IF EXISTS `wt_cart`;
CREATE TABLE `wt_cart` (
  `email` varchar(30) CHARACTER SET utf8 NOT NULL,
  `product_id` int(11) NOT NULL,
  `quantity` int(12) DEFAULT NULL,
  PRIMARY KEY (`email`,`product_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of wt_cart
-- ----------------------------

-- ----------------------------
-- Table structure for `wt_collect_travel`
-- ----------------------------
DROP TABLE IF EXISTS `wt_collect_travel`;
CREATE TABLE `wt_collect_travel` (
  `collect_id` int(11) NOT NULL AUTO_INCREMENT,
  `travel_id` int(11) DEFAULT NULL,
  `email` varchar(30) DEFAULT NULL,
  `collect_status` enum('收藏','取消收藏') NOT NULL DEFAULT '收藏',
  `collect_time` datetime DEFAULT NULL,
  PRIMARY KEY (`collect_id`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=gbk;

-- ----------------------------
-- Records of wt_collect_travel
-- ----------------------------
INSERT INTO `wt_collect_travel` VALUES ('1', '12', '12345678@qq.com', '收藏', '2018-11-25 14:19:02');
INSERT INTO `wt_collect_travel` VALUES ('2', '13', '12345678@qq.com', '收藏', '2018-11-26 15:19:28');
INSERT INTO `wt_collect_travel` VALUES ('7', '38', '1005796431@qq.com', '收藏', '2019-01-01 12:02:36');
INSERT INTO `wt_collect_travel` VALUES ('11', '71', '1005796431@qq.com', '收藏', '2019-01-01 12:09:31');

-- ----------------------------
-- Table structure for `wt_comment`
-- ----------------------------
DROP TABLE IF EXISTS `wt_comment`;
CREATE TABLE `wt_comment` (
  `comment_id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(30) DEFAULT NULL,
  `comment_time` datetime DEFAULT NULL,
  `comment_content` varchar(500) DEFAULT NULL,
  `travel_id` int(11) DEFAULT NULL,
  `cparent_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`comment_id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=gbk;

-- ----------------------------
-- Records of wt_comment
-- ----------------------------
INSERT INTO `wt_comment` VALUES ('1', '12345678@qq.com', '2018-11-26 15:20:02', '这是一个评论！！！', '2', null);
INSERT INTO `wt_comment` VALUES ('2', '34567888@126.com', '2018-11-26 15:21:07', '回复啊啊啊啊', '2', '1');
INSERT INTO `wt_comment` VALUES ('3', null, null, '评论a！！！', null, '1');
INSERT INTO `wt_comment` VALUES ('4', null, null, '评论a！！！', null, '1');
INSERT INTO `wt_comment` VALUES ('5', '1005796431@qq.com', '2019-01-01 12:25:58', '真好看！！！', '55', null);
INSERT INTO `wt_comment` VALUES ('6', '1005796431@qq.com', '2019-01-01 12:26:13', '	下次还要去', '55', '5');

-- ----------------------------
-- Table structure for `wt_identity`
-- ----------------------------
DROP TABLE IF EXISTS `wt_identity`;
CREATE TABLE `wt_identity` (
  `identity_id` int(11) NOT NULL AUTO_INCREMENT,
  `identity_name` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`identity_id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=gbk;

-- ----------------------------
-- Records of wt_identity
-- ----------------------------
INSERT INTO `wt_identity` VALUES ('1', '编辑');
INSERT INTO `wt_identity` VALUES ('2', '管理员');
INSERT INTO `wt_identity` VALUES ('3', '系统维护者');
INSERT INTO `wt_identity` VALUES ('4', 'hellp');
INSERT INTO `wt_identity` VALUES ('5', 'hellp');
INSERT INTO `wt_identity` VALUES ('6', 'hellp');
INSERT INTO `wt_identity` VALUES ('7', 'hellp');

-- ----------------------------
-- Table structure for `wt_img`
-- ----------------------------
DROP TABLE IF EXISTS `wt_img`;
CREATE TABLE `wt_img` (
  `image_id` int(11) NOT NULL AUTO_INCREMENT,
  `path` varchar(100) DEFAULT NULL,
  `travel_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`image_id`)
) ENGINE=MyISAM AUTO_INCREMENT=629 DEFAULT CHARSET=gbk;

-- ----------------------------
-- Records of wt_img
-- ----------------------------
INSERT INTO `wt_img` VALUES ('25', 'image\\photo\\52115c395869022c5b322392a7d5e341.jpg', '21');
INSERT INTO `wt_img` VALUES ('24', 'image\\photo\\51edb01d15d5d9cea983136cc5fd8bc1.jpg', '21');
INSERT INTO `wt_img` VALUES ('12', 'image\\photo\\timg3.jpg', '12');
INSERT INTO `wt_img` VALUES ('13', 'image\\photo\\timg5.jpg', '13');
INSERT INTO `wt_img` VALUES ('14', 'image\\photo\\timg.jpg', '14');
INSERT INTO `wt_img` VALUES ('15', 'image\\photo\\timg4.jpg', '15');
INSERT INTO `wt_img` VALUES ('16', 'image\\photo\\timg1.jpg', '15');
INSERT INTO `wt_img` VALUES ('17', 'image\\photo\\timg 9.jpg', '16');
INSERT INTO `wt_img` VALUES ('18', 'image\\photo\\timg10.jpg', '17');
INSERT INTO `wt_img` VALUES ('19', 'image\\photo\\timg11.jpg', '17');
INSERT INTO `wt_img` VALUES ('20', 'image\\photo\\3.jpg', '18');
INSERT INTO `wt_img` VALUES ('21', 'image\\photo\\timg8.jpg', '18');
INSERT INTO `wt_img` VALUES ('22', 'image\\photo\\timg12.jpg', '19');
INSERT INTO `wt_img` VALUES ('23', 'image\\photo\\1.jpg', '20');
INSERT INTO `wt_img` VALUES ('26', 'image\\photo\\f4e3863d7855dd92ff4842f2f3b4e0e4.jpeg', '22');
INSERT INTO `wt_img` VALUES ('27', 'image\\photo\\bc7f7f8878ea4b23664db2269057bd31.jpg', '23');
INSERT INTO `wt_img` VALUES ('28', 'image\\photo\\db781a40bfc1abc8be9ccea7d158bb31.jpg', '23');
INSERT INTO `wt_img` VALUES ('29', 'image\\photo\\7e12f42491512c6b74be20552155dbbb.jpg', '24');
INSERT INTO `wt_img` VALUES ('30', 'image\\photo\\99168182a136b990645529a2ac5aa180.jpg', '24');
INSERT INTO `wt_img` VALUES ('31', 'image\\photo\\7268159741a1bbbcb6772b05ac36f6ab.jpg', '25');
INSERT INTO `wt_img` VALUES ('32', 'image\\photo\\363f03eb983ce9324d31dad2894200d8.jpg', '25');
INSERT INTO `wt_img` VALUES ('33', 'image\\photo\\6142f36d4409d5c2483936f4e98dd7e7.jpg', '25');
INSERT INTO `wt_img` VALUES ('34', 'image\\photo\\07e13c133ef5aaef7c00335f4dfb7ff9.jpg', '26');
INSERT INTO `wt_img` VALUES ('35', 'image\\photo\\597ee47a1fb7f3e9c0cf6d98dae89613.jpg', '26');
INSERT INTO `wt_img` VALUES ('36', 'image\\photo\\b4e4fa76295989d14f595b7e5dabd7ad.jpg', '27');
INSERT INTO `wt_img` VALUES ('37', 'image\\photo\\199081dc1ceaa87215eea13af54d0f4b.jpg', '27');
INSERT INTO `wt_img` VALUES ('38', 'image\\photo\\f253585f945f939e304153e424f40a3d.jpg', '29');
INSERT INTO `wt_img` VALUES ('39', 'image\\photo\\2d45754616268ce6ad3cce1d0acc143e.jpg', '30');
INSERT INTO `wt_img` VALUES ('40', 'image\\photo\\9191b18d8325ec997a45b1fd54219613.jpg', '30');
INSERT INTO `wt_img` VALUES ('42', 'image\\photo\\078a2324bbd4504d1d5d1a59cf096c97.jpg', '32');
INSERT INTO `wt_img` VALUES ('44', 'image\\photo\\8628dfe419aee1c1917607da1e4f821b.jpg', '34');
INSERT INTO `wt_img` VALUES ('45', 'image\\photo\\97f485c5181b2ef9f4f08daeb63879df.jpg', '34');
INSERT INTO `wt_img` VALUES ('46', 'image\\photo\\45f9ee9cae6c2791b9a60661970ed256.jpg', '34');
INSERT INTO `wt_img` VALUES ('47', 'image\\photo\\804bd4bfee987b67ddef3cac1300aa45.jpg', '34');
INSERT INTO `wt_img` VALUES ('48', 'image\\photo\\039b727e572caf06a85ea86a2d4517d7.jpg', '34');
INSERT INTO `wt_img` VALUES ('49', 'image\\photo\\bfa6b7db4bbfced640d294730ebed35d.jpg', '34');
INSERT INTO `wt_img` VALUES ('50', 'image\\photo\\aa4ac0e44c90579f21a53f5baffb504b.jpg', '34');
INSERT INTO `wt_img` VALUES ('51', 'image\\photo\\48f5870ca679648c656067723d4106ab.jpg', '34');
INSERT INTO `wt_img` VALUES ('52', 'image\\photo\\039b727e572caf06a85ea86a2d4517d7.jpg', '35');
INSERT INTO `wt_img` VALUES ('53', 'image\\photo\\45f9ee9cae6c2791b9a60661970ed256.jpg', '35');
INSERT INTO `wt_img` VALUES ('54', 'image\\photo\\804bd4bfee987b67ddef3cac1300aa45.jpg', '35');
INSERT INTO `wt_img` VALUES ('55', 'image\\photo\\48f5870ca679648c656067723d4106ab.jpg', '35');
INSERT INTO `wt_img` VALUES ('56', 'image\\photo\\611fee51f8d53ee6c588e5a70700df7e.jpg', '35');
INSERT INTO `wt_img` VALUES ('57', 'image\\photo\\aa4ac0e44c90579f21a53f5baffb504b.jpg', '35');
INSERT INTO `wt_img` VALUES ('58', 'image\\photo\\ed62586da25ec62b355f0434e209f20d.jpg', '35');
INSERT INTO `wt_img` VALUES ('59', 'image\\photo\\c6718133d4d161b90999efff95623528.jpg', '35');
INSERT INTO `wt_img` VALUES ('60', 'image\\photo\\bfa6b7db4bbfced640d294730ebed35d.jpg', '35');
INSERT INTO `wt_img` VALUES ('61', 'image\\photo\\91c2578ecb632eba4b1d0d42a2f386b8.jpg', '35');
INSERT INTO `wt_img` VALUES ('62', 'image\\photo\\ffe862b00429b9b484a9d1d4d480c0fd.jpg', '35');
INSERT INTO `wt_img` VALUES ('63', 'image\\photo\\35a7cf30f7561dda57b76254bcff8531.jpg', '35');
INSERT INTO `wt_img` VALUES ('64', 'image\\photo\\ee0c25ab9b0324af2e19ce9dde935fa4.jpg', '35');
INSERT INTO `wt_img` VALUES ('65', 'image\\photo\\97f485c5181b2ef9f4f08daeb63879df.jpg', '35');
INSERT INTO `wt_img` VALUES ('66', 'image\\photo\\75e1bec46572ed7b03bcf38a9112c160.jpg', '35');
INSERT INTO `wt_img` VALUES ('67', 'image\\photo\\030791344f6b72dfabd0117999b35f7e.jpg', '35');
INSERT INTO `wt_img` VALUES ('68', 'image\\photo\\8628dfe419aee1c1917607da1e4f821b.jpg', '35');
INSERT INTO `wt_img` VALUES ('69', 'image\\photo\\ee0c25ab9b0324af2e19ce9dde935fa4.jpg', '36');
INSERT INTO `wt_img` VALUES ('70', 'image\\photo\\97f485c5181b2ef9f4f08daeb63879df.jpg', '36');
INSERT INTO `wt_img` VALUES ('71', 'image\\photo\\ffe862b00429b9b484a9d1d4d480c0fd.jpg', '36');
INSERT INTO `wt_img` VALUES ('72', 'image\\photo\\48f5870ca679648c656067723d4106ab.jpg', '36');
INSERT INTO `wt_img` VALUES ('73', 'image\\photo\\75e1bec46572ed7b03bcf38a9112c160.jpg', '36');
INSERT INTO `wt_img` VALUES ('74', 'image\\photo\\35a7cf30f7561dda57b76254bcff8531.jpg', '36');
INSERT INTO `wt_img` VALUES ('75', 'image\\photo\\fe893da819cfdaf8f2cbdbf20ba25361.jpg', '36');
INSERT INTO `wt_img` VALUES ('76', 'image\\photo\\030791344f6b72dfabd0117999b35f7e.jpg', '36');
INSERT INTO `wt_img` VALUES ('77', 'image\\photo\\ec13fe9fe9404ceec0022db1bdb766af.jpg', '36');
INSERT INTO `wt_img` VALUES ('78', 'image\\photo\\782b8e218da3338e1727630a619bd7e8.jpg', '36');
INSERT INTO `wt_img` VALUES ('79', 'image\\photo\\6cfb779ecde88d4b2cb1e0db53f3dce5.jpg', '36');
INSERT INTO `wt_img` VALUES ('80', 'image\\photo\\aa4ac0e44c90579f21a53f5baffb504b.jpg', '36');
INSERT INTO `wt_img` VALUES ('81', 'image\\photo\\8628dfe419aee1c1917607da1e4f821b.jpg', '36');
INSERT INTO `wt_img` VALUES ('82', 'image\\photo\\45f9ee9cae6c2791b9a60661970ed256.jpg', '36');
INSERT INTO `wt_img` VALUES ('83', 'image\\photo\\91c2578ecb632eba4b1d0d42a2f386b8.jpg', '36');
INSERT INTO `wt_img` VALUES ('84', 'image\\photo\\1068730c750462dde1beb1ad60a51963.jpg', '36');
INSERT INTO `wt_img` VALUES ('85', 'image\\photo\\bfa6b7db4bbfced640d294730ebed35d.jpg', '36');
INSERT INTO `wt_img` VALUES ('86', 'image\\photo\\804bd4bfee987b67ddef3cac1300aa45.jpg', '36');
INSERT INTO `wt_img` VALUES ('87', 'image\\photo\\e4cb94158d44ba00ac34961b24c48cf3.jpg', '36');
INSERT INTO `wt_img` VALUES ('88', 'image\\photo\\611fee51f8d53ee6c588e5a70700df7e.jpg', '36');
INSERT INTO `wt_img` VALUES ('89', 'image\\photo\\c6718133d4d161b90999efff95623528.jpg', '36');
INSERT INTO `wt_img` VALUES ('90', 'image\\photo\\18b6c2f4095647037f9ccc5cdabed42a.jpg', '36');
INSERT INTO `wt_img` VALUES ('91', 'image\\photo\\663cc205a0591f11dae62acd8670465f.jpg', '36');
INSERT INTO `wt_img` VALUES ('92', 'image\\photo\\ed62586da25ec62b355f0434e209f20d.jpg', '36');
INSERT INTO `wt_img` VALUES ('93', 'image\\photo\\2a6cfae938d95cefb65334ffeff6eaf5.jpg', '36');
INSERT INTO `wt_img` VALUES ('94', 'image\\photo\\039b727e572caf06a85ea86a2d4517d7.jpg', '36');
INSERT INTO `wt_img` VALUES ('95', 'image\\photo\\75e1bec46572ed7b03bcf38a9112c160.jpg', '37');
INSERT INTO `wt_img` VALUES ('96', 'image\\photo\\ed62586da25ec62b355f0434e209f20d.jpg', '37');
INSERT INTO `wt_img` VALUES ('97', 'image\\photo\\e9f3bc8aeb6faa3619ad6024bdb4ae5d.jpg', '37');
INSERT INTO `wt_img` VALUES ('98', 'image\\photo\\e4cb94158d44ba00ac34961b24c48cf3.jpg', '37');
INSERT INTO `wt_img` VALUES ('99', 'image\\photo\\804bd4bfee987b67ddef3cac1300aa45.jpg', '37');
INSERT INTO `wt_img` VALUES ('100', 'image\\photo\\c6718133d4d161b90999efff95623528.jpg', '37');
INSERT INTO `wt_img` VALUES ('101', 'image\\photo\\45f9ee9cae6c2791b9a60661970ed256.jpg', '37');
INSERT INTO `wt_img` VALUES ('102', 'image\\photo\\bfa6b7db4bbfced640d294730ebed35d.jpg', '37');
INSERT INTO `wt_img` VALUES ('103', 'image\\photo\\ffe862b00429b9b484a9d1d4d480c0fd.jpg', '37');
INSERT INTO `wt_img` VALUES ('104', 'image\\photo\\8628dfe419aee1c1917607da1e4f821b.jpg', '37');
INSERT INTO `wt_img` VALUES ('105', 'image\\photo\\39cf665e7178abbe5f78cc1b46b21193.jpg', '37');
INSERT INTO `wt_img` VALUES ('106', 'image\\photo\\6cfb779ecde88d4b2cb1e0db53f3dce5.jpg', '37');
INSERT INTO `wt_img` VALUES ('107', 'image\\photo\\aa4ac0e44c90579f21a53f5baffb504b.jpg', '37');
INSERT INTO `wt_img` VALUES ('108', 'image\\photo\\97f485c5181b2ef9f4f08daeb63879df.jpg', '37');
INSERT INTO `wt_img` VALUES ('109', 'image\\photo\\35a7cf30f7561dda57b76254bcff8531.jpg', '37');
INSERT INTO `wt_img` VALUES ('110', 'image\\photo\\a2942862079a203230853095a3bdf8e9.jpg', '37');
INSERT INTO `wt_img` VALUES ('111', 'image\\photo\\ee0c25ab9b0324af2e19ce9dde935fa4.jpg', '37');
INSERT INTO `wt_img` VALUES ('112', 'image\\photo\\2a6cfae938d95cefb65334ffeff6eaf5.jpg', '37');
INSERT INTO `wt_img` VALUES ('113', 'image\\photo\\e2d0cc3da9835e9733be9ba5961f27d0.jpg', '37');
INSERT INTO `wt_img` VALUES ('114', 'image\\photo\\611fee51f8d53ee6c588e5a70700df7e.jpg', '37');
INSERT INTO `wt_img` VALUES ('115', 'image\\photo\\e1c2509db08bebe247e758baece0a7d3.jpg', '37');
INSERT INTO `wt_img` VALUES ('116', 'image\\photo\\782b8e218da3338e1727630a619bd7e8.jpg', '37');
INSERT INTO `wt_img` VALUES ('117', 'image\\photo\\039b727e572caf06a85ea86a2d4517d7.jpg', '37');
INSERT INTO `wt_img` VALUES ('118', 'image\\photo\\1068730c750462dde1beb1ad60a51963.jpg', '37');
INSERT INTO `wt_img` VALUES ('119', 'image\\photo\\18b6c2f4095647037f9ccc5cdabed42a.jpg', '37');
INSERT INTO `wt_img` VALUES ('120', 'image\\photo\\fe893da819cfdaf8f2cbdbf20ba25361.jpg', '37');
INSERT INTO `wt_img` VALUES ('121', 'image\\photo\\790ecafdab9d1ef83186414eca06afe5.jpg', '37');
INSERT INTO `wt_img` VALUES ('122', 'image\\photo\\663cc205a0591f11dae62acd8670465f.jpg', '37');
INSERT INTO `wt_img` VALUES ('123', 'image\\photo\\ec13fe9fe9404ceec0022db1bdb766af.jpg', '37');
INSERT INTO `wt_img` VALUES ('124', 'image\\photo\\030791344f6b72dfabd0117999b35f7e.jpg', '37');
INSERT INTO `wt_img` VALUES ('125', 'image\\photo\\1cc7cc967a8fdc4be1e050cb44b74b04.jpg', '37');
INSERT INTO `wt_img` VALUES ('126', 'image\\photo\\91c2578ecb632eba4b1d0d42a2f386b8.jpg', '37');
INSERT INTO `wt_img` VALUES ('127', 'image\\photo\\48f5870ca679648c656067723d4106ab.jpg', '37');
INSERT INTO `wt_img` VALUES ('128', 'image\\photo\\3f9f57eefd986f966d8424d62cb38ecb.jpg', '37');
INSERT INTO `wt_img` VALUES ('129', 'image\\photo\\663cc205a0591f11dae62acd8670465f.jpg', '38');
INSERT INTO `wt_img` VALUES ('130', 'image\\photo\\e9f3bc8aeb6faa3619ad6024bdb4ae5d.jpg', '38');
INSERT INTO `wt_img` VALUES ('131', 'image\\photo\\790ecafdab9d1ef83186414eca06afe5.jpg', '38');
INSERT INTO `wt_img` VALUES ('132', 'image\\photo\\e2d0cc3da9835e9733be9ba5961f27d0.jpg', '38');
INSERT INTO `wt_img` VALUES ('133', 'image\\photo\\1068730c750462dde1beb1ad60a51963.jpg', '38');
INSERT INTO `wt_img` VALUES ('134', 'image\\photo\\ec13fe9fe9404ceec0022db1bdb766af.jpg', '38');
INSERT INTO `wt_img` VALUES ('135', 'image\\photo\\ee0c25ab9b0324af2e19ce9dde935fa4.jpg', '38');
INSERT INTO `wt_img` VALUES ('136', 'image\\photo\\bfa6b7db4bbfced640d294730ebed35d.jpg', '38');
INSERT INTO `wt_img` VALUES ('137', 'image\\photo\\030791344f6b72dfabd0117999b35f7e.jpg', '38');
INSERT INTO `wt_img` VALUES ('138', 'image\\photo\\1cc7cc967a8fdc4be1e050cb44b74b04.jpg', '38');
INSERT INTO `wt_img` VALUES ('139', 'image\\photo\\8628dfe419aee1c1917607da1e4f821b.jpg', '38');
INSERT INTO `wt_img` VALUES ('140', 'image\\photo\\45f9ee9cae6c2791b9a60661970ed256.jpg', '38');
INSERT INTO `wt_img` VALUES ('141', 'image\\photo\\c6718133d4d161b90999efff95623528.jpg', '38');
INSERT INTO `wt_img` VALUES ('142', 'image\\photo\\48f5870ca679648c656067723d4106ab.jpg', '38');
INSERT INTO `wt_img` VALUES ('143', 'image\\photo\\7785e026764c069c3f119c861c39449f.jpg', '38');
INSERT INTO `wt_img` VALUES ('144', 'image\\photo\\ed62586da25ec62b355f0434e209f20d.jpg', '38');
INSERT INTO `wt_img` VALUES ('145', 'image\\photo\\6cfb779ecde88d4b2cb1e0db53f3dce5.jpg', '38');
INSERT INTO `wt_img` VALUES ('146', 'image\\photo\\3f9f57eefd986f966d8424d62cb38ecb.jpg', '38');
INSERT INTO `wt_img` VALUES ('147', 'image\\photo\\cf07efdb53da3e6cd184267bc26f1663.jpg', '38');
INSERT INTO `wt_img` VALUES ('148', 'image\\photo\\fe893da819cfdaf8f2cbdbf20ba25361.jpg', '38');
INSERT INTO `wt_img` VALUES ('149', 'image\\photo\\782b8e218da3338e1727630a619bd7e8.jpg', '38');
INSERT INTO `wt_img` VALUES ('150', 'image\\photo\\bb5bb5eeb467d7170b8f8f1e2acfdbcf.jpg', '38');
INSERT INTO `wt_img` VALUES ('151', 'image\\photo\\97f485c5181b2ef9f4f08daeb63879df.jpg', '38');
INSERT INTO `wt_img` VALUES ('152', 'image\\photo\\75e1bec46572ed7b03bcf38a9112c160.jpg', '38');
INSERT INTO `wt_img` VALUES ('153', 'image\\photo\\39cf665e7178abbe5f78cc1b46b21193.jpg', '38');
INSERT INTO `wt_img` VALUES ('154', 'image\\photo\\039b727e572caf06a85ea86a2d4517d7.jpg', '38');
INSERT INTO `wt_img` VALUES ('155', 'image\\photo\\611fee51f8d53ee6c588e5a70700df7e.jpg', '38');
INSERT INTO `wt_img` VALUES ('156', 'image\\photo\\9fea37469576102f8025090ddd4ccfd0.jpg', '38');
INSERT INTO `wt_img` VALUES ('157', 'image\\photo\\ffe862b00429b9b484a9d1d4d480c0fd.jpg', '38');
INSERT INTO `wt_img` VALUES ('158', 'image\\photo\\e1c2509db08bebe247e758baece0a7d3.jpg', '38');
INSERT INTO `wt_img` VALUES ('159', 'image\\photo\\35a7cf30f7561dda57b76254bcff8531.jpg', '38');
INSERT INTO `wt_img` VALUES ('160', 'image\\photo\\c2c97210dde28f4923ed498b7be79fa7.jpg', '38');
INSERT INTO `wt_img` VALUES ('161', 'image\\photo\\127700f38b37fba0fd64be8db92ff5cb.jpg', '38');
INSERT INTO `wt_img` VALUES ('162', 'image\\photo\\804bd4bfee987b67ddef3cac1300aa45.jpg', '38');
INSERT INTO `wt_img` VALUES ('163', 'image\\photo\\a2942862079a203230853095a3bdf8e9.jpg', '38');
INSERT INTO `wt_img` VALUES ('164', 'image\\photo\\2a6cfae938d95cefb65334ffeff6eaf5.jpg', '38');
INSERT INTO `wt_img` VALUES ('165', 'image\\photo\\17327f5f87ea9d59e4371c17c4a20364.jpg', '38');
INSERT INTO `wt_img` VALUES ('166', 'image\\photo\\b2196c991a165b3efd04793f00c30bd0.jpg', '38');
INSERT INTO `wt_img` VALUES ('167', 'image\\photo\\aa4ac0e44c90579f21a53f5baffb504b.jpg', '38');
INSERT INTO `wt_img` VALUES ('168', 'image\\photo\\0a7650a3b5b3a70f0af60a7010f7ea46.jpg', '38');
INSERT INTO `wt_img` VALUES ('169', 'image\\photo\\e4cb94158d44ba00ac34961b24c48cf3.jpg', '38');
INSERT INTO `wt_img` VALUES ('170', 'image\\photo\\91c2578ecb632eba4b1d0d42a2f386b8.jpg', '38');
INSERT INTO `wt_img` VALUES ('171', 'image\\photo\\18b6c2f4095647037f9ccc5cdabed42a.jpg', '38');
INSERT INTO `wt_img` VALUES ('172', 'image\\photo\\804bd4bfee987b67ddef3cac1300aa45.jpg', '39');
INSERT INTO `wt_img` VALUES ('173', 'image\\photo\\6cfb779ecde88d4b2cb1e0db53f3dce5.jpg', '39');
INSERT INTO `wt_img` VALUES ('174', 'image\\photo\\e1c2509db08bebe247e758baece0a7d3.jpg', '39');
INSERT INTO `wt_img` VALUES ('175', 'image\\photo\\c6718133d4d161b90999efff95623528.jpg', '39');
INSERT INTO `wt_img` VALUES ('176', 'image\\photo\\b2196c991a165b3efd04793f00c30bd0.jpg', '39');
INSERT INTO `wt_img` VALUES ('177', 'image\\photo\\fe893da819cfdaf8f2cbdbf20ba25361.jpg', '39');
INSERT INTO `wt_img` VALUES ('178', 'image\\photo\\aa4ac0e44c90579f21a53f5baffb504b.jpg', '39');
INSERT INTO `wt_img` VALUES ('179', 'image\\photo\\e9f3bc8aeb6faa3619ad6024bdb4ae5d.jpg', '39');
INSERT INTO `wt_img` VALUES ('180', 'image\\photo\\ed62586da25ec62b355f0434e209f20d.jpg', '39');
INSERT INTO `wt_img` VALUES ('181', 'image\\photo\\030791344f6b72dfabd0117999b35f7e.jpg', '39');
INSERT INTO `wt_img` VALUES ('182', 'image\\photo\\127700f38b37fba0fd64be8db92ff5cb.jpg', '39');
INSERT INTO `wt_img` VALUES ('183', 'image\\photo\\17327f5f87ea9d59e4371c17c4a20364.jpg', '39');
INSERT INTO `wt_img` VALUES ('184', 'image\\photo\\75e1bec46572ed7b03bcf38a9112c160.jpg', '39');
INSERT INTO `wt_img` VALUES ('185', 'image\\photo\\782b8e218da3338e1727630a619bd7e8.jpg', '39');
INSERT INTO `wt_img` VALUES ('186', 'image\\photo\\790ecafdab9d1ef83186414eca06afe5.jpg', '39');
INSERT INTO `wt_img` VALUES ('187', 'image\\photo\\ec13fe9fe9404ceec0022db1bdb766af.jpg', '39');
INSERT INTO `wt_img` VALUES ('188', 'image\\photo\\97f485c5181b2ef9f4f08daeb63879df.jpg', '39');
INSERT INTO `wt_img` VALUES ('189', 'image\\photo\\ee0c25ab9b0324af2e19ce9dde935fa4.jpg', '39');
INSERT INTO `wt_img` VALUES ('190', 'image\\photo\\39cf665e7178abbe5f78cc1b46b21193.jpg', '39');
INSERT INTO `wt_img` VALUES ('191', 'image\\photo\\35a7cf30f7561dda57b76254bcff8531.jpg', '39');
INSERT INTO `wt_img` VALUES ('192', 'image\\photo\\45f9ee9cae6c2791b9a60661970ed256.jpg', '39');
INSERT INTO `wt_img` VALUES ('193', 'image\\photo\\e4cb94158d44ba00ac34961b24c48cf3.jpg', '39');
INSERT INTO `wt_img` VALUES ('194', 'image\\photo\\039b727e572caf06a85ea86a2d4517d7.jpg', '39');
INSERT INTO `wt_img` VALUES ('195', 'image\\photo\\9fea37469576102f8025090ddd4ccfd0.jpg', '39');
INSERT INTO `wt_img` VALUES ('196', 'image\\photo\\ffe862b00429b9b484a9d1d4d480c0fd.jpg', '39');
INSERT INTO `wt_img` VALUES ('197', 'image\\photo\\91c2578ecb632eba4b1d0d42a2f386b8.jpg', '39');
INSERT INTO `wt_img` VALUES ('198', 'image\\photo\\18b6c2f4095647037f9ccc5cdabed42a.jpg', '39');
INSERT INTO `wt_img` VALUES ('199', 'image\\photo\\a2942862079a203230853095a3bdf8e9.jpg', '39');
INSERT INTO `wt_img` VALUES ('200', 'image\\photo\\48f5870ca679648c656067723d4106ab.jpg', '39');
INSERT INTO `wt_img` VALUES ('201', 'image\\photo\\7785e026764c069c3f119c861c39449f.jpg', '39');
INSERT INTO `wt_img` VALUES ('202', 'image\\photo\\cf07efdb53da3e6cd184267bc26f1663.jpg', '39');
INSERT INTO `wt_img` VALUES ('203', 'image\\photo\\0a7650a3b5b3a70f0af60a7010f7ea46.jpg', '39');
INSERT INTO `wt_img` VALUES ('204', 'image\\photo\\8628dfe419aee1c1917607da1e4f821b.jpg', '39');
INSERT INTO `wt_img` VALUES ('205', 'image\\photo\\1cc7cc967a8fdc4be1e050cb44b74b04.jpg', '39');
INSERT INTO `wt_img` VALUES ('206', 'image\\photo\\3f9f57eefd986f966d8424d62cb38ecb.jpg', '39');
INSERT INTO `wt_img` VALUES ('207', 'image\\photo\\c2c97210dde28f4923ed498b7be79fa7.jpg', '39');
INSERT INTO `wt_img` VALUES ('208', 'image\\photo\\1068730c750462dde1beb1ad60a51963.jpg', '39');
INSERT INTO `wt_img` VALUES ('209', 'image\\photo\\e2d0cc3da9835e9733be9ba5961f27d0.jpg', '39');
INSERT INTO `wt_img` VALUES ('210', 'image\\photo\\bfa6b7db4bbfced640d294730ebed35d.jpg', '39');
INSERT INTO `wt_img` VALUES ('211', 'image\\photo\\2a6cfae938d95cefb65334ffeff6eaf5.jpg', '39');
INSERT INTO `wt_img` VALUES ('212', 'image\\photo\\611fee51f8d53ee6c588e5a70700df7e.jpg', '39');
INSERT INTO `wt_img` VALUES ('213', 'image\\photo\\663cc205a0591f11dae62acd8670465f.jpg', '39');
INSERT INTO `wt_img` VALUES ('214', 'image\\photo\\bb5bb5eeb467d7170b8f8f1e2acfdbcf.jpg', '39');
INSERT INTO `wt_img` VALUES ('215', 'image\\photo\\3f9f57eefd986f966d8424d62cb38ecb.jpg', '40');
INSERT INTO `wt_img` VALUES ('216', 'image\\photo\\18b6c2f4095647037f9ccc5cdabed42a.jpg', '40');
INSERT INTO `wt_img` VALUES ('217', 'image\\photo\\e1c2509db08bebe247e758baece0a7d3.jpg', '40');
INSERT INTO `wt_img` VALUES ('218', 'image\\photo\\e4cb94158d44ba00ac34961b24c48cf3.jpg', '40');
INSERT INTO `wt_img` VALUES ('219', 'image\\photo\\8628dfe419aee1c1917607da1e4f821b.jpg', '40');
INSERT INTO `wt_img` VALUES ('220', 'image\\photo\\ed62586da25ec62b355f0434e209f20d.jpg', '40');
INSERT INTO `wt_img` VALUES ('221', 'image\\photo\\fe893da819cfdaf8f2cbdbf20ba25361.jpg', '40');
INSERT INTO `wt_img` VALUES ('222', 'image\\photo\\c6718133d4d161b90999efff95623528.jpg', '40');
INSERT INTO `wt_img` VALUES ('223', 'image\\photo\\039b727e572caf06a85ea86a2d4517d7.jpg', '40');
INSERT INTO `wt_img` VALUES ('224', 'image\\photo\\790ecafdab9d1ef83186414eca06afe5.jpg', '40');
INSERT INTO `wt_img` VALUES ('225', 'image\\photo\\90bc8d14767e169062e69b13617b8362.jpg', '40');
INSERT INTO `wt_img` VALUES ('226', 'image\\photo\\782b8e218da3338e1727630a619bd7e8.jpg', '40');
INSERT INTO `wt_img` VALUES ('227', 'image\\photo\\9fea37469576102f8025090ddd4ccfd0.jpg', '40');
INSERT INTO `wt_img` VALUES ('228', 'image\\photo\\97f485c5181b2ef9f4f08daeb63879df.jpg', '40');
INSERT INTO `wt_img` VALUES ('229', 'image\\photo\\611fee51f8d53ee6c588e5a70700df7e.jpg', '40');
INSERT INTO `wt_img` VALUES ('230', 'image\\photo\\2a6cfae938d95cefb65334ffeff6eaf5.jpg', '40');
INSERT INTO `wt_img` VALUES ('231', 'image\\photo\\e2d0cc3da9835e9733be9ba5961f27d0.jpg', '40');
INSERT INTO `wt_img` VALUES ('232', 'image\\photo\\c2c97210dde28f4923ed498b7be79fa7.jpg', '40');
INSERT INTO `wt_img` VALUES ('233', 'image\\photo\\b2196c991a165b3efd04793f00c30bd0.jpg', '40');
INSERT INTO `wt_img` VALUES ('234', 'image\\photo\\48f5870ca679648c656067723d4106ab.jpg', '40');
INSERT INTO `wt_img` VALUES ('235', 'image\\photo\\ec13fe9fe9404ceec0022db1bdb766af.jpg', '40');
INSERT INTO `wt_img` VALUES ('236', 'image\\photo\\853becbaa878fd6b099dd324f3d02326.jpg', '40');
INSERT INTO `wt_img` VALUES ('237', 'image\\photo\\ee0c25ab9b0324af2e19ce9dde935fa4.jpg', '40');
INSERT INTO `wt_img` VALUES ('238', 'image\\photo\\127700f38b37fba0fd64be8db92ff5cb.jpg', '40');
INSERT INTO `wt_img` VALUES ('239', 'image\\photo\\7af25f10be471d1b964cec1291206ae3.jpg', '40');
INSERT INTO `wt_img` VALUES ('240', 'image\\photo\\2e06faa501d65bced973f57b4c5b9132.jpg', '40');
INSERT INTO `wt_img` VALUES ('241', 'image\\photo\\1cc7cc967a8fdc4be1e050cb44b74b04.jpg', '40');
INSERT INTO `wt_img` VALUES ('242', 'image\\photo\\030791344f6b72dfabd0117999b35f7e.jpg', '40');
INSERT INTO `wt_img` VALUES ('243', 'image\\photo\\cf07efdb53da3e6cd184267bc26f1663.jpg', '40');
INSERT INTO `wt_img` VALUES ('244', 'image\\photo\\1068730c750462dde1beb1ad60a51963.jpg', '40');
INSERT INTO `wt_img` VALUES ('245', 'image\\photo\\45f9ee9cae6c2791b9a60661970ed256.jpg', '40');
INSERT INTO `wt_img` VALUES ('246', 'image\\photo\\e9f3bc8aeb6faa3619ad6024bdb4ae5d.jpg', '40');
INSERT INTO `wt_img` VALUES ('247', 'image\\photo\\aa4ac0e44c90579f21a53f5baffb504b.jpg', '40');
INSERT INTO `wt_img` VALUES ('248', 'image\\photo\\a2942862079a203230853095a3bdf8e9.jpg', '40');
INSERT INTO `wt_img` VALUES ('249', 'image\\photo\\17327f5f87ea9d59e4371c17c4a20364.jpg', '40');
INSERT INTO `wt_img` VALUES ('250', 'image\\photo\\7785e026764c069c3f119c861c39449f.jpg', '40');
INSERT INTO `wt_img` VALUES ('251', 'image\\photo\\dd7d10840bf3b1bf86e035ba1140e97e.jpg', '40');
INSERT INTO `wt_img` VALUES ('252', 'image\\photo\\37bdf8a0b8b86c38ecb5617c60c42b7c.jpg', '40');
INSERT INTO `wt_img` VALUES ('253', 'image\\photo\\6cfb779ecde88d4b2cb1e0db53f3dce5.jpg', '40');
INSERT INTO `wt_img` VALUES ('254', 'image\\photo\\35a7cf30f7561dda57b76254bcff8531.jpg', '40');
INSERT INTO `wt_img` VALUES ('255', 'image\\photo\\ffe862b00429b9b484a9d1d4d480c0fd.jpg', '40');
INSERT INTO `wt_img` VALUES ('256', 'image\\photo\\91c2578ecb632eba4b1d0d42a2f386b8.jpg', '40');
INSERT INTO `wt_img` VALUES ('257', 'image\\photo\\663cc205a0591f11dae62acd8670465f.jpg', '40');
INSERT INTO `wt_img` VALUES ('258', 'image\\photo\\804bd4bfee987b67ddef3cac1300aa45.jpg', '40');
INSERT INTO `wt_img` VALUES ('259', 'image\\photo\\4b6502fee50dc2065a5408f0cd8b89f2.jpg', '40');
INSERT INTO `wt_img` VALUES ('260', 'image\\photo\\39cf665e7178abbe5f78cc1b46b21193.jpg', '40');
INSERT INTO `wt_img` VALUES ('261', 'image\\photo\\a07ed0e140c480588f10c2744f5727f8.jpg', '40');
INSERT INTO `wt_img` VALUES ('262', 'image\\photo\\0a7650a3b5b3a70f0af60a7010f7ea46.jpg', '40');
INSERT INTO `wt_img` VALUES ('263', 'image\\photo\\bfa6b7db4bbfced640d294730ebed35d.jpg', '40');
INSERT INTO `wt_img` VALUES ('264', 'image\\photo\\bb5bb5eeb467d7170b8f8f1e2acfdbcf.jpg', '40');
INSERT INTO `wt_img` VALUES ('265', 'image\\photo\\75e1bec46572ed7b03bcf38a9112c160.jpg', '40');
INSERT INTO `wt_img` VALUES ('266', 'image\\photo\\b2196c991a165b3efd04793f00c30bd0.jpg', '41');
INSERT INTO `wt_img` VALUES ('267', 'image\\photo\\37bdf8a0b8b86c38ecb5617c60c42b7c.jpg', '41');
INSERT INTO `wt_img` VALUES ('268', 'image\\photo\\48f5870ca679648c656067723d4106ab.jpg', '41');
INSERT INTO `wt_img` VALUES ('269', 'image\\photo\\a07ed0e140c480588f10c2744f5727f8.jpg', '41');
INSERT INTO `wt_img` VALUES ('270', 'image\\photo\\db939b41bc74ed032d3ef7bae66436cf.jpg', '41');
INSERT INTO `wt_img` VALUES ('271', 'image\\photo\\cf07efdb53da3e6cd184267bc26f1663.jpg', '41');
INSERT INTO `wt_img` VALUES ('272', 'image\\photo\\2a6cfae938d95cefb65334ffeff6eaf5.jpg', '41');
INSERT INTO `wt_img` VALUES ('273', 'image\\photo\\18b6c2f4095647037f9ccc5cdabed42a.jpg', '41');
INSERT INTO `wt_img` VALUES ('274', 'image\\photo\\bc4ba4a75ec92e3b8384c93947d71070.jpg', '41');
INSERT INTO `wt_img` VALUES ('275', 'image\\photo\\3f9f57eefd986f966d8424d62cb38ecb.jpg', '41');
INSERT INTO `wt_img` VALUES ('276', 'image\\photo\\c6718133d4d161b90999efff95623528.jpg', '41');
INSERT INTO `wt_img` VALUES ('277', 'image\\photo\\9fea37469576102f8025090ddd4ccfd0.jpg', '41');
INSERT INTO `wt_img` VALUES ('278', 'image\\photo\\6cfb779ecde88d4b2cb1e0db53f3dce5.jpg', '41');
INSERT INTO `wt_img` VALUES ('279', 'image\\photo\\030791344f6b72dfabd0117999b35f7e.jpg', '41');
INSERT INTO `wt_img` VALUES ('280', 'image\\photo\\ec13fe9fe9404ceec0022db1bdb766af.jpg', '41');
INSERT INTO `wt_img` VALUES ('281', 'image\\photo\\fe893da819cfdaf8f2cbdbf20ba25361.jpg', '41');
INSERT INTO `wt_img` VALUES ('282', 'image\\photo\\7785e026764c069c3f119c861c39449f.jpg', '41');
INSERT INTO `wt_img` VALUES ('283', 'image\\photo\\39cf665e7178abbe5f78cc1b46b21193.jpg', '41');
INSERT INTO `wt_img` VALUES ('284', 'image\\photo\\039b727e572caf06a85ea86a2d4517d7.jpg', '41');
INSERT INTO `wt_img` VALUES ('285', 'image\\photo\\782b8e218da3338e1727630a619bd7e8.jpg', '41');
INSERT INTO `wt_img` VALUES ('286', 'image\\photo\\8628dfe419aee1c1917607da1e4f821b.jpg', '41');
INSERT INTO `wt_img` VALUES ('287', 'image\\photo\\e2d0cc3da9835e9733be9ba5961f27d0.jpg', '41');
INSERT INTO `wt_img` VALUES ('288', 'image\\photo\\2e06faa501d65bced973f57b4c5b9132.jpg', '41');
INSERT INTO `wt_img` VALUES ('289', 'image\\photo\\1068730c750462dde1beb1ad60a51963.jpg', '41');
INSERT INTO `wt_img` VALUES ('290', 'image\\photo\\4b6502fee50dc2065a5408f0cd8b89f2.jpg', '41');
INSERT INTO `wt_img` VALUES ('291', 'image\\photo\\91c2578ecb632eba4b1d0d42a2f386b8.jpg', '41');
INSERT INTO `wt_img` VALUES ('292', 'image\\photo\\28fcf8706258be0a26c920f5e9b2c313.jpg', '41');
INSERT INTO `wt_img` VALUES ('293', 'image\\photo\\ffe862b00429b9b484a9d1d4d480c0fd.jpg', '41');
INSERT INTO `wt_img` VALUES ('294', 'image\\photo\\804bd4bfee987b67ddef3cac1300aa45.jpg', '41');
INSERT INTO `wt_img` VALUES ('295', 'image\\photo\\e9f3bc8aeb6faa3619ad6024bdb4ae5d.jpg', '41');
INSERT INTO `wt_img` VALUES ('296', 'image\\photo\\e4cb94158d44ba00ac34961b24c48cf3.jpg', '41');
INSERT INTO `wt_img` VALUES ('297', 'image\\photo\\c2c97210dde28f4923ed498b7be79fa7.jpg', '41');
INSERT INTO `wt_img` VALUES ('298', 'image\\photo\\611fee51f8d53ee6c588e5a70700df7e.jpg', '41');
INSERT INTO `wt_img` VALUES ('299', 'image\\photo\\bfa6b7db4bbfced640d294730ebed35d.jpg', '41');
INSERT INTO `wt_img` VALUES ('300', 'image\\photo\\ed62586da25ec62b355f0434e209f20d.jpg', '41');
INSERT INTO `wt_img` VALUES ('301', 'image\\photo\\663cc205a0591f11dae62acd8670465f.jpg', '41');
INSERT INTO `wt_img` VALUES ('302', 'image\\photo\\a2942862079a203230853095a3bdf8e9.jpg', '41');
INSERT INTO `wt_img` VALUES ('303', 'image\\photo\\127700f38b37fba0fd64be8db92ff5cb.jpg', '41');
INSERT INTO `wt_img` VALUES ('304', 'image\\photo\\0a7650a3b5b3a70f0af60a7010f7ea46.jpg', '41');
INSERT INTO `wt_img` VALUES ('305', 'image\\photo\\45f9ee9cae6c2791b9a60661970ed256.jpg', '41');
INSERT INTO `wt_img` VALUES ('306', 'image\\photo\\7af25f10be471d1b964cec1291206ae3.jpg', '41');
INSERT INTO `wt_img` VALUES ('307', 'image\\photo\\ee0c25ab9b0324af2e19ce9dde935fa4.jpg', '41');
INSERT INTO `wt_img` VALUES ('308', 'image\\photo\\17327f5f87ea9d59e4371c17c4a20364.jpg', '41');
INSERT INTO `wt_img` VALUES ('309', 'image\\photo\\1cc7cc967a8fdc4be1e050cb44b74b04.jpg', '41');
INSERT INTO `wt_img` VALUES ('310', 'image\\photo\\3a5a19e7e5abb6df1960624066fa004d.jpg', '41');
INSERT INTO `wt_img` VALUES ('311', 'image\\photo\\790ecafdab9d1ef83186414eca06afe5.jpg', '41');
INSERT INTO `wt_img` VALUES ('312', 'image\\photo\\97f485c5181b2ef9f4f08daeb63879df.jpg', '41');
INSERT INTO `wt_img` VALUES ('313', 'image\\photo\\e1c2509db08bebe247e758baece0a7d3.jpg', '41');
INSERT INTO `wt_img` VALUES ('314', 'image\\photo\\853becbaa878fd6b099dd324f3d02326.jpg', '41');
INSERT INTO `wt_img` VALUES ('315', 'image\\photo\\75e1bec46572ed7b03bcf38a9112c160.jpg', '41');
INSERT INTO `wt_img` VALUES ('316', 'image\\photo\\aa4ac0e44c90579f21a53f5baffb504b.jpg', '41');
INSERT INTO `wt_img` VALUES ('317', 'image\\photo\\35a7cf30f7561dda57b76254bcff8531.jpg', '41');
INSERT INTO `wt_img` VALUES ('318', 'image\\photo\\dd7d10840bf3b1bf86e035ba1140e97e.jpg', '41');
INSERT INTO `wt_img` VALUES ('319', 'image\\photo\\90bc8d14767e169062e69b13617b8362.jpg', '41');
INSERT INTO `wt_img` VALUES ('320', 'image\\photo\\bb5bb5eeb467d7170b8f8f1e2acfdbcf.jpg', '41');
INSERT INTO `wt_img` VALUES ('321', 'image\\photo\\1b5aeb1fef0b5cc6a13849ec66ee328a.jpg', '42');
INSERT INTO `wt_img` VALUES ('322', 'image\\photo\\29b0ee75dea9501bed488723d36898ae.jpg', '42');
INSERT INTO `wt_img` VALUES ('323', 'image\\photo\\2be30cb00a4db4d7e4e9ec975ee7906c.jpg', '42');
INSERT INTO `wt_img` VALUES ('324', 'image\\photo\\5b11e2031005e234d28af709b137a96f.jpg', '42');
INSERT INTO `wt_img` VALUES ('325', 'image\\photo\\5b11e2031005e234d28af709b137a96f.jpg', '43');
INSERT INTO `wt_img` VALUES ('326', 'image\\photo\\27f86c968f65ab7b27fa776c3cb1f3eb.jpg', '43');
INSERT INTO `wt_img` VALUES ('327', 'image\\photo\\1b5aeb1fef0b5cc6a13849ec66ee328a.jpg', '43');
INSERT INTO `wt_img` VALUES ('328', 'image\\photo\\dc3121479a7552b52c1c3533170179fb.jpg', '43');
INSERT INTO `wt_img` VALUES ('329', 'image\\photo\\95998eef705b60d39bb38dbb87979a50.jpg', '43');
INSERT INTO `wt_img` VALUES ('330', 'image\\photo\\4e0c55d46d6de94bb82d76a8bec65b16.jpg', '43');
INSERT INTO `wt_img` VALUES ('331', 'image\\photo\\29b0ee75dea9501bed488723d36898ae.jpg', '43');
INSERT INTO `wt_img` VALUES ('332', 'image\\photo\\b835afa561384a0aa896c643fdcdda97.jpg', '43');
INSERT INTO `wt_img` VALUES ('333', 'image\\photo\\03ed91e87a43ec8e7b4b6e4174165ab7.jpg', '43');
INSERT INTO `wt_img` VALUES ('334', 'image\\photo\\c4fca1f53906488ab0296ca38e5ecda8.jpg', '43');
INSERT INTO `wt_img` VALUES ('335', 'image\\photo\\e6d27e5fe0f08ed2652acaff83b3d2c7.jpg', '43');
INSERT INTO `wt_img` VALUES ('336', 'image\\photo\\2be30cb00a4db4d7e4e9ec975ee7906c.jpg', '43');
INSERT INTO `wt_img` VALUES ('337', 'image\\photo\\24ab6ecfef964477444039d5d6b951b2.jpg', '43');
INSERT INTO `wt_img` VALUES ('338', 'image\\photo\\c7986e4be27feda308bb28806ce69e15.jpg', '44');
INSERT INTO `wt_img` VALUES ('339', 'image\\photo\\dc3121479a7552b52c1c3533170179fb.jpg', '44');
INSERT INTO `wt_img` VALUES ('340', 'image\\photo\\3c944f779feb740d9529640ceac3f890.jpg', '44');
INSERT INTO `wt_img` VALUES ('341', 'image\\photo\\24ab6ecfef964477444039d5d6b951b2.jpg', '44');
INSERT INTO `wt_img` VALUES ('342', 'image\\photo\\95998eef705b60d39bb38dbb87979a50.jpg', '44');
INSERT INTO `wt_img` VALUES ('343', 'image\\photo\\03ed91e87a43ec8e7b4b6e4174165ab7.jpg', '44');
INSERT INTO `wt_img` VALUES ('344', 'image\\photo\\e6d27e5fe0f08ed2652acaff83b3d2c7.jpg', '44');
INSERT INTO `wt_img` VALUES ('345', 'image\\photo\\dd17b020af700870e1e98ad913d5ddc1.jpg', '44');
INSERT INTO `wt_img` VALUES ('346', 'image\\photo\\4e0c55d46d6de94bb82d76a8bec65b16.jpg', '44');
INSERT INTO `wt_img` VALUES ('347', 'image\\photo\\33e7a59669ba8768f3c8ee7a962519d9.jpg', '44');
INSERT INTO `wt_img` VALUES ('348', 'image\\photo\\c4fca1f53906488ab0296ca38e5ecda8.jpg', '44');
INSERT INTO `wt_img` VALUES ('349', 'image\\photo\\b835afa561384a0aa896c643fdcdda97.jpg', '44');
INSERT INTO `wt_img` VALUES ('350', 'image\\photo\\2be30cb00a4db4d7e4e9ec975ee7906c.jpg', '44');
INSERT INTO `wt_img` VALUES ('351', 'image\\photo\\4184996f97ad4060d993b94b2a1d7a6c.jpg', '44');
INSERT INTO `wt_img` VALUES ('352', 'image\\photo\\e7d3a3bf623d597e6fa44a2b3e973873.jpg', '44');
INSERT INTO `wt_img` VALUES ('353', 'image\\photo\\6ee7960b97f2f248d2c4c96ea51a988e.jpg', '44');
INSERT INTO `wt_img` VALUES ('354', 'image\\photo\\27f86c968f65ab7b27fa776c3cb1f3eb.jpg', '44');
INSERT INTO `wt_img` VALUES ('355', 'image\\photo\\29b0ee75dea9501bed488723d36898ae.jpg', '44');
INSERT INTO `wt_img` VALUES ('356', 'image\\photo\\8f2a2ebfcfd1e170541e3c27ee119835.jpg', '44');
INSERT INTO `wt_img` VALUES ('357', 'image\\photo\\67d0654788472d0c9da9af545881e53a.jpg', '44');
INSERT INTO `wt_img` VALUES ('358', 'image\\photo\\5b11e2031005e234d28af709b137a96f.jpg', '44');
INSERT INTO `wt_img` VALUES ('359', 'image\\photo\\1b5aeb1fef0b5cc6a13849ec66ee328a.jpg', '44');
INSERT INTO `wt_img` VALUES ('360', 'image\\photo\\dc3121479a7552b52c1c3533170179fb.jpg', '45');
INSERT INTO `wt_img` VALUES ('361', 'image\\photo\\dd17b020af700870e1e98ad913d5ddc1.jpg', '45');
INSERT INTO `wt_img` VALUES ('362', 'image\\photo\\6fd601492a1977357234e9e415ceab6e.jpg', '45');
INSERT INTO `wt_img` VALUES ('363', 'image\\photo\\9fcb28b15e437e6412b39e23491d8345.jpg', '45');
INSERT INTO `wt_img` VALUES ('364', 'image\\photo\\4e0c55d46d6de94bb82d76a8bec65b16.jpg', '45');
INSERT INTO `wt_img` VALUES ('365', 'image\\photo\\2be30cb00a4db4d7e4e9ec975ee7906c.jpg', '45');
INSERT INTO `wt_img` VALUES ('366', 'image\\photo\\8f2a2ebfcfd1e170541e3c27ee119835.jpg', '45');
INSERT INTO `wt_img` VALUES ('367', 'image\\photo\\6ee7960b97f2f248d2c4c96ea51a988e.jpg', '45');
INSERT INTO `wt_img` VALUES ('368', 'image\\photo\\27f86c968f65ab7b27fa776c3cb1f3eb.jpg', '45');
INSERT INTO `wt_img` VALUES ('369', 'image\\photo\\95998eef705b60d39bb38dbb87979a50.jpg', '45');
INSERT INTO `wt_img` VALUES ('370', 'image\\photo\\33e7a59669ba8768f3c8ee7a962519d9.jpg', '45');
INSERT INTO `wt_img` VALUES ('371', 'image\\photo\\c4fca1f53906488ab0296ca38e5ecda8.jpg', '45');
INSERT INTO `wt_img` VALUES ('372', 'image\\photo\\29b0ee75dea9501bed488723d36898ae.jpg', '45');
INSERT INTO `wt_img` VALUES ('373', 'image\\photo\\3c944f779feb740d9529640ceac3f890.jpg', '45');
INSERT INTO `wt_img` VALUES ('374', 'image\\photo\\b835afa561384a0aa896c643fdcdda97.jpg', '45');
INSERT INTO `wt_img` VALUES ('375', 'image\\photo\\8ab05e595b41154d17cd5d2045a9a4cd.jpg', '45');
INSERT INTO `wt_img` VALUES ('376', 'image\\photo\\03ed91e87a43ec8e7b4b6e4174165ab7.jpg', '45');
INSERT INTO `wt_img` VALUES ('377', 'image\\photo\\c7986e4be27feda308bb28806ce69e15.jpg', '45');
INSERT INTO `wt_img` VALUES ('378', 'image\\photo\\8bbb54538d28cdeffc38daf8f40fef46.jpg', '45');
INSERT INTO `wt_img` VALUES ('379', 'image\\photo\\d28653002d20ec5636667c67af2c54e9.jpg', '45');
INSERT INTO `wt_img` VALUES ('380', 'image\\photo\\1b5aeb1fef0b5cc6a13849ec66ee328a.jpg', '45');
INSERT INTO `wt_img` VALUES ('381', 'image\\photo\\3a708646176c3917e652afdddd4f52c5.jpg', '45');
INSERT INTO `wt_img` VALUES ('382', 'image\\photo\\64397ceedbdac70f7716d2bbec0d00a1.jpg', '45');
INSERT INTO `wt_img` VALUES ('383', 'image\\photo\\24ab6ecfef964477444039d5d6b951b2.jpg', '45');
INSERT INTO `wt_img` VALUES ('384', 'image\\photo\\4184996f97ad4060d993b94b2a1d7a6c.jpg', '45');
INSERT INTO `wt_img` VALUES ('385', 'image\\photo\\5b11e2031005e234d28af709b137a96f.jpg', '45');
INSERT INTO `wt_img` VALUES ('386', 'image\\photo\\c56cb545f3e2b93b1b82cd186f209b5a.jpg', '45');
INSERT INTO `wt_img` VALUES ('387', 'image\\photo\\e7d3a3bf623d597e6fa44a2b3e973873.jpg', '45');
INSERT INTO `wt_img` VALUES ('388', 'image\\photo\\67d0654788472d0c9da9af545881e53a.jpg', '45');
INSERT INTO `wt_img` VALUES ('389', 'image\\photo\\f090b2a5b105526d4633b48dfefa8d0c.jpg', '45');
INSERT INTO `wt_img` VALUES ('390', 'image\\photo\\e6d27e5fe0f08ed2652acaff83b3d2c7.jpg', '45');
INSERT INTO `wt_img` VALUES ('391', 'image\\photo\\a5d68896e6e38b28f29ba8197a466e97.jpg', '46');
INSERT INTO `wt_img` VALUES ('392', 'image\\photo\\4e0c55d46d6de94bb82d76a8bec65b16.jpg', '46');
INSERT INTO `wt_img` VALUES ('393', 'image\\photo\\6ee7960b97f2f248d2c4c96ea51a988e.jpg', '46');
INSERT INTO `wt_img` VALUES ('394', 'image\\photo\\b835afa561384a0aa896c643fdcdda97.jpg', '46');
INSERT INTO `wt_img` VALUES ('395', 'image\\photo\\b6432bc2136cb31e8459da9512348c02.jpg', '46');
INSERT INTO `wt_img` VALUES ('396', 'image\\photo\\3a708646176c3917e652afdddd4f52c5.jpg', '46');
INSERT INTO `wt_img` VALUES ('397', 'image\\photo\\61d7d799a8d4b7248eff22bf45fdc1e8.jpg', '46');
INSERT INTO `wt_img` VALUES ('398', 'image\\photo\\c56cb545f3e2b93b1b82cd186f209b5a.jpg', '46');
INSERT INTO `wt_img` VALUES ('399', 'image\\photo\\e7d3a3bf623d597e6fa44a2b3e973873.jpg', '46');
INSERT INTO `wt_img` VALUES ('400', 'image\\photo\\64397ceedbdac70f7716d2bbec0d00a1.jpg', '46');
INSERT INTO `wt_img` VALUES ('401', 'image\\photo\\d28653002d20ec5636667c67af2c54e9.jpg', '46');
INSERT INTO `wt_img` VALUES ('402', 'image\\photo\\dd17b020af700870e1e98ad913d5ddc1.jpg', '46');
INSERT INTO `wt_img` VALUES ('403', 'image\\photo\\c4fca1f53906488ab0296ca38e5ecda8.jpg', '46');
INSERT INTO `wt_img` VALUES ('404', 'image\\photo\\9fcb28b15e437e6412b39e23491d8345.jpg', '46');
INSERT INTO `wt_img` VALUES ('405', 'image\\photo\\4184996f97ad4060d993b94b2a1d7a6c.jpg', '46');
INSERT INTO `wt_img` VALUES ('406', 'image\\photo\\5b11e2031005e234d28af709b137a96f.jpg', '46');
INSERT INTO `wt_img` VALUES ('407', 'image\\photo\\24ab6ecfef964477444039d5d6b951b2.jpg', '46');
INSERT INTO `wt_img` VALUES ('408', 'image\\photo\\06bc72e20972eae5e4ed8c92940ac8ee.jpg', '46');
INSERT INTO `wt_img` VALUES ('409', 'image\\photo\\29b0ee75dea9501bed488723d36898ae.jpg', '46');
INSERT INTO `wt_img` VALUES ('410', 'image\\photo\\33e7a59669ba8768f3c8ee7a962519d9.jpg', '46');
INSERT INTO `wt_img` VALUES ('411', 'image\\photo\\8ab05e595b41154d17cd5d2045a9a4cd.jpg', '46');
INSERT INTO `wt_img` VALUES ('412', 'image\\photo\\fb7efe8d6763f705d43c7a8800dd7de6.jpg', '46');
INSERT INTO `wt_img` VALUES ('413', 'image\\photo\\2be30cb00a4db4d7e4e9ec975ee7906c.jpg', '46');
INSERT INTO `wt_img` VALUES ('414', 'image\\photo\\6fd601492a1977357234e9e415ceab6e.jpg', '46');
INSERT INTO `wt_img` VALUES ('415', 'image\\photo\\257232bc2bfac737ce785b1206edd2f3.jpg', '46');
INSERT INTO `wt_img` VALUES ('416', 'image\\photo\\a7e1b59f692b3773755e210f3d9b8778.jpg', '46');
INSERT INTO `wt_img` VALUES ('417', 'image\\photo\\27f86c968f65ab7b27fa776c3cb1f3eb.jpg', '46');
INSERT INTO `wt_img` VALUES ('418', 'image\\photo\\03ed91e87a43ec8e7b4b6e4174165ab7.jpg', '46');
INSERT INTO `wt_img` VALUES ('419', 'image\\photo\\c7986e4be27feda308bb28806ce69e15.jpg', '46');
INSERT INTO `wt_img` VALUES ('420', 'image\\photo\\dc3121479a7552b52c1c3533170179fb.jpg', '46');
INSERT INTO `wt_img` VALUES ('421', 'image\\photo\\95998eef705b60d39bb38dbb87979a50.jpg', '46');
INSERT INTO `wt_img` VALUES ('422', 'image\\photo\\8bbb54538d28cdeffc38daf8f40fef46.jpg', '46');
INSERT INTO `wt_img` VALUES ('423', 'image\\photo\\ef2c902330fa811a98cc1c82d2b3f0ee.jpg', '46');
INSERT INTO `wt_img` VALUES ('424', 'image\\photo\\67d0654788472d0c9da9af545881e53a.jpg', '46');
INSERT INTO `wt_img` VALUES ('425', 'image\\photo\\0a389316bc182229be90acbe4c6054d3.jpg', '46');
INSERT INTO `wt_img` VALUES ('426', 'image\\photo\\1b5aeb1fef0b5cc6a13849ec66ee328a.jpg', '46');
INSERT INTO `wt_img` VALUES ('427', 'image\\photo\\f090b2a5b105526d4633b48dfefa8d0c.jpg', '46');
INSERT INTO `wt_img` VALUES ('428', 'image\\photo\\3c944f779feb740d9529640ceac3f890.jpg', '46');
INSERT INTO `wt_img` VALUES ('429', 'image\\photo\\e6d27e5fe0f08ed2652acaff83b3d2c7.jpg', '46');
INSERT INTO `wt_img` VALUES ('430', 'image\\photo\\8f2a2ebfcfd1e170541e3c27ee119835.jpg', '46');
INSERT INTO `wt_img` VALUES ('431', 'image\\photo\\3c944f779feb740d9529640ceac3f890.jpg', '47');
INSERT INTO `wt_img` VALUES ('432', 'image\\photo\\e7d3a3bf623d597e6fa44a2b3e973873.jpg', '47');
INSERT INTO `wt_img` VALUES ('433', 'image\\photo\\d28653002d20ec5636667c67af2c54e9.jpg', '47');
INSERT INTO `wt_img` VALUES ('434', 'image\\photo\\2be30cb00a4db4d7e4e9ec975ee7906c.jpg', '47');
INSERT INTO `wt_img` VALUES ('435', 'image\\photo\\257232bc2bfac737ce785b1206edd2f3.jpg', '47');
INSERT INTO `wt_img` VALUES ('436', 'image\\photo\\4e0c55d46d6de94bb82d76a8bec65b16.jpg', '47');
INSERT INTO `wt_img` VALUES ('437', 'image\\photo\\b835afa561384a0aa896c643fdcdda97.jpg', '47');
INSERT INTO `wt_img` VALUES ('438', 'image\\photo\\03ed91e87a43ec8e7b4b6e4174165ab7.jpg', '47');
INSERT INTO `wt_img` VALUES ('439', 'image\\photo\\f090b2a5b105526d4633b48dfefa8d0c.jpg', '47');
INSERT INTO `wt_img` VALUES ('440', 'image\\photo\\dd17b020af700870e1e98ad913d5ddc1.jpg', '47');
INSERT INTO `wt_img` VALUES ('441', 'image\\photo\\8ab05e595b41154d17cd5d2045a9a4cd.jpg', '47');
INSERT INTO `wt_img` VALUES ('442', 'image\\photo\\06bc72e20972eae5e4ed8c92940ac8ee.jpg', '47');
INSERT INTO `wt_img` VALUES ('443', 'image\\photo\\6ee7960b97f2f248d2c4c96ea51a988e.jpg', '47');
INSERT INTO `wt_img` VALUES ('444', 'image\\photo\\c7986e4be27feda308bb28806ce69e15.jpg', '47');
INSERT INTO `wt_img` VALUES ('445', 'image\\photo\\61d7d799a8d4b7248eff22bf45fdc1e8.jpg', '47');
INSERT INTO `wt_img` VALUES ('446', 'image\\photo\\d85c415b8f79d39ce54e34da0a859589.jpg', '47');
INSERT INTO `wt_img` VALUES ('447', 'image\\photo\\a7e1b59f692b3773755e210f3d9b8778.jpg', '47');
INSERT INTO `wt_img` VALUES ('448', 'image\\photo\\feccae3dea3641531430adfd21e31c96.jpg', '47');
INSERT INTO `wt_img` VALUES ('449', 'image\\photo\\ef2c902330fa811a98cc1c82d2b3f0ee.jpg', '47');
INSERT INTO `wt_img` VALUES ('450', 'image\\photo\\64397ceedbdac70f7716d2bbec0d00a1.jpg', '47');
INSERT INTO `wt_img` VALUES ('451', 'image\\photo\\a426d71fa5775009fcea789b4c106754.jpg', '47');
INSERT INTO `wt_img` VALUES ('452', 'image\\photo\\24ab6ecfef964477444039d5d6b951b2.jpg', '47');
INSERT INTO `wt_img` VALUES ('453', 'image\\photo\\33e7a59669ba8768f3c8ee7a962519d9.jpg', '47');
INSERT INTO `wt_img` VALUES ('454', 'image\\photo\\b6432bc2136cb31e8459da9512348c02.jpg', '47');
INSERT INTO `wt_img` VALUES ('455', 'image\\photo\\e6d27e5fe0f08ed2652acaff83b3d2c7.jpg', '47');
INSERT INTO `wt_img` VALUES ('456', 'image\\photo\\fb7efe8d6763f705d43c7a8800dd7de6.jpg', '47');
INSERT INTO `wt_img` VALUES ('457', 'image\\photo\\27f86c968f65ab7b27fa776c3cb1f3eb.jpg', '47');
INSERT INTO `wt_img` VALUES ('458', 'image\\photo\\1b5aeb1fef0b5cc6a13849ec66ee328a.jpg', '47');
INSERT INTO `wt_img` VALUES ('459', 'image\\photo\\a5d68896e6e38b28f29ba8197a466e97.jpg', '47');
INSERT INTO `wt_img` VALUES ('460', 'image\\photo\\67d0654788472d0c9da9af545881e53a.jpg', '47');
INSERT INTO `wt_img` VALUES ('461', 'image\\photo\\c4fca1f53906488ab0296ca38e5ecda8.jpg', '47');
INSERT INTO `wt_img` VALUES ('462', 'image\\photo\\9fcb28b15e437e6412b39e23491d8345.jpg', '47');
INSERT INTO `wt_img` VALUES ('463', 'image\\photo\\6c4328f540d008a1ab4c89cfa9942c26.jpg', '47');
INSERT INTO `wt_img` VALUES ('464', 'image\\photo\\a258b1929816ffadee778ef58fb1f17d.jpg', '47');
INSERT INTO `wt_img` VALUES ('465', 'image\\photo\\8f2a2ebfcfd1e170541e3c27ee119835.jpg', '47');
INSERT INTO `wt_img` VALUES ('466', 'image\\photo\\ae4eac983bc14a4aa6bb0b2fdde963ae.jpg', '47');
INSERT INTO `wt_img` VALUES ('467', 'image\\photo\\c56cb545f3e2b93b1b82cd186f209b5a.jpg', '47');
INSERT INTO `wt_img` VALUES ('468', 'image\\photo\\b63cefc68901f31e5862022f3c2ffa15.jpg', '47');
INSERT INTO `wt_img` VALUES ('469', 'image\\photo\\dc3121479a7552b52c1c3533170179fb.jpg', '47');
INSERT INTO `wt_img` VALUES ('470', 'image\\photo\\0a389316bc182229be90acbe4c6054d3.jpg', '47');
INSERT INTO `wt_img` VALUES ('471', 'image\\photo\\4184996f97ad4060d993b94b2a1d7a6c.jpg', '47');
INSERT INTO `wt_img` VALUES ('472', 'image\\photo\\8bbb54538d28cdeffc38daf8f40fef46.jpg', '47');
INSERT INTO `wt_img` VALUES ('473', 'image\\photo\\29b0ee75dea9501bed488723d36898ae.jpg', '47');
INSERT INTO `wt_img` VALUES ('474', 'image\\photo\\95998eef705b60d39bb38dbb87979a50.jpg', '47');
INSERT INTO `wt_img` VALUES ('475', 'image\\photo\\5b11e2031005e234d28af709b137a96f.jpg', '47');
INSERT INTO `wt_img` VALUES ('476', 'image\\photo\\6fd601492a1977357234e9e415ceab6e.jpg', '47');
INSERT INTO `wt_img` VALUES ('477', 'image\\photo\\3a708646176c3917e652afdddd4f52c5.jpg', '47');
INSERT INTO `wt_img` VALUES ('1', 'image\\photo\\52115c395869022c5b322392a7d5e342.jpg', '28');
INSERT INTO `wt_img` VALUES ('478', 'image\\photo\\0569fd47f3d717851e406018d58a9a11.jpg', '48');
INSERT INTO `wt_img` VALUES ('2', 'image\\photo\\8bd6e0f227d1acdfa38f0dfa65e5ecd0.jpg', '48');
INSERT INTO `wt_img` VALUES ('479', 'image\\photo\\d459954041585b7bb44fee5156fd02eb.jpg', '49');
INSERT INTO `wt_img` VALUES ('480', 'image\\photo\\24e41632f6a0f91ac2e7d6e3d64bbcb1.jpg', '50');
INSERT INTO `wt_img` VALUES ('481', 'image\\photo\\d459954041585b7bb44fee5156fd02eb.jpg', '50');
INSERT INTO `wt_img` VALUES ('482', 'image\\photo\\24e41632f6a0f91ac2e7d6e3d64bbcb1.jpg', '51');
INSERT INTO `wt_img` VALUES ('483', 'image\\photo\\52fe1c2afcc2952f9066bb7bc59ceb26.jpg', '51');
INSERT INTO `wt_img` VALUES ('484', 'image\\photo\\7d1aacfe8da178572a80f43c984a3ca5.jpg', '51');
INSERT INTO `wt_img` VALUES ('485', 'image\\photo\\d459954041585b7bb44fee5156fd02eb.jpg', '51');
INSERT INTO `wt_img` VALUES ('486', 'image\\photo\\52fe1c2afcc2952f9066bb7bc59ceb26.jpg', '52');
INSERT INTO `wt_img` VALUES ('487', 'image\\photo\\7d1aacfe8da178572a80f43c984a3ca5.jpg', '52');
INSERT INTO `wt_img` VALUES ('488', 'image\\photo\\d459954041585b7bb44fee5156fd02eb.jpg', '52');
INSERT INTO `wt_img` VALUES ('489', 'image\\photo\\24e41632f6a0f91ac2e7d6e3d64bbcb1.jpg', '52');
INSERT INTO `wt_img` VALUES ('490', 'image\\photo\\58177f04348e673ab3a4976e15ea5e80.jpg', '52');
INSERT INTO `wt_img` VALUES ('491', 'image\\photo\\33aeffa94ed637fd0714f2ac402f0c2b.jpg', '52');
INSERT INTO `wt_img` VALUES ('492', 'image\\photo\\1908d688454f99a2c79f7211abfea624.jpg', '53');
INSERT INTO `wt_img` VALUES ('493', 'image\\photo\\7d1aacfe8da178572a80f43c984a3ca5.jpg', '53');
INSERT INTO `wt_img` VALUES ('494', 'image\\photo\\d459954041585b7bb44fee5156fd02eb.jpg', '53');
INSERT INTO `wt_img` VALUES ('495', 'image\\photo\\33aeffa94ed637fd0714f2ac402f0c2b.jpg', '53');
INSERT INTO `wt_img` VALUES ('496', 'image\\photo\\52fe1c2afcc2952f9066bb7bc59ceb26.jpg', '53');
INSERT INTO `wt_img` VALUES ('497', 'image\\photo\\58177f04348e673ab3a4976e15ea5e80.jpg', '53');
INSERT INTO `wt_img` VALUES ('498', 'image\\photo\\24e41632f6a0f91ac2e7d6e3d64bbcb1.jpg', '53');
INSERT INTO `wt_img` VALUES ('499', 'image\\photo\\8b82eb107ee5cc798462b3fbb189956e.jpg', '53');
INSERT INTO `wt_img` VALUES ('500', 'image\\photo\\58177f04348e673ab3a4976e15ea5e80.jpg', '54');
INSERT INTO `wt_img` VALUES ('501', 'image\\photo\\24e41632f6a0f91ac2e7d6e3d64bbcb1.jpg', '54');
INSERT INTO `wt_img` VALUES ('502', 'image\\photo\\f37355c95c8ed5c77425c543365660c8.jpg', '54');
INSERT INTO `wt_img` VALUES ('503', 'image\\photo\\7d1aacfe8da178572a80f43c984a3ca5.jpg', '54');
INSERT INTO `wt_img` VALUES ('504', 'image\\photo\\1908d688454f99a2c79f7211abfea624.jpg', '54');
INSERT INTO `wt_img` VALUES ('505', 'image\\photo\\ce203c6fb37c2512445da47102954a16.jpg', '54');
INSERT INTO `wt_img` VALUES ('506', 'image\\photo\\8b82eb107ee5cc798462b3fbb189956e.jpg', '54');
INSERT INTO `wt_img` VALUES ('507', 'image\\photo\\d459954041585b7bb44fee5156fd02eb.jpg', '54');
INSERT INTO `wt_img` VALUES ('508', 'image\\photo\\52fe1c2afcc2952f9066bb7bc59ceb26.jpg', '54');
INSERT INTO `wt_img` VALUES ('509', 'image\\photo\\6842f66c49ce64a604641d143a808ad2.jpg', '54');
INSERT INTO `wt_img` VALUES ('510', 'image\\photo\\33aeffa94ed637fd0714f2ac402f0c2b.jpg', '54');
INSERT INTO `wt_img` VALUES ('511', 'image\\photo\\d459954041585b7bb44fee5156fd02eb.jpg', '55');
INSERT INTO `wt_img` VALUES ('512', 'image\\photo\\d8e4fe31c134b3dc850fd80555add01c.jpg', '55');
INSERT INTO `wt_img` VALUES ('513', 'image\\photo\\68664fc05ee473da375d09734965707c.jpg', '55');
INSERT INTO `wt_img` VALUES ('514', 'image\\photo\\7d1aacfe8da178572a80f43c984a3ca5.jpg', '55');
INSERT INTO `wt_img` VALUES ('515', 'image\\photo\\f37355c95c8ed5c77425c543365660c8.jpg', '55');
INSERT INTO `wt_img` VALUES ('516', 'image\\photo\\33aeffa94ed637fd0714f2ac402f0c2b.jpg', '55');
INSERT INTO `wt_img` VALUES ('517', 'image\\photo\\6842f66c49ce64a604641d143a808ad2.jpg', '55');
INSERT INTO `wt_img` VALUES ('518', 'image\\photo\\ce203c6fb37c2512445da47102954a16.jpg', '55');
INSERT INTO `wt_img` VALUES ('519', 'image\\photo\\8b82eb107ee5cc798462b3fbb189956e.jpg', '55');
INSERT INTO `wt_img` VALUES ('520', 'image\\photo\\58177f04348e673ab3a4976e15ea5e80.jpg', '55');
INSERT INTO `wt_img` VALUES ('521', 'image\\photo\\a48c0f02068ddf601eaf7d3ccab82379.jpg', '55');
INSERT INTO `wt_img` VALUES ('522', 'image\\photo\\52fe1c2afcc2952f9066bb7bc59ceb26.jpg', '55');
INSERT INTO `wt_img` VALUES ('523', 'image\\photo\\24e41632f6a0f91ac2e7d6e3d64bbcb1.jpg', '55');
INSERT INTO `wt_img` VALUES ('524', 'image\\photo\\1908d688454f99a2c79f7211abfea624.jpg', '55');
INSERT INTO `wt_img` VALUES ('525', 'image\\photo\\52fe1c2afcc2952f9066bb7bc59ceb26.jpg', '56');
INSERT INTO `wt_img` VALUES ('526', 'image\\photo\\d8e4fe31c134b3dc850fd80555add01c.jpg', '56');
INSERT INTO `wt_img` VALUES ('527', 'image\\photo\\36604f192b0c3963d782b04f7f727043.jpg', '56');
INSERT INTO `wt_img` VALUES ('528', 'image\\photo\\24e41632f6a0f91ac2e7d6e3d64bbcb1.jpg', '56');
INSERT INTO `wt_img` VALUES ('529', 'image\\photo\\1908d688454f99a2c79f7211abfea624.jpg', '56');
INSERT INTO `wt_img` VALUES ('530', 'image\\photo\\33aeffa94ed637fd0714f2ac402f0c2b.jpg', '56');
INSERT INTO `wt_img` VALUES ('531', 'image\\photo\\d329a9ddc4b457d7839afa7e19d9a554.jpg', '56');
INSERT INTO `wt_img` VALUES ('532', 'image\\photo\\58177f04348e673ab3a4976e15ea5e80.jpg', '56');
INSERT INTO `wt_img` VALUES ('533', 'image\\photo\\d459954041585b7bb44fee5156fd02eb.jpg', '56');
INSERT INTO `wt_img` VALUES ('534', 'image\\photo\\6842f66c49ce64a604641d143a808ad2.jpg', '56');
INSERT INTO `wt_img` VALUES ('535', 'image\\photo\\a48c0f02068ddf601eaf7d3ccab82379.jpg', '56');
INSERT INTO `wt_img` VALUES ('536', 'image\\photo\\f37355c95c8ed5c77425c543365660c8.jpg', '56');
INSERT INTO `wt_img` VALUES ('537', 'image\\photo\\68664fc05ee473da375d09734965707c.jpg', '56');
INSERT INTO `wt_img` VALUES ('538', 'image\\photo\\7d1aacfe8da178572a80f43c984a3ca5.jpg', '56');
INSERT INTO `wt_img` VALUES ('539', 'image\\photo\\ce203c6fb37c2512445da47102954a16.jpg', '56');
INSERT INTO `wt_img` VALUES ('540', 'image\\photo\\8b82eb107ee5cc798462b3fbb189956e.jpg', '56');
INSERT INTO `wt_img` VALUES ('541', 'image\\photo\\1908d688454f99a2c79f7211abfea624.jpg', '57');
INSERT INTO `wt_img` VALUES ('542', 'image\\photo\\7d1aacfe8da178572a80f43c984a3ca5.jpg', '57');
INSERT INTO `wt_img` VALUES ('543', 'image\\photo\\f37355c95c8ed5c77425c543365660c8.jpg', '57');
INSERT INTO `wt_img` VALUES ('544', 'image\\photo\\36604f192b0c3963d782b04f7f727043.jpg', '57');
INSERT INTO `wt_img` VALUES ('545', 'image\\photo\\43883ad772fce7dbfa4fdf0b2f888cc5.jpg', '57');
INSERT INTO `wt_img` VALUES ('546', 'image\\photo\\a48c0f02068ddf601eaf7d3ccab82379.jpg', '57');
INSERT INTO `wt_img` VALUES ('547', 'image\\photo\\6842f66c49ce64a604641d143a808ad2.jpg', '57');
INSERT INTO `wt_img` VALUES ('548', 'image\\photo\\68664fc05ee473da375d09734965707c.jpg', '57');
INSERT INTO `wt_img` VALUES ('549', 'image\\photo\\33aeffa94ed637fd0714f2ac402f0c2b.jpg', '57');
INSERT INTO `wt_img` VALUES ('550', 'image\\photo\\d459954041585b7bb44fee5156fd02eb.jpg', '57');
INSERT INTO `wt_img` VALUES ('551', 'image\\photo\\d8e4fe31c134b3dc850fd80555add01c.jpg', '57');
INSERT INTO `wt_img` VALUES ('552', 'image\\photo\\58177f04348e673ab3a4976e15ea5e80.jpg', '57');
INSERT INTO `wt_img` VALUES ('553', 'image\\photo\\ce203c6fb37c2512445da47102954a16.jpg', '57');
INSERT INTO `wt_img` VALUES ('554', 'image\\photo\\52fe1c2afcc2952f9066bb7bc59ceb26.jpg', '57');
INSERT INTO `wt_img` VALUES ('555', 'image\\photo\\d329a9ddc4b457d7839afa7e19d9a554.jpg', '57');
INSERT INTO `wt_img` VALUES ('556', 'image\\photo\\24e41632f6a0f91ac2e7d6e3d64bbcb1.jpg', '57');
INSERT INTO `wt_img` VALUES ('557', 'image\\photo\\8b82eb107ee5cc798462b3fbb189956e.jpg', '57');
INSERT INTO `wt_img` VALUES ('558', 'image\\photo\\18dbd002e5b73a14b4ab51f5913f9043.jpg', '58');
INSERT INTO `wt_img` VALUES ('559', 'image\\photo\\4f8431c58edb6409755da5155e4a9c00.jpg', '59');
INSERT INTO `wt_img` VALUES ('560', 'image\\photo\\18dbd002e5b73a14b4ab51f5913f9043.jpg', '59');
INSERT INTO `wt_img` VALUES ('561', 'image\\photo\\fce0b281f18ce99ea598670811441a08.jpg', '59');
INSERT INTO `wt_img` VALUES ('562', 'image\\photo\\fce0b281f18ce99ea598670811441a08.jpg', '60');
INSERT INTO `wt_img` VALUES ('563', 'image\\photo\\0820e7e12a64f6c1e9dc14a027a2a9f1.jpg', '60');
INSERT INTO `wt_img` VALUES ('564', 'image\\photo\\85783add636cddfe0f3bbc908ff5f7c5.jpg', '60');
INSERT INTO `wt_img` VALUES ('565', 'image\\photo\\18dbd002e5b73a14b4ab51f5913f9043.jpg', '60');
INSERT INTO `wt_img` VALUES ('566', 'image\\photo\\4f8431c58edb6409755da5155e4a9c00.jpg', '60');
INSERT INTO `wt_img` VALUES ('567', 'image\\photo\\31f6d5101f5266e5755abf2e6766f612.jpg', '61');
INSERT INTO `wt_img` VALUES ('568', 'image\\photo\\85783add636cddfe0f3bbc908ff5f7c5.jpg', '61');
INSERT INTO `wt_img` VALUES ('569', 'image\\photo\\18dbd002e5b73a14b4ab51f5913f9043.jpg', '61');
INSERT INTO `wt_img` VALUES ('570', 'image\\photo\\4f8431c58edb6409755da5155e4a9c00.jpg', '61');
INSERT INTO `wt_img` VALUES ('571', 'image\\photo\\0820e7e12a64f6c1e9dc14a027a2a9f1.jpg', '61');
INSERT INTO `wt_img` VALUES ('572', 'image\\photo\\fce0b281f18ce99ea598670811441a08.jpg', '61');
INSERT INTO `wt_img` VALUES ('573', 'image\\photo\\c06bbeec108dd43f28145894a3274caa.jpg', '62');
INSERT INTO `wt_img` VALUES ('574', 'image\\photo\\0820e7e12a64f6c1e9dc14a027a2a9f1.jpg', '62');
INSERT INTO `wt_img` VALUES ('575', 'image\\photo\\31f6d5101f5266e5755abf2e6766f612.jpg', '62');
INSERT INTO `wt_img` VALUES ('576', 'image\\photo\\fce0b281f18ce99ea598670811441a08.jpg', '62');
INSERT INTO `wt_img` VALUES ('577', 'image\\photo\\18dbd002e5b73a14b4ab51f5913f9043.jpg', '62');
INSERT INTO `wt_img` VALUES ('578', 'image\\photo\\4f8431c58edb6409755da5155e4a9c00.jpg', '62');
INSERT INTO `wt_img` VALUES ('579', 'image\\photo\\85783add636cddfe0f3bbc908ff5f7c5.jpg', '62');
INSERT INTO `wt_img` VALUES ('580', 'image\\photo\\7e4f6bc08b3e99306094ca4889c98c50.jpg', '63');
INSERT INTO `wt_img` VALUES ('581', 'image\\photo\\724ab33d5ba765e90330742b3b80bd99.jpg', '64');
INSERT INTO `wt_img` VALUES ('582', 'image\\photo\\7e4f6bc08b3e99306094ca4889c98c50.jpg', '64');
INSERT INTO `wt_img` VALUES ('583', 'image\\photo\\5fbac1c58294518ca3b3955842eeeb60.jpg', '65');
INSERT INTO `wt_img` VALUES ('584', 'image\\photo\\e255eae00334ff03fdcee3c2f4168bb0.jpg', '65');
INSERT INTO `wt_img` VALUES ('585', 'image\\photo\\bc5a071009dca6a060956fb6490436b5.jpg', '65');
INSERT INTO `wt_img` VALUES ('586', 'image\\photo\\2baa36b2dbd274448e800ca5e112375a.jpg', '66');
INSERT INTO `wt_img` VALUES ('587', 'image\\photo\\70184fff2aa0cc7412da804bc9cb8498.jpg', '66');
INSERT INTO `wt_img` VALUES ('588', 'image\\photo\\bc5a071009dca6a060956fb6490436b4.jpg', '66');
INSERT INTO `wt_img` VALUES ('589', 'image\\photo\\2e1a7190f00e11c36605957acecc8ecc.jpg', '66');
INSERT INTO `wt_img` VALUES ('590', 'image\\photo\\421f7f5eb79fc4e3d88844991ec05982.jpg', '66');
INSERT INTO `wt_img` VALUES ('591', 'image\\photo\\cbb6810d3821ff888133f632f8d77b34.jpg', '67');
INSERT INTO `wt_img` VALUES ('592', 'image\\photo\\f95d384d3e34de09df3e9b4a43db83a6.jpg', '67');
INSERT INTO `wt_img` VALUES ('593', 'image\\photo\\2baa36b2dbd274448e800ca5e112374a.jpg', '67');
INSERT INTO `wt_img` VALUES ('594', 'image\\photo\\e292d837c038546701a1d63e591e85b1.jpg', '67');
INSERT INTO `wt_img` VALUES ('595', 'image\\photo\\0773ab9344e4b4c14a72a0a5a673ea7e.jpg', '67');
INSERT INTO `wt_img` VALUES ('596', 'image\\photo\\b75da865baffa74bae1a44410d563515.jpg', '68');
INSERT INTO `wt_img` VALUES ('597', 'image\\photo\\88c0f6bcba3e18c4b23104b44fe4d0aa.jpg', '68');
INSERT INTO `wt_img` VALUES ('598', 'image\\photo\\aa19dba11ca4458111f7958e48d3c6ab.jpg', '68');
INSERT INTO `wt_img` VALUES ('599', 'image\\photo\\e9638201353b897275de2d4c5df66471.jpg', '68');
INSERT INTO `wt_img` VALUES ('600', 'image\\photo\\8cc979b6d303019b499b695ef7502c69.jpg', '68');
INSERT INTO `wt_img` VALUES ('601', 'image\\photo\\742365c7784b67697b2979fb75267b7c.jpg', '69');
INSERT INTO `wt_img` VALUES ('602', 'image\\photo\\c8f91be75054e814343d409aab99b06e.jpg', '69');
INSERT INTO `wt_img` VALUES ('603', 'image\\photo\\9ea094f291922a5dbe68ac9a8cb4e580.jpg', '69');
INSERT INTO `wt_img` VALUES ('604', 'image\\photo\\a68395da507fff1641903bd6a100d756.jpg', '70');
INSERT INTO `wt_img` VALUES ('605', 'image\\photo\\d0eebf1df63a41765057a4788358b28c.jpg', '70');
INSERT INTO `wt_img` VALUES ('606', 'image\\photo\\d1b189ddff20e57e6f27a58b4d171179.jpg', '70');
INSERT INTO `wt_img` VALUES ('607', 'image\\photo\\444.jpg', '70');
INSERT INTO `wt_img` VALUES ('608', 'image\\photo\\333.jpg', '70');
INSERT INTO `wt_img` VALUES ('609', 'image\\photo\\222.jpg', '70');
INSERT INTO `wt_img` VALUES ('610', 'image\\photo\\111.jpg', '70');
INSERT INTO `wt_img` VALUES ('611', 'image\\photo\\11.jpg', '70');
INSERT INTO `wt_img` VALUES ('612', 'image\\photo\\000.jpg', '70');
INSERT INTO `wt_img` VALUES ('613', 'image\\photo\\eda0f136f2a3e5a34e049e817c583bc4.jpg', '71');
INSERT INTO `wt_img` VALUES ('614', 'image\\photo\\682689e1b4a07a81ad7d7d54c6f56a06.jpg', '71');
INSERT INTO `wt_img` VALUES ('615', 'image\\photo\\109a3713baafbdb5a8e65e6f6a71252a.jpg', '72');
INSERT INTO `wt_img` VALUES ('616', 'image\\photo\\c59097844ba5301aa6f48815764d2f63.jpg', '72');
INSERT INTO `wt_img` VALUES ('617', 'image\\photo\\4cf2ab46a5b7646853b522c71049eedc.jpg', '72');
INSERT INTO `wt_img` VALUES ('618', 'image\\photo\\be0a910ed745a0945dbd591e58e0bb53.jpg', '73');
INSERT INTO `wt_img` VALUES ('619', 'image\\photo\\682970f37a7393cc977007e11137bdeb.jpg', '73');
INSERT INTO `wt_img` VALUES ('620', 'image\\photo\\7a5e086de9d0e463eec6695a72aae54b.jpg', '73');
INSERT INTO `wt_img` VALUES ('621', 'image\\photo\\700a9ac081d7e2aed0fce0389238449e.jpg', '73');
INSERT INTO `wt_img` VALUES ('622', 'image\\photo\\4f519b6f20d139169c3995948329d2a4.jpg', '74');
INSERT INTO `wt_img` VALUES ('623', 'image\\photo\\231a580f8335cb90f083674e1ae72854.jpg', '74');
INSERT INTO `wt_img` VALUES ('624', 'image\\photo\\d53904a663b5707e8b6df44244cad525.jpg', '74');
INSERT INTO `wt_img` VALUES ('625', 'image\\photo\\9dc7e29a97737a9e5af23cef44db2cfe.jpg', '74');
INSERT INTO `wt_img` VALUES ('626', 'image\\photo\\a9640a84929e9648f62bed8fd79b8e12.jpg', '74');
INSERT INTO `wt_img` VALUES ('627', 'image\\photo\\5256bc5ebdaf7caccd69cb17ec0f9a4d.jpg', '75');
INSERT INTO `wt_img` VALUES ('628', 'image\\photo\\68f171a8bb5be3dc59991a4104d6def7.jpg', '76');

-- ----------------------------
-- Table structure for `wt_loginhistory`
-- ----------------------------
DROP TABLE IF EXISTS `wt_loginhistory`;
CREATE TABLE `wt_loginhistory` (
  `loginhistory_id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(30) DEFAULT NULL,
  `login_ip` char(15) DEFAULT NULL,
  `login_time` datetime DEFAULT NULL,
  PRIMARY KEY (`loginhistory_id`)
) ENGINE=MyISAM AUTO_INCREMENT=34 DEFAULT CHARSET=gbk;

-- ----------------------------
-- Records of wt_loginhistory
-- ----------------------------
INSERT INTO `wt_loginhistory` VALUES ('1', '12345678@qq.com', null, '2018-11-26 12:24:27');
INSERT INTO `wt_loginhistory` VALUES ('2', 'abcdefg@163.com', '111.11.85.3', '2018-12-26 08:29:05');
INSERT INTO `wt_loginhistory` VALUES ('3', 'abcdefg@163.com', '111.11.85.3', '2018-12-26 08:45:10');
INSERT INTO `wt_loginhistory` VALUES ('4', 'abcdefg@163.com', '111.11.85.3', '2018-12-26 08:51:13');
INSERT INTO `wt_loginhistory` VALUES ('5', '34567888@126.com', '111.11.85.3', '2018-12-26 10:11:02');
INSERT INTO `wt_loginhistory` VALUES ('6', 'abcdefg@163.com', '111.11.85.3', '2018-12-26 10:30:57');
INSERT INTO `wt_loginhistory` VALUES ('7', '12345678@qq.com', '111.11.85.3', '2018-12-26 11:11:52');
INSERT INTO `wt_loginhistory` VALUES ('8', '12345678@qq.com', '111.11.85.3', '2018-12-26 13:57:53');
INSERT INTO `wt_loginhistory` VALUES ('9', '12345678@qq.com', '111.11.85.3', '2018-12-26 14:00:29');
INSERT INTO `wt_loginhistory` VALUES ('10', '12345678@qq.com', '111.11.85.3', '2018-12-26 14:05:21');
INSERT INTO `wt_loginhistory` VALUES ('11', '12345678@qq.com', '111.11.85.3', '2018-12-26 14:09:59');
INSERT INTO `wt_loginhistory` VALUES ('12', '34567888@126.com', '111.11.85.3', '2018-12-26 14:47:17');
INSERT INTO `wt_loginhistory` VALUES ('13', '12345678@qq.com', '111.11.85.4', '2018-12-26 15:18:23');
INSERT INTO `wt_loginhistory` VALUES ('14', '12345678@qq.com', '111.11.85.4', '2018-12-26 15:20:56');
INSERT INTO `wt_loginhistory` VALUES ('15', '12345678@qq.com', '111.11.85.4', '2018-12-26 16:56:09');
INSERT INTO `wt_loginhistory` VALUES ('16', '12345678@qq.com', '111.11.85.4', '2018-12-26 17:38:54');
INSERT INTO `wt_loginhistory` VALUES ('17', '824691817@qq.com', '223.104.13.58', '2018-12-26 20:22:47');
INSERT INTO `wt_loginhistory` VALUES ('18', '824691817@qq.com', '223.104.13.58', '2018-12-26 20:24:42');
INSERT INTO `wt_loginhistory` VALUES ('19', '824691817@qq.com', '223.104.13.58', '2018-12-26 20:28:10');
INSERT INTO `wt_loginhistory` VALUES ('20', '824691817@qq.com', '111.11.85.4', '2018-12-27 09:31:41');
INSERT INTO `wt_loginhistory` VALUES ('21', '824691817@qq.com', '111.11.85.4', '2018-12-27 10:12:49');
INSERT INTO `wt_loginhistory` VALUES ('22', 'abcdefg@163.com', '111.11.85.3', '2018-12-27 10:38:26');
INSERT INTO `wt_loginhistory` VALUES ('23', '823938208@qq.com', '111.11.85.3', '2018-12-27 10:42:33');
INSERT INTO `wt_loginhistory` VALUES ('24', '823938208@qq.com', '111.11.85.3', '2018-12-27 10:52:18');
INSERT INTO `wt_loginhistory` VALUES ('25', '823938208@qq.com', '111.11.85.6', '2018-12-28 14:10:22');
INSERT INTO `wt_loginhistory` VALUES ('26', '1473558528@qq.com', '111.11.85.7', '2018-12-29 17:24:01');
INSERT INTO `wt_loginhistory` VALUES ('27', '1473558528@qq.com', '111.11.85.7', '2018-12-29 17:32:04');
INSERT INTO `wt_loginhistory` VALUES ('28', '1473558528@qq.com', '111.11.85.7', '2019-01-01 10:16:22');
INSERT INTO `wt_loginhistory` VALUES ('29', '1473558528@qq.com', '111.11.85.7', '2019-01-01 10:41:28');
INSERT INTO `wt_loginhistory` VALUES ('30', '1473558528@qq.com', '111.11.85.7', '2019-01-01 11:22:18');
INSERT INTO `wt_loginhistory` VALUES ('31', '12345678@qq.com', '111.11.85.7', '2019-01-01 11:39:10');
INSERT INTO `wt_loginhistory` VALUES ('32', '1005796431@qq.com', '111.11.85.7', '2019-01-01 11:48:18');
INSERT INTO `wt_loginhistory` VALUES ('33', '1005796431@qq.com', '111.11.85.7', '2019-01-01 12:02:12');

-- ----------------------------
-- Table structure for `wt_manager`
-- ----------------------------
DROP TABLE IF EXISTS `wt_manager`;
CREATE TABLE `wt_manager` (
  `manager_id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(30) DEFAULT NULL,
  `identity_id` int(11) DEFAULT NULL,
  `privilege_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`manager_id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=gbk;

-- ----------------------------
-- Records of wt_manager
-- ----------------------------
INSERT INTO `wt_manager` VALUES ('1', '1005796431@qq.com', '1', '1');
INSERT INTO `wt_manager` VALUES ('2', '1473558528@qq.com', null, null);
INSERT INTO `wt_manager` VALUES ('3', '824691817@qq.com', null, null);

-- ----------------------------
-- Table structure for `wt_order`
-- ----------------------------
DROP TABLE IF EXISTS `wt_order`;
CREATE TABLE `wt_order` (
  `order_id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(30) CHARACTER SET utf8 DEFAULT NULL,
  `ordertime` datetime DEFAULT NULL,
  `order_address` varchar(400) CHARACTER SET utf8 DEFAULT NULL,
  `order_status` enum('待发货','已发货','运输中','派送中','已收货') CHARACTER SET utf8 NOT NULL DEFAULT '待发货',
  PRIMARY KEY (`order_id`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=gbk;

-- ----------------------------
-- Records of wt_order
-- ----------------------------
INSERT INTO `wt_order` VALUES ('1', '12345678@qq.com', '2018-11-26 15:31:33', 'xx省xx市xx区xx街道xx号xx小区zzz收', '待发货');
INSERT INTO `wt_order` VALUES ('2', '34567888@126.com', '2018-11-26 15:32:57', 'xx省xx市xx区xx街道xx号xx小区aaa收', '待发货');
INSERT INTO `wt_order` VALUES ('3', '12345678@qq.com', '2018-12-03 14:47:29', 'xx省xx市xx区xx街道xx号xx小区zzz收', '已发货');
INSERT INTO `wt_order` VALUES ('4', '824691817@qq.com', '2018-12-28 19:39:47', 'xx省xx市xx区xx街道xx号xx小区aaa收', '已发货');
INSERT INTO `wt_order` VALUES ('5', '823938208@qq.com', '2018-12-28 19:40:13', 'xx省xx市xx区xx街道xx号xx小区aaa收', '待发货');
INSERT INTO `wt_order` VALUES ('6', '823938208@qq.com', '2018-12-28 19:40:43', 'xx省xx市xx区xx街道xx号xx小区aaa收', '已发货');
INSERT INTO `wt_order` VALUES ('7', 'abcdefg@163.com', '2018-12-28 19:41:03', 'xx省xx市xx区xx街道xx号xx小区aaa收', '待发货');
INSERT INTO `wt_order` VALUES ('8', '824691817@qq.com', '2018-12-27 19:41:58', 'xx省xx市xx区xx街道xx号xx小区aaa收', '已发货');
INSERT INTO `wt_order` VALUES ('9', '1005796431@qq.com', null, null, '待发货');

-- ----------------------------
-- Table structure for `wt_order_detail`
-- ----------------------------
DROP TABLE IF EXISTS `wt_order_detail`;
CREATE TABLE `wt_order_detail` (
  `orderdetail_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `order_count` int(11) DEFAULT NULL,
  PRIMARY KEY (`orderdetail_id`)
) ENGINE=MyISAM AUTO_INCREMENT=51 DEFAULT CHARSET=gbk;

-- ----------------------------
-- Records of wt_order_detail
-- ----------------------------
INSERT INTO `wt_order_detail` VALUES ('7', '1', '7', '7');
INSERT INTO `wt_order_detail` VALUES ('6', '3', '6', '5');
INSERT INTO `wt_order_detail` VALUES ('5', '2', '5', '6');
INSERT INTO `wt_order_detail` VALUES ('4', '1', '4', '4');
INSERT INTO `wt_order_detail` VALUES ('3', '3', '3', '3');
INSERT INTO `wt_order_detail` VALUES ('2', '2', '2', '2');
INSERT INTO `wt_order_detail` VALUES ('1', '1', '1', '1');
INSERT INTO `wt_order_detail` VALUES ('8', '8', '7', '46');
INSERT INTO `wt_order_detail` VALUES ('9', '6', '8', '8');
INSERT INTO `wt_order_detail` VALUES ('10', '7', '9', '9');
INSERT INTO `wt_order_detail` VALUES ('11', '4', '10', '10');
INSERT INTO `wt_order_detail` VALUES ('12', '3', '11', '11');
INSERT INTO `wt_order_detail` VALUES ('13', '7', '12', '12');
INSERT INTO `wt_order_detail` VALUES ('14', '5', '13', '13');
INSERT INTO `wt_order_detail` VALUES ('15', '2', '14', '14');
INSERT INTO `wt_order_detail` VALUES ('16', '1', '15', '15');
INSERT INTO `wt_order_detail` VALUES ('17', '2', '16', '47');
INSERT INTO `wt_order_detail` VALUES ('18', '4', '17', '17');
INSERT INTO `wt_order_detail` VALUES ('19', '3', '18', '18');
INSERT INTO `wt_order_detail` VALUES ('20', '5', '19', '19');
INSERT INTO `wt_order_detail` VALUES ('21', '6', '20', '32');
INSERT INTO `wt_order_detail` VALUES ('22', '7', '21', '42');
INSERT INTO `wt_order_detail` VALUES ('23', '8', '22', '31');
INSERT INTO `wt_order_detail` VALUES ('24', '1', '23', '43');
INSERT INTO `wt_order_detail` VALUES ('25', '2', '24', '24');
INSERT INTO `wt_order_detail` VALUES ('26', '4', '25', '29');
INSERT INTO `wt_order_detail` VALUES ('27', '3', '26', '30');
INSERT INTO `wt_order_detail` VALUES ('28', '5', '27', '38');
INSERT INTO `wt_order_detail` VALUES ('29', '6', '28', '41');
INSERT INTO `wt_order_detail` VALUES ('30', '7', '29', '21');
INSERT INTO `wt_order_detail` VALUES ('31', '8', '30', '48');
INSERT INTO `wt_order_detail` VALUES ('32', '1', '31', '20');
INSERT INTO `wt_order_detail` VALUES ('33', '2', '32', '37');
INSERT INTO `wt_order_detail` VALUES ('34', '3', '33', '28');
INSERT INTO `wt_order_detail` VALUES ('35', '4', '34', '36');
INSERT INTO `wt_order_detail` VALUES ('36', '5', '35', '25');
INSERT INTO `wt_order_detail` VALUES ('37', '6', '36', '35');
INSERT INTO `wt_order_detail` VALUES ('40', '8', '39', '45');
INSERT INTO `wt_order_detail` VALUES ('38', '7', '37', '40');
INSERT INTO `wt_order_detail` VALUES ('39', '8', '38', '27');
INSERT INTO `wt_order_detail` VALUES ('41', '6', '40', '26');
INSERT INTO `wt_order_detail` VALUES ('42', '5', '41', '16');
INSERT INTO `wt_order_detail` VALUES ('43', '7', '42', '23');
INSERT INTO `wt_order_detail` VALUES ('44', '6', '43', '49');
INSERT INTO `wt_order_detail` VALUES ('45', '7', '44', '44');
INSERT INTO `wt_order_detail` VALUES ('46', '5', '45', '34');
INSERT INTO `wt_order_detail` VALUES ('47', '4', '46', '42');
INSERT INTO `wt_order_detail` VALUES ('48', '3', '47', '39');
INSERT INTO `wt_order_detail` VALUES ('49', '2', '48', '33');
INSERT INTO `wt_order_detail` VALUES ('50', '1', '49', '22');

-- ----------------------------
-- Table structure for `wt_privilege`
-- ----------------------------
DROP TABLE IF EXISTS `wt_privilege`;
CREATE TABLE `wt_privilege` (
  `privilege_id` int(11) NOT NULL AUTO_INCREMENT,
  `privilege_name` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`privilege_id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=gbk;

-- ----------------------------
-- Records of wt_privilege
-- ----------------------------
INSERT INTO `wt_privilege` VALUES ('1', '发表话题');
INSERT INTO `wt_privilege` VALUES ('2', '禁用用户');
INSERT INTO `wt_privilege` VALUES ('3', '恢复用户');
INSERT INTO `wt_privilege` VALUES ('4', '系统维护');
INSERT INTO `wt_privilege` VALUES ('5', 'hello');
INSERT INTO `wt_privilege` VALUES ('6', 'hello');

-- ----------------------------
-- Table structure for `wt_privilege_identity`
-- ----------------------------
DROP TABLE IF EXISTS `wt_privilege_identity`;
CREATE TABLE `wt_privilege_identity` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identity_id` int(11) DEFAULT NULL,
  `privilege_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wt_privilege_identity
-- ----------------------------
INSERT INTO `wt_privilege_identity` VALUES ('1', '5', '4');
INSERT INTO `wt_privilege_identity` VALUES ('2', '6', '6');

-- ----------------------------
-- Table structure for `wt_product`
-- ----------------------------
DROP TABLE IF EXISTS `wt_product`;
CREATE TABLE `wt_product` (
  `product_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_name` varchar(40) CHARACTER SET utf8 DEFAULT NULL,
  `product_description` varchar(300) CHARACTER SET utf8 DEFAULT NULL,
  `product_pic` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `price` decimal(10,4) DEFAULT NULL,
  `discount` decimal(10,4) DEFAULT NULL,
  `product_how_use` varchar(1024) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`product_id`)
) ENGINE=MyISAM AUTO_INCREMENT=50 DEFAULT CHARSET=gbk;

-- ----------------------------
-- Records of wt_product
-- ----------------------------
INSERT INTO `wt_product` VALUES ('45', 'kony帐篷', '用帆布做成', 'image\\goods\\tent9.jpg', '289.9900', '3.0000', '两根杆都穿好后。把每根杆的一头插进帐篷角上的小孔里，然后两个人同时拿住活动的两个头，把杆往里顶，让帐篷拱起来，一直到能把这边的头也插进小孔里，插进去后，帐篷的形状就成了，把帐杆的交叉处用绳子栓一下，选好门的方向，就可以把帐篷固定在地上了。用地钉，钩住四角的环插进土里，要让帐底伸展开，整个帐篷紧绷绷的。再挂外帐，把外帐打开，蒙在内帐上，帐篷就搭好了。');
INSERT INTO `wt_product` VALUES ('46', '风景帐篷', '用帆布做成', 'image\\goods\\tent10.jpg', '328.0000', '7.5000', '两根杆都穿好后。把每根杆的一头插进帐篷角上的小孔里，然后两个人同时拿住活动的两个头，把杆往里顶，让帐篷拱起来，一直到能把这边的头也插进小孔里，插进去后，帐篷的形状就成了，把帐杆的交叉处用绳子栓一下，选好门的方向，就可以把帐篷固定在地上了。用地钉，钩住四角的环插进土里，要让帐底伸展开，整个帐篷紧绷绷的。再挂外帐，把外帐打开，蒙在内帐上，帐篷就搭好了。');
INSERT INTO `wt_product` VALUES ('47', 'view帐篷', '用帆布做成', 'image\\goods\\tent11.jpg', '123.9900', '8.5000', '两根杆都穿好后。把每根杆的一头插进帐篷角上的小孔里，然后两个人同时拿住活动的两个头，把杆往里顶，让帐篷拱起来，一直到能把这边的头也插进小孔里，插进去后，帐篷的形状就成了，把帐杆的交叉处用绳子栓一下，选好门的方向，就可以把帐篷固定在地上了。用地钉，钩住四角的环插进土里，要让帐底伸展开，整个帐篷紧绷绷的。再挂外帐，把外帐打开，蒙在内帐上，帐篷就搭好了。');
INSERT INTO `wt_product` VALUES ('48', 'we帐篷', '用帆布做成', 'image\\goods\\tent12.jpg', '165.0000', '7.5000', '两根杆都穿好后。把每根杆的一头插进帐篷角上的小孔里，然后两个人同时拿住活动的两个头，把杆往里顶，让帐篷拱起来，一直到能把这边的头也插进小孔里，插进去后，帐篷的形状就成了，把帐杆的交叉处用绳子栓一下，选好门的方向，就可以把帐篷固定在地上了。用地钉，钩住四角的环插进土里，要让帐底伸展开，整个帐篷紧绷绷的。再挂外帐，把外帐打开，蒙在内帐上，帐篷就搭好了。');
INSERT INTO `wt_product` VALUES ('49', 'trip帐篷', '用帆布做成', 'image\\goods\\tent13.jpg', '323.0000', '8.0000', '两根杆都穿好后。把每根杆的一头插进帐篷角上的小孔里，然后两个人同时拿住活动的两个头，把杆往里顶，让帐篷拱起来，一直到能把这边的头也插进小孔里，插进去后，帐篷的形状就成了，把帐杆的交叉处用绳子栓一下，选好门的方向，就可以把帐篷固定在地上了。用地钉，钩住四角的环插进土里，要让帐底伸展开，整个帐篷紧绷绷的。再挂外帐，把外帐打开，蒙在内帐上，帐篷就搭好了。');
INSERT INTO `wt_product` VALUES ('33', 'March背包', '容量大', 'image\\goods\\good33.jpg', '275.0000', '95.0000', '背');
INSERT INTO `wt_product` VALUES ('34', '羊绒毛巾', '吸水性好', 'image\\goods\\good34.jpg', '56.5000', '8.5000', '使用');
INSERT INTO `wt_product` VALUES ('35', 'falcon太阳镜', '防紫外线', 'image\\goods\\good35.jpg', '333.0000', '6.0000', '佩戴');
INSERT INTO `wt_product` VALUES ('36', 'magony手电筒', '高效能抗热灯芯，持续抗热，增加灯芯使用寿命。聚焦：中心聚光，照射距离更远', 'image\\goods\\good36.jpg', '83.5000', '95.0000', '将开关推到一档和二档时可选择弱光和强光的照明功能。');
INSERT INTO `wt_product` VALUES ('37', '三角帐篷', '用帆布做成', 'image\\goods\\tent1.png', '888.0000', '7.5000', '两根杆都穿好后。把每根杆的一头插进帐篷角上的小孔里，然后两个人同时拿住活动的两个头，把杆往里顶，让帐篷拱起来，一直到能把这边的头也插进小孔里，插进去后，帐篷的形状就成了，把帐杆的交叉处用绳子栓一下，选好门的方向，就可以把帐篷固定在地上了。用地钉，钩住四角的环插进土里，要让帐底伸展开，整个帐篷紧绷绷的。再挂外帐，把外帐打开，蒙在内帐上，帐篷就搭好了。');
INSERT INTO `wt_product` VALUES ('38', '树洞帐篷', '用帆布做成', 'image\\goods\\tent2.png', '1500.0000', '9.0000', '两根杆都穿好后。把每根杆的一头插进帐篷角上的小孔里，然后两个人同时拿住活动的两个头，把杆往里顶，让帐篷拱起来，一直到能把这边的头也插进小孔里，插进去后，帐篷的形状就成了，把帐杆的交叉处用绳子栓一下，选好门的方向，就可以把帐篷固定在地上了。用地钉，钩住四角的环插进土里，要让帐底伸展开，整个帐篷紧绷绷的。再挂外帐，把外帐打开，蒙在内帐上，帐篷就搭好了。');
INSERT INTO `wt_product` VALUES ('39', '碎花帐篷', '用帆布做成', 'image\\goods\\tent3.png', '78.5000', '95.0000', '两根杆都穿好后。把每根杆的一头插进帐篷角上的小孔里，然后两个人同时拿住活动的两个头，把杆往里顶，让帐篷拱起来，一直到能把这边的头也插进小孔里，插进去后，帐篷的形状就成了，把帐杆的交叉处用绳子栓一下，选好门的方向，就可以把帐篷固定在地上了。用地钉，钩住四角的环插进土里，要让帐底伸展开，整个帐篷紧绷绷的。再挂外帐，把外帐打开，蒙在内帐上，帐篷就搭好了。');
INSERT INTO `wt_product` VALUES ('40', 'tent帐篷', '用帆布做成', 'image\\goods\\tent4.png', '299.9900', '6.0000', '两根杆都穿好后。把每根杆的一头插进帐篷角上的小孔里，然后两个人同时拿住活动的两个头，把杆往里顶，让帐篷拱起来，一直到能把这边的头也插进小孔里，插进去后，帐篷的形状就成了，把帐杆的交叉处用绳子栓一下，选好门的方向，就可以把帐篷固定在地上了。用地钉，钩住四角的环插进土里，要让帐底伸展开，整个帐篷紧绷绷的。再挂外帐，把外帐打开，蒙在内帐上，帐篷就搭好了。');
INSERT INTO `wt_product` VALUES ('41', '气泡帐篷', '用帆布做成', 'image\\goods\\tent5.png', '999.9900', '7.5000', '两根杆都穿好后。把每根杆的一头插进帐篷角上的小孔里，然后两个人同时拿住活动的两个头，把杆往里顶，让帐篷拱起来，一直到能把这边的头也插进小孔里，插进去后，帐篷的形状就成了，把帐杆的交叉处用绳子栓一下，选好门的方向，就可以把帐篷固定在地上了。用地钉，钩住四角的环插进土里，要让帐底伸展开，整个帐篷紧绷绷的。再挂外帐，把外帐打开，蒙在内帐上，帐篷就搭好了。');
INSERT INTO `wt_product` VALUES ('42', '随身帐篷', '用帆布做成', 'image\\goods\\tent6.png', '550.0000', '7.0000', '两根杆都穿好后。把每根杆的一头插进帐篷角上的小孔里，然后两个人同时拿住活动的两个头，把杆往里顶，让帐篷拱起来，一直到能把这边的头也插进小孔里，插进去后，帐篷的形状就成了，把帐杆的交叉处用绳子栓一下，选好门的方向，就可以把帐篷固定在地上了。用地钉，钩住四角的环插进土里，要让帐底伸展开，整个帐篷紧绷绷的。再挂外帐，把外帐打开，蒙在内帐上，帐篷就搭好了。');
INSERT INTO `wt_product` VALUES ('43', '攀登用帐篷', '用帆布做成', 'image\\goods\\tent7.png', '670.0000', '6.0000', '两根杆都穿好后。把每根杆的一头插进帐篷角上的小孔里，然后两个人同时拿住活动的两个头，把杆往里顶，让帐篷拱起来，一直到能把这边的头也插进小孔里，插进去后，帐篷的形状就成了，把帐杆的交叉处用绳子栓一下，选好门的方向，就可以把帐篷固定在地上了。用地钉，钩住四角的环插进土里，要让帐底伸展开，整个帐篷紧绷绷的。再挂外帐，把外帐打开，蒙在内帐上，帐篷就搭好了。');
INSERT INTO `wt_product` VALUES ('44', '常用帐篷', '用帆布做成', 'image\\goods\\tent8.png', '223.0000', '9.0000', '两根杆都穿好后。把每根杆的一头插进帐篷角上的小孔里，然后两个人同时拿住活动的两个头，把杆往里顶，让帐篷拱起来，一直到能把这边的头也插进小孔里，插进去后，帐篷的形状就成了，把帐杆的交叉处用绳子栓一下，选好门的方向，就可以把帐篷固定在地上了。用地钉，钩住四角的环插进土里，要让帐底伸展开，整个帐篷紧绷绷的。再挂外帐，把外帐打开，蒙在内帐上，帐篷就搭好了。');
INSERT INTO `wt_product` VALUES ('21', 'bruse水壶', '便捷', 'image\\goods\\good21.jpg', '220.3000', '9.9000', '装水');
INSERT INTO `wt_product` VALUES ('22', '暴龙太阳镜', '防紫外线', 'image\\goods\\good22.jpg', '160.0000', '7.5000', '佩戴');
INSERT INTO `wt_product` VALUES ('23', 'zeek太阳镜', '防紫外线', 'image\\goods\\good23.jpg', '188.0000', '8.0000', '佩戴');
INSERT INTO `wt_product` VALUES ('24', 'Stanley水壶', '保温', 'image\\goods\\good24.jpg', '121.0000', '8.5000', '装水');
INSERT INTO `wt_product` VALUES ('25', '探路者冲锋衣', '保暖', 'image\\goods\\good25.jpg', '385.5000', '6.0000', '穿');
INSERT INTO `wt_product` VALUES ('26', 'plash太阳镜', '防紫外线', 'image\\goods\\good26.jpg', '399.0000', '9.9000', '佩戴');
INSERT INTO `wt_product` VALUES ('27', 'safe绳索', '稳固', 'image\\goods\\good27.jpg', '167.9900', '8.0000', '攀登者与保护者分别系于绳索两端。路线垂直度依靠扁带长度进行调节。');
INSERT INTO `wt_product` VALUES ('28', 'ZAKER登山杖', '便捷', 'image\\goods\\good28.jpg', '198.5000', '9.9000', '要根据自己的身高来合理的调节登山杖：在调整登山杖时不应该超过登山杖上所显示的最大调整长度。');
INSERT INTO `wt_product` VALUES ('29', '粉红睡袋', '保温', 'image\\goods\\good29.jpg', '398.0000', '6.0000', '进行户外运动前1-2天请将睡袋完全舒展,有助于在野外充分发挥其保暖性能。出发前再将睡袋装入压缩袋。');
INSERT INTO `wt_product` VALUES ('30', 'fraske登山镐', '便捷', 'image\\goods\\good30.jpg', '150.6000', '8.0000', '要根据自己的身高来合理的调节登山杖：在调整登山杖时不应该超过登山杖上所显示的最大调整长度。');
INSERT INTO `wt_product` VALUES ('31', 'wake登山包', '容量大', 'image\\goods\\good31.jpg', '325.0000', '7.5000', '背');
INSERT INTO `wt_product` VALUES ('32', 'KATADYN水壶', '保温', 'image\\goods\\good32.jpg', '265.0000', '9.0000', '装水');
INSERT INTO `wt_product` VALUES ('9', '计时机械手表', '准', 'image\\goods\\good9.jpg', '356.0000', '9.0000', '佩戴');
INSERT INTO `wt_product` VALUES ('10', 'LEKI登山杖', '便捷', 'image\\goods\\good10.jpg', '253.8000', '7.5000', '要根据自己的身高来合理的调节登山杖：在调整登山杖时不应该超过登山杖上所显示的最大调整长度。');
INSERT INTO `wt_product` VALUES ('11', 'scar登山杖', '便捷', 'image\\goods\\good11.jpg', '125.5000', '8.0000', '要根据自己的身高来合理的调节登山杖：在调整登山杖时不应该超过登山杖上所显示的最大调整长度。');
INSERT INTO `wt_product` VALUES ('12', 'scar便携登山杖', '便捷', 'image\\goods\\good12.jpg', '132.9900', '8.5000', '要根据自己的身高来合理的调节登山杖：在调整登山杖时不应该超过登山杖上所显示的最大调整长度。');
INSERT INTO `wt_product` VALUES ('13', 'marmat背包', '容量大', 'image\\goods\\good13.jpg', '600.0000', '7.5000', '背');
INSERT INTO `wt_product` VALUES ('14', 'folding bucket', '便捷', 'image\\goods\\good14.jpg', '360.9500', '8.0000', '撑开，可装水');
INSERT INTO `wt_product` VALUES ('15', '强光手电筒', '高效能抗热灯芯，持续抗热，增加灯芯使用寿命。聚焦：中心聚光，照射距离更远', 'image\\goods\\good15.jpg', '110.0000', '9.9000', '将开关推到一档和二档时可选择弱光和强光的照明功能。');
INSERT INTO `wt_product` VALUES ('16', 'feef攀登绳索', '稳固', 'image\\goods\\good16.jpg', '233.3300', '7.0000', '攀登者与保护者分别系于绳索两端。路线垂直度依靠扁带长度进行调节。');
INSERT INTO `wt_product` VALUES ('17', 'freek太阳镜', '防紫外线', 'image\\goods\\good17.jpg', '56.0000', '8.5000', '佩戴');
INSERT INTO `wt_product` VALUES ('18', '8000手表', '准', 'image\\goods\\good18.jpg', '699.9900', '7.5000', '佩戴');
INSERT INTO `wt_product` VALUES ('19', 'weke登山包', '容量大', 'image\\goods\\good19.jpg', '110.8900', '7.0000', '背');
INSERT INTO `wt_product` VALUES ('20', 'uki登山挎包', '容量大', 'image\\goods\\good20.jpg', '175.5000', '9.0000', '背');
INSERT INTO `wt_product` VALUES ('1', 'CAMEL骆驼户外手电筒', '高效能抗热灯芯，持续抗热，增加灯芯使用寿命。聚焦：中心聚光，照射距离更远', 'image\\goods\\good1.jpg', '103.9000', '9.0000', 'USB充电');
INSERT INTO `wt_product` VALUES ('2', 'KALAS攀登绳索', '当今用于攀登的绳子的结构一律是芯鞘结构(Kernmantle)，这种结构是爱德瑞德(Edelrid)公司在上世纪50年代提出的。这种结构下，绳芯负责承受核心的拉力和冲坠的力量，绳鞘提供一部分拉力，耐磨性以及不错的手感。', 'image\\goods\\good2.jpg', '99.0000', '8.0000', '攀登时手脚要紧密配合，保持身体重心的稳定，不断观察、试探攀登点的牢固适用性。欲借草根或树枝攀登时，应先稳住重心试着用力拉动，以免因草根树枝突然松脱造成危险。');
INSERT INTO `wt_product` VALUES ('3', '钢笔式净水器', '小巧方便', 'image\\goods\\good3.jpg', '210.3000', '9.8000', '大部分净水器是采用阻筛过滤原理渐进式结构方式，由多级滤芯首尾串接而成，滤芯精密度由低到高依次排列，以实现多级滤芯分摊截留污物，从而减少滤芯堵塞和人工排污、拆洗的次数以及延长更换滤芯的周期。');
INSERT INTO `wt_product` VALUES ('4', '防水袋', '防水效果好', 'image\\goods\\good4.jpg', '15.6500', '6.7000', '将物品装入防水袋中');
INSERT INTO `wt_product` VALUES ('5', '打气筒', '小巧便捷', 'image\\goods\\good5.jpg', '88.8800', '9.9000', '上下活动打气筒');
INSERT INTO `wt_product` VALUES ('6', '充电灯', '高效能抗热灯芯，持续抗热，增加灯芯使用寿命。聚焦：中心聚光，照射距离更远', 'image\\goods\\good6.jpg', '127.0000', '8.5000', '照明');
INSERT INTO `wt_product` VALUES ('7', 'sutari望远镜', '高倍望远镜', 'image\\goods\\good7.jpg', '567.0000', '7.5000', '调节出瞳距离、调节目距、对焦、观察');
INSERT INTO `wt_product` VALUES ('8', 'jsward望远镜', '高倍望远镜', 'image\\goods\\good8.jpg', '675.0000', '9.9000', '调节出瞳距离、调节目距、对焦、观察');

-- ----------------------------
-- Table structure for `wt_tag`
-- ----------------------------
DROP TABLE IF EXISTS `wt_tag`;
CREATE TABLE `wt_tag` (
  `tag_id` int(11) NOT NULL AUTO_INCREMENT,
  `tagname` varchar(14) DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `tag_count` int(11) DEFAULT NULL,
  PRIMARY KEY (`tag_id`)
) ENGINE=MyISAM AUTO_INCREMENT=37 DEFAULT CHARSET=gbk;

-- ----------------------------
-- Records of wt_tag
-- ----------------------------
INSERT INTO `wt_tag` VALUES ('1', '风景', null, '45');
INSERT INTO `wt_tag` VALUES ('2', '美食', null, '16');
INSERT INTO `wt_tag` VALUES ('3', '玩耍', null, '6');
INSERT INTO `wt_tag` VALUES ('4', '小贴士', null, '3');
INSERT INTO `wt_tag` VALUES ('5', '山', '1', '4');
INSERT INTO `wt_tag` VALUES ('6', '海', '1', '2');
INSERT INTO `wt_tag` VALUES ('7', '烧烤', '2', '1');
INSERT INTO `wt_tag` VALUES ('8', '游乐场', '3', '1');
INSERT INTO `wt_tag` VALUES ('9', '天空之镜', '1', '1');
INSERT INTO `wt_tag` VALUES ('10', '索桥', '1', '1');
INSERT INTO `wt_tag` VALUES ('11', '磁州窑', '1', '1');
INSERT INTO `wt_tag` VALUES ('12', '高速公路', '1', '1');
INSERT INTO `wt_tag` VALUES ('13', '野三坡', '1', '1');
INSERT INTO `wt_tag` VALUES ('14', '滑雪', '3', '1');
INSERT INTO `wt_tag` VALUES ('15', '温泉', '3', '2');
INSERT INTO `wt_tag` VALUES ('16', '河豚', '2', '1');
INSERT INTO `wt_tag` VALUES ('17', '山海关', '1', '1');
INSERT INTO `wt_tag` VALUES ('18', '蟹黄包', '2', '1');
INSERT INTO `wt_tag` VALUES ('19', '国家公园', '1', '1');
INSERT INTO `wt_tag` VALUES ('20', '塔', '1', '2');
INSERT INTO `wt_tag` VALUES ('21', '寺', '1', '2');
INSERT INTO `wt_tag` VALUES ('22', '水世界', '1', '1');
INSERT INTO `wt_tag` VALUES ('23', '楼', '1', '1');
INSERT INTO `wt_tag` VALUES ('24', '夜市', '2', '1');
INSERT INTO `wt_tag` VALUES ('25', '大盘鸡', '2', '1');
INSERT INTO `wt_tag` VALUES ('26', '机场', '4', '1');
INSERT INTO `wt_tag` VALUES ('27', '搬家', '4', '1');
INSERT INTO `wt_tag` VALUES ('28', '六盘水', '1', '1');
INSERT INTO `wt_tag` VALUES ('29', '台湾', '1', '1');
INSERT INTO `wt_tag` VALUES ('30', '古道', '1', '1');
INSERT INTO `wt_tag` VALUES ('31', '草原', '1', '2');
INSERT INTO `wt_tag` VALUES ('32', '清东陵', '1', '1');
INSERT INTO `wt_tag` VALUES ('33', '徽州', '1', '1');
INSERT INTO `wt_tag` VALUES ('34', '海', '3', '1');
INSERT INTO `wt_tag` VALUES ('35', '公园', '3', '1');
INSERT INTO `wt_tag` VALUES ('36', '雪', '1', '1');

-- ----------------------------
-- Table structure for `wt_tag_travelnote`
-- ----------------------------
DROP TABLE IF EXISTS `wt_tag_travelnote`;
CREATE TABLE `wt_tag_travelnote` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tag_id` int(11) NOT NULL,
  `travelnote_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=111 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of wt_tag_travelnote
-- ----------------------------
INSERT INTO `wt_tag_travelnote` VALUES ('30', '17', '21');
INSERT INTO `wt_tag_travelnote` VALUES ('29', '1', '21');
INSERT INTO `wt_tag_travelnote` VALUES ('12', '1', '12');
INSERT INTO `wt_tag_travelnote` VALUES ('13', '1', '13');
INSERT INTO `wt_tag_travelnote` VALUES ('14', '11', '13');
INSERT INTO `wt_tag_travelnote` VALUES ('15', '1', '14');
INSERT INTO `wt_tag_travelnote` VALUES ('16', '12', '14');
INSERT INTO `wt_tag_travelnote` VALUES ('17', '1', '15');
INSERT INTO `wt_tag_travelnote` VALUES ('18', '13', '15');
INSERT INTO `wt_tag_travelnote` VALUES ('19', '3', '16');
INSERT INTO `wt_tag_travelnote` VALUES ('20', '14', '16');
INSERT INTO `wt_tag_travelnote` VALUES ('21', '3', '17');
INSERT INTO `wt_tag_travelnote` VALUES ('22', '15', '17');
INSERT INTO `wt_tag_travelnote` VALUES ('23', '1', '18');
INSERT INTO `wt_tag_travelnote` VALUES ('24', '6', '18');
INSERT INTO `wt_tag_travelnote` VALUES ('25', '2', '19');
INSERT INTO `wt_tag_travelnote` VALUES ('26', '16', '19');
INSERT INTO `wt_tag_travelnote` VALUES ('27', '3', '20');
INSERT INTO `wt_tag_travelnote` VALUES ('28', '15', '20');
INSERT INTO `wt_tag_travelnote` VALUES ('31', '1', '22');
INSERT INTO `wt_tag_travelnote` VALUES ('32', '1', '23');
INSERT INTO `wt_tag_travelnote` VALUES ('33', '1', '24');
INSERT INTO `wt_tag_travelnote` VALUES ('34', '1', '25');
INSERT INTO `wt_tag_travelnote` VALUES ('35', '1', '26');
INSERT INTO `wt_tag_travelnote` VALUES ('36', '1', '27');
INSERT INTO `wt_tag_travelnote` VALUES ('37', '3', '28');
INSERT INTO `wt_tag_travelnote` VALUES ('38', '2', '29');
INSERT INTO `wt_tag_travelnote` VALUES ('39', '2', '30');
INSERT INTO `wt_tag_travelnote` VALUES ('60', '1', '48');
INSERT INTO `wt_tag_travelnote` VALUES ('41', '2', '32');
INSERT INTO `wt_tag_travelnote` VALUES ('43', '1', '34');
INSERT INTO `wt_tag_travelnote` VALUES ('44', '1', '35');
INSERT INTO `wt_tag_travelnote` VALUES ('45', '1', '36');
INSERT INTO `wt_tag_travelnote` VALUES ('46', '2', '37');
INSERT INTO `wt_tag_travelnote` VALUES ('47', '18', '37');
INSERT INTO `wt_tag_travelnote` VALUES ('48', '1', '38');
INSERT INTO `wt_tag_travelnote` VALUES ('49', '1', '39');
INSERT INTO `wt_tag_travelnote` VALUES ('50', '1', '40');
INSERT INTO `wt_tag_travelnote` VALUES ('51', '1', '41');
INSERT INTO `wt_tag_travelnote` VALUES ('52', '1', '42');
INSERT INTO `wt_tag_travelnote` VALUES ('53', '5', '42');
INSERT INTO `wt_tag_travelnote` VALUES ('54', '1', '43');
INSERT INTO `wt_tag_travelnote` VALUES ('55', '1', '44');
INSERT INTO `wt_tag_travelnote` VALUES ('56', '1', '45');
INSERT INTO `wt_tag_travelnote` VALUES ('57', '1', '46');
INSERT INTO `wt_tag_travelnote` VALUES ('58', '1', '47');
INSERT INTO `wt_tag_travelnote` VALUES ('59', '19', '47');
INSERT INTO `wt_tag_travelnote` VALUES ('61', '1', '49');
INSERT INTO `wt_tag_travelnote` VALUES ('62', '20', '49');
INSERT INTO `wt_tag_travelnote` VALUES ('63', '21', '49');
INSERT INTO `wt_tag_travelnote` VALUES ('64', '1', '50');
INSERT INTO `wt_tag_travelnote` VALUES ('65', '22', '50');
INSERT INTO `wt_tag_travelnote` VALUES ('66', '1', '51');
INSERT INTO `wt_tag_travelnote` VALUES ('67', '1', '52');
INSERT INTO `wt_tag_travelnote` VALUES ('68', '5', '52');
INSERT INTO `wt_tag_travelnote` VALUES ('69', '1', '53');
INSERT INTO `wt_tag_travelnote` VALUES ('70', '20', '53');
INSERT INTO `wt_tag_travelnote` VALUES ('71', '21', '53');
INSERT INTO `wt_tag_travelnote` VALUES ('72', '23', '53');
INSERT INTO `wt_tag_travelnote` VALUES ('73', '1', '54');
INSERT INTO `wt_tag_travelnote` VALUES ('74', '5', '54');
INSERT INTO `wt_tag_travelnote` VALUES ('75', '2', '55');
INSERT INTO `wt_tag_travelnote` VALUES ('76', '24', '55');
INSERT INTO `wt_tag_travelnote` VALUES ('77', '2', '56');
INSERT INTO `wt_tag_travelnote` VALUES ('78', '2', '57');
INSERT INTO `wt_tag_travelnote` VALUES ('79', '2', '58');
INSERT INTO `wt_tag_travelnote` VALUES ('80', '2', '59');
INSERT INTO `wt_tag_travelnote` VALUES ('81', '2', '60');
INSERT INTO `wt_tag_travelnote` VALUES ('82', '2', '61');
INSERT INTO `wt_tag_travelnote` VALUES ('83', '25', '61');
INSERT INTO `wt_tag_travelnote` VALUES ('84', '4', '62');
INSERT INTO `wt_tag_travelnote` VALUES ('85', '26', '62');
INSERT INTO `wt_tag_travelnote` VALUES ('86', '4', '63');
INSERT INTO `wt_tag_travelnote` VALUES ('87', '4', '64');
INSERT INTO `wt_tag_travelnote` VALUES ('88', '27', '64');
INSERT INTO `wt_tag_travelnote` VALUES ('89', '1', '65');
INSERT INTO `wt_tag_travelnote` VALUES ('90', '28', '65');
INSERT INTO `wt_tag_travelnote` VALUES ('91', '1', '66');
INSERT INTO `wt_tag_travelnote` VALUES ('92', '29', '66');
INSERT INTO `wt_tag_travelnote` VALUES ('93', '1', '67');
INSERT INTO `wt_tag_travelnote` VALUES ('94', '30', '67');
INSERT INTO `wt_tag_travelnote` VALUES ('95', '1', '68');
INSERT INTO `wt_tag_travelnote` VALUES ('96', '31', '68');
INSERT INTO `wt_tag_travelnote` VALUES ('97', '1', '69');
INSERT INTO `wt_tag_travelnote` VALUES ('98', '32', '69');
INSERT INTO `wt_tag_travelnote` VALUES ('99', '1', '70');
INSERT INTO `wt_tag_travelnote` VALUES ('100', '33', '70');
INSERT INTO `wt_tag_travelnote` VALUES ('101', '3', '71');
INSERT INTO `wt_tag_travelnote` VALUES ('102', '34', '71');
INSERT INTO `wt_tag_travelnote` VALUES ('103', '35', '71');
INSERT INTO `wt_tag_travelnote` VALUES ('104', '1', '72');
INSERT INTO `wt_tag_travelnote` VALUES ('105', '31', '72');
INSERT INTO `wt_tag_travelnote` VALUES ('106', '2', '73');
INSERT INTO `wt_tag_travelnote` VALUES ('107', '1', '74');
INSERT INTO `wt_tag_travelnote` VALUES ('108', '36', '74');
INSERT INTO `wt_tag_travelnote` VALUES ('109', '1', '75');
INSERT INTO `wt_tag_travelnote` VALUES ('110', '1', '76');

-- ----------------------------
-- Table structure for `wt_topic`
-- ----------------------------
DROP TABLE IF EXISTS `wt_topic`;
CREATE TABLE `wt_topic` (
  `topic_id` int(11) NOT NULL AUTO_INCREMENT,
  `topic_name` varchar(100) DEFAULT NULL,
  `topic_description` varchar(300) DEFAULT NULL,
  `topictime` datetime DEFAULT NULL,
  `user_ip` char(15) DEFAULT NULL,
  `manager_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`topic_id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=gbk;

-- ----------------------------
-- Records of wt_topic
-- ----------------------------
INSERT INTO `wt_topic` VALUES ('1', '说说旅行中遇到的各种奇葩事', '走过繁华都市，怅然古镇街道，穿越自然奇景，漫步沙滩海边，奔走东街西巷，尝尽异地小吃，然而在旅途中等待我们的并不一定都是一路顺风的美好回忆，还有可能是令人手忙脚乱、哭笑不得的奇葩经历，人生总是充满了不可剔的一半，猝不及防的情节也许算不上美好，但日后回忆起来也许当时的尴尬难堪也会让人忍不住笑出声来，这大概就是旅途的珍贵吧????，', '2018-11-26 15:08:36', null, '1');
INSERT INTO `wt_topic` VALUES ('2', '你最近旅行的地方是哪里？', '总有些地方，让我们流连忘返，你最近旅行的地方是哪里？有哪些让你回味的景色呢？欢迎在留言区与我们分享你的故事。', '2018-12-28 11:03:14', null, '1');
INSERT INTO `wt_topic` VALUES ('3', '什么样的原因会让你想去一个地方旅行？', '什么样的原因会让你想去一个地方旅行？\r\n因为一句话？一本书？一部电影？一家餐厅？还是因为独特体验？都是什么原因让你踏上征途的。。', '2018-12-05 11:07:01', null, '3');
INSERT INTO `wt_topic` VALUES ('4', '你会提前多久制定旅行计划呢？', '春节后的第一个小长假终于要来啦！撒花~\r\n\r\n你的旅行计划做好了嘛？我五一的假期现在就计划好了！\r\n\r\n今天我们就来说一说，你是随心所欲走哪睡哪派，还是提前半年就开始挑酒店的模范生？', '2018-11-20 11:07:21', null, '3');
INSERT INTO `wt_topic` VALUES ('5', '说说下一次旅行，你准备去哪儿？', '清明节的假期马上就要到啦，劳动节和端午节也在向我们招手\r\n\r\n想去海岛放松一下，想去日本看看樱花，想去泰国逛吃逛吃...\r\n\r\n趁着假期，大家还不筹划一下旅行大业吗？\r\n\r\n今天就来说说，\r\n\r\n下一次旅行，你准备去哪儿？', '2018-12-27 11:07:08', null, '2');
INSERT INTO `wt_topic` VALUES ('6', ' 说说你旅行中最尴尬的事', '北京今天的气温已经高达38度，室外就像一个大型桑拿房。朋友来北京玩，制定了满满的计划，结果因为天气太热，在酒店躺了一天...\r\n\r\n\r\n\r\n今日话题，\r\n\r\n说说你旅行中最尴尬的事', '2018-11-23 11:07:14', null, '2');

-- ----------------------------
-- Table structure for `wt_travelnote`
-- ----------------------------
DROP TABLE IF EXISTS `wt_travelnote`;
CREATE TABLE `wt_travelnote` (
  `travel_id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(30) DEFAULT NULL,
  `publishtime` datetime DEFAULT NULL,
  `t_province` varchar(16) DEFAULT NULL,
  `t_city` varchar(40) DEFAULT NULL,
  `praisecount` int(11) DEFAULT NULL,
  `title` varchar(100) DEFAULT NULL,
  `content` varchar(5000) DEFAULT NULL,
  `topic_id` int(11) DEFAULT NULL,
  `is_long` tinyint(4) DEFAULT '0' COMMENT '文章长短（长文章：1，短文章：0）',
  `travel_status` enum('公开','仅自己可见','违禁','已删除') DEFAULT '公开',
  `commentcount` int(11) DEFAULT NULL,
  `travel_address` varchar(400) DEFAULT NULL,
  `reportcount` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`travel_id`)
) ENGINE=MyISAM AUTO_INCREMENT=77 DEFAULT CHARSET=gbk;

-- ----------------------------
-- Records of wt_travelnote
-- ----------------------------
INSERT INTO `wt_travelnote` VALUES ('21', '34567888@126.com', '2018-12-26 14:54:05', '河北省', '秦皇岛市', '12', '天下第一关', '山海关位于河北省秦皇岛市东部，天下第一关是明洪武十四年（1382）大将军徐达所建，有\"两京锁钥无双地，万里长城第一关\"之称，山海关城，周长约4公里，与长城相连，以城为关，城高14米，厚7米，有四座主要城门，多种防御建筑，是历史悠久的文化古城，是世界文化遗产——中国万里长城的形象代表之一。如今的山海关景区已经是世界文化遗产、全国重点文物保护单位，是众多旅游者向往的游览胜地。', '2', '1', '公开', '0', '河北省秦皇岛市山海关区东水关大街21', '0');
INSERT INTO `wt_travelnote` VALUES ('12', 'abcdefg@163.com', '2018-12-26 08:47:37', '河北省', '承德市', '10', '克什克腾旗-坝上草原-秋天的美', '金秋十月，坝上草原的秋景真的是不能再短了，从九月二十号开始，你就得背起行囊，赶赴坝上草原，领略那里短暂的秋，五颜六色，甚是好看，直到十月初的几天，一片金黄，不知道的还以为坝上即将涌入一大群淘金者，然而再过几天就是一片枯黄的景象了。幸运的话会在这黄金的几天里感受一年四季不同的变换。', null, '0', '公开', '0', '河北省承德市丰宁满族自治县', '0');
INSERT INTO `wt_travelnote` VALUES ('13', 'abcdefg@163.com', '2018-12-26 09:00:30', '河北省', '石家庄市', '20', '窑火千年耀神州', '磁州窑是中国古代北方最大的一个民窑体系，以生产白釉黑彩瓷器著称于世，尤以白地黑花（铁锈花）、刻划花、窑变黑釉最为著名。瓷器装饰黑白对比，强烈鲜明，图案十分醒目，刻、划、剔、填彩兼用，并且创造性地将中国绘画的技法，以图案的构成形式，巧妙而生动地绘制在瓷器上，具有引人入胜的艺术魅力，是我们老祖宗遗留下来的艺术瑰宝。游览冀南，肯定要来此一游。', '2', '1', '公开', '0', '河北省邯郸市峰峰矿区', '0');
INSERT INTO `wt_travelnote` VALUES ('14', 'abcdefg@163.com', '2018-12-26 09:09:35', '北京市', '北京市', '21', 'G7高速，最美的风光在路上', '正如歌中唱到的：这是一条神奇的天路。从北京五环到新疆乌鲁木齐，全长近3000公里，途经10种风光：草原、河流、森林、沙漠、戈壁、湖泊、冰川、高山、村庄和城市，连接北京、河北、山西、内蒙古、甘肃和新疆五省一市。天高地阔，一条玉带般的天路，从漫漫黄沙与荒芜戈壁中蜿蜒伸向天边，是目前世界上穿越沙漠最长的高速公路。', '2', '1', '公开', '0', '北京市北京市延庆区', '0');
INSERT INTO `wt_travelnote` VALUES ('15', 'abcdefg@163.com', '2018-12-26 09:26:02', '河北省', '保定市', '22', '野三坡拒马写生基地', '河北省保定市涞水县野三坡不仅有着明显区位优势明显，更有着优越的生态优势。野三坡与北京市门头沟区、房山区相接，与北京接壤110公里，距北京市中心90公里，距保定市中心75公里。太行山与燕山交界处，形成了野三坡独特的风景，区域内有国家5**景区世界地质公园，百里峡、鱼谷洞、龙门天关、白草畔、拒马河畔等分布其中。', '3', '1', '公开', '0', '河北省保定市涞水县', '0');
INSERT INTO `wt_travelnote` VALUES ('16', 'abcdefg@163.com', '2018-12-26 09:33:54', '河北省', '邢台市', '23', '周末滑雪去', '站在海拔1496米的山顶上，周围全是白色的积雪，穿上雪具，从山顶一滑到底，那心情真叫一个“倍爽儿”。天河山滑雪场覆盖着8万平方米的白雪，四周被万亩松林围绕，蓝天白云，放眼望去一片林海雪原的壮阔景象。在蓝天之下，白雪之上，追风逐雪舒展身体，驾驭滑板，体验速度与**！', null, '0', '公开', '0', '河北省邢台市邢台县', '0');
INSERT INTO `wt_travelnote` VALUES ('17', 'abcdefg@163.com', '2018-12-26 09:42:55', '河北省', '唐山市', '24', ' 温泉水滑洗凝脂，冬寒赐浴汤泉宫', '温泉养生效果良好，促进身体的血液循环，温泉水中天然的矿物质等还对肌肤还有舒缓的作用。说起泡温泉，定是冬季最好的养生选择，大雪之日驱车来到遵化汤泉宫，说起这里岁月悠悠 ，历史弥久，文化底蕴深厚，因泉水四季沸腾如汤，故名“汤泉”，有“京东第一泉”的美誉。它的胜誉更与陕西华清池，南京汤山温泉，北京小汤山温泉并称为中国著名四大温泉。', '1', '1', '公开', '0', '河北省唐山市遵化市', '0');
INSERT INTO `wt_travelnote` VALUES ('18', 'abcdefg@163.com', '2018-12-26 09:53:12', '河北省', '唐山市', '25', ' 冬季去月岛看海', '或许，每个人心中都有一片海，宽阔，包容，博爱，睿智……冬天的海会是什么色彩？冬天的海，会让你想到谁？夏日的海边是喧嚣的，人流摩肩擦踵，热闹而聒噪，而心中的那份静谧却远远的躲在大海深处的一角，会在人潮汹涌中有一种空落。或许，海的宁静才是你的渴望。于二十四节气大雪的这一天，我选择唐山的月岛，冬日风寒而疾劲，海面如铅华洗净之后的那份宁静蔚蓝，或许，此时的自己于寂寞处找到了缺口。', '3', '1', '公开', '0', '河北省唐山市乐亭县', '0');
INSERT INTO `wt_travelnote` VALUES ('19', 'abcdefg@163.com', '2018-12-26 09:58:30', '河北省', '唐山市', '26', '来这里都是敢吃河豚的人', '唐山曹妃甸河豚小镇依托独特的河豚鱼、东方虾而闻名于世。现在又以此为切入点，打造吃渔家饭、住渔家屋、赏渔家景，购渔家物、享渔家乐的旅游小镇。即便是北方的严冬，这里的乡村动物园、河豚文创作品展、渔家小院、非遗面塑体验馆等仍旧吸引人们。当然冒死吃河豚，是最好的体验。', null, '0', '公开', '0', '河北省唐山市曹妃甸区', '0');
INSERT INTO `wt_travelnote` VALUES ('20', 'abcdefg@163.com', '2018-12-26 10:04:44', '河北省', '石家庄市', '27', '猫冬新去处', '在北京的后花园，在有着“京师锁钥”之称的密云，就正在用冰雪装裹着这个美好的冬季。而密云的邻居，河北省的承德，也不甘落后，也在用自己的热情温暖着这个冬季。当然，所有的冬季，和两个最著名的词汇都脱不开关系，一个词叫做“冰雪”，一个词叫做“温泉”。', '4', '0', '公开', '0', '河北省承德市双桥区广仁大街', '0');
INSERT INTO `wt_travelnote` VALUES ('22', '12345678@qq.com', '2018-12-26 15:29:18', '河北省', '秦皇岛市', '28', '老虎石海上公园', '这里是北戴河唯一一个收费的海滩，也是游客最多的浴场，7-8月份这里人很多，建议错开高峰。海滩上有几块礁石卧在海边，给这片沙滩点缀了一份天然。在这附近就是一条商业街，随处可见餐馆和卖东西的店铺，逛店铺的时候还可以看见穿比基尼的美女。', '4', '0', '公开', '0', '河北省秦皇岛市北戴河区中海滩路2402号', '0');
INSERT INTO `wt_travelnote` VALUES ('23', '12345678@qq.com', '2018-12-26 15:37:33', '河北省', '石家庄市', '29', '赵州桥,课文里不会告诉你的秘密', '赵州桥也叫安济桥，当地称大石桥，建于隋朝年间公元595年——605年， 距今已有1400多年的历史，是当今世界上现存最早、保存最完整的古代单孔敞肩石拱桥。小时候语文课本有一课就是“赵州桥”，朗朗读了这么多年，还是应该前来欣赏以了却心愿。如今赵州桥这里也是一个景区模样了，穿过一片绿地，右边是赵州桥的建造者-李春像。然后再向前便是赵州桥了。', '6', '1', '公开', '0', '河北省石家庄市赵县', '0');
INSERT INTO `wt_travelnote` VALUES ('24', '12345678@qq.com', '2018-12-26 15:48:29', '河北省', '石家庄市', '30', '梦回大观园,正定荣国府', '荣国府，位于河北省石家庄市正定县，是以明末清初文化为背景的仿古建筑群。1986年，由正定县人民政府投资350多万元兴建而成。荣国府主要景点有荣国府景区、宁荣街景区、曹雪芹纪念馆等景观组成。占地面积22000平方米，建筑面积4700平方米。是根据中国古典名著《红楼梦》中所描绘的“荣国府”设计和建造的。荣国府被评为国家AAA**旅游景区、基本建设先进工程、河北省定点旅游单位、正定县级重点文物保护单位。在荣国府取景的有电视剧《雪山飞狐》、《新包青天》、《郑板桥外传》、电影《侠之有道》等作品。', null, '1', '公开', '0', '河北省石家庄市正定县', '0');
INSERT INTO `wt_travelnote` VALUES ('25', '12345678@qq.com', '2018-12-26 15:53:34', '河北省', '石家庄市', '31', '石家庄海悦天地', '海洋公园里最独有特色的要数我们海洋馆了，石家庄海洋馆位于海悦天地负一层。是石家庄第一家集休闲、水上餐厅等多种项目的海洋馆，它在多方面居于领先，它拥有先进的维生系统，多达数千种鱼类及海洋生物入驻海悦天地海洋馆，海洋馆通过丰富的鱼类展示切身体验项目，美人鱼精彩表演，含有向游客介绍海洋生物知识，讲述海洋的故事，也向我们倡导环境保护，游客在游览中即可陶冶情操，又可以学习海洋的知识，让我们受益匪浅不枉此行。海洋馆这次要以最具时尚最具特色和新潮的姿态与大家见面。海洋馆有分为水族馆、淡水世界、鲟鱼馆、探索池、迷你吧、观景台、水母馆、珊瑚馆、童乐馆、海底隧道、海洋剧场、纪念品商店、4D影院、海洋餐厅等设备场所。', '1', '1', '公开', '0', '河北省石家庄市桥西区维明南大街87号', '0');
INSERT INTO `wt_travelnote` VALUES ('26', '12345678@qq.com', '2018-12-26 15:56:36', '河北省', '石家庄市', '32', '中国三大悬空寺之一，苍岩山', '苍岩山景观丰富多彩。群峰巍峨，怪石嶙峋，深涧幽谷，古树名木，清泉碧湖，构成了奇特、幽静、秀丽的自然景观。千年古刹福庆寺以悠久的历史和卓越的建筑艺术构成奇异壮观的人文之美，使之享有“五岳奇秀揽一山，太行群峰唯苍岩”之美誉。福庆寺建于1400年前的隋代初期。据碑文记载，隋朝隋炀帝女儿南阳公主曾在此出家为尼，度过了62个春秋。山上主要建筑有书院、万仙堂、桥楼殿、大佛殿、藏经楼、公主祠、碑亭等。所有建筑依山就势，小巧玲珑，或建于断岩，或跨于险壁，斗拱飞檐，构造宏丽，云蒸霞蔚，颇为壮观。', null, '1', '公开', '0', '河北省石家庄市井陉县', '0');
INSERT INTO `wt_travelnote` VALUES ('27', '12345678@qq.com', '2018-12-26 16:01:42', '河北省', '保定市', '33', '狼牙山五壮士', '狼牙山五勇士之壮举，名闻海内外，为国家森林公园和爱国主义教育基地，国家红色旅游热线景区。缅怀先烈，铭记历史，爱我中华，狼牙山风景区决定每年9月25日狼牙山五勇士陈列馆（马宝玉、葛振林、宋学义、胡德林、胡福才）跳崖纪念日当天免费对游客开放。“巍巍燕山高，潇潇易水寒。英雄五壮士，威震狼牙山。”1941年9月25日五勇士为了掩护部队撤离他们面对步步逼近的日伪军，宁死不屈，毁掉枪支，义无反顾，纵身跳下数十丈深的悬崖。', '5', '1', '公开', '0', '河北省保定市易县', '0');
INSERT INTO `wt_travelnote` VALUES ('28', '12345678@qq.com', '2018-12-26 16:05:48', '河北省', '石家庄市', '34', '河北天然温泉——温塘白鹿温泉', '白鹿温泉采用温塘镇历史悠久的地下温泉水，常年恒温70°，泉水富含三十多种有益于人体健康的矿物质微量元素，属于保健型高温氡泉，水质滑润、养生美颜、理疗身心，对风湿病、关节炎等多种疾病具有良好的辅助疗效。据史书记载，汉武帝曾御封此泉为“宝泉圣水”。', null, '0', '公开', '0', '河北省石家庄市平山县', '0');
INSERT INTO `wt_travelnote` VALUES ('29', '12345678@qq.com', '2018-12-26 16:11:23', '河北省', '石家庄市', '35', '20年地道沧州火锅鸡,从南二环排队到北二环!', '沧州火锅鸡是一道色香味俱全的传统名菜，属于冀菜系。此菜起源于河北省沧州市。以菜鸡，番茄，豆瓣酱，大蒜，大料，辣椒为料制作而成。火锅上的鸡 为主要代表，味道麻辣鲜香，食用时配以陈醋蒜泥麻酱等辅料，味香浓郁，回味无比。', null, '0', '公开', '0', '河北省石家庄市裕华区富强东街127号', '0');
INSERT INTO `wt_travelnote` VALUES ('30', '12345678@qq.com', '2018-12-26 16:17:53', '河北省', '沧州市', '36', '保定驴肉火烧与河间驴肉火烧,你更喜欢哪一个?', '驴肉火烧是河北知名美食，但是驴肉火烧也分为两派，其中最著名的则是河间驴肉火烧与保定驴肉火烧；河北驴肉火烧不仅辐射了华北地区的街头巷尾，在北京于店铺数量上打败了煎饼、包子、肉夹馍；还频频亮相于各大电影、相声，得到了冯巩、郭德纲、于谦等一众大咖拥护。保定驴火也好，河间驴火也好，清晨天微亮，多少河北人的一天是从被一个驴火点燃的。不管你是哪派粉丝，在咬下酥脆金黄的火烧和鲜美嫩红的驴肉的那一刻，几公升的期待和满足都燃烧起来了。渤海驴，太行驴，都是华北好驴。虽说驴不如马尊贵，也比不上骡的脚力，但在古代，驴始终承担着代步运输的责任。吃一顿驴肉，相当于吃掉了一款三流车的车门。', '6', '1', '公开', '0', '河北省沧州市河间市', '0');
INSERT INTO `wt_travelnote` VALUES ('32', '12345678@qq.com', '2018-12-26 16:25:40', '河北省', '廊坊市', '37', '霸州美食“素冒”', '霸州人都知道素冒，也常喝素冒汤，素冒汤要属陈记小吃正宗了。吃到嘴里香喷喷，喝一口汤有点酸，辣酥酥，绝对是浑身冒汗。素冒汤吃过的人都知道，和酸辣汤几乎一个口味，唯美醇厚连吃三碗都不够！', '5', '0', '公开', '0', '河北省廊坊市霸州市草桥路', '0');
INSERT INTO `wt_travelnote` VALUES ('34', '12345678@qq.com', '2018-12-26 17:39:31', '广西壮族自治区', '北海市', '38', '北海北', '侨港海滩是我国南方的滨海旅游胜地，位于北海市银海区侨港镇港口路南端，毗邻“天下第一滩”——北海银滩。侨港海滩与北海银滩并列于北海电白寮港港口的两侧，东起电白寮港。侨港海滩滩面宽广绵长，平均坡度约为0.05，砂型细腻柔软，海水温和洁净，近海域中无鲨鱼，空气含负离子极高。 这里的气候条件为**带海洋性季风气候，风光旖旎，景色怡人。沙滩由高品位的石英砂堆积而成，砂细而软。虽然沙质较银滩稍暗，但亮点依然；譬如，映着阳光，银光点点，若隐若现，宛如一首朦胧的抒情诗。 假期第二天，我想除了吃没有什么能比的上大海和沙滩更能让小家伙动容的了吧！北海老街——珠海路是一条有近二百年历史的老街，始建于1821年，初建时称为升平街，只有200米长，4米宽。随着各历史时期的不断发展，现已成为长1.44公里，宽9米，沿街全是中西合璧骑楼式建筑的商业老街。这些建筑大多为二至三层，主要受19世纪末叶英、法、德等国在我市建造的领事馆等西方卷柱式建筑的影响，临街两边墙面的窗顶多为卷拱结构，卷拱外沿及窗柱顶端都有雕饰线，线条流畅、工艺精美。临街墙面部不同式样的装饰和浮雕形成了南北两组空中雕塑长廊。这些建筑临街的骑楼部分，既是道路向两侧的扩展又是铺面向外部的延伸，人们行走在骑楼下，既可遮风挡雨又可躲避烈日；骑楼的方形柱子粗重厚大，颇有古罗马建筑的风格。老街西头的港式烧腊老店，来北海每次必去吃的店之一，价格实惠，味道正宗。但过年时候来就未必有口福了，因为老板一家要回香港过年，正月十五之后才回来。北部湾一号，是位于广西北海市的西北部的艺术建筑群，是北海的地标性建筑。它的独特之处就是把桂林山水的外形搬到了北海，取意“山水城市”，意在将自然中的山水意境引入城市，在城市中造就山水的意境。北部湾1号项目位于\"广西海景第一路\"北海海景大道南侧，北临海景大道、南至茶亭路、东西在湖北路与上海路。', null, '1', '公开', '0', '广西壮族自治区北海市海城区和平路108号', '0');
INSERT INTO `wt_travelnote` VALUES ('35', '12345678@qq.com', '2018-12-26 17:41:17', '四川省', '成都市', '39', '成都成都', '宽窄巷子 】好容易两个人都有了一个可以在忙碌的工作中得以喘息的周末，那就一起出去走走吧，好像很久没有这样牵着手漫无目的的浪费时光了。 宽窄巷子人潮涌动，看来不怕晒得并不止我们。汗渍濡湿的后背黏腻的难受，东广场上西岭雪山做着“遇见最美的爱情，去西岭看繁花似锦”的高山花卉节活动。想着反正这个周末只想消磨时间，那就看看高山上的春天吧，就当是避避暑了。其实去哪儿并不重要，重要的是和谁一起去。 听说报春花的花语还是初恋和希望，正适合你我。西岭雪山风景区 】山中何所有，岭上多白云。 外面紫外线正烈，西岭雪山却好像被遗漏了，晴天还是晴天，但是郎朗碧空如洗，白云自在悠闲，而且温度和煦的刚刚好，和城里的闷暑不同。绝佳的天气正适配上好的心情，整个人算是真正放松下来，于是撒丫子的顺着公路一路狂奔，然后我知道你一定会在前面接住我。带着冲力的拥抱将两个人都撞出原地好远，但是却让人莫名的心情很好，你揉揉我撞到的额头宠溺的笑，疼不疼？ 我仰起脸傻呵呵的摇头说，不疼，你空出一只手来刮刮我的鼻头，说，傻瓜。 一路跑跑停停，直到整条公路都被印上我们的足迹和笑语。 山中何所有，岭上多白云。只可自怡悦，不堪持赠君。站在山顶看着这些悬挂的云朵，悠悠然，便第一时间想起这些诗句。 我们并肩站着，突然谁也没有言语，只是嘴角微微扬起，这样的美景实在无需言语。我歪着头靠过去，你默契的搂住我的肩，突然希望时间就这样瞬间老下去。西岭雪山滑雪场 】浮云吹作雪，世味煮成茶。 心情好的时候最想唱歌，情歌我只唱周杰伦！打开手机音乐播放，就听爱的飞行日记吧，因为这首歌最让人触动，无需多想一定是因为你。 你唱歌给我听吧，我要听周杰伦！ 一路上晃晃悠悠，絮絮的听着他唱着JAY，我会故意的打岔，引得他跑调，然后他说，你以后不要唱歌了，你没有这个天赋。哈哈哈，傻大狗子，我故意的你知道不，我也能把杰伦唱的娓娓道来，但是只要你会唱就好了，你负主责我就是来捣乱的。 他说冬天的时候我们再来一次雪山吧，看雪，你最喜欢下雪了。我跳着说好啊好啊，我们还可以堆雪人，我要扔好多雪球。说着我又跳到他身上，大狗子，你怎么这么好。他抱着像个树袋熊似的我往山顶挪，说，我不对你好对谁好啊。我把头闷进他胸口，将想说的情话都悄悄告诉了心跳。 远山的轮廓在他眼中倒映，不知道是这雪山太美还是他眼睛太深沉，反正这双眼睛看着就叫人沉沦。突然想起抖音上说过这样一句话，你的眼睛很美，藏着山川湖泊，但是我的更美，因为眼睛里有你！西岭雪山风景区 】我见青山多妩媚，料青山见我应如是。 山风吹起我的长发，我想起一句话：我见青山多妩媚，料青山见我应如是。 “你说对不对？” “自恋狂” 哈哈哈，料青山见我肯定应如是，哼！ 这时候突然不想闹腾了，这山叫人感觉沉静。 “问你个问题啊，你是从什么时候开始喜欢我的啊” “哎呀，你都问了好多次了，我不是说过了吗” “那你再说一次嘛” “什么时候，我忘了，我只是看着这个傻姑娘，在想，我不能让她去祸害别人啊，我不入地狱谁入地狱” “我·······” 好吧，无论怎样，知道你很喜欢我，就够了，那就原谅你的用词不精准吧。 眼前的美景不适合被辜负，所有美好的事物都不应该被辜负，比如说你，比如说我。望你珍摄，吻你万千，情长纸短，还吻你万千。', null, '1', '公开', '0', '四川省成都市锦江区红星路4段-88号-附1号', '0');
INSERT INTO `wt_travelnote` VALUES ('36', '12345678@qq.com', '2018-12-26 17:44:05', '广西壮族自治区', '桂林市', '40', '桂林山水甲天下', '遇龙河 桂林山水甲天下，阳朔堪称甲桂林 。群峰倒影山浮水，无山无水不入神。 到过桂林才能见识到山水之甲，来过阳朔才能感受到 桂林 之精华。 三天两夜，我穿行在烟雨中，看过那山、那桥、那水、那穿过竹林的船筏、那迎来客往的旅人，仿佛经历了一场梦，梦里轻雾缭绕，无尘无埃，只余悠然漫行的美景，伴着时光在碧水青山中，随着风雨缓缓流淌…… 我牵着孩子的手，在清晨细雨蒙蒙的遇龙河旧县大桥望过云雾，见过小桥流水……阳朔大桥 我站在 阳朔 大桥看水上客船来来往往，不知道那站在船头的人，是归来亦或是刚刚出发……我在相公山找到最美的阳朔 ，那里的山风带着张扬的清香，那里有着最美的漓江之水，最美的日出日落和烟雨……我在500多年的 富里 古桥回望这艳了浮生，惊了人世的往事……我在兴坪寻找拍摄20元人民币的最佳角度，那里有老翁披着斗笠，撒下金色的鱼网，仿佛兜着他几十年的人生，一挥而过…… 阳朔 ，我来了，正如我留恋的回忆，在百转千回的梦里，始终忘不了那烟雨蒙蒙的江水，回味又回味，仿佛并没有离开过一样。', null, '1', '公开', '0', '广西壮族自治区桂林市临桂区人民路220号', '0');
INSERT INTO `wt_travelnote` VALUES ('37', '12345678@qq.com', '2018-12-26 17:46:20', '浙江省', '杭州市', '41', '杭州我来了！', '杭州凯悦酒店 由于宝宝没满两岁还是选择了高铁出行，5个小时有些辛苦，建议能坐飞机还是坐飞机吧（2岁以内婴儿除外）。 下了高铁千辛万苦找到了首汽约车（杭州东站真的好大，抱着娃快走废了），到了酒店附近发现交通管制司机让我们自己走过去，还好坚持让司机开到了酒店门口，不然推着婴儿车和一个32寸行李箱，抱着20多斤的娃娃，那个画面太美无法想象。。 酒店紧挨着西湖，估计出了酒店走个100米就可以到湖岸了，入住办理的很顺利，就是给我们的房间离电梯太远了！！下了电梯要走200米才能走到房间，抱着孩子走起来有些心累…… 4点到的酒店，本来想在酒店的湖滨28用餐，被告知订位需要到8点才有空位就放弃了，不过热心的前台人员帮忙问了第二天中午的订位情况，具体的用餐情况后续会介绍。 酒店房间相对来说不是很大，之前入住的青岛凯悦、上海君悦都要宽敞很多，洗手间的台面除了酒店基本的盥洗用品摆一些自己带的护肤品之类的都没有什么空间了。 酒吧台的空间也不富裕，免费的只有袋装冲剂的饮品，没有咖啡机和咖啡胶囊。床头是软包的，小孩子碰一下也不要紧，这点值得表扬。 早餐是在1楼的咖啡厅，取餐区域基本是o型设计，蛮方便的，味道还可以吧，平均值的样子，有儿童活动区域，但是设施需要换一换了，有只木马的扶手都没了。 由于带着宝宝旅行所以只去了酒店的餐厅和房间，游泳池健身房之类的设施没有去就不点评了。 知味观(湖滨总店) 酒店附近找了这家店，看起来像是老字号的样子就进去试了一下，后来发现知味观还真是家老字号，性价比还可以吧，上菜速度蛮快的，但是人手明显有些不足，自己去拿的菜单以及找服务生过来点菜的。菜的味道还可以，宋嫂鱼羹蛮好喝的，拌笋干也好吃，东坡肉感觉有些柴也没有入口即化的感觉，蟹黄汤包真的不行，腥气蛮大的，后来伴手礼买了真空包装的熏鱼东坡肉之类的，没想到味道意外的不错，可以入手！ 西湖 吃完晚饭溜达到了西湖，人真的太多了！擦肩接踵的，外加上宝宝一直要求抱抱走到大华饭店附近就往酒店走了。 到酒店门口发现了极度密集的人群，一脸懵逼的我们突然听到了交响乐的声音，原来是有音乐喷泉，但是真的看不到啊……也不知道都快站到酒店门口的人们是怎么想的…… 所以可以定湖景房，这样就能看到音乐喷泉了，如果你很喜欢喷泉的话。湖滨28餐厅 看推荐说这家餐厅很值得一去，外加我有凯悦美食汇的卡就选择了这里，总体来说还是可以的。 东坡肉可能为了造型味道差了一些，肥肉不够软糯。 糯米藕很好吃值得一试。 西湖醋鱼真的还好，选的贵的那种鱼，因为草鱼卖没了，鱼的肉质很好，调味怎么说呢……酸甜口外加姜味，倒是老少咸宜……只不过我个人不是很喜欢。 蟹黄汤包真的满好吃，很鲜美，比知味观的强很多。 蟹粉豆腐强调了少盐还是有点咸，毕竟要给宝宝吃，稍微重口了。 餐桌真的太小了！！到后来菜都快摆到我们骨碟上了！！这个真的给用餐体验大打折扣！杭州小河直街 晚上六点左右到的，当时天色已暗，但是配上河面及周围建筑的灯光反而更有风情，有一些手工艺品的小店也很有特色，价格也还可以，普遍在100-200左右吧，这个地方文艺青年一定要来，河风配上古建筑外加幽暗的灯光，你懂的！西溪湿地公园 买票的时候最好买带船票的那种，在船上观赏一下水景还是不错的，沿岸看到了很多柿子树，下了船买了火柿，真的超甜！也不涩！ 公园里的餐馆真的不能好评，备注了清淡还是超级咸，但是你不吃就只能饿着。。 公园里面有花海也有一些木质的滑梯秋千之类的，小朋友蛮喜欢玩的，我家宝宝对泡泡有蜜汁执着，买了两个泡泡玩具跟她在草坪上玩耍她玩的超开心。 公园的路标有些不清晰，主要靠猜。。迷迷瞪瞪的走到了徽式建筑群还真的是充满了徽州特色。（为什么杭州要弄个徽式建筑谁来解答一下？） 有一个水岸中的亭子，里面有演员在唱昆曲，貌似是贵妃醉酒，这个跟地域有关，原因就请各位去一探究竟吧。1921湖景餐厅 这里的杭帮菜应该说是相当地道了，相对于湖滨28更推荐这家，服务也不比那家差，性价比也更高。 点了一堆菜还有一瓶黄酒花了800块，龙井虾仁和丝光汤包一定要趁热吃！凉了真的会在口感上大打折扣。 凉菜都很好吃。片川儿一大碗着实是吓到我了，也太大了吧！！ 年糕炒蟹真的不错吃，螃蟹肉质很好。放凉吃也好吃。 餐厅的小露台可以看到杭州的街景，晚上看还是不错的。', null, '1', '公开', '0', '浙江省杭州市江干区', '0');
INSERT INTO `wt_travelnote` VALUES ('38', '12345678@qq.com', '2018-12-26 17:47:56', '浙江省', '杭州市', '44', '“浙”里', '▇ 俯瞰“浙”里，“淳”朴的下姜村 建村800余年的下姜村，是浙江的“美丽乡村”。历来有“千岛湖水洁如玉·下姜民风似金”的美誉。过去出名，是因为“穷”——有这样一句民谣：“土墙房、半年粮，有女不嫁下姜郎。”而现在的下姜村，依然有名：村名前常被人们冠以“最美”“最富”这样的形容词。 7100余亩国家级生态公益林，郁郁葱葱的覆盖着山谷、平原两侧，覆盖率达97%——中国民宿摇篮莫干山也只有90%，是千岛湖畔的天然氧吧。大湾山坡之上，便是民居、民宿——一幅家家户户山景房的模样。 1.廊桥、竹海、茶园、白墙瓦黛、青山绿水——诗画江南·山水浙江最典型 2.村中四大主要经济来源：旅游、茶叶、蚕桑、中药材——从航拍中看得出来 3.村里有健身场地、村委会、ATM机、医务室、旅游服务中心、餐馆、超市便利店等。▇ 置身“浙”里，醉人的杭州春日 万紫千红总是春，诗画江南多烟雨。在春季，下姜村偶有氤氲的阴雨天气，但山雾缭绕下，越显得诗意非常。那份静谧娇柔在云雾里，丝丝生机蓬勃在岩石的青苔里，那一刻舒适踏青的惬意，弥漫在深氧之中。 巧遇杭州市旅游委与淳安各级政府、千岛湖旅游度假区在这启动“四季休闲·美丽杭州”活动，红绸带、五彩旗，把水墨山村装扮的和过年一样，格外热闹。 曾经到达下姜村，要走60公里的“搓板路”，现在平坦的柏油路直达村中任意一处；翻天覆地的日新月异，让这些土生土长的下姜人，感触颇深。 如今“下姜逐梦”已成为千岛湖新十景之一，这里有个好听的名字——梦开始的地方。 廊桥，是浙南特有的一种桥梁建造工艺，但在这也有一座。如今不再是两岸村民生活的设施，更是游客体验美丽下姜最印象深刻的建筑。▇ 偶遇“浙”里，新婚礼仪在河中办 在河道东北处观景小道下，设有临水栈台；正对着河道中间的一艘船型舞台~原来是新人在这举办婚礼仪式。这倒是让我们大开眼界，下姜村的风俗原来这么奇特！在这追本溯源传统文化和大谈文化自信的时代，却是能保留和传承这些传统风俗，尤为显得重要。 新人站在乌篷船船头，船夫从拱桥的东侧滑行而来，两侧还有乘着竹筏的伴娘与司仪~ 行礼过程中，新人夫妇穿戴都极具传统风格，礼仪老师在船舱内指导~ 桥面上的游客及村民驻足观望，这确实让人欣喜，听过教堂、酒店、家中办婚礼的，没听说过在河里船上办的。而且是如此淳朴传统的方式——泛舟。天公虽不作美，但却印证一句老话——天要下雨，娘要嫁人。良辰吉日，任何一切不可阻挡。美景之下，遇见喜结良缘，令众人羡煞不已。▇ 食宿“浙”里，听竹海雨声、观云雾缭绕 中午时分，循着河岸景观慢跑道，在葡萄大观园中，品尝下降特色风味美食。有湖鱼、河虾、四季豆、茄子、红烧肉，还有笋干煲~令人胃口大开，垂涎欲滴。 下姜村有一大半村面积是用于种植蔬果的大棚，当阳春三月草莓上市之际，这里是人头攒动，汽车堵得水泄不通；临了季末，还是有游客想体验一下在青山绿水的仙境般山里采摘~25元一盒，却是比一般的贵，但是物超所值，这里的草莓品种很棒，还有“白草莓” 图中的领导访问点——神秘传奇人物，不用多说，大家自己感受一下那时的场面吧~美丽乡村里有的设施基本是国家旅游局号召乡村游、全域旅游所示范的，比如说和民宿一样的公共厕所，不逊色于莫干山民宿的精品民宿。▇ 栖舍“浙”里，雨后天晴 旅行途中，最喜欢当地地道的民宿客栈，尤其以当地人驻留当地开设的民宿，更具特色；而且能留在与城市闭塞的山村创业，那没有对生活和环境的热忱，远远不足于支撑内心的选择。村中700多户人家，却有23家民宿，约350间客房。对于一个小山村而言，足具规模了；其间栖舍民宿与久久民宿是精品级别。 走南闯北，住过无数民宿，可以说对民宿的评价是最为挑剔的；但栖舍满足了我上一条选择的理由；其次就是空间与房间。一楼是茶座区，以书墙作为隔断，一分为二；满足人少与人多的休憩茶谈需求。前台与酒吧台合二为一；北欧风的家具、日系风格的书吧角落。看得出来老板娘是一个文艺书女，爱茶也爱酒。二楼以上是客房，每层3间，面山与竹海或面河与村落；客房面积、布草与设施、采光与空气、赠品是4个考虑的方面。原木色简约的装饰、白墙灰砖，很素雅自然； 其他： 1）房内中央空调、实木书桌&电视柜、隐藏式衣柜、实木地板一切都很自然风，配以墙壁上点缀的水墨画，很中式，很诗意。 2）正山小种--福建武夷山市的红茶，世界上最早的红茶，亦称红茶鼻祖。西湖龙井，杭州西湖畔龙井村出产绿茶，辅以源自千岛湖水源的农夫山泉斟泡，果然很“杭州”。 3）源自英国品牌LEOXAO的品牌洗护用品，上一次见，是在苏州太湖畔，一个单房价800的厢式酒店中，但栖舍却不需要这么贵，所以，物超所值 春游季，择一处小众山野乡村，饱食农家特色，夜宿竹海茶场。来到淳安千岛湖下姜村，就对了！诗画江南·醉美春日！关于淳安县下姜村 诗画江南·山水浙江；杭州之大，堪比首都，足不出杭，饱览山野、湖滨、海湾；所辖1市2县中，有浙江第一大县--淳安；淳安以“天下第一秀水”千岛湖名扬国内，拥有全球独一无二的“1078个湖岛”资源，历来是江浙沪皖旅游度假的不二选择。而在浙西天府、千岛湖畔，有这一个美丽山村——下姜村，更是近年来的网红热门地。不仅因为美丽的山村风貌和淳朴地道的农村味道，也不是千岛湖十景之“下姜逐梦”，更还有它发展里程碑上的特殊性——见图便知。 ', '6', '1', '公开', '0', '浙江省杭州市江干区', '0');
INSERT INTO `wt_travelnote` VALUES ('39', '12345678@qq.com', '2018-12-26 17:49:28', '浙江省', '杭州市', '43', '浙西小天赋', '█ 六潜湖底，“文渊狮城”再现人间 千岛湖，前身为1959年中国当时最大的水利枢纽工程--新安江水库。建设之初，淳安县、遂安县两县合并，近30万人为此迁居，1000个村庄随之沉入碧波万顷的千岛湖水下。机缘巧合，42年后的2001年，随着千岛湖的旅游开发，6次下水探索才终为外人所知。遂安古城建于公元208年，至今1800年历史；后迁界，背依五狮山，而得名“狮城”，乃浙西重镇。狮城城内多名胜古迹，有明清时期古塔、牌坊及岳庙、城隍庙、忠烈桥、五狮书院等古建筑。 它是国内首个非遗生活体验基地,将再现水下千年狮城的原生景象。█ 五城门、六街巷、七牌坊，水陆两隔重述“狮城”前世今生 古狮城历来繁华，素有“浙西小天赋”之称，通古融今，千年文化流光溢彩，是千岛湖畔“度假、休闲、旅居、商务、餐娱”的绝佳体验选择。狮城有五座城门，即东门（兴文门）、南门（向明门）、小西门（康阜门）、大西门（靖武门）、北门（拱极门），各门之上都建有城楼。城楼顶覆盖巨块石板，城墙西北角及北半段循山而筑，地势高峻。景区2016年6月开业。景点入口为西南处。 牌坊，又称牌楼，是中华特色建筑文化之一。是封建社会为表彰功勋、科第、德政以及忠孝节义所立的建筑物。现在常见宫观寺庙以牌坊作为山门，还有的是用来标明地名的。因此可以印证1400多年历史的文渊狮城，当时无论社会生活、人才科考，还是民生治安、民风德治都是非常优异。█ 传统新安，今日文渊 作为国内首个非遗生活体验基地，文渊狮城以活化打造为主要手法，将传统手工艺、非遗项目、民风民俗等文化类产品生活化、场景化：人力黄包车：那个年代的“快”车；感受一下穿梭在街镇路上的敞篷兜风感觉；手工编制的箩、筐、篮、斗；狮城美食，一个汇集淳安、遂安两座古城千百年的地方小吃；酒肆堆垒的场景--古时酒馆场景；狮城临湖，因此渔人也是旧时的一个工种；茶、酒是古时文人墨客、乡民妇人最为受欢迎的饮品，除了西湖龙井以外，这儿的酒馆也很有特色。█ 春游文渊，舒适惬意 此外还通过全景VR体验、**生活演艺秀、国术表演等一系列活动让游客身临其境体验淳安传统的人文风俗——在景点街道中心处，有一阁楼--醒狮阁，是每天演艺人员演出的地方，游客露天用餐时，可以欣赏传统杂技顶缸、双人技巧表演、传统骑马舞狮、魔术等节目。不仅可以体验舌尖上的千岛湖--千岛湖鱼头和文渊狮城“十八碗”以外，还可以在视觉上感受震撼，阳光明媚下，徽派场景中，好吃，好看，好玩。█ 文渊狮城，“徽”常有趣 作为国内首个非遗生活体验基地，文渊狮城以活化打造为主要手法，将传统手工艺、非遗项目、民风民俗等文化类产品生活化、场景化。 淳安地处浙江与安徽交界地带，因此在千古年前，两地文化交流非常深。作为中华文化上一脉奇葩--徽派，也通过建筑、美食、方言、习俗等方式进入淳安。所以想看“徽派建筑”，在文渊狮城也可以！烽火墙、飞檐翘角、白墙瓦黛等等。 █ “孔子后第一人”--宋代理学家朱熹古诗还原 瀛山书院位于浙江淳安县，朱熹云游讲学到这，留下了这首著名的《吟方塘》——“半亩方塘一鉴开，天光云影共徘徊。问渠哪得清如许，为有源头活水来。”', null, '1', '公开', '0', '浙江省杭州市江干区', '0');
INSERT INTO `wt_travelnote` VALUES ('40', '12345678@qq.com', '2018-12-26 17:51:06', '内蒙古自治区', '呼伦贝尔市', '46', '美丽的呼伦贝尔', '莫日格勒河 海拉尔——莫日格勒河——穿越草原深处——恩和 迎着草原新一天的阳光，首先穿越草原深处前往老舍笔下的天下第一曲水——莫日格勒河，莫日格勒河从东北方的大兴安岭深处向注入明镜般的呼和诺尔湖，成群的牛羊点点绽放，点缀在牧野间，仿佛一幅油画。这里有丰富蒙元文化，这里是电影《寻龙诀》《爸爸去哪儿》的取景地。可参与千百年来草原上依然延续的富有神秘色彩的祭祀活动——祭祀敖包。随后，将统一前往蒙古族发祥地--额尔古纳市，途中景色美不胜收，**的油菜花和成群的牛羊，构成了一路最美的景色，一路走走停停（途中会有些颠簸），中午抵达额尔古纳市或者哈达图镇吃饭，建议去有当地特色的饭店吃饭既经济又实惠！吃饱喝足后，随后前往最美最安静的俄罗斯后裔民俗村——恩和俄罗斯民族乡，途经根河桥、野花拍摄基地、三河、白桦林、上户林、下户林等地，傍晚抵达恩和，恩和是一个历史遗留的俄罗斯民族乡，这里的当地人大多都是华俄后裔，处处可见长着一副俄罗斯人的面孔却说着一口流利的东北话的俄罗斯族人，在当地可以品尝俄罗斯特色美食，列巴、蓝莓酱、各种俄餐是不可少的，让我们一起尽情疯吧，晚宿恩和俄罗斯\"木刻楞\"房屋。额尔古纳河恩河——白桦林——哈乌尔河景区——边防公路——室韦——临江 早餐后出发前往哈乌尔河景区，途中路过大面积的白桦林下车观赏拍照，之所以去哈乌尔河景区因里面有一些野生动物值得让孩子们观赏，如狼、熊、野猪、梅花鹿等...哈乌尔河景区核心面积3平方公里，景区设有展示区、体验区及观赏区，进入景区内立体式的森林文化展厅，可观赏到生物、形象的动植物标本和林业人生活生产用品，犹如置身于神秘的原始森林之中，在体验区内，大小型原始捕猎工具共计11种，并配有图片说明和文字介绍，设有秋千、跷跷板、弹弓、射箭等娱乐项目，原始狩猎采伐与娱乐相结合，这里的原始气息会给您带来无限的乐趣。午餐返回恩河，餐后前往边防公路，这里有**的油菜花和麦田，随后进入七卡、八卡、九卡、水磨，一路欣赏中俄边境的壮丽景色。在保障行车安全的情况下随时停车拍照。我们之所以走边防公路，是为了让您看到最美的中俄边境线，感受着呼伦贝尔边陲城市的魅力，这里的美是妙不可言的。沿边境线一路前行进入与俄罗斯小镇奥洛契仅一河之隔的室韦镇。室韦在2005年被cctv评为\"中国十大魅力名镇\"之一，入选的理由是这里是蒙古族的发祥地，另一个是这里是我国屈指可数的俄罗斯民族乡。现保存有大小城遗址10余座，有较深的蒙古族寻根、祭拜、观光、考察等历史文化内涵和底蕴，傍晚上山观日落，晚入住蒙古包或临江屯。观篝火表演也可傍晚沿界河（额尔古纳河）漫步，静静的欣赏大自然赐予我们画一样的美景。放下一切，让心灵去度假。莫尔道嘎国家森林公园 临江——穿越大兴安岭林间小路——老鹰嘴——月牙泡——太平村——莫尔道嘎 清晨喜爱摄影的小伙伴可以在三点半就早早的起床，去山头等待日出，拍摄村庄晨雾，随后进行早餐，起得早的驴友可以小睡一会，之后驱车出发前往我们今天第一处自然景观——老鹰嘴，这是一坐落于悬崖边，经过大自然的巧夺天工，自然形成的一座类似于鹰嘴的石雕。当年的采伐工人进入林区作业，每座山都没有名字。工人经过这里时发现悬崖上的石头很像一只向天长啸的鹰嘴，后把这里命名为\"老鹰嘴\"，\"老鹰嘴\"的名字由此而生。这里也是电影【白鹿原】【麦田】【夜宴】的取景地，麦田，油菜地，森林，河流，应有尽有。驱车继续前行进入原始森深处月牙泡，沿着边境线进入太平村，游览原始的森林村庄。可下车步行，参观拍照留影。午餐可在太平村，接下来我们将到达莫尔道嘎镇。莫尔道嘎为蒙古语，意为\"上马出征\"。当年成吉思汗举兵出征，在莫尔道嘎的龙岩山上集结。出发时成吉思汗骑着他的战马举刀呐喊\"莫尔道嘎\"开始了他的扩疆历程。后人为纪念成吉思汗的丰功伟业，将这个小镇命名为\"莫尔道嘎\"。莫尔道嘎一个以林业为主的林区小镇，小镇坐落于大兴安岭的边缘平均海拔在830以上属高寒地区。为提倡国家的\"天然林环保工程\"现已停止采伐森林。这里盛产各种野果，在当地可以品尝到新鲜的野果，如野生蓝莓，高粱果｛野草莓｝，亚戈达{红豆｝，松树塔，蘑菇等。日落前攀登\"龙岩山\"，拍摄林海日落。满洲里国门 黑山头—边防公路—三十三湿地—胡列也吐—呼伦湖—国门--套娃广场 早餐后驱车前往边境口岸满洲里，一路都是草原风光和湿地景观，这条边防公路可以称之为呼伦贝尔最美的公路，随处一拍就可用作XP最优美的桌面。中途经过三十三湿地和胡列也吐可下车欣赏拍照，中午到扎赉诺尔矿区午餐，下午参观北方第一大湖——呼伦湖。感受如海洋一般平静清澈的湖水，这里就是养育呼伦贝尔草原人们的母亲湖，如果不想坐船游湖，我可以带大家走其它路观呼伦湖，又可以每人节省30元门票。之后驱车前往国内最大的边境国门，里面由红色国际秘密交通线遗址、火车头广场、战斗机广场、第五代新国门组成的景区，此景区门票80元/人。建议远观土豪随意！之后前往创造了世界吉尼斯纪录的套娃广场观看世界最大套娃。套娃广场是满洲里标志性旅游景区，广场集中体现了满洲里中、俄、蒙三国交界地域特色和三国风情交融的特点。很是壮观不过套娃广场2016年重新改扩建以后开始收取门票100元每人。边境口岸满洲里，有人说\"中国人到了满洲里就如同出了国，而外国人到了满洲里就如同回到了家\"，事实也确实如此，在满洲里漫步可以随处看见蓝眼睛白皮肤的俄罗斯人，所有的店铺都是用中俄蒙三国文字标识的，估计也只有在这里能看见这样的现象了。傍晚自由活动，可欣赏一下满洲里的夜景，也可以买一些小纪念品（完全自愿绝不强制购物），晚上夜宿满洲里。海拉尔国家森林公园 满洲里---猛犸象公园--博物馆--跨国湿地--海拉尔 早餐后，前往猛犸象公园，参观猛犸象遗址博物馆，馆内至今保存着猛犸象化石，之后参观跨国湿地，这里栖息很多鸟类，野鸭子，运气好的话还可以看到鸿雁，天鹅。之后一路驰骋在辽阔的大草原上前往海拉尔结束愉快的呼伦贝尔之旅送机或火车。', null, '1', '公开', '0', '内蒙古自治区呼伦贝尔市海拉尔区满洲里路59号', '0');
INSERT INTO `wt_travelnote` VALUES ('41', '12345678@qq.com', '2018-12-26 17:52:05', '河北省', '秦皇岛市', '45', '秦皇岛自驾旅行', '祖山风景区 五一小长假带孩子去秦皇岛自驾旅行了一趟，感觉甚是惬意，由于回京后工作太忙，一直没时间写游记，昨天翻手机照片，旅行乐趣历历在目，得空特来补上一篇游记，跟大家叨叨。 我一个秦皇岛本地朋友盛情邀请我们全家许多次，决定一家三口 29号晚上开车到秦皇岛，由于是出行高峰期，高速上还是有些堵，所以，到了已经很晚了。投宿在哥们儿家中，在路上孩子就已经睡着了，到了以后抓紧安顿孩子休息。哥们儿说第二天去爬祖山，说是本地人踏青好去处。 第二天，孩子早早的就跳起来了，兴奋的不得了。吃完早饭带好水果零食就出门了，朋友在美团上提前买了祖山的通票，说到那里换就可以了，很方便，而且反复的强调一定要让我们坐索道，说这个索道非常的棒，风景特别美，因为五一小长假可能游客比较多，让我们早些去排队。 从市里开车大概40分钟就到了，高德地图导航过去的，走的是祖山连接线，听说是新修的一条路，全**是畅通无阻，风景很美。赶上天气特别的给力，让我们全家都心情大好。 进入停车场以前，远远的便看到了一座高大气派的山门矗立在道路中间，游客非常多，就像到了古北水镇一样，我们9点半到的，已经开始排队等车位了。还好地方大，很快就找到了一个停车位。 祖山脚下的天女小镇非常漂亮，地处群山之中，有花园，有广场，有湖泊还有小吃一条街，跨过一段长长的木栈桥，通往电瓶车登车点。跨过木栈桥就是一个动物部落，有好多的小动物，骆驼、梅花鹿、羚羊，还有羊驼。媳妇带着孩子就在这边玩儿，我去售票广场换票。 小长假游客确实太多了，幸好售票窗口多，排起队来还是很快的，加上网购电子票，所以很快就搞定了。等我跟孩子在电瓶车登车点汇合时，孩子已经玩儿的满头大汗了。我的天啊，这还没爬山呢。我要了一份指引图，坐上电瓶车就正式开启了祖山之行。途中还路过了一片房车基地，感觉很有意思，下次一定要带孩子来体验一下。 祖山这个景区很大，中间换乘了两次车才到了这里的第一个景点，飞天谷，划重点：交通车票非常必要。一座巨大的岩石上刻着“画廊谷”三个红色的大字，孩子早已按耐不住，顺着台阶头也不回地冲了上去，人太多了，我们只能抓紧赶上去。 这条路被称为十里画廊，一路上我们顺山而行，溪水在我们脚下沿着大岩石潺潺而下。 路上经过一处凉亭，建在溪水上的岩石上，伸手感受了一下溪水，冰冷刺骨，我跟孩子说现在还没到夏天，夏天这水就不这么凉了，旁边本地游客告诉我们，夏天时溪水也这么凉，祖山是个避暑好地方，夏天值得再来玩，本地人也好热情好客。溪水中还有小蝌蚪，孩子特别开心。 上山的路还算是好走，石板台阶上到处都能看到石蚯，一种软体虫，孩子一边玩儿一边爬，似乎忘却了疲劳，反而我俩却累的上气不接下气。 大概爬了20分钟左右，终于到了半山腰的幽谷禅堂，这里有个小茶馆，我们一家三口在里面买了些冰镇黄瓜。工作人员说10分钟以内就要到达缆车的位置了，我先行一步前去侦察，看看排队情况，让她们娘俩在茶馆休息，吃点零食，毕竟快到中午了。 顺着山路很快就走到了缆车站，人确实不少，一边排队，一边看看缆车介绍。这个缆车是四快三慢，三个一组，一共八组，单程大概20分钟。排队的人很多，队伍长长的好几道弯，大概排了一个小时左右。工作人员全程都很耐心的维持着秩序，也在帮游客们解答问题，看着还是让人蛮欣慰的。 上了缆车后孩子兴奋的不停的四处观望，我们也可以歇歇脚，放松一会儿。从缆车上看祖山又是不一样的风景。绝壁幽谷，象形奇石，让人赞不绝口，听着溪水潺潺，闻着芳草花香，让我感觉到自己已是大自然的一部分。到了站，步行前往望海禅寺。 寺庙很大，里面有很多游客在跪拜烧香，红色的大殿里僧人们在诵经。参观了大概半个小时，我们就出来了。 在寺前坐巴士去北天门，司机师傅的水平那真是没得说。盘山路很陡，蜿蜒曲折好几个弯，而且每一个弯都很急。孩子第一次坐车走这么陡的盘山路，所以一直聚精会神的看着外面。我问他害怕么？他底气十足的回答我，一点也不害怕。窗外全是映山红，格外好看。 到了北天门又换乘了一辆巴士，因为后面都路更窄更险。终于到了天女峰脚下，据说天女峰是海拔1428米，是祖山山脉海拔最高的地方。我们担心孩子的体力和耐力正在犹豫时，孩子坚持要上去，最后我们尊重孩子的决定，一路互相鼓励上了山，路上游客们纷纷夸奖孩子的毅力，孩子听完以后也是干劲儿十足。毕竟孩子才三岁，所以中间有背了一段，但孩子几乎是自己走完了全程的三分之二，爬到了山顶，我们留了合影，记录下了这值得纪念的时刻，也算是完成了孩子一个小目标。 站在顶峰看着四周美丽的风景和满山遍野的映山红，真是不虚此行。 下山我们直接坐滑梯下来的，节省了不少体力。上了巴士开始返程，到了缆车站已经下午四点多了。 排队坐缆车下山的人太多了，按照刚才排队的经历，感觉还得再排一个多小时，山中温度下降得很快，我们没有带太厚的衣服，我怕孩子到时候扛不住了。排了大概半个多小时的时间，感觉队伍都没怎么动。开始有些焦急，天色也越来越暗了。正在我焦虑担忧的时候，祖山景区的工作人员派人从山下调来四辆大巴车，将外地赶时间返程或者体力不支的游客直接送到山下。我们毫不犹豫的上了大巴车，给祖山之行画上了完美都句号。 好了，实在写不动了，北戴河的旅程下次再写吧。', null, '1', '公开', '0', '河北省秦皇岛市青龙满族自治县', '0');
INSERT INTO `wt_travelnote` VALUES ('42', '12345678@qq.com', '2018-12-26 17:53:49', '河北省', '秦皇岛市', '78', '天然大氧吧祖山', '河北省秦皇岛市青龙县祖山 徜徉在祖山这座天然大氧吧里，心肺就像长时间干瘪的海绵，大口大口的呼吸，变得自由松软，顿觉身轻如燕。 祖山祥云常入梦 站在这块巨石上往下看，山谷中泉水淙淙，天气晴朗时还能看到云海。 途中遇见的老两口，年纪七十有余，在卧牛石上拍照，入了我的镜头，阿姨那一抹中国红成为了画中的点睛之笔，构成了色彩的强烈对比，烘托出了人与自然的和谐，是我此行最中意的画面，现场的感受更加立体，有凉爽的微风，有泉水的叮咚，有草木的芬芳，有老两口的喃喃，一切都那么美好。 一路醉心于山谷两岸的奇峰怪石，按着路旁的石碑提示发挥想象，旅程变得更加生动有趣，拾阶而上迎面出现一座牌坊，红绿相间镶嵌在这绿树成荫的山间，幽谷禅堂，一个天然石洞，里面有佛龛，洞中石壁上方有天然洞口，投射进来一束微弱的光，更显幽静。 每次都选择索道上山徒步下山，祖山的索道本身也很有意思，每三个车厢为一组，上山途中四快三慢，上行坡度也不一样，从索道上欣赏祖山，美景尽收眼底，两旁群峰错列，山势逶迤，植被茂密，是非常美好的体验。 全程大概20分钟，从画廊谷上山的疲劳在索道上可以得到很好的缓解。 下了索道下行一段就能到望海禅寺，望海禅寺前视野广阔，天气条件好时可观山观海，这个“海”也许是云海，也许是渤海，祖山的神奇就在于此，无论什么天气总会有不同的美景呈现，从来没让我失望过。 整个禅寺很大，三面群山环抱，从索道到禅寺到路上还未见到禅寺便已听到了禅寺里飘出来的大悲咒，弥漫在整个山谷中，非常震撼。在禅寺里走走，心灵得到了洗礼。 准备徒步下山，这样不太匆忙，体力刚好，祖山还有好多景点，如果想都走遍需要住上一天两天的。云海和佛光都需要有缘，所以我不会为了没看到奇景而沮丧。 下山的路上把刚才上山时忽略掉的身后的风景又欣赏了一遍，真是美不胜收。人在快乐中穿行，时间总是过得飞快。不知什么时候，我已下到了谷口，结束了愉快的行程。', null, '1', '公开', '0', '河北省秦皇岛市青龙满族自治县', '0');
INSERT INTO `wt_travelnote` VALUES ('43', '12345678@qq.com', '2018-12-26 17:55:03', '四川省', '甘孜藏族自治州', '48', '四川的“姑娘”', '四姑娘山 映秀—四姑娘山双桥沟—丹巴甲居 早上7点出发，从成都到四姑娘山大概需要4小时，在四姑娘山双桥沟游 玩3至4小时左右，再开车前往丹巴甲居藏寨。甲居藏寨 丹巴—八美草原—亚拉雪山（远观）—道孚—甘孜 今天玩的几个点有甲居藏寨 八美草原 道孚民居 甘孜县的甘孜寺。亚青寺 甘孜—亚青寺—新龙措卡湖—新龙 从甘孜至亚青寺需要2个半小时至3小时左右，重点在亚青寺，去新龙措卡湖，如措卡湖有住宿就安排在措卡湖景区，就不会再返回新龙县城。稻城三神山 新龙—理塘—海子山—白塔—稻城 今天重点就是从新龙至稻城路上的景点，比如一路的草原 海子山 石头公园 海子山等景色。亚丁风景区 稻城—傍河青杨林—贡嘎郎吉岭寺—亚丁景区门口—冲古寺—珍珠海—亚丁村—扎灌崩—洛绒牛场—牛奶海—五色海—洛绒牛场—冲古寺—稻城新都桥 稻城——理塘——雅江——新都桥—康定 今天就是从稻城返回，途中途过新都桥，可以在新都桥看到好看的风景，可以停车拍照的。泸定桥 康定—泸定桥—上里古镇—成都 今天的重点就是泸定桥和上里古镇，特别是上里古镇很有味道，可以自己细细的去品尝，中午可以选择在此用餐。', null, '1', '公开', '0', '四川省甘孜藏族自治州稻城县', '0');
INSERT INTO `wt_travelnote` VALUES ('44', '12345678@qq.com', '2018-12-26 17:57:05', '四川省', '成都市', '49', '一行四川', '黄龙名胜风景区 黄龙以彩池、雪山、峡谷、森林“四绝”著称于世，再加上滩流、古寺、民俗称为“七绝”。景区由黄龙沟、丹云峡、牟尼沟、雪宝鼎、雪山梁、红星岩，西沟等景区组成，主景区黄龙沟位于岷山主峰雪宝顶下，面临涪江源流，似中国人心目中“龙”的形象，因而历来被喻为“中华象征。松潘历史文化展览馆 松潘古城分内、外两城，内城平面跨崇山，依山顺势略呈三角形，东部崇山之下河谷部份为长方形，外城毗邻内城南面的河谷下坝，有城门与内城相通，平面为长方形。城墙总长6.2公里，用本地烧制的青砖砌成墙身，内土石而成，高12.5米，厚12余米，以糯米、石灰、桐油熬制的灰浆粕连勾缝，坚固如铜墙铁壁。各城门仅以大块规则的长方条石券拱而成。松潘古城规模宏伟，气势非凡，其城墙的长度、高度、厚度、浮雕石刻的精美在民族地区是首屈一指的。省级文物保护单位。 九寨沟自然保护区 恢复和重建的九寨沟虽然，遭受重创的几个景点还在紧锣密鼓的抢修中，但是，经过近一年的自然恢复，多数景点重现昔日光彩，神奇的九寨沟依然美丽。九寨沟长海，映日雪山苍云横，接天古树碧波开。恢复平静的长海，像一条玉带横亘在九寨沟的群山之间。 九寨沟双龙海瀑布，海子慢慢恢复后，湖水依旧晶莹。两条蛟龙藏于海中，蠕蠕欲动，也许它们也在奋力守护着这片秘境。 九寨沟五花海，五花海湖面，蓝、绿两种颜色的湖水混在一起，像两条不同颜色的玉带相互缠绕，流向远方。 若尔盖湿地保护区 花湖那巨大的湿地是各种候鸟的栖息地，现在正是野生鸟类繁殖的季节，黑颈鹤、黄鸭、溪鸥在湖中畅游， 湖畔旱獭、灰兔穿梭出没，人与自然和谐相处叫人感动，也成为游客们镜头中最美好的景致。 这里是你暑假最佳旅游目的地，夏季的若尔盖正是百花齐放，美不胜收之季。黄河九曲第一湾 黄昏，爬上高坡，九曲黄河每一道湾收入眼底的那一刻，所有人都激动得无法言语。 作为“环红”旅游圈中的大自然杰作，没有看到九曲黄河第一湾就算是白来了草原一趟，红原县南部白河自南向北流，在唐克乡索格藏寺的黄河第一湾，与黄河汇合，形成两河对直“碰头”和“拥抱”的奇观。在第一湾的入口处，有一所藏传佛教格鲁派寺院——索格藏寺。这座寺院左后300多米高的小山是观看黄河第一湾的最佳观看点。如今，嫌累的游客也可以乘坐升降电梯，享受S湾在眼前掠过的美景。九曲黄河第一湾，已有太多文字来赞美，7月大草原上的野草已齐膝高，夕阳下闪闪发光的九曲黄河第一湾，在我眼中画出的是生命的符号。 红原大草原 红原大草原位于四川省境内，青藏高原东部边缘，川西北雪山草地，阿坝藏族羌族自治州的中部； 红原大草原地域辽阔，自然景观独特，资源丰富，素有高原“金银滩”之称。红原大草原是花的世界、草的海洋，风情独特，气象万千。当年红军长征时曾经过这片草原，并在此休息、驻扎。为了纪念当年红军长征经过这里以及对这片草原的开垦和建设，国务院把它命名为红原县。 ', null, '1', '公开', '0', '四川省成都市双流区川龙街', '0');
INSERT INTO `wt_travelnote` VALUES ('45', '12345678@qq.com', '2018-12-26 17:57:54', '浙江省', '温州市', '56', '浙江温州浙江温州', '江心屿 江心屿，位于温州市区北面瓯江中游。远远看去，一寺立于中间，东西双塔凌空于寺庙两侧。 途中可以看到，浪中的航标。 江心屿被称为中国诗之岛，江心双塔被称为世界古航标。孤屿 东晋著名山水诗人谢灵运，非常喜爱江心屿的秀媚景色，写下《登江秀媚屿》，“乱流趋正绝，孤屿媚中川；云月相辉映，空水共澄鲜”。江心寺 江心寺——“禅宗六刹”。 寺中有两幅对联特别有趣： \"云朝朝朝朝朝朝朝朝散，潮长长长长长长长长消。\" 云朝朝，朝朝朝，朝朝朝散， 潮长长，长长长，长长长消。 云朝( zh ā o )朝( ch á o )，朝( zh ā o )朝( zh ā o )朝( ch á o )，朝( zh ā o )朝( ch á o )朝( zh ā o )散， 潮长( ch á ng )长( zh ǎ ng )，长( ch á ng )长( ch á ng )长( zh ǎ ng )，长( ch á ng )长( zh ǎ ng )长( ch á ng )消。 \"世人何人信因果， 因果又曾绕（饶）过谁。\" 对联里是饶过谁，我更喜欢绕过谁。 东西双塔 西塔应建于唐，东塔应建于宋。 为什么会是双塔，因为曾经这里有两个寺庙，所以对应两座塔。 东塔塔顶杂树枝繁叶茂，是数百年来形成的一处奇景。 一定要抬头看看塔顶喔。 据说，是鸟没消化掉的种子，生长出来的树，鸟粪又作为养料，滋养它生长。 现在，定期会打一些抑制树生长的激素。百年树 榕树已经有500岁了，是温州的市树。 晚上，市民喜欢到树下乘凉，伴着席席海风。 樟树已经有1300岁，从远处看像 老牛正在喝水。 樟树的树干有很大的洞，可以藏人。 旁边生出来一棵榕树，两树被称为 樟抱榕——相抱连理屿江边，照影凌波已千年。', null, '1', '公开', '0', '浙江省温州市鹿城区', '0');
INSERT INTO `wt_travelnote` VALUES ('46', '12345678@qq.com', '2018-12-26 17:59:21', '江苏省', '无锡市', '90', '爱上一座城', '无锡 有人说，爱上一座城，是因为城中住着某个喜欢的人。 其实不然，爱上一座城，也许是为城里的一道生动风景， 为一段青梅往事，为一座熟悉老宅。 或许，仅仅为的只是这座城。 无锡 一座承载了鱼米之乡名称的城市 有令人敬仰的灵山梵宫 樱花烂漫的鼋头渚 108位梁山好汉的水浒城 还有集聚江南灵气的各式古镇 如果你想去一个安静、简单的地方 这个周末可以来无锡看一看哦~无锡拈花湾禅意小镇 拈花湾的名字源于佛经中“佛祖拈花，伽叶微笑”的典故。据说是在一次法会上，如来佛祖手拈别人献上的花，昭示众弟子，且一言不发。而此时佛祖的大弟子却突然领悟，破言一笑，于是佛祖便这花传递给大弟子，并告诉大弟子，“以心印心之法传给你”。 这份心灵纯净、坦然自得的心态也是佛祖想要传达给世人的。 走进小镇，可以看到道路两旁都是带有唐宋风韵的仿古建筑，漫步在青石铺就的道路上，仿佛进入了一个禅意的世界，宁静而舒心。 在拈花湾 有一个关于“会呼吸的草”的小故事 小镇上的大部分建筑屋顶都是需要茅草来编织建造的，而这草必须要做到既不腐烂还能体现禅意的感觉，最关键是要——历久弥新，屋顶上的茅草要像在大自然中生长的那般。 于是呢，为了能找到这种“会呼吸的草”，设计者特地从全国各地搜集这类的茅草，甚至还跑到印尼的巴厘岛，总共二十余种，编制成品后对其进行测试，最后制作成如今的拈花屋顶。 在街边的店铺旁，不少都摆放着造型各异、憨态可掬的“小沙弥”雕塑，听说有的还是从灵山处所运来，价值不菲！ 拈花小镇不仅有独有的标志性建筑拈花塔，还有着古色古香的妙音台，处处都能感受到文化的气息。 在期间，如果大家想增加游玩的乐趣，不妨可以体验一下小镇内关于生活禅意的活动，有泥玩、脸谱涂鸦、木版画拓印、皮具制作等，十分有趣好玩。 这样一个充满禅意的地方在夜幕降临后会显得格外撩人！ 水幕光影秀、拈花塔亮灯、五灯湖“花开五叶”，每一处都是那么的让人目眩神迷。 据说，在夜晚的演出是由G20文艺晚会总制片团队打造的《禅行》演出，这场视觉盛宴以山水禅境和唐风宋韵的景观建筑为载体，加上灯光、喷泉效果，来展现拈花湾独有的禅意生活方式。灵山胜境 灵山大佛，坐落于三万六千顷太湖边的小灵山上，这座山可谓山清水秀，谷幽林深。 这里有祥符禅寺的故事，葛洪炼丹成仙的传说，玄奘法师命名的神话，使之获得“东方神仙岛”的美称。 这里的山，这里的水，充满了神奇的色彩，据说连秦始皇的龙马坐骑也因留恋这的美景而不忍离去~ 灵山大佛是中国五方五大佛之一，整个大佛通高88米，其中佛体高79米，莲花瓣9米，大佛的每个手指的直径就有一米。 据说摸佛手会带来福气，抱佛脚就能抱住平安，在这里你可以暂时忘却烦心之事，让心灵得到洗礼。 这胜境内最为著名的就是灵山梵宫，它被称为”东方的卢浮宫“，整个建筑依山而建，集成了佛教三大语系的建筑精华。 步入梵宫，会感受一股浓厚的佛教文化气息，里面的油画组图、扬州漆器、景德镇青花粉彩缸等艺术珍品都在梵宫内各处演绎着优秀的传统文化，令人目不暇接。 梵宫不仅有着静态的文化 还有动态的文化展示 在具有会议和演出多功能的灵山圣坛，会上演国内以弘扬传统文化、启迪心灵智慧为主旨的音乐大典。 根据佛教典籍《本行经》记载：佛祖释迦牟尼一诞生就能说话会走路，他向东南西北四个方向各走了七步，每走一步，地上就开出一朵莲花。他一手指天，一手指地，说道：“天上天下，唯吾独尊”，这时候花园里忽然出现了两方池水，天空中出现九条巨龙，吐出水柱，为其沐浴净身。 在灵山大佛的广场里有一座大型的九龙灌浴，也是国内最大的音乐动态青铜雕塑群，是依据佛教典籍释迦牟尼佛故事所建。 随着音乐声响起、莲花瓣一开一合、太子佛从中徐徐升起，在九龙喷水形成的水幕中自转一圈，“九龙灌浴，花开见佛”再现了故事中的绚丽景象。 另外 喷泉周围凤凰口中流出的净水 是可以使用的 大家知道吗？ 这水可不是一般的净水哦，按照佛教的说法，这是“八定水”，即佛教“圣水”。 到了灵山一定要用瓶子将其带回家，据说，用“八定水”沐浴或者拿它来供奉佛像，可以开智慧、护佑家人，带来吉祥平安。 “东方神仙岛” 一个令人敬仰和陶醉的地方 灵山大佛，佛大山灵。 城市的生活如果让你感到疲惫 不妨来无锡走一走~ 让你远离城市的喧嚣 感受内心的那一份宁静祥和。', null, '1', '公开', '0', '江苏省无锡市滨湖区云门路', '0');
INSERT INTO `wt_travelnote` VALUES ('47', '12345678@qq.com', '2018-12-26 18:00:25', '湖南省', '张家界市', '120', '国家森林公园', '【张家界国家森林公园】5** 这是中国第一个国家级森林公园，主要的景观有金鞭溪、黄石寨、腰子寨、琵琶溪、砂刀沟、后花园、朝天观等七条旅游线，数以千计的石峰，形态各异，造型完美。 【门票】：245 元+保险费3 元（3天内多次进出有效，含环保车票价）； 周票：298 元（一周内多次进出有效）。购买“三天一票”门票的游客如需增加游览天数，可参照周票价格补交差价； 优惠票：165 元+ 保险费3 元（含环保车票价），24岁以下全日制学生可凭证及身份证购优惠票。 门票实行通票制，为指纹门票卡，进检票口需输入指纹。 【开放时间】：8:00-17:00 【游玩建议】：1~2天 第二天 一觉睡到自然醒，在都市的快节奏高压下，好久都不曾有这么好的睡眠了。美美地吃完早餐，陈妹子童鞋就带着我们去国家森林公园了。进山有好几处门票站，我们走的是森林公园进口。要感谢吴冠中老先生，正是他老人家上世纪八十年代张原张家界林场归来写下的一篇散文《养在深闺人未识》将失落在湘西的璀璨明珠张家界推向了全国全世界！森林公园门票248元，三天有效，录指纹进入 提示：景区的猕猴是放养的，比较调皮，请勿靠的太近，以免被抓伤！ 上午：金鞭溪 张家界金鞭溪全长7.5公里，一般游览时间在2个半到3个小时左右，因途径\"张家界十大绝景\"之一-神鹰护鞭的金鞭岩而得名。金鞭溪沿线是武陵源风景最美的地界，从张家界森林公园门口进入后，往前步行300米左右就是金鞭溪的入口。穿行在峰峦幽谷间，溪水明净，跌宕多姿，小鱼游弋其中。溪畔花草鲜美，鸟鸣莺啼，人沿清溪行，胜似画中游。被誉为\"世界上最美丽的峡谷之一\"。 到达山顶袁家界 袁家界位于张家界国家森林公园北面，是一方山台地。背依岩峰山峦，面临幽谷群峰，自东向西延伸。主要景点有后花园、迷魂台、天下第一桥等。昨晚住宿的景区山下，天子山门票站附近。 今天我们前往神堂湾。和著名的天子山，御笔峰。 下午山下前往的十里画廊。 出山返回张家界市区入住。【张家界天门山国家森林公园】5** 景点：鬼谷栈道、天门洞、空中寺庙、玻璃栈道、索道7500米、盘山公路 【天门山】 得名于天门洞，天门洞南北对穿，门高131.5米，宽57米，深60米，拔地依天。天门山不仅自然风光壮丽，也凝结了人类智慧的结晶：环绕山体的99道弯的盘山公路，天门洞前的999个台阶的天梯，山体隧道内提升高度340米的手扶电梯。而更让人印象深刻的，是山顶悬崖边上的玻璃栈道和鬼谷栈道。到张家界，建议一定花一天时间去天门山看看 门票：旺季（3月1日~11月30日）：258.00元（含往返索道、环保车），淡季（12月1日~2月28日）：225.00元（含往返索道） 开放时间：旺季（3月1日~11月30日）：08:00~16:00 淡季（12月1日~2月28日）：08:00~16:30 门票费用包括了上/下山的缆车和巴士的费用，走玻璃栈道的时候需要收5元租鞋套。山上另有观光缆车，需要另外收费。 天门山往返有两种方法：坐索道或坐车，上下山方式不能相同，即不能往返都坐索道或车。早晨的天门山容易的云雾笼罩，可结合天气情况决定，我们选择了坐索道上山，再坐车下山 天门山索道（世界上最快最长的索道） 玻璃栈道（惊险**） 鬼谷栈道（鬼斧神工） 天门洞（世界奇观） 九十九道弯（望而生怯）', null, '1', '公开', '0', '湖南省张家界市武陵源区', '0');
INSERT INTO `wt_travelnote` VALUES ('48', '824691817@qq.com', '2018-12-26 20:34:33', '河北省', '保定市', '11', '河北有三宝', '人称河北有三宝：“沧州狮子定州塔，正定府里大菩萨 。”大菩萨是指正定隆寺内的千手观音。隆兴寺，龙蔵寺，大佛寺，皆为一处。它在河北正定。正定也因此而有圣地佛城之美誉，隆兴寺也有“海内宝刹第一名区”之称我，程总、赖哥及涂勇，四人行的河北之旅先从隆兴寺开始。住在正宁古城边的酒店。晨起打车就拐进了古城。这里拥有几千年纷繁历史和八寺四塔二十四个金牌坊的富贵遗产。它们从车窗外侈奢的闪过，我叫不出名字也无法招呼问候。出租车直接把我们载到隆兴寺前。北方冬天萧瑟的风把我们从四人拥挤的的士上迎候而下。被梁思成先生评价的“京外名刹当首推 正定 府隆兴寺”就在我们面前。有种冷落，与这里热闹的名号不相称着。几乎没有另外的游客，连门口的叫卖商贩也少得出奇。这哪像有自隋以来上千年，康熙、乾隆、嘉庆都多次到访，历朝历代都有名人拜望香火盛隆……有点怀疑这里在佛教界的地位。从旅游的角度，官方真不用多少心思。不仅没有对寺院建设有新的延伸，连收费的门口都没建一个。直接把“天王殿”作为了收费的大门。和其他的寺庙一样的天王殿，有弥勒，有四大天王。与众寺院相似的大殿，匆匆而过。只和笑盈盈的弥勒一个对视，和四大天王一目扫过，我们才觉得是真正进入到寺院之内。空旷的一个大院，虽已有阳光早到，但仍是冷清得意外。三个同伴完全可以在庄严的寺院内恣意的活动和说笑。出了天王殿，并不是其他殿宇所见的该是大雄宝殿的格局，而是一个像是荒废的台基。这是大觉六师殿遗址，原本也是一个宋朝建起的大殿，也高大漂亮过，但在百年之前的**时期因长年失修而坍塌。没有房舍的遮挡，台基上端坐的观音关公等塑像可以更充分享受温暖阳光和感受世间声色。关于大觉六师殿，是怎么回事呢？大觉，是佛的另一种解释。六师，就是六佛，是释迦牟尼佛之前的六位祖师，他们和佛教主张不同，被称为“道外六师”，六师是佛教的反对派。佛教寺院，还供奉“反对派”，体现了释迦佛心大量宽的胸怀。供奉六师的殿已成废墟，也是暗示着某种佛教之理空空的大觉六师殿遗址之谜拉扯了我的好奇心，我便落后于对此兴趣不大的三位哥们了。于是紧紧追赶，他们已到了前方的摩尼殿前。去过不少的寺院，对“摩尼”之名有些生疏，究其本意，知是英雄、圣人之意。远远打望，其建筑风格与其他佛殿有与众不同之处。所面向的正面是歇山式抱厦，中央为重檐式山顶，青瓦补心，绿琉璃瓦剪边。檐下斗拱宏大，分布疏朗。最奇妙在其柱子，横向的呈两头高中间低，直立的呈上面细下面粗。这在我国古代建筑中是仅存的孤例。它因此深得梁思成先生盛赞，称其为“艺臻极品”，并拍照收入《世界建筑史》。内行看门道，外行看热闹。程总是从事园艺的，他在树林花卉上就多有门道，把我们的兴趣点引导到大殿四周的古木苍枝。院中双槐，已被北方的苍凉之风和季节之剑削去了青春姿色，没有了一张树叶的老树更显本色。寒意虽浓，但已有清朗的阳光穿透云层相拥而至，只需不多的时日，“冬天来了，春天还会远吗？”这些枯枝虬杆上定会萌发出新芽，继续延续着这座大佛之寺的厚重历史。', null, '1', '公开', '0', '河北省保定市定州市', '0');
INSERT INTO `wt_travelnote` VALUES ('49', '824691817@qq.com', '2018-12-27 09:34:45', '河北省', '石家庄市', '17', '相约正定', '这周六无事，朋友相约正定耍耍。本对此地没什么印响，但提到三国才知道这是赵云赵子龙的家乡，同时也是习主席奋斗过的地方。正定 县位于河北省西南部，华北平原中部的冀中平原，古称常山、真定，历史上曾与北京 、保定并称“北方三雄镇”，是国家历史文化名城， 中国民间艺术之乡，也是百岁帝王赵佗、常胜将军赵云故里。截至2010年正定有国家级文物保护单位9处，省级文物保护单位6处。初到 正定 真是惊到我了。没有北方的小县城的那种脏乱。我看到的是整洁的街道，不管是汽车还是自行车都排放整齐连车头都是统一方向；当地人态度 平和 友好易接触。首先，景点主要是九楼四塔八大寺二十四座金牌坊，荣国府、赵云庙、文庙等点缀其中，景点相对集中。九楼： 正定 城墙上的四座城门楼、四个角楼和阳和楼。四塔：广惠寺的华塔、开元寺的须弥塔、临济寺的澄灵塔和天宁寺的凌霄塔。八大寺：隆兴寺、崇因寺、天宁寺、广惠寺、开元寺、临济寺、洪济寺、舍利寺。二十四座金牌楼 牌楼又称牌坊，在 正定 众多。但不都是金牌楼。 正定 牌楼分为三类：金牌楼、家牌楼、街巷牌楼。 正定 二十四座金牌楼计有：大十字街（今燕赵大街与 中山 路交汇处）四面各有一跨街金牌楼。所以，大十字街又称“四牌楼”， 正定 城内地形中高周低环水，传说是“ 恒山 飞来”（见《徐霞客游记》），所以，勅建金牌楼四座。八大寺门前各有一座。现在，隆兴寺天王殿前尚存牌楼 石柱 础四蹲。太仆寺（太平街）、观音堂（ 西北 街）、元真观（大众街）前各一座。府文庙前、左、右各一座。县文庙前一座。府、县二城隍庙前各一座。府城隍庙前金牌楼精美玲珑、榫卯坚固，公认价值 连城。**中，造反派砸了好几天才将其砸坏，太可惜。三处关帝庙（阳和楼前、西南街、 西北 街）前各一座。阳和楼前的关帝庙金牌楼，从现存阳和楼关帝庙旧照片（见梁思成《 中国 建筑史》）中可见其雄姿，精美别致，罕见。', null, '1', '公开', '0', '河北省石家庄市正定县燕赵南大街67号', '0');
INSERT INTO `wt_travelnote` VALUES ('50', '824691817@qq.com', '2018-12-27 09:36:35', '河北省', '石家庄市', '32', '北国奥特莱斯', '北国奥特莱斯是4A景区，它颠覆人们以往单一的传统购物模式,北国奥特莱斯让人们享受到一个度假村式的放松消费体验游。市民置身 巴黎 广场、 波尔多 广场、 威尼斯 广场、 伦敦 广场、 罗马 广场等九 大城 市主题广场,体味异域风情带来的新奇感。如同来到一个 意大利 小镇,你可以逛街看风景,也可以随时走进一家小店购物。不时,皇家马车巡游、浪漫雪花飘洒、经典影片复古秀会突然出现在你眼前。为消费者提供了一种全新的休闲购物体验,一个异域风情度假旅游新目标。它周边分布的 石家庄 动物园、西部滑雪场、高尔夫球场等旅游娱乐、休闲度假景区,同时周边环绕知名别墅区与君乐宝、稻香村等工业园区,将共同构成 石家庄 西南休闲娱乐带。', null, '1', '公开', '0', '河北省石家庄市鹿泉区', '0');
INSERT INTO `wt_travelnote` VALUES ('51', '824691817@qq.com', '2018-12-27 09:38:12', '河北省', '石家庄市', '61', '当一回花痴', '进入夏季后气温屡创新高。这一日酷热难耐，一夜无法睡实，早早的起床外出纳凉，不经意间走到了古中山公园。这里竟然有一池荷花开得正旺，引来一群**围聚在此，长枪短炮全都冲着花儿摄了又摄。回家一查，原来中山公园的荷花种植面积在石家庄仅次于植物园的荷花种植面积。既然这样咱也带上相机去摄上一摄，当一回花痴。', null, '0', '公开', '0', '河北省石家庄市新华区西二环北路辅路', '0');
INSERT INTO `wt_travelnote` VALUES ('52', '824691817@qq.com', '2018-12-27 09:39:33', '河北省', '石家庄市', '81', '漫山红叶', '今日，在秋风的陪伴下，到仙台山去观霜林尽染的漫山红叶。仙台山分漆树谷和主峰两个景区。主峰一圈游玩下来需要至少6个小时，而且云梯处直上直下，异常险峻，看看这上山的阶梯已然发颤，果断选择漆树谷区。记得这个树种是 普陀山 特有的，怎么仙台 也有种植，是真的么？是真的么？', null, '0', '公开', '0', '河北省石家庄市井陉县', '0');
INSERT INTO `wt_travelnote` VALUES ('53', '824691817@qq.com', '2018-12-27 09:41:26', '河北省', '石家庄市', '59', '九楼四塔八大寺，二十四座金牌坊', '古城墙有东南西北四个城门，南门、北门都设有停车场，北门更加靠近“九楼四塔八大寺，二十四座金牌坊”九楼：城墙包围的东西南北四座城门楼以及四座城的角楼和阳和楼。四塔：华塔、澄灵塔、须弥塔、凌霄塔。八大寺：大佛寺、崇因寺、广惠寺、临济寺、开元寺、天宁寺、太仆寺。二十四座金牌坊：大佛寺摩尼殿内。如果坐公交，177路、130路两趟车都经过南门。', null, '1', '公开', '0', '河北省石家庄市正定县燕赵南大街67号', '0');
INSERT INTO `wt_travelnote` VALUES ('54', '824691817@qq.com', '2018-12-27 09:42:49', '河北省', '石家庄市', '58', '抱犊寨', '据说在北魏葛荣起义时，当地人为避战乱，抱犊上山，养大耕田\"，因此才有了抱犊之说。它东临华北平原，西接太行群峰，一峰突起，峥嵘雄秀，四周皆是悬崖绝壁，远望犹如巨佛仰卧，眉目毕肖，其山顶平旷坦夷，有良田沃土660亩，土层深达66米，异境别开，草木繁茂，恍如世外 桃源 。有\"天下奇寨\"之称。2013年1月14日，值全国性大面积雾霾天气，室外空气混浊，一个人闷在家里无事可做。于是从家门口登上了320公交跑了趟抱犊寨 。快十一点了，山脚雾依然浓重。淡季，绝对的淡季。老铁看门，空无一人。', null, '1', '公开', '0', '河北省石家庄市鹿泉区', '0');
INSERT INTO `wt_travelnote` VALUES ('55', '824691817@qq.com', '2018-12-27 09:44:37', '河北省', '石家庄市', '54', '新石中路夜市', '新石中路夜市在石家庄是数一数二的夜市了，人多热闹！小吃的种类繁多，各种特色小吃一应俱全。鸡汁豆腐、烤冷面、炒凉粉、土豆花、热干面、大肉串、钵钵鸡、臭豆腐、寿司、烤扇贝、铜锣烧等等。位于翟营大街两侧，从槐安路向槐中路方向延伸数百米。西侧为日用百货、服装、书籍等各式各样的小商品，东侧则是各种美食，有砂锅、麻辣烫、米线之类的风味小吃！还有特别萌的小猫、小兔子和小狗哦~去了可以撸两把！', null, '1', '公开', '0', '河北省石家庄市桥西区新石中路202号', '0');
INSERT INTO `wt_travelnote` VALUES ('56', '824691817@qq.com', '2018-12-27 09:50:25', '河北省', '石家庄市', '53', '家庭企业“老高烧烤”', '建明中路和谈固东街交叉口西行100米路南，一家超不起眼的小店,您现在要是去得使劲的找。只有小小的门上,小小的窗户贴着\"老高烧烤\"四个字，家庭企业，老爸主烤官，老妈副烤官兼疙瘩汤制作官。这里的烤肉种类有：羊硬筋。羊肉筋、羊肉串、心管、鸡珍、小烤鱼、板筋，腰子(跟老板不熟吃不到哦)脆骨这里着重要说的是羊硬筋。这里的肉也都是提前腌制过的，我也不知道是什么部位，烤的火候好，肉香，有微微的葱香味，咬感棒。鸡珍，比较新鲜，烤出来脆脆的，很好吃。脆骨：非常香，就是串小了点。板筋：他这是先煮过的，煮的火候也很好，不仅好咬了很多，而且还保留着板筋原有的口感。凉菜只有花生豆，毛豆，凉拌黄瓜和西红柿。这里到夏天的时候有很多都是专程打车和开车过来吃的，满满的，密密麻麻的人，让人感觉到真是酒香不怕巷子深啊。爱吃烤肉的同志不容错过啊！推荐推荐！', null, '1', '公开', '0', '河北省石家庄市长安区建明中路61号', '0');
INSERT INTO `wt_travelnote` VALUES ('57', '824691817@qq.com', '2018-12-27 10:10:59', '河北省', '石家庄市', '52', '无极河捞馆', '洞天影院往西二百米路南有一条小叉路，顺着往里一看,就能看到无极河捞馆，绝对正宗。自从东马路扩修，这店一直动荡不安，先后换了几家门脸，不过一直没有离开方面一百米，就是怕老顾客找不到它。荞麦面河捞加上醇香牛肉老汤，每一根面都很筋道、油油的、香香的、放上辣椒酱点上几滴醋。确实比其它地方的做的不知道要强多少倍。', null, '1', '公开', '0', '河北省石家庄市长安区中山东路216号', '0');
INSERT INTO `wt_travelnote` VALUES ('58', '824691817@qq.com', '2018-12-27 10:15:54', '河北省', '石家庄市', '10', '串——串', '地处民族路，天元名品二期西临，原女人世界对面二层小楼。二层，这里的真是又便宜又好吃，说到这里真是有说不完的话啊。好爱这里啊~啊~这里不论肉串还是素串一律全是两毛一串，锅底五元，有鸳鸯、清汤、麻辣。清汤的非常香，麻辣的非常正，很是独特，小料也非常好，麻辣里边是在麻酱里放入辣椒油菜来调，很中和，非常适口，建议大家只吃串，不要再另点菜了，你会发现还是吃串值!最有特色的要属他们自己腌制的羊肉串，鸡肉串，牛肉串，和鱼块了。涮过后，白白的肉中透着腌制的辣辣的味道，很有特色。腊肠、牛肚、海螺肉，也都很好吃，每次都去吃很多，不过环境不是很好，尤其是地太滑了，走路一定要小心。', null, '1', '公开', '0', '河北省石家庄市新华区民族路5号', '0');
INSERT INTO `wt_travelnote` VALUES ('59', '824691817@qq.com', '2018-12-27 10:17:34', '河北省', '石家庄市', '112', '蓝底白字老底饭店', '在清真寺街教堂对面有一个超级小的门脸，蓝底白字老底饭店，细长细长的格局，每到饭点的时候这里会非常火爆，很多人也会开车来这里吃，羊杂汤做的绝对地道，料足，香！罩火烧的汤是老汤，有着独特的香味，这里的蒸饺也是很著名，牛肉的，油略有些大，不过味道很正宗。', null, '0', '公开', '0', '河北省石家庄市新华区清真寺街67号', '0');
INSERT INTO `wt_travelnote` VALUES ('60', '824691817@qq.com', '2018-12-27 10:19:49', '河北省', '石家庄市', '11', '河间驴肉火烧', '人们都说广安街上的老杨家驴肉火烧最好吃，我去吃过，油有点大了，而且咸味不够。我个人觉得最好吃的要属粟康街与正东路交叉口的一个极小极小的窗口卖的，河间驴肉火烧，买火烧的人络绎不绝，尤其是焖子，与其它家不同的是，他家的焖子是白色略透明的。那叫个香呀！您可以去试试。', null, '0', '公开', '0', '河北省石家庄市新华区大桥街4号', '0');
INSERT INTO `wt_travelnote` VALUES ('61', '824691817@qq.com', '2018-12-27 10:21:35', '河北省', '石家庄市', '1', '胡氏大盘鸡', '中山路和建华大街往北二百米路西的胡氏大盘鸡，是我吃过的所有胡氏的店中味道最好的，30一小盘，48一大盘。小盘就够三人吃了，鸡块吃完了，小盘送一碗大盘送两碗皮带面，泡到汤里，味道太棒了~另外，胡氏的肉串烤的也很好吃，现在大盘鸡推出了，大盘土鸡，味道更香，还有香菇大盘鸡，浸过鸡汁的香菇的味道也是很棒的.....这里顶部很高,没有丝毫压抑感，环境也不错，顺便：大盘鸡30元羊肉串1元/串红油腐竹/5元', null, '1', '公开', '0', '河北省石家庄市裕华区翟营南大街', '0');
INSERT INTO `wt_travelnote` VALUES ('62', '824691817@qq.com', '2018-12-27 10:22:58', '河北省', '石家庄市', '30', '石家庄机场', '石家庄机场高峰时段机场游客较多，对于团队旅客，建议在办理好乘机手续后，及早通过安检，避免人多拥堵。团队旅客在排队过检时，请将身上衣物口袋的手机、钥匙、钱包等物品提前取出；随身携带电脑、IPAD等电子产品需单独取出，放入框内过检，这样会大大节省过检时间。友情提醒：对于旅客提出需要暂存的物品，石家庄机场安检设有暂存室，物品的存放期限不超过30天。', null, '1', '公开', '0', '河北省石家庄市正定县', '0');
INSERT INTO `wt_travelnote` VALUES ('63', '824691817@qq.com', '2018-12-27 10:26:20', '河北省', '石家庄市', '40', '路口掉头车道', '这个路口掉头车道在辅路。这次先说说槐安路西向东方向的辅路，槐安路东二环口有个信号灯，信号灯的绿灯时间太短，造成车辆等候时间过长，高峰期更为明显，司机朋友高峰期尽量绕开这里。翟营大街南向北方向南二环口，高峰期间车辆排队严重，建议大家从方兴路或者从方文路到建华大街或裕翔街进市区。而且，这个路口高峰期间禁止左转，不常走的朋友一定要注意。', null, '1', '公开', '0', '河北省石家庄市桥西区槐安西路262号', '0');
INSERT INTO `wt_travelnote` VALUES ('64', '824691817@qq.com', '2018-12-27 10:27:12', '河北省', '石家庄市', '50', '石家庄搬家', '在石家庄搬家其实是一件比较简单的事情，因为石家庄搬家公司很多，你只要选择好专业的公司，搬家很简单。而为了让你的搬家更加顺利所以在搬家之前的打包中一些小常识不妨了解一下。1、从经常不使用的东西开始。箱子由不常用的物品制成，例如书籍，过季的衣服，不常用的器具或装饰品。2、一次只能打包一个房间。由于你会忘记在哪个盒子中放入哪些物品，最好不要将每个房间的物品混合在一起。3、将重物放入小盒子中，将大物体放入大盒子中。诸如书籍和瓷器之类的重物将难以携带在大盒子中。', null, '1', '公开', '0', '河北省石家庄市长安区北宋路306号', '0');
INSERT INTO `wt_travelnote` VALUES ('65', '823938208@qq.com', '2018-12-27 11:00:59', '贵州省', '六盘水市', '15', '最美贵州，好玩六盘水，我在这儿等你！', '去 贵州 ，源于亲爱的老父亲曾于上个世纪60年代初，在 六盘水 市 水城 钢铁厂奉献过四年青春年华，为了实现老人家时隔56年旧地圆梦的愿望，携老带小五口人从 上海 出发踏上向黔行六天五晚自驾游之旅程。DAY1： 贵阳 甲秀楼DAY2： 贵阳 黔灵山公园DAY3： 安顺 黄果树瀑布DAY4： 六盘水 水城 钢铁厂 北盘江大桥DAY5： 六盘水 乌蒙大草原DAY6： 六盘水 贵州 三线建设博物馆甲秀楼爽爽 贵阳 欢迎您！搭乘 中国 东方航空公司MU5445航班抵达 贵阳 龙洞堡机场，临降落前从飞机的舷窗向外眺望连绵的大山绿意盎然，降落后在一嗨租车龙洞堡机场店办好手续，直奔 贵阳 地标——甲秀楼。甲秀楼始建于明万历26年，也就是1598年，巡抚江东之于此筑堤联结南岸，并建一楼以培风水，名曰“甲秀”，取“科甲挺秀”之意。从古到今，该楼经历了六次大规模的修葺，历经四百年的风吹雨打仍旧矗立不倒，是 贵阳 历史的见证，是 贵阳 文化发展史上的标志。黔灵山公园黔灵山公园地处 贵阳 中心城区 西北 角，门票5元沿着公园内的环湖道走了一小段，感觉景色没有预想中的漂亮。公园以野生放养猕猴在此栖息闻名，这里的猕猴都不怕人，你可以稍微逗弄一下，切勿过分招惹。游人尽量别手拿食物，以免猕猴抢夺而伤到自己，带小孩更加要注意安全。黄果树瀑布安顺 ，此次向黔行 贵阳 至 六盘水 的中转站。 安顺 最著名的黄果树瀑布是 亚洲 第一大瀑布，也是 贵州 旅游的名片。黄果树瀑布出名始于明代旅行家徐霞客，因当地一种常见的植物“黄果树”而得名，经过历代名人的游历和传播，成为世界级知名景点。大瀑布以水势浩大而著称，瀑布高度为77.8米，其中主瀑高67米；瀑布宽度为101米，其中主瀑顶宽83.3米，典型的喀斯特地貌侵蚀裂瀑布，大自然的鬼斧神工作品。黄果树风景名胜区由大瀑布景区、天星桥景区和陡坡塘三个瀑布景区组成。水城 钢铁厂圆梦 贵州 ， 六盘水 之行是老父亲神往已久的事情。记得小时候，家里的电视只要播放关于 贵州 的点滴新闻，都会让他兴奋不已，俨然把 贵州 当成了“第二故乡”。后来，慢慢了解到父亲是当年支援西部建设大军的一员，上个世纪59—62年响应国家号召来到 水城 （当时还没有 六盘水 市）钢铁厂，把最美好的青春岁月奉献给了这里。近60年的模糊记忆，连大致的地理位置他也搞不太清楚，只能一路问询当地的老乡 水城 钢铁厂的方位，一路忍受着高低不平、积水严重的路面颠簸，几经周折终于找到了曾经辉煌过的 水城 钢铁厂。天空下着小雨，父亲打着伞在废弃的厂区里寻找，脚步很快犹如他此刻的心情一样，只是倘大的 水城 钢铁厂早已物是人非。来过了，看过了，心愿已了，回 上海 也踏实了……北盘江大桥大型记录电影《厉害了，我的国》让每一位 中国 人顿生荣誉感，说起 贵州 的超级工程一个是“ 中国 天眼”，另一个是北盘江大桥。而北盘江大桥就坐落于 贵州 水城 与 云南 宣威 两省交界处，全长1341.4米，桥面到谷底垂直距离565米，相当于200层楼高，为目前世界第一高桥。世界第一高桥，谁不想停留下来好好观赏一下？特意驾车从 贵州 六盘水 俄角都格经北盘江大桥到 云南 宣威 普立腊龙跑了来回，自驾云贵一定要拔草的高速风景线（个人认为，这次 贵州 六盘水 行程中最美的就是一路上的风景）大桥+隧道群，让天堑变通途。全球最高的桥梁里面，有85%来自 中国 ，而 中国 的很大一部分在 贵州 ，其中世界最高的20座大桥有14座来自 贵州 ，厉害了我的国！为大 中国 点赞！！盘江雅阁大酒店出门旅行怎能不订好的酒店？盘江雅阁大酒店是 六盘水 最好的五星级酒店，酒店地理位置优越，毗邻凤池园、 水城 古镇和三线建设博物馆，订的湖景房隔着落地窗就能见山见水。乌蒙大草原这个地方，值得你去——乌蒙大草原。 贵州 大山多，自然条件差，但通过这次自驾 六盘水 的亲身感受， 贵州 的基础交通设施非常完善。行车乌蒙大草原途中一路好风景，犹如在群山之巅云里雾里翱翔，对老古话“天无三日晴、地无三里平”有了深刻认识。乌蒙大草原位于 六盘水 市盘州坪地和乌蒙两个彝族乡镇境内，当地人称之为”坡上草原“，是 贵州 面积最大、海拔最高的天然草场。贵州 三线建设博物馆六盘水 是“三线建设”西南地区的主战场，重要的煤炭基地、钢铁基地，是“三线建设”滚滚浪潮中诞生和发展起来的一座 新兴 的工业城市，既有着深厚而丰富的三线文化底蕴，更是三线精神的传承者、传播者、弘扬者。走进 贵州 三线建设博物馆，感受那个年代的三线精神，感受红色革命的辉煌历史。', '2', '1', '公开', '0', '贵州省六盘水市钟山区吉祥街9号', '0');
INSERT INTO `wt_travelnote` VALUES ('66', '823938208@qq.com', '2018-12-27 11:09:14', '台湾省', '屏东县', '12', '【左手台湾，右手文艺】', '   自从 台湾 开放旅游以来，一直是无比向往的模式，可是“8日尚能环岛”一直限制了我去的脚步，冲动、遗憾，就仿佛努力始终得不到回复一般， 台湾 之旅也一次次搁浅。正如很多小伙伴羡慕我现在的生活状态一般，曾经的我，过着和你们一模一样的生活，规矩无法突破，但是我选择了破壳而出。    再次听到 台湾 ，受到远在 日本 的闺蜜的邀约，我知道那必然是场疯狂的旅行，正如我那时候的状态一样（正在91日长途旅程中的 斯里兰卡 ），迫切的想把2字头的十年最后的火花燃烧到极致。翻出那本即将过期的从未使用的 台湾 通行证，定下了往返16日的机票，要旅行就要够痛快，我想用尽全力将 台湾 环个遍。闺蜜只能走上半程，而后半程继续是我一个人的磨练。91日旅行后的我更享受一个人的旅途，因为当只剩下自己一人的时候，看到的更多的是旅途的纯粹。台湾 ，是什么样的？台湾 ，是那山谷中，静静与猫共度的静谧时光台湾 ，是我们把爱尽情释放在海湾的落日时分台湾 ，是我骑着小摩，载着你去看海的简单幸福台湾 ，是等待流星雨却看到明月初升的惊喜台湾 ，是对火车便当的一种意外执着台湾 ，是你我还能共返的童年时光台湾 ，是我经历万难也要来舞的天空之境台湾 ，当我仰望屋中 大树 的那刻就在想，幸好，我尚在二十代遇见了你台湾 ，我玩出了文艺的模样~', null, '1', '公开', '0', '台湾省屏东县', '0');
INSERT INTO `wt_travelnote` VALUES ('67', '823938208@qq.com', '2018-12-27 11:13:16', '安徽省', '宣城市', '12', '旌歙古道徒步行', ' 爱上 安徽 ，爱上 皖南 ，这里不仅是我出生的地方，风景优美，更是我父亲一生足迹踏遍的地方。以前小时候，父亲一出野外工作，我就特别盼望他回来。每年都是除了冬休和夏休他基本都在野外，经常是几个月都见不到他。特别能体会到现在的留守儿童父母不在身边的心酸。如今我一有机会和时间就特别想走走他当年走过的地方，体验一下他爬山涉水工作的感受。2018年11月24日，25日，也是怀着对对徒步运动的好奇以及与对古道秋景（现在已过了大雪）的美好憧憬，参加了朋友圈的 皖南 徒步行活动。今天是徒步旌歙古道。旌歙古道，亦称隋唐古道，史称徽(州)宁(国)官道，位于在 安徽 省 旌德 县境内。旌歙古道始建于隋朝，距今已有1400年，古时由 徽州 府( 歙县 )通往 宁国 府(宣州)的重要官道，也是徽宁官道中最精致的一段。沿途有五里洞、如来柱、靠壁洞、天竺庵遗址、旺子洞、天星洞等人文景观。是目前保护最好、最长的一条 徽州 古道历史风貌。 也是 中国 十大徒步古道之一。第一次长途跋涉20余公里，耗时约8个半小时，还是山路，堪称是我的“长征”。虽然没有拍到我想象中的红叶点缀黄叶夹杂（还好没有想象是满山红叶），但也领略了一种别样风光，亦有人生的另一种难得体验！还是收获颇多，感悟甚深。行间，多次汗水打湿了内衣浸透到羊毛衫上以至于背包带上都是汗水，这是从未有过的。到达集合处，我的嗓子已经失音，一路上百分之九十的路程是我独行，也得到了群友的主动呼应，在此表示真诚的谢意！友情提示:对于像我一样恐高的人来说，有些地段还是挺危险的，路窄，一边是高山一边是笔直的悬崖，掉下去相当于跳楼，谁都救不了你！当然啦，对于不恐高的体力强的，这点高山都不算什么。还有就是要带足补给，特别是水。另外就是走没多久突然就发现没有4G移动信号了，时有时无，被吓得不轻！再次感谢本次组织者的辛勤付出，谢谢！虽然组织的并不周密，但是能安安全全完成整个活动，已经非常满意了！本次徒步路线:高甲村开始，经五里亭、旺子洞、天星洞(东箬岭)，至箬岭关转到西文村岭脚二组。（其实我当时根本不知道路线，就是跟着走，回来我查阅许多资料才彻底搞清楚。）真想春天再去走一回。 ', '2', '1', '公开', '0', '安徽省宣城市旌德县', '0');
INSERT INTO `wt_travelnote` VALUES ('68', '823938208@qq.com', '2018-12-27 11:17:10', '新疆维吾尔自治区', '吐鲁番市', '13', '驾越整个中国来看你——记新疆自驾环游之旅', '循例说说，这是一篇讲述从 广州 出发，历时39个日夜，驾越 1万 6千公里，走过草原、走过湖泊、走过沙漠、走过雪山，一直走到 中国 最西端的游记，在这期间，依次飘过 新疆 境内的 鄯善 、 吐鲁番 、乌鲁木齐 、可可托海、 北屯 、 布尔津 、 喀纳斯 、 禾木 、 克拉玛依 、 赛里木湖 、 伊宁 、 特克斯、喀拉峻、 琼库什台 、 库尔德宁 、 库车 、 喀什 、 塔什 库尔 干（帕米尔高原）、 和田 、 且末 、 若羌 等地。鉴于行程时间长、景点多，尽管我已经尽量精炼文字和图片，但仍然形成了不短的篇幅，故此，如果你是一位急性子的人，又或者是一位有针对性的看客的话，敬请通过点击“游记目录”，直达你所需要的内容，包你满意哦。从 广州 自驾 出发，行驶超过1.6万公里，从 中国 最东南角一直走到中国最 西北 角，看看占地面积最广的省份，再绕一个圈回来，如此crazy的举动，对于一向循规蹈矩的我来说，以前还真想都没有想过。这一切，还是离不开同行华哥的怂恿，而我也是一个耳根比较软的人，于是就“服从”了啦。我想，如此浩大恢宏的旅程，以后也未必有机会再来一次了，人生有时候需要冲动，冲动是魔鬼，可如果不是这样，一路走来，也不会在 新疆 遇到了不少美好的人和事，以及美爆的景色。还记得之前看过一些访谈，也有不少观众以为 新疆 到处就是草原，好像除了草原什么都没有了。可其实，这里除了有美丽的草原、广袤的沙漠外，还有犹如蓝宝石般的湖泊，还有高耸的雪山，还有幽深的森林，而更重要的是，这里不止于自然景色，还有繁华、现代的城市和小镇， 比如 现代如 乌鲁木齐 ，繁华如 伊宁 ，厚重如 喀什 ，新潮如 克拉玛依 ，交融如 吐鲁番 ，所有的这些，都无不彰显着 新疆 的无限魅力和发展潜力。如果翻开叙述关于 新疆 或中原皇朝的历史资料，我们也许会发现，尽管早在几千年前就有玉石之路和及后著名的 丝绸之路 ，中原便已与西域有较频繁的文化交流和贸易来往，可大概历史上中原地区中原皇朝有能力对这片区域产生重大影响力的年代仅有汉唐清三朝而已。自周穆王西巡之后，中原皇朝与西域古三十六国的交流更加频繁了；汉朝张骞三次出使西域，史称为凿空，乃至击败匈奴后在此设安西四郡；唐朝时大败西突厥后，在此设都督府，然而，自怛 罗斯 之战唐军败于阿拉伯帝国后，中原皇朝在这片土地上，就没有然后了；一直到一千年后的清朝乾隆时期，清军打败准 噶尔 汗国，这片土地终于被乾隆命名为“ 新疆 ”。就算在对西域颇具影响力的唐朝，王维在送别前往龟兹的元稹时，也写道“劝君更尽一杯酒，西出阳关无故人”的千古传诵诗句来，可想而知中原和西域之间的隔阂心理。由此而见，西域和中原之间存在各种误解和误会，其实，确实是可以理解的。不过，我们正生在这个世界 大同 、民族融合的时代，各种交通和通讯手段丰富，我们确实应该去多点了解那里，然后就会发现，这里是那么的与众不同，那么的热情礼貌，那么地富饶美丽，那么的繁华厚重。在这片美丽神秘的土地上，发生了很多很多故事，除了要与天斗，更要与人斗，这是一个复杂而纷争的过程，有人到达，成为了主人，有人迁徙离开，在原地上仅剩下废墟。今天定居了在这里的人们，就注定了一大堆历史过客的命运。站在厚重的 喀什 古城里，我在感受浓厚的维族文化和繁荣的西域风情，可是，回望历史，我等城里人在城中欢宴，又怎知荒野中互举弯刀的残酷？回首之前走在连残垣断壁都算不上的 高昌故城 遗址上，深深感受到滚滚历史洪流的无限力量，曾经强大的高昌国，被灭后甚至没能留下多少史料可供研究。不过，古人更说得没错，“滚滚长江东逝水，浪花淘尽英雄，是非成败转头空，青山依旧在，几度夕阳红”！对的，对于我等普通人来说，哪管得了那么多英雄往事和旧日往事？只需知道现在青山依旧，我们是来看青山、叹夕阳、吃羊肉的！那些在 新疆 遇想到的人和事，以及美爆的景色，我们一定要珍惜，活在当下，去看看，多想想。我想，每一段旅程，就如同每一段人生，我们可以慢慢走，好好地去享受不同的生活；也可以快点走，多看些风景；又可以节俭地走，体验接地气的过程；更可以奢华地走，感受豪华的**。总之，在旅行中，我们可以在一定程度上尝试不同的人生，不是吗？', null, '1', '公开', '0', '新疆维吾尔自治区吐鲁番市高昌区绿洲西路794号', '0');
INSERT INTO `wt_travelnote` VALUES ('69', '823938208@qq.com', '2018-12-27 11:19:49', '河北省', '唐山市', '16', '清东陵：两位关乎清王朝命运的女人', '冬日唐山遵化的清东陵，暖阳洒落在气势雄伟的建筑物上，留下了壮观、精美的身影。在这四面环山，三面傍水，风景秀丽、风水独特的皇家陵寝长眠着两位关乎清王朝命运的女人。一位是辅佐两位小皇帝、被称为清初杰出的女**家孝庄文皇太后；还有一位是两度垂帘听政、掌权长达48年之久的慈禧太后。纵观清代历史，康熙年间为大清帝国走向巅峰，太平盛世，百姓安居乐业；慈禧两度垂帘听政，大清帝国还是不可抑制地走向衰败。而康熙盛世与中国历史上有名的贤后、女**家孝庄皇太后。有着不可分割的联系。望着洒满阳光的皇陵大殿，望着陵寝背靠的蜿蜒起伏的昌瑞山，清王朝历史的画卷缓缓地拉开……孝庄皇太后真正走上**舞台，是她的儿子福临继位后。1643年李自成领导的农民起义攻到北京，崇祯皇帝自缢，明朝灭亡。消息传到盛京，孝庄皇太后建议摄政王多尔衮带清兵入关，并告诫多尔衮：入关后要严明军纪，笼络民心，胜利后迁都北京，稳定中原。进入紫禁城后，孝庄皇太后把全副精力放在大清入主中原后第一位皇帝的培养上。为维护清王朝的统治，她采纳明朝降清的汉官洪承畴、范文程的建议：使用明朝文臣武将；减轻农民税负。稳定了清入关后的政局。随后她辅佐顺治帝，在内部对王公大臣普施皇恩，对受多尔衮**的冤案平反昭雪；在外部主张满汉联姻，巩固政权。1661年，顺治帝病重，孝庄皇太后听取了德国人汤若望因玄烨出过天花，有免疫力，适合继位的谏言，说服顺治帝改变由皇弟继位的主张，使清王朝因有这样一位明君而走上巅峰。1688年康熙皇帝遵照祖母孝庄皇太后遗命，在清东陵风水墙外，大红门东侧建造暂安奉殿。37年以后即1725年，雍正皇帝决定将暂安奉殿改建为昭西陵。这是清王朝营建的第一座皇后陵，开创了清代为皇后单独建陵的先例。走进慈禧太后陵寝，昔日的荣华富贵仍可见一斑。黄花梨木建成并为黄金装饰的慈禧陵三大殿；“凤在上龙在下”的丹陛石石雕，可谓威风凛凛。原本慈禧陵与慈安陵在规模、规制上完全一样，但西太后慈禧并不满足，她利用独自掌权之机，以年久失修为借口，在1895年下令拆除重建，工程历时13年之久，所花银两无数。慈禧太后的两度垂帘听政，正是帝国主义列强群起瓜分中国的时候。作为清王朝的掌门人，慈禧嗜权如命、唯我独尊、长于权谋而短于治国。倘若她有孝庄皇太后一半的开明大度，给皇帝更多的信任与权力，容许年幼的皇帝光绪变法，或许大清帝国不会这么快就走向灭亡，中国也不会这么快就沦为半殖民地半封建社会。当然这都是后话。走进清东陵，我们不仅看到一座气势恢宏的皇家陵寝，欣赏到中国古建筑的精美绝伦；同时也了解了中国封建社会居中为尊，长幼有序，尊卑有别的宗法理念。当然更多的是知道了关乎到中国清王朝的鼎盛与衰亡的两位不同寻常的女人的历史故事。', null, '1', '公开', '0', '河北省唐山市遵化市', '0');
INSERT INTO `wt_travelnote` VALUES ('70', '823938208@qq.com', '2018-12-28 14:20:58', '安徽省', '黄山市', '19', '【无梦到徽州——中国民居的C位】', '“一生痴绝处，无梦到徽州。”这是汤显祖留下的千古绝唱，意思是说一辈子想去人间仙境，可做梦也没想到人间仙境原来在徽州。古时徽州一府六县，即歙县、黟县、休宁、祁门、绩溪、婺源，府治在现歙县。之后行政关系调整，古徽州一分为三，前四个县现属安徽省黄山市，绩溪县今属安徽省宣城市，婺源县今属江西省上饶市。徽州行政上不复存在，但在传统文化的潜意识里，我更愿意称之这些地区为徽州。利用周末闲暇时光，第一次走进古徽州的黟县和歙县（这两个县的名字发音估计很多中国人都未必读的出来），徜徉在古村落光滑润泽的青石板路面上，虽是初见，却又时似曾相识。这些历经千年保留下来的古村落，以独特的方式满足着我们对传统文化的追求，对世外桃源的向往。中国有着多种多样的传统建筑民居，徽派民居是保存最为悠久且仍被当地民众广泛使用的建筑方式。徽州村落背倚秀美青山，清流抱村穿户，明清时期的建筑静眼旁观世事沧桑变幻，高大的马头墙流露着睥睨的表情，黛青的檐瓦飞扬着别样的韵致，灰白的屋壁被雨水涂画出时间的斑驳，门罩、天井、花园、漏窗、房梁、屏风、家具……都在无声地展示着精心的设计与精美的手艺。徽州是黑、白、灰的调子，像极了中国的水墨画，称之为水墨徽州最恰当不过。徽州，是一方地理，是一段历史，更是一种文化。一代一代传承的徽文化，一笔一画镌刻在黛瓦粉墙间。这里有走不完的村落，看不尽的风景，吟不够的诗歌，对我个人来说，具有浓浓中国风和文艺范的徽州，一直处于中国民居的C位。美人靠，街巷连，山环水绕，黛瓦粉墙。徽州村落是一张张地方志的册页，朝夕生活期间的人们，是册页里一个个鲜活的文字。烟霞百里是一曲曲歌谱的音乐，默默伫立的民居建筑，是音乐里一节节跳动的音符。徜徉在徽州温润的意境里，擦拭历史的尘埃。今世的徽州，像一方古朴的砚台，古墨被岁月研磨，又在水中慢慢洇开，生动了整个江南。此行亮点（1）黟县小桃源，烟霞百里间——西递西递因村边有水西流，又因古有递送邮件的驿站，故而得名。西递素有“桃花源里人家”之称，曲径通幽的青石板路，通向沉睡百年的老牌坊、老宅院、老祠堂，也映照着西递九百年的风雨沧桑。（2）幽巷古居溪路引，凡人到此尽成仙——宏村宏村绵延至今已有八百余年，地势较高，经常云蒸霞蔚，有时如浓墨重彩，有时似泼墨写意，真好似一幅徐徐展开的山水长卷，被誉为“中国画里的乡村”。（3）呈坎双贤里、江南第一村——呈坎呈坎整个村落按《易经》、“阴（坎），阳（呈），二气统一，天人合一”的八卦风水理论选址布局，依山傍水，形成三街，九十九巷宛如迷宫，高耸的粉墙黛瓦，跌落水中，青山如黛，绿水成画。（4）桃花流水杳然去，别有天地非人间——卢村卢村其中闻名遐迩的“木雕楼”为徽派木雕艺术的极品，由当时主人雇用工匠花20年时间精雕细刻而成，被誉为“徽州木雕第一楼”。（5）慈孝天下无双里，锦绣江南第一乡——堂樾牌坊棠樾的七连座牌坊群，不仅体现了徽文化程朱理学“忠、孝、节、义”伦理道德的概貌，也包括了内涵极为丰富的“以人为本”的人文历史，同时亦是徽商纵横商界三百余年的重要见证。', '2', '1', '公开', '0', '安徽省黄山市徽州区', '0');
INSERT INTO `wt_travelnote` VALUES ('71', '823938208@qq.com', '2018-12-28 14:29:28', '河北省', '秦皇岛市', '12', ' 2018乐岛·海豚音乐节', '6月23日、24日，国内首家海洋动物参与互动的海洋主题音乐嘉年华——海豚和朋友的音乐节，在秦皇岛·乐岛海洋王国成功举办。此次音乐涵盖了民谣、摇滚、朋克、电音等多种音乐风格，陈粒、陈鸿宇、GALA、简迷离等8组音乐人助阵，与两万余名现场观众共同掀起了一股欢乐热潮与音乐巨浪。在首日的演出中，来自中国传媒大学的原创乐队炽热星球带来首演，一展新生力量；唱作歌手拜尔与观众热力互动，圈粉无数；民谣诗人陈鸿宇手持吉他弹唱，飘逸如仙，让观众如入梦境；压轴嘉宾GALA身穿泳衣登台，一首《追梦赤子心》引发万人大合唱，将气氛掀到最**！第二日的演出中，秘密俱乐部首个登台，以精彩的表演开启新的音乐盛宴；乐岛的老朋友隔壁团时隔一年再度来袭，嗨翻全场！中法音乐组合简迷离，引动全场呐喊高呼，实力证明，音乐无国界！陈粒作为压轴嘉宾出场，带来《大梦》《走马》《光》《芳草地》《小半》等广为传唱的歌曲，演唱之余更俏皮地与观众谈笑，引发一波又一波尖叫。打动你，不止用音乐。乐岛作为秦皇岛市海洋旅游的名片，“国家AAA**旅游景区”、“中国最佳休闲主题公园”的身份，便注定了这场音乐节不仅是一次音乐盛会，更是一次海洋欢乐大趴。本届音乐节以“关注海洋生态，守护海洋生灵”为主题，现场布置有海洋垃圾危害宣传科普和垃圾分类回收装置。在音乐节结束后，现场观众自发协助志愿者捡拾沙滩上遗留的垃圾，将公益化为行动。音乐节主办方乐岛海洋王国十余年来始终坚持发展海洋旅游、传播海洋文化、保护海洋环境和动物。此次音乐节的**落幕，是乐岛海洋王国“海洋+”发展模式的一次创新且成功的尝试。', null, '1', '公开', '0', '河北省秦皇岛市山海关区', '0');
INSERT INTO `wt_travelnote` VALUES ('72', '823938208@qq.com', '2018-12-28 14:31:48', '河北省', '承德市', '12', '【背着Doughnut去旅行】', '从北京自驾到承德丰宁坝上，途径风景如画的国家一号风景大道，万亩金灿灿的油菜花儿吸引人们目光，不顾旅途疲劳停下车按下快门，一望无际的油菜花海让人感叹比婺源还要美。走进油菜花海，**花朵艳丽柔嫩，吐露淡雅的香味，一眼望不到头非常壮观，远处村落房屋白墙黛瓦，一排排错落有致，在油菜花的映衬下误以为到了江南又胜似江南，美不胜收。远处的山脉，草原，眼前的油菜花，红绿相间构成让人心醉的画面，在蓝天的照应下更加绚烂多彩。漫步在田野上，微风摇曳着花草上布满露珠，雨后的草原格外可人，望着远山近水，呼吸着清新自然的空气，美好的瞬间温暖了整个世界，南方的油菜花花期短暂，这里的油菜花一直开到9月。走进神仙谷七彩森林，穿过一片白桦林！离开油菜花花海，驱车前往神仙谷七彩森林，这里海拔1560米昼夜温差大，年平均气温16度左右体感凉爽，参观满族民俗文化园区了解满族的文化、民俗、风土人情后。途径图腾柱广场，屹立的12根满族特色图腾柱，图腾柱高8米，直径0.8米。图腾柱体现了满族最原始自然崇拜，柱子上雕刻有动物或半人半兽形象，以象征其氏族的图腾祖先满语称之为斑吉柱，在蓝天映衬下很醒目。在景区入口蒙古演员们跳起迎客舞，热情纯朴节奏明快的舞姿，蒙古风情的装扮感染在场每个人。通过一段土路，沿着全长5公里的木栈道徒步前行，经过湿地草原、玫瑰园、落叶曲径，玻璃栈道，天镜湖、森林木屋、五彩池、蘑菇街，白桦林、丛林穿越等景点，最终到森林部落，植被茂盛郁郁葱葱。森林深处雕塑让人们回忆起白雪公主和七个小矮人，还有熊出没光头强的故事，大人和孩子们争前恐后去拍照，这一刻仿佛进入童话世界。沿着木栈道走在丛林中，登上数级木质台阶，站在玻璃栈桥上跳跃真需要勇气，山湖相依景色超级美妙。蘑菇街很有意思，有小木屋可以休息，丛林草地上的蘑菇不太多，等到9月是蘑菇生长旺盛季节。一路上松柏枝、树叶遮阳蔽日，空气中好闻的松树味道，飞舞的彩色蝴蝶，栈道两旁的落叶松、樟子松、白桦树等林木，原生态的环境，金莲花，野芍药、野菊花等各色野花，野草自然生长随风摆动。徒步森林草原微微出汗，在2公里处稍加休息，一曲草原之歌飘向远方，阳光从树林缝隙洒在身上，重归大自然让人流连忘返。这里有草原、森林、湿地、丘陵、湖泊，森林覆盖率60%以上，绿草茵茵野花遍地，森林里的树木和花草随季节交替呈现出不同色彩，所以被称为七彩森林。走到木栈道的尽头，有好玩的拓展项目滑梯、穿越隧道、丛林索道、空中飞人等，根据自己的体力选择，玩累了也可以坐着小火车穿梭于七彩森林坐到起点，呼吸着凉爽的风让人不禁想起童年美好时光。走出森林，路过村子正赶上牧民放牛，奶牛很有秩序的排队，风吹草低见牛羊美景很和谐的画面。然后直接驱车在丰宁天马飞行小镇观看一场精彩的马术表演，现场竞争激烈座无虚席，牛仔们队员策马奔腾，齐心合力将牛群中随机指定的三头牛，全部赶入围栏内以最短时间的牛仔队获胜。在七彩森林，清晨看草原日出赏湖边美景，感受浓郁的乡村气息带来的愉悦心情，傍晚景区内有满族风情表演，夜空响起悠扬的马头琴，跳起奔放的蒙古舞，红彤彤的篝火气氛热烈，焦香肆意的烤全羊，大家围在篝火旁一起嗨起来，热情欢乐的舞蹈，度过清凉舒爽的不眠之夜。', null, '1', '公开', '0', '河北省承德市丰宁满族自治县', '0');
INSERT INTO `wt_travelnote` VALUES ('73', '823938208@qq.com', '2018-12-28 14:35:40', '河北省', '承德市', '17', '旅行在河北', '环游中国一直都没有停歇，这一路除了欣赏各地的风景，我也从来不会错过任何感兴趣的美食！这次来到河北承德，吃几个特色菜自然也是少不了。作为一个海南人，我习惯把米饭当主食，所以这天的午餐我打算找一家既有当地特色，又以米饭为主食的餐厅，于是印象承德就这样“入选”啦，我想着既然名字叫的如此响亮，菜品应该会不错。初来乍到，还是得听听推荐，所以我最先选了“承德老三样”，38元一份，听这有故事的菜名，我是真的挺好奇，这三样到底是什么呢？上桌后，我发现它们原来是最常见的：冬瓜、豆腐、牛肉！分别用不同的小碗盛着，看起来分量挺小，但很经吃，那味道到底怎么样呢？这三样菜的口味其实都比较淡，尤其是冬瓜片的口感很熟悉，若不说这里是承德，我还以为在海南吃饭呢，这种从味觉引发的亲切感，让我感觉还不赖哦！这盘小丸子其实是豆腐，看起来是不是不太像？其实我咬了一口以后，依然不太确定是什么，所以还特意请教了一下服务员，才知道这真的是豆腐丸子，不过我不太能读懂它作为承德老三样的特别，值得一尝是肯定的，但还没到足以推荐的程度啦！三样中的最后一样，是这盘颜色较深的牛肉！作为炖煮型的牛肉块，它是入味的，无论是从牛肉本身的肉质，还是后期的调味，都刚刚好，是米饭的好伴侣，加上分量不小，算得上优秀哦！除了老三样，我还在承德第一次吃到了莜面！可能南方的朋友听到“莜面”这个词时是有点懵的，好啦，起码我是这样的，就连点菜时读出来都有点拗口，因为我不仅没吃过，而且几乎没听过。让我决定选它的原因是，它有一个很好听的名字：坝上草原浇莜面！刚游玩了草原的我自然是感兴趣的。这份面的出现，让我对承德有了一个特别的印象，那就是面可以是蜂窝状的！酸菜做成的卤汁直接浇在了顶上，均匀分布。面是粘连于一起的，不能一圈一圈单独夹出，但因为“雨露均沾”，所以每一块伴有卤汁的莜面吃起来都非常顺滑，也显软糯。纵使我再喜欢美食，承德的特色再多，我也要量胃口而行呐！这一餐的菜是足够的了，加上一杯当地的山楂汁解腻，酸甜遍布口腔，足以！说了中餐，不防再讲讲我这份看似简单，实则非也的晚餐吧！因为中午吃得晚，分量也多，我想着晚餐简单为好，便选了一人份的米线，12元一份，可我万万没想到这一人份是一大锅！还会专门加配一副碗筷，大汤勺与小汤勺各一个。米线，蘑菇，木耳，金针菇，青菜，豆芽，培根……食材多得我不敢相信。旅行路上和北方的朋友说起承德这锅米线，她却说：米线不应该都是这样的一大锅吗？我想说：一锅还不是问题，问题是这一锅也太良心呀！说说你们吃的米线是多大一份呀？', null, '1', '公开', '0', '河北省承德市双桥区翠桥路11号', '0');
INSERT INTO `wt_travelnote` VALUES ('74', '823938208@qq.com', '2018-12-28 14:38:54', '北京市', '北京市', '15', ' 暖阳又雪 激情密云', '2月11日，北京市密云区旅游发展委员会开展“暖阳又雪 **密云”曁2018京津冀生态冰雪旅游精品路线推荐活动，整合北京密云与河北承德冬季冰雪旅游资源，两地共同打造京北生态冰雪旅游圈，推进跨区域旅游，形成跨区域游客互送机制。活动邀请来自北京电视台、人民日报海外版、中国旅游报、国际在线、优酷、凤凰等主流媒体近50家对密云、承德进行实地考察，河北新闻网、北方网等河北、天津地区主流媒体相继报道。据了解，受益于冬奥会带来的重要契机，冰雪运动迎来了历史性的发展机遇，这也是区域旅游产业发展融合的一次重要利好。自打造京北生态冰雪旅游圈以来，密云与河北地区已是第四次联合开展四季旅游主题系列活动。由密云城区向东北方向，出古北口镇，经滦平、兴隆到达承德市，由具有两百余年历史的古北口镇古御道串联起的城市，又一次因冰雪结成了一段奇缘。据了解，受益于冬奥会带来的重要契机，冰雪运动迎来了历史性的发展机遇，这也是区域旅游产业发展融合的一次重要利好。自打造京北生态冰雪旅游圈以来，密云与河北地区已是第四次联合开展四季旅游主题系列活动。由密云城区向东北方向，出古北口镇，经滦平、兴隆到达承德市，由具有两百余年历史的古北口镇古御道串联起的城市，又一次因冰雪结成了一段奇缘。除此之外，两地还通过整合区域间冬季滑雪场、养生温泉、冰雪景观等特色生态资源和主打产品资源，联合打造了两条冰雪主题跨区四日游路线供游客选择。通过密云联合承德开展的线路考察活动，进一步加强京津冀旅游市场的拓展及旅游资源整合，在延长京北生态冰雪旅游产业链的同时，提升冰雪旅游品牌力、持续力，推进旅游市场一体化建设。密云旅游咨询服务电话：010-69045766/51152018京津冀生态冰雪旅游精品路线推荐主推线路一：第一天：从北京出发，沿着京承高速到16出口，直达密云南山滑雪场，体验**滑雪、畅游初中高雪道，尽情飞舞，专业教练指导，可以观看大型专业赛事，一饱眼福。下午沿密云城区外环、檀西路前往冶仙塔景区，乘坐缆车城区景观、听民间冶塔仙灯的故事。再沿着密溪路赴密云水库内湖到云湖度假村入住。第二天：从度假村出发前往清凉谷景区或者桃源仙谷景区，登山沿途观赏冰山、冰屋、冰川、冰挂等景观，还可以体验怀旧冰车，登水晶长城，挑战攀冰运动项目。中午可以在景区内午餐，也可以在返回途中云水花溪乡村酒店品尝特色美食。下午沿着京承高速约1个小时行程赴古北水镇，探访小镇文化、圣诞主题系列精彩活动，夜游水镇，欣赏梦幻灯光，游览长城夜色、体验养生温泉。第三天：沿京承高速公路赴承德，途径滦平县金山岭长城脚下美丽乡村—花楼沟村，体验农家民俗风味；到达承德市区后（沿京承高速公路行驶约80公里），逛避暑山庄及周围寺庙体验承德深厚的皇家文化、佛教文化、满蒙文化；后经承赤高速承围线行驶约80公里到达隆华县七家镇温泉村，摘温泉大棚草莓等新鲜果蔬，体验温泉小镇民宿，或入住枫水湾国际森林温泉城。主推线路二：第一天：由北京出发，沿着京承高速行驶，从16出口下高速，沿着水库风景区方向赴云佛山滑雪场，体验惊险**的滑雪运动，可以带着孩子在儿童娱乐区，涂鸦戏雪，滑雪圈、推雪车、挖掘机、儿童滑雪车以及进行儿童体能训练等。中午可以在雪场内用餐，也可以在雪场旁边的鱼街花溪鱼香、金鼎鱼香、龙福源等特殊餐馆享用灶台鱼，热气腾腾，醇香浓郁，正式冬季进补的最佳美食。下午沿着密溪路往密云城区方向行驶，途径北京海湾半山温泉酒店，入住酒店，可以私享汤池，对颈肩腰部**保健，去除疲劳，舒缓身心，释放自我。第二天：从酒店出发，沿着密溪路、琉璃路向石城镇行驶赴黑龙潭景区，观赏冰瀑、冰挂，一路聆听风铃的美妙歌声，进入冰雪奇幻世界。原路返回，沿密溪路前往河南寨镇，赴康顺达生态园，采摘新鲜的蔬果，捡拾鸡蛋，到厨房亲自烹制生态健康午餐，赴一场亲密亲子家庭游。下午沿着京承高速前往古北水镇，入住在别致的特色客栈，领略小镇的冬季倩影。傍晚开始游览圣诞主题系列精彩活动，夜游水镇，欣赏梦幻灯光，游览长城夜色、体验养生温泉。第三天：沿京承高速公路行驶约100公里赴承德，游览避暑山庄，体验在皇家园林溜冰戏雪的乐趣；晚上逛鼎盛皇家灯会，集彩灯嘉年华、民俗非遗表演、民间手工艺展示、特色小吃等板块融为一体的皇家文化和市井民俗。第四天：从承德市区出发，沿承赤高速承围御克线行驶约220公里，到达国家“一号风景大道”起点塞罕坝国家森林公园，感受雪野无垠、玉树琼花的美景，在北方冬天最原始的茫茫林海雪原尽情撒欢。从这里出发沿国家“一号风景大道”行驶180公里，沿途可尽情领略坝上草原独有的雪季风光。到达京北第一草原后，七彩森林冰雪节、中国马镇的首届冰雪节、**节等十几项系列活动，冰雪体验、冰雕展示、特色美食，让每一个来玩的游客既能深刻的体验**与速度的碰撞，又能享受难得的亲子时光。经怀柔方向直接返回北京。', null, '1', '公开', '0', '北京市北京市密云区', '0');
INSERT INTO `wt_travelnote` VALUES ('75', '1473558528@qq.com', '2019-01-01 10:27:05', '河北省', '石家庄市', '0', '图片发布了', '图片发布了', null, '0', '公开', '0', '河北省石家庄市平山县', '0');
INSERT INTO `wt_travelnote` VALUES ('76', '1473558528@qq.com', '2019-01-01 10:44:23', '河北省', '石家庄市', '0', '找路径', '找路径啊', null, '0', '公开', '0', '河北省石家庄市裕华区', '0');

-- ----------------------------
-- Table structure for `wt_user`
-- ----------------------------
DROP TABLE IF EXISTS `wt_user`;
CREATE TABLE `wt_user` (
  `email` varchar(30) NOT NULL,
  `user_password` varchar(16) DEFAULT NULL,
  `user_status` enum('正常','禁用') DEFAULT '正常',
  PRIMARY KEY (`email`)
) ENGINE=MyISAM DEFAULT CHARSET=gbk;

-- ----------------------------
-- Records of wt_user
-- ----------------------------
INSERT INTO `wt_user` VALUES ('12345678@qq.com', '12345678', '正常');
INSERT INTO `wt_user` VALUES ('34567888@126.com', '77777777', '正常');
INSERT INTO `wt_user` VALUES ('abcdefg@163.com', 'aaaaaaaaaa', '正常');
INSERT INTO `wt_user` VALUES ('824691817@qq.com', '123456789', '正常');
INSERT INTO `wt_user` VALUES ('823938208@qq.com', '9876543210.', '正常');
INSERT INTO `wt_user` VALUES ('1473558528@qq.com', '123456789', '正常');
INSERT INTO `wt_user` VALUES ('1005796431@qq.com', '12345678', '正常');

-- ----------------------------
-- Table structure for `wt_user_detail`
-- ----------------------------
DROP TABLE IF EXISTS `wt_user_detail`;
CREATE TABLE `wt_user_detail` (
  `email` varchar(30) NOT NULL,
  `username` varchar(24) DEFAULT NULL,
  `sex` enum('男','女','秘密') DEFAULT '男',
  `province` varchar(16) DEFAULT NULL,
  `city` varchar(40) DEFAULT NULL,
  `user_description` varchar(150) DEFAULT '这个人很懒，什么都没有留下',
  `userhead` varchar(100) DEFAULT NULL,
  `register_time` datetime DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=MyISAM DEFAULT CHARSET=gbk;

-- ----------------------------
-- Records of wt_user_detail
-- ----------------------------
INSERT INTO `wt_user_detail` VALUES ('12345678@qq.com', '归途', '男', '河北省', '石家庄市', '想回家！！！！！', 'image\\avatar\\f15d3cbf28296cde63c72de0711661a9.png', '2018-11-23 20:44:01');
INSERT INTO `wt_user_detail` VALUES ('34567888@126.com', '我是测试2', '女', '河北省', '石家庄市', '这个人很懒，什么都没有留下', 'image/avatar/avatar4.png', '2018-11-20 20:43:55');
INSERT INTO `wt_user_detail` VALUES ('abcdefg@163.com', 'aaaaaaaaaa', '秘密', '河北省', '石家庄市', '这个人很懒，什么都没有留下', 'image/avatar/avatar4.png', '2018-11-26 20:43:50');
INSERT INTO `wt_user_detail` VALUES ('824691817@qq.com', '偷花哥假发', '女', '河北省', '石家庄市', '这个人很懒，什么都没有留下', 'image/avatar/avatar4.png', '2018-12-26 20:22:14');
INSERT INTO `wt_user_detail` VALUES ('823938208@qq.com', '觹xi', '秘密', '河北省', '石家庄市', '这个人很懒，什么都没有留下', 'image/avatar/avatar4.png', '2018-12-27 10:42:16');
INSERT INTO `wt_user_detail` VALUES ('1473558528@qq.com', '半个字符', '秘密', null, null, '这个人很懒，什么都没有留下', 'image/avatar/avatar4.png', '2018-12-29 17:23:54');
INSERT INTO `wt_user_detail` VALUES ('1005796431@qq.com', '八百个字符', '秘密', null, null, '这个人很懒，什么都没有留下', 'image/avatar/avatar4.png', '2019-01-01 11:47:02');
