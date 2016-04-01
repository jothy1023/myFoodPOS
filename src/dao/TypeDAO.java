package dao;

import entity.Type;

// 业务逻辑接口
public interface TypeDAO {

	// crud
	public boolean createType(Type type);
	public Type getTypeByTid(int tid);
	public Type[] getTypeAll();
	public boolean updateType(int tid, String tname);
	public boolean deleteType(int tid);
	
	public int getMaxTid();
}
