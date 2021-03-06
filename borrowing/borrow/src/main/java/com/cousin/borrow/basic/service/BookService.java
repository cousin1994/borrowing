package com.cousin.borrow.basic.service;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort.Order;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Service;

import com.cousin.borrow.basic.dao.BookDao;
import com.cousin.borrow.basic.entity.Book;
import com.cousin.util.data.jpa.repository.BaseJpaSupportRepository;

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
	public boolean save(Book book){
		bookDao.save(book);
		return true;
	}
	
	/**
	 * 通过索书号查找图书
	 * @param ssh
	 * @return
	 */
	public Book findBySsh(String ssh){
		List<Book> booklist = bookDao.findBySsh(ssh);
		Book book = null;
		for(int i=0; i<booklist.size(); i++){
			book = booklist.get(i);
			if(book.getIsborrowed()==0){
				break;
			}
			book = null;
		}
		return book;
	}

	/**
	 * 批量插入图书
	 * @param book
	 * @param num
	 * @return
	 */
	public boolean save(Book book,int num){
		List<Book> booklist = new ArrayList<Book>();
		for (int i=0;i<num;i++){//当存在批量新增图书的时候，就调用clone克隆方法，创建一个新对象。而不是引用就对象
			Book newbook = new Book();
			newbook = (Book)book.clone();
			booklist.add(newbook);
		}
		bookDao.save(booklist);
		return true;
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
	 * 删除方法(实体)
	 * @param book
	 */
	public boolean delete(Book book){
		try{
			bookDao.delete(book);
			return true;
		}catch (Exception e) {
			return false;
		}
	}
	
	/**
	 * 通过id删除
	 * @param id
	 */
	public boolean delete(Long[] id){
		try{
			List<Book> bookList = bookDao.findAll(Arrays.asList(id));
			bookDao.delete(bookList);
			return true;
		}catch(Exception e){
			return false;
		}
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
	
	/**
	 * 通过条件返回列表
	 * @param searchParam
	 * @return
	 */
	public List<Book> findByCodicio(Map<String,Object> searchParam){
		Specification<Book> spe = BaseJpaSupportRepository.bulidSpecification(searchParam, Book.class);
		return bookDao.findAll(spe);
	}
}
