package com.cousin.borrow.basic.entity;

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

	/**
	 * 
	 */
	private static final long serialVersionUID = 53484748860033913L;
	private Long id;
	private Long parentid;
	private String name;
	private String code;
	private String explain;

	// Constructors

	/** default constructor */
	public BookType() {
	}

	/** full constructor */
	public BookType(Long parentid, String name, String code, String explain) {
		this.parentid = parentid;
		this.name = name;
		this.code = code;
		this.explain = explain;
	}

	// Property accessors
	@SequenceGenerator(name = "generator",sequenceName="SEQ_BORROW")
	@Id
	@GeneratedValue(strategy = SEQUENCE, generator = "generator")
	@Column(name = "ID", unique = true, nullable = false, precision = 28, scale = 0)
	public Long getId() {
		return this.id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	@Column(name = "PARENTID", precision = 28, scale = 0)
	public Long getParentid() {
		return this.parentid;
	}

	public void setParentid(Long parentid) {
		this.parentid = parentid;
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