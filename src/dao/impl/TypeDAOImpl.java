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

	private Transaction tx = null;
	private String hql = "";
	@Override
	public boolean createType(Type type) {
		try {
			Session session = MyHibernateSessionFactory.getSessionFactory()
					.getCurrentSession();
			// 开始事务
			tx = session.beginTransaction();
			session.save(type);
			System.out.println("新增Type："+type.getTname()+"成功! 编号："+type.getTid());
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
					.getCurrentSession();
			// 开始事务
			tx = session.beginTransaction();
			hql = "from Type where tid=" + tid;
			Type type = (Type)session.createQuery(hql).uniqueResult();
			// 判断是否查到food
			if (type != null) {
				System.out.println("查到Type：("+type.getTid()+") "+type.getTname());
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
					.getCurrentSession();
			// 开始事务
			tx = session.beginTransaction();
			Type type = (Type)session.get(Type.class, tid);
			String oldFName = type.getTname();
			type.setTname(tname);
			session.update(type);
			System.out.println("修改Type Name："+oldFName+"为"+type.getTname()+"成功");
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
	public boolean deleteType(int tid) {
		try {
			Session session = MyHibernateSessionFactory.getSessionFactory()
					.getCurrentSession();
			// 开始事务
			tx = session.beginTransaction();
			Type type = (Type)session.get(Type.class, tid);
			Scanner input = new Scanner(System.in);
			System.out.println("您确定要删除Type："+type.getTname()+" 吗?(y/n)");
			String confirm = input.next();
			if(confirm.equals("y")){
				session.delete(type);
				System.out.println("删除Type：("+type.getTid()+") "+type.getTname()+"成功");
			}else {
				System.out.println("撤销删除操作！");
			}
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

	public int getMaxTid() {
		try {
			Session session = MyHibernateSessionFactory.getSessionFactory()
					.getCurrentSession();
			// 开始事务
			tx = session.beginTransaction();
			// f为别名
			hql = "select max(t.tid) from Type t";
			Integer maxFid = (Integer)session.createQuery(hql).uniqueResult();
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
					.getCurrentSession();
			// 开始事务
			tx = session.beginTransaction();
			hql = "from Type where 1=1";
			Query query = session.createQuery(hql);
			List list = query.list();
			int listSize = list.size();
			// 判断是否查到food
			if (listSize > 0) {
				System.out.println("查到type：");
				Type[] types = new Type[listSize];
				for(int i = 0; i < listSize; i++){
					types[i] = (Type)list.get(i);
					System.out.println("("+types[i].getTid()+") "+types[i].getTname());
				}
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
