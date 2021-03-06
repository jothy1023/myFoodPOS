package dao.impl;

import java.util.List;
import java.util.Scanner;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import dao.TypeDAO;
import db.MyHibernateSessionFactory;
import entity.Type;

public class TypeDAOImpl implements TypeDAO {

	private Session session;
	private Transaction tx = null;
	private String hql = "";

	@Override
	public boolean createType(Type type) {
		try {
			Session session = MyHibernateSessionFactory.getSessionFactory()
					.openSession();
			// 开始事务
			tx = session.beginTransaction();
			session.save(type);
			// 事务要在返回之前commit
			tx.commit();
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		} finally {
			if (tx != null) {
				tx = null;
			}
		}
	}

	@Override
	public Type getTypeByTid(int tid) {
		try {
			Session session = MyHibernateSessionFactory.getSessionFactory()
					.openSession();
			// 开始事务
			tx = session.beginTransaction();
			hql = "from Type where tid=" + tid;
			Type type = (Type) session.createQuery(hql).uniqueResult();
			// 判断是否查到food
			if (type != null) {
				return type;
			} else {
				System.out.println("查不到该Type！");
				return null;
			}
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		} finally {
			if (tx != null) {
				tx = null;
			}
		}
	}

	@Override
	public boolean updateType(int tid, String tname) {
		try {
			Session session = MyHibernateSessionFactory.getSessionFactory()
					.openSession();
			// 开始事务
			tx = session.beginTransaction();
			Type type = (Type) session.get(Type.class, tid);
			String oldFName = type.getTname();
			type.setTname(tname);
			session.update(type);
			// 事务要在返回之前commit
			tx.commit();
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		} finally {
			if (tx != null) {
				tx = null;
			}
		}
	}

	@Override
	public Type deleteTypeById(int tid) {
		try {
			Session session = MyHibernateSessionFactory.getSessionFactory()
					.openSession();
			// 开始事务
			tx = session.beginTransaction();
			Type type = (Type) session.get(Type.class, tid);
			session.delete(type);
			// 事务要在返回之前commit
			tx.commit();
			return type;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		} finally {
			if (tx != null) {
				tx = null;
			}
		}
	}

	public int getMaxTid() {
		try {
			Session session = MyHibernateSessionFactory.getSessionFactory()
					.openSession();
			// 开始事务
			tx = session.beginTransaction();
			// f为别名
			hql = "select max(t.tid) from Type t";
			Integer maxFid = (Integer) session.createQuery(hql).uniqueResult();
			// 事务要在返回之前commit
			tx.commit();
			return maxFid;
		} catch (Exception e) {
			e.printStackTrace();
			return 0;
		} finally {
			if (tx != null) {
				tx = null;
			}
		}
	}

	public Type[] getAllTypes() {
		try {
			Session session = MyHibernateSessionFactory.getSessionFactory()
					.openSession();
			// 开始事务
			tx = session.beginTransaction();
			hql = "from Type where 1=1";
			Query query = session.createQuery(hql);
			List list = query.list();
			int listSize = list.size();
			// 判断是否查到food
			if (listSize > 0) {
				Type[] types = new Type[listSize];
				for (int i = 0; i < listSize; i++) {
					types[i] = (Type) list.get(i);
					System.out.println(i+". "+types[i].getTname());
				}
				// 事务要在返回之前commit
				tx.commit();
				return types;
			} else {
				System.out.println("暂无Type！");
				return null;
			}
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		} finally {
			if (tx != null) {
				tx = null;
			}
		}
	}

}
