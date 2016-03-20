package service;

import entity.Food;

// 业务逻辑接口
public interface FoodDAO {

	// crud
	public boolean createFood(Food food);
	public Food getFoodByFid(int fid);
	public Food[] getFoodAll();
	public boolean updateFood(int fid, String fname);
	public boolean deleteFood(int fid);
	
	public int getMaxFid();
}
