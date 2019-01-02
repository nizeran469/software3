package com.asay.wetrip.collect.service;

import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.asay.wetrip.collect.dao.CollectDaoImpl;
import com.asay.wetrip.entity.TravelNote;
import com.asay.wetrip.entity.UserDetail;

/**
 * * @ClassName: CollectServiceImpl  * @author: 倪泽苒  * @date: 2018年12月5日
 * 上午10:20:30  
 */
@Service
@Transactional
public class CollectServiceImpl {
	@Resource
	private CollectDaoImpl collectDaoImpl;

	public boolean isCollect(TravelNote tn, UserDetail userDetail) {
		return this.collectDaoImpl.isCollect(tn, userDetail);
	}

	// 查询用户与游记list是否已具有收藏关系,返回一个map用于首页展示
	public Map isCollect(List<TravelNote> tnlist, UserDetail userDetail) {
		Map travelMap = new HashMap();
		if (userDetail != null) {
			for (TravelNote tn : tnlist) {
				if (this.collectDaoImpl.isCollect(tn, userDetail)) {
					travelMap.put(tn, 1);
				} else {
					travelMap.put(tn, 0);
				}
			}
		} else {
			for (TravelNote tn : tnlist) {
				travelMap.put(tn, 0);
			}
		}
		return travelMap;
	}
	public LinkedHashMap isCollectAsLinked(List<TravelNote> tnlist, UserDetail userDetail) {
		LinkedHashMap travelMap = new LinkedHashMap();
		if (userDetail != null) {
			for (TravelNote tn : tnlist) {
				if (this.collectDaoImpl.isCollect(tn, userDetail)) {
					travelMap.put(tn, 1);
				} else {
					travelMap.put(tn, 0);
				}
			}
		} else {
			for (TravelNote tn : tnlist) {
				travelMap.put(tn, 0);
			}
		}
		return travelMap;
	}
	/**
	 * <b>addCollect</b>   
	 *
	 * <p>添加收藏的方法
	 *
	 * <p>将用户详情和游记传入，传递给dao层，从而将数据插入收藏表中，实现收藏
	 * @param userDetail  用户详情
	 * @param travelNote  游记    
	 * @return void
	 * 
	 * @author 孙亦璇
	 * @date 2018年12月17日20:57:11
	 * @version v0.0.1
	 */
	public void addCollect(UserDetail userDetail, TravelNote travelNote) {
		this.collectDaoImpl.addCollectNote(userDetail, travelNote);
	}

	/**
	 * <b>removeCollect</b>   
	 *
	 * <p>删除收藏的方法
	 *
	 * <p>将用户详情和游记传入，传递给dao层，从而将数据从收藏表中删除
	 * @param userDetail  用户详情
	 * @param travelNote  游记    
	 * @return void
	 * 
	 * @author 孙亦璇
	 * @date 2018年12月17日21:00:45
	 * @version v0.0.1
	 */
	public void removeCollect(UserDetail userDetail, TravelNote travelNote) {
		this.collectDaoImpl.removeCollectNote(userDetail, travelNote);
	}
}
