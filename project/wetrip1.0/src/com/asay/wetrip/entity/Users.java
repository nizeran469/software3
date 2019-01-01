package com.asay.wetrip.entity;

import java.util.HashSet;
import java.util.Set;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.PrimaryKeyJoinColumn;
import javax.persistence.Table;
import javax.validation.constraints.Pattern;

import org.hibernate.annotations.GenericGenerator;
import org.hibernate.validator.constraints.Email;
import org.hibernate.validator.constraints.NotEmpty;
@Entity
@Table(name="wt_user")
public class Users {	
	private String email;
	@Column(name="user_password")
	private String password;
	@Column(name="user_status")
	private String status;
	//用户表和用户详情表一对一
	private UserDetail userDetail;

	//用户表和登陆历史记录表 一对多
	private Set<LoginHistory> loginHistory=new HashSet<LoginHistory>(0);
	@Id
	@GeneratedValue(generator="assigned")
	@GenericGenerator(name="assigned",strategy="assigned")
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	@Column(name="user_password")
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	@Column(name="user_status")
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}

	@OneToOne(cascade=CascadeType.ALL)
	@PrimaryKeyJoinColumn(name="email")
	public UserDetail getUserDetail() {
		return userDetail;
	}
	public void setUserDetail(UserDetail userDetail) {
		this.userDetail = userDetail;
	}
	@OneToMany(mappedBy="user",targetEntity=LoginHistory.class)
	public Set<LoginHistory> getLoginHistory() {
		return loginHistory;
	}
	public void setLoginHistory(Set<LoginHistory> loginHistory) {
		this.loginHistory = loginHistory;
	}
	
	
	
	
}
