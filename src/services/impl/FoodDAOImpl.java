package services.impl;

import java.util.List;
import java.util.Scanner;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;
import db.MyHibernateSessionFactory;
import entity.Food;
import service.FoodDAO;

public class FoodDAOImpl implements FoodDAO {

	private Transaction tx = null;
	private String hql = "";
	@Override
	public boolean createFood(Food food) {
		try {
			Session session = MyHibernateSessionFactory.getSessionFactory()
					.getCurrentSession();
			// 开始事务
			tx = session.beginTransaction();
			session.save(food);
			System.out.println("新增Food："+food.getFname()+"成功! 编号："+food.getFid());
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
	public Food getFoodByFid(int fid) {
		try {
			Session session = MyHibernateSessionFactory.getSessionFactory()
					.getCurrentSession();
			// 开始事务
			tx = session.beginTransaction();
			hql = "from Food where fid=" + fid;
			Food food = (Food)session.createQuery(hql).uniqueResult();
			// 提交事务（返回之前提交）
			tx.commit();
			// 判断是否查到food
			if (food != null) {
				System.out.println("查到Food：("+food.getFid()+") "+food.getFname());
				return food;
			} else {
				System.out.println("查不到该Food！");
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
	public boolean updateFood(int fid, String fname) {
		try {
			Session session = MyHibernateSessionFactory.getSessionFactory()
					.getCurrentSession();
			// 开始事务
			tx = session.beginTransaction();
			Food food = (Food)session.get(Food.class, fid);
			String oldFName = food.getFname();
			food.setFname(fname);
			session.update(food);
			System.out.println("修改Food Name："+oldFName+"为"+food.getFname()+"成功");
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
	public boolean deleteFood(int fid) {
		try {
			Session session = MyHibernateSessionFactory.getSessionFactory()
					.getCurrentSession();
			// 开始事务
			tx = session.beginTransaction();
			Food food = (Food)session.get(Food.class, fid);
			Scanner input = new Scanner(System.in);
			System.out.println("您确定要删除Food："+food.getFname()+" 吗?(y/n)");
			String confirm = input.next();
			if(confirm.equals("y")){
				session.delete(food);
				System.out.println("删除Food：("+food.getFid()+") "+food.getFname()+"成功");
			}else {
				System.out.println("撤销删除操作！");
			}
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
	public int getMaxFid() {
		try {
			Session session = MyHibernateSessionFactory.getSessionFactory()
					.getCurrentSession();
			// 开始事务
			tx = session.beginTransaction();
			// f为别名
			hql = "select max(f.fid) from Food f";
			Integer maxFid = (Integer)session.createQuery(hql).uniqueResult();
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

	@Override
	public Food[] getFoodAll() {
		try {
			Session session = MyHibernateSessionFactory.getSessionFactory()
					.getCurrentSession();
			// 开始事务
			tx = session.beginTransaction();
			hql = "from Food where 1=1";
			Query query = session.createQuery(hql);
			List list = query.list();
			int listSize = list.size();
			// 提交事务（返回之前提交）
			tx.commit();
			// 判断是否查到food
			if (listSize > 0) {
				System.out.println("查到food：");
				Food[] foods = new Food[listSize];
				for(int i = 0; i < listSize; i++){
					foods[i] = (Food)list.get(i);
					System.out.println("("+foods[i].getFid()+") "+foods[i].getFname());
				}
				return foods;
			} else {
				System.out.println("暂无Food！");
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
