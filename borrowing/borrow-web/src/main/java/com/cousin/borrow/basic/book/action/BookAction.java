package com.cousin.borrow.basic.book.action;

import java.util.List;
import java.util.Map;

import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.Results;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.cousin.borrow.basic.entity.Book;
import com.cousin.borrow.basic.service.BookService;
import com.cousin.borrow.basic.util.DataTables;
import com.cousin.util.struts2.BasicSuperAction;
import com.cousin.util.struts2.ServletUtils;
import com.cousin.util.struts2.Struts2Util;

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
		Map<String,Object> searchParam = ServletUtils.getParametersStartingWith(request, "search_");
		List<Book> list = bookService.findByCodicio(searchParam);
		request.setAttribute("list", list);
		return SUCCESS;
	}
	
	/**
	 * 用ajax返回
	 * @return
	 */
	public String datatableList(){
		DataTables data = new DataTables();
		String json = null;
		return null;
	}
	
	/**
	 * 跳转新增页面
	 * @return
	 */
	public String creatBefor(){
		return "input";
	}

	/**
	 * 保存
	 * @return
	 */
	public String save(){
		this.book = bookService.save(this.book);
		if(this.book!=null){
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
		bookService.delete(id);
		return SUCCESS;
	}
	
	

	public Book getBook() {
		return book;
	}

	public void setBook(Book book) {
		this.book = book;
	}
}
