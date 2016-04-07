package com.cousin.borrow.basic.dao;

import java.util.List;

import com.cousin.borrow.basic.entity.Record;
import com.cousin.util.data.jpa.repository.BaseJpaRepository;

/**
* @author 戴嘉诚 E-mail:a773807943@gmail.com
* @version 创建时间： 2016年1月31日 上午5:41:28
*/
public interface RecordDao extends BaseJpaRepository<Record, Long> {

	/**
	 * 通过图书id查找记录
	 * @param bookid
	 * @return
	 */
	public Record findByBookid(Long bookid);
	
	/**
	 * 通过读者id查找记录
	 * @param readid
	 * @return
	 */
	public List<Record> findByReadid(Long readid);
}
