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

-- 테이블 public.tb_c_menu_code 구조 내보내기
CREATE TABLE IF NOT EXISTS "tb_c_menu_code" (
	"menu_id" CHARACTER VARYING(4) NOT NULL COMMENT E'',
	"menu_par_id" CHARACTER VARYING(4) NULL DEFAULT NULL COMMENT E'',
	"menu_nm" CHARACTER VARYING(50) NULL DEFAULT NULL COMMENT E'',
	"menu_icon" CHARACTER VARYING(32) NULL DEFAULT NULL COMMENT E'',
	"menu_url" CHARACTER VARYING(128) NULL DEFAULT NULL COMMENT E'',
	"priority" INTEGER NULL DEFAULT NULL COMMENT E'',
	"use_yn" CHARACTER(1) NULL DEFAULT NULL COMMENT E'',
	PRIMARY KEY ("menu_id")
);

-- 테이블 데이터 public.tb_c_menu_code:0 rows 내보내기
/*!40000 ALTER TABLE "tb_c_menu_code" DISABLE KEYS */;
INSERT INTO "tb_c_menu_code" ("menu_id", "menu_par_id", "menu_nm", "menu_icon", "menu_url", "priority", "use_yn") VALUES
	(E'R005', E'R000', E'Bot 메뉴로그', E'', E'/teams/botMenuLog.do', 5, E'Y'),
	(E'R001', E'R000', E'Bot 관리', E'', E'/teams/botInfo.do', 1, E'Y'),
	(E'R000', E'R000', E'BOT', E'fa-wechat', E'', 0, E'Y'),
	(E'R002', E'R000', E'Bot\'s Rooms', E'', E'/teams/rooms.do', 2, E'Y'),
	(E'R003', E'R000', E'Bot\'s Webhook', E'', E'/teams/webhooks.do', 3, E'Y'),
	(E'A000', E'A000', E'DashBoard', E'fa-dashboard', E'/dashboard/init.do', 0, E'Y'),
	(E'B000', E'B000', E'직원정보', E'fa-user', E'/mngemp/empInfo.do', 0, E'Y'),
	(E'E000', E'E000', E'미사용', E'', E'', 0, E'N'),
	(E'F000', E'F000', E'미사용', E'', E'', 0, E'N'),
	(E'N000', E'N000', E'코드관리', E'fa-list-ul', E'', 0, E'Y'),
	(E'N001', E'N000', E'메뉴코드관리', E'', E'/mngcode/menuCode.do', 1, E'Y'),
	(E'N002', E'N000', E'메뉴매핑관리', E'', E'/mngcode/menuCodeMap.do', 2, E'Y'),
	(E'N003', E'N000', E'공통코드관리', E'', E'/mngcode/commCode.do', 3, E'Y'),
	(E'P000', E'P000', E'사용자관리', E'fa-user', E'/mnguser/userInfo.do', 0, E'Y'),
	(E'Q000', E'Q000', E'환경설정', E'fa-gear', E'', 0, E'Y'),
	(E'Q001', E'Q000', E'시스템설정', E'', E'/mngconf/systemConfig.do', 1, E'Y'),
	(E'Q002', E'Q000', E'운영환경설정', E'', E'/mngconf/operConfig.do', 2, E'Y'),
	(E'Q003', E'Q000', E'차트설정', E'', E'/mngconf/chartConfig.do', 3, E'Y'),
	(E'Q004', E'Q000', E'일배치설정', E'', E'/mngconf/batchConfig.do', 4, E'Y'),
	(E'C000', E'C000', E'봇메시지', E'fa-file-audio-o', E'/teams/botNoti.do', 0, E'Y'),
	(E'D000', E'D000', E'봇통계', E'fa-edit', E'', 0, E'Y'),
	(E'D001', E'D000', E'사용자별통계', E'', E'/teams/userState.do', 1, E'Y'),
	(E'D002', E'D000', E'메뉴별통계', E'', E'/teams/menuState.do', 2, E'Y'),
	(E'R004', E'R000', E'Bot 메뉴관리', E'', E'/teams/botMenuInfo.do', 4, E'Y');
/*!40000 ALTER TABLE "tb_c_menu_code" ENABLE KEYS */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
