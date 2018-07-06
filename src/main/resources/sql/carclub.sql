/*
 Navicat Premium Data Transfer

 Source Server         : localhost_3306
 Source Server Type    : MySQL
 Source Server Version : 80011
 Source Host           : localhost:3306
 Source Schema         : carclub

 Target Server Type    : MySQL
 Target Server Version : 80011
 File Encoding         : 65001

 Date: 22/06/2018 22:37:50
*/

SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for car
-- ----------------------------
DROP TABLE IF EXISTS `car`;
CREATE TABLE `car`  (
  `CarID` varchar(50)   NOT NULL,
  `CarBrand` varchar(200)   NULL DEFAULT NULL,
  `CarModel` varchar(50)   NULL DEFAULT NULL,
  `CarStatus` varchar(10)   NULL DEFAULT NULL COMMENT '空闲或救援',
  PRIMARY KEY (`CarID`) USING BTREE,
  INDEX `CarID`(`CarID`) USING BTREE
) ENGINE = InnoDB ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of car
-- ----------------------------
INSERT INTO `car` VALUES ('001', '东风', '', '空闲');
INSERT INTO `car` VALUES ('002', '日产', NULL, '空闲');
INSERT INTO `car` VALUES ('003', '奥迪', NULL, '救援');

-- ----------------------------
-- Table structure for employee
-- ----------------------------
DROP TABLE IF EXISTS `employee`;
CREATE TABLE `employee`  (
  `EmployeeId` varchar(50)   NOT NULL,
  `EmployeeName` varchar(200)   NULL DEFAULT NULL,
  `EmployeeSex` varchar(50)   NULL DEFAULT NULL,
  `EmployeePhone` varchar(50)   NULL DEFAULT NULL,
  `EmployeeEmail` varchar(50)   NULL DEFAULT NULL,
  `EmployeeAddr` varchar(200)   NULL DEFAULT NULL,
  `EmployeeAge` int(255) NULL DEFAULT NULL,
  `EmployeePower` varchar(10)   NULL DEFAULT NULL,
  `username` varchar(50)   NULL DEFAULT NULL,
  `password` varchar(50)   NULL DEFAULT NULL,
  PRIMARY KEY (`EmployeeId`) USING BTREE,
  INDEX `EmployeeId`(`EmployeeId`) USING BTREE,
  INDEX `EmployeeId_2`(`EmployeeId`) USING BTREE
) ENGINE = InnoDB ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of employee
-- ----------------------------
INSERT INTO `employee` VALUES ('001', '郑伟森', '男', '13556507839', '1158181372@qq.com', '五区', 20, '1', '201624133115', '000000');
INSERT INTO `employee` VALUES ('002', '林嘉锋', '男', '13556508509', '1548132154@qq.com', '五区', 21, '0', '201624133119', '000000');

-- ----------------------------
-- Table structure for member
-- ----------------------------
DROP TABLE IF EXISTS `member`;
CREATE TABLE `member`  (
  `MemberId` varchar(50)   NOT NULL,
  `MemberName` varchar(8)   NULL DEFAULT NULL,
  `MemberSex` varchar(5)   NULL DEFAULT NULL,
  `MemberCard` varchar(20)   NULL DEFAULT NULL,
  `MemberPhone` varchar(12)   NULL DEFAULT NULL,
  `MemberEmail` varchar(30)   NULL DEFAULT NULL,
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
  INDEX `MemberId_11`(`MemberId`) USING BTREE
) ENGINE = InnoDB ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of member
-- ----------------------------
INSERT INTO `member` VALUES ('001', '党士麟', '男', '123456789', '13556502985', '1006403310@qq.com');
INSERT INTO `member` VALUES ('002', '韩孝珠', '女', '987654321', '', NULL);

-- ----------------------------
-- Table structure for remind
-- ----------------------------
DROP TABLE IF EXISTS `remind`;
CREATE TABLE `remind`  (
  `RemindId` varchar(50)   NOT NULL,
  `RemindTime` datetime(6) NULL DEFAULT NULL,
  `RemindMessage` varchar(100)   NULL DEFAULT NULL,
  `EmployeeId` varchar(50)   NULL DEFAULT NULL,
  PRIMARY KEY (`RemindId`) USING BTREE,
  INDEX `employeeKey`(`EmployeeId`) USING BTREE,
  CONSTRAINT `employeeKey` FOREIGN KEY (`EmployeeId`) REFERENCES `employee` (`employeeid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of remind
-- ----------------------------
INSERT INTO `remind` VALUES ('002', '2018-05-22 00:00:00.000000', '车辆维修', NULL);

-- ----------------------------
-- Table structure for rescue
-- ----------------------------
DROP TABLE IF EXISTS `rescue`;
CREATE TABLE `rescue`  (
  `RescueId` varchar(50)   NOT NULL,
  `RescueTime` datetime(6) NULL DEFAULT NULL,
  `RescuePlace` varchar(20)   NULL DEFAULT NULL,
  `RescueStatus` varchar(100)   NULL DEFAULT NULL,
  `MemberId` varchar(20)   NULL DEFAULT NULL,
  `CarID` varchar(50)   NULL DEFAULT NULL,
  PRIMARY KEY (`RescueId`) USING BTREE,
  INDEX `MemberId`(`MemberId`) USING BTREE,
  INDEX `CarID`(`CarID`) USING BTREE,
  CONSTRAINT `rescue_ibfk_1` FOREIGN KEY (`MemberId`) REFERENCES `member` (`memberid`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `rescue_ibfk_2` FOREIGN KEY (`CarID`) REFERENCES `car` (`carid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of rescue
-- ----------------------------
INSERT INTO `rescue` VALUES ('001', '2018-05-21 00:00:00.000000', '肇庆', '救援成功', '002', '003');

-- ----------------------------
-- Table structure for train
-- ----------------------------
DROP TABLE IF EXISTS `train`;
CREATE TABLE `train`  (
  `TrainId` varchar(50)   NOT NULL,
  `TrainTime` varchar(20)   NULL DEFAULT NULL,
  `MemberId` varchar(20)   NULL DEFAULT NULL,
  `TrainMessage` varchar(50)   NULL DEFAULT NULL,
  PRIMARY KEY (`TrainId`) USING BTREE,
  INDEX `MemberId`(`MemberId`) USING BTREE,
  CONSTRAINT `train_ibfk_1` FOREIGN KEY (`MemberId`) REFERENCES `member` (`memberid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of train
-- ----------------------------
INSERT INTO `train` VALUES ('001', '20180622', '001', '旅行路线定制');
INSERT INTO `train` VALUES ('002', '20180520', '002', '车辆维修');

-- ----------------------------
-- Table structure for travel
-- ----------------------------
DROP TABLE IF EXISTS `travel`;
CREATE TABLE `travel`  (
  `TraveId` varchar(50)   NOT NULL,
  `TraveTime` varchar(20)   NULL DEFAULT NULL,
  `TraveName` varchar(20)   NULL DEFAULT NULL,
  `MemberId` varchar(50)   NULL DEFAULT NULL,
  PRIMARY KEY (`TraveId`) USING BTREE,
  INDEX `MemberId`(`MemberId`) USING BTREE,
  CONSTRAINT `travel_ibfk_1` FOREIGN KEY (`MemberId`) REFERENCES `member` (`memberid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of travel
-- ----------------------------
INSERT INTO `travel` VALUES ('001', '20180622', '瑞士', '001');

SET FOREIGN_KEY_CHECKS = 1;
