package com.asay.wetrip.personalinfo.service;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;

import com.asay.wetrip.entity.UserDetail;
import com.asay.wetrip.entity.Users;
import com.asay.wetrip.personalinfo.dao.PersonalinfoDaoImpl;
import com.asay.wetrip.user.dao.UserDaoImpl;

/**
 * 
 * @ClassName:  PersonalinfoServiceImpl   
 * @Description:个人信息修改之后，验证身份，更改数据库  
 * @author: 王慧
 * @date:   2018年12月7日 下午12:12:47
 */
@Service
public class PersonalinfoServiceImpl {
	@Resource
	private PersonalinfoDaoImpl personalinfoDaoImpl;
	@Resource
	private UserDaoImpl userDaoImpl;
	/**
	 * 
	 * @Title: updateUser   
	 * @Description: 根据用户重新设置的信息，判断用户修改了哪些？把修改个人的信息存入数据库
	 * @param: @param users
	 * @param: @param userDetail
	 * @param: @return      
	 * @return: Users      
	 * @throws
	 */
	public boolean  updateUserDetail(UserDetail userDetail) {	
		int num=this.personalinfoDaoImpl.updateUserDetail(userDetail);
		if(num==1)
		return true;
		else
		return false;
	}
	/**
	 * 
	 * @Title: updateUser   
	 * @Description: 用户密码修改的判断，更改数据库 
	 * @param: @param users
	 * @param: @param request
	 * @param: @return      
	 * @return: Users      
	 * @throws
	 */
	public Users updateUser(Users users,String password,String password1,String password2) {
		//用session获取当前用户的email
		String email=users.getEmail();		
		String passwordDB=users.getPassword();
		if(password.equals(passwordDB)) {
			if(password1.equals(password2)) {
				users.setPassword(password1);
				this.personalinfoDaoImpl.updateUserPwd(users);
				return users;
			}				
		}		
		return null;
	}

	
}
