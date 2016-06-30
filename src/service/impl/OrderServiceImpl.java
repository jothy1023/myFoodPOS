package service.impl;

import java.util.List;

import dao.IOrderDAO;
import dao.impl.OrderDAOImpl;
import entity.Orderitem;
import entity.Orders;
import service.IOrderService;

public class OrderServiceImpl implements IOrderService {

	private  IOrderDAO orderDAO = new OrderDAOImpl();
	
	//orderDAO的setter方法
	public void setOrderDAO(IOrderDAO orderDAO){
		this.orderDAO = orderDAO;
	}
	
	//保存订单
	public Orders saveOrder(Orders order) {
		return orderDAO.saveOrder(order);
	}

	@Override
	public List<Orders> getAllOrders() {
		// TODO Auto-generated method stub
		return this.orderDAO.getAllOrders();
	}


}
