package dao;

import entity.Orders;

public interface IOrderDAO {
	public Orders saveOrder(Orders order);
}
