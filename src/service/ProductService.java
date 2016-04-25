package service;

import entity.Product;
import entity.Type;

public interface ProductService {
	
	public boolean createProduct(Product product);
	public boolean updateProduct(int pid, String pname, int price, int psize, Type type);
	public Product[] getAllProducts(); 
	public Product getProductById(int pid);
	public Product deleteProductById(int pid);
}
