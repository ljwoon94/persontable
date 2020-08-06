package spring.web.vo;

import java.util.Date;

public class OrderListVO {
	private String orderId;
	private String userId;
	private String orderRec;
	private String zip;
	private String addr1;
	private String addr2;
	private String orderPhone;
	private int amount;
	private Date orderDate;
	private String delivery;
	
	private int orderDetailsNum;
	private int ingNum;
	private int cartStock;
	
	private String ingName;
	private String ingThumbImg;
	private int ingPrice;
	
	public String getOrderId() {
		return orderId;
	}
	public void setOrderId(String orderId) {
		this.orderId = orderId;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getOrderRec() {
		return orderRec;
	}
	public void setOrderRec(String orderRec) {
		this.orderRec = orderRec;
	}
	public String getZip() {
		return zip;
	}
	public void setZip(String zip) {
		this.zip = zip;
	}
	public String getAddr1() {
		return addr1;
	}
	public void setAddr1(String addr1) {
		this.addr1 = addr1;
	}
	public String getAddr2() {
		return addr2;
	}
	public void setAddr2(String addr2) {
		this.addr2 = addr2;
	}
	public String getOrderPhone() {
		return orderPhone;
	}
	public void setOrderPhon(String orderPhon) {
		this.orderPhone = orderPhon;
	}
	public int getAmount() {
		return amount;
	}
	public void setAmount(int amount) {
		this.amount = amount;
	}
	public Date getOrderDate() {
		return orderDate;
	}
	public void setOrderDate(Date orderDate) {
		this.orderDate = orderDate;
	}
	public int getOrderDetailsNum() {
		return orderDetailsNum;
	}
	public void setOrderDetailsNum(int orderDetailsNum) {
		this.orderDetailsNum = orderDetailsNum;
	}
	public int getIngNum() {
		return ingNum;
	}
	public void setIngNum(int ingNum) {
		this.ingNum = ingNum;
	}
	public int getCartStock() {
		return cartStock;
	}
	public void setCartStock(int cartStock) {
		this.cartStock = cartStock;
	}
	public String getIngName() {
		return ingName;
	}
	public void setIngName(String ingName) {
		this.ingName = ingName;
	}
	public String getIngThumbImg() {
		return ingThumbImg;
	}
	public void setIngThumbImg(String ingThumbImg) {
		this.ingThumbImg = ingThumbImg;
	}
	public int getIngPrice() {
		return ingPrice;
	}
	public void setIngPrice(int ingPrice) {
		this.ingPrice = ingPrice;
	}
	public String getDelivery() {
		return delivery;
	}
	public void setDelivery(String delivery) {
		this.delivery = delivery;
	}
	public void setOrderPhone(String orderPhone) {
		this.orderPhone = orderPhone;
	}
}
