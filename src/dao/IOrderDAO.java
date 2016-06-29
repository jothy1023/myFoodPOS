package dao;

import entity.Orderitem;
import entity.Orders;

public interface IOrderDAO {
	public Orders saveOrder(Orders order);
}
