package com.asay.wetrip.zone.controller;

import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.transaction.Transactional;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.asay.wetrip.collect.service.CollectServiceImpl;
import com.asay.wetrip.entity.CollectTravel;
import com.asay.wetrip.entity.TravelNote;
import com.asay.wetrip.entity.UserDetail;
import com.asay.wetrip.entity.Users;
import com.asay.wetrip.zone.service.ZoneServiceImpl;

@Controller
@Transactional
public class ZoneController {
	@Resource	
	private ZoneServiceImpl zonerServiceImpl;
	@Resource
	private CollectServiceImpl collectServiceImpl;
	@RequestMapping("/zone")
	public String index(HttpServletRequest request) {
//获取个人空间页游记页码
		int zonePageNum=Integer.parseInt(request.getParameter("zonePageNum"));
//获取进入的空间所有者的用户名
		String username= request.getParameter("username");
//获取该用户收藏文章的页码
		int collectpageNum=Integer.parseInt(request.getParameter("collectPageNum"));
//获取游记所属时间段(20代表所有游记，即发表日期以20XX年开头的游记)
		String correctDate=request.getParameter("correctDate");
//得到session存入的用户信息，借此判断该空间是否为登陆者的空间
		Users user=(Users)request.getSession().getAttribute("user");
//获取登录用户的用户名
		String loginUsername=user.getUserDetail().getUsername();	
//获取用户收藏部分的总页数
		int collectCount=(zonerServiceImpl.countCollectTravel(username))/6;
		if(this.zonerServiceImpl.countCollectTravel(username)%6!=0) {
			collectCount+=1;
		}
//得到每页显示的收藏游记列表
		List<CollectTravel> collectList=zonerServiceImpl.findCollectTravel(collectpageNum, 6, username);
//得到每页显示的游记列表
		List<TravelNote> zoneTravelList=zonerServiceImpl.findTravelByUsername(zonePageNum, 3, username,loginUsername,correctDate);
//得到该用户发布游记的时间列表
		List<String> dateList=zonerServiceImpl.findTravelTime(username);
//得到游记列表的总页数
		int count=zonerServiceImpl.countTravelByUsername(username, loginUsername, correctDate);
		
		if(count%3==0) {
			count=count/3;
		}
		else {
			count=count/3+1;
		}

		//将游记再次进行处理，以确认是否已经收藏
		if (request.getSession().getAttribute("user") != null) {
			UserDetail userDetail =user.getUserDetail();
			LinkedHashMap travelMap=collectServiceImpl.isCollectAsLinked(zoneTravelList, userDetail);
			request.getServletContext().setAttribute("travelMap", travelMap);
			}
		else{
			request.getServletContext().setAttribute("travelMap", new HashMap<>(0));
		}

		request.getServletContext().setAttribute("zonePageNum", zonePageNum);
		request.getServletContext().setAttribute("ud", zonerServiceImpl.findUserDetailByUsername(username));
		request.getServletContext().setAttribute("count",count);
		request.getServletContext().setAttribute("collectPageNum",collectpageNum);
		request.getServletContext().setAttribute("collectList",collectList);
		request.getServletContext().setAttribute("dateList",dateList);
		request.getServletContext().setAttribute("collectCount",collectCount);
		request.getServletContext().setAttribute("loginUsername",loginUsername);
		request.getServletContext().setAttribute("username",username);
		request.getServletContext().setAttribute("correctDate",correctDate);
		
		return "zone";
	}
	
	@RequestMapping("/delete")
	public ModelAndView index2(HttpServletRequest request) {
//得到需要删除的游记id
		int travelId=Integer.parseInt(request.getParameter("travelId"));
//得到该个人空间所属用户名
		String username=request.getParameter("username");
		int zonePageNum=Integer.parseInt(request.getParameter("zonePageNum"));
		int collectpageNum=Integer.parseInt(request.getParameter("collectPageNum"));
		String correctDate=request.getParameter("correctDate");
//执行删除操作，将该游记的状态码改为"已删除"
		this.zonerServiceImpl.deleteTravel(travelId);
		request.getServletContext().setAttribute("travelId",travelId);
//包含中文字符的重定向
		ModelAndView delete= new ModelAndView("redirect:/zone?travelId="+travelId+"&zonePageNum="+zonePageNum+"&collectPageNum="+collectpageNum+"&correctDate="+correctDate).addObject("username", username);
		return delete;
	}
}
