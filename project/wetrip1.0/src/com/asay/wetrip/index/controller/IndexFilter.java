package com.asay.wetrip.index.controller;

import java.awt.Color;
import java.awt.Font;
import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.swing.JOptionPane;
import javax.swing.SwingUtilities;
import javax.swing.UIManager;
import javax.swing.UnsupportedLookAndFeelException;
import javax.swing.plaf.FontUIResource;

import org.springframework.stereotype.Component;


/**
 * 
 * @ClassName:  IndexFilter   
 * @Description:如果用户没有登录，点击别的地方不能跳转，会提示用户先登录   
 * @author: 王慧
 * @date:   2018年12月6日 下午7:32:21
 */
@Component
public class IndexFilter implements Filter {

    /**
     * Default constructor. 
     */
    public IndexFilter() {
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see Filter#destroy()
	 */
	public void destroy() {
		// TODO Auto-generated method stub
	}

	/**
	 * @see Filter#doFilter(ServletRequest, ServletResponse, FilterChain)
	 */
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {		
		HttpSession session=((HttpServletRequest) request).getSession();
		String userEmail=(String) session.getAttribute("userEmail");
		if(userEmail!=null) {
			chain.doFilter(request, response);
		}else {
			//提示框	
//			UIManager UI=new UIManager();
//			 UI.put("OptionPane.background", Color.white);
//			 UI.put("Panel.background", Color.white);
//			 //UI.put("Button.background",Color.blue);
//			 //UI.put("OptionPane.font", new FontUIResource(new Font()));
//			 JOptionPane jpane=new JOptionPane() ;
//				try {
//					//设置样式
//					UIManager.setLookAndFeel("com.sun.java.swing.plaf.nimbus.NimbusLookAndFeel");
//					SwingUtilities.updateComponentTreeUI(jpane);
//				} catch (Throwable e) {
//					e.printStackTrace();
//				}				
//			jpane.showMessageDialog(null, "请先登录！", "localhost:8080显示", JOptionPane.ERROR_MESSAGE);
			System.out.println("过滤器");
			((HttpServletRequest)request).getSession().setAttribute("notLogin", true);
			((HttpServletRequest)request).getRequestDispatcher("main.jsp").forward(request, response);
		}
		
		
	}

	/**
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig fConfig) throws ServletException {
		// TODO Auto-generated method stub
	}

}
