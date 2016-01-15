package com.cousin.borrowing.book.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import com.cousin.borrowing.book.entity.Book;

public interface BookDao extends JpaRepository<Book, Long> {

}
