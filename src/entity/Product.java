package entity;

public class Product {
	private int pid;
	private String pname;
	private int price;
	// 产品规格
	private int psize;
	// 应该是对类别进行映射，而非类别编号
	private Type type;

	public Product() {
		
	}

	public Product(int pid, String pname, int price, Type type, int psize) {
		this.pid = pid;
		this.pname = pname;
		this.price = price;
		this.type = type;
		this.psize = psize;
	}

	public int getPid() {
		return pid;
	}

	public void setPid(int pid) {
		this.pid = pid;
	}

	public String getPname() {
		return pname;
	}

	public void setPname(String pname) {
		this.pname = pname;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public Type getType() {
		return type;
	}

	public void setType(Type type) {
		this.type = type;
	}

	public int getPsize() {
		return psize;
	}

	public void setPsize(int psize) {
		this.psize = psize;
	}
	
	
}
