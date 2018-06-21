SET SESSION FOREIGN_KEY_CHECKS=0;

/* Drop Tables */

DROP TABLE AC_STAT_ALARM;
DROP TABLE AC_STAT_AP_TRAFFIC;
DROP TABLE AC_STAT_CALL;
DROP TABLE AC_STAT_TRAFFIC;
DROP TABLE TB_UAST_ASSETS_CHILD;
DROP TABLE TB_UAST_PAYMENT;
DROP TABLE TB_UAST_USE_HS;
DROP TABLE TB_UAST_ITEM;
DROP TABLE TB_UAST_ASSETS;
DROP TABLE TB_UAST_BOARD_REPLY;
DROP TABLE TB_UAST_BOARD;
DROP TABLE TB_UAST_CODE;
DROP TABLE TB_UAST_COSTPRIC;
DROP TABLE TB_UAST_FILE_INFOR;
DROP TABLE TB_UAST_GODS;
DROP TABLE TB_UAST_NOTICE;
DROP TABLE TB_UAST_PRIC;
DROP TABLE TB_UAST_SRVC_CTGR;
DROP TABLE TB_UAST_USER;
DROP TABLE TRAFFIC_PROCESS_LOG;




/* Create Tables */

CREATE TABLE AC_STAT_ALARM
(
	-- STRT_TM
	STRT_TM VARCHAR(20) NOT NULL COMMENT '시작일시',
	-- END_TM
	END_TM VARCHAR(20) NOT NULL COMMENT '종료일시',
	AC_STRT_TM VARCHAR(20) NOT NULL COMMENT 'AC_STRT_TM',
	AC_END_TM VARCHAR(20) NOT NULL COMMENT 'AC_END_TM',
	CPU_CRITICAL BIGINT COMMENT 'CPU_CRITICAL',
	CPU_MAJOR BIGINT COMMENT 'CPU_MAJOR',
	MEMORY_CRITICAL BIGINT COMMENT 'MEMORY_CRITICAL',
	MEMORY_MAJOR BIGINT COMMENT 'MEMORY_MAJOR',
	MEMORY_MINOR BIGINT COMMENT 'MEMORY_MINOR',
	DISK_CRITICAL BIGINT COMMENT 'DISK_CRITICAL',
	DISK_MAJOR BIGINT COMMENT 'DISK_MAJOR',
	DISK_MINOR BIGINT COMMENT 'DISK_MINOR'
) COMMENT = 'AC_STAT_ALARM';


CREATE TABLE AC_STAT_AP_TRAFFIC
(
	-- STRT_TM
	STRT_TM VARCHAR(20) NOT NULL COMMENT '시작일시',
	-- END_TM
	END_TM VARCHAR(20) NOT NULL COMMENT '종료일시',
	AC_STRT_TM VARCHAR(20) NOT NULL COMMENT 'AC_STRT_TM',
	AC_END_TM VARCHAR(20) NOT NULL COMMENT 'AC_END_TM',
	TX_BYTE BIGINT COMMENT 'TX_BYTE',
	RX_BYTE BIGINT COMMENT 'RX_BYTE',
	TX_BPS BIGINT COMMENT 'TX_BPS',
	RX_BPS BIGINT COMMENT 'RX_BPS'
) COMMENT = 'AC_STAT_AP_TRAFFIC';


CREATE TABLE AC_STAT_CALL
(
	-- STRT_TM
	STRT_TM VARCHAR(20) NOT NULL COMMENT '시작일시',
	-- END_TM
	END_TM VARCHAR(20) NOT NULL COMMENT '종료일시',
	AC_STRT_TM VARCHAR(20) NOT NULL COMMENT 'AC_STRT_TM',
	AC_END_TM VARCHAR(20) NOT NULL COMMENT 'AC_END_TM',
	ATTEMPT VARCHAR(10) COMMENT 'ATTEMPT',
	SUCCESS BIGINT COMMENT 'SUCCESS',
	ASSOC_TOT BIGINT COMMENT 'ASSOC_TOT',
	AUTH_TOT BIGINT COMMENT 'AUTH_TOT',
	AUTH_FAIL BIGINT COMMENT 'AUTH_FAIL',
	DHCP_TOT BIGINT COMMENT 'DHCP_TOT',
	DHCP_FAIL BIGINT COMMENT 'DHCP_FAIL',
	STATE_MISMATCH VARCHAR(10) COMMENT 'STATE_MISMATCH',
	ROAMING_ATT BIGINT COMMENT 'ROAMING_ATT',
	ROAMING_SUC BIGINT COMMENT 'ROAMING_SUC',
	ROAMING_FAIL BIGINT COMMENT 'ROAMING_FAIL',
	CUR_USER BIGINT COMMENT 'Cur_User'
) COMMENT = 'AC_STAT_CALL';


