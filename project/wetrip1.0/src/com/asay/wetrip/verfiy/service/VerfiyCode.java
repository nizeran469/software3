package com.asay.wetrip.verfiy.service;
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;


@Controller("/verifyCode")
public class VerfiyCode {
	public void verfiyCode(HttpServletRequest request,HttpServletResponse response) throws IOException {
		String code = request.getParameter("code");
		String key = (String) request.getSession().getAttribute("CODE");
		if(code != null && code.equalsIgnoreCase(key)){
			request.getSession().removeAttribute("CODE");
			response.getWriter().println(true);
		}else{
			response.getWriter().println(false);
		}
	}
}


