package spring.web.vo;

import java.util.Date;

public class IngReplyVO {
	private int ingNum;
	private String userId;
	private int repNum;
	private String repCon;
	private Date repDate;
	
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
