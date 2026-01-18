SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for blue_traits
-- ----------------------------
DROP TABLE IF EXISTS `blue_traits`;
CREATE TABLE `blue_traits` (
  `trait_category` smallint(2) unsigned NOT NULL,
  `trait_points_needed` smallint(2) unsigned NOT NULL,
  `traitid` tinyint(3) unsigned NOT NULL,
  `modifier` smallint(5) unsigned NOT NULL,
  `value` smallint(5) NOT NULL,
  PRIMARY KEY (`trait_category`,`trait_points_needed`,`modifier`)
) ENGINE=Aria TRANSACTIONAL=0 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records
-- ----------------------------
-- ACCURACY BONUS
-- ----------------------------
INSERT INTO `blue_traits` VALUES (1,4,1,25,15); 
INSERT INTO `blue_traits` VALUES (1,4,1,26,15);
INSERT INTO `blue_traits` VALUES (1,8,1,25,30); 
INSERT INTO `blue_traits` VALUES (1,8,1,26,30);
INSERT INTO `blue_traits` VALUES (1,12,1,25,45); 
INSERT INTO `blue_traits` VALUES (1,12,1,26,45); 
INSERT INTO `blue_traits` VALUES (1,16,1,25,60); 
INSERT INTO `blue_traits` VALUES (1,16,1,26,60); 
-- ----------------------------
-- ATTACK BONUS
-- ----------------------------
INSERT INTO `blue_traits` VALUES (2,4,3,23,15);
INSERT INTO `blue_traits` VALUES (2,4,3,24,15);
INSERT INTO `blue_traits` VALUES (2,8,3,23,30);
INSERT INTO `blue_traits` VALUES (2,8,3,24,30);
INSERT INTO `blue_traits` VALUES (2,12,3,23,45);
INSERT INTO `blue_traits` VALUES (2,12,3,24,45);
INSERT INTO `blue_traits` VALUES (2,16,3,23,60);
INSERT INTO `blue_traits` VALUES (2,16,3,24,60);
-- ----------------------------
-- AUTO REGEN & REFRESH
-- ----------------------------
INSERT INTO `blue_traits` VALUES (3,4,9,370,3);
INSERT INTO `blue_traits` VALUES (4,4,10,369,2);
-- ----------------------------
-- CLEAR MIND
-- ----------------------------
INSERT INTO `blue_traits` VALUES (5,4,24,71,5);
INSERT INTO `blue_traits` VALUES (5,8,24,71,10);
INSERT INTO `blue_traits` VALUES (5,12,24,71,15);
INSERT INTO `blue_traits` VALUES (5,16,24,71,20);
INSERT INTO `blue_traits` VALUES (5,4,24,295,1);
INSERT INTO `blue_traits` VALUES (5,8,24,295,2);
INSERT INTO `blue_traits` VALUES (5,12,24,295,3);
INSERT INTO `blue_traits` VALUES (5,16,24,295,4);
-- ----------------------------
-- CONSERVE MP
-- ----------------------------
INSERT INTO `blue_traits` VALUES (6,4,13,296,10);
INSERT INTO `blue_traits` VALUES (6,8,13,296,20);
INSERT INTO `blue_traits` VALUES (6,12,13,296,30);
-- ----------------------------
-- COUNTER
-- ----------------------------
INSERT INTO `blue_traits` VALUES (7,4,17,291,10);
-- ----------------------------
-- CRIT ATK. BONUS
-- ----------------------------
INSERT INTO `blue_traits` VALUES (8,4,98,421,5);
-- ----------------------------
-- DEFENSE BONUS
-- ----------------------------
INSERT INTO `blue_traits` VALUES (9,4,4,1,20);
INSERT INTO `blue_traits` VALUES (9,8,4,1,40);
INSERT INTO `blue_traits` VALUES (9,12,4,1,60);
INSERT INTO `blue_traits` VALUES (9,16,4,1,70);
-- ----------------------------
-- DOUBLE & TRIPLE ATTACK
-- ----------------------------
INSERT INTO `blue_traits` VALUES (10,4,15,288,5);
INSERT INTO `blue_traits` VALUES (10,8,16,288,5);
INSERT INTO `blue_traits` VALUES (10,12,16,288,10);
-- ----------------------------
-- DUAL WIELD
-- ----------------------------
INSERT INTO `blue_traits` VALUES (11,4,18,259,5);
INSERT INTO `blue_traits` VALUES (11,8,18,259,10);
INSERT INTO `blue_traits` VALUES (11,12,18,259,15);
INSERT INTO `blue_traits` VALUES (11,16,18,259,20);

