package com.asay.wetrip.index.controller;

import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Component;

/**
 * 首页搜索框城市名称的显示
 */

@Component
public class IndexServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public IndexServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setCharacterEncoding("UTF-8");
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset = utf-8");
		//获取前端传入的数据
		String text = request.getParameter("text");
		//我们在这里也还是向list集合中添加数据，模拟数据库的查询操作
		System.out.println(text);				
		List<String> list = new ArrayList<>();
		try {
			String path=this.getServletContext().getRealPath("citylist.txt");			
			FileReader fr = new FileReader(path);				
			BufferedReader bf = new BufferedReader(fr);
			String str;
			// 按行读取字符串
			while ((str = bf.readLine()) != null) {				
				list.add(str);
			}
			bf.close();
			fr.close();
		} catch (IOException e) {
			e.printStackTrace();
		}		
		//将数据 转换成字符串
		String str = "";			
			for(int i=0;i<list.size();i++) {				
				if(list.get(i).startsWith(text)) {
					System.out.println(list.get(i));
					str+=list.get(i);
					str+=",";
				}
				
			}							
			//将处理好的数据传回给客户端
			response.getWriter().write(str);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
