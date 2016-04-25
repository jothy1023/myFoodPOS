package dao.impl;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import dao.ProductDAO;
import db.MyHibernateSessionFactory;
import entity.Product;
import entity.Type;

public class ProductDAOImpl implements ProductDAO {

	private Transaction tx = null;
	private String hql = "";

	@Override
	public boolean createProduct(Product product) {
		try {
			Session session = MyHibernateSessionFactory.getSessionFactory()
					.getCurrentSession();
			// 开始事务
			tx = session.beginTransaction();
			session.save(product);
			System.out.println("新增Product：" + product.getPname() + "成功! 编号："
					+ product.getPid());
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
	public Product getProductById(int pid) {
		try {
			Session session = MyHibernateSessionFactory.getSessionFactory()
					.getCurrentSession();
			// 开始事务
			tx = session.beginTransaction();
			hql = "from Product where pid=" + pid;
			Product product = (Product) session.createQuery(hql).uniqueResult();
			// 判断是否查到food
			if (product != null) {
				System.out.println("查到Product：(" + product.getPid() + ") "
						+ product.getPname());
				return product;
			} else {
				System.out.println("查不到该Product！");
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
	public Product[] getAllProducts() {
		try {
			Session session = MyHibernateSessionFactory.getSessionFactory()
					.getCurrentSession();
			// 开始事务
			tx = session.beginTransaction();
			hql = "from Product where 1=1";
			Query query = session.createQuery(hql);
			List list = query.list();
			int listSize = list.size();
			// 判断是否查到food
			if (listSize > 0) {
				System.out.println("查到Product：");
				Product[] products = new Product[listSize];
				for (int i = 0; i < listSize; i++) {
					products[i] = (Product) list.get(i);
					System.out.println("(" + products[i].getPid() + ") "
							+ products[i].getPname());
				}
				// 事务要在返回之前commit
				tx.commit();
				return products;
			} else {
				System.out.println("暂无Product！");
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
	public Product deleteProductById(int pid) {
		try {
			Session session = MyHibernateSessionFactory.getSessionFactory()
					.getCurrentSession();
			// 开始事务
			tx = session.beginTransaction();
			Product product = (Product) session.get(Product.class, pid);
			session.delete(product);
			System.out.println("删除Product：(" + product.getPid() + ") "
					+ product.getPname() + "成功");
			// 事务要在返回之前commit
			tx.commit();
			return product;
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
	public boolean updateProduct(int pid, String pname, int price, int psize, Type type) {
		try {
			Session session = MyHibernateSessionFactory.getSessionFactory()
					.getCurrentSession();
			// 开始事务
			tx = session.beginTransaction();
			Product product = (Product) session.get(Product.class, pid);
			String oldFName = product.getPname();
			product.setPname(pname);
			product.setPrice(price);
			product.setPsize(psize);
			product.setType(type);
			session.update(product);
			System.out.println("修改Product Name：" + oldFName + "为"
					+ product.getPname() + "成功");
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

}