CREATE TABLE AC_STAT_TRAFFIC
(
	-- STRT_TM
	STRT_TM VARCHAR(20) NOT NULL COMMENT '시작일시',
	-- END_TM
	END_TM VARCHAR(20) NOT NULL COMMENT '종료일시',
	AC_STRT_TM VARCHAR(20) NOT NULL COMMENT 'AC_STRT_TM',
	AC_END_TM VARCHAR(20) NOT NULL COMMENT 'AC_END_TM',
	TX_OCTET BIGINT COMMENT 'TX_OCTET',
	RX_OCTET BIGINT COMMENT 'RX_OCTET',
	TX_PACKET BIGINT COMMENT 'TX_PACKET',
	RX_PACKET BIGINT COMMENT 'RX_PACKET',
	TX_ERROR BIGINT COMMENT 'TX_ERROR',
	RX_ERROR BIGINT COMMENT 'RX_ERROR',
	TX_OCTET_BPS BIGINT COMMENT 'TX_OCTET_BPS',
	RX_OCTET_BPS BIGINT COMMENT 'RX_OCTET_BPS'
) COMMENT = 'AC_STAT_TRAFFIC';


-- - DEVICE
-- ITEM_01(40) : Mac_Address
-- ITEM_02(40) : IP_Address
-- ITEM_03(40) : 
-- ITEM_04(60) : 사양
-- ITEM_05(60) : 시리얼넘버
-- ITEM_06(100) : 
-- ITEM_07(100) : 비고
-- ITEM_08(2000) : 
-- 
-- - EBOOK
-- ITEM_01(40) : 작가
-- ITEM_02(40) : 출판사
-- ITEM_03(40) : 출판년월일
-- ITEM_04(60) : 제목
-- ITEM_05(60) : ISDN
-- ITEM_06(100) : 
-- ITEM_07(100) : 비고
-- ITEM_08(2000) : 
-- 
-- - VOD
-- ITEM_01(40) : 강사
-- ITEM_02(40) : 
-- ITEM_03(40) : 제작년월일
-- ITEM_04(60) : 자산명(말레이어)
-- ITEM_05(60) : 자산명(영어)
-- ITEM_06(100) : 
-- ITEM_07(100) : 비고
-- ITEM_08(2000) : 컨텐츠내용(영어)
-- ITEM_09(2000) : 컨텐츠내용(말레이어)
-- 
-- - MICE
-- ITEM_01(40) : 자산관리자ID
-- ITEM_02(40) : 
-- ITEM_03(40) : 
-- ITEM_04(60) : 자산명
-- ITEM_05(60) : 시리얼넘버
-- ITEM_06(100) : 
-- ITEM_07(100) : 
-- ITEM_08(2000) :
CREATE TABLE TB_UAST_ASSETS
(
	ASSET_ID VARCHAR(30) NOT NULL UNIQUE COMMENT '자산_ID',
	-- - Device : DEV
	-- - eBook : EBK
	-- - VOD : VOD
	-- - ETC : ETC
	ASSET_TYPE_CD VARCHAR(5) NOT NULL COMMENT '자산종류구분',
	ITEM_NM VARCHAR(80) NOT NULL COMMENT 'ITEM명',
	-- ITEM_01
	ITEM_01 VARCHAR(40) COMMENT 'ITEM_01',
	-- ITEM_02
	ITEM_02 VARCHAR(80) COMMENT 'ITEM_02',
	-- ITEM_03
	ITEM_03 VARCHAR(80) COMMENT 'ITEM_03',
	-- ITEM_04
	ITEM_04 VARCHAR(60) COMMENT 'ITEM_04',
	-- ITEM_05
	ITEM_05 VARCHAR(60) COMMENT 'ITEM_05',
	-- ITEM_06
	ITEM_06 VARCHAR(100) COMMENT 'ITEM_06',
	-- 비고
	ITEM_07 VARCHAR(100) COMMENT 'ITEM_07',
	-- ITEM_08
	ITEM_08 VARCHAR(2000) COMMENT 'ITEM_08',
	ITEM_09 VARCHAR(2000) COMMENT 'ITEM_09',
	ASSET_YN VARCHAR(4) NOT NULL COMMENT '자산상태구분',
	DEL_YN VARCHAR(1) DEFAULT 'N' NOT NULL COMMENT '삭제여부',
	COSTPRIC_ID VARCHAR(30) COMMENT '원가_ID',
	FRST_RGST_DT TIMESTAMP NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'FRST_RGST_DT',
	FRST_RGST_USER_ID VARCHAR(20) NOT NULL COMMENT 'FRST_RGST_USER_ID',
	LAST_CRCT_DT TIMESTAMP NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'LAST_CRCT_DT',
	LAST_CRCT_USER_ID VARCHAR(20) NOT NULL COMMENT 'LAST_CRCT_USER_ID',
	PRIMARY KEY (ASSET_ID)
) COMMENT = '자산';


