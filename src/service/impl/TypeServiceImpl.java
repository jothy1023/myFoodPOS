package service.impl;

import dao.TypeDAO;
import dao.impl.TypeDAOImpl;
import entity.Type;
import service.TypeService;

public class TypeServiceImpl implements TypeService {

	private TypeDAO typedao = new TypeDAOImpl();
	
	public TypeDAO getTypedao() {
		return typedao;
	}

	public void setTypedao(TypeDAO typedao) {
		this.typedao = typedao;
	}

	@Override
	public boolean createType(Type type) {
		return this.typedao.createType(type);
	}

	@Override
	public boolean updateType(int tid, String tname) {
		return this.typedao.updateType(tid, tname);
	}

	@Override
	public Type[] getAllTypes() {
		return this.typedao.getAllTypes();
	}

	@Override
	public Type getTypeById(int tid) {
		return this.typedao.getTypeByTid(tid);
	}

}
