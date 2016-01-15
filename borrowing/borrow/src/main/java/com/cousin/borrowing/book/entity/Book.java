package com.cousin.borrowing.book.entity;

import java.math.BigDecimal;
import java.util.Date;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.SEQUENCE;
import javax.persistence.Id;
import javax.persistence.Lob;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;

/**
 * Book entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "BOOK", schema = "BORROW")
@Cache(usage =CacheConcurrencyStrategy.READ_WRITE)
public class Book implements java.io.Serializable {

	// Fields

	/**
	 * 
	 */
	private static final long serialVersionUID = -9027151969120287474L;
	private BigDecimal id;
	private String bname;
	private String fauthor;
	private String sauthor;
	private String tauthor;
	private String translator;
	private String publisher;
	private Date publshdate;
	private String intro;
	private BigDecimal type;
	private Boolean isborrowed;

	// Constructors

	/** default constructor */
	public Book() {
	}

	/** full constructor */
	public Book(String bname, String fauthor, String sauthor, String tauthor,
			String translator, String publisher, Date publshdate, String intro,
			BigDecimal type, Boolean isborrowed) {
		this.bname = bname;
		this.fauthor = fauthor;
		this.sauthor = sauthor;
		this.tauthor = tauthor;
		this.translator = translator;
		this.publisher = publisher;
		this.publshdate = publshdate;
		this.intro = intro;
		this.type = type;
		this.isborrowed = isborrowed;
	}

	// Property accessors
	@Id
	@GeneratedValue(strategy = SEQUENCE, generator = "generator")
	@SequenceGenerator(name = "generator",sequenceName="SEQ_BOOK")
	@Column(name = "ID", unique = true, nullable = false, precision = 28, scale = 0)
	public BigDecimal getId() {
		return this.id;
	}

	public void setId(BigDecimal id) {
		this.id = id;
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

	@Column(name = "TYPE", precision = 28, scale = 0)
	public BigDecimal getType() {
		return this.type;
	}

	public void setType(BigDecimal type) {
		this.type = type;
	}

	@Column(name = "ISBORROWED", precision = 1, scale = 0)
	public Boolean getIsborrowed() {
		return this.isborrowed;
	}

	public void setIsborrowed(Boolean isborrowed) {
		this.isborrowed = isborrowed;
	}

}