package action;

import java.io.Console;

import service.TypeService;
import service.impl.TypeServiceImpl;
import com.opensymphony.xwork2.ModelDriven;
import entity.Type;

// 模型驱动的方式传递数据
public class TypeAction extends SuperAction implements ModelDriven<Type> {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	protected Type type = new Type();
	protected TypeService typeService = new TypeServiceImpl();

	// 新增产品，由service调用方法完成
	public String createType() throws Exception {
		if (typeService.createType(type)) {
			session.setAttribute("type", type);
			return "success";
		} else {
			return "fail";
		}
	}

	// 编辑产品，由service调用方法完成
	public String updateType() throws Exception {
		int tid = type.getTid();
		String tname = type.getTname();
		if (typeService.updateType(tid, tname)) {
			return "success";
		} else {
			return "fail";
		}
	}

	// 获取所有产品类别
	public String getAllTypes() throws Exception {
		Type[] types = typeService.getAllTypes();
		if (types != null) {
			session.setAttribute("types", types);
			return "success";
		} else {
			return "fail";
		}
	}
	
	// 获取指定产品类别
	public String getTypeById() throws Exception {
		int tid = type.getTid();
		if (typeService.getTypeById(tid) != null) {
			return "success";
		} else {
			return "fail";
		}
	}
	
	// 删除指定产品类别
	public String deleteTypeById() throws Exception {
		int tid = type.getTid();
		if (typeService.deleteTypeById(tid) != null) {
			return "success";
		} else {
			return "fail";
		}
	}
	
	@Override
	public Type getModel() {
		return this.type;
	}

}
