package spring.web.vo;

import java.util.Date;

public class CartListVO {
	private int cartNum;
	private String userId;
	private int ingNum;
	private int cartStock;
	private Date addDate;
	
	private int num;
	private String ingName;
	private int ingPrice;
	private String ingThumbImg;
	
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getIngName() {
		return ingName;
	}
	public void setIngName(String ingName) {
		this.ingName = ingName;
	}
	public int getIngPrice() {
		return ingPrice;
	}
	public void setIngPrice(int ingPrice) {
		this.ingPrice = ingPrice;
	}
	public String getIngThumbImg() {
		return ingThumbImg;
	}
	public void setIngThumbImg(String ingThumbImg) {
		this.ingThumbImg = ingThumbImg;
	}
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