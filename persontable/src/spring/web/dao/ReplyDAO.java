package spring.web.dao;

import java.util.List;

import spring.web.vo.NoticeReplyVO;
import spring.web.vo.ReplyVO;

public interface ReplyDAO {
	
	public List<ReplyVO> readReply(int bno) throws Exception;
	
	public void writeReply(ReplyVO vo) throws Exception;
	
	public void updateReply(ReplyVO vo) throws Exception;
	
	public void deleteReply(ReplyVO vo) throws Exception;
	
	public ReplyVO selectReply(int rno) throws Exception;

	public List<NoticeReplyVO> readNoticeReply(int nno) throws Exception;

	public void writeNoticeReply(NoticeReplyVO vo) throws Exception;

	public void updateNoticeReply(NoticeReplyVO vo) throws Exception;

	public void deleteNoticeReply(NoticeReplyVO vo) throws Exception;

	public NoticeReplyVO selectNoticeReply(int rno) throws Exception;
	
}
