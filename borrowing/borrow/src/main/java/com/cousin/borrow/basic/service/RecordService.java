package com.cousin.borrow.basic.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
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
	public Record add(Record record){
		return recordDao.save(record);
	}
	
	/**
	 * 查找所有记录
	 * @return
	 */
	public List<Record> findAllRecord(){
		return recordDao.findAll();
	}
	
	/**
	 * 通过某个ID查找整个实体类
	 * @param id
	 * @return
	 */
	public Record findOne(Long id){
		return recordDao.findOne(id);
	}
	
	
}
