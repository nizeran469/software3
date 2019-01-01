package com.asay.wetrip.entity;

import java.sql.Timestamp;
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
import javax.persistence.Table;

import com.asay.wetrip.util.ConfigConsts;
@Entity
@Table(name="wt_travelnote")
public class TravelNote {
	
	private int id;	
	private Timestamp publishtime;
	
	private String province;

	private String city;
	private int praiseCount;
	private String title;
	private String content;	
	
	private int islong;
	private int reportcount;
	private String status;
	
	private int commentNum;
	private String address;
	//游记表和用户详情表 多对一
	private UserDetail userDetail;
	//游记表和收藏表 一对多
	private Set<CollectTravel> collectTravels=new HashSet<CollectTravel>(0);
	//游记表和标签表  一对多
	private Set<TagTravelNote> tagTravelNote=new HashSet<TagTravelNote>(0);
	//游记表和评论表 一对多
	private Set<Comment> comments=new HashSet<Comment>(0);
	//游记表和话题表 多对一
	private Topic topic;
	//游记表和图片表 一对多
	private Set<Imgs> imgs=new HashSet<Imgs>(0);
	
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="travel_id")
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	
	public Timestamp getPublishtime() {
		return publishtime;
	}
	public void setPublishtime(Timestamp publishtime) {
		this.publishtime = publishtime;
	}
	
	@Column(name="t_province")
	public String getProvince() {
		return province;
	}
	public void setProvince(String province) {
		this.province = province;
	}
	
	@Column(name="t_city")
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	public int getPraiseCount() {
		return praiseCount;
	}
	public void setPraiseCount(int praiseCount) {
		this.praiseCount = praiseCount;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	
	@Column(name="is_long")
	public int getIslong() {
		return islong;
	}
	public void setIslong(int islong) {
		this.islong = islong;
	}
	@Column(name="travel_status")
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	
	@Column(name="commentcount")
	public int getCommentNum() {
		return commentNum;
	}
	public void setCommentNum(int commentNum) {
		this.commentNum = commentNum;
	}
	@Column(name="travel_address")
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	@ManyToOne
	@JoinColumn(name="email")
	public UserDetail getUserDetail() {
		return userDetail;
	}
	public void setUserDetail(UserDetail userDetail) {
		this.userDetail = userDetail;
	}	
//	@OneToMany(mappedBy="travelNotes",targetEntity=Tags.class)
//	@ManyToOne
//	public Set<Tags> getTags() {
//		return tags;
//	}
//	public void setTags(Set<Tags> tags) {
//		this.tags = tags;
//	}
	@OneToMany(mappedBy="travelNote",targetEntity=Comment.class)
	public Set<Comment> getComments() {
		return comments;
	}
	public void setComments(Set<Comment> comments) {
		this.comments = comments;
	}
	@ManyToOne
	@JoinColumn(name="topic_id")
	public Topic getTopic() {
		return topic;
	}
	public void setTopic(Topic topic) {
		this.topic = topic;
	}
	@OneToMany(mappedBy="travelNote",targetEntity=Imgs.class)
	public Set<Imgs> getImgs() {
		return imgs;
	}
	public void setImgs(Set<Imgs> imgs) {
		this.imgs = imgs;
	}
	@OneToMany(mappedBy="travelNote",targetEntity=CollectTravel.class)
	public Set<CollectTravel> getCollectTravels() {
		return collectTravels;
	}
	public void setCollectTravels(Set<CollectTravel> collectTravels) {
		this.collectTravels = collectTravels;
	}
	
	@OneToMany(mappedBy="travelNote",targetEntity=TagTravelNote.class)
	public Set<TagTravelNote> getTagTravelNote() {
		return tagTravelNote;
	}
	public void setTagTravelNote(Set<TagTravelNote> tagTravelNote) {
		this.tagTravelNote = tagTravelNote;
	}
	public int getReportcount() {
		return reportcount;
	}
	public void setReportcount(int reportcount) {
		this.reportcount = reportcount;
	}
	
}
