package com.cousin.borrow.basic.dao;

import java.util.List;

import com.cousin.borrow.basic.entity.Book;
import com.cousin.util.data.jpa.repository.BaseJpaRepository;

/**
* @author 戴嘉诚 E-mail:a773807943@gmail.com
* @version 创建时间： 2016年1月31日 上午5:39:46
*/
public interface BookDao extends BaseJpaRepository<Book, Long> {

	/**
	 * 通过索书号查找图书
	 * @param ssh
	 * @return
	 */
	public List<Book> findBySsh(String ssh);
	
}
