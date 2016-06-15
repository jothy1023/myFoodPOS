package dao;

import entity.User;

public interface IUserDAO {
	public User validateUser(String username,String password);
	public void saveUser(User user);
}	
