package entity;

public class Product {
	private int pid;
	private String pname;
	private int price;
	private int typeId;
	private int size;
	
	public Product(){}
	
	public Product(int pid,String pname,int price,int typeId,int size){
		this.pid = pid;
		this.pname = pname;
		this.price = price;
		this.typeId = typeId;
		this.size = size;
	}
	
	public int getPid(){
		return pid;
	}
	public void setPid(int pid){
		this.pid = pid;
	}
	public String getPname(){
		return pname;
	}
	public void setPname(String pname){
		this.pname = pname;
	}
	public int getPrice(){
		return price;
	}
	public void setPrice(int price){
		this.price = price;
	}
	public int getTypeId(){
		return typeId;
	}
	public void setTypeId(int typeId){
		this.typeId = typeId;
	}
	public int getSize(){
		return size;
	}
	public void setSize(int size){
		this.size = size;
	}
}