CREATE TABLE TB_UAST_ASSETS_CHILD
(
	ASSET_CHILD_ID BIGINT(20) NOT NULL UNIQUE AUTO_INCREMENT COMMENT 'ASSET_CHILD_ID',
	LANGUAGE_TYPE VARCHAR(5) NOT NULL COMMENT 'LANGUAGE_TYPE',
	INSTRUCTOR_NAME_FIRST VARCHAR(80) COMMENT 'Instructor_name_first',
	INSTRUCTOR_NAME_LAST VARCHAR(80) COMMENT 'Instructor_name_last',
	MAJOR VARCHAR(30) COMMENT 'Major',
	EDUCATION_QUALIFICATION VARCHAR(80) COMMENT 'Education_qualification',
	WORKING_PERIOD VARCHAR(80) COMMENT 'Working_period',
	HONORS_AND_AWARDS VARCHAR(2000) COMMENT 'Honors_and_awards',
	OTHER VARCHAR(2000) COMMENT 'Other',
	ASSET_ID VARCHAR(30) NOT NULL COMMENT '자산_ID',
	PRIMARY KEY (ASSET_CHILD_ID)
) COMMENT = 'TB_UAST_ASSETS_CHILD';


CREATE TABLE TB_UAST_BOARD
(
	-- BOARD_ID
	BOARD_ID VARCHAR(30) NOT NULL UNIQUE COMMENT '게시판_ID',
	-- 제목
	BOARD_SUBJ VARCHAR(200) COMMENT '제목',
	BOARD_CONT VARCHAR(2000) COMMENT '내용',
	VIEW_COUNT BIGINT COMMENT 'VIEW_COUNT',
	FRST_RGST_DT TIMESTAMP NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'FRST_RGST_DT',
	FRST_RGST_USER_ID VARCHAR(20) NOT NULL COMMENT 'FRST_RGST_USER_ID',
	LAST_CRCT_DT TIMESTAMP NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'LAST_CRCT_DT',
	LAST_CRCT_USER_ID VARCHAR(20) NOT NULL COMMENT 'LAST_CRCT_USER_ID',
	PRIMARY KEY (BOARD_ID)
) COMMENT = '게시판';


