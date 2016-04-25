package entity;

public class Money {
	private int amount;
	public Money(){}
	public Money(int i) {
		this.amount = i;
	}


	public int getAmount() {
		return amount;
	}
	public void setAmount(int amount) {
		this.amount = amount;
	}
	public Money minus(Money total) {
		this.setAmount(this.getAmount() -total.amount);
		return this;
	}
	public void add(Money subtotal) {
		this.setAmount(this.getAmount() + subtotal.amount);
	}
	public Money times(int quantity) {
		this.setAmount(this.getAmount() * quantity);
		return this;
	}


}
