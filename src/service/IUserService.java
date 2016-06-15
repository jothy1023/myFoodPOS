package service;

import entity.User;

public interface IUserService {
	public User validateUser(String username,String password);
	public User registerUser(User user);
}
