package com.cousin.borrow.basic.util;

import java.util.List;
import java.util.Map;

public class DataTables {
	private int draw;  //获取请求次数
	private int recordsTotal;		//过滤前的总条数
	private int recordsFiltered;	//过滤后的条数
	private List<?> data;	//数据
	private int length;				//当前页长度
	private int start;				//第几页
	private Map<String, String> search;		//查询条件
	private Map<String, String>[] order;	//排序

	public DataTables(int draw, int recordsTotal, int recordsFiltered, List<?> data) {
		super();
		this.draw = draw;
		this.recordsTotal = recordsTotal;
		this.recordsFiltered = recordsFiltered;
		this.data = data;
	}

	public DataTables(int draw, int recordsTotal, int recordsFiltered, List<?> data, int length, int start) {
		super();
		this.draw = draw;
		this.recordsTotal = recordsTotal;
		this.recordsFiltered = recordsFiltered;
		this.data = data;
		this.length = length;
		this.start = start;
	}

	public DataTables() {
	}

	public int getDraw() {
		return draw;
	}

	public void setDraw(int draw) {
		this.draw = draw;
	}

	public int getRecordsTotal() {
		return recordsTotal;
	}

	public void setRecordsTotal(int recordsTotal) {
		this.recordsTotal = recordsTotal;
	}

	public int getRecordsFiltered() {
		return recordsFiltered;
	}

	public void setRecordsFiltered(int recordsFiltered) {
		this.recordsFiltered = recordsFiltered;
	}

	public List<?> getData() {
		return data;
	}

	public void setData(List<?> data) {
		this.data = data;
	}

	public int getLength() {
		return length;
	}

	public void setLength(int length) {
		this.length = length;
	}

	public int getStart() {
		return start;
	}

	public void setStart(int start) {
		this.start = start;
	}

	public Map<String, String> getSearch() {
		return search;
	}

	public void setSearch(Map<String, String> search) {
		this.search = search;
	}

	public Map<String, String>[] getOrder() {
		return order;
	}

	public void setOrder(Map<String, String>[] order) {
		this.order = order;
	}
}
