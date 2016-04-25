package entity;

import java.util.List;

// 产品类别
public class Type {

	private int tid;
	private String tname;
	private List<Product> products;
	
	public Type(){
		
	}

	// 构造方法
	public Type(int tid, String tname) {
//		super();
		this.tid = tid;
		this.tname = tname;
	}


	public int getTid() {
		return tid;
	}

	public void setTid(int tid) {
		this.tid = tid;
	}

	public String getTname() {
		return tname;
	}

	public void setTname(String tname) {
		this.tname = tname;
	}
	
	public int addProduct(Product product) {
		products.add(product);
		return products.size();
	}

	public List<Product> getProducts() {
		return products;
	}

	public void setProducts(List<Product> products) {
		this.products = products;
	}
	
}
