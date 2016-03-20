package entity;

// 食品类
public class Food {

	private int fid;
	private String fname;
	
	public Food(){
		
	}

	// 构造方法
	public Food(int fid, String fname) {
//		super();
		this.fid = fid;
		this.fname = fname;
	}


	public int getFid() {
		return fid;
	}

	public void setFid(int fid) {
		this.fid = fid;
	}

	public String getFname() {
		return fname;
	}

	public void setFname(String fname) {
		this.fname = fname;
	}
	
	
}
