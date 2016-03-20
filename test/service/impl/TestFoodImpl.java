package service.impl;

import java.util.Scanner;

import junit.framework.Assert;

import org.junit.Test;

import entity.Food;
import service.FoodDAO;
import services.impl.FoodDAOImpl;

public class TestFoodImpl {

	private FoodDAO fd = new FoodDAOImpl();
	private Scanner input = new Scanner(System.in);

	@Test
	public void testFood() {
		System.out.println("欢迎使用myFood POS 系统！\n请选择操作：\n[1]查看所有food，\n[2]通过id查找food，\n[3]新增food，\n[4]修改food name，\n[5]删除food，\n[0]退出");
		int choice = input.nextInt();
		boolean flag = true;
		while (flag) {
			switch (choice) {
			case 0: {
				System.out.println("谢谢您的使用，再见！");
				flag = false;
				break;
			}
			case 1: {
				fd.getFoodAll();
				break;
			}
			case 2: {
				System.out.println("请输入food id");
				int fid = input.nextInt();
				// 断言，判断获取对象是否为空
				Assert.assertNotNull(fd.getFoodByFid(fid));
				break;
			}
			case 3: {
				System.out.println("请输入要增加的food Name:");
				String fname = input.next();
				int maxFid = fd.getMaxFid() + 1;
				Food food = new Food(maxFid, fname);
				Assert.assertEquals(true, fd.createFood(food));
				break;
			}
			case 4: {
				System.out.println("请输入要修改的food id:");
				int fid = input.nextInt();
				System.out.println("请输入要修改的food name:");
				String fname = input.next();
				Assert.assertEquals(true, fd.updateFood(fid, fname));
				break;
			}
			case 5: {
				System.out.println("请输入要删除的food id:");
				int fid = input.nextInt();
				Assert.assertEquals(true, fd.deleteFood(fid));
				break;
			}
			default:{
				System.out.println("您的输入有误！");
				break;
			}
			}
			if(flag){
				System.out.println("\n请继续选择操作：\n[1]查看所有food，\n[2]通过id查找food类别，\n[3]新增food类别，\n[4]修改food类别，\n[5]删除food类别\n[0]退出");
				choice = input.nextInt();
			}
		}
	}
}
