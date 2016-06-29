package service;

import entity.Orderitem;
import entity.Orders;

public interface IOrderService {
	public Orders saveOrder(Orders order);
}
