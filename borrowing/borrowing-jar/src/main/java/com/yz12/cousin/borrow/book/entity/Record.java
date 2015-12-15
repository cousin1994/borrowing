package com.yz12.cousin.borrow.book.entity;

import java.math.BigDecimal;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;

import static javax.persistence.GenerationType.SEQUENCE;

import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import com.yz12.cousin.borrow.reader.entity.BasicReader;

/**
 * Record entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "RECORD", schema = "BORROW")
public class Record implements java.io.Serializable {

	// Fields

	private BigDecimal id;
	private BasicReader basicReader;
	private Book book;
	private Date begin;
	private Date end;
	private Short money;
	private Byte renew;

	// Constructors

	/** default constructor */
	public Record() {
	}

	/** full constructor */
	public Record(BasicReader basicReader, Book book, Date begin, Date end,
			Short money, Byte renew) {
		this.basicReader = basicReader;
		this.book = book;
		this.begin = begin;
		this.end = end;
		this.money = money;
		this.renew = renew;
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

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "READID")
	public BasicReader getBasicReader() {
		return this.basicReader;
	}

	public void setBasicReader(BasicReader basicReader) {
		this.basicReader = basicReader;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "BOOKID")
	public Book getBook() {
		return this.book;
	}

	public void setBook(Book book) {
		this.book = book;
	}

	@Temporal(TemporalType.DATE)
	@Column(name = "BEGIN", length = 7)
	public Date getBegin() {
		return this.begin;
	}

	public void setBegin(Date begin) {
		this.begin = begin;
	}

	@Temporal(TemporalType.DATE)
	@Column(name = "END", length = 7)
	public Date getEnd() {
		return this.end;
	}

	public void setEnd(Date end) {
		this.end = end;
	}

	@Column(name = "MONEY", precision = 3, scale = 0)
	public Short getMoney() {
		return this.money;
	}

	public void setMoney(Short money) {
		this.money = money;
	}

	@Column(name = "RENEW", precision = 2, scale = 0)
	public Byte getRenew() {
		return this.renew;
	}

	public void setRenew(Byte renew) {
		this.renew = renew;
	}

}