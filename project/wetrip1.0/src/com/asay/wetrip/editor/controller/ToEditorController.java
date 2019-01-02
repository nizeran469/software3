package com.asay.wetrip.editor.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.asay.wetrip.entity.Tags;
import com.asay.wetrip.index.service.HeaderServiceImpl;
/**
 * 
 * @ClassName:  ToEditorController   
 * @Description:TODO 新建说说编辑页   
 * @author: 墨
 * @date:   2018年12月19日 上午9:09:03
 */
@Controller
public class ToEditorController {

	@Resource
	private HeaderServiceImpl headerServiceImpl;
	
	/**
	 * 
	 * @Title: toEditor   
	 * @Description: TODO清理原照片的路径进行导航栏的引导
	 * @param: @param request
	 * @param: @param session
	 * @param: @return      
	 * @return: String      
	 * @throws
	 */
	@RequestMapping("/toEditor")
	public String toEditor(HttpServletRequest request,HttpSession session) {
		//获得城市
		String city=(String) session.getAttribute("city");
		request.getServletContext().setAttribute("city", city);
		//清理原照片的路径
		session.removeAttribute("newImgPaths");
		System.out.println(session.getAttribute("newImgPaths")+"===============看删除没有");
		// 导航栏
		List<Tags> list = this.headerServiceImpl.list();
		request.getServletContext().setAttribute("tags", list);
		return "editor";
	}
	
}
