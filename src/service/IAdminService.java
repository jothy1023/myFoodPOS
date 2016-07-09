package service;

import entity.Adminstrator;

public interface IAdminService {
	public Adminstrator validateUser(String username, String password);
}
