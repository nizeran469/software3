package com.asay.wetrip.collect.controller;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.asay.wetrip.collect.service.CollectServiceImpl;
import com.asay.wetrip.detail.service.DetailServiceImpl;
import com.asay.wetrip.entity.TravelNote;
import com.asay.wetrip.entity.UserDetail;
import com.asay.wetrip.entity.Users;

/**
 * 
 * <b>CollectController</b>
 *
 * <p>
 * 负责处理收藏信息的controller
 *
 * <p>
 * 用户点击收藏按钮后，将会跳转到这个controller，用于处理用户的请求
 * 
 * @author 孙亦璇
 * @date 2018年12月17日下午8:47:17
 * @Version v0.0.1
 */
@Controller
public class CollectController {
	@Resource
	private CollectServiceImpl collectServiceImpl;
	@Resource
	private DetailServiceImpl detailServiceImpl;

	/**
	 * <b> changeCollectStatus </b>
	 * <p>
	 * 点击收藏按钮后，响应用户操作的controller 若未登录状态点击，则不进行操作<br>
	 * 若收藏状态时点击，则取消收藏<br>
	 * 若未收藏时候点击，则进行收藏<br>
	 * 
	 * @param travelNoteId
	 *            文章的ID
	 * @return Map 若用户未登录，则返回null<br>
	 *         若用户未登录，则返回对应的map<br>
	 * 		<br>
	 *         其中map的值为: <br>
	 *         status collected/uncollected 状态 已收藏/未收藏 collectNum 文章目前被收藏多少次
	 *         travelNoteId 被收藏的文章的id
	 * @author 孙亦璇
	 * @date 2018年12月17日20:51:48
	 * @Version v0.0.1
	 */
	@ResponseBody
	@RequestMapping("/changeCollectStatus")
	public Map<String, Object> changeCollectStatus(int travelNoteId, HttpServletRequest request) {
		Map<String, Object> map = new HashMap<>();
		/* 判断用户是否登录，若未登录，直接返回null */
		if (request.getSession().getAttribute("user") != null) {
			/* 用户已登录，则获取用户的详细信息；并根据游记id获取游记类 */
			Users user = (Users) request.getSession().getAttribute("user");
			UserDetail userDetail = user.getUserDetail();
			TravelNote travelNote = detailServiceImpl.findTravelById(travelNoteId);

			/* 判断该游记是否已经被收藏 */
			Boolean collected = collectServiceImpl.isCollect(travelNote, userDetail);
			/* 若已被收藏，则执行取消收藏 removeCollect方法 */
			if (collected) {
				collectServiceImpl.removeCollect(userDetail, travelNote);
				map.put("status", "uncollected");
				map.put("collectNum", travelNote.getCollectTravels().size());
				map.put("travelNoteId", travelNoteId);
				return map;
			}
			/* 若未被收藏，则执行收藏 addCollect方法 */
			else {
				collectServiceImpl.addCollect(userDetail, travelNote);
				map.put("status", "collected");
				map.put("collectNum", travelNote.getCollectTravels().size());
				map.put("travelNoteId", travelNoteId);
				return map;
			}
		}
		return null;
	}

	/**
	 * 
	 * <b>checkCollected</b>   
	 *
	 * <p>检查文章是否被收藏的controller
	 *
	 * <p>用map的形式返回；
	 * 	若未收藏，则返回 status uncollected <br/>
	 * 若已收藏，返回status collected <br/>
	 * 用户未登录时，默认为未收藏 <br/>
	 * @param travelNoteId 文章的id
	 * @param request
	 * @return  Map<String,String>
	 * @author 孙亦璇
	 * @date 2018年12月24日上午10:41:27
	 * @version v0.0.1
	 */
	@ResponseBody
	@RequestMapping("/checkCollected")
	public Map<String, String> checkCollected(int travelNoteId, HttpServletRequest request) {
		Map<String, String> map = new HashMap<>();
		map.put("status", "uncollected");
		if (request.getSession().getAttribute("user") != null) {
			Users user = (Users) request.getSession().getAttribute("user");
			UserDetail userDetail = user.getUserDetail();
			TravelNote travelNote = detailServiceImpl.findTravelById(travelNoteId);
			if (collectServiceImpl.isCollect(travelNote, userDetail)) {
				map.put("status", "collected");
			}
		}
		return map;
	}
}
