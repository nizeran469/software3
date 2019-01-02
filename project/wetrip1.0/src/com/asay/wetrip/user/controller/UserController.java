package com.asay.wetrip.user.controller;


import java.util.regex.Matcher;
import java.util.regex.Pattern;
import javax.annotation.Resource;
import javax.mail.MessagingException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import com.asay.wetrip.entity.Users;
import com.asay.wetrip.user.service.UserServiceImpl;

/**
 * 
 * @ClassName:  UserController   
 * @Description:处理用户登录，注册、找回密码是的跳转  
 * @author:王慧
 * @date:   2018年12月12日 下午2:59:43
 */
@Controller
public class UserController {	
	@Resource	
	private UserServiceImpl userServiceImpl;
	
	/**
	 * 
	 * @Title: toLogin   
	 * @Description: 点击小人get方式的超链接进入login.jsp页面  
	 * @param: @param model
	 * @param: @return      
	 * @return: 返回到login.jsp页面      
	 * @throws
	 */
	@RequestMapping(value="/login", method=RequestMethod.GET)
	public String toLogin( HttpSession httpSession){
		httpSession.removeAttribute("userError");
		httpSession.removeAttribute("pwdError");
		httpSession.removeAttribute("codeError");
		httpSession.removeAttribute("tip");
		httpSession.removeAttribute("codenull");
		return "login";
	}
	/**
	 * 
	 * @Title: login   
	 * @Description: 用户提交信息post的方式传入，判断各种情况，判断用户是否登录成功 
	 * @param: @param users
	 * @param: @param session
	 * @param: @param request
	 * @param: @return      
	 * @return: 登录成功跳转首页，不成功跳转登录页     
	 * @throws
	 */
	@RequestMapping(value="/login",method=RequestMethod.POST)
	public String login(Users users, HttpSession httpSession,HttpServletRequest request) {
		String email=users.getEmail();
		String password=users.getPassword();
		String code=request.getParameter("codekey");
		if(email==""&&password==""&&code=="") {
			httpSession.setAttribute("tip",1);
			return"login";
		}
		if(email=="") {
			httpSession.setAttribute("tip",2);
			return"login";
		}
		if(password=="") {
			httpSession.setAttribute("tip",3);
			return"login";
		}
		if(code=="") {
			httpSession.setAttribute("tip",4);
			return"login";
		}
		else {			
		Users user=this.userServiceImpl.getUserDetailinfo(users);
		boolean userVerfiy =this.userServiceImpl.getUser(users);											
		if (userVerfiy) { // 若用户存在	
			boolean codeVerfiy =this.userServiceImpl.verfiyCode(request);
			boolean pwdVerfiy =this.userServiceImpl.verfiyPwd(users);
			if (!pwdVerfiy) {//密码不正确
				httpSession.removeAttribute("userError");				
				httpSession.setAttribute("pwdError",true);// 密码错误
				return "login";
			} else {//密码正确
				if (codeVerfiy) {//验证码正确
					request.getSession().removeAttribute("CODE");
					// 通过
					httpSession.setAttribute("userEmail", users.getEmail()); // 保存用户账号信息获取user的信息					
					httpSession.setAttribute("user", user);
					httpSession.setAttribute("userDetail", user.getUserDetail());
					this.userServiceImpl.insertHistory(users,request);

					return "redirect:main.jsp";
				}else {//验证码不正确										
					httpSession.removeAttribute("userError");
					httpSession.removeAttribute("pwdError");
					httpSession.setAttribute("codeError",true); // 验证码错误				
					}
					return "login";
				}						
		} else {
			httpSession.setAttribute("userError",true); // 用户名不存在
			return "login";
		}
		}
}
	/**
	 * 
	 * @Title: toRegist   
	 * @Description: 点击注册进入注册页面  
	 * @param: @param httpSession
	 * @param: @return      
	 * @return: String      
	 * @throws
	 */
		//跳转到注册界面
		@RequestMapping(value="/register",method=RequestMethod.GET)
		public String toRegist(HttpSession httpSession) {
			httpSession.removeAttribute("emailError");
			httpSession.removeAttribute("userError");
			httpSession.removeAttribute("pwdError");
			httpSession.removeAttribute("codeError");
			return "register";
		}
		/**
		 * 
		 * @Title: regist   
		 * @Description: 客户端输入的注册信息提交到这里进行处理   
		 * @param: @param users
		 * @param: @param request
		 * @param: @param httpSession
		 * @param: @return      
		 * @return: String      
		 * @throws
		 */
		//注册插入数据库用户信息
		@RequestMapping(value="/register" ,method=RequestMethod.POST)
		public String regist(Users users,HttpServletRequest request,HttpSession httpSession) {
			//如果邮箱没有输入，密码为空，验证码为空
			String email=users.getEmail();
			String password1=request.getParameter("password1");
			String password2=request.getParameter("password2");
			String code=request.getParameter("codekey");
			if(email==""&&password1==""&&password2==""&&code=="") {
				httpSession.setAttribute("tip",1);
				return "register";
			}
			if(email=="") {
				httpSession.setAttribute("tip",2);
				return "register";
			}
			if(password1=="") {
				httpSession.setAttribute("tip",3);
				return "register";
			}
			if(code=="") {
				httpSession.setAttribute("tip",4);
				return "register";
			}
			else {
			//根据用户输入邮箱判断是否存在该用户
			boolean userVerfiy =this.userServiceImpl.getUser(users);											
			if (!userVerfiy) { // 若用户不存在
				
				boolean flag = false;
				String check = "^([a-z0-9A-Z]+[-|_|\\.]?)+[a-z0-9A-Z]@([a-z0-9A-Z]+(-[a-z0-9A-Z]+)?\\.)+[a-zA-Z]{2,}$";
		        Pattern regex = Pattern.compile(check);
		        Matcher matcher = regex.matcher(email);
		        flag = matcher.matches();				
				if(flag) {//邮箱格式
					boolean codeVerfiy =this.userServiceImpl.verfiyCode(request);
					boolean pwdVerfiy =request.getParameter("password1").equals(request.getParameter("password2"));
					if (pwdVerfiy) {//密码正确												
						if (!codeVerfiy) {//验证码不正确
							httpSession.removeAttribute("userError");							
							httpSession.setAttribute("codeError",true);// 密码不一致
							return "register";
						} else {//验证码正确
							request.getSession().removeAttribute("CODE");
							this.userServiceImpl.insertUser(users, request);												
							return "redirect:login";
						}
					} else {//密码不正确
						httpSession.removeAttribute("userError");
						httpSession.removeAttribute("emailError");
						httpSession.setAttribute("pwdError",true); // 密码错误
						return "register";
					}
				}else {//邮箱格式不正确
					httpSession.removeAttribute("userError");
					httpSession.setAttribute("emailError",true); // 邮箱格式不正确
					return "register";
				}
				
			} else {
				
				httpSession.setAttribute("userError",true); // 用户存在
				return "register";
			}
			}
		}
		/**
		 * 
		 * @Title: cancel   
		 * @Description: 注销用户   
		 * @param: @param request
		 * @param: @return      
		 * @return: String      
		 * @throws
		 */
		@RequestMapping("/cancel")
		public String cancel(HttpServletRequest request) {
			//根据session里面存取的用户的email判断，把该用户的session失效即可注销登录
			HttpSession session=request.getSession();
			if(session.getAttribute("userEmail")!=null) {
				session.invalidate();
			}
			//注销之后跳转到首页
			return "main";
		}
		
