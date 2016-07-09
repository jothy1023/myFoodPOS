package action;

import java.util.List;
import java.util.Map;

import service.IUserService;
import service.impl.UserServiceImpl;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ModelDriven;

import entity.Type;
import entity.User;

public class UserAction extends SuperAction implements ModelDriven<User> {

	private static final long serialVersionUID = 1L;
	protected User user = new User();
	protected IUserService userService = new UserServiceImpl();
	
	public String getAllUsers() throws Exception{
		List users = userService.getAllUsers();
		session.setAttribute("users", users);
		return SUCCESS;
	}
	
	public String addUser() throws Exception{
		if(userService.addUser(user)){
			return SUCCESS;
		}else{
			return ERROR;
		}
		
	}
	
	public String updateUser() throws Exception{
		if(userService.updateUser(user)){
			return SUCCESS;
		}else{
			return ERROR;
		}
	}
	
	public String deleteUser() throws Exception{
		if(userService.deleteUser(user)){
			return SUCCESS;
		}else{
			return ERROR;
		}
	}
	
	public User getModel() {
		return this.user;
	}

}
