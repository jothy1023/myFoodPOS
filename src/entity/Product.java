package entity;

import java.util.HashSet;
import java.util.Set;

/**
 * Product entity. @author MyEclipse Persistence Tools
 */

public class Product implements java.io.Serializable {

	// Fields

	private Integer id;
	private Type type;
	private String time;
	private Integer price;
	private String pname;
	private String psize;
	private Integer idx;

	// Constructors

	/** default constructor */
	public Product() {
	}

	/** minimal constructor */
	public Product(Type type, String time, Integer price, String pname,
			String psize) {
		this.type = type;
		this.time = time;
		this.price = price;
		this.pname = pname;
		this.psize = psize;
	}

	/** full constructor */
	public Product(Type type, String time, Integer price, String pname,
			String psize, Integer idx) {
		this.type = type;
		this.time = time;
		this.price = price;
		this.pname = pname;
		this.psize = psize;
		this.idx = idx;
	}

	// Property accessors

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Type getType() {
		return this.type;
	}

	public void setType(Type type) {
		this.type = type;
	}

	public String getTime() {
		return this.time;
	}

	public void setTime(String time) {
		this.time = time;
	}

	public Integer getPrice() {
		return this.price;
	}

	public void setPrice(Integer price) {
		this.price = price;
	}

	public String getPname() {
		return this.pname;
	}

	public void setPname(String pname) {
		this.pname = pname;
	}

	public String getPsize() {
		return this.psize;
	}

	public void setPsize(String psize) {
		this.psize = psize;
	}

	public Integer getIdx() {
		return this.idx;
	}

	public void setIdx(Integer idx) {
		this.idx = idx;
	}


}