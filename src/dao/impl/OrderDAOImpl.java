package dao.impl;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;




import dao.IOrderDAO;
import db.MyHibernateSessionFactory;
import entity.Orderitem;
import entity.Orders;
import entity.User;

public class OrderDAOImpl implements IOrderDAO {

//	保存订单
	public Orders saveOrder(Orders order) {
		//保存点餐信息
		Session session = MyHibernateSessionFactory.getSessionFactory().openSession();
		Transaction tx = session.beginTransaction();
		session.save(order);
		tx.commit();
		return order;
	}

	//获取所有订单
	public List getAllOrders() {
		Session session = MyHibernateSessionFactory.getSessionFactory().openSession();
		Transaction tx = session.beginTransaction();
		String hql = "from Orders where 1=1";
		Query query = session.createQuery(hql);
		List orders = query.list();
		if(orders.size() == 0) {
			return null;
		}
		return orders;
	}

	public boolean deleteOrder(Orders order) {
		Orders od = getOrderById(order.getOrderId());
		if(od!=null){
			Session session = MyHibernateSessionFactory.getSessionFactory().openSession();
			Transaction tx = session.beginTransaction();
			Orders orders= (Orders)session.get(Orders.class, order.getOrderId());
			session.delete(orders);
			tx.commit();
			if(tx != null) tx = null;
			return true;
		}else{
			return false;
		}
		
	}

	public Orders getOrderById(int orderId) {
		Session session = MyHibernateSessionFactory.getSessionFactory().openSession();
		Transaction tx = session.beginTransaction();
		String hql = "from Orders o where o.orderId=?";
		Query query = session.createQuery(hql);
		query.setParameter(0, orderId);
		List orders = query.list();
		if(orders.size() > 0) {
			return (Orders)orders.get(0);
		}else{
			return null;
		}
	}

}
