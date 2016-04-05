package action;

import service.ProductService;
import service.impl.ProductServiceImpl;

import com.opensymphony.xwork2.ModelDriven;
import entity.Product;

public class ProductAction extends SuperAction implements ModelDriven<Product> {
	Product product = new Product();
	ProductService productService = new ProductServiceImpl();
	
	public String createProduct(Product product){
		if(productService.createProduct(product))
			return "";
		else
			return "";
	}
	
	public String updateProduct(int pid,String pname,int price,int typeId,int size){
		return null;
	}
	
	public Product getModel() {
		return this.product;
	}

}
