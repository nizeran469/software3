package com.asay.wetrip.praise.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.asay.wetrip.entity.TravelNote;
import com.asay.wetrip.praise.dao.PraiseDaoImpl;
/**
 * <b>PraiseServiceImpl<b>
 *
 *<p>实现点赞功能的service层
 *<p>获取所需要变更的游记文章，将其点赞数+1，并返回点赞数
 *   
 * @author 孙亦璇
 * @since 2018年12月17日09:30:27
 * @Version v0.0.1
 */
@Service
public class PraiseServiceImpl {
	@Resource
	private PraiseDaoImpl praiseDaoImpl;

	/**
	 * <b>executePraise</b>   
	 * <p>执行点赞操作的方法
	 * <p>收藏后，返回该文章当前的点赞数
	 * 
	 * @param  travelNote 要点赞的文章     
	 * @return int  该篇文章目前的点赞数   
	 * @author 孙亦璇
	 * @since 2018年12月17日09:30:27
	 * @Version v0.0.1   
	 */
	public int executePraise(TravelNote travelNote) {
		return praiseDaoImpl.executePraise(travelNote);
	}
}
