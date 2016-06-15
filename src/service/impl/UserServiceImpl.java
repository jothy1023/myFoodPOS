package service.impl;

import dao.IUserDAO;
import dao.impl.UserDAOImpl;
import service.IUserService;
import entity.User;

public class UserServiceImpl implements IUserService {
	private IUserDAO userDAO = new UserDAOImpl();
	
//	实现直接（仅验证）的登录服务，适用于已有帐号的用户
	public User validateUser(String username, String password) {
		return userDAO.validateUser(username, password);
	}
	
	//实现(注册+验证)的登录服务，适用于初次注册的用户
	public User registerUser(User user) {
//		由于这项业务要经过注册、验证两个阶段，先后使用UserDAO接口的 两个方法
		userDAO.saveUser(user);
//		随后直接进行验证
		return userDAO.validateUser(user.getUsername(), user.getPassword());
	}

	public IUserDAO getUserDAO() {
		return userDAO;
	}

	public void setUserDAO(IUserDAO userDAO) {
		this.userDAO = userDAO;
	}

}
