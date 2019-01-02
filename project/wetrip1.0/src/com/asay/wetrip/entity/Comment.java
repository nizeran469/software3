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
@Entity
@Table(name="wt_comment")
public class Comment {
	
	private int id;
	//评论表和用户详情表多对一
	private UserDetail userDetail;
	
	private Timestamp commentTime;
	
	private String commentContent;	
	//评论表和游记表 多对一
	private TravelNote travelNote;
	//父评论和子评论 一对多
	private Set<Comment> childComments=new HashSet<Comment>(0);	
	//子评论和父评论 多对一
	private Comment parentComment;
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="comment_id")
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	@ManyToOne
	@JoinColumn(name="email")
	public UserDetail getUserDetail() {
		return userDetail;
	}
	public void setUserDetail(UserDetail userDetail) {
		this.userDetail = userDetail;
	}
	@Column(name="comment_time")
	public Timestamp getCommentTime() {
		return commentTime;
	}
	public void setCommentTime(Timestamp commentTime) {
		this.commentTime = commentTime;
	}
	
	@Column(name="comment_content")
	public String getCommentContent() {
		return commentContent;
	}
	public void setCommentContent(String commentContent) {
		this.commentContent = commentContent;
	}	
	@ManyToOne
	@JoinColumn(name="travel_id")
	public TravelNote getTravelNote() {
		return travelNote;
	}
	public void setTravelNote(TravelNote travelNote) {
		this.travelNote = travelNote;
	}
	@OneToMany(mappedBy="parentComment",targetEntity=Comment.class)
	public Set<Comment> getChildComments() {
		return childComments;
	}
	public void setChildComments(Set<Comment> childComments) {
		this.childComments = childComments;
	}
	@ManyToOne
	@JoinColumn(name="cparent_id")
	public Comment getParentComment() {
		return parentComment;
	}
	public void setParentComment(Comment parentComment) {
		this.parentComment = parentComment;
	}
	
}
