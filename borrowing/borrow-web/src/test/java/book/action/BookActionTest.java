package book.action;

import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

import javax.annotation.Resource;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.data.domain.Sort.Order;

import com.cousin.borrow.basic.dao.BookDao;
import com.cousin.borrow.basic.entity.Book;
import com.cousin.borrow.basic.service.BookService;

import base.AbstractJunit4SpringContextTests;

/**
 *@author 戴嘉诚 E-mail:a773807943@gmail.com
 *@version V0.1 创建时间：2016年2月29日 下午9:17:04
 */
public class BookActionTest extends AbstractJunit4SpringContextTests {
	
	@Resource
	private BookDao bookDao;
	
	@Autowired
	private BookService bookService;
	
	@Test
	public void FindAllTest(){
		Map<String,Object> m = new HashMap<String,Object>();
		m.put("EQ_bname", 11);
		Order mOrder = new Order(Direction.ASC, "id");
		Page<Book> p = bookDao.findAll(m, 0, 20, mOrder);
		Iterator<Book> it = p.iterator();
		while (it.hasNext()) {
			Book book = (Book) it.next();
			System.out.println(book.getId());
		}
	}
	
	@Test
	public void bookServiceTest(){
		Map<String,Object> m = new HashMap<String,Object>();
		m.put("EQ_bname", 11);
		Order mOrder = new Order(Direction.ASC, "id");
		Page<Book> p = bookService.findPageBycondicio(m, 0, 20, mOrder);
		Iterator<Book> it = p.iterator();
		while (it.hasNext()) {
			Book book = (Book) it.next();
			System.out.println(book.getId());
		}
	}
	
}
