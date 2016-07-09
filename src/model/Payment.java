package model;

public class Payment{
	private int amount;
	private int cashReceived;
	private int change;
	
	public int getCashReceived() {
		return cashReceived;
	}
	public void setCashReceived(int cashReceived) {
		this.cashReceived = cashReceived;
	}
	public void setAmount(int amount) {
		this.amount = amount;
	}
	public Payment(int cashTendered, int cashReceived){
		this.amount=cashTendered;
		this.cashReceived = cashReceived;
	}
	public int getAmount(){
		return amount;
	}
	
	public int getChange(){
		return this.cashReceived-this.amount;
	}
}
