package com.cousin.borrow.basic;

import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.Results;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.cousin.borrow.basic.entity.Book;
import com.cousin.borrow.basic.entity.Record;
import com.cousin.borrow.basic.entity.Userrole;
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
@Namespace("/")
@ParentPackage("my-default")
@Results({
	@Result(name=BasicSuperAction.RELOAD  , location="admin.action" , type="redirect"),
	@Result(name="success", location="/WEB-INF/content/admin/admin.jsp")
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
	
	private Book book;//书本
	private Userrole userrole;//用户
	private Record record;//记录
	
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
		String flag = request.getParameter("flag");
		if(flag=="user"){
			return flag;
		}else if (flag=="book"){
			return flag;
		}else if(flag=="record"){
			return flag;
		}
		return ERROR;
	}
	
	/**
	 * 保存用户数据
	 * @return
	 */
	public String saveRole(){
		userroleService.save(userrole);
		return "userList";
	}

	/**
	 * 保存用户记录
	 * @return
	 */
	public String saveRecord(){
		recordService.save(record);
		return "recordList";
	}
	
	
	/**
	 * 删除书本
	 * @return
	 */
	public String deleteBook(){
		bookService.delete(book);
		return "bookList";
	}
	
	/**
	 * 删除书本，所有
	 * @return
	 */
	public String deleteAllBook(){
		boolean flag = bookService.delete(id);
		if(flag == true){
			String str = "删除成功";
			request.setAttribute("msg", str);
			return "bookList";
		}else{
			String str = "删除失败";
			request.setAttribute("msg", str);
			return "bookList";
		}
	}
	
	public Book getBook() {
		return book;
	}

	public void setBook(Book book) {
		this.book = book;
	}

	public Userrole getUserrole() {
		return userrole;
	}

	public void setUserrole(Userrole userrole) {
		this.userrole = userrole;
	}

	public Record getRecord() {
		return record;
	}

	public void setRecord(Record record) {
		this.record = record;
	}
	
}
