package com.yz12.cousin.borrow.reader.entity;

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
 * BasicReader entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "BASIC_READER", schema = "BORROW")
public class BasicReader implements java.io.Serializable {

	// Fields

	private BigDecimal id;
	private Worktype worktype;
	private BigDecimal rdcode;
	private String rdpassword;
	private String rdname;
	private Byte rdtype;
	private Byte rdstate;
	private Byte rdviolate;
	private Long rdaggregate;
	private String rdcertify;
	private String rdlib;
	private Date rdbed;
	private Date rdendd;
	private String rdaddress;
	private String rdnation;
	private String rdjg;
	private BigDecimal rdpostcd;
	private Date rdbirthday;
	private BigDecimal rdage;
	private String rdemail;
	private BigDecimal rdphone;
	private String rdremarks;
	private Set<Record> records = new HashSet<Record>(0);

	// Constructors

	/** default constructor */
	public BasicReader() {
	}

	/** full constructor */
	public BasicReader(Worktype worktype, BigDecimal rdcode, String rdpassword,
			String rdname, Byte rdtype, Byte rdstate, Byte rdviolate,
			Long rdaggregate, String rdcertify, String rdlib, Date rdbed,
			Date rdendd, String rdaddress, String rdnation, String rdjg,
			BigDecimal rdpostcd, Date rdbirthday, BigDecimal rdage,
			String rdemail, BigDecimal rdphone, String rdremarks,
			Set<Record> records) {
		this.worktype = worktype;
		this.rdcode = rdcode;
		this.rdpassword = rdpassword;
		this.rdname = rdname;
		this.rdtype = rdtype;
		this.rdstate = rdstate;
		this.rdviolate = rdviolate;
		this.rdaggregate = rdaggregate;
		this.rdcertify = rdcertify;
		this.rdlib = rdlib;
		this.rdbed = rdbed;
		this.rdendd = rdendd;
		this.rdaddress = rdaddress;
		this.rdnation = rdnation;
		this.rdjg = rdjg;
		this.rdpostcd = rdpostcd;
		this.rdbirthday = rdbirthday;
		this.rdage = rdage;
		this.rdemail = rdemail;
		this.rdphone = rdphone;
		this.rdremarks = rdremarks;
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
	@JoinColumn(name = "RDUNIT")
	public Worktype getWorktype() {
		return this.worktype;
	}

	public void setWorktype(Worktype worktype) {
		this.worktype = worktype;
	}

	@Column(name = "RDCODE", precision = 28, scale = 0)
	public BigDecimal getRdcode() {
		return this.rdcode;
	}

	public void setRdcode(BigDecimal rdcode) {
		this.rdcode = rdcode;
	}

	@Column(name = "RDPASSWORD", length = 120)
	public String getRdpassword() {
		return this.rdpassword;
	}

	public void setRdpassword(String rdpassword) {
		this.rdpassword = rdpassword;
	}

	@Column(name = "RDNAME", length = 100)
	public String getRdname() {
		return this.rdname;
	}

	public void setRdname(String rdname) {
		this.rdname = rdname;
	}

	@Column(name = "RDTYPE", precision = 2, scale = 0)
	public Byte getRdtype() {
		return this.rdtype;
	}

	public void setRdtype(Byte rdtype) {
		this.rdtype = rdtype;
	}

	@Column(name = "RDSTATE", precision = 2, scale = 0)
	public Byte getRdstate() {
		return this.rdstate;
	}

	public void setRdstate(Byte rdstate) {
		this.rdstate = rdstate;
	}

	@Column(name = "RDVIOLATE", precision = 2, scale = 0)
	public Byte getRdviolate() {
		return this.rdviolate;
	}

	public void setRdviolate(Byte rdviolate) {
		this.rdviolate = rdviolate;
	}

	@Column(name = "RDAGGREGATE", precision = 10, scale = 0)
	public Long getRdaggregate() {
		return this.rdaggregate;
	}

	public void setRdaggregate(Long rdaggregate) {
		this.rdaggregate = rdaggregate;
	}

	@Column(name = "RDCERTIFY")
	public String getRdcertify() {
		return this.rdcertify;
	}

	public void setRdcertify(String rdcertify) {
		this.rdcertify = rdcertify;
	}

	@Column(name = "RDLIB", length = 32)
	public String getRdlib() {
		return this.rdlib;
	}

	public void setRdlib(String rdlib) {
		this.rdlib = rdlib;
	}

	@Temporal(TemporalType.DATE)
	@Column(name = "RDBED", length = 7)
	public Date getRdbed() {
		return this.rdbed;
	}

	public void setRdbed(Date rdbed) {
		this.rdbed = rdbed;
	}

	@Temporal(TemporalType.DATE)
	@Column(name = "RDENDD", length = 7)
	public Date getRdendd() {
		return this.rdendd;
	}

	public void setRdendd(Date rdendd) {
		this.rdendd = rdendd;
	}

	@Column(name = "RDADDRESS")
	public String getRdaddress() {
		return this.rdaddress;
	}

	public void setRdaddress(String rdaddress) {
		this.rdaddress = rdaddress;
	}

	@Column(name = "RDNATION", length = 32)
	public String getRdnation() {
		return this.rdnation;
	}

	public void setRdnation(String rdnation) {
		this.rdnation = rdnation;
	}

	@Column(name = "RDJG", length = 32)
	public String getRdjg() {
		return this.rdjg;
	}

	public void setRdjg(String rdjg) {
		this.rdjg = rdjg;
	}

	@Column(name = "RDPOSTCD", precision = 32, scale = 0)
	public BigDecimal getRdpostcd() {
		return this.rdpostcd;
	}

	public void setRdpostcd(BigDecimal rdpostcd) {
		this.rdpostcd = rdpostcd;
	}

	@Temporal(TemporalType.DATE)
	@Column(name = "RDBIRTHDAY", length = 7)
	public Date getRdbirthday() {
		return this.rdbirthday;
	}

	public void setRdbirthday(Date rdbirthday) {
		this.rdbirthday = rdbirthday;
	}

	@Column(name = "RDAGE", precision = 32, scale = 0)
	public BigDecimal getRdage() {
		return this.rdage;
	}

	public void setRdage(BigDecimal rdage) {
		this.rdage = rdage;
	}

	@Column(name = "RDEMAIL")
	public String getRdemail() {
		return this.rdemail;
	}

	public void setRdemail(String rdemail) {
		this.rdemail = rdemail;
	}

	@Column(name = "RDPHONE", precision = 32, scale = 0)
	public BigDecimal getRdphone() {
		return this.rdphone;
	}

	public void setRdphone(BigDecimal rdphone) {
		this.rdphone = rdphone;
	}

	@Lob
	@Column(name = "RDREMARKS")
	public String getRdremarks() {
		return this.rdremarks;
	}

	public void setRdremarks(String rdremarks) {
		this.rdremarks = rdremarks;
	}

	@OneToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY, mappedBy = "basicReader")
	public Set<Record> getRecords() {
		return this.records;
	}

	public void setRecords(Set<Record> records) {
		this.records = records;
	}

}