CREATE TABLE TB_UAST_BOARD_REPLY
(
	-- REPLY_ID
	REPLY_ID VARCHAR(30) NOT NULL UNIQUE COMMENT 'REPLY_ID',
	-- REPLY_CONT
	REPLY_CONT VARCHAR(2000) COMMENT '내용',
	-- BOARD_ID
	BOARD_ID VARCHAR(30) NOT NULL COMMENT '게시판_ID',
	FRST_RGST_DT TIMESTAMP NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'FRST_RGST_DT',
	FRST_RGST_USER_ID VARCHAR(20) NOT NULL COMMENT 'FRST_RGST_USER_ID',
	LAST_CRCT_DT TIMESTAMP NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'LAST_CRCT_DT',
	LAST_CRCT_USER_ID VARCHAR(20) NOT NULL COMMENT 'LAST_CRCT_USER_ID',
	PRIMARY KEY (REPLY_ID)
) COMMENT = '게시판 댓글';


CREATE TABLE TB_UAST_CODE
(
	COMMON_CODE_ID VARCHAR(30) NOT NULL UNIQUE COMMENT '공통코드_ID',
	CODE_ID VARCHAR(5) NOT NULL COMMENT '코드_ID',
	SUB_CODE_ID VARCHAR(5) COMMENT '서브코드_ID',
	-- CODE_NAME
	CODE_NAME VARCHAR(25) NOT NULL COMMENT 'CODE_NAME',
	-- EXTRA_CODE1
	EXTRA_CODE1 VARCHAR(25) COMMENT 'EXTRA_CODE1',
	-- EXTRA_CODE2
	EXTRA_CODE2 VARCHAR(25) COMMENT 'EXTRA_CODE2',
	-- DESCRIPTION
	DESCRIPTION VARCHAR(100) COMMENT 'DESCRIPTION',
	-- CODE_SEQ
	CODE_SEQ INT COMMENT 'CODE_SEQ',
	DEL_YN VARCHAR(1) DEFAULT 'N' COMMENT '삭제여부',
	FRST_RGST_DT TIMESTAMP NOT NULL COMMENT 'FRST_RGST_DT',
	FRST_RGST_USER_ID VARCHAR(20) NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'FRST_RGST_USER_ID',
	LAST_CRCT_DT TIMESTAMP NOT NULL COMMENT 'LAST_CRCT_DT',
	LAST_CRCT_USER_ID VARCHAR(20) NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'LAST_CRCT_USER_ID',
	PRIMARY KEY (COMMON_CODE_ID)
) COMMENT = '공통코드';


CREATE TABLE TB_UAST_COSTPRIC
(
	COSTPRIC_ID VARCHAR(30) NOT NULL UNIQUE COMMENT '원가_ID',
	COSTPRIC_NM VARCHAR(40) NOT NULL COMMENT '원가명',
	-- - Device : DEV
	-- - eBook : EBK
	-- - VOD : VOD
	-- - ETC : ETC
	ASSET_TYPE_CD VARCHAR(5) NOT NULL COMMENT '자산종류구분',
	COSTPRIC_TYPE VARCHAR(20) NOT NULL COMMENT '요금구분',
	COSTPRIC BIGINT DEFAULT 0 NOT NULL COMMENT '요금',
	PRFT_MRGIN BIGINT DEFAULT 0 COMMENT '마진율',
	USER_MRGIN BIGINT DEFAULT 0 COMMENT '회원마진율',
	FINE_MRGIN BIGINT DEFAULT 0 COMMENT '패널티마진율',
	FINE BIGINT DEFAULT 0 COMMENT '패널티요금',
	DEL_YN VARCHAR(1) DEFAULT 'N' COMMENT '삭제여부',
	FRST_RGST_DT TIMESTAMP NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'FRST_RGST_DT',
	FRST_RGST_USER_ID VARCHAR(20) NOT NULL COMMENT 'FRST_RGST_USER_ID',
	LAST_CRCT_DT TIMESTAMP NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'LAST_CRCT_DT',
	LAST_CRCT_USER_ID VARCHAR(20) NOT NULL COMMENT 'LAST_CRCT_USER_ID',
	PRIMARY KEY (COSTPRIC_ID)
) COMMENT = '원가';


