package com.asay.wetrip.index.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Set;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.asay.wetrip.entity.Imgs;
import com.asay.wetrip.entity.TagTravelNote;
import com.asay.wetrip.entity.Tags;
import com.asay.wetrip.entity.TravelNote;
import com.asay.wetrip.index.dao.IndexDaolmpl;

/**
 * 
 * @ClassName: IndexServicelmpl
 * @Description:TODO(这里用一句话描述这个类的作用)
 * @author:倪泽苒
 * @date: 2018年12月3日 上午10:54:18
 */
@Service
@Transactional(readOnly = true)
public class IndexServicelmpl {
	@Resource
	private IndexDaolmpl indexDaolmpl;

	// 说说查询，热度排序
	public TravelNote findShort(String city, int pageNumshort) {
		return this.indexDaolmpl.findShort(city, pageNumshort);
	}

	//查询游记一共有多少
	public int shortCount(String city) {
		return indexDaolmpl.countTravelByTopic(city);
	}

	// 前6长文章查询
	public List<TravelNote> findLong(String city) {
		return this.indexDaolmpl.findLong(city);
	}

	// 查询某个游记的分类标签
	public String findTags(TravelNote tn) {
		Set<TagTravelNote> set = tn.getTagTravelNote();
		for (TagTravelNote ttn : set) {
			if (ttn.getTags().getParentTag() == null) {
				return ttn.getTags().getTagName();
			}
		}
		return "";
	}

	// 某个游记列表的分类标签，以索引来对应游记列表
	public List<String> findLongTags(List<TravelNote> longList) {
		List<String> longTag = new ArrayList<String>();
		for (TravelNote tn : longList) {
			Set<TagTravelNote> set = tn.getTagTravelNote();
			for (TagTravelNote ttn : set) {
				if (ttn.getTags().getParentTag() == null) {
					longTag.add(ttn.getTags().getTagName());
				}
			}
		}
		return longTag;
	}

	// 游记list查询首张图片
	public List<Imgs> findLongImgs(List<TravelNote> longList) {
		List<Imgs> longImg = new ArrayList<Imgs>();
		for (TravelNote tn : longList) {
			longImg.add(tn.getImgs().iterator().next());
		}
		return longImg;
	}

}

