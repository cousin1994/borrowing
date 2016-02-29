package book.action;

import javax.annotation.Resource;

import org.junit.Test;

import com.cousin.borrow.basic.dao.BookDao;

import base.AbstractJunit4SpringContextTests;
import base.AbstractTransactionalJUnit4SpringContextTests;

/**
 *@author 戴嘉诚 E-mail:a773807943@gmail.com
 *@version V0.1 创建时间：2016年2月29日 下午9:17:04
 */
public class BookActionTest extends AbstractTransactionalJUnit4SpringContextTests {
	
	@Resource
	private BookDao bookDao;
	
	@Test
	public void FindAllTest(){
		System.out.println(1111);
	}
	
}
