package model;

import java.util.*;

import entity.*;


public class Cart {
	protected Map<Integer,Orderitem> items;
	private int total;
	
	public Cart(){
		if(items == null)
			items = new HashMap<Integer, Orderitem>();
	}
	
	//添加食物到列表 
	public void addProduct(Integer productId,Orderitem orderitem){
		//是否存在，如果存在，更改数量
		//如果不存在的话，添加到集合
		if(items.containsKey(productId)){
			Orderitem _orderitem = items.get(productId);
			_orderitem.setQuantity(orderitem.getQuantity()+_orderitem.getQuantity());
			items.put(productId, _orderitem);
		}else{
			items.put(productId, orderitem);
		}
	}
	//更新列表的食物数量
	public void updateCart(Integer productId){
		Orderitem orderitem = items.get(productId);
		orderitem.setQuantity(orderitem.getQuantity() - 1);
		items.put(productId, orderitem);
	}
	
	//删除该项食物
	public void deleteProduct(Integer productId){
		items.remove(productId);
	}
	
	//计算总价格
	public int getTotal(){
		int total = 0;
		for(Iterator it=items.values().iterator();it.hasNext();){
			Orderitem orderitem = (Orderitem)it.next();
			Product product = orderitem.getProduct();
			int quantity = orderitem.getQuantity();
			total += product.getPrice() * quantity;
		}
		return total;
	}

	public Map<Integer, Orderitem> getItems() {
		return items;
	}

	public void setItems(Map<Integer, Orderitem> items) {
		this.items = items;
	}
	
	
	
}
