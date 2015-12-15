package com.yz12.cousin.borrow.book.entity;

import java.math.BigDecimal;
import java.util.Date;
import java.util.HashSet;
import java.util.Set;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.SEQUENCE;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.Lob;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

/**
 * Book entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "BOOK", schema = "BORROW")
public class Book implements java.io.Serializable {

	// Fields

	private BigDecimal id;
	private Booktype booktype;
	private String bname;
	private String fauthor;
	private String sauthor;
	private String tauthor;
	private String translator;
	private String publisher;
	private Date publshdate;
	private String intro;
	private Boolean isborrowed;
	private Set<Record> records = new HashSet<Record>(0);

	// Constructors

	/** default constructor */
	public Book() {
	}

	/** full constructor */
	public Book(Booktype booktype, String bname, String fauthor,
			String sauthor, String tauthor, String translator,
			String publisher, Date publshdate, String intro,
			Boolean isborrowed, Set<Record> records) {
		this.booktype = booktype;
		this.bname = bname;
		this.fauthor = fauthor;
		this.sauthor = sauthor;
		this.tauthor = tauthor;
		this.translator = translator;
		this.publisher = publisher;
		this.publshdate = publshdate;
		this.intro = intro;
		this.isborrowed = isborrowed;
		this.records = records;
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
	@JoinColumn(name = "TYPE")
	public Booktype getBooktype() {
		return this.booktype;
	}

	public void setBooktype(Booktype booktype) {
		this.booktype = booktype;
	}

	@Column(name = "BNAME", length = 100)
	public String getBname() {
		return this.bname;
	}

	public void setBname(String bname) {
		this.bname = bname;
	}

	@Column(name = "FAUTHOR", length = 32)
	public String getFauthor() {
		return this.fauthor;
	}

	public void setFauthor(String fauthor) {
		this.fauthor = fauthor;
	}

	@Column(name = "SAUTHOR", length = 32)
	public String getSauthor() {
		return this.sauthor;
	}

	public void setSauthor(String sauthor) {
		this.sauthor = sauthor;
	}

	@Column(name = "TAUTHOR", length = 32)
	public String getTauthor() {
		return this.tauthor;
	}

	public void setTauthor(String tauthor) {
		this.tauthor = tauthor;
	}

	@Column(name = "TRANSLATOR", length = 32)
	public String getTranslator() {
		return this.translator;
	}

	public void setTranslator(String translator) {
		this.translator = translator;
	}

	@Column(name = "PUBLISHER", length = 32)
	public String getPublisher() {
		return this.publisher;
	}

	public void setPublisher(String publisher) {
		this.publisher = publisher;
	}

	@Temporal(TemporalType.DATE)
	@Column(name = "PUBLSHDATE", length = 7)
	public Date getPublshdate() {
		return this.publshdate;
	}

	public void setPublshdate(Date publshdate) {
		this.publshdate = publshdate;
	}

	@Lob
	@Column(name = "INTRO")
	public String getIntro() {
		return this.intro;
	}

	public void setIntro(String intro) {
		this.intro = intro;
	}

	@Column(name = "ISBORROWED", precision = 1, scale = 0)
	public Boolean getIsborrowed() {
		return this.isborrowed;
	}

	public void setIsborrowed(Boolean isborrowed) {
		this.isborrowed = isborrowed;
	}

	@OneToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY, mappedBy = "book")
	public Set<Record> getRecords() {
		return this.records;
	}

	public void setRecords(Set<Record> records) {
		this.records = records;
	}

}