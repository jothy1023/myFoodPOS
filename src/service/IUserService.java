package service;

import java.util.List;

import entity.User;

public interface IUserService {
	public User validateUser(String username,String password);
	public User registerUser(User user);
	public List getAllUsers();
	public boolean addUser(User user);
	public boolean updateUser(User user);
	public boolean deleteUser(User user);
}
