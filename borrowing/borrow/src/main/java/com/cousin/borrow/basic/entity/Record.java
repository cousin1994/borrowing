package com.cousin.borrow.basic.entity;

import java.util.Date;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.SEQUENCE;
import javax.persistence.Id;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

/**
 * Record entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "RECORD", schema = "BORROW")
public class Record implements java.io.Serializable {

	// Fields

	/**
	 * 
	 */
	private static final long serialVersionUID = 5220250144900582191L;
	private Long id;
	private Long readid;
	private Long bookid;
	private Date begin;
	private Date end;
	private Short money;
	private Byte renew;

	// Constructors

	/** default constructor */
	public Record() {
	}

	/** full constructor */
	public Record(Long readid, Long bookid, Date begin, Date end,
			Short money, Byte renew) {
		this.readid = readid;
		this.bookid = bookid;
		this.begin = begin;
		this.end = end;
		this.money = money;
		this.renew = renew;
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

	@Column(name = "READID", precision = 28, scale = 0)
	public Long getReadid() {
		return this.readid;
	}

	public void setReadid(Long readid) {
		this.readid = readid;
	}

	@Column(name = "BOOKID", precision = 28, scale = 0)
	public Long getBookid() {
		return this.bookid;
	}

	public void setBookid(Long bookid) {
		this.bookid = bookid;
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