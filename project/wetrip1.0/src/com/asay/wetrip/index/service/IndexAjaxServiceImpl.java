package com.asay.wetrip.index.service;

import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.Map;
import java.util.Set;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.asay.wetrip.collect.dao.CollectDaoImpl;
import com.asay.wetrip.entity.Imgs;
import com.asay.wetrip.entity.TravelNote;
import com.asay.wetrip.entity.UserDetail;
/**
 * 
 * <b>IndexAjaxServiceImpl</b>
 * 配套首页今日话题和说说部分的ajax效果的service
 * <p> 查询展示今日话题部分和说说的所需要的信息，并整合好后用json的方式返回 </br>
 * json中包含以下内容：<br>
	 * <blockquote> username 用户名 <br>
	 * userhead 用户头像 <br>
	 * pubishTime 格式化好了的时间 <br>
	 * content 游记内容 <br>
	 * imgs 游记图片（最多显示三张） <br>
	 * collectNum 收藏数 <br>
	 * praiseCount 点赞数 <br>
	 * commentNum 评论数 <br>
	 * travelNoteId 游记ID <br>
	 * collected 是否被收藏 <br>
	 * </blockquote>
 * @author: 孙亦璇
 * @See:标记该类相关联的类
 * @since:2018年12月12日下午2:48:18
 * @Version:0.0.1
 */
@Service
public class  IndexAjaxServiceImpl {
	@Resource
	private CollectDaoImpl collectDaoImpl;
	public Map<String,Object> packageTravelNoteMessage(TravelNote travelNote,UserDetail userDetail){
		/*
		 * 因为死循环的问题，所以不能简单地返回一个游记类型了事。要把需要的都提取出来，放入map中返回
		 */
		Map<String, Object> travelNoteMap = new HashMap();
		// 用户名
		travelNoteMap.put("username", travelNote.getUserDetail().getUsername());
		// 头像
		travelNoteMap.put("userhead", travelNote.getUserDetail().getUserhead());
		// 发布时间(格式化)
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy年MM月dd日  HH:mm");
		String pubishTime = simpleDateFormat.format(travelNote.getPublishtime());
		travelNoteMap.put("publishtime", pubishTime);
		// 文章内容
		travelNoteMap.put("content", travelNote.getContent());
		// 文章图片(首页最多显示三张图片)
		Set<Imgs> imgs = travelNote.getImgs();

		// 判断图片的size，若大于4张，则只取4张
		int imgSize = imgs.size();
		if (imgSize > 4) {
			imgSize = 4;
		}
		// 用于存图片路径的set
		Set<String> imgsPath = new HashSet();
		// 遍历，存入
		Iterator iterator = imgs.iterator();
		int i = 0; // 这里是为了控制循环次数的
		while (iterator.hasNext() && i < imgSize) {
			i++;
			Imgs temp = (Imgs) iterator.next();
			imgsPath.add(temp.getPath());
		}

		travelNoteMap.put("imgs", imgsPath);
		// 收藏数
		travelNoteMap.put("collectNum", travelNote.getCollectTravels().size());
		// 点赞数
		travelNoteMap.put("praiseCount", travelNote.getPraiseCount());
		// 评论数
		travelNoteMap.put("commentNum", travelNote.getCommentNum());
		// 文章id
		travelNoteMap.put("travelNoteId", travelNote.getId());
		// 是否被收藏
		travelNoteMap.put("collected", collectDaoImpl.isCollect(travelNote,userDetail));
		return travelNoteMap;
	}
}
