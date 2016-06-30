package dao.impl;

import java.util.List;

import org.hibernate.Query;
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

	@Override
	public List<Orders> getAllOrders() {
		Session session = MyHibernateSessionFactory.getSessionFactory().openSession();
		Transaction tx = session.beginTransaction();
		String hql = "from Orders where 1=1";
		Query query = session.createQuery(hql);
		List<Orders> orders = query.list();
		if(orders == null) {
			return null;
		}
		for(int i = 0; i < orders.size(); i++) {
			System.out.println(orders.get(i));
		}
		return orders;
	}

}
