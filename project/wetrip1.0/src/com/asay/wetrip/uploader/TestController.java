package com.asay.wetrip.uploader;

import java.io.File;
import java.io.IOException;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.MultipartResolver;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;
/**
 * 
 * <b>TestController</b>
 *
 * <p>测试用的上传图片的controller
 * @author: 孙亦璇
 * @since:2018年12月6日上午10:17:23
 * @Version:0.0.1
 */
@Controller
public class TestController {
	@RequestMapping("/uploader")
	public void upload(HttpServletRequest request, HttpServletResponse response,MultipartHttpServletRequest Murequest) {
		System.out.println("收到图片!");
		Map<String, MultipartFile> files = Murequest.getFileMap();// 得到文件map对象
		System.out.println(files.isEmpty());
		String upaloadUrl = request.getSession().getServletContext().getRealPath("/") + "image\\photo\\";// 得到当前工程路径拼接上文件名
		File dir = new File(upaloadUrl);
		System.out.println(upaloadUrl);
		if (!dir.exists())// 目录不存在则创建
			dir.mkdirs();
		for (MultipartFile file : files.values()) {
			String fileName = file.getOriginalFilename();
			File tagetFile = new File(upaloadUrl + fileName);// 创建文件对象
			//TODO 文件的重命名没做
			if (!tagetFile.exists()) {// 文件名不存在 则新建文件，并将文件复制到新建文件中
				try {
					tagetFile.createNewFile();
				} catch (IOException e) {
					e.printStackTrace();
				}
				try {
					file.transferTo(tagetFile);
				} catch (IllegalStateException e) {
					e.printStackTrace();
				} catch (IOException e) {
					e.printStackTrace();
				}

			}
		}
		System.out.println("接收完毕");
	}
}
