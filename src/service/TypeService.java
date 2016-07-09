package service;

import entity.Type;

public interface TypeService {
	public boolean createType(Type type);
	public boolean updateType(int tid, String tname);
	public Type[] getAllTypes(); 
	public Type getTypeById(int tid);
	public Type deleteTypeById(int tid);
}
