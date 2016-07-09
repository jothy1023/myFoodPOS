package dao;

import entity.Adminstrator;

public interface IAdminDAO {
	public Adminstrator validateUser(String username,String password);
}
