package com.asay.wetrip.entity;

import java.util.HashSet;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name="wt_identity")
public class Identity {

	private int id;

	private String identityName;
	// 身份表和管理员表 一对多
	private Set<Manager> managers = new HashSet<Manager>(0);
	// 身份表和权限表多对多
	private Set<Privilege> privileges = new HashSet<Privilege>(0);

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="identity_id")
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	@Column(name = "identity_name")
	public String getIdentityName() {
		return identityName;
	}

	public void setIdentityName(String identityName) {
		this.identityName = identityName;
	}

	@OneToMany(mappedBy = "identity")
	public Set<Manager> getManagers() {
		return managers;
	}

	public void setManagers(Set<Manager> managers) {
		this.managers = managers;
	}

	@ManyToMany
	@JoinTable(name = "wt_privilege_identity", joinColumns = @JoinColumn(name = "privilege_id"), 
				inverseJoinColumns = @JoinColumn(name = "identity_id"))
	public Set<Privilege> getPrivileges() {
		return privileges;
	}

	public void setPrivileges(Set<Privilege> privileges) {
		this.privileges = privileges;
	}

}
