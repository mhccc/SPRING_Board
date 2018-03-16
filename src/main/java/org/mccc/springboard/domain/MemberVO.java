package org.mccc.springboard.domain;

import java.util.Date;

public class MemberVO {

	private String userid;
	private String password;
	private String email;
	private Date memberRegDate;
	
	public MemberVO() {
		super();
	}
	
	public MemberVO(String userid, String password, String email) {
		super();
		this.userid = userid;
		this.password = password;
		this.email = email;
	}

	public String getUserid() {
		return userid;
	}
	
	public void setUserid(String userid) {
		this.userid = userid;
	}
	
	public String getPassword() {
		return password;
	}
	
	public void setPassword(String password) {
		this.password = password;
	}
	
	public String getEmail() {
		return email;
	}
	
	public void setEmail(String email) {
		this.email = email;
	}
	
	public Date getMemberRegDate() {
		return memberRegDate;
	}
	
	public void setMemberRegDate(Date memberRegDate) {
		this.memberRegDate = memberRegDate;
	}
	
	@Override
	public String toString() {
		return "MemberVO [userid=" + userid + ", password=" + password + ", email=" + email + ", memberRegDate="
				+ memberRegDate + "]";
	}
	
}
