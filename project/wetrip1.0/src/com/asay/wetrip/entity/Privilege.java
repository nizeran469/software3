package com.asay.wetrip.entity;

import java.util.HashSet;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToMany;
import javax.persistence.Table;

@Entity
@Table(name="wt_privilege")
public class Privilege {
	
	private int id;
	private String privilegeName;
	//权限表和身份表多对多的关系
	private Set<Identity> identities =new HashSet<Identity>(0);

	@Id
	@Column(name="privilege_id")
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	@Column(name="privilege_name")
	public String getPrivilegeName() {
		return privilegeName;
	}
	public void setPrivilegeName(String privilegeName) {
		this.privilegeName = privilegeName;
	}
	@ManyToMany(mappedBy="privileges")
	public Set<Identity> getIdentities() {
		return identities;
	}
	public void setIdentities(Set<Identity> identities) {
		this.identities = identities;
	}	
}
