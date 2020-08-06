package spring.web.vo;

import java.util.Date;

public class IngReplyListVO {
	private int ingNum;
	private String userId;
	private int repNum;
	private String repCon;
	private Date repDate;
	
	private String userName;
	
	
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public int getIngNum() {
		return ingNum;
	}
	public void setIngNum(int ingNum) {
		this.ingNum = ingNum;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public int getRepNum() {
		return repNum;
	}
	public void setRepNum(int repNum) {
		this.repNum = repNum;
	}
	public String getRepCon() {
		return repCon;
	}
	public void setRepCon(String repCon) {
		this.repCon = repCon;
	}
	public Date getRepDate() {
		return repDate;
	}
	public void setRepDate(Date repDate) {
		this.repDate = repDate;
	}

	
}
