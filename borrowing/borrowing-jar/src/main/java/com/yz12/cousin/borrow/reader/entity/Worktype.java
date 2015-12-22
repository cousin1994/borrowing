package com.yz12.cousin.borrow.reader.entity;

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
 * Worktype entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "WORKTYPE", schema = "BORROW")
public class Worktype implements java.io.Serializable {

	// Fields

	private BigDecimal id;
	private BigDecimal fid;
	private String name;
	private String code;
	private String explain;
	private Set<BasicReader> basicReaders = new HashSet<BasicReader>(0);

	// Constructors

	/** default constructor */
	public Worktype() {
	}

	/** full constructor */
	public Worktype(BigDecimal fid, String name, String code, String explain,
			Set<BasicReader> basicReaders) {
		this.fid = fid;
		this.name = name;
		this.code = code;
		this.explain = explain;
		this.basicReaders = basicReaders;
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

	@OneToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY, mappedBy = "worktype")
	public Set<BasicReader> getBasicReaders() {
		return this.basicReaders;
	}

	public void setBasicReaders(Set<BasicReader> basicReaders) {
		this.basicReaders = basicReaders;
	}

}