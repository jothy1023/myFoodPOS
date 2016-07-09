package entity;

import java.util.HashSet;
import java.util.Set;

/**
 * User entity. @author MyEclipse Persistence Tools
 */

public class User implements java.io.Serializable {

	// Fields

	private Integer userid;
	private String password;
	private String username;
	private String catagory;
	private String sex;
	private Integer age;
	private Set orderses = new HashSet(0);

	// Constructors

	/** default constructor */
	public User() {
	}

	public User(String password, String username) {
		this.password = password;
		this.username = username;
	}

	public User(String username, String catagory, String sex, Integer age) {
		this.username = username;
		this.catagory = catagory;
		this.sex = sex;
		this.age = age;
	}

	/** minimal constructor */
	public User(String password, String username, String catagory, String sex,
			Integer age) {
		this.password = password;
		this.username = username;
		this.catagory = catagory;
		this.sex = sex;
		this.age = age;
	}

	/** full constructor */
	public User(String password, String username, String catagory, String sex,
			Integer age, Set orderses) {
		this.password = password;
		this.username = username;
		this.catagory = catagory;
		this.sex = sex;
		this.age = age;
		this.orderses = orderses;
	}

	// Property accessors

	public Integer getUserid() {
		return this.userid;
	}

	public void setUserid(Integer userid) {
		this.userid = userid;
	}

	public String getPassword() {
		return this.password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getUsername() {
		return this.username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getCatagory() {
		return this.catagory;
	}

	public void setCatagory(String catagory) {
		this.catagory = catagory;
	}

	public String getSex() {
		return this.sex;
	}

	public void setSex(String sex) {
		this.sex = sex;
	}

	public Integer getAge() {
		return this.age;
	}

	public void setAge(Integer age) {
		this.age = age;
	}

	public Set getOrderses() {
		return this.orderses;
	}

	public void setOrderses(Set orderses) {
		this.orderses = orderses;
	}

}