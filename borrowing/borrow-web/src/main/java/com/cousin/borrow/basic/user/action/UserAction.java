package com.cousin.borrow.basic.user.action;

import java.util.List;
import java.util.Map;

import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.Results;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.data.domain.Sort.Order;
import org.springframework.stereotype.Controller;

import com.cousin.borrow.basic.entity.Book;
import com.cousin.borrow.basic.entity.Userrole;
import com.cousin.borrow.basic.service.UserroleService;
import com.cousin.borrow.basic.util.DataTables;
import com.cousin.util.struts2.BasicSuperAction;
import com.cousin.util.struts2.ServletUtils;
import com.cousin.util.struts2.Struts2Util;
import com.google.gson.Gson;

/**
 *@author 戴嘉诚 E-mail:a773807943@gmail.com
 *@version V0.1 创建时间：2016年3月31日 下午2:36:32
 */
@Controller
@Namespace("/user")
@Scope("prototype")
@ParentPackage("my-default")
@Results({
	@Result(name=BasicSuperAction.RELOAD ,location="user.action"  , type="redirect")
})
public class UserAction extends BasicSuperAction<Userrole> {

	/**
	 * 
	 */
	private static final long serialVersionUID = 3574175299840077940L;

	@Autowired
	private UserroleService userService;
	
	private Userrole user;
	
	@Override
	public String list() throws Exception {
		// TODO Auto-generated method stub
		return SUCCESS;
	}
	/**
	 * ajaxList user
	 */
	public String ajaxList() throws Exception {
		DataTables data = new DataTables();
		//获取请求次数
		int draw = Integer.parseInt(request.getParameter("draw")==null ? "0" : request.getParameter("draw"))+1;
		//获取用户过滤框里的字符
		String searchValue = request.getParameter("search[value]");
		//数据长度
		int size = Integer.parseInt(request.getParameter("length"));
		//数据起始位置
		int start = Integer.parseInt(request.getParameter("start"));
		int sta = (start / size)+1;
		//总记录数
		String recordsTotal = "0";
		//过滤后记录数
		String recordsFiltered = "";
		//定义列名
		String[] cols = { "name", "code", "violate", "phone", "role", "state" };
		//获取客户端需要那一列排序
		String orderColumn = "0";
		orderColumn = request.getParameter("order[0][column]");
		orderColumn = cols[Integer.parseInt(orderColumn)];
		//获取排序方式 默认为asc
				String orderDir = "asc";
				orderDir = request.getParameter("order[0][dir]");
				Direction dir = null;
				if(orderDir.equals("asc")){
					dir = Direction.ASC;
				}else{
					dir = Direction.DESC;
				}
		Order order = new Order(dir, orderColumn);
		Page<Userrole> p = userService.findPage(null, sta, size, order);
		data.setData(p.getContent());
		data.setDraw(draw);
		data.setRecordsTotal((int)p.getTotalElements());
		data.setRecordsFiltered((int)p.getTotalElements());
		String json = new Gson().toJson(data); 
		Struts2Util.renderJson(json);
		return null;
	}
	
	/**
	 * save user
	 * @return
	 */
	public String save(){
		user = userService.save(user);
		if(user!=null){
			Struts2Util.renderText("success");
		}else{
			Struts2Util.renderText("fail");
		}
		return null;
	}
	
	/**
	 * delete user
	 * @return
	 */
	public String delete(){
		boolean flag = userService.delete(sid);
		if(flag){
			Struts2Util.renderText("success");
		}else{
			Struts2Util.renderText("fail");
		}
		return null;
	}
	/**
	 * 根据id查找用户
	 * @return
	 */
	public String findById(){
		user = userService.findById(sid);
		return "input";
	}
	
	/**
	 * 新增之前
	 * @return
	 */
	public String beforCreat(){
		return "input";
	}

	public Userrole getUser() {
		return user;
	}

	public void setUser(Userrole user) {
		this.user = user;
	}

}
