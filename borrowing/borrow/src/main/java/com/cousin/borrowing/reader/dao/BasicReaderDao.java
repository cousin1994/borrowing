package com.cousin.borrowing.reader.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import com.cousin.borrowing.reader.entity.BasicReader;

public interface BasicReaderDao extends JpaRepository<BasicReader, Long> {

}
