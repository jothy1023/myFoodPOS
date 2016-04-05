package service;

import entity.Product;

public interface ProductService {
	public boolean createProduct(Product product);
	public boolean updateProduct(int pid,String pname,int price,int typeId,int size);
}
