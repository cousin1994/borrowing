package com.cousin.borrow.basic.book.action;

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
import com.cousin.borrow.basic.service.BookService;
import com.cousin.borrow.basic.util.DataTables;
import com.cousin.util.struts2.BasicSuperAction;
import com.cousin.util.struts2.ServletUtils;
import com.cousin.util.struts2.Struts2Util;
import com.google.gson.Gson;

/**
 *@author 戴嘉诚 E-mail:a773807943@gmail.com
 *@version V0.1 创建时间：2016年2月29日 上午12:27:02
 */
@Controller
@Scope("prototype")
@ParentPackage("my-default")
@Namespace("/book")
@Results({
	@Result(name=BasicSuperAction.RELOAD , location = "book.action" , type="redirect")
})
public class BookAction extends BasicSuperAction<Book> {

	/**
	 * 
	 */
	private static final long serialVersionUID = 4486040741811531550L;

	@Autowired
	private BookService bookService;
	
	private Book book;
	
	@Override
	public String list() throws Exception {
		//前端页面过滤条件设置
		/*Map<String,Object> searchParam = ServletUtils.getParametersStartingWith(request, "search_");
		List<Book> list = bookService.findByCodicio(searchParam);
		request.setAttribute("list", list);*/
		return SUCCESS;
	}
	
	/**
	 * 用ajax返回
	 * 要返回data、draw、recordsTotal、recordsFiltered
	 * @return
	 */
	public String datatableList(){
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
		String[] cols = { "bname", "isborrowed", "ssh", "type", "publisher", "publishdate" };
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
		Page<Book> p = bookService.findPageBycondicio(null, sta, size, order);
		data.setData(p.getContent());
		data.setDraw(draw);
		data.setRecordsTotal((int)p.getTotalElements());
		data.setRecordsFiltered((int)p.getTotalElements());
		String json = new Gson().toJson(data);
		Struts2Util.renderJson(json);
		return null;
	}
	
	/**
	 * 跳转新增页面
	 * @return
	 */
	public String creatBefor(){
		return "input";
	}

	
	public String findByid(){
		book = bookService.findById(sid);
		return "input";
	}
	
	/**
	 * 保存
	 * @return
	 */
	public String save(){
		int booknumber = Integer.parseInt(request.getParameter("booknumber"));
		boolean flag = bookService.save(this.book,booknumber);
		if(flag){
			Struts2Util.renderText("true");
			return null;
		}else{
			Struts2Util.renderText("false");
			return null;
		}
	}
	
	/**
	 * 删除
	 * @return
	 */
	public String delete(){
		boolean flag = bookService.delete(id);
		if(flag){
			Struts2Util.renderText("success");
		}else{
			Struts2Util.renderText("fail");
		}
		return null;
	}
	
	

	public Book getBook() {
		return book;
	}

	public void setBook(Book book) {
		this.book = book;
	}
}
