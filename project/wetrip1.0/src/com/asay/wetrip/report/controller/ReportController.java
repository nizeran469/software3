package com.asay.wetrip.report.controller;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.asay.wetrip.detail.service.DetailServiceImpl;
import com.asay.wetrip.entity.TravelNote;

import com.asay.wetrip.report.service.ReportServiceImpl;
/**
 * 
 * <b>ReportController</b>
 *
 * <p>负责处理举报信息的controller
 *
 * <p>用户点击举报按钮后，将会跳转到这个controller，用于处理用户的请求
 *   
 * @author 孙亦璇
 * @date 2018年12月17日21:14:17
 * @Version v0.0.1
 */

@Controller
public class ReportController {
	@Resource
	private ReportServiceImpl reportServiceImpl;
	@Resource
	private DetailServiceImpl detailServiceImpl;

	/**
	 * <b> executePraise </b>
	 * <p>点击举报按钮后，响应用户操作的controller <br>
	 * 若未登录状态点击，则不进行操作<br>
	 * 举报后，对应的文章的举报数+1<br>
	 * 
	 * @param travelNoteId 文章的ID
	 * @return String
	 */
	@ResponseBody
	@RequestMapping("/executeReport")
	public String executeReport(int travelNoteId, HttpServletRequest request) {
		/*判断用户是否登录，若未登录，则不能进行点赞*/
		if (request.getSession().getAttribute("user") != null) {
			TravelNote travelNote = detailServiceImpl.findTravelById(travelNoteId);

			reportServiceImpl.executeReport(travelNote);
			/*随便返回了个字符串*/
		return "already reported";
		}
		return null;
	}
}
