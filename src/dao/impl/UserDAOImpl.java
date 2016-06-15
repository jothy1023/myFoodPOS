package dao.impl;
import dao.IUserDAO;
import db.MyHibernateSessionFactory;
import entity.User;

import org.hibernate.Hibernate;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import java.util.*;

public class UserDAOImpl implements IUserDAO {
	//验证用户
	public User validateUser(String username, String password) {
		String sql = "from User u where u.username=? and u.password=?";
		Session session = MyHibernateSessionFactory.getSessionFactory().getCurrentSession();
		Transaction tx = session.beginTransaction();
		Query query = session.createQuery(sql);
		query.setParameter(0, username);
		query.setParameter(1, password);
		List list = query.list();
		if(list.size()!=0){
			User user = (User)list.get(0);
			tx = null;
			session.close();
			return user;
		}
		tx = null;
		session.close();
		return null;
	}

	//新建用户
	public void saveUser(User user) {
		Session session = MyHibernateSessionFactory.getSessionFactory().getCurrentSession();
		Transaction tx = session.beginTransaction();
		session.save(user);
		tx.commit();
		session.close();
	}

}
