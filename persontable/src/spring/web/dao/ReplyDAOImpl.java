package spring.web.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import spring.web.vo.NoticeReplyVO;
import spring.web.vo.ReplyVO;

@Repository
public class ReplyDAOImpl implements ReplyDAO {

	@Autowired
	private SqlSession sql;

	@Override
	public List<ReplyVO> readReply(int bno) throws Exception {
		// TODO Auto-generated method stub
		return sql.selectList("replyMapper.readReply", bno);
	}

	@Override
	public List<NoticeReplyVO> readNoticeReply(int nno) throws Exception {
		// TODO Auto-generated method stub
		return sql.selectList("replyMapper.readNoticeReply", nno);
	}

	@Override
	public void writeReply(ReplyVO vo) throws Exception {
		// TODO Auto-generated method stub
		sql.insert("replyMapper.writeReply", vo);
	}

	@Override
	public void writeNoticeReply(NoticeReplyVO vo) throws Exception {
		// TODO Auto-generated method stub
		sql.insert("replyMapper.writeNoticeReply", vo);
	}

	@Override
	public void updateReply(ReplyVO vo) throws Exception {
		// TODO Auto-generated method stub
		sql.update("replyMapper.updateReply", vo);
	}

	@Override
	public void updateNoticeReply(NoticeReplyVO vo) throws Exception {
		// TODO Auto-generated method stub
		sql.update("replyMapper.updateNoticeReply", vo);
	}

	@Override
	public void deleteReply(ReplyVO vo) throws Exception {
		// TODO Auto-generated method stub
		sql.update("replyMapper.deleteReply", vo);
	}

	@Override
	public void deleteNoticeReply(NoticeReplyVO vo) throws Exception {
		// TODO Auto-generated method stub
		sql.update("replyMapper.deleteNoticeReply", vo);
	}

	@Override
	public ReplyVO selectReply(int rno) throws Exception {
		// TODO Auto-generated method stub
		return sql.selectOne("replyMapper.selectReply", rno);
	}

	@Override
	public NoticeReplyVO selectNoticeReply(int rno) throws Exception {
		// TODO Auto-generated method stub
		return sql.selectOne("replyMapper.selectNoticeReply", rno);
	}
}
