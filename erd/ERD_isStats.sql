
/* Drop Tables */

DROP TABLE IF EXISTS tb_c_comm_code;
DROP TABLE IF EXISTS tb_c_menu_code;
DROP TABLE IF EXISTS tb_c_menu_code_map;
DROP TABLE IF EXISTS tb_m_bot;
DROP TABLE IF EXISTS tb_m_bot_menu;
DROP TABLE IF EXISTS tb_m_bot_menu_log;
DROP TABLE IF EXISTS tb_m_bot_notice;
DROP TABLE IF EXISTS tb_m_bot_room;
DROP TABLE IF EXISTS tb_m_emp;
DROP TABLE IF EXISTS tb_m_org;
DROP TABLE IF EXISTS tb_m_user;




/* Create Tables */

CREATE TABLE tb_c_comm_code
(
	code_id varchar(4) NOT NULL,
	code_nm varchar(32) NOT NULL,
	code_alias varchar(32),
	code_value varchar(255),
	group_id varchar(4) NOT NULL,
	group_nm varchar(32),
	priority int,
	-- Y : 사용
	-- N : 미사용
	-- H : HOLD
	use_yn char(1) NOT NULL,
	upd_date timestamp,
	PRIMARY KEY (code_id, group_id)
) WITHOUT OIDS;


CREATE TABLE tb_c_menu_code
(
	menu_id varchar(4) NOT NULL,
	menu_par_id varchar(4),
	menu_nm varchar(50),
	menu_icon varchar(32),
	menu_url varchar(128),
	priority int,
	-- Y : 사용
	-- N : 미사용
	-- H : HOLD
	use_yn char(1),
	PRIMARY KEY (menu_id)
) WITHOUT OIDS;


CREATE TABLE tb_c_menu_code_map
(
	user_type varchar(4),
	menu_id varchar(4)
) WITHOUT OIDS;


CREATE TABLE tb_m_bot
(
	bot_no int NOT NULL,
	bot_id varchar(255) NOT NULL,
	bot_person_id varchar(255) NOT NULL,
	bot_token varchar(255) NOT NULL,
	bot_nm varchar(128) NOT NULL,
	bot_email varchar(64) NOT NULL,
	bot_desc varchar(255),
	-- Y : 사용
	-- N : 미사용
	-- H : HOLD
	use_yn char(1),
	reg_date timestamp,
	upd_date timestamp,
	PRIMARY KEY (bot_no)
) WITHOUT OIDS;


CREATE TABLE tb_m_bot_menu
(
	bot_menu_id int NOT NULL,
	bot_menu_nm varchar(128) NOT NULL,
	bot_menu_use varchar(128) NOT NULL,
	bot_menu_desc varchar(255),
	bot_no int,
	priority int,
	view_yn char(1),
	-- Y : 사용
	-- N : 미사용
	-- H : HOLD
	use_yn char(1),
	reg_date timestamp,
	upd_date timestamp,
	PRIMARY KEY (bot_menu_id)
) WITHOUT OIDS;


CREATE TABLE tb_m_bot_menu_log
(
	seq_no bigserial NOT NULL,
	bot_no int NOT NULL,
	bot_menu_id int,
	req_message varchar(255) NOT NULL,
	person_id varchar(255),
	person_email varchar(255),
	reg_date timestamp,
	PRIMARY KEY (seq_no)
) WITHOUT OIDS;


CREATE TABLE tb_m_bot_notice
(
	seq_no bigserial NOT NULL,
	bot_no int NOT NULL,
	title varchar(255),
	conts text,
	receive_nm text,
	send_result text,
	user_id varchar(32),
	reg_date timestamp,
	PRIMARY KEY (seq_no)
) WITHOUT OIDS;


CREATE TABLE tb_m_bot_room
(
	bot_no int NOT NULL,
	roomId varchar(255) NOT NULL,
	title varchar(255),
	type varchar(255),
	isLocked varchar(8),
	lastActivity varchar(64),
	teamId varchar(255),
	creatorId varchar(255),
	created varchar(64)
) WITHOUT OIDS;


CREATE TABLE tb_m_emp
(
	emp_no varchar(20) NOT NULL,
	emp_nm varchar(60),
	org_cd varchar(20),
	org_nm varchar(200),
	pos_cd varchar(20),
	pos_nm varchar(200),
	duty_cd varchar(20),
	duty_nm varchar(200),
	extension varchar(20),
	emp_tel varchar(20),
	emp_email varchar(100),
	emp_fax varchar(20),
	emp_mobile varchar(20),
	pic_path varchar(254),
	dup_org_cd varchar(20),
	dup_org_nm varchar(200),
	stat_cd varchar(20),
	stat_nm varchar(200),
	emp_cd varchar(20),
	emp_cd_nm varchar(200),
	upd_date timestamp DEFAULT CURRENT_TIMESTAMP,
	PRIMARY KEY (emp_no)
) WITHOUT OIDS;


CREATE TABLE tb_m_org
(
	org_cd varchar(20) NOT NULL,
	org_nm varchar(200),
	emp_tel varchar(20),
	emp_fax varchar(20),
	up_org_cd varchar(20),
	head_emp_no varchar(20),
	head_emp_nm varchar(60),
	eai_use_yn char(1) DEFAULT 'y',
	upd_date timestamp DEFAULT CURRENT_TIMESTAMP,
	PRIMARY KEY (org_cd)
) WITHOUT OIDS;


CREATE TABLE tb_m_user
(
	user_id varchar(32) NOT NULL,
	user_idx int,
	user_pw varchar(128),
	user_nm varchar(50) NOT NULL,
	user_dep varchar(64),
	user_pos varchar(32),
	user_mobile varchar(15),
	user_email varchar(64),
	user_type varchar(4),
	-- Y : 사용
	-- N : 미사용
	-- H : HOLD
	use_yn char(1) NOT NULL,
	reg_date timestamp NOT NULL,
	upd_date timestamp NOT NULL,
	PRIMARY KEY (user_id)
) WITHOUT OIDS;



/* Comments */

COMMENT ON COLUMN tb_c_comm_code.use_yn IS 'Y : 사용
N : 미사용
H : HOLD';
COMMENT ON COLUMN tb_c_menu_code.use_yn IS 'Y : 사용
N : 미사용
H : HOLD';
COMMENT ON COLUMN tb_m_bot.use_yn IS 'Y : 사용
N : 미사용
H : HOLD';
COMMENT ON COLUMN tb_m_bot_menu.use_yn IS 'Y : 사용
N : 미사용
H : HOLD';
COMMENT ON COLUMN tb_m_user.use_yn IS 'Y : 사용
N : 미사용
H : HOLD';



