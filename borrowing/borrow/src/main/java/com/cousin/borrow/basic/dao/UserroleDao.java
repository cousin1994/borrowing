package com.cousin.borrow.basic.dao;

import com.cousin.borrow.basic.entity.Userrole;
import com.cousin.util.data.jpa.repository.BaseJpaRepository;

/**
* @author 戴嘉诚 E-mail:a773807943@gmail.com
* @version 创建时间： 2016年1月31日 上午5:42:34
*/
public interface UserroleDao extends BaseJpaRepository<Userrole, Long> {
	
	/**
	 * 通过用户名和密码查找实体类
	 * @param Code
	 * @return
	 */
	public Userrole findByCodeAndPassword(String Code,String Password);

	/**
	 * 通过用户名查找用户
	 * @param Code
	 * @return
	 */
	public Userrole findByCode(String Code);
	
}
