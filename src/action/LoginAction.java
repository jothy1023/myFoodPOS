package action;

import java.util.Map;

import service.IUserService;
import service.impl.UserServiceImpl;
import entity.User;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

public class LoginAction extends ActionSupport implements ModelDriven<User> {
	private User user = new User();
	protected IUserService userService = new UserServiceImpl();
	public String register(){
		User u = new User(user.getUsername(),user.getPassword());
		if(userService.registerUser(u)!=null){
			Map session = ActionContext.getContext().getSession();
			session.put("user", u);
			return SUCCESS;
		}
		return ERROR;
	}
	
	public String execute() throws Exception{
		boolean validated = false;
		User u = userService.validateUser(user.getUsername(), user.getPassword());
		if(u!=null){
//			标识为true表示验证成功通过
			validated = true;
		}
		if(validated){
			//验证成功返回"success"
			Map session = ActionContext.getContext().getSession();
			session.put("user", u);
			return SUCCESS;
		}else{
			//验证失败返回"error"
			return ERROR;
		}
	}


	public IUserService getUserService() {
		return userService;
	}

	public void setUserService(IUserService userService) {
		this.userService = userService;
	}

	@Override
	public User getModel() {
		return this.user;
	}	
}
