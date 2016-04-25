package entity;

public class TestMoney {
	public static void main(String[] args){
		Money money1 = new Money();
		money1.setAmount(10);
		money1.times(3);
		System.out.println(money1.getAmount());
		
		Money money2 = new Money();
		money2.setAmount(5);
		money1.add(money2);
		System.out.println(money1.getAmount());
	}
}
