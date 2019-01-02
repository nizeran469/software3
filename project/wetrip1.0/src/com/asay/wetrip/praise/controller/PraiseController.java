package com.asay.wetrip.praise.controller;

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
import com.asay.wetrip.praise.service.PraiseServiceImpl;
/**
 * <b>PraiseController</b>
 *
 * <p>负责处理点赞信息的controller
 *
 * <p>用户点击点赞按钮后，将会跳转到这个controller，用于处理用户的请求
 *   
 * @author 孙亦璇
 * @date 2018年12月17日下午9:05:25
 * @version v0.0.1
 */
@Controller
public class PraiseController {
	@Resource
	private PraiseServiceImpl praiseServiceImpl;
	@Resource
	private DetailServiceImpl detailServiceImpl;

	/**
	 * <b> executePraise </b>
	 * <p>
	 * 点击点赞按钮后，响应用户操作的controller 
	 * 若未登录状态点击，则不进行操作<br>
	 * 点赞后，对应的文章的点赞数+1
	 * 
	 * @param travelNoteId
	 *            文章的ID
	 * @return String
	 * @author 孙亦璇
	 * @date 2018年12月17日21:06:49
	 * @version v0.0.1
	 */
	@ResponseBody
	@RequestMapping("/executePraise")
	public Map<String, Object> executePraise(int travelNoteId, HttpServletRequest request) {
		Map<String, Object> map = new HashMap<>();
		/*判断用户是否登录，若未登录，则不能进行点赞*/
		if (request.getSession().getAttribute("user") != null) {
			/*用户登陆后，根据传过来的文章的id，获取文章*/
			TravelNote travelNote = detailServiceImpl.findTravelById(travelNoteId);

			int praiseNum = praiseServiceImpl.executePraise(travelNote);
			/*返回点赞数*/
			map.put("praiseNum", praiseNum);
			return map;
		}
		return null;
	}
}
