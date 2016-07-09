package action;

import java.util.Map;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

import service.IAdminService;
import service.impl.AdminServiceImpl;
import entity.Adminstrator;
import entity.User;

public class AdminAction extends ActionSupport implements ModelDriven<Adminstrator>  {
	protected Adminstrator admin = new Adminstrator();
	protected IAdminService adminService = new AdminServiceImpl();
	
	public String execute() throws Exception{
		boolean validated = false;
		Adminstrator u = adminService.validateUser(admin.getAdminName(), admin.getPassword());
		if(u!=null){
//			标识为true表示验证成功通过
			validated = true;
		}
		if(validated){
			//验证成功返回"success"
			Map session = ActionContext.getContext().getSession();
			session.put("admin", u);
			return SUCCESS;
		}else{
			//验证失败返回"error"
			return ERROR;
		}
	}

	//注销
	public String logout() throws Exception{
		Map session = ActionContext.getContext().getSession();
		session.remove("admin");
		return SUCCESS;
	}
	
	public Adminstrator getModel() {
		return admin;
	}
}
