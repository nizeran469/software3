package com.asay.wetrip.editor.controller;


import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.RequestMapping;

import com.asay.wetrip.detail.service.DetailServiceImpl;
import com.asay.wetrip.entity.Tags;
import com.asay.wetrip.entity.TravelNote;
import com.asay.wetrip.index.service.HeaderServiceImpl;
/**
 * 
 * @ClassName:  ReEditorController   
 * @Description:TODO 再编辑游记编辑页
 * @author: 墨
 * @date:   2018年12月19日 上午9:09:47
 */
@Controller
public class ReEditorController {

	@Resource
	private DetailServiceImpl detailServiceImpl;
	@Resource
	private HeaderServiceImpl headerServiceImpl;
	
	/**
	 * 
	 * @Title: detail   
	 * @Description: TODO清理原照片的路径信息 及各表的数据拉去并request到页面
	 * @param: @param request
	 * @param: @param session
	 * @param: @return      
	 * @return: String      
	 * @throws
	 */
	@RequestMapping("/reEditor")
	public String detail(HttpServletRequest request,HttpSession session) {
		//清理照片的原路径信息
		session.removeAttribute("newImgPaths");
		// 导航栏
		List<Tags> list = this.headerServiceImpl.list();
		request.getServletContext().setAttribute("tags", list);
		// 通过游记id获取游记的数据
		int id=Integer.parseInt(request.getParameter("travelId"));
//		int id=48;
		TravelNote travelnote=detailServiceImpl.findTravelById(id);//自己先规定一个id
		System.out.println("获得quanxianshi："+travelnote.getStatus());
		request.getServletContext().setAttribute("reEditor", travelnote);
		//跳到再编辑页的时候 发表的按钮变成确认修改
		String change="确认修改";
		request.getServletContext().setAttribute("submit", change);
		return "reEditor";//跳转到接收再编辑数据的编辑页
	}
}
