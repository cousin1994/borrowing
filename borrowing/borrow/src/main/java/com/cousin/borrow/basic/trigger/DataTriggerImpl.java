package com.cousin.borrow.basic.trigger;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.Period;
import java.time.ZoneId;
import java.time.format.DateTimeFormatter;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Lazy;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;

import com.cousin.borrow.basic.entity.Book;
import com.cousin.borrow.basic.entity.Record;
import com.cousin.borrow.basic.entity.Userrole;
import com.cousin.borrow.basic.service.BookService;
import com.cousin.borrow.basic.service.RecordService;
import com.cousin.borrow.basic.service.UserroleService;

/**
 *@author 戴嘉诚 E-mail:a773807943@gmail.com
 *@version V0.1 创建时间：2016年4月16日 上午2:25:06
 */
@Service
@Lazy(false)
public class DataTriggerImpl {

	@Autowired
	private BookService bookService;
	
	@Autowired
	private RecordService recordService;
	
	@Autowired
	private UserroleService userroleService;
	
	//@Scheduled(cron="0-59 * * * *")//每秒执行一次
	@Scheduled(cron="0 0 0 * * ?")//每天0时
	public void watchbookdate(){
		List<Record> recordList = recordService.findAllRecord();
		LocalDate today = LocalDate.now();
		for(int i=0; i< recordList.size();i++){
			Record record = recordList.get(i);
			Date date = record.getEnd();
			String str = date.toString();
			LocalDate endDate = LocalDate.parse(str,DateTimeFormatter.ISO_DATE);
			if(today.isAfter(endDate)){
				record.setState(3);
				Period periodDay = Period.between(endDate, today);
				record.setMoney(periodDay.getDays()*0.1);
				Book book = bookService.findById(record.getBookid());
				book.setIsborrowed(3L);
				bookService.save(book);
				Userrole user = userroleService.findById(record.getReadid());
				user.setState((byte) 1);
				userroleService.save(user);
			}
		}
		recordService.save(recordList);
	}
}
