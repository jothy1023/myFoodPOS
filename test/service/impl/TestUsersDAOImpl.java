package service.impl;

import junit.framework.Assert;
import org.junit.Test;

import dao.UsersDAO;
import dao.impl.UsersDAOImpl;
import entity.Users;

public class TestUsersDAOImpl {

	@Test
	public void testUsersLogin(){
		Users user = new Users(1, "lin", "123456");
		UsersDAO udao = new UsersDAOImpl();
		// 断言
		Assert.assertEquals(true, udao.userslogin(user));
	}
}
