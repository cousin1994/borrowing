package com.yz12.cousin.borrow.admin.entity;

import java.math.BigDecimal;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.SEQUENCE;
import javax.persistence.Id;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

/**
 * Admin entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "ADMIN", schema = "BORROW")
public class Admin implements java.io.Serializable {

	// Fields

	private BigDecimal id;
	private String adcode;
	private String adpassword;
	private String adname;
	private String adpost;
	private Byte adrols;

	// Constructors

	/** default constructor */
	public Admin() {
	}

	/** full constructor */
	public Admin(String adcode, String adpassword, String adname,
			String adpost, Byte adrols) {
		this.adcode = adcode;
		this.adpassword = adpassword;
		this.adname = adname;
		this.adpost = adpost;
		this.adrols = adrols;
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

	@Column(name = "ADCODE", length = 32)
	public String getAdcode() {
		return this.adcode;
	}

	public void setAdcode(String adcode) {
		this.adcode = adcode;
	}

	@Column(name = "ADPASSWORD")
	public String getAdpassword() {
		return this.adpassword;
	}

	public void setAdpassword(String adpassword) {
		this.adpassword = adpassword;
	}

	@Column(name = "ADNAME", length = 32)
	public String getAdname() {
		return this.adname;
	}

	public void setAdname(String adname) {
		this.adname = adname;
	}

	@Column(name = "ADPOST", length = 100)
	public String getAdpost() {
		return this.adpost;
	}

	public void setAdpost(String adpost) {
		this.adpost = adpost;
	}

	@Column(name = "ADROLS", precision = 2, scale = 0)
	public Byte getAdrols() {
		return this.adrols;
	}

	public void setAdrols(Byte adrols) {
		this.adrols = adrols;
	}

}