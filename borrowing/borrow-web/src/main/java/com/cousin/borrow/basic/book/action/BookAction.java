package com.cousin.borrow.basic.book.action;

import java.util.Iterator;
import java.util.Map;

import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.Results;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.data.domain.Sort.Order;
import org.springframework.stereotype.Controller;

import com.cousin.borrow.basic.service.BookService;
import com.cousin.util.struts2.BasicSuperAction;
import com.cousin.util.struts2.ServletUtils;
import com.cousin.borrow.basic.entity.Book;

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
	
	@Override
	public String list() throws Exception {
		//前端页面过滤条件设置
		//Map<String,Object> searchParam = ServletUtils.getParametersStartingWith(reqeust, "search_");
		//Order mOrder = new Order(Direction.ASC, "bname");
		//this.page = bookService.findPage(searchParam, pageNumber, pageSize, mOrder);
		this.page = bookService.findPage(pageNumber, pageSize);
		return SUCCESS;
	}

}
