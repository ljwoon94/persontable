package spring.web.svc;

import java.util.List;

import spring.web.vo.NoticeReplyVO;
import spring.web.vo.ReplyVO;

public interface ReplyService {

	public List<ReplyVO> readReply(int bno) throws Exception;

	public List<NoticeReplyVO> readNoticeReply(int nno) throws Exception;

	public void writeReply(ReplyVO vo) throws Exception;

	public void writeReply(NoticeReplyVO vo) throws Exception;

	public void updateReply(ReplyVO vo) throws Exception;

	public void updateReply(NoticeReplyVO vo) throws Exception;

	public void deleteReply(ReplyVO vo) throws Exception;

	public void deleteReply(NoticeReplyVO vo) throws Exception;

	public ReplyVO selectReply(int rno) throws Exception;

	public NoticeReplyVO selectNoticeReply(int rno) throws Exception;

}
