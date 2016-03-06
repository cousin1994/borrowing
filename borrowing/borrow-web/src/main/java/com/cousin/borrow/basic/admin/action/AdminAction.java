package com.cousin.borrow.basic.admin.action;

import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.Results;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.cousin.borrow.basic.entity.Book;
import com.cousin.borrow.basic.service.BookService;
import com.cousin.borrow.basic.service.RecordService;
import com.cousin.borrow.basic.service.UserroleService;
import com.cousin.util.struts2.BasicSuperAction;

/**
 *@author 戴嘉诚 E-mail:a773807943@gmail.com
 *@version V0.1 创建时间：2016年3月3日 上午12:33:13
 */
@SuppressWarnings("rawtypes")
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

	@Autowired
	private UserroleService userroleService;
	
	@Autowired
	private RecordService recordService;
	
	@Autowired
	private BookService bookService;
	
	private Book book;
	
	/**
	 * 返回主控制页面
	 */
	@Override
	public String list() throws Exception {
		return SUCCESS;
	}

	/**
	 * 返回新增页面
	 * @return
	 */
	public String beforCreate(){
		
		return null;
	}
	
	/**
	 * 保存新增数据
	 * @return
	 */
	public String saveBook(){
		bookService.save(book);
		return null;
	}

	public Book getBook() {
		return book;
	}

	public void setBook(Book book) {
		this.book = book;
	}
	
}
