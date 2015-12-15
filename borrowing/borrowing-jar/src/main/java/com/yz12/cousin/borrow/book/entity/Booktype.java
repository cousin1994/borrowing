package com.yz12.cousin.borrow.book.entity;

import java.math.BigDecimal;
import java.util.HashSet;
import java.util.Set;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.SEQUENCE;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

/**
 * Booktype entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "BOOKTYPE", schema = "BORROW")
public class Booktype implements java.io.Serializable {

	// Fields

	private BigDecimal id;
	private BigDecimal fid;
	private String name;
	private String code;
	private String explain;
	private Set<Book> books = new HashSet<Book>(0);

	// Constructors

	/** default constructor */
	public Booktype() {
	}

	/** full constructor */
	public Booktype(BigDecimal fid, String name, String code, String explain,
			Set<Book> books) {
		this.fid = fid;
		this.name = name;
		this.code = code;
		this.explain = explain;
		this.books = books;
	}

	// Property accessors
	@SequenceGenerator(name = "generator")
	@Id
	@GeneratedValue(strategy = SEQUENCE, generator = "generator")
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

	@OneToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY, mappedBy = "booktype")
	public Set<Book> getBooks() {
		return this.books;
	}

	public void setBooks(Set<Book> books) {
		this.books = books;
	}

}