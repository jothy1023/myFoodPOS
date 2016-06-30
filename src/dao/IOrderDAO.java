package dao;

import java.util.List;

import entity.Orders;

public interface IOrderDAO {
	public Orders saveOrder(Orders order);
	public List<Orders> getAllOrders();
}
