package service.impl;

import com.sun.org.apache.bcel.internal.generic.NEW;

import dao.IAdminDAO;
import dao.impl.AdminDAOImpl;
import entity.Adminstrator;
import service.IAdminService;

public class AdminServiceImpl implements IAdminService {
	
	protected IAdminDAO adminDAO = new AdminDAOImpl();
	
	//登录
	public Adminstrator validateUser(String username, String password) {
		return adminDAO.validateUser(username, password);
	}

}
