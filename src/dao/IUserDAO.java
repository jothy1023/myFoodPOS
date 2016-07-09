package dao;

import java.util.List;

import entity.User;

public interface IUserDAO {
	public User validateUser(String username,String password);
	public void saveUser(User user);
	public List getAllUsers();
	public boolean updateUser(User user);
	public boolean deleteUser(User user);
}	
