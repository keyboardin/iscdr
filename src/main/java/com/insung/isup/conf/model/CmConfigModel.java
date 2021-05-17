package com.insung.isup.conf.model;

import com.insung.isup.common.model.BaseModel;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@SuppressWarnings("serial")
public class CmConfigModel extends BaseModel {
	private int cm_no;
	private String cm_nm;
	private String cm_ip;
	private String cm_port;
	private String cm_id;
	private String cm_pw;
	private String cm_ver;
	private int priority;
	private String use_yn;
	private String use_yn_nm;
	private String upd_date;
	private String cnt;
	public int getCm_no() {
		return cm_no;
	}
	public void setCm_no(int cm_no) {
		this.cm_no = cm_no;
	}
	public String getCm_nm() {
		return cm_nm;
	}
	public void setCm_nm(String cm_nm) {
		this.cm_nm = cm_nm;
	}
	public String getCm_ip() {
		return cm_ip;
	}
	public void setCm_ip(String cm_ip) {
		this.cm_ip = cm_ip;
	}
	public String getCm_port() {
		return cm_port;
	}
	public void setCm_port(String cm_port) {
		this.cm_port = cm_port;
	}
	public String getCm_id() {
		return cm_id;
	}
	public void setCm_id(String cm_id) {
		this.cm_id = cm_id;
	}
	public String getCm_pw() {
		return cm_pw;
	}
	public void setCm_pw(String cm_pw) {
		this.cm_pw = cm_pw;
	}
	public String getCm_ver() {
		return cm_ver;
	}
	public void setCm_ver(String cm_ver) {
		this.cm_ver = cm_ver;
	}
	public int getPriority() {
		return priority;
	}
	public void setPriority(int priority) {
		this.priority = priority;
	}
	public String getUse_yn() {
		return use_yn;
	}
	public void setUse_yn(String use_yn) {
		this.use_yn = use_yn;
	}
	public String getUse_yn_nm() {
		return use_yn_nm;
	}
	public void setUse_yn_nm(String use_yn_nm) {
		this.use_yn_nm = use_yn_nm;
	}
	public String getUpd_date() {
		return upd_date;
	}
	public void setUpd_date(String upd_date) {
		this.upd_date = upd_date;
	}
	public String getCnt() {
		return cnt;
	}
	public void setCnt(String cnt) {
		this.cnt = cnt;
	}

	
}