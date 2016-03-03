package com.cousin.borrow.basic.admin.action;

import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.Results;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.cousin.util.struts2.BasicSuperAction;

/**
 *@author 戴嘉诚 E-mail:a773807943@gmail.com
 *@version V0.1 创建时间：2016年3月3日 上午12:33:13
 */
@Controller
@Scope("prototype")
@Namespace("/admin")
@ParentPackage("my-default")
@Results({
	@Result(name=BasicSuperAction.RELOAD  , location="admin.action" , type="redirect")
})
public class AdminAction extends BasicSuperAction {

	/**
	 * 
	 */
	private static final long serialVersionUID = -6686486520619006263L;

	@Override
	public String list() throws Exception {
		return SUCCESS;
	}

	
	
}
