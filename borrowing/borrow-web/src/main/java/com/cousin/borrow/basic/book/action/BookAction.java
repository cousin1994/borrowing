package com.cousin.borrow.basic.book.action;

import java.util.ArrayList;
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
		int draw = Integer.parseInt(request.getParameter("draw")==null ? "0" : request.getParameter("draw"))+1;
		String searchValue = request.getParameter("search[value]");
		int size = Integer.parseInt(request.getParameter("length"));
		int start = Integer.parseInt(request.getParameter("start"));
		
		
		
		
		return null;
	     /* int pageSize = 10;
	        int startRecord = 0;
	        String size = request.getParameter("length");
	        if (!"".equals(size) && size != null) {
	            pageSize = Integer.parseInt(size);
	        }
	        String currentRecord = request.getParameter("start");
	        if (!"".equals(currentRecord) && currentRecord != null) {
	            startRecord = Integer.parseInt(currentRecord);
	        }
	        // For sortable
	        String sortOrder = request.getParameter("order[0][column]");
	        String sortDir = request.getParameter("order[0][dir]");
	        System.out.println("sortOrder: " + sortOrder);
	        System.out.println("sortDir: " + sortDir);
	                      
	        // For search
	        String searchValue = request.getParameter("search[value]");
	        int count = 0;
	        List<Data> results = new ArrayList<Data>();
	        count = dao.count();
	        results = dao.loadDataList(pageSize, startRecord, columnsName[Integer.parseInt(sortOrder)], sortDir, searchValue);
	        DataVO<Data> result = new DataVO<Data>();
	        result.setDraw(Integer.parseInt(request.getParameter("draw") == null ? "0"
	                : request.getParameter("draw")) + 1);
	        result.setData(results);
	        result.setRecordsTotal(count);
	        result.setRecordsFiltered(count);
	        Gson gson = new Gson();
	        String output = gson.toJson(result);
	        System.out.println("Output JSON: \n" + output);
	        PrintWriter out = response.getWriter();
	        out.write(output);
	        out.flush();
	        out.close();*/
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
