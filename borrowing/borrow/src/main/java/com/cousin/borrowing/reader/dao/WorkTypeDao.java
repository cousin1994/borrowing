package com.cousin.borrowing.reader.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import com.cousin.borrowing.reader.entity.WorkType;

public interface WorkTypeDao extends JpaRepository<WorkType, Long> {

}
