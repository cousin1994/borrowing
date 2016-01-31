package com.cousin.borrow.basic.entity;

import static javax.persistence.GenerationType.SEQUENCE;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
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
@Cache(usage =CacheConcurrencyStrategy.READ_WRITE)//对书本这个实体类进行二级缓存，提交查询效率
public class Book implements java.io.Serializable {

	// Fields

	private Long id;
	private String bname;
	private String fauthor;
	private String sauthor;
	private String tauthor;
	private String translator;
	private String publisher;
	private Date publshdate;
	private String intro;
	private Long type;
	private Boolean isborrowed;
	private String ssh;
	private String tmh;
	private Date returndate;
	private String orglib;
	private String curlib;
	private String curlocal;
	private Byte cirtype;
	private Long totalloannum;
	private Long totalrenewnum;
	private Long page;
	private String publisherlocal;
	private Byte cd;
	private String photo;

	// Constructors

	/** default constructor */
	public Book() {
	}

	/** full constructor */
	public Book(String bname, String fauthor, String sauthor, String tauthor,
			String translator, String publisher, Date publshdate, String intro,
			Long type, Boolean isborrowed, String ssh, String tmh,
			Date returndate, String orglib, String curlib, String curlocal,
			Byte cirtype, Long totalloannum, Long totalrenewnum,
			Long page, String publisherlocal, Byte cd, String photo) {
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
		this.ssh = ssh;
		this.tmh = tmh;
		this.returndate = returndate;
		this.orglib = orglib;
		this.curlib = curlib;
		this.curlocal = curlocal;
		this.cirtype = cirtype;
		this.totalloannum = totalloannum;
		this.totalrenewnum = totalrenewnum;
		this.page = page;
		this.publisherlocal = publisherlocal;
		this.cd = cd;
		this.photo = photo;
	}

	// Property accessors
	@SequenceGenerator(name = "generator",sequenceName="SEQ_BOOK")
	@Id
	@GeneratedValue(strategy = SEQUENCE, generator = "generator")
	@Column(name = "ID", unique = true, nullable = false, precision = 28, scale = 0)
	public Long getId() {
		return this.id;
	}

	public void setId(Long id) {
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

	@Column(name = "INTRO"，length = 1000)
	public String getIntro() {
		return this.intro;
	}

	public void setIntro(String intro) {
		this.intro = intro;
	}

	@Column(name = "TYPE", precision = 28, scale = 0)
	public Long getType() {
		return this.type;
	}

	public void setType(Long type) {
		this.type = type;
	}

	@Column(name = "ISBORROWED", precision = 1, scale = 0)
	public Boolean getIsborrowed() {
		return this.isborrowed;
	}

	public void setIsborrowed(Boolean isborrowed) {
		this.isborrowed = isborrowed;
	}

	@Column(name = "SSH", length = 100)
	public String getSsh() {
		return this.ssh;
	}

	public void setSsh(String ssh) {
		this.ssh = ssh;
	}

	@Column(name = "TMH", length = 50)
	public String getTmh() {
		return this.tmh;
	}

	public void setTmh(String tmh) {
		this.tmh = tmh;
	}

	@Temporal(TemporalType.DATE)
	@Column(name = "RETURNDATE", length = 7)
	public Date getReturndate() {
		return this.returndate;
	}

	public void setReturndate(Date returndate) {
		this.returndate = returndate;
	}

	@Column(name = "ORGLIB", length = 500)
	public String getOrglib() {
		return this.orglib;
	}

	public void setOrglib(String orglib) {
		this.orglib = orglib;
	}

	@Column(name = "CURLIB", length = 500)
	public String getCurlib() {
		return this.curlib;
	}

	public void setCurlib(String curlib) {
		this.curlib = curlib;
	}

	@Column(name = "CURLOCAL", length = 1000)
	public String getCurlocal() {
		return this.curlocal;
	}

	public void setCurlocal(String curlocal) {
		this.curlocal = curlocal;
	}

	@Column(name = "CIRTYPE", precision = 2, scale = 0)
	public Byte getCirtype() {
		return this.cirtype;
	}

	public void setCirtype(Byte cirtype) {
		this.cirtype = cirtype;
	}

	@Column(name = "TOTALLOANNUM", precision = 20, scale = 0)
	public Long getTotalloannum() {
		return this.totalloannum;
	}

	public void setTotalloannum(Long totalloannum) {
		this.totalloannum = totalloannum;
	}

	@Column(name = "TOTALRENEWNUM", precision = 20, scale = 0)
	public Long getTotalrenewnum() {
		return this.totalrenewnum;
	}

	public void setTotalrenewnum(Long totalrenewnum) {
		this.totalrenewnum = totalrenewnum;
	}

	@Column(name = "PAGE", precision = 10, scale = 0)
	public Long getPage() {
		return this.page;
	}

	public void setPage(Long page) {
		this.page = page;
	}

	@Column(name = "PUBLISHERLOCAL", length = 500)
	public String getPublisherlocal() {
		return this.publisherlocal;
	}

	public void setPublisherlocal(String publisherlocal) {
		this.publisherlocal = publisherlocal;
	}

	@Column(name = "CD", precision = 2, scale = 0)
	public Byte getCd() {
		return this.cd;
	}

	public void setCd(Byte cd) {
		this.cd = cd;
	}

	@Column(name = "PHOTO", length = 1000)
	public String getPhoto() {
		return this.photo;
	}

	public void setPhoto(String photo) {
		this.photo = photo;
	}

}
