package dao.impl;

import org.hibernate.Session;
import org.hibernate.Transaction;

import dao.IOrderDAO;
import db.MyHibernateSessionFactory;
import entity.Orders;

public class OrderDAOImpl implements IOrderDAO {

	@Override
	public Orders saveOrder(Orders order) {
		//保存点餐信息
		Session session = MyHibernateSessionFactory.getSessionFactory().getCurrentSession();
		Transaction tx = session.beginTransaction();
		session.save(order);
		tx.commit();
		session.close();
		return order;
	}

}