CREATE TABLE TB_UAST_FILE_INFOR
(
	-- UNIQUE_KEY
	UNIQUE_KEY BIGINT NOT NULL UNIQUE AUTO_INCREMENT COMMENT 'UNIQUE_KEY',
	-- PHYSICAL_FILE_NAME
	PHYSICAL_FILE_NAME VARCHAR(255) NOT NULL COMMENT 'PHYSICAL_FILE_NAME',
	-- LOGICAL_FILE_NAME
	LOGICAL_FILE_NAME VARCHAR(255) NOT NULL COMMENT 'LOGICAL_FILE_NAME',
	-- PHYSICAL_FILE_DIRECTORY
	PHYSICAL_FILE_DIRECTORY VARCHAR(150) COMMENT 'PHYSICAL_FILE_DIRECTORY',
	-- FILE_SIZE
	FILE_SIZE BIGINT COMMENT 'FILE_SIZE',
	-- use to need that upload multi file different sort of it.
	FILE_TYPE VARCHAR(10) COMMENT 'FILE_TYPE',
	FILE_CONTENTTYPE VARCHAR(50) COMMENT 'FILE_CONTENTTYPE',
	-- PHYSICAL_THUMBNAIL_DIRECTORY
	PHYSICAL_THUMBNAIL_DIRECTORY VARCHAR(150) COMMENT 'PHYSICAL_THUMBNAIL_DIRECTORY',
	-- PHYSICAL_THUMBNAIL_FILE_NAME
	PHYSICAL_THUMBNAIL_FILE_NAME VARCHAR(50) COMMENT 'PHYSICAL_THUMBNAIL_FILE_NAME',
	TAGET_ID VARCHAR(30) COMMENT '대상TABLE COLUMN ID',
	FRST_RGST_DT TIMESTAMP NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'FRST_RGST_DT',
	FRST_RGST_USER_ID VARCHAR(20) NOT NULL COMMENT 'FRST_RGST_USER_ID',
	LAST_CRCT_DT TIMESTAMP NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'LAST_CRCT_DT',
	LAST_CRCT_USER_ID VARCHAR(20) NOT NULL COMMENT 'LAST_CRCT_USER_ID',
	PRIMARY KEY (UNIQUE_KEY)
) COMMENT = 'tb_uast_file_infor';


CREATE TABLE TB_UAST_GODS
(
	GODS_ID VARCHAR(30) NOT NULL UNIQUE COMMENT '상품 ID',
	-- GODS_DVSN
	GODS_DVSN VARCHAR(20) NOT NULL COMMENT '상품구분',
	GODS_STTS VARCHAR(10) NOT NULL COMMENT '상품상태',
	GODS_NAME VARCHAR(80) NOT NULL COMMENT '상품명',
	DEL_YN VARCHAR(1) NOT NULL COMMENT '삭제여부',
	-- DESCRIPTION
	DESCRIPTION VARCHAR(100) COMMENT 'DESCRIPTION',
	SRVC_ID BIGINT NOT NULL COMMENT '서비스카테고리 ID',
	FRST_RGST_DT TIMESTAMP NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'FRST_RGST_DT',
	FRST_RGST_USER_ID VARCHAR(20) NOT NULL COMMENT 'FRST_RGST_USER_ID',
	LAST_CRCT_DT TIMESTAMP NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'LAST_CRCT_DT',
	LAST_CRCT_USER_ID VARCHAR(20) NOT NULL COMMENT 'LAST_CRCT_USER_ID',
	PRIMARY KEY (GODS_ID)
) COMMENT = '상품';


CREATE TABLE TB_UAST_ITEM
(
	ITEM_ID VARCHAR(30) NOT NULL UNIQUE COMMENT '아이템 ID',
	CNTS_NAME VARCHAR(80) NOT NULL COMMENT '아이템명',
	DEL_YN VARCHAR(1) NOT NULL COMMENT '삭제여부',
	ASSET_ID VARCHAR(30) COMMENT '자산_ID',
	GODS_ID VARCHAR(30) NOT NULL COMMENT '상품 ID',
	FRST_RGST_DT TIMESTAMP NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'FRST_RGST_DT',
	FRST_RGST_USER_ID VARCHAR(20) NOT NULL COMMENT 'FRST_RGST_USER_ID',
	LAST_CRCT_DT TIMESTAMP NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'LAST_CRCT_DT',
	LAST_CRCT_USER_ID VARCHAR(20) NOT NULL COMMENT 'LAST_CRCT_USER_ID',
	PRIMARY KEY (ITEM_ID)
) COMMENT = '아이템';


