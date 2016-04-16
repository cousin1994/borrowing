package com.cousin.borrow.basic.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Sort.Order;
import org.springframework.stereotype.Service;

import com.cousin.borrow.basic.dao.RecordDao;
import com.cousin.borrow.basic.entity.Record;

/**
 *@author 戴嘉诚 E-mail:a773807943@gmail.com
 *@version V0.1 创建时间：2016年3月4日 下午4:10:46
 */
@Service
public class RecordService {

	@Autowired
	private RecordDao recordDao;
	
	/**
	 * 删除记录，还书了，或者缴纳了欠款
	 * @param record
	 */
	public void delte(Record record){
		recordDao.delete(record);
	}
	
	/**
	 * 保存新产生的借书记录，或者修改记录
	 * @param record
	 * @return
	 */
	public Record save(Record record){
		return recordDao.save(record);
	}
	
	/**
	 * 批量保存
	 * @param list
	 */
	public void save(List<Record> list){
		recordDao.save(list);
	}
	
	/**
	 * 查找所有记录
	 * @return
	 */
	public List<Record> findAllRecord(){
		return recordDao.findAll();
	}
	
	/**
	 * 根据图书id查找所有记录
	 * @param bookid
	 * @return
	 */
	public Record findByBookid(Long bookid){
		return recordDao.findByBookid(bookid);
	}
	
	/**
	 * 根据读者id查找所有记录
	 * @param readid
	 * @return
	 */
	public List<Record> findByReadid(Long readid){
		return recordDao.findByReadid(readid);
	}
	
	/**
	 * 通过主键查找ID
	 * @param id
	 * @return
	 */
	public Record findById(Long id){
		return recordDao.findOne(id);
	}
	
	/**
	 * 通过某个ID查找整个实体类
	 * @param id
	 * @return
	 */
	public Record findOne(Long id){
		return recordDao.findOne(id);
	}
	
	/**
	 * 通过id删除记录
	 * @param id
	 */
	public void deleteById(Long id){
		recordDao.delete(id);
	}
	
	/**
	 * 查找
	 * @param searchParams
	 * @param pagenumble
	 * @param size
	 * @param order
	 * @return
	 */
	public Page<Record> findpage(Map<String, Object> searchParams,int pagenumble, int size,Order...order){
		return recordDao.findAll(searchParams, pagenumble, size, order);
	}
	
}
