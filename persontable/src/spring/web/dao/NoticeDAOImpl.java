package spring.web.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import spring.web.vo.NoticeVO;
import spring.web.vo.SearchCriteria;

@Repository
public class NoticeDAOImpl implements NoticeDAO {
	@Autowired
	private SqlSession sqlSession;

	@Override
	public void write(NoticeVO noticeVO) throws Exception {
		// TODO Auto-generated method stub
		sqlSession.insert("noticeMapper.insert", noticeVO);
	}

	@Override
	public NoticeVO read(int nno) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("noticeMapper.read", nno);
	}
	@Override
	public void delete(int nno) throws Exception {
		// TODO Auto-generated method stub
		sqlSession.delete("noticeMapper.delete", nno);
	}
	@Override
	public void update(NoticeVO noticeVO) throws Exception {
		// TODO Auto-generated method stub
		sqlSession.update("noticeMapper.update", noticeVO);
	}
	@Override
	public List<NoticeVO> list(SearchCriteria scri) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList("noticeMapper.listPage",scri);
	}
	@Override
	public int listCount(SearchCriteria scri) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("noticeMapper.listCount",scri);
	}
	@Override
	public void insertFile(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		sqlSession.insert("noticeMapper.insertFile",map);
	}
	@Override
	public void noticeHit(int nno) throws Exception {
		// TODO Auto-generated method stub
		sqlSession.insert("noticeMapper.noticeHit",nno);
	}
}