CREATE TABLE TB_UAST_NOTICE
(
	-- NOTI_ID
	NOTI_ID VARCHAR(40) NOT NULL UNIQUE COMMENT '공지사항_ID',
	NOTI_SUBJ VARCHAR(200) NOT NULL COMMENT '제목',
	NOTI_CONT VARCHAR(2000) COMMENT '내용',
	-- NOTI_DVSN
	NOTI_DVSN VARCHAR(5) COMMENT '공지구분',
	VIEW_COUNT BIGINT COMMENT 'VIEW_COUNT',
	FRST_RGST_DT TIMESTAMP NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'FRST_RGST_DT',
	FRST_RGST_USER_ID VARCHAR(20) NOT NULL COMMENT 'FRST_RGST_USER_ID',
	LAST_CRCT_DT TIMESTAMP NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'LAST_CRCT_DT',
	LAST_CRCT_USER_ID VARCHAR(20) NOT NULL COMMENT 'LAST_CRCT_USER_ID',
	PRIMARY KEY (NOTI_ID)
) COMMENT = '공지사항';


CREATE TABLE TB_UAST_PAYMENT
(
	-- ACPT_ID
	ACPT_ID VARCHAR(30) NOT NULL UNIQUE COMMENT '수납_ID',
	-- DPST_KIND
	DPST_KIND VARCHAR(5) NOT NULL COMMENT '수납종류',
	-- DPST_MTHD
	DPST_MTHD VARCHAR(5) NOT NULL COMMENT '수납방법',
	-- DPST_AMT
	DPST_AMT BIGINT DEFAULT 0 NOT NULL COMMENT '입금액',
	-- RETURN_AMT
	RETURN_AMT BIGINT DEFAULT 0 COMMENT '반환액',
	-- DSPT_DT
	DSPT_DT VARCHAR(20) NOT NULL COMMENT '입금일시',
	-- RETURN_DT
	RETURN_DT VARCHAR(20) COMMENT '반환일시',
	-- pay complision
	-- 
	PAY_KIND VARCHAR(5) COMMENT '납부구분',
	-- RMRK
	RMRK VARCHAR(100) COMMENT '비고',
	USE_HS_NMBR_ID VARCHAR(30) NOT NULL COMMENT 'USE_HS_NMBR_ID',
	FRST_RGST_DT TIMESTAMP NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'FRST_RGST_DT',
	FRST_RGST_USER_ID VARCHAR(20) NOT NULL COMMENT 'FRST_RGST_USER_ID',
	LAST_CRCT_DT TIMESTAMP NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'LAST_CRCT_DT',
	LAST_CRCT_USER_ID VARCHAR(20) NOT NULL COMMENT 'LAST_CRCT_USER_ID',
	PRIMARY KEY (ACPT_ID)
) COMMENT = '수납';


CREATE TABLE TB_UAST_PRIC
(
	PRIC_ID VARCHAR(30) NOT NULL UNIQUE COMMENT '과금_ID',
	-- pay complision
	-- 
	PAY_KIND VARCHAR(5) COMMENT '납부구분',
	PRIC_TYPE VARCHAR(5) NOT NULL COMMENT '과금타입',
	PRIC_UNIT VARCHAR(5) NOT NULL COMMENT '과금단위구분',
	FLAT_RATE BIGINT DEFAULT 0 COMMENT '정액요금',
	DEPOSIT_RATE BIGINT DEFAULT 0 COMMENT '디파짓금액',
	-- As Rent : day, As Print : per page
	RENT_DAY BIGINT COMMENT '대여일수',
	TAGET_ID VARCHAR(30) NOT NULL COMMENT '대상TABLE COLUMN ID',
	-- GOOD : GOOD
	-- ITEM : ITEM
	-- COMMERSE
	MANAGER_KIND VARCHAR(5) NOT NULL COMMENT '관리종류',
	FRST_RGST_DT TIMESTAMP NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'FRST_RGST_DT',
	FRST_RGST_USER_ID VARCHAR(20) NOT NULL COMMENT 'FRST_RGST_USER_ID',
	LAST_CRCT_DT TIMESTAMP NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'LAST_CRCT_DT',
	LAST_CRCT_USER_ID VARCHAR(20) NOT NULL COMMENT 'LAST_CRCT_USER_ID',
	PRIMARY KEY (PRIC_ID)
) COMMENT = '과금';


