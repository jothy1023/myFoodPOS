package service;

import java.util.List;

import entity.Product;
import entity.Type;



public interface ProductService {
	
	public boolean createProduct(Product product);
	public boolean updateProduct(int pid, String pname, int price, String psize, Type type);
	public Product[] getAllProducts(); 
	public Product getProductById(int pid);
	public Product deleteProductById(int pid);
	public List getProductsByType(int typeId);
}
