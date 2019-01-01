package com.asay.wetrip.entity;

import java.sql.Timestamp;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.PrimaryKeyJoinColumn;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;
import org.hibernate.annotations.Parameter;

@Entity
@Table(name="wt_user_detail")
public class UserDetail {
	private String email;
	private String username;	
	private String province;
	private String city;
	private String sex;
	
	private String description;
	private String userhead;
	
	private Timestamp registerTime;
	//用户详情表和用户表一对一
	private Users user;
	//用户详情表和游记表 一对多
	private Set<TravelNote> travelNotes=new HashSet<TravelNote>(0);
	//用户详情表和收藏表一对多
	private Set<CollectTravel> collectTravels=new HashSet<CollectTravel>(0);
	//用户详情表和订单表一对多
	private Set<Orders> orders=new HashSet<Orders>(0);
	//用户详情表和管理员表一对一
	private Manager manager;
	
	@Id
	@GeneratedValue(generator="foreign")
	@GenericGenerator(name="foreign",strategy="foreign",parameters= {
			@Parameter(name="property",value="user")
	})
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	
	public String getProvince() {
		return province;
	}
	public void setProvince(String province) {
		this.province = province;
	}
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	public String getSex() {
		return sex;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}
	@Column(name="user_description")
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getUserhead() {
		return userhead;
	}
	public void setUserhead(String userhead) {
		this.userhead = userhead;
	}
	
	
//	@OneToOne(cascade=CascadeType.ALL)
//	@PrimaryKeyJoinColumn(name="email")
	@OneToOne(mappedBy="userDetail")
	public Users getUser() {
		return user;
	}
	public void setUser(Users user) {
		this.user = user;
	}
	@OneToMany(mappedBy="userDetail",targetEntity=TravelNote.class)
	public Set<TravelNote> getTravelNotes() {
		return travelNotes;
	}
	public void setTravelNotes(Set<TravelNote> travelNotes) {
		this.travelNotes = travelNotes;
	}
	
	@OneToMany(mappedBy="userDetail",targetEntity=Orders.class)
	public Set<Orders> getOrders() {
		return orders;
	}
	public void setOrders(Set<Orders> orders) {
		this.orders = orders;
	}
	@OneToOne(mappedBy="userDetail",optional=true)	
	public Manager getManager() {
		return manager;
	}
	public void setManager(Manager manager) {
		this.manager = manager;
	}
	@OneToMany(mappedBy="userDetail",targetEntity=CollectTravel.class)
	public Set<CollectTravel> getCollectTravels() {
		return collectTravels;
	}
	public void setCollectTravels(Set<CollectTravel> collectTravels) {
		this.collectTravels = collectTravels;
	}

	@Column(name="register_time")
	public Timestamp getRegistTime() {
		return registerTime;
	}
	public void setRegistTime(Timestamp registerTime) {
		this.registerTime = registerTime;
	}
	
	
	
}
