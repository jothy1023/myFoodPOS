package action;

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
			return "type_detail";
		} else {
			return "type_main";
		}
	}

	// 编辑产品，由service调用方法完成
	public String updateType() throws Exception {
		int tid = type.getTid();
		String tname = type.getTname();
		if (typeService.updateType(tid, tname)) {
			return "type_detail";
		} else {
			return "type_main";
		}
	}

	@Override
	public Type getModel() {
		return this.type;
	}

}
