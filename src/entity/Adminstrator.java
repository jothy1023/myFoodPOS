package entity;

/**
 * Adminstrator entity. @author MyEclipse Persistence Tools
 */

public class Adminstrator implements java.io.Serializable {

	// Fields

	private Integer adminId;
	private String adminName;
	private String sex;
	private String catagory;
	private Integer age;
	private String password;

	// Constructors

	/** default constructor */
	public Adminstrator() {
	}

	/** minimal constructor */
	public Adminstrator(String adminName, String catagory, String password) {
		this.adminName = adminName;
		this.catagory = catagory;
		this.password = password;
	}

	/** full constructor */
	public Adminstrator(String adminName, String sex, String catagory,
			Integer age, String password) {
		this.adminName = adminName;
		this.sex = sex;
		this.catagory = catagory;
		this.age = age;
		this.password = password;
	}

	// Property accessors

	public Integer getAdminId() {
		return this.adminId;
	}

	public void setAdminId(Integer adminId) {
		this.adminId = adminId;
	}

	public String getAdminName() {
		return this.adminName;
	}

	public void setAdminName(String adminName) {
		this.adminName = adminName;
	}

	public String getSex() {
		return this.sex;
	}

	public void setSex(String sex) {
		this.sex = sex;
	}

	public String getCatagory() {
		return this.catagory;
	}

	public void setCatagory(String catagory) {
		this.catagory = catagory;
	}

	public Integer getAge() {
		return this.age;
	}

	public void setAge(Integer age) {
		this.age = age;
	}

	public String getPassword() {
		return this.password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

}