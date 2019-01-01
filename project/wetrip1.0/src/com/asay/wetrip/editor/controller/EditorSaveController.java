package com.asay.wetrip.editor.controller;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Set;
import java.util.TreeSet;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.asay.wetrip.editor.service.EditorServiceImpl;
import com.asay.wetrip.entity.Imgs;
import com.asay.wetrip.entity.Tags;
import com.asay.wetrip.entity.Topic;
import com.asay.wetrip.entity.TravelNote;
import com.asay.wetrip.entity.UserDetail;
import com.asay.wetrip.entity.Users;
import com.asay.wetrip.topic.service.TopicServiceImpl;
import com.asay.wetrip.util.ConfigConsts;
import com.asay.wetrip.util.SensitiveWord;

/**
 * 
 * @ClassName:  EditorController   
 * @Description:TODO获取editor页面的数据并将数据传到Service层
 * @author: 赵旭
 * @date:   2018年12月10日 下午3:57:13
 */
@Controller
public class EditorSaveController {

	@Resource
	private EditorServiceImpl editorServiceImpl;
	@Resource
	private TopicServiceImpl topicServiceImpl;
	
	
	/**
	 * map
	 *<p>获得编辑页的数据
	 * @param <b>travelNote
	 * @param session
	 * @param request
	 * @param      
	 * @return String      
	 * @throws
	 */
	@SuppressWarnings("unchecked")
	@RequestMapping(value="/fabiao",method=RequestMethod.POST )
	public String map(TravelNote travelNote,HttpSession session,HttpServletRequest request) {
//通过会话session获得user对象	
		Users user=(Users)request.getSession().getAttribute("user");
		/* 设置发表用户 */
		travelNote.setUserDetail(user.getUserDetail());
/* 初始化点赞数,评论数 */
		travelNote.setPraiseCount(0);
		travelNote.setCommentNum(0);
		travelNote.setPublishtime(new Timestamp(System.currentTimeMillis()));
//得到文章长度 150及以下为说说，150以上为长文章
		int noteLength = travelNote.getContent().length();
		if (noteLength <= 150)
			travelNote.setIslong(0);
		else
			travelNote.setIslong(1);
//通过travelNote对象来接收数据及部分单独通过name属性接收
//topic_id的获得其值
		String topic=request.getParameter("topicId");
		System.out.println(topic+"输出了topic的值");
		if("shi".equals(topic)) {
			Topic topic1=topicServiceImpl.getTodayTopic();
			Set<TravelNote> travelNotes = new HashSet();//把游记变成set类型 进行与travelnote的关联
			travelNotes.add(travelNote);
			topic1.setTravelNotes(travelNotes);
			travelNote.setTopic(topic1);//从数据库中读的
		}else {
			System.out.println(topic+"输出了topic的值应该");
			travelNote.setTopic(null);
		}
//tag的获得没有重复数据的tagset集合
		Set<String> tagset = new HashSet<String>();
		String morenTag=request.getParameter("tag");//获得默认的四个标签之一  分区标签
		String tags=request.getParameter("tag1");
		if(tags!=""){//在这里判空
			String[] tagsplit=tags.split(",");
			System.out.println("输出的分割之后的自定义标签是：========"+tagsplit);
			for (int i = 0; i < tagsplit.length; i++) {   
				if (tagset.contains(tagsplit[i]) == false){//判断 要拆分的字符串 中是否已经存在于这个tagset中   
					tagset.add(tagsplit[i]);//不存在则添加进tagset
				}
			}		
		}	
//敏感词的过滤
		SensitiveWord sw = new SensitiveWord("CensorWords.txt");  
		sw.InitializationWork();
		String str=travelNote.getContent();
		str = sw.filterInfo(str);
		travelNote.setContent(str);
//地址解析成省和市
		String province=editorServiceImpl.ARP(travelNote.getAddress());
		String city=editorServiceImpl.ARC(travelNote.getAddress());
		travelNote.setProvince(province);
		travelNote.setCity(city);		

//获得imgpaths
		List <String>imgPaths=(List<String>) session.getAttribute("newImgPaths");
//调用service的方法
		
		editorServiceImpl.saveTravelNotesAndImages(travelNote,imgPaths); 
		System.out.println(travelNote.getId()+"**************************");
		this.editorServiceImpl.addMorenTag(travelNote, morenTag);
		this.editorServiceImpl.addTagset(travelNote, tagset,morenTag);
//成功存入后跳转到个人中心页面
		return "main";
	}
}
