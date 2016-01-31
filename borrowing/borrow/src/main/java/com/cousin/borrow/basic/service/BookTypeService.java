package com.cousin.borrow.basic.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cousin.borrow.basic.dao.BookTypeDao;
import com.cousin.borrow.basic.entity.BookType;

/**
* @author 戴嘉诚 E-mail:a773807943@gmail.com
* @version 创建时间： 2016年1月31日 上午6:42:42
*/
@Service
public class BookTypeService {

	@Autowired
	private BookTypeDao bookTypeDao;
	
	/**
	 * 通过某个id查找类型
	 * @param id
	 * @return
	 */
	public BookType findById(Long id){
		return bookTypeDao.findOne(id);
	}
}
