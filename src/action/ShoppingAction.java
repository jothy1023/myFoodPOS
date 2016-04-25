package action;

import java.util.Date;
import java.util.Iterator;
import java.util.Map;

import service.IOrderService;
import service.impl.OrderServiceImpl;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

import dao.IOrderDAO;

import entity.Cart;
import entity.Orderitem;
import entity.Orders;

public class ShoppingAction extends ActionSupport{
	private int quantity;
	private Integer productId;
	private ProductSerivce productSerivce;
	private IOrderService orderService;
	
	//添加到列表
	public String addToCart() throws Exception{
		Product product = productSerivce.getProductByID(productId);
		Orderitem orderItem = new Orderitem();
		orderItem.setProduct(product);
		orderItem.setQuantity(quantity);
		Map session = ActionContext.getContext().getSession();
		Cart cart = (Cart)session.get("cart");
		if(cart == null){
			cart = new Cart();
		}
		cart.addProduct(productId, orderItem);
		session.put("cart", cart);
		return SUCCESS;
	}
	
	//更新购物车
	public String updateCart() throws Exception{
		Map session = ActionContext.getContext().getSession();
		Cart cart = (Cart)session.get("cart");
		cart.updateCart(productId,quantity);
		session.put("cart", cart);
		return SUCCESS;
	}
	
	//结账下订单
	public String checkout() throws Exception{
		Map session = ActionContext.getContext().getSession();
		User user = (User)session.get("user");
		Cart cart = (Cart)session.get("cart");
		if(user == null || cart == null)
			return ActionSupport.ERROR;
		Orders order = new Orders();
		order.setOrderDate(new Date());
		order.setUser(user);
		for(Iterator it = cart.getItems().values().iterator();it.hasNext();){
			Orderitem orderitem = (Orderitem)it.next();
			orderitem.setOrders(order);
			order.getOrderitems().add(orderitem);
		}
		orderService.saveOrder(order);
		Map request =(Map)ActionContext.getContext().get("request");
		request.put("order", order);
		return SUCCESS;
	}

	public IOrderService getOrderService() {
		return orderService;
	}

	public void setOrderService(IOrderService orderService) {
		this.orderService = orderService;
	}
	
	
}
