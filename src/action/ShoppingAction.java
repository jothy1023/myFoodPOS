package action;

import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.apache.catalina.connector.Request;

import model.AliPay;
import model.Cart;
import model.CashPay;
import model.Payment;
import service.IOrderService;
import service.ProductService;
import service.impl.OrderServiceImpl;
import service.impl.ProductServiceImpl;

import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.opensymphony.xwork2.inject.Context;
import com.sun.accessibility.internal.resources.accessibility;

import dao.IOrderDAO;
import entity.Orderitem;
import entity.Orders;
import entity.Product;
import entity.Type;
import entity.User;

public class ShoppingAction extends SuperAction implements ModelDriven<Product>{
	private ProductService productSerivce = new ProductServiceImpl();
	private IOrderService orderService = new OrderServiceImpl();
	private Product product = new Product();
	private Type type = new Type();
	private Payment payment;
	private int quantity;
	
	//添加到列表
	public String addToCart() throws Exception{
//		int productId = product.getId();
		int productId = Integer.parseInt(request.getParameter("id"));
		System.out.println("id=" + productId);
		Product products = productSerivce.getProductById(productId);
		Orderitem orderItem = new Orderitem();
		orderItem.setProduct(products);
		orderItem.setQuantity(1);
		Map session = ActionContext.getContext().getSession();
		Cart cart = (Cart)session.get("cart");
		if(cart == null){
			cart = new Cart();
		}
		cart.addProduct(productId, orderItem);
		session.put("cart", cart);
		return SUCCESS;
	}
	
	//减少商品数量
	public String deleteQuantity() throws Exception{
		int productId = product.getId();
		Map session = ActionContext.getContext().getSession();
		Cart cart = (Cart)session.get("cart");
		cart.updateCart(productId);
		session.put("cart", cart);
		return SUCCESS;
	}
	
	//删除购物车中某项食物
	public String deleteItem() throws Exception{
		int productId = product.getId();
		Map session = ActionContext.getContext().getSession();
		Cart cart = (Cart)session.get("cart");
		cart.deleteProduct(productId);
		session.put("cart", cart);
		return SUCCESS;
	}
	
	public int getQuantity() {
		return quantity;
	}


	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	//列出某种类型的产品
	public String browseProduct() throws Exception{
		int typeId = type.getTid();
		List products = productSerivce.getProductsByType(typeId);
		return SUCCESS;
	}
	
	//结账下订单
	public String checkout() throws Exception{
		Map session = ActionContext.getContext().getSession();
		User user = (User)session.get("user");
		Cart cart = (Cart)session.get("cart");
		int cashReceived = cart.getTotal();
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
		request.put("payFlag", true);
		request.put("amount", cashReceived);
		session.put("cart", null);
		return SUCCESS;
	}

	public String makeAliPayment(){
		Map session = ActionContext.getContext().getSession();
		int cashTendered = Integer.parseInt(request.getParameter("amount"));
		payment = new AliPay(cashTendered);
		Map request =(Map)ActionContext.getContext().get("request");
		request.put("payment", 0);
		return SUCCESS;
	}
	public String makeCashPayment(){
		Map session = ActionContext.getContext().getSession();
		int cashTendered = Integer.parseInt(request.getParameter("amount"));
		int cashReceived = Integer.parseInt(request.getParameter("cashReceived"));
		payment = new CashPay(cashTendered, cashReceived);
		Map request =(Map)ActionContext.getContext().get("request");
		request.put("payment", payment.getChange());
		System.out.println(payment.getChange()+"@");
		return SUCCESS;
	}
	
	public IOrderService getOrderService() {
		return orderService;
	}

	public void setOrderService(IOrderService orderService) {
		this.orderService = orderService;
	}

	@Override
	public Product getModel() {
		return this.product;
	}
	
	
}
