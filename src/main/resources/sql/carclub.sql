/*
 Navicat Premium Data Transfer

 Source Server         : MySQL
 Source Server Type    : MySQL
 Source Server Version : 50720
 Source Host           : localhost:3306
 Source Schema         : carclub

 Target Server Type    : MySQL
 Target Server Version : 50720
 File Encoding         : 65001

 Date: 06/07/2018 22:14:47
*/

SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for car
-- ----------------------------
DROP TABLE IF EXISTS `car`;
CREATE TABLE `car`  (
  `CarID` int(50) NOT NULL AUTO_INCREMENT,
  `CarBrand` varchar(200) NULL DEFAULT NULL,
  `CarModel` varchar(50) NULL DEFAULT NULL,
  `CarStatus` varchar(10) NULL DEFAULT NULL COMMENT '空闲或救援',
  PRIMARY KEY (`CarID`) USING BTREE,
  INDEX `CarID`(`CarID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of car
-- ----------------------------
INSERT INTO `car` VALUES (1, '东风', 'D60', '空闲');
INSERT INTO `car` VALUES (2, '日产', '天籁', '救援中');
INSERT INTO `car` VALUES (3, '奥迪', 'R2000', '空闲');
INSERT INTO `car` VALUES (4, '东风', 'D60', '空闲');
INSERT INTO `car` VALUES (5, '东风', 'D60', '空闲');
INSERT INTO `car` VALUES (6, '东风', 'D60', '救援中');
INSERT INTO `car` VALUES (7, '一汽', 'N7', '救援中');
INSERT INTO `car` VALUES (8, '比亚迪', 'G266', '空闲');
INSERT INTO `car` VALUES (9, '玛莎拉蒂', 'GT', '救援中');

-- ----------------------------
-- Table structure for employee
-- ----------------------------
DROP TABLE IF EXISTS `employee`;
CREATE TABLE `employee`  (
  `EmployeeId` int(50) NOT NULL AUTO_INCREMENT,
  `EmployeeName` varchar(200) NULL DEFAULT NULL,
  `EmployeeSex` varchar(50) NULL DEFAULT NULL,
  `EmployeePhone` varchar(50) NULL DEFAULT NULL,
  `EmployeeEmail` varchar(50) NULL DEFAULT NULL,
  `EmployeeAddr` varchar(200) NULL DEFAULT NULL,
  `EmployeeAge` int(255) NULL DEFAULT NULL,
  `EmployeePower` varchar(10) NULL DEFAULT NULL,
  `username` varchar(50) NULL DEFAULT NULL,
  `password` varchar(50) NULL DEFAULT NULL,
  PRIMARY KEY (`EmployeeId`) USING BTREE,
  INDEX `EmployeeId`(`EmployeeId`) USING BTREE,
  INDEX `EmployeeId_2`(`EmployeeId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of employee
-- ----------------------------
INSERT INTO `employee` VALUES (1, '郑伟森', '男', '13556507839', '1548132165@qq.com', '五区', 32, '1', '201624133115', '000000');
INSERT INTO `employee` VALUES (2, '林嘉锋', '男', '13556508509', '154813614@qq.com', '肇庆学院', 20, '0', '201624133119', '000000');
INSERT INTO `employee` VALUES (3, '黄勇畅', '男', '13556506640', '1228536020@qq.com', '五区', 31, '0', '201624133107', '000000');
INSERT INTO `employee` VALUES (4, '何亮 ', '男', '15218024214', '2609350433@qq.com', '五区', 22, '0', '201624133132', '000000');
INSERT INTO `employee` VALUES (5, '陈恩如', '男', '13556510557', '3326257306@qq.com', '五区', 21, '0', '201624133134', '000000');
INSERT INTO `employee` VALUES (7, '黄冰莹', '女', '13556514416', '1823765961@qq.com', '五区101', 19, '0', '201624', '000000');
INSERT INTO `employee` VALUES (8, '党士麟', '男', '13556502985', '1006403310@qq.com', '肇庆学院五区101', 20, '0', '201624133128', '000000');

-- ----------------------------
-- Table structure for member
-- ----------------------------
DROP TABLE IF EXISTS `member`;
CREATE TABLE `member`  (
  `MemberId` int(50) NOT NULL AUTO_INCREMENT,
  `MemberName` varchar(8) NULL DEFAULT NULL,
  `MemberCard` varchar(20) NULL DEFAULT NULL,
  `MemberPhone` varchar(12) NULL DEFAULT NULL,
  `MemberEmail` varchar(30) NULL DEFAULT NULL,
  PRIMARY KEY (`MemberId`) USING BTREE,
  INDEX `MemberId`(`MemberId`) USING BTREE,
  INDEX `MemberId_2`(`MemberId`) USING BTREE,
  INDEX `MemberId_3`(`MemberId`) USING BTREE,
  INDEX `MemberId_4`(`MemberId`) USING BTREE,
  INDEX `MemberId_5`(`MemberId`) USING BTREE,
  INDEX `MemberId_6`(`MemberId`) USING BTREE,
  INDEX `MemberId_7`(`MemberId`) USING BTREE,
  INDEX `MemberId_8`(`MemberId`) USING BTREE,
  INDEX `MemberId_9`(`MemberId`) USING BTREE,
  INDEX `MemberId_10`(`MemberId`) USING BTREE,
  INDEX `MemberId_11`(`MemberId`) USING BTREE,
  INDEX `MemberId_12`(`MemberId`) USING BTREE,
  INDEX `MemberId_13`(`MemberId`) USING BTREE,
  INDEX `MemberId_14`(`MemberId`) USING BTREE,
  INDEX `MemberId_15`(`MemberId`) USING BTREE,
  INDEX `MemberId_16`(`MemberId`) USING BTREE,
  INDEX `MemberId_17`(`MemberId`) USING BTREE,
  INDEX `MemberId_18`(`MemberId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 29 ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of member
-- ----------------------------
INSERT INTO `member` VALUES (1, '党士麟', '1001', '13556502985', '1006403310@qq.com');
INSERT INTO `member` VALUES (2, '韩孝珠', '1002', '13556502985', '1277173696@qq.com');
INSERT INTO `member` VALUES (3, '黄思远', '1003', '13575984523', '13575984523@qq.com');
INSERT INTO `member` VALUES (4, '陈志浩', '1004', '13899798654', '13899798654@qq.com');
INSERT INTO `member` VALUES (5, '陈汉朗', '1005', '13556555655', '13556555655@qq.com');
INSERT INTO `member` VALUES (6, '吴昱翰', '1006', '13568789456', '13568789456@qq.com');
INSERT INTO `member` VALUES (7, '陈淮彬', '1007', '13556312587', '13556312587@qq.com');
INSERT INTO `member` VALUES (8, '郑俊耀', '1008', '13898745563', '13898745563@qq.com');
INSERT INTO `member` VALUES (9, '李妃云', '1009', '13255650031', '13255650031@qq.com');
INSERT INTO `member` VALUES (10, '陈裕铭', '1010', '13697783027', '13697783027@qq.com');
INSERT INTO `member` VALUES (11, '姚熔茵', '1011', '13026577846', '13026577846@qq.com');
INSERT INTO `member` VALUES (12, '陈雨晴', '1012', '13577985623', '13577985623@qq.com');
INSERT INTO `member` VALUES (13, '侯秋慧', '1013', '13565657741', '13565657741@qq.com');
INSERT INTO `member` VALUES (14, '翁锦豪', '1014', '13565657746', '13565657746@qq.com');
INSERT INTO `member` VALUES (15, '章善瑞', '1015', '13698547785', '13698547785@qq.com');
INSERT INTO `member` VALUES (16, '邱源洲', '1016', '13523210232', '13523210232@qq.com');
INSERT INTO `member` VALUES (17, '黄妍芬', '1017', '13254652039', '13254652039@qq.com');
INSERT INTO `member` VALUES (18, '巫武双', '1018', '18125647895', '18125647895@qq.com');
INSERT INTO `member` VALUES (19, '郑蔓蓉', '1019', '13987456321', '13987456321@qq.com');
INSERT INTO `member` VALUES (21, '翁诗琪', '1021', '13060766156', '13060766156@qq.com');
INSERT INTO `member` VALUES (22, '陈培淳', '1022', '13006453398', '13006453398@qq.com');
INSERT INTO `member` VALUES (23, '黄炜彬', '1023', '18965652314', '18965652314@qq.com');
INSERT INTO `member` VALUES (24, '陆灵智', '1024', '18155478652', '18155478652@qq.com');
INSERT INTO `member` VALUES (25, '湛建山', '1025', '13456231589', '13456231589@qq.com');
INSERT INTO `member` VALUES (26, '郝建ddd', '1026', '13987456320', '13987456320@qq.com');
INSERT INTO `member` VALUES (27, '曾国龙', '1027', '13654789012', '13654789012@qq.com');
INSERT INTO `member` VALUES (28, '黄冰莹', '1008611', '13556508509', '1548132154@qq.com');

-- ----------------------------
-- Table structure for remind
-- ----------------------------
DROP TABLE IF EXISTS `remind`;
CREATE TABLE `remind`  (
  `RemindId` int(50) NOT NULL AUTO_INCREMENT,
  `RemindTime` date NULL DEFAULT NULL,
  `RemindMessage` varchar(100) NULL DEFAULT NULL,
  `RemindStatus` varchar(20) NULL DEFAULT NULL,
  `EmployeeId` int(50) NULL DEFAULT NULL,
  PRIMARY KEY (`RemindId`) USING BTREE,
  INDEX `employeeKey`(`EmployeeId`) USING BTREE,
  CONSTRAINT `remind_employee` FOREIGN KEY (`EmployeeId`) REFERENCES `employee` (`EmployeeId`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 5 ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of remind
-- ----------------------------
INSERT INTO `remind` VALUES (1, '2018-06-14', '办理车务', '已完成', 1);
INSERT INTO `remind` VALUES (2, '2017-05-03', '去救援', '未完成', 4);
INSERT INTO `remind` VALUES (3, '2018-06-05', '会员旅行，记得问候', '已完成', 3);
INSERT INTO `remind` VALUES (4, '2016-02-03', '去happy', '未完成', 1);

-- ----------------------------
-- Table structure for rescue
-- ----------------------------
DROP TABLE IF EXISTS `rescue`;
CREATE TABLE `rescue`  (
  `RescueId` int(50) NOT NULL AUTO_INCREMENT,
  `RescueTime` date NULL DEFAULT NULL,
  `RescuePlace` varchar(20) NULL DEFAULT NULL,
  `RescueStatus` varchar(100) NULL DEFAULT NULL COMMENT '1成功0正在-1等待',
  `MemberId` int(50) NULL DEFAULT NULL,
  `CarID` int(50) NULL DEFAULT NULL,
  PRIMARY KEY (`RescueId`) USING BTREE,
  INDEX `MemberId`(`MemberId`) USING BTREE,
  INDEX `CarID`(`CarID`) USING BTREE,
  CONSTRAINT `rescue_car` FOREIGN KEY (`CarID`) REFERENCES `car` (`CarID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `rescue_member` FOREIGN KEY (`MemberId`) REFERENCES `member` (`MemberId`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 2354 ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of rescue
-- ----------------------------
INSERT INTO `rescue` VALUES (1, '2018-05-21', '肇庆', '救援成功', 2, 3);
INSERT INTO `rescue` VALUES (2, '2018-06-22', '肇庆端州区', '正在救援', 3, 8);
INSERT INTO `rescue` VALUES (3, '2018-06-06', '肇庆', '救援成功', 2, 2);
INSERT INTO `rescue` VALUES (4, '2018-03-03', '揭阳', '等待救援', 5, 1);

-- ----------------------------
-- Table structure for train
-- ----------------------------
DROP TABLE IF EXISTS `train`;
CREATE TABLE `train`  (
  `TrainId` int(50) NOT NULL AUTO_INCREMENT,
  `TrainTime` date NULL DEFAULT NULL,
  `TrainMessage` varchar(50) NULL DEFAULT NULL,
  `Message` varchar(255) NULL DEFAULT NULL COMMENT '备注信息',
  `MemberId` int(50) NULL DEFAULT NULL,
  PRIMARY KEY (`TrainId`) USING BTREE,
  INDEX `MemberId`(`MemberId`) USING BTREE,
  CONSTRAINT `train_member` FOREIGN KEY (`MemberId`) REFERENCES `member` (`MemberId`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 557 ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of train
-- ----------------------------
INSERT INTO `train` VALUES (1, '2018-05-21', '车牌代办-保险代办', '要去车管所', 2);
INSERT INTO `train` VALUES (2, '2018-06-22', '车牌代办', '车管所', 3);
INSERT INTO `train` VALUES (3, '2018-06-13', '验证代办', '验证所', 25);
INSERT INTO `train` VALUES (4, '2018-07-20', '落户代办', '落户所', 1);
INSERT INTO `train` VALUES (5, '2018-06-26', '保险代办-验证代办', '保险验证所', 2);
INSERT INTO `train` VALUES (6, '2018-06-30', '保险代办-验证代办', '保险验证所', 5);

-- ----------------------------
-- Table structure for travel
-- ----------------------------
DROP TABLE IF EXISTS `travel`;
CREATE TABLE `travel`  (
  `TravelId` int(50) NOT NULL AUTO_INCREMENT,
  `TravelTime` date NULL DEFAULT NULL,
  `TravelAddress` varchar(20) NULL DEFAULT NULL,
  `travelPrice` int(50) NULL DEFAULT NULL,
  `MemberId` int(50) NULL DEFAULT NULL,
  PRIMARY KEY (`TravelId`) USING BTREE,
  INDEX `MemberId`(`MemberId`) USING BTREE,
  CONSTRAINT `travel_member` FOREIGN KEY (`MemberId`) REFERENCES `member` (`MemberId`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 5 ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of travel
-- ----------------------------
INSERT INTO `travel` VALUES (1, '2018-07-20', '瑞士', 1234, 1);
INSERT INTO `travel` VALUES (2, '2018-06-15', '揭阳', 1080, 3);
INSERT INTO `travel` VALUES (3, '2018-06-05', '肇庆', 1111, 5);
INSERT INTO `travel` VALUES (4, '2012-05-06', '广州', 2112, 3);

SET FOREIGN_KEY_CHECKS = 1;
