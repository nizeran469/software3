package com.asay.wetrip.detail.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.asay.wetrip.collect.service.CollectServiceImpl;
import com.asay.wetrip.detail.service.DetailServiceImpl;
import com.asay.wetrip.entity.Tags;
import com.asay.wetrip.entity.TravelNote;
import com.asay.wetrip.entity.UserDetail;
import com.asay.wetrip.entity.Users;
import com.asay.wetrip.index.service.HeaderServiceImpl;
/**
 * 
 * @ClassName:  DetailController   
 * @Description:游记详情页的controller层
 * @author: 倪泽苒
 * @date:   2018年12月10日 上午8:57:39
 */
@Controller	
public class DetailController {
@Resource
private HeaderServiceImpl headerServiceImpl;
@Resource
private  DetailServiceImpl  detailServiceImpl;
@Resource
private CollectServiceImpl collectServiceImpl;

/**
 * 
 * @Title: detail   
 * @Description:其他页面跳转到详情页，依据游记id展示  
 * @param: @param request
 * @param: @return      
 * @return: String      
 * @throws
 */
@RequestMapping("/detail")
public String detail(HttpServletRequest request) {
	int id=Integer.parseInt(request.getParameter("travelid") );
//导航栏显示	
	List<Tags> list=this.headerServiceImpl.list();
	request.getServletContext().setAttribute("tags", list);	
//id查询文章显示
	TravelNote travelnote= this.detailServiceImpl.findTravelById(id);
	request.getServletContext().setAttribute("travel", travelnote);	
//评论,时间排序	
	request.getServletContext().setAttribute("comments", this.detailServiceImpl.findComment(travelnote));	
//同作者的其他游记显示，热度排序
	request.getServletContext().setAttribute("toptravel", this.detailServiceImpl.findTravelByWritter(travelnote.getUserDetail()));
	
//判断游记是否被用户收藏
	boolean travelNoteCollected = false;
	Users user = (Users) request.getSession().getAttribute("user");
	UserDetail userDetail=user.getUserDetail();
	travelNoteCollected = this.collectServiceImpl.isCollect(travelnote, userDetail);
	request.setAttribute("travelNoteCollected", travelNoteCollected);
	return "detail";	
}
@RequestMapping("/comment")
public String commentAdd(HttpServletRequest request) {
	int id=Integer.parseInt(request.getParameter("travelid") );
	String content=request.getParameter("comment");
	Users user=(Users)request.getSession().getAttribute("user");
	System.out.println(user.getUserDetail());
	System.out.println(content);
	 String parentId=request.getParameter("parentid") ;
	this.detailServiceImpl.addComment(content,user.getUserDetail(),Integer.parseInt(request.getParameter("travelid") ), parentId);
	return "redirect:/detail?travelid="+id;
}

}
