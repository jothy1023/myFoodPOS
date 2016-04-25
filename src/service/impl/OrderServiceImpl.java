package service.impl;

import dao.IOrderDAO;
import entity.Orders;
import service.IOrderService;

public class OrderServiceImpl implements IOrderService {

	private  IOrderDAO orderDAO;
	
	//orderDAO的setter方法
	public void setOrderDAO(IOrderDAO orderDAO){
		this.orderDAO = orderDAO;
	}
	@Override
	//保存点餐信息
	public Orders saveOrder(Orders order) {
		return orderDAO.saveOrder(order);
	}

}
