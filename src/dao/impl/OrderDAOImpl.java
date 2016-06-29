package dao.impl;

import org.hibernate.Session;
import org.hibernate.Transaction;


import dao.IOrderDAO;
import db.MyHibernateSessionFactory;
import entity.Orderitem;
import entity.Orders;

public class OrderDAOImpl implements IOrderDAO {

//	保存订单
	public Orders saveOrder(Orders order) {
		//保存点餐信息
		Session session = MyHibernateSessionFactory.getSessionFactory().getCurrentSession();
		Transaction tx = session.beginTransaction();
		session.save(order);
		tx.commit();
		return order;
	}

}
