package com.asay.wetrip.entity;

import java.util.HashSet;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name="wt_manager")
public class Manager {	
	private int id;	
	//管理员表和用户详情表 一对零（管理员一定是用户，用户不一定是管理员）
	private UserDetail userDetail;
	//管理员表和话题表 一对多
	private Set<Topic> topics=new HashSet<Topic>(0);
	//管理员表和身份表  多对一
	private Identity identity;
	
	@Id
	@Column(name="manager_id")
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	
	@OneToOne(optional = false)
	@JoinColumn(name="email")
	public UserDetail getUserDetail() {
		return userDetail;
	}
	public void setUserDetail(UserDetail userDetail) {
		this.userDetail = userDetail;
	}
	@OneToMany(mappedBy="manager",targetEntity=Topic.class)
	public Set<Topic> getTopics() {
		return topics;
	}
	public void setTopics(Set<Topic> topics) {
		this.topics = topics;
	}
	@ManyToOne
	@JoinColumn(name="identity_id")
	public Identity getIdentity() {
		return identity;
	}
	public void setIdentity(Identity identity) {
		this.identity = identity;
	}	
}