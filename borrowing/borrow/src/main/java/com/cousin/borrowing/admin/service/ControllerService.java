package com.cousin.borrowing.admin.service;

import org.springframework.stereotype.Service;

import com.cousin.borrowing.admin.dao.ControllerDao;
import com.cousin.borrowing.admin.entity.Controller;

/**
* @author 戴嘉诚 E-mail:a773807943@gmail.com
* @version 创建时间： 2016年1月16日 上午12:32:35
*/
@Service
public class ControllerService {

	private ControllerDao controllerDao;
	
	/**
	 * 保存
	 * @param controller
	 * @return
	 */
	public Controller save(Controller controller){
		Controller contro = controllerDao.save(controller);
		return contro;
	}
}