		/**
		 * @throws MessagingException 
		 * 
		 * @Title: getPasswordByEmail   
		 * @Description:发送邮件找回密码
		 * @param: @param request
		 * @param: @param response
		 * @param: @param email      
		 * @return: void      
		 * @throws
		 */
		@RequestMapping(value="/getpassword")
		public String getPasswordByEmail(HttpServletRequest request,HttpServletResponse response) {
			response.setCharacterEncoding("UTF-8");
			String sendtoemail = request.getParameter("email");	
			System.out.println(sendtoemail);	
			String code=request.getParameter("codekey");
			if(sendtoemail==""&&code=="") {
				request.getSession().setAttribute("tip",1);
				return "findpassword";
			}else{
				if(sendtoemail=="") {
					request.getSession().setAttribute("tip",2);
					return "findpassword";
				}else if(code=="") {
					request.getSession().setAttribute("tip",3);
					return "findpassword";
				}else {//不为空的情况下
					Users users=new Users();
					users.setEmail(sendtoemail);
					boolean userVerfiy =this.userServiceImpl.getUser(users);
					if(userVerfiy) {//用户存在
						boolean codeVerfiy =this.userServiceImpl.verfiyCode(request);
						if(codeVerfiy) {//验证码正确							
							try {
							boolean sendEmail = this.userServiceImpl.sendEmail(request, response, sendtoemail);
								if(sendEmail) {//发送成功
									return "success";
								}
								else {//发送失败
									request.getSession().setAttribute("tip",6);
									return "findpassword";
								}
							} catch (MessagingException e) {
								// TODO Auto-generated catch block
								e.printStackTrace();
								return "findpassword";
							}													
						}else {//验证码错误
							request.getSession().setAttribute("tip",5);
							return "findpassword";
						}							
					}else {//用户不存在
						request.getSession().setAttribute("tip",4);
						return "findpassword";
					}				
				}//不为空的情况
			}//为空的情况			
		}
		/**
		 * 
		 * @Title: resetPassword   
		 * @Description: 当用户通过邮件地址发来请求重置密码时的跳转
		 * @param: @param request
		 * @param: @param response
		 * @param: @return      
		 * @return: String      
		 * @throws
		 */
		@RequestMapping(value="/resetPwd")
		public String resetPassword(HttpServletRequest request,HttpServletResponse response) {
			String email=request.getParameter("email");
			String password1=request.getParameter("password1");
			String password2=request.getParameter("password2");
			String code=request.getParameter("codekey");			
			boolean codeVerfiy =this.userServiceImpl.verfiyCode(request);
			Users users=new Users();
			users.setEmail(email);					
			//如果邮箱没有输入，密码为空，验证码为空			
			if(email==""&&password1==""&&password2==""&&code=="") {
				request.getSession().setAttribute("tip",1);
				return "resetpassword";
			}else {
			if(email=="") {
				request.getSession().setAttribute("tip",2);
				return "resetpassword";
			}
			else if(password1=="") {
				request.getSession().setAttribute("tip",3);
				return "resetpassword";
			}
			else if(code=="") {
				request.getSession().setAttribute("tip",4);
				return "resetpassword";
			}
			else {
				//根据用户输入邮箱判断是否存在该用户
				boolean userVerfiy =this.userServiceImpl.getUser(users);											
				if (userVerfiy) { // 若用户存在
					boolean pwdVerfiy =request.getParameter("password1").equals(request.getParameter("password2"));
					if (!pwdVerfiy) {//密码不一致					
						request.getSession().removeAttribute("userError");
						request.getSession().removeAttribute("codeError");
						request.getSession().setAttribute("pwdError",true);// 密码不一致
						return "resetpassword";
					}else {//密码一致
						if (codeVerfiy) {//验证码正确
							request.getSession().removeAttribute("CODE");
						this.userServiceImpl.resetUser(users, request);									
						return "login";
						}else {//验证码错误
							request.getSession().removeAttribute("userError");
							request.getSession().removeAttribute("emailError");
							request.getSession().setAttribute("codeError",true); // 验证码错误
							return "resetpassword";
						}								
					}
				}else {//用户不存在				
					request.getSession().setAttribute("userError",true); // 用户输入错误
					return "register";
				}
			}//不为空的情况		
		}
		}//方法结束
}
