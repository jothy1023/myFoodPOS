package action;

import java.util.List;
import java.util.Map;

import service.IOrderService;
import service.impl.OrderServiceImpl;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

import entity.Orders;

public class OrderAction extends ActionSupport implements ModelDriven<Orders> {
	
	protected Orders orders = new Orders();
	protected IOrderService orderService = new OrderServiceImpl();
	
	public String getAllOrders(){
		List list = orderService.getAllOrders();
		Map session = (Map)ActionContext.getContext().getSession();
		session.put("orders", list);
		return SUCCESS;
	}
	
	public String deleteOrder(){
		orderService.deleteOrder(orders);
		return SUCCESS;
	}
	public Orders getModel() {
		return orders;
	}

}
