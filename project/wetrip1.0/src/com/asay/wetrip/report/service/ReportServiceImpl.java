package com.asay.wetrip.report.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.asay.wetrip.entity.TravelNote;
import com.asay.wetrip.report.dao.ReportDaoImpl;
/**
 * <b>ReportServiceImpl<b>
 *
 *<p>实现举报功能的service层
 *<p>获取所需要举报的游记文章，将其被举报数+1
 *   
 * @author 孙亦璇
 * @since 2018年12月17日21:19:10
 * @Version v0.0.1
 */
@Service
@Transactional
public class ReportServiceImpl {
	@Resource
	private ReportDaoImpl reportDaoImpl;

	/**
	 * <b>executeReport</b>   
	 * <p>执行举报操作的方法
	 * 
	 * @param  travelNote 要举报的文章     
	 * @author 孙亦璇
	 * @since 2018年12月17日21:20:07
	 * @Version v0.0.1   
	 */
	public void executeReport(TravelNote travelNote) {
		this.reportDaoImpl.executeReport(travelNote);
	}

}
