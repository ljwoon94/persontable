package spring.web.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import spring.web.vo.AdvertiseVO;
import spring.web.vo.SearchCriteria;

@Repository
public class AdvertiseDAOImpl implements AdvertiseDAO {
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public List<AdvertiseVO> list(SearchCriteria scri) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("advertiseMapper.listPage",scri);
	}
	
	@Override
	public int listCount(SearchCriteria scri) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("advertiseMapper.listCount",scri);
	}
	
	@Override
	public void regist(AdvertiseVO vo) throws Exception {
		// TODO Auto-generated method stub
		sqlSession.insert("advertiseMapper.insert",vo);
	}
	
	@Override
	public AdvertiseVO read(int adNum) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("advertiseMapper.read",adNum);
	}
	
	@Override
	public void update(AdvertiseVO vo) throws Exception {
		// TODO Auto-generated method stub
		sqlSession.update("advertiseMapper.update",vo);
	}
	
	@Override
	public void delete(int adNum) throws Exception {
		// TODO Auto-generated method stub
		sqlSession.delete("advertiseMapper.delete",adNum);
	}
	
}
