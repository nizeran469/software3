package com.asay.wetrip.verfiy.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.asay.wetrip.verfiy.util.VerifyCodeUtils;

@Controller
public class CreateCode {
	@RequestMapping("/createCode")
	public void code(HttpServletRequest req,HttpServletResponse resp) {
		resp.setHeader("Pragma", "No-cache");
		resp.setHeader("Cache-Control", "no-cache");
		resp.setDateHeader("Expires", 0);
		resp.setContentType("image/jpeg");

		// 生成随机字串
		String verifyCode = VerifyCodeUtils.generateVerifyCode(4);
		// 存入会话session
		req.getSession().setAttribute("CODE", verifyCode.toLowerCase());

		// 生成图片
		int width = 100;// 宽
		int height = 40;// 高
		try {
			VerifyCodeUtils.outputImage(width, height, resp.getOutputStream(), verifyCode);
		} catch (IOException e) {
			// TODO 自动生成的 catch 块
			e.printStackTrace();
		}
	}
}
