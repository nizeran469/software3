package com.asay.wetrip.zone.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.asay.wetrip.entity.CollectTravel;
import com.asay.wetrip.entity.TravelNote;
import com.asay.wetrip.entity.UserDetail;
import com.asay.wetrip.zone.dao.ZoneDaoImpl;

@Service
@Transactional(readOnly=true)
public class ZoneServiceImpl {
	@Resource
	private ZoneDaoImpl zoneDaoImpl;
	public List<TravelNote> findTravelByUsername(int pageNum, int pageSize,String username,String loginUsername,String date){
		
		return this.zoneDaoImpl.findTravelByUsername(pageNum, pageSize, username, loginUsername, date);
	}
	
	public int countTravelByUsername(String username,String loginUsername,String date){
		
		return this.zoneDaoImpl.countTravelByUsername(username, loginUsername, date);
	}
	
	public List<CollectTravel> findCollectTravel(int pageNum, int pageSize,String username){
		return this.zoneDaoImpl.findCollectTravel(pageNum, pageSize, username);
	}
	
	public int countCollectTravel(String username){
		return this.zoneDaoImpl.countCollectTravel(username);
	}
	public List<String> findTravelTime(String username){
		return this.zoneDaoImpl.findTravelTime(username); 
	}
	public void deleteTravel(int travelId){
		this.zoneDaoImpl.deleteTravel(travelId);
	}
	public UserDetail findUserDetailByUsername(String username){
		return this.zoneDaoImpl.findUserDetailByUsername(username);
	}
	
}
