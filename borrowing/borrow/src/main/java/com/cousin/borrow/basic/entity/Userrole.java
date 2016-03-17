package com.cousin.borrow.basic.entity;

import static javax.persistence.GenerationType.SEQUENCE;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

/**
 * Userrole entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "USERROLE", schema = "BORROW")
public class Userrole implements java.io.Serializable {

	// Fields

	/**
	 * 
	 */
	private static final long serialVersionUID = -8029096474590239504L;
	private Long id;
	private String code;
	private String password;
	private String name;
	private Byte type;
	private Byte state;
	private Byte violate;
	private Long aggregate;
	private String certify;
	private String lib;
	private Date bed;
	private Date endd;
	private Long unit;
	private String address;
	private String nation;
	private String jg;
	private Long postcd;
	private Date birthday;
	private Long age;
	private String email;
	private Long phone;
	private String remarks;
	private Byte role;

	// Constructors

	/** default constructor */
	public Userrole() {
	}

	/** full constructor */
	public Userrole(String code, String password, String name, Byte type,
			Byte state, Byte violate, Long aggregate, String certify,
			String lib, Date bed, Date endd, Long unit, String address,
			String nation, String jg, Long postcd, Date birthday,
			Long age, String email, Long phone, String remarks,
			Byte role) {
		this.code = code;
		this.password = password;
		this.name = name;
		this.type = type;
		this.state = state;
		this.violate = violate;
		this.aggregate = aggregate;
		this.certify = certify;
		this.lib = lib;
		this.bed = bed;
		this.endd = endd;
		this.unit = unit;
		this.address = address;
		this.nation = nation;
		this.jg = jg;
		this.postcd = postcd;
		this.birthday = birthday;
		this.age = age;
		this.email = email;
		this.phone = phone;
		this.remarks = remarks;
		this.role = role;
	}

	// Property accessors
	@SequenceGenerator(name = "generator",sequenceName="SEQ_USAGE")
	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "generator")
	@Column(name = "ID", unique = true, nullable = false, precision = 28, scale = 0)
	public Long getId() {
		return this.id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	@Column(name = "CODE", length = 500)
	public String getCode() {
		return this.code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	@Column(name = "PASSWORD", length = 120)
	public String getPassword() {
		return this.password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	@Column(name = "NAME", length = 100)
	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	@Column(name = "TYPE", precision = 2, scale = 0)
	public Byte getType() {
		return this.type;
	}

	public void setType(Byte type) {
		this.type = type;
	}

	@Column(name = "STATE", precision = 2, scale = 0)
	public Byte getState() {
		return this.state;
	}

	public void setState(Byte state) {
		this.state = state;
	}

	@Column(name = "VIOLATE", precision = 2, scale = 0)
	public Byte getViolate() {
		return this.violate;
	}

	public void setViolate(Byte violate) {
		this.violate = violate;
	}

	@Column(name = "AGGREGATE", precision = 10, scale = 0)
	public Long getAggregate() {
		return this.aggregate;
	}

	public void setAggregate(Long aggregate) {
		this.aggregate = aggregate;
	}

	@Column(name = "CERTIFY")
	public String getCertify() {
		return this.certify;
	}

	public void setCertify(String certify) {
		this.certify = certify;
	}

	@Column(name = "LIB", length = 32)
	public String getLib() {
		return this.lib;
	}

	public void setLib(String lib) {
		this.lib = lib;
	}

	@Temporal(TemporalType.DATE)
	@Column(name = "BED", length = 7)
	public Date getBed() {
		return this.bed;
	}

	public void setBed(Date bed) {
		this.bed = bed;
	}

	@Temporal(TemporalType.DATE)
	@Column(name = "ENDD", length = 7)
	public Date getEndd() {
		return this.endd;
	}

	public void setEndd(Date endd) {
		this.endd = endd;
	}

	@Column(name = "UNIT", precision = 28, scale = 0)
	public Long getUnit() {
		return this.unit;
	}

	public void setUnit(Long unit) {
		this.unit = unit;
	}

	@Column(name = "ADDRESS")
	public String getAddress() {
		return this.address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	@Column(name = "NATION", length = 32)
	public String getNation() {
		return this.nation;
	}

	public void setNation(String nation) {
		this.nation = nation;
	}

	@Column(name = "JG", length = 32)
	public String getJg() {
		return this.jg;
	}

	public void setJg(String jg) {
		this.jg = jg;
	}

	@Column(name = "POSTCD", precision = 32, scale = 0)
	public Long getPostcd() {
		return this.postcd;
	}

	public void setPostcd(Long postcd) {
		this.postcd = postcd;
	}

	@Temporal(TemporalType.DATE)
	@Column(name = "BIRTHDAY", length = 7)
	public Date getBirthday() {
		return this.birthday;
	}

	public void setBirthday(Date birthday) {
		this.birthday = birthday;
	}

	@Column(name = "AGE", precision = 32, scale = 0)
	public Long getAge() {
		return this.age;
	}

	public void setAge(Long age) {
		this.age = age;
	}

	@Column(name = "EMAIL")
	public String getEmail() {
		return this.email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	@Column(name = "PHONE", precision = 32, scale = 0)
	public Long getPhone() {
		return this.phone;
	}

	public void setPhone(Long phone) {
		this.phone = phone;
	}

	@Column(name = "REMARKS",length = 1000)
	public String getRemarks() {
		return this.remarks;
	}

	public void setRemarks(String remarks) {
		this.remarks = remarks;
	}

	@Column(name = "ROLE", precision = 2, scale = 0)
	public Byte getRole() {
		return this.role;
	}

	public void setRole(Byte role) {
		this.role = role;
	}

}
