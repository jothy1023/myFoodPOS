package dao.impl;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import dao.IAdminDAO;
import db.MyHibernateSessionFactory;
import entity.Adminstrator;

public class AdminDAOImpl implements IAdminDAO {

	public Adminstrator validateUser(String username, String password) {
		String hql = "from Adminstrator admin where admin.adminName=? and admin.password=?";
		Session session = MyHibernateSessionFactory.getSessionFactory().openSession();
		Transaction tx = session.beginTransaction();
		Query query = session.createQuery(hql);
		query.setParameter(0, username);
		query.setParameter(1, password);
		List list = query.list();
		if(list.size()!=0){
			Adminstrator user = (Adminstrator)list.get(0);
			tx = null;
			session.close();
			return user;
		}
		tx = null;
		session.close();
		return null;
	}

}
