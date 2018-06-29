package org.mccc.springboard.dto;

public class LoginDTO {
	
	private String userid;
	private String password;
	private boolean userCookie;
	
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
	
	public boolean isUserCookie() {
		return userCookie;
	}
	
	public void setUserCookie(boolean userCookie) {
		this.userCookie = userCookie;
	}

	@Override
	public String toString() {
		return "LoginDTO [userid=" + userid + ", password=" + password + ", userCookie=" + userCookie + "]";
	}
	
}
