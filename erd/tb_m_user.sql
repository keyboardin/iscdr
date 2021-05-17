-- --------------------------------------------------------
-- 호스트:                          192.168.230.142
-- 서버 버전:                        PostgreSQL 10.6 (Ubuntu 10.6-0ubuntu0.18.04.1) on x86_64-pc-linux-gnu, compiled by gcc (Ubuntu 7.3.0-16ubuntu3) 7.3.0, 64-bit
-- 서버 OS:                        
-- HeidiSQL 버전:                  9.3.0.4984
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES  */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- 테이블 public.tb_m_user 구조 내보내기
CREATE TABLE IF NOT EXISTS "tb_m_user" (
	"user_id" CHARACTER VARYING(32) NOT NULL COMMENT E'',
	"user_idx" INTEGER NULL DEFAULT NULL COMMENT E'',
	"user_pw" CHARACTER VARYING(128) NULL DEFAULT NULL COMMENT E'',
	"user_nm" CHARACTER VARYING(50) NOT NULL COMMENT E'',
	"user_dep" CHARACTER VARYING(64) NULL DEFAULT NULL COMMENT E'',
	"user_pos" CHARACTER VARYING(32) NULL DEFAULT NULL COMMENT E'',
	"user_mobile" CHARACTER VARYING(15) NULL DEFAULT NULL COMMENT E'',
	"user_email" CHARACTER VARYING(64) NULL DEFAULT NULL COMMENT E'',
	"user_type" CHARACTER VARYING(4) NULL DEFAULT NULL COMMENT E'',
	"use_yn" CHARACTER(1) NOT NULL COMMENT E'',
	"reg_date" TIMESTAMP WITHOUT TIME ZONE NOT NULL COMMENT E'',
	"upd_date" TIMESTAMP WITHOUT TIME ZONE NOT NULL COMMENT E'',
	PRIMARY KEY ("user_id")
);

-- 테이블 데이터 public.tb_m_user:0 rows 내보내기
/*!40000 ALTER TABLE "tb_m_user" DISABLE KEYS */;
INSERT INTO "tb_m_user" ("user_id", "user_idx", "user_pw", "user_nm", "user_dep", "user_pos", "user_mobile", "user_email", "user_type", "use_yn", "reg_date", "upd_date") VALUES
	(E'insung', 1, E'2hHoBXdOt62qrO3gMDettw==', E'SystemAdmin', E'UC', E'부장', E'010-4367-1084', E'sjduck3@insunginfo.co.kr', E'0001', E'Y', E'2018-11-22 10:55:51.023', E'2018-11-22 10:59:45.873'),
	(E'admin', 2, E'AeZVplDBIxtMQ3F6xegT/g==', E'관리자', E'UC', E'부장', E'010-4367-1084', E'sjduck3@insunginfo.co.kr', E'0002', E'Y', E'2018-11-08 19:05:42.61', E'2018-11-22 10:54:17.403'),
	(E'sjduck3', 3, E'TcmlZAOkmmN3DFl3Ddspnw==', E'서정덕', E'UC', E'부장', E'010-4367-1084', E'sjduck3@insunginfo.co.kr', E'0002', E'Y', E'2018-11-13 19:35:38.917', E'2018-11-22 10:54:25.193'),
	(E'wiseo', 4, E'TcmlZAOkmmN3DFl3Ddspnw==', E'서원일', E'UC', E'차장', E'010-4719-3352', E'wiseo@insunginfo.co.kr', E'0002', E'Y', E'2018-11-13 19:37:08.37', E'2018-12-21 11:08:01.175653');
/*!40000 ALTER TABLE "tb_m_user" ENABLE KEYS */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
