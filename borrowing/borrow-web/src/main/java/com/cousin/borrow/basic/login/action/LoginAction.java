package com.cousin.borrow.basic.login.action;

import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.convention.annotation.Results;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.cousin.borrow.basic.entity.Userrole;
import com.cousin.borrow.basic.service.UserroleService;
import com.cousin.util.struts2.BasicSuperAction;

/**
* @author 戴嘉诚 E-mail:a773807943@gmail.com
* @version 创建时间： 2016年1月31日 下午10:34:04
*/
@Controller
@Scope("prototype")
@ParentPackage("my-default")
@Namespace("/borrow")
@Results({
	
})
public class LoginAction extends BasicSuperAction<Userrole> {

	/**
	 * 
	 */
	private static final long serialVersionUID = 7482189444239508321L;

	@Autowired
	private UserroleService userroleService;
	
	private String Code;
	
	private String password;

	
	public String getCode() {
		return Code;
	}

	public void setCode(String code) {
		Code = code;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}
	
	public String login(){
		Userrole userrole = userroleService.findbyUser(Code, password);
		return null;
	}
	
	public String list(){
		return null;
	}
	
	
}
