package com.asay.wetrip.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name="wt_tag_travelnote")
public class TagTravelNote {
	
	private int id;
	//游记表和连接表 多对一
	private TravelNote travelNote;
	//标签表和连接表 多对一
	private Tags tags;
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}

	@ManyToOne
	@JoinColumn(name="travelnote_id")
	public TravelNote getTravelNote() {
		return travelNote;
	}
	public void setTravelNote(TravelNote travelNote) {
		this.travelNote = travelNote;
	}
	@ManyToOne
	@JoinColumn(name="tag_id")
	public Tags getTags() {
		return tags;
	}
	public void setTags(Tags tags) {
		this.tags = tags;
	}
	
	
}
