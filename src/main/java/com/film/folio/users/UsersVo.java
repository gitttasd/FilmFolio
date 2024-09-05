package com.film.folio.users;

import java.sql.Date;

import javax.validation.constraints.Min;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Size;

public class UsersVo {
	
	@NotBlank
	@Size(min = 1, max = 10)
	private String loginId; //로그인 아이디  
	private String userId;  
	@NotBlank
	private String email;  //이메일    
	@NotBlank
	@Size(min = 1, max = 10)
	private String password; //비밀번호
	@NotBlank
	private String name; // 이름	 
	private String status;   
	private Date createdAt;  
	private Date updatedAt;  
	private String adminAt;  
	private int points;
	
	
	public String getLoginId() {
		return loginId;
	}
	public void setLoginId(String loginId) {
		this.loginId = loginId;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public Date getCreatedAt() {
		return createdAt;
	}
	public void setCreatedAt(Date createdAt) {
		this.createdAt = createdAt;
	}
	public Date getUpdatedAt() {
		return updatedAt;
	}
	public void setUpdatedAt(Date updatedAt) {
		this.updatedAt = updatedAt;
	}
	public String getAdminAt() {
		return adminAt;
	}
	public void setAdminAt(String adminAt) {
		this.adminAt = adminAt;
	}
	public int getPoints() {
		return points;
	}
	public void setPoints(int points) {
		this.points = points;
	}

	
}
