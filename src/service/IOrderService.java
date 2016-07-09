package service;

import java.util.List;

import entity.Orderitem;
import entity.Orders;

public interface IOrderService {
	public Orders saveOrder(Orders order);
	public List<Orders> getAllOrders();
	
	public boolean deleteOrder(Orders order);
}
