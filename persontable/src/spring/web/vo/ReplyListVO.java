package spring.web.vo;

import java.util.Date;

public class ReplyListVO {
   private int bno;
   private int rno;
   private String content;
   private String writer;
   private Date regdate;
   
   private String userName;
   private String userId;

   public int getBno() {
      return bno;
   }

   public void setBno(int bno) {
      this.bno = bno;
   }

   public int getRno() {
      return rno;
   }

   public void setRno(int rno) {
      this.rno = rno;
   }

   public String getContent() {
      return content;
   }

   public void setContent(String content) {
      this.content = content;
   }

   public String getWriter() {
      return writer;
   }

   public void setWriter(String writer) {
      this.writer = writer;
   }

   public Date getRegdate() {
      return regdate;
   }

   public void setRegdate(Date regdate) {
      this.regdate = regdate;
   }

   @Override
   public String toString() {
      return "ReplyVO [bno=" + bno + ", rno=" + rno + ", content=" + content + ", writer=" + writer + ", regdate="
            + regdate + "]";
   }

   public String getUserName() {
      return userName;
   }

   public void setUserName(String userName) {
      this.userName = userName;
   }

   public String getUserId() {
      return userId;
   }

   public void setUserId(String userId) {
      this.userId = userId;
   }

}