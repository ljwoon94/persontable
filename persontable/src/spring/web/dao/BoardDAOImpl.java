package spring.web.dao;

import java.util.List;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import spring.web.vo.BoardVO;
import spring.web.vo.SearchCriteria;

@Repository
public class BoardDAOImpl implements BoardDAO {

	@Autowired
	private SqlSession sqlSession;

	@Override
	public void write(BoardVO boardVO) throws Exception {
		// TODO Auto-generated method stub
		sqlSession.insert("boardMapper.insert", boardVO);
	}

	@Override
	public BoardVO read(int bno) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("boardMapper.read", bno);
	}
	@Override
	public void delete(int bno) throws Exception {
		// TODO Auto-generated method stub
		sqlSession.delete("boardMapper.delete", bno);
	}
	@Override
	public void update(BoardVO boardVO) throws Exception {
		// TODO Auto-generated method stub
		sqlSession.update("boardMapper.update", boardVO);
	}
	@Override
	public List<BoardVO> list(SearchCriteria scri) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList("boardMapper.listPage",scri);
	}
	@Override
	public int listCount(SearchCriteria scri) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("boardMapper.listCount",scri);
	}
	
	@Override
	public void boardHit(int bno) throws Exception {
		// TODO Auto-generated method stub
		sqlSession.insert("boardMapper.boardHit",bno);
	}
}