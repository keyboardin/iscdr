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

-- 테이블 public.tb_c_comm_code 구조 내보내기
CREATE TABLE IF NOT EXISTS "tb_c_comm_code" (
	"code_id" CHARACTER VARYING(4) NOT NULL COMMENT E'',
	"code_nm" CHARACTER VARYING(32) NULL DEFAULT NULL::character varying COMMENT E'',
	"code_alias" CHARACTER VARYING(32) NULL DEFAULT NULL::character varying COMMENT E'',
	"code_value" CHARACTER VARYING(255) NULL DEFAULT NULL::character varying COMMENT E'',
	"group_id" CHARACTER VARYING(4) NOT NULL COMMENT E'',
	"group_nm" CHARACTER VARYING(32) NULL DEFAULT NULL::character varying COMMENT E'',
	"priority" INTEGER NULL DEFAULT NULL COMMENT E'',
	"use_yn" CHARACTER(1) NOT NULL COMMENT E'',
	"upd_date" TIMESTAMP WITHOUT TIME ZONE NOT NULL COMMENT E'',
	PRIMARY KEY ("code_id","group_id")
);

-- 테이블 데이터 public.tb_c_comm_code:52 rows 내보내기
/*!40000 ALTER TABLE "tb_c_comm_code" DISABLE KEYS */;
INSERT INTO "tb_c_comm_code" ("code_id", "code_nm", "code_alias", "code_value", "group_id", "group_nm", "priority", "use_yn", "upd_date") VALUES
	(E'0001', E'VMWARE', NULL, E'', E'CD02', E'장비타입', 1, E'Y', E'2018-10-10 16:06:25'),
	(E'0001', E'vSphere', NULL, E'', E'CD03', E'호스트타입', 1, E'Y', E'2018-08-27 11:16:36'),
	(E'0001', E'ListTable(Tail)', NULL, E'', E'CD04', E'위젯종류', 1, E'Y', E'2018-08-24 19:14:57'),
	(E'0001', E'smart-style-0', E'', E'', E'CD06', E'화면스킨', 1, E'Y', E'2018-12-12 11:32:28.78'),
	(E'0001', E'Billboard', E'', E'', E'CD07', E'차트타입', 1, E'Y', E'2018-12-12 12:37:48.063'),
	(E'0002', E'관리자', NULL, E'', E'CD01', E'사용자권한', 2, E'Y', E'2018-08-27 15:07:24'),
	(E'0002', E'UCS', NULL, E'', E'CD02', E'장비타입', 2, E'Y', E'2018-10-10 16:06:34'),
	(E'0002', E'VirtualMachine', NULL, E'', E'CD03', E'호스트타입', 2, E'Y', E'2018-08-27 11:13:10'),
	(E'0002', E'BarChart', NULL, E'', E'CD04', E'위젯종류', 2, E'Y', E'2018-11-14 15:57:22.13'),
	(E'0002', E'smart-style-1', E'', E'', E'CD06', E'화면스킨', 2, E'Y', E'2018-12-12 11:35:05.77'),
	(E'0002', E'ChartJs', E'', E'', E'CD07', E'차트타입', 2, E'Y', E'2018-12-12 12:37:53.433'),
	(E'0003', E'사용자', NULL, E'', E'CD01', E'사용자권한', 3, E'Y', E'2018-11-16 18:43:33.997'),
	(E'0003', E'CIMC', NULL, E'', E'CD03', E'호스트타입', 3, E'Y', E'2018-10-21 16:49:12'),
	(E'0003', E'LineChart', NULL, E'', E'CD04', E'위젯종류', 3, E'Y', E'2018-08-24 19:16:16'),
	(E'0003', E'smart-style-2', E'', E'', E'CD06', E'화면스킨', 3, E'Y', E'2018-12-12 11:35:11.74'),
	(E'0003', E'Flot', E'', E'', E'CD07', E'차트타입', 3, E'Y', E'2018-12-12 12:37:59.14'),
	(E'0004', E'Window', NULL, E'', E'CD03', E'호스트타입', 4, E'Y', E'2018-11-26 17:16:53.63'),
	(E'0004', E'PieChart', NULL, E'', E'CD04', E'위젯종류', 4, E'Y', E'2018-08-24 19:16:55'),
	(E'0004', E'smart-style-3', E'', E'', E'CD06', E'화면스킨', 4, E'Y', E'2018-12-12 11:35:17.793'),
	(E'0005', E'Linux', NULL, E'', E'CD03', E'호스트타입', 5, E'Y', E'2018-11-26 17:17:09.37'),
	(E'0005', E'ProgressBar(3Line)', NULL, E'', E'CD04', E'위젯종류', 5, E'Y', E'2018-08-24 19:18:25'),
	(E'0005', E'smart-style-4', E'', E'', E'CD06', E'화면스킨', 5, E'Y', E'2018-12-12 11:35:24.11'),
	(E'0006', E'ProgressBar(4Line)', NULL, E'', E'CD04', E'위젯종류', 6, E'Y', E'2018-08-24 19:19:03'),
	(E'0006', E'smart-style-5', E'', E'', E'CD06', E'화면스킨', 6, E'Y', E'2018-12-12 11:35:30.343'),
	(E'0007', E'ListTable(Grid)', NULL, E'', E'CD04', E'위젯종류', 7, E'Y', E'2018-08-24 19:19:41'),
	(E'0007', E'smart-style-6', E'', E'', E'CD06', E'화면스킨', 7, E'Y', E'2018-12-12 11:35:36.077'),
	(E'0008', E'ListTable(Bold)', NULL, E'', E'CD04', E'위젯종류', 8, E'Y', E'2018-08-24 19:20:28'),
	(E'0008', E'smart-style-7', E'', E'', E'CD06', E'화면스킨', 8, E'Y', E'2018-12-13 01:16:49.173'),
	(E'0009', E'Topology', NULL, E'', E'CD04', E'위젯종류', 9, E'Y', E'2018-08-24 19:24:29'),
	(E'0010', E'시스템모니터링1', NULL, E'', E'CD04', E'위젯종류', 10, E'Y', E'2018-11-28 09:48:35.787'),
	(E'0011', E'시스템모니터링2', NULL, E'', E'CD04', E'위젯종류', 11, E'Y', E'2018-11-28 09:47:48.42'),
	(E'0003', E'Server', NULL, E'', E'CD02', E'장비타입', 3, E'Y', E'2018-12-20 17:30:48.487402'),
	(E'0002', E'ARS기본환경수정', E'ars_basic_conf', E'N', E'CD08', E'운영환경', 2, E'Y', E'2019-01-08 10:53:59.531833'),
	(E'0001', E'주의', NULL, E'', E'CD09', E'차단고객분류', 1, E'Y', E'2018-12-21 15:39:19.374371'),
	(E'0002', E'진상', NULL, E'', E'CD09', E'차단고객분류', 2, E'Y', E'2018-12-21 15:39:39.386176'),
	(E'0003', E'최다', NULL, E'', E'CD09', E'차단고객분류', 3, E'Y', E'2018-12-21 15:39:56.817776'),
	(E'0001', E'시스템명', E'system_name', E'Insung Unified Product', E'CD05', E'시스템설정', 1, E'Y', E'2019-01-02 12:42:55.097766'),
	(E'0002', E'버전', E'system_version', E'1.0', E'CD05', E'시스템설정', 2, E'Y', E'2019-01-02 12:42:55.140064'),
	(E'0003', E'회사명', E'company_name', E'인성정보', E'CD05', E'시스템설정', 3, E'Y', E'2019-01-02 12:42:55.18208'),
	(E'0004', E'회사영문명', E'company_en_name', E'INSUNGINFO', E'CD05', E'시스템설정', 4, E'Y', E'2019-01-02 12:42:55.213167'),
	(E'0003', E'ARS거래시간관리수정', E'ars_markettime_conf', E'N', E'CD08', E'운영환경', 3, E'Y', E'2019-01-08 15:49:00.590208'),
	(E'0001', E'공지사항', E'', E'', E'CD10', E'전화기메시지', 1, E'Y', E'2019-01-14 13:40:11.597118'),
	(E'0002', E'긴급메시지', E'', E'', E'CD10', E'전화기메시지', 2, E'Y', E'2019-01-14 13:40:29.803175'),
	(E'0001', E'시스템관리자', NULL, E'', E'CD01', E'사용자권한', 1, E'Y', E'2019-01-24 20:10:35.489531'),
	(E'0006', E'화면스킨', E'system_skin', E'smart-style-0', E'CD05', E'시스템설정', 6, E'Y', E'2019-03-15 21:52:19.277059'),
	(E'0005', E'회사로고', E'logo_file', E'img_logoinsung_eng.gif', E'CD05', E'시스템설정', 5, E'Y', E'2019-02-21 11:32:38.104715'),
	(E'0001', E'차트타입', E'chart_type', E'{chart_type:\'Billboard\', list_type:\'ul\', top_color:\'#022ef9,#f90250\', loginout_color:\'#496949,#a65858\',chart_color:\'#d83265,#ac32d8,#3532d8,#327fd8,#32d84c,#aed832,#d88132,#d84f32,#d84f32,#32d856,#32b1d8,#869487\'}', E'CD08', E'운영환경', 1, E'Y', E'2019-03-05 11:43:09.438881'),
	(E'0001', E'loginForm_1', E'', E'', E'CD11', E'로그인폼', 1, E'Y', E'2019-03-15 19:44:50.000528'),
	(E'0003', E'loginForm_3', E'', E'', E'CD11', E'로그인폼', 3, E'Y', E'2019-03-15 19:45:20.898524'),
	(E'0002', E'loginForm_2', E'', E'', E'CD11', E'로그인폼', 2, E'Y', E'2019-03-15 20:30:18.347684'),
	(E'0004', E'loginForm_4', E'', E'', E'CD11', E'로그인폼', 4, E'Y', E'2019-03-16 02:03:40.631702'),
	(E'0007', E'로그인폼', E'system_login', E'loginForm_1', E'CD05', E'시스템설정', 7, E'Y', E'2019-03-19 00:57:31.499698');
/*!40000 ALTER TABLE "tb_c_comm_code" ENABLE KEYS */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
