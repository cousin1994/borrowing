package com.cousin.borrowing.book.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import com.cousin.borrowing.book.entity.BookType;

public interface BookTypeDao extends JpaRepository<BookType, Long> {
	
}
