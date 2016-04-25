package dao;

import entity.Product;
import entity.Type;

public interface ProductDAO {

	// crud
	public boolean createProduct(Product Product);
	public Product getProductById(int pid);
	public Product[] getAllProducts();
	public boolean updateProduct(int pid, String pname, int price, int psize, Type type);
	public Product deleteProductById(int pid);
	
}
