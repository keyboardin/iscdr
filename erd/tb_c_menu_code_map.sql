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

-- 테이블 public.tb_c_menu_code_map 구조 내보내기
CREATE TABLE IF NOT EXISTS "tb_c_menu_code_map" (
	"user_type" CHARACTER VARYING(4) NULL DEFAULT NULL COMMENT E'',
	"menu_id" CHARACTER VARYING(4) NULL DEFAULT NULL COMMENT E''
);

-- 테이블 데이터 public.tb_c_menu_code_map:0 rows 내보내기
/*!40000 ALTER TABLE "tb_c_menu_code_map" DISABLE KEYS */;
INSERT INTO "tb_c_menu_code_map" ("user_type", "menu_id") VALUES
	(E'0004', E'R000'),
	(E'0004', E'R001'),
	(E'0001', E'N000'),
	(E'0001', E'N001'),
	(E'0001', E'N002'),
	(E'0001', E'N003'),
	(E'0001', E'P000'),
	(E'0001', E'Q000'),
	(E'0001', E'Q001'),
	(E'0001', E'Q002'),
	(E'0001', E'Q003'),
	(E'0001', E'Q004'),
	(E'0001', E'R000'),
	(E'0001', E'R001'),
	(E'0001', E'R002'),
	(E'0001', E'R003'),
	(E'0001', E'R004'),
	(E'0001', E'R005'),
	(E'0002', E'B000'),
	(E'0002', E'C000'),
	(E'0002', E'D000'),
	(E'0002', E'D001'),
	(E'0002', E'D002');
/*!40000 ALTER TABLE "tb_c_menu_code_map" ENABLE KEYS */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
