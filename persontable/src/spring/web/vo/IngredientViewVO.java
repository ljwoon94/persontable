package spring.web.vo;

import java.util.Date;

public class IngredientViewVO {
	private int ingNum;
	private String ingName;
	private String ingCateCode;
	private int ingPrice;
	private int ingStock;
	private String ingDes;
	private String ingImg;
	private Date regDate;
	private String ingWeight;
	
	public Date getRegDate() {
		return regDate;
	}
	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}
	private String ingCateCodeRef;
	private String ingCateName;
	
	private String ingThumbImg;
	
	public int getIngNum() {
		return ingNum;
	}
	public void setIngNum(int ingNum) {
		this.ingNum = ingNum;
	}
	public String getIngName() {
		return ingName;
	}
	public void setIngName(String ingName) {
		this.ingName = ingName;
	}
	public String getIngCateCode() {
		return ingCateCode;
	}
	public void setIngCateCode(String ingCateCode) {
		this.ingCateCode = ingCateCode;
	}
	public int getIngPrice() {
		return ingPrice;
	}
	public void setIngPrice(int ingPrice) {
		this.ingPrice = ingPrice;
	}
	public int getIngStock() {
		return ingStock;
	}
	public void setIngStock(int ingStock) {
		this.ingStock = ingStock;
	}
	public String getIngDes() {
		return ingDes;
	}
	public void setIngDes(String ingDes) {
		this.ingDes = ingDes;
	}
	public String getIngImg() {
		return ingImg;
	}
	public void setIngImg(String ingImg) {
		this.ingImg = ingImg;
	}
	
	public String getIngCateCodeRef() {
		return ingCateCodeRef;
	}
	public void setIngCateCodeRef(String ingCateCodeRef) {
		this.ingCateCodeRef = ingCateCodeRef;
	}
	public String getIngCateName() {
		return ingCateName;
	}
	public void setIngCateName(String ingCateName) {
		this.ingCateName = ingCateName;
	}
	public String getIngThumbImg() {
		return ingThumbImg;
	}
	public void setIngThumbImg(String ingThumbImg) {
		this.ingThumbImg = ingThumbImg;
	}
	public String getIngWeight() {
		return ingWeight;
	}
	public void setIngWeight(String ingWeight) {
		this.ingWeight = ingWeight;
	}
	
	
}
