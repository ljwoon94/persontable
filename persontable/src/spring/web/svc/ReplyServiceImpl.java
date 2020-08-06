package spring.web.svc;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import spring.web.dao.ReplyDAO;
import spring.web.vo.NoticeReplyVO;
import spring.web.vo.ReplyVO;

@Service
public class ReplyServiceImpl implements ReplyService {
	@Autowired
	private ReplyDAO dao;

	@Override
	public List<ReplyVO> readReply(int bno) throws Exception {
		// TODO Auto-generated method stub
		return dao.readReply(bno);
	}

	@Override
	public List<NoticeReplyVO> readNoticeReply(int nno) throws Exception {
		// TODO Auto-generated method stub
		return dao.readNoticeReply(nno);
	}

	@Override
	public void writeReply(ReplyVO vo) throws Exception {
		// TODO Auto-generated method stub
		dao.writeReply(vo);
	}

	@Override
	public void writeReply(NoticeReplyVO vo) throws Exception {
		// TODO Auto-generated method stub
		dao.writeNoticeReply(vo);
	}

	@Override
	public void updateReply(ReplyVO vo) throws Exception {
		// TODO Auto-generated method stub
		dao.updateReply(vo);
	}

	@Override
	public void updateReply(NoticeReplyVO vo) throws Exception {
		// TODO Auto-generated method stub
		dao.updateNoticeReply(vo);
	}

	@Override
	public void deleteReply(ReplyVO vo) throws Exception {
		// TODO Auto-generated method stub
		dao.deleteReply(vo);
	}

	@Override
	public void deleteReply(NoticeReplyVO vo) throws Exception {
		// TODO Auto-generated method stub
		dao.deleteNoticeReply(vo);
	}

	@Override
	public ReplyVO selectReply(int rno) throws Exception {
		// TODO Auto-generated method stub
		return dao.selectReply(rno);
	}

	@Override
	public NoticeReplyVO selectNoticeReply(int rno) throws Exception {
		// TODO Auto-generated method stub
		return dao.selectNoticeReply(rno);
	}
}