-- ----------------------------
-- EVASION BONUS
-- ----------------------------
INSERT INTO `blue_traits` VALUES (12,4,2,68,15);
INSERT INTO `blue_traits` VALUES (12,8,2,68,30);
INSERT INTO `blue_traits` VALUES (12,12,2,68,45);
-- ----------------------------
-- FAST CAST
-- ----------------------------
INSERT INTO `blue_traits` VALUES (13,4,12,170,15);
INSERT INTO `blue_traits` VALUES (13,8,12,170,30);
INSERT INTO `blue_traits` VALUES (13,12,12,170,40);
-- ----------------------------
-- GILFINDER & TREASURE HUNTER
-- ----------------------------
INSERT INTO `blue_traits` VALUES (14,4,20,897,1);
INSERT INTO `blue_traits` VALUES (15,4,19,303,1);
INSERT INTO `blue_traits` VALUES (15,8,64,303,1);
-- ----------------------------
-- INQUARTA
-- ----------------------------
INSERT INTO `blue_traits` VALUES (16,4,118,963,5);
-- ----------------------------
-- KILLER EFFECTS
-- ----------------------------
INSERT INTO `blue_traits` VALUES (17,4,32,230,10); -- Beast Killer
INSERT INTO `blue_traits` VALUES (18,4,33,229,10); -- Plantoid Killer
INSERT INTO `blue_traits` VALUES (19,4,35,227,10); -- Lizard Killer
INSERT INTO `blue_traits` VALUES (20,4,39,231,10); -- Undead Killer
-- ----------------------------
-- MAGIC ATTACK BONUS
-- ----------------------------
INSERT INTO `blue_traits` VALUES (21,4,5,28,20);
INSERT INTO `blue_traits` VALUES (21,8,5,28,30);
INSERT INTO `blue_traits` VALUES (21,12,5,28,40);
INSERT INTO `blue_traits` VALUES (21,16,5,28,45);
-- ----------------------------
-- MAGIC BURST BONUS
-- ----------------------------
INSERT INTO `blue_traits` VALUES (22,4,110,274,5);
INSERT INTO `blue_traits` VALUES (22,8,110,274,10);
INSERT INTO `blue_traits` VALUES (22,12,110,274,15);
-- ----------------------------
-- MAGIC DEFENSE BONUS
-- ----------------------------
INSERT INTO `blue_traits` VALUES (23,4,6,29,5);
INSERT INTO `blue_traits` VALUES (23,8,6,29,10);
INSERT INTO `blue_traits` VALUES (23,12,6,29,15);
-- ----------------------------
-- MAX HP BOOST
-- ----------------------------
INSERT INTO `blue_traits` VALUES (24,4,7,1095,50);
INSERT INTO `blue_traits` VALUES (24,8,7,1095,100);
INSERT INTO `blue_traits` VALUES (24,12,7,1095,150);
INSERT INTO `blue_traits` VALUES (24,16,7,1095,250);
-- ----------------------------
-- MAX MP BOOST
-- ----------------------------
INSERT INTO `blue_traits` VALUES (25,4,8,1096,25);
INSERT INTO `blue_traits` VALUES (25,8,8,1096,50);
-- ----------------------------
-- RESIST GRAVITY
-- ----------------------------
INSERT INTO `blue_traits` VALUES (26,4,58,249,15);
INSERT INTO `blue_traits` VALUES (26,8,58,249,30);
INSERT INTO `blue_traits` VALUES (26,12,58,249,45);
INSERT INTO `blue_traits` VALUES (26,16,58,249,60);
-- ----------------------------
-- RESIST SILENCE
-- ----------------------------
INSERT INTO `blue_traits` VALUES (27,4,52,244,15);
INSERT INTO `blue_traits` VALUES (27,8,52,244,30);
INSERT INTO `blue_traits` VALUES (27,12,52,244,45);
INSERT INTO `blue_traits` VALUES (27,16,52,244,60);
-- ----------------------------
-- RESIST SLEEP
-- ----------------------------
INSERT INTO `blue_traits` VALUES (28,4,48,240,15);
INSERT INTO `blue_traits` VALUES (28,8,48,240,30);
INSERT INTO `blue_traits` VALUES (28,12,48,240,45);
INSERT INTO `blue_traits` VALUES (28,16,48,240,60);
-- ----------------------------
-- SKILLCHAIN BONUS
-- ----------------------------
INSERT INTO `blue_traits` VALUES (29,4,106,174,10);
INSERT INTO `blue_traits` VALUES (29,8,106,174,15);
INSERT INTO `blue_traits` VALUES (29,12,106,174,20);
-- ----------------------------
-- STORE TP
-- ----------------------------
INSERT INTO `blue_traits` VALUES (30,4,14,73,10);
INSERT INTO `blue_traits` VALUES (30,4,14,73,15);
INSERT INTO `blue_traits` VALUES (30,4,14,73,20);
-- ----------------------------
-- TENACITY
-- ----------------------------
INSERT INTO `blue_traits` VALUES (31,4,117,240,5);
INSERT INTO `blue_traits` VALUES (31,4,117,241,5);
INSERT INTO `blue_traits` VALUES (31,4,117,242,5);
INSERT INTO `blue_traits` VALUES (31,4,117,243,5);
INSERT INTO `blue_traits` VALUES (31,4,117,244,5);
INSERT INTO `blue_traits` VALUES (31,4,117,245,5);
INSERT INTO `blue_traits` VALUES (31,4,117,246,5);
INSERT INTO `blue_traits` VALUES (31,4,117,247,5);
INSERT INTO `blue_traits` VALUES (31,4,117,248,5);
-- ---------------------------------------------

