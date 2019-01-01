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
@Table(name="wt_img")
public class Imgs {
	
	private int id;
	private String path;
	//图片表和游记表  多对一
	private TravelNote travelNote;
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="image_id")
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getPath() {
		return path;
	}
	public void setPath(String path) {
		this.path = path;
	}
	@ManyToOne
	@JoinColumn(name="travel_id")
	public TravelNote getTravelNote() {
		return travelNote;
	}
	public void setTravelNote(TravelNote travelNote) {
		this.travelNote = travelNote;
	}
	
}
