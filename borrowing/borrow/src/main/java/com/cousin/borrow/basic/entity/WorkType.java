package com.cousin.borrow.basic.entity;

import static javax.persistence.GenerationType.SEQUENCE;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

/**
 * WorkType entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "WORK_TYPE", schema = "BORROW")
public class WorkType implements java.io.Serializable {

	// Fields

	/**
	 * 
	 */
	private static final long serialVersionUID = -1384577156193135331L;
	private Long id;
	private Long fid;
	private String name;
	private String code;
	private String explain;

	// Constructors

	/** default constructor */
	public WorkType() {
	}

	/** full constructor */
	public WorkType(Long fid, String name, String code, String explain) {
		this.fid = fid;
		this.name = name;
		this.code = code;
		this.explain = explain;
	}

	// Property accessors
	@SequenceGenerator(name = "generator",sequenceName="SEQ_BORROW")
	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "generator")
	@Column(name = "ID", unique = true, nullable = false, precision = 28, scale = 0)
	public Long getId() {
		return this.id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	@Column(name = "FID", precision = 28, scale = 0)
	public Long getFid() {
		return this.fid;
	}

	public void setFid(Long fid) {
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

}