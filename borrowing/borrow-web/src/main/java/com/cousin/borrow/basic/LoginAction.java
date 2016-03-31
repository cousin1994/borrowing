package com.cousin.borrow.basic;

import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.convention.annotation.Result;
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
@Namespace("/")
@Results({
	@Result(name="input", location="/login.jsp"),
	@Result(name="admin", location="/WEB-INF/content/admin/admin.jsp")
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
	
	private String msg;

	
	/**
	 * 退出登录
	 * @return
	 */
	public String loginout(){
		return INPUT;
	}
	
	/**
	 * 登录系统
	 * @return
	 */
	public String login(){
		Userrole userrole = userroleService.findbyUser(Code, password);
		request.getSession().setAttribute("user", userrole);//写到session中
		if(userrole == null){
			msg = "帐号或密码错误，重新输入";
			request.setAttribute("msg", msg);
			return INPUT;
		}else if(userrole.getRole()==2){//普通用户
			return "user";
		}else{//管理员
			return "admin";
		}
	}
	
	public String list(){
		return null;
	}
	
	public String getMsg() {
		return msg;
	}
	
	public void setMsg(String msg) {
		this.msg = msg;
	}
	
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
	
}
