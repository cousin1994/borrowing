package com.cousin.borrowing.book.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import com.cousin.borrowing.book.entity.Record;

public interface RecordDao extends JpaRepository<Record, Long> {

}
