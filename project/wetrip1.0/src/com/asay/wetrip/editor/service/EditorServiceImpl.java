package com.asay.wetrip.editor.service;

import java.util.HashSet;
import java.util.List;
import java.util.Set;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.asay.wetrip.editor.dao.EditorDaoImpl;
import com.asay.wetrip.entity.Imgs;
import com.asay.wetrip.entity.TagTravelNote;
import com.asay.wetrip.entity.Tags;
import com.asay.wetrip.entity.TravelNote;

/**
 * 
 * <b>EditorService</b>
 *
 * <p>
 * 负责处理editor.jsp的service
 * 
 * @author: 孙亦璇
 * @date:2018年12月5日下午2:22:14
 * @Version:0.0.1
 */

@Service
@Transactional
public class EditorServiceImpl {
	@Resource
	private EditorDaoImpl editorDaoImpl;

	/**
	 * 
	 * <b>saveTravelNotesAndImages</b>
	 * 
	 * <p>存储游记和对应的图片的方法
	 * <p>将游记和图片之间建立了联系
	 * <p>之后将交给{@code EditorDaoImpl} 插入数据库
	 *
	 * @param travelNote   游记对象 
	 * @param imgPaths (所上传的图片的路径)
	 * @return void 
	 */
	
	public void saveTravelNotesAndImages(TravelNote travelNote, List<String> imgPaths) {
		
		/* 清除该篇文章内附带的照片，为下面重新插入照片做准备 */
		editorDaoImpl.delAllPhotos(travelNote);		
		this.editorDaoImpl.saveTravelNotes(travelNote);
		/* 封装Imgs */
		
		Set<Imgs> imgs = new HashSet();
		if(imgPaths!=null) {
		for (String imgPath : imgPaths) {
			Imgs img = new Imgs();
			img.setPath(imgPath);
			img.setTravelNote(travelNote);
			imgs.add(img);
		}
		}
		/* 预防没有图片的情况 */
		if (imgs != null) {
			/* 将imgs和travelNote关联 */
			travelNote.setImgs(imgs);

			/* 传给dao */
			editorDaoImpl.savePhotos(imgs);
		}
		
	}
	/**
	 * <p>首先这是更新
	 * <b>saveTravelNotesAndImages</b>
	 * 
	 * <p>存储游记和对应的图片的方法
	 * <p>将游记和图片之间建立了联系
	 * <p>之后将交给{@code EditorDaoImpl} 插入数据库
	 *
	 * @param travelNote   游记对象 
	 * @param imgPaths (所上传的图片的路径)
	 * @return void 
	 */
	