CREATE TABLE TB_UAST_SRVC_CTGR
(
	SRVC_ID BIGINT NOT NULL UNIQUE AUTO_INCREMENT COMMENT '서비스카테고리 ID',
	-- SRVC_CTGR_NM
	SRVC_CTGR_NM VARCHAR(30) NOT NULL COMMENT '서비스명',
	SRVC_CTGR_DSCR VARCHAR(100) NOT NULL COMMENT '서비스설명',
	DEL_YN VARCHAR(1) NOT NULL COMMENT '삭제여부',
	LEFT_SRVC_ID BIGINT NOT NULL COMMENT 'LEFT_SRVC_ID',
	RIGHT_SRVC_ID BIGINT NOT NULL COMMENT 'RIGHT_SRVC_ID',
	FRST_RGST_DT TIMESTAMP NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'FRST_RGST_DT',
	FRST_RGST_USER_ID VARCHAR(20) NOT NULL COMMENT 'FRST_RGST_USER_ID',
	LAST_CRCT_DT TIMESTAMP NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'LAST_CRCT_DT',
	LAST_CRCT_USER_ID VARCHAR(20) NOT NULL COMMENT 'LAST_CRCT_USER_ID',
	PRIMARY KEY (SRVC_ID)
) COMMENT = '서비스카테고리';


CREATE TABLE TB_UAST_USER
(
	USER_ID VARCHAR(30) NOT NULL UNIQUE COMMENT '사용자_ID',
	-- PW
	PW VARCHAR(20) NOT NULL COMMENT 'PW',
	-- NAME
	NAME VARCHAR(40) NOT NULL COMMENT '성명',
	-- SEX
	SEX VARCHAR(20) NOT NULL COMMENT 'SEX',
	BIRTHDAY VARCHAR(10) COMMENT '생년월일',
	-- TLNO
	TLNO VARCHAR(20) NOT NULL COMMENT '연락처',
	-- EMAL
	EMAL VARCHAR(100) COMMENT 'EMAIL',
	ADRRESS VARCHAR(100) COMMENT '주소',
	ETC VARCHAR(100) COMMENT '비고',
	DEL_YN VARCHAR(1) DEFAULT 'N' NOT NULL COMMENT '삭제여부',
	-- S : supervision, M : manager, U : user
	-- be Impossible to delete Supervision
	AUTHORITY VARCHAR(1) DEFAULT 'U' NOT NULL COMMENT '권한',
	FRST_RGST_DT TIMESTAMP NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'FRST_RGST_DT',
	FRST_RGST_USER_ID VARCHAR(20) NOT NULL COMMENT 'FRST_RGST_USER_ID',
	LAST_CRCT_DT TIMESTAMP NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'LAST_CRCT_DT',
	LAST_CRCT_USER_ID VARCHAR(20) NOT NULL COMMENT 'LAST_CRCT_USER_ID',
	PRIMARY KEY (USER_ID)
) COMMENT = '사용자정보';


