package com.an.dto;

import java.util.Date;

public class MemberVO {
	
	private String userId;
	private String userPw;
	private String userName;
	private String userEmail;
	private Date userRegdate;
	private Date userUpdatedate;
	private String userAuth;
	

	public String getUserAuth() {
		return userAuth;
	}

	public void setUserAuth(String userAuth) {
		this.userAuth = userAuth;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getUserPw() {
		return userPw;
	}

	public void setUserPw(String userPw) {
		this.userPw = userPw;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getUserEmail() {
		return userEmail;
	}

	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}

	public Date getUserRegdate() {
		return userRegdate;
	}

	public void setUserRegdate(Date userRegdate) {
		this.userRegdate = userRegdate;
	}

	public Date getUserUpdatedate() {
		return userUpdatedate;
	}

	public void setUserUpdatedate(Date userUpdatedate) {
		this.userUpdatedate = userUpdatedate;
	}

	@Override
	public String toString() {
		return "MemberVO [userId=" + userId + ", userPw=" + userPw + ", userName=" + userName + ", userEmail="
				+ userEmail + ", userRegdate=" + userRegdate + ", userUpdatedate=" + userUpdatedate + ", userAuth="
				+ userAuth + "]";
	}

}
