package com.hibernate.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name ="AdminDetails")
public class Admin {
	@Id
	@GeneratedValue
	@Column(name = "Admin_ID")
	private int adminId;
	@Column(name = "useName")
	private String userName;
	@Column(name = "password")
	private String password;
	@Column(name = "secQuestion")
	private String secQuestion;
	@Column(name = "Answer")
	private String secQueAnswer;

	public int getAdminId() {
		return adminId;
	}

	public void setAdminId(int adminId) {
		this.adminId = adminId;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getSecQuestion() {
		return secQuestion;
	}

	public void setSecQuestion(String secQuestion) {
		this.secQuestion = secQuestion;
	}

	public String getSecQueAnswer() {
		return secQueAnswer;
	}

	public void setSecQueAnswer(String secQueAnswer) {
		this.secQueAnswer = secQueAnswer;
	}

}