CREATE TABLE TB_UAST_USE_HS
(
	USE_HS_NMBR_ID VARCHAR(30) NOT NULL UNIQUE COMMENT 'USE_HS_NMBR_ID',
	-- STRT_TM
	STRT_TM VARCHAR(20) COMMENT '시작일시',
	-- END_TM
	END_TM VARCHAR(20) COMMENT '종료일시',
	-- CMPL_YN
	CMPL_YN VARCHAR(5) NOT NULL COMMENT '완료여부',
	-- pay complision
	-- 
	PAY_KIND VARCHAR(5) COMMENT '납부구분',
	PRIC_TYPE VARCHAR(5) COMMENT '과금타입',
	PRIC_UNIT VARCHAR(5) COMMENT '과금단위구분',
	FLAT_RATE BIGINT DEFAULT 0 COMMENT '정액요금',
	DEPOSIT_RATE BIGINT DEFAULT 0 COMMENT '디파짓금액',
	-- As Rent : day, As Print : per page
	RENT_DAY BIGINT DEFAULT 0 COMMENT '대여일수',
	BILLING_YN VARCHAR(5) DEFAULT 'N' COMMENT 'BILLING_YN',
	USER_ID VARCHAR(30) NOT NULL COMMENT '사용자_ID',
	GODS_ID VARCHAR(30) NOT NULL COMMENT '상품 ID',
	ITEM_ID VARCHAR(30) COMMENT '아이템 ID',
	FRST_RGST_DT TIMESTAMP NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'FRST_RGST_DT',
	FRST_RGST_USER_ID VARCHAR(20) NOT NULL COMMENT 'FRST_RGST_USER_ID',
	LAST_CRCT_DT TIMESTAMP NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'LAST_CRCT_DT',
	LAST_CRCT_USER_ID VARCHAR(20) NOT NULL COMMENT 'LAST_CRCT_USER_ID',
	BILLING_YN VARCHAR(5) DEFAULT 'N' COMMENT 'BILLING_YN',
	PRIMARY KEY (USE_HS_NMBR_ID)
) COMMENT = '사용자서비스이용이력';


CREATE TABLE TRAFFIC_PROCESS_LOG
(
	-- STRT_TM
	STRT_TM VARCHAR(20) NOT NULL COMMENT '시작일시',
	-- END_TM
	END_TM VARCHAR(20) NOT NULL COMMENT '종료일시',
	AC_STRT_TM VARCHAR(20) NOT NULL COMMENT 'AC_STRT_TM',
	AC_END_TM VARCHAR(20) NOT NULL COMMENT 'AC_END_TM',
	TRAFFIC_TYPE VARCHAR(5) COMMENT 'TRAFFIC_TYPE',
	-- Y: sucess E:Error
	SUCESS_YN VARCHAR(5) COMMENT 'SUCESS_YN',
	PROCESS_DATE TIMESTAMP NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'PROCESS_DATE'
) COMMENT = 'TRAFFIC_PROCESS_LOG';



/* Create Foreign Keys */

ALTER TABLE TB_UAST_ASSETS_CHILD
	ADD FOREIGN KEY (ASSET_ID)
	REFERENCES TB_UAST_ASSETS (ASSET_ID)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE TB_UAST_ITEM
	ADD FOREIGN KEY (ASSET_ID)
	REFERENCES TB_UAST_ASSETS (ASSET_ID)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE TB_UAST_BOARD_REPLY
	ADD FOREIGN KEY (BOARD_ID)
	REFERENCES TB_UAST_BOARD (BOARD_ID)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE TB_UAST_ASSETS
	ADD FOREIGN KEY (COSTPRIC_ID)
	REFERENCES TB_UAST_COSTPRIC (COSTPRIC_ID)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE TB_UAST_ITEM
	ADD FOREIGN KEY (GODS_ID)
	REFERENCES TB_UAST_GODS (GODS_ID)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE TB_UAST_USE_HS
	ADD FOREIGN KEY (GODS_ID)
	REFERENCES TB_UAST_GODS (GODS_ID)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE TB_UAST_USE_HS
	ADD FOREIGN KEY (ITEM_ID)
	REFERENCES TB_UAST_ITEM (ITEM_ID)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE TB_UAST_GODS
	ADD FOREIGN KEY (SRVC_ID)
	REFERENCES TB_UAST_SRVC_CTGR (SRVC_ID)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE TB_UAST_USE_HS
	ADD FOREIGN KEY (USER_ID)
	REFERENCES TB_UAST_USER (USER_ID)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE TB_UAST_PAYMENT
	ADD FOREIGN KEY (USE_HS_NMBR_ID)
	REFERENCES TB_UAST_USE_HS (USE_HS_NMBR_ID)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;



