package com.cousin.borrowing.book.entity;

import java.math.BigDecimal;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.SEQUENCE;
import javax.persistence.Id;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

/**
 * BookType entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "BOOK_TYPE", schema = "BORROW")
public class BookType implements java.io.Serializable {

	// Fields

	private BigDecimal id;
	private BigDecimal fid;
	private String name;
	private String code;
	private String explain;

	// Constructors

	/** default constructor */
	public BookType() {
	}

	/** full constructor */
	public BookType(BigDecimal fid, String name, String code, String explain) {
		this.fid = fid;
		this.name = name;
		this.code = code;
		this.explain = explain;
	}

	// Property accessors
	@Id
	@GeneratedValue(strategy = SEQUENCE, generator = "generator")
	@SequenceGenerator(name = "generator",sequenceName="SEQ_BORROW")
	@Column(name = "ID", unique = true, nullable = false, precision = 28, scale = 0)
	public BigDecimal getId() {
		return this.id;
	}

	public void setId(BigDecimal id) {
		this.id = id;
	}

	@Column(name = "FID", precision = 28, scale = 0)
	public BigDecimal getFid() {
		return this.fid;
	}

	public void setFid(BigDecimal fid) {
		this.fid = fid;
	}

	@Column(name = "NAME", length = 100)
	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	@Column(name = "CODE", length = 100)
	public String getCode() {
		return this.code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	@Column(name = "EXPLAIN", length = 500)
	public String getExplain() {
		return this.explain;
	}

	public void setExplain(String explain) {
		this.explain = explain;
	}

}