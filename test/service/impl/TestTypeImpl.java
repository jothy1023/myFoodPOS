package service.impl;


import java.util.Scanner;
import junit.framework.Assert;
import org.junit.Test;


import dao.TypeDAO;
import dao.impl.TypeDAOImpl;
import entity.Type;

public class TestTypeImpl {

	private TypeDAO tp = new TypeDAOImpl();
	private Scanner input = new Scanner(System.in);

	@Test
	public void testFood() {
		System.out.println("欢迎使用myFood POS 系统！\n请选择操作：\n[1]查看所有type，\n[2]通过id查找type，\n[3]新增type，\n[4]修改type name，\n[5]删除type，\n[0]退出");
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
				tp.getAllTypes();
				break;
			}
			case 2: {
				System.out.println("请输入food id");
				int fid = input.nextInt();
				Assert.assertNotNull(tp.getTypeByTid(fid));
				break;
			}
			case 3: {
				System.out.println("请输入要增加的food Name:");
				String fname = input.next();
				int maxFid = tp.getMaxTid() + 1;
				Type type = new Type(maxFid, fname);
				Assert.assertEquals(true, tp.createType(type));
				break;
			}
			case 4: {
				System.out.println("请输入要修改的food id:");
				int fid = input.nextInt();
				System.out.println("请输入要修改的food name:");
				String fname = input.next();
				Assert.assertEquals(true, tp.updateType(fid, fname));
				break;
			}
			case 5: {
				System.out.println("请输入要删除的food id:");
				int fid = input.nextInt();
				Assert.assertEquals(true, tp.deleteTypeById(fid));
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
