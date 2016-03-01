package com.cousin.borrow.basic.service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort.Order;
import org.springframework.stereotype.Service;

import com.cousin.borrow.basic.dao.BookDao;
import com.cousin.borrow.basic.entity.Book;

/**
* @author 戴嘉诚 E-mail:a773807943@gmail.com
* @version 创建时间： 2016年1月31日 上午5:54:53
*/
@Service
public class BookService {

	@Autowired
	private BookDao bookDao;
	
	/**
	 * 保存方法
	 * @param book
	 * @return
	 */
	public Book save(Book book){
		return bookDao.save(book);
	}
	
	/**
	 * 通过主键查找书本。
	 * @param id
	 * @return
	 */
	public Book findById(Long id){
		return bookDao.findOne(id);
	}
	
	/**
	 * 删除方法
	 * @param book
	 */
	public void delete(Book book){
		bookDao.delete(book);
	}
	
	/**
	 * 按条件查询所有书本，并且分页返回
	 * @param searchParam
	 * @param PageNumber
	 * @param pageSize
	 * @param orders
	 * @return
	 */
	public Page<Book> findPageBycondicio(Map<String,Object> searchParam,int PageNumber, int pageSize,Order...orders) {
		Page<Book> p = bookDao.findAll(searchParam, PageNumber, pageSize, orders);
		return p;
	}
	
	/**
	 * 返回分页方法的数值
	 * @param PageNumber
	 * @param PageSize
	 * @return
	 */
	public Page<Book> findPage(int PageNumber, int PageSize){
		PageRequest page = new PageRequest(PageNumber-1, PageSize);
		return bookDao.findAll(page);
	}
}
