package com.cousin.borrow.basic.book.action;

import java.time.Instant;
import java.time.LocalDate;
import java.time.ZoneId;
import java.util.Date;
import java.util.List;

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
import com.cousin.borrow.basic.entity.Record;
import com.cousin.borrow.basic.entity.Userrole;
import com.cousin.borrow.basic.service.BookService;
import com.cousin.borrow.basic.service.RecordService;
import com.cousin.borrow.basic.util.DataTables;
import com.cousin.util.struts2.BasicSuperAction;
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
	
	@Autowired
	private RecordService recordService;
	
	private Book book;
	
	@Override
	public String list() throws Exception {
		//前端页面过滤条件设置
		/*Map<String,Object> searchParam = ServletUtils.getParametersStartingWith(request, "search_");
		List<Book> list = bookService.findByCodicio(searchParam);
		request.setAttribute("list", list);*/
		Userrole user = (Userrole) request.getSession().getAttribute("user");
		if(user.getRole()==2){
			System.out.println("test");
			return "reader";
		}else{
			return SUCCESS;
		}
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
			return null;
		}else{
			Struts2Util.renderText("fail");
			return null;
		}
	}
	
	/**
	 * 预借图书
	 * @return
	 */
	public String reserve(){
		Userrole user = (Userrole) request.getSession().getAttribute("user");
		List<Record> recordlist = recordService.findByReadid(user.getId());
		if(user.getViolate()==1){
			Struts2Util.renderText("qianfei");
			return null;
		}else {
			if(recordlist.size()<10){
				book = bookService.findById(sid);
				book.setIsborrowed(1L);
				Record record = new Record();
				record.setBookid(book.getId());//写入图书id
				record.setReadid(user.getId());//写入读者id
				record.setBegin(new Date());
				record.setRenew(0);//续借
				record.setState(0);//状态正常
				record.setEnd(getDate(2L));//
				record.setBookname(book.getBname());
				recordService.save(record);
				boolean flag = bookService.save(book);
				if(flag){
					Struts2Util.renderText("success");
					return null;
				}else{
					Struts2Util.renderText("fail");
					return null;
				}
			}else{
				Struts2Util.renderText("outofnumber");
				return null;
			}
		}
	}
	
	
	
	/**
	 * 借阅图书
	 * @return
	 */
	public String borrow(){
		Userrole user = (Userrole) request.getSession().getAttribute("user");
		book = bookService.findById(sid);
		book.setIsborrowed(1L);
		Record record = new Record();
		record.setBookid(book.getId());
		record.setReadid(user.getId());
		record.setBegin(new Date());
		record.setRenew(0);
		record.setState(0);
		record.setEnd(getDate(2L));//
		record.setBookname(book.getBname());
		recordService.save(record);
		boolean flag = bookService.save(book);
		if(flag){
			Struts2Util.renderText("success");
			return null;
		}else{
			Struts2Util.renderText("fail");
			return null;
		}
	}
	
	/**
	 * 获取当前时间几个月后日期
	 * @param month
	 * @return
	 */
	private Date getDate(Long month){
		LocalDate today = LocalDate.now();
		LocalDate newday = today.plusMonths(month);
		ZoneId zone = ZoneId.systemDefault();
	    Instant instant = newday.atStartOfDay().atZone(zone).toInstant();
	    java.util.Date date = Date.from(instant);
		return date;
	}

	public Book getBook() {
		return book;
	}

	public void setBook(Book book) {
		this.book = book;
	}
}
