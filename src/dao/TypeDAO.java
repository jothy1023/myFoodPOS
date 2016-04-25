package dao;

import java.util.List;

import entity.Type;

// 业务逻辑接口
public interface TypeDAO {

	// crud
	public boolean createType(Type type);
	public Type getTypeByTid(int tid);
	public Type[] getAllTypes();
	public boolean updateType(int tid, String tname);
	public Type deleteTypeById(int tid);
	
	public int getMaxTid();
}
