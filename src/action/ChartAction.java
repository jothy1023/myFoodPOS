package action;

import java.util.List;

import org.junit.Test;

import com.opensymphony.xwork2.ModelDriven;

import entity.Orders;
import entity.Product;
import service.IOrderService;
import service.ProductService;
import service.impl.OrderServiceImpl;
import service.impl.ProductServiceImpl;

public class ChartAction extends SuperAction {
	
	
	@Test
	public void getData() {
		IOrderService orderService = new OrderServiceImpl();
		ProductService productService = new ProductServiceImpl();
		Product[] pros = productService.getAllProducts();
		List<Orders> orders = orderService.getAllOrders();
		session.setAttribute("proNum", pros.length);
		session.setAttribute("ordersNum", orders.size());
	}

}
