package kr.or.ddit.login.vo;

import java.util.List;

public class LoginVO {
	private String username;
	private String nm;
	private String secCd;
	private String rrno;
	private String password;
	private String telno;
	private String lcnsNo;
	private String addr;
	private String joinYmd;
	private int rtrmYn;
	private String state;
	private String enabled;
	private String secNm;
	private List<UserAuth> authList;
	
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getSecCd() {
		return secCd;
	}
	public void setSecCd(String secCd) {
		this.secCd = secCd;
	}
	public String getRrno() {
		return rrno;
	}
	public void setRrno(String rrno) {
		this.rrno = rrno;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getTelno() {
		return telno;
	}
	public void setTelno(String telno) {
		this.telno = telno;
	}
	public String getAddr() {
		return addr;
	}
	public void setAddr(String addr) {
		this.addr = addr;
	}
	public String getJoinYmd() {
		return joinYmd;
	}
	public void setJoinYmd(String joinYmd) {
		this.joinYmd = joinYmd;
	}
	public int getRtrmYn() {
		return rtrmYn;
	}
	public void setRtrmYn(int rtrmYn) {
		this.rtrmYn = rtrmYn;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public String getEnabled() {
		return enabled;
	}
	public void setEnabled(String enabled) {
		this.enabled = enabled;
	}
	public List<UserAuth> getAuthList() {
		return authList;
	}
	public void setAuthList(List<UserAuth> authList) {
		this.authList = authList;
	}
	public String getNm() {
		return nm;
	}
	public void setNm(String nm) {
		this.nm = nm;
	}
	public String getLcnsNo() {
		return lcnsNo;
	}
	public void setLcnsNo(String lcnsNo) {
		this.lcnsNo = lcnsNo;
	}
	public String getSecNm() {
		return secNm;
	}
	public void setSecNm(String secNm) {
		this.secNm = secNm;
	}
	
	@Override
	public String toString() {
		return "LoginVO [username=" + username + ", nm=" + nm + ", secCd=" + secCd + ", rrno=" + rrno + ", password="
				+ password + ", telno=" + telno + ", lcnsNo=" + lcnsNo + ", addr=" + addr + ", joinYmd=" + joinYmd
				+ ", rtrmYn=" + rtrmYn + ", state=" + state + ", enabled=" + enabled + ", secNm=" + secNm
				+ ", authList=" + authList + "]";
	}
	
}
