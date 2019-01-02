package com.asay.wetrip.index.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.JSONException;
import org.json.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.asay.wetrip.collect.service.CollectServiceImpl;
import com.asay.wetrip.entity.Imgs;
import com.asay.wetrip.entity.Tags;
import com.asay.wetrip.entity.TravelNote;
import com.asay.wetrip.entity.UserDetail;
import com.asay.wetrip.entity.Users;
import com.asay.wetrip.index.service.HeaderServiceImpl;
import com.asay.wetrip.index.service.IndexAjaxServiceImpl;
import com.asay.wetrip.index.service.IndexServicelmpl;
import com.asay.wetrip.report.service.ReportServiceImpl;
import com.asay.wetrip.topic.service.TopicServiceImpl;
import com.asay.wetrip.util.FlightTrainTask;
import com.asay.wetrip.util.GetPlaceByIp;

/**
 * 
 * @ClassName: IndexController
 * @Description:首页的处理
 * @author: Administrator
 * @date: 2018年12月3日 上午10:42:25
 */
@Controller
public class IndexController {
	@Resource
	private IndexServicelmpl indexServicelmpl;
	@Resource
	private HeaderServiceImpl headerServiceImpl;
	@Resource
	private TopicServiceImpl topicServiceImpl;
	@Resource
	private ReportServiceImpl reportServiceImpl;
	@Resource
	private CollectServiceImpl collectServiceImpl;
	@Resource
	private IndexAjaxServiceImpl indexAjaxServiceImpl;

	@RequestMapping("/indexs")
	public String index(HttpServletRequest request,HttpSession httpSession) throws JSONException, IOException {
		//获取今天的topicId
		int topicId=FlightTrainTask.topicId;
		httpSession.setAttribute("topicId", topicId);
		System.out.println(topicId);
		//获取ip地址
		String ip=request.getParameter("ip");	
		httpSession.setAttribute("ip", ip);
		String city=null;
		if(ip==null) {
			city=request.getParameter("text");
		}else {
		//将ip地址传入接口得到省和市
		JSONObject json = GetPlaceByIp.readJsonFromUrl("http://api.map.baidu.com/location/ip?ak=IlyOnGGEfr47YYPWsUrHqijvDodjH9h6&ip="+ip);		
		city=(String) ((JSONObject) ((JSONObject) json.get("content")).get("address_detail")).get("city");
		String province=(String) ((JSONObject) ((JSONObject) json.get("content")).get("address_detail")).get("province");
		//将省和市放入session里面
		httpSession.setAttribute("city", city);
		httpSession.setAttribute("province", province);
		}

		int pageNumshort = Integer.parseInt(request.getParameter("pageNumshort"));
		int num = Integer.parseInt(request.getParameter("TopicpageNum"));
		Users user = (Users) request.getSession().getAttribute("user");		
		// 导航栏
		List<Tags> list = this.headerServiceImpl.list();
		request.getServletContext().setAttribute("tags", list);
		// 今日话题
		TravelNote travelNote = topicServiceImpl.findTravelByTopic(num, topicId);
		// 短文章
		System.out.println(city);		
		TravelNote shortNote = this.indexServicelmpl.findShort(city, pageNumshort);
		// 长文章
		List<TravelNote> longList = this.indexServicelmpl.findLong(city);

		/* 该游记是否被收藏（用于话题） */
		boolean topicTravelNoteCollected = false;
		/* 该游记是否被收藏（用于短文章） */
		boolean shortTravelNoteCollected = false;
		Map longMap = new HashMap();
		// 这是处理Map用的
		if (user != null) {
			UserDetail userDetail=user.getUserDetail();
			topicTravelNoteCollected = this.collectServiceImpl.isCollect(travelNote, userDetail);
			shortTravelNoteCollected = this.collectServiceImpl.isCollect(shortNote, userDetail);
			longMap = this.collectServiceImpl.isCollect(longList, userDetail);
		} else {
			longMap = this.collectServiceImpl.isCollect(longList, null);
		}

		
		// 今日话题展示的文章是否已经被收藏
		request.setAttribute("topicTravelNoteCollected", topicTravelNoteCollected);
		// 统计这个主题下一共有多少个游记？
		request.setAttribute("count", topicServiceImpl.countTravel(topicId));
		
		// 存今日话题展示的文章
		request.setAttribute("travelNote", travelNote);
		//传今日话题详情
		request.setAttribute("topic", topicServiceImpl.findTopicById(topicId));

		// 说说查询(页数是从1开始的）
		// TODO 图片的长度没有控制（能显示多少张）空指针异常需要改改改	
		
		Set<Imgs> shortImg = shortNote.getImgs();		
		// 存入说说展示的文章
		request.setAttribute("shortNote", shortNote);
		// 说说展示的文章是否已经被收藏
		request.setAttribute("shortTravelNoteCollected", shortTravelNoteCollected);
		// 统计一共有多少个说说  没写
		request.setAttribute("shortCount", indexServicelmpl.shortCount(city));
		// 找到说说的父类tag
		request.setAttribute("shortTag", this.indexServicelmpl.findTags(shortNote));
		// 存说说的的图片
		request.setAttribute("shortImg", shortImg);

		// 热门文章前六查询
		request.setAttribute("longMap", longMap);
		// request.getServletContext().setAttribute("longList",longList);
		request.setAttribute("longTag", this.indexServicelmpl.findLongTags(longList));
		//request.setAttribute("longImg", this.indexServicelmpl.findLongImgs(longList));
		
		//存个城市 
		String nowcity=(String) request.getSession().getAttribute("city");
		request.setAttribute("city", nowcity);
		String nowprovince=(String) request.getSession().getAttribute("province");
		request.setAttribute("province", nowprovince);
		
		return "index";
	}

