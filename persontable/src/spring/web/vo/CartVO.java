package spring.web.vo;

import java.util.Date;

public class CartVO {
	private int cartNum;
	private String userId;
	private int ingNum;
	private int cartStock;
	private Date addDate;
	
	
	
	public int getCartNum() {
		return cartNum;
	}
	public void setCartNum(int cartNum) {
		this.cartNum = cartNum;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
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
	public Date getAddDate() {
		return addDate;
	}
	public void setAddDate(Date addDate) {
		this.addDate = addDate;
	}
	

}