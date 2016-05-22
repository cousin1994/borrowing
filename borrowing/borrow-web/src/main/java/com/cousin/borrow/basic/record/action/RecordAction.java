package com.cousin.borrow.basic.record.action;

import java.time.Instant;
import java.time.LocalDate;
import java.time.ZoneId;
import java.time.format.DateTimeFormatter;
import java.time.temporal.ChronoUnit;
import java.util.Date;
import java.util.HashMap;
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
import com.cousin.borrow.basic.entity.Record;
import com.cousin.borrow.basic.entity.Userrole;
import com.cousin.borrow.basic.service.BookService;
import com.cousin.borrow.basic.service.RecordService;
import com.cousin.borrow.basic.service.UserroleService;
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
	

	@Autowired
	private UserroleService userroleService;
	

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
	
	
	/**
	 * 获取用户欠费多少
	 * @return
	 */
	public String getmoney(){
		Userrole user = (Userrole) request.getSession().getAttribute("user");
		List<Record> userList = recordService.findByReadid(user.getId());
		double money = 0;
		for (int i =0;i<userList.size();i++){
			Record record = userList.get(i);
			money = money + record.getMoney(); 
		}
		Struts2Util.renderText(String.valueOf(money));
		return null;
	}
	
	/**
	 * 续借
	 * @return
	 */
	public String renew(){
		Record record = recordService.findById(sid);
		Userrole user = (Userrole) request.getSession().getAttribute("user");
		if(user.getViolate()==0){
			Date date = record.getEnd();
			String str = date.toString();
			LocalDate endDate = LocalDate.parse(str,DateTimeFormatter.ISO_DATE);
			LocalDate newDate = endDate.plus(2, ChronoUnit.MONTHS);
			Book book = bookService.findById(record.getId());
			Long num = book.getTotalrenewnum();
			num = num==null ? 1 : num+1;
			book.setTotalrenewnum(num);
			record.setRenew(1);
			record.setEnd(Date.from(newDate.atStartOfDay().atZone(ZoneId.systemDefault()).toInstant()));
			recordService.save(record);
			bookService.save(book);
			Struts2Util.renderText("success");
		}else {
			Struts2Util.renderText("fail");
		}
		return null;
	}
	
	/**
	 * 归还 
	 * 用ajax返回
	 * 要返回data、draw、recordsTotal、recordsFiltered
	 * @return
	 */
	public String revertlist(){
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
		String code = request.getParameter("code");
		Userrole user = userroleService.findByCode(code);
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
	
	/**
	 * 初始化归还图书
	 * @return
	 */
	public String beforrevert(){
		request.setAttribute("code", request.getParameter("code"));
		return "revert";
	}
	
	/**
	 * 归还图书
	 * @return
	 */
	public String revert(){
		Record record = recordService.findById(sid);
		recordService.deleteById(sid);
		Book book = bookService.findById(record.getBookid());
		book.setIsborrowed(0L);
		bookService.save(book);
		Struts2Util.renderText("success");
		return null;
	}
	
	/**
	 * 借书
	 * @return
	 */
	public String borrow(){
		Record record = recordService.findById(sid);
		record.setState(1);
		Book book = bookService.findById(record.getBookid());
		book.setIsborrowed(2L);
		Long totalloannum = book.getTotalloannum();
		totalloannum = totalloannum==null ? 1 : totalloannum+1;
		book.setTotalloannum(totalloannum);
		recordService.save(record);
		bookService.save(book);
		Struts2Util.renderText("success");
		return null;
	}
	
	/**
	 * 新增记录之前
	 * @return
	 */
	public String beforadd(){
		return "input";
	}
	
	/**
	 * 新增记录
	 * @return
	 */
	public String add(){
		String code = request.getParameter("usercode");
		String ssh = request.getParameter("bookssh");
		Book book = bookService.findBySsh(ssh);
		Userrole user = userroleService.findByCode(code);
		if(book!=null && user!=null){
			book.setIsborrowed(2L);
			Record record = new Record();
			record.setBegin(new Date());
			record.setBookid(book.getId());
			record.setReadid(user.getId());
			record.setBookname(book.getBname());
			record.setEnd(getDate(2L));
			record.setMoney(0);
			record.setRenew(0);
			record.setState(1);
			recordService.save(record);
			bookService.save(book);
			Struts2Util.renderText("success");
		}else{
			Struts2Util.renderText("fail");
		}
		return null;
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

}
