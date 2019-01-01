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
import javax.persistence.Table;


@Entity
@Table(name="wt_tag")
public class Tags {

	private int id;
	private String tagName;
	
	
	private Integer tagCount;
	//父标签和子标签 一对多
	private Set<Tags> childTags=new HashSet<Tags>(0);	
	//子标签和父标签 一对一
	private Tags parentTag;
	//标签表和连接表 一对多
	private Set<TagTravelNote> tagTravelNote=new HashSet<TagTravelNote>(0);
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="tag_id")
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getTagName() {
		return tagName;
	}
	public void setTagName(String tagName) {
		this.tagName = tagName;
	}
	
	@Column(name="tag_count")
	public Integer getTagCount() {
		return tagCount;
	}
	public void setTagCount(Integer tagCount) {
		this.tagCount = tagCount;
	}
	@OneToMany(mappedBy="parentTag",targetEntity=Tags.class)
	public Set<Tags> getChildTags() {
		return childTags;
	}
	public void setChildTags(Set<Tags> childTags) {
		this.childTags = childTags;
	}
	@ManyToOne
	@JoinColumn(name="parent_id")
	public Tags getParentTag() {
		return parentTag;
	}
	public void setParentTag(Tags parentTag) {
		this.parentTag = parentTag;
	}
	@OneToMany(mappedBy="tags",targetEntity=TagTravelNote.class)
	public Set<TagTravelNote> getTagTravelNote() {
		return tagTravelNote;
	}
	public void setTagTravelNote(Set<TagTravelNote> tagTravelNote) {
		this.tagTravelNote = tagTravelNote;
	}

	
	
}
