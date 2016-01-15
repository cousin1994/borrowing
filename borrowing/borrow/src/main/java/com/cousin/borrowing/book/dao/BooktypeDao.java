package com.cousin.borrowing.book.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import com.cousin.borrowing.book.entity.Booktype;

public interface BooktypeDao extends JpaRepository<Booktype, Long> {
	
}
