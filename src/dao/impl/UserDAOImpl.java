package dao.impl;
import dao.IUserDAO;
import db.MyHibernateSessionFactory;
import entity.User;

import org.hibernate.Hibernate;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import com.mysql.fabric.xmlrpc.base.Array;

import java.util.*;

public class UserDAOImpl implements IUserDAO {
	//验证用户
	public User validateUser(String username, String password) {
		String sql = "from User u where u.username=? and u.password=?";
		Session session = MyHibernateSessionFactory.getSessionFactory().openSession();
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
		Session session = MyHibernateSessionFactory.getSessionFactory().openSession();
		Transaction tx = session.beginTransaction();
		session.save(user);
		tx.commit();
//		session.close();
	}
	
	//获取所有用户列表
	public List getAllUsers(){
		Session session = MyHibernateSessionFactory.getSessionFactory().openSession();
		Transaction tx = session.beginTransaction();
		String sql = "from User where 1=1";
		Query query = session.createQuery(sql);
		List list = query.list();
		if(list.size()!=0){
			tx = null;
			session.close();
			return list;
		}else{
			return null;
		}
	}

	public User getUserByUsername(String username){
		Session session = MyHibernateSessionFactory.getSessionFactory().openSession();
		Transaction tx = session.beginTransaction();
		String hql = "from User u where u.username=?";
		Query query = session.createQuery(hql);
		query.setParameter(0,username);
		List list = query.list();
		if(list.size()>0){
			User user = (User)list.get(0);
			if(tx != null) tx = null;
			session.close();
			return user;
		}else{
			return null;
		}
	}
	public User getUserByUserid(int userid){
		Session session = MyHibernateSessionFactory.getSessionFactory().openSession();
		Transaction tx = session.beginTransaction();
		String hql = "from User u where u.userid=?";
		Query query = session.createQuery(hql);
		query.setParameter(0,userid);
		List list = query.list();
		if(list.size()>0){
			User user = (User)list.get(0);
			if(tx != null) tx = null;
			session.close();
			return user;
		}else{
			return null;
		}
	}

	//修改用户信息
	public boolean updateUser(User user) {
		User usr = getUserByUserid(user.getUserid());
		if(usr!=null){
			usr.setAge(user.getAge());
			usr.setCatagory(user.getCatagory());
			usr.setSex(user.getSex());
			usr.setUsername(user.getUsername());
			Session session = MyHibernateSessionFactory.getSessionFactory().openSession();
			Transaction tx = session.beginTransaction();
			session.update(usr);
			tx.commit();
			return true;
		}else{
			return false;
		}
	}
	
	public boolean deleteUser(User user){
		if(getUserByUsername(user.getUsername())!=null){
			Session session = MyHibernateSessionFactory.getSessionFactory().openSession();
			Transaction tx = session.beginTransaction();
			User usr = (User)session.get(User.class, user.getUserid());
			session.delete(usr);
			tx.commit();
			if(tx != null) tx = null;
			return true;
		}else{
			return false;
		}
	}

}
