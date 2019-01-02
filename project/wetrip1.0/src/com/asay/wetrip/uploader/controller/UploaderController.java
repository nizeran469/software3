package com.asay.wetrip.uploader.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
/**
 * <b>uploaderController</b>
 *
 * <p>负责图片上传的controller
 *
 * <p>照片的上传和头像的上传都会调用此controller。根据上传的类型不同，调用不同的service
 *   
 * @author 孙亦璇

 * @date 2018年12月4日下午5:36:21
 * @Version 0.0.1
 */

import com.asay.wetrip.entity.UserDetail;
import com.asay.wetrip.uploader.service.UploaderServiceImpl;

@Controller
public class UploaderController {
	
	/**
	 * {@value #AVATAR_PATH} -记录头像存放路径的常量
	 */
	private static final String AVATAR_PATH ="image\\avatar\\";
	
	/**
	* {@value #PHOTO_PATH}  -记录照片存放路径的常量
	*/
	private static final String PHOTO_PATH="image\\photo\\";
	
	@Resource
	private UploaderServiceImpl uploaderServiceImpl ;
	
	/**
	 * <b> savePhotos</b>   
	 * <p>上传照片时调用的controller
	 * <p>合成图片的真实的存储路径，并将路径传给service层，将图片进行存储
	 * @param Murequest 处理文件流的request     
	 * @return void      
	 */
	@RequestMapping(value="/photoUploader", method=RequestMethod.POST)
	@ResponseBody
	public void savePhotos(HttpServletRequest request,MultipartHttpServletRequest Murequest) {
		/*获取服务器地址
		 * 获取图片集合*/
		String realPath = request.getSession().getServletContext().getRealPath("/");
		Map<String, MultipartFile> newImages = Murequest.getFileMap();
		
		/*创建局部变量newImgPaths
		 * 若request中有newImgPaths，则直接读取
		 * 否则创建一个新的newImgPaths*/
		HttpSession session=request.getSession();
		List<String> newImgPaths;
		if( session.getAttribute("newImgPaths") != null) {
			newImgPaths=(List<String>) session.getAttribute("newImgPaths");
		}
		else {
			newImgPaths=new ArrayList();
		}
		newImgPaths=uploaderServiceImpl.saveImg(newImages, PHOTO_PATH, realPath,newImgPaths);
	
		/*将得到的图片存入session中*/
		session.setAttribute("newImgPaths", newImgPaths);
		
		return ;
	}
	/**
	 * 
	 * <b>saveAvatars</b>   
	 *
	 * <p>存储头像的方法
	 *
	 * <p>通过ajax获得传来的头像，将头像传给service进行本地存储，同时利用dao层将更改过的图片路径插入数据库
	 * @param request
	 * @param multipartFile 得到的头像文件
	 * @return Map<String,String> 
	 * 			内包含 newUserheadUrl 即新头像的路径，用于网页的局部刷新
	 * @author 孙亦璇
	 * @date 2018年12月19日上午9:14:56
	 * @version v0.0.1
	 */
	@ResponseBody
	@RequestMapping(value="/avatarUploader",method=RequestMethod.POST)
	public Map<String, String> saveAvatars(HttpSession session,@RequestParam("file")MultipartFile multipartFile) {
		/*通过session获得用户信息,服务器的绝对路径*/
		UserDetail userDetail=(UserDetail) session.getAttribute("userDetail");
		String realPath = session.getServletContext().getRealPath("/");
		/*将头像文件,头像存储的相对路径,服务器地址的绝对路径,用户信息传入service层进行处理；并获得更新后的用户信息*/
		userDetail=uploaderServiceImpl.saveImg(multipartFile, AVATAR_PATH, realPath,userDetail);
		/*将用户信息更新，并将新图片的路径返回*/
		session.setAttribute("userDetail", userDetail);
		Map<String,String> newUserhead=new HashMap();
		newUserhead.put("newUserheadUrl",userDetail.getUserhead());
		return newUserhead;
	}
}