	public void updateTravelNotesAndImages(TravelNote oldTravelNote,TravelNote travelNote, List<String> imgPaths,int id) {
		
		/* 清除该篇文章内附带的照片，为下面重新插入照片做准备 */
		editorDaoImpl.delAllPhotos(oldTravelNote);		
		/*进行travelNote的更新*/
		/*1.把之前与图片关联的删掉*/
		//现在执行的是删除原来的游记表之后 save相同id的游记表 效果是一样的
		this.editorDaoImpl.delImgConnect(oldTravelNote);//这里有联级删除的问题  img为主控方 删除时会出现联级删除从表的数据  解决方案可以变一下主控方 或者就在基础上把联级关系去掉
		/*2.话题之间的关系就在原先的基础上进行这次的更改*/
		/*3.用户表不变*/
		/*4.标签表 先找出原来的关系  父标签减一  子标签如果数量为1就直接删掉这一项否则直接减一*/
		this.editorDaoImpl.updateTravelNotes(travelNote,id);
		/* 封装Imgs */		
		Set<Imgs> imgs = new HashSet();
		if(imgPaths!=null) {
		for (String imgPath : imgPaths) {
			Imgs img = new Imgs();
			img.setPath(imgPath);
			img.setTravelNote(travelNote);
			imgs.add(img);
		}
		}
		/* 预防没有图片的情况 */
		if (imgs != null) {
			/* 将imgs和travelNote关联 */
			travelNote.setImgs(imgs);

			/* 传给dao */
			editorDaoImpl.savePhotos(imgs);
		}
		
	}
	/**
	 * 
	 * @Title: tag   
	 * @Description: TODO  获得tag的单个标签 进行是否存在的判断  存在则使其count加1 不存在则插入（tag表）manyToMany实现的方法 现在用的manyToOne
	 * @param: @param tagName  获得的单个标签    
	 * @return: void      
	 * @throws
	 */
	
//	public void tag(Tags tag,TravelNote travelNote) {
//		if(editorDaoImpl.tagTraversing(tag.getTagName())) {//存在的情况
//			editorDaoImpl.updateTagCount(tag,travelNote);
//		}else {
//			Tags tag1=new Tags();
//			tag1.setTagName(tag.getTagName());
//			tag1.getTravelNoteSet().add(travelNote);
//			tag1.setTagCount(1);
//			editorDaoImpl.saveTag(tag1);
//		}
//	}
/**
 * 	
 * @Title: addMorenTag   
 * @Description: 游记实体添加分区标签属性 
 * @param: @param travelNote
 * @param: @param morentag      
 * @return: void      
 * @throws
 */
	public void addMorenTag(TravelNote travelNote,String morentag) {
		TagTravelNote ttn=new TagTravelNote();
		ttn.setTags(this.editorDaoImpl.findMorenTag(morentag));
		ttn.setTravelNote(travelNote);
		//ttn连接项save库操作
		this.editorDaoImpl.saveTagTravelNote(ttn);
		//分区标签count+1
		this.editorDaoImpl.updateCount(this.editorDaoImpl.findMorenTag(morentag));

	}
	/**
	 * 
	 * @Title: delMorenTag   
	 * @Description: TODO删除游记表和标签表之间的关联  并实现默认标签的减一
	 * @param: @param travelNote
	 * @param: @param morentag      
	 * @return: void      
	 * @throws
	 */
		public void delTagConnect(TravelNote travelNote) {
			//根据travelNote得到TagTravelNote的list集合
			List<TagTravelNote> listttn=this.editorDaoImpl.listTagTravelNote(travelNote);
			for (int i = 0; i < listttn.size(); i++) {
				this.editorDaoImpl.reduceCount(listttn.get(i));
			}
			//直接根据游记表的ID就可以删掉中间表的关联了
			this.editorDaoImpl.delTagTravelNote(travelNote);
		}
	/**
	 * 
	 * @Title: addTagset   
	 * @Description: 自定义的标签加入
	 * @param: @param travelNote
	 * @param: @param tagset
	 * @param: @param morentag      
	 * @return: void      
	 * @throws
	 */
	public void addTagset(TravelNote travelNote,Set<String> tagset,String morentag) {
		Tags morenTag = this.editorDaoImpl.findMorenTag(morentag);//分区标签实体
		if(tagset.size()!=0) {
		for (String tagi: tagset) {
			System.out.println(tagi);
			//判断这个自定义标签是否在该分区下已存在
			int flag=0;
			for (Tags tag:morenTag.getChildTags()) {
				if(tag.getTagName().equals(tagi)) {
					flag=1;
				}
			}
				if(flag==1) {//存在  则查询出这个tags实体项  并添加连接项
					Tags newTag=this.editorDaoImpl.findFreeTag(tagi,morenTag);					
					TagTravelNote ttn=new TagTravelNote();
					ttn.setTags(newTag);
					ttn.setTravelNote(travelNote);
// ttn连接项save库操作
					this.editorDaoImpl.saveTagTravelNote(ttn);	
//分区标签count+1		
					this.editorDaoImpl.updateCount(newTag);
					System.out.println(newTag.getTagCount());
				}
				else {//不存在，new一个tags表项，并添加连接项
					Tags newTag=new Tags();
					newTag.setParentTag(morenTag);
					newTag.setTagName(tagi);
					newTag.setTagCount(1);
					TagTravelNote ttn=new TagTravelNote();	
					ttn.setTravelNote(travelNote);					
					//游记、标签项实体加入连接项
					this.editorDaoImpl.saveTag(newTag);
					ttn.setTags(newTag);
					this.editorDaoImpl.saveTagTravelNote(ttn);
				}//else end
			
		}//for end 
		}
	}
	/**
	 * 
	 * @Title: saveTravelNote   
	 * @Description:保存到游记表  
	 * @param: @param travelNote      
	 * @return: void      
	 * @throws
	 */
	public void saveTravelNote(TravelNote travelNote) {
		this.editorDaoImpl.saveTravelNotes(travelNote);
	}
	/**
	 * 
	 * @Title: findById   
	 * @Description: TODO找到老游记  
	 * @param: @param travelNote
	 * @param: @return      
	 * @return: TravelNote      
	 * @throws
	 */
	public TravelNote findById(int id) {
		return editorDaoImpl.findById(id);
	}
	
	
	/**
	 * 
	 * @Title: ARP   
	 * @Description: TODO 字符串的解析，解析出省
	 * @param: @param address
	 * @param: @return   省份   
	 * @return: String      
	 * @throws
	 */
	public String ARP(String address){
        String regex="(?<province>[^省]+自治区|.*?省|.*?行政区|.*?市)(?<city>[^市]+自治州|.*?地区|.*?行政单位|.+盟|市辖区|.*?市|.*?县)(?<county>[^县]+县|.+区|.+市|.+旗|.+海域|.+岛)?(?<town>[^区]+区|.+镇)?(?<village>.*)";
        Matcher m=Pattern.compile(regex).matcher(address);
        String province=null;//city=null;//county=null,town=null,village=null;
        while(m.find()){
            province=m.group("province");
        }
        return province;
    }
	/**
	 * 
	 * @Title: ARC   
	 * @Description: TODO  字符串的解析，解析出市
	 * @param: @param address
	 * @param: @return    市名
	 * @return: String      
	 * @throws
	 */
    public String ARC(String address){
        String regex="(?<province>[^省]+自治区|.*?省|.*?行政区|.*?市)(?<city>[^市]+自治州|.*?地区|.*?行政单位|.+盟|市辖区|.*?市|.*?县)(?<county>[^县]+县|.+区|.+市|.+旗|.+海域|.+岛)?(?<town>[^区]+区|.+镇)?(?<village>.*)";
        Matcher m=Pattern.compile(regex).matcher(address);
        String city=null;//county=null,town=null,village=null;
        while(m.find()){
            city=m.group("city");
        }
        return city;
    }
}
