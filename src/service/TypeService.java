package service;

import entity.Type;

public interface TypeService {
	public boolean createType(Type type);
	public boolean updateType(int tid, String tname);
}
