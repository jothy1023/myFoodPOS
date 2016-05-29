package dao.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.hibernate.Hibernate;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import com.opensymphony.xwork2.ActionContext;


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
					+ product.getId());
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
	
	//通过产品Id获取产品
	@Override
	public Product getProductById(int pid) {
		try {
			Session session = MyHibernateSessionFactory.getSessionFactory()
					.getCurrentSession();
			// 开始事务
			tx = session.beginTransaction();
			hql = "from Product where id=" + pid;
			Product product = (Product) session.createQuery(hql).uniqueResult();
			// 判断是否查到food
			if (product != null) {
				System.out.println("查到Product：(" + product.getId() + ") "
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
	
	//获取同一类型的所有产品
	public List getProductsByType(int typeId) {
		System.out.println("ssjjkhagfk");
		typeId=1;
		Session session = MyHibernateSessionFactory.getSessionFactory().getCurrentSession();
		tx = session.beginTransaction();
		hql = "from Product p where p.type.tid=" + typeId;
		Query query = session.createQuery(hql);
		List products = query.list();
		if(products.size()>0){
			Map request = (Map)ActionContext.getContext().get("request");
			request.put("products", products);
			session.close();
			return products;
		}
		session.close();
		return null;
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
					System.out.println("(" + products[i].getId() + ") "
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
			System.out.println("删除Product：(" + product.getId() + ") "
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
	public boolean updateProduct(int pid, String pname, int price, String psize, Type type) {
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