	/**
	 * <b>changeTopic</b>
	 * <p>
	 * 配套首页今日话题部分的ajax效果的controller
	 * <p>
	 * 查询展示今日话题部分的所需要的信息，并整合好后用json的方式返回 </br>
	 * 
	 * @param pagenum
	 *            查询的页数
	 * @return Map<String,Object> 返回的json字符串
	 * @author 孙亦璇
	 * @since 2018年12月11日15:31:41
	 */
	@ResponseBody
	@RequestMapping("/indextopic")
	public Map<String, Object> changeTopic(int pagenum, HttpServletRequest request) {
		// TODO
		/* 今日话题的ID号，临时定的；真正整合的时候要进行改动 */
		int topicId = FlightTrainTask.topicId;;
		TravelNote travelNote = topicServiceImpl.findTravelByTopic(pagenum, topicId);
		if (request.getSession().getAttribute("user") != null) {
			Users user = (Users) request.getSession().getAttribute("user");
			UserDetail userDetail =user.getUserDetail();
			/* 将游记传入service，将所需的字段抽取出来，存入map中并返回 */

			return indexAjaxServiceImpl.packageTravelNoteMessage(travelNote, userDetail);
		} else {
			return indexAjaxServiceImpl.packageTravelNoteMessage(travelNote, null);
		}

	}

	/**
	 * <b>changeShort</b>
	 * <p>
	 * 配套首页说说部分的ajax效果的controller
	 * <p>
	 * 查询展示今日话题部分的所需要的信息，并整合好后用json的方式返回 </br>
	 *
	 * @param city
	 *            查询的城市
	 * @param pagenum
	 *            查询的页数
	 * @return Map<String,Object> 返回的json字符串
	 * @author 孙亦璇
	 * @since 2018年12月12日14:47:52
	 */
	@ResponseBody
	@RequestMapping("/indexshort")
	public Map<String, Object> changeShort(String city, int pagenum, HttpServletRequest request) {
		Map<String, Object> shortTravelNoteMap;
		/* 根据条件查询出来所用游记 */

		TravelNote travelNote = indexServicelmpl.findShort(city, pagenum);
		System.out.println(city);
		System.out.println(travelNote);
		if (request.getSession().getAttribute("user") != null) {
			Users user = (Users) request.getSession().getAttribute("user");
			/* 将游记传入service，将所需的字段抽取出来，并存入map中 */
			shortTravelNoteMap = indexAjaxServiceImpl.packageTravelNoteMessage(travelNote,user.getUserDetail());
		} else {
			shortTravelNoteMap = indexAjaxServiceImpl.packageTravelNoteMessage(travelNote,null);
		}
		/*
		 * 只有查询说说时需要游记的分类标签 所以为了实现更好的代码复用，这里在controller调用对应的service后，将获得的标签再存入map
		 */
		shortTravelNoteMap.put("travelNoteTag", indexServicelmpl.findTags(travelNote));
		return shortTravelNoteMap;

	}

	
	
	@RequestMapping("/collectindex")
	public String collectindex(HttpServletRequest request) {

		return "redirect:/indexs?pageNumshort=" + request.getParameter("pageNumshort") + "&TopicpageNum="
				+ request.getParameter("TopicpageNum");
	}

}

