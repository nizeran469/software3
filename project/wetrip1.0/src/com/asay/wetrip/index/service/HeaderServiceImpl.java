package com.asay.wetrip.index.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.asay.wetrip.entity.Tags;
import com.asay.wetrip.index.dao.HeaderDaoImpl;

@Service
@Transactional(readOnly=true)
public class HeaderServiceImpl {
	@Resource
	private HeaderDaoImpl hd;
	
	public List<Tags> list(){
		return this.hd.findAll();
	}
}

