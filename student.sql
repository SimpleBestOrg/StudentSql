/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50717
Source Host           : localhost:3306
Source Database       : student

Target Server Type    : MYSQL
Target Server Version : 50717
File Encoding         : 65001

Date: 2017-03-26 21:58:46
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for activity
-- ----------------------------
DROP TABLE IF EXISTS `activity`;
CREATE TABLE `activity` (
  `activity_Id` int(11) NOT NULL,
  `activity_Name` varchar(255) NOT NULL COMMENT '活动名称',
  `activity_beginTime` datetime NOT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '活动开始时间',
  `activity_endTime` datetime NOT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '活动结束时间',
  `activity_appliTime` datetime NOT NULL COMMENT '活动申请时间',
  `activity_appliReason` varchar(255) NOT NULL COMMENT '申请活动原因',
  `activity_typeId` int(11) NOT NULL COMMENT '活动类型ID--活动类型的ID',
  `activity_appliStuId` int(11) NOT NULL COMMENT '申请这个活动的学生ID--学生表的ID',
  `activity_Flag` int(11) NOT NULL DEFAULT '0' COMMENT '活动申请状态(0未审批既:正在申请当中1:审批过同意此活动的既:活动已经存在2:审批此活动未同意的:活动不存在)',
  PRIMARY KEY (`activity_Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of activity
-- ----------------------------
INSERT INTO `activity` VALUES ('1', '同乡会', '2017-03-24 14:16:35', '2017-03-24 14:16:35', '2017-03-23 14:14:43', '增加同学之间的认识', '2', '1', '0');

-- ----------------------------
-- Table structure for activity_launch
-- ----------------------------
DROP TABLE IF EXISTS `activity_launch`;
CREATE TABLE `activity_launch` (
  `activity_lanId` int(11) NOT NULL COMMENT '活动发起表的ID',
  `activity_Id` int(11) DEFAULT NULL COMMENT '活动Id',
  `activity_lanDesc` varchar(255) DEFAULT NULL COMMENT '对这个即将发起的活动的描述既宣传此活动的描述',
  `activity_perNum` int(11) DEFAULT NULL COMMENT '允许的报名人数',
  `activity_regisCon` varchar(255) DEFAULT NULL COMMENT '申请报名条件',
  PRIMARY KEY (`activity_lanId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of activity_launch
-- ----------------------------
INSERT INTO `activity_launch` VALUES ('1', '1', '同学们之间相互认识', '10', '家乡地址必须是商丘的');

-- ----------------------------
-- Table structure for activity_photo
-- ----------------------------
DROP TABLE IF EXISTS `activity_photo`;
CREATE TABLE `activity_photo` (
  `activity_PhotoId` int(11) NOT NULL COMMENT '照片ID(主键唯一)',
  `activity_recordId` int(11) DEFAULT NULL COMMENT '活动记录ID--》活动记录ID',
  `activity_photo` varchar(255) DEFAULT NULL COMMENT '活动照片'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of activity_photo
-- ----------------------------
INSERT INTO `activity_photo` VALUES ('1', '1', '545454');

-- ----------------------------
-- Table structure for activity_record
-- ----------------------------
DROP TABLE IF EXISTS `activity_record`;
CREATE TABLE `activity_record` (
  `activity_recordId` int(11) NOT NULL COMMENT '活动记录ID',
  `activity_Id` int(11) DEFAULT NULL COMMENT '活动编号--》活动申请表(activity_application)ID',
  `activity_recordContent` varchar(255) DEFAULT NULL COMMENT '记录活动内容',
  PRIMARY KEY (`activity_recordId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of activity_record
-- ----------------------------
INSERT INTO `activity_record` VALUES ('1', '1', '今天玩的特别开心，认识了很多朋友');

-- ----------------------------
-- Table structure for activity_student
-- ----------------------------
DROP TABLE IF EXISTS `activity_student`;
CREATE TABLE `activity_student` (
  `activity_Id` int(11) NOT NULL COMMENT '活动Id',
  `stu_Id` int(11) NOT NULL COMMENT '学生Id'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of activity_student
-- ----------------------------
INSERT INTO `activity_student` VALUES ('1', '1');

-- ----------------------------
-- Table structure for activity_type
-- ----------------------------
DROP TABLE IF EXISTS `activity_type`;
CREATE TABLE `activity_type` (
  `activity_Id` int(11) NOT NULL COMMENT '活动ID',
  `activity_Name` varchar(255) DEFAULT NULL COMMENT '活动名称',
  PRIMARY KEY (`activity_Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of activity_type
-- ----------------------------
INSERT INTO `activity_type` VALUES ('1', '个人活动');
INSERT INTO `activity_type` VALUES ('2', '社团活动');

-- ----------------------------
-- Table structure for community
-- ----------------------------
DROP TABLE IF EXISTS `community`;
CREATE TABLE `community` (
  `community_Id` int(11) NOT NULL AUTO_INCREMENT COMMENT '社团ID',
  `community_Name` varchar(255) DEFAULT NULL COMMENT '社团名称',
  `community_perNum` int(11) DEFAULT NULL COMMENT '社团人数',
  `community_TeacherId` int(11) DEFAULT NULL COMMENT '社团负责老师ID-->老师teacherID',
  `community_createDate` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '社团成立日期',
  `community_appliStu` int(11) DEFAULT NULL COMMENT '社团申请人--学生表的ID',
  `community_appliReason` varchar(255) DEFAULT NULL COMMENT '社团申请原因',
  `community_appliRespon` varchar(255) NOT NULL COMMENT '社团职责',
  `community_flag` int(11) NOT NULL DEFAULT '0' COMMENT '社团状态(0正在申请创建这个社团1审批这个社团同意的2审批过这个社团未同意的)',
  PRIMARY KEY (`community_Id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of community
-- ----------------------------
INSERT INTO `community` VALUES ('1', '学习部', '8', '1', '2017-03-22 14:08:45', '1', '热爱学习', '为了学生们的学习', '1');

-- ----------------------------
-- Table structure for community_people
-- ----------------------------
DROP TABLE IF EXISTS `community_people`;
CREATE TABLE `community_people` (
  `community_PeopleId` int(11) NOT NULL,
  `community_Id` int(11) NOT NULL COMMENT '申请进入社团id',
  `community_stuId` int(11) NOT NULL COMMENT '社团学生ID',
  `community_position` varchar(255) NOT NULL COMMENT '部门中的职位',
  `community_peoFlag` varchar(255) NOT NULL COMMENT '学生申请加入这个社团的状态(0:正在申请加入这个社团1:经过审批并同意的已经成为这个社团的人员2:经过审批为同意的)',
  PRIMARY KEY (`community_PeopleId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of community_people
-- ----------------------------
INSERT INTO `community_people` VALUES ('1', '1', '2', '为了更好的学习', '0');

-- ----------------------------
-- Table structure for project
-- ----------------------------
DROP TABLE IF EXISTS `project`;
CREATE TABLE `project` (
  `project_Id` int(11) NOT NULL COMMENT '项目Id',
  `preject_Name` varchar(255) NOT NULL COMMENT '项目名称',
  `preject_plan` varchar(255) DEFAULT NULL COMMENT '项目描述',
  `preject_score` varchar(255) DEFAULT NULL COMMENT '项目分数',
  `project_stage` int(11) NOT NULL COMMENT '学期阶段',
  PRIMARY KEY (`project_Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of project
-- ----------------------------
INSERT INTO `project` VALUES ('1', '电子商城', '可以在网上购物，买东西不用出门', '80', '2');

-- ----------------------------
-- Table structure for project_revi
-- ----------------------------
DROP TABLE IF EXISTS `project_revi`;
CREATE TABLE `project_revi` (
  `project_reviewId` int(11) NOT NULL,
  `project_teaId` int(11) NOT NULL COMMENT '评审老师ID',
  `project_Id` int(11) NOT NULL COMMENT '项目ID',
  `project_Score` int(11) NOT NULL COMMENT '老师评审分数',
  PRIMARY KEY (`project_reviewId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of project_revi
-- ----------------------------
INSERT INTO `project_revi` VALUES ('1', '1', '1', '80');

-- ----------------------------
-- Table structure for project_stu
-- ----------------------------
DROP TABLE IF EXISTS `project_stu`;
CREATE TABLE `project_stu` (
  `project_Id` int(11) NOT NULL COMMENT '项目ID中间表',
  `student_Id` int(11) NOT NULL COMMENT '学生ID'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of project_stu
-- ----------------------------
INSERT INTO `project_stu` VALUES ('1', '1');

-- ----------------------------
-- Table structure for pro_sub_stage
-- ----------------------------
DROP TABLE IF EXISTS `pro_sub_stage`;
CREATE TABLE `pro_sub_stage` (
  `stage_Id` int(11) NOT NULL,
  `stage_Name` varchar(255) DEFAULT NULL COMMENT '阶段名称',
  PRIMARY KEY (`stage_Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of pro_sub_stage
-- ----------------------------
INSERT INTO `pro_sub_stage` VALUES ('1', 'S1');
INSERT INTO `pro_sub_stage` VALUES ('2', 'S2');
INSERT INTO `pro_sub_stage` VALUES ('3', 'S3');

-- ----------------------------
-- Table structure for ques
-- ----------------------------
DROP TABLE IF EXISTS `ques`;
CREATE TABLE `ques` (
  `quesetion_Id` int(11) NOT NULL COMMENT '问题ID',
  `question_Content` varchar(255) DEFAULT NULL COMMENT '问题内容',
  `question_Title` varchar(255) DEFAULT NULL COMMENT '问题标题',
  `question_typeId` int(20) DEFAULT NULL COMMENT '问题类别-->问题类别表ques_category',
  `question_StudentId` int(11) DEFAULT NULL COMMENT '学生Id',
  `question_DataTime` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '时间',
  PRIMARY KEY (`quesetion_Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ques
-- ----------------------------
INSERT INTO `ques` VALUES ('1', '你感觉李富光长的怎么样', '长相', '2', '1', '2017-03-24 13:53:58');

-- ----------------------------
-- Table structure for ques_answer
-- ----------------------------
DROP TABLE IF EXISTS `ques_answer`;
CREATE TABLE `ques_answer` (
  `ques_answer_Id` int(11) NOT NULL COMMENT '答案ID',
  `ques_answer_content` varchar(255) DEFAULT NULL COMMENT '问题答案内容',
  `ques_answer_questionId` int(11) DEFAULT NULL COMMENT '问题ID',
  `ques_answer_studentId` int(11) DEFAULT NULL COMMENT '回答答案的学生ID',
  `ques_answer_DataTime` datetime DEFAULT NULL COMMENT '问题答案时间',
  `ques_answer_parent_Id` int(11) DEFAULT NULL COMMENT '问题答案父ID'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ques_answer
-- ----------------------------
INSERT INTO `ques_answer` VALUES ('1', '看见我都想吐', '1', '3', '2017-03-25 13:55:32', '0');

-- ----------------------------
-- Table structure for ques_tocao
-- ----------------------------
DROP TABLE IF EXISTS `ques_tocao`;
CREATE TABLE `ques_tocao` (
  `ques_tocaoId` int(11) NOT NULL AUTO_INCREMENT COMMENT '问题吐槽Id',
  `questionId` int(11) NOT NULL COMMENT '答案Id',
  `ques_tucao_step` int(11) NOT NULL COMMENT '评价表的踩',
  `ques_tucao_praise` int(11) NOT NULL COMMENT '赞',
  `ques_tucao_stuId` int(11) NOT NULL COMMENT '学生ID',
  PRIMARY KEY (`ques_tocaoId`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ques_tocao
-- ----------------------------
INSERT INTO `ques_tocao` VALUES ('1', '1', '1', '0', '2');

-- ----------------------------
-- Table structure for ques_type
-- ----------------------------
DROP TABLE IF EXISTS `ques_type`;
CREATE TABLE `ques_type` (
  `que_typeId` int(11) NOT NULL COMMENT '类别ID',
  `que_typeName` varchar(255) DEFAULT NULL COMMENT '类别名称',
  PRIMARY KEY (`que_typeId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ques_type
-- ----------------------------
INSERT INTO `ques_type` VALUES ('1', '学习');
INSERT INTO `ques_type` VALUES ('2', '娱乐');

-- ----------------------------
-- Table structure for stu
-- ----------------------------
DROP TABLE IF EXISTS `stu`;
CREATE TABLE `stu` (
  `stu_Id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '学生ID 主键',
  `stu_Name` varchar(255) NOT NULL COMMENT '学生姓名',
  `stu_Sex` varchar(255) DEFAULT NULL COMMENT '学生姓名',
  `stu_Birthday` date DEFAULT NULL,
  `stu_Address` varchar(255) DEFAULT NULL,
  `stu_BirthPlace` int(11) NOT NULL COMMENT '籍贯 精确到县',
  `stu_ClassId` int(11) DEFAULT NULL COMMENT '学生班级ID',
  `stu_CommunityId` int(11) DEFAULT NULL COMMENT '学生参加的社团',
  `stu_Photo` varchar(255) DEFAULT NULL COMMENT '学生照片',
  PRIMARY KEY (`stu_Id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of stu
-- ----------------------------
INSERT INTO `stu` VALUES ('1', '郇红芝', '女', '1995-04-04', '河南商丘', '1', '1', '1', '15415641615');
INSERT INTO `stu` VALUES ('2', '李富光', '男', '1996-08-08', '河南周口', '1', '1', null, '84758484838');
INSERT INTO `stu` VALUES ('3', '曹毅波', '男', '1996-09-09', '河南平顶山', '1', '1', null, '3434343');

-- ----------------------------
-- Table structure for stu_birthplace
-- ----------------------------
DROP TABLE IF EXISTS `stu_birthplace`;
CREATE TABLE `stu_birthplace` (
  `pla_Id` int(11) NOT NULL COMMENT '出生地ID',
  `pla_Name` varchar(255) DEFAULT NULL COMMENT '籍贯名称',
  `pla_parent_Name` int(11) DEFAULT NULL COMMENT '父籍贯名称',
  PRIMARY KEY (`pla_Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of stu_birthplace
-- ----------------------------
INSERT INTO `stu_birthplace` VALUES ('1', '河南', '0');
INSERT INTO `stu_birthplace` VALUES ('2', '郑州', '1');

-- ----------------------------
-- Table structure for stu_classes
-- ----------------------------
DROP TABLE IF EXISTS `stu_classes`;
CREATE TABLE `stu_classes` (
  `cla_Id` int(11) NOT NULL COMMENT '班级ID',
  `cla_Name` varchar(255) DEFAULT NULL COMMENT '班级名称',
  PRIMARY KEY (`cla_Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of stu_classes
-- ----------------------------
INSERT INTO `stu_classes` VALUES ('1', 'GS385');

-- ----------------------------
-- Table structure for stu_friend
-- ----------------------------
DROP TABLE IF EXISTS `stu_friend`;
CREATE TABLE `stu_friend` (
  `sutId` int(11) NOT NULL COMMENT '我的ID-->学生表student',
  `frientId` int(11) NOT NULL COMMENT '朋友ID'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of stu_friend
-- ----------------------------
INSERT INTO `stu_friend` VALUES ('1', '2');
INSERT INTO `stu_friend` VALUES ('2', '3');

-- ----------------------------
-- Table structure for stu_login
-- ----------------------------
DROP TABLE IF EXISTS `stu_login`;
CREATE TABLE `stu_login` (
  `stu_No` varchar(255) NOT NULL COMMENT '学生登录账号',
  `stu_Password` varchar(255) DEFAULT NULL COMMENT '学生密码',
  `stu_Id` int(11) DEFAULT NULL COMMENT '学生ID'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of stu_login
-- ----------------------------
INSERT INTO `stu_login` VALUES ('10000', '00000', '1');

-- ----------------------------
-- Table structure for stu_recomme_friend
-- ----------------------------
DROP TABLE IF EXISTS `stu_recomme_friend`;
CREATE TABLE `stu_recomme_friend` (
  `recomm_Id` int(11) NOT NULL,
  `recomme_studentId` int(11) NOT NULL COMMENT '推荐人的ID,给谁推荐',
  `recomme_refereeStudentId` varchar(255) DEFAULT NULL COMMENT '被推荐人ID',
  `recomme_reason` int(255) DEFAULT NULL COMMENT '推荐原因',
  PRIMARY KEY (`recomm_Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of stu_recomme_friend
-- ----------------------------
INSERT INTO `stu_recomme_friend` VALUES ('1', '1', '3', '1');

-- ----------------------------
-- Table structure for stu_score
-- ----------------------------
DROP TABLE IF EXISTS `stu_score`;
CREATE TABLE `stu_score` (
  `sco_Id` int(11) NOT NULL,
  `sco_SubjectId` int(255) DEFAULT NULL COMMENT '科目ID',
  `sco_StudentId` int(11) DEFAULT NULL COMMENT '学生ID',
  `sco_theScore` int(255) DEFAULT NULL COMMENT '理论分数',
  PRIMARY KEY (`sco_Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of stu_score
-- ----------------------------
INSERT INTO `stu_score` VALUES ('1', '1', '1', '80');

-- ----------------------------
-- Table structure for stu_subject
-- ----------------------------
DROP TABLE IF EXISTS `stu_subject`;
CREATE TABLE `stu_subject` (
  `sub_Id` int(11) NOT NULL COMMENT '科目Id',
  `sub_Name` varchar(255) NOT NULL COMMENT '科目名称',
  `sub_StageId` int(11) NOT NULL COMMENT '课程阶段',
  PRIMARY KEY (`sub_Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of stu_subject
-- ----------------------------
INSERT INTO `stu_subject` VALUES ('1', 'C#', '1');

-- ----------------------------
-- Table structure for stu_tea
-- ----------------------------
DROP TABLE IF EXISTS `stu_tea`;
CREATE TABLE `stu_tea` (
  `stu_id` int(11) NOT NULL COMMENT '学生ID',
  `tea_id` int(11) NOT NULL COMMENT '老师ID'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of stu_tea
-- ----------------------------
INSERT INTO `stu_tea` VALUES ('1', '1');

-- ----------------------------
-- Table structure for talking
-- ----------------------------
DROP TABLE IF EXISTS `talking`;
CREATE TABLE `talking` (
  `talking_Id` int(11) NOT NULL,
  `talking_Content` varchar(255) DEFAULT NULL,
  `talking_StudentId` int(11) DEFAULT NULL,
  `talking_Time` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `talking_thumCount` int(11) DEFAULT NULL,
  `talking_authorityId` int(11) DEFAULT NULL COMMENT '说说的可见性',
  PRIMARY KEY (`talking_Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of talking
-- ----------------------------
INSERT INTO `talking` VALUES ('1', '今天我学会了做饭', '1', '2017-03-24 13:28:00', '1', null);

-- ----------------------------
-- Table structure for talking_authority
-- ----------------------------
DROP TABLE IF EXISTS `talking_authority`;
CREATE TABLE `talking_authority` (
  `talking_authorityId` int(11) NOT NULL COMMENT '说说可见性ID',
  `talking_tuthorityName` varchar(255) DEFAULT NULL COMMENT '说说可见性名称'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of talking_authority
-- ----------------------------
INSERT INTO `talking_authority` VALUES ('1', '对所有人开放');

-- ----------------------------
-- Table structure for talking_tocao
-- ----------------------------
DROP TABLE IF EXISTS `talking_tocao`;
CREATE TABLE `talking_tocao` (
  `talking_tocao_Id` int(11) NOT NULL COMMENT '说说的评论ID',
  `talking_id` int(11) DEFAULT NULL,
  `talking_tocao_Context` varchar(255) DEFAULT NULL COMMENT '评论说说的内容',
  `talking_tocao_parentId` int(11) DEFAULT NULL COMMENT '评论的父ID',
  `talking_tocao_studentId` int(11) DEFAULT NULL COMMENT '评论这个说说的学生Id',
  `talking_tocao_Time` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '评论时间',
  PRIMARY KEY (`talking_tocao_Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of talking_tocao
-- ----------------------------
INSERT INTO `talking_tocao` VALUES ('1', '1', '你做的饭能吃吗', '0', '2', '2017-03-24 17:35:34');

-- ----------------------------
-- Table structure for teacher
-- ----------------------------
DROP TABLE IF EXISTS `teacher`;
CREATE TABLE `teacher` (
  `tea_id` int(11) NOT NULL COMMENT '老师ID',
  `tea_name` varchar(255) NOT NULL COMMENT '老师名称',
  `tea_password` varchar(255) NOT NULL COMMENT '老师登录密码',
  PRIMARY KEY (`tea_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of teacher
-- ----------------------------
INSERT INTO `teacher` VALUES ('88888', '朱磊', '00000');
