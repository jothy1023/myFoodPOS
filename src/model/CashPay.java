package model;

public class CashPay extends Payment{

	private int cashReceived;
	
	// 现金收到多少，设找零
	public CashPay(int cashTendered, int cashReceived) {
		super(cashTendered, cashReceived);
	}
	
	public int getCashReceived() {
		return cashReceived;
	}

	public void setCashReceived(int cashReceived) {
		this.cashReceived = cashReceived;
	}

}
