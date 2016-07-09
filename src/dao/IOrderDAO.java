package dao;

import java.util.List;

import entity.Orders;

public interface IOrderDAO {
	public Orders saveOrder(Orders order);
	public Orders getOrderById(int orderId);
	public List<Orders> getAllOrders();
	public boolean deleteOrder(Orders order);
}
