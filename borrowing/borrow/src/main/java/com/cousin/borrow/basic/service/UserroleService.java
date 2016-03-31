package com.cousin.borrow.basic.service;

import java.util.Arrays;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Sort.Order;
import org.springframework.stereotype.Service;

import com.cousin.borrow.basic.dao.UserroleDao;
import com.cousin.borrow.basic.entity.Userrole;

/**
* @author 戴嘉诚 E-mail:a773807943@gmail.com
* @version 创建时间： 2016年1月31日 下午5:24:43
*/
@Service
public class UserroleService {

	@Autowired
	private UserroleDao userroleDao;
	
	/**
	 * 保存方法
	 * @param userrole
	 * @return
	 */
	public Userrole save(Userrole userrole){
		return userroleDao.save(userrole);
	}
	
	/**
	 * 删除一个
	 * @param userrole
	 */
	public boolean delete(Long id){
		userroleDao.delete(id);
		return true;
	}
	
	/**
	 * 批量删除
	 * @param ids
	 * @return
	 */
	public boolean delete (Long[] ids){
		List<Userrole> list = userroleDao.findAll(Arrays.asList(ids));
		userroleDao.delete(list);
		return true;
	}

	/**
	 * 根据用户名，密码查找用户实体，并返回
	 * @param Code
	 * @param password
	 * @return
	 */
	public Userrole findbyUser(String Code,String password){
		Userrole user = userroleDao.findByCodeAndPassword(Code, password);
		return user;
	}
	
	
	/**
	 * 根据id查找用户
	 * @param id
	 * @return
	 */
	public Userrole findById(Long id){
		return userroleDao.findOne(id);
	}
	
	/**
	 * 根据条件，查找
	 * @param searchParame
	 * @param pageNumber
	 * @param pageSize
	 * @param orders
	 * @return
	 */
	public Page<Userrole> findPage(Map<String,Object> searchParame, int pageNumber,int pageSize,Order...orders){
		return userroleDao.findAll(searchParame, pageNumber, pageSize, orders);
	}
}
