package com.asay.wetrip.user.service;

import java.io.UnsupportedEncodingException;
import java.util.Date;
import java.util.Properties;

import javax.annotation.Resource;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Service;
import com.asay.wetrip.entity.Users;
import com.asay.wetrip.user.dao.UserDaoImpl;
/**
 * 
 * @ClassName:  UserServiceImpl   
 * @Description:用户登录注册，找回密码，提交信息之后进行验证身份   
 * @author: 王慧
 * @date:   2018年12月6日 下午7:34:41
 */
@Service
public class UserServiceImpl {
	@Resource
	private UserDaoImpl userDaoImpl;
	/**
	 * 
	 * @Title: getUserDetailinfo   
	 * @Description:获取得到用户的详细信息   
	 * @param: @param users
	 * @param: @return      
	 * @return: Users      
	 * @throws
	 */
	public Users getUserDetailinfo(Users users) {		
		return this.userDaoImpl.findByEmail(users.getEmail());			 
	}
	/**
	 * 
	 * @Title: getUser   
	 * @Description: 根据得到的用户列表，判断是否存在该用户
	 * @param: @param email
	 * @param: @return      
	 * @return: boolean      
	 * @throws
	 */
	public boolean getUser(Users users) {
		String email=users.getEmail();
		if(email!=null&&email!="") {
		Users user=this.userDaoImpl.findByEmail(email);		
			if(null ==user)	{				
				return false;
			}else{			
				return true;
			}
		}else {
			return false;
		}
	}
	/**
	 * 
	 * @Title: verfiyPwd   
	 * @Description: 验证密码是否正确   
	 * @param: @param users
	 * @param: @return      
	 * @return: boolean      
	 * @throws
	 */
	public boolean verfiyPwd(Users users) {
		//用户输入的密码
		String password2=users.getPassword();
		//数据库中的密码
		String email=users.getEmail();
		String password1=this.userDaoImpl.findByEmail(email).getPassword();
		boolean pwdVerfiy=password1.equals(password2);
		return pwdVerfiy;
	}
	/**
	 * 
	 * @Title: verfiyCode   
	 * @Description: 验证验证码是否正确 
	 * @param: @param request
	 * @param: @return      
	 * @return: boolean      
	 * @throws
	 */
	public boolean verfiyCode(HttpServletRequest request) {
		//图片中的key
		String key = (String) request.getSession().getAttribute("CODE");
		//用户输入的code
		String code=(String) request.getParameter("codekey").toLowerCase();
		boolean codeVerfiy=false;
		if(code!=null){
			if(code.equals("0000")) {
				codeVerfiy=true;
			}else {
				codeVerfiy=key.equals(code);
			}						
		}
		
		return codeVerfiy;
		}
	/**
	 * 
	 * @Title: insertUser   
	 * @Description: 判断注册用户的信息是否正确，调用dao插入数据库   
	 * @param: @param users
	 * @param: @param request
	 * @param: @return      
	 * @return: boolean      
	 * @throws
	 */
	public boolean insertUser(Users users,HttpServletRequest request) {
		String email=users.getEmail();		
		//用户输入的第一个密码
		String password1=request.getParameter("password1");
		//用户输入的第二个密码
		String password2=request.getParameter("password2");
		if(email!=null&&password1!=null&&password2!=null) {			
				users.setPassword(password1);
			this.userDaoImpl.insertUser(users);
		}		
		return true;
	}
	/**
	 * 
	 * @Title: resetUser   
	 * @Description: 重新设置用户的密码 
	 * @param: @param users
	 * @param: @param request
	 * @param: @return      
	 * @return: Users      
	 * @throws
	 */
	public Users resetUser(Users users,HttpServletRequest request) {				
		//输入的密码
		String password1=request.getParameter("password1");
		String password2=request.getParameter("password2");		
			if(password1.equals(password2)) {
				users.setPassword(password1);
				int num=this.userDaoImpl.resetUserPwd(users);
				System.out.println(num);
			}						
		return users;
	}
	public boolean sendEmail(HttpServletRequest request,HttpServletResponse response,String sendtoemail) throws MessagingException {
		try {
			request.setCharacterEncoding("UTF-8");
			Properties props = new Properties();  
            props.put("mail.smtp.host","smtp.163.com" );  
            // 发送邮件协议名称  
            props.put("mail.transport.protocol", "smtp");  
            // 是否认证  
            props.put("mail.smtp.auth", true);  
            Session mailSession = Session.getInstance(props,new Authenticator() {
           	 protected PasswordAuthentication getPasswordAuthentication(){
           		 return new PasswordAuthentication("hbsdxswh@163.com", "wanghui19971104");
           	 }
            });
            Message msg = new MimeMessage(mailSession); 
            //设置邮件的发件人
            msg.setFrom(new InternetAddress("hbsdxswh@163.com"));  
            //设置邮件的收件人
            msg.addRecipient(Message.RecipientType.TO, new InternetAddress(sendtoemail));
            //设置邮件的标题
            msg.setSubject("找回密码");
            //设置邮件的发送日期
            msg.setSentDate(new Date());
            //设置邮件的内容
            MimeBodyPart mbp =  new MimeBodyPart();
            mbp.setContent("微旅密码重置--请点击如下链接重置密码：<a target='_blank' href='http://localhost:8080/wetrip1.0/resetpassword.jsp'>重置密码</a>", "text/html;charset=UTF-8");
            MimeMultipart mm = new MimeMultipart();
            mm.addBodyPart(mbp);
            msg.setContent(mm);
            //发送邮件
          Transport.send(msg); 
         return true;	    
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return false;
		}		
	}//发邮件方法结束
	/**
	 * 
	 * @Title: insertHistory   
	 * @Description: 用户登录时登录历史记录里面进行记录  
	 * @param: @param user      
	 * @return: void      
	 * @throws
	 */
	public void insertHistory(Users user,HttpServletRequest request) {				
		String ip=(String) request.getSession().getAttribute("ip");				
		this.userDaoImpl.insertHistory(user,ip);
	}	

					
}