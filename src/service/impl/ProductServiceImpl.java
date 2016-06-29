package service.impl;

import java.util.List;

import dao.ProductDAO;
import dao.impl.ProductDAOImpl;
import entity.Product;
import entity.Type;
import service.ProductService;

public class ProductServiceImpl implements ProductService {

	private ProductDAO productdao = new ProductDAOImpl();
	
	public ProductDAO getProductDAO(){
		return this.productdao;
	}
	
	public void setProductDAO(ProductDAO productdao) {
		this.productdao = productdao;
	}

	@Override
	public boolean createProduct(Product product) {
		boolean flag = this.productdao.createProduct(product);
//		Product pro = this.productdao.getProductById(product.getId());
//		System.out.println("b - " +pro.getType().getTname());
		return flag;
	}

	@Override
	public boolean updateProduct(int pid, String pname, int price, String psize, Type type) {
		return this.productdao.updateProduct(pid, pname, price, psize, type);
	}

	@Override
	public Product[] getAllProducts() {
		return this.productdao.getAllProducts();
	}

	@Override
	public List getProductsByType(int typeId) {
		return this.productdao.getProductsByType(typeId);
	}
	
	@Override
	public Product getProductById(int pid) {
		return this.productdao.getProductById(pid);
	}

	@Override
	public Product deleteProductById(int pid) {
		return this.productdao.deleteProductById(pid);
	}
}
