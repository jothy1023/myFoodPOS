package action;

import service.ProductService;
import service.impl.ProductServiceImpl;

import com.opensymphony.xwork2.ModelDriven;

import entity.Product;
import entity.Type;

public class ProductAction extends SuperAction implements ModelDriven<Product> {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	Product product = new Product();
	ProductService productService = new ProductServiceImpl();
	
	// 新增产品，由service调用方法完成
		public String createProduct() throws Exception {
			if (productService.createProduct(product)) {
				session.setAttribute("product", product);
				return "success";
			} else {
				return "fail";
			}
		}

		// 编辑产品，由service调用方法完成
		public String updateProduct() throws Exception {
			int tid = product.getPid();
			String tname = product.getPname();
			int price = product.getPrice();
			Type type = product.getType();
			int psize = product.getPsize();
			if (productService.updateProduct(tid, tname, price, psize, type)) {
				return "success";
			} else {
				return "fail";
			}
		}

		// 获取所有产品类别
		public String getAllProducts() throws Exception {
			Product[] products = productService.getAllProducts();
			if (products != null) {
				session.setAttribute("products", products);
				return "success";
			} else {
				return "fail";
			}
		}
		
		// 获取指定产品类别
		public String getProductById() throws Exception {
			int tid = product.getPid();
			if (productService.getProductById(tid) != null) {
				return "success";
			} else {
				return "fail";
			}
		}
		
		// 删除指定产品类别
		public String deleteProductById() throws Exception {
			int tid = product.getPid();
			if (productService.deleteProductById(tid) != null) {
				return "success";
			} else {
				return "fail";
			}
		}
		
		@Override
		public Product getModel() {
			return this.product;
		}

}
