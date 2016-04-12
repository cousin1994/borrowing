package com.cousin.borrow.basic.record.action;

import java.util.HashMap;
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
 *@version V0.1 创建时间：2016年4月7日 上午2:20:39
 */
@Controller
@Scope("prototype")
@ParentPackage("my-default")
@Namespace("/record")
@Results({
	@Result(name=BasicSuperAction.RELOAD , location = "record.action" , type="redirect")
})
public class RecordAction extends BasicSuperAction<Record> {

	@Autowired
	private RecordService recordService;
	
	@Autowired
	private BookService bookService;
	
	private Book book;
	
	public Book getBook() {
		return book;
	}


	public void setBook(Book book) {
		this.book = book;
	}


	@Override
	public String list() throws Exception {
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
		String[] cols = { "bookname", "state", "renew", "begin", "end", "money" };
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
		Userrole user = (Userrole) request.getSession().getAttribute("user");
		Map<String,Object> searchParams = new HashMap();
		searchParams.put("EQ_readid",user.getId());
		Page<Record> p = recordService.findpage(searchParams, sta, size, order);
		data.setData(p.getContent());
		data.setDraw(draw);
		data.setRecordsTotal((int)p.getTotalElements());
		data.setRecordsFiltered((int)p.getTotalElements());
		String json = new Gson().toJson(data);
		Struts2Util.renderJson(json);
		return null;
	}
	
	/**续借图书 
	 * 描述：
	 * @author 戴嘉诚
	 * @version 1.0   
	 * @return
	 */
	public String xujie(){
		Record record = recordService.findByBookid(sid);
		record.setRenew(1);
		boolean flag = bookService.save(book);
		if(flag){
			Struts2Util.renderText("success");
			return null;
		}else{
			Struts2Util.renderText("fail");
			return null;
		}
	}

}
