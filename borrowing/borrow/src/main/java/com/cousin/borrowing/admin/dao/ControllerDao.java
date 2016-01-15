package com.cousin.borrowing.admin.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import com.cousin.borrowing.admin.entity.Controller;

public interface ControllerDao extends JpaRepository<Controller, Long> {

}
